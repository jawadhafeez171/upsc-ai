import json
import glob
import sys
import os

sys.stdout.reconfigure(encoding='utf-8')

# Load Knowledge Graph
with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})
print(f"Loaded {len(nodes)} nodes from knowledge_graph.json")

# Build Hindi dictionaries for Subjects and Domains
SUBJECT_HINDI = {
    "History": "इतिहास",
    "Art, Culture & Heritage": "कला, संस्कृति एवं विरासत",
    "Geography & Earth Systems": "भूगोल एवं भू-प्रणालियाँ",
    "Indian Society & Social Justice": "भारतीय समाज एवं सामाजिक न्याय",
    "Indian Polity, Constitution & Governance": "भारतीय राजव्यवस्था, संविधान एवं शासन",
    "International Relations & Global Institutions": "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
    "Indian Economy & Development": "भारतीय अर्थव्यवस्था एवं विकास",
    "Environment, Ecology & Disaster Management": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
    "Science, Technology & Defence": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
    "Internal Security": "आंतरिक सुरक्षा",
    "Ethics, Integrity & Aptitude": "नीतिशास्त्र, सत्यनिष्ठा एवं अभिरुचि",
    "General Mental Ability, Quantitative Aptitude & Comprehension": "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
    "Educational Psychology, Child Development & Teaching Pedagogy": "शैक्षिक मनोविज्ञान, बाल विकास एवं शिक्षण शास्त्र",
    "Language Proficiency, Grammar & Communication (general Kannada & General English)": "भाषा प्रवीणता, व्याकरण एवं संप्रेषण"
}

DOMAIN_HINDI = {
    "Ancient India": "प्राचीन भारत",
    "Medieval India": "मध्यकालीन भारत",
    "Modern India": "आधुनिक भारत",
    "Indian Freedom Struggle": "भारतीय स्वतंत्रता संग्राम",
    "Post-Independence India": "स्वतंत्रता के बाद का भारत",
    "World History": "विश्व इतिहास",
    "History of Karnataka": "कर्नाटक का इतिहास",
    "Indian Architecture & Sculpture": "भारतीय वास्तुकला एवं मूर्तिकला",
    "Indian Paintings & Visual Arts": "भारतीय चित्रकला एवं दृश्य कला",
    "Performing Arts (Dance, Music, Theatre & Puppetry)": "प्रदर्शन कला (नृत्य, संगीत, रंगमंच एवं कठपुतली)",
    "Indian Literature & Languages": "भारतीय साहित्य एवं भाषाएं",
    "Schools of Indian Philosophy": "भारतीय दर्शन की शाखाएं",
    "Fairs, Festivals, Crafts & UNESCO Heritage": "मेले, त्योहार, शिल्प एवं यूनेस्को विरासत",
    "Martial Arts, Traditional Sports & Indian Calendar Systems": "मार्शल आर्ट, पारंपरिक खेल एवं भारतीय कैलेंडर प्रणालियाँ",
    "Cultural Institutions, Numismatics & Heritage Governance": "सांस्कृतिक संस्थाएं, मुद्राशास्त्र एवं विरासत प्रशासन",
    "Physical Geography & Earth Systems (Geomorphology)": "भौतिक भूगोल एवं भू-प्रणालियाँ (भू-आकृति विज्ञान)",
    "Climatology": "जलवायु विज्ञान",
    "Oceanography & Marine Systems": "समुद्र विज्ञान एवं समुद्री प्रणालियाँ",
    "Indian Physical Geography & Monsoon Architecture": "भारतीय भौतिक भूगोल एवं मानसून संरचना",
    "Human Geography & Population Settlements": "मानव भूगोल एवं जनसंख्या अधिवास",
    "Economic & Resource Geography": "आर्थिक एवं संसाधन भूगोल",
    "Geography of the World": "विश्व का भूगोल",
    "World Mapping & Geopolitical Locations": "विश्व मानचित्रण एवं भू-राजनीतिक स्थल",
    "Indian Mapping & Spatial Geography": "भारतीय मानचित्रण एवं स्थानिक भूगोल",
    "Historical Background & Making of the Constitution": "ऐतिहासिक पृष्ठभूमि एवं संविधान निर्माण",
    "Salient Features, Amendments & Basic Structure": "प्रमुख विशेषताएं, संशोधन एवं मूल संरचना",
    "Fundamental Rights, DPSP & Fundamental Duties": "मूल अधिकार, नीति निदेशक तत्व एवं मूल कर्तव्य",
    "Union Executive & State Executive": "संघीय कार्यपालिका एवं राज्य कार्यपालिका",
    "Parliament & State Legislatures": "संसद एवं राज्य विधायिकाएं",
    "Indian Judiciary & Judicial System": "भारतीय न्यायपालिका एवं न्यायिक प्रणाली",
    "Federal Structure, Center-State Relations & Devolution": "संघीय ढांचा, केंद्र-राज्य संबंध एवं वित्तीय हस्तांतरण",
    "Local Governance (Panchayati Raj & Municipalities)": "स्थानीय शासन (पंचायती राज एवं नगरपालिकाएं)",
    "Statutory, Regulatory & Quasi-Judicial Bodies": "सांविधिक, विनियामक एवं अर्ध-न्यायिक निकाय",
    "Good Governance & Administrative Reforms": "सुशासन एवं प्रशासनिक सुधार",
    "Transparency, Accountability & Citizen Charters": "पारदर्शिता, जवाबदेही एवं नागरिक अधिकार पत्र",
    "E-Governance Models & Digital Public Infrastructure": "ई-गवर्नेंस मॉडल एवं डिजिटल सार्वजनिक अवसंरचना",
    "Role of Civil Services in a Democracy": "लोकतंत्र में सिविल सेवाओं की भूमिका",
    "India's Foreign Policy & Bilateral Relations": "भारत की विदेश नीति एवं द्विपक्षीय संबंध",
    "Regional & Multilateral Groupings": "क्षेत्रीय एवं बहुपक्षीय समूह",
    "Global Institutions, Agreements & Treaties": "वैश्विक संस्थाएं, समझौते एवं संधियां",
    "Indian Diaspora": "भारतीय प्रवासी",
    "Macroeconomic Fundamentals & National Income Accounting": "समष्टि आर्थिक आधार एवं राष्ट्रीय आय लेखांकन",
    "Planning, Mobilisation of Resources & Inclusive Growth": "योजना, संसाधन गतिशीलता एवं समावेशी विकास",
    "Monetary Policy & Banking Architecture": "मौद्रिक नीति एवं बैंकिंग संरचना",
    "Fiscal Policy, Public Finance & Taxation": "राजकोषीय नीति, लोक वित्त एवं कराधान",
    "Agriculture, Food Management & Subsidies": "कृषि, खाद्य प्रबंधन एवं सब्सिडी",
    "Industrial Policy, Manufacturing & Services": "औद्योगिक नीति, विनिर्माण एवं सेवाएं",
    "Infrastructure, Energy & Investment Models": "अवसंरचना, ऊर्जा एवं निवेश मॉडल",
    "External Sector, Balance of Payments & Foreign Trade": "बाह्य क्षेत्र, भुगतान संतुलन एवं विदेशी व्यापार",
    "Fundamental Ecology & Ecosystem Dynamics": "मूलभूत पारिस्थितिकी एवं पारितंत्र गतिकी",
    "Biodiversity, Wildlife Conservation & Protected Areas": "जैव विविधता, वन्यजीव संरक्षण एवं संरक्षित क्षेत्र",
    "Environmental Pollution, Waste Management & Remediation": "पर्यावरण प्रदूषण, अपशिष्ट प्रबंधन एवं निवारण",
    "Climate Change Science, Carbon Markets & Global Conventions": "जलवायु परिवर्तन विज्ञान, कार्बन बाजार एवं वैश्विक सम्मेलन",
    "Environmental Legislation, Institutions & EIA in India": "पर्यावरण कानून, संस्थाएं एवं पर्यावरण प्रभाव आकलन",
    "Hazard Profiles & Disaster Vulnerability in India": "आपदा परिदृश्य एवं सुभेद्यता",
    "Institutional, Legal & Operational Framework": "संस्थागत, विधिक एवं परिचालन ढांचा",
    "Risk Reduction, Resilience & Global Conventions": "जोखिम न्यूनीकरण, अनुकूलन एवं वैश्विक संधियां",
    "Space Technology & Astronomy": "अंतरिक्ष प्रौद्योगिकी एवं खगोल विज्ञान",
    "Biotechnology, Health & Life Sciences": "जैव प्रौद्योगिकी, स्वास्थ्य एवं जीवन विज्ञान",
    "Information & Communication Technology (ICT), AI & Cyber Security": "सूचना एवं संचार प्रौद्योगिकी, एआई एवं साइबर सुरक्षा",
    "Defence Technology": "रक्षा प्रौद्योगिकी",
    "Nuclear Technology & Energy": "परमाणु प्रौद्योगिकी एवं ऊर्जा",
    "Nanoscience & Advanced Materials": "नैनो विज्ञान एवं उन्नत सामग्री",
    "Applied & Fundamental Sciences": "अनुप्रयुक्त एवं मूलभूत विज्ञान",
    "Linkages between Development & Extremism (LWE)": "विकास एवं उग्रवाद के बीच संबंध",
    "Terrorism, Insurgencies & Cross-Border Security": "आतंकवाद, उग्रवाद एवं सीमा पार सुरक्षा",
    "Border Management & Coastal Security": "सीमा प्रबंधन एवं तटीय सुरक्षा",
    "Transnational Organised Crime & Illicit Financial Flows": "अंतर्राष्ट्रीय संगठित अपराध एवं अवैध वित्तीय प्रवाह",
    "Cyber Warfare, Critical Infrastructure & Digital Security": "साइबर युद्ध, महत्वपूर्ण अवसंरचना एवं डिजिटल सुरक्षा",
    "Security Forces, Intelligence Agencies & Statutory Mandates": "सुरक्षा बल, खुफिया एजेंसियां एवं सांविधिक अधिकार",
    "Quantitative Aptitude & Basic Numeracy": "मात्रात्मक अभिरुचि एवं मूलभूत अंकगणित",
    "General Mental Ability & Logical Reasoning": "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
    "Reading Comprehension & Interpersonal Skills": "बोधगम्यता एवं अंतर-वैयक्तिक कौशल",
    "Poverty, Inequality & Developmental Challenges": "गरीबी, असमानता एवं विकासात्मक चुनौतियां",
    "Welfare Schemes for Vulnerable Sections": "कमजोर वर्गों के लिए कल्याणकारी योजनाएं",
    "Social Sector Development (Health & Education)": "सामाजिक क्षेत्र का विकास (स्वास्थ्य एवं शिक्षा)"
}

# Targeted Remediations for specific questions identified during audit
# Key is (year, question_number)
EXPLICIT_QUESTION_FIXES = {
    # 2014
    (2014, 3): "history.ancient_india.sources_of_ancient_indian_history",
    (2014, 7): "geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts",
    (2014, 10): "history.medieval_india.mughal_empire",
    (2014, 48): "indian_economy_development.external_sector_balance_of_payments_foreign_trade",
    (2014, 52): "history.modern_india.economic_impact_of_british_rule",
    
    # 2015
    (2015, 32): "indian_polity_constitution_governance.good_governance_administrative_reforms",
    (2015, 89): "indian_polity_constitution_governance.union_executive_state_executive",
    (2015, 104): "geography_earth_systems.physical_geography_earth_systems",
    
    # 2016
    (2016, 47): "indian_economy_development.industrial_policy_manufacturing_services",
    (2016, 48): "geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics",
    (2016, 76): "history.modern_india.british_expansionist_policies_administrative_machinery",
    (2016, 104): "art_culture_heritage.indian_literature_languages",
    (2016, 113): "history.world_history",
    
    # 2017
    (2017, 19): "international_relations_global_institutions.global_institutions_agreements_treaties",
    (2017, 82): "geography_earth_systems.economic_resource_geography",
    (2017, 123): "geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics",
    
    # 2018
    (2018, 30): "geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india",
    (2018, 82): "indian_polity_constitution_governance.salient_features_amendments_basic_structure",
    (2018, 93): "indian_polity_constitution_governance.parliament_state_legislatures",
    (2018, 95): "indian_polity_constitution_governance.salient_features_amendments_basic_structure",
    (2018, 102): "history.ancient_india.religious_movements_buddhism",
    
    # 2019
    (2019, 3): "indian_polity_constitution_governance.parliament_state_legislatures",
    (2019, 11): "indian_economy_development.macroeconomic_fundamentals_national_income_accounting",
    (2019, 30): "international_relations_global_institutions.indias_foreign_policy_bilateral_relations",
    (2019, 34): "science_technology_defence.applied_fundamental_sciences",
    (2019, 91): "history.modern_india.early_peasant_tribal_civil_uprisings",
    (2019, 121): "science_technology_defence.applied_fundamental_sciences",
    
    # 2021
    (2021, 40): "history.ancient_india.indus_valley_civilization",
    (2021, 118): "internal_security.border_management_coastal_security",
    
    # 2022
    (2022, 12): "science_technology_defence.biotechnology_health_life_sciences",
    (2022, 39): "science_technology_defence.applied_fundamental_sciences",
    (2022, 54): "indian_economy_development.planning_mobilisation_of_resources_inclusive_growth",
    (2022, 70): "indian_polity_constitution_governance.federal_structure_center-state_relations_devolution",
    
    # 2023
    (2023, 71): "science_technology_defence.applied_fundamental_sciences",
    (2023, 91): "history.ancient_india.vedic_age",
    (2023, 102): "indian_polity_constitution_governance.transparency_accountability_citizen_charters",
    
    # 2024
    (2024, 22): "science_technology_defence.biotechnology_health_life_sciences",
    (2024, 78): "history.medieval_india.mughal_empire",
    (2024, 115): "indian_economy_development.industrial_policy_manufacturing_services",
    
    # 2025
    (2025, 2): "international_relations_global_institutions.indias_foreign_policy_bilateral_relations",
    (2025, 25): "indian_economy_development.industrial_policy_manufacturing_services",
    (2025, 26): "history.modern_india.british_expansionist_policies_administrative_machinery",
    (2025, 80): "science_technology_defence.information_communication_technology_ai_cyber_security",
    (2025, 82): "indian_economy_development.infrastructure_energy_investment_models",
    (2025, 83): "science_technology_defence.applied_fundamental_sciences",
    
    # 2026
    (2026, 5): "internal_security.cyber_warfare_critical_infrastructure_digital_security",
    (2026, 8): "indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies",
    (2026, 24): "indian_economy_development.fiscal_policy_public_finance_taxation",
    (2026, 54): "indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties",
    (2026, 84): "indian_economy_development.infrastructure_energy_investment_models",
    (2026, 85): "geography_earth_systems.economic_resource_geography",
    (2026, 92): "science_technology_defence.biotechnology_health_life_sciences",
    (2026, 110): "science_technology_defence.applied_fundamental_sciences",
    (2026, 112): "science_technology_defence.applied_fundamental_sciences",
    (2026, 114): "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains",
    (2026, 116): "science_technology_defence.applied_fundamental_sciences",
    (2026, 125): "science_technology_defence.information_communication_technology_ai_cyber_security"
}

# Node alias mapping for invalid node IDs to valid KG node IDs
NODE_ALIAS_MAP = {
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.coding_decoding_letter_number':
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_deductive_reasoning.venn_diagrams_two_three_sets':
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.set_theory_venn_diagrams_max_min',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.blood_relations_family_tree':
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.blood_relations_family_trees_coded_relations',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.classification_odd_one_out':
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.order_ranking_comparative_arrangements',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_letter_number_operations':
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.mathematical_operations_symbol_substitution':
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.mathematical_operators_symbolic_logic',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_symbol_series':
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.algebra_linear_quadratic_equations':
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.mensuration_2d_3d':
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.3d_mensuration_solids_surface_area_volume',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.number_systems_divisibility_remainders':
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.lcm_hcf_factors_multiples',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.percentages_profit_loss':
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.percentages_successive_change',
    'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.time_work_pipes_cisterns':
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_and_work_pipes_and_cisterns',
    'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_proportional_parts':
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_variations_partnerships',
    'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_compound_interest_formulae':
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.compound_interest_installments',
    'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_unit_conversions':
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains',
    'geography_earth_systems.economic_human_geography':
        'geography_earth_systems.economic_resource_geography',
    'indian_economy_development.fiscal_policy_taxation_public_finance':
        'indian_economy_development.fiscal_policy_public_finance_taxation',
    'indian_economy_development.poverty_inclusion_demographics_social_sector_initiatives':
        'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth'
}

def resolve_kg_metadata(node_id):
    """
    Takes any valid node_id in knowledge_graph.json and derives its:
    - subject, subject_hindi
    - domain, domain_hindi
    - sub_topic, sub_topic_hindi
    """
    if node_id not in nodes:
        raise ValueError(f"node_id '{node_id}' not found in knowledge_graph.json!")
    
    target_node = nodes[node_id]
    
    # 1. Subject (Level 1)
    subj_id = target_node.get('subjectId')
    subj_node = nodes.get(subj_id, target_node if target_node.get('level') == 1 else {})
    subject_en = subj_node.get('name', 'General Studies')
    subject_hi = SUBJECT_HINDI.get(subject_en, subject_en)
    
    # 2. Domain (Level 2)
    # Find Level 2 ancestor or self
    level = target_node.get('level', 1)
    ancestors = target_node.get('ancestorIds', [])
    
    domain_en = None
    if level == 2:
        domain_en = target_node.get('name')
    elif level > 2:
        for anc_id in ancestors:
            anc_node = nodes.get(anc_id, {})
            if anc_node.get('level') == 2:
                domain_en = anc_node.get('name')
                break
        if not domain_en:
            # check parent
            pnode = nodes.get(target_node.get('parentId'), {})
            if pnode.get('level') == 2:
                domain_en = pnode.get('name')
    
    if not domain_en:
        domain_en = target_node.get('name')
    
    domain_hi = DOMAIN_HINDI.get(domain_en, domain_en)
    
    # 3. Sub-topic (Level 3 or self if level 3/4)
    sub_topic_en = None
    if level == 3:
        sub_topic_en = target_node.get('name')
    elif level == 4:
        # parent is level 3
        pnode = nodes.get(target_node.get('parentId'), {})
        sub_topic_en = pnode.get('name', target_node.get('name'))
    elif level == 2:
        # Use first child if available, or domain name
        ch = target_node.get('childrenIds', [])
        if ch and ch[0] in nodes:
            sub_topic_en = nodes[ch[0]].get('name')
        else:
            sub_topic_en = domain_en
    else:
        sub_topic_en = target_node.get('name')
    
    # Clean up long names in sub_topic_en (remove parenthesized definitions if over 80 chars)
    if len(sub_topic_en) > 85 and '(' in sub_topic_en:
        sub_topic_en = sub_topic_en.split('(')[0].strip()
    
    sub_topic_hi = sub_topic_en  # Hindi subtopic can match English or use domain hindi
    
    return {
        "node_id": node_id,
        "subject": subject_en,
        "subject_hindi": subject_hi,
        "domain": domain_en,
        "domain_hindi": domain_hi,
        "sub_topic": sub_topic_en,
        "sub_topic_hindi": sub_topic_hi
    }

# Process all 13 files
capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))
total_remediated = 0

for fpath in capf_files:
    fname = os.path.basename(fpath)
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    
    modified_count = 0
    for q in data:
        year = int(q.get('year', 0))
        qnum = int(q.get('question_number', 0))
        cur_nid = q.get('node_id', '')
        
        target_nid = None
        # Check explicit override
        if (year, qnum) in EXPLICIT_QUESTION_FIXES:
            target_nid = EXPLICIT_QUESTION_FIXES[(year, qnum)]
        elif cur_nid in NODE_ALIAS_MAP:
            target_nid = NODE_ALIAS_MAP[cur_nid]
        elif cur_nid in nodes:
            target_nid = cur_nid
        else:
            # Fallback for any other invalid node
            target_nid = "science_technology_defence.applied_fundamental_sciences"
        
        # Resolve authoritative metadata
        resolved = resolve_kg_metadata(target_nid)
        
        q['node_id'] = resolved['node_id']
        q['subject'] = resolved['subject']
        q['subject_hindi'] = resolved['subject_hindi']
        q['domain'] = resolved['domain']
        q['domain_hindi'] = resolved['domain_hindi']
        q['sub_topic'] = resolved['sub_topic']
        q['sub_topic_hindi'] = resolved['sub_topic_hindi']
        
        # Tags update
        q['tags'] = [
            "CAPF",
            f"CAPF-{year}",
            f"Paper-1",
            resolved['subject'],
            resolved['domain']
        ]
        
        modified_count += 1
        total_remediated += 1
    
    with open(fpath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
    print(f"Updated {fname}: {modified_count} questions.")

print(f"\n==========================================")
print(f"REMEDIATION COMPLETE: {total_remediated} questions processed.")
print(f"==========================================")
