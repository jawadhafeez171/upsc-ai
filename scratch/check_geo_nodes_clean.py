import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

print("--- Geography Domains (Level 2) ---")
for nid, n in nodes.items():
    if nid.startswith('geography_earth_systems') and n['level'] == 2:
        print(f"[{n['level']}] {nid} -> {n['name']}")

print("\n--- Geography Topics (Level 3) under Geography of India (3.4) ---")
for nid, n in nodes.items():
    if 'geography_of_india' in nid and n['level'] == 3:
        print(f"[{n['level']}] {nid} -> {n['name']}")

print("\n--- Geography Topics (Level 3) under Geography of World (3.7) ---")
for nid, n in nodes.items():
    if 'geography_of_the_world' in nid or 'geography_of_world' in nid or 'world_geography' in nid:
        if n['level'] == 3:
            print(f"[{n['level']}] {nid} -> {n['name']}")

print("\n--- Geography Topics (Level 3) under Geography of Karnataka (3.10) ---")
for nid, n in nodes.items():
    if 'geography_of_karnataka' in nid and n['level'] == 3:
        print(f"[{n['level']}] {nid} -> {n['name']}")
