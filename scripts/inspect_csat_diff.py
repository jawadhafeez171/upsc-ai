import glob
import json
import os
import subprocess
import sys
from collections import Counter

sys.stdout.reconfigure(encoding='utf-8')

csat_files = sorted(glob.glob("src/data/upsc_pyq/csat/*.json"))
print(f"Total CSAT files found: {len(csat_files)}")

field_changes = Counter()
total_questions_audited = 0
total_questions_modified = 0

sample_modifications = []

for fpath in csat_files:
    fname = os.path.basename(fpath)
    
    with open(fpath, "r", encoding="utf-8") as f:
        curr_data = json.load(f)
        
    git_path = fpath.replace("\\", "/")
    git_show = subprocess.run(["git", "show", f"HEAD:{git_path}"], capture_output=True, text=True, encoding="utf-8")
    if git_show.returncode != 0:
        print(f"Could not read HEAD for {fname}")
        continue
    head_data = json.loads(git_show.stdout)
    
    head_by_qn = {q["question_number"]: q for q in head_data}
    curr_by_qn = {q["question_number"]: q for q in curr_data}
    
    total_questions_audited += len(curr_data)
    
    file_mods = 0
    for qn, curr_q in curr_by_qn.items():
        if qn in head_by_qn:
            head_q = head_by_qn[qn]
            diff_keys = []
            all_keys = set(list(curr_q.keys()) + list(head_q.keys()))
            for k in all_keys:
                if curr_q.get(k) != head_q.get(k):
                    diff_keys.append(k)
                    field_changes[k] += 1
            if diff_keys:
                file_mods += 1
                total_questions_modified += 1
                if len(sample_modifications) < 8:
                    sample_modifications.append({
                        "file": fname,
                        "qn": qn,
                        "diff_keys": diff_keys,
                        "old": {k: head_q.get(k) for k in diff_keys},
                        "new": {k: curr_q.get(k) for k in diff_keys}
                    })
    print(f"  {fname:18s}: {len(curr_data)} questions | {file_mods} questions modified")

print(f"\n==========================================")
print(f"Total questions audited: {total_questions_audited}")
print(f"Total questions modified: {total_questions_modified}")
print(f"Field changes frequency: {field_changes}")
print(f"==========================================\n")

print("--- Sample Detailed Modifications ---")
for s in sample_modifications:
    print(f"\nFile: {s['file']} | Q{s['qn']}")
    for k in s['diff_keys']:
        print(f"  Field [{k}]:")
        old_val = str(s['old'][k])
        new_val = str(s['new'][k])
        if len(old_val) > 80:
            old_val = old_val[:80] + "..."
        if len(new_val) > 80:
            new_val = new_val[:80] + "..."
        print(f"    OLD: {old_val}")
        print(f"    NEW: {new_val}")
