import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/upsc_pyq/2011.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

print(f"Total questions in 2011: {len(data)}")
for q in data:
    q_num = q.get('question_number')
    txt = q.get('question_english', '')[:85].replace('\n', ' ')
    print(f"Q{q_num:02d}: {txt}...")
