import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)

nodes = master_kg['nodes']

def search_kg(keyword):
    kw = keyword.lower()
    matches = []
    for nid, n in nodes.items():
        name = n.get('name', '').lower()
        sub = n.get('subject', '').lower()
        entities = " ".join(n.get('entities', [])).lower()
        keywords = " ".join(n.get('keywords', [])).lower()
        comb = f"{nid} {name} {sub} {entities} {keywords}"
        if kw in comb:
            matches.append((nid, n.get('levelName'), n.get('subject'), n.get('name')))
    return matches

if __name__ == '__main__':
    if len(sys.argv) > 1:
        q = " ".join(sys.argv[1:])
        results = search_kg(q)
        print(f"Search for '{q}': {len(results)} matches")
        for nid, lvl, subj, name in results[:10]:
            print(f"[{lvl}] {nid}\n    -> {subj}: {name}")
