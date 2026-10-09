import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

sci_qs = [q for q in questions if q['subject'] == 'Science, Technology & Defence']
print(f"Total Science, Technology & Defence questions: {len(sci_qs)}")
for q in sci_qs[:20]:
    print(f"[{q['year']} #{q['question_number']}] {q['question_english'][:100]} (Node: {q['node_id']})")
