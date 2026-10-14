import json
import os
import re

pc_dir = os.path.join('src', 'data', 'pc')
all_text = []
for f in os.listdir(pc_dir):
    if f.endswith('.json'):
        with open(os.path.join(pc_dir, f), 'r', encoding='utf-8') as jf:
            for q in json.load(jf):
                stem_en = q.get('question_english', '')
                stem_kn = q.get('question_kannada', '')
                opts_en = f"{q.get('option_1_english','')} {q.get('option_2_english','')} {q.get('option_3_english','')} {q.get('option_4_english','')}"
                opts_kn = f"{q.get('option_1_kannada','')} {q.get('option_2_kannada','')} {q.get('option_3_kannada','')} {q.get('option_4_kannada','')}"
                all_text.append(f"{stem_en} {opts_en} {stem_kn} {opts_kn}")

print(f"Total questions loaded: {len(all_text)}")

# Read rules
with open('scripts/reaudit_ksp_pc.py', 'r', encoding='utf-8') as f:
    code = f.read()

# Extract every pattern
rule_blocks = re.findall(r"\(\s*r'([^']+)'\s*,\s*(False|True)[^)]+?\)", code)

overmatching = []
for pat, cs in rule_blocks:
    flags = 0 if cs == 'True' else re.IGNORECASE
    # split individual alternatives
    # clean pattern of leading \b( and trailing )\b
    p_inner = pat
    if p_inner.startswith(r'\b(') and p_inner.endswith(r')\b'):
        p_inner = p_inner[3:-3]
    elif p_inner.startswith(r'\b(') and p_inner.endswith(r')'):
        p_inner = p_inner[3:-1]
        
    alts = p_inner.split('|')
    for alt in alts:
        alt_clean = alt.strip()
        if not alt_clean: continue
        # test alt
        sub_pat = rf'\b{alt_clean}\b' if not alt_clean.startswith(r'\b') else alt_clean
        # Count how many questions match
        count = 0
        matches_sample = []
        for idx, t in enumerate(all_text):
            if re.search(sub_pat, t, flags):
                count += 1
                if len(matches_sample) < 3:
                    matches_sample.append(t[:60])
        if count > 50:
            overmatching.append((alt_clean, cs, count, matches_sample[0]))

overmatching.sort(key=lambda x: -x[2])
print("\n--- HIGH FREQUENCY MATCHES (> 50 Qs) ---")
for alt, cs, count, samp in overmatching:
    print(f"Token: '{alt}' (CS={cs}) -> {count} matches | Sample: {samp}")
