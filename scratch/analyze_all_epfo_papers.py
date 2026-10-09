# -*- coding: utf-8 -*-
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

papers = {}
for q in questions:
    p_name = f"{q.get('exam_name')} {q.get('year')}"
    papers.setdefault(p_name, []).append(q)

for p_name, qs in papers.items():
    print(f"=== {p_name} ({len(qs)} Qs) ===")
    # Look at Q1-Q5, Q20, Q21, Q30, Q50, Q100
    for q in qs:
        qn = q.get('question_number')
        txt = (q.get('question_english') or '')[:70]
        pass_txt = (q.get('passage_english') or '')[:60]
        if qn in [1, 15, 20, 21, 25, 30, 31, 50, 75, 100, 120]:
            print(f"  Q{qn}: [Passage: {pass_txt}] {txt}")
