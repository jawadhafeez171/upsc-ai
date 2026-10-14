import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/pc/2007_q001-100.json', encoding='utf-8') as f:
    questions = json.load(f)

print("--- Listing all questions mapped to internal_security ---")
for q in questions:
    if 'security_forces_intelligence_agencies_statutory_mandates' in q.get('node_id', ''):
        print(f"  Q{q['question_number']}: {q.get('question_english', '')[:85]}")
