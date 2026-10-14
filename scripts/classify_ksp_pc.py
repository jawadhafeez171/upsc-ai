# -*- coding: utf-8 -*-
"""
Comprehensive Classifier and Knowledge Graph Enrichment Engine for Karnataka Police Constable (KSP PC) Datasets.
Classifies all 28 unmapped question files (2,800 questions) + 2 existing files in src/data/pc.
Validates all node_ids against src/data/knowledge_graph.json.
Fixes null years for 2007 and 2020 Band Constable papers.
"""

import os
import sys
import json
import re

sys.stdout.reconfigure(encoding='utf-8')

# Canonical Subject Translations
SUBJECT_TRANSLATIONS = {
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
    'Ethics, Integrity & Aptitude': 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ'
}

# Domain Translations
DOMAIN_TRANSLATIONS = {
    'Geography of Karnataka': 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ',
    'Physical Geography': 'ಭೌತಿಕ ಭೂಗೋಳ',
    'Indian Geography': 'ಭಾರತದ ಭೂಗೋಳ',
    'Economic & Resource Geography': 'ಆರ್ಥಿಕ ಮತ್ತು ಸಂಪನ್ಮೂಲ ಭೂಗೋಳಶಾಸ್ತ್ರ',
    'History of Karnataka': 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ',
    'Modern Indian History & Freedom Struggle': 'ಆಧುನಿಕ ಭಾರತದ ಇತಿಹಾಸ ಮತ್ತು ಸ್ವಾತಂತ್ರ್ಯ ಸಂಗ್ರಾಮ',
    'Ancient Indian History': 'ಪ್ರಾಚೀನ ಭಾರತದ ಇತಿಹಾಸ',
    'Medieval Indian History': 'ಮಧ್ಯಕಾಲೀನ ಭಾರತದ ಇತಿಹಾಸ',
    'Constitutional Framework': 'ಸಂವಿಧಾನದ ಚೌಕಟ್ಟು',
    'Union & State Executive': 'ಕೇಂದ್ರ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ',
    'Union & State Legislature': 'ಕೇಂದ್ರ ಮತ್ತು ರಾಜ್ಯ ಶಾಸಕಾಂಗ',
    'Judiciary & Legal System': 'ನ್ಯಾಯಾಂಗ ಮತ್ತು ಕಾನೂನು ವ್ಯವಸ್ಥೆ',
    'Local Governance & Panchayati Raj': 'ಸ್ಥಳೀಯ ಆಡಳಿತ ಮತ್ತು ಪಂಚಾಯತ್ ರಾಜ್',
    'Constitutional & Statutory Bodies': 'ಸಾಂವಿಧಾನಿಕ ಮತ್ತು ಶಾಸನಬದ್ಧ ಸಂಸ್ಥೆಗಳು',
    'Applied & Fundamental Sciences': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
    'Biotechnology, Health & Life Sciences': 'ಜೈವಿಕ ತಂತ್ರಜ್ಞಾನ, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವ ವಿಜ್ಞಾನ',
    'Space Technology & Astronomy': 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ',
    'Information & Communication Technology': 'ಮಾಹಿತಿ ಮತ್ತು ಸಂವಹನ ತಂತ್ರಜ್ಞಾನ',
    'Defence Technology': 'ರಕ್ಷಣಾ ತಂತ್ರಜ್ಞಾನ',
    'Quantitative Aptitude & Basic Numeracy': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲಭೂತ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
    'Logical & Analytical Reasoning': 'ತಾರ್ಕಿಕ ಮತ್ತು ವಿಶ್ಲೇಷಣಾತ್ಮಕ ತಾರ್ಕಿಕತೆ',
    'Security Forces & Police Administration': 'ಭದ್ರತಾ ಪಡೆಗಳು ಮತ್ತು ಪೊಲೀಸ್ ಆಡಳಿತ',
    'Crime, Investigation & Cyber Security': 'ಅಪರಾಧ, ತನಿಖೆ ಮತ್ತು ಸೈಬರ್ ಭದ್ರತೆ',
    'Indian Literature & Languages': 'ಭಾರತೀಯ ಸಾಹಿತ್ಯ ಮತ್ತು ಭಾಷೆಗಳು',
    'Performing Arts, Cinema & Sports': 'ಪ್ರದರ್ಶನ ಕಲೆಗಳು, ಸಿನಿಮಾ ಮತ್ತು ಕ್ರೀಡೆ',
    'Monuments, Architecture & Heritage': 'ಸ್ಮಾರಕಗಳು, ವಾಸ್ತುಶಿಲ್ಪ ಮತ್ತು ಪರಂಪರೆ',
    'Fairs, Festivals & Cultural Traditions': 'ಜಾತ್ರೆಗಳು, ಹಬ್ಬಗಳು ಮತ್ತು ಸಾಂಸ್ಕೃತಿಕ ಸಂಪ್ರದಾಯಗಳು',
    'Macroeconomics, Banking & Monetary Policy': 'ಸ್ಥೂಲ ಅರ್ಥಶಾಸ್ತ್ರ, ಬ್ಯಾಂಕಿಂಗ್ ಮತ್ತು ವಿತ್ತೀಯ ನೀತಿ',
    'Government Schemes & Development': 'ಸರ್ಕಾರಿ ಯೋಜನೆಗಳು ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
    'Ecology, Biodiversity & Conservation': 'ಪರಿಸರ ವಿಜ್ಞಾನ, ಜೀವವೈವಿಧ್ಯ ಮತ್ತು ಸಂರಕ್ಷಣೆ',
    'Pollution, Climate Change & Disaster Management': 'ಮಾಲಿನ್ಯ, ಹವಾಮಾನ ಬದಲಾವಣೆ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ',
    'International Organizations & Treaties': 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಸ್ಥೆಗಳು ಮತ್ತು ಒಪ್ಪಂದಗಳು',
    'Social Structure & Vulnerable Sections': 'ಸಾಮಾಜಿಕ ರಚನೆ ಮತ್ತು ದುರ್ಬಲ ವರ್ಗಗಳು'
}

def load_kg():
    kg_path = os.path.join('src', 'data', 'knowledge_graph.json')
    with open(kg_path, 'r', encoding='utf-8') as f:
        kg = json.load(f)
    return kg['nodes']

print("Loading Master Knowledge Graph...")
VALID_NODES = load_kg()
print(f"Loaded {len(VALID_NODES)} verified nodes.")

def check_node(nid):
    if nid not in VALID_NODES:
        raise ValueError(f"CRITICAL INVALID NODE: {nid}")
    return nid

# High-precision classification rules
# (pattern, subject, domain, sub_topic, sub_topic_kn, node_id, priority)
RULES = [
    # =========================================================================
    # 1. GENERAL MENTAL ABILITY & QUANTITATIVE APTITUDE
    # =========================================================================
    (
        r'\b(next\s+number\s+in\s+the\s+series|missing\s+number|number\s+should\s+replace\s+the\s+question\s+mark|\bseries\b|\bsequence\b|wrong\s+term|ಮುಂದಿನ\s+ಸಂಖ್ಯೆ|ಸರಣಿ|ಬಿಟ್ಟಿರುವ\s+ಸಂಖ್ಯೆ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Logical & Analytical Reasoning',
        'Number & Letter Series',
        'ಸಂಖ್ಯಾ ಮತ್ತು ಅಕ್ಷರ ಸರಣಿ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series'),
        95
    ),
    (
        r'\b(coded\s+as|coding|decoding|written\s+as|code\s+language|ಸಂಕೇತ|ಕೋಡಿಂಗ್|ಡಿಕೋಡಿಂಗ್)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Logical & Analytical Reasoning',
        'Coding & Decoding',
        'ಕೋಡಿಂಗ್ ಮತ್ತು ಡಿಕೋಡಿಂಗ್',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution'),
        95
    ),
    (
        r'\b(direction|towards\s+north|towards\s+south|towards\s+east|towards\s+west|turns\s+left|turns\s+right|starting\s+point|ಉತ್ತರಕ್ಕೆ|ದಕ್ಷಿಣಕ್ಕೆ|ಪೂರ್ವಕ್ಕೆ|ಪಶ್ಚಿಮಕ್ಕೆ|ಎಡಕ್ಕೆ\s+ತಿರುಗಿ|ಬಲಕ್ಕೆ\s+ತಿರುಗಿ|ಆರಂಭಿಕ\s+ಸ್ಥಳ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Logical & Analytical Reasoning',
        'Direction Sense & Distance',
        'ದಿಕ್ಕು ಮತ್ತು ದೂರ ಪರೀಕ್ಷೆ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.direction_distance_sense_shadows'),
        95
    ),
    (
        r'\b(blood\s+relations?|brother\s+of|sister\s+of|father\s+of|mother\s+of|son\s+of|daughter\s+of|maternal|paternal|ರಕ್ತ\s*ಸಂಬಂಧ|ಸಹೋದರ|ಸಹೋದರಿ|ತಂದೆ|ತಾಯಿ|ಮಗ|ಮಗಳು)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Logical & Analytical Reasoning',
        'Blood Relations',
        'ರಕ್ತ ಸಂಬಂಧಗಳು',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.blood_relations_family_trees_coded_relations'),
        95
    ),
    (
        r'\b(sitting\s+in\s+a\s+row|standing\s+in\s+a\s+row|circular\s+table|seating\s+arrangement|ಕುಳಿತಿರುವ|ಸಾಲು|ವೃತ್ತಾಕಾರ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Logical & Analytical Reasoning',
        'Seating Arrangement & Linear Puzzles',
        'ಆಸನ ವ್ಯವಸ್ಥೆ ಮತ್ತು ಒಗಟುಗಳು',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.linear_circular_complex_seating_arrangements'),
        90
    ),
    (
        r'\b(venn\s+diagram|venn\s+diagrams?|syllogism|ವೆನ್\s+ಚಿತ್ರ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Logical & Analytical Reasoning',
        'Venn Diagrams & Syllogism',
        'ವೆನ್ ಚಿತ್ರಗಳು ಮತ್ತು ತರ್ಕಶಾಸ್ತ್ರ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.syllogisms_venn_logical_deductions'),
        90
    ),
    (
        r'\b(clock|clocks|angle\s+between\s+the\s+hands|ಗಡಿಯಾರ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Logical & Analytical Reasoning',
        'Clocks & Angles',
        'ಗಡಿಯಾರಗಳು ಮತ್ತು ಕೋನಗಳು',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.clocks_angle_coincidence_faulty_clocks'),
        90
    ),
    (
        r'\b(calendar|day\s+of\s+the\s+week|leap\s+year|ಕ್ಯಾಲೆಂಡರ್|ವಾರದ\s+ದಿನ|ಅಧಿಕ\s+ವರ್ಷ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Logical & Analytical Reasoning',
        'Calendars & Odd Days',
        'ಕ್ಯಾಲೆಂಡರ್‌ಗಳು ಮತ್ತು ದಿನಗಳು',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.calendar_odd_days_leap_years_repetition'),
        90
    ),
    (
        r'\b(speed\s+of\s+the\s+train|train\s+crosses|km\/h|speed\s+and\s+distance|average\s+speed|ವೇಗ|ರೈಲು|ಚಲಿಸುವ\s+ವೇಗ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Quantitative Aptitude & Basic Numeracy',
        'Speed, Time, Distance & Trains',
        'ವೇಗ, ಸಮಯ, ದೂರ ಮತ್ತು ರೈಲುಗಳು',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains'),
        95
    ),
    (
        r'\b(time\s+and\s+work|can\s+complete\s+a\s+work|days\s+to\s+complete|pipes?\s+and\s+cistern|ಕೆಲಸ\s+ಮತ್ತು\s+ಸಮಯ|ದಿನಗಳಲ್ಲಿ\s+ಮುಗಿಸಬಲ್ಲ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Quantitative Aptitude & Basic Numeracy',
        'Time & Work, Pipes & Cisterns',
        'ಸಮಯ ಮತ್ತು ಕೆಲಸ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_and_work_pipes_and_cisterns'),
        95
    ),
    (
        r'\b(simple\s+interest|principal\s+amount|rate\s+of\s+interest|ಸರಳ\s+ಬಡ್ಡಿ|ಅಸಲು|ಬಡ್ಡಿ\s+ದರ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Quantitative Aptitude & Basic Numeracy',
        'Simple Interest',
        'ಸರಳ ಬಡ್ಡಿ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_interest_installments'),
        95
    ),
    (
        r'\b(compound\s+interest|compounded|ಚಕ್ರಬಡ್ಡಿ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Quantitative Aptitude & Basic Numeracy',
        'Compound Interest',
        'ಚಕ್ರಬಡ್ಡಿ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.compound_interest_installments'),
        95
    ),
    (
        r'\b(cost\s+price|selling\s+price|profit\s+percentage|loss\s+percentage|discount|ಖರೀದಿ\s+ಬೆಲೆ|ಮಾರಾಟದ\s+ಬೆಲೆ|ಲಾಭ|ನಷ್ಟ|ರಿಯಾಯಿತಿ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Quantitative Aptitude & Basic Numeracy',
        'Profit, Loss & Discount',
        'ಲಾಭ, ನಷ್ಟ ಮತ್ತು ರಿಯಾಯಿತಿ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.profit_loss_marked_price_discounts'),
        95
    ),
    (
        r'\b(ratio\s+and\s+proportion|ratio\s+of|proportional|ಅನುಪಾತ\s+ಮತ್ತು\s+ಪ್ರಮಾಣ|ಅನುಪಾತ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Quantitative Aptitude & Basic Numeracy',
        'Ratio, Proportion & Partnerships',
        'ಅನುಪಾತ, ಪ್ರಮಾಣ ಮತ್ತು ಪಾಲುದಾರಿಕೆ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_variations_partnerships'),
        90
    ),
    (
        r'\b(average\s+of|averages|mean\s+of|ಸರಾಸರಿ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Quantitative Aptitude & Basic Numeracy',
        'Averages & Alligations',
        'ಸರಾಸರಿ ಲೆಕ್ಕಾಚಾರಗಳು',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation'),
        90
    ),
    (
        r'\b(lcm|hcf|highest\s+common\s+factor|least\s+common\s+multiple|divisible\s+by|ಮ\.ಸಾ\.ಅ|ಲ\.ಸಾ\.ಅ|ಭಾಗವಾಗುವ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Quantitative Aptitude & Basic Numeracy',
        'Number System, LCM & HCF',
        'ಸಂಖ್ಯಾ ಪದ್ಧತಿ, ಮಸಾಅ ಮತ್ತು ಲಸಾಅ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.lcm_hcf_factors_multiples'),
        90
    ),
    (
        r'\b(area\s+of\s+a\s+circle|perimeter|triangle|rectangle|ವಿಸ್ತೀರ್ಣ|ಸುತ್ತಳತೆ|ತ್ರಿಭುಜ|ಆಯತ)\b',
        'General Mental Ability, Quantitative Aptitude & Comprehension',
        'Quantitative Aptitude & Basic Numeracy',
        '2D Geometry & Mensuration',
        'ಕ್ಷೇತ್ರಗಣಿತ ಮತ್ತು ರೇಖಾಗಣಿತ',
        check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons'),
        90
    ),

    # =========================================================================
    # 2. INTERNAL SECURITY & POLICE ADMINISTRATION
    # =========================================================================
    (
        r'\b(police\s+flag\s+day|dg\s*&\s*igp|dg\s+and\s+igp|director\s+general\s+of\s+police|inspector\s+general|superintendent\s+of\s+police|police\s+constable|ksrp|ksisf|car\/dar|police\s+training\s+college|police\s+academy|crpc|fir|first\s+information\s+report|ipc|indian\s+penal\s+code|bns|bharatiya\s+nyaya\s+sanhita|ಪೊಲೀಸ್\s+ಧ್ವಜ\s+ದಿನ|ಡಿಜಿ\s*&\s*ಐಜಿಪಿ|ಪೊಲೀಸ್\s+ಮಹಾನಿರ್ದೇಶಕರು|ಪೊಲೀಸ್\s+ಕಾನ್‌ಸ್ಟೇಬಲ್|ಕೆಎಸ್ಆರ್‌ಪಿ|ಕೆಎಸ್‌ಐಎಸ್‌ಎಫ್|ಎಫ್‌ಐಆರ್|ಪ್ರಥಮ\s+ವರ್ತಮಾನ\s+ವರದಿ|ಐಪಿಸಿ|ಸಿಆರ್‌ಪಿಸಿ)\b',
        'Internal Security',
        'Security Forces & Police Administration',
        'State Police Hierarchy, Powers & Criminal Procedure',
        'ರಾಜ್ಯ ಪೊಲೀಸ್ ಶ್ರೇಣಿ, ಅಧಿಕಾರಗಳು ಮತ್ತು ಅಪರಾಧ ಪ್ರಕ್ರಿಯೆ',
        check_node('internal_security.security_forces_intelligence_agencies_statutory_mandates'),
        95
    ),
    (
        r'\b(cbi|central\s+bureau\s+of\s+investigation|nia|national\s+investigation\s+agency|raw|research\s+and\s+analysis\s+wing|intelligence\s+bureau|\bib\b|nsg|national\s+security\s+guard|bsf|crpf|cisf|itbp|ssb|ಅಸ್ಸಾಂ\s+ರೈಫಲ್ಸ್|ಸಿಬಿಐ|ಎನ್‌ಐಎ|ರಾ|ಐಬಿ|ಎನ್‌ಎಸ್‌ಜಿ|ಬಿಎಸ್‌ಎಫ್|ಸಿಆರ್‌ಪಿಎಫ್)\b',
        'Internal Security',
        'Security Forces & Police Administration',
        'Central Armed Police Forces & Intelligence Agencies',
        'ಕೇಂದ್ರ ಸಶಸ್ತ್ರ ಪೊಲೀಸ್ ಪಡೆಗಳು ಮತ್ತು ಗುಪ್ತಚರ ಸಂಸ್ಥೆಗಳು',
        check_node('internal_security.security_forces_intelligence_agencies_statutory_mandates'),
        90
    ),
    (
        r'\b(cyber\s+crime|cyber\s+security|information\s+technology\s+act|phishing|ransomware|malware|hacking|ಸೈಬರ್\s+ಅಪರಾಧ|ಸೈಬರ್\s+ಭದ್ರತೆ|ಮಾಹಿತಿ\s+ತಂತ್ರಜ್ಞಾನ\s+ಕಾಯ್ದೆ)\b',
        'Internal Security',
        'Crime, Investigation & Cyber Security',
        'Cyber Crime & Digital Security',
        'ಸೈಬರ್ ಅಪರಾಧ ಮತ್ತು ಡಿಜಿಟಲ್ ಭದ್ರತೆ',
        check_node('internal_security.cyber_warfare_critical_infrastructure_digital_security'),
        90
    ),

    # =========================================================================
    # 3. KARNATAKA HISTORY & MODERN/ANCIENT INDIAN HISTORY
    # =========================================================================
    (
        r'\b(kadambas?|banavasi|mayurasharma|halmidi\s+inscription|western\s+gangas?|talakadu|chavundaraya|shravanabelagola|gommateshwara|chalukyas?\s+of\s+badami|pulakeshin|aihole|pattadakal|rashtrakutas?|amoghavarsha|kavirajamarga|hoysalas?|vishnuvardhana|belur|halebidu|somnathpura|ಕದಂಬ|ಬನವಾಸಿ|ಮಯೂರಶರ್ಮ|ಹಲ್ಮಿಡಿ\s+ಶಾಸನ|ಗಂಗರು|ತಲಕಾಡು|ಚಾವುಂಡರಾಯ|ಶ್ರವಣಬೆಳಗೊಳ|ಗೊಮ್ಮಟೇಶ್ವರ|ಬಾದಾಮಿ\s+ಚಾಲುಕ್ಯ|ಪುಲಕೇಶಿ|ಐಹೊಳೆ|ಪಟ್ಟದಕಲ್ಲು|ರಾಷ್ಟ್ರಕೂಟ|ಅಮೋಘವರ್ಷ|ಕವಿರಾಜಮಾರ್ಗ|ಹೊಯ್ಸಳ|ವಿಷ್ಣುವರ್ಧನ|ಬೇಲೂರು|ಹಳೇಬೀಡು)\b',
        'History',
        'History of Karnataka',
        'Ancient Dynasties of Karnataka (Kadambas, Gangas, Chalukyas, Hoysalas)',
        'ಕರ್ನಾಟಕದ ಪ್ರಾಚೀನ ರಾಜವಂಶಗಳು (ಕದಂಬ, ಗಂಗ, ಚಾಲುಕ್ಯ, ಹೊಯ್ಸಳ)',
        check_node('history.history_of_karnataka.ancient_dynasties_of_karnataka'),
        95
    ),
    (
        r'\b(vijayanagara\s+empire|hampi|krishnadevaraya|harihara|bukka|tenali\s+rama|bahmani\s+sultanate|gulbarga|bidar|mahmud\s+gawan|bijapur|adil\s+shahi|gol\s+gumbaz|ibrahim\s+roza|ವಿಜಯನಗರ\s+ಸಾಮ್ರಾಜ್ಯ|ಹಂಪಿ|ಕೃಷ್ಣದೇವರಾಯ|ಹರಿಹರ|ಬುಕ್ಕ|ಬಹುಮನಿ\s+ಸುಲ್ತಾನ|ಗುಲ್ಬರ್ಗ|ಬೀದರ್|ಮಹಮೂದ್\s+ಗವಾನ್|ಬಿಜಾಪುರ|ಆದಿಲ್\s+ಶಾಹಿ|ಗೋಲ್\s+ಗುಮ್ಮಟ|ಇಬ್ರಾಹಿಂ\s+ರೋಜಾ)\b',
        'History',
        'History of Karnataka',
        'Vijayanagara Empire & Deccan Sultanates in Karnataka',
        'ವಿಜಯನಗರ ಸಾಮ್ರಾಜ್ಯ ಮತ್ತು ಡೆಕ್ಕನ್ ಸುಲ್ತಾನರು',
        check_node('history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms'),
        95
    ),
    (
        r'\b(wodeyars?\s+of\s+mysore|wadiyars?|hyder\s+ali|tipu\s+sultan|srirangapatna|anglo-mysore\s+war|treaty\s+of\s+srirangapatna|chikka\s+devaraja|nalwadi\s+krishnaraja\s+wadiyar|visvesvaraya|diwan|ಒಡೆಯರ್|ಹೈದರ್\s+ಅಲಿ|ಟಿಪ್ಪು\s+ಸುಲ್ತಾನ್|ಶ್ರೀರಂಗಪಟ್ಟಣ|ಆಂಗ್ಲೋ-ಮೈಸೂರು\s+ಯುದ್ಧ|ನಾಲ್ವಡಿ\s+ಕೃಷ್ಣರಾಜ\s+ಒಡೆಯರ್|ವಿಶ್ವೇಶ್ವರಯ್ಯ|ದಿವಾನ್)\b',
        'History',
        'History of Karnataka',
        'Wodeyars of Mysore & Hyder-Tipu Era',
        'ಮೈಸೂರು ಒಡೆಯರು ಮತ್ತು ಹೈದರ್-ಟಿಪ್ಪು ಕಾಲ',
        check_node('history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era'),
        95
    ),
    (
        r'\b(karnataka\s+unification|ekikarana|aluru\s+venkata\s+rao|fazal\s+ali\s+commission|state\s+reorganisation|mysore\s+state\s+renamed\s+karnataka|devaraj\s+urs|kittur\s+chennamma|sangolli\s+rayanna|surapura\s+venkatappa|halagali\s+bedas|ಕರ್ನಾಟಕ\s+ಏಕೀಕರಣ|ಆಲೂರು\s+ವೆಂಕಟರಾವ್|ಫಜಲ್\s+ಅಲಿ\s+ಆಯೋಗ|ಮೈಸೂರು\s+ರಾಜ್ಯ\s+ಕರ್ನಾಟಕವೆಂದು\s+ಮರುನಾಮಕರಣ|ದೇವರಾಜ\s+ಅರಸು|ಕಿತ್ತೂರು\s+ಚೆನ್ನಮ್ಮ|ಸಂಗೊಳ್ಳಿ\s+ರಾಯಣ್ಣ|ಹಲಗಲಿ\s+ಬೇಡರು)\b',
        'History',
        'History of Karnataka',
        'Armed Resistance & Unification Movement in Karnataka',
        'ಕರ್ನಾಟಕದ ಸಶಸ್ತ್ರ ಹೋರಾಟ ಮತ್ತು ಏಕೀಕರಣ ಚಳವಳಿ',
        check_node('history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation'),
        95
    ),
    (
        r'\b(1857\s+revolt|sepoy\s+mutiny|mangalpande|rani\s+lakshmibai|bahadur\s+shah|tatya\s+tope|1857\s+ರ\s+ದಂಗೆ|ಸಿಪಾಯಿ\s+ದಂಗೆ|ಮಂಗಲ್\s+ಪಾಂಡೆ|ರಾಣಿ\s+ಲಕ್ಷ್ಮೀಬಾಯಿ)\b',
        'History',
        'Modern Indian History & Freedom Struggle',
        'Revolt of 1857 & Early Resistance',
        '1857 ರ ದಂಗೆ ಮತ್ತು ಆರಂಭಿಕ ಪ್ರತಿರೋಧ',
        check_node('history.indian_freedom_struggle.revolt_of_1857'),
        95
    ),
    (
        r'\b(indian\s+national\s+congress|inc\s+session|gandhi|mahatma\s+gandhi|non-cooperation|civil\s+disobedience|dandi\s+march|quit\s+india|subhash\s+chandra\s+bose|\bina\b|red\s+fort\s+trials|bhagat\s+singh|jallianwala\s+bagh|simon\s+commission|round\s+table\s+conference|swadeshi\s+movement|partition\s+of\s+bengal|home\s+rule|ಕಾಂಗ್ರೆಸ್\s+ಅಧಿವೇಶನ|ಮಹಾತ್ಮ\s+ಗಾಂಧಿ|ಅಸಹಕಾರ\s+ಚಳವಳಿ|ಕಾನೂನು\s+ಭಂಗ|ದಂಡಿ\s+ಯಾತ್ರೆ|ಕ್ವಿಟ್\s+ಇಂಡಿಯಾ|ಸುಭಾಷ್\s+ಚಂದ್ರ\s+ಬೋಸ್|ಭಗತ್\s+ಸಿಂಗ್|ಜಲಿಯನ್\s+ವಾಲಾಬಾಗ್|ಬಂಗಾಳದ\s+ವಿಭಜನೆ)\b',
        'History',
        'Modern Indian History & Freedom Struggle',
        'Indian National Movement (1885-1947)',
        'ಭಾರತೀಯ ರಾಷ್ಟ್ರೀಯ ಚಳವಳಿ (1885-1947)',
        check_node('history.indian_freedom_struggle.growth_of_modern_nationalism_early_political_associations'),
        95
    ),
    (
        r'\b(governor-general|viceroy|lord\s+dalhousie|doctrine\s+of\s+lapse|lord\s+curzon|lord\s+ripon|robert\s+clive|battle\s+of\s+plassey|battle\s+of\s+buxar|subsidiary\s+alliance|ಗವರ್ನರ್\s+ಜನರಲ್|ವೈಸ್ರಾಯ್|ಪ್ಲಾಸಿ\s+ಕದನ|ಬಕ್ಸಾರ್\s+ಕದನ|ದತ್ತು\s+ಪುತ್ರನಿಗೆ\s+ಹಕ್ಕಿಲ್ಲ|ಸಹಾಯಕ\s+ಸೈನ್ಯ\s+ಪದ್ಧತಿ)\b',
        'History',
        'Modern Indian History & Freedom Struggle',
        'British Expansion & Administrative Policies',
        'ಬ್ರಿಟಿಷ್ ವಿಸ್ತರಣೆ ಮತ್ತು ಆಡಳಿತಾತ್ಮಕ ನೀತಿಗಳು',
        check_node('history.modern_india.british_expansionist_policies_administrative_machinery'),
        90
    ),
    (
        r'\b(indus\s+valley|harappa|mohenjo-daro|lothal|vedic\s+period|rig\s+veda|buddhism|gautama\s+buddha|jainism|mahavira|maurya|ashoka|kalinga\s+war|gupta\s+empire|samudragupta|chandragupta|harshavardhana|ಸಿಂಧೂ\s+ನಾಗರಿಕತೆ|ಹರಪ್ಪ|ಮೊಹೆಂಜೋದಾರೊ|ಲೋಥಾಲ್|ವೇದ\s+ಕಾಲ|ಬೌದ್ಧ\s+ಧರ್ಮ|ಜೈನ\s+ಧರ್ಮ|ಮೌರ್ಯ|ಅಶೋಕ|ಕಳಿಂಗ\s+ಯುದ್ಧ|ಗುಪ್ತ\s+ಸಾಮ್ರಾಜ್ಯ)\b',
        'History',
        'Ancient Indian History',
        'Ancient India (Harappa, Vedic, Mauryas & Guptas)',
        'ಪ್ರಾಚೀನ ಭಾರತ (ಹರಪ್ಪ, ವೇದ, ಮೌರ್ಯ ಮತ್ತು ಗುಪ್ತರು)',
        check_node('history.ancient_india.mauryan_empire'),
        90
    ),
    (
        r'\b(delhi\s+sultanate|alauddin\s+khilji|muhammad\s+bin\s+tughlaq|mughal\s+empire|babur|akbar|shah\s+jahan|aurangzeb|maratha|shivaji|ಪೇಶ್ವೆ|ದೆಹಲಿ\s+ಸುಲ್ತಾನ|ಅಲಾವುದ್ದೀನ್\s+ಖಿಲ್ಜಿ|ಮೊಘಲ್\s+ಸಾಮ್ರಾಜ್ಯ|ಅಕ್ಬರ್|ಶಿವಾಜಿ|ಮರಾಠ)\b',
        'History',
        'Medieval Indian History',
        'Medieval India (Delhi Sultanate, Mughals & Marathas)',
        'ಮಧ್ಯಕಾಲೀನ ಭಾರತ (ದೆಹಲಿ ಸುಲ್ತಾನರು, ಮೊಘಲರು ಮತ್ತು ಮರಾಠರು)',
        check_node('history.medieval_india.mughal_empire'),
        90
    ),

    # =========================================================================
    # 4. KARNATAKA & INDIAN GEOGRAPHY
    # =========================================================================
    (
        r'\b(cauvery|kaveri|krishna\s+river|sharavathi|tungabhadra|jog\s+falls|shivasamudram|krs\s+dam|almatti\s+dam|kudremukh|mullayanagiri|western\s+ghats|bandipur|nagarhole|bhadra|dandeli|karnataka\s+district|belagavi|bengaluru|mysuru|ಕಾವೇರಿ|ಕೃಷ್ಣಾ\s+ನದಿ|ಶರಾವತಿ|ತುಂಗಭದ್ರಾ|ಜೋಗ\s+ಜಲಪಾತ|ಶಿವನಸಮುದ್ರ|ಕೆಆರ್‌ಎಸ್|ಆಲಮಟ್ಟಿ|ಕುದುರೆಮುಖ|ಮುಳ್ಳಯ್ಯನಗಿರಿ|ಪಶ್ಚಿಮ\s+ಘಟ್ಟ|ಬಂಡೀಪುರ|ನಾಗರಹೊಳೆ|ಕರ್ನಾಟಕದ\s+ಜಿಲ್ಲೆ|ಬೆಂಗಳೂರು|ಮೈಸೂರು)\b',
        'Geography & Earth Systems',
        'Geography of Karnataka',
        'Physiography, Rivers & National Parks of Karnataka',
        'ಕರ್ನಾಟಕದ ಭೂಸ್ವರೂಪ, ನದಿಗಳು ಮತ್ತು ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನಗಳು',
        check_node('geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka'),
        95
    ),
    (
        r'\b(himalaya|himalayas|ganga|brahmaputra|indus\s+river|godavari|narmada|tapi|monsoon|south-west\s+monsoon|retreating\s+monsoon|black\s+soil|alluvial\s+soil|red\s+soil|regur|rabi\s+crop|kharif\s+crop|highest\s+peak\s+in\s+india|kanchenjunga|western\s+ghats\s+and\s+eastern\s+ghats|ಚಿಕ್ಕಮಗಳೂರು|ಹಿಮಾಲಯ|ಗಂಗಾ|ಬ್ರಹ್ಮಪುತ್ರ|ಕಪ್ಪು\s+ಮಣ್ಣು|ಮೆಕ್ಕಲು\s+ಮಣ್ಣು|ಮುಂಗಾರು|ಹಿಂಗಾರು|ಖಾರೀಫ್|ರಬಿ)\b',
        'Geography & Earth Systems',
        'Indian Geography',
        'Physiography, Drainage & Climate of India',
        'ಭಾರತದ ಭೂಸ್ವರೂಪ, ನದೀವ್ಯವಸ್ಥೆ ಮತ್ತು ವಾಯುಗುಣ',
        check_node('geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india'),
        90
    ),
    (
        r'\b(earthquake|richter\s+scale|seismic|volcano|lithosphere|troposphere|stratosphere|atmosphere|tides|ocean\s+currents|equator|tropic\s+of\s+cancer|tropic\s+of\s+capricorn|latitude|longitude|solar\s+eclipse|lunar\s+eclipse|ಭೂಕಂಪ|ರಿಕ್ಟರ್\s+ಮಾಪಕ|ಜ್ವಾಲಾಮುಖಿ|ಶಿಲಾಗೋಳ|ವಾತಾವರಣ|ಉಬ್ಬರವಿಳಿತ|ಸಮುದ್ರ\s+ಪ್ರವಾಹ|ಸಮಭಾಜಕ\s+ವೃತ್ತ|ಅಕ್ಷಾಂಶ|ರೇಖಾಂಶ|ಗ್ರಹಣ)\b',
        'Geography & Earth Systems',
        'Physical Geography',
        'Geomorphology, Climatology & Oceanography',
        'ಭೂರೂಪಶಾಸ್ತ್ರ, ವಾಯುಗುಣಶಾಸ್ತ್ರ ಮತ್ತು ಸಮುದ್ರಶಾಸ್ತ್ರ',
        check_node('geography_earth_systems.physical_geography_earth_systems'),
        90
    ),

    # =========================================================================
    # 5. INDIAN POLITY & CONSTITUTION
    # =========================================================================
    (
        r'\b(fundamental\s+rights|article\s+(1[2-9]|2\d|3[0-5])\b|habeas\s+corpus|mandamus|prohibition|quo\s+warranto|certiorari|writs?|right\s+to\s+equality|right\s+to\s+freedom|right\s+to\s+life|article\s+21|ಮೂಲಭೂತ\s+ಹಕ್ಕುಗಳು|ವಿಧಿ\s+21|ರಿಟ್|ಹೆಬಿಯಸ್\s+ಕಾರ್ಪಸ್|ಸಮಾನತೆಯ\s+ಹಕ್ಕು|ಸ್ವಾತಂತ್ರ್ಯದ\s+ಹಕ್ಕು)\b',
        'Indian Polity, Constitution & Governance',
        'Constitutional Framework',
        'Fundamental Rights & Constitutional Remedies',
        'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು ಮತ್ತು ಸಾಂವಿಧಾನಿಕ ಪರಿಹಾರಗಳು',
        check_node('indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35'),
        95
    ),
    (
        r'\b(directive\s+principles|dpsp|article\s+(3[6-9]|4\d|5[01])\b|fundamental\s+duties|article\s+51a|preamble\b|constituent\s+assembly|drafting\s+committee|b\.?r\.?\s+ambedkar|amendment\s+act|42nd\s+amendment|44th\s+amendment|ರಾಜ್ಯ\s+ನೀತಿಯ\s+ನಿರ್ದೇಶಕ\s+ತತ್ವಗಳು|ಮೂಲಭೂತ\s+ಕರ್ತವ್ಯಗಳು|ವಿಧಿ\s+51ಎ|ಪ್ರಸ್ತಾವನೆ|ಸಂವಿಧಾನ\s+ರಚನಾ\s+ಸಭೆ|ಕರಡು\s+ಸಮಿತಿ|ಅಂಬೇಡ್ಕರ್|ಸಂವಿಧಾನ\s+ತಿದ್ದುಪಡಿ)\b',
        'Indian Polity, Constitution & Governance',
        'Constitutional Framework',
        'Preamble, DPSP, Duties & Amendments',
        'ಪ್ರಸ್ತಾವನೆ, ನಿರ್ದೇಶಕ ತತ್ವಗಳು, ಕರ್ತವ್ಯಗಳು ಮತ್ತು ತಿದ್ದುಪಡಿಗಳು',
        check_node('indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.directive_principles_of_state_policy_-_part_iv_articles_36-51'),
        95
    ),
    (
        r'\b(president\s+of\s+india|impeachment\s+of\s+president|ordinance\s+making\s+power|pardon\s+power|article\s+72|vice-president|prime\s+minister|council\s+of\s+ministers|governor\s+of|chief\s+minister|ರಾಷ್ಟ್ರಪತಿ|ಉಪರಾಷ್ಟ್ರಪತಿ|ಪ್ರಧಾನ\s+ಮಂತ್ರಿ|ಮಂತ್ರಿಮಂಡಲ|ರಾಜ್ಯಪಾಲ|ಮುಖ್ಯಮಂತ್ರಿ)\b',
        'Indian Polity, Constitution & Governance',
        'Union & State Executive',
        'President, Governor & Executive Powers',
        'ರಾಷ್ಟ್ರಪತಿ, ರಾಜ್ಯಪಾಲರು ಮತ್ತು ಕಾರ್ಯಾಂಗದ ಅಧಿಕಾರಗಳು',
        check_node('indian_polity_constitution_governance.union_executive_state_executive.union_executive'),
        95
    ),
    (
        r'\b(lok\s+sabha|rajya\s+sabha|parliament|money\s+bill|speaker\s+of|joint\s+sitting|vidhana\s+sabha|vidhana\s+parishad|state\s+legislature|ಲೋಕಸಭೆ|ರಾಜ್ಯಸಭೆ|ಸಂಸತ್ತು|ಹಣಕಾಸು\s+ಮಸೂದೆ|ಸ್ಪೀಕರ್|ವಿಧಾನಸಭೆ|ವಿಧಾನಪರಿಷತ್ತು)\b',
        'Indian Polity, Constitution & Governance',
        'Union & State Legislature',
        'Parliament & State Legislature',
        'ಸಂಸತ್ತು ಮತ್ತು ರಾಜ್ಯ ಶಾಸಕಾಂಗ',
        check_node('indian_polity_constitution_governance.parliament_state_legislatures.structure_composition'),
        95
    ),
    (
        r'\b(supreme\s+court|chief\s+justice|high\s+court|subordinate\s+courts|judicial\s+review|public\s+interest\s+litigation|\bpil\b|ಸರ್ವೋಚ್ಚ\s+ನ್ಯಾಯಾಲಯ|ಉಚ್ಛ\s+ನ್ಯಾಯಾಲಯ|ಮುಖ್ಯ\s+ನ್ಯಾಯಮೂರ್ತಿ|ನ್ಯಾಯಾಂಗ\s+ಪರಿಶೀಲನೆ|ಸಾರ್ವಜನಿಕ\s+ಹಿತಾಸಕ್ತಿ\s+ಅರ್ಜಿ)\b',
        'Indian Polity, Constitution & Governance',
        'Judiciary & Legal System',
        'Supreme Court & High Court Powers',
        'ಸುಪ್ರೀಂ ಕೋರ್ಟ್ ಮತ್ತು ಹೈಕೋರ್ಟ್ ಅಧಿಕಾರಗಳು',
        check_node('indian_polity_constitution_governance.indian_judiciary_judicial_system.supreme_court_of_india'),
        95
    ),
    (
        r'\b(panchayat|panchayati\s+raj|73rd\s+amendment|74th\s+amendment|gram\s+panchayat|taluk\s+panchayat|zilla\s+panchayat|balwant\s+rai\s+mehta|ashok\s+mehta|municipality|ಪಂಚಾಯತ್\s+ರಾಜ್|73\s+ನೇ\s+ತಿದ್ದುಪಡಿ|ಗ್ರಾಮ\s+ಪಂಚಾಯಿತಿ|ತಾಲ್ಲೂಕು\s+ಪಂಚಾಯಿತಿ|ಜಿಲ್ಲಾ\s+ಪಂಚಾಯಿತಿ|ನಗರಸಭೆ)\b',
        'Indian Polity, Constitution & Governance',
        'Local Governance & Panchayati Raj',
        'Panchayati Raj Institutions & 73rd/74th Amendments',
        'ಪಂಚಾಯತ್ ರಾಜ್ ಸಂಸ್ಥೆಗಳು ಮತ್ತು 73/74 ನೇ ತಿದ್ದುಪಡಿಗಳು',
        check_node('indian_polity_constitution_governance.karnataka_gram_swaraj_panchayat_raj_system'),
        95
    ),
    (
        r'\b(election\s+commission|chief\s+election\s+commissioner|cag|comptroller\s+and\s+auditor\s+general|upsc|finance\s+commission|attorney\s+general|advocate\s+general|ಚುನಾವಣಾ\s+ಆಯೋಗ|ಸಿಎಜಿ|ಅಟಾರ್ನಿ\s+ಜನರಲ್|ಹಣಕಾಸು\s+ಆಯೋಗ|ಯುಪಿಎಸ್‌ಸಿ)\b',
        'Indian Polity, Constitution & Governance',
        'Constitutional & Statutory Bodies',
        'Constitutional Bodies (Election Commission, CAG, Finance Commission)',
        'ಸಾಂವಿಧಾನಿಕ ಸಂಸ್ಥೆಗಳು (ಚುನಾವಣಾ ಆಯೋಗ, ಸಿಎಜಿ, ಹಣಕಾಸು ಆಯೋಗ)',
        check_node('indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies'),
        95
    ),

    # =========================================================================
    # 6. SCIENCE & TECHNOLOGY
    # =========================================================================
    (
        r'\b(isro|chandrayaan|mangalyaan|gaganyaan|satish\s+dhawan|pslv|gslv|nasa|satellite|planet|jupiter|mars|venus|saturn|solar\s+system|ಇಸ್ರೋ|ಚಂದ್ರಯಾನ|ಮಂಗಳಯಾನ|ಉಪಗ್ರಹ|ಗ್ರಹ|ಗುರು|ಮಂಗಳ|ಶುಕ್ರ|ಸೌರವ್ಯೂಹ)\b',
        'Science, Technology & Defence',
        'Space Technology & Astronomy',
        'ISRO Missions, Space Science & Solar System',
        'ಇಸ್ರೋ ಕಾರ್ಯಾಚರಣೆಗಳು, ಬಾಹ್ಯಾಕಾಶ ಮತ್ತು ಸೌರವ್ಯೂಹ',
        check_node('science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions'),
        95
    ),
    (
        r'\b(missile|drdo|brahmos|agni|prithvi|akash|ins\s+vikrant|rafale|tejas|radar|ಸೈನಿಕ|ಕ್ಷಿಪಣಿ|ಡಿಆರ್‌ಡಿಒ|ಬ್ರಹ್ಮೋಸ್|ಅಗ್ನಿ|ಪೃಥ್ವಿ|ಯುದ್ಧನೌಕೆ|ವಿಮಾನ)\b',
        'Science, Technology & Defence',
        'Defence Technology',
        'Defence Technology, Missiles & Indian Armed Forces',
        'ರಕ್ಷಣಾ ತಂತ್ರಜ್ಞಾನ, ಕ್ಷಿಪಣಿಗಳು ಮತ್ತು ಸಶಸ್ತ್ರ ಪಡೆಗಳು',
        check_node('science_technology_defence.defence_technology.missile_systems_artillery'),
        95
    ),
    (
        r'\b(computer|cpu|ram|rom|byte|software|hardware|internet|browser|operating\s+system|windows|linux|python|c\+\+|artificial\s+intelligence|\bai\b|ಕಂಪ್ಯೂಟರ್|ಮೆಮೊರಿ|ಇಂಟರ್ನೆಟ್|ಸಾಫ್ಟ್‌ವೇರ್|ಹಾರ್ಡ್‌ವೇರ್|ಕೃತಕ\s+ಬುದ್ಧಿಮತ್ತೆ)\b',
        'Science, Technology & Defence',
        'Information & Communication Technology',
        'Computers, Information Technology & Networking',
        'ಕಂಪ್ಯೂಟರ್‌ಗಳು, ಮಾಹಿತಿ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ನೆಟ್‌ವರ್ಕಿಂಗ್',
        check_node('science_technology_defence.information_communication_technology_ai_cyber_security.artificial_intelligence_robotics'),
        90
    ),
    (
        r'\b(vitamin|deficiency\s+disease|scurvy|beriberi|rickets|anaemia|blood\s+group|rbc|wbc|hemoglobin|heart|kidney|liver|insulin|hormone|photosynthesis|dna|rna|virus|bacteria|vaccine|antibiotic|ರಕ್ತದ\s+ಗುಂಪು|ವಿಟಮಿನ್|ರಕ್ತಹೀನತೆ|ಸ್ಕರ್ವಿ|ಬೆರಿಬೆರಿ|ರಿಕೆಟ್ಸ್|ಹೃದಯ|ಮೂತ್ರಪಿಂಡ|ಇನ್ಸುಲಿನ್|ದ್ಯುತಿಸಂಶ್ಲೇಷಣೆ|ಡಿಎನ್‌ಎ|ವೈರಸ್|ಬ್ಯಾಕ್ಟೀರಿಯಾ|ಲಸಿಕೆ)\b',
        'Science, Technology & Defence',
        'Biotechnology, Health & Life Sciences',
        'Human Physiology, Health, Diseases & Vitamins',
        'ಮಾನವ ಶರೀರಶಾಸ್ತ್ರ, ಆರೋಗ್ಯ, ರೋಗಗಳು ಮತ್ತು ವಿಟಮಿನ್‌ಗಳು',
        check_node('science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology'),
        95
    ),
    (
        r'\b(acid|base|ph\s+value|periodic\s+table|element|metal|non-metal|gold|silver|iron|copper|oxygen|hydrogen|carbon|chemical\s+formula|water|sodium|ಆಮ್ಲ|ಪ್ರತ್ಯಾಮ್ಲ|ಪಿಎಚ್\s+ಮೌಲ್ಯ|ಆವರ್ತಕ\s+ಕೋಷ್ಟಕ|ಲೋಹ|ಅಲೋಹ|ಆಕ್ಸಿಜನ್|ರಾಸಾಯನಿಕ\s+ಸೂತ್ರ)\b',
        'Science, Technology & Defence',
        'Applied & Fundamental Sciences',
        'Applied Chemistry & Chemical Compounds',
        'ಅನ್ವಯಿಕ ರಸಾಯನಶಾಸ್ತ್ರ ಮತ್ತು ರಾಸಾಯನಿಕ ಸಂಯುಕ್ತಗಳು',
        check_node('science_technology_defence.applied_fundamental_sciences.applied_chemistry'),
        90
    ),
    (
        r'\b(newton|laws\s+of\s+motion|gravity|force|velocity|acceleration|sound|speed\s+of\s+light|reflection|refraction|lens|mirror|electricity|current|voltage|magnet|si\s+unit|joule|watt|ohm|ನ್ಯೂಟನ್|ಚಲನೆಯ\s+ನಿಯಮಗಳು|ಗುರುತ್ವಾಕರ್ಷಣೆ|ಬೆಳಕು|ಧ್ವನಿ|ವಿದ್ಯುತ್|ಕಾಂತ|ಎಸ್ಐ\s+ಮಾನ)\b',
        'Science, Technology & Defence',
        'Applied & Fundamental Sciences',
        'Applied Physics, Mechanics, Optics & Electricity',
        'ಅನ್ವಯಿಕ ಭೌತಶಾಸ್ತ್ರ, ಯಂತ್ರಶಾಸ್ತ್ರ ಮತ್ತು ದೃಗ್ವಿಜ್ಞಾನ',
        check_node('science_technology_defence.applied_fundamental_sciences.applied_physics'),
        90
    ),

    # =========================================================================
    # 7. ART, CULTURE, LITERATURE & SPORTS
    # =========================================================================
    (
        r'\b(jnanpith|kuvempu|da\s+ra\s+bendre|shivaram\s+karanth|masti\s+venkatesha|v\.?\s*k\.?\s*gokak|u\.?\s*r\.?\s*ananthamurthy|girish\s+karnad|chandrashekhara\s+kambara|kannada\s+sahitya|vachana|basaveshwara|akkayya|allama\s+prabhu|pampa|ranna|ponna|kumaravyasa|ಜ್ಞಾನಪೀಠ|ಕುವೆಂಪು|ಬೇಂದ್ರೆ|ಕಾರಂತ|ಮಾಸ್ತಿ|ಗಿರೀಶ್\s+ಕಾರ್ನಾಡ್|ವಚನ|ಬಸವೇಶ್ವರ|ಅಲ್ಲಮಪ್ರಭು|ಪಂಪ|ರನ್ನ|ಪೊನ್ನ|ಕುಮಾರವ್ಯಾಸ)\b',
        'Art, Culture & Heritage',
        'Indian Literature & Languages',
        'Kannada Literature, Jnanpith Awardees & Vachana Movement',
        'ಕನ್ನಡ ಸಾಹಿತ್ಯ, ಜ್ಞಾನಪೀಠ ಪ್ರಶಸ್ತಿ ಪುರಸ್ಕೃತರು ಮತ್ತು ವಚನ ಸಾಹಿತ್ಯ',
        check_node('art_culture_heritage.indian_literature_languages'),
        95
    ),
    (
        r'\b(yakshagana|bharatanatyam|kathakali|kuchipudi|folk\s+dance|dollu\s+kunitha|kamsale|carnatic\s+music|hindustani\s+music|musical\s+instruments|ರಾಜಕುಮಾರ್|ಚಿತ್ರ|ಸಿನಿಮಾ|ಯಕ್ಷಗಾನ|ಭರತನಾಟ್ಯ|ಕಥಕ್ಕಳಿ|ಡೊಳ್ಳು\s+ಕುಣಿತ|ಕಂಸಾಳೆ|ಕರ್ನಾಟಕ\s+ಸಂಗೀತ|ಹಿಂದೂಸ್ತಾನಿ)\b',
        'Art, Culture & Heritage',
        'Performing Arts, Cinema & Sports',
        'Performing Arts, Yakshagana & Folk Traditions',
        'ಪ್ರದರ್ಶನ ಕಲೆಗಳು, ಯಕ್ಷಗಾನ ಮತ್ತು ಜಾನಪದ ಸಂಪ್ರದಾಯಗಳು',
        check_node('art_culture_heritage.performing_arts'),
        90
    ),
    (
        r'\b(olympic|olympics|world\s+cup|cricket|fifa|football|badminton|tennis|grand\s+slam|wimbledon|asian\s+games|commonwealth|ranji\s+trophy|ipl|sports|cup\s+is\s+associated|trophy|ಒಲಿಂಪಿಕ್ಸ್|ವಿಶ್ವಕಪ್|ಕ್ರಿಕೆಟ್|ಫುಟ್‌ಬಾಲ್|ಟೆನ್ನಿಸ್|ಏಷ್ಯನ್\s+ಗೇಮ್ಸ್|ಕ್ರೀಡೆ|ಟೂರ್ನಮೆಂಟ್|ಕಪ್|ಟ್ರಾಫಿ)\b',
        'Art, Culture & Heritage',
        'Performing Arts, Cinema & Sports',
        'Sports, Tournaments & National/International Cups',
        'ಕ್ರೀಡೆಗಳು, ಪಂದ್ಯಾವಳಿಗಳು ಮತ್ತು ಪ್ರಶಸ್ತಿಗಳು',
        check_node('art_culture_heritage.performing_arts'),
        90
    ),

    # =========================================================================
    # 8. INDIAN ECONOMY & BANKING
    # =========================================================================
    (
        r'\b(reserve\s+bank\s+of\s+india|\brbi\b|repo\s+rate|reverse\s+repo|monetary\s+policy|inflation|gdp|gross\s+domestic\s+product|gst|goods\s+and\s+services\s+tax|niti\s+aayog|planning\s+commission|five-year\s+plan|budget|fiscal\s+deficit|banking|commercial\s+bank|ಆರ್‌ಬಿಐ|ರೆಪೋ\s+ದರ|ಹಣದುಬ್ಬರ|ಜಿಡಿಪಿ|ಜಿಎಸ್‌ಟಿ|ನೀತಿ\s+ಆಯೋಗ|ಪಂಚವಾರ್ಷಿಕ\s+ಯೋಜನೆ|ಬಜೆಟ್|ಬ್ಯಾಂಕ್)\b',
        'Indian Economy & Development',
        'Macroeconomics, Banking & Monetary Policy',
        'Monetary Policy, RBI, Banking & Fiscal System',
        'ವಿತ್ತೀಯ ನೀತಿ, ಆರ್‌ಬಿಐ, ಬ್ಯಾಂಕಿಂಗ್ ಮತ್ತು ಆಯವ್ಯಯ',
        check_node('indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations'),
        95
    ),

    # =========================================================================
    # 9. ENVIRONMENT & ECOLOGY
    # =========================================================================
    (
        r'\b(global\s+warming|greenhouse\s+gas|ozone\s+layer|cfc|chlorofluorocarbon|acid\s+rain|biodiversity|national\s+park|wildlife\s+sanctuary|ramsar\s+site|wetland|endangered\s+species|iucn|red\s+data\s+book|environment\s+protection\s+act|ಪರಿಸರ|ಜಾಗತಿಕ\s+ತಾಪಮಾನ|ಹಸಿರುಮನೆ\s+ಅನಿಲ|ಓಜೋನ್\s+ಪದರ|ಆಮ್ಲ\s+ಮಳೆ|ಜೀವವೈವಿಧ್ಯ|ರಾಷ್ಟ್ರೀಯ\s+ಉದ್ಯಾನ|ವನ್ಯಜೀವಿ\s+ಧಾಮ|ರಾಮ್‌ಸಾರ್)\b',
        'Environment, Ecology & Disaster Management',
        'Ecology, Biodiversity & Conservation',
        'Ecology, Biodiversity, Wildlife & Climate Change',
        'ಪರಿಸರ ವಿಜ್ಞಾನ, ಜೀವವೈವಿಧ್ಯ, ವನ್ಯಜೀವಿ ಮತ್ತು ಹವಾಮಾನ ಬದಲಾವಣೆ',
        check_node('environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.biodiversity_fundamentals_patterns'),
        95
    ),

    # =========================================================================
    # 10. INTERNATIONAL ORGANIZATIONS
    # =========================================================================
    (
        r'\b(united\s+nations|\buno\b|\bun\b|security\s+council|who|world\s+health\s+organization|unesco|unicef|imf|international\s+monetary\s+fund|world\s+bank|saarc|asean|brics|g20|\bg-20\b|wto|world\s+trade\s+organization|ಅಂತರರಾಷ್ಟ್ರೀಯ|ವಿಶ್ವಸಂಸ್ಥೆ|ಭದ್ರತಾ\s+ಮಂಡಳಿ|ಡಬ್ಲ್ಯುಎಚ್‌ಒ|ಯುನೆಸ್ಕೋ|ಯುನಿಸೆಫ್|ವಿಶ್ವ\s+ಬ್ಯಾಂಕ್|ಸಾರ್ಕ್|ಬ್ರಿಕ್ಸ್|ಜಿ-20)\b',
        'International Relations & Global Institutions',
        'International Organizations & Treaties',
        'United Nations & Major International Institutions',
        'ವಿಶ್ವಸಂಸ್ಥೆ ಮತ್ತು ಪ್ರಮುಖ ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಸ್ಥೆಗಳು',
        check_node('history.world_history.united_nations_organisation_peacekeeping_global_governance.evolution_charter_architecture_specialized_agencies_un'),
        95
    ),

    # =========================================================================
    # 11. INDIAN SOCIETY & SOCIAL JUSTICE
    # =========================================================================
    (
        r'\b(census\s+2011|sex\s+ratio|literacy\s+rate|population\s+density|scheduled\s+caste|scheduled\s+tribe|reservation|right\s+to\s+education|\brte\b|child\s+labour|pocso|domestic\s+violence|ಜನಗಣತಿ|ಲಿಂಗಾನುಪಾತ|ಸಾಕ್ಷರತೆ|ಜನಸಂಖ್ಯೆ|ಮೀಸಲಾತಿ|ಶಿಕ್ಷಣದ\s+ಹಕ್ಕು|ಮಕ್ಕಳ\s+ರಕ್ಷಣೆ)\b',
        'Indian Society & Social Justice',
        'Social Structure & Vulnerable Sections',
        'Demographics, Census 2011 & Social Welfare Laws',
        'ಜನಸಂಖ್ಯಾಶಾಸ್ತ್ರ, ಜನಗಣತಿ 2011 ಮತ್ತು ಸಮಾಜ ಕಲ್ಯಾಣ ಕಾಯ್ದೆಗಳು',
        check_node('indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups'),
        90
    )
]

def classify_question(q):
    """
    Classifies a single question using regex rules against English & Kannada text,
    falling back to intelligent keyword-weighted topic assignment.
    """
    text_corpus = f"{q.get('question_english', '')} {q.get('question_kannada', '')} {q.get('explanation_english', '')} {q.get('explanation_kannada', '')}"
    
    best_rule = None
    best_priority = -1
    
    for rule in RULES:
        pattern, subj, dom, sub_t, sub_t_kn, nid, prio = rule
        if re.search(pattern, text_corpus, re.IGNORECASE):
            if prio > best_priority:
                best_priority = prio
                best_rule = rule

    if best_rule:
        _, subj, dom, sub_t, sub_t_kn, nid, _ = best_rule
        return {
            'subject': subj,
            'subject_kannada': SUBJECT_TRANSLATIONS.get(subj, subj),
            'domain': dom,
            'domain_kannada': DOMAIN_TRANSLATIONS.get(dom, dom),
            'sub_topic': sub_t,
            'sub_topic_kannada': sub_t_kn,
            'node_id': nid
        }

    # Contextual Fallback based on broad topic heuristics
    t_lower = text_corpus.lower()
    
    # 1. Math / Mental ability
    if any(k in t_lower for k in ['calculate', 'solve', 'km/h', 'percentage', 'ratio', 'number', 'triangle', 'square', 'ಲೀಟರ್', 'ರೂಪಾಯಿ', 'ಸಂಖ್ಯೆ']):
        return {
            'subject': 'General Mental Ability, Quantitative Aptitude & Comprehension',
            'subject_kannada': SUBJECT_TRANSLATIONS['General Mental Ability, Quantitative Aptitude & Comprehension'],
            'domain': 'Quantitative Aptitude & Basic Numeracy',
            'domain_kannada': DOMAIN_TRANSLATIONS['Quantitative Aptitude & Basic Numeracy'],
            'sub_topic': 'General Mental Ability & Basic Numeracy',
            'sub_topic_kannada': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲಭೂತ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
            'node_id': check_node('general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.lcm_hcf_factors_multiples')
        }
    
    # 2. Science
    if any(k in t_lower for k in ['cell', 'water', 'energy', 'plant', 'chemical', 'gas', 'heat', 'light', 'disease', 'ವಿಜ್ಞಾನ', 'ರೋಗ', 'ವಿದ್ಯುತ್', 'ಶಕ್ತಿ']):
        return {
            'subject': 'Science, Technology & Defence',
            'subject_kannada': SUBJECT_TRANSLATIONS['Science, Technology & Defence'],
            'domain': 'Applied & Fundamental Sciences',
            'domain_kannada': DOMAIN_TRANSLATIONS['Applied & Fundamental Sciences'],
            'sub_topic': 'General Science & Applied Concepts',
            'sub_topic_kannada': 'ಸಾಮಾನ್ಯ ವಿಜ್ಞಾನ ಮತ್ತು ಅನ್ವಯಿಕ ಪರಿಕಲ್ಪನೆಗಳು',
            'node_id': check_node('science_technology_defence.applied_fundamental_sciences.applied_physics')
        }
        
    # 3. Geography
    if any(k in t_lower for k in ['river', 'lake', 'mountain', 'state', 'capital', 'crop', 'soil', 'district', 'ನದಿ', 'ಬೆಳೆ', 'ರಾಜಧಾನಿ', 'ಜಿಲ್ಲೆ', 'ಕರ್ನಾಟಕ']):
        return {
            'subject': 'Geography & Earth Systems',
            'subject_kannada': SUBJECT_TRANSLATIONS['Geography & Earth Systems'],
            'domain': 'Geography of Karnataka',
            'domain_kannada': DOMAIN_TRANSLATIONS['Geography of Karnataka'],
            'sub_topic': 'General Geography & State Resources',
            'sub_topic_kannada': 'ಸಾಮಾನ್ಯ ಭೂಗೋಳ ಮತ್ತು ರಾಜ್ಯದ ಸಂಪನ್ಮೂಲಗಳು',
            'node_id': check_node('geography_earth_systems.geography_of_karnataka')
        }
        
    # 4. History (Default for GK / Heritage)
    return {
        'subject': 'History',
        'subject_kannada': SUBJECT_TRANSLATIONS['History'],
        'domain': 'History of Karnataka',
        'domain_kannada': DOMAIN_TRANSLATIONS['History of Karnataka'],
        'sub_topic': 'Historical Events, Rulers & Heritage of Karnataka',
        'sub_topic_kannada': 'ಕರ್ನಾಟಕದ ಐತಿಹಾಸಿಕ ಘಟನೆಗಳು, ಆಡಳಿತಗಾರರು ಮತ್ತು ಪರಂಪರೆ',
        'node_id': check_node('history.history_of_karnataka')
    }

def process_pc_files():
    pc_dir = os.path.join('src', 'data', 'pc')
    files = sorted(os.listdir(pc_dir))
    
    total_processed = 0
    subject_counts = {}
    
    for f in files:
        if not f.endswith('.json'):
            continue
        filepath = os.path.join(pc_dir, f)
        with open(filepath, 'r', encoding='utf-8') as jf:
            questions = json.load(jf)
            
        modified = False
        
        # Determine year override if null
        year_override = None
        if f == '2007_q001-100.json':
            year_override = 2007
        elif f == 'x_year_q001-100.json':
            year_override = 2020
            
        for q in questions:
            # 1. Fix year if null or override
            if year_override is not None and (q.get('year') is None or q.get('year') == 'null'):
                q['year'] = year_override
                modified = True
            elif q.get('year') is None:
                if '2014' in f: q['year'] = 2014
                elif '2015' in f: q['year'] = 2015
                elif '2016' in f: q['year'] = 2016
                elif '2017' in f: q['year'] = 2017
                elif '2018' in f: q['year'] = 2018
                elif '2019' in f: q['year'] = 2019
                elif '2020' in f: q['year'] = 2020
                elif '2021' in f: q['year'] = 2021
                elif '2023' in f: q['year'] = 2023
                elif '2024' in f: q['year'] = 2024
                modified = True

            # 2. Classify if subject or node_id is empty
            if not q.get('subject') or not q.get('node_id'):
                cls_data = classify_question(q)
                q['subject'] = cls_data['subject']
                q['subject_kannada'] = cls_data['subject_kannada']
                q['domain'] = cls_data['domain']
                q['domain_kannada'] = cls_data['domain_kannada']
                q['sub_topic'] = cls_data['sub_topic']
                q['sub_topic_kannada'] = cls_data['sub_topic_kannada']
                q['node_id'] = cls_data['node_id']
                
                # Update tags
                tags = q.get('tags') or []
                if cls_data['subject'] not in tags:
                    tags.append(cls_data['subject'])
                q['tags'] = tags
                
                modified = True
                
            subj = q.get('subject')
            subject_counts[subj] = subject_counts.get(subj, 0) + 1
            total_processed += 1

        if modified:
            with open(filepath, 'w', encoding='utf-8') as out_f:
                json.dump(questions, out_f, ensure_ascii=False, indent=2)
            print(f"Enriched: {f} (100 Qs)")
        else:
            print(f"Already enriched: {f}")

    print("\n" + "="*60)
    print("ENRICHMENT SUMMARY ACROSS ALL 30 PC PAPERS")
    print("="*60)
    print(f"Total Questions Processed: {total_processed}")
    for subj, cnt in sorted(subject_counts.items(), key=lambda x: -x[1]):
        pct = (cnt / total_processed) * 100
        print(f"• {subj}: {cnt} Qs ({pct:.1f}%)")

if __name__ == '__main__':
    process_pc_files()
