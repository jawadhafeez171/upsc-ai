import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json', 'r', encoding='utf-8') as f:
    nhk = json.load(f)

for q in nhk:
    qnum = q['question_number']
    q_en = q['question_english'].split('\n')[0][:70]
    tags = q.get('tags', [])
    print(f"NHK Q{qnum:3d} | S: {q.get('subject', ''):20s} | D: {q.get('domain', ''):25s} | Q: {q_en} | Tags: {tags[2:]}")
