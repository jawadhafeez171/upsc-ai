# -*- coding: utf-8 -*-
import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

devanagari_pattern = re.compile(r'[\u0900-\u097F]')

# Canonical subjects and their exact Kannada counterpart from knowledge_graph.json
# Let's inspect knowledge_graph.json root subjects:
with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

files = [
    'src/data/upsc_pyq/pc/hk_dar_pc_2026_sept.json',
    'src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json'
]

print("=== CHECKING CANONICAL SUBJECT PAIRS & DEVANAGARI ===")
for fname in files:
    with open(fname, 'r', encoding='utf-8') as f:
        data = json.load(f)
    print(f"\nChecking {fname}: {len(data)} items")
    for q in data:
        qnum = q['question_number']
        subj = q.get('subject', '')
        subj_kn = q.get('subject_kannada', '')
        dom = q.get('domain', '')
        dom_kn = q.get('domain_kannada', '')
        sub_t = q.get('sub_topic', '')
        sub_t_kn = q.get('sub_topic_kannada', '')
        nid = q.get('node_id', '')
        tags = q.get('tags', [])
        
        # Check devanagari
        for fld, val in [('subject_kannada', subj_kn), ('domain_kannada', dom_kn), ('sub_topic_kannada', sub_t_kn)]:
            if devanagari_pattern.search(val):
                print(f"  [Devanagari Error] Q{qnum} {fld}: {val}")
                
        # Check node_id
        if nid not in nodes:
            print(f"  [Invalid Node] Q{qnum} node_id: {nid}")
            
        # Check tag
        if subj not in tags:
            print(f"  [Tag Error] Q{qnum} subject '{subj}' not in tags: {tags}")
            
        # Check empty
        for fld, val in [('subject', subj), ('subject_kannada', subj_kn), ('domain', dom), 
                         ('domain_kannada', dom_kn), ('sub_topic', sub_t), ('sub_topic_kannada', sub_t_kn), ('node_id', nid)]:
            if not val or not str(val).strip():
                print(f"  [Empty Error] Q{qnum} {fld} is empty!")

print("\n=== UNIQUE SUBJECT PAIRS IN DATASETS ===")
for fname in files:
    with open(fname, 'r', encoding='utf-8') as f:
        data = json.load(f)
    pairs = set((q['subject'], q['subject_kannada']) for q in data)
    print(f"\n{fname} Subject pairs:")
    for eng, kn in sorted(pairs):
        print(f"  '{eng}' -> '{kn}'")
