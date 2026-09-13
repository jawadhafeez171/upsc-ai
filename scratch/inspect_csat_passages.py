import json

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    data = json.load(f)

count = 0
for q in data:
    qe = q.get('question_english', '')
    if any(k in qe.lower() for k in ['passage', 'directions']):
        count += 1
        if count <= 8:
            print(f"=== Q{q.get('question_number')} ===")
            lines = [l for l in qe.split('\n') if l.strip()]
            print('\n'.join(lines[:6]))
            print('...')
print('Total matching questions:', count)
