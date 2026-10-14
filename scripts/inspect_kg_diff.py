import json
import subprocess
import sys

sys.stdout.reconfigure(encoding='utf-8')

kg_curr = json.load(open('src/data/knowledge_graph.json', encoding='utf-8'))
git_show = subprocess.run(['git', 'show', 'HEAD:src/data/knowledge_graph.json'], capture_output=True, text=True, encoding='utf-8')
kg_head = json.loads(git_show.stdout)

print('Current top-level keys:', list(kg_curr.keys()))
print('Head top-level keys:', list(kg_head.keys()))
if 'stats' in kg_curr:
    print('Stats block added:', json.dumps(kg_curr['stats'], indent=2))

# Check subject casings
subject_changes = []
for k in kg_curr['nodes']:
    if k in kg_head['nodes']:
        s_old = kg_head['nodes'][k].get('subject')
        s_new = kg_curr['nodes'][k].get('subject')
        if s_old != s_new:
            subject_changes.append((k, s_old, s_new))

print(f'\nSubject field changes count: {len(subject_changes)}')
if subject_changes:
    print('Sample subject field changes:')
    for sc in subject_changes[:5]:
        print(f"  {sc[0]}: '{sc[1]}' -> '{sc[2]}'")

# Check children consolidation
children_cleanups = [k for k in kg_head['nodes'] if 'children' in kg_head['nodes'][k] and 'children' not in kg_curr['nodes'].get(k, {})]
print(f'\nLegacy children fields merged into childrenIds and cleaned up: {len(children_cleanups)}')
if children_cleanups:
    print('Sample cleaned nodes:', children_cleanups[:5])

# Any integrity errors?
bad_parents = [k for k, v in kg_curr['nodes'].items() if v.get('parentId') and v['parentId'] not in kg_curr['nodes']]
bad_children = [k for k, v in kg_curr['nodes'].items() for c in v.get('childrenIds', []) if c not in kg_curr['nodes']]
print(f'\nIntegrity check: Bad parents: {len(bad_parents)}, Bad children: {len(bad_children)}')
