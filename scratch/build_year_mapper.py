import json
import re
import os

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
valid_nids = set(nodes.keys())

# Build search index for all leaf / sub-topic nodes
node_index = []
for nid, data in nodes.items():
    lvl = data.get('level', 1)
    if lvl < 2:
        continue
    name = data.get('name', '')
    desc = data.get('description', '')
    keywords = data.get('keywords', [])
    text = f"{nid.replace('.', ' ').replace('_', ' ')} {name} {desc} {' '.join(keywords)}".lower()
    tokens = set(re.findall(r'[a-z0-9]{3,}', text))
    node_index.append({
        'nid': nid,
        'data': data,
        'tokens': tokens,
        'level': lvl,
        'name': name
    })

# Expanded mapping patterns
MAPPING_WORLD_PATTERNS = [
    (r'\b(red sea|black sea|caspian sea|mediterranean|baltic|persian gulf|dead sea|aral sea|sea of galilee)\b', 
     'geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations', 'Enclosed Seas', 'Physical'),
    (r'\b(strait of hormuz|malacca|bab-el-mandeb|bosphorus|dardanelles|kerch|suez canal|panama canal|taiwan strait|gibraltar|bering strait)\b',
     'geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals', 'Maritime Straits', 'Physical'),
    (r'\b(gaza|west bank|golan|sinai|levant|sahel|tigray|somali|donbas|crimea|zaporizhzhia|nagorno-karabakh|kuril|senkaku|spratly|paracel|mallorca|normandy|sardinia|anadyr|nome|lake tanganyika|lake tonle sap)\b',
     'geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones', 'Conflict Zones / Places in News', 'Political'),
    (r'\b(radcliffe|mcmahon|durand|38th parallel|49th parallel|bordering countries|landlocked|boundary lines)\b',
     'geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories', 'Borders', 'Political')
]

MAPPING_INDIA_PATTERNS = [
    (r'\b(national park|wildlife sanctuary|biosphere reserve|tiger reserve|ramsar|bird sanctuary|wild ass sanctuary|nokrek|simlipal|dihang-dibang|agashyamalai|bandipur|bhitarkanika|manas|sunderbans|keoladeo|loktak)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout', 'Protected Areas', 'Environmental'),
    (r'\b(tributary|tributaries|drainage basin|river basin|confluence|originates in|flows into|flows through|ganga|yamuna|brahmaputra|godavari|krishna|cauvery|kaveri|narmada|tapi|tapti|mahanadi|subarnarekha|barak|teesta|indus river|indus basin|indus tributary)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering', 'Rivers & Drainage', 'Physical'),
    (r'\b(mountain pass|passes|zoji la|rohtang|shipki la|lipulekh|nathu la|jelep la|bomdi la|siachen glacier|gangotri glacier|zemu glacier|deep gorges|youthful fold mountains)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.himalayan_mountain_ranges_passes_glaciers', 'Himalayan Passes & Glaciers', 'Physical'),
    (r'\b(western ghats|eastern ghats|nilgiri hills|cardamom hills|anamudi|doddabetta|aravalli|satpura|vindhya|thal ghat|bhor ghat|palghat gap)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes', 'Hills & Plateaus', 'Physical'),
    (r'\b(major port|kandla|jnpt|mormugao|new mangalore|cochin|tuticorin|chennai|kamajar|visakhapatnam|paradip|haldia|national waterway)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.infrastructure_ports_transport_corridors', 'Ports & Waterways', 'Economic'),
    (r'\b(10 degree channel|9 degree channel|8 degree channel|palk strait|gulf of mannar|rann of kutch|sir creek|barren island|great nicobar|narcondam|pole star)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.coastal_features_islands_maritime_channels', 'Coastal & Islands', 'Physical'),
    (r'\b(located on the same latitude|monsoon decreases from|rainfall in the northern plains of india decreases|naturally found in india)\b',
     'geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes', 'Spatial Distribution & Biogeography', 'Physical')
]

SUBJECT_KEYWORDS = {
    'indian_polity_constitution_governance': [
        'constitution', 'parliament', 'lok sabha', 'rajya sabha', 'supreme court', 'high court',
        'fundamental rights', 'directive principles', 'fundamental duties', 'article', 'president of india',
        'governor', 'speaker', 'adjournment motion', 'joint sitting', 'panchayat', 'panchayati raj',
        'pesa', 'cag', 'attorney general', 'election commission', 'finance commission', 'judiciary',
        'writ', 'amendment act', 'bill', 'delimitation commission'
    ],
    'history': [
        'indian national congress', 'gandhi', 'nehru', 'swadeshi', 'non-cooperation',
        'civil disobedience', 'quit india', 'british rule', 'east india company', 'ryotwari',
        'mahalwari', 'permanent settlement', 'morley-minto', 'montagu-chelmsford', 'charter act',
        'ancient india', 'medieval india', 'maurya', 'gupta', 'chola', 'pallava', 'harappa',
        'indus valley', 'indus civilization', 'indus civilisation', 'vedic', 'buddhism', 'jainism', 'shreni', 'inscription', 'rock edict',
        'mughal', 'sultanate', 'vijayanagar', 'karl marx', 'rowlatt', 'lahore session'
    ],
    'art_culture_heritage': [
        'temple architecture', 'nagara', 'dravida', 'vesara', 'miniature painting',
        'kuchipudi', 'bharatanatyam', 'kathakali', 'dhrupad', 'classical dance', 'classical music',
        'buddha hand gesture', 'bhumisparsha', 'unesco world heritage'
    ],
    'indian_economy_development': [
        'gdp', 'gnp', 'inflation', 'rbi', 'reserve bank of india', 'monetary policy',
        'fiscal deficit', 'banking', 'commercial banks', 'repo rate', 'crr', 'slr', 'lead bank',
        'fdi', 'fii', 'balance of payments', 'current account', 'capital account', 'disinvestment',
        'cpse', 'poverty line', 'financial inclusion', 'microfinance', 'priority sector', 'wto',
        'trade policy', 'taxation', 'gst', 'customs duty', 'union budget', 'public finance',
        'index of industrial production', 'capital gains', 'foreign direct investment'
    ],
    'environment_ecology_disaster_management': [
        'biodiversity', 'ecosystem', 'wetland', 'ramsar', 'national park', 'wildlife',
        'sanctuary', 'biosphere reserve', 'tiger reserve', 'iucn', 'climate change',
        'greenhouse gas', 'global warming', 'unfccc', 'kyoto', 'carbon credit', 'pollution',
        'eutrophication', 'endangered', 'fauna', 'flora', 'coral reef', 'mangrove',
        'ocean acidification', 'phytoplankton', 'vultures', 'oryx', 'chiru'
    ],
    'science_technology_defence': [
        'graphene', 'nanotechnology', 'stem cell', 'genetic', 'dna', 'rna', 'crispr',
        'transgenic', 'bt brinjal', 'bt cotton', 'laser', 'optical fibre', 'bluetooth',
        'satellite', 'isro', 'nasa', 'launch vehicle', 'pslv', 'gslv', 'orbit', 'missile',
        'nuclear reactor', 'thorium', 'brookhaven', 'quark-gluon', 'higgs boson', 'cern',
        'artificial intelligence', 'cyber', 'vpn', 'ultraviolet'
    ],
    'geography_earth_systems': [
        'monsoon', 'western disturbances', 'cyclone', 'el nino', 'la nina', 'tributary',
        'tributaries', 'drainage', 'river', 'confluence', 'himalayas', 'western ghats',
        'eastern ghats', 'gorge', 'plateau', 'soil', 'laterite', 'continental drift',
        'plate tectonics', 'earthquake', 'volcano', 'latitude', 'longitude', 'ocean currents',
        'mixed farming', 'sea buckthorn', 'coal reserves', 'rare earth elements'
    ],
    'international_relations_global_institutions': [
        'start treaty', 'export control', 'wassenaar', 'mtcr', 'australia group',
        'un security council', 'unsc', 'international court of justice', 'iaea'
    ]
}

def infer_subject_prefix(q_text):
    text = q_text.lower()
    scores = {}
    for prefix, kw_list in SUBJECT_KEYWORDS.items():
        sc = sum(1 for kw in kw_list if kw in text)
        if sc > 0:
            scores[prefix] = sc
    if scores:
        return max(scores.items(), key=lambda x: x[1])[0]
    return None

def detect_mapping_facet(q_text, tags=[]):
    text = (q_text + ' ' + ' '.join(tags)).lower()
    
    # Exclude non-spatial matches
    if 'passed by the lok sabha' in text or 'passed by parliament' in text:
        return None
        
    for pat, sec_nid, label, cat in MAPPING_WORLD_PATTERNS:
        if re.search(pat, text):
            return {
                'is_mapping': True,
                'region': 'World',
                'category': cat,
                'spatial_skill': 'Location Identification' if cat == 'Political' else 'Feature-State/Country Matching',
                'secondary_node_ids': [sec_nid]
            }
            
    for pat, sec_nid, label, cat in MAPPING_INDIA_PATTERNS:
        if re.search(pat, text):
            skill = 'Drainage / River Basin Analysis' if label == 'Rivers & Drainage' else 'Location Identification'
            return {
                'is_mapping': True,
                'region': 'India',
                'category': cat,
                'spatial_skill': skill,
                'secondary_node_ids': [sec_nid]
            }
            
    return None

def score_candidate(candidate, q_tokens, meta_tokens=None, subj_prefix=None):
    score = 0
    c_tokens = candidate['tokens']
    c_nid = candidate['nid']
    
    # Question text overlap
    q_overlap = len(c_tokens.intersection(q_tokens))
    score += q_overlap * 3
    
    # Existing tokens overlap
    if meta_tokens:
        e_overlap = len(c_tokens.intersection(meta_tokens))
        score += e_overlap * 5
        
    # Subject match boost
    if subj_prefix and c_nid.startswith(subj_prefix):
        score += 25
        
    # Prefer level 3 & 4
    if candidate['level'] >= 3:
        score += 3
        
    return score

def find_best_node(q_text, tags=[], existing_nid=None, subj_hint=None, domain_hint=None, recompute=False):
    if not recompute and existing_nid and existing_nid in valid_nids:
        return existing_nid
        
    q_tokens = set(re.findall(r'[a-z0-9]{3,}', (q_text + ' ' + ' '.join(tags)).lower()))
    meta_text = f"{existing_nid or ''} {subj_hint or ''} {domain_hint or ''}".replace('.', ' ').replace('_', ' ').lower()
    meta_tokens = set(re.findall(r'[a-z0-9]{3,}', meta_text))
    
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
    
    subj_prefix = None
    if subj_hint:
        subj_prefix = subj_map.get(subj_hint)
        if not subj_prefix:
            for k, p in subj_map.items():
                if k.lower() in subj_hint.lower():
                    subj_prefix = p
                    break
                    
    if not subj_prefix:
        subj_prefix = infer_subject_prefix(q_text)
                    
    best_nid = None
    best_score = -1
    
    for candidate in node_index:
        c_nid = candidate['nid']
        if 'karnataka' in c_nid and 'karnataka' not in q_text.lower():
            continue
        if subj_prefix and not c_nid.startswith(subj_prefix):
            continue
            
        sc = score_candidate(candidate, q_tokens, meta_tokens, subj_prefix)
        if sc > best_score:
            best_score = sc
            best_nid = c_nid
            
    # If no match under subj_prefix, fallback without subj_prefix
    if not best_nid:
        for candidate in node_index:
            c_nid = candidate['nid']
            if 'karnataka' in c_nid and 'karnataka' not in q_text.lower():
                continue
            sc = score_candidate(candidate, q_tokens, meta_tokens, None)
            if sc > best_score:
                best_score = sc
                best_nid = c_nid
                
    return best_nid

print("Module build_year_mapper updated successfully.")
