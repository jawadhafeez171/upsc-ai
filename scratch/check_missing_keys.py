import json

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

missing_keys = [q for q in questions if not q.get('key_answer') or str(q.get('key_answer')).strip() == '']
print(f"Total missing key answers: {len(missing_keys)}")
for q in missing_keys:
    print(f"\n[{q['year']} #{q['question_number']}] {q['question_english'][:100]}")
    print(f"  Explanation: {q.get('explanation_english')[:120]}")
    print(f"  Options: A: {q.get('option_a_english')[:40]} | B: {q.get('option_b_english')[:40]} | C: {q.get('option_c_english')[:40]} | D: {q.get('option_d_english')[:40]}")
