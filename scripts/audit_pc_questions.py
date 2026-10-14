import json
import glob
import sys
import os

sys.stdout.reconfigure(encoding='utf-8')

# Load Knowledge Graph
with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})
print(f"Master KG Loaded: {len(nodes)} nodes.")

target_file = 'src/data/pc/2007_q001-100.json'
with open(target_file, encoding='utf-8') as f:
    questions = json.load(f)

print(f"\n--- AUDITING {target_file} ({len(questions)} questions) ---")

invalid_node_ids = []
subject_mismatches = []
flagged_content = []

for q in questions:
    qnum = q.get('question_number')
    nid = q.get('node_id')
    subj = q.get('subject')
    domain = q.get('domain')
    qtext = q.get('question_english', '')
    exp = q.get('explanation_english', '')
    
    # 1. Invalid node_id
    if not nid or nid not in nodes:
        invalid_node_ids.append((qnum, nid, subj, qtext[:60]))
        continue
        
    node_obj = nodes[nid]
    subj_id = node_obj.get('subjectId')
    root_node = nodes.get(subj_id, {})
    canonical_subj = root_node.get('name')
    
    # 2. Subject mismatch
    if canonical_subj and canonical_subj != subj:
        subject_mismatches.append((qnum, nid, subj, canonical_subj, qtext[:60]))

    # 3. Content heuristic checks
    qtext_lower = (qtext + " " + exp).lower()
    
    # Kannada literature / poets / culture misclassified as Science / Tech / Geography
    lit_keywords = ['raitha geethe', 'kuvempu', 'shivarama karanth', 'masti venkatesh', 'kambar', 'bendre', 'jnanpith', 'ranna', 'pampa', 'poet', 'composed', 'novel', 'kavirajamarga']
    if any(k in qtext_lower for k in lit_keywords):
        if subj not in ['Art, Culture & Heritage', 'History']:
            flagged_content.append((qnum, f"Literature/Culture in '{subj}'", nid, qtext[:70]))

print(f"Invalid node_ids: {len(invalid_node_ids)}")
for qnum, nid, subj, txt in invalid_node_ids:
    print(f"  Q{qnum}: invalid nid '{nid}' | Subj: {subj} | {txt}")

print(f"\nSubject mismatches with KG root: {len(subject_mismatches)}")
for qnum, nid, subj, canon, txt in subject_mismatches[:15]:
    print(f"  Q{qnum}: Subj '{subj}' != KG Root '{canon}' (node: {nid})")

print(f"\nFlagged content misclassifications: {len(flagged_content)}")
for qnum, reason, nid, txt in flagged_content:
    print(f"  Q{qnum}: {reason} | Node: {nid} | {txt}")
