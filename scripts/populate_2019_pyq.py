import json
import os

# Load existing 2019.json
with open("src/data/upsc_pyq/2019.json", "r", encoding="utf-8") as f:
    questions = json.load(f)

# Define full mappings for all 100 questions of UPSC CSE Prelims 2019 Paper 1
mappings = {
    1: {
        "node_id": "history.medieval_india.mughal_empire.mughal_administration_agrarian_system",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Medieval India",
        "domain_hindi": "मध्यकालीन भारत",
        "sub_topic": "Mughal Administration, Jagirdari System & Agrarian Structure",
        "sub_topic_hindi": "मुगल प्रशासन, जागीरदारी व्यवस्था एवं कृषि संरचना",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Mughal India", "Jagirdar", "Zamindar", "Land Revenue Assignment"]
    },
    2: {
        "node_id": "history.post-independence_india.planned_economy_agrarian_reforms_industrial_transformation.agrarian_reforms_food_security",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Post-Independence India",
        "domain_hindi": "स्वतंत्रता के बाद का भारत",
        "sub_topic": "Land Reforms & Land Ceiling Legislation in Independent India",
        "sub_topic_hindi": "स्वतंत्र भारत में भूमि सुधार एवं भूमि जोत सीमा कानून",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Land Reforms", "Land Ceiling", "Zamindari Abolition", "Tenancy Reforms"]
    },
    3: {
        "node_id": "international_relations_global_institutions.global_economic_financial_architecture.wef_wipo_unctad_bis",
        "subject": "International Relations & Global Institutions",
        "subject_hindi": "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "domain": "Global Economic, Trade & Financial Architecture",
        "domain_hindi": "वैश्विक आर्थिक, व्यापारिक एवं वित्तीय संरचना",
        "sub_topic": "World Economic Forum (WEF) Reports & Global Competitiveness Index",
        "sub_topic_hindi": "विश्व आर्थिक मंच (WEF) रिपोर्टें एवं वैश्विक प्रतिस्पर्धात्मकता सूचकांक",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "World Economic Forum", "Global Competitiveness Report", "WEF Indices"]
    },
    4: {
        "node_id": "history.modern_india.constitutional_development_under_british_rule.charter_act_1813_1833_1853",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Modern India",
        "domain_hindi": "आधुनिक भारत",
        "sub_topic": "Charter Act of 1813: Trade Monopoly Abolition & Education Grant",
        "sub_topic_hindi": "1813 का चार्टर अधिनियम: व्यापारिक एकाधिकार की समाप्ति एवं शिक्षा अनुदान",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Charter Act 1813", "East India Company Monopoly", "British Crown Sovereignty"]
    },
    5: {
        "node_id": "history.indian_freedom_struggle.partition_of_bengal_swadeshi_movement.swadeshi_boycott_movement_dynamics",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Indian Freedom Struggle",
        "domain_hindi": "भारतीय स्वतंत्रता संग्राम",
        "sub_topic": "Swadeshi Movement, Indigenous Crafts & National Council of Education",
        "sub_topic_hindi": "स्वदेशी आंदोलन, स्वदेशी शिल्प एवं राष्ट्रीय शिक्षा परिषद",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Swadeshi Movement", "National Council of Education", "Bengal Partition 1905"]
    },
    6: {
        "node_id": "history.modern_india.socio-religious_reform_movements_caste_movements.caste_backward_class_movements_dalit_assertion",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Modern India",
        "domain_hindi": "आधुनिक भारत",
        "sub_topic": "Socio-Political Movements: Anti-Untouchability League, Kisan Sabha & Self-Respect Movement",
        "sub_topic_hindi": "सामाजिक-राजनीतिक आंदोलन: अस्पृश्यता विरोधी लीग, किसान सभा एवं आत्म-सम्मान आंदोलन",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Mahatma Gandhi", "Swami Sahajanand Saraswati", "E.V. Ramasamy Periyar", "Kisan Sabha"]
    },
    7: {
        "node_id": "history.ancient_india.indus_valley_civilisation.major_harappan_sites_settlement_patterns",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Ancient India",
        "domain_hindi": "प्राचीन भारत",
        "sub_topic": "Harappan Sites vs Mauryan Epigraphical Sites (Sohgaura Copper Plate)",
        "sub_topic_hindi": "हड़प्पा स्थल बनाम मौर्यकालीन अभिलेख स्थल (सोहगौरा ताम्रपत्र)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Indus Valley Civilisation", "Harappan Sites", "Sohgaura", "Kot Diji", "Chanhudaro"]
    },
    8: {
        "node_id": "history.ancient_india.mauryan_empire.ashokan_inscriptions_edicts_dhamma",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Ancient India",
        "domain_hindi": "प्राचीन भारत",
        "sub_topic": "Ashokan Inscriptions & Kanaganahalli Stone Portrait (Ranyo Ashoka)",
        "sub_topic_hindi": "अशोक के अभिलेख एवं कंगनहल्ली प्रस्तर चित्र (रायो अशोक)",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Emperor Ashoka", "Kanaganahalli", "Ranyo Ashoka", "Mauryan Epigraphy"]
    },
    9: {
        "node_id": "history.ancient_india.vedic_period_heterodox_sects_buddhism_jainism.buddhism_core_philosophy_schisms_councils",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Ancient India",
        "domain_hindi": "प्राचीन भारत",
        "sub_topic": "Mahayana Buddhism Features: Deification of Buddha, Bodhisattvas & Image Worship",
        "sub_topic_hindi": "महायान बौद्ध धर्म की विशेषताएं: बुद्ध का दैवीकरण, बोधिसत्व एवं मूर्ति पूजा",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Mahayana Buddhism", "Bodhisattva", "Image Worship", "Buddhist Schisms"]
    },
    10: {
        "node_id": "history.ancient_india.gupta_empire.gupta_administration_society_economy",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Ancient India",
        "domain_hindi": "प्राचीन भारत",
        "sub_topic": "Gupta Period Socio-Economic System & Forced Labour (Vishti)",
        "sub_topic_hindi": "गुप्तकालीन सामाजिक-आर्थिक व्यवस्था एवं बेगार/बलात् श्रम (विष्टि)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Gupta Empire", "Vishti", "Forced Labour", "Ancient Indian Taxation"]
    },
    11: {
        "node_id": "history.medieval_india.vijayanagara_bahmani_kingdoms.vijayanagara_art_architecture_cultural_zenith",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Medieval India",
        "domain_hindi": "मध्यकालीन भारत",
        "sub_topic": "Vijayanagara Temple Architecture: Kalyana Mandapas & Raya Gopurams",
        "sub_topic_hindi": "विजयनगर मंदिर वास्तुकला: कल्याण मंडप एवं राय गोपुरम",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Vijayanagara Empire", "Kalyana Mandapa", "Dravidian Temple Architecture"]
    },
    12: {
        "node_id": "history.medieval_india.delhi_sultanate.delhi_sultanate_administration_iqta_agrarian_system",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Medieval India",
        "domain_hindi": "मध्यकालीन भारत",
        "sub_topic": "Delhi Sultanate Administration: Revenue Collection (Amil) & Iqta System",
        "sub_topic_hindi": "दिल्ली सल्तनत प्रशासन: राजस्व संग्रहण (आमिल) एवं इक्ता प्रणाली",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Delhi Sultanate", "Amil", "Iqta System", "Mir Bakshi"]
    },
    13: {
        "node_id": "history.medieval_india.bhakti_sufi_movements.bhakti_saints_traditions_saguna_nirguna",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Medieval India",
        "domain_hindi": "मध्यकालीन भारत",
        "sub_topic": "Bhakti & Sufi Traditions: Chronology of Nimbarka, Kabir & Shaikh Ahmad Sirhindi",
        "sub_topic_hindi": "भक्ति एवं सूफी परंपराएं: निम्बार्क, कबीर एवं शेख अहमद सरहिंदी का कालक्रम",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Bhakti Movement", "Saint Nimbarka", "Kabir", "Shaikh Ahmad Sirhindi"]
    },
    14: {
        "node_id": "history.indian_freedom_struggle.emergence_of_gandhi_early_movements.champaran_kheda_ahmedabad_mill_strike",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Indian Freedom Struggle",
        "domain_hindi": "भारतीय स्वतंत्रता संग्राम",
        "sub_topic": "Gandhian Interventions: Abolition of Indentured Labour & WWI War Conference",
        "sub_topic_hindi": "गांधीवादी हस्तक्षेप: गिरमिटिया श्रम प्रथा की समाप्ति एवं प्रथम विश्व युद्ध सम्मेलन",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Mahatma Gandhi", "Indentured Labour", "WWI Delhi War Conference", "Lord Chelmsford"]
    },
    15: {
        "node_id": "history.indian_freedom_struggle.revolutionary_movements_left_wing_growth.growth_of_socialist_communist_left_movements",
        "subject": "History",
        "subject_hindi": "इतिहास",
        "domain": "Indian Freedom Struggle",
        "domain_hindi": "भारतीय स्वतंत्रता संग्राम",
        "sub_topic": "Leaders & Political Organisations: Tej Bahadur Sapru, K.C. Neogy & P.C. Joshi",
        "sub_topic_hindi": "नेता एवं राजनीतिक संगठन: तेज बहादुर सप्रू, के.सी. नियोगी एवं पी.सी. जोशी",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Tej Bahadur Sapru", "Liberal Federation", "K.C. Neogy", "P.C. Joshi", "CPI"]
    },
    16: {
        "node_id": "art_culture_heritage.indian_music_classical_traditions.hindustani_classical_music_gharanas_dhrupad_khayal",
        "subject": "Art, Culture & Heritage",
        "subject_hindi": "कला, संस्कृति एवं विरासत",
        "domain": "Indian Music & Classical Traditions",
        "domain_hindi": "भारतीय संगीत एवं शास्त्रीय परंपराएं",
        "sub_topic": "Mian Tansen: Dhrupad Compositions, Royal Patronage & Raga Creation",
        "sub_topic_hindi": "मियां तानसेन: ध्रुपद रचनाएं, राज्याश्रय एवं नए रागों का सृजन",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Mian Tansen", "Akbar Navratnas", "Dhrupad", "Hindustani Music"]
    },
    17: {
        "node_id": "art_culture_heritage.indian_paintings_murals_miniature_schools.mughal_miniature_painting_karkhanas_thematic_zenith",
        "subject": "Art, Culture & Heritage",
        "subject_hindi": "कला, संस्कृति एवं विरासत",
        "domain": "Indian Visual Arts & Architecture",
        "domain_hindi": "भारतीय दृश्य कला एवं वास्तुकला",
        "sub_topic": "Mughal Miniature Paintings: Jahangir's Emphasis on Portraiture & Albums (Muraqqa)",
        "sub_topic_hindi": "मुगल लघु चित्रकला: जहांगीर द्वारा व्यक्ति-चित्रण (पोर्ट्रेट) एवं मुरक्का (एल्बम) पर बल",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Mughal Painting", "Jahangir", "Muraqqa", "Portrait Painting"]
    },
    18: {
        "node_id": "environment_ecology_disaster_management.biodiversity_conservation_ecosystems_protected_areas.national_parks_wildlife_sanctuaries_conservation_reserves",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Biodiversity Conservation & Protected Area Network",
        "domain_hindi": "जैव विविधता संरक्षण एवं संरक्षित क्षेत्र नेटवर्क",
        "sub_topic": "Valley of Flowers National Park & Alpine Forest Ecosystems",
        "sub_topic_hindi": "फूलों की घाटी राष्ट्रीय उद्यान एवं अल्पाइन वन पारिस्थितिकी तंत्र",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Valley of Flowers", "Alpine Zone", "National Parks of India", "Uttarakhand"]
    },
    19: {
        "node_id": "indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.niti_aayog_mandate_strategy",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Planning Architecture & Resource Mobilisation",
        "domain_hindi": "योजना संरचना एवं संसाधनों का संग्रहण",
        "sub_topic": "NITI Aayog Initiatives: Atal Innovation Mission (AIM) & Atal Tinkering Labs",
        "sub_topic_hindi": "नीति आयोग की पहलें: अटल इनोवेशन मिशन (AIM) एवं अटल टिंकरिंग लैब्स",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Atal Innovation Mission", "NITI Aayog", "Innovation Ecosystem", "Atal Incubation"]
    },
    20: {
        "node_id": "geography_earth_systems.geomorphology_earth_structure_processes.earth_motions_revolution_rotation_seasons_solstice",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "Physical Geography & Earth Dynamics",
        "domain_hindi": "भौतिक भूगोल एवं पृथ्वी गतिकी",
        "sub_topic": "Summer Solstice (21st June) & Midnight Sun Phenomenon at Arctic Circle",
        "sub_topic_hindi": "ग्रीष्म अयनांत (21 जून) एवं आर्कटिक वृत्त पर मध्यरात्रि सूर्य की परिघटना",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Summer Solstice", "Arctic Circle", "Earth Revolution", "Tilt of Earth Axis"]
    },
    21: {
        "node_id": "geography_earth_systems.human_economic_geography_india_world.agricultural_geography_cropping_patterns",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "Economic & Human Geography",
        "domain_hindi": "आर्थिक एवं मानव भूगोल",
        "sub_topic": "Columbian Exchange & Crop Domestication: New World to Old World Dispersal",
        "sub_topic_hindi": "कोलंबियन विनिमय एवं फसलों का घरेलूकरण: नई दुनिया से पुरानी दुनिया में प्रसार",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Columbian Exchange", "Crop Domestication", "Tobacco", "Cocoa", "Rubber"]
    },
    22: {
        "node_id": "environment_ecology_disaster_management.biodiversity_conservation_ecosystems_protected_areas.threatened_endangered_flagship_species",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Biodiversity Conservation & Protected Area Network",
        "domain_hindi": "जैव विविधता संरक्षण एवं संरक्षित क्षेत्र नेटवर्क",
        "sub_topic": "Endemic & Flagship Species: Asiatic Lion, Double-Humped Camel & One-Horned Rhinoceros",
        "sub_topic_hindi": "स्थानिक एवं प्रमुख प्रजातियां: एशियाई शेर, दोहरा कूबड़ वाला ऊंट एवं एक सींग वाला गैंडा",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Asiatic Lion", "Bactrian Camel", "One-Horned Rhinoceros", "Wildlife Habitats"]
    },
    23: {
        "node_id": "geography_earth_systems.indian_drainage_system_river_basins.peninsular_river_systems_godavari_krishna_cauvery",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "Indian Drainage System & Hydrology",
        "domain_hindi": "भारतीय अपवाह तंत्र एवं जल विज्ञान",
        "sub_topic": "Peninsular River Basins: Pandharpur (Bhima), Tiruchirappalli (Cauvery) & Hampi (Tungabhadra)",
        "sub_topic_hindi": "प्रायद्वीपीय नदी बेसिन: पंढरपुर (भीमा/चंद्रभागा), तिरुचिरापल्ली (कावेरी) एवं हम्पी (तुंगभद्रा)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Indian Rivers", "Pandharpur", "Chandrabhaga", "Cauvery", "Tungabhadra", "Hampi"]
    },
    24: {
        "node_id": "indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.poverty_estimation_methodologies_alagh_lakdawala_tendulkar_rangarajan",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Planning Architecture & Resource Mobilisation",
        "domain_hindi": "योजना संरचना एवं संसाधनों का संग्रहण",
        "sub_topic": "Poverty Line Estimation & Inter-State Price Variations (Tendulkar Committee)",
        "sub_topic_hindi": "निर्धनता रेखा आकलन एवं अंतर-राज्यीय मूल्य भिन्नता (तेंदुलकर समिति)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Poverty Line", "Price Differentials", "Tendulkar Committee", "Cost of Living"]
    },
    25: {
        "node_id": "environment_ecology_disaster_management.climate_change_global_warming_mitigation.geoengineering_carbon_capture_sequestration_ccus",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Climate Change Science & Global Warming Mitigation",
        "domain_hindi": "जलवायु परिवर्तन विज्ञान एवं ग्लोबल वार्मिंग न्यूनीकरण",
        "sub_topic": "Solar Radiation Management (SRM): Stratospheric Aerosol Injection & Cirrus Cloud Thinning",
        "sub_topic_hindi": "सौर विकिरण प्रबंधन (SRM): समतापमंडलीय एरोसोल इंजेक्शन एवं सिरस मेघ विरलीकरण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Geoengineering", "Solar Radiation Management", "Stratospheric Aerosols", "Cirrus Clouds"]
    },
    26: {
        "node_id": "environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.waste_management_architecture",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Environmental Pollution & Waste Management",
        "domain_hindi": "पर्यावरणीय प्रदूषण एवं अपशिष्ट प्रबंधन",
        "sub_topic": "Waste-to-Energy Technologies: Pyrolysis & Plasma Gasification",
        "sub_topic_hindi": "अपशिष्ट से ऊर्जा प्रौद्योगिकियां: पाइरोलिसिस (ताप अपघटन) एवं प्लाज्मा गैसीकरण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Waste to Energy", "Pyrolysis", "Plasma Gasification", "Solid Waste Management"]
    },
    27: {
        "node_id": "environment_ecology_disaster_management.biodiversity_conservation_ecosystems_protected_areas.biosphere_reserves_world_network_of_biosphere_reserves_wnbr",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Biodiversity Conservation & Protected Area Network",
        "domain_hindi": "जैव विविधता संरक्षण एवं संरक्षित क्षेत्र नेटवर्क",
        "sub_topic": "Agasthyamala Biosphere Reserve: Neyyar, Peppara, Shendurney & KMTR",
        "sub_topic_hindi": "अगस्त्यमलाई बायोस्फीयर रिजर्व: नेय्यर, पेप्पारा, शेंदुरनी एवं केएमटीआर",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Agasthyamala Biosphere Reserve", "Western Ghats", "Protected Areas", "Kerala-Tamil Nadu"]
    },
    28: {
        "node_id": "environment_ecology_disaster_management.biodiversity_conservation_ecosystems_protected_areas.threatened_endangered_flagship_species",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Biodiversity Conservation & Protected Area Network",
        "domain_hindi": "जैव विविधता संरक्षण एवं संरक्षित क्षेत्र नेटवर्क",
        "sub_topic": "Marine Fauna Trophic Adaptations: Herbivorous Turtles, Fish, Mammals vs Obligate Carnivore Snakes",
        "sub_topic_hindi": "समुद्री जीवों के पोषण अनुकूलन: शाकाहारी कछुए, मछलियां, स्तनपायी बनाम मांसाहारी समुद्री सर्प",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Marine Ecosystem", "Herbivorous Species", "Green Sea Turtle", "Dugong", "Sea Snakes"]
    },
    29: {
        "node_id": "environment_ecology_disaster_management.biodiversity_conservation_ecosystems_protected_areas.threatened_endangered_flagship_species",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Biodiversity Conservation & Protected Area Network",
        "domain_hindi": "जैव विविधता संरक्षण एवं संरक्षित क्षेत्र नेटवर्क",
        "sub_topic": "Aquatic & Terrestrial Wildlife Habitats: Blue-Finned Mahseer, Irrawaddy Dolphin & Rusty-Spotted Cat",
        "sub_topic_hindi": "जलीय एवं स्थलीय वन्यजीव आवास: ब्लू-फिन्ड महाशीर, इरावदी डॉल्फिन एवं रस्टी-स्पॉटेड बिल्ली",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Blue-finned Mahseer", "Irrawaddy Dolphin", "Rusty-spotted Cat", "Wildlife Distribution"]
    },
    30: {
        "node_id": "environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.marine_pollution_plastic_waste_microplastics",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Environmental Pollution & Waste Management",
        "domain_hindi": "पर्यावरणीय प्रदूषण एवं अपशिष्ट प्रबंधन",
        "sub_topic": "Microbeads & Microplastic Pollution in Marine Ecosystems",
        "sub_topic_hindi": "समुद्री पारिस्थितिकी तंत्र में माइक्रोबीड्स एवं माइक्रोप्लास्टिक प्रदूषण",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Microbeads", "Microplastics", "Marine Pollution", "Cosmetic Contaminants"]
    },
    31: {
        "node_id": "environment_ecology_disaster_management.biodiversity_conservation_ecosystems_protected_areas.forest_ecosystems_flora_fauna_conservation",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Biodiversity Conservation & Protected Area Network",
        "domain_hindi": "जैव विविधता संरक्षण एवं संरक्षित क्षेत्र नेटवर्क",
        "sub_topic": "Himalayan Nettle (Girardinia diversifolia) as Sustainable Textile Fibre Source",
        "sub_topic_hindi": "टिकाऊ कपड़ा फाइबर स्रोत के रूप में हिमालयन बिच्छू बूटी (गिरार्डिनिया डाइवर्सिफोलिया)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Himalayan Nettle", "Girardinia diversifolia", "Sustainable Textiles", "Bio-fibres"]
    },
    32: {
        "node_id": "science_technology_defence.space_technology_satellite_missions.earth_observation_remote_sensing_satellites",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Space Technology & Satellite Applications",
        "domain_hindi": "अंतरिक्ष प्रौद्योगिकी एवं उपग्रह अनुप्रयोग",
        "sub_topic": "Earth Observation & Remote Sensing Applications: Vegetation Chlorophyll, GHGs & Land Surface Temp",
        "sub_topic_hindi": "पृथ्वी अवलोकन एवं सुदूर संवेदन अनुप्रयोग: वनस्पति क्लोरोफिल, ग्रीनहाउस गैसें एवं भूमि सतह तापमान",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Remote Sensing", "Earth Observation Satellites", "Chlorophyll Estimation", "GHG Mapping"]
    },
    33: {
        "node_id": "geography_earth_systems.biogeography_forests_wildlife_conservation.forest_cover_types_isfr_state_of_forest_report",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "Biogeography, Forests & Resource Distribution",
        "domain_hindi": "जैव भूगोल, वन एवं संसाधन वितरण",
        "sub_topic": "State of Forest Report: Percentage Forest Cover Dynamics (Chhattisgarh, Odisha, MP, Maharashtra)",
        "sub_topic_hindi": "भारत वन स्थिति रिपोर्ट: प्रतिशत वन आवरण गतिशीलता (छत्तीसगढ़, ओडिशा, म.प्र., महाराष्ट्र)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Forest Cover Percentage", "India State of Forest Report", "Chhattisgarh", "Odisha"]
    },
    34: {
        "node_id": "geography_earth_systems.oceanography_marine_resources.marine_mineral_energy_resources_poly_metallic_nodules_gas_hydrates",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "Oceanography & Marine Resources",
        "domain_hindi": "समुद्र विज्ञान एवं समुद्री संसाधन",
        "sub_topic": "Methane Hydrate Deposits: Ocean Floor Reservoirs, Warming Risks & Atmospheric Oxidation",
        "sub_topic_hindi": "मीथेन हाइड्रेट निक्षेप: महासागरीय नितल भंडार, वार्मिंग जोखिम एवं वायुमंडलीय ऑक्सीकरण",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Methane Hydrates", "Clathrates", "Marine Resources", "Global Warming Feedback"]
    },
    35: {
        "node_id": "environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Environmental Pollution & Waste Management",
        "domain_hindi": "पर्यावरणीय प्रदूषण एवं अपशिष्ट प्रबंधन",
        "sub_topic": "Biomass & Stubble Burning Emissions: Carbon Monoxide, Methane, Ozone Precursors & Sulphur Dioxide",
        "sub_topic_hindi": "बायोमास एवं पराली दहन उत्सर्जन: कार्बन मोनोऑक्साइड, मीथेन, ओजोन अग्रदूत एवं सल्फर डाइऑक्साइड",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Crop Residue Burning", "Stubble Burning", "Air Pollutants", "Biomass Emissions"]
    },
    36: {
        "node_id": "geography_earth_systems.world_physical_regional_geography.major_seas_gulfs_straits_oceanic_features",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "World Physical & Regional Geography",
        "domain_hindi": "विश्व का भौतिक एवं क्षेत्रीय भूगोल",
        "sub_topic": "Marginal Seas & Bordering Countries: Adriatic, Black, Caspian, Mediterranean & Red Seas",
        "sub_topic_hindi": "सीमांत सागर एवं सीमावर्ती देश: एड्रियाटिक, काला, कैस्पियन, भूमध्य एवं लाल सागर",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Marginal Seas", "Adriatic Sea", "Caspian Sea", "Mediterranean Sea", "World Geography Mapping"]
    },
    37: {
        "node_id": "indian_economy_development.agriculture_food_processing_farm_dynamics.agricultural_trade_exports_wto_agreement_on_agriculture",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Agriculture & Farm Dynamics",
        "domain_hindi": "कृषि एवं कृषि गतिकी",
        "sub_topic": "Global Agricultural Trade: India as World's Largest Rice Exporter",
        "sub_topic_hindi": "वैश्विक कृषि व्यापार: विश्व के सबसे बड़े चावल निर्यातक के रूप में भारत",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Rice Exports", "Agricultural Trade", "Basmati and Non-Basmati Rice", "Global Trade"]
    },
    38: {
        "node_id": "geography_earth_systems.indian_drainage_system_river_basins.himalayan_river_systems_indus_ganga_brahmaputra",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "Indian Drainage System & Hydrology",
        "domain_hindi": "भारतीय अपवाह तंत्र एवं जल विज्ञान",
        "sub_topic": "Himalayan Glaciers & River Origins: Bandarpunch (Yamuna), Bara Shigri (Chenab) & Siachen (Nubra)",
        "sub_topic_hindi": "हिमालयी हिमनद एवं नदियों का उद्गम: बंदरपूंछ (यमुना), बड़ा शिग्री (चिनाब) एवं सियाचिन (नुब्रा)",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Himalayan Glaciers", "Bandarpunch", "Bara Shigri", "Siachen Glacier", "Nubra River"]
    },
    39: {
        "node_id": "environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.soil_pollution_chemical_pesticides_biomagnification",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Environmental Pollution & Waste Management",
        "domain_hindi": "पर्यावरणीय प्रदूषण एवं अपशिष्ट प्रबंधन",
        "sub_topic": "Hazardous Chemical Pesticides in Agriculture: Carbofuran, Phorate, Methyl Parathion & Triazophos",
        "sub_topic_hindi": "कृषि में खतरनाक रासायनिक कीटनाशक: कार्बोफ्यूरान, फोरेट, मिथाइल पैराथियान एवं ट्रायजोफॉस",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Chemical Pesticides", "Carbofuran", "Phorate", "Agricultural Chemicals", "Environmental Toxicology"]
    },
    40: {
        "node_id": "environment_ecology_disaster_management.environmental_conventions_treaties_protocols.ramsar_convention_on_wetlands_montreux_record",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Environmental Conventions, Treaties & Protocols",
        "domain_hindi": "पर्यावरणीय अभिसमय, संधियां एवं प्रोटोकॉल",
        "sub_topic": "Ramsar Convention on Wetlands & Wetlands (Conservation and Management) Rules 2010/2017",
        "sub_topic_hindi": "रामसर आर्द्रभूमि अभिसमय एवं आर्द्रभूमि (संरक्षण और प्रबंधन) नियम 2010/2017",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Ramsar Convention", "Wetlands Conservation Rules", "Montreux Record", "Wetlands Management"]
    },
    41: {
        "node_id": "environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Environmental Pollution & Waste Management",
        "domain_hindi": "पर्यावरणीय प्रदूषण एवं अपशिष्ट प्रबंधन",
        "sub_topic": "Agricultural & Livestock Atmospheric Emissions: Nitrogen Oxides, Ammonia & Reactive Nitrogen",
        "sub_topic_hindi": "कृषि एवं पशुधन से वायुमंडलीय उत्सर्जन: नाइट्रोजन ऑक्साइड, अमोनिया एवं प्रतिक्रियाशील नाइट्रोजन",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Agricultural Emissions", "Nitrogen Oxides", "Ammonia Emissions", "Livestock Pollution"]
    },
    42: {
        "node_id": "geography_earth_systems.indian_drainage_system_river_basins.multipurpose_river_valley_projects_major_dams",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "Indian Drainage System & Hydrology",
        "domain_hindi": "भारतीय अपवाह तंत्र एवं जल विज्ञान",
        "sub_topic": "Water Reservoirs & Multipurpose Dam Projects: Aliyar (TN), Isapur (MH) & Kangsabati (WB)",
        "sub_topic_hindi": "जल जलाशय एवं बहुउद्देशीय बांध परियोजनाएं: अलियार (तमिलनाडु), इसापुर (महाराष्ट्र) एवं कांगसाबाती (प.बंगाल)",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Water Reservoirs", "Aliyar Dam", "Isapur Dam", "Kangsabati Project", "Irrigation Infrastructure"]
    },
    43: {
        "node_id": "science_technology_defence.energy_technologies_nuclear_renewable.hydrogen_energy_fuel_cells_green_hydrogen_mission",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Energy Technologies & Nuclear Dynamics",
        "domain_hindi": "ऊर्जा प्रौद्योगिकियां एवं परमाणु गतिकी",
        "sub_topic": "Hydrogen-Enriched Compressed Natural Gas (H-CNG) as Clean Alternative Transit Fuel",
        "sub_topic_hindi": "स्वच्छ वैकल्पिक परिवहन ईंधन के रूप में हाइड्रोजन-संवर्धित संपीड़ित प्राकृतिक गैस (H-CNG)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "H-CNG", "Hydrogen Energy", "Cleaner Fuels", "Vehicular Emission Reduction"]
    },
    44: {
        "node_id": "geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_moisture_humidity_condensation_precipitation",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "Climatology & Atmospheric Dynamics",
        "domain_hindi": "जलवायु विज्ञान एवं वायुमंडलीय गतिकी",
        "sub_topic": "Condensation Physics & Dew Point Dynamics: Terrestrial Radiation & Cloud Cover Effects",
        "sub_topic_hindi": "संघनन भौतिकी एवं ओसांक गतिकी: भौमिक विकिरण एवं मेघ आवरण के प्रभाव",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Dew Formation", "Terrestrial Radiation", "Cloud Cover", "Atmospheric Physics"]
    },
    45: {
        "node_id": "indian_polity_constitution_governance.constitutional_amendments_basic_structure.basic_structure_doctrine_landmark_cases",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Constitutional Amendments & Basic Structure Doctrine",
        "domain_hindi": "संविधान संशोधन एवं मूल संरचना का सिद्धांत",
        "sub_topic": "Judicial Review of Constitutional Amendments: 39th, 44th & 99th Amendments (NJAC Case)",
        "sub_topic_hindi": "संविधान संशोधनों की न्यायिक समीक्षा: 39वां, 44वां एवं 99वां संविधान संशोधन (NJAC मामला)",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "39th Amendment", "44th Amendment", "99th Amendment", "NJAC Judgment", "Judicial Review"]
    },
    46: {
        "node_id": "indian_polity_constitution_governance.union_judiciary.supreme_court_composition_appointments_removal",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Union Judiciary (Supreme Court of India)",
        "domain_hindi": "केंद्रीय न्यायपालिका (भारत का सर्वोच्च न्यायालय)",
        "sub_topic": "Judges Inquiry Act 1968 & Procedure for Impeachment of Supreme Court / High Court Judges",
        "sub_topic_hindi": "न्यायाधीश जांच अधिनियम 1968 एवं सर्वोच्च न्यायालय/उच्च न्यायालय के न्यायाधीशों पर महाभियोग प्रक्रिया",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Judges Inquiry Act 1968", "Removal of Judges", "Impeachment Motion", "Speaker Powers"]
    },
    47: {
        "node_id": "indian_polity_constitution_governance.historical_evolution_features_preamble_schedules.schedules_of_the_constitution_first_to_twelfth",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Constitutional Evolution, Preamble & Schedules",
        "domain_hindi": "संवैधानिक विकास, प्रस्तावना एवं अनुसूचियां",
        "sub_topic": "First Constitutional Amendment Act 1951 & Introduction of Ninth Schedule under Nehru",
        "sub_topic_hindi": "प्रथम संविधान संशोधन अधिनियम 1951 एवं नेहरू के प्रधानमंत्रित्व काल में नौवीं अनुसूची का समावेश",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Ninth Schedule", "First Amendment 1951", "Jawaharlal Nehru", "Agrarian Reforms Protection"]
    },
    48: {
        "node_id": "indian_economy_development.infrastructure_energy_transport_logistics.coal_power_energy_security",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Infrastructure, Energy & Transport Architecture",
        "domain_hindi": "अवसंरचना, ऊर्जा एवं परिवहन संरचना",
        "sub_topic": "Coal Sector Governance: Nationalisation History (1973), Commercial Mining & Captive Blocks",
        "sub_topic_hindi": "कोयला क्षेत्र शासन: राष्ट्रीयकरण का इतिहास (1973), वाणिज्यिक खनन एवं कैप्टिव ब्लॉक",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Coal Sector Nationalisation", "Indira Gandhi", "Commercial Coal Mining", "Coal Block Allocation"]
    },
    49: {
        "node_id": "indian_polity_constitution_governance.union_legislature.parliamentary_privileges_sessions_procedures",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Union Legislature (Parliament of India)",
        "domain_hindi": "केंद्रीय विधायिका (भारतीय संसद)",
        "sub_topic": "Parliament (Prevention of Disqualification) Act 1959 & Office of Profit Doctrine",
        "sub_topic_hindi": "संसद (अयोग्यता निवारण) अधिनियम 1959 एवं लाभ का पद सिद्धांत",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Office of Profit", "Prevention of Disqualification Act", "Article 102", "Disqualification of MPs"]
    },
    50: {
        "node_id": "indian_polity_constitution_governance.scheduled_and_tribal_areas.fifth_schedule_sixth_schedule_areas",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Scheduled & Tribal Area Administration",
        "domain_hindi": "अनुसूचित एवं जनजातीय क्षेत्र प्रशासन",
        "sub_topic": "Fifth Schedule Tribal Land Protection & Prohibition of Land Transfer to Private Parties (Samatha Case)",
        "sub_topic_hindi": "पांचवीं अनुसूची जनजातीय भूमि संरक्षण एवं निजी पक्षों को भूमि हस्तांतरण पर रोक (समता निर्णय)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Fifth Schedule", "Tribal Land Transfer", "Samatha Judgment", "Scheduled Areas"]
    },
    51: {
        "node_id": "indian_society_social_justice.scheduled_tribes_vulnerable_communities.pvtgs_tribal_welfare_forest_rights",
        "subject": "Indian Society & Social Justice",
        "subject_hindi": "भारतीय समाज एवं सामाजिक न्याय",
        "domain": "Vulnerable Sections & Tribal Empowerment",
        "domain_hindi": "कमजोर वर्ग एवं जनजातीय सशक्तिकरण",
        "sub_topic": "Particularly Vulnerable Tribal Groups (PVTGs): Criteria, Demographic Trends & Distribution",
        "sub_topic_hindi": "विशेष रूप से कमजोर जनजातीय समूह (PVTGs): मानदंड, जनसांख्यिकीय प्रवृत्तियां एवं वितरण",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "PVTGs", "Tribal Groups Criteria", "Dhebar Commission", "Irular", "Konda Reddi"]
    },
    52: {
        "node_id": "indian_polity_constitution_governance.union_judiciary.supreme_court_jurisdiction_special_leave_advisory",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Union Judiciary (Supreme Court of India)",
        "domain_hindi": "केंद्रीय न्यायपालिका (भारत का सर्वोच्च न्यायालय)",
        "sub_topic": "Article 142 Plenary Powers: Inherent Jurisdiction for Doing Complete Justice",
        "sub_topic_hindi": "अनुच्छेद 142 के तहत पूर्ण न्याय की असाधारण शक्तियां एवं अंतर्निहित क्षेत्राधिकार",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Article 142", "Complete Justice", "Supreme Court Powers", "Extraordinary Jurisdiction"]
    },
    53: {
        "node_id": "indian_polity_constitution_governance.state_executive_legislature.state_legislative_assembly_council_procedures",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "State Executive & State Legislature",
        "domain_hindi": "राज्य कार्यपालिका एवं राज्य विधायिका",
        "sub_topic": "State Legislative Assembly Procedures: Governor's Address & Assembly Rules for Quorum",
        "sub_topic_hindi": "राज्य विधान सभा प्रक्रियाएं: राज्यपाल का अभिभाषण एवं गणपूर्ति (कोरम) संबंधी सभा नियम",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "State Legislative Assembly", "Governor's Address", "Article 176", "Assembly Procedures"]
    },
    54: {
        "node_id": "international_relations_global_institutions.united_nations_agencies_specialised_orgs.un_treaties_and_legal_conventions",
        "subject": "International Relations & Global Institutions",
        "subject_hindi": "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "domain": "United Nations System & Multilateral Treaties",
        "domain_hindi": "संयुक्त राष्ट्र प्रणाली एवं बहुपक्षीय संधियां",
        "sub_topic": "UN Convention against Corruption (UNCAC), UNTOC & UNODC Mandates",
        "sub_topic_hindi": "भ्रष्टाचार के विरुद्ध संयुक्त राष्ट्र अभिसमय (UNCAC), UNTOC एवं UNODC के अधिदेश",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "UNCAC", "UNTOC", "Palermo Convention", "UNODC", "Anti-Corruption Regimes"]
    },
    55: {
        "node_id": "environment_ecology_disaster_management.institutional_legal_operational_framework.wildlife_forest_biodiversity_protection_acts",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Institutional & Legal Environmental Framework",
        "domain_hindi": "संस्थागत एवं कानूनी पर्यावरणीय ढांचा",
        "sub_topic": "Indian Forest Act 1927 (Bamboo Amendment 2017) & Forest Rights Act 2006 (Gram Sabha Powers)",
        "sub_topic_hindi": "भारतीय वन अधिनियम 1927 (बांस संशोधन 2017) एवं वन अधिकार अधिनियम 2006 (ग्राम सभा की शक्तियां)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Indian Forest Act", "Bamboo Amendment", "Forest Rights Act 2006", "Minor Forest Produce"]
    },
    56: {
        "node_id": "indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_part_iii_article_19_21_22",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Fundamental Rights, DPSP & Fundamental Duties",
        "domain_hindi": "मूल अधिकार, नीति निदेशक तत्व एवं मूल कर्तव्य",
        "sub_topic": "Right to Marry Person of One's Choice under Article 21 (Hadiya Case / Shafin Jahan Judgment)",
        "sub_topic_hindi": "अनुच्छेद 21 के तहत अपनी पसंद के व्यक्ति से विवाह करने का अधिकार (हादिया मामला / शफीन जहां निर्णय)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Article 21", "Right to Marry", "Hadiya Case", "Personal Liberty", "Fundamental Rights"]
    },
    57: {
        "node_id": "science_technology_defence.intellectual_property_rights_ipr_framework.patents_act_compulsory_licensing_evergreening_section_3d",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Intellectual Property Rights & Innovation Policies",
        "domain_hindi": "बौद्धिक संपदा अधिकार एवं नवाचार नीतियां",
        "sub_topic": "Indian Patents Act Section 3(j) (Non-patentability of Plants/Seeds) & PPV&FR Act 2001",
        "sub_topic_hindi": "भारतीय पेटेंट अधिनियम धारा 3(j) (पौधों/बीजों की अपेटेंटनीयता) एवं पादप किस्म संरक्षण अधिनियम 2001",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Indian Patents Act", "Plant Varieties Protection", "Section 3j", "Monsanto Case", "PPVFR Act"]
    },
    58: {
        "node_id": "environment_ecology_disaster_management.institutional_legal_operational_framework.environment_protection_act_1986_rules",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Institutional & Legal Environmental Framework",
        "domain_hindi": "संस्थागत एवं कानूनी पर्यावरणीय ढांचा",
        "sub_topic": "Environment Protection Act 1986 Mandates & Central Ground Water Authority (CGWA)",
        "sub_topic_hindi": "पर्यावरण (संरक्षण) अधिनियम 1986 के अधिदेश एवं केंद्रीय भूजल प्राधिकरण (CGWA)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Environment Protection Act 1986", "Central Ground Water Authority", "CGWA", "Environmental Standards"]
    },
    59: {
        "node_id": "environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.waste_management_architecture",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Environmental Pollution & Waste Management",
        "domain_hindi": "पर्यावरणीय प्रदूषण एवं अपशिष्ट प्रबंधन",
        "sub_topic": "Solid Waste Management Rules 2016: Source Segregation & Sanitary Landfill Norms",
        "sub_topic_hindi": "ठोस अपशिष्ट प्रबंधन नियम 2016: स्रोत पर पृथक्करण एवं सेनेटरी लैंडफिल मानदंड",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Solid Waste Management Rules 2016", "Waste Segregation", "Sanitary Landfill", "Waste to Energy"]
    },
    60: {
        "node_id": "indian_economy_development.labour_employment_skill_development.labour_reforms_labour_codes",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Labour, Employment & Skill Development",
        "domain_hindi": "श्रम, रोजगार एवं कौशल विकास",
        "sub_topic": "Industrial Employment (Standing Orders) Rules: Fixed Term Employment Across All Sectors",
        "sub_topic_hindi": "औद्योगिक नियोजन (स्थायी आदेश) नियम: सभी क्षेत्रों में सावधि नियोजन (फिक्स्ड टर्म एम्प्लॉयमेंट)",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Fixed Term Employment", "Industrial Employment Standing Orders", "Labour Reforms", "Worker Benefits"]
    },
    61: {
        "node_id": "indian_economy_development.money_banking_financial_intermediation.banking_reforms_financial_inclusion",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Money, Banking & Financial Intermediation",
        "domain_hindi": "मुद्रा, बैंकिंग एवं वित्तीय मध्यस्थता",
        "sub_topic": "Lead Bank Scheme & Implementation of Service Area Approach (1989)",
        "sub_topic_hindi": "अग्रणी बैंक योजना (लीड बैंक स्कीम) एवं सेवा क्षेत्र दृष्टिकोण (सर्विस एरिया अप्रोच) का क्रियान्वयन",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Service Area Approach", "Lead Bank Scheme", "Rural Credit", "Financial Inclusion"]
    },
    62: {
        "node_id": "geography_earth_systems.economic_geography_energy_minerals.mineral_resources_distribution_mining_policies",
        "subject": "Geography & Earth Systems",
        "subject_hindi": "भूगोल एवं पृथ्वी प्रणाली",
        "domain": "Economic & Human Geography",
        "domain_hindi": "आर्थिक एवं मानव भूगोल",
        "sub_topic": "Minor Minerals Regulatory Architecture: Sand Mining, MMDR Act 1957 & State Powers",
        "sub_topic_hindi": "लघु खनिज नियामक संरचना: रेत खनन, MMDR अधिनियम 1957 एवं राज्यों की शक्तियां",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Minor Minerals", "Sand Mining", "MMDR Act", "State Government Mining Powers"]
    },
    63: {
        "node_id": "indian_economy_development.external_sector_balance_of_payments_forex.external_debt_composition_vulnerabilities",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "External Sector, Balance of Payments & Forex",
        "domain_hindi": "वाह्य क्षेत्र, भुगतान संतुलन एवं विदेशी मुद्रा",
        "sub_topic": "India's External Debt Structure: Commercial Borrowings Dominance & Sovereign Debt Proportion",
        "sub_topic_hindi": "भारत की विदेशी ऋण संरचना: वाणिज्यिक उधारी की प्रधानता एवं संप्रभु ऋण का अनुपात",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "External Debt of India", "Commercial Borrowings", "Sovereign Debt", "Denomination in USD"]
    },
    64: {
        "node_id": "indian_economy_development.money_banking_financial_intermediation.commercial_banking_structure_npa_dynamics",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Money, Banking & Financial Intermediation",
        "domain_hindi": "मुद्रा, बैंकिंग एवं वित्तीय मध्यस्थता",
        "sub_topic": "Commercial Bank Balance Sheet: Assets (Loans, Investments) vs Liabilities (Deposits)",
        "sub_topic_hindi": "वाणिज्यिक बैंक का तुलन-पत्र (बैलेंस शीट): परिसंपत्तियां (ऋण, निवेश) बनाम देनदारियां (जमा)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Bank Assets and Liabilities", "Deposits as Liabilities", "Loans and Advances", "Commercial Banking"]
    },
    65: {
        "node_id": "indian_economy_development.external_sector_balance_of_payments_forex.foreign_exchange_reserves_exchange_rate_dynamics",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "External Sector, Balance of Payments & Forex",
        "domain_hindi": "वाह्य क्षेत्र, भुगतान संतुलन एवं विदेशी मुद्रा",
        "sub_topic": "External Balance Vulnerabilities: Services Exports, Remittances vs External Commercial Borrowings (ECB)",
        "sub_topic_hindi": "वाह्य संतुलन संवेदनशीलता: सेवा निर्यात, प्रेषण (रेमिटेंस) बनाम वाह्य वाणिज्यिक उधारी (ECB)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Currency Crisis", "Balance of Payments", "Remittances", "Software Exports", "ECB Risk"]
    },
    66: {
        "node_id": "indian_polity_constitution_governance.federal_structure_centre-state_relations.inter-state_relations_inter-state_council_zonal_councils",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Federal Structure & Centre-State Relations",
        "domain_hindi": "संघीय संरचना एवं केंद्र-राज्य संबंध",
        "sub_topic": "Sarkaria Commission (1988) Recommendations on Appointment of State Governors",
        "sub_topic_hindi": "राज्य के राज्यपाल की नियुक्ति पर सरकारिया आयोग (1988) की सिफारिशें",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Sarkaria Commission", "Governor Appointment", "Centre-State Relations", "Punchhi Commission"]
    },
    67: {
        "node_id": "indian_economy_development.financial_markets_securities_regulations.capital_markets_sebi_regulations",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Financial Markets, Securities & Regulatory Bodies",
        "domain_hindi": "वित्तीय बाजार, प्रतिभूतियां एवं नियामक संस्थाएं",
        "sub_topic": "Offshore Derivative Instruments: Participatory Notes (P-Notes) Issued by FPIs",
        "sub_topic_hindi": "ऑफशोर डेरिवेटिव इंस्ट्रूमेंट्स: FPIs द्वारा जारी पार्टिसिपेटरी नोट्स (P-नोट्स)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Participatory Notes", "P-Notes", "Foreign Portfolio Investors", "SEBI Regulations"]
    },
    68: {
        "node_id": "environment_ecology_disaster_management.institutional_legal_operational_framework.wildlife_forest_biodiversity_protection_acts",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Institutional & Legal Environmental Framework",
        "domain_hindi": "संस्थागत एवं कानूनी पर्यावरणीय ढांचा",
        "sub_topic": "Compensatory Afforestation Fund Act 2016 (CAMPA): Fund Devolution (90:10 State-Centre Ratio)",
        "sub_topic_hindi": "प्रतिपूरक वनीकरण कोष अधिनियम 2016 (CAMPA): निधि वितरण (90:10 राज्य-केंद्र अनुपात)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "CAMPA Act 2016", "Compensatory Afforestation", "State CAMPA Fund", "Forest Diversion"]
    },
    69: {
        "node_id": "indian_polity_constitution_governance.union_legislature.parliamentary_committees_pac_estimates_cogu",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Union Legislature (Parliament of India)",
        "domain_hindi": "केंद्रीय विधायिका (भारतीय संसद)",
        "sub_topic": "Parliamentary Oversight of Sectoral Regulators: Role of Departmentally Related Standing Committees",
        "sub_topic_hindi": "क्षेत्रीय नियामकों की संसदीय निगरानी: विभाग संबंधित स्थायी समितियों की भूमिका",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Independent Regulators Oversight", "Departmentally Related Standing Committees", "Parliamentary Accountability"]
    },
    70: {
        "node_id": "indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.five_year_plans_evolution_strategies",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Planning Architecture & Resource Mobilisation",
        "domain_hindi": "योजना संरचना एवं संसाधनों का संग्रहण",
        "sub_topic": "Evolution of Five-Year Plans: 2nd Plan (Mahalanobis Heavy Industry), 4th & 5th Plan Strategies",
        "sub_topic_hindi": "पंचवर्षीय योजनाओं का विकास: द्वितीय योजना (महालनोबिस भारी उद्योग), चतुर्थ एवं 5वीं योजना रणनीतियां",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Five Year Plans", "Second Five Year Plan", "Mahalanobis Model", "Fourth Plan", "Fifth Plan"]
    },
    71: {
        "node_id": "international_relations_global_institutions.global_economic_financial_architecture.aiib_ndb_brics_asian_development_bank",
        "subject": "International Relations & Global Institutions",
        "subject_hindi": "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "domain": "Global Economic, Trade & Financial Architecture",
        "domain_hindi": "वैश्विक आर्थिक, व्यापारिक एवं वित्तीय संरचना",
        "sub_topic": "Asian Infrastructure Investment Bank (AIIB): Membership, Voting Shares & Governance",
        "sub_topic_hindi": "एशियन इन्फ्रास्ट्रक्चर इन्वेस्टमेंट बैंक (AIIB): सदस्यता, मताधिकार शेयर एवं प्रशासन",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "AIIB", "Multilateral Development Banks", "India Shareholding in AIIB", "China Voting Power"]
    },
    72: {
        "node_id": "indian_economy_development.money_banking_financial_intermediation.npa_resolution_ibc_insolvency_bankruptcy_code",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Money, Banking & Financial Intermediation",
        "domain_hindi": "मुद्रा, बैंकिंग एवं वित्तीय मध्यस्थता",
        "sub_topic": "Stressed Asset Resolution: Inter-Creditor Agreement (ICA) under Project Sashakt",
        "sub_topic_hindi": "तनावग्रस्त परिसंपत्ति समाधान: प्रोजेक्ट सशक्त के तहत अंतर-लेनदार समझौता (ICA)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Inter-Creditor Agreement", "Project Sashakt", "Sunil Mehta Committee", "NPA Resolution"]
    },
    73: {
        "node_id": "indian_economy_development.money_banking_financial_intermediation.public_sector_banks_governance_mission_indradhanush",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Money, Banking & Financial Intermediation",
        "domain_hindi": "मुद्रा, बैंकिंग एवं वित्तीय मध्यस्थता",
        "sub_topic": "Public Sector Bank Governance: Banks Board Bureau (BBB / FSIB) Selection Mandate",
        "sub_topic_hindi": "सार्वजनिक क्षेत्र के बैंक प्रशासन: बैंक बोर्ड ब्यूरो (BBB / FSIB) चयन अधिदेश",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Banks Board Bureau", "BBB", "FSIB", "PSB Chairman Selection", "P.J. Nayak Committee"]
    },
    74: {
        "node_id": "indian_economy_development.infrastructure_energy_transport_logistics.oil_natural_gas_strategic_petroleum_reserves",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Infrastructure, Energy & Transport Architecture",
        "domain_hindi": "अवसंरचना, ऊर्जा एवं परिवहन संरचना",
        "sub_topic": "Petroleum and Natural Gas Regulatory Board (PNGRB): Mandate, Market Competition & Appellate Hierarchy",
        "sub_topic_hindi": "पेट्रोलियम एवं प्राकृतिक गैस नियामक बोर्ड (PNGRB): अधिदेश, बाजार प्रतिस्पर्धा एवं अपीलीय पदानुक्रम",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "PNGRB Act 2006", "City Gas Distribution", "APTEL", "Energy Regulators"]
    },
    75: {
        "node_id": "science_technology_defence.information_communication_technology_ict_telecom.wireless_technologies_4g_lte_5g_6g_wifi_bluetooth",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Information & Communication Technology (ICT)",
        "domain_hindi": "सूचना एवं संचार प्रौद्योगिकी (ICT)",
        "sub_topic": "Mobile Telecommunication Standards: Long-Term Evolution (LTE) vs Voice over LTE (VoLTE)",
        "sub_topic_hindi": "मोबाइल दूरसंचार मानक: लॉन्ग-टर्म इवोल्यूशन (LTE) बनाम वॉयस ओवर LTE (VoLTE)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "LTE", "VoLTE", "Packet Switched Networks", "4G Technology", "Telecom Standards"]
    },
    76: {
        "node_id": "indian_society_social_justice.role_of_women_womens_movements.legislative_protections_posh_maternity_benefit_dowry_prohibition",
        "subject": "Indian Society & Social Justice",
        "subject_hindi": "भारतीय समाज एवं सामाजिक न्याय",
        "domain": "Gender Equality & Women Empowerment",
        "domain_hindi": "लैंगिक समानता एवं महिला सशक्तिकरण",
        "sub_topic": "Maternity Benefit (Amendment) Act 2017: Paid Leave Provisions & Mandatory Crèche Facility",
        "sub_topic_hindi": "मातृत्व लाभ (संशोधन) अधिनियम 2017: सवैतनिक अवकाश प्रावधान एवं अनिवार्य क्रेच सुविधा",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Maternity Benefit Act 2017", "26 Weeks Maternity Leave", "Creche Facility", "Women Labour Rights"]
    },
    77: {
        "node_id": "international_relations_global_institutions.global_economic_financial_architecture.world_bank_group_ibrd_ida_ifc_miga_icsid",
        "subject": "International Relations & Global Institutions",
        "subject_hindi": "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "domain": "Global Economic, Trade & Financial Architecture",
        "domain_hindi": "वैश्विक आर्थिक, व्यापारिक एवं वित्तीय संरचना",
        "sub_topic": "World Bank Ease of Doing Business Report & Core Assessment Sub-Indices",
        "sub_topic_hindi": "विश्व बैंक ईज ऑफ डूइंग बिजनेस रिपोर्ट एवं मुख्य मूल्यांकन उप-सूचकांक",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Ease of Doing Business Index", "World Bank", "Sub-indices of EoDB", "Business Regulatory Environment"]
    },
    78: {
        "node_id": "environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.waste_management_architecture",
        "subject": "Environment, Ecology & Disaster Management",
        "subject_hindi": "पर्यावरण, पारिस्थितिकी एवं आपदा प्रबंधन",
        "domain": "Environmental Pollution & Waste Management",
        "domain_hindi": "पर्यावरणीय प्रदूषण एवं अपशिष्ट प्रबंधन",
        "sub_topic": "Extended Producer Responsibility (EPR) Framework under E-Waste (Management and Handling) Rules",
        "sub_topic_hindi": "ई-अपशिष्ट (प्रबंधन एवं हथालन) नियमों के तहत विस्तारित उत्पादक उत्तरदायित्व (EPR) ढांचा",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Extended Producer Responsibility", "EPR", "E-Waste Management Rules", "Plastic Waste Rules"]
    },
    79: {
        "node_id": "indian_economy_development.agriculture_food_processing_farm_dynamics.food_security_pds_food_corporation_of_india_fci",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Agriculture & Farm Dynamics",
        "domain_hindi": "कृषि एवं कृषि गतिकी",
        "sub_topic": "Food Corporation of India (FCI): Economic Cost of Food Grains (MSP, Procurement & Distribution Incidentals)",
        "sub_topic_hindi": "भारतीय खाद्य निगम (FCI): खाद्यान्न की आर्थिक लागत (MSP, खरीद एवं वितरण प्रासंगिक व्यय)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Economic Cost of Foodgrains", "FCI", "MSP Incidentals", "Food Subsidy"]
    },
    80: {
        "node_id": "indian_society_social_justice.salient_features_of_indian_society_diversity.social_capital_communal_harmony_social_cohesion",
        "subject": "Indian Society & Social Justice",
        "subject_hindi": "भारतीय समाज एवं सामाजिक न्याय",
        "domain": "Salient Features of Indian Society & Diversity",
        "domain_hindi": "भारतीय समाज की मुख्य विशेषताएं एवं विविधता",
        "sub_topic": "Sociological Concepts: Social Capital as Mutual Trust, Reciprocity & Social Cohesion",
        "sub_topic_hindi": "समाजशास्त्रीय अवधारणाएं: पारस्परिक विश्वास, पारस्परिकता एवं सामाजिक सामंजस्य के रूप में सामाजिक पूंजी",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Social Capital", "Mutual Trust", "Sociological Concepts", "Social Cohesion"]
    },
    81: {
        "node_id": "indian_polity_constitution_governance.state_judiciary_subordinate_courts.high_court_jurisdiction_writ_powers_article_226",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "State Judiciary & Subordinate Courts",
        "domain_hindi": "राज्य न्यायपालिका एवं अधीनस्थ न्यायालय",
        "sub_topic": "Constitutional Review Powers: High Court Jurisdiction over Central Laws & Basic Structure Review",
        "sub_topic_hindi": "संवैधानिक समीक्षा शक्तियां: केंद्रीय कानूनों पर उच्च न्यायालय का क्षेत्राधिकार एवं मूल संरचना समीक्षा",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "High Court Jurisdiction", "Article 226", "Constitutional Validity of Central Law", "Judicial Review"]
    },
    82: {
        "node_id": "indian_economy_development.national_income_accounting_macroeconomic_aggregates.gdp_gnp_ndp_nnp_at_factor_cost_market_price",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "National Income Accounting & Macroeconomic Aggregates",
        "domain_hindi": "राष्ट्रीय आय लेखांकन एवं समष्टि आर्थिक समुच्चय",
        "sub_topic": "Purchasing Power Parity (PPP) Exchange Rates & Global Economic Ranking of India",
        "sub_topic_hindi": "क्रय शक्ति समता (PPP) विनिमय दरें एवं भारत की वैश्विक आर्थिक रैंकिंग",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Purchasing Power Parity", "PPP Exchange Rates", "GDP in PPP Terms", "Macroeconomic Aggregates"]
    },
    83: {
        "node_id": "indian_economy_development.agriculture_food_processing_farm_dynamics.agricultural_production_cropping_intensity",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Agriculture & Farm Dynamics",
        "domain_hindi": "कृषि एवं कृषि गतिकी",
        "sub_topic": "Kharif Cropping Acreage Trends: Rice, Pulses, Oilseeds, Cotton vs Sugarcane",
        "sub_topic_hindi": "खरीफ फसल क्षेत्र प्रवृत्तियां: चावल, दालें, तिलहन, कपास बनाम गन्ना",
        "difficulty": "hard",
        "tags": ["PYQ", "UPSC 2019", "Kharif Crops", "Crop Acreage Trends", "Rice Cultivation Area", "Cotton vs Sugarcane"]
    },
    84: {
        "node_id": "indian_economy_development.agriculture_food_processing_farm_dynamics.agricultural_trade_exports_wto_agreement_on_agriculture",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Agriculture & Farm Dynamics",
        "domain_hindi": "कृषि एवं कृषि गतिकी",
        "sub_topic": "India's Agricultural Import Basket: Edible Oils Dominance & Import Bill Dynamics",
        "sub_topic_hindi": "भारत का कृषि आयात बास्केट: खाद्य तेलों की प्रधानता एवं आयात बिल गतिकी",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Agricultural Imports", "Edible Oils", "Palm Oil Imports", "Import Basket"]
    },
    85: {
        "node_id": "indian_polity_constitution_governance.historical_evolution_features_preamble_schedules.preamble_philosophy_sovereign_socialist_secular_democratic_republic",
        "subject": "Indian Polity, Constitution & Governance",
        "subject_hindi": "भारतीय राजव्यवस्था, संविधान एवं शासन",
        "domain": "Constitutional Evolution, Preamble & Schedules",
        "domain_hindi": "संवैधानिक विकास, प्रस्तावना एवं अनुसूचियां",
        "sub_topic": "Political Philosophy: Definition of Liberty as Opportunity for Full Development of Human Personality",
        "sub_topic_hindi": "राजनीतिक दर्शन: मानव व्यक्तित्व के सर्वांगीण विकास के अवसर के रूप में स्वतंत्रता की परिभाषा",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Liberty Definition", "Preamble Philosophy", "Positive Liberty", "Political Theory"]
    },
    86: {
        "node_id": "indian_economy_development.external_sector_balance_of_payments_forex.foreign_exchange_reserves_exchange_rate_dynamics",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "External Sector, Balance of Payments & Forex",
        "domain_hindi": "वाह्य क्षेत्र, भुगतान संतुलन एवं विदेशी मुद्रा",
        "sub_topic": "Currency Depreciation Defense: RBI / Govt Measures (Masala Bonds, Import Tariffs vs Monetary Easing)",
        "sub_topic_hindi": "मुद्रा अवमूल्यन रक्षा: RBI / सरकार के उपाय (मसाला बॉन्ड, आयात शुल्क बनाम मौद्रिक ढील)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Rupee Depreciation", "Exchange Rate Defense", "Masala Bonds", "Monetary Policy Transmission"]
    },
    87: {
        "node_id": "indian_economy_development.money_banking_financial_intermediation.payment_systems_upi_neft_rtgs_digital_rupee_cbdc",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Money, Banking & Financial Intermediation",
        "domain_hindi": "मुद्रा, बैंकिंग एवं वित्तीय मध्यस्थता",
        "sub_topic": "RBI Directives on Payment System Data Localization & Storage of Payment System Data in India",
        "sub_topic_hindi": "भुगतान प्रणाली डेटा स्थानीयकरण एवं भारत में भुगतान डेटा के भंडारण पर RBI के निर्देश",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Data Localization", "Storage of Payment System Data", "RBI Directives", "Digital Payments"]
    },
    88: {
        "node_id": "international_relations_global_institutions.regional_groupings_plurilateral_forums.european_union_eu_brexit_indo-pacific_strategy",
        "subject": "International Relations & Global Institutions",
        "subject_hindi": "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "domain": "Regional Groupings & Strategic Partnerships",
        "domain_hindi": "क्षेत्रीय समूह एवं रणनीतिक साझेदारियां",
        "sub_topic": "European Union (EU) General Data Protection Regulation (GDPR) Architecture",
        "sub_topic_hindi": "यूरोपीय संघ (EU) सामान्य डेटा संरक्षण विनियमन (GDPR) संरचना",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "GDPR", "General Data Protection Regulation", "European Union", "Data Privacy Laws"]
    },
    89: {
        "node_id": "international_relations_global_institutions.indias_bilateral_relations_major_powers.india_russia_relations_strategic_partnership_defence_energy",
        "subject": "International Relations & Global Institutions",
        "subject_hindi": "अंतर्राष्ट्रीय संबंध एवं वैश्विक संस्थाएं",
        "domain": "India's Bilateral Relations & Major Powers",
        "domain_hindi": "भारत के द्विपक्षीय संबंध एवं प्रमुख शक्तियां",
        "sub_topic": "India-Russia Strategic Civil Nuclear Cooperation & Kudankulam Nuclear Power Expansion",
        "sub_topic_hindi": "भारत-रूस रणनीतिक असैन्य परमाणु सहयोग एवं कुडनकुलम परमाणु ऊर्जा विस्तार",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "India Russia Relations", "Civil Nuclear Cooperation", "Kudankulam", "Action Plan Nuclear Energy"]
    },
    90: {
        "node_id": "indian_economy_development.money_banking_financial_intermediation.money_supply_aggregates_m1_m2_m3_m4_money_multiplier",
        "subject": "Indian Economy & Development",
        "subject_hindi": "भारतीय अर्थव्यवस्था एवं विकास",
        "domain": "Money, Banking & Financial Intermediation",
        "domain_hindi": "मुद्रा, बैंकिंग एवं वित्तीय मध्यस्थता",
        "sub_topic": "Money Multiplier Mechanism: Currency-Deposit Ratio & Growth in Banking Habits",
        "sub_topic_hindi": "मुद्रा गुणक तंत्र: करेंसी-जमा अनुपात एवं जनसंख्या की बैंकिंग आदतों में वृद्धि",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Money Multiplier", "Banking Habit", "Currency Deposit Ratio", "Reserve Money", "Money Supply"]
    },
    91: {
        "node_id": "science_technology_defence.information_communication_technology_ict_telecom.emerging_technologies_ai_quantum_computing_blockchain_iot",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Information & Communication Technology (ICT)",
        "domain_hindi": "सूचना एवं संचार प्रौद्योगिकी (ICT)",
        "sub_topic": "Immersive Digital Technologies: Augmented Reality (AR) vs Virtual Reality (VR) Mechanics",
        "sub_topic_hindi": "इमर्सिव डिजिटल प्रौद्योगिकियां: संवर्धित वास्तविकता (AR) बनाम आभासी वास्तविकता (VR) यांत्रिकी",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Augmented Reality", "Virtual Reality", "AR vs VR", "Spatial Computing", "Digital Entertainment"]
    },
    92: {
        "node_id": "science_technology_defence.biotechnology_genetic_engineering_applications.human_genome_project_genome_india_ancient_dna",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Biotechnology, Genetics & Health Innovations",
        "domain_hindi": "जैव प्रौद्योगिकी, आनुवंशिकी एवं स्वास्थ्य नवाचार",
        "sub_topic": "Palaeogenomics & Human Evolution: Denisovans as Extinct Archaic Hominin Species",
        "sub_topic_hindi": "पैलियोजेनोमिक्स एवं मानव विकास: विलुप्त प्राचीन होमिनिन प्रजाति के रूप में डेनिसोवन",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Denisovans", "Archaic Humans", "Human Evolution", "Ancient DNA", "Denisova Cave"]
    },
    93: {
        "node_id": "science_technology_defence.biotechnology_genetic_engineering_applications.synthetic_biology_gene_synthesis",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Biotechnology, Genetics & Health Innovations",
        "domain_hindi": "जैव प्रौद्योगिकी, आनुवंशिकी एवं स्वास्थ्य नवाचार",
        "sub_topic": "Synthetic Biology & Cellular Biotechnology: Artificial Chromosome Synthesis & Stem Cell Differentiation",
        "sub_topic_hindi": "सिंथेटिक बायोलॉजी एवं कोशिकीय जैव प्रौद्योगिकी: कृत्रिम गुणसूत्र संश्लेषण एवं स्टेम सेल विभेदन",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Synthetic Biology", "Functional Chromosomes", "Stem Cells", "Craig Venter", "Cellular Biology"]
    },
    94: {
        "node_id": "science_technology_defence.information_communication_technology_ict_telecom.cyber_security_framework_it_act_2000",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Information & Communication Technology (ICT)",
        "domain_hindi": "सूचना एवं संचार प्रौद्योगिकी (ICT)",
        "sub_topic": "Information Technology Act 2000: Digital Signatures & Certifying Authorities Framework",
        "sub_topic_hindi": "सूचना प्रौद्योगिकी अधिनियम 2000: डिजिटल हस्ताक्षर एवं प्रमाणन प्राधिकारी ढांचा",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Digital Signature", "Certifying Authority", "IT Act 2000", "Asymmetric Cryptography", "Public Key"]
    },
    95: {
        "node_id": "science_technology_defence.information_communication_technology_ict_telecom.emerging_technologies_ai_quantum_computing_blockchain_iot",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Information & Communication Technology (ICT)",
        "domain_hindi": "सूचना एवं संचार प्रौद्योगिकी (ICT)",
        "sub_topic": "Wearable Internet of Things (IoT) Technologies: Health Monitoring, Biometrics & Spatial Tracking",
        "sub_topic_hindi": "पहनने योग्य IoT प्रौद्योगिकियां: स्वास्थ्य निगरानी, बायोमेट्रिक्स एवं स्थानिक ट्रैकिंग",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Wearable Technology", "IoT Devices", "Sleep Monitoring", "Biometric Sensors", "Assistive Devices"]
    },
    96: {
        "node_id": "science_technology_defence.biotechnology_genetic_engineering_applications.rnai_gene_silencing_therapeutic_applications",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Biotechnology, Genetics & Health Innovations",
        "domain_hindi": "जैव प्रौद्योगिकी, आनुवंशिकी एवं स्वास्थ्य नवाचार",
        "sub_topic": "RNA Interference (RNAi) Technology: Targeted Gene Silencing, Pest Resistance & Cancer Therapeutics",
        "sub_topic_hindi": "आरएनए इंटरफेरेंस (RNAi) प्रौद्योगिकी: लक्षित जीन साइलेंसिंग, कीट प्रतिरोधकता एवं कैंसर चिकित्सा",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "RNA Interference", "RNAi", "Gene Silencing", "Biotechnology Applications", "Therapeutic RNA"]
    },
    97: {
        "node_id": "science_technology_defence.space_technology_satellite_missions.astrophysics_gravitational_waves_black_holes_ligo",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Space Technology & Satellite Applications",
        "domain_hindi": "अंतरिक्ष प्रौद्योगिकी एवं उपग्रह अनुप्रयोग",
        "sub_topic": "Astrophysics & Gravitational Wave Astronomy: Binary Black Hole Mergers (LIGO-Virgo)",
        "sub_topic_hindi": "खगोल भौतिकी एवं गुरुत्वाकर्षण तरंग खगोल विज्ञान: बाइनरी ब्लैक होल विलय (LIGO-Virgo)",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "Black Hole Merger", "Gravitational Waves", "LIGO", "Virgo", "Astrophysics"]
    },
    98: {
        "node_id": "science_technology_defence.biotechnology_genetic_engineering_applications.antimicrobial_resistance_amr_one_health",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Biotechnology, Genetics & Health Innovations",
        "domain_hindi": "जैव प्रौद्योगिकी, आनुवंशिकी एवं स्वास्थ्य नवाचार",
        "sub_topic": "Antimicrobial Resistance (AMR): Drivers of Multi-Drug Resistance & Livestock Antibiotic Misuse",
        "sub_topic_hindi": "रोगाणुरोधी प्रतिरोध (AMR): मल्टी-ड्रग प्रतिरोध के कारण एवं पशुधन में एंटीबायोटिक का दुरुपयोग",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Multi-Drug Resistance", "AMR", "Antibiotic Misuse", "Microbial Pathogens", "One Health"]
    },
    99: {
        "node_id": "science_technology_defence.biotechnology_genetic_engineering_applications.crispr_cas9_gene_editing_somati_germline",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Biotechnology, Genetics & Health Innovations",
        "domain_hindi": "जैव प्रौद्योगिकी, आनुवंशिकी एवं स्वास्थ्य नवाचार",
        "sub_topic": "CRISPR-Cas9 Genome Editing: Cas9 Molecular Scissors Mechanism & Genetic Engineering",
        "sub_topic_hindi": "CRISPR-Cas9 जीनोम संपादन: Cas9 आणविक कैंची (मॉलिक्यूलर सिजर्स) प्रणाली एवं जेनेटिक इंजीनियरिंग",
        "difficulty": "easy",
        "tags": ["PYQ", "UPSC 2019", "CRISPR-Cas9", "Cas9 Protein", "Molecular Scissors", "Gene Editing", "Targeted DNA Cleavage"]
    },
    100: {
        "node_id": "science_technology_defence.biotechnology_genetic_engineering_applications.vaccine_technologies_mrna_viral_vector_dna",
        "subject": "Science, Technology & Defence",
        "subject_hindi": "विज्ञान, प्रौद्योगिकी एवं रक्षा",
        "domain": "Biotechnology, Genetics & Health Innovations",
        "domain_hindi": "जैव प्रौद्योगिकी, आनुवंशिकी एवं स्वास्थ्य नवाचार",
        "sub_topic": "Viral Hepatitis Epidemiology: Hepatitis B (Recombinant Vaccine Available) vs Hepatitis C (No Vaccine)",
        "sub_topic_hindi": "वायरल हेपेटाइटिस महामारी विज्ञान: हेपेटाइटिस B (पुनः संयोजक टीका उपलब्ध) बनाम हेपेटाइटिस C (कोई टीका नहीं)",
        "difficulty": "medium",
        "tags": ["PYQ", "UPSC 2019", "Hepatitis B", "Hepatitis C", "Viral Vaccines", "Blood-borne Pathogens", "Recombinant DNA Vaccine"]
    }
}

# Update all 100 questions
for q in questions:
    q_num = q["question_number"]
    if q_num in mappings:
        m = mappings[q_num]
        q["node_id"] = m["node_id"]
        q["subject"] = m["subject"]
        q["subject_hindi"] = m["subject_hindi"]
        q["domain"] = m["domain"]
        q["domain_hindi"] = m["domain_hindi"]
        q["sub_topic"] = m["sub_topic"]
        q["sub_topic_hindi"] = m["sub_topic_hindi"]
        q["difficulty"] = m["difficulty"]
        q["tags"] = m["tags"]
        q["year"] = 2019
        q["month"] = "June"
        q["paper"] = 1
        q["image_url"] = None

# Save updated 2019.json
with open("src/data/upsc_pyq/2019.json", "w", encoding="utf-8") as f:
    json.dump(questions, f, indent=2, ensure_ascii=False)

print(f"Successfully populated all {len(questions)} questions in 2019.json!")
