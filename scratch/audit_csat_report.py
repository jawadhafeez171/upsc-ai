import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

valid_nids = set(kg['nodes'].keys())
csat_dir = 'src/data/upsc_pyq/csat'
files = sorted([f for f in os.listdir(csat_dir) if f.endswith('.json')])

total_all = 0
valid_all = 0
invalid_all = 0
empty_all = 0
cite_all = 0

domain_counts = {}

header = f"{'File':^16} | {'Total':^6} | {'Valid NIDs':^10} | {'Invalid':^8} | {'Empty':^6} | {'Cite Tags':^10}"
divider = "=" * len(header)

print(divider)
print(header)
print(divider)

for f in files:
    fp = os.path.join(csat_dir, f)
    with open(fp, 'r', encoding='utf-8') as jf:
        data = json.load(jf)
    tot = len(data)
    emp = sum(1 for q in data if not q.get('node_id'))
    inv = sum(1 for q in data if q.get('node_id') and q.get('node_id') not in valid_nids)
    val = sum(1 for q in data if q.get('node_id') in valid_nids)
    cites = sum(1 for q in data if any(isinstance(v, str) and '[cite' in v for v in q.values()))
    
    total_all += tot
    valid_all += val
    invalid_all += inv
    empty_all += emp
    cite_all += cites
    
    for q in data:
        dom = q.get('domain', 'Unknown')
        domain_counts[dom] = domain_counts.get(dom, 0) + 1
        
    print(f"{f:^16} | {tot:^6} | {val:^10} | {inv:^8} | {emp:^6} | {cites:^10}")

print(divider)
summary = f"{'TOTAL':^16} | {total_all:^6} | {valid_all:^10} | {invalid_all:^8} | {empty_all:^6} | {cite_all:^10}"
print(summary)
print(divider)

print("\nDomain Breakdown Across CSAT:")
for dom, count in sorted(domain_counts.items(), key=lambda x: -x[1]):
    print(f"  - {dom}: {count} questions ({count/total_all*100:.1f}%)")
