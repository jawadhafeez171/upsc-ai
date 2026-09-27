import json
import glob
import os

pyq_files = glob.glob("src/data/upsc_pyq/*.json") + glob.glob("src/data/kas_*.json")

mapping_questions = []
geography_questions = []

for fpath in pyq_files:
    fname = os.path.basename(fpath)
    if "key" in fname or "explanations" in fname:
        continue
    try:
        with open(fpath, "r", encoding="utf-8") as f:
            data = json.load(f)
            if not isinstance(data, list):
                continue
            for idx, q in enumerate(data):
                nid = q.get("node_id", "") or ""
                subj = q.get("subject", "") or ""
                dom = q.get("domain", "") or ""
                tags = q.get("tags", []) or []
                
                is_geo = "geography" in nid.lower() or "geography" in subj.lower()
                is_map = "mapping" in nid.lower() or "mapping" in dom.lower() or any("mapping" in str(t).lower() for t in tags)
                
                if is_geo:
                    geography_questions.append((fname, q.get("question_number", idx+1), nid, q.get("sub_topic", "")))
                if is_map:
                    mapping_questions.append({
                        "file": fname,
                        "q_num": q.get("question_number", idx+1),
                        "node_id": nid,
                        "subject": subj,
                        "domain": dom,
                        "sub_topic": q.get("sub_topic", ""),
                        "question_en": (q.get("question_english", "") or q.get("text", ""))[:120]
                    })
    except Exception as e:
        print(f"Error reading {fpath}: {e}")

print(f"Total Geography Questions found: {len(geography_questions)}")
print(f"Total Mapping Questions found: {len(mapping_questions)}")

# Unique mapping node_ids
mapping_nids = set(m["node_id"] for m in mapping_questions)
print(f"\nUnique Mapping Node IDs ({len(mapping_nids)}):")
for n in sorted(mapping_nids):
    count = sum(1 for m in mapping_questions if m["node_id"] == n)
    print(f" - [{count} qs] {n}")

with open("scratch/audit_mapping_results.json", "w", encoding="utf-8") as f:
    json.dump({
        "total_geo": len(geography_questions),
        "total_mapping": len(mapping_questions),
        "questions": mapping_questions
    }, f, indent=2, ensure_ascii=False)
