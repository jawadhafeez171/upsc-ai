# -*- coding: utf-8 -*-
"""
UPSC CAPF (AC) Paper 1 GS Categorization & Enrichment Engine
Aliged with knowledge_graph_hierarchy.md
"""

import os
import sys
import json
import re

sys.stdout.reconfigure(encoding='utf-8')

# High-precision rules with explicit priorities and canonical node_ids
RULES = [
    # -------------------------------------------------------------
    # 1. QUANTITATIVE APTITUDE & GMA (VERY SPECIFIC ARITHMETIC / PUZZLES)
    # -------------------------------------------------------------
    (
        r'\b(speed\s+of\s+the\s+train|train\s+\d+|crosses\s+a\s+platform|running\s+at\s+a\s+speed|km\/h|m\/s|upstream|downstream|boat\s+in\s+still\s+water)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Speed, Time & Distance, Trains, Boats & Streams", "गति, समय एवं दूरी, रेलगाड़ी, नाव एवं धारा",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_unit_conversions",
        100
    ),
    (
        r'\b(time\s+and\s+work|can\s+complete\s+a\s+piece\s+of\s+work|can\s+finish\s+a\s+work\s+in|pipes?\s+and\s+cisterns?|filling\s+pipe|emptying\s+pipe)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Time & Work, Pipes & Cisterns", "समय एवं कार्य, नल एवं टंकी",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_and_work_pipes_and_cisterns",
        100
    ),
    (
        r'\b(simple\s+interest|compound\s+interest|sum\s+of\s+money\s+doubles|rate\s+of\s+interest\s+per\s+annum|compounded\s+annually|compounded\s+half-yearly)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Simple & Compound Interest", "साधारण एवं चक्रवृद्धि ब्याज",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_compound_interest_formulae",
        100
    ),
    (
        r'\b(cost\s+price|selling\s+price|marked\s+price|profit\s+percentage|loss\s+percentage|profit\s+of\s+\d+%|sold\s+at\s+a\s+loss|discount\s+of\s+\d+%)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Percentages, Profit, Loss & Discount", "प्रतिशतता, लाभ, हानि एवं छूट",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.percentages_successive_change",
        95
    ),
    (
        r'\b(ratio\s+of\s+(the\s+)?ages?|present\s+age\s+of|years\s+ago\s+the\s+ratio|sum\s+of\s+their\s+ages|partnership|invested\s+in\s+the\s+ratio)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Ratio, Proportion & Partnership", "अनुपात, समानुपात एवं साझेदारी",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_proportional_parts",
        95
    ),
    (
        r'\b(arithmetic\s+mean|weighted\s+average|average\s+score|average\s+weight|average\s+marks|alligation|mixture\s+of\s+milk\s+and\s+water)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Averages & Mixtures", "औसत एवं मिश्रण",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation",
        95
    ),
    (
        r'\b(permutation|combinations?|in\s+how\s+many\s+ways\s+can|number\s+of\s+distinct\s+ways|probability\s+that|cards?\s+drawn|tossing\s+a\s+coin|pair\s+of\s+dice)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Permutation, Combination & Probability", "क्रमचय, संचय एवं प्रायिकता",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.combinations_selections_geometry_combinations",
        95
    ),
    (
        r'\b(remainder\s+when|divisible\s+by\s+\d+|unit\s+digit|number\s+of\s+zeros|hcf\s+and\s+lcm|greatest\s+common\s+divisor|least\s+common\s+multiple|prime\s+factors?)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Number Systems, Divisibility & Basic Arithmetic", "संख्या पद्धति, विभाज्यता एवं मूलभूत अंकगणित",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules",
        95
    ),
    (
        r'\b(radius\s+of\s+a\s+cylinder|volume\s+of\s+a\s+cone|surface\s+area\s+of\s+a\s+sphere|perimeter\s+of\s+a\s+triangle|hypotenuse|area\s+of\s+a\s+rhombus|dimensions\s+of\s+a\s+cuboid)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "2D & 3D Mensuration & Geometry", "क्षेत्रमिति एवं ज्यामिति",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons",
        95
    ),
    (
        r'\b(next\s+number\s+in\s+the\s+series|missing\s+term|sequence\s+is\s+given|next\s+term\s+in\s+the\s+sequence|missing\s+number\s+in\s+the\s+table)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Number & Letter Sequences & Series", "संख्या एवं वर्ण श्रृंखला",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_symbol_series",
        95
    ),
    (
        r'\b(if\s+[A-Z]+\s+is\s+coded\s+as|coding-decoding|decipher|decoded\s+as|substituting\s+letters)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Coding, Decoding & Symbol Operations", "कोडिंग, डिकोडिंग एवं प्रतीक संक्रियाएं",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.coding_decoding_letter_number",
        95
    ),
    (
        r'\b(brother-in-law|sister-in-law|maternal\s+uncle|daughter\s+of\s+my\s+father|how\s+is\s+[a-z]\s+related\s+to\s+[a-z]|father\s+of\s+[a-z]|granddaughter)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Blood Relations & Family Puzzles", "रक्त संबंध एवं पारिवारिक पहेलियां",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.blood_relations_family_tree",
        95
    ),
    (
        r'\b(walks\s+\d+\s+meters\s+towards\s+(north|south|east|west)|turns\s+to\s+his\s+(left|right)|facing\s+towards\s+the\s+sun|in\s+which\s+direction\s+is\s+he\s+from\s+the\s+starting\s+point)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Direction & Distance Sense", "दिशा एवं दूरी ज्ञान",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.direction_sense_paths_angles",
        95
    ),
    (
        r'\b(hands\s+of\s+a\s+clock|angle\s+between\s+the\s+hour\s+hand|clock\s+gains\s+time|calendar\s+for\s+the\s+year|day\s+of\s+the\s+week\s+on\s+\d+|leap\s+year\s+has)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Clocks & Calendars", "घड़ी एवं कैलेंडर",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.calendar_odd_days_leap_years_repetition",
        95
    ),
    (
        r'\b(ranks?\s+\d+th\s+from\s+the\s+top|tallest\s+among\s+them|shortest|sitting\s+around\s+a\s+circular\s+table|seating\s+arrangement)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Order, Ranking & Seating Arrangements", "क्रम, रैंकिंग एवं बैठक व्यवस्था",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.order_ranking_comparative_arrangements",
        95
    ),
    (
        r'\b(syllogisms?|statements?\s*:\s*all\s+\w+\s+are|conclusions?\s*:\s*some\s+\w+\s+are|which\s+of\s+the\s+conclusions?\s+logically\s+follows?)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Syllogisms & Deductive Logic", "न्याय वाक्य एवं निगमनात्मक तर्क",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_deductive_reasoning.syllogism_categorical_propositions",
        95
    ),
    (
        r'\b(pie\s+chart|bar\s+graph|data\s+interpretation|histogram|frequency\s+polygon)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Data Interpretation & Data Sufficiency", "आंकड़ा व्याख्या एवं आंकड़ा पर्याप्तता",
        "Data Interpretation: Charts, Tables & Graphs", "आंकड़ा व्याख्या: चार्ट, तालिका एवं ग्राफ",
        "general_mental_ability_quantitative_aptitude_comprehension.data_interpretation_data_sufficiency.tables_bar_graphs_pie_charts",
        95
    ),

    # -------------------------------------------------------------
    # 2. INTERNAL SECURITY & DEFENCE SPECIFIC (CAPF Core Syllabus)
    # -------------------------------------------------------------
    (
        r'\b(crpf|bsf|cisf|itbp|ssb|assam\s+rifles|nsg|central\s+armed\s+police\s+forces?|border\s+security\s+force|central\s+reserve\s+police|sashastra\s+seema\s+bal|indo-tibetan\s+border\s+police)\b',
        "Internal Security", "आंतरिक सुरक्षा",
        "Security Forces & Their Mandates", "सुरक्षा बल एवं उनके कार्यक्षेत्र",
        "Central Armed Police Forces (CAPF): Roles, Structure & Deployment", "केंद्रीय सशस्त्र पुलिस बल (CAPF): भूमिका, संरचना एवं तैनाती",
        "internal_security.security_forces_and_mandates.capf_central_armed_police_forces",
        90
    ),
    (
        r'\b(border\s+management|cibms|comprehensive\s+integrated\s+border|border\s+fencing|sir\s+creek|line\s+of\s+control|loc|line\s+of\s+actual\s+control|lac|cross-border\s+infiltration)\b',
        "Internal Security", "आंतरिक सुरक्षा",
        "Border Management & Coastal Security", "सीमा प्रबंधन एवं तटीय सुरक्षा",
        "Border Security, Fencing & Cross-Border Challenges", "सीमा सुरक्षा, बाड़ निर्माण एवं सीमा पार चुनौतियाँ",
        "internal_security.border_management_coastal_security.border_fencing_surveillance_cibms",
        90
    ),
    (
        r'\b(naxalism|left\s+wing\s+extremism|lwe|red\s+corridor|afspa|armed\s+forces\s+special\s+powers\s+act|uapa|unlawful\s+activities|insurgency\s+in\s+north-east|naga\s+peace\s+accord)\b',
        "Internal Security", "आंतरिक सुरक्षा",
        "Internal Security Challenges & Extremism", "आंतरिक सुरक्षा चुनौतियाँ एवं उग्रवाद",
        "Left-Wing Extremism (LWE) & North-East Insurgency", "वामपंथी उग्रवाद (LWE) एवं पूर्वोत्तर उग्रवाद",
        "internal_security.internal_security_challenges.left_wing_extremism_naxalism",
        90
    ),
    (
        r'\b(missile|brahmos|agni-[ivx]+|prithvi-[ivx]+|akash\s+missile|nag\s+missile|helina|drdo|tejas|ins\s+vikrant|ins\s+arihant|scorpene\s+submarine|project\s+75|s-400|rafale|pinaka|artillery\s+gun|ballistic\s+missile\s+defence|bmd)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Defence Technology & Systems", "रक्षा प्रौद्योगिकी एवं प्रणालियाँ",
        "Indigenous Weapon Systems, Missiles & Naval Platforms", "स्वदेशी हथियार प्रणालियाँ, मिसाइलें एवं नौसैनिक पोत",
        "science_technology_defence.defence_technology_systems.indigenous_weapon_systems_platforms",
        90
    ),

    # -------------------------------------------------------------
    # 3. POLITY & CONSTITUTION
    # -------------------------------------------------------------
    (
        r'\b(fundamental\s+rights?|article\s+14|article\s+19|article\s+21|article\s+32|writs?|habeas\s+corpus|mandamus|certiorari|prohibition|quo\s+warranto|right\s+to\s+equality|right\s+to\s+freedom|preventive\s+detention)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Constitutional Framework", "संवैधानिक ढांचा",
        "Fundamental Rights & Constitutional Remedies", "मौलिक अधिकार एवं संवैधानिक उपचार",
        "indian_polity_constitution_governance.constitutional_framework.fundamental_rights",
        85
    ),
    (
        r'\b(directive\s+principles|dpsp|article\s+40|article\s+44|uniform\s+civil\s+code|article\s+48|article\s+51|fundamental\s+duties|article\s+51a|swaran\s+singh\s+committee)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Constitutional Framework", "संवैधानिक ढांचा",
        "Directive Principles of State Policy & Fundamental Duties", "राज्य के नीति निर्देशक तत्व एवं मौलिक कर्तव्य",
        "indian_polity_constitution_governance.constitutional_framework.directive_principles_of_state_policy",
        85
    ),
    (
        r'\b(preamble|constituent\s+assembly|drafting\s+committee|objective\s+resolution|basic\s+structure|kesavananda\s+bharati|minerva\s+mills|42nd\s+amendment|44th\s+amendment|article\s+368)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Constitutional Framework", "संवैधानिक ढांचा",
        "Preamble & Making of the Constitution", "प्रस्तावना एवं संविधान निर्माण",
        "indian_polity_constitution_governance.constitutional_framework.preamble_philosophical_foundations",
        85
    ),
    (
        r'\b(president\s+of\s+india|impeachment\s+of\s+president|ordinance-making\s+power|article\s+123|pardoning\s+power\s+of\s+president|article\s+72|electoral\s+college|vice-president|ex-officio\s+chairman)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "System of Government", "शासन प्रणाली",
        "Union Executive: President & Vice-President", "संघीय कार्यपालिका: राष्ट्रपति एवं उपराष्ट्रपति",
        "indian_polity_constitution_governance.system_of_government.president_vice_president",
        85
    ),
    (
        r'\b(parliament\s+of\s+india|lok\s+sabha|rajya\s+sabha|speaker\s+of\s+lok\s+sabha|money\s+bill|article\s+110|financial\s+bill|joint\s+sitting|article\s+108|public\s+accounts\s+committee|pac|estimates\s+committee|no-confidence\s+motion|censure\s+motion|question\s+hour|zero\s+hour|calling\s+attention|parliamentary\s+privileges|article\s+105)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "System of Government", "शासन प्रणाली",
        "Union Parliament: Composition, Powers & Procedures", "केंद्रीय संसद: संरचना, शक्तियाँ एवं प्रक्रियाएं",
        "indian_polity_constitution_governance.system_of_government.parliamentary_system_composition",
        85
    ),
    (
        r'\b(supreme\s+court\s+of\s+india|high\s+court|judicial\s+review|collegium\s+system|original\s+jurisdiction|article\s+131|appellate\s+jurisdiction|advisory\s+jurisdiction|article\s+143|curative\s+petition|contempt\s+of\s+court|removal\s+of\s+judges?|national\s+judicial\s+appointments)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Judicial System & Administration", "न्यायिक प्रणाली एवं प्रशासन",
        "Union & State Judiciary: Powers, Jurisdiction & Independence", "केंद्रीय एवं राज्य न्यायपालिका: शक्तियाँ, क्षेत्राधिकार एवं स्वतंत्रता",
        "indian_polity_constitution_governance.judicial_system_administration.supreme_court_composition_jurisdiction",
        85
    ),
    (
        r'\b(governor|article\s+153|discretionary\s+powers?\s+of\s+governor|ordinance.*governor|article\s+213|chief\s+minister|state\s+legislative\s+assembly|vidhan\s+sabha|vidhan\s+parishad|state\s+legislative\s+council)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "System of Government", "शासन प्रणाली",
        "State Executive & Legislature", "राज्य कार्यपालिका एवं विधायिका",
        "indian_polity_constitution_governance.system_of_government.state_executive_governor_chief_minister",
        85
    ),
    (
        r'\b(panchayat|73rd\s+constitutional\s+amendment|74th\s+constitutional\s+amendment|municipality|gram\s+sabha|eleventh\s+schedule|twelfth\s+schedule|state\s+election\s+commission|state\s+finance\s+commission|pesa\s+act)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Local Self-Government & Decentralization", "स्थानीय स्वशासन एवं विकेंद्रीकरण",
        "Panchayati Raj & Urban Local Bodies (73rd & 74th Amendments)", "पंचायती राज एवं नगर निकाय (73वां व 74वां संशोधन)",
        "indian_polity_constitution_governance.local_self-government_decentralization.panchayati_raj_institutions_73rd_amendment",
        85
    ),
    (
        r'\b(national\s+emergency|article\s+352|president\'?s\s+rule|state\s+emergency|article\s+356|financial\s+emergency|article\s+360)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Constitutional Framework", "संवैधानिक ढांचा",
        "Emergency Provisions: National, State & Financial", "आपातकालीन प्रावधान: राष्ट्रीय, राज्य एवं वित्तीय",
        "indian_polity_constitution_governance.constitutional_framework.emergency_provisions_national_state_financial",
        85
    ),
    (
        r'\b(election\s+commission\s+of\s+india|article\s+324|comptroller\s+and\s+auditor\s+general|cag|article\s+148|union\s+public\s+service\s+commission|upsc|article\s+315|finance\s+commission|article\s+280|attorney\s+general\s+of\s+india|article\s+76|solicitor\s+general|advocate\s+general|article\s+165|national\s+human\s+rights\s+commission|nhrc|cpc|central\s+vigilance\s+commission|cvc|lokpal|cbi)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Constitutional & Non-Constitutional Bodies", "संवैधानिक एवं गैर-संवैधानिक निकाय",
        "Constitutional & Statutory Bodies: ECI, CAG, UPSC, CVC, Lokpal", "संवैधानिक एवं सांविधिक निकाय: चुनाव आयोग, कैग, संघ लोक सेवा आयोग, सीवीसी, लोकपाल",
        "indian_polity_constitution_governance.constitutional_non-constitutional_bodies.election_commission_of_india",
        85
    ),
    (
        r'\b(tenth\s+schedule|anti-defection\s+law|52nd\s+amendment|ninety-first\s+amendment|disqualification\s+of\s+members|seventh\s+schedule|union\s+list|state\s+list|concurrent\s+list|residuary\s+powers|centre-state\s+relations|sarkaria\s+commission|punchhi\s+commission)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Constitutional Framework", "संवैधानिक ढांचा",
        "Centre-State Relations & Schedules of the Constitution", "केंद्र-राज्य संबंध एवं संविधान की अनुसूचियाँ",
        "indian_polity_constitution_governance.constitutional_framework.federal_system_centre_state_relations",
        85
    ),

    # -------------------------------------------------------------
    # 4. ART, CULTURE & HERITAGE
    # -------------------------------------------------------------
    (
        r'\b(temple\s+architecture|nagara\s+style|dravida\s+style|vesara\s+style|shikhara|vimana|garbhagriha|mandapa|gopuram|khajuraho|kandariya|konark|sun\s+temple|modhera|brihadisvara|thanjavur|shore\s+temple|mahabalipuram|pancha\s+rathas|ellora|kailash\s+temple|ajanta|rock-cut\s+cave|barabar\s+caves|elephanta)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Architecture & Sculpture", "भारतीय वास्तुकला एवं मूर्तिकला",
        "Temple Architecture: Nagara, Dravida, Vesara & Rock-Cut Caves", "मंदिर स्थापत्य: नागर, द्रविड़, वेसर एवं शैलकृत गुफाएं",
        "art_culture_heritage.indian_architecture_sculpture.temple_architecture_nagara_dravida_vesara",
        85
    ),
    (
        r'\b(mughal\s+architecture|delhi\s+sultanate\s+architecture|indo-islamic\s+architecture|pietra\s+dura|charbagh|qutb\s+minar|alai\s+darwaza|humayun\'?s\s+tomb|buland\s+darwaza|taj\s+mahal|red\s+fort|fatehpur\s+sikri|gol\s+gumbaz)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Architecture & Sculpture", "भारतीय वास्तुकला एवं मूर्तिकला",
        "Indo-Islamic & Mughal Architecture: Monuments & Stylistic Evolution", "इंडो-इस्लामिक एवं मुगल वास्तुकला: स्मारक एवं स्थापत्य विकास",
        "art_culture_heritage.indian_architecture_sculpture.indo-islamic_architecture_delhi_sultanate_mughal",
        85
    ),
    (
        r'\b(bharatanatyam|kathak|kathakali|kuchipudi|odissi|manipuri|mohiniyattam|sattriya|sangeet\s+natak\s+akademi|classical\s+dance|carnatic\s+music|hindustani\s+music|raga|tala|gharana|dhrupad|khyal|thumri|rudra\s+veena|sitar|sarod|tabla)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Performing Arts (Dance, Music, Theatre & Puppetry)", "प्रदर्शन कला (नृत्य, संगीत, रंगमंच एवं कठपुतली)",
        "Classical & Folk Dances, Hindustani & Carnatic Music Traditions", "शास्त्रीय एवं लोक नृत्य, हिंदुस्तानी एवं कर्नाटक संगीत परंपराएं",
        "art_culture_heritage.performing_arts.classical_dances_sangeet_natak_akademi_eight_forms",
        85
    ),
    (
        r'\b(miniature\s+paintings?|mughal\s+paintings?|rajasthani\s+paintings?|pahari\s+paintings?|kangra\s+paintings?|basohli|kishangarh|bani\s+thani|madhubani|warli|pattachitra|kalamkari|mural\s+paintings?)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Paintings & Visual Arts", "भारतीय चित्रकला एवं दृश्य कला",
        "Mural & Miniature Paintings: Mughal, Rajasthani, Pahari & Folk Schools", "भित्ति एवं लघु चित्रकला: मुगल, राजस्थानी, पहाड़ी एवं लोक शैलियां",
        "art_culture_heritage.indian_paintings_visual_arts.miniature_paintings_mughal_rajasthani_pahari_schools",
        85
    ),
    (
        r'\b(nyaya|vaisheshika|samkhya|yoga|mimamsa|vedanta|shad\s+darshana|advaita\s+vedanta|shankara|vishishtadvaita|ramanujacharya|dvaita|madhvacharya|carvaka|lokayata)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Schools of Indian Philosophy", "भारतीय दर्शन के संप्रदाय",
        "Six Orthodox Schools (Shad Darshana) & Heterodox Traditions", "छह आस्तिक दर्शन (षड्दर्शन) एवं नास्तिक परंपराएं",
        "art_culture_heritage.schools_of_indian_philosophy.orthodox_schools_shad_darshana",
        85
    ),
    (
        r'\b(unesco\s+world\s+heritage|intangible\s+cultural\s+heritage|kumbh\s+mela|yoga|chhau\s+dance|vedic\s+chanting|ramlila|navroz|durga\s+puja|sankirtana|kalbelia)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Fairs, Festivals, Crafts & UNESCO Heritage", "मेले, त्योहार, शिल्प एवं यूनेस्को धरोहर",
        "UNESCO World Heritage & Intangible Cultural Heritage of India", "यूनेस्को विश्व धरोहर एवं भारत की अमूर्त सांस्कृतिक विरासत",
        "art_culture_heritage.fairs_festivals_crafts_unesco.unesco_intangible_cultural_heritage_india",
        85
    ),

    # -------------------------------------------------------------
    # 5. HISTORY (ANCIENT, MEDIEVAL, MODERN)
    # -------------------------------------------------------------
    (
        r'\b(harappa|mohenjo-daro|indus\s+valley|lothal|dholavira|kalibangan|rakhigarhi|great\s+bath|bearded\s+priest|bronze\s+dancing\s+girl|seals\s+of\s+harappa)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Indus Valley Civilization: Urban Planning, Trade & Sites", "सिंधु घाटी सभ्यता: नगर नियोजन, व्यापार एवं प्रमुख स्थल",
        "history.ancient_india.indus_valley_civilization.major_urban_centers_findings",
        85
    ),
    (
        r'\b(rig\s*veda|samaveda|yajurveda|atharvaveda|upanishad|vedic\s+hymns|sabha\s+and\s+samiti|ashvamedha|rajasuya|varna\s+system|brahmana|aranyaka)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Vedic Age: Early & Later Vedic Society, Polity & Literature", "वैदिक काल: पूर्व व उत्तर वैदिक समाज, राजनीति एवं साहित्य",
        "history.ancient_india.vedic_age.early_vedic_rigvedic_period",
        85
    ),
    (
        r'\b(buddhism|gautama\s+buddha|hinayana|mahayana|theravada|vajrayana|four\s+noble\s+truths|eightfold\s+path|sangha|buddhist\s+councils|jainism|mahavira|tirthankara|parshvanatha|digambara|svetambara|ahimsa|anekantavada|syadvada)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Buddhism & Jainism: Philosophies, Councils & Monastic Orders", "बौद्ध एवं जैन धर्म: दर्शन, संगीति एवं संघ",
        "history.ancient_india.religious_movements_buddhism_jainism.teachings_philosophy_of_buddhism",
        85
    ),
    (
        r'\b(maurya|chandragupta\s+maurya|ashoka|dhamma|arthashastra|kautilya|megasthenes|indica|ashokan\s+rock\s+edicts?|pillar\s+edicts?|kalinga\s+war|bindusara)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Mauryan Empire: Ashokan Dhamma, Edicts & Administration", "मौर्य साम्राज्य: अशोक का धम्म, शिलालेख एवं प्रशासन",
        "history.ancient_india.mauryan_empire.ashoka_dhamma_policy_edicts",
        85
    ),
    (
        r'\b(gupta\s+empire|samudragupta|chandragupta\s+ii|vikramaditya|fa-hsien|faxian|kalidasa|aryabhata|varahamihira|allahabad\s+pillar\s+inscription|harisena|harshavardhana|hsuan-tsang|xuanzang|banabhatta|kadambari|harshacharita)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Gupta & Post-Gupta Era: Literature, Sciences & Administration", "गुप्त एवं गुप्तोत्तर काल: साहित्य, विज्ञान एवं प्रशासन",
        "history.ancient_india.gupta_post-gupta_period.gupta_administration_economy_society",
        85
    ),
    (
        r'\b(chola\s+empire|rajaraja\s+chola|rajendra\s+chola|uttaramerur\s+inscription|chola\s+village\s+administration|kudavolai|gangaikondacholapuram)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "South Indian Dynasties: Cholas, Pallavas & Administrative Systems", "दक्षिण भारतीय राजवंश: चोल, पल्लव एवं प्रशासनिक व्यवस्था",
        "history.ancient_india.south_indian_kingdoms.chola_empire_local_self_governance",
        85
    ),
    (
        r'\b(delhi\s+sultanate|qutb\s+ud\s+din\s+aibak|iltutmish|balban|sajda\s+and\s+paibos|alauddin\s+khalji|market\s+reforms|dagh\s+and\s+chehra|muhammad\s+bin\s+tughlaq|token\s+currency|firuz\s+shah\s+tughlaq|iqta\s+system|lodhi\s+dynasty|ibrahim\s+lodhi)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Delhi Sultanate: Khalji, Tughlaq & Administrative Systems", "दिल्ली सल्तनत: खिलजी, तुगलक एवं प्रशासनिक व्यवस्था",
        "history.medieval_india.delhi_sultanate.khalji_dynasty",
        85
    ),
    (
        r'\b(mughal\s+empire|babur|battle\s+of\s+panipat|humayun|akbar|mansabdari\s+system|din-i-ilahi|sulh-i-kul|todar\s+mal|dahsala|jahangir|shah\s+jahan|aurangzeb|jagirdari\s+crisis|zabti\s+system)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Mughal Empire: Akbar's Administration, Mansabdari & Land Revenue", "मुगल साम्राज्य: अकबर का प्रशासन, मनसबदारी एवं भू-राजस्व",
        "history.medieval_india.mughal_empire_administration.akbar_consolidation_expansion",
        85
    ),
    (
        r'\b(maratha\s+empire|shivaji|chhatrapati|ashtapradhan|chauth|sardeshmukhi|peshwa|baji\s+rao|battle\s+of\s+panipat\s+1761|third\s+battle\s+of\s+panipat|treaty\s+of\s+salbai|treaty\s+of\s+purandar)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Maratha Confederacy: Shivaji's Administration & Peshwa Era", "मराठा परिसंघ: शिवाजी का प्रशासन एवं पेशवा काल",
        "history.medieval_india.maratha_empire_regional_states.chhatrapati_shivaji_maharaj_early_maratha_state",
        85
    ),
    (
        r'\b(vijayanagara\s+empire|krishnadevaraya|amuktamalyada|hampi|nayankara\s+system|ayagar|bahmani\s+kingdom|mahmud\s+gawan|battle\s+of\s+talikota)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Vijayanagara Empire: Krishnadevaraya, Nayankara System & Art", "विजयनगर साम्राज्य: कृष्णदेवराय, नयनकार प्रणाली एवं कला",
        "history.medieval_india.vijayanagara_bahmani_kingdoms.krishnadeva_raya_golden_age",
        85
    ),
    (
        r'\b(bhakti\s+movement|sufi\s+movement|kabir|guru\s+nanak|mirabai|chaitanya\s+mahaprabhu|sankaradeva|dadu\s+dayal|tulsidas|surdas|chishti\s+silsila|nizamuddin\s+auliya|khwaja\s+muinuddin|suhrawardi)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Bhakti & Sufi Movements: Saints, Philosophy & Literature", "भक्ति एवं सूफी आंदोलन: संत, दर्शन एवं साहित्य",
        "history.medieval_india.bhakti_sufi_movements.bhakti_movement_north_south",
        85
    ),
    (
        r'\b(battle\s+of\s+plassey|battle\s+of\s+buxar|treaty\s+of\s+allahabad|subsidiary\s+alliance|doctrine\s+of\s+lapse|lord\s+dalhousie|lord\s+wellesley|permanent\s+settlement|zamindari\s+system|ryotwari\s+system|mahalwari\s+system|commercialisation\s+of\s+agriculture|drain\s+of\s+wealth|dadabhai\s+naoroji)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "British Expansion & Land Revenue Systems (Permanent, Ryotwari, Mahalwari)", "ब्रिटिश विस्तार एवं भू-राजस्व नीतियां (स्थायी, रैयतवाड़ी, महालवाड़ी)",
        "history.modern_india.consolidation_of_british_rule.british_land_revenue_systems",
        85
    ),
    (
        r'\b(revolt\s+of\s+1857|sepoy\s+mutiny|mangal\s+pandey|rani\s+lakshmibai|tatya\s+tope|kunwar\s+singh|begum\s+hazrat\s+mahal|bahadur\s+shah\s+zafar|government\s+of\s+india\s+act\s+1858|queen\s+victoria\'?s\s+proclamation)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "Revolt of 1857: Causes, Leaders, Centers & Aftermath", "1857 का विद्रोह: कारण, प्रमुख नेता, केंद्र एवं प्रभाव",
        "history.indian_freedom_struggle.revolt_of_1857.causes_and_nature_of_revolt_1857",
        85
    ),
    (
        r'\b(brahmo\s+samaj|raja\s+ram\s+mohan\s+roy|arya\s+samaj|dayanand\s+saraswati|shuddhi\s+movement|satya\s+shodhak\s+samaj|jyotirao\s+phule|ishwar\s+chandra\s+vidyasagar|swami\s+vivekananda|ramakrishna\s+mission|aligarh\s+movement|syed\s+ahmad\s+khan|prarthana\s+samaj|young\s+bengal|henry\s+vivian\s+derozio|theosophical\s+society|annie\s+besant)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "Socio-Religious Reform Movements of 19th & 20th Century", "19वीं एवं 20वीं सदी के सामाजिक-धार्मिक सुधार आंदोलन",
        "history.modern_india.socio-religious_reform_movements.brahmo_samaj_raja_ram_mohan_roy",
        85
    ),
    (
        r'\b(indian\s+national\s+congress|a\.?\s*o\.?\s*hume|w\.?\s*c\.?\s*bonnerjee|moderate\s+phase|gopal\s+krishna\s+gokhale|bal\s+gangadhar\s+tilak|swaraj\s+is\s+my\s+birthright|lal\s+bal\s+pal|swadeshi\s+movement|partition\s+of\s+bengal\s+1905|boycott\s+movement|surat\s+split\s+1907|morley-minto\s+reforms|separate\s+electorates\s+1909|home\s+rule\s+league|lucknow\s+pact\s+1916)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "Early Phase of Congress, Swadeshi Movement & Extremist Phase", "कांग्रेस का प्रारंभिक दौर, स्वदेशी आंदोलन एवं उग्रवादी चरण",
        "history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i.partition_of_bengal_swadeshi_movement",
        85
    ),
    (
        r'\b(gandhian|champaran\s+satyagraha|kheda\s+satyagraha|ahmedabad\s+mill\s+strike|rowlatt\s+act|jallianwala\s+bagh|khilafat\s+movement|non-cooperation\s+movement|chauri\s+chaura|swaraj\s+party|c\.?\s*r\.?\s*das|motilal\s+nehru|simon\s+commission|nehru\s+report|lahore\s+session\s+1929|purna\s+swaraj)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "Gandhian Era: Non-Cooperation, Khilafat & Early Satyagrahas", "गांधीवादी युग: असहयोग आंदोलन, खिलाफत एवं आरंभिक सत्याग्रह",
        "history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.non-cooperation_movement_khilafat",
        85
    ),
    (
        r'\b(civil\s+disobedience\s+movement|dandi\s+march|salt\s+satyagraha|round\s+table\s+conferences?|gandhi-irwin\s+pact|communal\s+award|poona\s+pact|b\.?\s*r\.?\s*ambedkar|government\s+of\s+india\s+act\s+1935|provincial\s+elections\s+1937)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "Civil Disobedience Movement, Round Table Conferences & Poona Pact", "सविनय अवज्ञा आंदोलन, गोलमेज सम्मेलन एवं पूना समझौता",
        "history.indian_freedom_struggle.civil_disobedience_movement_round_table_conferences.civil_disobedience_movement_dandi_march",
        85
    ),
    (
        r'\b(quit\s+india\s+movement|do\s+or\s+die|august\s+kranti|indian\s+national\s+army|ina|subhas\s+chandra\s+bose|forward\s+bloc|azad\s+hind\s+fauj|cr\s+formula|wavell\s+plan|shimla\s+conference|cabinet\s+mission|mountbatten\s+plan|indian\s+independence\s+act\s+1947|radcliffe\s+line)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "Quit India Movement, INA & Path to Independence (1942–1947)", "भारत छोड़ो आंदोलन, आज़ाद हिंद फौज एवं स्वतंत्रता (1942–1947)",
        "history.indian_freedom_struggle.quit_india_movement_ina_post_war_upsurge.quit_india_movement_august_kranti",
        85
    ),

    # -------------------------------------------------------------
    # 6. GEOGRAPHY & EARTH SYSTEMS
    # -------------------------------------------------------------
    (
        r'\b(plate\s+tectonics|continental\s+drift|seafloor\s+spreading|pangea|panthalassa|earthquake|seismic\s+waves?|primary\s+waves?|secondary\s+waves?|epicenter|focus|richter\s+scale|volcano|magma|lava|igneous\s+rocks?|basalt|granite|sedimentary\s+rocks?|metamorphic\s+rocks?|fold\s+mountains?|faulting|rift\s+valley)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Physical Geography & Geomorphology", "भौतिक भूगोल एवं भू-आकृतिक विज्ञान",
        "Earth Interior, Plate Tectonics & Geomorphic Processes", "पृथ्वी की आंतरिक संरचना, प्लेट विवर्तनिकी एवं भू-आकृतिक प्रक्रियाएं",
        "geography_earth_systems.physical_geography_geomorphology.plate_tectonics_continental_drift_seafloor_spreading",
        85
    ),
    (
        r'\b(atmosphere|troposphere|stratosphere|mesosphere|thermosphere|ionosphere|tropopause|atmospheric\s+pressure|coriolis\s+force|cyclone|anticyclone|tropical\s+cyclone|temperate\s+cyclone|jet\s+streams?|south-west\s+monsoon|retreating\s+monsoon|el\s+nino|la\s+nina|enso|indian\s+ocean\s+dipole|iod|itcz|inter-tropical\s+convergence|western\s+disturbances?|temperature\s+inversion|relative\s+humidity|fog|dew|frost|clouds?|cumulonimbus)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Climatology & Atmospheric Dynamics", "जलवायु विज्ञान एवं वायुमंडलीय गतिकी",
        "Atmospheric Layers, Winds, Cyclones & Indian Monsoon", "वायुमंडलीय परतें, पवनें, चक्रवात एवं भारतीय मानसून",
        "geography_earth_systems.climatology_atmospheric_dynamics.monsoons_and_jet_streams",
        85
    ),
    (
        r'\b(ocean\s+currents?|gulf\s+stream|kuroshio|peru\s+current|humboldt|benguela|canary\s+current|labrador\s+current|salinity\s+of\s+ocean|tides?|spring\s+tide|neap\s+tide|coral\s+reefs?|atoll|barrier\s+reef|fringing\s+reef|ocean\s+trench|mariana\s+trench|continental\s+shelf|continental\s+slope|abyssal\s+plain)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Oceanography & Hydrosphere", "समुद्र विज्ञान एवं जलमंडल",
        "Ocean Currents, Salinity, Tides & Marine Topography", "महासागरीय धाराएं, लवणता, ज्वार-भाटा एवं समुद्री स्थलाकृति",
        "geography_earth_systems.oceanography_hydrosphere.ocean_currents_and_circulation",
        85
    ),
    (
        r'\b(himalayas?|greater\s+himalayas|himadri|lesser\s+himalayas|himachal|shivalik|shiwalik|western\s+ghats|sahyadri|eastern\s+ghats|aravalli|vindhya|satpura|deccan\s+plateau|malwa\s+plateau|chota\s+nagpur\s+plateau|coastal\s+plains|coromandel|malabar|konkan|thar\s+desert|nathu\s+la|zoji\s+la|shipki\s+la|rohtang\s+pass|lipulekh|palghat|thalghat|bhorghat)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Indian Geography - Physical & Drainage", "भारत का भूगोल - भौतिक एवं अपवाह",
        "Physiographic Divisions of India: Mountains, Plateaus & Plains", "भारत के भौतिक प्रदेश: पर्वत, पठार एवं मैदान",
        "geography_earth_systems.indian_geography_physical_drainage.physiographic_divisions_himalayas_peninsular_plains",
        85
    ),
    (
        r'\b(indus\s+river|ganges|ganga\s+river|brahmaputra|godavari|krishna\s+river|kaveri|cauvery|narmada|tapi|tapti|mahanadi|yamuna|ghaghara|kosi|son\s+river|chambal|betwa|tributary|distributary|delta|sundarbans|drainage\s+basin|waterfall|jog\s+falls|shivasamudram)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Indian Geography - Physical & Drainage", "भारत का भूगोल - भौतिक एवं अपवाह",
        "River Drainage Systems of India: Himalayan & Peninsular", "भारत की नदी अपवाह प्रणालियाँ: हिमालयी एवं प्रायद्वीपीय",
        "geography_earth_systems.indian_geography_physical_drainage.river_systems_himalayan_peninsular_drainage",
        85
    ),
    (
        r'\b(black\s+soil|regur\s+soil|alluvial\s+soil|red\s+soil|laterite\s+soil|soil\s+erosion|saline\s+soil|peaty\s+soil|tropical\s+evergreen\s+forest|tropical\s+deciduous\s+forest|monsoon\s+forest|mangrove\s+forest|thorny\s+bushes|alpine\s+vegetation)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Indian Geography - Climate, Vegetation & Soils", "भारत का भूगोल - जलवायु, वनस्पति एवं मृदा",
        "Soils & Natural Vegetation of India", "भारत की मृदा एवं प्राकृतिक वनस्पति",
        "geography_earth_systems.indian_geography_climate_vegetation_soils.soil_types_distribution_degradation_conservation",
        85
    ),
    (
        r'\b(iron\s+ore|coal\s+fields?|jh维持haria|raniganj|bokaro|bauxite|copper\s+mines?|khetri|petroleum\s+refinery|digboi|mumbai\s+high|natural\s+gas|solar\s+park|wind\s+energy|hydroelectric\s+project|multipurpose\s+river\s+valley|hirakud\s+dam|bhakra\s+nangal|tehri\s+dam|sardar\s+sarovar|damodar\s+valley)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Economic & Resource Geography", "आर्थिक एवं संसाधन भूगोल",
        "Mineral & Energy Resources, Multi-Purpose River Valley Projects", "खनिज एवं ऊर्जा संसाधन, बहुउद्देशीय नदी घाटी परियोजनाएं",
        "geography_earth_systems.economic_resource_geography.mineral_resources_metallic_nonmetallic_distribution",
        85
    ),
    (
        r'\b(equator|tropic\s+of\s+cancer|tropic\s+of\s+capricorn|arctic\s+circle|prime\s+meridian|greenwich\s+mean\s+time|international\s+date\s+line|latitude\s+and\s+longitude|strait\s+of\s+malacca|strait\s+of\s+gibraltar|strait\s+of\s+hormuz|bab-el-mandeb|suez\s+canal|panama\s+canal|rocky\s+mountains|andes\s+mountains|alps\s+mountains|great\s+rift\s+valley|sahara\s+desert|lake\s+victoria|lake\s+superior|caspian\s+sea)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "World Regional Geography & Mapping", "विश्व क्षेत्रीय भूगोल एवं मानचित्रण",
        "World Geographic Features: Straits, Canals, Mountains & Continents", "विश्व के भौगोलिक स्थल: जलडमरूमध्य, नहरें, पर्वत एवं महाद्वीप",
        "geography_earth_systems.world_regional_geography_mapping.major_mountain_ranges_peaks_plateaus",
        85
    ),

    # -------------------------------------------------------------
    # 7. INDIAN ECONOMY & DEVELOPMENT
    # -------------------------------------------------------------
    (
        r'\b(gross\s+domestic\s+product|gdp|gross\s+national\s+product|gnp|net\s+national\s+product|nnp|national\s+income|per\s+capita\s+income|gross\s+value\s+added|gva|real\s+gdp|nominal\s+gdp|gdp\s+deflator|depreciation\s+in\s+national\s+income)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Macroeconomics & National Income", "समष्टि अर्थशास्त्र एवं राष्ट्रीय आय",
        "National Income Accounting: GDP, GNP, NNP & Growth Metrics", "राष्ट्रीय आय लेखांकन: GDP, GNP, NNP एवं संवृद्धि मापक",
        "indian_economy_development.macroeconomics_national_income.gdp_gnp_ndp_nnp_measurement",
        85
    ),
    (
        r'\b(inflation|consumer\s+price\s+index|cpi|wholesale\s+price\s+index|wpi|headline\s+inflation|core\s+inflation|deflation|stagflation|cost-push\s+inflation|demand-pull\s+inflation|base\s+effect)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Macroeconomics & National Income", "समष्टि अर्थशास्त्र एवं राष्ट्रीय आय",
        "Inflation Dynamics: CPI, WPI, Causes & Control Measures", "मुद्रास्फीति: CPI, WPI, कारण एवं नियंत्रण के उपाय",
        "indian_economy_development.macroeconomics_national_income.inflation_types_cpi_wpi_deflator",
        85
    ),
    (
        r'\b(fiscal\s+deficit|revenue\s+deficit|primary\s+deficit|frbm\s+act|fiscal\s+responsibility|union\s+budget|capital\s+expenditure|revenue\s+expenditure|capital\s+receipts|goods\s+and\s+services\s+tax|gst|direct\s+taxes?|indirect\s+taxes?|corporate\s+tax|cess\s+and\s+surcharge)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Public Finance, Taxation & Fiscal Policy", "लोक वित्त, कराधान एवं राजकोषीय नीति",
        "Union Budget, Deficits (Fiscal/Revenue) & Tax Reforms", "केंद्रीय बजट, घाटे (राजकोषीय/राजस्व) एवं कर सुधार",
        "indian_economy_development.public_finance_taxation_fiscal_policy.union_budget_revenue_capital_accounts",
        85
    ),
    (
        r'\b(reserve\s+bank\s+of\s+india|rbi|repo\s+rate|reverse\s+repo|cash\s+reserve\s+ratio|crr|statutory\s+liquidity\s+ratio|slr|open\s+market\s+operations|omo|monetary\s+policy\s+committee|mpc|marginal\s+standing\s+facility|msf|bank\s+rate|money\s+supply|m1\s+and\s+m3|high\s+powered\s+money|priority\s+sector\s+lending|psl|npa|non-performing\s+assets|insolvency\s+and\s+bankruptcy\s+code|ibc)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Monetary Policy, Banking & Financial Markets", "मौद्रिक नीति, बैंकिंग एवं वित्तीय बाजार",
        "Monetary Policy & RBI Tools: Repo, CRR, SLR & Liquidity", "मौद्रिक नीति एवं RBI उपकरण: रेपो, CRR, SLR एवं तरलता",
        "indian_economy_development.monetary_policy_banking_financial_markets.monetary_policy_framework_rbi_instruments",
        85
    ),
    (
        r'\b(balance\s+of\s+payments|bop|current\s+account\s+deficit|cad|capital\s+account|foreign\s+exchange\s+reserves|forex|foreign\s+direct\s+investment|fdi|foreign\s+portfolio\s+investment|fpi|exchange\s+rate|depreciation\s+of\s+rupee|devaluation|world\s+trade\s+organization|wto|tariffs?|imf|special\s+drawing\s+rights|sdr|world\s+bank)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "External Sector, Balance of Payments & Trade", "विदेश क्षेत्र, भुगतान संतुलन एवं व्यापार",
        "Balance of Payments (BoP), Forex Reserves & Foreign Trade", "भुगतान संतुलन (BoP), विदेशी मुद्रा भंडार एवं विदेश व्यापार",
        "indian_economy_development.external_sector_balance_of_payments_trade.balance_of_payments_current_capital_account",
        85
    ),
    (
        r'\b(minimum\s+support\s+price|msp|cpcp|procurement\s+price|food\s+corporation\s+of\s+india|fci|public\s+distribution\s+system|pds|national\s+food\s+security\s+act|nfsa|pm-kisan|crop\s+insurance|pmfby|kharif\s+crops?|rabi\s+crops?|zaid|green\s+revolution|white\s+revolution)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Agriculture, Food Security & Rural Economy", "कृषि, खाद्य सुरक्षा एवं ग्रामीण अर्थव्यवस्था",
        "Agricultural Pricing: MSP, Procurement & Food Security", "कृषि मूल्य निर्धारण: MSP, अधिप्राप्ति एवं खाद्य सुरक्षा",
        "indian_economy_development.agriculture_food_security_rural_economy.agricultural_pricing_msp_cpcp_subsidies",
        85
    ),
    (
        r'\b(poverty\s+line|tendulkar\s+committee|rangarajan\s+committee|unemployment\s+rate|disguised\s+unemployment|structural\s+unemployment|niti\s+aayog|five\s+year\s+plans?|planning\s+commission|disinvestment|public\s+sector\s+enterprises|psu|msme|make\s+in\s+india|production\s+linked\s+incentive|pli\s+scheme)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Planning, Inclusive Growth & Industry", "योजना, समावेशी विकास एवं उद्योग",
        "Poverty, Unemployment, NITI Aayog & Industrial Policies", "गरीबी, बेरोजगारी, नीति आयोग एवं औद्योगिक नीतियां",
        "indian_economy_development.planning_inclusive_growth_sustainable_development.poverty_estimation_tendulkar_rangarajan",
        85
    ),

    # -------------------------------------------------------------
    # 8. ENVIRONMENT, ECOLOGY & DISASTER MANAGEMENT
    # -------------------------------------------------------------
    (
        r'\b(national\s+park|wildlife\s+sanctuary|biosphere\s+reserve|tiger\s+reserve|project\s+tiger|project\s+elephant|ramsar\s+site|ramsar\s+convention|wetlands?|iucn\s+red\s+list|critically\s+endangered|endangered\s+species|vulnerable\s+species|endemic\s+species|in-situ\s+conservation|ex-situ\s+conservation|biodiversity\s+hotspot)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Biodiversity & Wildlife Conservation", "जैव विविधता एवं वन्यजीव संरक्षण",
        "Protected Areas: National Parks, Sanctuaries & IUCN Status", "संरक्षित क्षेत्र: राष्ट्रीय उद्यान, अभयारण्य एवं IUCN स्थिति",
        "environment_ecology_disaster_management.biodiversity_wildlife_conservation.in-situ_conservation_national_parks_sanctuaries",
        85
    ),
    (
        r'\b(ecosystem|food\s+chain|food\s+web|trophic\s+level|ecological\s+pyramid|10%\s+law|biomagnification|bioaccumulation|eutrophication|ecological\s+succession|pioneer\s+species|climax\s+community|carrying\s+capacity|biome|estuary|coral\s+bleaching)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Ecology & Ecosystem Dynamics", "पारिस्थितिकी एवं पारिस्थितिकी तंत्र गतिकी",
        "Ecosystem Structure, Energy Flow & Food Web", "पारिस्थितिकी तंत्र संरचना, ऊर्जा प्रवाह एवं खाद्य जाल",
        "environment_ecology_disaster_management.ecology_ecosystem_dynamics.trophic_levels_energy_flow_10percent_law",
        85
    ),
    (
        r'\b(greenhouse\s+gases?|global\s+warming|climate\s+change|unfccc|kyoto\s+protocol|paris\s+agreement|cop\d+|ipcc|carbon\s+footprint|carbon\s+credit|carbon\s+sequestration|ozone\s+layer\s+depletion|montreal\s+protocol|kigali\s+amendment|cfcs|chlorofluorocarbons|methane\s+emissions)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Climate Change & Global Environmental Treaties", "जलवायु परिवर्तन एवं वैश्विक पर्यावरण समझौते",
        "Climate Change, Global Warming & Multilateral Conventions", "जलवायु परिवर्तन, ग्लोबल वार्मिंग एवं बहुपक्षीय सम्मेलन",
        "environment_ecology_disaster_management.climate_change_global_environmental_treaties.unfccc_kyoto_protocol_paris_agreement",
        85
    ),
    (
        r'\b(air\s+pollution|smog|pm2\.5|pm10|acid\s+rain|water\s+pollution|biochemical\s+oxygen\s+demand|bod|chemical\s+oxygen\s+demand|cod|e-waste|electronic\s+waste|single-use\s+plastic|solid\s+waste\s+management|national\s+green\s+tribunal|ngt|central\s+pollution\s+control\s+board|cpcb)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Environmental Pollution & Waste Management", "पर्यावरण प्रदूषण एवं अपशिष्ट प्रबंधन",
        "Pollution Types, Air Quality & Waste Management", "प्रदूषण के प्रकार, वायु गुणवत्ता एवं अपशिष्ट प्रबंधन",
        "environment_ecology_disaster_management.environmental_pollution_waste_management.air_pollution_sources_pm25_smog_acid_rain",
        85
    ),
    (
        r'\b(disaster\s+management|ndma|ndrf|sendai\s+framework|hyogo\s+framework|landslides?|avalanche|tsunami\s+warning|drought\s+management|flood\s+forecasting)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Disaster Management & Risk Reduction", "आपदा प्रबंधन एवं जोखिम न्यूनीकरण",
        "Disaster Preparedness, Sendai Framework & Institutional Mechanism", "आपदा तैयारी, सेंडाई फ्रेमवर्क एवं संस्थागत तंत्र",
        "environment_ecology_disaster_management.disaster_management_risk_reduction.institutional_framework_ndma_act_2005",
        85
    ),

    # -------------------------------------------------------------
    # 9. INTERNATIONAL RELATIONS & GLOBAL BODIES
    # -------------------------------------------------------------
    (
        r'\b(united\s+nations|un\s+security\s+council|unsc|un\s+general\s+assembly|unga|international\s+court\s+of\s+justice|icj|unesco|who|unicef|unhcr|un\s+peacekeeping|un\s+charter)\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "International Organizations & Multilateral Fora", "अंतर्राष्ट्रीय संगठन एवं बहुपक्षीय मंच",
        "United Nations: Organs, Agencies & Reforms", "संयुक्त राष्ट्र: अंग, विशिष्ट एजेंसियां एवं सुधार",
        "international_relations_global_institutions.international_organizations_multilateral_fora.united_nations_structure_reform",
        85
    ),
    (
        r'\b(quad\s+grouping|brics|shanghai\s+cooperation\s+organisation|sco|g20\s+summit|g7\s+summit|asean|saarc|bimstec|north\s+atlantic\s+treaty\s+organisation|nato|european\s+union|iaea|opec)\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "International Organizations & Multilateral Fora", "अंतर्राष्ट्रीय संगठन एवं बहुपक्षीय मंच",
        "Regional & Global Groupings: G20, QUAD, BRICS, SCO, ASEAN", "क्षेत्रीय एवं वैश्विक समूह: G20, QUAD, BRICS, SCO, ASEAN",
        "international_relations_global_institutions.international_organizations_multilateral_fora.regional_groupings_brics_sco_asean_quad",
        85
    ),
    (
        r'\b(military\s+exercise|joint\s+exercise|malabar\s+exercise|varuna\s+exercise|yudh\s+abhyas|surya\s+kiran|sampriti|mitra\s+shakti|garuda\s+shakti|indra\s+exercise|nomadic\s+elephant|dharama\s+guardian)\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "Bilateral, Regional & Global Groupings", "द्विपक्षीय, क्षेत्रीय एवं वैश्विक समूह",
        "Bilateral Defence Cooperation & Joint Military Exercises", "द्विपक्षीय रक्षा सहयोग एवं संयुक्त सैन्य अभ्यास",
        "international_relations_global_institutions.bilateral_regional_global_groupings.major_powers_bilateral_relations",
        85
    ),

    # -------------------------------------------------------------
    # 10. SCIENCE & TECHNOLOGY (PHYSICS, CHEMISTRY, BIOLOGY, IT, SPACE)
    # -------------------------------------------------------------
    # IT, Computing & Telecommunications
    (
        r'\b(video\s+compression|audio\s+compression|codec|mpeg|jpeg|mp3|mp4|h\.264|h\.265|indeo|non-procedural\s+computer\s+language|programming\s+language|python|lisp|prolog|algorithm|binary\s+code|ram\s+and\s+rom|operating\s+system|cpu|microprocessor|cache\s+memory|compiler|interpreter|ipv4|ipv6|cloud\s+computing|artificial\s+intelligence|machine\s+learning|cyber\s+security|blockchain|quantum\s+computing)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Information Technology & Telecommunications", "सूचना प्रौद्योगिकी एवं दूरसंचार",
        "Computer Systems, Programming & IT Infrastructure", "कंप्यूटर प्रणालियाँ, प्रोग्रामिंग एवं IT अवसंरचना",
        "science_technology_defence.information_technology_telecommunications.computer_hardware_software_fundamentals",
        80
    ),
    # Space Tech
    (
        r'\b(isro|chandrayaan|mangalyaan|aditya-l1|gaganyaan|pslv|gslv|sslv|cryogenic\s+engine|geostationary\s+orbit|geosynchronous|low\s+earth\s+orbit|leo|lagrange\s+points?|james\s+webb|hubble\s+telescope|nasa|remote\s+sensing\s+satellite|navic|gps)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Space Technology", "अंतरिक्ष प्रौद्योगिकी",
        "Space Missions, Launch Vehicles & Satellites", "अंतरिक्ष अभियान, प्रक्षेपण यान एवं उपग्रह",
        "science_technology_defence.space_technology.satellite_communications_launch_vehicles",
        80
    ),
    # Physics - Optics & Light
    (
        r'\b(refraction|reflection|concave\s+lens|convex\s+lens|concave\s+mirror|convex\s+mirror|focal\s+length|power\s+of\s+a\s+lens|dioptre|diopter|total\s+internal\s+reflection|dispersion\s+of\s+light|prism|rainbow|optical\s+fibre|wavelength|electromagnetic\s+spectrum|photon|laser|myopia|hypermetropia|presbyopia|astigmatism)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Optics, Wave Optics & Light Phenomena", "प्रकाशिकी, तरंग प्रकाशिकी एवं प्रकाश घटनाएं",
        "science_technology_defence.applied_fundamental_sciences.applied_physics",
        80
    ),
    # Physics - Electricity & Magnetism
    (
        r'\b(electric\s+current|resistance|resistivity|ohm\'?s\s+law|potential\s+difference|volt|ampere|resistors?\s+in\s+series|resistors?\s+in\s+parallel|magnetic\s+field|electromagnetic\s+induction|faraday\'?s\s+law|electric\s+motor|electric\s+generator|transformer|alternating\s+current|direct\s+current|fuse\s+wire|superconductor|semiconductor|diode|transistor)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Electromagnetism, Electricity & Circuits", "विद्युत चुंबकत्व, विद्युत एवं परिपथ",
        "science_technology_defence.applied_fundamental_sciences.applied_physics",
        80
    ),
    # Physics - Mechanics & Gravitation
    (
        r'\b(gravitational\s+constant|acceleration\s+due\s+to\s+gravity|escape\s+velocity|kepler\'?s\s+laws?|kinetic\s+energy|potential\s+energy|conservation\s+of\s+momentum|newton\'?s\s+laws?\s+of\s+motion|inertia|frictional\s+force|centripetal\s+force|centrifugal\s+force|torque|bernoulli\'?s\s+principle|pascal\'?s\s+law|buoyancy|archimedes\s+principle|viscosity|surface\s+tension|capillarity)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Mechanics, Gravitation & Laws of Motion", "यांत्रिकी, गुरुत्वाकर्षण एवं गति के नियम",
        "science_technology_defence.applied_fundamental_sciences.applied_physics",
        80
    ),
    # Physics - Sound & Waves
    (
        r'\b(sound\s+waves?|longitudinal\s+wave|transverse\s+wave|frequency|amplitude|ultrasound|sonar|infrasonic|ultrasonic|resonance|doppler\s+effect|speed\s+of\s+sound|decibel|pitch\s+of\s+sound|loudness)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Acoustics & Wave Motion", "ध्वनिकी एवं तरंग गति",
        "science_technology_defence.applied_fundamental_sciences.applied_physics",
        80
    ),
    # Physics - Heat & Thermodynamics
    (
        r'\b(thermodynamics|latent\s+heat|specific\s+heat|thermal\s+conductivity|conduction|convection|radiation|celsius|fahrenheit|kelvin|boiling\s+point|melting\s+point|calorimetry|anomalous\s+expansion\s+of\s+water)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Thermal Physics & Thermodynamics", "ऊष्मीय भौतिकी एवं ऊष्मागतिकी",
        "science_technology_defence.applied_fundamental_sciences.applied_physics",
        80
    ),
    # Physics - Nuclear & Modern Physics
    (
        r'\b(radioactivity|nuclear\s+fission|nuclear\s+fusion|half-life|alpha\s+particles?|beta\s+particles?|gamma\s+rays?|nuclear\s+reactor|moderator|control\s+rods|heavy\s+water|uranium|thorium|plutonium|isotopes?|isobars?|isotones?)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Nuclear Physics & Radioactivity", "नाभिकीय भौतिकी एवं रेडियोधर्मिता",
        "science_technology_defence.applied_fundamental_sciences.applied_physics",
        80
    ),
    # Chemistry - Acids, Bases & Salts
    (
        r'\b(acid|base|alkali|ph\s+value|ph\s+scale|litmus\s+paper|neutralization\s+reaction|hydrochloric\s+acid|sulfuric\s+acid|sulphuric\s+acid|nitric\s+acid|acetic\s+acid|baking\s+soda|washing\s+soda|bleaching\s+powder|plaster\s+of\s+paris|buffer\s+solution)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Acids, Bases, Salts & pH Scale", "अम्ल, क्षार, लवण एवं pH पैमाना",
        "science_technology_defence.applied_fundamental_sciences.applied_chemistry",
        80
    ),
    # Chemistry - Periodic Table & Atomic Structure
    (
        r'\b(periodic\s+table|mendeleev|atomic\s+number|mass\s+number|valency|noble\s+gases?|inert\s+gas|halogens?|alkali\s+metals?|alkaline\s+earth|electronegativity|ionization\s+energy|electron\s+affinity|chemical\s+bonding|covalent\s+bond|ionic\s+bond|hydrogen\s+bonding)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Periodic Classification & Atomic Structure", "आवर्त वर्गीकरण एवं परमाणु संरचना",
        "science_technology_defence.applied_fundamental_sciences.applied_chemistry",
        80
    ),
    # Chemistry - Metals, Non-metals, Alloys & Everyday Chemistry
    (
        r'\b(alloys?|bronze|brass|solder|duralumin|stainless\s+steel|amalgam|corrosion|galvanization|rusting\s+of\s+iron|bauxite|haematite|calcination|roasting|electrolysis|cathode|anode|redox\s+reaction|polymers?|synthetic\s+fibres?|nylon|rayon|bakelite|teflon|polyvinyl\s+chloride|pvc|fertilizers?|urea|soaps?\s+and\s+detergents?)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Metals, Alloys & Everyday Chemistry Applications", "धातुएं, मिश्रधातुएं एवं दैनिक जीवन में रसायन",
        "science_technology_defence.applied_fundamental_sciences.applied_chemistry",
        80
    ),
    # Chemistry - Organic Chemistry & Carbon
    (
        r'\b(organic\s+compounds?|hydrocarbons?|alkanes?|alkenes?|alkynes?|methane|ethane|propane|butane|benzene|ethanol|ethyl\s+alcohol|methanol|formaldehyde|allotropes\s+of\s+carbon|diamond|graphite|fullerene|graphene)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Organic Chemistry & Carbon Compounds", "कार्बनिक रसायन एवं कार्बन यौगिक",
        "science_technology_defence.applied_fundamental_sciences.applied_chemistry",
        80
    ),
    # Biology - Cell Biology & Cytology
    (
        r'\b(mitochondria|chloroplast|ribosomes?|endoplasmic\s+reticulum|golgi\s+apparatus|lysosomes?|cell\s+wall|cell\s+membrane|plasma\s+membrane|nucleus\s+of\s+cell|mitosis|meiosis|chromosomes?|dna\s+and\s+rna|prokaryotic|eukaryotic|cell\s+division)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Cell Biology & Cytology", "कोशिका विज्ञान एवं कोशिका संरचना",
        "science_technology_defence.applied_fundamental_sciences.life_sciences_biology",
        80
    ),
    # Biology - Plant Physiology & Botany
    (
        r'\b(photosynthesis|respiration\s+in\s+plants|transpiration|xylem|phloem|chlorophyll|stomata|plant\s+hormones?|auxin|gibberellin|cytokinin|abscisic\s+acid|ethylene|phototropism|pollination|fertilization\s+in\s+plants|gymnosperms|angiosperms|bryophytes|pteridophytes)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Plant Physiology & Botany", "पादप शरीर क्रिया विज्ञान एवं वनस्पति विज्ञान",
        "science_technology_defence.applied_fundamental_sciences.life_sciences_biology",
        80
    ),
    # Biology - Human Physiology & Health
    (
        r'\b(digestive\s+system|circulatory\s+system|respiratory\s+system|nervous\s+system|endocrine\s+glands?|hormones?|insulin|thyroid|pituitary|adrenal|enzymes?|pepsin|trypsin|amylase|hemoglobin|blood\s+groups?|abo\s+system|rh\s+factor|arteries\s+and\s+veins|heart\s+valves?|kidneys?|nephrons?|dialysis|neurons?|synapse|reflex\s+action)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Human Physiology & Organ Systems", "मानव शरीर क्रिया विज्ञान एवं अंग प्रणालियाँ",
        "science_technology_defence.applied_fundamental_sciences.life_sciences_biology",
        80
    ),
    # Biology - Human Health, Diseases & Genetics
    (
        r'\b(bacterial\s+disease|viral\s+disease|fungal\s+disease|protozoan|pathogen|tuberculosis|malaria|dengue|cholera|typhoid|aids|hiv|covid|vaccines?|antibiotics?|antibodies?|antigens?|immune\s+system|vitamins?\s+deficiency|scurvy|rickets|beriberi|night\s+blindness|anaemia|protein\s+deficiency|kwashiorkor|marasmus|genetics|mendel\'?s\s+laws?|heredity|mutation|crispr|gene\s+therapy|cloning|recombinant\s+dna)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Biotechnology & Health Sciences", "जैव प्रौद्योगिकी एवं स्वास्थ्य विज्ञान",
        "Human Health, Diseases, Nutrition & Genetics", "मानव स्वास्थ्य, रोग, पोषण एवं आनुवंशिकी",
        "science_technology_defence.biotechnology_health_sciences.biotechnology_applications_human_health",
        80
    ),
]

def classify_question(q):
    text = (q.get('question_english', '') + ' ' + 
            q.get('explanation_english', '') + ' ' + 
            q.get('option_a_english', '') + ' ' + 
            q.get('option_b_english', '') + ' ' + 
            q.get('option_c_english', '') + ' ' + 
            q.get('option_d_english', '')).lower()
    
    # Iterate through rules sorted by priority descending
    for pattern, subj, subj_hi, dom, dom_hi, sub, sub_hi, node_id, prio in sorted(RULES, key=lambda x: -x[8]):
        if re.search(pattern, text, re.IGNORECASE):
            return {
                "subject": subj,
                "subject_hindi": subj_hi,
                "domain": dom,
                "domain_hindi": dom_hi,
                "sub_topic": sub,
                "sub_topic_hindi": sub_hi,
                "node_id": node_id,
                "tags": [
                    "PYQ",
                    f"UPSC CAPF {q.get('year')}",
                    "Paper 1",
                    subj.split(',')[0].strip(),
                    dom.split('&')[0].strip()
                ]
            }

    # Fallback to general science/studies if no pattern matched
    return {
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Applied & Fundamental Sciences",
        "domain_hindi": "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "sub_topic": "General Scientific Principles & Everyday Applications",
        "sub_topic_hindi": "सामान्य वैज्ञानिक सिद्धांत एवं दैनिक अनुप्रयोग",
        "node_id": "science_technology_defence.applied_fundamental_sciences.applied_physics",
        "tags": [
            "PYQ",
            f"UPSC CAPF {q.get('year')}",
            "Paper 1",
            "Science",
            "Applied Sciences"
        ]
    }

def process_all_files():
    import glob
    files = sorted(glob.glob('src/data/upsc_capf/*.json'))
    print(f"Found {len(files)} files to process.")
    
    total_processed = 0
    subject_counts = {}
    fallback_count = 0
    
    for file_path in files:
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
            
        for q in data:
            c = classify_question(q)
            q['node_id'] = c['node_id']
            q['subject'] = c['subject']
            q['subject_hindi'] = c['subject_hindi']
            q['domain'] = c['domain']
            q['domain_hindi'] = c['domain_hindi']
            q['sub_topic'] = c['sub_topic']
            q['sub_topic_hindi'] = c['sub_topic_hindi']
            q['tags'] = c['tags']
            
            s = c['subject']
            subject_counts[s] = subject_counts.get(s, 0) + 1
            if "General Scientific Principles & Everyday Applications" in c['sub_topic']:
                fallback_count += 1
            total_processed += 1
            
        with open(file_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
            
    print(f"\nProcessing Complete!")
    print(f"Total questions processed: {total_processed}")
    print(f"Fallback questions: {fallback_count} ({fallback_count/total_processed*100:.1f}%)")
    print("\nSubject Breakdown:")
    for s, count in sorted(subject_counts.items(), key=lambda x: -x[1]):
        print(f"  {s}: {count} ({count/total_processed*100:.1f}%)")

if __name__ == "__main__":
    process_all_files()
