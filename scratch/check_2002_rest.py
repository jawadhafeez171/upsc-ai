import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    qs = [q for q in json.load(f) if q.get('year') == 2002]

print("--- 2002 APFC Q55 to Q120 ---")
for q in qs[54:]:
    txt = q.get('question_english') or ''
    print(f"Q{q['question_number']}: {txt[:85]}...")
