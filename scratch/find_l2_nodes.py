import json

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg_nodes = json.load(f)['nodes']

subjects = ['environment_ecology_disaster_management', 'geography_earth_systems', 'indian_economy_development', 'indian_polity_constitution_governance']

for s in subjects:
    print(f"\n=================== {s} ===================")
    for k in sorted(kg_nodes.keys()):
        if k.startswith(s) and kg_nodes[k].get('level') in [1, 2]:
            print(f"  [L{kg_nodes[k].get('level')}] {k} -> {kg_nodes[k]['name']}")
