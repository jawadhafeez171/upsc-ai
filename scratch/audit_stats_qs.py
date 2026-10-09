import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', encoding='utf-8') as f:
    questions = json.load(f)

# Inspect all questions assigned to Applied Statistics
stats_qs = [q for q in questions if q['subject'] == 'Applied Statistics']
print(f"Total Applied Statistics questions: {len(stats_qs)}")
for q in stats_qs:
    print(f"[{q['year']} #{q['question_number']}] {q['question_english'][:100]} (Node: {q['node_id']})")
