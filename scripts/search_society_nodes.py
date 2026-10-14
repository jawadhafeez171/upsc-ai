import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})

for nid in sorted(nodes.keys()):
    if nid.startswith('indian_society_social_justice'):
        print(nid, "->", nodes[nid].get('name'))
