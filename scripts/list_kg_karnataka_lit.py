import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})

print("=== KARNATAKA NODES IN KG ===")
for nid, n in sorted(nodes.items()):
    name = n.get('name', '')
    if 'karnataka' in nid.lower() or 'karnataka' in name.lower():
        print(f"[{n.get('levelName', '')}] {nid} -> {name}")

print("\n=== LITERATURE NODES IN KG ===")
for nid, n in sorted(nodes.items()):
    name = n.get('name', '')
    if 'literature' in nid.lower() or 'language' in nid.lower() or 'literature' in name.lower():
        print(f"[{n.get('levelName', '')}] {nid} -> {name}")
