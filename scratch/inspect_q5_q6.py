import json

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    data = json.load(f)

for q in data:
    if q['question_number'] in [5, 6]:
        print(f"================== Q{q['question_number']} ENGLISH ==================")
        print(q['question_english'])
        print(f"================== Q{q['question_number']} HINDI ==================")
        print(q['question_hindi'])
