import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

papers = {}
for q in questions:
    p = f"{q['year']} {q['exam_name']}"
    papers.setdefault(p, []).append(q)

for p, qs in sorted(papers.items()):
    print(f"\n=======================================================")
    print(f"PAPER: {p} ({len(qs)} questions)")
    print(f"=======================================================")
    # Print first 5 and last 5 questions
    print("First 3 questions:")
    for q in qs[:3]:
        print(f"  Q{q['question_number']}: {q['question_english'][:90]}...")
    print("Middle 3 questions:")
    for q in qs[len(qs)//2 : len(qs)//2 + 3]:
        print(f"  Q{q['question_number']}: {q['question_english'][:90]}...")
    print("Last 3 questions:")
    for q in qs[-3:]:
        print(f"  Q{q['question_number']}: {q['question_english'][:90]}...")
