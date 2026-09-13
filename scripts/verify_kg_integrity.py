# -*- coding: utf-8 -*-
import json

def validate(graph_path, name):
    with open(graph_path, 'r', encoding='utf-8') as f:
        kg = json.load(f)
    nodes = kg.get('nodes', {})
    broken_parents = 0
    broken_children = 0
    for nid, n in nodes.items():
        if n.get('parentId') and n['parentId'] not in nodes:
            print(f"[{name}] Broken parent: {nid} -> {n['parentId']}")
            broken_parents += 1
        for cid in n.get('childrenIds', []):
            if cid not in nodes:
                print(f"[{name}] Broken child: {nid} -> {cid}")
                broken_children += 1
    print(f"{name}: Total {len(nodes)} nodes | Broken Parents: {broken_parents} | Broken Children: {broken_children}")
    return len(nodes), broken_parents, broken_children

def main():
    validate('src/data/knowledge_graph.json', 'Master KG')
    validate('src/data/knowledge_graph_civil_services.json', 'Civil Services KG')

if __name__ == '__main__':
    main()
