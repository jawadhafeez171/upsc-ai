import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
for sid in kg['rootSubjectIds']:
    snode = nodes.get(sid)
    if not snode:
        continue
    print(f"\n==========================================")
    print(f"SUBJECT: {snode['name']} ({sid})")
    print(f"==========================================")
    for did in snode.get('childrenIds', []):
        dnode = nodes.get(did)
        if dnode:
            print(f"  - [{dnode['id']}] {dnode['name']} (topics: {len(dnode.get('childrenIds', []))})")
