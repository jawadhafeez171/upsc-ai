import json
import os
import re

pc_dir = os.path.join('src', 'data', 'pc')
files = sorted(os.listdir(pc_dir))

all_qs = []
for f in files:
    if f.endswith('.json'):
        with open(os.path.join(pc_dir, f), 'r', encoding='utf-8') as jf:
            for q in json.load(jf):
                q['_file'] = f
                all_qs.append(q)

print(f"Total questions loaded: {len(all_qs)}")

# Check: What matches 'WHO' if ignorecase?
who_matches = []
for q in all_qs:
    stem_en = q.get('question_english', '')
    opts_en = f"{q.get('option_1_english','')} {q.get('option_2_english','')} {q.get('option_3_english','')} {q.get('option_4_english','')}"
    text = f"{stem_en} {opts_en}"
    if re.search(r'\bWHO\b', text, re.IGNORECASE):
        who_matches.append((q.get('question_number', '?'), q['_file'], stem_en[:60]))

print(f"Total matches for \\bWHO\\b (IGNORECASE): {len(who_matches)}")
if who_matches:
    print("First 5 matches:")
    for m in who_matches[:5]:
        print(m)
