import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/pc/2007_q001-100.json', encoding='utf-8') as f:
    questions = json.load(f)

print(f"Total questions: {len(questions)}")
for q in questions:
    qn = q.get('question_number')
    cur_subj = q.get('subject')
    cur_nid = q.get('node_id')
    qtext = q.get('question_english', '')
    print(f"[{qn:3d}] ({cur_subj}) [{cur_nid}] :: {qtext[:80]}")
