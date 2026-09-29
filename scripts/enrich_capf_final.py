# -*- coding: utf-8 -*-
"""
Universal Multi-Tiered Classification & Enrichment Engine for UPSC CAPF (AC) Paper 1
Covers 100% of 1,625 questions across 2014-2026.
"""

import os
import sys
import json
import re
import glob

sys.stdout.reconfigure(encoding='utf-8')

# Stage 1: Specific High-Precision Rules
SPECIFIC_RULES = [
    # --- 1. GMA & QUANT ---
    (
        r'\b(percentage\s+of\s+employees|earning\s+less\s+than|earning\s+between|frequency\s+distribution|independent\s+businesses\s+with\s+equal\s+amounts|two\s+boxes|box\s+i\s+contains|cards?\s+in\s+a\s+box|compared\s+their\s+marks|length\s+of\s+a\s+rectangle\s+is\s+increased|width\s+have\s+to\s+be\s+decreased|keep\s+area\s+constant|premises\s*:|all\s+\w+\s+are\s+\w+\.\s+no\s+\w+\s+are|sequence\s*:\s*\d+,\s*\d+|a\(n\)\s*=)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Arithmetic, Logic, Puzzles & Mensuration", "अंकगणित, तर्क, पहेलियां एवं क्षेत्रमिति",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning",
        96
    ),
    (
        r'\b(speed\s+of\s+the\s+train|train\s+\d+|crosses\s+a\s+platform|running\s+at\s+a\s+speed|km\/h|m\/s|upstream|downstream|boat\s+in\s+still\s+water|relative\s+speed|closing\s+speed|runner\'?s\s+average\s+speed|runs\s+\d+\s+km)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Speed, Time & Distance, Trains, Boats & Streams", "गति, समय एवं दूरी, रेलगाड़ी, नाव एवं धारा",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_unit_conversions",
        100
    ),
    (
        r'\b(time\s+and\s+work|can\s+complete\s+a\s+piece\s+of\s+work|can\s+finish\s+a\s+work\s+in|pipes?\s+and\s+cisterns?|filling\s+pipe|emptying\s+pipe|steps?\s+in\s+a\s+temple|periods?\s+of\s+equal\s+duration|class\s+starts\s+at|time\s+taken\s+by\s+[a-z]\s+and\s+[a-z])\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Time & Work, Pipes & Cisterns, Arithmetic Workflows", "समय एवं कार्य, नल एवं टंकी, अंकगणितीय कार्य",
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
        r'\b(ratio\s+of\s+(the\s+)?ages?|present\s+age\s+of|years\s+ago\s+the\s+ratio|sum\s+of\s+their\s+ages|partnership|invested\s+in\s+the\s+ratio|in\s+a\s+family,\s+the\s+age\s+of|total\s+age)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Ratio, Proportion, Partnership & Ages", "अनुपात, समानुपात, साझेदारी एवं आयु",
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
        r'\b(remainder\s+when|divisible\s+by\s+\d+|unit\s+digit|number\s+of\s+zeros|hcf\s+and\s+lcm|greatest\s+common\s+divisor|least\s+common\s+multiple|prime\s+factors?|consecutive\s+(odd|even)?\s*integers?|three\s+times\s+of\s+the\s+first|two-digit\s+number|sum\s+of\s+the\s+digits|divisible\s+by\s+x|divisors?\s+of|positive\s+integer\s+such\s+that|difference\s+of\s+the\s+sum\s+of\s+cubes|sum\s+of\s+cubes\s+of\s+first|first\s+ten\s+natural\s+numbers|geometric\s+progression|arithmetic\s+progression)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Number Systems, Divisibility & Progressions", "संख्या पद्धति, विभाज्यता एवं श्रेणियाँ",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules",
        95
    ),
    (
        r'\b(radius\s+of\s+a\s+cylinder|volume\s+of\s+a\s+cone|surface\s+area\s+of\s+a\s+sphere|perimeter\s+of\s+a\s+triangle|hypotenuse|area\s+of\s+a\s+rhombus|dimensions\s+of\s+a\s+cuboid|geometric\s+area-model|side\s+\(a\s*\+\s*b\)|area\s+of\s+a\s+sector|sector\s+of\s+a\s+circle|spherical\s+ball\s+made\s+of\s+iron|two\s+new\s+balls\s+are\s+made|radii\s+are\s+in\s+ratio)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "2D & 3D Mensuration & Geometry", "क्षेत्रमिति एवं ज्यामिति",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons",
        95
    ),
    (
        r'\b(how\s+many\s+squares\s+are\s+there|how\s+many\s+triangles\s+are\s+there|grid\s+of\s+unit\s+squares|counting\s+of\s+figures|unfolded\s+cube|painted\s+faces\s+of\s+a\s+cube|dice\s+opposite\s+face|water\s+image|mirror\s+image|appear\s+same\s+when\s+looked\s+in\s+a\s+mirror|symmetric\s+about\s+a\s+vertical\s+axis)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Visual Reasoning, Counting Figures, Cubes & Dice", "अशाब्दिक तर्कशक्ति, आकृतियों की गणना, घन एवं पासा",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition",
        95
    ),
    (
        r'\b(figures?\s+correctly\s+represents\s+the\s+relations|relations\s+between\s+jupiter\s+and\s+mars|venn\s+diagram|sets?\s+do\s+not\s+overlap)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Venn Diagrams & Set Relations", "वेन आरेख एवं समुच्चय संबंध",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_deductive_reasoning.venn_diagrams_two_three_sets",
        95
    ),
    (
        r'\b(next\s+number\s+in\s+the\s+series|missing\s+term|sequence\s+is\s+given|next\s+term\s+in\s+the\s+sequence|missing\s+number\s+in\s+the\s+table|alphabetical\s+series|alternate\s+letter\s+of\s+english\s+alphabet|letters?\s+of\s+english\s+alphabet|letters?\s+for\s+question\s+marks?|series\s+are\s*:\s*[a-z]\s+[a-z]|missing\s+number\s+in\s+the\s+circle|diagrams?\s*:\s*which\s+one\s+of\s+the\s+following\s+is\s+the\s+missing)\b',
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
        r'\b(ranks?\s+\d+th\s+from\s+the\s+top|tallest\s+among\s+them|shortest|sitting\s+around\s+a\s+circular\s+table|seating\s+arrangement|six\s+books\s+are\s+kept|kept\s+one\s+above\s+the\s+other|arranged\s+in\s+a\s+row|standing\s+in\s+a\s+queue|six\s+roads\s+lead\s+to\s+a\s+village|storm\s+blocks|floods?\s+affect)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Order, Ranking, Stacking & Arrangement Puzzles", "क्रम, रैंकिंग, स्टैकिंग एवं व्यवस्था पहेलियां",
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
        r'\b(pie\s+(chart|graph)|bar\s+(chart|graph)|line\s+graph|histogram|table\s+(given\s+below|shows|depicts)|surplus\s+of\s+rice|demand\s+of\s+rice|supply\s+of\s+rice|average\s+surplus|in\s+million\s+ton|depicting\s+budget\s+of\s+a\s+family)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Data Interpretation: Charts, Tables & Graphs", "आंकड़ा व्याख्या: चार्ट, तालिका एवं ग्राफ",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency",
        95
    ),

    (
        r'\b(therigatha|theragatha|pali\s+canon|tripi[tṭ]aka|vinaya|sutta|abhidhamma|jataka|milinda\s+panha|dipavamsa|mahavamsa|mauza|revenue\s+village|patta|qabuliyat)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Ancient Buddhist Canon & Medieval Revenue Terminology", "प्राचीन बौद्ध ग्रंथ एवं मध्यकालीन राजस्व शब्दावली",
        "history.ancient_india",
        88
    ),
    (
        r'\b(minor\s+plate|major\s+plate|tectonic\s+plates?|antarctica\s+plate|nazca|cocos|juan\s+de\s+fuca|buttress\s+roots|stilt\s+roots|pneumatophores|dharwar|cuddapah|vindhyan|gondwana|geological\s+systems?\s+in\s+india|leading\s+producer\s+of\s+petroleum|bombay\s+high)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Physical Geography & Earth Systems", "भौतिक भूगोल एवं भू-प्रणालियाँ",
        "Geomorphology, Stratigraphy, Forestry & Resources", "भू-आकृतिक विज्ञान, स्तरिकी, वानिकी एवं संसाधन",
        "geography_earth_systems.physical_geography_earth_systems",
        86
    ),
    (
        r'\b(sublimation|change\s+of\s+state\s+directly\s+from\s+solid\s+to\s+gas|states?\s+of\s+matter|hemocyanin|metalloprotein|respiratory\s+pigment|blood\s+of\s+invertebrates)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Physical Chemistry & Comparative Invertebrate Physiology", "भौतिक रसायन एवं तुलनात्मक अकशेरुकी शरीर क्रिया विज्ञान",
        "science_technology_defence.applied_fundamental_sciences",
        85
    ),
    (
        r'\b(political\s+legitimacy|political\s+culture|parochial\s+political\s+culture|almond\s+and\s+verba|max\s+weber|charismatic\s+authority)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Salient Features, Amendments & Basic Structure", "प्रमुख विशेषताएं, संशोधन एवं मूल संरचना",
        "Political Theory, Legitimacy & Political Culture", "राजनीतिक सिद्धांत, वैधता एवं राजनीतिक संस्कृति",
        "indian_polity_constitution_governance.salient_features_amendments_basic_structure",
        85
    ),
    (
        r'\b(industrial\s+corridors?|delhi-mumbai\s+industrial|dmic)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Industrial Policy, Manufacturing & Services", "औद्योगिक नीति, विनिर्माण एवं सेवाएं",
        "Industrial Corridors & Manufacturing Infrastructure", "औद्योगिक गलियारे एवं विनिर्माण अवसंरचना",
        "indian_economy_development.industrial_policy_manufacturing_services",
        85
    ),
    (
        r'\b(operation\s+sangaris|french\s+military|quality\s+of\s+living\s+survey|mercer\s+survey|habitable\s+city)\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "Global Institutions, Agreements & Treaties", "वैश्विक संस्थाएं, समझौते एवं संधियां",
        "Global Affairs, Peacekeeping & Living Standards", "वैश्विक घटनाक्रम, शांति सेना एवं जीवन स्तर",
        "international_relations_global_institutions.global_institutions_agreements_treaties",
        85
    ),
    (
        r'\b(sudarsan\s+pattnaik|sand\s+artist|duleep\s+trophy|deodhar\s+trophy|vijay\s+hazare\s+trophy|athletics\s+championship)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Martial Arts, Traditional Sports & Indian Calendar Systems", "मार्शल आर्ट, पारंपरिक खेल एवं भारतीय कैलेंडर प्रणालियाँ",
        "Sports Tournaments, Athletics & Visual Artists", "खेल टूर्नामेंट, एथलेटिक्स एवं दृश्य कलाकार",
        "art_culture_heritage.martial_arts_traditional_sports_calendars",
        85
    ),
    (
        r'(brother\s+of\s+[a-z]|is\s+brother\s+of|sister\s+of|mother\s+of|father\s+of|blood\s+relation)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Blood Relations & Family Tree Analysis", "रक्त संबंध एवं पारिवारिक संबंध विश्लेषण",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.blood_relations_family_tree",
        100
    ),
    (
        r'(gamble\s+is\s+coded|how\s+is\s+flower\s+coded|coded\s+as\s+[a-z]+|is\s+coded\s+as|coding-decoding)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Coding-Decoding & Letter-Number Operations", "कोडिंग-डिकोडिंग एवं अक्षर-संख्या संक्रियाएं",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_letter_number_operations",
        100
    ),
    (
        r'(four\s+words\s+have\s+been\s+given|choose\s+the\s+odd\s+one\s+out|odd\s+one\s+out)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Analogy, Classification & Odd One Out", "सादृश्यता, वर्गीकरण एवं विसंगत चयन",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.classification_odd_one_out",
        100
    ),
    (
        r'(numerator\s+of\s+a\s+fraction|resultant\s+fraction|original\s+fraction)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Fractions, Decimals, Ratios & Percentages", "भिन्न, दशमलव, अनुपात एवं प्रतिशत",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.percentages_profit_loss",
        100
    ),
    (
        r'(2\[3\]4\s*=|3\[4\]6\s*=|4\[5\]7\s*=\?|\d+\[\d+\]\d+)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Mathematical Operations, Puzzles & Missing Number Logic", "गणितीय संक्रियाएं, पहेलियां एवं लुप्त संख्या तर्क",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.mathematical_operations_symbol_substitution",
        100
    ),
    (
        r'(candidate\s+attempts\s+20\s+questions|test\s+consists\s+of\s+25\s+mcqs|questions\s+were\s+left\s+unattempted|marks\s+are\s+awarded\s+for\s+each\s+correct|correct\s+answer\s+gives\s+\+4)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Linear Equations, Scoring Logic & Mathematical Word Problems", "रैखिक समीकरण, अंकन तर्क एवं गणितीय समस्या समाधान",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.algebra_linear_quadratic_equations",
        100
    ),
    (
        r'(wire\s+of\s+length\s+6\s*m|radius\s+is\s+reduced\s+by\s+20%|value\s+of\s+increase\s+in\s+its\s+length)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Mensuration & Geometry: Volume & Dimensions", "क्षेत्रमिति एवं ज्यामिति: आयतन एवं विमाएं",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.mensuration_2d_3d",
        100
    ),
    (
        r'(smallest\s+positive\s+integer\s+which,\s+when\s+divided|divided\s+by\s+9\s+and\s+12|value\s+of\s+a\s*-\s*b)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Number Systems, LCM, HCF & Remainders", "संख्या पद्धति, ल.स., म.स. एवं शेषफल",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.number_systems_divisibility_remainders",
        100
    ),
    (
        r'(day\s+before\s+yesterday\s+was|when\s+will\s+saturday\s+be)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Calendar Reasoning & Day Calculations", "कैलेंडर तर्क एवं दिन गणना",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.calendar_odd_days_leap_years_repetition",
        100
    ),
    (
        r'(complete\s+a\s+work\s+together\s+in|b\s+alone\s+can\s+complete\s+the\s+work|in\s+how\s+many\s+days\s+can\s+a\s+alone\s+finish)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Time and Work & Unitary Method", "कार्य और समय एवं ऐकिक नियम",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.time_work_pipes_cisterns",
        100
    ),
    (
        r'(bc\s*\+\s*1\s*\)\s*\/\s*\(\s*abc\s*\+\s*a\s*\+\s*c|three\s+natural\s+numbers\s+a,\s*b\s+and\s+c)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Algebra, Continued Fractions & Number Properties", "बीजगणित, सतत भिन्न एवं संख्या गुणधर्म",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.quantitative_aptitude_numerical_ability.algebra_linear_quadratic_equations",
        100
    ),
    (
        r'(swarna\s+jayanti\s+shahari\s+rozgar|sampoorna\s+grameen\s+rozgar|swarna\s+jayanti\s+gram\s+swarozgar|integrated\s+rural\s+development\s+programme)',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Poverty, Inclusion, Demographics & Social Sector Initiatives", "गरीबी, समावेशन, जनसांख्यिकी एवं सामाजिक क्षेत्र की पहल",
        "Rural & Urban Employment Generation and Poverty Alleviation Schemes", "ग्रामीण एवं शहरी रोजगार सृजन तथा गरीबी उन्मूलन योजनाएं",
        "indian_economy_development.poverty_inclusion_demographics_social_sector_initiatives",
        100
    ),
    (
        r'(brandon\s+hall\s+group|excellence\s+in\s+technology\s+award)',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Industrial Policy, Manufacturing & Services", "औद्योगिक नीति, विनिर्माण एवं सेवाएं",
        "Public Sector Undertakings (PSUs) & Corporate Excellence", "सार्वजनिक क्षेत्र के उपक्रम (PSU) एवं कॉर्पोरेट उत्कृष्टता",
        "indian_economy_development.industrial_policy_manufacturing_services",
        100
    ),
    (
        r'(institutes?\s+was\s+established\s+first|indian\s+institute\s+of\s+technology,\s+delhi|indian\s+petroleum\s+institute,\s+dehradun|indian\s+institute\s+of\s+management,\s+ahmedabad)',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Premier Technical & Management Research Institutions of India", "भारत के प्रमुख तकनीकी एवं प्रबंधन अनुसंधान संस्थान",
        "science_technology_defence.applied_fundamental_sciences",
        100
    ),
    (
        r'(just-in-time\s+fund\s+release|reduce\s+idle\s+balance|major\s+public\s+financial\s+management\s+system\s+reform)',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Fiscal Policy, Taxation & Public Finance", "राजकोषीय नीति, कराधान एवं लोक वित्त",
        "Public Financial Management System & Expenditure Efficiency Reforms", "सार्वजनिक वित्तीय प्रबंधन प्रणाली एवं व्यय दक्षता सुधार",
        "indian_economy_development.fiscal_policy_taxation_public_finance",
        100
    ),
    (
        r'(ports?\s+in\s+india|12\s+major\s+ports\s+in\s+operation|state\s+maritime\s+boards)',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Economic & Human Geography", "आर्थिक एवं मानव भूगोल",
        "Maritime Transport, Sea Ports & Navigational Infrastructure", "समुद्री परिवहन, बंदरगाह एवं नौवहन अवसंरचना",
        "geography_earth_systems.economic_human_geography",
        100
    ),
    (
        r'(oxidation\s+numbers?\s+of\s+chlor|cl2o7,\s*cl2o,\s*clo3|oxidation\s+state\s+of\s+chlor)',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Inorganic Chemistry: Oxidation Numbers & Redox Chemistry", "अकार्बनिक रसायन: ऑक्सीकरण संख्याएं एवं रेडॉक्स रसायन",
        "science_technology_defence.applied_fundamental_sciences",
        100
    ),
    (
        r'(text\s+alignments?\s+are\s+there\s+in\s+microsoft\s+word|microsoft\s+word)',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Information Technology: Office Productivity Software & Word Processing", "सूचना प्रौद्योगिकी: कार्यालय सॉफ्टवेयर एवं वर्ड प्रोसेसिंग",
        "science_technology_defence.applied_fundamental_sciences",
        100
    ),
    (
        r'(fair\s+coin\s+is\s+tossed|x\s*\+\s*1\/x\s*=\s*\d+|x\^\d+|mean\s+of\s+a,\s*b\s+and\s+c|\(bc\s*\+\s*1\)\/\(abc|a\/b\s*=\s*\d+|sum\s+of\s+two\s+numbers\s+is|hcf\s+is\s+\d+|a\^\(2x\)\s*=|person\s+[a-z]\s+has\s+to\s+make\s+a\s+payment|coins?\s+and|three\s+rooms|occupancy\s+capacity|encoded\s+as|angle\s+made\s+by\s+the\s+hour\s+and\s+the\s+minute\s+hands|smaller\s+angle\s+made|can\s+finish\s+a\s+job\s+in|tree\s+is\s+at\s+present|grows\s+1\/\d+th|first\s+(january|february|march|april|may|june|july|august|september|october|november|december)\s+of|how\s+much\s+water\s+is\s+to\s+be\s+added|mixture\s+contains\s+\d+%|goat\s+is\s+tied|sixty-four\s+cubes|combined\s+to\s+form\s+a\s+cube|sector\s+having\s+area\s+one-sixth|angle\s+\(in\s+degrees\)\s+made\s+by\s+a\s+sector|premises\s*:|all\s+apples\s+are\s+golden)',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "Arithmetic, Algebra, Probability, Geometry & Logic Puzzles", "अंकगणित, बीजगणित, प्रायिकता, ज्यामिति एवं तार्किक पहेलियां",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning",
        99
    ),
    (
        r'\b(nebular\s+hypothesis|origin\s+of\s+the\s+earth|arabian\s+peninsula|trans-siberian\s+railway|change\s+in\s+seasons\s+on\s+earth|pull\s+factor\s+for\s+migration|jhum\s+cultivation|shifting\s+cultivation|seaports?\s+in\s+india|deepest,\s+inland\s+and\s+protected\s+port|visakhapatnam\s+port|major\s+ports?\s+in\s+india|geologic\s+time\s+periods?|mass\s+movements|debris\s+avalanche|great\s+circle|capital\s+cities\s+of\s+the\s+union\s+territories|andaman\s+and\s+nicobar|sharavathi|periyar|mandovi|dhadhar|west\s+flowing\s+rivers?)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Physical Geography & Earth Systems", "भौतिक भूगोल एवं भू-प्रणालियाँ",
        "Earth Systems, Climatology, Drainage & Transport Geography", "भू-प्रणालियाँ, जलवायु विज्ञान, अपवाह एवं परिवहन भूगोल",
        "geography_earth_systems.physical_geography_earth_systems",
        88
    ),
    (
        r'\b(tilakmanjari|dhanapala|saka\s+era|kalachuri\s+era|vikrama\s+era|milano\s+cortina|winter\s+olympic|ipl\s+cricket|saracenic|indo-saracenic\s+architecture|national\s+council\s+of\s+science\s+museums|ncsm)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Architecture & Sculpture", "भारतीय वास्तुकला एवं मूर्तिकला",
        "Indian Architecture, Literature, Calendar Eras & Global Sports", "भारतीय वास्तुकला, साहित्य, संवत कैलेंडर एवं वैश्विक खेल",
        "art_culture_heritage.indian_architecture_sculpture",
        88
    ),
    (
        r'\b(pataliputra|kumrahar|bulandibagh|ashokan\s+inscriptions?\s+in\s+afghanistan|junagarh\s+inscription|rudradaman|sudarshana\s+lake|muddiman\s+committee|government\s+of\s+india\s+act,\s+1919|bhoodan\s+movement|vinoba\s+bhave|gramdan|chaitanya\s+tradition|gaudiya\s+vaishnavism|nadia)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Ancient Inscriptions, Dynasties, Socio-Religious & Post-Independence Movements", "प्राचीन शिलालेख, राजवंश, सामाजिक-धार्मिक एवं स्वतंत्रता पश्चात आंदोलन",
        "history.ancient_india",
        88
    ),
    (
        r'\b(kothari\s+commission|aitchison\s+commission|islington\s+commission|lee\s+commission|public\s+services\s+in\s+india|civil\s+services\s+in\s+india|official\s+secrets\s+act|chandler\s+good\s+government|cggi)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Salient Features, Amendments & Basic Structure", "प्रमुख विशेषताएं, संशोधन एवं मूल संरचना",
        "Administrative Governance, Public Services & Transparency Commissions", "प्रशासनिक शासन, लोक सेवाएं एवं पारदर्शिता आयोग",
        "indian_polity_constitution_governance.salient_features_amendments_basic_structure",
        88
    ),
    (
        r'\b(military\s+operations\s+undertaken\s+by\s+india|operation\s+meghdoot|operation\s+vijay|operation\s+safed\s+sagar|operation\s+trident|chancellor\s+of\s+(germany|austria))\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "India's Foreign Policy & Bilateral Relations", "भारत की विदेश नीति एवं द्विपक्षीय संबंध",
        "Strategic Military Operations & Global Political Leadership", "रणनीतिक सैन्य अभियान एवं वैश्विक राजनीतिक नेतृत्व",
        "international_relations_global_institutions.indias_foreign_policy_bilateral_relations",
        88
    ),
    (
        r'\b(nandini\s+sahakar|brand\s+finance|ghatampur\s+thermal\s+power|thermal\s+power\s+project|jal\s+jeevan\s+mission|har\s+ghar\s+jal)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Planning, Mobilisation of Resources & Inclusive Growth", "योजना, संसाधनों का संचलन एवं समावेशी विकास",
        "Infrastructure, Power Projects, Cooperatives & National Flagship Missions", "अवसंरचना, विद्युत परियोजनाएं, सहकारिता एवं राष्ट्रीय प्रमुख मिशन",
        "indian_economy_development.planning_mobilisation_of_resources_inclusive_growth",
        88
    ),
    (
        r'\b(heron\s+drones?|cinnabar|ore\s+of\s+mercury|atomic\s+radius\s+of\s+hydrogen|aluminium\s+powder\s+is\s+used\s+as\s+a\s+solid\s+fuel|falcon\s+9|spacex|brine|aqueous\s+solution\s+of\s+a\s+salt\s+is\s+known\s+as\s+brine|rashtriya\s+vigyan\s+puraskar|vigyan\s+ratna|double\s+circulation\s+of\s+blood|xerophytes|plants\s+adapted\s+to\s+grow\s+in\s+deserts|1\s+gigabyte|gigabyte\s+in\s+binary|oxidation\s+numbers?\s+of\s+chlorine|relative\s+density\s+of\s+gold|converting\s+digital\s+signals|modem|text\s+alignments\s+in\s+microsoft\s+word)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Applied Physics, Chemistry, Biology, Space Propulsion & IT Applications", "अनुप्रयुक्त भौतिकी, रसायन, जीवविज्ञान, अंतरिक्ष प्रणोदन एवं IT अनुप्रयोग",
        "science_technology_defence.applied_fundamental_sciences",
        88
    ),
    (
        r'\b(himalayan\s+ranges|karakoram|ladakh\s+range|zaskar|inner\s+planets?|terrestrial\s+planets?|outer\s+planets?|mercury,\s+venus|polje|uvala|doline|karst\s+landforms?|natural\s+population\s+change|birth\s+rate\s*-\s*death\s+rate|demographic\s+transition)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Physical Geography & Earth Systems", "भौतिक भूगोल एवं भू-प्रणालियाँ",
        "Geomorphology, Solar System & Population Dynamics", "भू-आकृतिक विज्ञान, सौरमंडल एवं जनसांख्यिकी",
        "geography_earth_systems.physical_geography_earth_systems",
        86
    ),
    (
        r'\b(connective\s+tissue|ligament|tendon|cartilage|adipose|epithelial|notochord|chordate|non-chordate|holothuria|sea\s+cucumber|hydrotropism|geotropism|thigmotropism|tropic\s+movement|inspire\s+initiative|department\s+of\s+science\s+and\s+technology|national\s+technology\s+day)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Biotechnology, Health & Life Sciences", "जैव प्रौद्योगिकी, स्वास्थ्य एवं जीवन विज्ञान",
        "Animal & Plant Biology, Tissues & Science Initiatives", "जंतु एवं पादप जीवविज्ञान, ऊतक एवं विज्ञान पहल",
        "science_technology_defence.biotechnology_health_life_sciences",
        85
    ),
    (
        r'\b(human\s+development\s+report|hdi\s+rankings?|working\s+population\s+of\s+india|cultivators,\s+agricultural|cpsus?|miniratna|navratna|maharatna|saubhagya|sahaj\s+bijli|electrification\s+scheme)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Planning, Mobilisation of Resources & Inclusive Growth", "योजना, संसाधनों का संचलन एवं समावेशी विकास",
        "Human Development, CPSEs, Rural Electrification & Labour Force", "मानव विकास, सीपीएसई, ग्रामीण विद्युतीकरण एवं श्रम बल",
        "indian_economy_development.planning_mobilisation_of_resources_inclusive_growth",
        85
    ),
    (
        r'\b(dardic|language\s+family|indo-aryan|dravidian|austroasiatic|tibeto-burman|sino-tibetan|classical\s+languages?)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Literature & Languages", "भारतीय साहित्य एवं भाषाएँ",
        "Linguistic Families & Language Groups of India", "भारत के भाषा परिवार एवं भाषा समूह",
        "art_culture_heritage.indian_literature_languages",
        85
    ),
    (
        r'\b(harappan\s+script|boustrophedon|undeciphered|indus\s+script)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Indus Valley Civilization & Harappan Script", "सिंधु घाटी सभ्यता एवं हड़प्पा लिपि",
        "history.ancient_india",
        88
    ),
    (
        r'\b(pipes?\s+[a-z]\s+and\s+[a-z]|can\s+fill\s+a\s+tank|income\s+of\s+[a-z]|simplification\s+the\s+product|how\s+many\s+such\s+terms|xyz\s*=\s*\d+|factor\s+triples|x\s*≤\s*y\s*≤\s*z|x\^2\s*\+\s*y\^2|cubical\s+container|volume\s+of\s+sphere|unit\s+vectors)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "Quantitative Aptitude & Basic Numeracy", "मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता",
        "Algebra, Mensuration & Arithmetic Equations", "बीजगणित, क्षेत्रमिति एवं अंकगणितीय समीकरण",
        "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy",
        97
    ),
    (
        r'\b(apical\s+meristem|lateral\s+meristem|intercalary|plant\s+tissues?|pollen\s+grains?|anther|stamen|pistil|carpel|stigma|pollination|fertilization\s+in\s+flowering|coelenterata|cnidaria|hydra|sea\s+anemone|platyhelminthes|nematoda|annelida|arthropoda|mollusca|echinodermata|chordata|nekton|benthos|plankton|muscle\s+contraction|actin\s+and\s+myosin|sarcoplasmic\s+reticulum)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Biotechnology, Health & Life Sciences", "जैव प्रौद्योगिकी, स्वास्थ्य एवं जीवन विज्ञान",
        "Botany, Plant Tissues, Reproduction & Animal Kingdom", "वनस्पति विज्ञान, पादप ऊतक, प्रजनन एवं प्राणि जगत",
        "science_technology_defence.biotechnology_health_life_sciences",
        85
    ),
    (
        r'\b(quartz|piezoelectric|silicon\s+dioxide|water\s+softening|sodium\s+tripolyphosphate|zeolite|ion-exchange|calgon|anion\s+[a-z]|aluminium\s+salt|paper\s+chromatography|chromatography|distillation|fractional\s+distillation|crystallization)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Inorganic, Analytical & Separation Chemistry", "अकार्बनिक, विश्लेषणात्मक एवं पृथक्करण रसायन",
        "science_technology_defence.applied_fundamental_sciences",
        85
    ),
    (
        r'\b(startup\s+india|standup\s+india|e-commerce|flipkart|walmart|merger|acquisition|keynesian|aggregate\s+consumption|marginal\s+propensity|mpc|multiplier\s+effect|gi\s+tag|geographical\s+indication|kandhamal\s+haldi)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Planning, Mobilisation of Resources & Inclusive Growth", "योजना, संसाधनों का संचलन एवं समावेशी विकास",
        "Industrial Policy, Startups, GI Tags & Macroeconomic Theories", "औद्योगिक नीति, स्टार्टअप, जीआई टैग एवं समष्टि आर्थिक सिद्धांत",
        "indian_economy_development.planning_mobilisation_of_resources_inclusive_growth",
        85
    ),
    (
        r'\b(population\s+density|census\s+of\s+india|density\s+of\s+population|deccan\s+traps|volcanic\s+activity\s+in\s+peninsula|equatorial\s+plane|inclined\s+to\s+its\s+orbit|seasons\s+occur|tilt\s+of\s+earth)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Indian Physical Geography & Monsoon Architecture", "भारत का भौतिक भूगोल एवं मानसून संरचना",
        "Indian Physiography, Geological Eras & Population Demographics", "भारत की भू-आकृति, भूवैज्ञानिक काल एवं जनसांख्यिकी",
        "geography_earth_systems.indian_physical_geography_monsoon_architecture",
        85
    ),
    (
        r'\b(plekhanov|lenin|marxism|socialism|bolshevik|russian\s+revolution|french\s+revolution|industrial\s+revolution|american\s+war\s+of\s+independence|first\s+world\s+war|second\s+world\s+war|cold\s+war|fascism|nazism)\b',
        "History", "इतिहास",
        "World History", "विश्व इतिहास",
        "World History: Revolutions, Political Ideologies & World Wars", "विश्व इतिहास: क्रांतियां, राजनीतिक विचारधाराएं एवं विश्व युद्ध",
        "history.world_history",
        85
    ),
    (
        r'\b(umbrella\s+scheme|rashtriya\s+yuva|sashaktikaran|youth\s+affairs|skill\s+india|stand-up\s+india|mid-day\s+meal|pm-poshan|samagra\s+shiksha|ayushman\s+bharat|poshan\s+abhiyan|swachh\s+bharat)\b',
        "Indian Society & Social Justice", "भारतीय समाज एवं सामाजिक न्याय",
        "Welfare Schemes for Vulnerable Sections", "कमजोर वर्गों के लिए कल्याणकारी योजनाएं",
        "Welfare Schemes, Youth Development & Social Justice Initiatives", "कल्याणकारी योजनाएं, युवा विकास एवं सामाजिक न्याय पहल",
        "indian_society_social_justice.welfare_schemes_for_vulnerable_sections",
        85
    ),
    # --- 2. INTERNAL SECURITY & DEFENCE ---
    (
        r'\b(crpf|bsf|cisf|itbp|ssb|assam\s+rifles|nsg|central\s+armed\s+police\s+forces?|border\s+security\s+force|central\s+reserve\s+police|sashastra\s+seema\s+bal|indo-tibetan\s+border\s+police|indian\s+coast\s+guard|coast\s+guard\s+act|coastal\s+security)\b',
        "Internal Security", "आंतरिक सुरक्षा",
        "Security Forces, Intelligence Agencies & Statutory Mandates", "सुरक्षा बल, खुफिया एजेंसियां एवं सांविधिक अधिकार",
        "Central Armed Police Forces (CAPF) & Coast Guard: Roles & Deployment", "केंद्रीय सशस्त्र पुलिस बल (CAPF) एवं तटरक्षक बल: भूमिका एवं तैनाती",
        "internal_security.security_forces_intelligence_agencies_statutory_mandates",
        90
    ),
    (
        r'\b(border\s+management|cibms|comprehensive\s+integrated\s+border|border\s+fencing|sir\s+creek|line\s+of\s+control|loc|line\s+of\s+actual\s+control|lac|cross-border\s+infiltration)\b',
        "Internal Security", "आंतरिक सुरक्षा",
        "Border Management & Coastal Security", "सीमा प्रबंधन एवं तटीय सुरक्षा",
        "Border Security, Fencing & Cross-Border Challenges", "सीमा सुरक्षा, बाड़ निर्माण एवं सीमा पार चुनौतियाँ",
        "internal_security.border_management_coastal_security",
        90
    ),
    (
        r'\b(naxalism|left\s+wing\s+extremism|lwe|red\s+corridor|afspa|armed\s+forces\s+special\s+powers\s+act|uapa|unlawful\s+activities|insurgency\s+in\s+north-east|naga\s+peace\s+accord)\b',
        "Internal Security", "आंतरिक सुरक्षा",
        "Terrorism, Insurgencies & Cross-Border Security", "आतंकवाद, उग्रवाद एवं सीमा पार सुरक्षा चुनौतियाँ",
        "Left-Wing Extremism (LWE) & North-East Insurgency", "वामपंथी उग्रवाद (LWE) एवं पूर्वोत्तर उग्रवाद",
        "internal_security.terrorism_insurgencies_cross-border_security",
        90
    ),
    (
        r'\b(missile|brahmos|agni-[ivx]+|prithvi-[ivx]+|akash\s+missile|nag\s+missile|helina|drdo|tejas|ins\s+vikrant|ins\s+arihant|scorpene\s+submarine|project\s+75|s-400|rafale|pinaka|artillery\s+gun|ballistic\s+missile\s+defence|bmd|jammu\s+and\s+kashmir\s+light\s+infantry|jak\s+li|infantry\s+regiment|indian\s+army\s+regiments?)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Defence Technology", "रक्षा प्रौद्योगिकी",
        "Indigenous Weapon Systems, Missiles & Armed Forces Regiments", "स्वदेशी हथियार प्रणालियाँ, मिसाइलें एवं सैन्य रेजिमेंट",
        "science_technology_defence.defence_technology",
        90
    ),

    # --- 3. POLITY & CONSTITUTION ---
    (
        r'\b(fundamental\s+rights?|article\s+14|article\s+19|article\s+21|article\s+32|writs?|habeas\s+corpus|mandamus|certiorari|prohibition|quo\s+warranto|right\s+to\s+equality|right\s+to\s+freedom|preventive\s+detention)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Fundamental Rights, DPSP & Fundamental Duties", "मौलिक अधिकार, राज्य के नीति निर्देशक तत्व एवं मौलिक कर्तव्य",
        "Fundamental Rights & Constitutional Remedies", "मौलिक अधिकार एवं संवैधानिक उपचार",
        "indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties",
        85
    ),
    (
        r'\b(directive\s+principles|dpsp|article\s+40|article\s+44|uniform\s+civil\s+code|article\s+48|article\s+51|fundamental\s+duties|article\s+51a|swaran\s+singh\s+committee)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Fundamental Rights, DPSP & Fundamental Duties", "मौलिक अधिकार, राज्य के नीति निर्देशक तत्व एवं मौलिक कर्तव्य",
        "Directive Principles of State Policy & Fundamental Duties", "राज्य के नीति निर्देशक तत्व एवं मौलिक कर्तव्य",
        "indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties",
        85
    ),
    (
        r'\b(preamble|constituent\s+assembly|drafting\s+committee|objective\s+resolution|basic\s+structure|kesavananda\s+bharati|minerva\s+mills|42nd\s+amendment|44th\s+amendment|article\s+368|constitutional\s+government|limited\s+government|rule\s+of\s+law|separation\s+of\s+powers|checks\s+and\s+balances)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Salient Features, Amendments & Basic Structure", "प्रमुख विशेषताएं, संशोधन एवं मूल संरचना",
        "Constitutional Philosophy, Basic Structure & Rule of Law", "संवैधानिक दर्शन, मूल संरचना एवं विधि का शासन",
        "indian_polity_constitution_governance.salient_features_amendments_basic_structure",
        85
    ),
    (
        r'\b(presidential\s+system|parliamentary\s+system|cabinet\s+system|collective\s+responsibility|president\s+of\s+india|impeachment\s+of\s+president|ordinance-making\s+power|article\s+123|pardoning\s+power\s+of\s+president|article\s+72|electoral\s+college|vice-president|ex-officio\s+chairman|prime\s+minister|council\s+of\s+ministers|governor|article\s+153|chief\s+minister)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Union Executive & State Executive", "संघीय कार्यपालिका एवं राज्य कार्यपालिका",
        "Executive Governance: President, Governor, Prime Minister & Cabinets", "कार्यपालिका शासन: राष्ट्रपति, राज्यपाल, प्रधानमंत्री एवं मंत्रिमंडल",
        "indian_polity_constitution_governance.union_executive_state_executive",
        85
    ),
    (
        r'\b(parliament\s+of\s+india|lok\s+sabha|rajya\s+sabha|speaker\s+of\s+lok\s+sabha|money\s+bill|article\s+110|financial\s+bill|joint\s+sitting|article\s+108|public\s+accounts\s+committee|pac|estimates\s+committee|committee\s+on\s+public\s+assurances|ethics\s+committee|privileges\s+committee|no-confidence\s+motion|censure\s+motion|question\s+hour|zero\s+hour|calling\s+attention|parliamentary\s+privileges|article\s+105|floor\s+of\s+the\s+house)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Parliament & State Legislatures", "संसद एवं राज्य विधायिकाएं",
        "Union Parliament: Composition, Powers & Parliamentary Committees", "केंद्रीय संसद: संरचना, शक्तियाँ एवं संसदीय समितियाँ",
        "indian_polity_constitution_governance.parliament_state_legislatures",
        85
    ),
    (
        r'\b(supreme\s+court\s+of\s+india|high\s+court|judicial\s+review|collegium\s+system|original\s+jurisdiction|article\s+131|appellate\s+jurisdiction|advisory\s+jurisdiction|article\s+143|curative\s+petition|contempt\s+of\s+court|removal\s+of\s+judges?|national\s+judicial\s+appointments)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Indian Judiciary & Judicial System", "भारतीय न्यायपालिका एवं न्यायिक प्रणाली",
        "Union & State Judiciary: Powers, Jurisdiction & Independence", "केंद्रीय एवं राज्य न्यायपालिका: शक्तियाँ, क्षेत्राधिकार एवं स्वतंत्रता",
        "indian_polity_constitution_governance.indian_judiciary_judicial_system",
        85
    ),
    (
        r'\b(panchayat|73rd\s+constitutional\s+amendment|74th\s+constitutional\s+amendment|municipality|gram\s+sabha|eleventh\s+schedule|twelfth\s+schedule|state\s+election\s+commission|state\s+finance\s+commission|pesa\s+act)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Local Governance (Panchayati Raj & Urban Local Bodies)", "स्थानीय शासन (पंचायती राज एवं शहरी स्थानीय निकाय)",
        "Panchayati Raj & Urban Local Bodies (73rd & 74th Amendments)", "पंचायती राज एवं नगर निकाय (73वां व 74वां संशोधन)",
        "indian_polity_constitution_governance.local_governance",
        85
    ),
    (
        r'\b(election\s+commission\s+of\s+india|article\s+324|comptroller\s+and\s+auditor\s+general|cag|article\s+148|union\s+public\s+service\s+commission|upsc|article\s+315|finance\s+commission|article\s+280|attorney\s+general\s+of\s+india|article\s+76|solicitor\s+general|advocate\s+general|article\s+165|national\s+human\s+rights\s+commission|nhrc|central\s+vigilance\s+commission|cvc|lokpal|cbi)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Statutory, Regulatory & Quasi-Judicial Bodies", "सांविधिक, विनियामक एवं अर्ध-न्यायिक निकाय",
        "Constitutional & Statutory Bodies: ECI, CAG, UPSC, CVC, Lokpal", "संवैधानिक एवं सांविधिक निकाय: चुनाव आयोग, कैग, संघ लोक सेवा आयोग, सीवीसी, लोकपाल",
        "indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies",
        85
    ),
    (
        r'\b(tenth\s+schedule|anti-defection\s+law|52nd\s+amendment|ninety-first\s+amendment|disqualification\s+of\s+members|seventh\s+schedule|union\s+list|state\s+list|concurrent\s+list|residuary\s+powers|centre-state\s+relations|sarkaria\s+commission|punchhi\s+commission|inter-state\s+council|zonal\s+councils|article\s+371[a-j]?|special\s+provisions?\s+(in|for)\s+the\s+state)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Federal Structure, Center-State Relations & Devolution", "संघीय ढांचा, केंद्र-राज्य संबंध एवं वित्तीय हस्तांतरण",
        "Centre-State Relations, Special Provisions & Schedules", "केंद्र-राज्य संबंध, विशेष प्रावधान एवं अनुसूचियाँ",
        "indian_polity_constitution_governance.federal_structure_center-state_relations_devolution",
        85
    ),

    # --- 4. ART, CULTURE & HERITAGE ---
    (
        r'\b(sculptural\s+tradition\s+of\s+mathura|mathura\s+school|gandhara\s+school|amaravati\s+school|red\s+sandstone\s+with\s+white\s+spots|spotted\s+red\s+sandstone|temple\s+architecture|nagara\s+style|dravida\s+style|vesara\s+style|shikhara|vimana|garbhagriha|mandapa|gopuram|khajuraho|kandariya|konark|sun\s+temple|modhera|brihadisvara|thanjavur|shore\s+temple|mahabalipuram|pancha\s+rathas|ellora|kailash\s+temple|ajanta|rock-cut\s+cave|barabar\s+caves|elephanta|didarganj\s+yakshini|bodhisattva\s+padmapani)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Architecture & Sculpture", "भारतीय वास्तुकला एवं मूर्तिकला",
        "Temple Architecture, Sculptural Traditions & Rock-Cut Caves", "मंदिर स्थापत्य, मूर्तिकला परंपराएं एवं शैलकृत गुफाएं",
        "art_culture_heritage.indian_architecture_sculpture",
        85
    ),
    (
        r'\b(mughal\s+architecture|delhi\s+sultanate\s+architecture|indo-islamic\s+architecture|pietra\s+dura|charbagh|qutb\s+minar|alai\s+darwaza|humayun\'?s\s+tomb|buland\s+darwaza|taj\s+mahal|red\s+fort|fatehpur\s+sikri|gol\s+gumbaz)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Architecture & Sculpture", "भारतीय वास्तुकला एवं मूर्तिकला",
        "Indo-Islamic & Mughal Architecture: Monuments & Stylistic Evolution", "इंडो-इस्लामिक एवं मुगल वास्तुकला: स्मारक एवं स्थापत्य विकास",
        "art_culture_heritage.indian_architecture_sculpture",
        85
    ),
    (
        r'\b(bharatanatyam|kathak|kathakali|kuchipudi|odissi|manipuri|mohiniyattam|sattriya|sangeet\s+natak\s+akademi|classical\s+dance|carnatic\s+music|hindustani\s+music|raga|tala|gharana|dhrupad|khyal|thumri|rudra\s+veena|sitar|sarod|tabla)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Performing Arts (Dance, Music, Theatre & Puppetry)", "प्रदर्शन कला (नृत्य, संगीत, रंगमंच एवं कठपुतली)",
        "Classical & Folk Dances, Hindustani & Carnatic Music Traditions", "शास्त्रीय एवं लोक नृत्य, हिंदुस्तानी एवं कर्नाटक संगीत परंपराएं",
        "art_culture_heritage.performing_arts",
        85
    ),
    (
        r'\b(miniature\s+paintings?|mughal\s+paintings?|rajasthani\s+paintings?|pahari\s+paintings?|kangra\s+paintings?|basohli|kishangarh|bani\s+thani|madhubani|warli|pattachitra|kalamkari|mural\s+paintings?)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Paintings & Visual Arts", "भारतीय चित्रकला एवं दृश्य कला",
        "Mural & Miniature Paintings: Mughal, Rajasthani, Pahari & Folk Schools", "भित्ति एवं लघु चित्रकला: मुगल, राजस्थानी, पहाड़ी एवं लोक शैलियां",
        "art_culture_heritage.indian_paintings_visual_arts",
        85
    ),
    (
        r'\b(nyaya|vaisheshika|samkhya|yoga|mimamsa|vedanta|shad\s+darshana|advaita\s+vedanta|shankara|vishishtadvaita|ramanujacharya|dvaita|madhvacharya|carvaka|lokayata)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Schools of Indian Philosophy", "भारतीय दर्शन के संप्रदाय",
        "Six Orthodox Schools (Shad Darshana) & Heterodox Traditions", "छह आस्तिक दर्शन (षड्दर्शन) एवं नास्तिक परंपराएं",
        "art_culture_heritage.schools_of_indian_philosophy",
        85
    ),
    (
        r'\b(unesco\s+world\s+heritage|intangible\s+cultural\s+heritage|kumbh\s+mela|yoga|chhau\s+dance|vedic\s+chanting|ramlila|navroz|durga\s+puja|sankirtana|kalbelia)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Fairs, Festivals, Crafts & UNESCO Heritage", "मेले, त्योहार, शिल्प एवं यूनेस्को धरोहर",
        "UNESCO World Heritage & Intangible Cultural Heritage of India", "यूनेस्को विश्व धरोहर एवं भारत की अमूर्त सांस्कृतिक विरासत",
        "art_culture_heritage.fairs_festivals_crafts_unesco_heritage",
        85
    ),
    (
        r'\b(ranji\s+trophy|cricket\s+history|fastest\s+century\s+in\s+odi|batsman|bowler|fifa\s+world\s+cup|olympic\s+games|asian\s+games|commonwealth\s+games|grand\s+slam|wimbledon|badminton\s+championship|thomas\s+cup|uber\s+cup|dhyan\s+chand|arjuna\s+award|kalaripayattu|silambam|thang-ta|gatka|mallakhamb|kambala|jallikattu)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Martial Arts, Traditional Sports & Indian Calendar Systems", "मार्शल आर्ट, पारंपरिक खेल एवं भारतीय कैलेंडर प्रणालियाँ",
        "Sports, Competitions, Tournaments & Martial Traditions", "खेल, प्रतियोगिताएं, टूर्नामेंट एवं मार्शल परंपराएं",
        "art_culture_heritage.martial_arts_traditional_sports_calendars",
        85
    ),
    (
        r'\b(pulitzer\s+prize|vijay\s+seshadri|bharat\s+ratna|c\.?\s*n\.?\s*r\.?\s*rao|wings\s+of\s+fire|a\.?\s*p\.?\s*j\.?\s*abdul\s+kalam|sahitya\s+akademi\s+award|jnanpith\s+award|saraswati\s+samman|booker\s+prize|rabindranath\s+tagore|gitanjali|kalidasa|abhijnanasakuntalam|panchatantra|vishnu\s+sharma|national\s+film\s+award|best\s+feature\s+film|ship\s+of\s+theseus|cinema\s+of\s+india|dadasaheb\s+phalke)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Literature & Languages", "भारतीय साहित्य एवं भाषाएँ",
        "Literary Masterpieces, Cinema & Prestigious National Awards", "साहित्यिक कृतियां, सिनेमा एवं प्रतिष्ठित राष्ट्रीय पुरस्कार",
        "art_culture_heritage.indian_literature_languages",
        85
    ),

    # --- 5. HISTORY ---
    (
        r'\b(harappa|mohenjo-daro|indus\s+valley|lothal|dholavira|kalibangan|rakhigarhi|great\s+bath|bearded\s+priest|bronze\s+dancing\s+girl|seals\s+of\s+harappa)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Indus Valley Civilization: Urban Planning, Trade & Sites", "सिंधु घाटी सभ्यता: नगर नियोजन, व्यापार एवं प्रमुख स्थल",
        "history.ancient_india",
        85
    ),
    (
        r'\b(rig\s*veda|samaveda|yajurveda|atharvaveda|upanishad|vedic\s+hymns|sabha\s+and\s+samiti|ashvamedha|rajasuya|varna\s+system|brahmana|aranyaka)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Vedic Age: Early & Later Vedic Society, Polity & Literature", "वैदिक काल: पूर्व व उत्तर वैदिक समाज, राजनीति एवं साहित्य",
        "history.ancient_india",
        85
    ),
    (
        r'\b(buddhism|gautama\s+buddha|hinayana|mahayana|theravada|vajrayana|four\s+noble\s+truths|eightfold\s+path|sangha|buddhist\s+councils|jainism|mahavira|tirthankara|parshvanatha|digambara|svetambara|ahimsa|anekantavada|syadvada)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Buddhism & Jainism: Philosophies, Councils & Monastic Orders", "बौद्ध एवं जैन धर्म: दर्शन, संगीति एवं संघ",
        "history.ancient_india",
        85
    ),
    (
        r'\b(maurya|chandragupta\s+maurya|ashoka|dhamma|arthashastra|kautilya|megasthenes|indica|ashokan\s+rock\s+edicts?|pillar\s+edicts?|kalinga\s+war|bindusara)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Mauryan Empire: Ashokan Dhamma, Edicts & Administration", "मौर्य साम्राज्य: अशोक का धम्म, शिलालेख एवं प्रशासन",
        "history.ancient_india",
        85
    ),
    (
        r'\b(gupta\s+empire|samudragupta|chandragupta\s+ii|vikramaditya|fa-hsien|faxian|kalidasa|aryabhata|varahamihira|allahabad\s+pillar\s+inscription|harisena|harshavardhana|hsuan-tsang|xuanzang|banabhatta|kadambari|harshacharita)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "Gupta & Post-Gupta Era: Literature, Sciences & Administration", "गुप्त एवं गुप्तोत्तर काल: साहित्य, विज्ञान एवं प्रशासन",
        "history.ancient_india",
        85
    ),
    (
        r'\b(chola\s+empire|rajaraja\s+chola|rajendra\s+chola|uttaramerur\s+inscription|chola\s+village\s+administration|kudavolai|gangaikondacholapuram)\b',
        "History", "इतिहास",
        "Ancient India", "प्राचीन भारत",
        "South Indian Dynasties: Cholas, Pallavas & Administrative Systems", "दक्षिण भारतीय राजवंश: चोल, पल्लव एवं प्रशासनिक व्यवस्था",
        "history.ancient_india",
        85
    ),
    (
        r'\b(delhi\s+sultanate|qutb\s+ud\s+din\s+aibak|iltutmish|balban|sajda\s+and\s+paibos|alauddin\s+khalji|market\s+reforms|dagh\s+and\s+chehra|muhammad\s+bin\s+tughlaq|token\s+currency|firuz\s+shah\s+tughlaq|iqta\s+system|lodhi\s+dynasty|ibrahim\s+lodhi)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Delhi Sultanate: Khalji, Tughlaq & Administrative Systems", "दिल्ली सल्तनत: खिलजी, तुगलक एवं प्रशासनिक व्यवस्था",
        "history.medieval_india",
        85
    ),
    (
        r'\b(mughal\s+empire|babur|battle\s+of\s+panipat|humayun|akbar|mansabdari\s+system|din-i-ilahi|sulh-i-kul|todar\s+mal|dahsala|jahangir|shah\s+jahan|aurangzeb|jagirdari\s+crisis|zabti\s+system)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Mughal Empire: Akbar's Administration, Mansabdari & Land Revenue", "मुगल साम्राज्य: अकबर का प्रशासन, मनसबदारी एवं भू-राजस्व",
        "history.medieval_india",
        85
    ),
    (
        r'\b(maratha\s+empire|shivaji|chhatrapati|ashtapradhan|chauth|sardeshmukhi|peshwa|baji\s+rao|battle\s+of\s+panipat\s+1761|third\s+battle\s+of\s+panipat|treaty\s+of\s+salbai|treaty\s+of\s+purandar)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Maratha Confederacy: Shivaji's Administration & Peshwa Era", "मराठा परिसंघ: शिवाजी का प्रशासन एवं पेशवा काल",
        "history.medieval_india",
        85
    ),
    (
        r'\b(vijayanagara\s+empire|krishnadevaraya|amuktamalyada|hampi|nayankara\s+system|ayagar|bahmani\s+kingdom|mahmud\s+gawan|battle\s+of\s+talikota)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Vijayanagara Empire: Krishnadevaraya, Nayankara System & Art", "विजयनगर साम्राज्य: कृष्णदेवराय, नयनकार प्रणाली एवं कला",
        "history.medieval_india",
        85
    ),
    (
        r'\b(bhakti\s+movement|sufi\s+movement|kabir|guru\s+nanak|mirabai|chaitanya\s+mahaprabhu|sankaradeva|dadu\s+dayal|tulsidas|surdas|chishti\s+silsila|nizamuddin\s+auliya|khwaja\s+muinuddin|suhrawardi)\b',
        "History", "इतिहास",
        "Medieval India", "मध्यकालीन भारत",
        "Bhakti & Sufi Movements: Saints, Philosophy & Literature", "भक्ति एवं सूफी आंदोलन: संत, दर्शन एवं साहित्य",
        "history.medieval_india",
        85
    ),
    (
        r'\b(battle\s+of\s+plassey|battle\s+of\s+buxar|treaty\s+of\s+allahabad|subsidiary\s+alliance|doctrine\s+of\s+lapse|lord\s+dalhousie|lord\s+wellesley|permanent\s+settlement|zamindari\s+system|ryotwari\s+system|mahalwari\s+system|commercialisation\s+of\s+agriculture|drain\s+of\s+wealth|dadabhai\s+naoroji|railways?\s+in\s+colonial\s+india|guarantee\s+system)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "British Expansion & Land Revenue Systems (Permanent, Ryotwari, Mahalwari)", "ब्रिटिश विस्तार एवं भू-राजस्व नीतियां (स्थायी, रैयतवाड़ी, महालवाड़ी)",
        "history.modern_india",
        85
    ),
    (
        r'\b(revolt\s+of\s+1857|sepoy\s+mutiny|mangal\s+pandey|rani\s+lakshmibai|tatya\s+tope|kunwar\s+singh|begum\s+hazrat\s+mahal|bahadur\s+shah\s+zafar|government\s+of\s+india\s+act\s+1858|queen\s+victoria\'?s\s+proclamation)\b',
        "History", "इतिहास",
        "Indian Freedom Struggle", "भारतीय स्वतंत्रता संग्राम",
        "Revolt of 1857: Causes, Leaders, Centers & Aftermath", "1857 का विद्रोह: कारण, प्रमुख नेता, केंद्र एवं प्रभाव",
        "history.indian_freedom_struggle",
        85
    ),
    (
        r'\b(brahmo\s+samaj|raja\s+ram\s+mohan\s+roy|arya\s+samaj|dayanand\s+saraswati|shuddhi\s+movement|satya\s+shodhak\s+samaj|jyotirao\s+phule|ishwar\s+chandra\s+vidyasagar|swami\s+vivekananda|ramakrishna\s+mission|aligarh\s+movement|syed\s+ahmad\s+khan|prarthana\s+samaj|young\s+bengal|henry\s+vivian\s+derozio|theosophical\s+society|annie\s+besant)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "Socio-Religious Reform Movements of 19th & 20th Century", "19वीं एवं 20वीं सदी के सामाजिक-धार्मिक सुधार आंदोलन",
        "history.modern_india",
        85
    ),
    (
        r'\b(indian\s+national\s+congress|a\.?\s*o\.?\s*hume|w\.?\s*c\.?\s*bonnerjee|moderate\s+phase|gopal\s+krishna\s+gokhale|bal\s+gangadhar\s+tilak|swaraj\s+is\s+my\s+birthright|lal\s+bal\s+pal|swadeshi\s+movement|partition\s+of\s+bengal\s+1905|boycott\s+movement|surat\s+split\s+1907|morley-minto\s+reforms|separate\s+electorates\s+1909|home\s+rule\s+league|lucknow\s+pact\s+1916)\b',
        "History", "इतिहास",
        "Indian Freedom Struggle", "भारतीय स्वतंत्रता संग्राम",
        "Early Phase of Congress, Swadeshi Movement & Extremist Phase", "कांग्रेस का प्रारंभिक दौर, स्वदेशी आंदोलन एवं उग्रवादी चरण",
        "history.indian_freedom_struggle",
        85
    ),
    (
        r'\b(gandhian|champaran\s+satyagraha|kheda\s+satyagraha|ahmedabad\s+mill\s+strike|rowlatt\s+act|jallianwala\s+bagh|khilafat\s+movement|non-cooperation\s+movement|chauri\s+chaura|swaraj\s+party|c\.?\s*r\.?\s*das|motilal\s+nehru|simon\s+commission|nehru\s+report|lahore\s+session\s+1929|purna\s+swaraj)\b',
        "History", "इतिहास",
        "Indian Freedom Struggle", "भारतीय स्वतंत्रता संग्राम",
        "Gandhian Era: Non-Cooperation, Khilafat & Early Satyagrahas", "गांधीवादी युग: असहयोग आंदोलन, खिलाफत एवं आरंभिक सत्याग्रह",
        "history.indian_freedom_struggle",
        85
    ),
    (
        r'\b(civil\s+disobedience\s+movement|dandi\s+march|salt\s+satyagraha|round\s+table\s+conferences?|gandhi-irwin\s+pact|communal\s+award|poona\s+pact|b\.?\s*r\.?\s*ambedkar|government\s+of\s+india\s+act\s+1935|provincial\s+elections\s+1937)\b',
        "History", "इतिहास",
        "Indian Freedom Struggle", "भारतीय स्वतंत्रता संग्राम",
        "Civil Disobedience Movement, Round Table Conferences & Poona Pact", "सविनय अवज्ञा आंदोलन, गोलमेज सम्मेलन एवं पूना समझौता",
        "history.indian_freedom_struggle",
        85
    ),
    (
        r'\b(quit\s+india\s+movement|do\s+or\s+die|august\s+kranti|indian\s+national\s+army|ina|subhas\s+chandra\s+bose|forward\s+bloc|azad\s+hind\s+fauj|cr\s+formula|wavell\s+plan|shimla\s+conference|cabinet\s+mission|mountbatten\s+plan|indian\s+independence\s+act\s+1947|radcliffe\s+line)\b',
        "History", "इतिहास",
        "Indian Freedom Struggle", "भारतीय स्वतंत्रता संग्राम",
        "Quit India Movement, INA & Path to Independence (1942–1947)", "भारत छोड़ो आंदोलन, आज़ाद हिंद फौज एवं स्वतंत्रता (1942–1947)",
        "history.indian_freedom_struggle",
        85
    ),

    # --- 6. GEOGRAPHY & EARTH SYSTEMS ---
    (
        r'\b(plate\s+tectonics|continental\s+drift|seafloor\s+spreading|pangea|panthalassa|earthquake|seismic\s+waves?|primary\s+waves?|secondary\s+waves?|epicenter|focus|richter\s+scale|volcano|magma|lava|igneous\s+rocks?|basalt|granite|sedimentary\s+rocks?|metamorphic\s+rocks?|fold\s+mountains?|faulting|rift\s+valley|springs\s+are\s+common|well\s+jointed\s+rocks|karst\s+topography|groundwater|limestone\s+caves|stalactites?|stalagmites?|sinkhole)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Physical Geography & Earth Systems", "भौतिक भूगोल एवं भू-प्रणालियाँ",
        "Earth Interior, Plate Tectonics, Geomorphic Processes & Karst", "पृथ्वी की आंतरिक संरचना, प्लेट विवर्तनिकी, भू-आकृतिक प्रक्रियाएं एवं कार्स्ट",
        "geography_earth_systems.physical_geography_earth_systems",
        85
    ),
    (
        r'\b(atmosphere|troposphere|stratosphere|mesosphere|thermosphere|ionosphere|tropopause|atmospheric\s+pressure|coriolis\s+force|cyclone|anticyclone|tropical\s+cyclone|temperate\s+cyclone|jet\s+streams?|south-west\s+monsoon|retreating\s+monsoon|el\s+nino|la\s+nina|enso|indian\s+ocean\s+dipole|iod|itcz|inter-tropical\s+convergence|western\s+disturbances?|temperature\s+inversion|relative\s+humidity|fog|dew|frost|clouds?|cumulonimbus|solstice|summer\s+solstice|winter\s+solstice|equinox|annual\s+range\s+of\s+temperature|continental\s+climate|continentality|koppen|tropical\s+savanna|monsoon\s+climate|mediterranean\s+climate)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Climatology & Atmospheric Dynamics", "जलवायु विज्ञान एवं वायुमंडलीय गतिकी",
        "Atmospheric Layers, Winds, Cyclones, Monsoon & Koppen Climates", "वायुमंडलीय परतें, पवनें, चक्रवात, मानसून एवं कोपेन जलवायु",
        "geography_earth_systems.climatology_atmospheric_dynamics",
        85
    ),
    (
        r'\b(ocean\s+currents?|gulf\s+stream|kuroshio|peru\s+current|humboldt|benguela|canary\s+current|labrador\s+current|salinity\s+of\s+ocean|tides?|spring\s+tide|neap\s+tide|coral\s+reefs?|atoll|barrier\s+reef|fringing\s+reef|ocean\s+trench|mariana\s+trench|continental\s+shelf|continental\s+slope|abyssal\s+plain|meridian\s+forms\s+the\s+boundary|boundary\s+between\s+(the\s+)?indian\s+ocean|boundary\s+between\s+(the\s+)?pacific\s+ocean)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Oceanography & Marine Systems", "समुद्र विज्ञान एवं समुद्री प्रणालियाँ",
        "Ocean Currents, Salinity, Tides, Marine Topography & Boundaries", "महासागरीय धाराएं, लवणता, ज्वार-भाटा, समुद्री स्थलाकृति एवं सीमाएं",
        "geography_earth_systems.oceanography_marine_systems",
        85
    ),
    (
        r'\b(himalayas?|greater\s+himalayas|himadri|lesser\s+himalayas|himachal|shivalik|shiwalik|western\s+ghats|sahyadri|eastern\s+ghats|aravalli|vindhya|satpura|deccan\s+plateau|malwa\s+plateau|chota\s+nagpur\s+plateau|coastal\s+plains|coromandel|malabar|konkan|thar\s+desert|nathu\s+la|zoji\s+la|shipki\s+la|rohtang\s+pass|lipulekh|palghat|thalghat|bhorghat|indus\s+river|ganges|ganga\s+river|brahmaputra|godavari|krishna\s+river|kaveri|cauvery|narmada|tapi|tapti|mahanadi|yamuna|ghaghara|kosi|son\s+river|chambal|betwa|tributary|distributary|delta|sundarbans|drainage\s+basin|waterfall|jog\s+falls|shivasamudram)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Indian Physical Geography & Monsoon Architecture", "भारत का भौतिक भूगोल एवं मानसून संरचना",
        "Physiographic Divisions & River Drainage Systems of India", "भारत के भौतिक प्रदेश एवं नदी अपवाह प्रणालियाँ",
        "geography_earth_systems.indian_physical_geography_monsoon_architecture",
        85
    ),
    (
        r'\b(black\s+soil|regur\s+soil|alluvial\s+soil|red\s+soil|laterite\s+soil|soil\s+erosion|saline\s+soil|peaty\s+soil|tropical\s+evergreen\s+forest|tropical\s+deciduous\s+forest|monsoon\s+forest|mangrove\s+forest|thorny\s+bushes|alpine\s+vegetation)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Indian Physical Geography & Monsoon Architecture", "भारत का भौतिक भूगोल एवं मानसून संरचना",
        "Soils & Natural Vegetation of India", "भारत की मृदा एवं प्राकृतिक वनस्पति",
        "geography_earth_systems.indian_physical_geography_monsoon_architecture",
        85
    ),
    (
        r'\b(iron\s+ore|coal\s+fields?|jharia|raniganj|bokaro|bauxite|copper\s+mines?|khetri|petroleum\s+refinery|digboi|mumbai\s+high|natural\s+gas|solar\s+park|wind\s+energy|hydroelectric\s+project|multipurpose\s+river\s+valley|hirakud\s+dam|bhakra\s+nangal|tehri\s+dam|sardar\s+sarovar|damodar\s+valley|renewable\s+energy\s+statistics|irena|solar\s+capacity)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Economic & Resource Geography", "आर्थिक एवं संसाधन भूगोल",
        "Mineral & Energy Resources, Multi-Purpose River Valley Projects", "खनिज एवं ऊर्जा संसाधन, बहुउद्देशीय नदी घाटी परियोजनाएं",
        "geography_earth_systems.economic_resource_geography",
        85
    ),
    (
        r'\b(equator|tropic\s+of\s+cancer|tropic\s+of\s+capricorn|arctic\s+circle|prime\s+meridian|greenwich\s+mean\s+time|international\s+date\s+line|latitude\s+and\s+longitude|strait\s+of\s+malacca|strait\s+of\s+gibraltar|strait\s+of\s+hormuz|bab-el-mandeb|suez\s+canal|panama\s+canal|rocky\s+mountains|andes\s+mountains|alps\s+mountains|great\s+rift\s+valley|sahara\s+desert|lake\s+victoria|lake\s+superior|caspian\s+sea)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "World Mapping & Geopolitical Locations", "विश्व मानचित्रण एवं भू-राजनीतिक स्थल",
        "World Geographic Features: Straits, Canals, Mountains & Continents", "विश्व के भौगोलिक स्थल: जलडमरूमध्य, नहरें, पर्वत एवं महाद्वीप",
        "geography_earth_systems.world_mapping_geopolitical_locations",
        85
    ),

    # --- 7. INDIAN ECONOMY & DEVELOPMENT ---
    (
        r'\b(gross\s+domestic\s+product|gdp|gross\s+national\s+product|gnp|net\s+national\s+product|nnp|national\s+income|per\s+capita\s+income|gross\s+value\s+added|gva|real\s+gdp|nominal\s+gdp|gdp\s+deflator|depreciation\s+in\s+national\s+income|price\s+elasticity|elasticity\s+of\s+demand|demand\s+curve|supply\s+curve|marginal\s+rate\s+of\s+substitution|mrs|marginal\s+utility|indifference\s+curve|consumer\s+equilibrium|inferior\s+good|giffen\s+good|total\s+expenditure\s+and\s+price|demand\s+for\s+a\s+commodity)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Macroeconomic Fundamentals & National Income Accounting", "समष्टि आर्थिक आधार एवं राष्ट्रीय आय लेखांकन",
        "National Income Accounting & Demand-Supply Mechanics", "राष्ट्रीय आय लेखांकन एवं मांग-आपूर्ति तंत्र",
        "indian_economy_development.macroeconomic_fundamentals_national_income_accounting",
        85
    ),
    (
        r'\b(inflation|consumer\s+price\s+index|cpi|wholesale\s+price\s+index|wpi|headline\s+inflation|core\s+inflation|deflation|stagflation|cost-push\s+inflation|demand-pull\s+inflation|base\s+effect)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Macroeconomic Fundamentals & National Income Accounting", "समष्टि आर्थिक आधार एवं राष्ट्रीय आय लेखांकन",
        "Inflation Dynamics: CPI, WPI, Causes & Control Measures", "मुद्रास्फीति: CPI, WPI, कारण एवं नियंत्रण के उपाय",
        "indian_economy_development.macroeconomic_fundamentals_national_income_accounting",
        85
    ),
    (
        r'\b(fiscal\s+deficit|revenue\s+deficit|primary\s+deficit|frbm\s+act|fiscal\s+responsibility|union\s+budget|capital\s+expenditure|revenue\s+expenditure|capital\s+receipts|goods\s+and\s+services\s+tax|gst|direct\s+taxes?|indirect\s+taxes?|corporate\s+tax|cess\s+and\s+surcharge)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Fiscal Policy, Public Finance & Taxation", "राजकोषीय नीति, लोक वित्त एवं कराधान",
        "Union Budget, Deficits (Fiscal/Revenue) & Tax Reforms", "केंद्रीय बजट, घाटे (राजकोषीय/राजस्व) एवं कर सुधार",
        "indian_economy_development.fiscal_policy_public_finance_taxation",
        85
    ),
    (
        r'\b(reserve\s+bank\s+of\s+india|rbi|repo\s+rate|reverse\s+repo|cash\s+reserve\s+ratio|crr|statutory\s+liquidity\s+ratio|slr|open\s+market\s+operations|omo|monetary\s+policy\s+committee|mpc|marginal\s+standing\s+facility|msf|bank\s+rate|money\s+supply|m1\s+and\s+m3|high\s+powered\s+money|priority\s+sector\s+lending|psl|npa|non-performing\s+assets|insolvency\s+and\s+bankruptcy\s+code|ibc|public\s+sector\s+bank|state\s+bank\s+of\s+india|cash\s+at\s+pos|point\s+of\s+sale|pmeac|economic\s+advisory\s+council|sebi|corporate\s+governance\s+norms|listed\s+companies)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Monetary Policy & Banking Architecture", "मौद्रिक नीति एवं बैंकिंग संरचना",
        "Monetary Policy, Banking Operations & Financial Regulators", "मौद्रिक नीति, बैंकिंग संचालन एवं वित्तीय विनियामक",
        "indian_economy_development.monetary_policy_banking_architecture",
        85
    ),
    (
        r'\b(balance\s+of\s+payments|bop|current\s+account\s+deficit|cad|capital\s+account|foreign\s+exchange\s+reserves|forex|foreign\s+direct\s+investment|fdi|foreign\s+portfolio\s+investment|fpi|exchange\s+rate|depreciation\s+of\s+rupee|devaluation|world\s+trade\s+organization|wto|tariffs?|imf|special\s+drawing\s+rights|sdr|world\s+bank|globalization|globalisation)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "External Sector, Balance of Payments & Foreign Trade", "विदेश क्षेत्र, भुगतान संतुलन एवं विदेश व्यापार",
        "Balance of Payments (BoP), Forex Reserves & Foreign Trade", "भुगतान संतुलन (BoP), विदेशी मुद्रा भंडार एवं विदेश व्यापार",
        "indian_economy_development.external_sector_balance_of_payments_foreign_trade",
        85
    ),
    (
        r'\b(minimum\s+support\s+price|msp|cpcp|procurement\s+price|food\s+corporation\s+of\s+india|fci|public\s+distribution\s+system|pds|national\s+food\s+security\s+act|nfsa|pm-kisan|crop\s+insurance|pmfby|kharif\s+crops?|rabi\s+crops?|zaid|green\s+revolution|white\s+revolution)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Agriculture, Food Management & Subsidies", "कृषि, खाद्य प्रबंधन एवं सब्सिडी",
        "Agricultural Pricing: MSP, Procurement & Food Security", "कृषि मूल्य निर्धारण: MSP, अधिप्राप्ति एवं खाद्य सुरक्षा",
        "indian_economy_development.agriculture_food_management_subsidies",
        85
    ),
    (
        r'\b(poverty\s+line|tendulkar\s+committee|rangarajan\s+committee|unemployment\s+rate|disguised\s+unemployment|structural\s+unemployment|niti\s+aayog|five\s+year\s+plans?|planning\s+commission|disinvestment|public\s+sector\s+enterprises|psu|msme|make\s+in\s+india|production\s+linked\s+incentive|pli\s+scheme|zero-landless|land\s+reforms|labour\s+market|labour\s+force\s+participation\s+rate|lfpr|worker\s+population\s+ratio|labour\s+reforms|industrial\s+relations\s+code)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Planning, Mobilisation of Resources & Inclusive Growth", "योजना, संसाधनों का संचलन एवं समावेशी विकास",
        "Poverty, Labour Reforms, NITI Aayog & Industrial Policies", "गरीबी, श्रम सुधार, नीति आयोग एवं औद्योगिक नीतियां",
        "indian_economy_development.planning_mobilisation_of_resources_inclusive_growth",
        85
    ),

    # --- 8. ENVIRONMENT, ECOLOGY & DISASTER MANAGEMENT ---
    (
        r'\b(national\s+park|wildlife\s+sanctuary|biosphere\s+reserve|tiger\s+reserve|project\s+tiger|project\s+elephant|ramsar\s+site|ramsar\s+convention|wetlands?|iucn\s+red\s+list|critically\s+endangered|endangered\s+species|vulnerable\s+species|endemic\s+species|in-situ\s+conservation|ex-situ\s+conservation|biodiversity\s+hotspot)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Biodiversity, Wildlife Conservation & Protected Areas", "जैव विविधता, वन्यजीव संरक्षण एवं संरक्षित क्षेत्र",
        "Protected Areas: National Parks, Sanctuaries & IUCN Status", "संरक्षित क्षेत्र: राष्ट्रीय उद्यान, अभयारण्य एवं IUCN स्थिति",
        "environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas",
        85
    ),
    (
        r'\b(ecosystem|food\s+chain|food\s+web|trophic\s+level|ecological\s+pyramid|10%\s+law|biomagnification|bioaccumulation|eutrophication|ecological\s+succession|pioneer\s+species|climax\s+community|carrying\s+capacity|biome|estuary|coral\s+bleaching)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Fundamental Ecology & Ecosystem Dynamics", "मूलभूत पारिस्थितिकी एवं पारिस्थितिकी तंत्र गतिकी",
        "Ecosystem Structure, Energy Flow & Food Web", "पारिस्थितिकी तंत्र संरचना, ऊर्जा प्रवाह एवं खाद्य जाल",
        "environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics",
        85
    ),
    (
        r'\b(greenhouse\s+gases?|global\s+warming|climate\s+change|unfccc|kyoto\s+protocol|paris\s+agreement|cop\d+|ipcc|carbon\s+footprint|carbon\s+credit|carbon\s+sequestration|ozone\s+layer\s+depletion|montreal\s+protocol|kigali\s+amendment|cfcs|chlorofluorocarbons|methane\s+emissions)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Climate Change Science, Carbon Markets & Global Conventions", "जलवायु परिवर्तन विज्ञान, कार्बन बाजार एवं वैश्विक समझौते",
        "Climate Change, Global Warming & Multilateral Conventions", "जलवायु परिवर्तन, ग्लोबल वार्मिंग एवं बहुपक्षीय सम्मेलन",
        "environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions",
        85
    ),
    (
        r'\b(air\s+pollution|smog|pm2\.5|pm10|acid\s+rain|water\s+pollution|biochemical\s+oxygen\s+demand|bod|chemical\s+oxygen\s+demand|cod|e-waste|electronic\s+waste|single-use\s+plastic|solid\s+waste\s+management|national\s+green\s+tribunal|ngt|central\s+pollution\s+control\s+board|cpcb)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Environmental Pollution, Waste Management & Remediation", "पर्यावरण प्रदूषण, अपशिष्ट प्रबंधन एवं निवारण",
        "Pollution Types, Air Quality & Waste Management", "प्रदूषण के प्रकार, वायु गुणवत्ता एवं अपशिष्ट प्रबंधन",
        "environment_ecology_disaster_management.environmental_pollution_waste_management_remediation",
        85
    ),
    (
        r'\b(disaster\s+management|ndma|ndrf|sendai\s+framework|hyogo\s+framework|landslides?|avalanche|tsunami\s+warning|drought\s+management|flood\s+forecasting)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Institutional, Legal & Operational Framework", "संस्थागत, कानूनी एवं परिचालन ढांचा",
        "Disaster Preparedness, Sendai Framework & Institutional Mechanism", "आपदा तैयारी, सेंडाई फ्रेमवर्क एवं संस्थागत तंत्र",
        "environment_ecology_disaster_management.institutional_legal_operational_framework",
        85
    ),

    # --- 9. INTERNATIONAL RELATIONS & GLOBAL BODIES ---
    (
        r'\b(united\s+nations|un\s+security\s+council|unsc|un\s+general\s+assembly|unga|international\s+court\s+of\s+justice|icj|unesco|who|unicef|unhcr|un\s+peacekeeping|un\s+charter|global\s+human\s+rights|universal\s+declaration\s+of\s+human\s+rights|udhr)\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "Global Institutions, Agreements & Treaties", "वैश्विक संस्थाएं, समझौते एवं संधियां",
        "United Nations: Organs, Agencies & Human Rights Regimes", "संयुक्त राष्ट्र: अंग, विशिष्ट एजेंसियां एवं मानवाधिकार तंत्र",
        "international_relations_global_institutions.global_institutions_agreements_treaties",
        85
    ),
    (
        r'\b(quad\s+grouping|brics|shanghai\s+cooperation\s+organisation|sco|g20\s+summit|g7\s+summit|asean|saarc|bimstec|north\s+atlantic\s+treaty\s+organisation|nato|european\s+union|iaea|opec)\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "Regional & Multilateral Groupings", "क्षेत्रीय एवं बहुपक्षीय समूह",
        "Regional & Global Groupings: G20, QUAD, BRICS, SCO, ASEAN", "क्षेत्रीय एवं वैश्विक समूह: G20, QUAD, BRICS, SCO, ASEAN",
        "international_relations_global_institutions.regional_multilateral_groupings",
        85
    ),
    (
        r'\b(military\s+exercise|joint\s+exercise|malabar\s+exercise|varuna\s+exercise|yudh\s+abhyas|surya\s+kiran|sampriti|mitra\s+shakti|garuda\s+shakti|indra\s+exercise|nomadic\s+elephant|dharama\s+guardian|ttex|maritime\s+security\s+exercise)\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "India's Foreign Policy & Bilateral Relations", "भारत की विदेश नीति एवं द्विपक्षीय संबंध",
        "Bilateral Defence Cooperation & Joint Military Exercises", "द्विपक्षीय रक्षा सहयोग एवं संयुक्त सैन्य अभ्यास",
        "international_relations_global_institutions.indias_foreign_policy_bilateral_relations",
        85
    ),
    (
        r'\b(bangladesh\s+general\s+election|bnp|awami\s+league|sheikh\s+hasina|pakistan\s+visa|polio\s+vaccination\s+certificate|sri\s+lanka|nepal|bhutan|maldives|myanmar|tatmadaw|egyptian\s+referendum|egypt\s+constitution|arab\s+spring|tahrir\s+square|crimea|ukraine|russia-ukraine|israel-palestine|gaza\s+strip|houthi|red\s+sea\s+crisis)\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "India's Foreign Policy & Bilateral Relations", "भारत की विदेश नीति एवं द्विपक्षीय संबंध",
        "Neighborhood Geopolitics & Global Flashpoints", "पड़ोसी भू-राजनीति एवं वैश्विक घटनाक्रम",
        "international_relations_global_institutions.indias_foreign_policy_bilateral_relations",
        85
    ),

    # --- 10. SCIENCE & TECHNOLOGY ---
    # IT, Computing & Telecommunications
    (
        r'\b(video\s+compression|audio\s+compression|codec|mpeg|jpeg|mp3|mp4|h\.264|h\.265|indeo|p\*64|non-procedural\s+computer\s+language|programming\s+language|python|lisp|prolog|algorithm|binary\s+code|ram\s+and\s+rom|operating\s+system|cpu|microprocessor|cache\s+memory|compiler|interpreter|ipv4|ipv6|cloud\s+computing|artificial\s+intelligence|machine\s+learning|cyber\s+security|blockchain|quantum\s+computing|tcp\/ip|application\s+layer|transport\s+layer|ftp|http|dns|jail\s*breaking|clickjacking|phishing|online\s+gaming)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Information & Communication Technology, AI & Cyber Security", "सूचना एवं संचार प्रौद्योगिकी, AI एवं साइबर सुरक्षा",
        "Computer Systems, Networking, Cyber Security & IT Infrastructure", "कंप्यूटर प्रणालियाँ, नेटवर्किंग, साइबर सुरक्षा एवं IT अवसंरचना",
        "science_technology_defence.information_communication_technology_ai_cyber_security",
        80
    ),
    # Space Tech
    (
        r'\b(isro|chandrayaan|mangalyaan|aditya-l1|gaganyaan|pslv|gslv|sslv|cryogenic\s+engine|geostationary\s+orbit|geosynchronous|low\s+earth\s+orbit|leo|lagrange\s+points?|james\s+webb|hubble\s+telescope|nasa|remote\s+sensing\s+satellite|navic|gps)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Space Technology & Astronomy", "अंतरिक्ष प्रौद्योगिकी एवं खगोल विज्ञान",
        "Space Missions, Launch Vehicles & Satellites", "अंतरिक्ष अभियान, प्रक्षेपण यान एवं उपग्रह",
        "science_technology_defence.space_technology_astronomy",
        80
    ),
    # Physics - Optics & Light
    (
        r'\b(refraction|reflection|concave\s+lens|convex\s+lens|concave\s+mirror|convex\s+mirror|focal\s+length|power\s+of\s+a\s+lens|dioptre|diopter|total\s+internal\s+reflection|dispersion\s+of\s+light|prism|rainbow|optical\s+fibre|wavelength|electromagnetic\s+spectrum|photon|laser|myopia|hypermetropia|presbyopia|astigmatism|neon\s+gas|electric\s+discharge|red\s+light\s+when\s+electricity)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Optics, Wave Optics & Light Phenomena", "प्रकाशिकी, तरंग प्रकाशिकी एवं प्रकाश घटनाएं",
        "science_technology_defence.applied_fundamental_sciences",
        80
    ),
    # Physics - Electricity & Magnetism
    (
        r'\b(electric\s+current|resistance|resistivity|ohm\'?s\s+law|potential\s+difference|volt|ampere|resistors?\s+in\s+series|resistors?\s+in\s+parallel|magnetic\s+field|electromagnetic\s+induction|faraday\'?s\s+law|electric\s+motor|electric\s+generator|transformer|alternating\s+current|direct\s+current|fuse\s+wire|superconductor|semiconductor|diode|transistor)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Electromagnetism, Electricity & Circuits", "विद्युत चुंबकत्व, विद्युत एवं परिपथ",
        "science_technology_defence.applied_fundamental_sciences",
        80
    ),
    # Physics - Mechanics & Gravitation & Oscillations
    (
        r'\b(gravitational\s+constant|acceleration\s+due\s+to\s+gravity|escape\s+velocity|kepler\'?s\s+laws?|kinetic\s+energy|potential\s+energy|conservation\s+of\s+momentum|newton\'?s\s+(third|first|second)\s+law|laws?\s+of\s+motion|action\s+and\s+reaction|inertia|frictional\s+force|centripetal\s+force|centrifugal\s+force|torque|bernoulli\'?s\s+principle|pascal\'?s\s+law|buoyancy|archimedes\s+principle|viscosity|surface\s+tension|capillarity|simple\s+harmonic\s+motion|shm|periodic\s+motion|pendulum)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Mechanics, Gravitation, Oscillations & Laws of Motion", "यांत्रिकी, गुरुत्वाकर्षण, दोलन एवं गति के नियम",
        "science_technology_defence.applied_fundamental_sciences",
        80
    ),
    # Physics - Sound & Waves
    (
        r'\b(sound\s+waves?|longitudinal\s+wave|transverse\s+wave|frequency|amplitude|ultrasound|sonar|infrasonic|ultrasonic|resonance|doppler\s+effect|speed\s+of\s+sound|decibel|pitch\s+of\s+sound|loudness)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Acoustics & Wave Motion", "ध्वनिकी एवं तरंग गति",
        "science_technology_defence.applied_fundamental_sciences",
        80
    ),
    # Physics - Heat & Thermodynamics
    (
        r'\b(thermodynamics|latent\s+heat|specific\s+heat|thermal\s+conductivity|conduction|convection|radiation|celsius|fahrenheit|kelvin|boiling\s+point|melting\s+point|calorimetry|anomalous\s+expansion\s+of\s+water)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Thermal Physics & Thermodynamics", "ऊष्मीय भौतिकी एवं ऊष्मागतिकी",
        "science_technology_defence.applied_fundamental_sciences",
        80
    ),
    # Physics - Nuclear & Modern Physics
    (
        r'\b(radioactivity|nuclear\s+fission|nuclear\s+fusion|half-life|alpha\s+particles?|beta\s+particles?|gamma\s+rays?|nuclear\s+reactor|moderator|control\s+rods|heavy\s+water|uranium|thorium|plutonium|isotopes?|isobars?|isotones?|kudankulam|tarapur|nuclear\s+power\s+plant|vver)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Nuclear Technology & Energy", "परमाणु प्रौद्योगिकी एवं ऊर्जा",
        "Nuclear Physics & Radioactivity", "नाभिकीय भौतिकी एवं रेडियोधर्मिता",
        "science_technology_defence.nuclear_technology_energy",
        80
    ),
    # Chemistry - Acids, Bases & Salts
    (
        r'\b(acid|base|alkali|ph\s+value|ph\s+scale|litmus\s+paper|neutralization\s+reaction|hydrochloric\s+acid|sulfuric\s+acid|sulphuric\s+acid|nitric\s+acid|acetic\s+acid|baking\s+soda|washing\s+soda|bleaching\s+powder|plaster\s+of\s+paris|buffer\s+solution|fluoride\s+in\s+drinking\s+water|tooth\s+enamel|hardness\s+of\s+water)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Acids, Bases, Salts & Everyday Solutions", "अम्ल, क्षार, लवण एवं दैनिक जीवन में विलयन",
        "science_technology_defence.applied_fundamental_sciences",
        80
    ),
    # Chemistry - Periodic Table & Atomic Structure
    (
        r'\b(periodic\s+table|mendeleev|atomic\s+number|mass\s+number|valency|noble\s+gases?|inert\s+gas|halogens?|alkali\s+metals?|alkaline\s+earth|electronegativity|ionization\s+energy|electron\s+affinity|chemical\s+bonding|covalent\s+bond|ionic\s+bond|hydrogen\s+bonding|angular\s+and\s+radial\s+nodes|4d\s+orbital|quantum\s+numbers?|electronic\s+configuration|unpaired\s+electrons?|ethyne\s+molecule|triple\s+bond|sp\s+hybrid|beryllium|emerald|beryl)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Periodic Classification, Atomic Structure & Chemical Bonding", "आवर्त वर्गीकरण, परमाणु संरचना एवं रासायनिक आबंधन",
        "science_technology_defence.applied_fundamental_sciences",
        80
    ),
    # Chemistry - Metals, Non-metals, Alloys & Everyday Chemistry
    (
        r'\b(alloys?|bronze|brass|solder|duralumin|stainless\s+steel|amalgam|corrosion|galvanization|rusting\s+of\s+iron|bauxite|haematite|calcination|roasting|electrolysis|cathode|anode|redox\s+reaction|polymers?|synthetic\s+fibres?|nylon|rayon|bakelite|teflon|polyvinyl\s+chloride|pvc|fertilizers?|urea|soaps?\s+and\s+detergents?|magnesium\s+is\s+used|paints?|turpentine\s+oil|manufacturing\s+of\s+glass|chalk\s+\(calcium\s+carbonate\))\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Metals, Alloys, Industrial Chemistry & Materials", "धातुएं, मिश्रधातुएं, औद्योगिक रसायन एवं पदार्थ",
        "science_technology_defence.applied_fundamental_sciences",
        80
    ),
    # Chemistry - Organic Chemistry & Carbon
    (
        r'\b(organic\s+compounds?|hydrocarbons?|alkanes?|alkenes?|alkynes?|methane|ethane|propane|butane|benzene|ethanol|ethyl\s+alcohol|methanol|formaldehyde|allotropes\s+of\s+carbon|diamond|graphite|fullerene|graphene)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Organic Chemistry & Carbon Compounds", "कार्बनिक रसायन एवं कार्बन यौगिक",
        "science_technology_defence.applied_fundamental_sciences",
        80
    ),
    # Biology - Cell Biology & Cytology
    (
        r'\b(mitochondria|chloroplast|ribosomes?|endoplasmic\s+reticulum|golgi\s+apparatus|lysosomes?|cell\s+wall|cell\s+membrane|plasma\s+membrane|nucleus\s+of\s+cell|mitosis|meiosis|chromosomes?|dna\s+and\s+rna|prokaryotic|eukaryotic|cell\s+division)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Biotechnology, Health & Life Sciences", "जैव प्रौद्योगिकी, स्वास्थ्य एवं जीवन विज्ञान",
        "Cell Biology & Cytology", "कोशिका विज्ञान एवं कोशिका संरचना",
        "science_technology_defence.biotechnology_health_life_sciences",
        80
    ),
    # Biology - Plant Physiology & Botany
    (
        r'\b(photosynthesis|respiration\s+in\s+plants|transpiration|xylem|phloem|chlorophyll|stomata|plant\s+hormones?|auxin|gibberellin|cytokinin|abscisic\s+acid|ethylene|phototropism|pollination|fertilization\s+in\s+plants|gymnosperms|angiosperms|bryophytes|pteridophytes|carnivorous\s+plants?|insectivorous|pitcher\s+plant|venus\s+fly\s+trap|sundew)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Biotechnology, Health & Life Sciences", "जैव प्रौद्योगिकी, स्वास्थ्य एवं जीवन विज्ञान",
        "Plant Physiology & Botany", "पादप शरीर क्रिया विज्ञान एवं वनस्पति विज्ञान",
        "science_technology_defence.biotechnology_health_life_sciences",
        80
    ),
    # Biology - Human Physiology & Health
    (
        r'\b(digestive\s+system|circulatory\s+system|respiratory\s+system|nervous\s+system|endocrine\s+glands?|hormones?|insulin|thyroid|pituitary|adrenal|enzymes?|pepsin|trypsin|amylase|hemoglobin|blood\s+groups?|abo\s+system|rh\s+factor|arteries\s+and\s+veins|heart\s+valves?|kidneys?|nephrons?|dialysis|neurons?|synapse|reflex\s+action|red\s+blood\s+cells?|white\s+blood\s+cells?|platelets?|erythrocytes|leukocytes)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Biotechnology, Health & Life Sciences", "जैव प्रौद्योगिकी, स्वास्थ्य एवं जीवन विज्ञान",
        "Human Physiology & Organ Systems", "मानव शरीर क्रिया विज्ञान एवं अंग प्रणालियाँ",
        "science_technology_defence.biotechnology_health_life_sciences",
        80
    ),
    # Biology - Human Health, Diseases, Taxonomy & Genetics
    (
        r'\b(bacterial\s+disease|viral\s+disease|fungal\s+disease|protozoan|pathogen|tuberculosis|malaria|dengue|cholera|typhoid|aids|hiv|covid|vaccines?|antibiotics?|antibodies?|antigens?|immune\s+system|vitamins?\s+deficiency|scurvy|rickets|beriberi|night\s+blindness|anaemia|protein\s+deficiency|kwashiorkor|marasmus|genetics|mendel\'?s\s+laws?|heredity|mutation|crispr|gene\s+therapy|cloning|recombinant\s+dna|taxonomic\s+hierarchy|halophiles|archaebacteria)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Biotechnology, Health & Life Sciences", "जैव प्रौद्योगिकी, स्वास्थ्य एवं जीवन विज्ञान",
        "Human Health, Nutrition, Genetics & Taxonomy", "मानव स्वास्थ्य, पोषण, आनुवंशिकी एवं वर्गिकी",
        "science_technology_defence.biotechnology_health_life_sciences",
        80
    ),
    # Applied Technology, Drones, Multicopters & Scientific Instruments
    (
        r'\b(volocopter|multicopter|drone|unmanned\s+aerial\s+vehicle|uav|ev|electric\s+vehicle|lithium-ion|fuel\s+cell|barometer|manometer|hydrometer|hygrometer|galvanometer|ammeter|voltmeter|seismograph|anemometer|periscope|kaleidoscope)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Applied Science, Electrical Technologies & Scientific Instruments", "अनुप्रयुक्त विज्ञान, विद्युत प्रौद्योगिकियां एवं वैज्ञानिक उपकरण",
        "science_technology_defence.applied_fundamental_sciences",
        80
    )
]

# Stage 2: Contextual Keyword Classifiers for residual questions
STAGE2_RULES = [
    (
        r'\b(constitution|amendment|article\s+\d+|fundamental|parliament|governor|president|lok\s+sabha|rajya\s+sabha|court|judge|judiciary|writs?|election|cag|upsc|schedule|panchayat|ordinance|minister|cabinet)\b',
        "Indian Polity, Constitution & Governance", "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "Salient Features, Amendments & Basic Structure", "प्रमुख विशेषताएं, संशोधन एवं मूल संरचना",
        "Constitutional Provisions & Governance Systems", "संवैधानिक प्रावधान एवं शासन प्रणालियाँ",
        "indian_polity_constitution_governance.salient_features_amendments_basic_structure"
    ),
    (
        r'\b(temple|sculpture|painting|dance|music|philosophy|festival|monument|craft|folk|heritage|literature|poet|author|book|theatre)\b',
        "Art, Culture & Heritage", "कला, संस्कृति एवं विरासत",
        "Indian Architecture & Sculpture", "भारतीय वास्तुकला एवं मूर्तिकला",
        "Indian Art Forms, Cultural Traditions & Heritage", "भारतीय कला रूप, सांस्कृतिक परंपराएं एवं विरासत",
        "art_culture_heritage.indian_architecture_sculpture"
    ),
    (
        r'\b(dynasty|empire|king|sultan|revolt|battle|treaty|british|colonial|viceroy|gandhi|congress|freedom|rebellion|ancient|medieval)\b',
        "History", "इतिहास",
        "Modern India", "आधुनिक भारत",
        "Historical Developments, Dynasties & National Movement", "ऐतिहासिक विकास, राजवंश एवं राष्ट्रीय आंदोलन",
        "history.modern_india"
    ),
    (
        r'\b(river|mountain|soil|plateau|ocean|tide|current|monsoon|climate|latitude|longitude|strait|canal|rock|earthquake|volcano|lake|island|wind|forest|rain)\b',
        "Geography & Earth Systems", "भूगोल एवं भू-प्रणालियाँ",
        "Physical Geography & Earth Systems", "भौतिक भूगोल एवं भू-प्रणालियाँ",
        "Geographical Features, Climate & Physical Systems", "भौगोलिक विशेषताएं, जलवायु एवं भौतिक प्रणालियाँ",
        "geography_earth_systems.physical_geography_earth_systems"
    ),
    (
        r'\b(gdp|inflation|budget|fiscal|deficit|rbi|bank|tax|trade|export|import|currency|rupee|economy|market|poverty|unemployment|crop|agriculture|price)\b',
        "Indian Economy & Development", "भारतीय अर्थव्यवस्था एवं विकास",
        "Macroeconomic Fundamentals & National Income Accounting", "समष्टि आर्थिक आधार एवं राष्ट्रीय आय लेखांकन",
        "Economic Policies, Markets & Development", "आर्थिक नीतियां, बाजार एवं विकास",
        "indian_economy_development.macroeconomic_fundamentals_national_income_accounting"
    ),
    (
        r'\b(species|wildlife|park|sanctuary|tiger|pollution|warming|carbon|ecosystem|biodiversity|wetland|forest|conservation|climate)\b',
        "Environment, Ecology & Disaster Management", "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "Biodiversity, Wildlife Conservation & Protected Areas", "जैव विविधता, वन्यजीव संरक्षण एवं संरक्षित क्षेत्र",
        "Ecology, Environmental Protection & Biodiversity Conservation", "पारिस्थितिकी, पर्यावरण संरक्षण एवं जैव विविधता",
        "environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas"
    ),
    (
        r'\b(united\s+nations|international|treaty|summit|neighbor|border|foreign|global|bilateral|exercise|diplomacy|convention)\b',
        "International Relations & Global Institutions", "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "Global Institutions, Agreements & Treaties", "वैश्विक संस्थाएं, समझौते एवं संधियां",
        "International Fora, Multilateral Treaties & Bilateral Affairs", "अंतर्राष्ट्रीय मंच, बहुपक्षीय संधियां एवं द्विपक्षीय संबंध",
        "international_relations_global_institutions.global_institutions_agreements_treaties"
    ),
    (
        r'\b(police|force|security|naxal|terror|cross-border|insurgency|coastal|defence)\b',
        "Internal Security", "आंतरिक सुरक्षा",
        "Security Forces, Intelligence Agencies & Statutory Mandates", "सुरक्षा बल, खुफिया एजेंसियां एवं सांविधिक अधिकार",
        "Internal Security Architecture & Law Enforcement", "आंतरिक सुरक्षा संरचना एवं विधि प्रवर्तन",
        "internal_security.security_forces_intelligence_agencies_statutory_mandates"
    ),
    (
        r'\b(percent|ratio|average|speed|distance|number|series|figure|square|triangle|digit|code|relation|direction|clock|calendar|graph|table|chart)\b',
        "General Mental Ability, Quantitative Aptitude & Comprehension", "सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता",
        "General Mental Ability & Logical Reasoning", "सामान्य मानसिक योग्यता एवं तार्किक क्षमता",
        "General Problem Solving & Reasoning Aptitude", "सामान्य समस्या समाधान एवं तार्किक अभिरुचि",
        "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning"
    ),
    (
        r'\b(cell|gene|plant|animal|body|disease|acid|chemical|reaction|metal|physics|force|energy|light|wave|satellite|space|computer|software)\b',
        "Science, Technology & Defence", "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "Applied & Fundamental Sciences", "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "Scientific Discoveries, Everyday Physics, Chemistry & Life Sciences", "वैज्ञानिक खोजें, दैनिक भौतिकी, रसायन एवं जीवन विज्ञान",
        "science_technology_defence.applied_fundamental_sciences"
    )
]

def classify_question(q):
    text = (q.get('question_english', '') + ' ' + 
            q.get('explanation_english', '') + ' ' + 
            q.get('option_a_english', '') + ' ' + 
            q.get('option_b_english', '') + ' ' + 
            q.get('option_c_english', '') + ' ' + 
            q.get('option_d_english', '')).lower()
    
    # Pass 1: High-precision specific rules
    for pattern, subj, subj_hi, dom, dom_hi, sub, sub_hi, node_id, prio in sorted(SPECIFIC_RULES, key=lambda x: -x[8]):
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

    # Pass 2: Secondary Contextual Keyword rules
    for pattern, subj, subj_hi, dom, dom_hi, sub, sub_hi, node_id in STAGE2_RULES:
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

    # Pass 3: Safe default fallback
    return {
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Applied & Fundamental Sciences",
        "domain_hindi": "अनुप्रयुक्त एवं मूलभूत विज्ञान",
        "sub_topic": "General Scientific Principles & Everyday Applications",
        "sub_topic_hindi": "सामान्य वैज्ञानिक सिद्धांत एवं दैनिक अनुप्रयोग",
        "node_id": "science_technology_defence.applied_fundamental_sciences",
        "tags": [
            "PYQ",
            f"UPSC CAPF {q.get('year')}",
            "Paper 1",
            "Science",
            "Applied Sciences"
        ]
    }

def main():
    files = sorted(glob.glob('src/data/upsc_capf/*.json'))
    print(f"Applying Universal Classification Engine across {len(files)} CAPF files...")
    
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
            
    print(f"\n==========================================")
    print(f"ENRICHMENT COMPLETE!")
    print(f"Total questions processed: {total_processed}")
    print(f"Default fallback questions remaining: {fallback_count} ({fallback_count/total_processed*100:.2f}%)")
    print(f"Successfully categorised: {total_processed - fallback_count} ({(total_processed - fallback_count)/total_processed*100:.2f}%)")
    print(f"==========================================")
    print("\nSubject Breakdown across entire 13-year UPSC CAPF dataset:")
    for s, count in sorted(subject_counts.items(), key=lambda x: -x[1]):
        print(f"  * {s}: {count} questions ({count/total_processed*100:.1f}%)")

if __name__ == "__main__":
    main()
