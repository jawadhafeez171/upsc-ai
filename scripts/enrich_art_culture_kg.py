# -*- coding: utf-8 -*-
"""
Enrich Art, Culture & Heritage Knowledge Graph
----------------------------------------------
Expands Art, Culture & Heritage (art_culture_heritage) with:
1. Three new Domains (Karnataka Art & Culture, Martial Arts/Calendars, Cultural Institutions/Numismatics).
2. New Topics in existing and new Domains.
3. Over 70 granular Level-4 Subtopics across all Topics with rich entities, descriptions, exam tags, and keywords.
"""

import json
import os
import re

SUBJECT_ID = "art_culture_heritage"
SUBJECT_NAME = "Art, Culture & Heritage"

NEW_DOMAINS = [
    {
        "id": f"{SUBJECT_ID}.art_culture_of_karnataka",
        "slug": "art_culture_of_karnataka",
        "name": "Art, Architecture & Cultural Heritage of Karnataka",
        "rawExamTagString": "[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]",
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "id": f"{SUBJECT_ID}.martial_arts_traditional_sports_calendars",
        "slug": "martial_arts_traditional_sports_calendars",
        "name": "Martial Arts, Traditional Sports & Indian Calendar Systems",
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "id": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives",
        "slug": "cultural_institutions_numismatics_initiatives",
        "name": "Cultural Institutions, Numismatics & Heritage Governance",
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    }
]

NEW_TOPICS = [
    # Under indian_literature_languages
    {
        "id": f"{SUBJECT_ID}.indian_literature_languages.classical_languages_of_india_scripts",
        "slug": "classical_languages_of_india_scripts",
        "name": "Classical Languages of India & Evolution of Scripts",
        "parentId": f"{SUBJECT_ID}.indian_literature_languages",
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Under fairs_festivals_crafts_unesco_heritage
    {
        "id": f"{SUBJECT_ID}.fairs_festivals_crafts_unesco_heritage.major_fairs_religious_cultural_festivals",
        "slug": "major_fairs_religious_cultural_festivals",
        "name": "Major Fairs & Religious Cultural Festivals of India",
        "parentId": f"{SUBJECT_ID}.fairs_festivals_crafts_unesco_heritage",
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Under art_culture_of_karnataka
    {
        "id": f"{SUBJECT_ID}.art_culture_of_karnataka.karnataka_temple_architecture_sculpture",
        "slug": "karnataka_temple_architecture_sculpture",
        "name": "Karnataka Temple Architecture & Sculptural Evolution",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka",
        "rawExamTagString": "[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]",
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "id": f"{SUBJECT_ID}.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka",
        "slug": "performing_arts_theatre_folk_traditions_of_karnataka",
        "name": "Performing Arts, Theatre & Folk Traditions of Karnataka",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka",
        "rawExamTagString": "[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]",
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "id": f"{SUBJECT_ID}.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage",
        "slug": "karnataka_paintings_crafts_gi_heritage",
        "name": "Karnataka Paintings, Traditional Crafts & GI Heritage",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka",
        "rawExamTagString": "[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]",
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "id": f"{SUBJECT_ID}.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka",
        "slug": "vachana_haridasa_bhakti_movements_of_karnataka",
        "name": "Vachana & Haridasa Bhakti Movements of Karnataka",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka",
        "rawExamTagString": "[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]",
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    # Under martial_arts_traditional_sports_calendars
    {
        "id": f"{SUBJECT_ID}.martial_arts_traditional_sports_calendars.martial_arts_and_traditional_sports_of_india",
        "slug": "martial_arts_and_traditional_sports_of_india",
        "name": "Traditional Martial Arts & Indigenous Sports of India",
        "parentId": f"{SUBJECT_ID}.martial_arts_traditional_sports_calendars",
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "id": f"{SUBJECT_ID}.martial_arts_traditional_sports_calendars.indian_calendar_systems_eras_national_symbols",
        "slug": "indian_calendar_systems_eras_national_symbols",
        "name": "Indian Calendar Systems, Historical Eras & National Symbols",
        "parentId": f"{SUBJECT_ID}.martial_arts_traditional_sports_calendars",
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Under cultural_institutions_numismatics_initiatives
    {
        "id": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives.national_cultural_institutions_and_bodies",
        "slug": "national_cultural_institutions_and_bodies",
        "name": "Premier National Cultural Institutions, Akademis & Museums",
        "parentId": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives",
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "id": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives.ancient_and_medieval_indian_coinage_numismatics",
        "slug": "ancient_and_medieval_indian_coinage_numismatics",
        "name": "Ancient & Medieval Indian Coinage (Numismatics)",
        "parentId": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives",
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "id": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards",
        "slug": "government_heritage_conservation_schemes_awards",
        "name": "Government Heritage Conservation Schemes & Cultural Awards",
        "parentId": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives",
        "rawExamTagString": "[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]",
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    }
]

LEVEL_4_SUBTOPICS = [
    # -------------------------------------------------------------------------
    # Domain 1: indian_architecture_sculpture
    # -------------------------------------------------------------------------
    # Topic: harappan_architecture_town_planning
    {
        "slug": "harappan_citadel_lower_town_drainage_systems",
        "name": "Harappan Citadel, Lower Town & Drainage Infrastructure",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.harappan_architecture_town_planning",
        "description": "Grid-iron layout, citadel on elevated platform, lower town residential quarters, Great Bath with gypsum mortar waterproofing, massive granaries, and underground covered drainage network with inspection manholes.",
        "entities": ["Grid-iron Town Plan", "Citadel and Lower Town", "Great Bath Mohenjo-daro", "Brick Granaries", "Covered Drainage Systems", "Lothal Dockyard"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "harappan_sculptures_dancing_girl_priest_king",
        "name": "Harappan Sculptures: Bronze Dancing Girl & Steatite Priest",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.harappan_architecture_town_planning",
        "description": "Lost-wax (cire-perdue) technique in bronze Dancing Girl of Mohenjo-daro, steatite bearded Priest-King draped in trefoil patterned shawl, red sandstone male torso, and terracotta Mother Goddess figurines.",
        "entities": ["Bronze Dancing Girl", "Lost-Wax Technique (Cire-Perdue)", "Steatite Priest-King", "Trefoil Motif", "Mother Goddess Figurines", "Red Sandstone Male Torso"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: mauryan_art_pillars
    {
        "slug": "ashokan_pillars_capitals_lion_capital_sarnath",
        "name": "Ashokan Monolithic Pillars & Sarnath Lion Capital",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.mauryan_art_pillars",
        "description": "Chunar sandstone monolithic shafts with distinctive Mauryan high polish (glass-like sheen), animal capitals (Sarnath Lion Capital, Rampurva Bull, Lauriya-Nandangarh), abacus carvings, and Ashoka Chakra symbolism.",
        "entities": ["Ashokan Monolithic Pillars", "Chunar Sandstone Polish", "Sarnath Lion Capital", "Dharmachakra Symbolism", "Rampurva Bull Capital", "Abacus Carvings"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "mauryan_rock_cut_caves_barabar_didarganj_yakshi",
        "name": "Mauryan Rock-Cut Caves & Didarganj Yakshini",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.mauryan_art_pillars",
        "description": "Barabar and Nagarjuni rock-cut caves dedicated to Ajivika ascetics (Lomas Rishi cave featuring horseshoe-shaped chaitya arch), and life-size polished freestanding stone statues including Didarganj Yakshini holding a flywhisk (chauri).",
        "entities": ["Barabar Hill Caves", "Lomas Rishi Chaitya Arch", "Ajivika Sect Patronage", "Didarganj Yakshini", "Parkham Yaksha", "Chauri-bearer Sculpture"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: post-mauryan_caves_sculpture
    {
        "slug": "gandhara_mathura_amaravati_sculptural_schools",
        "name": "Sculpture Schools: Gandhara, Mathura & Amaravati",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.post-mauryan_caves_sculpture",
        "description": "Comparative analysis of post-Mauryan sculpture schools: Gandhara (Greco-Roman Apollo-like Buddha, grey/blue schist, wavy hair), Mathura (indigenous, spotted red sandstone, seated fleshy Buddha, Jina, Brahmanical deities), Amaravati (white marble/limestone, dynamic narrative reliefs of Jataka tales).",
        "entities": ["Gandhara Art School", "Greco-Buddhist Hybrid Style", "Mathura Sculpture School", "Spotted Red Sandstone", "Amaravati School", "White Marble Jataka Reliefs"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "stupa_architecture_sanchi_chaityas_viharas",
        "name": "Stupa Architecture (Sanchi) & Western Deccan Caves",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.post-mauryan_caves_sculpture",
        "description": "Structural components of Stupa (Anda hemispherical mound, Medhi circular terrace, Harmika square railing, Chhatra threefold umbrella, Torana gateways with intricate narrative carvings at Great Stupa Sanchi); Rock-cut Buddhist Chaityas (prayer halls) and Viharas (monasteries) at Karle, Bhaja, and Kanheri.",
        "entities": ["Great Stupa Sanchi", "Torana Gateways", "Harmika & Chhatra", "Karle Grand Chaitya", "Bhaja & Bedse Caves", "Rock-cut Viharas"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: temple_architecture_styles
    {
        "slug": "nagara_temple_style_odisha_khajuraho_solanki",
        "name": "Nagara Style Temple Architecture (Odisha, Khajuraho, Solanki)",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.temple_architecture_styles",
        "description": "North Indian Nagara style (curvilinear Shikhara / Rekha-Prasad, Phamsana, Valabhi, Amalaka, Kalasha); Sub-schools: Odisha (Deula, Jagamohana - Konark Sun Temple, Lingaraj), Khajuraho (erotic sculptures, Panchayatana plan, Kandariya Mahadeva), Solanki / Maru-Gurjara (stepped tank Surya Kund at Modhera, Dilwara Jain temples with carved white marble ceilings).",
        "entities": ["Nagara Architecture", "Rekha-Prasad Shikhara", "Amalaka & Kalasha", "Khajuraho Panchayatana Style", "Kandariya Mahadeva Temple", "Odisha Deula Style", "Modhera Sun Temple", "Dilwara Marble Carvings"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "dravida_temple_style_pallava_chola_nayaka",
        "name": "Dravida Style Temple Architecture (Pallava, Chola, Nayaka)",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.temple_architecture_styles",
        "description": "South Indian Dravida style characterized by pyramidal stepped tower (Vimana), monumental entrance gateways (Gopurams), pillared assembly halls (Mandapas), sacred water tanks, and enclosed Prakara walls; Evolution through Pallavas (Shore Temple Mahabalipuram), Imperial Cholas (Brihadeeswara Temple Thanjavur), and Madurai Nayakas (Meenakshi Temple thousand-pillared halls).",
        "entities": ["Dravida Style Architecture", "Pyramidal Vimana", "Monumental Gopuram", "Brihadeeswara Temple Thanjavur", "Mahabalipuram Shore Temple", "Nayaka Mandapas", "Prakara Enclosures"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "vesara_hybrid_style_chalukya_rashtrakuta",
        "name": "Vesara Hybrid Style & Monolithic Rock-Cut Kailasa",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.temple_architecture_styles",
        "description": "Vesara / Karnataka hybrid school blending Nagara curvilinear profile with Dravida tier articulation; Early experimentation at Aihole, Badami, and Pattadakal (Virupaksha Temple); Pinnacle of rock-cut monolithic excavation in Kailasanatha Temple (Cave 16, Ellora) carved top-down under Rashtrakuta King Krishna I.",
        "entities": ["Vesara Architectural Style", "Aihole Experimentation", "Pattadakal Virupaksha", "Kailasanatha Temple Ellora (Cave 16)", "Top-down Monolithic Excavation", "Rashtrakuta Patronage"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: indo-islamic_architecture
    {
        "slug": "delhi_sultanate_architecture_mamluk_to_lodi",
        "name": "Delhi Sultanate Architecture (Mamluk, Khalji, Tughlaq, Lodi)",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.indo-islamic_architecture",
        "description": "Introduction of true arch (arcuate system), dome, minarets, and geometric arabesque / calligraphic motifs; Mamluk (Qutub Minar, Quwwat-ul-Islam), Khalji (Alai Darwaza red sandstone with white marble), Tughlaq (sloping battered walls, grey stone, Tughlaqabad), and Lodi period (octagonal tombs, double dome introduction).",
        "entities": ["Arcuate Architectural System", "True Arch and Dome", "Qutub Minar Complex", "Alai Darwaza", "Tughlaq Battered Walls", "Lodi Double Dome Tombs"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "mughal_architecture_humayun_to_shah_jahan",
        "name": "Mughal Architecture: Charbagh, Red Sandstone & Marble Inlay",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.indo-islamic_architecture",
        "description": "High aesthetic synthesis of Persian, Central Asian, and indigenous Indian traditions; Humayun's Tomb (first Charbagh garden tomb and Persian double dome), Akbar's Fatehpur Sikri (Buland Darwaza, Panch Mahal, Jodha Bai palace), Jahangir's Itimad-ud-Daulah (pioneering Pietra Dura floral inlay), and Shah Jahan's white marble masterpieces (Taj Mahal, Red Fort, Jama Masjid Delhi).",
        "entities": ["Charbagh Garden Layout", "Humayun's Tomb", "Fatehpur Sikri & Buland Darwaza", "Pietra Dura Inlay Technique", "Taj Mahal Architecture", "Red Fort Diwan-i-Khas"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: colonial_modern_architecture
    {
        "slug": "colonial_indo_saracenic_neo_gothic_architecture",
        "name": "Colonial Indo-Saracenic & Neo-Gothic Architecture",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.colonial_modern_architecture",
        "description": "Portuguese Baroque churches in Old Goa (Basilica of Bom Jesus, Se Cathedral); British colonial architectural styles: Neo-Classical, Victorian Neo-Gothic (Chhatrapati Shivaji Maharaj Terminus Mumbai, St. Paul's Cathedral Kolkata), and Indo-Saracenic synthesis (Gateway of India, Victoria Memorial, Madras High Court).",
        "entities": ["Indo-Saracenic Style", "Victorian Neo-Gothic", "CSMT Mumbai", "Victoria Memorial Kolkata", "Goan Baroque Architecture", "Basilica of Bom Jesus"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "modern_post_independence_architecture_lutyens_corbusier",
        "name": "Modern & Post-Independence Architecture (Lutyens, Corbusier, Baker)",
        "parentId": f"{SUBJECT_ID}.indian_architecture_sculpture.colonial_modern_architecture",
        "description": "Imperial New Delhi planned by Edwin Lutyens and Herbert Baker (Rashtrapati Bhavan, Parliament House, India Gate); Post-independence modernist city planning by Le Corbusier in Chandigarh (Capitol Complex, concrete brise-soleil); Sustainable, vernacular cost-effective brick architecture of Laurie Baker in Kerala.",
        "entities": ["Lutyens' Delhi Plan", "Rashtrapati Bhavan Architecture", "Le Corbusier Capitol Complex Chandigarh", "Laurie Baker Vernacular Architecture", "Post-Independence Modernism"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },

    # -------------------------------------------------------------------------
    # Domain 2: indian_paintings_visual_arts
    # -------------------------------------------------------------------------
    # Topic: prehistoric_rock_art
    {
        "slug": "prehistoric_rock_art_bhimbetka_lakhudiyar",
        "name": "Prehistoric Rock Paintings: Bhimbetka & Lakhudiyar",
        "parentId": f"{SUBJECT_ID}.indian_paintings_visual_arts.prehistoric_rock_art",
        "description": "Upper Palaeolithic and Mesolithic rock art at UNESCO site Bhimbetka (Madhya Pradesh) and Lakhudiyar (Uttarakhand); natural mineral pigments (red ochre/geru, white from limestone), stick-like human figures, group dancing, animal hunt depictions (bison, boars, deer, elephants).",
        "entities": ["Bhimbetka Caves Rock Art", "Mesolithic Hunting Scenes", "Red Ochre and White Pigments", "Lakhudiyar Rock Shelters", "Prehistoric Zoo Rock"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: ancient_medieval_murals
    {
        "slug": "classical_murals_ajanta_ellora_bagh_sittanavasal",
        "name": "Classical Murals: Ajanta, Ellora, Bagh & Sittanavasal",
        "parentId": f"{SUBJECT_ID}.indian_paintings_visual_arts.ancient_medieval_murals",
        "description": "Technique of Indian mural painting (clay, cow dung, straw plaster ground with lime coat and tempera pigments); Masterpieces at Ajanta Caves (Bodhisattva Padmapani and Vajrapani in Cave 1, Mahajanaka Jataka, Dying Princess), Ellora Kailasa murals, Bagh cave paintings, and Jain murals at Sittanavasal (Pudukkottai).",
        "entities": ["Ajanta Cave Murals", "Bodhisattva Padmapani Fresco-Secco", "Tempera Technique", "Sittanavasal Jain Murals", "Bagh Cave Paintings", "Jataka Tale Narrative Panels"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: miniature_painting_traditions
    {
        "slug": "mughal_miniature_painting_traditions",
        "name": "Mughal Miniatures: Court Chronicles, Realism & Portraiture",
        "parentId": f"{SUBJECT_ID}.indian_paintings_visual_arts.miniature_painting_traditions",
        "description": "Development of Mughal atelier under Akbar (Hamzanama, Razmnama, Tasvir Khana, blending Persian delicacy with Indian dynamism), Jahangir (flora and fauna naturalism, Ustad Mansur's Siberian crane and dodo paintings, European halo/perspective influence), and Shah Jahan (luxurious gold illumination, static court ceremonies).",
        "entities": ["Mughal Miniature Atelier", "Akbari Illustrated Manuscripts (Hamzanama)", "Jahangir Flora & Fauna Realism", "Ustad Mansur Bird Paintings", "Karkhana Painting Studio"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "rajasthani_miniatures_mewar_kishangarh_bundi",
        "name": "Rajasthani Miniatures: Kishangarh, Mewar, Bundi & Kota",
        "parentId": f"{SUBJECT_ID}.indian_paintings_visual_arts.miniature_painting_traditions",
        "description": "Lyrical court and devotional schools of Rajasthan: Mewar (deep vibrant colors, Chawand Ragamala), Bundi and Kota (lush vegetation, hunting expeditions, dramatic skies), and Kishangarh School famous for Radha / 'Bani Thani' painted by Nihal Chand featuring elongated almond eyes and graceful sharp features.",
        "entities": ["Bani Thani (Indian Mona Lisa)", "Kishangarh School", "Nihal Chand Artist", "Mewar Ragamala Paintings", "Bundi-Kota Hunting Scenes", "Vaishnavite Devotional Themes"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "pahari_and_deccani_miniature_schools",
        "name": "Pahari (Kangra, Basohli) & Deccani Miniature Schools",
        "parentId": f"{SUBJECT_ID}.indian_paintings_visual_arts.miniature_painting_traditions",
        "description": "Pahari schools of Himalayan foothills: Basohli (bold fiery colors, beetle-wing casing jewelry, Rasamanjari) and Kangra (refined poetic grace, soft landscapes, Gita Govinda romance under Raja Sansar Chand); Deccani schools of Bijapur, Golconda, and Ahmadnagar (Persian elegance, rich lapis lazuli gold palette, Tarif-i-Husain Shahi).",
        "entities": ["Basohli School Rasamanjari", "Kangra Gita Govinda Paintings", "Raja Sansar Chand Patronage", "Deccani Sultanate Miniatures", "Bijapur Portraiture", "Najm-ul-Ulum Manuscript"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: folk_regional_painting_styles
    {
        "slug": "madhubani_pattachitra_kalamkari_folk_paintings",
        "name": "Folk Paintings: Madhubani, Pattachitra & Kalamkari",
        "parentId": f"{SUBJECT_ID}.indian_paintings_visual_arts.folk_regional_painting_styles",
        "description": "Madhubani / Mithila painting of Bihar (ritual wall and floor Kohbar/Aripana art, double line borders, natural dye figures of deities), Pattachitra of Odisha (narrative cloth scrolls painted with tamarind seed glue and mineral colors, Jagannath themes), and Kalamkari of Andhra Pradesh (Srikalahasti freehand temple hangings vs Machilipatnam block-printed textiles).",
        "entities": ["Madhubani / Mithila Painting", "Odisha Pattachitra on Cloth", "Kalamkari (Srikalahasti & Machilipatnam)", "Natural Mineral & Vegetable Dyes", "Kohbar Marriage Murals"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "tribal_and_ritual_paintings_warli_gond_pithora",
        "name": "Tribal & Ritual Paintings: Warli, Gond & Pithora",
        "parentId": f"{SUBJECT_ID}.indian_paintings_visual_arts.folk_regional_painting_styles",
        "description": "Warli painting of Maharashtra (monochrome white rice paste on cow-dung mud walls, geometric circles of life, Tarpa dance), Gond painting of central India (dot and line patterns expressing forest ecology, Jangarh Singh Shyam), and Pithora ritual murals of Rathwa tribes in Gujarat.",
        "entities": ["Warli Tribal Art", "Tarpa Dance Circle Motif", "Gond Art (Dot & Line Style)", "Jangarh Singh Shyam", "Pithora Ritual Wall Murals", "Saura Paintings"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },

    # -------------------------------------------------------------------------
    # Domain 3: performing_arts
    # -------------------------------------------------------------------------
    # Topic: classical_dance_traditions
    {
        "slug": "classical_dances_bharatanatyam_odissi_kuchipudi",
        "name": "Classical Dances: Bharatanatyam, Odissi & Kuchipudi",
        "parentId": f"{SUBJECT_ID}.performing_arts.classical_dance_traditions",
        "description": "Sangeet Natak Akademi recognized classical forms: Bharatanatyam of Tamil Nadu (temple Devadasi solo dance, Ekaharya, Alarippu to Tillana, Lasya and Tandava aspects), Odissi of Odisha (sculptural Tribhanga deflection, Chowk stance, Mahari tradition), and Kuchipudi of Andhra Pradesh (dance-drama, Tarangam dancing on rim of brass plate with water pot, Manduka Shabdam).",
        "entities": ["Bharatanatyam (Ekaharya Tradition)", "Alarippu & Tillana", "Odissi Tribhanga Posture", "Mahari & Gotipua Traditions", "Kuchipudi Tarangam (Brass Plate Dance)", "Manduka Shabdam"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "classical_dances_kathak_kathakali_mohiniyattam",
        "name": "Classical Dances: Kathak, Kathakali & Mohiniyattam",
        "parentId": f"{SUBJECT_ID}.performing_arts.classical_dance_traditions",
        "description": "Kathak of North India (storytellers/Kathakars, rhythmic footwork Tatkar, pirouettes Chakkars, Gharanas of Lucknow, Jaipur, Banaras), Kathakali of Kerala (male dance-drama, stylized facial expressions Navarasas, green Paccha noble makeup vs red Kathi villainous makeup), and Mohiniyattam of Kerala (dance of the enchantress, graceful Lasya swaying movements, distinctive white and gold Kasavu costume).",
        "entities": ["Kathak Gharanas (Lucknow, Jaipur, Banaras)", "Tatkar Footwork & Chakkars", "Kathakali Facial Makeup (Paccha, Kathi, Minukku)", "Navarasas Facial Expressions", "Mohiniyattam Lasya Dance", "Kerala Kasavu Costume"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "classical_dances_manipuri_sattriya_chhau",
        "name": "Classical Dances: Manipuri, Sattriya & Chhau",
        "parentId": f"{SUBJECT_ID}.performing_arts.classical_dance_traditions",
        "description": "Manipuri of Manipur (Vaishnavite Rasleela, barrel-shaped Potloi skirt, graceful serpentine movements, dynamic Pung Cholom drum dance), Sattriya of Assam (monastic Vaishnavite dance founded by Srimanta Sankardeva, performance in Sattras, Borgeet devotional accompaniment), and Chhau dance (semi-classical martial mask dance of Purulia, Seraikela, and Mayurbhanj, UNESCO ICH).",
        "entities": ["Manipuri Rasleela", "Pung Cholom Drum Dance", "Potloi Skirt Costume", "Sattriya Dance of Assam", "Srimanta Sankardeva Sattras", "Chhau Martial Mask Dance (Purulia, Seraikela, Mayurbhanj)"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: folk_dances_of_india
    {
        "slug": "major_regional_folk_dances_north_south_west_east",
        "name": "Major Regional Folk Dances Across Indian States",
        "parentId": f"{SUBJECT_ID}.performing_arts.folk_dances_of_india",
        "description": "Celebrated regional folk dances: Bhangra and Giddha (Punjab), Garba and Dandiya Raas (Gujarat), Ghoomar and Kalbelia (Rajasthan snake-charmer dance, UNESCO ICH), Lavani and Koli (Maharashtra), Bihu (Assam harvest dance), Cheraw (Mizoram bamboo dance), Rouf (Jammu & Kashmir), Hojagiri (Tripura), and Theyyam (Kerala ritual dance).",
        "entities": ["Bhangra & Giddha", "Garba & Dandiya", "Ghoomar & Kalbelia (UNESCO)", "Lavani of Maharashtra", "Bihu Harvest Dance Assam", "Cheraw Bamboo Dance Mizoram", "Theyyam Ritual Dance Kerala"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: indian_classical_music_systems
    {
        "slug": "hindustani_classical_music_thaats_gharanas_forms",
        "name": "Hindustani Classical Music: Thaats, Gharanas & Forms",
        "parentId": f"{SUBJECT_ID}.performing_arts.indian_classical_music_systems",
        "description": "Hindustani music foundation: Swara, Raga, Tala, 10-Thaat classification system by V.N. Bhatkhande; Musical forms: Dhrupad (austere spiritual style, Dagar gharana), Khayal (improvisational style, Gwalior, Kirana, Agra, Patiala gharanas), semi-classical Thumri, Dadra, Tappa, and Tarana.",
        "entities": ["Hindustani 10 Thaats", "Dhrupad Vocal Style", "Khayal and Major Gharanas", "V.N. Bhatkhande Classification", "Thumri Semi-Classical", "Tala and Laya"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "carnatic_classical_music_melakarta_trinity_forms",
        "name": "Carnatic Classical Music: Melakarta, Trinity & Kriti",
        "parentId": f"{SUBJECT_ID}.performing_arts.indian_classical_music_systems",
        "description": "South Indian Carnatic tradition based on 72 Melakarta parent ragas schema formulated by Venkatamakhin; Revered Trinity of Carnatic Music (Tyagaraja, Muthuswami Dikshitar, Syama Sastri); Contributions of Purandara Dasa (Pitamaha of Carnatic music); Musical compositions: Varnam, Kriti (Pallavi, Anupallavi, Charanam), Ragam-Tanam-Pallavi (RTP), and Tillana.",
        "entities": ["Carnatic Trinity (Tyagaraja, Dikshitar, Syama Sastri)", "72 Melakarta Raga Scheme", "Purandara Dasa (Carnatic Pitamaha)", "Kriti Structure (Pallavi, Anupallavi, Charanam)", "Ragam-Tanam-Pallavi", "Varnam & Tillana"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: musical_instruments_folk_music
    {
        "slug": "fourfold_classification_of_indian_musical_instruments",
        "name": "Fourfold Classification of Musical Instruments (Vadya)",
        "parentId": f"{SUBJECT_ID}.performing_arts.musical_instruments_folk_music",
        "description": "Ancient Natya Shastra classification into four musical categories: Tata Vadya (stringed chordophones: Sitar, Saraswati Veena, Sarod, Santoor), Sushira Vadya (wind aerophones: Bansuri bamboo flute, Shehnai, Nadaswaram), Avanaddha Vadya (percussion membranophones: Tabla, Mridangam, Pakhawaj, Dholak), and Ghana Vadya (solid idiophones: Ghatam clay pot, Manjira, Jaltarang).",
        "entities": ["Tata Vadya (Chordophones - Sitar, Veena)", "Sushira Vadya (Aerophones - Shehnai, Bansuri)", "Avanaddha Vadya (Membranophones - Mridangam, Tabla)", "Ghana Vadya (Idiophones - Ghatam, Manjira)", "Natya Shastra Vadya Classification"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: traditional_theatre_forms_puppetry
    {
        "slug": "traditional_theatre_and_puppetry_forms_of_india",
        "name": "Traditional Folk Theatre & Puppetry Traditions of India",
        "parentId": f"{SUBJECT_ID}.performing_arts.traditional_theatre_forms_puppetry",
        "description": "Folk theatre forms: Bhavai (Gujarat), Nautanki (Uttar Pradesh), Tamasha (Maharashtra), Jatra (Bengal), Koodiyattam (Kerala Sanskrit temple theatre, UNESCO ICH), Maach (Madhya Pradesh), Bhand Pather (Kashmir); Four Indian puppetry traditions: String (Kathputli Rajasthan, Gombeyatta Karnataka), Shadow (Togalu Gombeyaata Karnataka, Tholu Bommalata Andhra, Ravanchhaya Odisha), Rod (Putul Nach Bengal, Yampuri Bihar), and Glove (Pavakoothu Kerala).",
        "entities": ["Koodiyattam Sanskrit Theatre (UNESCO)", "Bhavai & Tamasha Folk Theatres", "Nautanki & Jatra", "Kathputli String Puppetry", "Togalu Gombeyaata Shadow Puppets", "Tholu Bommalata", "Pavakoothu Glove Puppets"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },

    # -------------------------------------------------------------------------
    # Domain 4: indian_literature_languages
    # -------------------------------------------------------------------------
    # Topic: vedic_epic_puranic_literature
    {
        "slug": "vedic_corpus_samhitas_upanishads_darshana",
        "name": "Vedic Corpus: Samhitas, Brahmanas, Aranyakas & Upanishads",
        "parentId": f"{SUBJECT_ID}.indian_literature_languages.vedic_epic_puranic_literature",
        "description": "Structure of Vedic literature: Four Samhitas (Rigveda hymns, Samaveda chants, Yajurveda sacrificial formulas, Atharvaveda spells and daily life), ritualistic Brahmanas, mystical Aranyakas (forest texts), and philosophical Upanishads / Vedanta expounding the metaphysical relationship between Atman and Brahman (Principal 108 Upanishads, Satyameva Jayate from Mundaka Upanishad).",
        "entities": ["Four Vedas (Rig, Sama, Yajur, Atharva)", "Brahmanas Ritual Explanations", "Aranyakas Forest Treatises", "Upanishads (Mundaka, Chandogya, Mandukya)", "Atman-Brahman Philosophy", "Satyameva Jayate Motto"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: classical_religious_texts
    {
        "slug": "classical_sanskrit_literature_kalidasa_bhasa",
        "name": "Classical Sanskrit Literature: Kalidasa, Bhasa & Epics",
        "parentId": f"{SUBJECT_ID}.indian_literature_languages.classical_religious_texts",
        "description": "Golden age of classical Sanskrit dramatic and poetic literature: Kalidasa's plays (Abhijnanashakuntalam, Malavikagnimitram) and epics (Raghuvamsha, Kumarasambhava, Meghaduta); Plays of Bhasa (Svapnavasavadatta), Shudraka (Mrichhakatika / The Little Clay Cart), Vishakhadatta (Mudrarakshasa political drama), and Harsha (Ratnavali, Priyadarsika, Nagananda).",
        "entities": ["Kalidasa Dramatic Works", "Abhijnanashakuntalam", "Meghaduta Lyric Poem", "Shudraka's Mrichhakatika", "Vishakhadatta's Mudrarakshasa", "Bhasa's Plays"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "sangam_literature_corpus_tamil_classics",
        "name": "Sangam Literature Corpus: Ettuthokai, Pattupattu & Epics",
        "parentId": f"{SUBJECT_ID}.indian_literature_languages.classical_religious_texts",
        "description": "Early Tamil Sangam literature composed in three royal academies at Madurai: Ettuthokai (Eight Anthologies), Pattupattu (Ten Idylls), Tolkappiyam (foundational grammar and poetics by Tolkappiyar), categorized into Akam (internal personal love poetry) and Puram (external heroic war poetry); Five Great Tamil Epics (Aimperumkappiyam) led by Ilango Adigal's Silappadikaram (story of Kannagi's anklet) and Sittalai Sathanar's Manimekalai.",
        "entities": ["Sangam Academies at Madurai", "Akam and Puram Poetics", "Tolkappiyam Grammar", "Silappadikaram (Kannagi's Story)", "Manimekalai Buddhist Epic", "Ettuthokai & Pattupattu"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: medieval_bhakti-sufi_literature
    {
        "slug": "bhakti_and_sufi_literary_traditions_vernacular",
        "name": "Bhakti & Sufi Vernacular Literature Across India",
        "parentId": f"{SUBJECT_ID}.indian_literature_languages.medieval_bhakti-sufi_literature",
        "description": "Democratization of spiritual knowledge through regional vernacular languages: Tamil Alvars (Divya Prabandham) and Nayanars (Tevaram); Nirguna poets Kabir (Bijak, Sakhi, Sabad) and Guru Nanak (Guru Granth Sahib); Saguna poets Tulsidas (Ramcharitmanas in Awadhi), Surdas (Sursagar in Brajbhasha), and Mirabai (Rajasthani/Braj padas); Sufi Persian and Hindavi literature pioneered by Amir Khusrau (father of Qawwali and Khari Boli poetry).",
        "entities": ["Alvars (Divya Prabandham) & Nayanars (Tevaram)", "Kabir's Bijak and Dohas", "Tulsidas Ramcharitmanas", "Mirabai Devotional Padas", "Amir Khusrau Hindavi Poetry", "Sufi Premakhyan (Padmavat by Jayasi)"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: classical_languages_of_india_scripts
    {
        "slug": "classical_languages_of_india_criteria_recognition",
        "name": "Classical Languages of India: Criteria & Recognized Languages",
        "parentId": f"{SUBJECT_ID}.indian_literature_languages.classical_languages_of_india_scripts",
        "description": "Government of India criteria for conferring Classical Language status (high antiquity of early texts over 1500–2000 years, valuable heritage corpus, original literary tradition); Currently recognized classical languages: Tamil (2004), Sanskrit (2005), Telugu (2008), Kannada (2008), Malayalam (2013), Odia (2014), along with newly inducted Marathi, Pali, Prakrit, Assamese, and Bengali (2024).",
        "entities": ["Classical Language Criteria", "Tamil & Sanskrit Recognition", "Kannada & Telugu Classical Status", "Malayalam & Odia Classical Status", "2024 Inclusions (Marathi, Pali, Prakrit, Assamese, Bengali)"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "evolution_of_ancient_indian_scripts_brahmi_kharosthi",
        "name": "Evolution of Ancient Indian Scripts (Brahmi, Kharosthi)",
        "parentId": f"{SUBJECT_ID}.indian_literature_languages.classical_languages_of_india_scripts",
        "description": "Paleography and epigraphic evolution: Brahmi script (mother of most Indian and Southeast Asian writing systems, deciphered by James Prinsep in 1837 for Ashokan edicts, written left-to-right), Kharosthi script (Aramaic-derived, written right-to-left in northwestern Gandhara), development of Gupta script, Siddhamatrika, Nagari/Devanagari, and Southern Grantha/Kadamba scripts.",
        "entities": ["Brahmi Script Decipherment (James Prinsep 1837)", "Kharosthi Right-to-Left Script", "Ashokan Inscriptions Epigraphy", "Devanagari Evolution", "Grantha & Kadamba Scripts"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },

    # -------------------------------------------------------------------------
    # Domain 5: schools_of_indian_philosophy
    # -------------------------------------------------------------------------
    # Topic: orthodox_astika_systems
    {
        "slug": "six_orthodox_schools_shad_darshana_philosophy",
        "name": "Six Orthodox Schools of Indian Philosophy (Shad-Darshana)",
        "parentId": f"{SUBJECT_ID}.schools_of_indian_philosophy.orthodox_astika_systems",
        "description": "Philosophical systems accepting authority of Vedas: Samkhya (Kapila, dualism of Purusha consciousness and Prakriti matter), Yoga (Patanjali, practical meditative Ashtanga eight-fold path), Nyaya (Gautama, rigorous logical reasoning and Pramanas epistemology), Vaisheshika (Kanada, atomic theory of matter and Padarthas categories), Purva Mimamsa (Jaimini, Vedic ritual hermeneutics), and Uttara Mimamsa / Vedanta (Badarayana, Advaita non-dualism of Adi Shankara, Vishishtadvaita of Ramanuja).",
        "entities": ["Shad-Darshana Vedic Philosophy", "Samkhya (Purusha-Prakriti Dualism)", "Patanjali's Yoga Sutras", "Nyaya Epistemology & Pramanas", "Vaisheshika Atomic Pluralism", "Shankara's Advaita Vedanta", "Ramanuja's Vishishtadvaita"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: heterodox_nastika_systems
    {
        "slug": "heterodox_traditions_buddhism_jainism_charvaka_ajivika",
        "name": "Heterodox Traditions: Buddhism, Jainism, Charvaka & Ajivika",
        "parentId": f"{SUBJECT_ID}.schools_of_indian_philosophy.heterodox_nastika_systems",
        "description": "Non-Vedic nastika philosophical systems: Buddhism (Gautama Buddha, Four Noble Truths, Noble Eightfold Path, Pratityasamutpada dependent origination, Anatta non-self, Hinayana vs Mahayana vs Vajrayana), Jainism (Lord Mahavira, Triratna, Ahimsa absolute non-violence, Anekantavada multi-faceted reality, Syadvada, Digambara and Svetambara), Charvaka / Lokayata (Brihaspati, radical empiricism and hedonistic materialism, rejecting afterlife), and Ajivika (Makkhali Gosala, strict fatalism and cosmic determinism / Niyati).",
        "entities": ["Four Noble Truths & Eightfold Path", "Pratityasamutpada & Anatta", "Anekantavada & Syadvada (Jain Epistemology)", "Ahimsa and Triratna", "Charvaka Materialism (Lokayata)", "Ajivika Determinism (Niyati)"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },

    # -------------------------------------------------------------------------
    # Domain 6: fairs_festivals_crafts_unesco_heritage
    # -------------------------------------------------------------------------
    # Topic: traditional_handicrafts_textiles
    {
        "slug": "traditional_indian_textiles_embroidery_gi_tags",
        "name": "Traditional Indian Textiles, Weaves & Embroidery Crafts",
        "parentId": f"{SUBJECT_ID}.fairs_festivals_crafts_unesco_heritage.traditional_handicrafts_textiles",
        "description": "Celebrated regional textile traditions holding Geographical Indication (GI) tags: Pashmina & Kani shawls (Kashmir), Banarasi brocade silk (UP), Kanjeevaram silk (Tamil Nadu), Patola double-ikat (Patan, Gujarat), Chanderi and Maheshwari (MP), Muga golden silk (Assam); Traditional embroidery styles: Phulkari (Punjab), Chikankari (Lucknow), Kantha (Bengal), Kasuti (Karnataka), and Zardozi metallic embroidery.",
        "entities": ["Pashmina & Kani Shawls (GI)", "Banarasi & Kanjeevaram Silks", "Patola Double-Ikat Weaving", "Muga Silk of Assam", "Chikankari & Phulkari Embroidery", "Kasuti Embroidery of Karnataka"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "traditional_metal_clay_stone_wood_crafts",
        "name": "Traditional Metal, Clay, Stone & Wood Crafts of India",
        "parentId": f"{SUBJECT_ID}.fairs_festivals_crafts_unesco_heritage.traditional_handicrafts_textiles",
        "description": "Indigenous non-textile handicrafts: Dhokra lost-wax bell-metal casting (Bastar, Chhattisgarh and Bengal), Bidriware inlaid zinc-copper metalwork (Bidar), Blue Pottery (Jaipur), Bankura terracotta horses (West Bengal), Thanjavur metal plates, Sandalwood carving (Karnataka), and Aranmula Kannadi metal mirrors (Kerala).",
        "entities": ["Dhokra Lost-Wax Bell Metal Craft", "Bidriware Silver Inlay Metalwork", "Jaipur Blue Pottery", "Aranmula Metal Mirror (GI)", "Bankura Terracotta Horses", "Sandalwood Woodcarving"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: unesco_world_heritage_sites_intangible_cultural_heritage
    {
        "slug": "unesco_cultural_world_heritage_sites_india",
        "name": "UNESCO Cultural World Heritage Sites in India",
        "parentId": f"{SUBJECT_ID}.fairs_festivals_crafts_unesco_heritage.unesco_world_heritage_sites_intangible_cultural_heritage",
        "description": "In-depth coverage of India's 34+ cultural UNESCO World Heritage sites: Ancient rock sanctuaries (Ajanta, Ellora, Bhimbetka), monumental temple complexes (Khajuraho, Sun Temple Konark, Great Living Chola Temples, Mahabalipuram, Pattadakal, Hampi), Harappan metropolis Dholavira, Kakatiya Rudreshwara (Ramappa) Temple, Santiniketan of Rabindranath Tagore, and the Sacred Ensembles of the Hoysalas (Belur, Halebidu, Somanathapura).",
        "entities": ["UNESCO Cultural Heritage Sites", "Dholavira Harappan City (UNESCO)", "Kakatiya Ramappa Temple (UNESCO)", "Sacred Ensembles of the Hoysalas (UNESCO 2023)", "Santiniketan (UNESCO 2023)", "Hampi Vijayanagara Ruins"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "unesco_intangible_cultural_heritage_ich_india",
        "name": "UNESCO Representative List of Intangible Cultural Heritage (ICH)",
        "parentId": f"{SUBJECT_ID}.fairs_festivals_crafts_unesco_heritage.unesco_world_heritage_sites_intangible_cultural_heritage",
        "description": "India's 15 cultural elements inscribed on UNESCO Representative List of Intangible Cultural Heritage of Humanity: Tradition of Vedic Chanting, Ramlila, Koodiyattam Sanskrit theatre, Ramman festival of Garhwal, Mudiyettu ritual theatre of Kerala, Kalbelia folk songs/dances, Chhau dance, Buddhist chanting of Ladakh, Sankirtana of Manipur, Traditional brass and copper craft of utensil making among Thatheras of Jandiala Guru (Punjab), Yoga, Nawrouz, Kumbh Mela, Durga Puja in Kolkata, and Garba dance of Gujarat (2023).",
        "entities": ["UNESCO Intangible Cultural Heritage (ICH)", "Tradition of Vedic Chanting", "Ramlila & Kumbh Mela", "Durga Puja in Kolkata (UNESCO ICH)", "Garba of Gujarat (UNESCO ICH 2023)", "Thatheras of Jandiala Guru Copper Craft", "Koodiyattam & Mudiyettu"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: major_fairs_religious_cultural_festivals
    {
        "slug": "major_religious_cultural_fairs_festivals_india",
        "name": "Major Fairs & Harvest Festivals Across India",
        "parentId": f"{SUBJECT_ID}.fairs_festivals_crafts_unesco_heritage.major_fairs_religious_cultural_festivals",
        "description": "Fairs and carnivals of cultural significance: Kumbh Mela (Prayagraj, Haridwar, Ujjain, Nashik - largest peaceful religious gathering), Pushkar Camel Fair (Rajasthan), Hornbill Festival (Nagaland 'Festival of Festivals'), Hemis Festival (Ladakh), Thrissur Pooram (Kerala elephant festival); Harvest and New Year festivals: Makar Sankranti, Pongal, Bihu, Baisakhi, Onam, Ugadi, Vishu, Gudi Padwa, Losar, and Cheti Chand.",
        "entities": ["Kumbh Mela (Four Sacred Tirthas)", "Pushkar Camel Fair", "Hornbill Festival of Nagaland", "Hemis Gompa Festival Ladakh", "Thrissur Pooram Temple Festival", "Harvest Festivals (Pongal, Makar Sankranti, Bihu, Onam)"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },

    # -------------------------------------------------------------------------
    # Domain 7: art_culture_of_karnataka (NEW DOMAIN)
    # -------------------------------------------------------------------------
    # Topic: karnataka_temple_architecture_sculpture
    {
        "slug": "badami_chalukya_architecture_aihole_badami_pattadakal",
        "name": "Badami Chalukya Architecture (Aihole, Badami, Pattadakal)",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.karnataka_temple_architecture_sculpture",
        "description": "Early Chalukyan architectural revolution (6th–8th century CE): Aihole known as the 'Cradle of Indian Temple Architecture' (Lad Khan, Durga Temple with apsidal Buddhist chaitya plan, Ravana Phadi cave temple), Badami rock-cut cave temples (Cave 3 dedicated to Vishnu with Anantasayana relief), and UNESCO World Heritage site Pattadakal representing climax of early structural temple synthesis (Virupaksha Temple built by Queen Lokamahadevi, Mallikarjuna Temple, Sangameshwara).",
        "entities": ["Aihole Cradle of Temple Architecture", "Durga Temple Apsidal Plan Aihole", "Badami Rock-Cut Caves (Cave 3 Vishnu)", "Pattadakal UNESCO Monuments", "Virupaksha Temple Lokamahadevi", "Synthesis of Nagara & Dravida"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "slug": "hoysala_architecture_sculpture_belur_halebidu_somanathapura",
        "name": "Hoysala Architecture & Sculptures (UNESCO World Heritage 2023)",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.karnataka_temple_architecture_sculpture",
        "description": "Distinctive medieval Hoysala temple style (11th–14th century) constructed using fine-grained chloritic schist (soapstone): Stellate (star-shaped) ground plan raised on a high platform (Jagati), richly carved friezes of elephants, lions, horses, and floral creepers; Celebrated temples: Chennakeshava Temple at Belur (sculpted Madanika/Shalabhanjika bracket figures), Hoysaleshwara Temple at Halebidu (twin Dvikuta shrine with 240+ relief statues), and Keshava Temple at Somanathapura (complete Trikuta shrine); Inscribed on UNESCO World Heritage list in 2023.",
        "entities": ["Hoysala Architecture (UNESCO 2023)", "Stellate / Star-shaped Ground Plan", "Chloritic Schist / Soapstone Carving", "Belur Chennakeshava Temple", "Halebidu Hoysaleshwara Dvikuta", "Somanathapura Keshava Trikuta", "Madanika Bracket Sculptures"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "slug": "vijayanagara_architecture_hampi_unesco_monuments",
        "name": "Vijayanagara Architecture & Hampi UNESCO Monuments",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.karnataka_temple_architecture_sculpture",
        "description": "Grand imperial architecture of Vijayanagara Empire (14th–16th century) centered at capital Hampi (Pampa Kshetra on Tungabhadra river): Distinctive Kalyana Mandapa (marriage hall) with intricate composite pillars carving rearing Yalis (mythical beasts), open pavilions, massive Raya Gopurams; Iconic monuments: Vitthala Temple complex with 56 musical acoustic pillars and monolithic Stone Chariot (Garuda shrine), Virupaksha Temple, Mahanavami Dibba platform, Lotus Mahal, and Queen's Bath reflecting Islamic-Vijayanagara secular synthesis.",
        "entities": ["Vijayanagara Architectural Style", "Hampi UNESCO World Heritage Site", "Vitthala Temple Musical Pillars", "Monolithic Stone Chariot (Hampi)", "Kalyana Mandapa & Rearing Yalis", "Mahanavami Dibba Reliefs", "Lotus Mahal Secular Architecture"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "slug": "rashtrakuta_kadamba_ganga_bahmani_architecture",
        "name": "Kadamba, Ganga, Rashtrakuta & Deccan Sultanate Architecture",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.karnataka_temple_architecture_sculpture",
        "description": "Diverse architectural expressions in Karnataka: Kadamba dynasty's stepped pyramidal Shikhara (Kadamba Shikhara, Halasi temples); Western Ganga dynasty's Jain architectural legacy, climaxing in the monolithic 57-foot statue of Gommateshwara / Bahubali carved on Vindhyagiri hill at Shravanabelagola by Chavundaraya (981 CE, Mahamastakabhisheka festival); Adil Shahi dynasty of Bijapur featuring Gol Gumbaz (one of the largest single domes in the world with an acoustic Whispering Gallery) and Ibrahim Rauza.",
        "entities": ["Kadamba Stepped Shikhara", "Gommateshwara Monolith Shravanabelagola", "Chavundaraya Western Ganga Dynasty", "Mahamastakabhisheka Festival", "Gol Gumbaz Whispering Gallery", "Ibrahim Rauza Bijapur"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    # Topic: performing_arts_theatre_folk_traditions_of_karnataka
    {
        "slug": "yakshagana_theatre_tradition_coastal_malnad",
        "name": "Yakshagana: Coastal & Malnad Traditional Dance-Theatre",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka",
        "description": "All-night traditional folk theatre of coastal and Malnad Karnataka: Distinctive regional styles Tenkutittu (Southern style, vibrant percussion Chande/Maddale, Carnatic influence) and Badagutittu (Northern style, Yakshagana headgear Kireeta, dramatic footwork); Performance structure: Prasanga (episodic mythic script from Mahabharata/Ramayana), Himmela (background musical ensemble led by Bhagavatha narrator), Mummela (actors, dancers performing dialogue and impromptu Vachika abhinaya).",
        "entities": ["Yakshagana Dance-Drama", "Tenkutittu vs Badagutittu Styles", "Bhagavatha (Narrator & Music Director)", "Himmela and Mummela Structure", "Prasanga Mythological Texts", "Kireeta Headgear & Costumes"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "slug": "karnataka_folk_dances_dollu_kunitha_veeragase_kamsale",
        "name": "Folk Dances of Karnataka: Dollu Kunitha, Veeragase & Kamsale",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka",
        "description": "Rich folk dances and ritual performance traditions: Dollu Kunitha (vigorous drum dance performed by Kuruba community dedicated to deity Beereshwara), Veeragase (energetic warrior martial dance performed during Dasara by Shaivite Jangamas, based on Veerabhadra legends), Kamsale (rhythmic bronze cymbal dance dedicated to Male Mahadeshwara), Goravara Kunitha (devotees of Mailara Linga wearing bear-fur caps and flute/damaruga), Suggi Kunitha, and Somana Kunitha.",
        "entities": ["Dollu Kunitha (Kuruba Drum Dance)", "Veeragase (Shaivite Martial Dance)", "Kamsale (Male Mahadeshwara Cymbals)", "Goravara Kunitha (Mailara Devotees)", "Somana Kunitha & Suggi Kunitha"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "slug": "puppetry_traditions_togalu_gombeyaata_karnataka",
        "name": "Puppetry of Karnataka: Togalu Gombeyaata & Gombeyatta",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka",
        "description": "Ancient puppetry heritage of Karnataka: Togalu Gombeyaata (traditional shadow puppetry using translucent dyed deer-skin/goat-leather puppets projected against a backlit white cloth screen, narrating episodes from epic scriptures) and Gombeyatta (intricate traditional string puppetry styled after Yakshagana dance figures with wooden joints and ornate crowns).",
        "entities": ["Togalu Gombeyaata Shadow Puppetry", "Leather Puppet Craftsmanship", "Gombeyatta String Puppetry", "Yakshagana Puppet Styling", "Epic Storytelling Traditions"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    # Topic: karnataka_paintings_crafts_gi_heritage
    {
        "slug": "mysore_traditional_paintings_gesso_work",
        "name": "Mysore Traditional Paintings: Gesso Work & Royal Patronage",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage",
        "description": "Celebrated classical painting style flourishing under the Wodeyar rulers of Mysore (especially Maharaja Krishnaraja Wodeyar III): Delicate muted colors, lustrous gold leaf embossing, unique Gesso paste technique (white lead, gambose, and zinc oxide paste creating tactile low-relief ornamentation on jewelry and thrones), primarily depicting Vaishnavite and Shaivite deities with serene expressions.",
        "entities": ["Mysore Traditional Paintings", "Gesso Paste Relief Technique", "Pure Gold Leaf Embossing", "Mumbra & Shweta Varna Aesthetics", "Krishnaraja Wodeyar III Patronage", "Devotional Iconography"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "slug": "gi_tagged_handicrafts_and_textiles_of_karnataka",
        "name": "GI-Tagged Handicrafts & Handlooms of Karnataka",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage",
        "description": "Karnataka's premier crafts awarded Geographical Indication (GI) status: Channapatna wooden lacquer toys (Gombe made from soft Wrightia tinctoria / Aale mara wood, patronized originally by Tipu Sultan), Bidriware (intricate silver inlay on blackened zinc-copper alloy from Bidar), Mysore Silk (pure mulberry silk with gold zari), Ilkal Sarees (featuring distinctive red Tope Teni pallu and Kasuti embroidery), Sandalwood Carvings, Kinnal Wooden Craft, and Guledgudd Khana.",
        "entities": ["Channapatna Lacquerware Toys (GI)", "Bidriware Silver Inlay (GI)", "Mysore Silk & Zari Weaving (GI)", "Ilkal Sarees & Tope Teni Pallu (GI)", "Kinnal Wooden Toys & Idols", "Sandalwood Carving Heritage"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    # Topic: vachana_haridasa_bhakti_movements_of_karnataka
    {
        "slug": "vachana_movement_basaveshwara_anubhava_mantapa",
        "name": "Vachana Movement: Basaveshwara, Anubhava Mantapa & Sharanas",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka",
        "description": "12th-century socio-religious and literary revolution led by Basaveshwara (Basavanna) and the Sharanas: Radical rejection of caste hierarchies, untouchability, and gender discrimination; Establishment of Anubhava Mantapa at Kalyana (first socio-spiritual parliament); Foundational ethics of 'Kayaka' (dignity of labor) and 'Dasoha' (selfless sharing); Vachana literature in simple Kannada prose-poetry by Basavanna (pen name Koodalasangamadeva), Allama Prabhu, Akka Mahadevi (Chennamallikarjuna), and Channabasavanna.",
        "entities": ["Basaveshwara (Basavanna)", "Anubhava Mantapa (Spiritual Parliament)", "Vachana Literature in Kannada", "Kayaka & Dasoha Philosophy", "Akka Mahadevi & Allama Prabhu", "Socio-Religious Equality Movement"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },
    {
        "slug": "haridasa_movement_purandara_dasa_kanaka_dasa",
        "name": "Haridasa Movement: Purandara Dasa & Kanaka Dasa",
        "parentId": f"{SUBJECT_ID}.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka",
        "description": "Bhakti devotional movement in Karnataka spreading Dvaita philosophy through devotional songs (Devaranamas/Kirtanas): Purandara Dasa (revered as Karnataka Sangeeta Pitamaha for structuring fundamental musical exercises / Sarale Varase and composing thousands of Kirtanas praising Lord Vittala) and Kanaka Dasa (saint-philosopher from Kuruba community, composed Mohanatarangini, Nalacharitre, and Ramadhanya Charitre advocating caste equality; associated with Kanakana Kindi window at Udupi Sri Krishna Temple).",
        "entities": ["Purandara Dasa (Karnataka Sangeeta Pitamaha)", "Kanaka Dasa & Ramadhanya Charitre", "Kanakana Kindi at Udupi", "Devaranama Devotional Compositions", "Vyasatirtha & Dasa Sahitya", "Dvaita Bhakti Tradition"],
        "examTags": {"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}
    },

    # -------------------------------------------------------------------------
    # Domain 8: martial_arts_traditional_sports_calendars (NEW DOMAIN)
    # -------------------------------------------------------------------------
    # Topic: martial_arts_and_traditional_sports_of_india
    {
        "slug": "traditional_indian_martial_arts_forms",
        "name": "Traditional Indian Martial Arts (Kalaripayattu, Thang-Ta, Silambam)",
        "parentId": f"{SUBJECT_ID}.martial_arts_traditional_sports_calendars.martial_arts_and_traditional_sports_of_india",
        "description": "Ancient combat systems of India: Kalaripayattu of Kerala (one of the oldest surviving martial arts, training in Kalari pit arena, weapon forms including Urumi flexible sword), Silambam of Tamil Nadu (bamboo staff martial technique, references in Silappadikaram), Thang-Ta / Huyen Langlon of Manipur (sword and spear armed combat), Gatka of Punjab (Sikh martial art with wooden sticks and shields), Mardani Khel of Maharashtra, and Pari-Khanda of Bihar.",
        "entities": ["Kalaripayattu (Kerala Mother of Martial Arts)", "Urumi Flexible Sword", "Silambam Bamboo Staff Martial Art", "Thang-Ta (Manipur Huyen Langlon)", "Gatka Sikh Martial Tradition", "Mardani Khel & Pari-Khanda"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "indigenous_sports_and_animal_sports_of_india",
        "name": "Indigenous Sports & Cultural Animal Events (Mallakhamb, Kambala)",
        "parentId": f"{SUBJECT_ID}.martial_arts_traditional_sports_calendars.martial_arts_and_traditional_sports_of_india",
        "description": "Indigenous physical and community sports: Mallakhamb (traditional acrobatic gymnastics on a vertical wooden pole or rope, state sport of Madhya Pradesh), Kambala (slushy paddy-field buffalo racing festival in coastal Karnataka), Jallikattu (traditional bull-taming sport during Pongal in Tamil Nadu), Vallam Kali (Nehru Trophy snake boat race in Kerala backwaters), and Kabaddi & Kho-Kho.",
        "entities": ["Mallakhamb Pole Gymnastics", "Kambala Buffalo Race Karnataka", "Jallikattu Bull Taming Event", "Vallam Kali Snake Boat Race Kerala", "Indigenous Indian Sports"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: indian_calendar_systems_eras_national_symbols
    {
        "slug": "indian_calendar_systems_and_historical_eras",
        "name": "Indian Calendar Systems: Saka, Vikrama Samvat & National Calendar",
        "parentId": f"{SUBJECT_ID}.martial_arts_traditional_sports_calendars.indian_calendar_systems_eras_national_symbols",
        "description": "Historical astronomical eras and chronological systems in India: Saka Era (commencing 78 CE, instituted by King Kanishka/Chastana, adopted as India's National Calendar on March 22, 1957 alongside Gregorian calendar; months Chaitra through Phalguna), Vikrama Samvat (commencing 57 BCE commemorating King Vikramaditya's victory, lunar calendar base), Kali Era (3102 BCE), and comparison of solar vs lunisolar calculations.",
        "entities": ["Saka Era (78 CE National Calendar)", "Saha Calendar Reform Committee (1957)", "Chaitra First Month of National Year", "Vikrama Samvat (57 BCE)", "Lunisolar & Solar Indian Calendars", "Regional Eras (Kollam, Hijri)"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "national_symbols_insignia_and_heritage_emblems",
        "name": "National Symbols, State Insignia & Cultural Heritage Emblems",
        "parentId": f"{SUBJECT_ID}.martial_arts_traditional_sports_calendars.indian_calendar_systems_eras_national_symbols",
        "description": "Official national cultural emblems: State Emblem of India adapted from Lion Capital of Sarnath (four Asiatic lions, abacus with elephant, horse, bull, lion separated by wheels, motto Satyameva Jayate in Devanagari from Mundaka Upanishad, adopted Jan 26, 1950); National Anthem (Jana Gana Mana by Rabindranath Tagore), National Song (Vande Mataram from Bankim Chandra Chattopadhyay's Anandamath), National Flag design by Pingali Venkayya, and National Animal, Bird, Flower symbols.",
        "entities": ["National Emblem (Sarnath Lion Capital)", "Satyameva Jayate (Mundaka Upanishad)", "Jana Gana Mana National Anthem", "Vande Mataram (Bankim Chandra Anandamath)", "Pingali Venkayya Flag Design", "State Insignia Protocols"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },

    # -------------------------------------------------------------------------
    # Domain 9: cultural_institutions_numismatics_initiatives (NEW DOMAIN)
    # -------------------------------------------------------------------------
    # Topic: national_cultural_institutions_and_bodies
    {
        "slug": "premier_cultural_institutions_akademis_asi",
        "name": "Premier Cultural Bodies: ASI, Sangeet Natak, Sahitya & Lalit Kala",
        "parentId": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives.national_cultural_institutions_and_bodies",
        "description": "Apex statutory and autonomous cultural institutions under Ministry of Culture: Archaeological Survey of India (ASI, founded 1861 by Alexander Cunningham for conservation of centrally protected monuments), Sangeet Natak Akademi (National Academy of Music, Dance and Drama, established 1953), Sahitya Akademi (National Academy of Letters promoting 24 languages), Lalit Kala Akademi (National Academy of Visual Arts), and National School of Drama (NSD).",
        "entities": ["Archaeological Survey of India (ASI)", "Alexander Cunningham (Father of Indian Archaeology)", "Sangeet Natak Akademi (1953)", "Sahitya Akademi (24 Languages)", "Lalit Kala Akademi", "National School of Drama (NSD)"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "national_museums_galleries_and_libraries",
        "name": "National Museums, Art Galleries & Cultural Repositories",
        "parentId": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives.national_cultural_institutions_and_bodies",
        "description": "Major national repositories of tangible heritage: National Museum (New Delhi, housing Harappan antiquities and Buddhist relics), National Gallery of Modern Art (NGMA, exhibiting Raja Ravi Varma, Amrita Sher-Gil, Bengal School), National Library of India (Kolkata, largest library under Delivery of Books Act), and Indira Gandhi National Centre for the Arts (IGNCA, multidimensional art resource center).",
        "entities": ["National Museum New Delhi", "National Gallery of Modern Art (NGMA)", "Raja Ravi Varma & Amrita Sher-Gil Collections", "National Library Kolkata", "IGNCA Cultural Centre"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: ancient_and_medieval_indian_coinage_numismatics
    {
        "slug": "ancient_indian_coinage_punch_marked_to_guptas",
        "name": "Ancient Indian Coinage: Punch-Marked Coins to Gupta Dinaras",
        "parentId": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives.ancient_and_medieval_indian_coinage_numismatics",
        "description": "Chronological evolution of Indian numismatics: Punch-Marked Coins (Puranas/Karshapanas, 6th century BCE Mahajanapadas, silver/copper irregular shapes stamped with symbols of sun, hill, tree); Indo-Greek coinage (first to bear portraits, titles, and bilingual Greek-Kharosthi legends); Kushana coinage (first gold coins in India under Vima Kadphises, high purity gold Dinaras depicting Shiva and Buddha); Gupta coinage (superb artistic gold Dinaras showing rulers as archers, lion-slayers, and lyrist/veena players under Samudragupta).",
        "entities": ["Punch-Marked Coins (Karshapanas)", "Indo-Greek Portrait Coinage", "Kushana Gold Dinaras (Vima Kadphises)", "Gupta Gold Coinage (Dinaras)", "Samudragupta Lyrist Type Coins", "Ancient Numismatics & Metrology"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "medieval_coinage_south_india_sultanate_mughal",
        "name": "Medieval Coinage: Vijayanagara Varahas, Sher Shah Rupiya & Mughals",
        "parentId": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives.ancient_and_medieval_indian_coinage_numismatics",
        "description": "Medieval numismatic developments: South Indian coinage led by Vijayanagara Empire's gold 'Varaha' (also known as Pagoda, depicting deities Venkateshwara, Shiva-Parvati, and Gandabherunda double-headed eagle); Delhi Sultanate coinage (Iltutmish introducing silver Tanka and copper Jital); Sher Shah Suri's standard silver 'Rupiya' (base of modern Rupee) and copper 'Dam'; Mughal coinage system perfected by Akbar featuring circular and square Mohurs with calligraphic Quranic verses and Persian couplets.",
        "entities": ["Vijayanagara Gold Varahas (Pagodas)", "Gandabherunda Mythical Emblem", "Iltutmish Tanka and Jital", "Sher Shah Suri Silver Rupiya", "Mughal Gold Mohurs & Zodiac Coins", "Calligraphic Numismatic Art"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    # Topic: government_heritage_conservation_schemes_awards
    {
        "slug": "cultural_heritage_schemes_and_initiatives",
        "name": "Government Heritage Conservation Schemes: PRASHAD, HRIDAY & Mausam",
        "parentId": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards",
        "description": "Central government flagship schemes for heritage conservation and tourism: PRASHAD (Pilgrimage Rejuvenation and Spiritual, Heritage Augmentation Drive), HRIDAY (Heritage City Development and Augmentation Yojana), Adopt a Heritage 2.0 / Apni Dharohar Apni Pehchan initiative, Project Mausam (reconnecting Indian Ocean maritime trade and cultural linkages), and National Mission on Cultural Mapping (Mera Gaon Meri Dharohar).",
        "entities": ["PRASHAD Scheme (Pilgrimage & Heritage)", "HRIDAY Heritage City Scheme", "Adopt a Heritage 2.0 Initiative", "Project Mausam Indian Ocean Cultural Route", "Mera Gaon Meri Dharohar Portal"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    },
    {
        "slug": "national_cultural_awards_and_honours",
        "name": "National Honours & Cultural Awards (Jnanpith, Akademi, Kalidas)",
        "parentId": f"{SUBJECT_ID}.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards",
        "description": "Pre-eminent national honors in art and literature: Jnanpith Award (highest Indian literary award presented by Bharatiya Jnanpith in 22 Eighth Schedule languages + English); Sahitya Akademi Awards; Sangeet Natak Akademi Fellowship and Amrit Awards; Kalidas Samman (prestigious arts award by MP government); Civilian honors (Padma Vibhushan, Padma Bhushan, Padma Shri) recognizing master craftsmen, folk artists, and classical exponents.",
        "entities": ["Jnanpith Award (Highest Literary Honour)", "Sahitya Akademi Awards", "Sangeet Natak Akademi Amrit Awards", "Kalidas Samman", "Padma Awards for Traditional Artists", "Cultural Recognition Systems"],
        "examTags": {"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}
    }
]

def generate_keywords(name, description, entities):
    text = f"{name} {description} {' '.join(entities)}"
    words = re.findall(r'[a-zA-Z0-9\~%]+', text)
    seen = set()
    keywords = []
    stopwords = {"and", "or", "the", "a", "an", "in", "on", "of", "to", "for", "with", "by", "from", "at", "is", "are", "vs", "etc", "as", "its"}
    for w in words:
        wl = w.lower()
        if wl not in stopwords and len(w) > 1 and w not in seen:
            seen.add(w)
            keywords.append(w)
    return keywords

def main():
    kg_path = "src/data/knowledge_graph.json"
    with open(kg_path, "r", encoding="utf-8") as f:
        kg = json.load(f)

    nodes = kg["nodes"]
    subject_node = nodes.get(SUBJECT_ID)
    if not subject_node:
        print(f"Error: {SUBJECT_ID} not found!")
        return

    # 1. Clean up existing level-4 nodes under Art & Culture if any
    ac_l4_to_remove = [k for k, v in nodes.items() if k.startswith(SUBJECT_ID) and v.get("level") == 4]
    print(f"Removing {len(ac_l4_to_remove)} existing Level-4 Art & Culture nodes if any...")
    for k in ac_l4_to_remove:
        del nodes[k]

    # 2. Add New Domains
    for d in NEW_DOMAINS:
        did = d["id"]
        if did not in nodes:
            d_node = {
                "id": did,
                "slug": d["slug"],
                "name": d["name"],
                "level": 2,
                "levelName": "Domain",
                "subject": SUBJECT_NAME,
                "subjectId": SUBJECT_ID,
                "parentId": SUBJECT_ID,
                "childrenIds": [],
                "ancestorIds": [SUBJECT_ID],
                "examTags": d["examTags"],
                "rawExamTagString": d["rawExamTagString"],
                "entities": [],
                "keywords": generate_keywords(d["name"], "", [])
            }
            nodes[did] = d_node
            if did not in subject_node.get("childrenIds", []):
                subject_node["childrenIds"].append(did)
            print(f"Added Domain: {did}")

    # 3. Add New Topics
    for t in NEW_TOPICS:
        tid = t["id"]
        parent_id = t["parentId"]
        parent_node = nodes.get(parent_id)
        if not parent_node:
            print(f"Error: Parent Domain {parent_id} not found!")
            continue

        if tid not in nodes:
            t_node = {
                "id": tid,
                "slug": t["slug"],
                "name": t["name"],
                "level": 3,
                "levelName": "Topic",
                "subject": SUBJECT_NAME,
                "subjectId": SUBJECT_ID,
                "parentId": parent_id,
                "childrenIds": [],
                "ancestorIds": [SUBJECT_ID, parent_id],
                "examTags": t["examTags"],
                "rawExamTagString": t["rawExamTagString"],
                "entities": [],
                "keywords": generate_keywords(t["name"], "", [])
            }
            nodes[tid] = t_node
            if tid not in parent_node.get("childrenIds", []):
                parent_node["childrenIds"].append(tid)
            print(f"Added Topic: {tid}")

    # 4. Reset childrenIds on all Topics under Art & Culture before adding Subtopics
    for k, v in nodes.items():
        if k.startswith(SUBJECT_ID) and v.get("level") == 3:
            v["childrenIds"] = []

    # 5. Add Level-4 Subtopics
    added_subtopics = 0
    for sub in LEVEL_4_SUBTOPICS:
        parent_id = sub["parentId"]
        node_id = f"{parent_id}.{sub['slug']}"
        parent_node = nodes.get(parent_id)
        if not parent_node:
            print(f"Error: Parent topic {parent_id} not found for subtopic {sub['slug']}!")
            continue

        ancestor_ids = list(parent_node.get("ancestorIds", [])) + [parent_id]
        keywords = generate_keywords(sub["name"], sub["description"], sub["entities"])

        raw_tag_parts = []
        for k, v in sub["examTags"].items():
            raw_tag_parts.append(f"[{k.upper()}: {', '.join(v)}]")
        raw_exam_tag_string = " ".join(raw_tag_parts)

        node_obj = {
            "id": node_id,
            "slug": sub["slug"],
            "name": sub["name"],
            "level": 4,
            "levelName": "Subtopic_Entity",
            "subject": SUBJECT_NAME,
            "subjectId": SUBJECT_ID,
            "parentId": parent_id,
            "childrenIds": [],
            "ancestorIds": ancestor_ids,
            "examTags": sub["examTags"],
            "rawExamTagString": raw_exam_tag_string,
            "description": sub["description"],
            "entities": sub["entities"],
            "keywords": keywords
        }

        nodes[node_id] = node_obj
        if node_id not in parent_node.get("childrenIds", []):
            parent_node["childrenIds"].append(node_id)

        added_subtopics += 1

    # 6. Recompute Stats
    l1_count = sum(1 for n in nodes.values() if n.get("level") == 1)
    l2_count = sum(1 for n in nodes.values() if n.get("level") == 2)
    l3_count = sum(1 for n in nodes.values() if n.get("level") == 3)
    l4_count = sum(1 for n in nodes.values() if n.get("level") == 4)

    kg["stats"] = {
        "total_nodes": len(nodes),
        "level_1_subjects": l1_count,
        "level_2_domains": l2_count,
        "level_3_topics": l3_count,
        "level_4_subtopics": l4_count
    }

    with open(kg_path, "w", encoding="utf-8") as f:
        json.dump(kg, f, indent=2, ensure_ascii=False)

    print(f"\nArt & Culture Enrichment Completed successfully!")
    print(f"Added {len(NEW_DOMAINS)} new Domains, {len(NEW_TOPICS)} new Topics, and {added_subtopics} Level-4 Subtopics.")
    print(f"New KG Total Nodes: {len(nodes)} (L1: {l1_count}, L2: {l2_count}, L3: {l3_count}, L4: {l4_count})")

if __name__ == "__main__":
    main()
