import sys
sys.stdout.reconfigure(encoding='utf-8')

from classify_ksp_pc import RULES

print(f"Total RULES: {len(RULES)}")
for idx, (pat, subj, dom, sub_t, sub_t_kn, nid, prio) in enumerate(RULES):
    # Split patterns by pipe
    parts = pat.strip(r'\b()').split('|')
    short_parts = [p.strip() for p in parts if len(p.strip()) <= 4]
    if short_parts:
        print(f"Rule {idx+1} [Prio {prio}] ({subj[:25]}): short terms -> {short_parts}")
