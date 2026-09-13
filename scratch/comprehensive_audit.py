# -*- coding: utf-8 -*-
import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

# Canonical Subject -> Subject Kannada Mapping from Knowledge Graph
CANONICAL_SUBJECT_MAP = {
    "History": "ಇತಿಹಾಸ",
    "Art, Culture & Heritage": "ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ",
    "Geography & Earth Systems": "ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು",
    "Indian Society & Social Justice": "ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ",
    "Indian Polity, Constitution & Governance": "ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ",
    "International Relations & Global Institutions": "ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು",
    "Indian Economy & Development": "ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ",
    "Environment, Ecology & Disaster Management": "ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ",
    "Science, Technology & Defence": "ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ",
    "Internal Security": "ಆಂತರಿಕ ಭದ್ರತೆ",
    "Ethics, Integrity & Aptitude": "ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ",
    "General Mental Ability, Quantitative Aptitude & Comprehension": "ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ"
}

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

kg_nodes = kg['nodes']
print(f"Loaded Knowledge Graph with {len(kg_nodes)} nodes.")

files = [
    ('HK DAR PC Sept 2026', 'src/data/upsc_pyq/pc/hk_dar_pc_2026_sept.json'),
    ('NHK DAR PC Sept 2026', 'src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json')
]

devanagari_regex = re.compile(r'[\u0900-\u097F]')
total_errors = 0

for paper_name, file_path in files:
    print(f"\n==========================================")
    print(f"Auditing {paper_name} ({file_path})")
    print(f"==========================================")
    
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
        
    if len(data) != 100:
        print(f"ERROR: Expected 100 questions, found {len(data)}")
        total_errors += 1
        
    for idx, q in enumerate(data, 1):
        qnum = q.get('question_number')
        if qnum != idx:
            print(f"ERROR: Question index mismatch: expected {idx}, got {qnum}")
            total_errors += 1
            
        subj = q.get('subject')
        subj_kn = q.get('subject_kannada')
        dom = q.get('domain')
        dom_kn = q.get('domain_kannada')
        subt = q.get('sub_topic')
        subt_kn = q.get('sub_topic_kannada')
        nid = q.get('node_id')
        tags = q.get('tags', [])
        
        # 1. Subject canonical check
        if subj not in CANONICAL_SUBJECT_MAP:
            print(f"ERROR Q{qnum}: '{subj}' is not in CANONICAL_SUBJECT_MAP")
            total_errors += 1
            
        expected_kn = CANONICAL_SUBJECT_MAP.get(subj)
        if subj_kn != expected_kn:
            print(f"ERROR Q{qnum}: Kannada subject mismatch: expected '{expected_kn}', got '{subj_kn}'")
            total_errors += 1
            
        # 2. Domain & Sub-topic non-empty
        for fld_name, fld_val in [('domain', dom), ('domain_kannada', dom_kn), 
                                 ('sub_topic', subt), ('sub_topic_kannada', subt_kn)]:
            if not fld_val or not str(fld_val).strip():
                print(f"ERROR Q{qnum}: {fld_name} is blank!")
                total_errors += 1
                
        # 3. Node ID validation
        if not nid or nid not in kg_nodes:
            print(f"ERROR Q{qnum}: node_id '{nid}' is invalid or not in knowledge_graph.json!")
            total_errors += 1
            
        # 4. Tags check
        if subj not in tags:
            print(f"ERROR Q{qnum}: canonical subject '{subj}' is NOT in tags: {tags}")
            total_errors += 1
            
        # 5. Check Devanagari contamination in Kannada fields
        for fld_name, fld_val in [('subject_kannada', subj_kn), ('domain_kannada', dom_kn), ('sub_topic_kannada', subt_kn)]:
            if fld_val and devanagari_regex.search(fld_val):
                print(f"ERROR Q{qnum}: Devanagari script detected in {fld_name}: {fld_val}")
                total_errors += 1
                
        # 6. Basic question completeness
        if not q.get('question_english') or not q.get('question_kannada'):
            print(f"ERROR Q{qnum}: Missing question text!")
            total_errors += 1
            
        if not q.get('key_answer'):
            print(f"ERROR Q{qnum}: Missing key answer!")
            total_errors += 1
            
    print(f"Completed audit of {paper_name}. Total errors detected: {total_errors}")

print(f"\n==========================================")
if total_errors == 0:
    print("ALL AUDIT CHECKS PASSED PERFECTLY! 0 ERRORS DETECTED.")
else:
    print(f"AUDIT FAILED WITH {total_errors} ERRORS.")
print(f"==========================================")
