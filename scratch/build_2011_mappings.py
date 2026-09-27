import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)

valid_nids = set(master_kg['nodes'].keys())

# Load 2011.json
with open('src/data/upsc_pyq/2011.json', 'r', encoding='utf-8') as f:
    q_2011 = json.load(f)

print(f"Loaded {len(q_2011)} questions from 2011.")
