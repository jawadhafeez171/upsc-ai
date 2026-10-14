import sys
import os
import json
import re

sys.stdout.reconfigure(encoding='utf-8', line_buffering=True)
sys.path.append('.')

from scripts.reaudit_ksp_pc import RULES

pc_dir = os.path.join('src', 'data', 'pc')
qs = []
for f in os.listdir(pc_dir):
    if f.endswith('.json'):
        with open(os.path.join(pc_dir, f), 'r', encoding='utf-8') as jf:
            for item in json.load(jf):
                stem_en = item.get('question_english', '')
                stem_kn = item.get('question_kannada', '')
                opts_en = f"{item.get('option_1_english','')} {item.get('option_2_english','')} {item.get('option_3_english','')} {item.get('option_4_english','')}"
                opts_kn = f"{item.get('option_1_kannada','')} {item.get('option_2_kannada','')} {item.get('option_3_kannada','')} {item.get('option_4_kannada','')}"
                item['corpus'] = f"{stem_en} {opts_en} {stem_kn} {opts_kn}"
                qs.append(item)

print(f"Loaded {len(qs)} questions.")

rule_stats = []
for idx, rule in enumerate(RULES):
    pat, cs, subj, dom, sub_t, sub_t_kn, nid, prio = rule
    flags = 0 if cs else re.IGNORECASE
    compiled = re.compile(pat, flags)
    matches = [q for q in qs if compiled.search(q['corpus'])]
    rule_stats.append((len(matches), idx, subj, sub_t, pat[:60]))

rule_stats.sort(key=lambda x: -x[0])

print("\n--- RULES BY MATCH COUNT ---")
for count, idx, subj, sub_t, pat_preview in rule_stats[:25]:
    print(f"{count:4d} matches | [{subj[:25]}] {sub_t[:35]} | Pat: {pat_preview}")
