import json
import os
import re

import sys
sys.path.append('.')
from scripts.reaudit_ksp_pc import RULES

with open('src/data/pc/2007_q001-100.json', 'r', encoding='utf-8') as f:
    qs = json.load(f)

for q_num in [1, 2, 3, 7, 12, 14, 15, 18, 21, 39, 45]:
    q = next(item for item in qs if item.get('question_number') == q_num)
    stem_en = q.get('question_english', '')
    stem_kn = q.get('question_kannada', '')
    opts_en = f"{q.get('option_1_english','')} {q.get('option_2_english','')} {q.get('option_3_english','')} {q.get('option_4_english','')}"
    opts_kn = f"{q.get('option_1_kannada','')} {q.get('option_2_kannada','')} {q.get('option_3_kannada','')} {q.get('option_4_kannada','')}"
    text = f"{stem_en} {opts_en} {stem_kn} {opts_kn}"
    
    print(f"\n==================== Q{q_num}: {stem_en[:60]} ====================")
    matched_rules = []
    for r_idx, rule in enumerate(RULES):
        pat, cs, subj, dom, sub_t, sub_t_kn, nid, prio = rule
        flags = 0 if cs else re.IGNORECASE
        m = re.search(pat, text, flags)
        if m:
            matched_rules.append((prio, m.group(0), subj, dom, sub_t))
            
    matched_rules.sort(key=lambda x: -x[0])
    for prio, matched_text, subj, dom, sub_t in matched_rules[:5]:
        print(f"  Prio {prio}: Matched '{matched_text}' -> [{subj}] {sub_t}")
    if not matched_rules:
        print("  NO RULES MATCHED -> Fell to fallback!")
