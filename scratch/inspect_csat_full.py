import json

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    data = json.load(f)

for q in data:
    qe = q.get('question_english', '')
    if 'Passage' in qe or 'Directions' in qe:
        qh = q.get('question_hindi', '')
        qn = q.get('question_number')
        has_hi_passage = 'गद्यांश' in qh or 'निर्देश' in qh or 'Passage' in qh
        print(f"Q{qn}: EN has passage, HI has passage: {has_hi_passage}")
