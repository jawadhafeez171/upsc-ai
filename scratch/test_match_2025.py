import json, re

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
valid_nids = set(nodes.keys())

with open('src/data/upsc_pyq/2025.json', 'r', encoding='utf-8') as f:
    pyq25 = json.load(f)

def get_best_match(q):
    cur_nid = q.get('node_id', '')
    if cur_nid in valid_nids:
        return cur_nid, 100
        
    q_txt = q.get('question_english', '')
    tags = q.get('tags', [])
    subj = q.get('subject', '')
    dom = q.get('domain', '')
    sub = q.get('sub_topic', '')
    
    subj_map = {
        'History': 'history',
        'Art & Culture': 'art_culture_heritage',
        'Geography': 'geography_earth_systems',
        'Indian Polity': 'indian_polity_constitution_governance',
        'Indian Economy': 'indian_economy_development',
        'Environment & Ecology': 'environment_ecology_disaster_management',
        'Environment': 'environment_ecology_disaster_management',
        'Science & Technology': 'science_technology_defence',
        'International Relations': 'international_relations_global_institutions',
        'Internal Security': 'internal_security',
        'Society': 'indian_society_social_justice'
    }
    
    prefix = subj_map.get(subj)
    if not prefix:
        for k, p in subj_map.items():
            if k.lower() in (subj + ' ' + cur_nid).lower():
                prefix = p
                break
                
    q_tokens = set(re.findall(r'[a-z0-9]{3,}', (q_txt + ' ' + ' '.join(tags)).lower()))
    meta_tokens = set(re.findall(r'[a-z0-9]{3,}', (cur_nid + ' ' + dom + ' ' + sub).lower()))
    
    best_nid = None
    best_score = -1
    
    for nid, data in nodes.items():
        if 'karnataka' in nid and 'karnataka' not in q_txt.lower():
            continue
        if prefix and not nid.startswith(prefix):
            continue
            
        name = data.get('name', '')
        desc = data.get('description', '')
        kw = data.get('keywords', [])
        node_text = (nid.replace('.', ' ').replace('_', ' ') + ' ' + name + ' ' + desc + ' ' + ' '.join(kw)).lower()
        n_tokens = set(re.findall(r'[a-z0-9]{3,}', node_text))
        
        sc = len(n_tokens.intersection(meta_tokens)) * 4 + len(n_tokens.intersection(q_tokens)) * 1
        lvl = data.get('level', 1)
        if lvl >= 3:
            sc += 2
        if sc > best_score:
            best_score = sc
            best_nid = nid
            
    return best_nid, best_score

for q in pyq25[:25]:
    nid, sc = get_best_match(q)
    qnum = q['question_number']
    s = q.get('subject')
    print(f"Q{qnum:2d} [{s}] -> {nid} (score={sc})")
