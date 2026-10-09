# -*- coding: utf-8 -*-
"""
Merges knowledge_graph_epfo.json into src/data/knowledge_graph.json
"""
import json

def merge_epfo_to_master():
    with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
        master = json.load(f)
        
    with open('src/data/knowledge_graph_epfo.json', 'r', encoding='utf-8') as f:
        epfo = json.load(f)

    # 1. Merge rootSubjectIds
    existing_roots = master.get("rootSubjectIds", [])
    for rid in epfo.get("rootSubjectIds", []):
        if rid not in existing_roots:
            existing_roots.append(rid)
    master["rootSubjectIds"] = existing_roots

    # 2. Merge nodes
    master_nodes = master.get("nodes", {})
    added_count = 0
    for nid, node in epfo.get("nodes", {}).items():
        if nid not in master_nodes:
            master_nodes[nid] = node
            added_count += 1
        else:
            # Update keywords and exam tags if needed
            master_nodes[nid] = node
    master["nodes"] = master_nodes

    # 3. Update stats
    l1 = len([n for n in master_nodes.values() if n.get("level") == 1])
    l2 = len([n for n in master_nodes.values() if n.get("level") == 2])
    l3 = len([n for n in master_nodes.values() if n.get("level") == 3])
    l4 = len([n for n in master_nodes.values() if n.get("level") == 4])

    master["stats"] = {
        "totalNodes": len(master_nodes),
        "byLevel": {
            "subjects": l1,
            "domains": l2,
            "topics": l3,
            "entities": l4
        }
    }

    with open('src/data/knowledge_graph.json', 'w', encoding='utf-8') as f:
        json.dump(master, f, indent=2, ensure_ascii=False)

    print(f"Merged {added_count} EPFO nodes into master knowledge_graph.json. Total nodes now: {len(master_nodes)}.")

if __name__ == "__main__":
    merge_epfo_to_master()
