import json
import os

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

valid_nids = set(kg['nodes'].keys())

total_all = 0
valid_all = 0
invalid_all = 0
empty_all = 0
mapping_all = 0

header = f"{'Year':^6} | {'Total':^6} | {'Valid NIDs':^10} | {'Invalid':^8} | {'Empty':^6} | {'Mapping Qs':^10}"
divider = "=" * len(header)

print(divider)
print(header)
print(divider)

year_details = {}

for year in range(2011, 2026):
    path = f'src/data/upsc_pyq/{year}.json'
    if not os.path.exists(path):
        continue
    with open(path, 'r', encoding='utf-8') as f:
        pyq = json.load(f)
    
    total = len(pyq)
    empty = sum(1 for q in pyq if not q.get('node_id'))
    invalid = sum(1 for q in pyq if q.get('node_id') and q.get('node_id') not in valid_nids)
    valid = sum(1 for q in pyq if q.get('node_id') in valid_nids)
    mapping = sum(1 for q in pyq if q.get('is_mapping'))
    
    total_all += total
    valid_all += valid
    invalid_all += invalid
    empty_all += empty
    mapping_all += mapping
    
    map_categories = {}
    for q in pyq:
        if q.get('is_mapping'):
            mf = q.get('mapping', {})
            reg = mf.get('region', 'India')
            cat = mf.get('category', 'Physical')
            map_categories[f"{reg}-{cat}"] = map_categories.get(f"{reg}-{cat}", 0) + 1
            
    year_details[year] = map_categories
    print(f"{year:^6} | {total:^6} | {valid:^10} | {invalid:^8} | {empty:^6} | {mapping:^10}")

print(divider)
summary = f"{'TOTAL':^6} | {total_all:^6} | {valid_all:^10} | {invalid_all:^8} | {empty_all:^6} | {mapping_all:^10}"
print(summary)
print(divider)

print("\n--- Mapping Breakdown by Year ---")
for y, cats in year_details.items():
    cats_str = ", ".join([f"{k}: {v}" for k, v in cats.items()])
    print(f"{y} ({sum(cats.values())} Qs): {cats_str}")
