import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

# Check 2012 APFC questions
apfc_2012 = [q for q in questions if q.get('year') == 2012]
print(f"2012 APFC total questions: {len(apfc_2012)}")

# Let's see the first 25 questions and last 25 questions of 2012 APFC
print("\n--- 2012 APFC Q1 to Q20 ---")
for q in apfc_2012[:20]:
    print(f"Q{q['question_number']}: {q['question_english'][:100]}")

print("\n--- 2012 APFC Q21 to Q40 ---")
for q in apfc_2012[20:40]:
    print(f"Q{q['question_number']}: {q['question_english'][:100]}")

print("\n--- 2012 APFC Q80 to Q100 ---")
for q in apfc_2012[80:100]:
    print(f"Q{q['question_number']}: {q['question_english'][:100]}")
