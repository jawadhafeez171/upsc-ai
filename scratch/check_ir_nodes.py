import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)

nodes = master_kg['nodes']

print("--- All International Relations Domains & Topics ---")
for nid, n in nodes.items():
    if nid.startswith('international_relations'):
        print(f"[{n['levelName']}] {nid} -> {n['name']}")
