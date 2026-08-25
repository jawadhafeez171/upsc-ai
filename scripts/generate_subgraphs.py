import json
import os

with open("src/data/knowledge_graph.json", "r", encoding="utf-8") as f:
    master_kg = json.load(f)

nodes = master_kg["nodes"]

# Define Subject IDs for each domain stream
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
    "educational_psychology_child_development_teaching_pedagogy"
]

LANGUAGES_SUBJECT_IDS = [
    "language_proficiency_grammar_communication"
]

def build_subgraph(subject_ids, name="Subgraph", version="2.5.0"):
    sub_nodes = {}
    
    # Recursively collect all descendant nodes
    def collect_descendants(node_id):
        node = nodes.get(node_id)
        if not node:
            return
        sub_nodes[node_id] = node
        for child_id in node.get("childrenIds", []):
            collect_descendants(child_id)

    for sid in subject_ids:
        collect_descendants(sid)

    # Compute stats
    l1_count = sum(1 for n in sub_nodes.values() if n.get("level") == 1)
    l2_count = sum(1 for n in sub_nodes.values() if n.get("level") == 2)
    l3_count = sum(1 for n in sub_nodes.values() if n.get("level") == 3)
    l4_count = sum(1 for n in sub_nodes.values() if n.get("level") == 4)

    subgraph = {
        "version": version,
        "name": name,
        "generatedAt": master_kg.get("generatedAt", "2026-08-22"),
        "rootSubjectIds": subject_ids,
        "nodes": sub_nodes,
        "stats": {
            "total_nodes": len(sub_nodes),
            "level_1_subjects": l1_count,
            "level_2_domains": l2_count,
            "level_3_topics": l3_count,
            "level_4_subtopics": l4_count
        }
    }
    return subgraph

# 1. Civil Services Graph
cs_kg = build_subgraph(CIVIL_SERVICES_SUBJECT_IDS, name="Civil Services Knowledge Graph (UPSC CSE & KPSC KAS)")
with open("src/data/knowledge_graph_civil_services.json", "w", encoding="utf-8") as f:
    json.dump(cs_kg, f, indent=4, ensure_ascii=False)
print(f"Created Civil Services Graph: {cs_kg['stats']['total_nodes']} nodes across {cs_kg['stats']['level_1_subjects']} subjects.")

# 2. Languages Graph
lang_kg = build_subgraph(LANGUAGES_SUBJECT_IDS, name="State Languages & Communication Knowledge Graph (General Kannada & General English)")
with open("src/data/knowledge_graph_languages.json", "w", encoding="utf-8") as f:
    json.dump(lang_kg, f, indent=4, ensure_ascii=False)
print(f"Created Languages Graph: {lang_kg['stats']['total_nodes']} nodes across {lang_kg['stats']['level_1_subjects']} subjects.")
