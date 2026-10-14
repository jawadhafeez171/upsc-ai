import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg['nodes']

from pc_taxonomy import SUBJECT_KANNADA, DOMAIN_KANNADA

print("Building production rules for all 27 PC files...")
# Rules will be imported or written directly in remediate_all_pc_files.py
