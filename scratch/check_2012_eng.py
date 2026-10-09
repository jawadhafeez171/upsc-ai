import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)
kg_nodes = master_kg['nodes']

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

print(f"Total questions: {len(questions)}")
print(f"Total KG nodes: {len(kg_nodes)}")

# Let's inspect the English questions in 2012 APFC
q_2012 = [q for q in questions if q.get('year') == 2012]
print("\n--- 2012 APFC English Questions Check ---")
for q in q_2012:
    qn = q.get('question_number')
    txt = (q.get('question_english') or '') + ' ' + (q.get('passage_english') or '')
    if any(k in txt.lower() for k in ['opposite of', 'closest in meaning', 'according to the author', 'author']):
        print(f"Q{qn}: {txt[:80]}")
