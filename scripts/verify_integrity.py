import glob
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

files = sorted(glob.glob('src/data/upsc_capf/*.json'))
assert len(files) == 13, f"Expected 13 files, found {len(files)}"
total = 0
for f in files:
    d = json.load(open(f, encoding='utf-8'))
    assert len(d) == 125, f"{f} has {len(d)} questions, expected 125"
    total += len(d)
    for q in d:
        for k in ['node_id', 'subject', 'subject_hindi', 'domain', 'domain_hindi', 'sub_topic', 'sub_topic_hindi', 'tags']:
            val = q.get(k)
            assert val, f"Missing or empty {k} in {f} Q{q.get('question_number')}"

print(f"Sanity verification passed: {len(files)} files, {total} questions all valid, non-empty, and intact.")
