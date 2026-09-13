import sys, json

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

def best_match(subject_prefix, keywords):
    matches = []
    for nid, n in nodes.items():
        if not nid.startswith(subject_prefix):
            continue
        score = 0
        nid_l = nid.lower()
        name_l = n['name'].lower()
        desc_l = (n.get('description') or '').lower()
        for kw in keywords:
            kw_l = kw.lower()
            if kw_l in nid_l:
                score += 3
            if kw_l in name_l:
                score += 2
            if kw_l in desc_l:
                score += 1
        if score > 0:
            matches.append((score, nid, n['name'], n['levelName']))
    matches.sort(key=lambda x: x[0], reverse=True)
    return matches[:3]

queries = [
    ('geography_earth_systems', ['karnataka', 'agriculture']),
    ('science_technology_defence', ['applied_chemistry', 'chemistry']),
    ('science_technology_defence', ['applied_physics', 'physics']),
    ('science_technology_defence', ['applied_biology', 'biology']),
    ('science_technology_defence', ['space', 'satellite', 'isro']),
    ('geography_earth_systems', ['physiography', 'northern_plains', 'plains']),
    ('indian_polity_constitution_governance', ['inter-state', 'fiscal', 'centre-state']),
    ('international_relations_global_institutions', ['plurilateral', 'regional', 'international_organisations']),
    ('indian_polity_constitution_governance', ['anti-defection', 'elections', 'parliament']),
    ('indian_polity_constitution_governance', ['subordinate', 'judiciary']),
    ('indian_polity_constitution_governance', ['parliamentary_procedures', 'parliament']),
    ('indian_polity_constitution_governance', ['making_of_the_constitution', 'constituent']),
    ('indian_society_social_justice', ['women', 'welfare_schemes']),
    ('history', ['vijayanagara', 'karnataka']),
    ('history', ['maratha', 'shivaji']),
    ('history', ['keladi', 'karnataka']),
    ('history', ['constitutional_development', 'british']),
    ('history', ['western_gangas', 'karnataka', 'kadambas']),
    ('history', ['advent_of_europeans', 'trade', 'struggle']),
    ('history', ['nationalist_movement', 'gandhian', 'quit_india']),
    ('art_culture_heritage', ['theatre', 'performing_arts', 'music']),
    ('art_culture_heritage', ['literature', 'classical', 'kannada']),
    ('indian_economy_development', ['employment', 'labour']),
    ('indian_economy_development', ['agriculture', 'pricing', 'food']),
    ('environment_ecology_disaster_management', ['water_pollution', 'marine_pollution', 'pollution']),
    ('environment_ecology_disaster_management', ['environmental_legislation', 'institutions']),
    ('environment_ecology_disaster_management', ['biodiversity', 'wildlife', 'protected_areas']),
    ('ethics_integrity_aptitude', ['dimensions_of_ethics', 'essence']),
    ('ethics_integrity_aptitude', ['codes_of_conduct', 'probity', 'citizen_charters']),
    ('ethics_integrity_aptitude', ['human_values', 'family', 'society']),
    ('ethics_integrity_aptitude', ['ethical_dilemmas', 'case_studies']),
    ('ethics_integrity_aptitude', ['emotional_intelligence']),
    ('international_relations_global_institutions', ['foreign_policy', 'bilateral_relations', 'relations_with_major']),
    ('science_technology_defence', ['computing', 'high-performance', 'quantum', 'digital_infrastructure']),
    ('history', ['wodeyars', 'mysore', 'princely', 'colonial']),
    ('geography_earth_systems', ['plate_tectonics', 'continental_drift', 'interior'])
]

for sp, kws in queries:
    m = best_match(sp, kws)
    print(f"\nQuery: {sp} {kws}")
    for score, nid, name, lvl in m:
        print(f"  [{score}] {nid} ({lvl}) - {name}")
