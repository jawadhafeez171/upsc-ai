import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
print(f"Total nodes: {len(nodes)}")

# Build subject lookup
subjects = {}
domains = {}
topics = {}

for nid, n in nodes.items():
    level = n.get('level')
    if level == 1:
        subjects[nid] = n
    elif level == 2:
        domains[nid] = n
    elif level == 3:
        topics[nid] = n

print(f"Level 1 Subjects: {len(subjects)}")
for sid, s in subjects.items():
    print(f"  {sid} -> {s['name']}")

print(f"\nLevel 2 Domains count: {len(domains)}")
