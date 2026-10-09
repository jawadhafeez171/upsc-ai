import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
print(f"Total KG nodes: {len(nodes)}")

# Group nodes by subject
by_subject = {}
for nid, n in nodes.items():
    s = n.get('subject')
    by_subject.setdefault(s, []).append(n)

for s, nlist in sorted(by_subject.items()):
    print(f"\n==========================================")
    print(f"Subject: {s} ({len(nlist)} nodes)")
    print(f"==========================================")
    for n in sorted(nlist, key=lambda x: (x.get('level', 1), x.get('id'))):
        indent = "  " * (n.get('level', 1) - 1)
        print(f"{indent}[L{n.get('level')}] {n.get('id')}: {n.get('name')}")
