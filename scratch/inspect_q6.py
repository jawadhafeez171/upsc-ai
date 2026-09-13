import json

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    data = json.load(f)

for q in data:
    if q['question_number'] == 6:
        print("================== Q6 ENGLISH ==================")
        print(q['question_english'])
