# -*- coding: utf-8 -*-
"""
Audits the 1,060 questions in src/data/epfo/epfo-all-papers.json
"""
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

print(f"Total questions loaded: {len(questions)}")

papers = {}
for q in questions:
    p_key = f"{q.get('exam_name')} - {q.get('year')} {q.get('month') or ''}".strip()
    papers[p_key] = papers.get(p_key, 0) + 1

for p, count in papers.items():
    print(f"  {p}: {count} questions")
