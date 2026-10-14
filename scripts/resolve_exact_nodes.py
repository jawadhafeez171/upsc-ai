import json
import sys
import difflib

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = set(kg.get('nodes', {}).keys())

from verify_2007_mapping import MAPPING

missing = {}
for qn, nid in sorted(MAPPING.items()):
    if nid not in nodes:
        # find matches
        prefix = nid.split('.')[0]
        domain_part = nid.split('.')[1] if len(nid.split('.')) > 1 else ''
        candidates = [n for n in nodes if n.startswith(prefix)]
        # best fuzzy match
        close = difflib.get_close_matches(nid, candidates, n=3, cutoff=0.3)
        if not close and domain_part:
            close = [n for n in candidates if domain_part in n][:3]
        missing[qn] = (nid, close)

for qn, (orig, suggestions) in missing.items():
    print(f"Q{qn}: {orig}")
    for s in suggestions:
        print(f"   -> {s}")
