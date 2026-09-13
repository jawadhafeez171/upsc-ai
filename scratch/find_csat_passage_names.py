import json
import re

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    data = json.load(f)

for q in data:
    qe = q.get('question_english', '')
    if 'Passage' in qe:
        match = re.search(r'(Passage\s*[-–]\s*\d+)', qe, re.IGNORECASE)
        passage_id = match.group(1) if match else 'None'
        print(f"Q{q['question_number']}: {passage_id}")
