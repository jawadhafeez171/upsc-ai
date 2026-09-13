import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json', 'r', encoding='utf-8') as f:
    nhk = json.load(f)

for q in nhk[:25]:
    qnum = q['question_number']
    q_en = q['question_english'].split('\n')[0][:75]
    print(f"NHK Q{qnum:2d} | S: {q.get('subject'):15s} | D: {q.get('domain'):25s} | {q_en}")
