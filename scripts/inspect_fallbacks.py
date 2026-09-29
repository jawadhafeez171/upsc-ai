import glob
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

files = sorted(glob.glob('src/data/upsc_capf/*.json'))
fallbacks = []
for f in files:
    data = json.load(open(f, encoding='utf-8'))
    for q in data:
        if 'General Scientific Principles & Everyday Applications' in q.get('sub_topic', ''):
            fallbacks.append(q)

print(f"Total fallbacks: {len(fallbacks)}")
for i, q in enumerate(fallbacks):
    print(f"=== [{i+1}] ({q.get('year')} Q{q.get('question_number')}) ===")
    print(q.get('question_english'))
    opts = [f"{opt.get('identifier')}. {opt.get('text')}" for opt in q.get('options', [])]
    print("Options:", " | ".join(opts))
    print()

