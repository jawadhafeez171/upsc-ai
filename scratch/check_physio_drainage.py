import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

print("--- Physiographic Divisions Subtopics (3.4.1) ---")
for nid, n in nodes.items():
    if 'physiographic' in nid:
        print(f"[{n['levelName']}] {nid} -> {n['name']}")

print("\n--- Drainage Systems Subtopics (3.4.2) ---")
for nid, n in nodes.items():
    if 'drainage_system' in nid:
        print(f"[{n['levelName']}] {nid} -> {n['name']}")
