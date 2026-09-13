import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/upsc_pyq/pc/hk_dar_pc_2026_sept.json', 'r', encoding='utf-8') as f:
    hk = json.load(f)

for q in hk[:25]:
    qnum = q['question_number']
    q_en = q['question_english'].split('\n')[0][:80]
    q_kn = q['question_kannada'].split('\n')[0][:80]
    ans = q['key_answer']
    exp = q['explanation_english'].split('\n')[0][:80]
    tags = q.get('tags', [])
    print(f"--- Q{qnum} ---")
    print(f"EN: {q_en}")
    print(f"KN: {q_kn}")
    print(f"Tags: {tags}")
