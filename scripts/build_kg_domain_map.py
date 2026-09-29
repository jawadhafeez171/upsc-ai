import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})
print(f"Total KG nodes: {len(nodes)}")

# Let's inspect all Level 2 domains grouped by subject
by_subj = {}
for nid, n in nodes.items():
    if n.get('level') == 2:
        sid = n.get('subjectId')
        by_subj.setdefault(sid, []).append((nid, n.get('name')))

for sid, dlist in sorted(by_subj.items()):
    sname = nodes[sid].get('name')
    print(f"\n=== Subject: {sid} ({sname}) [{len(dlist)} domains] ===")
    for did, dname in dlist:
        print(f"  '{did}': '{dname}',")
