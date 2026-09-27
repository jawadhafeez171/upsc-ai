import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)

valid_nids = set(master_kg['nodes'].keys())

recent_years = [str(y) for y in range(2019, 2026)]

audit_results = {
    'total_questions': 0,
    'currently_is_mapping': 0,
    'missing_mapping_candidates': [],
    'invalid_node_ids': []
}

for yr in recent_years:
    fpath = f"src/data/upsc_pyq/{yr}.json"
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    for q in data:
        audit_results['total_questions'] += 1
        q_num = q.get('question_number')
        nid = q.get('node_id', '')
        is_map = q.get('is_mapping', False)
        
        if is_map:
            audit_results['currently_is_mapping'] += 1
            
        if nid and nid not in valid_nids:
            audit_results['invalid_node_ids'].append({
                'year': yr,
                'q_num': q_num,
                'node_id': nid,
                'sub_topic': q.get('sub_topic', '')
            })
            
        # Check text for potential unflagged mapping
        q_en = q.get('question_english', '') or q.get('text', '') or ''
        sub = q.get('sub_topic', '') or ''
        comb = (q_en + " " + sub).lower()
        
        # World mapping signals
        is_world_map = any(w in comb for w in [
            'mediterranean', 'black sea', 'caspian', 'red sea', 'adriatic', 'baltic',
            'strait of', 'suez canal', 'panama canal', 'chokepoint', 'bab-el-mandeb', 'hormuz',
            'golan heights', 'gaza', 'west bank', 'donbas', 'sahel', 'tigray', 'nagorno',
            'congo basin', 'mekong', 'lake victoria', 'lake chad', 'lake baikal', 'danube',
            'bordering country', 'bordering nations', 'share border with', 'landlocked'
        ])
        
        # Indian mapping signals
        is_india_map = any(w in comb for w in [
            'tributary of', 'tributaries of', 'joins the indus', 'joins the ganga', 
            'himalayan pass', 'passes are located', 'peaks in india', 'hills are located',
            'cardamom hills', 'anamudi', 'doddabetta', 'shevaroy', 'ten degree channel',
            'nine degree channel', 'eight degree channel', 'barren island', 'palk strait'
        ])
        
        if (is_world_map or is_india_map) and not is_map:
            audit_results['missing_mapping_candidates'].append({
                'year': yr,
                'q_num': q_num,
                'text': q_en[:90],
                'sub_topic': sub,
                'node_id': nid,
                'type': 'World' if is_world_map else 'India'
            })

print(f"Total Questions (2019-2025): {audit_results['total_questions']}")
print(f"Currently flagged is_mapping: {audit_results['currently_is_mapping']}")
print(f"Invalid node_ids found: {len(audit_results['invalid_node_ids'])}")
print(f"Missing mapping candidates found: {len(audit_results['missing_mapping_candidates'])}")

print("\n--- Invalid Node IDs in 2019-2025 ---")
for inv in audit_results['invalid_node_ids']:
    print(f"[{inv['year']} Q{inv['q_num']}] {inv['node_id']} | {inv['sub_topic']}")

print("\n--- Potential Missing Mapping in 2019-2025 ---")
for m in audit_results['missing_mapping_candidates']:
    print(f"[{m['year']} Q{m['q_num']} - {m['type']}] Node: {m['node_id'].split('.')[-1] if m['node_id'] else 'EMPTY'}")
    print(f"   Subtopic: {m['sub_topic']}")
    print(f"   Text: {m['text']}...")
