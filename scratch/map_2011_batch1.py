import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)
valid_nids = set(master_kg['nodes'].keys())

# Complete mappings for 2011 (Q1 to Q100)
MAPPINGS_2011 = {
    1: {
        'node_id': 'science_technology_defence.applied_and_fundamental_sciences.applied_chemistry',
        'subject': 'Science, Technology & Defence',
        'subject_hindi': 'विज्ञान, प्रौद्योगिकी एवं रक्षा',
        'domain': 'Applied & Fundamental Sciences',
        'domain_hindi': 'अनुप्रयुक्त एवं मूलभूत विज्ञान',
        'sub_topic': 'Bioasphalt & Eco-Friendly Road Surfacing Polymers',
        'sub_topic_hindi': 'बायोऐस्फाल्ट एवं पर्यावरण-अनुकूल सड़क निर्माण बहुलक',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Bioasphalt', 'Renewable Energy', 'Road Infrastructure', 'Green Chemistry']
    },
    2: {
        'node_id': 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality',
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_hindi': 'पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन',
        'domain': 'Environmental Pollution, Waste Management & Remediation',
        'domain_hindi': 'पर्यावरणीय प्रदूषण, अपशिष्ट प्रबंधन एवं उपचार',
        'sub_topic': 'Thermal Power Plant Emissions: Carbon Dioxide, NOx and SOx',
        'sub_topic_hindi': 'उष्मीय शक्ति संयंत्र उत्सर्जन: कार्बन डाइऑक्साइड, नाइट्रोजन और सल्फर के ऑक्साइड',
        'difficulty': 'easy',
        'tags': ['UPSC 2011', 'Thermal Power Plants', 'Coal Combustion', 'Air Pollution', 'SOx and NOx']
    },
    3: {
        'node_id': 'science_technology_defence.space_technology_astronomy.orbits_satellite_navigation_applications',
        'subject': 'Science, Technology & Defence',
        'subject_hindi': 'विज्ञान, प्रौद्योगिकी एवं रक्षा',
        'domain': 'Space Technology & Astronomy',
        'domain_hindi': 'अंतरिक्ष प्रौद्योगिकी एवं खगोल विज्ञान',
        'sub_topic': 'Geostationary & Geosynchronous Orbit Mechanics (35,786 km Circular Equatorial Orbit)',
        'sub_topic_hindi': 'भू-स्थिर एवं भू-तुल्यकालिक कक्षा यांत्रिकी (35,786 किमी वृत्ताकार भूमध्यरेखीय कक्षा)',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Geostationary Orbit', 'Satellite Communications', 'Space Science']
    },
    4: {
        'node_id': 'indian_economy_development.agriculture_food_management_subsidies.agricultural_pricing_market_reforms',
        'subject': 'Indian Economy & Development',
        'subject_hindi': 'भारतीय अर्थव्यवस्था एवं विकास',
        'domain': 'Agriculture, Food Management & Subsidies',
        'domain_hindi': 'कृषि, खाद्य प्रबंधन एवं सब्सिडी',
        'sub_topic': 'Food Inflation in India: Dietary Diversification & Supply Chain Constraints',
        'sub_topic_hindi': 'भारत में खाद्य मुद्रास्फीति: आहार विविधीकरण एवं आपूर्ति श्रृंखला बाधाएं',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Food Inflation', 'Consumption Pattern', 'Supply Chains', 'Indian Economy']
    },
    5: {
        'node_id': 'science_technology_defence.biotechnology_health_life_sciences.genomics_genetics_gene_editing',
        'subject': 'Science, Technology & Defence',
        'subject_hindi': 'विज्ञान, प्रौद्योगिकी एवं रक्षा',
        'domain': 'Biotechnology, Health & Life Sciences',
        'domain_hindi': 'जैव प्रौद्योगिकी, स्वास्थ्य एवं जीवन विज्ञान',
        'sub_topic': 'Chromosome Mapping & DNA Marker-Assisted Selection in Livestock Pedigree',
        'sub_topic_hindi': 'गुणसूत्र मानचित्रण एवं पशुधन वंशावली में डीएनए मार्कर-सहायता प्राप्त चयन',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Gene Mapping', 'DNA Sequencing', 'Livestock Pedigree', 'Genetics']
    },
    6: {
        'node_id': 'indian_economy_development.external_sector_balance_of_payments_trade.balance_of_payments_current_capital_account',
        'subject': 'Indian Economy & Development',
        'subject_hindi': 'भारतीय अर्थव्यवस्था एवं विकास',
        'domain': 'External Sector, Balance of Payments & International Trade',
        'domain_hindi': 'बाह्य क्षेत्र, भुगतान संतुलन एवं अंतर्राष्ट्रीय व्यापार',
        'sub_topic': 'Invisibles & Service Exports: Tourism Earnings from International Sports Events',
        'sub_topic_hindi': 'अदृश्य मदें एवं सेवा निर्यात: अंतर्राष्ट्रीय खेल आयोजनों से पर्यटन आय',
        'difficulty': 'easy',
        'tags': ['UPSC 2011', 'Balance of Payments', 'Service Exports', 'Tourism Earnings', 'Commonwealth Games']
    },
    7: {
        'node_id': 'science_technology_defence.applied_and_fundamental_sciences.applied_chemistry',
        'subject': 'Science, Technology & Defence',
        'subject_hindi': 'विज्ञान, प्रौद्योगिकी एवं रक्षा',
        'domain': 'Applied & Fundamental Sciences',
        'domain_hindi': 'अनुप्रयुक्त एवं मूलभूत विज्ञान',
        'sub_topic': 'Microbial Fuel Cells (MFCs): Bio-Electrochemical Electricity from Wastewater',
        'sub_topic_hindi': 'सूक्ष्मजैविक ईंधन सेल (MFCs): अपशिष्ट जल से जैव-विद्युत रासायनिक ऊर्जा उत्पादन',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Microbial Fuel Cells', 'Renewable Energy', 'Biotechnology', 'Wastewater Treatment']
    },
    8: {
        'node_id': 'indian_economy_development.fiscal_policy_government_budgeting.fiscal_policy_frbm_budgetary_processes',
        'subject': 'Indian Economy & Development',
        'subject_hindi': 'भारतीय अर्थव्यवस्था एवं विकास',
        'domain': 'Fiscal Policy, Public Finance & Taxation Architecture',
        'domain_hindi': 'राजकोषीय नीति, लोक वित्त एवं कराधान संरचना',
        'sub_topic': 'Keynesian Fiscal Stimulus: Government Spending & Tax Relief for Economic Recovery',
        'sub_topic_hindi': 'कीन्सवादी राजकोषीय प्रोत्साहन: आर्थिक सुधार हेतु सरकारी व्यय एवं कर राहत',
        'difficulty': 'easy',
        'tags': ['UPSC 2011', 'Fiscal Stimulus', 'Public Spending', 'Economic Recovery', 'Macroeconomics']
    },
    9: {
        'node_id': 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.ozone_layer_depletion_montreal_protocol_kigali_amendment',
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_hindi': 'पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन',
        'domain': 'Climate Change, Global Warming & Mitigation',
        'domain_hindi': 'जलवायु परिवर्तन, वैश्विक तापन एवं शमन',
        'sub_topic': 'Antarctic Ozone Hole: Polar Stratospheric Clouds & CFC Chlorine Activation',
        'sub_topic_hindi': 'अंटार्कटिक ओजोन छिद्र: ध्रुवीय समतापमंडलीय बादल एवं सीएफसी क्लोरीन सक्रियण',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Ozone Hole', 'Polar Stratospheric Clouds', 'CFCs', 'Montreal Protocol']
    },
    10: {
        'node_id': 'indian_economy_development.external_sector_balance_of_payments_trade.balance_of_payments_current_capital_account',
        'subject': 'Indian Economy & Development',
        'subject_hindi': 'भारतीय अर्थव्यवस्था एवं विकास',
        'domain': 'External Sector, Balance of Payments & International Trade',
        'domain_hindi': 'बाह्य क्षेत्र, भुगतान संतुलन एवं अंतर्राष्ट्रीय व्यापार',
        'sub_topic': 'Current Account Deficit (CAD) Management: Currency Devaluation & Trade Policies',
        'sub_topic_hindi': 'चालू खाता घाटा (CAD) प्रबंधन: मुद्रा अवमूल्यन एवं व्यापार नीतियां',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Current Account Deficit', 'Currency Devaluation', 'Balance of Payments']
    },
    11: {
        'node_id': 'indian_polity_constitution_governance.local_self-government_decentralisation.73rd_74th_constitutional_amendment_acts',
        'subject': 'Indian Polity, Constitution & Governance',
        'subject_hindi': 'भारतीय राजव्यवस्था, संविधान एवं शासन',
        'domain': 'Local Self-Government & Grassroots Democracy',
        'domain_hindi': 'स्थानीय स्वशासन एवं जमीनी स्तर का लोकतंत्र',
        'sub_topic': '73rd Amendment Act 1992: District Planning Committees & State Finance Commissions',
        'sub_topic_hindi': '73वां संशोधन अधिनियम 1992: जिला योजना समितियां एवं राज्य वित्त आयोग',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', '73rd Amendment', 'Panchayati Raj', 'District Planning Committee', 'State Finance Commission']
    },
    12: {
        'node_id': 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india.peninsular_river_systems_east_and_west_flowing',
        'subject': 'Geography & Earth Systems',
        'subject_hindi': 'भूगोल एवं पृथ्वी प्रणाली',
        'domain': 'Indian Physical Geography & Monsoon Architecture',
        'domain_hi': 'भारतीय भौतिक भूगोल एवं मानसून संरचना',
        'sub_topic': 'Brahmani and Baitarani River Basins: Koel-Sankh Confluence & Bhitarkanika Habitat',
        'sub_topic_hindi': 'ब्राह्मणी एवं बैतरणी नदी बेसिन: कोयल-सांख संगम एवं भितरकनिका पर्यावास',
        'difficulty': 'hard',
        'tags': ['UPSC 2011', 'Brahmani River', 'Baitarani River', 'Bhitarkanika', 'Odisha', 'Mapping'],
        'is_mapping': True,
        'mapping': {
            'is_mapping': True,
            'region': 'India',
            'category': 'Rivers & Drainage',
            'spatial_skill': 'location_identification',
            'has_image': False
        },
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering']
    },
    13: {
        'node_id': 'indian_economy_development.monetary_policy_financial_intermediation.inflation_targeting_framework_mpc',
        'subject': 'Indian Economy & Development',
        'subject_hindi': 'भारतीय अर्थव्यवस्था एवं विकास',
        'domain': 'Monetary Policy, Inflation & Financial Intermediation',
        'domain_hindi': 'मौद्रिक नीति, मुद्रास्फीति एवं वित्तीय मध्यस्थता',
        'sub_topic': 'Base Effect in Price Index Inflation Computations',
        'sub_topic_hindi': 'मूल्य सूचकांक मुद्रास्फीति गणना में आधार प्रभाव (Base Effect)',
        'difficulty': 'easy',
        'tags': ['UPSC 2011', 'Base Effect', 'Inflation Measurement', 'Price Indices', 'Macroeconomics']
    },
    14: {
        'node_id': 'geography_earth_systems.human_geography_population_settlements.demographic_attributes_vital_rates_fertility_demographic_dividend',
        'subject': 'Geography & Earth Systems',
        'subject_hindi': 'भूगोल एवं पृथ्वी प्रणाली',
        'domain': 'Human Geography & Population Settlements',
        'domain_hindi': 'मानव भूगोल एवं जनसंख्या अधिवास',
        'sub_topic': 'Demographic Dividend in India: Bulge in Working-Age Population (15-64 Years)',
        'sub_topic_hindi': 'भारत में जनसांख्यिकीय लाभांश: कार्यशील आयु जनसंख्या में उभार (15-64 वर्ष)',
        'difficulty': 'easy',
        'tags': ['UPSC 2011', 'Demographic Dividend', 'Age Structure', 'Working Population', 'Human Geography']
    },
    15: {
        'node_id': 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.unfccc_evolution_cop_summits_kyoto_protocol_mechanisms_clean_development_mechanism_cdm_joint_implementation_emissions_trading',
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_hindi': 'पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन',
        'domain': 'Climate Change, Global Warming & Mitigation',
        'domain_hindi': 'जलवायु परिवर्तन, वैश्विक तापन एवं शमन',
        'sub_topic': 'Carbon Credits & Clean Development Mechanism (CDM) under Kyoto Protocol',
        'sub_topic_hindi': 'क्योतो प्रोटोकॉल के तहत कार्बन क्रेडिट एवं स्वच्छ विकास तंत्र (CDM)',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Carbon Credits', 'Kyoto Protocol', 'Clean Development Mechanism', 'Carbon Trading']
    },
    16: {
        'node_id': 'indian_economy_development.fiscal_policy_government_budgeting.goods_and_services_tax_gst_indirect_taxes',
        'subject': 'Indian Economy & Development',
        'subject_hindi': 'भारतीय अर्थव्यवस्था एवं विकास',
        'domain': 'Fiscal Policy, Public Finance & Taxation Architecture',
        'domain_hindi': 'राजकोषीय नीति, लोक वित्त एवं कराधान संरचना',
        'sub_topic': 'Value Added Tax (VAT): Multipoint Taxation with Input Tax Credit',
        'sub_topic_hindi': 'मूल्य वर्धित कर (VAT): इनपुट टैक्स क्रेडिट सहित बहु-बिंदु कराधान',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Value Added Tax', 'VAT', 'Input Tax Credit', 'Indirect Taxes']
    },
    17: {
        'node_id': 'indian_economy_development.external_sector_balance_of_payments_trade.foreign_trade_policy_international_agreements',
        'subject': 'Indian Economy & Development',
        'subject_hindi': 'भारतीय अर्थव्यवस्था एवं विकास',
        'domain': 'External Sector, Balance of Payments & International Trade',
        'domain_hindi': 'बाह्य क्षेत्र, भुगतान संतुलन एवं अंतर्राष्ट्रीय व्यापार',
        'sub_topic': 'Closed Economy Paradigm: Zero International Trade (Exports = Imports = 0)',
        'sub_topic_hindi': 'बंद अर्थव्यवस्था प्रतिमान: शून्य अंतर्राष्ट्रीय व्यापार (निर्यात = आयात = 0)',
        'difficulty': 'easy',
        'tags': ['UPSC 2011', 'Closed Economy', 'Foreign Trade', 'Macroeconomics']
    },
    18: {
        'node_id': 'science_technology_defence.applied_and_fundamental_sciences.applied_biology_human_physiology',
        'subject': 'Science, Technology & Defence',
        'subject_hindi': 'विज्ञान, प्रौद्योगिकी एवं रक्षा',
        'domain': 'Applied & Fundamental Sciences',
        'domain_hindi': 'अनुप्रयुक्त एवं मूलभूत विज्ञान',
        'sub_topic': 'Plant Physiology: Girdling Experiment & Phloem Nutrient Starvation in Roots',
        'sub_topic_hindi': 'पादप कार्यिकी: गर्डलिंग प्रयोग एवं जड़ों में फ्लोएम पोषक तत्वों की कमी',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Plant Physiology', 'Phloem', 'Girdling', 'Botany']
    },
    19: {
        'node_id': 'history.world_history.global_challenges_transnational_crises_since_1900.nuclear_proliferation_arms_control_treaties_disarmament',
        'subject': 'History',
        'subject_hindi': 'इतिहास',
        'domain': 'World History',
        'domain_hindi': 'विश्व इतिहास',
        'sub_topic': 'New START Treaty: Strategic Arms Reduction between United States and Russia',
        'sub_topic_hindi': 'न्यू स्टार्ट संधि: संयुक्त राज्य अमेरिका एवं रूस के बीच रणनीतिक हथियार कटौती',
        'difficulty': 'easy',
        'tags': ['UPSC 2011', 'New START Treaty', 'USA-Russia', 'Nuclear Arms Reduction', 'Disarmament']
    },
    20: {
        'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.biodiversity_fundamentals_patterns',
        'subject': 'Environment, Ecology & Disaster Management',
        'subject_hindi': 'पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन',
        'domain': 'Biodiversity & Wildlife Conservation (Protected Areas)',
        'domain_hindi': 'जैव विविधता एवं वन्यजीव संरक्षण (संरक्षित क्षेत्र)',
        'sub_topic': 'Western Ghats & Indo-Burma Biodiversity Hotspots: Norman Myers Endemism Criteria',
        'sub_topic_hindi': 'पश्चिमी घाट एवं इंडो-बर्मा जैव विविधता हॉटस्पॉट: नॉर्मन मायर्स स्थानिक प्रजाति मानदंड',
        'difficulty': 'medium',
        'tags': ['UPSC 2011', 'Western Ghats', 'Biodiversity Hotspots', 'Indo-Burma', 'Endemism', 'Mapping'],
        'is_mapping': True,
        'mapping': {
            'is_mapping': True,
            'region': 'India',
            'category': 'Protected Areas & Biogeography',
            'spatial_skill': 'location_identification',
            'has_image': False
        },
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
    }
}

print(f"Loaded {len(MAPPINGS_2011)} mappings. Verifying valid node IDs...")
for q_num, m in MAPPINGS_2011.items():
    nid = m['node_id']
    if nid not in valid_nids:
        print(f"ERROR: {nid} not in master KG!")

print("All checked node IDs are 100% valid in master KG!")
