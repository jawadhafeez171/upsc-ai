import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)

nodes = master_kg['nodes']

# Define Tier 1 subject keyword indicators
SUBJECT_KEYWORDS = {
    'history': ['ancient', 'medieval', 'modern', 'british', 'colonial', 'congress', 'gandhi', 'freedom struggle', 'revolt', 'mughal', 'sultanate', 'chola', 'harappan', 'indus valley', 'edict', 'satyagraha', 'viceroy', 'inc', 'quit india', 'swadeshi', 'khilafat', 'simon commission', 'vedic', 'buddhism', 'jainism', 'ashoka', 'maratha', 'vijayanagara', 'ushamehta', 'usha mehta'],
    'indian_polity_constitution_governance': ['constitution', 'constitutional', 'parliament', 'president', 'governor', 'lok sabha', 'rajya sabha', 'fundamental right', 'fundamental duty', 'dpsp', 'article', 'amendment', 'bill', 'judiciary', 'supreme court', 'high court', 'panchayat', '73rd', '74th', 'finance commission', 'election commission', 'attorney general', 'union executive', 'legislature', 'ordinance', 'councils', 'zonal council', 'statutory', 'cpc', 'crpc', 'planning committee'],
    'indian_economy_development': ['gdp', 'inflation', 'rbi', 'bank rate', 'monetary policy', 'fiscal deficit', 'union budget', 'tax', 'value added tax', 'vat', 'gst', 'balance of payments', 'fdi', 'fii', 'disinvestment', 'teaser loan', 'closed economy', 'credit', 'inclusive growth', 'base effect', 'demographic dividend', 'microfinance', 'mega food park', 'consolidated fund', 'contingency fund', 'vote-on-account', 'interim budget', 'psu', 'cpse', 'commercial bank'],
    'geography_earth_systems': ['troposphere', 'stratosphere', 'ionosphere', 'atmosphere', 'climate', 'monsoon', 'rainfall', 'cyclone', 'river', 'tributaries', 'tributary', 'mountain', 'pass', 'ocean current', 'tide', 'continental drift', 'plate tectonics', 'westerlies', 'landlocked', 'border', 'strait', 'ganga', 'brahmaputra', 'indus', 'mekong', 'irrawady', 'la nina', 'el nino', 'desert', 'salinization', 'lower gangetic', 'brent crude'],
    'environment_ecology_disaster_management': ['biodiversity', 'ecosystem', 'food chain', 'trophic', 'endangered', 'iucn', 'red data book', 'national park', 'wildlife sanctuary', 'tiger reserve', 'biosphere reserve', 'wetland', 'ramsar', 'pollution', 'thermal power plant', 'algal bloom', 'carbon credit', 'kyoto', 'climate change', 'greenhouse', 'bioremediation', 'oilzapper', 'mangrove', 'tsunami', 'in-situ', 'ex-situ', 'rain forest'],
    'science_technology_defence': ['dna', 'rna', 'stem cell', 'genetic', 'bt-brinjal', 'golden rice', 'nano', 'satellite', 'orbit', 'laser', 'led', 'cfl', 'bluetooth', 'wi-fi', 'blu-ray', 'optical disc', 'heavy water', 'nuclear reactor', 'aspartame', 'artificial satellite', 'asteroid', 'comet', 'vpn', 'virtual private network', 'bioasphalt']
}

def detect_subject(text):
    text_low = text.lower()
    scores = {}
    for subj, kws in SUBJECT_KEYWORDS.items():
        score = sum(3 for kw in kws if re.search(r'\b' + re.escape(kw) + r'\b', text_low))
        scores[subj] = score
    
    # special boosts
    if any(w in text_low for w in ['biodiversity', 'carbon credit', 'iucn', 'ecosystem']):
        scores['environment_ecology_disaster_management'] += 5
    if any(w in text_low for w in ['satellite', 'cfl', 'led', 'bluetooth', 'stem cell']):
        scores['science_technology_defence'] += 5
    if any(w in text_low for w in ['river', 'tributary', 'westerlies', 'stratosphere']):
        scores['geography_earth_systems'] += 5
    if any(w in text_low for w in ['gandhi', 'freedom struggle', 'colonial']):
        scores['history'] += 5
        
    best_subj = max(scores.items(), key=lambda x: x[1])
    return best_subj[0] if best_subj[1] > 0 else 'geography_earth_systems'

with open('src/data/upsc_pyq/2011.json', 'r', encoding='utf-8') as f:
    data_2011 = json.load(f)

print("--- Testing Tier 1 Subject Detector on 2011 (First 35 Questions) ---")
for q in data_2011[:35]:
    q_num = q.get('question_number')
    q_en = q.get('question_english', '')
    expl = q.get('explanation_english', '')
    comb = f"{q_en} {expl}"
    subj = detect_subject(comb)
    print(f"Q{q_num:02d}: {subj} | {q_en[:65].replace(chr(10), ' ')}...")
