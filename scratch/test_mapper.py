# -*- coding: utf-8 -*-
"""
Test script to build and validate PC mappings for both HK and NHK datasets.
"""
import json
import sys
import os

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
root_subject_ids = kg['rootSubjectIds']

CANONICAL_SUBJECTS = {
    'history': ('History', 'ಇತಿಹಾಸ'),
    'art_culture_heritage': ('Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ'),
    'geography_earth_systems': ('Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು'),
    'indian_society_social_justice': ('Indian Society & Social Justice', 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ'),
    'indian_polity_constitution_governance': ('Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ'),
    'international_relations_global_institutions': ('International Relations & Global Institutions', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು'),
    'indian_economy_development': ('Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ'),
    'environment_ecology_disaster_management': ('Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ'),
    'science_technology_defence': ('Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ'),
    'internal_security': ('Internal Security', 'ಆಂತರಿಕ ಭದ್ರತೆ'),
    'ethics_integrity_aptitude': ('Ethics, Integrity & Aptitude', 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ'),
    'general_mental_ability_quantitative_aptitude_comprehension': ('General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ'),
    'language_proficiency_grammar_communication': ('Language Proficiency, Grammar & Communication', 'ಭಾಷಾ ಪ್ರಾವೀಣ್ಯತೆ, ವ್ಯಾಕರಣ ಮತ್ತು ಸಂವಹನ'),
}

print("Canonical subjects loaded:", len(CANONICAL_SUBJECTS))
