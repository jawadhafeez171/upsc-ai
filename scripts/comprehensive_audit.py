import json
import glob
import sys
import os

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})
root_ids = kg.get('rootSubjectIds', [])

print("=== KG ROOT SUBJECTS AND DOMAINS ===")
for sid in root_ids:
    rnode = nodes.get(sid, {})
    ch = rnode.get('childrenIds', [])
    print(f"\n[Level 1 Subject] {sid} : '{rnode.get('name')}' (Domains: {len(ch)})")
    for cid in ch:
        cnode = nodes.get(cid, {})
        sub_ch = cnode.get('childrenIds', [])
        print(f"   -> [Level 2 Domain] {cid} : '{cnode.get('name')}' ({len(sub_ch)} sub-topics)")

# Now inspect all 1625 questions
capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))
print(f"\nInspecting {len(capf_files)} files...")

# Collect all questions
all_questions = []
for fpath in capf_files:
    fname = os.path.basename(fpath)
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        q['__file__'] = fname
        all_questions.append(q)

print(f"Total questions: {len(all_questions)}")

# Check validity of node_ids against KG
valid_nodes = 0
invalid_nodes = []
for q in all_questions:
    nid = q.get('node_id')
    if nid in nodes:
        valid_nodes += 1
    else:
        invalid_nodes.append((q['__file__'], q.get('year'), q.get('question_number'), nid, q.get('subject'), q.get('domain'), q.get('sub_topic')))

print(f"Valid KG node_ids: {valid_nodes} / {len(all_questions)}")
print(f"Invalid KG node_ids: {len(invalid_nodes)}")
print("Sample invalid node_ids:")
for inv in invalid_nodes[:15]:
    print(f"  {inv[0]} (Year {inv[1]} Q{inv[2]}): {inv[3]} | Subj: {inv[4]} | Dom: {inv[5]}")
