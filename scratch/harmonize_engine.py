import json
import re

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
valid_nids = set(nodes.keys())

# Build inverted index for fast keyword lookup
node_tokens = {}
for nid, data in nodes.items():
    name = data.get('name', '')
    desc = data.get('description', '')
    keywords = data.get('keywords', [])
    text = f"{nid.replace('.', ' ').replace('_', ' ')} {name} {desc} {' '.join(keywords)}".lower()
    tokens = set(re.findall(r'[a-z0-9]{3,}', text))
    node_tokens[nid] = (tokens, data)

# Mapping criteria
MAPPING_WORLD_PATTERNS = [
    (r'\b(red sea|black sea|caspian sea|mediterranean|baltic|persian gulf|dead sea|aral sea)\b', 
     'geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations', 'Enclosed Seas'),
    (r'\b(strait of hormuz|malacca|bab-el-mandeb|bosphorus|dardanelles|kerch|suez canal|panama canal|taiwan strait|gibraltar)\b',
     'geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals', 'Maritime Straits'),
    (r'\b(gaza|west bank|golan|sinai|levant|sahel|tigray|somali|donbas|crimea|zaporizhzhia|nagorno-karabakh|kuril|senkaku|spratly|paracel)\b',
     'geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones', 'Conflict Zones'),
    (r'\b(radcliffe|mcmahon|durand|38th parallel|49th parallel|bordering countries|landlocked)\b',
     'geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories', 'Borders')
]

MAPPING_INDIA_PATTERNS = [
    (r'\b(national park|wildlife sanctuary|biosphere reserve|tiger reserve|ramsar|bird sanctuary)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout', 'Protected Areas'),
    (r'\b(tributary|tributaries|drainage|basin|confluence|originates|flows into|ganga|brahmaputra|indus|godavari|krishna|cauvery|narmada|tapi|mahanadi)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering', 'Rivers'),
    (r'\b(pass|la\b|zoji|rohtang|shipki|lipulekh|nathu|jelep|bomdi|glacier|siachen|gangotri|zemu)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.himalayan_mountain_ranges_passes_glaciers', 'Himalayan Passes'),
    (r'\b(western ghats|eastern ghats|nilgiri|cardamom|anamudi|doddabetta|aravalli|satpura|vindhya|thal ghat|bhor ghat|palghat)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes', 'Hills & Plateaus'),
    (r'\b(major port|kandla|jnpt|mormugao|mangalore|cochin|tuticorin|chennai|ennore|visakhapatnam|paradip|haldia|national waterway)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.infrastructure_ports_transport_corridors', 'Ports & Waterways'),
    (r'\b(channel|10 degree|9 degree|8 degree|palk strait|gannar|rann of kutch|sir creek|barren island)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.coastal_features_islands_maritime_channels', 'Coastal & Islands')
]

def detect_mapping(q_text, tags=[]):
    text = (q_text + ' ' + ' '.join(tags)).lower()
    
    # Check world mapping
    for pattern, sec_nid, label in MAPPING_WORLD_PATTERNS:
        if re.search(pattern, text):
            # Check context to ensure it's geographic/spatial
            return {
                'is_mapping': True,
                'region': 'World',
                'category': 'Political' if label in ['Conflict Zones', 'Borders'] else 'Physical',
                'spatial_skill': 'Location Identification' if label == 'Conflict Zones' else 'Feature-State/Country Matching',
                'secondary_node_ids': [sec_nid]
            }
            
    # Check India mapping
    for pattern, sec_nid, label in MAPPING_INDIA_PATTERNS:
        if re.search(pattern, text):
            # Exclude non-geographic questions like parliamentary acts or fiscal passed bills
            if 'passed by' in text or 'constitutional amendment' in text:
                continue
            cat = 'Environmental' if label == 'Protected Areas' else ('Economic' if label == 'Ports & Waterways' else 'Physical')
            skill = 'Drainage / River Basin Analysis' if label == 'Rivers' else 'Location Identification'
            return {
                'is_mapping': True,
                'region': 'India',
                'category': cat,
                'spatial_skill': skill,
                'secondary_node_ids': [sec_nid]
            }
            
    return None

def score_node(candidate_nid, q_tokens, cur_tokens, subject_hint=None):
    c_tokens, c_data = node_tokens[candidate_nid]
    score = 0
    # Overlap with cur_tokens (tokens in current ad-hoc node_id / domain / subtopic)
    cur_overlap = len(c_tokens.intersection(cur_tokens))
    score += cur_overlap * 4
    
    # Overlap with question tokens
    q_overlap = len(c_tokens.intersection(q_tokens))
    score += q_overlap * 1
    
    # Subject match boost
    if subject_hint and candidate_nid.startswith(subject_hint):
        score += 10
        
    return score

def resolve_question_node(q):
    cur_nid = q.get('node_id', '')
    if cur_nid in valid_nids:
        return cur_nid, nodes[cur_nid]
        
    q_text = q.get('question_english', '')
    tags = q.get('tags', [])
    subj = q.get('subject', '')
    dom = q.get('domain', '')
    sub = q.get('sub_topic', '')
    
    cur_text = f"{cur_nid} {dom} {sub} {' '.join(tags)}".lower().replace('.', ' ').replace('_', ' ')
    cur_tokens = set(re.findall(r'[a-z0-9]{3,}', cur_text))
    
    q_tokens = set(re.findall(r'[a-z0-9]{3,}', q_text.lower()))
    
    # Determine subject hint
    subj_hint = None
    if 'hist' in subj.lower() or 'hist' in cur_nid.lower():
        subj_hint = 'history'
    elif 'geog' in subj.lower() or 'geog' in cur_nid.lower():
        subj_hint = 'geography'
    elif 'econ' in subj.lower() or 'econ' in cur_nid.lower():
        subj_hint = 'indian_economy'
    elif 'polit' in subj.lower() or 'polit' in cur_nid.lower():
        subj_hint = 'indian_polity'
    elif 'env' in subj.lower() or 'env' in cur_nid.lower() or 'ecol' in subj.lower():
        subj_hint = 'environment'
    elif 'sci' in subj.lower() or 'sci' in cur_nid.lower() or 'tech' in subj.lower():
        subj_hint = 'science_technology'
    elif 'internat' in subj.lower() or 'internat' in cur_nid.lower():
        subj_hint = 'international_relations'
        
    best_nid = None
    best_score = -1
    for nid in valid_nids:
        # Prefer leaf nodes (level 3 or 4)
        lvl = nodes[nid].get('level', 1)
        if lvl < 2:
            continue
        sc = score_node(nid, q_tokens, cur_tokens, subj_hint)
        if lvl >= 3:
            sc += 2  # slight preference for specific leaf nodes
        if sc > best_score:
            best_score = sc
            best_nid = nid
            
    return best_nid, nodes[best_nid]

if __name__ == '__main__':
    with open('src/data/upsc_pyq/2025.json', 'r', encoding='utf-8') as f:
        pyq = json.load(f)
        
    print(f"Testing on 2025.json ({len(pyq)} questions):")
    for q in pyq[:15]:
        nid, data = resolve_question_node(q)
        map_info = detect_mapping(q.get('question_english', ''), q.get('tags', []))
        qnum = q['question_number']
        orig = q.get('node_id', '')
        print(f"Q{qnum:2d}: {orig} \n   -> {nid}\n   -> Name: {data.get('name')[:60]}")
        if map_info:
            print(f"   -> MAP: {map_info['region']} | {map_info['category']} | {map_info['secondary_node_ids']}")
        print()
