import json

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
subjects = set()
domains = set()
for nid, n in nodes.items():
    subjects.add(n.get('subject'))

print(f"Total KG nodes: {len(nodes)}")
print("Available Subjects in KG:")
for s in sorted(subjects):
    cnt = sum(1 for n in nodes.values() if n.get('subject') == s)
    print(f"  - {s} ({cnt} nodes)")
