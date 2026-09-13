import json, re

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg['nodes']

with open('scripts/enrich_pc_pyq.py', 'r', encoding='utf-8') as f:
    content = f.read()

matches = re.findall(r"validate_nid\('([^']+)'\)", content)
invalid = [m for m in matches if m not in nodes]
print(f"Total checked: {len(matches)}, Invalid count: {len(invalid)}")
for inv in invalid:
    print('  Invalid:', inv)
