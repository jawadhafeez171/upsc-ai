import re

# Let's inspect rules in scripts/reaudit_ksp_pc.py
with open('scripts/reaudit_ksp_pc.py', 'r', encoding='utf-8') as f:
    code = f.read()

# Let's find all pattern strings
import ast

patterns = re.findall(r"\(\s*r'([^']+)'\s*,\s*(False|True)", code)
print(f"Total patterns found: {len(patterns)}")

common_words = {'who', 'un', 'in', 'is', 'raw', 'ib', 'lead', 'paris', 'gas', 'water', 'light', 'heat', 'plant', 'organ', 'state', 'capital', 'river', 'lake', 'district', 'gold', 'silver', 'copper', 'iron', 'rust'}

for pat, case_sens in patterns:
    if case_sens == 'False':
        # Split tokens inside pattern
        # Find small tokens
        parts = re.split(r'[|()]', pat)
        suspicious = []
        for p in parts:
            p_clean = p.strip('\\b').strip()
            if not p_clean: continue
            # check if simple single word
            if re.match(r'^[a-zA-Z]{1,4}$', p_clean):
                suspicious.append(p_clean)
        if suspicious:
            print(f"Pattern with short tokens (case-insensitive={case_sens}): {suspicious}")
