import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/pc/2007_q001-100.json', encoding='utf-8') as f:
    questions = json.load(f)

years = set(q.get('year') for q in questions)
exam_names = set(q.get('exam_name') for q in questions)
tags = set(t for q in questions for t in q.get('tags', []))

print("Years found in 2007_q001-100.json:", years)
print("Exam names:", exam_names)
print("Sample tags:", list(tags)[:15])

# Print question 32, 55, 65, 71
for num in [1, 2, 7, 9, 10, 32, 55, 65, 71]:
    q = questions[num - 1]
    print(f"\nQ{num} (Year: {q.get('year')}, Exam: {q.get('exam_name')}):")
    print(f"EN: {q.get('question_english')}")
    print(f"KN: {q.get('question_kannada')}")
