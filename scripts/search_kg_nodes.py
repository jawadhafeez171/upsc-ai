import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})

# Search for the invalid node IDs:
search_keys = [
    'economic', 'human_geography', 'fiscal', 'poverty', 'inclusion',
    'coding_decoding', 'venn', 'blood_relations', 'classification', 'series',
    'time_and_work', 'speed_time', 'ratio', 'simple_interest', 'mensuration'
]

print("=== SEARCHING VALID KG NODES ===")
for sk in search_keys:
    print(f"\n--- Search key: '{sk}' ---")
    matches = [nid for nid in nodes if sk in nid]
    for m in matches[:6]:
        print(f"  {m} ({nodes[m].get('name')})")
