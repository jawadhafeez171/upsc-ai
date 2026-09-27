import json
import os
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

# Load master KG
with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)

valid_nids = set(master_kg['nodes'].keys())
print(f"Master KG loaded: {len(valid_nids)} nodes.")

years = [str(y) for y in range(2011, 2026)]

# Keywords and patterns for mapping detection
WORLD_SEAS = [
    'mediterranean', 'black sea', 'caspian', 'red sea', 'baltic', 'aral sea', 'dead sea', 
    'adriatic', 'north sea', 'aegean', 'persian gulf', 'gulf of aqaba', 'gulf of aden',
    'south china sea', 'east china sea', 'yellow sea', 'sea of japan', 'sea of okhotsk',
    'bering sea', 'caribbean', 'coral sea', 'tasman sea', 'weddell', 'ross sea'
]

WORLD_STRAITS_CANALS = [
    'malacca', 'hormuz', 'bab-el-mandeb', 'bab el mandeb', 'bosphorus', 'bosporus', 
    'dardanelles', 'suez canal', 'panama canal', 'bering strait', 'taiwan strait', 
    'gibraltar', 'strait of dover', 'cook strait', 'magellan', 'kerch strait', 'chokepoint'
]

WORLD_RIVERS_LAKES = [
    'mekong', 'congo basin', 'congo river', 'zambezi', 'volga', 'danube', 'rhine', 
    'lake victoria', 'lake baikal', 'lake chad', 'lake tanganyika', 'lake titicaca', 
    'lake faguibine', 'tonle sap', 'lake balkhash', 'lake superior', 'amazon river', 
    'mississippi', 'nile', 'tigris', 'euphrates', 'amur', 'irrawaddy', 'salween', 'mahaweli'
]

WORLD_REGIONS_CONFLICT = [
    'gaza', 'west bank', 'golan heights', 'levant', 'sinai', 'sahel', 'tigray', 'donbas', 
    'donetsk', 'luhansk', 'crimea', 'zaporizhzhia', 'nagorno-karabakh', 'nagorno karabakh', 
    'catalonia', 'kachin', 'rohingya', 'rakhine', 'darien gap', 'chagos', 'kuril', 
    'senkaku', 'diaoyu', 'spratly', 'paracel', 'south sudan', 'darfur', 'cabo delgado', 
    'mali', 'burkina faso', 'somalia', 'yemen', 'houthi', 'kivu'
]

WORLD_BORDERS_LANDLOCKED = [
    'landlocked', 'bordering country', 'bordering nations', 'share border', 'shares border', 
    'share land border', 'shares land border', 'boundary between', 'longest border', 
    '38th parallel', '49th parallel', 'radcliffe', 'durand line', 'mcmahon line'
]

WORLD_MOUNTAINS = [
    'atlas mountain', 'drakensberg', 'andes', 'rockies', 'alps', 'vosges', 'ural', 
    'appalachian', 'caucasus', 'pyrenees', 'anatolia', 'abyssinian', 'guiana highland'
]

INDIA_RIVERS = [
    'tributary', 'tributaries', 'river basin', 'drain direct', 'joins direct', 
    'joins the indus', 'joins the ganga', 'indus river', 'ganga', 'brahmaputra', 
    'godavari', 'krishna river', 'cauvery', 'kaveri', 'narmada', 'tapi', 'mahanadi', 
    'barak', 'lohit', 'subansiri', 'teesta', 'sutlej', 'chenab', 'jhelum', 'ravi', 
    'beas', 'pennar', 'penner', 'vaigai', 'periyar', 'sharavathi', 'ghaghara', 'gandak', 
    'kosi', 'son river', 'damodar', 'subarnarekha', 'dhuandhar', 'hundru', 'waterfall'
]

INDIA_RELIEF_PASSES = [
    'pass', 'mountain pass', 'himalayan', 'pir panjal', 'zoji la', 'rohtang', 'shipki la', 
    'lipulekh', 'nathu la', 'jelep la', 'bomdi la', 'khardung la', 'banihal', 'zanskar', 
    'karakoram', 'dhauladhar', 'shiwalik', 'western ghats', 'eastern ghats', 'nilgiri', 
    'anamudi', 'doddabetta', 'cardamom hills', 'shevaroy', 'javadi', 'nallamala', 
    'palghat', 'thal ghat', 'bhor ghat', 'satpura', 'vindhya', 'aravalli', 'kaimur', 
    'mahadeo', 'mikir', 'barail', 'namcha barwa', 'nanda devi', 'nokrek', 'gandikota'
]

INDIA_COAST_ISLANDS = [
    'channel', 'ten degree channel', '10 degree channel', 'nine degree channel', 
    '9 degree channel', 'eight degree channel', '8 degree channel', 'palk strait', 
    'gulf of mannar', 'rann of kutch', 'barren island', 'narcondam', 'andaman', 'nicobar', 
    'lakshadweep', 'minicoy', 'coromandel', 'konkan', 'malabar coast', 'sir creek'
]

INDIA_PROTECTED_AREAS = [
    'national park', 'tiger reserve', 'biosphere reserve', 'wildlife sanctuary', 
    'ramsar site', 'ramsar wetland', 'bird sanctuary'
]

all_candidates = []

for yr in years:
    fpath = f"src/data/upsc_pyq/{yr}.json"
    if not os.path.exists(fpath):
        continue
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    for q in data:
        q_num = q.get('question_number')
        q_en = q.get('question_english', '') or q.get('text', '') or ''
        q_hi = q.get('question_hindi', '') or ''
        opt_en = " ".join([
            str(q.get('option_a_english', '')),
            str(q.get('option_b_english', '')),
            str(q.get('option_c_english', '')),
            str(q.get('option_d_english', ''))
        ])
        sub_topic = q.get('sub_topic', '') or ''
        tags = " ".join(q.get('tags', []) or [])
        full_text = f"{q_en} {opt_en} {sub_topic} {tags}".lower()
        
        reasons = []
        is_world = False
        is_india = False
        cat = None
        skill = 'location_identification'
        
        # 1. World Seas
        for s in WORLD_SEAS:
            if s in full_text:
                reasons.append(f"World Sea: {s}")
                is_world = True
                cat = 'Seas, Straits & Water Bodies'
                if any(b in full_text for b in ['border', 'surround', 'littoral', 'touches', 'open into']):
                    skill = 'bordering_nations'
                break
                
        # 2. World Straits & Canals
        if not cat:
            for st in WORLD_STRAITS_CANALS:
                if st in full_text:
                    reasons.append(f"World Strait/Canal: {st}")
                    is_world = True
                    cat = 'Seas, Straits & Water Bodies'
                    break
                    
        # 3. World Rivers & Lakes
        if not cat:
            for rl in WORLD_RIVERS_LAKES:
                if rl in full_text:
                    reasons.append(f"World River/Lake: {rl}")
                    is_world = True
                    cat = 'Rivers & Drainage'
                    break
                    
        # 4. World Conflict / Places in News
        if not cat:
            for cp in WORLD_REGIONS_CONFLICT:
                # word boundary match to avoid substring false positives
                if re.search(r'\b' + re.escape(cp) + r'\b', full_text):
                    reasons.append(f"Conflict/Place in News: {cp}")
                    is_world = True
                    cat = 'Places in News & Conflict Zones'
                    break
                    
        # 5. World Borders / Landlocked
        if not cat:
            for b in WORLD_BORDERS_LANDLOCKED:
                if b in full_text:
                    reasons.append(f"Border/Landlocked: {b}")
                    is_world = True
                    cat = 'International Borders & Boundaries'
                    skill = 'bordering_nations'
                    break
                    
        # 6. World Mountains
        if not cat:
            for m in WORLD_MOUNTAINS:
                if m in full_text:
                    reasons.append(f"World Mountain: {m}")
                    is_world = True
                    cat = 'Mountains, Passes & Plateaus'
                    break
                    
        # 7. Indian Rivers
        if not cat:
            for ir in INDIA_RIVERS:
                if ir in full_text:
                    # Filter out purely non-geo contexts (like Harappan town drainage)
                    if 'harappan' in full_text or 'indus valley civilization' in full_text:
                        continue
                    reasons.append(f"Indian River: {ir}")
                    is_india = True
                    cat = 'Rivers & Drainage'
                    if any(c in full_text for c in ['tributary', 'tributaries', 'pour into', 'joins direct', 'confluence']):
                        skill = 'tributary_confluence'
                    elif any(c in full_text for c in ['north to south', 'south to north', 'west to east', 'east to west', 'downstream']):
                        skill = 'spatial_ordering'
                    break
                    
        # 8. Indian Relief & Passes
        if not cat:
            for rp in INDIA_RELIEF_PASSES:
                if rp in full_text:
                    reasons.append(f"Indian Relief/Pass: {rp}")
                    is_india = True
                    cat = 'Mountains, Passes & Plateaus'
                    if any(c in full_text for c in ['north to south', 'south to north', 'west to east', 'order']):
                        skill = 'spatial_ordering'
                    break
                    
        # 9. Indian Coast & Islands
        if not cat:
            for ci in INDIA_COAST_ISLANDS:
                if ci in full_text:
                    reasons.append(f"Indian Coast/Island: {ci}")
                    is_india = True
                    cat = 'Seas, Straits & Water Bodies'
                    break
                    
        # 10. Indian Protected Areas with explicit location/spatial orientation
        if not cat:
            for pa in INDIA_PROTECTED_AREAS:
                if pa in full_text:
                    # check if the question tests spatial location / state / river basin
                    if any(loc in full_text for loc in ['located in', 'situated in', 'state', 'river', 'flows through', 'climate varies', 'north to south', 'spread across', 'boundary of']):
                        reasons.append(f"Protected Area Location: {pa}")
                        is_india = True
                        cat = 'Protected Areas & Biogeography'
                        break

        # Check existing mapping flag
        existing_is_map = q.get('is_mapping', False)
        if existing_is_map and not cat:
            reasons.append("Existing is_mapping: true")
            cat = q.get('mapping', {}).get('category', 'Other')
            is_india = q.get('mapping', {}).get('region') == 'India'
            is_world = q.get('mapping', {}).get('region') == 'World'
            skill = q.get('mapping', {}).get('spatial_skill', 'location_identification')

        if cat:
            region = 'World' if is_world else ('India' if is_india else 'India')
            all_candidates.append({
                'year': yr,
                'q_num': q_num,
                'current_node_id': q.get('node_id', ''),
                'current_subject': q.get('subject', ''),
                'current_domain': q.get('domain', ''),
                'current_subtopic': sub_topic,
                'existing_is_mapping': existing_is_map,
                'detected_category': cat,
                'detected_region': region,
                'detected_skill': skill,
                'reasons': reasons,
                'question_en': q_en[:120]
            })

print(f"\nTotal potential mapping candidates detected across 2011–2025: {len(all_candidates)}")

# Group by year
by_year = {}
for c in all_candidates:
    by_year[c['year']] = by_year.get(c['year'], 0) + 1

for yr, count in sorted(by_year.items()):
    print(f" - {yr}: {count} candidates")

with open('scratch/deep_mapping_candidates.json', 'w', encoding='utf-8') as f:
    json.dump(all_candidates, f, indent=2, ensure_ascii=False)
