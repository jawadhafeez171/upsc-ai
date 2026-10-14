import json
import sys
from collections import Counter

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/pc/2007_q001-100.json', encoding='utf-8') as f:
    questions = json.load(f)

node_counts = Counter(q.get('node_id') for q in questions)
print("Node ID counts in 2007_q001-100.json:")
for nid, count in node_counts.most_common(20):
    print(f"  {count}x: {nid}")

print("\n--- Listing all questions mapped to ISRO missions ---")
for q in questions:
    if 'indian_space_programme_isro_missions' in q.get('node_id', ''):
        print(f"  Q{q['question_number']}: {q.get('question_english', '')[:80]}")
