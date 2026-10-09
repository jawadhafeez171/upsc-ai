import json

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

# Let's inspect some sample nodes from different subjects
subjects = {}
for nid, n in nodes.items():
    s = n.get('subject')
    if s not in subjects:
        subjects[s] = []
    if len(subjects[s]) < 2:
        subjects[s].append((n.get('id'), n.get('name'), n.get('level'), n.get('parentId')))

for s, samples in sorted(subjects.items()):
    print(f"\nSubject: {s}")
    for samp in samples:
        print(f"  {samp}")
