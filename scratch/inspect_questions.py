import sys, json

sys.stdout.reconfigure(encoding='utf-8')

def inspect_file(path, name):
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    print(f"=== {name} ({len(data)} questions) ===")
    for i, q in enumerate(data):
        qnum = q['question_number']
        subj = q.get('subject') or '[EMPTY]'
        dom = q.get('domain') or '[EMPTY]'
        subt = q.get('sub_topic') or '[EMPTY]'
        nid = q.get('node_id') or '[EMPTY]'
        tags = q.get('tags', [])
        q_en = q.get('question_english', '')[:80].replace('\n', ' ')
        print(f"Q{qnum:3d} | S: {subj[:20]:20s} | D: {dom[:20]:20s} | Tags: {tags[:3]} | Q: {q_en}")

print("INSPECTING HK:")
inspect_file('src/data/upsc_pyq/pc/hk_dar_pc_2026_sept.json', 'HK DAR PC')

print("\nINSPECTING NHK:")
inspect_file('src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json', 'NHK DAR PC')
