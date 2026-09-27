import json
import glob
import os
from test_reclassification import get_canonical_and_mapping, valid_nids

pyq_files = glob.glob('src/data/upsc_pyq/*.json') + glob.glob('src/data/kas_*.json')
invalid_count = 0
reclassified_count = 0

for fpath in pyq_files:
    fname = os.path.basename(fpath)
    if 'key' in fname or 'explanations' in fname:
        continue
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
        if not isinstance(data, list):
            continue
        for q in data:
            res = get_canonical_and_mapping(fname, q)
            if res:
                reclassified_count += 1
                nid = res['node_id']
                if nid not in valid_nids:
                    print(f"INVALID NODE_ID: {nid} in {fname} Q{q.get('question_number')}")
                    invalid_count += 1

print(f"Done testing! Total matched: {reclassified_count}, Invalid NIDs: {invalid_count}")
