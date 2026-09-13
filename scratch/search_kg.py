import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

def search_nodes(kw, max_results=10):
    kw_l = kw.lower()
    res = []
    for nid, n in nodes.items():
        if kw_l in nid.lower() or kw_l in n['name'].lower():
            res.append((nid, n['name'], n['levelName']))
    return res[:max_results]

tests = ['demograph', 'census', 'mineral', 'iron', 'judiciar', 'executive', 'parliament', 'dpsp', 'fundamental_rights', 'geomorph', 'ocean']
for t in tests:
    matches = search_nodes(t, 3)
    print(f"Search '{t}': {matches}")
