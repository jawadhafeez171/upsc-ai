import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/pc/2007_q001-100.json', encoding='utf-8') as f:
    questions = json.load(f)

start = int(sys.argv[1]) if len(sys.argv) > 1 else 1
end = int(sys.argv[2]) if len(sys.argv) > 2 else 25

for q in questions[start-1:end]:
    qn = q['question_number']
    print(f"==================== Q{qn} ====================")
    print(f"EN: {q.get('question_english')}")
    print(f"KN: {q.get('question_kannada')}")
    print(f"O1: {q.get('option_1_english')} | {q.get('option_1_kannada')}")
    print(f"O2: {q.get('option_2_english')} | {q.get('option_2_kannada')}")
    print(f"O3: {q.get('option_3_english')} | {q.get('option_3_kannada')}")
    print(f"O4: {q.get('option_4_english')} | {q.get('option_4_kannada')}")
    print(f"Key: {q.get('key_answer')}")
    print(f"Current Subj: {q.get('subject')} | Node: {q.get('node_id')}")
