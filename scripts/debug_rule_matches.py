import json
import re
import sys
from classify_ksp_pc import RULES

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/pc/2007_q001-100.json', encoding='utf-8') as f:
    questions = json.load(f)

for qnum in [1, 5, 7, 9, 10, 12, 15, 27, 32, 33, 39, 44, 45, 55, 60, 61, 65, 71, 74, 82, 86, 95, 97]:
    q = questions[qnum - 1]
    text_corpus = f"{q.get('question_english', '')} {q.get('question_kannada', '')} {q.get('explanation_english', '')} {q.get('explanation_kannada', '')}"
    
    matches = []
    for idx, rule in enumerate(RULES):
        pattern, subj, dom, sub_t, sub_t_kn, nid, prio = rule
        m = re.findall(pattern, text_corpus, re.IGNORECASE)
        if m:
            matches.append((prio, subj, nid, m[:3]))
            
    matches.sort(key=lambda x: -x[0])
    print(f"\n--- Q{qnum}: {q.get('question_english', '')[:65]} ---")
    print(f"Current Node: {q.get('node_id')}")
    if matches:
        print(f"Highest Prio Match: {matches[0]}")
        if len(matches) > 1:
            print(f"Other Matches: {matches[1:3]}")
    else:
        print("NO RULES MATCHED (fell back to fallback)")
