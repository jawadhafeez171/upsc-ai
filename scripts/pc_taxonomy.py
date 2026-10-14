import json
import os
import sys
import re

sys.stdout.reconfigure(encoding='utf-8')

# 1. Load Master Knowledge Graph
with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg['nodes']
print(f"Loaded Master Knowledge Graph: {len(nodes)} nodes.")

def v(nid):
    if nid not in nodes:
        raise ValueError(f"CRITICAL INVALID NODE: {nid}")
    return nid

# Canonical Subject Kannada Translations
SUBJECT_KANNADA = {
    'History': 'ಇತಿಹಾಸ',
    'Geography & Earth Systems': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
    'Indian Polity, Constitution & Governance': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
    'Science, Technology & Defence': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
    'General Mental Ability, Quantitative Aptitude & Comprehension': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
    'Indian Economy & Development': 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
    'Environment, Ecology & Disaster Management': 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ',
    'Art, Culture & Heritage': 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ',
    'Internal Security': 'ಆಂತರಿಕ ಭದ್ರತೆ',
    'International Relations & Global Institutions': 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು',
    'Indian Society & Social Justice': 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ',
    'Ethics, Integrity & Aptitude': 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ',
    'Language Proficiency, Grammar & Communication (general Kannada & General English)': 'ಭಾಷಾ ಪ್ರಾವೀಣ್ಯತೆ, ವ್ಯಾಕರಣ ಮತ್ತು ಸಂವಹನ (ಸಾಮಾನ್ಯ ಕನ್ನಡ ಮತ್ತು ಇಂಗ್ಲಿಷ್)',
    'Language Proficiency, Grammar & Communication': 'ಭಾಷಾ ಪ್ರಾವೀಣ್ಯತೆ, ವ್ಯಾಕರಣ ಮತ್ತು ಸಂವಹನ',
    'Communication Paper': 'ಸಂವಹನ ಪತ್ರಿಕೆ',
    'Communication Paper (General Kannada, General English & Computer Knowledge)': 'ಸಂವಹನ ಪತ್ರಿಕೆ (ಸಾಮಾನ್ಯ ಕನ್ನಡ, ಸಾಮಾನ್ಯ ಇಂಗ್ಲಿಷ್ ಮತ್ತು ಗಣಕಯಂತ್ರ ಜ್ಞಾನ)'
}

DOMAIN_KANNADA = {
    'General Kannada (ಸಾಮಾನ್ಯ ಕನ್ನಡ)': 'ಸಾಮಾನ್ಯ ಕನ್ನಡ',
    'General English (ಸಾಮಾನ್ಯ ಇಂಗ್ಲಿಷ್)': 'ಸಾಮಾನ್ಯ ಇಂಗ್ಲಿಷ್',
    'Computer Knowledge & Literacy (ಗಣಕಯಂತ್ರ ಜ್ಞಾನ)': 'ಗಣಕಯಂತ್ರ ಜ್ಞಾನ ಮತ್ತು ಕಂಪ್ಯೂಟರ್ ಸಾಕ್ಷರತೆ',
    'General Kannada': 'ಸಾಮಾನ್ಯ ಕನ್ನಡ',
    'General English': 'ಸಾಮಾನ್ಯ ಇಂಗ್ಲಿಷ್',
    'Computer Knowledge': 'ಗಣಕಯಂತ್ರ ಜ್ಞಾನ',
    'Ancient Indian History': 'ಪ್ರಾಚೀನ ಭಾರತದ ಇತಿಹಾಸ',
    'Ancient India': 'ಪ್ರಾಚೀನ ಭಾರತ',
    'Medieval India': 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ',
    'Modern India': 'ಆಧುನಿಕ ಭಾರತ',
    'Indian Freedom Struggle': 'ಭಾರತೀಯ ಸ್ವಾತಂತ್ರ್ಯ ಸಂಗ್ರಾಮ',
    'Post-Independence India': 'ಸ್ವಾತಂತ್ರ್ಯೋತ್ತರ ಭಾರತ',
    'World History': 'ವಿಶ್ವ ಇತಿಹಾಸ',
    'History of Karnataka': 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ',
    'Geography of Karnataka': 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ',
    'Physical Geography & Earth Systems (Geomorphology)': 'ಭೌತಿಕ ಭೂಗೋಳ ಮತ್ತು ಭೂರೂಪಶಾಸ್ತ್ರ',
    'Physical Geography & Earth Systems': 'ಭೌತಿಕ ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
    'Climatology': 'ವಾಯುಗುಣಶಾಸ್ತ್ರ',
    'Oceanography & Marine Systems': 'ಸಮುದ್ರಶಾಸ್ತ್ರ',
    'Indian Physical Geography & Monsoon Architecture': 'ಭಾರತದ ಭೌತಿಕ ಭೂಗೋಳ ಮತ್ತು ಮಾನ್ಸೂನ್ ರಚನೆ',
    'Indian Mapping & Spatial Geography': 'ಭಾರತೀಯ ನಕ್ಷೆ ಮತ್ತು ಪ್ರಾದೇಶಿಕ ಭೂಗೋಳ',
    'Economic & Resource Geography': 'ಆರ್ಥಿಕ ಮತ್ತು ಸಂಪನ್ಮೂಲ ಭೂಗೋಳಶಾಸ್ತ್ರ',
    'Human Geography & Population Settlements': 'ಮಾನವ ಭೂಗೋಳ ಮತ್ತು ಜನಸಂಖ್ಯಾ ವಸಾಹತುಗಳು',
    'World Mapping & Geopolitical Locations': 'ವಿಶ್ವ ನಕ್ಷೆ ಮತ್ತು ಭೌಗೋಳಿಕ ರಾಜಕೀಯ ಸ್ಥಳಗಳು',
    'Historical Background & Making of the Constitution': 'ಸಂವಿಧಾನದ ಐತಿಹಾಸಿಕ ಹಿನ್ನೆಲೆ ಮತ್ತು ರಚನೆ',
    'Salient Features, Amendments & Basic Structure': 'ಪ್ರಮುಖ ಲಕ್ಷಣಗಳು, ತಿದ್ದುಪಡಿಗಳು ಮತ್ತು ಮೂಲ ರಚನೆ',
    'Fundamental Rights, DPSP & Fundamental Duties': 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು, ಡಿಪಿಎಸ್ಪಿ ಮತ್ತು ಕರ್ತವ್ಯಗಳು',
    'Union & State Executive': 'ಕೇಂದ್ರ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ',
    'Parliament & State Legislatures': 'ಸಂಸತ್ತು ಮತ್ತು ರಾಜ್ಯ ಶಾಸಕಾಂಗಗಳು',
    'Judiciary System of India': 'ಭಾರತದ ನ್ಯಾಯಾಂಗ ವ್ಯವಸ್ಥೆ',
    'Local Governance & Decentralisation (Panchayati Raj & Urban Local Bodies)': 'ಸ್ಥಳೀಯ ಆಡಳಿತ ಮತ್ತು ಪಂಚಾಯತ್ ರಾಜ್',
    'Federal Structure, Center-State Relations & Devolution': 'ಒಕ್ಕೂಟ ರಚನೆ ಮತ್ತು ಕೇಂದ್ರ-ರಾಜ್ಯ ಸಂಬಂಧಗಳು',
    'Constitutional, Statutory & Regulatory Bodies': 'ಸಾಂವಿಧಾನಿಕ ಮತ್ತು ಶಾಸನಬದ್ಧ ಸಂಸ್ಥೆಗಳು',
    'Applied & Fundamental Sciences': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
    'Space Technology & Astronomy': 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ',
    'Defence Technology': 'ರಕ್ಷಣಾ ತಂತ್ರಜ್ಞಾನ',
    'Information & Communication Technology, AI & Cyber Security': 'ಮಾಹಿತಿ ತಂತ್ರಜ್ಞಾನ, ಎಐ ಮತ್ತು ಸೈಬರ್ ಭದ್ರತೆ',
    'Biotechnology, Health & Life Sciences': 'ಜೈವಿಕ ತಂತ್ರಜ್ಞಾನ, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವ ವಿಜ್ಞಾನ',
    'Fundamental Ecology & Ecosystem Dynamics': 'ಮೂಲಭೂತ ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ಪರಿಸರ ವ್ಯವಸ್ಥೆ',
    'Biodiversity, Wildlife Conservation & Protected Area Network': 'ಜೀವವೈವಿಧ್ಯ ಮತ್ತು ವನ್ಯಜೀವಿ ಸಂರಕ್ಷಣೆ',
    'Environmental Pollution, Waste Management & Remediation': 'ಪರಿಸರ ಮಾಲಿನ್ಯ, ತ್ಯಾಜ್ಯ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಹಾರ',
    'Climate Change, Global Warming & International Conventions': 'ಹವಾಮಾನ ಬದಲಾವಣೆ ಮತ್ತು ಜಾಗತಿಕ ತಾಪಮಾನ',
    'Hazard Profiles & Disaster Vulnerability in India': 'ವಿಪತ್ತುಗಳು ಮತ್ತು ನೈಸರ್ಗಿಕ ಅಪಾಯಗಳು',
    'Macroeconomic Fundamentals & National Income Accounting': 'ಸ್ಥೂಲ ಆರ್ಥಿಕತೆ ಮತ್ತು ರಾಷ್ಟ್ರೀಯ ಆದಾಯ',
    'Monetary Policy & Banking Architecture': 'ವಿತ್ತೀಯ ನೀತಿ ಮತ್ತು ಬ್ಯಾಂಕಿಂಗ್ ರಚನೆ',
    'Fiscal Policy, Public Finance & Taxation': 'ವಿತ್ತೀಯ ನೀತಿ, ಸಾರ್ವಜನಿಕ ಹಣಕಾಸು ಮತ್ತು ತೆರಿಗೆ',
    'Agriculture, Food Management & Subsidies': 'ಕೃಷಿ, ಆಹಾರ ನಿರ್ವಹಣೆ ಮತ್ತು ಸಬ್ಸಿಡಿಗಳು',
    'Industrial Policies, Infrastructure & Service Sector': 'ಕೈಗಾರಿಕಾ ನೀತಿಗಳು ಮತ್ತು ಮೂಲಸೌಕರ್ಯ',
    'External Sector, Balance of Payments & Foreign Trade': 'ಬಾಹ್ಯ ವಲಯ, ವಿದೇಶಿ ವ್ಯಾಪಾರ ಮತ್ತು ಪಾವತಿ ಸಮತೋಲನ',
    'Financial Markets & Capital Markets': 'ಹಣಕಾಸು ಮತ್ತು ಬಂಡವಾಳ ಮಾರುಕಟ್ಟೆಗಳು',
    'Economy & Development of Karnataka': 'ಕರ್ನಾಟಕದ ಆರ್ಥಿಕತೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
    'Quantitative Aptitude & Basic Numeracy': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲಭೂತ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
    'General Mental Ability & Logical Reasoning': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕತೆ',
    'Data Interpretation & Sufficiency': 'ದತ್ತಾಂಶ ವಿಶ್ಲೇಷಣೆ ಮತ್ತು ಸಮರ್ಪಕತೆ',
    'Indian Literature & Languages': 'ಭಾರತೀಯ ಸಾಹಿತ್ಯ ಮತ್ತು ಭಾಷೆಗಳು',
    'Art, Architecture & Cultural Heritage of Karnataka': 'ಕರ್ನಾಟಕದ ಕಲೆ, ವಾಸ್ತುಶಿಲ್ಪ ಮತ್ತು ಸಾಂಸ್ಕೃತಿಕ ಪರಂಪರೆ',
    'Performing Arts (Dance, Music, Theatre & Puppetry)': 'ಪ್ರದರ್ಶನ ಕಲೆಗಳು (ನೃತ್ಯ, ಸಂಗೀತ, ನಾಟಕ)',
    'Martial Arts, Traditional Sports & Indian Calendar Systems': 'ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಭಾರತೀಯ ಕ್ಯಾಲೆಂಡರ್',
    'Cultural Institutions, Numismatics & Heritage Governance': 'ಸಾಂಸ್ಕೃತಿಕ ಸಂಸ್ಥೆಗಳು ಮತ್ತು ರಾಷ್ಟ್ರೀಯ ಗೌರವಗಳು',
    'Security Forces & Intelligence Agencies (Statutory Mandates)': 'ಭದ್ರತಾ ಪಡೆಗಳು ಮತ್ತು ಗುಪ್ತಚರ ಸಂಸ್ಥೆಗಳು',
    'Global Institutions, Agreements & Treaties': 'ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು ಮತ್ತು ಅಂತಾರಾಷ್ಟ್ರೀಯ ಒಪ್ಪಂದಗಳು',
    "India's Foreign Policy & Bilateral Relations": 'ಭಾರತದ ವಿದೇಶಾಂಗ ನೀತಿ ಮತ್ತು ದ್ವಿಪಕ್ಷೀಯ ಸಂಬಂಧಗಳು',
    'Poverty, Inequality & Developmental Challenges': 'ಬಡತನ, ಅಸಮಾನತೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ ಸವಾಲುಗಳು',
    'Kannada Literature, Authors & Sahitya Academy Awards (ಕನ್ನಡ ಸಾಹಿತ್ಯ ಪರಿಚಯ)': 'ಕನ್ನಡ ಸಾಹಿತ್ಯ, ಲೇಖಕರು ಮತ್ತು ಸಾಹಿತ್ಯ ಅಕಾಡೆಮಿ ಪ್ರಶಸ್ತಿಗಳು'
}

print("Taxonomy dictionary ready.")
