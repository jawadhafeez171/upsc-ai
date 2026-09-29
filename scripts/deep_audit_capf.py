import json
import glob
import sys
import os

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)
kg_nodes = kg.get('nodes', {})

capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))

print("=== DEEP AUDIT: INSPECTING ALL CAPF QUESTIONS ===")

gma_suspicious = []
all_gma = []

for fpath in capf_files:
    fname = os.path.basename(fpath)
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        subj = q.get('subject', '')
        qtext = q.get('question_english', '')
        exp = q.get('explanation_english', '')
        full = (qtext + ' ' + exp).lower()
        year = q.get('year')
        qnum = q.get('question_number')
        
        if subj == "General Mental Ability, Quantitative Aptitude & Comprehension":
            all_gma.append((year, qnum, qtext, q.get('sub_topic'), q.get('node_id')))
            # Check for history, polity, economy, geography, international keywords
            susp_keys = ['buddha', 'prinsep', 'ashoka', 'british', 'mughal', 'sultanate', 'treaty', 
                         'constitution', 'parliament', 'president', 'prime minister', 'amendment', 
                         'monsoon', 'river', 'himalaya', 'ocean', 'rock', 'soil', 'gdp', 'inflation', 
                         'fiscal', 'rbi', 'bank rate', 'united nations', 'unesco', 'globalization',
                         'cell', 'chlorophyll', 'photosynthesis', 'chromosome', 'dna', 'rna']
            for sk in susp_keys:
                if sk in full:
                    gma_suspicious.append((year, qnum, sk, qtext[:100], q.get('sub_topic')))
                    break

print(f"Total GMA questions: {len(all_gma)}")
print(f"GMA questions containing non-GMA keywords: {len(gma_suspicious)}")
for y, qn, sk, qt, st in gma_suspicious:
    print(f"  [{y} Q{qn}] (Hit '{sk}'): {qt} --> Subtopic: {st}")
