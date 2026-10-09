import json

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    qs = [q for q in json.load(f) if q.get('year') == 2012]

for q in qs[69:90]:
    print(f"Q{q['question_number']}: {q['question_english'][:90]}")
