import json

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    qs = json.load(f)

by_paper = {}
for q in qs:
    p = f"{q.get('year')}_{q.get('exam_name')}"
    by_paper.setdefault(p, []).append(q)

for p, list_q in sorted(by_paper.items()):
    print(f'{p}: {len(list_q)} questions')
