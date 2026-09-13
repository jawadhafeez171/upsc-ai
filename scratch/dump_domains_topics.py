import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

for sid in ['history', 'art_culture_heritage', 'geography_earth_systems', 'indian_polity_constitution_governance', 'indian_economy_development', 'environment_ecology_disaster_management', 'science_technology_defence', 'ethics_integrity_aptitude', 'general_mental_ability_quantitative_aptitude_comprehension']:
    s = nodes[sid]
    print(f"\n=== {s['name']} ({sid}) ===")
    for cid in s.get('childrenIds', []):
        c = nodes[cid]
        print(f"  DOM: {cid} -> {c['name']}")
        for tid in c.get('childrenIds', [])[:5]:
            t = nodes[tid]
            print(f"    TOP: {tid} -> {t['name'][:60]}")
