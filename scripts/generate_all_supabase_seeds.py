import json
import os

# 1. Load Master Graph
with open("src/data/knowledge_graph.json", "r", encoding="utf-8") as f:
    master_kg = json.load(f)

nodes = dict(master_kg["nodes"])

# 2. Load Teaching Graph if exists and merge
if os.path.exists("src/data/knowledge_graph_teaching.json"):
    with open("src/data/knowledge_graph_teaching.json", "r", encoding="utf-8") as f:
        t_kg = json.load(f)
        for nid, n in t_kg.get("nodes", {}).items():
            nodes[nid] = n

CIVIL_SERVICES_SUBJECT_IDS = [
    "history",
    "art_culture_heritage",
    "geography_earth_systems",
    "indian_society_social_justice",
    "indian_polity_constitution_governance",
    "international_relations_global_institutions",
    "indian_economy_development",
    "environment_ecology_disaster_management",
    "science_technology_defence",
    "internal_security",
    "ethics_integrity_aptitude",
    "general_mental_ability_quantitative_aptitude_comprehension"
]

TEACHING_SUBJECT_IDS = [
    "educational_psychology_child_development_teaching_pedagogy",
    "child_development_educational_psychology",
    "theories_of_learning_motivation_cognition",
    "inclusive_education_special_learning_needs",
    "curriculum_pedagogical_strategies_assessment",
    "educational_policies_governance_icts",
    "higher_education_research_pedagogy_ugc"
]

LANGUAGES_SUBJECT_IDS = [
    "language_proficiency_grammar_communication"
]

def get_stream(node):
    sid = node.get("subjectId") or node.get("id")
    if sid in TEACHING_SUBJECT_IDS or any(node.get("id", "").startswith(p) for p in TEACHING_SUBJECT_IDS):
        return "teaching"
    if sid in LANGUAGES_SUBJECT_IDS or any(node.get("id", "").startswith(p) for p in LANGUAGES_SUBJECT_IDS):
        return "languages"
    if sid in CIVIL_SERVICES_SUBJECT_IDS or any(node.get("id", "").startswith(p) for p in CIVIL_SERVICES_SUBJECT_IDS):
        return "civil_services"
    return "civil_services"

def sql_escape_string(s):
    if s is None:
        return "''"
    s_clean = str(s).replace("'", "''")
    return f"'{s_clean}'"

def sql_escape_array(arr):
    if not arr:
        return "ARRAY[]::text[]"
    escaped_items = []
    for item in arr:
        if item is None:
            continue
        cleaned = str(item).strip()
        if not cleaned:
            continue
        # Replace single quotes with ''
        escaped = cleaned.replace("'", "''")
        escaped_items.append(f"'{escaped}'")
    if not escaped_items:
        return "ARRAY[]::text[]"
    return f"ARRAY[{', '.join(escaped_items)}]::text[]"

def sql_escape_jsonb(obj):
    if not obj:
        return "'{}'::jsonb"
    j_str = json.dumps(obj, ensure_ascii=False)
    j_str = j_str.replace("'", "''")
    return f"'{j_str}'::jsonb"

def format_node_values(node, stream):
    nid = sql_escape_string(node.get("id"))
    slug = sql_escape_string(node.get("slug"))
    name = sql_escape_string(node.get("name"))
    level = node.get("level", 1)
    level_name = sql_escape_string(node.get("levelName"))
    subject = sql_escape_string(node.get("subject"))
    subject_id = sql_escape_string(node.get("subjectId"))
    
    parent_id = node.get("parentId")
    if parent_id is None:
        parent_id_val = "NULL"
    else:
        parent_id_val = sql_escape_string(parent_id)

    children_ids = sql_escape_array(node.get("childrenIds", []))
    ancestor_ids = sql_escape_array(node.get("ancestorIds", []))
    exam_tags = sql_escape_jsonb(node.get("examTags", {}))
    raw_exam_tag_string = sql_escape_string(node.get("rawExamTagString", ""))
    description = sql_escape_string(node.get("description", ""))
    
    # Process entities
    entities = node.get("entities", [])
    if isinstance(entities, list):
        entities_val = sql_escape_array(entities)
    else:
        entities_val = "ARRAY[]::text[]"

    # Process keywords - clean up words
    keywords = node.get("keywords", [])
    if isinstance(keywords, list):
        clean_kw = []
        for kw in keywords:
            if not kw:
                continue
            k_str = str(kw).strip().strip("'\"") # strip stray leading/trailing literal quote marks from keywords
            if k_str:
                clean_kw.append(k_str)
        keywords_val = sql_escape_array(clean_kw)
    else:
        keywords_val = "ARRAY[]::text[]"

    stream_val = sql_escape_string(stream)
    streams_val = f"ARRAY['{stream}']::text[]"

    return f"""    (
        {nid}, {slug}, {name}, {level},
        {level_name}, {subject}, {subject_id}, {parent_id_val},
        {children_ids}, {ancestor_ids}, {exam_tags},
        {raw_exam_tag_string}, {description}, {entities_val}, {keywords_val},
        {stream_val}, {streams_val}
    )"""

def generate_seed_file(file_path, header_title, node_list, stream, batch_size=25):
    lines = [
        "-- =========================================================================",
        f"-- {header_title} ({len(node_list)} NODES)",
        "-- =========================================================================",
        "",
        "BEGIN;",
        ""
    ]

    for i in range(0, len(node_list), batch_size):
        batch = node_list[i:i+batch_size]
        lines.append("INSERT INTO public.knowledge_nodes (")
        lines.append("    id, slug, name, level, level_name, subject, subject_id, parent_id,")
        lines.append("    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams")
        lines.append(") VALUES")
        
        batch_tuples = [format_node_values(node, stream) for node in batch]
        lines.append(",\n".join(batch_tuples))
        
        lines.append("ON CONFLICT (id) DO UPDATE SET")
        lines.append("    slug = EXCLUDED.slug,")
        lines.append("    name = EXCLUDED.name,")
        lines.append("    level = EXCLUDED.level,")
        lines.append("    level_name = EXCLUDED.level_name,")
        lines.append("    subject = EXCLUDED.subject,")
        lines.append("    subject_id = EXCLUDED.subject_id,")
        lines.append("    parent_id = EXCLUDED.parent_id,")
        lines.append("    children_ids = EXCLUDED.children_ids,")
        lines.append("    ancestor_ids = EXCLUDED.ancestor_ids,")
        lines.append("    exam_tags = EXCLUDED.exam_tags,")
        lines.append("    raw_exam_tag_string = EXCLUDED.raw_exam_tag_string,")
        lines.append("    description = EXCLUDED.description,")
        lines.append("    entities = EXCLUDED.entities,")
        lines.append("    keywords = EXCLUDED.keywords,")
        lines.append("    stream = EXCLUDED.stream,")
        lines.append("    streams = EXCLUDED.streams,")
        lines.append("    updated_at = NOW();")
        lines.append("")

    lines.append("COMMIT;")
    lines.append("")

    with open(file_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines))
    print(f"Generated {file_path} with {len(node_list)} nodes.")

# Collect nodes by stream
cs_nodes = [n for n in nodes.values() if get_stream(n) == "civil_services"]
teaching_nodes = [n for n in nodes.values() if get_stream(n) == "teaching"]
languages_nodes = [n for n in nodes.values() if get_stream(n) == "languages"]

# Group Civil Services by levels
cs_l1_l2 = [n for n in cs_nodes if n.get("level") in (1, 2)]
cs_l3 = [n for n in cs_nodes if n.get("level") == 3]
cs_l4 = [n for n in cs_nodes if n.get("level") == 4]

# Split L3 into two parts
half_l3 = len(cs_l3) // 2
cs_l3_p1 = cs_l3[:half_l3]
cs_l3_p2 = cs_l3[half_l3:]

# Split L4 into two parts
half_l4 = len(cs_l4) // 2
cs_l4_p1 = cs_l4[:half_l4]
cs_l4_p2 = cs_l4[half_l4:]

# Generate files
generate_seed_file("supabase_seed_1a_civil_services_subjects_domains.sql", "SUPABASE SEED 1A: CIVIL SERVICES (SUBJECTS & DOMAINS)", cs_l1_l2, "civil_services")
generate_seed_file("supabase_seed_1b_civil_services_topics_part1.sql", "SUPABASE SEED 1B: CIVIL SERVICES (TOPICS PART 1)", cs_l3_p1, "civil_services")
generate_seed_file("supabase_seed_1c_civil_services_topics_part2.sql", "SUPABASE SEED 1C: CIVIL SERVICES (TOPICS PART 2)", cs_l3_p2, "civil_services")
generate_seed_file("supabase_seed_1d_civil_services_subtopics_part1.sql", "SUPABASE SEED 1D: CIVIL SERVICES (SUBTOPICS PART 1)", cs_l4_p1, "civil_services")
generate_seed_file("supabase_seed_1e_civil_services_subtopics_part2.sql", "SUPABASE SEED 1E: CIVIL SERVICES (SUBTOPICS PART 2)", cs_l4_p2, "civil_services")
generate_seed_file("supabase_seed_2_teaching.sql", "SUPABASE SEED 2: TEACHING & PEDAGOGY SUBGRAPH", teaching_nodes, "teaching")
generate_seed_file("supabase_seed_3_languages.sql", "SUPABASE SEED 3: STATE LANGUAGES SUBGRAPH", languages_nodes, "languages")

print("All seed files generated successfully!")
