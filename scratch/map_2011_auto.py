import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

# Load master KG
with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)

nodes = master_kg['nodes']

# Build search indexes for fast, high-quality semantic matching
# Index Level 3 (Topics) and Level 4 (Subtopics)
concept_nodes = []
for nid, n in nodes.items():
    if n['level'] in [3, 4]:
        name = n.get('name', '')
        # extract clean title before parentheses if any
        clean_title = name.split('(')[0].strip()
        entities = n.get('entities', [])
        keywords = n.get('keywords', [])
        subj = n.get('subject', '')
        dom_id = n.get('parentId', '')
        dom_name = nodes.get(dom_id, {}).get('name', '') if dom_id in nodes else ''
        
        # Tokenize keywords
        tokens = set(re.findall(r'[a-zA-Z]{3,}', f"{name} {' '.join(entities)} {' '.join(keywords)}".lower()))
        
        concept_nodes.append({
            'id': nid,
            'level': n['level'],
            'name': clean_title,
            'full_name': name,
            'subject': subj,
            'domain': dom_name,
            'tokens': tokens,
            'raw_text': f"{name} {' '.join(entities)} {' '.join(keywords)}".lower()
        })

print(f"Indexed {len(concept_nodes)} candidate concept nodes.")

def classify_question(q_en, q_hi, expl_en, sub_topic=""):
    comb_text = f"{q_en} {expl_en} {sub_topic}".lower()
    
    # Check spatial/mapping signals
    is_world_sea = any(re.search(r'\b' + re.escape(w) + r'\b', comb_text) for w in [
        'mediterranean', 'black sea', 'caspian', 'red sea', 'adriatic', 'baltic sea', 
        'north sea', 'persian gulf', 'dead sea', 'aral sea', 'south china sea'
    ])
    is_world_strait = any(re.search(r'\b' + re.escape(w) + r'\b', comb_text) for w in [
        'malacca', 'hormuz', 'bab-el-mandeb', 'bosphorus', 'suez canal', 'panama canal', 'bering strait'
    ])
    is_world_river = any(re.search(r'\b' + re.escape(w) + r'\b', comb_text) for w in [
        'mekong', 'congo basin', 'zambezi', 'volga', 'danube', 'lake victoria', 'lake baikal', 'lake chad'
    ])
    is_world_conflict = any(re.search(r'\b' + re.escape(w) + r'\b', comb_text) for w in [
        'levant', 'golan heights', 'gaza', 'west bank', 'donbas', 'sahel', 'tigray', 'nagorno-karabakh'
    ])
    is_world_border = any(re.search(r'\b' + re.escape(w) + r'\b', comb_text) for w in [
        'landlocked', 'bordering nations', 'share border with', '38th parallel', '49th parallel'
    ])
    
    is_india_river = any(re.search(r'\b' + re.escape(w) + r'\b', comb_text) for w in [
        'tributary', 'tributaries', 'river basin', 'joins the indus', 'joins the ganga', 
        'brahmani', 'baitarani', 'subansiri', 'barak', 'lohit', 'teesta', 'sutlej', 'chenab', 
        'godavari', 'krishna', 'cauvery', 'narmada', 'tapi'
    ])
    is_india_relief = any(re.search(r'\b' + re.escape(w) + r'\b', comb_text) for w in [
        'mountain pass', 'zoji la', 'rohtang', 'shipki la', 'lipulekh', 'nathu la', 
        'cardamom hills', 'anamudi', 'doddabetta', 'shevaroy', 'palghat', 'thal ghat'
    ])
    is_india_coast = any(re.search(r'\b' + re.escape(w) + r'\b', comb_text) for w in [
        'ten degree channel', '10 degree channel', 'nine degree channel', 'palk strait', 'rann of kutch', 'barren island'
    ])
    
    # Calculate scores for concept nodes
    q_tokens = set(re.findall(r'[a-zA-Z]{3,}', comb_text))
    # remove common stop words
    stopwords = {'which', 'following', 'statements', 'correct', 'with', 'reference', 'consider', 'given', 'above', 'what', 'their', 'from', 'this', 'that', 'these', 'have', 'been'}
    q_tokens -= stopwords
    
    best_node = None
    best_score = 0
    
    for c in concept_nodes:
        # overlap score
        common = q_tokens.intersection(c['tokens'])
        score = len(common)
        
        # boost if title matches
        for t in c['name'].lower().split():
            if len(t) > 3 and t in comb_text:
                score += 3
                
        if score > best_score:
            best_score = score
            best_node = c
            
    # Determine mapping facet
    mapping_facet = None
    is_map = False
    sec_ids = []
    
    if is_world_sea:
        is_map = True
        mapping_facet = {
            'is_mapping': True,
            'region': 'World',
            'category': 'Seas, Straits & Water Bodies',
            'spatial_skill': 'bordering_nations' if 'border' in comb_text else 'location_identification',
            'has_image': False
        }
        sec_ids.append('geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations')
    elif is_world_strait:
        is_map = True
        mapping_facet = {
            'is_mapping': True,
            'region': 'World',
            'category': 'Seas, Straits & Water Bodies',
            'spatial_skill': 'location_identification',
            'has_image': False
        }
        sec_ids.append('geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals')
    elif is_world_river:
        is_map = True
        mapping_facet = {
            'is_mapping': True,
            'region': 'World',
            'category': 'Rivers & Drainage',
            'spatial_skill': 'location_identification',
            'has_image': False
        }
        sec_ids.append('geography_earth_systems.world_mapping_geopolitical_locations.major_world_rivers_lakes_drainage')
    elif is_world_conflict:
        is_map = True
        mapping_facet = {
            'is_mapping': True,
            'region': 'World',
            'category': 'Places in News & Conflict Zones',
            'spatial_skill': 'location_identification',
            'has_image': False
        }
        sec_ids.append('geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones')
    elif is_world_border:
        is_map = True
        mapping_facet = {
            'is_mapping': True,
            'region': 'World',
            'category': 'International Borders & Boundaries',
            'spatial_skill': 'bordering_nations',
            'has_image': False
        }
        sec_ids.append('geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories')
    elif is_india_river:
        is_map = True
        mapping_facet = {
            'is_mapping': True,
            'region': 'India',
            'category': 'Rivers & Drainage',
            'spatial_skill': 'tributary_confluence',
            'has_image': False
        }
        sec_ids.append('geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering')
    elif is_india_relief:
        is_map = True
        mapping_facet = {
            'is_mapping': True,
            'region': 'India',
            'category': 'Mountains, Passes & Plateaus',
            'spatial_skill': 'spatial_ordering' if 'order' in comb_text or 'north' in comb_text else 'location_identification',
            'has_image': False
        }
        sec_ids.append('geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes')
    elif is_india_coast:
        is_map = True
        mapping_facet = {
            'is_mapping': True,
            'region': 'India',
            'category': 'Seas, Straits & Water Bodies',
            'spatial_skill': 'location_identification',
            'has_image': False
        }
        sec_ids.append('geography_earth_systems.indian_mapping_spatial_geography.coastal_features_islands_maritime_channels')
        
    return best_node, is_map, mapping_facet, sec_ids

# Test on 2011 questions
with open('src/data/upsc_pyq/2011.json', 'r', encoding='utf-8') as f:
    data_2011 = json.load(f)

print(f"Testing classifier on {len(data_2011)} questions from 2011...")
map_count = 0
for idx, q in enumerate(data_2011[:20]):
    node, is_m, facet, sec = classify_question(
        q.get('question_english', ''),
        q.get('question_hindi', ''),
        q.get('explanation_english', '')
    )
    if is_m:
        map_count += 1
    print(f"[Q{q.get('question_number'):02d}] Map: {is_m} | {node['subject']} -> {node['name']}")
