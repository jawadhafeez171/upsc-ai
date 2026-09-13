# -*- coding: utf-8 -*-
"""
Validate all NHK question mappings before appending to enrich_pc_pyq.py.
"""
import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

NHK_MAP = {
    1: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Ancient India',
        'domain_kannada': 'ಪ್ರಾಚೀನ ಭಾರತ',
        'sub_topic': 'Indo-Roman Trade and Maritime Commerce (Sangam Era Ports)',
        'sub_topic_kannada': 'ಇಂಡೋ-ರೋಮನ್ ವ್ಯಾಪಾರ ಮತ್ತು ಕಡಲ ವಾಣಿಜ್ಯ (ಸಂಗಮ್ ಯುಗದ ಬಂದರುಗಳು)',
        'node_id': 'history.ancient_india.south_indian_kingdoms',
        'subject_tag': 'History'
    },
    2: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Modern India',
        'domain_kannada': 'ಆಧುನಿಕ ಭಾರತ',
        'sub_topic': 'Press and Nationalist Periodicals (Socio-Religious Reform Journalism)',
        'sub_topic_kannada': 'ಸ್ವಾತಂತ್ರ್ಯ ಚಳವಳಿಯ ಪತ್ರಿಕೋದ್ಯಮ ಮತ್ತು ನಿಯತಕಾಲಿಕೆಗಳು',
        'node_id': 'history.modern_india.socio-religious_reform_movements',
        'subject_tag': 'History'
    },
    3: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'History of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ',
        'sub_topic': 'Western Gangas of Talakad (Dynastic Architecture and Inscriptions)',
        'sub_topic_kannada': 'ತಲಕಾಡಿನ ಪಶ್ಚಿಮ ಗಂಗರು (ವಾಸ್ತುಶಿಲ್ಪ ಮತ್ತು ಶಾಸನಗಳು)',
        'node_id': 'history.history_of_karnataka.ancient_dynasties_of_karnataka.western_gangas_of_talakad',
        'subject_tag': 'History'
    },
    4: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Ancient India',
        'domain_kannada': 'ಪ್ರಾಚೀನ ಭಾರತ',
        'sub_topic': 'Mauryan Administration & Functionaries (Role of Samaharta - Chief Revenue Collector)',
        'sub_topic_kannada': 'ಮೌರ್ಯರ ಆಡಳಿತ ವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಧಿಕಾರಿಗಳು (ಸಮಾಹರ್ತ - ಕಂದಾಯ ಮುಖ್ಯಸ್ಥ)',
        'node_id': 'history.ancient_india.mauryan_empire',
        'subject_tag': 'History'
    },
    5: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Ancient India',
        'domain_kannada': 'ಪ್ರಾಚೀನ ಭಾರತ',
        'sub_topic': 'Gupta Literature and Scholarship (Kalidasa, Amarasimha, Navaratnas)',
        'sub_topic_kannada': 'ಗುಪ್ತರ ಕಾಲದ ಸಾಹಿತ್ಯ ಮತ್ತು ವಿದ್ವತ್ ಪರಂಪರೆ (ಕಾಳಿದಾಸ, ಅಮರಸಿಂಹ, ನವರತ್ನರು)',
        'node_id': 'history.ancient_india.gupta_empire',
        'subject_tag': 'History'
    },
    6: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'History of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ',
        'sub_topic': 'Western Chalukyas of Kalyana (Capitals: Manyakheta and Kalyana)',
        'sub_topic_kannada': 'ಕಲ್ಯಾಣದ ಪಶ್ಚಿಮ ಚಾಲುಕ್ಯರು (ರಾಜಧಾನಿಗಳು: ಮಾನ್ಯಖೇಟ ಮತ್ತು ಕಲ್ಯಾಣ)',
        'node_id': 'history.history_of_karnataka.medieval_dynasties_of_karnataka.western_chalukyas_of_kalyana_later_chalukyas',
        'subject_tag': 'History'
    },
    7: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Modern India',
        'domain_kannada': 'ಆಧುನಿಕ ಭಾರತ',
        'sub_topic': 'Indigo Revolt (1859–60) & Dinabandhu Mitra\'s Nil Darpan (Bengali Drama)',
        'sub_topic_kannada': 'ನೀಲಿ ದಂಗೆ (1859-60) ಮತ್ತು ದೀನಬಂಧು ಮಿತ್ರರ ನೀಲ ದರ್ಪಣ್ (ಬಂಗಾಳಿ ನಾಟಕ)',
        'node_id': 'history.modern_india.early_peasant_tribal_civil_uprisings.peasant_movements',
        'subject_tag': 'History'
    },
    8: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Modern India',
        'domain_kannada': 'ಆಧುನಿಕ ಭಾರತ',
        'sub_topic': 'Battle of Wandiwash (1760) & French Defeat in Third Carnatic War',
        'sub_topic_kannada': 'ವಂದಿವಾಸಿ ಕದನ (1760) ಮತ್ತು ಮೂರನೇ ಕರ್ನಾಟಕ ಯುದ್ಧದಲ್ಲಿ ಫ್ರೆಂಚರ ಸೋಲು',
        'node_id': 'history.modern_india.advent_of_european_traders_anglo-french_rivalry.anglo-french_carnatic_wars',
        'subject_tag': 'History'
    },
    9: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Indian Freedom Struggle',
        'domain_kannada': 'ಭಾರತೀಯ ಸ್ವಾತಂತ್ರ್ಯ ಸಂಗ್ರಾಮ',
        'sub_topic': 'Lord Irwin Administration (Deepavali Declaration 1929 & Gandhi-Irwin Pact 1931)',
        'sub_topic_kannada': 'ಲಾರ್ಡ್ ಇರ್ವಿನ್ ಆಡಳಿತಾವಧಿ (ದೀಪಾವಳಿ ಘೋಷಣೆ 1929 ಮತ್ತು ಗಾಂಧಿ-ಇರ್ವಿನ್ ಒಪ್ಪಂದ 1931)',
        'node_id': 'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement.round_table_conferences_pacts',
        'subject_tag': 'History'
    },
    10: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'History of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ',
        'sub_topic': 'Khadi Movement & First Government-Managed Khadi Production Unit in Karnataka (Badanavalu)',
        'sub_topic_kannada': 'ಖಾದಿ ಚಳವಳಿ ಮತ್ತು ಕರ್ನಾಟಕದ ಮೊದಲ ಸರ್ಕಾರಿ ಖಾದಿ ಉತ್ಪಾದನಾ ಕೇಂದ್ರ (ಬದನವಾಳು)',
        'node_id': 'history.history_of_karnataka.armed_resistance_freedom_movement_in_karnataka.nationalist_movement_gandhian_agitations_in_karnataka',
        'subject_tag': 'History'
    },
    11: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Modern India',
        'domain_kannada': 'ಆಧುನಿಕ ಭಾರತ',
        'sub_topic': 'Mughal Emperor Farrukhsiyar\'s 1717 Royal Farman to East India Company in Bengal',
        'sub_topic_kannada': 'ಮೊಘಲ್ ಚಕ್ರವರ್ತಿ ಫರೂಕ್‌ಶಿಯರ್‌ನ 1717 ರ ಬಂಗಾಳ ರಾಯಲ್ ಫರ್ಮಾನು',
        'node_id': 'history.modern_india.british_conquest_consolidation_of_india.british_conquest_of_bengal',
        'subject_tag': 'History'
    },
    12: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Ancient India',
        'domain_kannada': 'ಪ್ರಾಚೀನ ಭಾರತ',
        'sub_topic': 'Indus Valley Civilization Sites & Associated Rivers (Harappa, Mohenjodaro, Lothal, Kalibangan)',
        'sub_topic_kannada': 'ಸಿಂಧೂ ಕಣಿವೆ ನಾಗರಿಕತೆಯ ನೆಲೆಗಳು ಮತ್ತು ಸಂಬಂಧಿತ ನದಿಗಳು (ಹರಪ್ಪಾ, ಮೊಹೆಂಜೊದಾರೊ, ಲೋಥಾಲ್, ಕಾಲಿಬಂಗನ್)',
        'node_id': 'history.ancient_india.indus_valley_civilization',
        'subject_tag': 'History'
    },
    13: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Ancient India',
        'domain_kannada': 'ಪ್ರಾಚೀನ ಭಾರತ',
        'sub_topic': 'Prehistoric India & Mesolithic Age Microlithic Stone Tool Technology',
        'sub_topic_kannada': 'ಇತಿಹಾಸಪೂರ್ವ ಭಾರತ ಮತ್ತು ಮಧ್ಯಶಿಲಾಯುಗದ ಮೈಕ್ರೋಲಿತ್ (ಸೂಕ್ಷ್ಮಶಿಲಾ) ಉಪಕರಣ ತಂತ್ರಜ್ಞಾನ',
        'node_id': 'history.ancient_india.prehistoric_india',
        'subject_tag': 'History'
    },
    14: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'History of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ',
        'sub_topic': 'Kadambas of Banavasi & Mayurasharma Chandravalli Tank Inscription',
        'sub_topic_kannada': 'ಬನವಾಸಿಯ ಕದಂಬರು ಮತ್ತು ಮಯೂರವರ್ಮನ ಚಂದ್ರವಳ್ಳಿ ಶಾಸನ (ಕೆರೆ ನಿರ್ಮಾಣ)',
        'node_id': 'history.history_of_karnataka.ancient_dynasties_of_karnataka.kadambas_of_banavasi',
        'subject_tag': 'History'
    },
    15: {
        'subject': 'Art, Culture & Heritage',
        'subject_kannada': 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ',
        'domain': 'Martial Arts, Traditional Sports & Calendars',
        'domain_kannada': 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು',
        'sub_topic': 'International Sports Trophies & Tournaments (Thomas Cup, Uber Cup, Davis Cup, Ryder Cup)',
        'sub_topic_kannada': 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಕ್ರೀಡಾ ಟ್ರೋಫಿಗಳು ಮತ್ತು ಪಂದ್ಯಾವಳಿಗಳು (ಥಾಮಸ್ ಕಪ್, ಉಬರ್ ಕಪ್, ಡೇವಿಸ್ ಕಪ್, ರೈಡರ್ ಕಪ್)',
        'node_id': 'art_culture_heritage.martial_arts_traditional_sports_calendars',
        'subject_tag': 'Art, Culture & Heritage'
    },
    16: {
        'subject': 'Indian Society & Social Justice',
        'subject_kannada': 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ',
        'domain': 'Welfare Schemes for Vulnerable Sections',
        'domain_kannada': 'ದುರ್ಬಲ ವರ್ಗಗಳ ಕಲ್ಯಾಣ ಯೋಜನೆಗಳು',
        'sub_topic': 'POSHAN Abhiyaan (National Nutrition Mission) & ICDS Implementation',
        'sub_topic_kannada': 'ಪೋಷಣ್ ಅಭಿಯಾನ (ರಾಷ್ಟ್ರೀಯ ಪೌಷ್ಟಿಕತಾ ಅಭಿಯಾನ) ಮತ್ತು ಐಸಿಡಿಎಸ್',
        'node_id': 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups',
        'subject_tag': 'Indian Society & Social Justice'
    },
    17: {
        'subject': 'Indian Society & Social Justice',
        'subject_kannada': 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ',
        'domain': 'Welfare Schemes for Vulnerable Sections',
        'domain_kannada': 'ದುರ್ಬಲ ವರ್ಗಗಳ ಕಲ್ಯಾಣ ಯೋಜನೆಗಳು',
        'sub_topic': 'NAMASTE Scheme (National Action for Mechanised Sanitation Ecosystem)',
        'sub_topic_kannada': 'ನಮಸ್ತೆ ಯೋಜನೆ (ಯಾಂತ್ರಿಕೃತ ನೈರ್ಮಲ್ಯ ಪರಿಸರ ವ್ಯವಸ್ಥೆಗಾಗಿ ರಾಷ್ಟ್ರೀಯ ಕ್ರಿಯಾ ಯೋಜನೆ)',
        'node_id': 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups',
        'subject_tag': 'Indian Society & Social Justice'
    },
    18: {
        'subject': 'Indian Economy & Development',
        'subject_kannada': 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
        'domain': 'External Sector, Balance of Payments & Foreign Trade',
        'domain_kannada': 'ವಿದೇಶಿ ವಲಯ, ಪಾವತಿಗಳ ಶಿಲ್ಕು ಮತ್ತು ವಿದೇಶಿ ವ್ಯಾಪಾರ',
        'sub_topic': 'WTO TRIPS Agreement & Intellectual Property Rights (Geographical Indications)',
        'sub_topic_kannada': 'ವಿಶ್ವ ವ್ಯಾಪಾರ ಸಂಸ್ಥೆಯ ಟ್ರಿಪ್ಸ್ (TRIPS) ಒಪ್ಪಂದ ಮತ್ತು ಭೌಗೋಳಿಕ ಸೂಚ್ಯಂಕಗಳು (GI)',
        'node_id': 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.foreign_trade_policy_international_agreements',
        'subject_tag': 'Indian Economy & Development'
    },
    19: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Ancient India',
        'domain_kannada': 'ಪ್ರಾಚೀನ ಭಾರತ',
        'sub_topic': 'Satavahana Rock-Cut Architecture & Chaitya Halls (Karle, Bhaja, Kanheri, Bedsa, Amaravati)',
        'sub_topic_kannada': 'ಶಾತವಾಹನರ ಬಂಡೆಗಲ್ಲಿನ ವಾಸ್ತುಶಿಲ್ಪ ಮತ್ತು ಚೈತ್ಯಗಳು (ಕಾರ್ಲೆ, ಭಾಜಾ, ಕನ್ಹೇರಿ, ಬೆಡ್ಸಾ, ಅಮರಾವತಿ)',
        'node_id': 'history.ancient_india.south_indian_kingdoms',
        'subject_tag': 'History'
    },
    20: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'History of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ',
        'sub_topic': 'Karnataka Unification Movement & First Unification Conference at Dharwad (1920)',
        'sub_topic_kannada': 'ಕರ್ನಾಟಕ ಏಕೀಕರಣ ಚಳವಳಿ ಮತ್ತು ಧಾರವಾಡದಲ್ಲಿ ಪ್ರಥಮ ಏಕೀಕರಣ ಸಮ್ಮೇಳನ (1920)',
        'node_id': 'history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation.karnataka_ekikarana_movement',
        'subject_tag': 'History'
    },
    21: {
        'subject': 'Art, Culture & Heritage',
        'subject_kannada': 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ',
        'domain': 'Martial Arts, Traditional Sports & Calendars',
        'domain_kannada': 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು',
        'sub_topic': 'Grand Slam Tennis Championships & Court Surfaces (Wimbledon, Roland Garros, US Open, Australian Open)',
        'sub_topic_kannada': 'ಗ್ರ್ಯಾಂಡ್‌ಸ್ಲಾಂ ಟೆನ್ನಿಸ್ ಪಂದ್ಯಾವಳಿಗಳು ಮತ್ತು ಕೋರ್ಟ್ ವಿಧಗಳು (ವಿಂಬಲ್ಡನ್, ರೋಲ್ಯಾಂಡ್ ಗ್ಯಾರೋಸ್, ಯುಎಸ್ ಓಪನ್, ಆಸ್ಟ್ರೇಲಿಯನ್ ಓಪನ್)',
        'node_id': 'art_culture_heritage.martial_arts_traditional_sports_calendars',
        'subject_tag': 'Art, Culture & Heritage'
    },
    22: {
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_kannada': 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ',
        'domain': 'Environmental Pollution, Waste Management & Remediation',
        'domain_kannada': 'ಪರಿಸರ ಮಾಲಿನ್ಯ, ತ್ಯಾಜ್ಯ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಹಾರೋಪಾಯಗಳು',
        'sub_topic': 'Persistent Organic Pollutants (DDT) & Biomagnification Hazards',
        'sub_topic_kannada': 'ನಿರಂತರ ಸಾವಯವ ಮಾಲಿನ್ಯಕಾರಕಗಳು (ಡಿಡಿಟಿ) ಮತ್ತು ಜೈವಿಕ ಸಾಂದ್ರೀಕರಣದ ಅಪಾಯಗಳು',
        'node_id': 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.land_degradation_soil_pollution_desertification',
        'subject_tag': 'Environment, Ecology & Disaster Management'
    },
    23: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Applied & Fundamental Sciences',
        'domain_kannada': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'Acid-Base Indicators & Synthetic Chemical Indicators (Phenolphthalein & Methyl Orange)',
        'sub_topic_kannada': 'ಆಮ್ಲ-ಪ್ರತ್ಯಾಮ್ಲ ಸೂಚಕಗಳು ಮತ್ತು ಕೃತಕ ರಾಸಾಯನಿಕ ಸೂಚಕಗಳು (ಫೀನಾಲ್ಫ್‌ಥಲೀನ್ ಮತ್ತು ಮೀಥೈಲ್ ಆರೆಂಜ್)',
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
        'subject_tag': 'Science, Technology & Defence'
    },
    24: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Biotechnology, Health & Life Sciences',
        'domain_kannada': 'ಬಯೋಟೆಕ್ನಾಲಜಿ, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'Infectious Diseases & Sexually Transmitted Infections (Curable Bacterial vs Incurable Viral STIs)',
        'sub_topic_kannada': 'ಸಾಂಕ್ರಾಮಿಕ ರೋಗಗಳು ಮತ್ತು ಲೈಂಗಿಕ ಸಂಪರ್ಕ ರೋಗಗಳು (ಬ್ಯಾಕ್ಟೀರಿಯಾ ಮತ್ತು ವೈರಲ್ ಎಸ್‌ಟಿಐ)',
        'node_id': 'science_technology_defence.biotechnology_health_life_sciences.immunology_infectious_diseases_public_health',
        'subject_tag': 'Science, Technology & Defence'
    },
    25: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Biotechnology, Health & Life Sciences',
        'domain_kannada': 'ಬಯೋಟೆಕ್ನಾಲಜಿ, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'Genetically Modified Crops & Bacillus thuringiensis (Bt Cotton Cry Proteins against Bollworm)',
        'sub_topic_kannada': 'ತಳೀಯವಾಗಿ ಮಾರ್ಪಡಿಸಿದ ಬೆಳೆಗಳು ಮತ್ತು ಬಿಟಿ ಹತ್ತಿ (ದುಂಡುಹುಳು ನಿರೋಧಕ ಕ್ರೈ ಪ್ರೋಟೀನ್)',
        'node_id': 'science_technology_defence.biotechnology_health_life_sciences.agricultural_biotechnology_bio-economy',
        'subject_tag': 'Science, Technology & Defence'
    },
    26: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Applied & Fundamental Sciences',
        'domain_kannada': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'National Agricultural & Scientific Research Institutes (NDRI Karnal, CRRI Cuttack, IIHR Bengaluru, CPRI Shimla)',
        'sub_topic_kannada': 'ರಾಷ್ಟ್ರೀಯ ಕೃಷಿ ಮತ್ತು ವೈಜ್ಞಾನಿಕ ಸಂಶೋಧನಾ ಸಂಸ್ಥೆಗಳು (NDRI, CRRI, IIHR, CPRI)',
        'node_id': 'science_technology_defence.applied_fundamental_sciences',
        'subject_tag': 'Science, Technology & Defence'
    },
    27: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Applied & Fundamental Sciences',
        'domain_kannada': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'Human Skeletal Anatomy (206 Adult Bones & 14 Facial Skeleton Bones)',
        'sub_topic_kannada': 'ಮಾನವ ಅಸ್ಥಿಪಂಜರ ಅಂಗರಚನಾಶಾಸ್ತ್ರ (206 ಮೂಳೆಗಳು ಮತ್ತು 14 ಮುಖದ ಮೂಳೆಗಳು)',
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        'subject_tag': 'Science, Technology & Defence'
    },
    28: {
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_kannada': 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ',
        'domain': 'Environmental Pollution, Waste Management & Remediation',
        'domain_kannada': 'ಪರಿಸರ ಮಾಲಿನ್ಯ, ತ್ಯಾಜ್ಯ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಹಾರೋಪಾಯಗಳು',
        'sub_topic': 'Noise Pollution & Physiological Impacts on Human Health (Auditory and Non-Auditory Effects)',
        'sub_topic_kannada': 'ಶಬ್ದ ಮಾಲಿನ್ಯ ಮತ್ತು ಮಾನವ ಆರೋಗ್ಯದ ಮೇಲಿನ ದೈಹಿಕ ಪರಿಣಾಮಗಳು (ನಿದ್ರಾಹೀನತೆ, ಹೃದಯ ಬಡಿತ ಏರಿಕೆ)',
        'node_id': 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality',
        'subject_tag': 'Environment, Ecology & Disaster Management'
    },
    29: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Applied & Fundamental Sciences',
        'domain_kannada': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'Inorganic Chemistry & Neutralization Reaction of Metal Oxides (Basic Oxides) with Acids',
        'sub_topic_kannada': 'ಅಜೈವಿಕ ರಸಾಯನಶಾಸ್ತ್ರ ಮತ್ತು ಲೋಹದ ಆಕ್ಸೈಡ್‌ಗಳು ಆಮ್ಲಗಳೊಂದಿಗೆ ತಟಸ್ಥೀಕರಣ ಕ್ರಿಯೆ',
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
        'subject_tag': 'Science, Technology & Defence'
    },
    30: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Applied & Fundamental Sciences',
        'domain_kannada': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'Fossil Fuel By-Products & Fractional Distillation of Coal (Coal Tar Chemical Composition)',
        'sub_topic_kannada': 'ಪಳೆಯುಳಿಕೆ ಇಂಧನ ಉಪಉತ್ಪನ್ನಗಳು ಮತ್ತು ಕಲ್ಲಿದ್ದಲಿನ ವಿಭಜಕ ಆಸವನ (ಕೋಲ್ ಟಾರ್ ಸಂಯೋಜನೆ)',
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
        'subject_tag': 'Science, Technology & Defence'
    },
    31: {
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_kannada': 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ',
        'domain': 'Fundamental Ecology & Ecosystem Dynamics',
        'domain_kannada': 'ಮೂಲಭೂತ ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ಪರಿಸರ ವ್ಯವಸ್ಥೆಯ ಚಲನಶಾಸ್ತ್ರ',
        'sub_topic': 'Trophic Structure & Lindeman\'s Unidirectional Energy Flow in Ecosystems',
        'sub_topic_kannada': 'ಪೋಷಣಾ ಮಟ್ಟಗಳು ಮತ್ತು ಪರಿಸರ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ ಏಕಮುಖ ಶಕ್ತಿ ಹರಿವು',
        'node_id': 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.energy_flow_trophic_structure',
        'subject_tag': 'Environment, Ecology & Disaster Management'
    },
    32: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'General Mental Ability & Logical Reasoning',
        'domain_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ',
        'sub_topic': 'Number Series Pattern Recognition (Fibonacci Addition Sequence)',
        'sub_topic_kannada': 'ಸಂಖ್ಯಾ ಸರಣಿ ಮಾದರಿ ಗುರುತಿಸುವಿಕೆ (ಫಿಬೊನಾಕಿ ಸಂಕಲನ ಶ್ರೇಣಿ)',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    33: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'Quantitative Aptitude & Basic Numeracy',
        'domain_kannada': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
        'sub_topic': 'Time, Work and Efficiency Relationships (Ratio of Daily Output)',
        'sub_topic_kannada': 'ಸಮಯ, ಕೆಲಸ ಮತ್ತು ದಕ್ಷತೆಯ ಅನುಪಾತ ಸಂಬಂಧಗಳು',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    34: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'Quantitative Aptitude & Basic Numeracy',
        'domain_kannada': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
        'sub_topic': 'Basic Numeracy & Linear Systems (Sum and Difference of Two Numbers)',
        'sub_topic_kannada': 'ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ ಮತ್ತು ಸರಳ ಸಮೀಕರಣಗಳು (ಎರಡು ಸಂಖ್ಯೆಗಳ ಮೊತ್ತ ಮತ್ತು ವ್ಯತ್ಯಾಸ)',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    35: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'Quantitative Aptitude & Basic Numeracy',
        'domain_kannada': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
        'sub_topic': 'Algebraic Identities & Factorization Formulas',
        'sub_topic_kannada': 'ಬೀಜಗಣಿತೀಯ ನಿತ್ಯಸಮೀಕರಣಗಳು ಮತ್ತು ಅಪವರ್ತನ ಸೂತ್ರಗಳು',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    36: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'Quantitative Aptitude & Basic Numeracy',
        'domain_kannada': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
        'sub_topic': 'Number Systems & Highest Common Factor (HCF / GCD Euclid Division Algorithm)',
        'sub_topic_kannada': 'ಸಂಖ್ಯಾ ಪದ್ಧತಿಗಳು ಮತ್ತು ಗರಿಷ್ಠ ಸಾಮಾನ್ಯ ಅಪವರ್ತನ (ಮ.ಸಾ.ಅ.)',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    37: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'General Mental Ability & Logical Reasoning',
        'domain_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ',
        'sub_topic': 'Coding-Decoding & Alphabet Numerical Position Scaling',
        'sub_topic_kannada': 'ಕೋಡಿಂಗ್-ಡಿಕೋಡಿಂಗ್ ಮತ್ತು ಅಕ್ಷರಗಳ ಸ್ಥಾನಮೌಲ್ಯ ಗುಣಾಕಾರ',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    38: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'Quantitative Aptitude & Basic Numeracy',
        'domain_kannada': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
        'sub_topic': 'Combinatorics & Rotational Symmetry Coloring on Cube Faces',
        'sub_topic_kannada': 'ಕಾಂಬಿನೇಟೋರಿಕ್ಸ್ ಮತ್ತು ಘನಾಕೃತಿಯ ಮುಖಗಳ ಬಣ್ಣ ಹಚ್ಚುವ ಸಂಯೋಜನೆಗಳು',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    39: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'General Mental Ability & Logical Reasoning',
        'domain_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ',
        'sub_topic': 'Logical Reasoning & Geometric Pattern Missing Number Puzzles',
        'sub_topic_kannada': 'ತಾರ್ಕಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ರೇಖಾಗಣಿತದ ಮಾದರಿಯ ಒಗಟುಗಳು',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    40: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'General Mental Ability & Logical Reasoning',
        'domain_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ',
        'sub_topic': 'Calendar Reasoning & Periodic Repetition of Normal/Leap Year Calendars',
        'sub_topic_kannada': 'ಕ್ಯಾಲೆಂಡರ್ ತಾರ್ಕಿಕತೆ ಮತ್ತು ವರ್ಷಗಳ ಕ್ಯಾಲೆಂಡರ್ ಪುನರಾವರ್ತನೆ',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    41: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'Quantitative Aptitude & Basic Numeracy',
        'domain_kannada': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
        'sub_topic': 'Speed, Distance and Time Unit Conversion (m/s to km/hr)',
        'sub_topic_kannada': 'ವೇಗ, ದೂರ ಮತ್ತು ಸಮಯದ ಪರಿವರ್ತನೆ (ಮೀ/ಸೆಕೆಂಡ್‌ ನಿಂದ ಕಿಮೀ/ಗಂಟೆಗೆ)',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    42: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'Quantitative Aptitude & Basic Numeracy',
        'domain_kannada': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
        'sub_topic': 'Algebraic Fractions & Cross-Multiplication Linear Equations',
        'sub_topic_kannada': 'ಬೀಜಗಣಿತೀಯ ಭಿನ್ನರಾಶಿಗಳು ಮತ್ತು ಸರಳ ರೇಖೀಯ ಸಮೀಕರಣ ಪರಿಹಾರ',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    43: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'General Mental Ability & Logical Reasoning',
        'domain_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ',
        'sub_topic': 'Logical Venn Diagrams & Set Inclusion/Exclusion (Painter, Singer, Dancer)',
        'sub_topic_kannada': 'ತಾರ್ಕಿಕ ವೆನ್ ರೇಖಾಚಿತ್ರಗಳು ಮತ್ತು ಗಣಗಳ ವಿಶ್ಲೇಷಣೆ (ಚಿತ್ರಕಾರ, ಗಾಯಕ, ನರ್ತಕ)',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    44: {
        'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
        'subject_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
        'domain': 'General Mental Ability & Logical Reasoning',
        'domain_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ',
        'sub_topic': 'Logical Venn Diagrams & Intersection Regions of Three Categories',
        'sub_topic_kannada': 'ವೆನ್ ರೇಖಾಚಿತ್ರಗಳು ಮತ್ತು ಮೂರು ವರ್ಗಗಳ ಛೇದನ ಪ್ರದೇಶ ಗುರುತಿಸುವಿಕೆ',
        'node_id': 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning',
        'subject_tag': 'General Mental Ability, Quantitative Aptitude & Comprehension'
    },
    45: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Nuclear Technology & Energy',
        'domain_kannada': 'ಪರಮಾಣು ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಇಂಧನ',
        'sub_topic': 'Radioactivity & Historic Scientific Discoveries (Becquerel, Marie Curie, Fermi, Rutherford)',
        'sub_topic_kannada': 'ವಿಕಿರಣಶೀಲತೆ ಮತ್ತು ಐತಿಹಾಸಿಕ ವೈಜ್ಞಾನಿಕ ಆವಿಷ್ಕಾರಗಳು (ಬೆಕ್ವೆರೆಲ್, ಮೇರಿ ಕ್ಯೂರಿ, ಫರ್ಮಿ)',
        'node_id': 'science_technology_defence.nuclear_technology_energy.fundamental_particle_physics_research_facilities',
        'subject_tag': 'Science, Technology & Defence'
    },
    46: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Space Technology & Astronomy',
        'domain_kannada': 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ',
        'sub_topic': 'Mars Orbiter Mission (MOM / Mangalyaan) & ISRO Interplanetary Exploration',
        'sub_topic_kannada': 'ಮಂಗಳಯಾನ (MOM) ಮತ್ತು ಇಸ್ರೋದ ಅಂತರಗ್ರಹ ಪರಿಶೋಧನೆ',
        'node_id': 'science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions',
        'subject_tag': 'Science, Technology & Defence'
    },
    47: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Space Technology & Astronomy',
        'domain_kannada': 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ',
        'sub_topic': 'Geostationary Communication Satellites & Direct-To-Home (DTH) Broadcasting',
        'sub_topic_kannada': 'ಭೂಸ್ಥಿರ ಸಂವಹನ ಉಪಗ್ರಹಗಳು ಮತ್ತು ಡಿಟಿಎಚ್ (DTH) ಪ್ರಸಾರ ವ್ಯವಸ್ಥೆ',
        'node_id': 'science_technology_defence.space_technology_astronomy.orbits_satellite_navigation_applications',
        'subject_tag': 'Science, Technology & Defence'
    },
    48: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Applied & Fundamental Sciences',
        'domain_kannada': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'Medical Imaging Technology & Nuclear Magnetic Resonance (MRI Dynamics)',
        'sub_topic_kannada': 'ವೈದ್ಯಕೀಯ ಇಮೇಜಿಂಗ್ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಎಂಆರ್‌ಐ (ಮ್ಯಾಗ್ನೆಟಿಕ್ ರೆಸೋನೆನ್ಸ್ ಇಮೇಜಿಂಗ್)',
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_physics',
        'subject_tag': 'Science, Technology & Defence'
    },
    49: {
        'subject': 'Geography & Earth Systems',
        'subject_kannada': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
        'domain': 'Physical Geography & Earth Systems (Geomorphology)',
        'domain_kannada': 'ಭೌತಿಕ ಭೂಗೋಳಶಾಸ್ತ್ರ ಮತ್ತು ಭೂರೂಪಶಾಸ್ತ್ರ',
        'sub_topic': 'Earth\'s Interior & Geodynamo Theory of Geomagnetism in Liquid Outer Core',
        'sub_topic_kannada': 'ಭೂಮಿಯ ಆಂತರಿಕ ರಚನೆ ಮತ್ತು ಹೊರಗರ್ಭದಲ್ಲಿ ಕಾಂತೀಯತೆಯ ಉತ್ಪತ್ತಿ (ಜಿಯೋಡೈನಮೊ)',
        'node_id': 'geography_earth_systems.physical_geography_earth_systems.earths_origin_internal_structure.earths_internal_layers_crust_mantle_core',
        'subject_tag': 'Geography & Earth Systems'
    },
    50: {
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_kannada': 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ',
        'domain': 'Environmental Pollution, Waste Management & Remediation',
        'domain_kannada': 'ಪರಿಸರ ಮಾಲಿನ್ಯ, ತ್ಯಾಜ್ಯ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಹಾರೋಪಾಯಗಳು',
        'sub_topic': 'Industrial Air Pollution Control Equipment & Electrostatic Precipitators (ESP)',
        'sub_topic_kannada': 'ಕೈಗಾರಿಕಾ ವಾಯು ಮಾಲಿನ್ಯ ನಿಯಂತ್ರಣ ಉಪಕರಣಗಳು ಮತ್ತು ಎಲೆಕ್ಟ್ರೋಸ್ಟಾಟಿಕ್ ಪ್ರೆಸಿಪಿಟೇಟರ್‌ಗಳು (ESP)',
        'node_id': 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality',
        'subject_tag': 'Environment, Ecology & Disaster Management'
    },
    51: {
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_kannada': 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ',
        'domain': 'Biodiversity, Wildlife Conservation & Protected Areas',
        'domain_kannada': 'ಜೀವವೈವಿಧ್ಯ, ವನ್ಯಜೀವಿ ಸಂರಕ್ಷಣೆ ಮತ್ತು ಸಂರಕ್ಷಿತ ಪ್ರದೇಶಗಳು',
        'sub_topic': 'Jawaharlal Nehru Tropical Botanic Garden and Research Institute (JNTBGRI / TBGRI Thiruvananthapuram)',
        'sub_topic_kannada': 'ಉಷ್ಣವಲಯದ ಸಸ್ಯಶಾಸ್ತ್ರೀಯ ಉದ್ಯಾನವನ ಮತ್ತು ಸಂಶೋಧನಾ ಸಂಸ್ಥೆ (TBGRI ತಿರುವನಂತಪುರಂ)',
        'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.ex-situ_conservation_botanical_science',
        'subject_tag': 'Environment, Ecology & Disaster Management'
    },
    52: {
        'subject': 'Ethics, Integrity & Aptitude',
        'subject_kannada': 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ',
        'domain': 'Probity in Governance & Public Service Values',
        'domain_kannada': 'ಆಡಳಿತದಲ್ಲಿ ಪ್ರಾಮಾಣಿಕತೆ ಮತ್ತು ಸಾರ್ವಜನಿಕ ಸೇವಾ ಮೌಲ್ಯಗಳು',
        'sub_topic': 'Foundational Pillars of Probity in Governance & Rule of Law',
        'sub_topic_kannada': 'ಆಡಳಿತದಲ್ಲಿ ಪ್ರಾಮಾಣಿಕತೆಯ ಮೂಲ ಆಧಾರಸ್ತಂಭಗಳು ಮತ್ತು ಕಾನೂನಿನ ಆಡಳಿತ',
        'node_id': 'ethics_integrity_aptitude.probity_in_governance_public_service_values.concept_of_public_service_philosophical_basis_of_governance',
        'subject_tag': 'Ethics, Integrity & Aptitude'
    },
    53: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Applied & Fundamental Sciences',
        'domain_kannada': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'Wave Mechanics & Propagation of Sound (Requirement of Material Medium vs Vacuum)',
        'sub_topic_kannada': 'ತರಂಗ ಬಲಶಾಸ್ತ್ರ ಮತ್ತು ಶಬ್ದದ ಪ್ರಸರಣ (ಮಾಧ್ಯಮದ ಅಗತ್ಯತೆ ಮತ್ತು ನಿರ್ವಾತದಲ್ಲಿ ಅಪ್ರಸರಣ)',
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_physics',
        'subject_tag': 'Science, Technology & Defence'
    },
    54: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Nuclear Technology & Energy',
        'domain_kannada': 'ಪರಮಾಣು ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಇಂಧನ',
        'sub_topic': 'Indigenous Research Reactors & KAMINI at Kalpakkam (Thorium Fuel Cycle / U-233)',
        'sub_topic_kannada': 'ಕಲ್ಪಾಕಂನ ಕಾಮಿನಿ (KAMINI) ಸಂಶೋಧನಾ ರಿಯಾಕ್ಟರ್ (ಥೋರಿಯಂ ಚಕ್ರ ಮತ್ತು U-233)',
        'node_id': 'science_technology_defence.nuclear_technology_energy.nuclear_energy_programme_reactors',
        'subject_tag': 'Science, Technology & Defence'
    },
    55: {
        'subject': 'Ethics, Integrity & Aptitude',
        'subject_kannada': 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ',
        'domain': 'Attitude & Aptitude',
        'domain_kannada': 'ಮನೋಭಾವ ಮತ್ತು ಆಡಳಿತಾತ್ಮಕ ಅಭಿರುಚಿ',
        'sub_topic': 'Foundational Values of Civil Services (Integrity, Dedication, Objectivity & Impartiality)',
        'sub_topic_kannada': 'ನಾಗರಿಕ ಸೇವೆಗಳ ಮೂಲಭೂತ ಮೌಲ್ಯಗಳು (ಸಮಗ್ರತೆ, ನಿಷ್ಠೆ, ವಸ್ತುನಿಷ್ಠತೆ ಮತ್ತು ನಿಷ್ಪಕ್ಷಪಾತತೆ)',
        'node_id': 'ethics_integrity_aptitude.attitude_aptitude.foundational_values_for_civil_services',
        'subject_tag': 'Ethics, Integrity & Aptitude'
    },
    56: {
        'subject': 'Internal Security',
        'subject_kannada': 'ಆಂತರಿಕ ಭದ್ರತೆ',
        'domain': 'Security Forces, Intelligence Agencies & Statutory Mandates',
        'domain_kannada': 'ಭದ್ರತಾ ಪಡೆಗಳು, ಗುಪ್ತಚರ ಸಂಸ್ಥೆಗಳು ಮತ್ತು ಶಾಸನಬದ್ಧ ಕರ್ತವ್ಯಗಳು',
        'sub_topic': 'Police Code of Conduct & Impartial Law Enforcement Without Fear or Favour',
        'sub_topic_kannada': 'ಪೊಲೀಸ್ ನೀತಿ ಸಂಹಿತೆ ಮತ್ತು ಭೀತಿ ಅಥವಾ ಪಕ್ಷಪಾತವಿಲ್ಲದೆ ಕಾನೂನು ಪಾಲನೆ',
        'node_id': 'internal_security.security_forces_intelligence_agencies_statutory_mandates.central_armed_police_forces_capfs',
        'subject_tag': 'Internal Security'
    },
    57: {
        'subject': 'Indian Economy & Development',
        'subject_kannada': 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
        'domain': 'Infrastructure, Energy & Investment Models',
        'domain_kannada': 'ಮೂಲಸೌಕರ್ಯ, ಇಂಧನ ಮತ್ತು ಹೂಡಿಕೆ ಮಾದರಿಗಳು',
        'sub_topic': 'Multi-Lane Free Flow (MLFF) Electronic Tolling on National Highways',
        'sub_topic_kannada': 'ರಾಷ್ಟ್ರೀಯ ಹೆದ್ದಾರಿಗಳಲ್ಲಿ ಮಲ್ಟಿ-ಲೇನ್ ಫ್ರೀ ಫ್ಲೋ (MLFF) ತಡೆರಹಿತ ಟೋಲ್ ವ್ಯವಸ್ಥೆ',
        'node_id': 'indian_economy_development.infrastructure_energy_investment_models.physical_infrastructure_systems',
        'subject_tag': 'Indian Economy & Development'
    },
    58: {
        'subject': 'Indian Society & Social Justice',
        'subject_kannada': 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ',
        'domain': 'Welfare Schemes for Vulnerable Sections',
        'domain_kannada': 'ದುರ್ಬಲ ವರ್ಗಗಳ ಕಲ್ಯಾಣ ಯೋಜನೆಗಳು',
        'sub_topic': 'Ministry of Tribal Affairs & Forest Rights Act (FRA 2006) Implementation Cells',
        'sub_topic_kannada': 'ಬುಡಕಟ್ಟು ವ್ಯವಹಾರಗಳ ಸಚಿವಾಲಯ ಮತ್ತು ಅರಣ್ಯ ಹಕ್ಕುಗಳ ಕಾಯ್ದೆ (FRA 2006) ಕೋಶಗಳು',
        'node_id': 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups',
        'subject_tag': 'Indian Society & Social Justice'
    },
    59: {
        'subject': 'Internal Security',
        'subject_kannada': 'ಆಂತರಿಕ ಭದ್ರತೆ',
        'domain': 'Transnational Organised Crime & Illicit Financial Flows',
        'domain_kannada': 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಘಟಿತ ಅಪರಾಧ ಮತ್ತು ಅಕ್ರಮ ಹಣಕಾಸು ಹರಿವು',
        'sub_topic': 'Illicit Trafficking, Narcotics Trade & Bootlegging Penalties',
        'sub_topic_kannada': 'ಅಕ್ರಮ ಸಾಗಾಟ, ಮಾದಕ ದ್ರವ್ಯ ಕಳ್ಳಸಾಗಣೆ ಮತ್ತು ಬೂಟ್‌ಲೆಗ್ಗಿಂಗ್ (ಕಳ್ಳಬಟ್ಟಿ ದಂಧೆ)',
        'node_id': 'internal_security.transnational_organised_crime_illicit_financial_flows.drug_trafficking_narco-terrorism',
        'subject_tag': 'Internal Security'
    },
    60: {
        'subject': 'Ethics, Integrity & Aptitude',
        'subject_kannada': 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ',
        'domain': 'Case Studies',
        'domain_kannada': 'ಪ್ರಕರಣ ಅಧ್ಯಯನಗಳು (ಕೇಸ್ ಸ್ಟಡೀಸ್)',
        'sub_topic': 'Administrative Ethics Case Study: Compliance with Official Directives and Public Duty',
        'sub_topic_kannada': 'ಆಡಳಿತಾತ್ಮಕ ನೈತಿಕತೆ ಕೇಸ್ ಸ್ಟಡಿ: ಅಧಿಕೃತ ಆದೇಶಗಳ ಪಾಲನೆ ಮತ್ತು ಕರ್ತವ್ಯ ನಿರ್ವಹಣೆ',
        'node_id': 'ethics_integrity_aptitude.case_studies.ethical_dilemmas_in_administration_public_life',
        'subject_tag': 'Ethics, Integrity & Aptitude'
    },
    61: {
        'subject': 'Art, Culture & Heritage',
        'subject_kannada': 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ',
        'domain': 'Martial Arts, Traditional Sports & Calendars',
        'domain_kannada': 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು',
        'sub_topic': 'National Sports Trophies of India (Durand Cup, Santosh Trophy, Ranji Trophy, Duleep Trophy)',
        'sub_topic_kannada': 'ಭಾರತದ ರಾಷ್ಟ್ರೀಯ ಕ್ರೀಡಾ ಟ್ರೋಫಿಗಳು (ಡುರಾಂಡ್ ಕಪ್, ಸಂತೋಷ್ ಟ್ರೋಫಿ, ರಣಜಿ ಟ್ರೋಫಿ, ದುಲೀಪ್ ಟ್ರೋಫಿ)',
        'node_id': 'art_culture_heritage.martial_arts_traditional_sports_calendars',
        'subject_tag': 'Art, Culture & Heritage'
    },
    62: {
        'subject': 'Geography & Earth Systems',
        'subject_kannada': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
        'domain': 'Oceanography & Marine Systems',
        'domain_kannada': 'ಸಾಗರಶಾಸ್ತ್ರ ಮತ್ತು ಕಡಲ ವ್ಯವಸ್ಥೆಗಳು',
        'sub_topic': 'Ocean Currents Convergence & Rich Marine Fishing Grounds (Grand Bank & Georges Bank)',
        'sub_topic_kannada': 'ಸಾಗರ ಪ್ರವಾಹಗಳ ಸಮ್ಮಿಲನ ಮತ್ತು ಪ್ರಸಿದ್ಧ ಮೀನುಗಾರಿಕಾ ಪ್ರದೇಶಗಳು (ಗ್ರ್ಯಾಂಡ್ ಬ್ಯಾಂಕ್ ಮತ್ತು ಜಾರ್ಜಸ್ ಬ್ಯಾಂಕ್)',
        'node_id': 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics',
        'subject_tag': 'Geography & Earth Systems'
    },
    63: {
        'subject': 'International Relations & Global Institutions',
        'subject_kannada': 'ಅಂತಾರಾಷ್ಟ್ರೀಯ संबंधಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು',
        'domain': 'Regional Multilateral Groupings',
        'domain_kannada': 'ಪ್ರಾದೇಶಿಕ ಮತ್ತು ಬಹುಪಕ್ಷೀಯ ಒಕ್ಕೂಟಗಳು',
        'sub_topic': 'North Atlantic Treaty Organization (NATO) Collective Defence Architecture',
        'sub_topic_kannada': 'ಉತ್ತರ ಅಟ್ಲಾಂಟಿಕ್ ಒಪ್ಪಂದ ಸಂಸ್ಥೆ (ನ್ಯಾಟೋ) ಸಾಮೂಹಿಕ ರಕ್ಷಣಾ ಒಕ್ಕೂಟ',
        'node_id': 'international_relations_global_institutions.regional_multilateral_groupings.indo-pacific_trans-regional_alliances',
        'subject_tag': 'International Relations & Global Institutions'
    },
    64: {
        'subject': 'International Relations & Global Institutions',
        'subject_kannada': 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು',
        'domain': 'India\'s Foreign Policy & Bilateral Relations',
        'domain_kannada': 'ಭಾರತದ ವಿದೇಶಾಂಗ ನೀತಿ ಮತ್ತು ದ್ವಿಪಕ್ಷೀಯ ಸಂಬಂಧಗಳು',
        'sub_topic': 'High Civilian Honors Conferred on Prime Minister Narendra Modi by Foreign Nations',
        'sub_topic_kannada': 'ವಿದೇಶಗಳಿಂದ ಪ್ರಧಾನಮಂತ್ರಿ ನರೇಂದ್ರ ಮೋದಿಯವರಿಗೆ ಪ್ರದಾನ ಮಾಡಲಾದ ಅತ್ಯುನ್ನತ ನಾಗರಿಕ ಗೌರವಗಳು',
        'node_id': 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_major_global_powers',
        'subject_tag': 'International Relations & Global Institutions'
    },
    65: {
        'subject': 'Geography & Earth Systems',
        'subject_kannada': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
        'domain': 'Geography of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ',
        'sub_topic': 'Mining Geography of Karnataka & Environmental Clearances in Western Ghats / Sandur',
        'sub_topic_kannada': 'ಕರ್ನಾಟಕದ ಗಣಿಗಾರಿಕೆ ಭೂಗೋಳ ಮತ್ತು ಪಶ್ಚಿಮ ಘಟ್ಟಗಳು / ಸಂಡೂರಿನಲ್ಲಿ ಪರಿಸರ ಅನುಮತಿಗಳು',
        'node_id': 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka',
        'subject_tag': 'Geography & Earth Systems'
    },
    66: {
        'subject': 'Indian Economy & Development',
        'subject_kannada': 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
        'domain': 'Infrastructure, Energy & Investment Models',
        'domain_kannada': 'ಮೂಲಸೌಕರ್ಯ, ಇಂಧನ ಮತ್ತು ಹೂಡಿಕೆ ಮಾದರಿಗಳು',
        'sub_topic': 'Renewable Energy Parks & Ultra Mega Solar/Wind Power Projects in India',
        'sub_topic_kannada': 'ಭಾರತದ ನವೀಕರಿಸಬಹುದಾದ ಇಂಧನ ಪಾರ್ಕ್‌ಗಳು (ಭಾಡ್ಲಾ, ಪಾವಗಡ, ಮುಪ್ಪಂಡಾಲ್)',
        'node_id': 'indian_economy_development.infrastructure_energy_investment_models.energy_transition_power_sector_architecture',
        'subject_tag': 'Indian Economy & Development'
    },
    67: {
        'subject': 'Geography & Earth Systems',
        'subject_kannada': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
        'domain': 'Geography of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ',
        'sub_topic': 'Krishna River Basin & Peninsular Drainage Network (Tributaries of Krishna River)',
        'sub_topic_kannada': 'ಕೃಷ್ಣಾ ನದೀ ಕಣಿವೆ ಮತ್ತು ಉಪನದಿಗಳ ವ್ಯವಸ್ಥೆ (ಭೀಮಾ, ತುಂಗಭದ್ರಾ, ಘಟಪ್ರಭಾ, ಮಲಪ್ರಭಾ)',
        'node_id': 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.krishna_river_basin',
        'subject_tag': 'Geography & Earth Systems'
    },
    68: {
        'subject': 'Indian Economy & Development',
        'subject_kannada': 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
        'domain': 'Infrastructure, Energy & Investment Models',
        'domain_kannada': 'ಮೂಲಸೌಕರ್ಯ, ಇಂಧನ ಮತ್ತು ಹೂಡಿಕೆ ಮಾದರಿಗಳು',
        'sub_topic': 'Indian Railways Zonal Architecture & Headquarters Locations',
        'sub_topic_kannada': 'ಭಾರತೀಯ ರೈಲ್ವೆ ವಲಯಗಳು ಮತ್ತು ಕೇಂದ್ರ ಕಚೇರಿಗಳು',
        'node_id': 'indian_economy_development.infrastructure_energy_investment_models.physical_infrastructure_systems',
        'subject_tag': 'Indian Economy & Development'
    },
    69: {
        'subject': 'Art, Culture & Heritage',
        'subject_kannada': 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ',
        'domain': 'Martial Arts, Traditional Sports & Calendars',
        'domain_kannada': 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು',
        'sub_topic': 'Indian Premier League (IPL) Cricket History & Franchise Champions',
        'sub_topic_kannada': 'ಇಂಡಿಯನ್ ಪ್ರೀಮಿಯರ್ ಲೀಗ್ (ಐಪಿಎಲ್) ಕ್ರಿಕೆಟ್ ಇತಿಹಾಸ ಮತ್ತು ಚಾಂಪಿಯನ್ ತಂಡಗಳು',
        'node_id': 'art_culture_heritage.martial_arts_traditional_sports_calendars',
        'subject_tag': 'Art, Culture & Heritage'
    },
    70: {
        'subject': 'Art, Culture & Heritage',
        'subject_kannada': 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ',
        'domain': 'Martial Arts, Traditional Sports & Calendars',
        'domain_kannada': 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು',
        'sub_topic': '2026 FIFA World Cup Host Countries (USA, Canada, Mexico Tripartite Hosting)',
        'sub_topic_kannada': '2026 ರ ಫಿಫಾ ವಿಶ್ವಕಪ್ ಆತಿಥೇಯ ರಾಷ್ಟ್ರಗಳು (ಯುಎಸ್ಎ, ಕೆನಡಾ, ಮೆಕ್ಸಿಕೋ)',
        'node_id': 'art_culture_heritage.martial_arts_traditional_sports_calendars',
        'subject_tag': 'Art, Culture & Heritage'
    },
    71: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Defence Technology',
        'domain_kannada': 'ರಕ್ಷಣಾ ತಂತ್ರಜ್ಞಾನ',
        'sub_topic': 'Indian Air Force Surya Kiran Aerobatic Team (SKAT) & Air Force Stations in Karnataka',
        'sub_topic_kannada': 'ಭಾರತೀಯ ವಾಯುಪಡೆಯ ಸೂರ್ಯ ಕಿರಣ್ ಏರೋಬ್ಯಾಟಿಕ್ ತಂಡ (SKAT) ಮತ್ತು ಬೀದರ್ ಏರ್‌ಬೇಸ್',
        'node_id': 'science_technology_defence.defence_technology',
        'subject_tag': 'Science, Technology & Defence'
    },
    72: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Space Technology & Astronomy',
        'domain_kannada': 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ',
        'sub_topic': 'ISRO Communication Satellites (GSAT Series for Telecommunication and Broadcasting)',
        'sub_topic_kannada': 'ಇಸ್ರೋದ ಸಂವಹನ ಉಪಗ್ರಹಗಳು (ದೂರಸಂಪರ್ಕಕ್ಕಾಗಿ ಜಿಸ್ಯಾಟ್ ಸರಣಿ)',
        'node_id': 'science_technology_defence.space_technology_astronomy.orbits_satellite_navigation_applications',
        'subject_tag': 'Science, Technology & Defence'
    },
    73: {
        'subject': 'Geography & Earth Systems',
        'subject_kannada': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
        'domain': 'Oceanography & Marine Systems',
        'domain_kannada': 'ಸಾಗರಶಾಸ್ತ್ರ ಮತ್ತು ಕಡಲ ವ್ಯವಸ್ಥೆಗಳು',
        'sub_topic': 'Vertical Salinity Profiles in Oceans & The Halocline Zone',
        'sub_topic_kannada': 'ಸಾಗರಗಳಲ್ಲಿ ಲವಣಾಂಶದ ಲಂಬ ವಿತರಣೆ ಮತ್ತು ಹ್ಯಾಲೋಕ್ಲೈನ್ ವಲಯ',
        'node_id': 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics',
        'subject_tag': 'Geography & Earth Systems'
    },
    74: {
        'subject': 'Geography & Earth Systems',
        'subject_kannada': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
        'domain': 'Physical Geography & Earth Systems (Geomorphology)',
        'domain_kannada': 'ಭೌತಿಕ ಭೂಗೋಳಶಾಸ್ತ್ರ ಮತ್ತು ಭೂರೂಪಶಾಸ್ತ್ರ',
        'sub_topic': 'Volcanism & Island Arc Formation in the Pacific Ring of Fire (Nishinoshima Volcanic Island)',
        'sub_topic_kannada': 'ಜ್ವಾಲಾಮುಖಿ ಮತ್ತು ದ್ವೀಪಗಳ ರಚನೆ (ಪೆಸಿಫಿಕ್ ರಿಂಗ್ ಆಫ್ ಫೈರ್‌ನ ನಿಶಿನೋಶಿಮಾ ದ್ವೀಪ)',
        'node_id': 'geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics',
        'subject_tag': 'Geography & Earth Systems'
    },
    75: {
        'subject': 'Art, Culture & Heritage',
        'subject_kannada': 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ',
        'domain': 'Art & Culture of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಕಲೆ ಮತ್ತು ಸಂಸ್ಕೃತಿ',
        'sub_topic': 'One District One Product (ODOP) & Geographical Indication Crafts of Karnataka (Kinhal Wooden Toys)',
        'sub_topic_kannada': 'ಒಂದು ಜಿಲ್ಲೆ ಒಂದು ಉತ್ಪನ್ನ (ODOP) ಮತ್ತು ಕಿನ್ಹಾಳ ಮರದ ಆಟಿಕೆಗಳ ಕರಕುಶಲ ಕಲೆ',
        'node_id': 'art_culture_heritage.art_culture_of_karnataka',
        'subject_tag': 'Art, Culture & Heritage'
    },
    76: {
        'subject': 'Geography & Earth Systems',
        'subject_kannada': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
        'domain': 'Human Geography (Population & Settlements)',
        'domain_kannada': 'ಮಾನವ ಭೂಗೋಳಶಾಸ್ತ್ರ (ಜನಸಂಖ್ಯೆ ಮತ್ತು ವಸಾಹತುಗಳು)',
        'sub_topic': 'Linguistic Geography & World Major Language Families (Indo-European, Tai-Kadai, Niger-Congo)',
        'sub_topic_kannada': 'ಭಾಷಾ ಭೂಗೋಳಶಾಸ್ತ್ರ ಮತ್ತು ವಿಶ್ವದ ಪ್ರಮುಖ ಭಾಷಾ ಕುಟುಂಬಗಳು',
        'node_id': 'geography_earth_systems.human_geography_population_settlements',
        'subject_tag': 'Geography & Earth Systems'
    },
    77: {
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_kannada': 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ',
        'domain': 'Biodiversity, Wildlife Conservation & Protected Areas',
        'domain_kannada': 'ಜೀವವೈವಿಧ್ಯ, ವನ್ಯಜೀವಿ ಸಂರಕ್ಷಣೆ ಮತ್ತು ಸಂರಕ್ಷಿತ ಪ್ರದೇಶಗಳು',
        'sub_topic': 'Spatial Distribution of National Parks in Karnataka (Kudremukh, Nagarhole, Bandipur, Anshi)',
        'sub_topic_kannada': 'ಕರ್ನಾಟಕದ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನಗಳ ಭೌಗೋಳಿಕ ಹಂಚಿಕೆ (ಕುದುರೆಮುಖ, ನಾಗರಹೊಳೆ, ಬಂಡೀಪುರ, ಅಂಶಿ)',
        'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.in-situ_conservation_architecture',
        'subject_tag': 'Environment, Ecology & Disaster Management'
    },
    78: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Union Executive & State Executive',
        'domain_kannada': 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ',
        'sub_topic': 'Powers of the Governor: Summoning, Proroguing and Dissolving the State Legislature (Article 174)',
        'sub_topic_kannada': 'ರಾಜ್ಯಪಾಲರ ಅಧಿಕಾರಗಳು: ರಾಜ್ಯ ಶಾಸಕಾಂಗವನ್ನು ಕರೆಯುವುದು ಮತ್ತು ವಿಸರ್ಜಿಸುವುದು (ವಿಧಿ 174)',
        'node_id': 'indian_polity_constitution_governance.union_executive_state_executive.state_executive',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    79: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Federal Structure, Center-State Relations & Devolution',
        'domain_kannada': 'ಒಕ್ಕೂಟ ವ್ಯವಸ್ಥೆ, ಕೇಂದ್ರ-ರಾಜ್ಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಅಧಿಕಾರ ವಿಕೇಂದ್ರೀಕರಣ',
        'sub_topic': 'Administrative & Constitutional Inquiry Commissions (Sarkaria, Punchhi, Venkatachaliah, Nanavati)',
        'sub_topic_kannada': 'ಆಡಳಿತಾತ್ಮಕ ಮತ್ತು ಸಾಂವಿಧಾನಿಕ ಆಯೋಗಗಳು (ಸರ್ಕಾರಿಯಾ, ಪುಂಚಿ, ವೆಂಕಟಾಚಲಯ್ಯ ಆಯೋಗಗಳು)',
        'node_id': 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.legislative_administrative_relations',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    80: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Federal Structure, Center-State Relations & Devolution',
        'domain_kannada': 'ಒಕ್ಕೂಟ ವ್ಯವಸ್ಥೆ, ಕೇಂದ್ರ-ರಾಜ್ಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಅಧಿಕಾರ ವಿಕೇಂದ್ರೀಕರಣ',
        'sub_topic': 'Emergency Provisions & State Emergency (Article 356 First Imposition in Punjab 1951)',
        'sub_topic_kannada': 'ತುರ್ತು ಪರಿಸ್ಥಿತಿ ನಿಯಮಗಳು ಮತ್ತು ರಾಷ್ಟ್ರಪತಿ ಆಳ್ವಿಕೆ (ವಿಧಿ 356 ರ ಮೊದಲ ಬಳಕೆ 1951 ರಲ್ಲಿ ಪಂಜಾಬ್)',
        'node_id': 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.legislative_administrative_relations',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    81: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Indian Judiciary & Judicial System',
        'domain_kannada': 'ಭಾರತೀಯ ನ್ಯಾಯಾಂಗ ಮತ್ತು ನ್ಯಾಯಾಂಗ ವ್ಯವಸ್ಥೆ',
        'sub_topic': 'High Courts for States (Article 214 of the Constitution)',
        'sub_topic_kannada': 'ರಾಜ್ಯಗಳಿಗೆ ಉಚ್ಚ ನ್ಯಾಯಾಲಯಗಳು (ಸಂವಿಧಾನದ ವಿಧಿ 214)',
        'node_id': 'indian_polity_constitution_governance.indian_judiciary_judicial_system.high_courts_subordinate_judiciary',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    82: {
        'subject': 'Geography & Earth Systems',
        'subject_kannada': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
        'domain': 'Geography of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ',
        'sub_topic': 'District-Wise Population Demographics in Karnataka (Census 2011 Descending Ranking)',
        'sub_topic_kannada': 'ಕರ್ನಾಟಕದ ಜಿಲ್ಲಾವಾರು ಜನಸಂಖ್ಯೆ ಮತ್ತು 2011 ರ ಜನಗಣತಿಯ ಅವರೋಹಣ ಕ್ರಮ',
        'node_id': 'geography_earth_systems.geography_of_karnataka',
        'subject_tag': 'Geography & Earth Systems'
    },
    83: {
        'subject': 'Geography & Earth Systems',
        'subject_kannada': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
        'domain': 'Economic & Resource Geography',
        'domain_kannada': 'ಆರ್ಥಿಕ ಮತ್ತು ಸಂಪನ್ಮೂಲ ಭೂಗೋಳಶಾಸ್ತ್ರ',
        'sub_topic': 'Industrial Location Theory (Weight-Losing Raw Materials vs Pure Raw Materials)',
        'sub_topic_kannada': 'ಕೈಗಾರಿಕಾ ಸ್ಥಳ ನಿರ್ಣಯ ಸಿದ್ಧಾಂತ (ತೂಕ ಕಳೆದುಕೊಳ್ಳುವ ಕಚ್ಚಾವಸ್ತುಗಳು ಮತ್ತು ಶುದ್ಧ ಕಚ್ಚಾವಸ್ತುಗಳು)',
        'node_id': 'geography_earth_systems.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries',
        'subject_tag': 'Geography & Earth Systems'
    },
    84: {
        'subject': 'Science, Technology & Defence',
        'subject_kannada': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
        'domain': 'Applied & Fundamental Sciences',
        'domain_kannada': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
        'sub_topic': 'Applied Zoology & Commercial Sericulture Silk Breeds (Bombyx mori, Muga, Eri, Tasar)',
        'sub_topic_kannada': 'ಅನ್ವಯಿಕ ಪ್ರಾಣಿಶಾಸ್ತ್ರ ಮತ್ತು ರೇಷ್ಮೆ ಕೃಷಿಯ ತಳಿಗಳು (ಬಾಂಬಿಕ್ಸ್, ಮುಗಾ, ಏರಿ, ಟಸ್ಸಾರ್)',
        'node_id': 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        'subject_tag': 'Science, Technology & Defence'
    },
    85: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Indian Judiciary & Judicial System',
        'domain_kannada': 'ಭಾರತೀಯ ನ್ಯಾಯಾಂಗ ಮತ್ತು ನ್ಯಾಯಾಂಗ ವ್ಯವಸ್ಥೆ',
        'sub_topic': 'Parliamentary Jurisdiction to Establish High Courts for Union Territories (Article 241)',
        'sub_topic_kannada': 'ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಗಳಿಗೆ ಹೈಕೋರ್ಟ್ ಸ್ಥಾಪಿಸುವ ಸಂಸತ್ತಿನ ಅಧಿಕಾರ (ವಿಧಿ 241)',
        'node_id': 'indian_polity_constitution_governance.indian_judiciary_judicial_system.high_courts_subordinate_judiciary',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    86: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Parliament & State Legislatures',
        'domain_kannada': 'ಸಂಸತ್ತು ಮತ್ತು ರಾಜ್ಯ ಶಾಸಕಾಂಗಗಳು',
        'sub_topic': 'Special Address by the President of India & Motion of Thanks in Parliament (Article 87)',
        'sub_topic_kannada': 'ರಾಷ್ಟ್ರಪತಿಗಳ ವಿಶೇಷ ಭಾಷಣ ಮತ್ತು ವಂದನಾರ್ಪಣಾ ನಿರ್ಣಯ (ವಿಧಿ 87)',
        'node_id': 'indian_polity_constitution_governance.parliament_state_legislatures.legislative_procedure_bills',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    87: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Fundamental Rights, DPSP & Fundamental Duties',
        'domain_kannada': 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು, ಡಿಪಿಎಸ್‌ಪಿ ಮತ್ತು ಮೂಲಭೂತ ಕರ್ತವ್ಯಗಳು',
        'sub_topic': 'Constitutional Safeguards for Gender Justice (Articles 14, 15, 16, 39, 42)',
        'sub_topic_kannada': 'ಲಿಂಗ ನ್ಯಾಯಕ್ಕಾಗಿ ಸಾಂವಿಧಾನಿಕ ರಕ್ಷಣೆಗಳು (ವಿಧಿ 14, 15, 16, 39, 42)',
        'node_id': 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    88: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Fundamental Rights, DPSP & Fundamental Duties',
        'domain_kannada': 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು, ಡಿಪಿಎಸ್‌ಪಿ ಮತ್ತು ಮೂಲಭೂತ ಕರ್ತವ್ಯಗಳು',
        'sub_topic': 'Preventive Detention Laws & Constitutional Safeguards under Article 22',
        'sub_topic_kannada': 'ಮುನ್ನೆಚ್ಚರಿಕೆ ಬಂಧನ ಕಾನೂನುಗಳು ಮತ್ತು ವಿಧಿ 22 ರ ಅಡಿಯಲ್ಲಿ ಸಾಂವಿಧಾನಿಕ ರಕ್ಷಣೆಗಳು',
        'node_id': 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    89: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Fundamental Rights, DPSP & Fundamental Duties',
        'domain_kannada': 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು, ಡಿಪಿಎಸ್‌ಪಿ ಮತ್ತು ಮೂಲಭೂತ ಕರ್ತವ್ಯಗಳು',
        'sub_topic': 'Nature, Enforceability and Limitations of Fundamental Rights (Articles 12-35)',
        'sub_topic_kannada': 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳ ಸ್ವರೂಪ, ಜಾರಿಗೊಳಿಸುವಿಕೆ ಮತ್ತು ಮಿತಿಗಳು (ವಿಧಿ 12-35)',
        'node_id': 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    90: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Union Executive & State Executive',
        'domain_kannada': 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ',
        'sub_topic': 'Table of Precedence in the Government of India (Protocol Hierarchy)',
        'sub_topic_kannada': 'ಭಾರತ ಸರ್ಕಾರದ ಆದ್ಯತಾ ಕೋಷ್ಟಕ (ಶಿಷ್ಟಾಚಾರ ಶ್ರೇಣಿ)',
        'node_id': 'indian_polity_constitution_governance.union_executive_state_executive.union_executive',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    91: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Statutory, Regulatory & Quasi-Judicial Bodies',
        'domain_kannada': 'ಶಾಸನಬದ್ಧ, ನಿಯಂತ್ರಕ ಮತ್ತು ಅರೆ-ನ್ಯಾಯಾಂಗ ಸಂಸ್ಥೆಗಳು',
        'sub_topic': 'Attorney General of India (Article 76, Tenure during Pleasure of the President)',
        'sub_topic_kannada': 'ಭಾರತದ ಅಟಾರ್ನಿ ಜನರಲ್ (ವಿಧಿ 76, ರಾಷ್ಟ್ರಪತಿಯವರ ಇಚ್ಛೆಯನುಸಾರ ಅಧಿಕಾರಾವಧಿ)',
        'node_id': 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies.constitutional_bodies',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    92: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Union Executive & State Executive',
        'domain_kannada': 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ',
        'sub_topic': 'Veto Powers of the President of India (Absolute, Suspensive and Pocket Veto)',
        'sub_topic_kannada': 'ಭಾರತದ ರಾಷ್ಟ್ರಪತಿಗಳ ವೀಟೋ ಅಧಿಕಾರಗಳು (ಸಂಪೂರ್ಣ, ಅಮಾನತು ಮತ್ತು ಪಾಕೆಟ್ ವೀಟೋ)',
        'node_id': 'indian_polity_constitution_governance.union_executive_state_executive.union_executive',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    93: {
        'subject': 'Indian Economy & Development',
        'subject_kannada': 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
        'domain': 'Agriculture, Food Management & Subsidies',
        'domain_kannada': 'ಕೃಷಿ, ಆಹಾರ ನಿರ್ವಹಣೆ ಮತ್ತು ಸಬ್ಸಿಡಿಗಳು',
        'sub_topic': 'Agricultural Output Determinants (HYV Seeds, Irrigation, Fertilizers, Mechanization)',
        'sub_topic_kannada': 'ಕೃಷಿ ಉತ್ಪಾದನೆಯ ನಿರ್ಣಾಯಕ ಅಂಶಗಳು (ಬೀಜಗಳು, ನೀರಾವರಿ, ರಸಗೊಬ್ಬರಗಳು, ಯಾಂತ್ರೀಕರಣ)',
        'node_id': 'indian_economy_development.agriculture_food_management_subsidies.cropping_patterns_agrarian_systems',
        'subject_tag': 'Indian Economy & Development'
    },
    94: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'History of Karnataka',
        'domain_kannada': 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ',
        'sub_topic': 'Foundation of Lalbagh Botanical Garden Bengaluru by Hyder Ali & Tipu Sultan',
        'sub_topic_kannada': 'ಬೆಂಗಳೂರಿನ ಲಾಲ್‌ಬಾಗ್ ಸಸ್ಯತೋಟದ ಸ್ಥಾಪನೆ (ಹೈದರ್ ಅಲಿ ಮತ್ತು ಟಿಪ್ಪು ಸುಲ್ತಾನ್)',
        'node_id': 'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.hyder_ali_tipu_sultan_era',
        'subject_tag': 'History'
    },
    95: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Medieval India',
        'domain_kannada': 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ',
        'sub_topic': 'Historic Indian Trading Metropolises & The "City of Gold" (Multan / Sonargaon)',
        'sub_topic_kannada': 'ಐತಿಹಾಸಿಕ ಭಾರತೀಯ ವಾಣಿಜ್ಯ ನಗರಗಳು ಮತ್ತು "ಚಿನ್ನದ ನಗರ" (ಮುಲ್ತಾನ್ / ಸೋನಾರ್‌ಗಾಂವ್)',
        'node_id': 'history.medieval_india.delhi_sultanate',
        'subject_tag': 'History'
    },
    96: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Medieval India',
        'domain_kannada': 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ',
        'sub_topic': 'Delhi Sultanate Central Administrative Departments (Diwan-i-Wizarat, Diwan-i-Arz, Diwan-i-Insha, Diwan-i-Risalat)',
        'sub_topic_kannada': 'ದೆಹಲಿ ಸುಲ್ತಾನರ ಕೇಂದ್ರೀಯ ಆಡಳಿತ ಇಲಾಖೆಗಳು (ದಿವಾನ್-ಇ-ವಿಜಾರತ್, ದಿವಾನ್-ಇ-ಅರ್ಜ್, ದಿವಾನ್-ಇ-ಇನ್ಶಾ)',
        'node_id': 'history.medieval_india.delhi_sultanate',
        'subject_tag': 'History'
    },
    97: {
        'subject': 'History',
        'subject_kannada': 'ಇತಿಹಾಸ',
        'domain': 'Medieval India',
        'domain_kannada': 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ',
        'sub_topic': 'First Battle of Panipat (1526): Babur vs Ibrahim Lodi and Beginning of Mughal Rule',
        'sub_topic_kannada': 'ಮೊದಲ ಪಾಣಿಪತ್ ಕದನ (1526): ಬಾಬರ್ ಮತ್ತು ಇಬ್ರಾಹಿಂ ಲೋಧಿ ಹಾಗೂ ಮೊಘಲ್ ಆಳ್ವಿಕೆಯ ಆರಂಭ',
        'node_id': 'history.medieval_india.mughal_empire.early_mughals_expansion',
        'subject_tag': 'History'
    },
    98: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Historical Background & Making of the Constitution',
        'domain_kannada': 'ಐತಿಹಾಸಿಕ ಹಿನ್ನೆಲೆ ಮತ್ತು ಸಂವಿಧಾನ ರಚನೆ',
        'sub_topic': 'Constituent Assembly of India & Role of Constitutional Advisor Sir B.N. Rau',
        'sub_topic_kannada': 'ಭಾರತದ ಸಂವಿಧಾನ ರಚನಾ ಸಭೆ ಮತ್ತು ಸಾಂವಿಧಾನಿಕ ಸಲಹೆಗಾರ ಸರ್ ಬಿ.ಎನ್. ರಾವ್',
        'node_id': 'indian_polity_constitution_governance.historical_background_making_of_the_constitution.constituent_assembly_drafting_process',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    99: {
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_kannada': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
        'domain': 'Historical Background & Making of the Constitution',
        'domain_kannada': 'ಐತಿಹಾಸಿಕ ಹಿನ್ನೆಲೆ ಮತ್ತು ಸಂವಿಧಾನ ರಚನೆ',
        'sub_topic': 'Indian Independence Act 1947 & Dominion Status Period (15 August 1947 to 26 January 1950)',
        'sub_topic_kannada': '1947 ರ ಭಾರತ ಸ್ವಾತಂತ್ರ್ಯ ಕಾಯ್ದೆ ಮತ್ತು ಡೊಮಿನಿಯನ್ ಸ್ಥಾನಮಾನದ ಅವಧಿ (1947 ರಿಂದ 1950)',
        'node_id': 'indian_polity_constitution_governance.historical_background_making_of_the_constitution.government_of_india_acts',
        'subject_tag': 'Indian Polity, Constitution & Governance'
    },
    100: {
        'subject': 'Indian Society & Social Justice',
        'subject_kannada': 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ',
        'domain': 'Social Sector Development (Health & Education)',
        'domain_kannada': 'ಸಾಮಾಜಿಕ ವಲಯದ ಅಭಿವೃದ್ಧಿ (ಆರೋಗ್ಯ ಮತ್ತು ಶಿಕ್ಷಣ)',
        'sub_topic': 'Evolution of National Flagship Education Schemes (DPEP, SSA, RMSA, Samagra Shiksha)',
        'sub_topic_kannada': 'ರಾಷ್ಟ್ರೀಯ ಪ್ರಮುಖ ಶಿಕ್ಷಣ ಯೋಜನೆಗಳ ವಿಕಾಸ (ಡಿಪಿಇಪಿ, ಸರ್ವ ಶಿಕ್ಷಣ ಅಭಿಯಾನ, ಆರ್‌ಎಂಎಸ್‌ಎ, ಸಮಗ್ರ ಶಿಕ್ಷಣ)',
        'node_id': 'indian_society_social_justice.social_sector_development.education_sector_reforms',
        'subject_tag': 'Indian Society & Social Justice'
    }
}

print(f"NHK_MAP count: {len(NHK_MAP)}")
invalid_nhk = [qnum for qnum, d in NHK_MAP.items() if d['node_id'] not in nodes]
print(f"Invalid NHK node count: {len(invalid_nhk)}")
if invalid_nhk:
    print("Invalid NHK IDs:", invalid_nhk)
else:
    print("ALL 100 NHK NODE IDS ARE 100% VALID!")
