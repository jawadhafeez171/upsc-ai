import json

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

print("--- Geography of India Topics/Subtopics ---")
for nid, n in nodes.items():
    if 'geography_of_india' in nid or 'indian_geography' in nid:
        if n['level'] in [2, 3, 4]:
            print(f"[{n['levelName']}] {nid} -> {n['name']}")

print("\n--- World Geography Topics/Subtopics ---")
for nid, n in nodes.items():
    if 'world_geography' in nid or 'geography_of_the_world' in nid:
        if n['level'] in [2, 3, 4]:
            print(f"[{n['levelName']}] {nid} -> {n['name']}")

print("\n--- Geography of Karnataka Topics/Subtopics ---")
for nid, n in nodes.items():
    if 'karnataka' in nid and 'mapping' not in nid:
        if n['level'] in [2, 3, 4]:
            print(f"[{n['levelName']}] {nid} -> {n['name']}")
