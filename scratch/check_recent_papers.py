import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

for yr in [2016, 2017, 2021, 2023, 2025]:
    paper_qs = [q for q in questions if q.get('year') == yr]
    print(f"\n=======================================================")
    print(f"YEAR {yr} (Total: {len(paper_qs)} questions)")
    print(f"=======================================================")
    # Print distinct exam names
    exams = set(q['exam_name'] for q in paper_qs)
    for exam in sorted(exams):
        eqs = [q for q in paper_qs if q['exam_name'] == exam]
        print(f"Exam: {exam} ({len(eqs)} questions)")
        # Sample questions
        for q in eqs[20:25]:
            print(f"  Q{q['question_number']}: {q['question_english'][:85]}...")
