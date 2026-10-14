import json
import glob
import os
import sys
from collections import Counter

sys.stdout.reconfigure(encoding='utf-8')

pc_files = sorted(glob.glob('src/data/pc/*.json'))
print(f"Total PC JSON files found: {len(pc_files)}")

total_q = 0
overall_nodes = Counter()

file_fallbacks = {}

for fpath in pc_files:
    fname = os.path.basename(fpath)
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    
    total_q += len(data)
    isro_count = 0
    is_count = 0
    
    for q in data:
        nid = q.get('node_id', '')
        overall_nodes[nid] += 1
        if 'indian_space_programme_isro_missions' in nid:
            isro_count += 1
        if 'security_forces_intelligence_agencies_statutory_mandates' in nid:
            is_count += 1
            
    file_fallbacks[fname] = (len(data), isro_count, is_count)

print(f"Total questions across all files: {total_q}")
print("\nTop 10 most common node_ids across all PC files:")
for nid, c in overall_nodes.most_common(10):
    print(f"  {c:4d}x ({c/total_q*100:4.1f}%): {nid}")

print("\nFiles with suspicious fallback concentrations (ISRO or IS mandates):")
for fname, (tot, isro, sec) in file_fallbacks.items():
    if isro > 2 or sec > 5:
        print(f"  {fname:35s}: Total={tot}, ISRO={isro}, IS_Mandates={sec}")
