import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

# Inspect all questions assigned to International Relations
ir_qs = [q for q in questions if q['subject'] == 'International Relations & Global Institutions']
print(f"Total IR questions: {len(ir_qs)}")
for q in ir_qs:
    print(f"[{q['year']} #{q['question_number']}] {q['question_english'][:100]} (Node: {q['node_id']})")
