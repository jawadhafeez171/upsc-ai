import json
import glob
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg['nodes']

files = sorted(glob.glob('src/data/pc/*.json'))

print(f"{'Filename':38s} | {'Total':5s} | {'Invalid':7s} | {'SubjMis':7s} | {'ISRO':5s} | {'IS_Mand':7s}")
print("-" * 80)

for fpath in files:
    fname = os.path.basename(fpath)
    if fname == 'knowledge_graph.json':
        continue
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    if not isinstance(data, list):
        continue
    
    tot = len(data)
    inv = 0
    mis = 0
    isro = 0
    mand = 0
    
    for q in data:
        nid = q.get('node_id')
        subj = q.get('subject')
        if not nid or nid not in nodes:
            inv += 1
        else:
            subj_id = nodes[nid].get('subjectId')
            root_subj = nodes.get(subj_id, {}).get('name')
            if root_subj and root_subj != subj:
                mis += 1
        if nid == 'science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions':
            isro += 1
        if nid == 'internal_security.security_forces_intelligence_agencies_statutory_mandates':
            mand += 1
            
    print(f"{fname:38s} | {tot:5d} | {inv:7d} | {mis:7d} | {isro:5d} | {mand:7d}")
