import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('scratch/audit_mapping_results.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

for q in data['questions']:
    print(f"[{q['file']} Q{q['q_num']}] Node: {q['node_id'].split('.')[-1]}")
    print(f"   Subtopic: {q['sub_topic']}")
    print(f"   Text: {q['question_en'][:90]}...")
    print()
