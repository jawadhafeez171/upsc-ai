import json
import glob
import sys
import os
import re

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg.get('nodes', {})

capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))

# Flagged questions:
flagged = []

GS_TERMS_IN_GMA = [
    'james prinsep', 'brahmi', 'kharosthi', 'permanent settlement', 'buddha', 'vasudeo balwant phadke',
    'vedic sacrifices', 'meghnad badh kabya', 'architecture of rome in the 15th century', 'anglicists',
    'orientalists', 'khadi and village industries', 'law of diminishing returns', 'code on wages',
    'administrative reforms commission', 'constitution of india', '8th schedule', 'human rights',
    'right to information act', 'ek bharat shreshtha bharat', 'india-poland strategic partnership',
    'us president in 2017 has signed an executive order', 'offshore patrol vessel', 'sajag',
    'roaring forties', 'circum-pacific belt', 'ring of fire', 'river basins of india', 'shortest in length',
    'genetic materials in prokaryotes', 'genetically modifying an organism', 'gregor j. mendel',
    'calcium oxide reacts with water', 'slaked lime', 'raster data format', 'uniform circular motion',
    'total electricity generation', 'electromagnetic wave', 'resistors r1', 'resistance r is cut'
]

# Additional cross-subject checks:
CROSS_SUBJECT_CHECKS = [
    ('history', r'\b(mughal\s+period|ahadis\s+of\s+the\s+mughal|dutch\s+trade\s+in\s+mughal|mature\s+harappan|east\s+india\s+company)\b'),
    ('indian_polity_constitution_governance', r'\b(10th\s+schedule\s+of\s+the\s+constitution|lok\s+sabha\s+and\s+the\s+rajya\s+sabha\s+held\s+joint)\b'),
    ('international_relations_global_institutions', r'\b(zayed\s+medal\s+is\s+the\s+top\s+civilian)\b'),
    ('geography_earth_systems', r'\b(bharatmala\s+pariyojana)\b')
]

for fpath in capf_files:
    fname = os.path.basename(fpath)
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        nid = q.get('node_id')
        subj = q.get('subject')
        year = q.get('year')
        qnum = q.get('question_number')
        qtext = q.get('question_english', '')
        q_lower = qtext.lower()
        
        reasons = []
        
        # 1. Invalid node ID
        if not nid or nid not in nodes:
            reasons.append(f"Invalid node_id: {nid}")
        
        # 2. GS in GMA
        if subj == "General Mental Ability, Quantitative Aptitude & Comprehension":
            for kw in GS_TERMS_IN_GMA:
                if kw in q_lower:
                    reasons.append(f"GS question in GMA (hit '{kw}')")
                    break
        
        # 3. Cross-subject anomalies
        for target_subj, pat in CROSS_SUBJECT_CHECKS:
            if re.search(pat, qtext, re.IGNORECASE):
                # check if subject matches
                mapping = {
                    'history': "History",
                    'indian_polity_constitution_governance': "Indian Polity, Constitution & Governance",
                    'international_relations_global_institutions': "International Relations & Global Institutions",
                    'geography_earth_systems': "Geography & Earth Systems"
                }
                expected = mapping[target_subj]
                if subj != expected:
                    reasons.append(f"Cross-subject mismatch: currently '{subj}', expected '{expected}' (hit '{pat}')")

        if reasons:
            flagged.append({
                'file': fname,
                'year': year,
                'qnum': qnum,
                'reasons': reasons,
                'text': qtext[:100],
                'current_node_id': nid,
                'current_subject': subj,
                'current_domain': q.get('domain'),
                'current_sub_topic': q.get('sub_topic')
            })

print(f"Total flagged items requiring remediation: {len(flagged)}")
for item in flagged:
    print(f"[{item['year']} Q{item['qnum']}] Reasons: {item['reasons']}")
    print(f"  Current: Subj: {item['current_subject']} | Node: {item['current_node_id']}")
    print(f"  Text: {item['text']}...\n")
