import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})
print(f"Total KG nodes: {len(nodes)}")

# Let's see the distribution of nodes across levels
levels = {}
for nid, n in nodes.items():
    lvl = n.get('level', 0)
    levels[lvl] = levels.get(lvl, 0) + 1

print("Nodes by Level:", sorted(levels.items()))

# Let's see root subjects
roots = kg.get('rootSubjectIds', [])
print("\nRoot Subjects:")
for r in roots:
    print(f"  {r}: {nodes[r].get('name')}")
