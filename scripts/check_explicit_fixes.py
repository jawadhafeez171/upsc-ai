import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg.get('nodes', {})

# Import EXPLICIT_QUESTION_FIXES
from execute_deep_remediation import EXPLICIT_QUESTION_FIXES, NODE_ALIAS_MAP

print("=== CHECKING EXPLICIT_QUESTION_FIXES ===")
missing_explicit = []
for k, nid in EXPLICIT_QUESTION_FIXES.items():
    if nid not in nodes:
        missing_explicit.append((k, nid))

print(f"Missing in KG from EXPLICIT_QUESTION_FIXES: {len(missing_explicit)}")
for k, nid in missing_explicit:
    # search closest
    prefix = nid.split('.')[0]
    matches = [n for n in nodes if n.startswith(prefix) and any(w in n for w in nid.split('.')[-1].split('_')[:2])]
    print(f"  {k}: '{nid}' not found. Suggestions: {matches[:3]}")

print("\n=== CHECKING NODE_ALIAS_MAP ===")
missing_aliases = []
for k, nid in NODE_ALIAS_MAP.items():
    if nid not in nodes:
        missing_aliases.append((k, nid))

print(f"Missing in KG from NODE_ALIAS_MAP: {len(missing_aliases)}")
for k, nid in missing_aliases:
    print(f"  Alias target '{nid}' not in KG")
