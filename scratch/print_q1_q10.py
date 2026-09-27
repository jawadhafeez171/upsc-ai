import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/upsc_pyq/2011.json', 'r', encoding='utf-8') as f:
    d = json.load(f)

for i in range(10):
    q = d[i]
    print(f"=== Q{q['question_number']} ===")
    print(q['question_english'])
    print(f"Key: {q['key_answer']}\n")
