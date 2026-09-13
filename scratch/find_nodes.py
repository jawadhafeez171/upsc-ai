# -*- coding: utf-8 -*-
"""
Generate and test full mappings for HK and NHK.
"""
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

# Let's inspect relevant node ids for various topics in HK:
topics_to_find = [
    # Demographics / Census
    'demographic', 'census',
    # Iron and steel / Industries
    'primary_secondary', 'industries',
    # Karnataka Agriculture
    'agriculture_irrigation_agro-climatic',
    # Everyday phenomena / science
    'everyday_scientific', 'applied_fundamental',
    # Northern plains / Geomorphology
    'physiographic_divisions', 'plains',
    # GST / Fiscal federalism
    'federal_structure', 'inter-state',
    # Coal reserves
    'natural_resources', 'mineral_power',
    # G7 / International
    'regional_plurilateral', 'global_institutions',
    # Anti-defection
    'anti-defection', 'elections', 'parliament',
    # Advocate General / State Executive
    'state_executive', 'union_executive',
    # District judges / Subordinate Courts
    'subordinate_courts', 'judiciary',
    # Citizenship / Article 1
    'citizenship', 'historical_foundations',
    # Council of ministers
    'union_executive',
    # Governor veto
    'state_executive',
    # Sources of constitution
    'making_of_the_constitution',
    # DPSP
    'directive_principles',
    # Karnataka Housing / Schemes
    'welfare_schemes', 'social_sector',
    # Vijayanagara
    'vijayanagara',
    # Mughal
    'mughal',
    # Shivaji / Maratha
    'maratha',
    # Keladi Nayakas / Shivappa Nayaka
    'keladi', 'karnataka',
    # Presidents of India
    'union_executive',
    # GoI Act 1919
    'constitutional_development',
    # Plato / Political thought
    'world_history',
    # Babur / First Panipat
    'mughal',
    # Mahajanapadas
    'mahajanapadas',
    # Satavahanas
    'south_indian_kingdoms', 'satavahana',
    # Durvinitha / Gangas
    'history_of_karnataka', 'gangas',
    # Cornwallis / Police reforms
    'administrative_judicial_police',
    # European advent / Portuguese
    'carnatic_wars', 'british_expansion', 'advent',
    # Samudragupta coins
    'gupta',
    # Ganga capitals
    'history_of_karnataka',
    # Theatre / Gubbi Veeranna
    'theatre', 'performing_arts',
    # Battle of Hooghly / Dutch
    'advent_of_europeans', 'expansion',
    # Individual Satyagraha
    'nationalist_movement', 'gandhian',
    # Buddhist councils
    'buddhism',
    # Vedic period
    'vedic',
    # Mallakhamb / Sports
    'traditional_sports', 'performing_arts', 'culture',
    # Gig economy
    'employment', 'labour', 'industrial_policy',
    # MSP / CACP
    'agricultural_pricing', 'agriculture',
    # Harijan newspaper
    'press', 'nationalist_movement',
    # Shahanama / Firdausi
    'medieval', 'literature',
    # Tooth decay / Acids
    'applied_fundamental', 'chemistry',
    # CFCs / Ozone
    'climate_change', 'environmental_pollution',
    # Hearing aid / Mercury cell
    'applied_fundamental',
    # Digestive diseases
    'biotechnology_health',
    # RNAi
    'biotechnology',
    # National Forest Policy 1988
    'biodiversity', 'forest', 'environmental_legislation',
    # Fish classification
    'applied_fundamental',
    # Combustion / soot
    'applied_fundamental',
    # Flex fuel / Biofuels
    'energy', 'applied_fundamental',
    # Quantitative Aptitude & GMA
    'quantitative_aptitude', 'general_mental_ability',
    # Space / Telstar / Satellites
    'space_technology',
    # Constellations / Astronomy
    'space_technology_astronomy',
    # Friction / Pascal's law
    'applied_fundamental',
    # Minamata / Mercury
    'environmental_pollution',
    # NEERI
    'environmental_legislation',
    # Ethics
    'ethics_human_interface', 'probity_in_governance',
    # Gravitation / Weightlessness
    'applied_fundamental',
    # LED
    'applied_fundamental',
    # Khet Bachao / Agriculture
    'agriculture',
    # Indira Lankesh / Literature
    'literature', 'kannada_literature',
    # FIFA / Sports
    'sports',
    # Co-curricular ethics
    'case_studies', 'ethics_human_interface',
    # Emotional intelligence
    'emotional_intelligence',
    # Prime Ministers / World
    'global_institutions',
    # ENIAC / Grace Hopper / Computers
    'information_communication_technology',
    # Chief Ministers / States
    'union_executive_state_executive',
    # Shivanasamudra
    'history_of_karnataka',
    # Padma Awards
    'art_culture_heritage',
    # World tribes
    'human_geography',
    # Isolines
    'climatology', 'physical_geography',
    # Karnataka National Parks
    'biodiversity_wildlife_conservation',
    # Rift valley / Faulting
    'physical_geography_earth_systems',
    # Nobel Peace Prize
    'international_relations',
    # Kamaladevi Chattopadhyay
    'history_of_karnataka', 'modern_india'
]

print("Scanning KG for exact node matches...")
found = {}
for qk in topics_to_find:
    matches = [nid for nid in nodes if qk in nid.lower()]
    if matches:
        found[qk] = matches[:3]

print(f"Matched {len(found)} / {len(topics_to_find)} topic terms.")
