import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

print("--- Indian Physical Geography Topics (3.4) ---")
for nid, n in nodes.items():
    if nid.startswith('geography_earth_systems.indian_physical_geography_monsoon_architecture'):
        print(f"[{n['levelName']}] {nid} -> {n['name']}")

print("\n--- Oceanography Topics (3.3) ---")
for nid, n in nodes.items():
    if nid.startswith('geography_earth_systems.oceanography_marine_systems'):
        print(f"[{n['levelName']}] {nid} -> {n['name']}")

print("\n--- Economic Geography Topics (3.6) ---")
for nid, n in nodes.items():
    if nid.startswith('geography_earth_systems.economic_resource_geography'):
        print(f"[{n['levelName']}] {nid} -> {n['name']}")
