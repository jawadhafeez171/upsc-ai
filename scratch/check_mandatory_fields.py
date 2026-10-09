import json

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

missing_fields = {}
for q in questions:
    qn = q.get('question_number')
    yr = q.get('year')
    for field in ['question_english', 'option_a_english', 'option_b_english', 'option_c_english', 'option_d_english', 'key_answer', 'explanation_english', 'node_id', 'subject', 'domain', 'sub_topic']:
        val = q.get(field)
        if val is None or str(val).strip() == '':
            missing_fields.setdefault(field, []).append((yr, qn))

print("Missing fields check:")
for f, items in missing_fields.items():
    print(f"  Field '{f}': {len(items)} missing (Samples: {items[:3]})")

if not missing_fields:
    print("ALL 1,060 questions have 100% of required fields present and non-empty!")
