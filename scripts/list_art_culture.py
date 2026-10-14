import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})

print("=== ART, CULTURE & HERITAGE NODES ===")
for nid, n in sorted(nodes.items()):
    if nid.startswith('art_culture_heritage'):
        print(f"[{n.get('levelName', '')}] {nid} -> {n.get('name')}")
