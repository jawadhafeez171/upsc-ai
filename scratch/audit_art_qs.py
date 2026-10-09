import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

# Inspect all questions assigned to Art, Culture & Heritage
art_qs = [q for q in questions if q['subject'] == 'Art, Culture & Heritage']
print(f"Total Art, Culture & Heritage questions: {len(art_qs)}")
for q in art_qs:
    print(f"[{q['year']} #{q['question_number']}] {q['question_english'][:100]} (Node: {q['node_id']})")
