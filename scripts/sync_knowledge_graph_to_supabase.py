# -*- coding: utf-8 -*-
"""
Universal Knowledge Graph Supabase Sync Engine
-----------------------------------------------
Seeds 100% of nodes directly from Master Knowledge Graph (src/data/knowledge_graph.json)
into Supabase PostgreSQL (public.knowledge_nodes and public.knowledge_graph_meta).

Features:
1. Direct ingestion of all 1,236 unified nodes from knowledge_graph.json
2. Multi-stream classification:
   - civil_services (History, Geography, Polity, Economy, Science, Environment, etc.)
   - teaching (Educational Psychology, Child Development & Pedagogy)
   - languages (Language Proficiency, Grammar & Communication, Communication Paper)
   - epfo (Industrial Relations, Accounting, Auditing, Insurance, Social Security, Statistics)
3. Ascending topological ordering (Level 1 -> 4) to honor foreign key constraints
4. Batch upserting (chunks of 100) via REST API
5. Purging of corrupt / obsolete ghost nodes
6. Full synchronization of knowledge_graph_meta records
"""

import os
import sys
import json
import urllib.request
import urllib.error
import urllib.parse

sys.stdout.reconfigure(encoding='utf-8')

CIVIL_SERVICES_SUBJECTS = {
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
    "general_mental_ability_quantitative_aptitude_comprehension",
    "sports",
    "general_knowledge_miscellaneous"
}

TEACHING_SUBJECTS = {
    "educational_psychology_child_development_teaching_pedagogy"
}

LANGUAGES_SUBJECTS = {
    "language_proficiency_grammar_communication",
    "communication_paper"
}

EPFO_SUBJECTS = {
    "industrial_relations_and_labour_laws",
    "general_accounting_principles",
    "auditing",
    "insurance",
    "social_security_in_india",
    "applied_statistics"
}

OBSOLETE_NODES_TO_DELETE = [
    'language_proficiency_grammar_communication.general_kannada_grammar_structure.',
    'language_proficiency_grammar_communication.general_kannada_grammar_structure.-',
    'language_proficiency_grammar_communication.general_kannada_grammar_structure..current_affair_article_linked_to_with_temporal_stamp_and_context_summary',
    'language_proficiency_grammar_communication.general_kannada_grammar_structure..geography_regional_geography_karnataka_geography',
    'language_proficiency_grammar_communication.general_kannada_grammar_structure..history_regional_history_karnataka_history',
    'language_proficiency_grammar_communication.general_kannada_grammar_structure..indian_economy_regional_economy_karnataka_state_economy',
    'language_proficiency_grammar_communication.general_kannada_grammar_structure..mind_map_flashcard_generated_automatically_from_node_hierarchy_and_relationship_edges',
    'language_proficiency_grammar_communication.general_kannada_grammar_structure..pyq_linked_to_with_exam_tag',
    'language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards.',
    'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms.',
    'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms.-'
]

def load_env():
    env = {}
    for fname in ['.env.local', '.env']:
        if os.path.exists(fname):
            with open(fname, 'r', encoding='utf-8') as f:
                for line in f:
                    line = line.strip()
                    if line and not line.startswith('#') and '=' in line:
                        k, v = line.split('=', 1)
                        env[k.strip()] = v.strip('\"\'')
    return env

def make_request(url, key, method='GET', body=None, prefer='return=representation'):
    headers = {
        'apikey': key,
        'Authorization': f'Bearer {key}',
        'Content-Type': 'application/json',
        'Prefer': prefer
    }
    data = json.dumps(body).encode('utf-8') if body is not None else None
    req = urllib.request.Request(url, data=data, headers=headers, method=method)
    with urllib.request.urlopen(req) as resp:
        content = resp.read().decode('utf-8')
        return json.loads(content) if content else {}

def get_node_streams(node):
    sid = node.get('subjectId') or node.get('id')
    if sid == 'communication_paper':
        return 'languages', ['languages', 'communication_paper']
    elif sid in LANGUAGES_SUBJECTS:
        return 'languages', ['languages']
    elif sid in TEACHING_SUBJECTS:
        return 'teaching', ['teaching']
    elif sid in EPFO_SUBJECTS:
        return 'epfo', ['epfo']
    elif sid in CIVIL_SERVICES_SUBJECTS:
        return 'civil_services', ['civil_services']
    else:
        return 'civil_services', ['civil_services']

def format_node_record(node):
    primary_stream, stream_list = get_node_streams(node)
    return {
        "id": node["id"],
        "slug": node.get("slug", node["id"].split(".")[-1]),
        "name": node.get("name", ""),
        "level": node.get("level", 1),
        "level_name": node.get("levelName", "Subject"),
        "subject": node.get("subject", ""),
        "subject_id": node.get("subjectId", ""),
        "parent_id": node.get("parentId"),
        "children_ids": node.get("childrenIds", []),
        "ancestor_ids": node.get("ancestorIds", []),
        "exam_tags": node.get("examTags", {}),
        "raw_exam_tag_string": node.get("rawExamTagString", ""),
        "description": node.get("description", ""),
        "entities": node.get("entities", []),
        "keywords": node.get("keywords", []),
        "stream": primary_stream,
        "streams": stream_list
    }

def main():
    print("==================================================")
    print("   SEEDING MASTER KNOWLEDGE GRAPH TO SUPABASE     ")
    print("==================================================")
    
    env = load_env()
    supabase_url = env.get('NEXT_PUBLIC_SUPABASE_URL')
    supabase_key = env.get('NEXT_PUBLIC_SUPABASE_ANON_KEY')

    if not supabase_url or not supabase_key or 'placeholder' in supabase_url:
        print("ERROR: Supabase URL or Key not configured in .env.local")
        return

    print(f"Target Database: {supabase_url}")

    # 1. Load Master Graph
    master_path = 'src/data/knowledge_graph.json'
    with open(master_path, 'r', encoding='utf-8') as f:
        master_kg = json.load(f)

    nodes = master_kg.get('nodes', {})
    root_subjects = master_kg.get('rootSubjectIds', [])
    print(f"Loaded Master KG: {len(nodes)} nodes across {len(root_subjects)} root subjects.")

    # 2. Format and sort nodes (Level 1 -> 4)
    formatted_nodes = [format_node_record(n) for n in nodes.values()]
    formatted_nodes.sort(key=lambda n: n['level'])

    # 3. Upsert nodes in batches of 100
    batch_size = 100
    endpoint_nodes = f"{supabase_url}/rest/v1/knowledge_nodes?on_conflict=id"
    total_upserted = 0

    print(f"\nBeginning upsert of {len(formatted_nodes)} nodes (batch size: {batch_size})...")
    for i in range(0, len(formatted_nodes), batch_size):
        batch = formatted_nodes[i:i + batch_size]
        try:
            make_request(endpoint_nodes, supabase_key, method='POST', body=batch, prefer='resolution=merge-duplicates')
            total_upserted += len(batch)
            print(f"  [Batch {i // batch_size + 1}] Upserted {total_upserted}/{len(formatted_nodes)} nodes (levels {batch[0]['level']}-{batch[-1]['level']})")
        except urllib.error.HTTPError as e:
            err_body = e.read().decode('utf-8')
            print(f"  [ERROR] HTTP {e.code} in batch {i}: {err_body}")
            raise
        except Exception as e:
            print(f"  [ERROR] Unexpected error in batch {i}: {e}")
            raise

    print(f"All {total_upserted} knowledge nodes successfully upserted into Supabase.")

    # 4. Clean up obsolete / corrupt ghost nodes
    print(f"\nPurging {len(OBSOLETE_NODES_TO_DELETE)} corrupt / malformed nodes from database...")
    deleted_count = 0
    for obs_id in OBSOLETE_NODES_TO_DELETE:
        del_url = f"{supabase_url}/rest/v1/knowledge_nodes?id=eq.{urllib.parse.quote(obs_id)}"
        try:
            req = urllib.request.Request(del_url, headers={
                'apikey': supabase_key,
                'Authorization': f'Bearer {supabase_key}'
            }, method='DELETE')
            with urllib.request.urlopen(req) as resp:
                if resp.status in (200, 204):
                    deleted_count += 1
        except Exception as e:
            print(f"  Notice during delete of '{obs_id}': {e}")
    print(f"Purged {deleted_count} obsolete nodes from knowledge_nodes.")

    # 5. Calculate stream statistics
    stream_counts = {}
    for fn in formatted_nodes:
        s = fn['stream']
        stream_counts[s] = stream_counts.get(s, 0) + 1

    cs_nodes = [n for n in formatted_nodes if n['stream'] == 'civil_services']
    lang_nodes = [n for n in formatted_nodes if n['stream'] == 'languages']
    teach_nodes = [n for n in formatted_nodes if n['stream'] == 'teaching']
    epfo_nodes = [n for n in formatted_nodes if n['stream'] == 'epfo']

    # 6. Update knowledge_graph_meta
    endpoint_meta = f"{supabase_url}/rest/v1/knowledge_graph_meta?on_conflict=id"
    meta_records = [
        {
            "id": "current",
            "version": master_kg.get("version", "2.0.1"),
            "root_subject_ids": root_subjects,
            "stats": master_kg.get("stats", {
                "totalNodes": len(formatted_nodes),
                "byLevel": {
                    "subjects": sum(1 for n in formatted_nodes if n['level'] == 1),
                    "domains": sum(1 for n in formatted_nodes if n['level'] == 2),
                    "topics": sum(1 for n in formatted_nodes if n['level'] == 3),
                    "entities": sum(1 for n in formatted_nodes if n['level'] == 4),
                }
            })
        },
        {
            "id": "civil_services",
            "version": "2.5.0",
            "root_subject_ids": [s for s in root_subjects if s in CIVIL_SERVICES_SUBJECTS],
            "stats": {
                "total_nodes": len(cs_nodes),
                "level_1_subjects": sum(1 for n in cs_nodes if n['level'] == 1),
                "level_2_domains": sum(1 for n in cs_nodes if n['level'] == 2),
                "level_3_topics": sum(1 for n in cs_nodes if n['level'] == 3),
                "level_4_subtopics": sum(1 for n in cs_nodes if n['level'] == 4),
            }
        },
        {
            "id": "languages",
            "version": "2.5.0",
            "root_subject_ids": [s for s in root_subjects if s in LANGUAGES_SUBJECTS],
            "stats": {
                "total_nodes": len(lang_nodes),
                "level_1_subjects": sum(1 for n in lang_nodes if n['level'] == 1),
                "level_2_domains": sum(1 for n in lang_nodes if n['level'] == 2),
                "level_3_topics": sum(1 for n in lang_nodes if n['level'] == 3),
                "level_4_subtopics": sum(1 for n in lang_nodes if n['level'] == 4),
            }
        },
        {
            "id": "teaching",
            "version": "2.5.0",
            "root_subject_ids": [s for s in root_subjects if s in TEACHING_SUBJECTS],
            "stats": {
                "total_nodes": len(teach_nodes),
                "level_1_subjects": sum(1 for n in teach_nodes if n['level'] == 1),
                "level_2_domains": sum(1 for n in teach_nodes if n['level'] == 2),
                "level_3_topics": sum(1 for n in teach_nodes if n['level'] == 3),
                "level_4_subtopics": sum(1 for n in teach_nodes if n['level'] == 4),
            }
        },
        {
            "id": "epfo",
            "version": "1.0.0",
            "root_subject_ids": [s for s in root_subjects if s in EPFO_SUBJECTS],
            "stats": {
                "total_nodes": len(epfo_nodes),
                "level_1_subjects": sum(1 for n in epfo_nodes if n['level'] == 1),
                "level_2_domains": sum(1 for n in epfo_nodes if n['level'] == 2),
                "level_3_topics": sum(1 for n in epfo_nodes if n['level'] == 3),
                "level_4_subtopics": sum(1 for n in epfo_nodes if n['level'] == 4),
            }
        }
    ]

    try:
        make_request(endpoint_meta, supabase_key, method='POST', body=meta_records, prefer='resolution=merge-duplicates')
        print(f"Successfully updated knowledge_graph_meta entries for {len(meta_records)} streams.")
    except Exception as e:
        print(f"Notice updating knowledge_graph_meta: {e}")

    print("\n==================================================")
    print(f"  SYNC COMPLETED SUCCESSFULLY")
    print(f"  Total Nodes Upserted: {total_upserted}")
    print(f"  Stream Breakdown: {stream_counts}")
    print("==================================================")

if __name__ == "__main__":
    main()
