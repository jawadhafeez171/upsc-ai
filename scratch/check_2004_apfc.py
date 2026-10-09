import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    qs = [q for q in json.load(f) if q.get('year') == 2004]

print("--- 2004 APFC Q26 to Q60 ---")
for q in qs[25:60]:
    txt = q.get('question_english') or ''
    print(f"Q{q['question_number']}: {txt[:85]}...")

print("\n--- 2004 APFC Q61 to Q90 ---")
for q in qs[60:90]:
    txt = q.get('question_english') or ''
    print(f"Q{q['question_number']}: {txt[:85]}...")

print("\n--- 2004 APFC Q91 to Q120 ---")
for q in qs[90:]:
    txt = q.get('question_english') or ''
    print(f"Q{q['question_number']}: {txt[:85]}...")
