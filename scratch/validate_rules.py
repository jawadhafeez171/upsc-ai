import json
import re

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)['nodes']

with open('scripts/reaudit_ksp_pc.py', 'r', encoding='utf-8') as f:
    content = f.read()

ids = re.findall(r"v\(['\"]([^'\"]+)['\"]\)", content)
invalid = [i for i in ids if i not in kg]
print(f"Total node IDs in script: {len(ids)}")
print(f"Invalid IDs: {invalid}")
