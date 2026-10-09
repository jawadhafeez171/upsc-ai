# -*- coding: utf-8 -*-
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

print(f"Total: {len(questions)}")

# Check questions currently mapped to Indian Economy
economy_qs = [q for q in questions if q.get('subject') == 'Indian Economy & Development']
print(f"Mapped to Economy: {len(economy_qs)}")

# Print 20 sample economy questions to see what they actually are
for i, q in enumerate(economy_qs[:30]):
    print(f"\n[{i+1}] {q.get('exam_name')} {q.get('year')} Q{q.get('question_number')}:")
    print(f"Text: {q.get('question_english')[:150]}")
    print(f"Key Answer: {q.get('key_answer')}")
