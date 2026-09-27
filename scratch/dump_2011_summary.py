import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/upsc_pyq/2011.json', 'r', encoding='utf-8') as f:
    d = json.load(f)

for q in d:
    num = q['question_number']
    en = q['question_english'][:90].replace('\n', ' ')
    print(f"Q{num:02d}: {en}...")
