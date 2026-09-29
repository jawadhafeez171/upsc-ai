import json
import glob
import sys
import os

sys.stdout.reconfigure(encoding='utf-8')

# Load Knowledge Graph
kg_path = 'src/data/knowledge_graph.json'
with open(kg_path, encoding='utf-8') as f:
    kg = json.load(f)

kg_nodes = kg.get('nodes', {})
print(f"Total KG nodes loaded: {len(kg_nodes)}")

# Check root subjects
root_subjects = kg.get('rootSubjectIds', [])
print(f"Root Subject IDs: {root_subjects}")

capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))
print(f"Total CAPF files: {len(capf_files)}")

total_questions = 0
invalid_node_ids = []
mismatched_subjects = []
node_id_stats = {}
subject_stats = {}

for fpath in capf_files:
    fname = os.path.basename(fpath)
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    
    for q in data:
        total_questions += 1
        node_id = q.get('node_id')
        subj = q.get('subject')
        dom = q.get('domain')
        sub = q.get('sub_topic')
        qnum = q.get('question_number')
        year = q.get('year')
        
        subject_stats[subj] = subject_stats.get(subj, 0) + 1
        node_id_stats[node_id] = node_id_stats.get(node_id, 0) + 1
        
        # Check if node_id exists in kg_nodes
        if not node_id:
            invalid_node_ids.append((fname, year, qnum, "EMPTY_NODE_ID", q.get('question_english', '')[:60]))
        elif node_id not in kg_nodes:
            invalid_node_ids.append((fname, year, qnum, node_id, q.get('question_english', '')[:60]))
        else:
            # Node exists, verify hierarchy
            node_obj = kg_nodes[node_id]
            # Check subject mapping
            # Root ancestor or subjectId
            node_subj_id = node_obj.get('subjectId')
            # Look up node_subj_id name
            root_node = kg_nodes.get(node_subj_id)
            if root_node and root_node.get('name') != subj:
                mismatched_subjects.append((fname, year, qnum, subj, root_node.get('name'), node_id))

print(f"\n--- AUDIT RESULTS ---")
print(f"Total questions inspected: {total_questions}")
print(f"Invalid / Unrecognized node_ids in KG: {len(invalid_node_ids)}")
if invalid_node_ids:
    print("\nSample Invalid node_ids (up to 20):")
    for item in invalid_node_ids[:20]:
        print(f"  {item[0]} (Year {item[1]} Q{item[2]}): node_id '{item[3]}' - {item[4]}")

print(f"\nMismatched Subject vs KG Root: {len(mismatched_subjects)}")
if mismatched_subjects:
    print("\nSample Mismatches (up to 20):")
    for item in mismatched_subjects[:20]:
        print(f"  {item[0]} Q{item[2]}: Paper subject '{item[3]}' != KG Root '{item[4]}' (node: {item[5]})")

print("\n--- Unique node_ids used ---")
print(f"Total distinct node_ids used across all CAPF questions: {len(node_id_stats)}")

# Let's see the most frequently used node_ids
sorted_nodes = sorted(node_id_stats.items(), key=lambda x: -x[1])
print("\nTop 15 most assigned node_ids:")
for nid, count in sorted_nodes[:15]:
    in_kg = "VALID" if nid in kg_nodes else "NOT_IN_KG"
    print(f"  [{in_kg}] {nid}: {count} questions")
