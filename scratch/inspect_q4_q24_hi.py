import json

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    data = json.load(f)

for q in data:
    if q['question_number'] in [4, 24]:
        print(f"=== Q{q['question_number']} ===")
        lines = [l.strip() for l in q['question_hindi'].split('\n') if l.strip()]
        for l in lines[-4:]:
            print(repr(l))
