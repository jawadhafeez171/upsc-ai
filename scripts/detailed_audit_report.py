import json
import glob
import sys
import os

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})
root_ids = set(kg.get('rootSubjectIds', []))

capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))

print("==================================================")
print("     UPSC CAPF KNOWLEDGE GRAPH COMPREHENSIVE AUDIT ")
print("==================================================")

total_qs = 0
invalid_node_id_qs = []
mismatched_subj_qs = []
gma_false_positives = []

# List of unambiguous GS keywords that should never be in GMA
GS_KEYWORDS = [
    'james prinsep', 'brahmi', 'kharosthi', 'permanent settlement', 'buddha', 'vasudeo balwant phadke',
    'vedic sacrifices', 'meghnad badh kabya', 'architecture of rome in the 15th century', 'anglicists',
    'orientalists', 'khadi and village industries', 'law of diminishing returns', 'code on wages',
    'administrative reforms commission', 'constitution of india', '8th schedule', 'human rights',
    'right to information act', 'ek bharat shreshtha bharat', 'india-poland strategic partnership',
    'us president in 2017 has signed an executive order', 'offshore patrol vessel', 'sajag',
    'roaring forties', 'circum-pacific belt', 'ring of fire', 'river basins of india', 'shortest in length',
    'genetic materials in prokaryotes', 'genetically modifying an organism', 'gregor j. mendel',
    'calcium oxide reacts with water', 'slaked lime', 'raster data format', 'uniform circular motion',
    'total electricity generation'
]

for fpath in capf_files:
    fname = os.path.basename(fpath)
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    
    for q in data:
        total_qs += 1
        nid = q.get('node_id')
        subj = q.get('subject')
        year = q.get('year')
        qnum = q.get('question_number')
        qtext = q.get('question_english', '')
        
        # 1. Check if node_id exists in KG
        if not nid or nid not in nodes:
            invalid_node_id_qs.append((fname, year, qnum, nid, subj))
        else:
            # 2. Check if node_id matches the subject
            node_obj = nodes[nid]
            subj_id = node_obj.get('subjectId')
            root_node = nodes.get(subj_id)
            if root_node and root_node.get('name') != subj:
                mismatched_subj_qs.append((fname, year, qnum, subj, root_node.get('name'), nid))
        
        # 3. Check for obvious GMA false positives
        if subj == "General Mental Ability, Quantitative Aptitude & Comprehension":
            q_lower = qtext.lower()
            for kw in GS_KEYWORDS:
                if kw in q_lower:
                    gma_false_positives.append((fname, year, qnum, kw, qtext[:80]))
                    break

print(f"Total Papers Inspected: {len(capf_files)}")
print(f"Total Questions Inspected: {total_qs}")
print(f"1. Invalid / Unrecognized node_ids in KG: {len(invalid_node_id_qs)} ({len(invalid_node_id_qs)/total_qs*100:.2f}%)")
print(f"2. Subject vs KG Root Mismatches: {len(mismatched_subj_qs)} ({len(mismatched_subj_qs)/total_qs*100:.2f}%)")
print(f"3. Confirmed GS Questions Misclassified into GMA: {len(gma_false_positives)}")

if gma_false_positives:
    print("\n--- Identified Misclassified GS Questions in GMA ---")
    for fname, year, qnum, kw, txt in gma_false_positives:
        print(f"  * {year} Q{qnum} (Keyword '{kw}'): {txt}...")

if invalid_node_id_qs:
    print(f"\n--- Distinct Invalid Node IDs ({len(set(x[3] for x in invalid_node_id_qs))}) ---")
    for inv_nid in sorted(set(x[3] for x in invalid_node_id_qs)):
        print(f"  * {inv_nid}")
