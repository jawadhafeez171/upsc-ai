import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)

nodes = master_kg['nodes']

def resolve_node(keywords, expected_subject=None):
    kw_list = [k.lower() for k in keywords]
    best_nid = None
    best_score = 0
    
    for nid, n in nodes.items():
        if n['level'] not in [3, 4]:
            continue
        if expected_subject and n.get('subject') != expected_subject:
            continue
            
        full_text = f"{nid} {n.get('name', '')} {' '.join(n.get('entities', []))} {' '.join(n.get('keywords', []))}".lower()
        score = sum(3 for kw in kw_list if kw in full_text)
        
        # Exact match bonus
        for kw in kw_list:
            if re.search(r'\b' + re.escape(kw) + r'\b', full_text):
                score += 2
                
        if score > best_score:
            best_score = score
            best_nid = nid
            
    return best_nid, nodes[best_nid] if best_nid else None

# Test on our 20 queries:
tests = [
    (['applied_chemistry', 'polymers', 'materials'], 'Science, Technology & Defence'),
    (['air_pollution', 'thermal power', 'nox', 'sox'], 'Environment, Ecology & Disaster Management'),
    (['geostationary', 'orbit', 'satellite'], 'Science, Technology & Defence'),
    (['food inflation', 'supply chain', 'pricing'], 'Indian Economy & Development'),
    (['chromosome', 'gene', 'livestock', 'pedigree'], 'Science, Technology & Defence'),
    (['balance of payments', 'current account', 'service exports'], 'Indian Economy & Development'),
    (['microbial fuel cell', 'chemistry', 'fuel cells'], 'Science, Technology & Defence'),
    (['fiscal stimulus', 'deficit', 'budgetary'], 'Indian Economy & Development'),
    (['ozone layer', 'polar stratospheric clouds', 'cfc'], 'Environment, Ecology & Disaster Management'),
    (['current account deficit', 'devaluation', 'balance of payments'], 'Indian Economy & Development'),
    (['73rd amendment', 'panchayati raj', 'district planning'], 'Indian Polity, Constitution & Governance'),
    (['peninsular river', 'brahmani', 'baitarani'], 'Geography & Earth Systems'),
    (['base effect', 'inflation', 'price index'], 'Indian Economy & Development'),
    (['demographic dividend', 'working age population'], 'Geography & Earth Systems'),
    (['carbon credit', 'clean development mechanism', 'kyoto'], 'Environment, Ecology & Disaster Management'),
    (['vat', 'tax reforms', 'indirect tax'], 'Indian Economy & Development'),
    (['closed economy', 'foreign trade'], 'Indian Economy & Development'),
    (['phloem', 'girdling', 'plant physiology'], 'Science, Technology & Defence'),
    (['nuclear proliferation', 'start', 'arms control'], 'History'),
    (['biodiversity hotspots', 'norman myers', 'endemism'], 'Environment, Ecology & Disaster Management')
]

print("--- Testing Node Resolver ---")
for kws, subj in tests:
    nid, node = resolve_node(kws, subj)
    print(f"Keywords: {kws[:2]} | Subject: {subj}")
    print(f"  -> {nid}")
    print(f"  -> Name: {node['name'][:75]}...\n")
