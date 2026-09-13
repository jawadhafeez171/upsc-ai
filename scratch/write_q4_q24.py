import json

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    data = json.load(f)

with open('scratch/q4_q24_hi.txt', 'w', encoding='utf-8') as out:
    for q in data:
        if q['question_number'] in [4, 24]:
            out.write(f"=== Q{q['question_number']} ===\n")
            out.write(q['question_hindi'] + '\n\n')
