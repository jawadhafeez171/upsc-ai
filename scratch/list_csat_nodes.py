import json

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

csat_nodes = {nid: data for nid, data in kg['nodes'].items() if nid.startswith('general_mental_ability')}
print(f"Total CSAT nodes in KG: {len(csat_nodes)}")

for nid, data in sorted(csat_nodes.items()):
    lvl = data.get('level')
    name = data.get('name')
    print(f"L{lvl} | {nid} | {name}")
