import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/upsc_pyq/pc/hk_dar_pc_2026_sept.json', 'r', encoding='utf-8') as f:
    hk = json.load(f)

for q in hk:
    qnum = q['question_number']
    q_en = q['question_english'].split('\n')[0][:100]
    tags = q.get('tags', [])
    print(f"HK Q{qnum:3d}: {q_en} | existing_tags: {tags[2:]}")
