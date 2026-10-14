import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg['nodes']

for nid in sorted(nodes.keys()):
    if nid.startswith('indian_polity_constitution_governance') and any(k in nid for k in ['election', 'body', 'commission', 'cag']):
        print(nid, "->", nodes[nid].get('name'))
