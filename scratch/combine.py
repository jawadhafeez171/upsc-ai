# -*- coding: utf-8 -*-
import os

with open('scratch/prepare_nhk.py', 'r', encoding='utf-8') as f:
    text = f.read()

start_idx = text.find('NHK_MAP = {')
end_idx = text.find('\nprint(f"NHK_MAP count:')
nhk_map_code = text[start_idx:end_idx]

print(f"Extracted NHK_MAP: {len(nhk_map_code)} chars")
with open('scripts/enrich_pc_pyq.py', 'r', encoding='utf-8') as f:
    enrich_code = f.read()

enrich_logic = """

# --- ENRICHMENT LOGIC & WRITING TO DISK ---

def enrich_dataset(file_path, mapping_dict, dataset_name):
    print(f"\\nEnriching {dataset_name} ({file_path})...")
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    assert len(data) == 100, f"Expected 100 questions, got {len(data)}"
    
    for item in data:
        qnum = item.get('question_number')
        if qnum not in mapping_dict:
            raise KeyError(f"Question {qnum} not in mapping dictionary!")
        
        m = mapping_dict[qnum]
        
        # Validate node_id
        nid = m['node_id']
        if nid not in nodes:
            raise ValueError(f"Invalid node_id for Q{qnum}: {nid}")
        
        item['subject'] = m['subject']
        item['subject_kannada'] = m['subject_kannada']
        item['domain'] = m['domain']
        item['domain_kannada'] = m['domain_kannada']
        item['sub_topic'] = m['sub_topic']
        item['sub_topic_kannada'] = m['sub_topic_kannada']
        item['node_id'] = m['node_id']
        
        if 'tags' not in item or not isinstance(item['tags'], list):
            item['tags'] = []
            
        # Ensure canonical subject tag is present
        subj_tag = m['subject_tag']
        if subj_tag not in item['tags']:
            item['tags'].append(subj_tag)
            
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
        f.write('\\n')
        
    print(f"Successfully enriched and saved {dataset_name}: {len(data)} questions.")

HK_FILE = os.path.join('src', 'data', 'upsc_pyq', 'pc', 'hk_dar_pc_2026_sept.json')
NHK_FILE = os.path.join('src', 'data', 'upsc_pyq', 'pc', 'nhk_dar_pc_2026_sept.json')

enrich_dataset(HK_FILE, HK_MAP, "HK DAR PC Sept 2026")
enrich_dataset(NHK_FILE, NHK_MAP, "NHK DAR PC Sept 2026")

print("\\n--- VALIDATION PASS ---")
for name, fpath in [("HK", HK_FILE), ("NHK", NHK_FILE)]:
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    print(f"Verifying {name} ({len(data)} items)...")
    assert len(data) == 100
    subject_counts = {}
    for item in data:
        qnum = item['question_number']
        for field in ['subject', 'subject_kannada', 'domain', 'domain_kannada', 'sub_topic', 'sub_topic_kannada', 'node_id']:
            val = item.get(field)
            assert val and str(val).strip(), f"{name} Q{qnum} missing field {field}"
        
        assert item['node_id'] in nodes, f"{name} Q{qnum} node_id {item['node_id']} not in KG"
        assert item['subject'] in item['tags'], f"{name} Q{qnum} subject not in tags"
        
        subj = item['subject']
        subject_counts[subj] = subject_counts.get(subj, 0) + 1
        
    print(f"{name} Subject Distribution:")
    for subj, cnt in sorted(subject_counts.items(), key=lambda x: -x[1]):
        print(f"  - {subj}: {cnt}")

print("\\nALL VERIFICATIONS PASSED 100%!")
"""

full_script = enrich_code.rstrip() + "\n\n# --- NHK 2026 DAR PC MAPPINGS (1-100) ---\n" + nhk_map_code + "\n" + enrich_logic

with open('scripts/enrich_pc_pyq.py', 'w', encoding='utf-8') as f:
    f.write(full_script)

print("Updated scripts/enrich_pc_pyq.py written successfully!")
