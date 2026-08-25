# -*- coding: utf-8 -*-
"""
Script to enrich src/data/upsc_pyq/csat/2020_csat.json with official Knowledge Graph taxonomy.
"""

import json
import os

SUBJECT_EN = "General Mental Ability, Quantitative Aptitude & Comprehension"
SUBJECT_HI = "सामान्य मानसिक योग्यता, मात्रात्मक अभियोग्यता एवं बोधगम्यता"

DOMAIN_RC_EN = "Reading Comprehension & Interpersonal Skills"
DOMAIN_RC_HI = "बोधगम्यता एवं अंतर-वैयक्तिक कौशल"

DOMAIN_QA_EN = "Quantitative Aptitude & Basic Numeracy"
DOMAIN_QA_HI = "मात्रात्मक अभियोग्यता एवं मूल संख्यात्मकता (कक्षा X स्तर)"

DOMAIN_LR_EN = "General Mental Ability & Logical Reasoning"
DOMAIN_LR_HI = "सामान्य मानसिक योग्यता एवं तार्किक तर्कशक्ति"

# Canonical Node IDs
NODE_RC_INFERENCE = "general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference"
NODE_RC_CRITICAL = "general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.critical_reasoning_analytical_ability"
NODE_RC_COMM = "general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills"

NODE_QA_NUMBERS = "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic"
NODE_QA_PERCENT_RATIO = "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion"
NODE_QA_PROFIT_INTEREST = "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount"
NODE_QA_TIME_WORK_DIST = "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance"
NODE_QA_PNC_PROB = "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability"
NODE_QA_MENSURATION = "general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry"

NODE_LR_DEDUCTIVE = "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning"
NODE_LR_DI_DS = "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency"
NODE_LR_PATTERNS = "general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition"

# Detailed question-by-question mapping dictionary
MAP = {
    1: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Passage Inference & Central Idea (Employment & Social Sector Spending)",
        "sub_topic_hindi": "परिच्छेद निष्कर्ष एवं केंद्रीय विचार (रोज़गार एवं सामाजिक क्षेत्र व्यय)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Employment Generation", "Social Sector"]
    },
    2: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Assumption Testing & Privacy Rights in Digital Economy",
        "sub_topic_hindi": "पूर्वधारणा परीक्षण एवं डिजिटल अर्थव्यवस्था में निजता के अधिकार",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Right to Privacy", "Digital Governance"]
    },
    3: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Ecological System Inference & Wetland Conservation",
        "sub_topic_hindi": "पारिस्थितिक तंत्र निष्कर्ष एवं आर्द्रभूमि संरक्षण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Wetlands Ecology", "Water Resources"]
    },
    4: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Author's Tone & Asset Allocation Strategy",
        "sub_topic_hindi": "लेखक की सलाह एवं संपत्ति आवंटन रणनीति",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Financial Risk", "Asset Allocation"]
    },
    5: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Assumption Testing in Agricultural Biotechnology Regulation",
        "sub_topic_hindi": "कृषि जैव प्रौद्योगिकी नियमन में पूर्वधारणा परीक्षण",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Biotechnology Regulation", "GM Crops"]
    },
    6: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Crux Identification (Scope of Agricultural Biotechnology)",
        "sub_topic_hindi": "परिच्छेद का मर्म (कृषि जैव प्रौद्योगिकी का दायरा)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Crux Analysis", "Biotechnology"]
    },
    7: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Trailing Zeroes in Products & Factorization (Powers of 2 and 5)",
        "sub_topic_hindi": "गुणनफल में अंतिम शून्य एवं गुणनखंडन (2 और 5 की घातें)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Trailing Zeroes", "Factorization"]
    },
    8: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "3-Digit Permutative Place Value & Divisibility Properties",
        "sub_topic_hindi": "तीन-अंकीय स्थानीय मान योग एवं विभाज्यता गुणधर्म",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Place Value", "Divisibility Rules"]
    },
    9: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Linear Equations & Inequality Comparison of Natural Numbers",
        "sub_topic_hindi": "रैखिक समीकरण एवं प्राकृतिक संख्याओं की तुलना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Algebraic Equalities", "Natural Numbers"]
    },
    10: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Digit Sum Rule for Divisibility by 3 & Prime Number Testing",
        "sub_topic_hindi": "3 से विभाज्यता का अंक-योग नियम एवं अभाज्य संख्या परीक्षण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Prime Numbers", "Divisibility by 3"]
    },
    11: {
        "node_id": NODE_LR_PATTERNS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Cryptarithmetic & Single Symbol Digit Substitution",
        "sub_topic_hindi": "अंक पहेली एवं प्रतीक अंक प्रतिस्थापन",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Cryptarithmetic", "Place Value Puzzles"]
    },
    12: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "HCF and GCD of Decimals / Fractions in Length Measurement",
        "sub_topic_hindi": "दशमलव/भिन्न का महत्तम समापवर्तक (HCF) एवं लंबाई मापन",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "HCF", "Decimals & Fractions"]
    },
    13: {
        "node_id": NODE_LR_PATTERNS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Prime Number Generation via Sequence Operations",
        "sub_topic_hindi": "अनुक्रम संक्रियाओं द्वारा अभाज्य संख्या निर्माण",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Number Series", "Prime Numbers"]
    },
    14: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Sum of First n Natural Numbers & Torn Page Page-Pair Problem",
        "sub_topic_hindi": "प्रथम n प्राकृतिक संख्याओं का योग एवं फटे पन्नों की संख्या ज्ञात करना",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Arithmetic Progression", "Sum of Integers"]
    },
    15: {
        "node_id": NODE_LR_PATTERNS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Letter Sequence Pattern Completion & Repeating Blocks",
        "sub_topic_hindi": "वर्ण अनुक्रम पैटर्न पूर्णता एवं पुनरावर्ती खंड",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Letter Series", "Pattern Completion"]
    },
    16: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Cryptarithmetic Subtraction & Distinct Digits Place Value",
        "sub_topic_hindi": "अंकगणितीय व्यवकलन (घटाव) पहेली एवं स्थानीय मान",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Cryptarithmetic", "Place Value"]
    },
    17: {
        "node_id": NODE_LR_DI_DS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Data Sufficiency in Geometry (Circles & Point Coordinates)",
        "sub_topic_hindi": "ज्यामिति में आंकड़े की पर्याप्तता (वृत्त एवं निर्देशांक बिंदु)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Data Sufficiency", "Geometry", "Coordinate Logic"]
    },
    18: {
        "node_id": NODE_QA_PERCENT_RATIO,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Weighted Averages & Class Proportion Determination",
        "sub_topic_hindi": "भारित औसत एवं कक्षा अनुपात निर्धारण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Weighted Averages", "Mixtures & Allegations"]
    },
    19: {
        "node_id": NODE_LR_DEDUCTIVE,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Blood Relations, Family Tree & Gender Logic",
        "sub_topic_hindi": "रक्त संबंध, पारिवारिक वृक्ष एवं लिंग निर्धारण तर्क",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Blood Relations", "Family Tree"]
    },
    20: {
        "node_id": NODE_LR_DEDUCTIVE,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Calendar Odd Days & Leap Year vs Ordinary Year Day-Matching",
        "sub_topic_hindi": "कैलेंडर विषम दिन एवं लीप वर्ष बनाम सामान्य वर्ष वार गणना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Clocks & Calendar", "Odd Days"]
    },
    21: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Implicit Assumptions in Renewable Energy Import Strategy",
        "sub_topic_hindi": "नवीकरणीय ऊर्जा आयात रणनीति में अंतर्निहित पूर्वधारणाएँ",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Renewable Energy", "Critical Assumptions"]
    },
    22: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Practical Implications for Solar Energy Ecosystem in India",
        "sub_topic_hindi": "भारत में सौर ऊर्जा पारिस्थितिकी तंत्र के व्यावहारिक निहितार्थ",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Solar Energy", "Policy Implications"]
    },
    23: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Fiscal Policy & Progressive Taxation Assumptions",
        "sub_topic_hindi": "राजकोषीय नीति एवं प्रगतिशील कराधान पूर्वधारणाएँ",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Taxation", "Income Inequality"]
    },
    24: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Crucial Message on Tax Revenues & Inclusive Growth",
        "sub_topic_hindi": "कर राजस्व एवं समावेशी विकास पर महत्वपूर्ण संदेश",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Inclusive Growth", "Tax Policy"]
    },
    25: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Assumption Testing on Urbanization & Spatial Inequality",
        "sub_topic_hindi": "शहरीकरण एवं स्थानिक असमानता पर पूर्वधारणा परीक्षण",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Urban Planning", "Agglomeration"]
    },
    26: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Assumptions on Structural Transformation in Agriculture",
        "sub_topic_hindi": "कृषि में संरचनात्मक रूपांतरण संबंधी पूर्वधारणाएँ",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Agrarian Economy", "Rural Distress"]
    },
    27: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Critical Message on Institutional Support for Small Farmers",
        "sub_topic_hindi": "लघु किसानों के संस्थागत समर्थन पर महत्वपूर्ण संदेश",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Smallholder Agriculture", "Farmer Support"]
    },
    28: {
        "node_id": NODE_LR_DI_DS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Data Sufficiency in Linear Inequality Ordering",
        "sub_topic_hindi": "रैखिक असमानता क्रम में आंकड़े की पर्याप्तता",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Data Sufficiency", "Inequalities", "Ordering"]
    },
    29: {
        "node_id": NODE_LR_DI_DS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Data Sufficiency in Prime Number Testing & Modular Remainders",
        "sub_topic_hindi": "अभाज्य संख्या एवं शेषफल परीक्षण में आंकड़े की पर्याप्तता",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Data Sufficiency", "Prime Numbers", "Modular Arithmetic"]
    },
    30: {
        "node_id": NODE_LR_DI_DS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Data Sufficiency in Quadratic Number Pairs (Product & Sum)",
        "sub_topic_hindi": "द्विघाती संख्या युग्म (गुणनफल एवं योग) में आंकड़े की पर्याप्तता",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Data Sufficiency", "Number Properties", "Simultaneous Equations"]
    },
    31: {
        "node_id": NODE_LR_DEDUCTIVE,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Direction Sense Test & Spatial Navigation",
        "sub_topic_hindi": "दिशा ज्ञान परीक्षण एवं स्थानिक संचलन",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Direction Sense", "Spatial Logic"]
    },
    32: {
        "node_id": NODE_LR_DEDUCTIVE,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Deductive Syllogism & Divisibility Predicate Logic",
        "sub_topic_hindi": "न्याय वाक्य (सिलोगिज़्म) एवं विभाज्यता तर्कशास्त्र",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Syllogism", "Deductive Logic"]
    },
    33: {
        "node_id": NODE_LR_DEDUCTIVE,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Categorical Syllogism & Venn Diagram Deductions",
        "sub_topic_hindi": "वर्गिक न्याय वाक्य एवं वेन आरेख निष्कर्ष",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Syllogism", "Venn Diagrams"]
    },
    34: {
        "node_id": NODE_LR_PATTERNS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Conditional Odd-Even Sequence Counting",
        "sub_topic_hindi": "प्रतिबंधित सम-विषम अनुक्रम गणना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Number Sequence", "Pattern Recognition"]
    },
    35: {
        "node_id": NODE_LR_PATTERNS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Linear Order, Ranking & Left-Right Position Shifting",
        "sub_topic_hindi": "रैखिक क्रम व्यवस्था, रैंकिंग एवं स्थिति परिवर्तन",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Order and Ranking", "Linear Arrangement"]
    },
    36: {
        "node_id": NODE_LR_DI_DS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "3-Statement Data Sufficiency in Age Ordering Logic",
        "sub_topic_hindi": "आयु क्रम तर्क में 3-कथन आंकड़े की पर्याप्तता",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Data Sufficiency", "Age Ordering", "Inequality Chains"]
    },
    37: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Digit Inclusion Counting & Divisibility Exclusion",
        "sub_topic_hindi": "अंक समावेश गणना एवं विभाज्यता अपवर्जन",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Digit Counting", "Divisibility by 4"]
    },
    38: {
        "node_id": NODE_QA_MENSURATION,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "3D Solid Cube Volume Ratios & Density Equations",
        "sub_topic_hindi": "3D ठोस घन आयतन अनुपात एवं घनत्व समीकरण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Mensuration & Geometry", "Cubes", "Volume & Density"]
    },
    39: {
        "node_id": NODE_QA_PERCENT_RATIO,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Average Age Calculation & Multi-Variable Age System",
        "sub_topic_hindi": "औसत आयु गणना एवं बहु-चर आयु प्रणाली",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Averages", "Age Problems"]
    },
    40: {
        "node_id": NODE_QA_PROFIT_INTEREST,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Cost Price, Selling Price & Loss Percentage Calculation",
        "sub_topic_hindi": "क्रय मूल्य, विक्रय मूल्य एवं हानि प्रतिशत गणना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Profit and Loss", "Commercial Math"]
    },
    41: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Critical Message on Groundwater Depletion & Irrigation Management",
        "sub_topic_hindi": "भूजल ह्रास एवं सिंचाई प्रबंधन पर महत्वपूर्ण संदेश",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Groundwater", "Water Policy"]
    },
    42: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Practical Implications for Water Pricing & Crop Pattern Shifting",
        "sub_topic_hindi": "जल मूल्य निर्धारण एवं फसल चक्र बदलाव के व्यावहारिक निहितार्थ",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Irrigation Policy", "Crop Diversification"]
    },
    43: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Rational Inferences on Global Geopolitics & Regional Groupings",
        "sub_topic_hindi": "वैश्विक भू-राजनीति एवं क्षेत्रीय गुटों पर तर्कसंगत निष्कर्ष",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "International Relations", "Multilateralism"]
    },
    44: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Assumptions on Multilateral Governance & Global Hegemony",
        "sub_topic_hindi": "बहुपक्षीय शासन एवं वैश्विक प्रभुत्व संबंधी पूर्वधारणाएँ",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Global Governance", "Critical Assumptions"]
    },
    45: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Inference on Democracy, Minority Rights & Constitution",
        "sub_topic_hindi": "लोकतंत्र, अल्पसंख्यक अधिकार एवं संविधान पर निष्कर्ष",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Constitutionalism", "Democracy"]
    },
    46: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Assumptions on Fundamental Rights vs Majority Rule",
        "sub_topic_hindi": "मूल अधिकार बनाम बहुमत शासन संबंधी पूर्वधारणाएँ",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Majority Rule", "Fundamental Rights"]
    },
    47: {
        "node_id": NODE_QA_PROFIT_INTEREST,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Successive Percentage Discounts Comparison",
        "sub_topic_hindi": "क्रमिक प्रतिशत छूटों की तुलना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Discounts", "Commercial Math"]
    },
    48: {
        "node_id": NODE_LR_PATTERNS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Alphabet Alphabetical Positional Values & Arithmetic Coding",
        "sub_topic_hindi": "वर्णमाला स्थितीय मान एवं अंकगणितीय कोडिंग",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Coding-Decoding", "Letter Positions"]
    },
    49: {
        "node_id": NODE_LR_PATTERNS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Letter Cluster Analogy & Alphabet Shift Patterns",
        "sub_topic_hindi": "अक्षर समूह सादृश्यता एवं वर्णमाला विस्थापन पैटर्न",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Analogy", "Letter Shifts"]
    },
    50: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Laws of Exponents, Negative Indices & Magnitude Comparison",
        "sub_topic_hindi": "घातांक नियम, ऋणात्मक घातें एवं परिमाण तुलना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Exponents & Powers", "Number Comparison"]
    },
    51: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "HCF of Mixed Fractions & Unit Conversion in Lengths",
        "sub_topic_hindi": "मिश्रित भिन्नों का महत्तम समापवर्तक (HCF) एवं लंबाई इकाई रूपांतरण",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "HCF of Fractions", "Mensuration Units"]
    },
    52: {
        "node_id": NODE_LR_DI_DS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Demographic Table Data Interpretation (Natural Growth Rate)",
        "sub_topic_hindi": "जनसांख्यिकीय तालिका आँकड़ा व्याख्या (प्राकृतिक संवृद्धि दर)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Data Interpretation", "Tables", "Demographics"]
    },
    53: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Recurring Decimal Conversion to Rational Fractions",
        "sub_topic_hindi": "आवर्ती दशमलव का परिमेय भिन्न में रूपांतरण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Recurring Decimals", "Fractions"]
    },
    54: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "LCM & Constant Remainder Theorem for 4-Digit Integers",
        "sub_topic_hindi": "लघुत्तम समापवर्त्य (LCM) एवं 4-अंकीय संख्याओं के लिए शेषफल प्रमेय",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "LCM", "Remainder Theorem"]
    },
    55: {
        "node_id": NODE_QA_PERCENT_RATIO,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Demographic Percentage & Marriage Proportion Equations",
        "sub_topic_hindi": "जनसंख्या प्रतिशत एवं वैवाहिक अनुपात समीकरण",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Percentages", "Ratio & Proportion"]
    },
    56: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Modular Arithmetic, Factor Cancellation & Remainder in Large Products",
        "sub_topic_hindi": "मॉड्यूलर अंकगणित, गुणनखंड निरसन एवं वृहद् गुणनफल शेषफल",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Remainders", "Modular Arithmetic"]
    },
    57: {
        "node_id": NODE_QA_PERCENT_RATIO,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Fractional Ratio Simplification & Monetary Distribution",
        "sub_topic_hindi": "भिन्न अनुपातों का सरलीकरण एवं धनराशि वितरण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Ratio & Proportion", "Division of Amounts"]
    },
    58: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Digit Sum of Powers of Ten Expressions (10^n + 1)",
        "sub_topic_hindi": "दस की घात व्यंजकों (10^n + 1) के अंकों का योग",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Powers of 10", "Sum of Digits"]
    },
    59: {
        "node_id": NODE_QA_PERCENT_RATIO,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Group Averages & Inter-Group Transfer Invariance",
        "sub_topic_hindi": "समूह औसत एवं अंतर-समूह स्थानांतरण अपरिवर्तनीयता",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Averages", "Class Distribution"]
    },
    60: {
        "node_id": NODE_QA_PNC_PROB,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Combinatorial Sums & Currency Denomination Counting",
        "sub_topic_hindi": "क्रमचय-संचय योग एवं मुद्रा मूल्यवर्ग गणना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Permutation & Combination", "Combinatorics", "Distinct Sums"]
    },
    61: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Passage Inference on Banking System Non-Performing Assets (NPAs)",
        "sub_topic_hindi": "बैंकिंग प्रणाली में गैर-निष्पादित परिसंपत्तियों (NPA) पर निष्कर्ष",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Banking Sector", "Financial Stability"]
    },
    62: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Inference on Air Pollution Dynamics & Meteorological Trapping",
        "sub_topic_hindi": "वायु प्रदूषण गतिशीलता एवं मौसम संबंधी अवरोध पर निष्कर्ष",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Air Pollution", "Atmospheric Science"]
    },
    63: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Assumptions on Biomass Burning, Automation & Agricultural Subsidies",
        "sub_topic_hindi": "बायोमास दहन, स्वचालन एवं कृषि सब्सिडी संबंधी पूर्वधारणाएँ",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Stubble Burning", "Critical Assumptions"]
    },
    64: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Assumptions on Intellectual Property Rights & Traditional Knowledge",
        "sub_topic_hindi": "बौद्धिक संपदा अधिकार एवं पारंपरिक ज्ञान संबंधी पूर्वधारणाएँ",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Intellectual Property", "Biopiracy"]
    },
    65: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Critical Message on Telemedicine & Rural Healthcare Access",
        "sub_topic_hindi": "टेलीमेडिसिन एवं ग्रामीण स्वास्थ्य सेवा पहुँच पर महत्वपूर्ण संदेश",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Healthcare", "Telemedicine"]
    },
    66: {
        "node_id": NODE_RC_INFERENCE,
        "domain": DOMAIN_RC_EN,
        "domain_hindi": DOMAIN_RC_HI,
        "sub_topic": "Inference on Early Childhood Malnutrition & Cognitive Development",
        "sub_topic_hindi": "बाल्यावस्था कुपोषण एवं संज्ञानात्मक विकास पर निष्कर्ष",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Reading Comprehension", "Child Health", "Cognitive Development"]
    },
    67: {
        "node_id": NODE_QA_PNC_PROB,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Word Permutations with Letter Repetition & Distinct Combinations",
        "sub_topic_hindi": "पुनरावर्ती अक्षरों से शब्द निर्माण एवं क्रमचय गणना",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Permutation & Combination", "Arrangements", "Word Formation"]
    },
    68: {
        "node_id": NODE_QA_PERCENT_RATIO,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Repeated Liquid Replacement & Mixture Dilution Formula",
        "sub_topic_hindi": "क्रमिक द्रव प्रतिस्थापन एवं मिश्रण तनुकरण सूत्र",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Mixtures & Alligations", "Replacement Formula"]
    },
    69: {
        "node_id": NODE_QA_PERCENT_RATIO,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Batting Averages Progression & Score Calculation",
        "sub_topic_hindi": "बल्लेबाजी औसत संवृद्धि एवं पारी स्कोर गणना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Averages", "Sports Arithmetic"]
    },
    70: {
        "node_id": NODE_QA_PERCENT_RATIO,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Price Hike & Consumption Reduction (Expenditure Invariance)",
        "sub_topic_hindi": "मूल्य वृद्धि एवं उपभोग में कमी (व्यय अपरिवर्तनीयता)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Percentages", "Price & Consumption"]
    },
    71: {
        "node_id": NODE_QA_TIME_WORK_DIST,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Work-Rate Percentages & Combined Task Completion Time",
        "sub_topic_hindi": "कार्य-दर प्रतिशत एवं संयुक्त कार्य पूर्णता समय",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Time, Work & Distance", "Time and Work", "Work Rate"]
    },
    72: {
        "node_id": NODE_QA_TIME_WORK_DIST,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Harmonic Mean of Speeds for Round Trips (Average Speed)",
        "sub_topic_hindi": "आवागमन फेरों के लिए गतियों का हरात्मक माध्य (औसत गति)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Time, Work & Distance", "Average Speed", "Harmonic Mean"]
    },
    73: {
        "node_id": NODE_QA_MENSURATION,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Geometric Intersections of Straight Lines and Circles",
        "sub_topic_hindi": "सरल रेखाओं एवं वृत्तों के ज्यामितीय प्रतिच्छेदन बिंदु",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Mensuration & Geometry", "Geometry", "Intersections"]
    },
    74: {
        "node_id": NODE_QA_TIME_WORK_DIST,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Relative Speed in Upstream and Downstream Rowing",
        "sub_topic_hindi": "धारा के अनुकूल एवं प्रतिकूल नौकायन में सापेक्ष गति",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Time, Work & Distance", "Boats and Streams", "Relative Speed"]
    },
    75: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Difference of Two Squares & Natural Number Factor Pairs (x^2 - y^2 = k)",
        "sub_topic_hindi": "दो वर्गों का अंतर एवं प्राकृतिक संख्या गुणनखंड युग्म (x^2 - y^2 = k)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Difference of Squares", "Factor Pairs"]
    },
    76: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Sensitivity of Fractional Values to Constant Additive Shifts",
        "sub_topic_hindi": "स्थिर योगात्मक विस्थापन के प्रति भिन्न मानों की संवेदनशीलता",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Fractions", "Percentage Change"]
    },
    77: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Compound Divisibility Rules (Divisible by 3 but Not by 6)",
        "sub_topic_hindi": "मिश्रित विभाज्यता नियम (3 से विभाज्य किंतु 6 से नहीं)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Number System", "Divisibility Rules", "Even-Odd Logic"]
    },
    78: {
        "node_id": NODE_QA_MENSURATION,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Metric Unit Conversions in Volume, Mass & Cubic Millimetres",
        "sub_topic_hindi": "आयतन, द्रव्यमान एवं घन मिलीमीटर में मीट्रिक इकाई रूपांतरण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Mensuration & Geometry", "Metric Units", "Volume Conversion"]
    },
    79: {
        "node_id": NODE_QA_NUMBERS,
        "domain": DOMAIN_QA_EN,
        "domain_hindi": DOMAIN_QA_HI,
        "sub_topic": "Linear Weight Systems (Vessel Tare Weight & Fluid Volume)",
        "sub_topic_hindi": "रैखिक भार प्रणाली (पात्र का भार एवं द्रव आयतन)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Basic Numeracy", "Linear Equations", "Word Problems"]
    },
    80: {
        "node_id": NODE_LR_PATTERNS,
        "domain": DOMAIN_LR_EN,
        "domain_hindi": DOMAIN_LR_HI,
        "sub_topic": "Slippery Well Clambering Progression & Net Displacement Puzzles",
        "sub_topic_hindi": "फिसलनदार कुआँ चढ़ाई पहेली एवं कुल विस्थापन गणना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2020", "CSAT", "Paper 2", "Logical Reasoning", "Climbing Puzzles", "Progression"]
    }
}

def main():
    json_path = os.path.join('src', 'data', 'upsc_pyq', 'csat', '2020_csat.json')
    with open(json_path, 'r', encoding='utf-8') as f:
        questions = json.load(f)

    print(f"Loaded {len(questions)} questions from {json_path}")

    for q in questions:
        num = q['question_number']
        if num in MAP:
            m = MAP[num]
            q['node_id'] = m['node_id']
            q['subject'] = SUBJECT_EN
            q['subject_hindi'] = SUBJECT_HI
            q['domain'] = m['domain']
            q['domain_hindi'] = m['domain_hindi']
            q['sub_topic'] = m['sub_topic']
            q['sub_topic_hindi'] = m['sub_topic_hindi']
            q['difficulty'] = m['difficulty']
            q['tags'] = m['tags']
        else:
            print(f"WARNING: Question {num} not found in map!")

    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(questions, f, ensure_ascii=False, indent=4)

    print("Successfully updated 2020_csat.json with Knowledge Graph taxonomy metadata!")

if __name__ == '__main__':
    main()
