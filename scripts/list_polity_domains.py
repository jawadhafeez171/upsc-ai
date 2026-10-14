import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg['nodes']

for nid, n in sorted(nodes.items()):
    if nid.startswith('indian_polity_constitution_governance') and n.get('level') == 2:
        print(nid, "->", n.get('name'))
