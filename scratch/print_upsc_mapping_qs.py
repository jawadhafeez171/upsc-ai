import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('scratch/audit_mapping_results.json', 'r', encoding='utf-8') as f:
    data = json.load(f)

upsc_qs = [q for q in data['questions'] if q['file'].startswith('20')]
print(f"Total UPSC Mapping questions in audit: {len(upsc_qs)}")
for q in upsc_qs:
    print(f"[{q['file']} Q{q['q_num']}] {q['node_id']} | Subtopic: {q['sub_topic']}")
    print(f"   Text: {q['question_en'][:80]}...")
