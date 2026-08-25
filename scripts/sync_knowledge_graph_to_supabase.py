# -*- coding: utf-8 -*-
"""
Sync Multi-Stream Knowledge Graph to Supabase
---------------------------------------------
Ingests:
1. Civil Services Subgraph (760 nodes) -> stream: 'civil_services'
2. Teaching Subgraph (90 nodes) -> stream: 'teaching'
3. State Languages Subgraph (29 nodes) -> stream: 'languages'
4. Master Unified Graph (815 nodes) -> metadata & master federation

Performs batch upsert (batches of 100) to public.knowledge_nodes and public.knowledge_graph_meta.
"""

import os
import json
import urllib.request
import urllib.error

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

def main():
    env = load_env()
    supabase_url = env.get('NEXT_PUBLIC_SUPABASE_URL')
    supabase_key = env.get('NEXT_PUBLIC_SUPABASE_ANON_KEY')

    if not supabase_url or not supabase_key or 'placeholder' in supabase_url:
        print("ERROR: Supabase URL or Key not properly configured in .env.local")
        return

    print(f"Connecting to Supabase: {supabase_url}")

    # 1. Load Subgraphs
    cs_graph = json.load(open('src/data/knowledge_graph_civil_services.json', encoding='utf-8'))
    teaching_graph = json.load(open('src/data/knowledge_graph_teaching.json', encoding='utf-8'))
    lang_graph = json.load(open('src/data/knowledge_graph_languages.json', encoding='utf-8'))
    unified_graph = json.load(open('src/data/knowledge_graph.json', encoding='utf-8'))

    print(f"Loaded CS: {len(cs_graph['nodes'])} nodes")
    print(f"Loaded Teaching: {len(teaching_graph['nodes'])} nodes")
    print(f"Loaded Languages: {len(lang_graph['nodes'])} nodes")
    print(f"Loaded Master Unified: {len(unified_graph['nodes'])} nodes")

    # 2. Build consolidated node record map with stream tags
    nodes_payload = {}

    # Civil Services nodes
    for nid, node in cs_graph['nodes'].items():
        record = format_node_record(node, 'civil_services')
        nodes_payload[nid] = record

    # Teaching nodes
    for nid, node in teaching_graph['nodes'].items():
        if nid in nodes_payload:
            nodes_payload[nid]['streams'].append('teaching')
        else:
            record = format_node_record(node, 'teaching')
            nodes_payload[nid] = record

    # Languages nodes
    for nid, node in lang_graph['nodes'].items():
        if nid in nodes_payload:
            nodes_payload[nid]['streams'].append('languages')
        else:
            record = format_node_record(node, 'languages')
            nodes_payload[nid] = record

    # Master Unified check to ensure all 815 nodes are present
    for nid, node in unified_graph['nodes'].items():
        if nid not in nodes_payload:
            record = format_node_record(node, 'civil_services')
            nodes_payload[nid] = record

    all_nodes_list = list(nodes_payload.values())
    # Sort nodes by level ascending (Level 1 Subject -> Level 2 Domain -> Level 3 Topic -> Level 4 Subtopic)
    # This guarantees that parent nodes exist before child nodes reference them in parent_id
    all_nodes_list.sort(key=lambda n: n['level'])
    print(f"\nTotal consolidated nodes to upsert: {len(all_nodes_list)} (sorted by level 1->4)")

    # 3. Upsert knowledge_nodes in batches of 100
    batch_size = 100
    endpoint_nodes = f"{supabase_url}/rest/v1/knowledge_nodes?on_conflict=id"
    
    total_upserted = 0
    for i in range(0, len(all_nodes_list), batch_size):
        batch = all_nodes_list[i:i + batch_size]
        try:
            make_request(endpoint_nodes, supabase_key, method='POST', body=batch, prefer='resolution=merge-duplicates')
            total_upserted += len(batch)
            print(f"  Upserted nodes batch {i+1} to {min(i+batch_size, len(all_nodes_list))} / {len(all_nodes_list)}")
        except urllib.error.HTTPError as e:
            err_body = e.read().decode('utf-8')
            if 'column' in err_body and ('stream' in err_body or 'streams' in err_body):
                for r in batch:
                    r.pop('stream', None)
                    r.pop('streams', None)
                try:
                    make_request(endpoint_nodes, supabase_key, method='POST', body=batch, prefer='resolution=merge-duplicates')
                    total_upserted += len(batch)
                    print(f"  Upserted nodes batch {i+1} to {min(i+batch_size, len(all_nodes_list))} / {len(all_nodes_list)} (without stream column)")
                except urllib.error.HTTPError as e2:
                    print(f"  HTTP Error {e2.code} in batch {i}: {e2.read().decode('utf-8')}")
            else:
                print(f"  HTTP Error {e.code} in batch {i}: {err_body}")
        except Exception as e:
            print(f"  Unexpected error in batch {i}: {e}")

    # 4. Upsert Knowledge Graph Meta records
    endpoint_meta = f"{supabase_url}/rest/v1/knowledge_graph_meta?on_conflict=id"
    meta_records = [
        {
            "id": "current",
            "version": unified_graph.get("version", "2.0.0"),
            "root_subject_ids": unified_graph.get("rootSubjectIds", []),
            "stats": unified_graph.get("stats", {})
        },
        {
            "id": "civil_services",
            "version": cs_graph.get("version", "2.0.0"),
            "root_subject_ids": cs_graph.get("rootSubjectIds", []),
            "stats": cs_graph.get("stats", {})
        },
        {
            "id": "teaching",
            "version": teaching_graph.get("version", "2.0.0"),
            "root_subject_ids": teaching_graph.get("rootSubjectIds", []),
            "stats": teaching_graph.get("stats", {})
        },
        {
            "id": "languages",
            "version": lang_graph.get("version", "2.0.0"),
            "root_subject_ids": lang_graph.get("rootSubjectIds", []),
            "stats": lang_graph.get("stats", {})
        }
    ]

    try:
        make_request(endpoint_meta, supabase_key, method='POST', body=meta_records, prefer='resolution=merge-duplicates')
        print("Successfully updated knowledge_graph_meta entries for all 4 streams.")
    except Exception as e:
        print(f"Error updating knowledge_graph_meta: {e}")

    print(f"\nKnowledge Graph Supabase Sync Completed: {total_upserted} nodes synced.")

def format_node_record(node, primary_stream):
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
        "streams": [primary_stream]
    }

if __name__ == "__main__":
    main()
