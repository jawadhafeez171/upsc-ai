import sys, json, os

sys.stdout.reconfigure(encoding='utf-8')

for fname in os.listdir('src/data'):
    if fname.startswith('kas_') and fname.endswith('.json'):
        path = os.path.join('src/data', fname)
        with open(path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        subjs = set(q.get('subject') for q in data if q.get('subject'))
        has_node = sum(1 for q in data if q.get('node_id'))
        print(f"{fname}: {len(data)} qs, subjects: {len(subjs)}, with node_id: {has_node}")
        print("   sample subjects:", sorted(list(subjs))[:5])
