import json

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    qs = [q for q in json.load(f) if q.get('year') == 2002]

print("--- 2002 APFC Q31 to Q60 ---")
for q in qs[30:60]:
    print(f"Q{q['question_number']}: {q['question_english'][:90]}")

print("\n--- 2002 APFC Q61 to Q90 ---")
for q in qs[60:90]:
    print(f"Q{q['question_number']}: {q['question_english'][:90]}")

print("\n--- 2002 APFC Q91 to Q120 ---")
for q in qs[90:120]:
    print(f"Q{q['question_number']}: {q['question_english'][:90]}")
