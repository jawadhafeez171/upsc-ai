import json
import os
import re

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)['nodes']

# Import the classifier from scripts/reaudit_ksp_pc.py
import sys
sys.path.append('scripts')
from reaudit_ksp_pc import classify_q, RULES, SUBJECT_KN, DOMAIN_KN

pc_dir = os.path.join('src', 'data', 'pc')
files = sorted(os.listdir(pc_dir))

total = 0
by_subject = {}
fallbacks = []
samples_by_subject = {}

for f in files:
    if not f.endswith('.json'): continue
    with open(os.path.join(pc_dir, f), 'r', encoding='utf-8') as jf:
        questions = json.load(jf)
    for q in questions:
        total += 1
        res = classify_q(q)
        subj = res['subject']
        by_subject[subj] = by_subject.get(subj, 0) + 1
        
        if subj not in samples_by_subject:
            samples_by_subject[subj] = []
        if len(samples_by_subject[subj]) < 3:
            samples_by_subject[subj].append({
                'file': f,
                'q_no': q.get('question_number'),
                'stem_en': q.get('question_english', '')[:80],
                'stem_kn': q.get('question_kannada', '')[:80],
                'domain': res['domain'],
                'sub_topic': res['sub_topic'],
                'node_id': res['node_id']
            })

print(f"Total Questions Evaluated: {total}")
print("\n--- SUBJECT DISTRIBUTION (DRY RUN) ---")
for s, c in sorted(by_subject.items(), key=lambda x: -x[1]):
    print(f"{s:60} : {c:4d} ({c/total*100:5.1f}%)")

print("\n--- SAMPLE MAPPINGS PER SUBJECT ---")
for s, samples in samples_by_subject.items():
    print(f"\n[{s}]")
    for samp in samples:
        print(f"  {samp['file']} Q{samp['q_no']}: {samp['stem_en']}")
        print(f"     -> Domain: {samp['domain']} | Node: {samp['node_id']}")
