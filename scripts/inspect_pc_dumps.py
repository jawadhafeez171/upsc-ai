import json
import glob
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

files = sorted(glob.glob('src/data/pc/*.json'))

mandates_qs = []
isro_qs = []

for fpath in files:
    fname = os.path.basename(fpath)
    if fname in ['2007_q001-100.json', 'hk_dar_pc_2026_sept.json', 'nhk_dar_pc_2026_sept.json']:
        continue
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        nid = q.get('node_id')
        qn = q.get('question_number')
        txt = q.get('question_english', '')
        if nid == 'internal_security.security_forces_intelligence_agencies_statutory_mandates':
            mandates_qs.append((fname, qn, txt[:80]))
        elif nid == 'science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions':
            isro_qs.append((fname, qn, txt[:80]))

print(f"Total false IS mandates questions across remaining 27 files: {len(mandates_qs)}")
print("Sample first 20 IS mandates questions:")
for fname, qn, txt in mandates_qs[:20]:
    print(f"  [{fname} Q{qn:2d}]: {txt}")

print(f"\nTotal false ISRO questions across remaining 27 files: {len(isro_qs)}")
print("Sample first 20 ISRO questions:")
for fname, qn, txt in isro_qs[:20]:
    print(f"  [{fname} Q{qn:2d}]: {txt}")
