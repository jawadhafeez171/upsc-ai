import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/kas_aug_p1_2024.json', 'r', encoding='utf-8') as f:
    kas = json.load(f)

for i in range(5):
    q = kas[i]
    print(f"Q{q['question_number']}:")
    print(f"  subject: {q['subject']}")
    print(f"  domain: {q['domain']}")
    print(f"  node_id: {q['node_id']}")
    print(f"  tags: {q['tags']}")

print("\n--- NHK Current Sample Tags ---")
with open('src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json', 'r', encoding='utf-8') as f:
    nhk = json.load(f)
for i in range(5):
    print(f"Q{nhk[i]['question_number']}: tags: {nhk[i]['tags']}")

print("\n--- HK Current Sample Tags ---")
with open('src/data/upsc_pyq/pc/hk_dar_pc_2026_sept.json', 'r', encoding='utf-8') as f:
    hk = json.load(f)
for i in range(5):
    print(f"Q{hk[i]['question_number']}: tags: {hk[i]['tags']}")
