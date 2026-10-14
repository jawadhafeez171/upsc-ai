import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})

for nid, n in sorted(nodes.items()):
    if 'karnataka' in nid:
        print(f"{nid} -> {n.get('name')}")
