# -*- coding: utf-8 -*-
"""
Enrich Comprehensive Geography Knowledge Graph
----------------------------------------------
Implements approved taxonomy expansion:
1. Indian Physical Geography (Physiography, Drainage, Monsoon, Soils/Forests - 13 Level-4 subtopics)
2. Human Geography (Demography, Urban Systems, Tribal Demographics & Anthropology - 8 Level-4 subtopics)
3. Economic & Resource Geography (Minerals & Energy, Industrial Location, Agriculture & Food Security - 9 Level-4 subtopics)
4. Geography of the World (NEW Domain with dedicated country sections for US, Canada, Russia/Central Asia, China/East Asia, Japan, South Asia, South-East Asia, New Zealand, and Continents - 18 Level-4 subtopics)
5. World Mapping & Geopolitical Locations (Streamlined to pure mapping - 6 Level-4 subtopics, removing duplicate physical topics)
"""

import json
import os
import re

SUBJECT_ID = "geography_earth_systems"
SUBJECT_NAME = "Geography & Earth Systems"

COMMON_TAGS = {
    "upsc": ["Prelims-GS1", "Mains-GS1"],
    "kas": ["Prelims-P1", "Mains-GS1"],
    "ssc": ["GA"]
}

def make_raw_tag_str(tags):
    parts = []
    for k, v in tags.items():
        parts.append(f"[{k.upper()}: {', '.join(v)}]")
    return " ".join(parts)

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

    # =========================================================================
    # A. STREAMLINE WORLD MAPPING & GEOPOLITICAL LOCATIONS
    # =========================================================================
    mapping_domain_id = f"{SUBJECT_ID}.world_mapping_geopolitical_locations"
    obsolete_topics = [
        f"{mapping_domain_id}.major_world_rivers_lakes_drainage",
        f"{mapping_domain_id}.mountain_ranges_peaks_plateaus_world"
    ]
    for obs in obsolete_topics:
        if obs in nodes:
            print(f"Removing obsolete topic: {obs}")
            del nodes[obs]
        if mapping_domain_id in nodes:
            if obs in nodes[mapping_domain_id].get("childrenIds", []):
                nodes[mapping_domain_id]["childrenIds"].remove(obs)

    # Rename / clarify description of world mapping domain
    if mapping_domain_id in nodes:
        nodes[mapping_domain_id]["name"] = "World Mapping & Geopolitical Locations"
        nodes[mapping_domain_id]["description"] = "Spatial mapping of global strategic chokepoints, enclosed & marginal seas, international boundary lines, disputed zones, and places in geopolitical news."

    # =========================================================================
    # B. CREATE NEW DOMAIN: GEOGRAPHY OF THE WORLD
    # =========================================================================
    world_geo_domain_id = f"{SUBJECT_ID}.geography_of_the_world"
    if world_geo_domain_id not in nodes:
        nodes[world_geo_domain_id] = {
            "id": world_geo_domain_id,
            "slug": "geography_of_the_world",
            "name": "Geography of the World",
            "level": 2,
            "levelName": "Domain",
            "subject": SUBJECT_NAME,
            "subjectId": SUBJECT_ID,
            "parentId": SUBJECT_ID,
            "childrenIds": [],
            "ancestorIds": [SUBJECT_ID],
            "examTags": COMMON_TAGS,
            "rawExamTagString": make_raw_tag_str(COMMON_TAGS),
            "description": "Comprehensive regional, physical, continental, and economic geography of the world, structured by continents with dedicated standalone sections for United States, Canada, Russia & Central Asia, China & East Asia, Japan, South Asia, South-East Asia, New Zealand, Europe, Africa, South America, Australia/Oceania, and Antarctica.",
            "entities": [
                "Regional Geography of United States",
                "Regional Geography of Canada",
                "Regional Geography of Russia & Central Asia",
                "Regional Geography of China & East Asia",
                "Regional Geography of Japan",
                "Regional Geography of South Asia",
                "Regional Geography of South-East Asia",
                "Regional Geography of New Zealand",
                "Continental Geography of Europe, Africa, Americas & Oceania"
            ],
            "keywords": generate_keywords("Geography of the World", "Comprehensive regional physical continental economic geography", ["US", "Canada", "Russia", "China", "Japan", "South Asia", "Southeast Asia", "New Zealand", "Continents"])
        }

    # Update Subject childrenIds order
    subj_node = nodes[SUBJECT_ID]
    desired_domains = [
        f"{SUBJECT_ID}.physical_geography_earth_systems",
        f"{SUBJECT_ID}.climatology_atmospheric_dynamics",
        f"{SUBJECT_ID}.oceanography_marine_systems",
        f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture",
        f"{SUBJECT_ID}.human_geography_population_settlements",
        f"{SUBJECT_ID}.economic_resource_geography",
        world_geo_domain_id,
        f"{SUBJECT_ID}.world_mapping_geopolitical_locations",
        f"{SUBJECT_ID}.indian_mapping_spatial_geography",
        f"{SUBJECT_ID}.geography_of_karnataka",
        f"{SUBJECT_ID}.karnataka_mapping_state_geography"
    ]
    subj_node["childrenIds"] = [d for d in desired_domains if d in nodes]

    # =========================================================================
    # C. DEFINE NEW TOPICS
    # =========================================================================
    new_topics = [
        # Domain: Human Geography (New Topic: Tribal Demographics)
        {
            "id": f"{SUBJECT_ID}.human_geography_population_settlements.tribal_demographics_and_cultural_anthropology",
            "slug": "tribal_demographics_and_cultural_anthropology",
            "name": "Tribal Demographics, PVTGs & Cultural Anthropology",
            "parentId": f"{SUBJECT_ID}.human_geography_population_settlements",
            "description": "Spatial distribution, demographic profiles, linguistic classifications of Scheduled Tribes in India; Particularly Vulnerable Tribal Groups (PVTGs), Forest Rights Act, PESA, and tribal development policies.",
            "entities": ["Scheduled Tribes", "PVTGs (Particularly Vulnerable Tribal Groups)", "Forest Rights Act 2006", "PESA Act 1996", "Central Tribal Belt", "North-Eastern Tribes"],
            "examTags": COMMON_TAGS
        },
        # Domain: Economic & Resource Geography (New Topic: Agricultural Geography)
        {
            "id": f"{SUBJECT_ID}.economic_resource_geography.agricultural_geography_and_food_security",
            "slug": "agricultural_geography_and_food_security",
            "name": "Agricultural Geography, Cropping Patterns & Food Security",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography",
            "description": "Cropping patterns, agro-climatic zones, Green/White/Blue revolutions, irrigation infrastructure, land reforms, Public Distribution System, and National Food Security.",
            "entities": ["Agro-Climatic Zones", "Cropping Patterns", "Green Revolution", "Food Corporation of India", "PDS & NFSA 2013", "Land Reforms"],
            "examTags": COMMON_TAGS
        },
        # Domain: Geography of the World (9 Dedicated Country/Regional Topics)
        {
            "id": f"{world_geo_domain_id}.regional_geography_united_states",
            "slug": "regional_geography_united_states",
            "name": "Regional Geography of United States: Physiography, Agricultural & Industrial Belts",
            "parentId": world_geo_domain_id,
            "description": "Comprehensive physical relief, drainage (Mississippi-Missouri, Colorado, Great Lakes), agricultural belts (Corn Belt, Wheat Belt, Cotton Belt), and industrial manufacturing/tech complexes (Rust Belt, Silicon Valley, Texas Sunbelt).",
            "entities": ["Appalachian Mountains", "Rocky Mountains", "Mississippi-Missouri Drainage", "Great Lakes", "Corn Belt & Wheat Belt", "American Manufacturing Belt (Rust Belt)", "Silicon Valley"],
            "examTags": COMMON_TAGS
        },
        {
            "id": f"{world_geo_domain_id}.regional_geography_canada",
            "slug": "regional_geography_canada",
            "name": "Regional Geography of Canada: Canadian Shield, Prairies & Energy Wealth",
            "parentId": world_geo_domain_id,
            "description": "Laurentian Canadian Shield topography, glacial lake systems, St. Lawrence Seaway, Canadian Prairies grain belt, Athabasca oil sands, and mineral resources.",
            "entities": ["Canadian Shield (Laurentian Plateau)", "St. Lawrence Seaway", "Canadian Prairies (Alberta, Saskatchewan, Manitoba)", "Athabasca Oil Sands", "Sudbury Nickel Basin", "Arctic Archipelago"],
            "examTags": COMMON_TAGS
        },
        {
            "id": f"{world_geo_domain_id}.regional_geography_russia_central_asia",
            "slug": "regional_geography_russia_central_asia",
            "name": "Regional Geography of Russia & Central Asia: Siberia, Steppes & Hydrocarbon Basins",
            "parentId": world_geo_domain_id,
            "description": "Ural divide, West Siberian Plain, major north-flowing rivers (Ob, Yenisey, Lena), Lake Baikal, Central Asian steppes, Fergana Valley, and Caspian hydrocarbon basins.",
            "entities": ["Ural Mountains", "West Siberian Plain", "Lake Baikal", "Volga River Basin", "Fergana Valley", "Central Asian Steppes", "Caspian Energy Basin"],
            "examTags": COMMON_TAGS
        },
        {
            "id": f"{world_geo_domain_id}.regional_geography_china_east_asia",
            "slug": "regional_geography_china_east_asia",
            "name": "Regional Geography of China & East Asia: Relief, River Basins & Industrial Clusters",
            "parentId": world_geo_domain_id,
            "description": "Tibetan Plateau, major river systems (Yangtze, Huang He / Yellow River, Pearl River), Sichuan Red Basin, agricultural zoning, and coastal Special Economic Zones (SEZs).",
            "entities": ["Tibetan Plateau", "Yangtze River (Chang Jiang)", "Yellow River (Huang He)", "Sichuan Red Basin", "Pearl River Delta SEZ", "Yangtze River Delta", "Bayan Obo Rare Earths"],
            "examTags": COMMON_TAGS
        },
        {
            "id": f"{world_geo_domain_id}.regional_geography_japan",
            "slug": "regional_geography_japan",
            "name": "Regional Geography of Japan: Archipelago Tectonics & Tokaido Industrial Megalopolis",
            "parentId": world_geo_domain_id,
            "description": "Island geography (Honshu, Hokkaido, Kyushu, Shikoku), tectonic volcanism, Ring of Fire seismicity, Kanto Plain, Tokaido Megalopolis manufacturing belts, and marine fishing grounds.",
            "entities": ["Japanese Archipelago (4 Main Islands)", "Mount Fuji & Japanese Alps", "Kanto Plain", "Tokaido Megalopolis (Keihin, Hanshin, Chukyo)", "Kuroshio & Oyashio Fisheries", "Ring of Fire Seismicity"],
            "examTags": COMMON_TAGS
        },
        {
            "id": f"{world_geo_domain_id}.regional_geography_south_asia",
            "slug": "regional_geography_south_asia",
            "name": "Regional Geography of South Asia: Subcontinent Relief, Drainage & Climate Vulnerability",
            "parentId": world_geo_domain_id,
            "description": "Physiography of South Asian subcontinent (Himalayas, Hindu Kush, Indo-Gangetic-Brahmaputra plain, Thar Desert), monsoon climate dynamics, transboundary river treaties, and climate vulnerability.",
            "entities": ["Himalayan-Hindu Kush Barrier", "Indus & Ganga-Brahmaputra Basins", "Thar Desert & Chagai Hills", "South Asian Monsoon", "Transboundary River Treaties", "Bay of Bengal Cyclone Vulnerability"],
            "examTags": COMMON_TAGS
        },
        {
            "id": f"{world_geo_domain_id}.regional_geography_south_east_asia",
            "slug": "regional_geography_south_east_asia",
            "name": "Regional Geography of South-East Asia: Mainland River Systems & Insular Archipelagos",
            "parentId": world_geo_domain_id,
            "description": "Mainland Indochina rivers (Mekong, Irrawaddy, Chao Phraya, Red River), maritime archipelagos (Indonesia, Philippines, Malaysia), volcanic arcs, Sunda Shelf, and tropical agricultural/mineral resources.",
            "entities": ["Mekong River Basin", "Tonle Sap Lake", "Indonesian Archipelago (Java, Sumatra, Borneo)", "Sunda Shelf & Sahul Shelf", "Pacific Ring of Fire Volcanism", "Palm Oil & Rubber Belts"],
            "examTags": COMMON_TAGS
        },
        {
            "id": f"{world_geo_domain_id}.regional_geography_new_zealand",
            "slug": "regional_geography_new_zealand",
            "name": "Regional Geography of New Zealand: Southern Alps, Volcanic Zones & Pastoral Economy",
            "parentId": world_geo_domain_id,
            "description": "North and South Islands separated by Cook Strait; Southern Alps and fiordlands; Taupo Volcanic Zone and geothermal features; Canterbury Plains; temperate maritime climate and dairy/pastoral economy.",
            "entities": ["Cook Strait", "Southern Alps & Mount Cook (Aoraki)", "Taupo Volcanic Zone & Rotorua", "Canterbury Plains", "Fiordland (Milford Sound)", "Fonterra & Dairy Pastoral Economy"],
            "examTags": COMMON_TAGS
        },
        {
            "id": f"{world_geo_domain_id}.regional_geography_europe_africa_americas_oceania_antarctica",
            "slug": "regional_geography_europe_africa_americas_oceania_antarctica",
            "name": "Continental Geography: Europe, Africa, South America, Australia & Antarctica",
            "parentId": world_geo_domain_id,
            "description": "Continental physical features, river basins, plateaus, and biomes: Europe (North European Plain, Rhine, Danube, Alps); Africa (Rift Valley, Nile, Congo, Sahara); South America (Andes, Amazon, Pampas, Atacama); Australia (Great Dividing Range, Murray-Darling, Great Barrier Reef); Antarctica (ice sheet, Transantarctic Mountains).",
            "entities": ["East African Rift Valley", "Amazon Basin & Andes Mountains", "Rhine & Danube River Systems", "Great Dividing Range & Outback", "Antarctic Ice Sheet & Vinson Massif", "Pampas, Selvas & Llanos Biomes"],
            "examTags": COMMON_TAGS
        }
    ]

    for top in new_topics:
        t_id = top["id"]
        parent_id = top["parentId"]
        parent_node = nodes.get(parent_id)
        if not parent_node:
            print(f"ERROR: Parent {parent_id} not found for topic {t_id}")
            continue

        ancestor_ids = list(parent_node.get("ancestorIds", [])) + [parent_id]
        raw_tag_str = make_raw_tag_str(top["examTags"])
        keywords = generate_keywords(top["name"], top["description"], top["entities"])

        nodes[t_id] = {
            "id": t_id,
            "slug": top["slug"],
            "name": top["name"],
            "level": 3,
            "levelName": "Topic",
            "subject": SUBJECT_NAME,
            "subjectId": SUBJECT_ID,
            "parentId": parent_id,
            "childrenIds": [],
            "ancestorIds": ancestor_ids,
            "examTags": top["examTags"],
            "rawExamTagString": raw_tag_str,
            "description": top["description"],
            "entities": top["entities"],
            "keywords": keywords
        }
        if t_id not in parent_node.get("childrenIds", []):
            parent_node["childrenIds"].append(t_id)

    # =========================================================================
    # D. DEFINE GRANULAR LEVEL-4 SUBTOPICS
    # =========================================================================
    subtopics = [
        # ---------------------------------------------------------------------
        # 1. INDIAN PHYSICAL GEOGRAPHY
        # ---------------------------------------------------------------------
        # Topic 1.1: Physiographic Divisions of India
        {
            "slug": "himalayan_mountain_system_divisions_passes",
            "name": "Himalayan Mountain System: Ranges, Passes & Structural Faults",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india",
            "description": "Morphotectonic divisions: Trans-Himalayas (Karakoram with K2/Godwin-Austen, Ladakh, Zanskar), Greater Himalayas / Himadri (average elevation 6,000m, Mt. Everest, Kanchenjunga, Nanda Devi), Lesser Himalayas / Himachal (Pir Panjal, Dhauladhar, Nag Tibba, Mahabharat range; famous hill stations & Duns/Duars), Shiwaliks / Outer Himalayas (youngest sedimentary fold range with hogback topography), and Purvanchal / Eastern Hills (Patkai Bum, Naga Hills, Manipur Hills, Mizo/Lushai Hills); Longitudinal divisions: Punjab/Kashmir, Kumaon, Nepal, and Assam Himalayas; Strategic mountain passes: Zoji La, Banihal, Rohtang, Shipki La, Lipulekh, Nathu La, Jelep La, Bomdi La; Structural boundary thrusts: Main Central Thrust (MCT), Main Boundary Thrust (MBT), and Himalayan Frontal Thrust (HFT).",
            "entities": ["Himadri (Greater Himalayas)", "Himachal (Lesser Himalayas)", "Shiwalik Outer Range", "Purvanchal Hills", "Karakoram & Zanskar Ranges", "Zoji La, Shipki La & Nathu La Passes", "Main Central Thrust (MCT) & MBT"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "northern_great_plains_morphology",
            "name": "Northern Great Plains: Bhabar, Tarai, Bhangar & Khadar Morphology",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india",
            "description": "Geomorphological zones of the Indo-Gangetic-Brahmaputra alluvial trough: Bhabar (narrow 8-10 km piedmont pebble belt at the Shiwalik foot where streams disappear subterraneanly), Tarai (marshy, damp, heavily forested zone of stream re-emergence with high water table), Bhangar (older, elevated alluvium lying above flood levels containing Kankar calcareous nodules), and Khadar / Bet (newer, fertile, annually replenished silt deposits in river floodplains); Regional plain divisions: Rajasthan Plains, Punjab-Haryana Plains, Upper, Middle, and Lower Ganga Plains, and Brahmaputra Valley; Riverine islands such as Majuli on the Brahmaputra (world's largest inhabited river island).",
            "entities": ["Bhabar Pebble Belt", "Tarai Marshy Zone", "Bhangar Older Alluvium & Kankar", "Khadar Floodplain Silt", "Indo-Gangetic Alluvial Trough", "Majuli River Island"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "peninsular_plateau_hills_western_eastern_ghats",
            "name": "Peninsular Plateau: Central Highlands, Deccan & Western-Eastern Ghats",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india",
            "description": "Ancient Gondwana crystalline plateau: Central Highlands: Aravalli Range (relict fold mountain, Guru Shikhar 1,722m), Malwa Plateau, Bundelkhand, Baghelkhand, and Chota Nagpur Plateau ('Ruhr of India' rich in minerals); Deccan Plateau: Deccan Traps (basaltic lava plateau in Maharashtra), Karnataka/Mysore Plateau (divided into Malnad hill tracts and Maidan rolling plains), and Telangana Plateau; Satpura Range (horst mountain, Dhupgarh peak) and Vindhyan Range; Western Ghats / Sahyadri (continuous escarpment, UNESCO World Heritage site, Anamudi 2,695m highest peak in South India, Doddabetta in Nilgiris, Thal Ghat, Bhor Ghat, Palghat Gap); Eastern Ghats (discontinuous, eroded residual hills dissected by east-flowing rivers, Arma Konda / Jindhagada peak, Shevaroy, Javadi Hills).",
            "entities": ["Chota Nagpur Plateau", "Aravalli Range & Guru Shikhar", "Deccan Traps Basalt", "Western Ghats / Sahyadri & Anamudi", "Eastern Ghats Discontinuous Arc", "Nilgiri Hills & Doddabetta", "Palghat Gap"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "coastal_plains_and_island_territories_of_india",
            "name": "Coastal Plains & Island Territories: Arabian Sea & Bay of Bengal",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india",
            "description": "Comparative morphology: West Coastal Plain (submerged narrow coastal strip, indented coastline with natural ports, lagoons/Kayals like Vembanad in Kerala, divided into Kathiawar, Konkan, Kannada, and Malabar coasts) vs East Coastal Plain (emergent broad coastal strip, massive river deltas of Mahanadi, Godavari, Krishna, Cauvery, lagoons like Chilika and Pulicat, divided into Utkal, Northern Circars, and Coromandel Coast); Island Territories: Andaman & Nicobar Islands in Bay of Bengal (submerged peaks of Arakan Yoma fold belt, volcanic Barren Island and Narcondam, Ten Degree Channel separating Andaman from Nicobar, Duncan Passage, Great Nicobar biosphere reserve, Indira Point southernmost tip); Lakshadweep Islands in Arabian Sea (coral atoll archipelago, Minicoy island separated by Nine Degree Channel, Eight Degree Channel separating Minicoy from Maldives).",
            "entities": ["West Coastal Plain & Malabar Kayals", "East Coastal Plain & Coromandel Coast", "Andaman & Nicobar Islands", "Barren Island Active Volcano", "Ten Degree Channel", "Lakshadweep Coral Atolls", "Nine Degree Channel"],
            "examTags": COMMON_TAGS
        },

        # Topic 1.2: Drainage Systems of India
        {
            "slug": "himalayan_river_systems_indus_ganga_brahmaputra",
            "name": "Himalayan Drainage: Indus, Ganga & Brahmaputra Basins",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.drainage_systems_of_india",
            "description": "Antecedent, perennial, snow-fed drainage: Indus River System (origin near Bokhar Chu glacier near Lake Mansarovar; 5 Punjab tributaries: Jhelum originating at Verinag, Chenab formed by Chandra and Bhaga, Ravi, Beas, Sutlej cutting through Shipki La; Right bank tributaries: Shyok, Gilgit, Hunza, Kabul; Indus Waters Treaty 1960); Ganga River System (Panch Prayag headwaters: Vishnuprayag / Alaknanda-Dhauliganga, Nandaprayag / Nandakini, Karnaprayag / Pindar, Rudraprayag / Mandakini, Devprayag / Bhagirathi-Alaknanda confluence forming Ganga; Left-bank tributaries: Ramganga, Gomti, Ghaghara, Gandak, Kosi 'Sorrow of Bihar'; Right-bank tributaries: Yamuna originating at Yamunotri with Chambal, Betwa, Ken, and Son from Amarkantak; deltaic bifurcation into Hugli and Padma); Brahmaputra River System (origin at Chemayungdung glacier as Yarlung Tsangpo in Tibet, carved Namcha Barwa syntaxis into Arunachal Pradesh as Siang/Dihang; joined by Dibang and Lohit; major tributaries: Subansiri, Kameng, Manas, Sankosh, Teesta; merges with Padma and Meghna into Bay of Bengal).",
            "entities": ["Indus Basin & 5 Punjab Rivers", "Indus Waters Treaty 1960", "Panch Prayag (Devprayag Confluence)", "Ganga Basin Tributaries", "Yamuna, Chambal & Son Rivers", "Brahmaputra / Tsangpo Basin", "Teesta & Subansiri Tributaries"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "peninsular_river_systems_east_and_west_flowing",
            "name": "Peninsular Drainage: East-Flowing Deltas & West-Flowing Rift Valleys",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.drainage_systems_of_india",
            "description": "Superimposed, mature, rain-fed peninsular drainage: Major East-Flowing Rivers (drain into Bay of Bengal forming arcuate/bird-foot deltas): Godavari / Dakshin Ganga (longest peninsular river 1,465 km, origin at Trimbakeshwar in Nasik, tributaries: Pravara, Manjira, Penganga, Wainganga, Wardha, Indravati, Sabari); Krishna River (origin at Mahabaleshwar, tributaries: Koyna, Ghataprabha, Malaprabha, Bhima, Tungabhadra); Cauvery / Kaveri (origin at Talakaveri in Brahmagiri hills, perennial character due to SW and NE monsoon rains, tributaries: Harangi, Hemavati, Shimsha, Arkavathi, Kabini, Bhavani, Noyyal, Amaravati; Shivanasamudra & Hogenakkal falls); Mahanadi (origin in Dandakaranya Chhattisgarh, Hirakud Dam, delta in Odisha); Major West-Flowing Rivers (drain into Arabian Sea through estuaries without deltas): Narmada (origin at Amarkantak, flows through tectonic rift valley between Vindhya and Satpura, Dhuandhar falls in marble rocks, Sardar Sarovar Dam); Tapi / Tapti (origin at Multai in Betul, flows through rift valley south of Satpura, Ukai Dam); Sabarmati and Mahi (cuts across Tropic of Cancer twice); Short coastal rivers: Mandovi & Zuari in Goa, Sharavathi (Jog / Gersoppa Falls), Netravathi in Karnataka, Periyar and Bharatapuzha in Kerala.",
            "entities": ["Godavari / Dakshin Ganga Basin", "Krishna River & Tungabhadra", "Cauvery / Kaveri Basin & Tributaries", "Mahanadi River & Hirakud Dam", "Narmada Rift Valley & Dhuandhar", "Tapi River Estuary", "Sharavathi (Jog Falls) & Periyar"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "river_interlinking_water_disputes_watershed",
            "name": "Inter-State River Water Disputes, Interlinking & Watershed Management",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.drainage_systems_of_india",
            "description": "Water governance, federal hydrological conflicts, and basin management: National River Linking Project (NRLP by NWDA: 14 Himalayan and 16 Peninsular links; Ken-Betwa Link Project connecting MP and UP; Par-Tapi-Narmada link, Godavari-Cauvery link); Inter-State River Water Disputes Act 1956 (Article 262 constitutional bar on Supreme Court jurisdiction; Cauvery Water Disputes Tribunal, Krishna Water Disputes Tribunal, Mahadayi Water Disputes Tribunal, Vansadhara tribunal); Integrated Watershed Management Programme (IWMP under PMKSY - Watershed Development component), Neeranchal National Watershed Project, check dams, and ridge-to-valley conservation approach.",
            "entities": ["National River Linking Project (NRLP)", "Ken-Betwa River Link", "Inter-State River Water Disputes Act (Article 262)", "Cauvery & Krishna Disputes Tribunals", "Mahadayi River Dispute", "Integrated Watershed Management (PMKSY)"],
            "examTags": COMMON_TAGS
        },

        # Topic 1.3: Indian Monsoon Climate Dynamics
        {
            "slug": "southwest_and_northeast_monsoon_progression",
            "name": "Monsoon Mechanism: ITCZ Migration, Arabian Sea & Bay of Bengal Branches",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.indian_monsoon_climate_dynamics",
            "description": "Dynamic mechanism of Indian monsoon: Thermal vs Dynamic theories (Halley's differential heating vs Flohn's seasonal migration of Inter-Tropical Convergence Zone / ITCZ / Monsoon Trough); Onset of Southwest Monsoon (typically June 1 over Kerala coast); Dual branches: Arabian Sea Branch (strikes Western Ghats causing heavy orographic precipitation, moves across Mumbai, Gujarat, and merges with Bengal branch in Punjab) vs Bay of Bengal Branch (strikes Arakan Yoma and Meghalaya hills causing world-record rainfall at Mawsynram and Cherrapunji due to funneling effect, deflects westwards along Indo-Gangetic trough); Monsoon 'Breaks' (shifts of monsoon trough to Himalayan foothills causing plains dry spells and mountain flash floods); Retreating / Northeast Monsoon (October-November withdrawal, retreating cyclones striking Coromandel coast, winter rainfall over Tamil Nadu).",
            "entities": ["ITCZ / Monsoon Trough Migration", "Onset of Southwest Monsoon (June 1)", "Arabian Sea Monsoon Branch", "Bay of Bengal Branch & Funneling Effect", "Mawsynram Rainfall Record", "Retreating / Northeast Monsoon (Tamil Nadu Rains)"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "upper_air_jet_streams_and_teleconnections_monsoon",
            "name": "Jet Streams & Global Teleconnections: TEJS, STWJ, ENSO, IOD & MJO",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.indian_monsoon_climate_dynamics",
            "description": "Upper tropospheric steering engines and global teleconnections: Subtropical Westerly Jet Stream (STWJ: presence south of Himalayas in winter, sudden northward bifurcation/withdrawal beyond Tibetan Plateau triggering sudden summer monsoon burst); Tropical Easterly Jet Stream (TEJS: dynamic outflow generated by intense summer heating of Tibetan Plateau anticyclone); Somali / Findlater Low-Level Jet (cross-equatorial low-level flow driving moisture towards peninsular coast); Mascarene High (subtropical high-pressure cell near Madagascar acting as primary monsoon pump); Global teleconnections: El Niño-Southern Oscillation (ENSO: El Niño warming in eastern Pacific suppressing Indian monsoon vs La Niña enhancing rains), Indian Ocean Dipole (positive IOD warming western Indian Ocean aiding monsoon vs negative IOD causing deficit), and Madden-Julian Oscillation (MJO: eastward propagating pulse of cloudiness and convective rainfall).",
            "entities": ["Subtropical Westerly Jet Stream (STWJ)", "Tropical Easterly Jet Stream (TEJS)", "Tibetan Plateau Thermal Engine", "Somali / Findlater Jet & Mascarene High", "ENSO Teleconnection to Indian Monsoon", "Indian Ocean Dipole (Positive/Negative IOD)", "Madden-Julian Oscillation (MJO)"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "western_disturbances_and_extreme_weather_events",
            "name": "Western Disturbances, Pre-Monsoon Showers & Extreme Weather Events",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.indian_monsoon_climate_dynamics",
            "description": "Winter precipitation and localized convective weather systems: Western Disturbances (shallow extra-tropical cyclonic depressions originating over Mediterranean Sea and Caspian Sea, steered into northwest India by subtropical westerly jet stream; vital winter precipitation for Rabi crops, especially wheat, and snowfall in Western Himalayas; causes cold waves and dense fog); Pre-monsoon convective thunderstorms: Mango Showers (Kerala and coastal Karnataka aiding mango ripening), Blossom Showers / Cherry Blossom (coffee-growing regions of Karnataka), Nor'westers / Kalbaisakhi (severe localized evening thunderstorms with gale winds in West Bengal and Assam / Bardoli Chheerha vital for tea and jute), and Loo (intense, dry, scorching summer winds across northern plains causing severe heatwaves).",
            "entities": ["Western Disturbances (Mediterranean Origin)", "Rabi Crop Rainfall & Himalayan Snowfall", "Mango Showers & Blossom Showers", "Nor'westers / Kalbaisakhi (Bengal)", "Bardoli Chheerha (Assam)", "Loo Heatwaves & Northern Plains Fog"],
            "examTags": COMMON_TAGS
        },

        # Topic 1.4: Soils & Natural Vegetation of India
        {
            "slug": "major_soil_types_of_india_and_land_degradation",
            "name": "Major Soil Groups of India: ICAR Classification & Land Degradation",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india",
            "description": "ICAR 8 major soil orders and distribution: Alluvial Soils (most extensive ~40% area, rich in potash and lime, deficient in nitrogen and phosphorus, divided into Khadar and Bhangar); Black / Regur Soils (formed by weathering of Deccan basaltic lava, high montmorillonite clay content, self-ploughing, high moisture retention, ideal for cotton); Red and Yellow Soils (formed on ancient crystalline Archean granites, ferric oxides impart red color, hydrated form appears yellow, widespread in Tamil Nadu, Odisha, Chota Nagpur); Laterite Soils (formed under high temperature and alternate wet-dry seasons by intense leaching of silica, rich in iron and aluminium oxides, bauxite/cashew/tea/coffee); Arid & Desert Soils (sandy, saline, deficient in moisture/humus); Saline & Alkaline Soils (Usar/Reh/Kallar, high capillary evaporation, Punjab/Haryana canal tracts); Peaty and Marshy Soils (Kari soils in Kerala, high organic matter); Soil erosion and land degradation: Sheet, rill, and gully erosion (Chambal badlands/ravines), desertification, wind erosion in Thar, and soil conservation schemes (Soil Health Card Scheme).",
            "entities": ["Alluvial Soils (Khadar & Bhangar)", "Black / Regur Soil (Montmorillonite Clay)", "Red & Yellow Soils (Ferric Oxides)", "Laterite Soil & Intense Leaching", "Arid & Saline Soils (Usar / Reh)", "Gully Erosion & Chambal Ravines", "Soil Health Card Scheme"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "natural_vegetation_and_forest_types_of_india",
            "name": "Natural Vegetation & Forest Types of India (Champion & Seth)",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india",
            "description": "Ecological classification based on rainfall, altitude, and temperature (Champion and Seth system): Tropical Wet Evergreen Forests (rainfall >250 cm, Western Ghats, NE India, multi-layered canopy, rosewood, mahogany, ebony); Tropical Semi-Evergreen Forests; Tropical Moist Deciduous Forests (most widespread forest type in India, rainfall 100-200 cm, teak, sal, shisham, sandalwood, mahua); Tropical Dry Deciduous Forests (rainfall 70-100 cm, transition to open woodland, tendu, palas, amaltas, bel); Tropical Thorn Forests (rainfall <70 cm, arid/semi-arid, xerophytic acacias, euphorbias, date palms); Montane Subtropical and Temperate Forests (broadleaf evergreen oaks/chestnuts, coniferous pines/deodar/spruce, Sholas of Nilgiris and Annamalai); Alpine Forests and Tundra (silver fir, junipers, rhododendrons); Littoral & Swamp / Mangrove Forests (halophytic vegetation, pneumatophores / breathing roots, stilt roots, Sundarbans Sundari trees Heritiera fomes, Godavari-Krishna deltas, Pichavaram).",
            "entities": ["Tropical Wet Evergreen Forests", "Tropical Moist Deciduous (Teak & Sal)", "Tropical Dry Deciduous (Tendu & Palas)", "Montane Temperate Shola Forests", "Coniferous Deodar & Pine Forests", "Littoral & Swamp Mangroves", "Sundarbans & Pichavaram Mangroves"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "india_state_of_forest_report_isfr_and_conservation",
            "name": "Forest Conservation, ISFR Dynamics & Policy Frameworks",
            "parentId": f"{SUBJECT_ID}.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india",
            "description": "Biennial assessment and statutory conservation architecture: India State of Forest Report (ISFR published biennially by Forest Survey of India / FSI; parameters: Forest Cover categorized into Very Dense Forest >70% canopy, Moderately Dense Forest 40-70%, and Open Forest 10-40%; Tree Cover outside recorded forests; Mangrove cover trends; Forest fire vulnerability mapping; Growing stock and carbon stock assessments); Legal categorization: Reserved Forests (highest protection under Indian Forest Act 1927), Protected Forests, and Village Forests; Conservation frameworks: Compensatory Afforestation Fund Management and Planning Authority (CAMPA Act 2016), National Mission for a Green India (GIM), Joint Forest Management (JFM), and social forestry programs.",
            "entities": ["India State of Forest Report (ISFR / FSI)", "Very Dense vs Moderately Dense Forest Cover", "Tree Cover Outside Forests (TOF)", "Carbon Stock Assessments", "Reserved & Protected Forests (IFA 1927)", "CAMPA Act 2016", "Green India Mission (GIM)"],
            "examTags": COMMON_TAGS
        },

        # ---------------------------------------------------------------------
        # 2. HUMAN GEOGRAPHY & POPULATION SETTLEMENTS
        # ---------------------------------------------------------------------
        # Topic 2.1: Global & Indian Demographic Trends
        {
            "slug": "demographic_attributes_and_population_dynamics",
            "name": "Demographic Attributes: Vital Rates, Fertility & Demographic Dividend",
            "parentId": f"{SUBJECT_ID}.human_geography_population_settlements.global_indian_demographic_trends",
            "description": "Core demographic metrics and population structures: Vital rates: Crude Birth Rate (CBR), Crude Death Rate (CDR), Natural Growth Rate; Total Fertility Rate (TFR: national replacement level of 2.1, regional divergence between northern states like Bihar/UP and southern states like Kerala/Tamil Nadu); Mortality indicators: Infant Mortality Rate (IMR), Under-5 Mortality Rate, Maternal Mortality Ratio (MMR); Population pyramids and age structures (expansive, constrictive, stationary); Dependency Ratio (youth vs elderly dependency); Demographic Dividend (working-age cohort 15-59 years, opportunity window and human capital constraints); Sex Ratio (national trends, Child Sex Ratio 0-6 years, regional imbalances, Beti Bachao Beti Padhao initiative).",
            "entities": ["Total Fertility Rate (TFR & 2.1 Replacement)", "Crude Birth & Death Rates", "Infant Mortality Rate (IMR)", "Maternal Mortality Ratio (MMR)", "Demographic Dividend (15-59 Cohort)", "Child Sex Ratio Dynamics", "Population Age Pyramids"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "theories_of_population_and_demographic_transition",
            "name": "Theories of Population Growth: Malthus, Marx & Demographic Transition",
            "parentId": f"{SUBJECT_ID}.human_geography_population_settlements.global_indian_demographic_trends",
            "description": "Classical and modern population doctrines: Malthusian Theory of Population (Essay on the Principle of Population 1798: food production grows arithmetically 1, 2, 3, 4 while population grows geometrically 1, 2, 4, 8; Malthusian catastrophe; Preventive checks vs Positive checks like famine/pestilence/war); Marxist critique of Malthus (poverty as a result of capitalist distribution, not biological overpopulation); Demographic Transition Model (DTM: 5 stages: Stage 1 High Stationary / high birth & death, Stage 2 Early Expanding / death rate falls while birth rate remains high causing population explosion, Stage 3 Late Expanding / birth rate begins declining, Stage 4 Low Stationary / low birth & death, Stage 5 Declining / sub-replacement fertility; India positioned in Stage 3 late expanding transition).",
            "entities": ["Malthusian Theory of Population", "Arithmetic vs Geometric Growth", "Preventive & Positive Checks", "Demographic Transition Model (5 Stages)", "Stage 2 Population Explosion", "India Stage 3 Transition"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "migration_patterns_determinants_and_consequences",
            "name": "Migration Dynamics: Streams, Push-Pull Determinants & Socio-Economic Impact",
            "parentId": f"{SUBJECT_ID}.human_geography_population_settlements.global_indian_demographic_trends",
            "description": "Spatial mobility of populations: Internal migration streams in India (rural-to-rural predominantly female marriage migration, rural-to-urban predominantly male economic migration, urban-to-urban, and urban-to-rural counter-urbanization); Migration theories: Ravenstein's Laws of Migration, Everett Lee's Push and Pull Factors (push: agrarian distress, lack of employment, floods/droughts; pull: higher wages, industrial jobs, educational infrastructure); Inter-state vs intra-state migration corridors (UP/Bihar to Maharashtra, Gujarat, Delhi, Punjab); Socio-economic consequences: Remittance economies (domestic and international remittances from Gulf), feminization of agriculture in source areas, pressure on urban civic infrastructure and growth of informal settlements, brain drain vs brain gain.",
            "entities": ["Rural-to-Rural & Rural-to-Urban Migration", "Push-Pull Factors (Everett Lee)", "Inter-State Migration Corridors", "Remittance Economy & Agrarian Impact", "Feminization of Agriculture", "Urban Infrastructure Strain"],
            "examTags": COMMON_TAGS
        },

        # Topic 2.2: Human Settlements & Urban Systems
        {
            "slug": "rural_settlement_morphology_and_classification",
            "name": "Rural Settlement Morphology: Spatial Types & Vernacular Architecture",
            "parentId": f"{SUBJECT_ID}.human_geography_population_settlements.human_settlements_urban_systems",
            "description": "Geographical morphology of rural dwellings: Physical, cultural, and historical determinants of settlement patterns (water points/wet point settlements, defensibility, fertile soil); Four standard morphological types: Clustered / Compact / Nucleated settlements (closely built houses, common in fertile alluvial plains of Ganga and valley tracts), Semi-clustered / Fragmented settlements (segregation or grouping of specific castes/clans on the periphery, Gujarat plains, Rajasthan), Hamleted settlements (physically separated units bearing local names like Panna, Para, Palli, Nagla, Dhani across Middle Ganga plain and lower Himalayas), and Dispersed / Isolated settlements (isolated farmsteads or huts scattered over hills, Western Ghats, Meghalaya, Himachal Pradesh); Vernacular building materials adapted to local micro-climates (adobe, thatch, stone masonry, bamboo).",
            "entities": ["Clustered / Nucleated Settlements", "Semi-Clustered Morphology", "Hamleted Settlements (Panna / Para / Palli)", "Dispersed / Isolated Mountain Huts", "Wet Point Settlement Determinants", "Vernacular Architecture"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "urbanization_processes_hierarchy_and_functional_towns",
            "name": "Urbanization Processes: Census Criteria, Hierarchy & Functional Towns",
            "parentId": f"{SUBJECT_ID}.human_geography_population_settlements.human_settlements_urban_systems",
            "description": "Criteria, taxonomy, and distribution of urban centres: Census of India definition of Urban: Statutory Towns (all places with a municipality, corporation, cantonment board, or notified town area committee) vs Census Towns (places satisfying three criteria: minimum population of 5,000, at least 75% of male working population engaged in non-agricultural pursuits, and a density of at least 400 persons/sq km); Urban hierarchy: Class I towns (>100,000 population), Metropolitan cities / Million-plus cities, and Megacities (>10 million population); Conurbations and Urban Agglomerations (UAs); Ashok Mitra's functional classification of Indian cities: Administrative/capital towns, Industrial/manufacturing cities, Mining towns, Garrison/cantonment towns, Commercial/trading ports, and Religious/cultural/educational centers.",
            "entities": ["Statutory Towns vs Census Towns", "Census 3-Fold Urban Criteria", "Metropolitan & Megacity Classifications", "Urban Agglomerations (UAs)", "Ashok Mitra Functional Classification", "Conurbations & Urban Hierarchy"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "urban_morphology_land_use_models_and_challenges",
            "name": "Urban Morphology: Spatial Models, Slums & Sustainable City Missions",
            "parentId": f"{SUBJECT_ID}.human_geography_population_settlements.human_settlements_urban_systems",
            "description": "Internal spatial structure and contemporary challenges of cities: Classical urban land-use models: Concentric Zone Model (Ernest Burgess - Central Business District / CBD, zone of transition, commuter zone), Sector Model (Homer Hoyt - transport corridors and radial sectors), and Multiple Nuclei Model (Chauncy Harris & Edward Ullman - polycentric urban growth); Mark Jefferson's Primate City concept and Zipf's Rank-Size Rule; Critical urban challenges: Proliferation of informal settlements/slums (Dharavi in Mumbai), urban sprawling, Urban Heat Island (UHI) effect, urban flooding due to encroachment of wetlands, acute water stress (Day Zero crises), municipal solid waste management, air quality crises; National urban missions: Smart Cities Mission, AMRUT (Atal Mission for Rejuvenation and Urban Transformation), Pradhan Mantri Awas Yojana - Urban (PMAY-U), and Swachh Bharat Mission - Urban.",
            "entities": ["Concentric Zone Model (Burgess)", "Sector Model (Hoyt)", "Multiple Nuclei Model (Harris & Ullman)", "Primate City & Rank-Size Rule", "Urban Heat Island (UHI) Effect", "Informal Settlements & Slums (Dharavi)", "Smart Cities Mission & AMRUT"],
            "examTags": COMMON_TAGS
        },

        # Topic 2.3: Tribal Demographics & Cultural Anthropology (NEW)
        {
            "slug": "tribal_demographics_and_spatial_distribution_india",
            "name": "Tribal Demographics: Geographic Belts, Major Tribes & Linguistic Families",
            "parentId": f"{SUBJECT_ID}.human_geography_population_settlements.tribal_demographics_and_cultural_anthropology",
            "description": "Geographical distribution, demographic attributes, and ethnographic profiles: Constitutional status (Scheduled Tribes under Article 342, comprising 8.6% of India's population as per Census 2011; state distributions: Madhya Pradesh highest ST population, Lakshadweep and Mizoram highest percentage share, absence in Punjab/Haryana); Major geographic belts: Central Tribal Belt (over 55% of tribal population: Gonds, Bhils, Santhals, Oraon, Munda, Ho across MP, Chhattisgarh, Jharkhand, Odisha, Rajasthan), North-Eastern Tribal Belt (Nagas, Mizos, Khasis, Garos, Bodos, Apatanis), Western Ghats & Southern Hills (Toda of Nilgiris pastoralists, Irula snake-catchers, Kadar, Kurumba), and Himalayan / Sub-Himalayan Belt (Gaddis, Gujjars, Bakarwals transhumant pastoralists, Bhotias); Linguistic classifications: Austro-Asiatic (Mundari, Santhali, Khasi), Tibeto-Burman (NE tribes), Dravidian (Gondi, Kurukh, Toda), and Indo-Aryan (Bhil).",
            "entities": ["Scheduled Tribes (Article 342 & 8.6% Share)", "Central Tribal Belt (Gonds, Bhils, Santhals)", "North-Eastern Tribes (Nagas, Khasis, Garos)", "Transhumant Pastoralists (Gaddis & Bakarwals)", "Nilgiri Tribes (Toda & Irula)", "Austro-Asiatic & Tibeto-Burman Languages"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "particularly_vulnerable_tribal_groups_pvtgs_and_rights",
            "name": "Particularly Vulnerable Tribal Groups (PVTGs) & Statutory Rights",
            "parentId": f"{SUBJECT_ID}.human_geography_population_settlements.tribal_demographics_and_cultural_anthropology",
            "description": "Ethnographic vulnerability criteria, statutory safeguards, and affirmative policies: Particularly Vulnerable Tribal Groups (PVTGs: created based on Dhebar Commission recommendations 1973; 75 identified groups across 18 states and UT of Andaman & Nicobar Islands; Odisha has highest number 13 PVTGs); Fourfold identification criteria: Pre-agricultural level of technology (hunting-gathering/shifting cultivation), stagnant or declining population, extremely low literacy, and subsistence level of economy; Iconic PVTG communities: Great Andamanese, Sentinelese (uncontacted hunter-gatherers of North Sentinel Island), Jarawas, Onge, Shompen of Nicobar; Birhor of Jharkhand, Chenchus of Nallamala Hills, Dongria Kondh of Niyamgiri Hills, Maria Gond; Statutory frameworks: Panchayats (Extension to Scheduled Areas) Act 1996 (PESA: Gram Sabha self-governance over minor forest produce and land acquisition), Forest Rights Act 2006 (FRA: Individual Forest Rights, Community Forest Rights, Habitat Rights for PVTGs), and PM-JANMAN scheme (Pradhan Mantri Janjati Adivasi Nyaya Maha Abhiyan).",
            "entities": ["75 Identified PVTGs (Dhebar Commission)", "Andamanese, Sentinelese, Jarawas & Onge", "Dongria Kondh (Niyamgiri) & Chenchus", "Fourfold PVTG Identification Criteria", "PESA Act 1996 & Gram Sabha Rights", "Forest Rights Act 2006 (FRA)", "PM-JANMAN Mission"],
            "examTags": COMMON_TAGS
        },

        # ---------------------------------------------------------------------
        # 3. ECONOMIC & RESOURCE GEOGRAPHY
        # ---------------------------------------------------------------------
        # Topic 3.1: Global & Indian Distribution of Natural Resources
        {
            "slug": "metallic_and_non_metallic_mineral_belts",
            "name": "Metallic & Non-Metallic Mineral Belts: India & Global Reserves",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography.global_indian_distribution_of_natural_resources",
            "description": "Geological distribution and spatial concentrations of minerals: Iron Ore (Hematite 75% and Magnetite 25% reserves; Major Indian belts: Odisha-Jharkhand belt with Badampahar, Noamundi, Gua; Durg-Bastar-Chandrapur belt with Bailadila mechanized mines in Chhattisgarh; Bellary-Chitradurga-Chikmagalur-Tumkur belt in Karnataka with Kudremukh and Sandur hills; Goa-Ratnagiri belt; Global iron ore reserves: Pilbara region in Australia, Carajás and Minas Gerais in Brazil, Lake Superior region USA, Anshan China, Krivoy Rog Ukraine); Bauxite & Aluminium (Odisha Panchpatmali deposits largest producer, Gujarat Jamnagar, Jharkhand Lohardaga, MP Amarkantak plateau; Global: Weipa Australia, Guinea Boké, Jamaica); Copper Ore (Malanjkhand in Balaghat MP, Khetri copper belt in Rajasthan, Singhbhum Jharkhand; Global: Atacama Chuquicamata Chile largest open-pit, DRC-Zambia Copperbelt); Manganese (Balaghat MP, Nagpur-Bhandara Maharashtra, Keonjhar Odisha; Global: South Africa Kalahari basin, Gabon); Chromite (Sukinda valley in Jajpur Odisha 90% reserves); Non-metallic minerals: Mica (Koderma in Jharkhand 'Mica capital', Nellore in Andhra Pradesh, Bhilwara Rajasthan), Limestone (cement raw material in MP, Rajasthan, Andhra Pradesh), and Gypsum.",
            "entities": ["Hematite & Magnetite Belts", "Bailadila & Kudremukh Iron Mines", "Pilbara (Australia) & Carajás (Brazil)", "Bauxite (Panchpatmali Odisha)", "Khetri & Malanjkhand Copper Belts", "Chuquicamata Copper (Chile)", "Mica & Sukinda Valley Chromite"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "energy_resources_fossil_fuels_nuclear_renewables",
            "name": "Energy Resources: Coal, Hydrocarbons, Critical Minerals & Renewables",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography.global_indian_distribution_of_natural_resources",
            "description": "Spatial mapping of conventional and non-conventional energy resources: Coal (Gondwana coal ~250 million years old, non-coking/bituminous, 98% Indian reserves located in river valleys: Damodar valley with Jharia oldest/richest coalfield and Raniganj, Son valley with Singrauli, Mahanadi valley with Talcher, Wardha-Godavari valley; Tertiary coal ~15-60 million years old, high sulphur/moisture, Makum in Assam, lignite brown coal at Neyveli Tamil Nadu; Global: Appalachian basin USA, Ruhr Germany, Shanxi China, Newcastle Australia); Petroleum & Natural Gas (Onshore: Brahmaputra valley Digboi oldest oilfield, Naharkatiya, Moran-Hugrijan; Gujarat basin Ankleshwar, Kalol, Cambay; Rajasthan Barmer basin Mangala, Bhagyam, Aishwarya; Offshore: Mumbai High on continental shelf, Bassein gas field, Krishna-Godavari deepwater basin KG-D6; Strategic Petroleum Reserves: Padur, Mangalore, Visakhapatnam, Chandikhol); Nuclear Energy & Critical Minerals (Uranium: Jaduguda and Narwapahar in Singhbhum Jharkhand, Tummalapalle in Andhra Pradesh largest reserve in carbonate rock; Thorium: Monazite beach sands of Kerala Chavara and Odisha; Critical Minerals & Rare Earth Elements: Lithium discovery in Reasi J&K and Mandya Karnataka); Renewable Energy Geography (Solar parks: Bhadla Rajasthan largest, Pavagada Karnataka, Kurnool; Wind energy corridors: Muppandal wind farm in Tamil Nadu, Jaisalmer, coastal Gujarat; Green Hydrogen mission hubs).",
            "entities": ["Gondwana Coal Basins (Jharia & Raniganj)", "Tertiary Lignite (Neyveli)", "Offshore Mumbai High & KG-D6 Gas Basin", "Strategic Petroleum Reserves (SPR)", "Uranium (Jaduguda & Tummalapalle)", "Monazite Thorium Beach Sands", "Solar Parks (Bhadla & Pavagada)", "Muppandal Wind Energy Corridor"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "water_resources_multipurpose_dams_and_irrigation",
            "name": "Water Resources: Multipurpose River Valley Projects & Irrigation Networks",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography.global_indian_distribution_of_natural_resources",
            "description": "Surface and groundwater endowments and hydraulic infrastructure: Surface water resources (12 major river basins; utilizable surface flow constraints); Major Multipurpose River Valley Projects ('Temples of Modern India'): Bhakra-Nangal Project on Sutlej (Gobind Sagar reservoir), Hirakud Dam on Mahanadi (longest earthen dam), Tehri Dam on Bhagirathi (highest dam), Sardar Sarovar Dam on Narmada, Damodar Valley Corporation (DVC model of US Tennessee Valley Authority: Tilaiya, Maithon, Panchet, Konar), Nagarjuna Sagar and Srisailam on Krishna; Irrigation systems: Canal irrigation (dominant in northern alluvial plains: Indira Gandhi Canal / Rajasthan Canal bringing Sutlej-Beas waters to Thar desert, Western Yamuna Canal), Tubewell and well irrigation (over 60% irrigated area, leading to groundwater overdraft, dark blocks in Punjab, Haryana, Western UP), and Tank irrigation (traditional method in rocky, undulating Peninsular India, Eri tanks in Tamil Nadu); Micro-irrigation infrastructure (drip and sprinkler systems under Pradhan Mantri Krishi Sinchayee Yojana - Per Drop More Crop).",
            "entities": ["Multipurpose River Valley Projects", "Bhakra Nangal & Tehri Dams", "Hirakud & Sardar Sarovar Dams", "Damodar Valley Corporation (DVC)", "Indira Gandhi Canal (Rajasthan)", "Tubewell vs Traditional Tank Irrigation", "PMKSY (Per Drop More Crop)"],
            "examTags": COMMON_TAGS
        },

        # Topic 3.2: Location Factors of Industries
        {
            "slug": "industrial_location_theories_and_weberian_model",
            "name": "Industrial Location Theories: Weberian Least Cost & Locational Factors",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries",
            "description": "Theoretical models and economic geography of industrial siting: Alfred Weber's Theory of Industrial Location / Least Cost Theory (Material Index = weight of localized raw material / weight of finished product; Gross / Weight-losing raw materials MI > 1 pulling industry to raw material source; Pure raw materials MI = 1 locating anywhere; Ubiquitous raw materials like air/water pulling towards market; Concept of Isotims lines of equal transport cost and Isodapanes lines of equal total transport costs, Critical Isodapane; Labour orientation and agglomeration economies); August Lösch's Profit Maximization Theory and Walter Christaller's Central Place Theory; Primary locational factors: Raw material proximity, energy/power availability, skilled/unskilled labour, transport networks, capital access, government industrial zoning, environmental clearances, and port proximity for export-oriented manufacturing.",
            "entities": ["Alfred Weber Least Cost Theory", "Material Index (Weight-Losing vs Pure)", "Isotims & Isodapanes (Critical Isodapane)", "Agglomeration Economies", "August Lösch Profit Maximization", "Primary Industrial Locational Factors"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "heavy_metallurgical_and_engineering_industries",
            "name": "Heavy Metallurgical & Engineering Clusters: Iron, Steel & Automobile",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries",
            "description": "Locational dynamics of heavy resource-based industries: Iron & Steel Industry (weight-losing industry requiring iron ore, coking coal, limestone, dolomite, manganese; Historical locational shifts: Coalfields orientation to Iron ore fields orientation, and modern shift towards coastal locations for cheap seaborne coking coal imports and exports); Major Indian steel plants: TISCO Jamshedpur (pioneer private sector, confluence of Subarnarekha and Kharkai), IISCO Burnpur, Public sector SAIL plants: Bhilai (Chhattisgarh, Russian collaboration, Bailadila/Dalli-Rajhara ore), Rourkela (Odisha, German collaboration), Durgapur (West Bengal, British collaboration), Bokaro (Jharkhand), Visakhapatnam Steel Plant / RINL (India's first shore-based integrated steel plant), Salem Steel Plant in Tamil Nadu, and JSW Vijayanagar in Karnataka; Global steel belts: Rust Belt in USA (Pittsburgh 'Steel City'), Ruhr Valley in Germany, Anshan-Benxi and Wuhan in China; Automobile Industry (agglomeration economies, supply chain hubs: Delhi-NCR Gurgaon-Manesar, Chennai 'Detroit of Asia', Pune-Chakan-Pimpri belt, Sanand in Gujarat).",
            "entities": ["Iron & Steel Locational Shifts", "TISCO Jamshedpur & Bokaro Steel", "SAIL Plants (Bhilai, Rourkela, Durgapur)", "Visakhapatnam Shore-Based Steel Plant", "American Rust Belt & German Ruhr Valley", "Automobile Hubs (Chennai, Pune, Gurgaon)"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "textile_chemical_and_agro_processing_industries",
            "name": "Textile, Chemical & Agro-Processing Industries: Cotton, Sugar & Jute",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries",
            "description": "Locational shifts and clustering of consumer and agro-based industries: Cotton Textile Industry (pure raw material, historically located in Mumbai and Ahmedabad due to humid maritime climate preventing yarn breakage, port facilities, and black soil hinterland; subsequent spatial decentralization to handloom/powerloom hubs in Coimbatore 'Manchester of South India', Tirupur knitwear capital, Surat synthetic textiles, Ludhiana woolen knitwear); Jute Industry (highly localized in Hooghly river basin West Bengal due to proximity to raw jute cultivation in Ganga-Brahmaputra delta, abundant fresh water for retting, cheap labour from Bihar/Odisha, and Kolkata port); Sugar Industry (weight-losing, perishable raw material crushed within 24 hours of harvest; major locational shift from Northern India UP/Bihar to Southern and Western India Maharashtra/Karnataka/Tamil Nadu driven by tropical maritime climate, longer crushing season, higher sucrose content in cane, and thriving cooperative sugar mill structure); Chemical and Petrochemical complexes (concentrated near refineries and ports: Jamnagar refinery complex, Dahej PCPIR in Gujarat, Nagothane in Maharashtra).",
            "entities": ["Cotton Textile (Mumbai to Coimbatore & Tirupur)", "Jute Retting & Hooghly River Basin", "Sugar Industry Shift (North to Maharashtra)", "Tropical vs Subtropical Cane Sucrose Content", "Petrochemical Hubs (Jamnagar & Dahej PCPIR)", "Agro-Processing Cooperatives"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "knowledge_based_high_tech_and_footloose_industries",
            "name": "Footloose, Knowledge-Based & High-Tech IT Corridors",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries",
            "description": "Post-industrial economic geography and service clustering: Footloose Industries (industries with no specific raw material or market weight bias, negligible transport costs relative to value, highly dependent on component interchangeability, precision engineering, electronics assembly); Information Technology (IT) and Software Services (agglomeration driven by human capital, educational ecosystems, telecommunications infrastructure, venture capital, and airport connectivity; Major Indian IT corridors: Bengaluru 'Silicon Valley of India', Hyderabad 'Cyberabad', Pune Hinjawadi, Chennai OMR corridor, Delhi-NCR Gurgaon/Noida; Global tech clusters: Silicon Valley California, Route 128 Boston, Shenzhen hardware capital); Global Capability Centers (GCCs), semiconductor fabrication geography, and biotechnology hubs (Genome Valley Hyderabad).",
            "entities": ["Footloose Industry Concept", "IT Corridors (Bengaluru, Hyderabad, Pune)", "Silicon Valley & Global Tech Hubs", "Semiconductor Fabrication Geography", "Global Capability Centers (GCCs)", "Biotechnology Parks (Genome Valley)"],
            "examTags": COMMON_TAGS
        },

        # Topic 3.3: Agricultural Geography & Food Security (NEW)
        {
            "slug": "cropping_patterns_major_food_commercial_crops_india",
            "name": "Cropping Patterns & Geographic Belts of Food & Commercial Crops",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography.agricultural_geography_and_food_security",
            "description": "Geographical distribution, climatic thresholds, and agrarian zoning of major crops: Major cropping seasons: Kharif (monsoon sowings June-July: Rice, Maize, Jowar, Bajra, Cotton, Jute, Groundnut), Rabi (winter sowings October-November: Wheat, Barley, Gram, Mustard), and Zaid (summer inter-cropping: watermelons, cucumbers, vegetables); Food grain geography: Rice (staple crop requiring >100 cm rainfall, high temperature >25 deg C, alluvial clayey soils; West Bengal, UP, Punjab, coastal deltas), Wheat (temperate crop requiring cool growing season 10-15 deg C, bright sunshine at harvest, 50-75 cm rainfall, well-drained loams; Punjab, Haryana, UP, MP), Millets / Nutri-Cereals (hardy, drought-resistant C4 crops: Jowar in Maharashtra/Karnataka, Bajra in Rajasthan, Ragi in Karnataka); Pulses (leguminous nitrogen-fixing crops, MP, Rajasthan, Maharashtra); Commercial crops: Sugarcane (tropical/subtropical, 100-150 cm rainfall; UP, Maharashtra, Karnataka), Cotton (black regur soil, 210 frost-free days, Gujarat, Maharashtra, Telangana), Jute (golden fiber, warm humid deltaic climate; West Bengal, Assam, Bihar), Tea (plantation crop requiring acidic highland slopes, 150-250 cm rainfall, shade trees; Assam Brahmaputra valley, Darjeeling, Nilgiris), Coffee (plantation crop requiring well-drained volcanic/humus soils, 150-200 cm rain; Karnataka 70% national output with Arabica and Robusta in Kodagu/Chikkamagaluru, Wayanad Kerala).",
            "entities": ["Kharif, Rabi & Zaid Seasons", "Rice & Wheat Agro-Climatic Requirements", "Millets / Nutri-Cereals (Jowar, Bajra, Ragi)", "Cotton Belt (Black Regur Soil & 210 Frost-Free Days)", "Sugarcane Production Belts", "Tea (Assam & Darjeeling) & Coffee (Karnataka)", "Pulses & Nitrogen Fixation"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "agricultural_revolutions_land_reforms_food_security",
            "name": "Agricultural Revolutions, Land Reforms & Food Security Architecture",
            "parentId": f"{SUBJECT_ID}.economic_resource_geography.agricultural_geography_and_food_security",
            "description": "Technological transformations, institutional reforms, and food management: Agricultural revolutions: Green Revolution (launched in mid-1960s with High Yielding Variety / HYV semi-dwarf seeds developed by Norman Borlaug & M.S. Swaminathan, intensive chemical fertilizers, canal/tubewell irrigation; initial focus on wheat and rice in Punjab, Haryana, and Western UP; ecological fallouts: groundwater depletion, soil salinization, nitrate pollution, regional disparities; Rainbow Revolution concept), White Revolution / Operation Flood (Dr. Verghese Kurien, National Dairy Development Board, Anand cooperative model AMUL, dairy self-sufficiency), Blue Revolution (fisheries and aquaculture), Yellow Revolution (oilseeds), Silver Revolution (poultry); Institutional Land Reforms: Abolition of intermediaries (Zamindari abolition), tenancy reforms (security of tenure, fair rent), land ceiling acts and redistribution of surplus land, consolidation of fragmented land holdings; Food security architecture: Minimum Support Price (MSP recommended by CACP based on A2+FL/C2 cost metrics), Food Corporation of India (FCI buffer stocking), Public Distribution System (Targeted PDS / One Nation One Ration Card), and National Food Security Act 2013 (NFSA: legal entitlement covering 75% rural and 50% urban population, Antyodaya Anna Yojana).",
            "entities": ["Green Revolution (Swaminathan & Borlaug)", "HYV Seeds & Ecological Side Effects", "White Revolution / Operation Flood (AMUL)", "Blue, Yellow & Rainbow Revolutions", "Land Reforms (Zamindari Abolition & Ceilings)", "MSP & Commission for Agricultural Costs and Prices (CACP)", "Public Distribution System (PDS) & NFSA 2013"],
            "examTags": COMMON_TAGS
        },

        # ---------------------------------------------------------------------
        # 4. GEOGRAPHY OF THE WORLD (NEW DOMAIN)
        # ---------------------------------------------------------------------
        # Topic 4.1: Regional Geography of United States
        {
            "slug": "us_physical_relief_drainage_and_climate",
            "name": "United States: Physiographic Provinces, River Basins & Great Lakes",
            "parentId": f"{world_geo_domain_id}.regional_geography_united_states",
            "description": "Major morphological provinces of the continental United States: Atlantic & Gulf Coastal Plains (broad lowlands, barrier islands, Everglades subtropical wetland); Appalachian Highlands (ancient, folded and eroded mountains: Blue Ridge, Great Valley, Allegheny and Cumberland Plateaus); Interior Plains / Great Plains (vast semi-arid grassland plateau stretching from the 100th meridian west to the Rocky Mountains, drained by Missouri and Arkansas rivers); Rocky Mountains (young fold cordillera, Continental Divide / Great Divide separating Pacific and Atlantic drainages, Mt. Elbert 4,401m); Intermontane Plateaus (Colorado Plateau with Grand Canyon carved by Colorado River, Columbia-Snake basalt plateau, Great Basin region of endorheic inland drainage including Great Salt Lake and Death Valley - lowest point in North America -86m); Pacific Mountain System (Cascade Range with volcanic peaks Mt. Rainier and Mt. St. Helens, Sierra Nevada fault-block range with Mt. Whitney, Central Valley of California, and San Andreas transform fault zone); Major drainage networks: Mississippi-Missouri river system (longest river network in North America, bird-foot delta on Gulf of Mexico), Ohio River, Colorado River (Hoover Dam & Lake Mead), Columbia River (Grand Coulee Dam), Rio Grande (international border with Mexico); Great Lakes System (Superior largest freshwater lake, Michigan entirely within US, Huron, Erie, Ontario, interconnected by St. Mary's River, Detroit River, and Niagara Falls with Welland Canal).",
            "entities": ["Appalachian Highlands", "Great Plains & 100th Meridian", "Rocky Mountains & Continental Divide", "Colorado Plateau & Grand Canyon", "Great Basin & Death Valley (-86m)", "Mississippi-Missouri Drainage System", "Great Lakes (Superior, Michigan, Huron, Erie, Ontario)", "San Andreas Fault Zone"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "us_economic_agricultural_and_industrial_belts",
            "name": "United States: Agricultural Belts, Manufacturing Belts & Tech Complexes",
            "parentId": f"{world_geo_domain_id}.regional_geography_united_states",
            "description": "Spatial specialization of American agricultural and industrial economies: Agricultural Belts: Corn Belt (Midwest states: Iowa, Illinois, Indiana, Nebraska; rich Mollisol soils, feed grains and livestock fattening), Wheat Belt (divided into Spring Wheat Belt in North Dakota/Montana and Winter Wheat Belt in Kansas/Oklahoma), Dairy Belt (northern states around Great Lakes: Wisconsin, Minnesota, New York), Cotton Belt (historical South, now diversified into poultry and soybeans), Fruit and Vegetable Belts (California Central Valley Mediterranean irrigation farming, Florida citrus); Industrial complexes: American Manufacturing Belt / Rust Belt (historical industrial heartland from New England through Pittsburgh, Cleveland, Detroit to Chicago; Pittsburgh iron and steel hub, Detroit automotive capital, Chicago meatpacking and transport crossroads; deindustrialization and restructuring); Modern Sun Belt and High-Tech growth corridors: Silicon Valley in California (San Jose, Palo Alto, Cupertino - global epicenter of software, venture capital, and semiconductors), Texas Silicon Hills (Austin tech cluster) and Gulf Coast Petrochemical Belt (Houston oil refining and aerospace), Pacific Northwest (Seattle aerospace Boeing and software Microsoft/Amazon), Research Triangle in North Carolina (Raleigh-Durham-Chapel Hill).",
            "entities": ["Corn Belt (Midwest Mollisols)", "Wheat Belt (Spring & Winter Wheat)", "Dairy Belt (Wisconsin & Great Lakes)", "American Manufacturing Belt (Rust Belt)", "Silicon Valley (San Jose & Bay Area)", "Texas Silicon Hills (Austin) & Houston Petrochemicals", "Pacific Northwest (Seattle Tech & Aerospace)"],
            "examTags": COMMON_TAGS
        },

        # Topic 4.2: Regional Geography of Canada
        {
            "slug": "canadian_shield_drainage_and_arctic_tundra",
            "name": "Canada: Canadian Shield, Glacial Drainage & Arctic Tundra",
            "parentId": f"{world_geo_domain_id}.regional_geography_canada",
            "description": "Physical architecture and northern environments of Canada: Canadian Shield / Laurentian Plateau (vast U-shaped region of exposed pre-Cambrian crystalline igneous and metamorphic rocks covering over half of Canada, heavily scoured by Pleistocene continental ice sheets; thousands of glacial lakes: Great Bear Lake, Great Slave Lake deepest in North America, Lake Athabasca, Reindeer Lake, Lake Winnipeg); St. Lawrence Lowlands and River (vital commercial waterway linking Great Lakes to the Atlantic Ocean via the St. Lawrence Seaway); Appalachian Region of the Maritime Provinces (Nova Scotia, New Brunswick, Newfoundland); Western Canadian Cordillera (Canadian Rockies, Coast Mountains, Mount Logan 5,959m highest peak in Canada located in Yukon); Arctic Archipelago and Tundra biome (permafrost, muskeg bogs, pingos, Beaufort Sea, Northwest Passage maritime route through high-latitude ice).",
            "entities": ["Canadian Shield (Laurentian Plateau)", "Glacial Lakes (Great Bear & Great Slave Lakes)", "St. Lawrence Seaway Maritime Corridor", "Canadian Cordillera & Mount Logan", "Arctic Archipelago & Permafrost Tundra", "Northwest Passage Arctic Route"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "canadian_prairies_resources_and_economy",
            "name": "Canada: Prairie Grain Belts, Tar Sands & Mineral Resources",
            "parentId": f"{world_geo_domain_id}.regional_geography_canada",
            "description": "Economic geography, agricultural production, and resource distribution of Canada: Prairie Provinces (Alberta, Saskatchewan, Manitoba: vast expanse of fertile Chernozem / black soils; leading global producer and exporter of spring wheat, canola, barley; Winnipeg known as the 'Gateway to the West' and grain exchange capital); Mineral and energy resources: Athabasca Oil Sands in northern Alberta (world's third-largest proven petroleum reserves in the form of bitumen); Conventional oil and natural gas in Western Canada Sedimentary Basin; Nickel and copper deposits at Sudbury Basin in Ontario (formed by ancient meteorite impact); Uranium deposits in Athabasca Basin (Saskatchewan leading global exporter); Potash reserves in Saskatchewan (world's largest producer and exporter for fertilizers); Diamond mines in Northwest Territories; Forestry and paper pulp industry across the extensive Boreal Taiga forest belt; Hydroelectric power generation (James Bay Project in Quebec, Churchill Falls in Labrador).",
            "entities": ["Canadian Prairies (Alberta, Saskatchewan, Manitoba)", "Chernozem Soils & Spring Wheat Export", "Athabasca Oil Sands (Bitumen Deposits)", "Sudbury Nickel Basin (Meteorite Impact)", "Saskatchewan Potash & Uranium Reserves", "Boreal Forest Paper Pulp & James Bay Hydro"],
            "examTags": COMMON_TAGS
        },

        # Topic 4.3: Regional Geography of Russia & Central Asia
        {
            "slug": "russia_physical_divisions_siberia_and_drainage",
            "name": "Russia: Physical Divides, Siberian Drainage & Lake Baikal",
            "parentId": f"{world_geo_domain_id}.regional_geography_russia_central_asia",
            "description": "Continental physiography of the Russian Federation across 11 time zones: European Russia: East European / Russian Plain (undulating lowlands, Valdai Hills source of major rivers, Moscow basin); Ural Mountains (ancient north-south trending Hercynian fold mountain chain serving as the traditional geographic boundary between Europe and Asia); Asian Russia / Siberia: West Siberian Plain (world's largest continuous flat alluvial plain, drained by the Ob-Irtysh system, characterized by extensive peat bogs and swamps like Vasyugan Swamp), Central Siberian Plateau (elevated plateau between Yenisey and Lena rivers underlain by Siberian Traps volcanic basalt), and East Siberian Highlands (Verkhoyansk and Chersky ranges, Oymyakon pole of cold in northern hemisphere); Kamchatka Peninsula (active volcanism on Pacific Ring of Fire, Klyuchevskaya Sopka); Major river networks draining north into the Arctic Ocean: Ob River (with Irtysh), Yenisey River, and Lena River; Volga River (longest river in Europe 3,530 km, 'Mother Volga', draining into landlocked Caspian Sea); Lake Baikal in southern Siberia (world's oldest and deepest freshwater lake 1,642m, holds 20% of Earth's unfrozen surface freshwater, UNESCO site).",
            "entities": ["Ural Mountains (Europe-Asia Divide)", "East European Plain & Volga River", "West Siberian Plain & Vasyugan Swamps", "Central Siberian Plateau & Siberian Traps", "North-Draining Siberian Rivers (Ob, Yenisey, Lena)", "Lake Baikal (Deepest Freshwater Lake 1,642m)", "Kamchatka Volcanic Peninsula & Oymyakon"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "central_asian_steppes_and_resource_geography",
            "name": "Central Asia: Steppes, Tian Shan-Pamirs & Caspian Energy Basins",
            "parentId": f"{world_geo_domain_id}.regional_geography_russia_central_asia",
            "description": "Geographical and resource profile of the five Central Asian republics (Kazakhstan, Uzbekistan, Turkmenistan, Kyrgyzstan, Tajikistan): Physical relief: Kazakh Steppe (vast open grassland extending across northern Kazakhstan); Tian Shan and Pamir mountain ranges ('Roof of the World', Ismail Samani peak, Fedchenko Glacier); Deserts: Kyzylkum Desert (Uzbekistan and Kazakhstan) and Karakum Desert (Turkmenistan); Drainage and environmental tragedy: Amu Darya and Syr Darya rivers originating in glaciers and historically feeding the Aral Sea (now largely desiccated due to Soviet cotton irrigation diversions); Fergana Valley (densely populated, fertile agricultural heartland shared across complex enclaves of Uzbekistan, Kyrgyzstan, and Tajikistan); Mineral and energy wealth: Caspian Sea Basin hydrocarbons (Tengiz, Kashagan, and Karachaganak fields in Kazakhstan, Galkynysh giant gas field in Turkmenistan); Uranium reserves of Kazakhstan (world's leading producer ~43% global output); Cotton agriculture and Baikonur Cosmodrome.",
            "entities": ["Kazakh Steppe & Aral Sea Desiccation", "Pamir Knot & Tian Shan Ranges", "Amu Darya & Syr Darya Rivers", "Fergana Valley Agricultural Oasis", "Kaspian Hydrocarbon Basins (Tengiz & Kashagan)", "Turkmenistan Galkynysh Gas Field", "Kazakhstan Uranium Reserves"],
            "examTags": COMMON_TAGS
        },

        # Topic 4.4: Regional Geography of China & East Asia
        {
            "slug": "china_physical_relief_drainage_and_basins",
            "name": "China: Three Topographic Steps, Major River Basins & Deserts",
            "parentId": f"{world_geo_domain_id}.regional_geography_china_east_asia",
            "description": "Three-step topographical staircase of China descending from west to east: Step 1: Qinghai-Tibet Plateau ('Roof of the World', average elevation >4,500m, source of Asia's major rivers / 'Water Tower of Asia', bounded by Himalayas, Kunlun, and Qilian mountains); Step 2: Intermediate plateaus and basins (elevation 1,000-2,000m: Tarim Basin with hyper-arid Taklamakan Desert and Lop Nur nuclear test site, Junggar Basin, Inner Mongolian Plateau, Loess Plateau with thick wind-blown silt deposits, and Sichuan Red Basin / fertile purple-earth basin); Step 3: Low-lying coastal plains and hills (elevation <500m: Northeast / Manchurian Plain, North China Plain, Middle-Lower Yangtze Plain); Major River Systems: Yangtze River / Chang Jiang (longest river in Asia 6,300 km, Three Gorges Dam, flows through Sichuan basin and Shanghai delta), Yellow River / Huang He (second longest 5,464 km, carries world's highest sediment load from Loess Plateau, historically prone to catastrophic floods / 'China's Sorrow', delta on Bohai Sea), Xi Jiang / Pearl River (southern commercial artery), and Heilongjiang / Amur River (border with Russia).",
            "entities": ["Three-Step Topographical Staircase", "Qinghai-Tibet Plateau ('Water Tower of Asia')", "Tarim Basin & Taklamakan Desert", "Loess Plateau Silt Deposits", "Sichuan Red Basin (Purple Earth)", "Yangtze River (Chang Jiang) & Three Gorges Dam", "Yellow River (Huang He) & Bohai Delta"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "china_economic_geography_and_industrial_regions",
            "name": "China: Agricultural Zones, Coastal SEZs & Rare Earth Belts",
            "parentId": f"{world_geo_domain_id}.regional_geography_china_east_asia",
            "description": "Agrarian divisions, rapid coastal industrialization, and resource clusters of China: Agricultural geography: Qinling Mountains-Huai River line dividing China into two distinct agricultural zones: Northern Dry Farming Zone (wheat, corn, millets, soybeans in North China and Manchurian Plains) vs Southern Wet Paddy Rice Zone (double-cropped paddy rice, tea, freshwater aquaculture in Yangtze basin and South China); Special Economic Zones (SEZs) and industrial clusters: Pearl River Delta / Greater Bay Area (Shenzhen, Guangzhou, Dongguan, Hong Kong - world's hardware and electronics manufacturing hub), Yangtze River Delta (Shanghai, Suzhou, Hangzhou, Ningbo - finance, high-tech, automotive, chemicals), and Bohai Bay Economic Rim (Beijing, Tianjin, Hebei / Jing-Jin-Ji cluster); Energy and mineral centers: Coal belts of Shanxi and Inner Mongolia, Daqing oilfield in Heilongjiang, and Bayan Obo mine in Inner Mongolia (world's largest deposit of Rare Earth Elements / REEs).",
            "entities": ["Qinling-Huai River Line (Wheat vs Rice Divide)", "Pearl River Delta SEZ (Greater Bay Area)", "Yangtze River Delta Industrial Belt", "Bohai Economic Rim (Jing-Jin-Ji)", "Shanxi Coalfields & Daqing Oilfield", "Bayan Obo Rare Earth Elements (REEs)"],
            "examTags": COMMON_TAGS
        },

        # Topic 4.5: Regional Geography of Japan
        {
            "slug": "japan_archipelago_physiography_and_volcanism",
            "name": "Japan: Archipelago Physiography, Ring of Fire & Tectonic Hazards",
            "parentId": f"{world_geo_domain_id}.regional_geography_japan",
            "description": "Insular physical geography and tectonic dynamics of the Japanese archipelago: Four main islands stretching in an arc from northeast to southwest: Hokkaido (northernmost, cold temperate climate, Sapporo plain), Honshu (largest and most populous island, containing Tokyo, Kyoto, Osaka, and the high Japanese Alps / Hida, Kiso, and Akaishi ranges), Shikoku (smallest main island, citrus and maritime farming), and Kyushu (southernmost, subtropical climate, active volcanism); Tectonic setting: Located at the complex convergence zone of four tectonic plates (Pacific, Philippine Sea, Eurasian, and North American / Okhotsk plates); Pacific Ring of Fire volcanism: Over 100 active volcanoes including Mount Fuji (composite stratovolcano, 3,776m highest peak in Japan, dormant since 1707); High seismic vulnerability: Frequent megathrust earthquakes and devastating tsunamis (Great Kanto Earthquake 1923, Great Hanshin-Awake Earthquake 1995, 2011 Tohoku megathrust earthquake and tsunami triggering Fukushima Daiichi disaster); Limited flat land: Over 73% mountainous terrain, confining urban populations to narrow coastal alluvial plains such as Kanto Plain (largest plain in Honshu surrounding Tokyo), Nobi Plain (Nagoya), and Kansai Plain (Osaka-Kobe).",
            "entities": ["Four Main Japanese Islands (Honshu, Hokkaido, Kyushu, Shikoku)", "Japanese Alps (Hida, Kiso, Akaishi)", "Mount Fuji (3,776m Composite Volcano)", "Four-Plate Tectonic Convergence", "2011 Tohoku Earthquake & Megathrust Tsunami", "Kanto Plain & Tokyo Alluvial Basin", "Ring of Fire Active Volcanism"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "japan_economic_geography_and_industrial_belts",
            "name": "Japan: Tokaido Megalopolis, Manufacturing Prowess & Fisheries",
            "parentId": f"{world_geo_domain_id}.regional_geography_japan",
            "description": "Industrial structure, export-led manufacturing, and marine economic geography of Japan: Resource scarcity: Acute deficiency in indigenous fossil fuels (imports 99% petroleum and coal) and metallic ores, compelling the development of highly efficient port-based import-refine-export industrial models; Pacific Coast Industrial Belt / Tokaido Megalopolis (continuous urban-industrial corridor along the southern Pacific coast of Honshu home to over 60% of Japan's population and industrial output): Keihin Industrial Region (Tokyo-Yokohama-Kawasaki: precision machinery, electronics, publishing, optics), Chukyo Industrial Region (Nagoya-Toyota City: world's leading automotive manufacturing hub / Toyota headquarters, aviation, ceramics), Hanshin Industrial Region (Osaka-Kobe-Kyoto: heavy steel, shipbuilding, chemicals, electronics), and Kitakyushu-Setouchi Region (northern Kyushu and Inland Sea: heavy metallurgy, chemicals, semiconductors); Marine economy: One of the world's premier fishing and aquaculture nations, greatly favored by the convergence of the warm northward-flowing Kuroshio Current and cold nutrient-rich southward-flowing Oyashio Current in the northwest Pacific, generating exceptionally fertile pelagic fishing grounds.",
            "entities": ["Tokaido Megalopolis Industrial Corridor", "Keihin Region (Tokyo-Yokohama Precision Engineering)", "Chukyo Region (Nagoya & Toyota City Automotive)", "Hanshin Region (Osaka-Kobe Metallurgy)", "Import-Dependent Port-Based Manufacturing", "Kuroshio-Oyashio Convergence Marine Fisheries"],
            "examTags": COMMON_TAGS
        },

        # Topic 4.6: Regional Geography of South Asia
        {
            "slug": "south_asian_subcontinent_physiography_and_drainage",
            "name": "South Asia: Subcontinental Morphology, Drainage Networks & Deserts",
            "parentId": f"{world_geo_domain_id}.regional_geography_south_asia",
            "description": "Unified geomorphic and hydrological entity of the South Asian realm: Terrestrial borders and countries: Bounded by the towering Himalayas in the north, Karakoram and Hindu Kush in the northwest, Arakan Yoma in the east, and the vast expanse of the Indian Ocean in the south; Comprises 8 nations: India, Pakistan, Bangladesh, Nepal, Bhutan, Sri Lanka, Maldives, and Afghanistan; Major physiographic divisions: Himalayan mountain wall, Indo-Gangetic-Brahmaputra alluvial plains, Thar / Great Indian Desert (extending into Sindh and Punjab as Cholistan), Balochistan Plateau (arid intermontane basins and Chagai Hills), Potwar Plateau and Salt Range in Pakistan; Major drainage networks: Indus River Basin (draining northwest into Arabian Sea via Kotri delta), Ganga-Brahmaputra-Meghna Basin (draining southeast into Bay of Bengal through the world's largest delta / Sundarbans mangrove swamp); Island nations: Sri Lanka (Central Highlands with Mount Pidurutalagala, Mahaweli Ganga river, Jaffna peninsula connected via Elephant Pass) and Maldives (low-lying coral atoll chain with 26 natural atolls resting on the Chagos-Laccadive submarine ridge).",
            "entities": ["Himalayan-Hindu Kush Mountain Arc", "Indo-Gangetic-Brahmaputra Alluvial Realm", "Thar Desert & Cholistan Dunes", "Potwar Plateau & Salt Range", "Ganga-Brahmaputra-Meghna Sundarbans Delta", "Sri Lanka Central Highlands & Mahaweli Ganga", "Maldives Coral Atoll Chain"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "south_asian_climate_agriculture_and_resources",
            "name": "South Asia: Monsoon Agriculture, Water Treaties & Natural Disasters",
            "parentId": f"{world_geo_domain_id}.regional_geography_south_asia",
            "description": "Climatic rhythms, agrarian dependencies, transboundary hydrology, and disaster vulnerabilities across South Asia: Climatic dominance: Governed by the seasonal reversal of the South Asian Monsoon system, ranging from super-humid rainforest environments in Bangladesh and Western Ghats to hyper-arid conditions in Balochistan and Thar; Agricultural specialization: Jute and wet rice cultivation in the fertile floodplains of Bangladesh, intensive wheat and cotton farming in the irrigated Indus basin of Pakistani Punjab and Sindh, tea plantations on the highland slopes of Sri Lanka (Ceylon tea) and Nepal; Transboundary water governance: Indus Waters Treaty 1960 between India and Pakistan (allocating eastern rivers Ravi, Beas, Sutlej to India and western rivers Indus, Jhelum, Chenab to Pakistan), Ganga Water Sharing Treaty 1996 between India and Bangladesh (Farakka Barrage water allocations); Severe environmental vulnerabilities: Glacial Lake Outburst Floods (GLOFs) in Nepal and Bhutan, seismic hazards along the Himalayan collision boundary (2015 Gorkha Nepal earthquake), catastrophic tropical cyclones striking the shallow Bay of Bengal coast (Bangladesh and Odisha), and existential sea level rise threats confronting the low-lying Maldives and Bengal delta.",
            "entities": ["South Asian Monsoon Agricultural Rhythm", "Indus Waters Treaty 1960 (India-Pakistan)", "Ganga Water Sharing Treaty (Farakka Barrage)", "Ceylon Tea & Bengal Jute Agriculture", "Glacial Lake Outburst Floods (GLOFs)", "Himalayan Seismicity & 2015 Nepal Earthquake", "Bay of Bengal Tropical Cyclones & Maldives Sea Rise"],
            "examTags": COMMON_TAGS
        },

        # Topic 4.7: Regional Geography of South-East Asia
        {
            "slug": "mainland_indochina_physiography_and_rivers",
            "name": "Mainland Southeast Asia: Indochina River Basins & Deltas",
            "parentId": f"{world_geo_domain_id}.regional_geography_south_east_asia",
            "description": "Geographical profile of mainland Indochina: Five sovereign nations: Myanmar (Burma), Thailand, Laos (only landlocked country in SE Asia), Cambodia, and Vietnam; Morphological structure: North-to-south trending parallel mountain ranges (Arakan Yoma, Shan Plateau, Bilauktaung Range, and Annamite Range / Cordillera separating Vietnam from Laos) alternating with deep river valleys and broad alluvial floodplains; Major southward-flowing river systems: Mekong River (longest in SE Asia 4,350 km, 'Lancang' in Tibet, flows through 6 countries forming borders between Laos, Myanmar, and Thailand, crossing Cambodia and discharging through a vast 9-mouthed delta in southern Vietnam), Irrawaddy River (vital commercial lifeline of Myanmar flowing into Andaman Sea via vast delta) and its tributary Chindwin, Salween River (draining deep gorges across Shan Plateau), Chao Phraya River (Thailand's sacred river, irrigating the fertile central plain rice bowl before flowing through Bangkok into Gulf of Thailand), and Red River / Song Hong (northern Vietnam draining into Gulf of Tonkin); Tonle Sap Lake in Cambodia (largest freshwater lake in SE Asia, unique hydrological feature with seasonal flow reversal from Mekong during summer monsoon expansion).",
            "entities": ["Mekong River Basin & Nine-Mouthed Delta", "Irrawaddy & Salween Rivers (Myanmar)", "Chao Phraya River & Bangkok Plain", "Red River Delta (Vietnam)", "Tonle Sap Lake (Seasonal Flow Reversal)", "Annamite Range & Shan Plateau", "Laos Landlocked Geography"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "insular_southeast_asia_archipelago_and_resources",
            "name": "Maritime Southeast Asia: Archipelagos, Ring of Fire & Resources",
            "parentId": f"{world_geo_domain_id}.regional_geography_south_east_asia",
            "description": "Insular physical and economic geography of maritime Southeast Asia: Sovereign archipelago nations: Indonesia (world's largest island country with >17,000 islands: Sumatra, Java - world's most populous island with extremely fertile volcanic soils, Kalimantan / Indonesian Borneo, Sulawesi / Celebes, Maluku Spice Islands, and Western New Guinea / Papua), Philippines (over 7,100 islands: Luzon in north, Mindanao in south, Visayas in center), Malaysia (Peninsular Malaysia and East Malaysia / Sabah and Sarawak on northern Borneo), Singapore (island city-state at southern tip of Malay Peninsula), Brunei, and Timor-Leste; Tectonic framework: Sunda Shelf (continental extension linking mainland to Sumatra, Java, and Borneo) and Sahul Shelf (Australian continental extension); Intense Ring of Fire volcanism: Over 130 active volcanoes in Indonesia (Krakatoa / Krakatau, Mount Merapi near Yogyakarta, Mount Bromo, Mount Tambora 1815 super-eruption) and Philippines (Mount Pinatubo 1991 eruption, Mount Mayon perfect cone, Taal volcano); Economic resource wealth: Palm oil (Indonesia and Malaysia produce over 85% global supply), natural rubber, tin mining (Bangka-Belitung islands in Indonesia), petroleum and liquefied natural gas (LNG in Brunei, Natuna Sea, East Kalimantan), copper and gold (Grasberg mine in Papua - one of the world's largest open-pit gold and copper mines).",
            "entities": ["Indonesian Archipelago (>17,000 Islands)", "Java Volcanic Fertility & Sumatra", "Philippines Archipelago (Luzon & Mindanao)", "Sunda Shelf vs Sahul Shelf", "Volcanism (Krakatoa, Merapi, Tambora, Pinatubo)", "Palm Oil & Rubber Global Hegemony", "Grasberg Copper-Gold Mine (Papua)"],
            "examTags": COMMON_TAGS
        },

        # Topic 4.8: Regional Geography of New Zealand
        {
            "slug": "new_zealand_north_and_south_island_physiography",
            "name": "New Zealand: Southern Alps, Fiordland & Taupo Volcanic Zone",
            "parentId": f"{world_geo_domain_id}.regional_geography_new_zealand",
            "description": "Physiographic contrast between the two main islands separated by the narrow Cook Strait: South Island / Te Waipounamu (larger, dominated by the formidable Southern Alps fold mountain range running along the western spine for 500 km; Mount Cook / Aoraki 3,724m highest peak; extensive Alpine Fault plate boundary between Pacific and Australian plates; heavy Pleistocene and active glaciation: Tasman Glacier, Franz Josef, and Fox Glaciers; glacial lakes like Lake Wakatipu and Lake Te Anau; spectacular glacial fiords in Fiordland National Park including Milford Sound and Doubtful Sound; broad Canterbury Plains on the eastern rain-shadow side formed by coalescing glacial outwash fans); North Island / Te Ika-a-Maui (characterized by active volcanism and thermal phenomena on the Taupo Volcanic Zone: Mount Ruapehu active stratovolcano, Mount Ngauruhoe, Mount Tongariro, Mount Taranaki / Egmont isolated volcanic cone; Lake Taupo world's largest rhyolitic super-volcanic caldera lake; extensive geothermal fields, geysers, and boiling mud pools of Rotorua; rolling pastoral hill country).",
            "entities": ["Cook Strait Separation", "Southern Alps & Mount Cook (Aoraki 3,724m)", "Alpine Fault Plate Boundary", "Fiordland (Milford Sound & Doubtful Sound)", "Canterbury Plains Alluvial Fans", "Taupo Volcanic Zone & Lake Taupo Caldera", "Rotorua Geothermal Geysers & Mud Pools"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "new_zealand_climate_pastoral_economy_and_resources",
            "name": "New Zealand: Marine Climate, Pastoral Dairy Economy & Geothermal Energy",
            "parentId": f"{world_geo_domain_id}.regional_geography_new_zealand",
            "description": "Temperate climate dynamics, pastoral agriculture, energy systems, and isolated biogeography: Climate regime: Marine West Coast temperate climate (Köppen Cfb) governed by prevailing moisture-laden Westerlies; dramatic orographic rainfall contrast (over 6,000 mm rain on the western slopes of the Southern Alps vs semi-arid rain-shadow <600 mm on the eastern Canterbury Plains); Pastoral economic dominance: World's premier exporter of dairy products (Fonterra cooperative handling ~95% of NZ export milk, highly efficient year-round pasture-based dairy farming without indoor barns); Extensive sheep farming on highland tussock grasslands for coarse wool and lamb meat; Viticulture and fruit horticulture (Marlborough Sauvignon Blanc wine region, Hawke's Bay, kiwifruit production in Bay of Plenty); Energy resources: Clean renewable energy profile with over 80% electricity from renewables (hydroelectric dams on Waikato and Clutha rivers, pioneer geothermal energy harnessing at Wairakei geothermal power station); Unique island biogeography: Prolonged evolutionary isolation since breaking away from Gondwana ~80 million years ago, resulting in distinct avifauna and absence of native land mammals (flightless Kiwi bird, Kakapo, Takahe, ancient Tuatara reptile).",
            "entities": ["Marine West Coast Climate (Köppen Cfb)", "Orographic Westerlies & Canterbury Rain Shadow", "Fonterra Dairy Cooperative Export Dominance", "Pastoral Sheep Farming & Tussock Grasslands", "Marlborough Viticulture & Kiwifruit", "Wairakei Geothermal Power Station", "Isolated Biogeography (Kiwi & Tuatara)"],
            "examTags": COMMON_TAGS
        },

        # Topic 4.9: Continental Geography (Rest of World)
        {
            "slug": "europe_regional_physiography_and_river_basins",
            "name": "Europe: Morphological Belts, Rhine-Danube Basins & Alpine Arc",
            "parentId": f"{world_geo_domain_id}.regional_geography_europe_africa_americas_oceania_antarctica",
            "description": "Continental structure of Europe across four major morphological belts: 1. Western Uplands (ancient eroded Caledonian crystalline massifs: Scandinavian Highlands with glacial fjords, Scottish Highlands, Massif Central); 2. North European Plain (unbroken lowland plain stretching from southwestern France across northern Germany, Poland, and into Russia, intensive agriculture and industrial settlements); 3. Central Uplands (heavily forested Hercynian plateaus: Ardennes, Black Forest / Schwarzwald, Vosges, Bohemian Massif); 4. Alpine Mountain System (young Tertiary fold mountain arcs: Alps with Mont Blanc 4,809m, Pyrenees separating France and Spain, Apennines of Italy, Carpathians, Balkans, and Caucasus with Mount Elbrus 5,642m highest peak in Europe); Major river arteries: Rhine River (vital commercial waterway flowing from Swiss Alps through German industrial core to Rotterdam port / Europoort on North Sea), Danube River (longest river in EU 2,850 km, flowing east through 10 countries and 4 national capitals Vienna, Bratislava, Budapest, Belgrade into Black Sea delta), and Po River (northern Italian industrial and agrarian basin / Lombardy plain).",
            "entities": ["North European Plain", "Alpine Mountain Arc (Mont Blanc & Elbrus)", "Rhine River & Rotterdam Europoort", "Danube River Basin (10 Countries)", "Po River & Lombardy Plain", "Scandinavian Glacial Fjords", "Black Forest (Schwarzwald)"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "africa_regional_physiography_rift_valley_and_basins",
            "name": "Africa: Great Rift Valley, Congo Rainforest, Nile & Sahara",
            "parentId": f"{world_geo_domain_id}.regional_geography_europe_africa_americas_oceania_antarctica",
            "description": "Geomorphology and drainage of the African plateau continent: East African Great Rift Valley (continental divergent boundary stretching over 6,000 km from Jordan/Red Sea through Ethiopia, Kenya, Tanzania to Mozambique; Western and Eastern Rift branches; deep rift lakes: Lake Tanganyika world's longest freshwater lake and second deepest 1,470m, Lake Malawi / Nyasa; Lake Victoria shallow inland depression lake, Africa's largest; isolated volcanic peaks: Mount Kilimanjaro 5,895m highest peak in Africa, Mount Kenya); Vast drainage basins: Nile River (longest river on Earth 6,650 km, formed by confluence of White Nile from Lake Victoria and Blue Nile from Lake Tana in Ethiopia at Khartoum Sudan, Aswan High Dam, fertile Nile delta), Congo River Basin (world's deepest river >220m and second largest by discharge, cuts equator twice through equatorial rainforest / Selvas), and Niger River (inland delta in Mali); Deserts: Sahara Desert (largest hot desert in world, erg sand dunes, reg stony desert, hamada rock plateaus), Sahel semi-arid transition zone, Namib Desert (coastal hyper-arid desert under cold Benguela current), and Kalahari Basin (semi-desert red sand sheets); Victoria Falls on Zambezi River; Atlas Mountains in northwest and Drakensberg escarpment in south.",
            "entities": ["East African Great Rift Valley", "Mount Kilimanjaro (5,895m) & Mount Kenya", "Lake Tanganyika & Lake Victoria", "Nile River Basin & Aswan Dam", "Congo River Equatorial Basin", "Sahara Desert & Sahel Transition Zone", "Namib & Kalahari Deserts", "Victoria Falls (Zambezi River)"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "south_america_regional_physiography_and_biomes",
            "name": "South America: Andes Cordillera, Amazon Basin & Grassland Biomes",
            "parentId": f"{world_geo_domain_id}.regional_geography_europe_africa_americas_oceania_antarctica",
            "description": "Tripartite physical architecture and biomes of South America: 1. Western Cordillera / Andes Mountains (longest continental mountain range on Earth 7,000 km, formed by subduction of Nazca plate beneath South American plate; Mount Aconcagua 6,961m highest peak in the Western Hemisphere; Altiplano high-altitude plateau with Lake Titicaca world's highest navigable lake; Cotopaxi and Chimborazo volcanoes); 2. Eastern Crystalline Highlands (ancient Brazilian Shield and Guiana Highlands; Angel Falls in Venezuela highest waterfall in world 979m); 3. Central Lowland River Basins: Amazon Basin (world's largest drainage basin and highest discharge, drained by Amazon River and 1,100 tributaries, home to Amazon Rainforest / Amazonia 'lungs of the Earth' with unmatched biodiversity), Orinoco Basin, and Paraná-Paraguay-Río de la Plata system (Itaipu Dam); Distinctive biomes: Pampas (vast temperate grasslands of Argentina and Uruguay, fertile Mollisols, wheat and cattle estancias), Llanos (tropical savanna grasslands of Orinoco basin in Venezuela/Colombia), Campos and Cerrado (tropical savanna of central Brazil), Gran Chaco (dry scrub lowland), and Atacama Desert in northern Chile (driest non-polar desert on Earth created by rain-shadow of Andes and cold offshore Humboldt / Peru Current).",
            "entities": ["Andes Cordillera & Mount Aconcagua (6,961m)", "Altiplano & Lake Titicaca", "Amazon River Basin & Rainforest (Amazonia)", "Angel Falls & Guiana Highlands", "Pampas Temperate Grasslands (Argentina)", "Llanos & Cerrado Tropical Savannas", "Atacama Desert (Humboldt Current Aridity)"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "australia_oceania_and_antarctica_geography",
            "name": "Australia, Oceania & Antarctica: Great Barrier Reef & Polar Ice Cap",
            "parentId": f"{world_geo_domain_id}.regional_geography_europe_africa_americas_oceania_antarctica",
            "description": "Physiography and environmental systems of Australia, Pacific Oceania, and Antarctica: Australia: Tripartite relief: Eastern Highlands / Great Dividing Range (Mount Kosciuszko 2,228m highest peak), Central Lowlands (endorheic drainage of Lake Eyre lowest point in Australia -15m, Great Artesian Basin largest artesian groundwater aquifer in world, Murray-Darling river system), and Western Plateau / Outback (ancient eroded shield, Great Victoria and Great Sandy Deserts, Uluru / Ayers Rock inselberg); Great Barrier Reef along Queensland coast (world's largest coral reef ecosystem, UNESCO World Heritage, stretching over 2,300 km); Oceania sub-regions: Melanesia (Papua New Guinea, Fiji, Solomon Islands), Micronesia (Guam, Marshall Islands, Palau), and Polynesia (Hawaii, Samoa, Tonga, Easter Island); Antarctica: Fifth-largest continent, 98% covered by the Antarctic Ice Sheet (averaging 1.9 km thickness, holds 70% of world's freshwater and 90% of Earth's ice); Transantarctic Mountains dividing East and West Antarctica; Vinson Massif (4,892m highest summit); Ross Ice Shelf and Ronne Ice Shelf; Coldest, windiest, and driest continent (polar desert); Antarctic Treaty System 1959 (preserving continent for peaceful scientific research); Indian Antarctic Research Stations: Dakshin Gangotri (1983 historical), Maitri (1989), and Bharati (2012 in Larsemann Hills).",
            "entities": ["Great Dividing Range & Mount Kosciuszko", "Great Barrier Reef (2,300 km Coral System)", "Murray-Darling Basin & Lake Eyre", "Great Artesian Basin (Groundwater)", "Melanesia, Micronesia & Polynesia Sub-Regions", "Antarctic Ice Sheet & Vinson Massif", "Antarctic Treaty & Indian Stations (Maitri, Bharati)"],
            "examTags": COMMON_TAGS
        },

        # ---------------------------------------------------------------------
        # 5. WORLD MAPPING & GEOPOLITICAL LOCATIONS (PURE MAPPING)
        # ---------------------------------------------------------------------
        # Topic 5.1: Enclosed Seas, Marginal Seas & Bordering Nations
        {
            "slug": "mediterranean_black_and_caspian_seas_mapping",
            "name": "Enclosed Seas: Mediterranean, Black, Caspian & Baltic Basins",
            "parentId": f"{mapping_domain_id}.enclosed_seas_bordering_nations",
            "description": "Bordering nations, strategic straits, and maritime geography of major enclosed and marginal seas: Mediterranean Sea (surrounded by 21 nations across Europe, Asia, and Africa; connected to Atlantic via Strait of Gibraltar, to Red Sea via Suez Canal, to Sea of Marmara via Dardanelles; major marginal seas: Tyrrhenian, Adriatic, Ionian, Aegean, Ligurian; major islands: Sicily, Sardinia, Cyprus, Corsica, Crete); Black Sea (bordered by 6 nations: Turkey, Georgia, Russia, Ukraine, Romania, Bulgaria; connected to Sea of Azov via Kerch Strait, to Marmara via Bosphorus; Danube, Dnieper, and Don river inflows); Caspian Sea (world's largest inland water body / lake; bordered by TARIK nations: Turkmenistan, Azerbaijan, Russia, Iran, Kazakhstan; Volga and Ural rivers discharge); Baltic Sea (bordered by 9 nations: Sweden, Finland, Russia, Estonia, Latvia, Lithuania, Poland, Germany, Denmark; connected to North Sea through Danish Straits / Kattegat and Skagerrak).",
            "entities": ["Mediterranean Sea 21 Bordering Nations", "Black Sea & 6 Bordering Nations", "Caspian Sea TARIK Nations", "Baltic Sea 9 Bordering Nations", "Sea of Azov & Kerch Strait", "Aegean & Adriatic Marginal Seas"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "red_sea_persian_gulf_baltic_and_dead_sea_mapping",
            "name": "Marginal Seas & Depressions: Red Sea, Persian Gulf & Dead Sea",
            "parentId": f"{mapping_domain_id}.enclosed_seas_bordering_nations",
            "description": "Spatial delineation and littoral states of critical Middle Eastern and Central Asian waters: Red Sea (rift basin bordered by 6 nations: Egypt, Sudan, Eritrea, Djibouti on west; Saudi Arabia, Yemen on east; northern forks: Gulf of Suez and Gulf of Aqaba; southern outlet: Bab-el-Mandeb); Persian Gulf / Arabian Gulf (surrounded by 8 littoral nations: Iran, Iraq, Kuwait, Saudi Arabia, Bahrain, Qatar, UAE, Oman; connected to Gulf of Oman and Arabian Sea through the narrow Strait of Hormuz; Tigris-Euphrates / Shatt al-Arab delta inflow); Dead Sea (hypersaline endorheic lake in Jordan Rift Valley bordered by Israel, West Bank, and Jordan; lowest land elevation on Earth -430m below sea level; high salinity ~34% preventing macroscopic aquatic life); Aral Sea (endangered hyper-saline remnant depression shared by Uzbekistan and Kazakhstan, desiccated due to diversion of Amu Darya and Syr Darya rivers).",
            "entities": ["Red Sea Bordering Nations (Egypt, Sudan, Saudi)", "Gulf of Aqaba & Gulf of Suez", "Persian Gulf 8 Littoral Nations", "Bab-el-Mandeb & Strait of Hormuz", "Dead Sea Hypersaline Depression (-430m)", "Aral Sea Remnant Basins"],
            "examTags": COMMON_TAGS
        },

        # Topic 5.2: Strategic Maritime Straits, Canals & Chokepoints
        {
            "slug": "global_maritime_chokepoints_hormuz_malacca_bab_el_mandeb",
            "name": "Global Maritime Chokepoints: Hormuz, Malacca, Bab-el-Mandeb & Turkish Straits",
            "parentId": f"{mapping_domain_id}.strategic_straits_chokepoints_canals",
            "description": "Spatial geography, maritime jurisdictions, and strategic transit vulnerabilities: Strait of Hormuz (connects Persian Gulf to Gulf of Oman; separates Iran from Oman's Musandam Peninsula; world's most critical oil transit chokepoint handling ~20% of global petroleum); Strait of Malacca (narrow 800 km strait connecting Indian Ocean / Andaman Sea to South China Sea; separates Peninsular Malaysia from Indonesian island of Sumatra; shortest sea route between Middle East/India and East Asia; Singapore chokepoint); Bab-el-Mandeb / 'Gate of Tears' (separates Yemen on Arabian Peninsula from Djibouti and Eritrea in the Horn of Africa; connects Red Sea to Gulf of Aden; high piracy and Houthi maritime security threat); Turkish Straits: Bosphorus Strait (separates European and Asian parts of Istanbul, connects Black Sea to Sea of Marmara) and Dardanelles Strait (connects Sea of Marmara to Aegean Sea; Montreux Convention 1936 regulating naval transit).",
            "entities": ["Strait of Hormuz (Musandam Peninsula & Iran)", "Strait of Malacca (Malaysia-Sumatra-Singapore)", "Bab-el-Mandeb (Yemen & Djibouti Chokepoint)", "Bosphorus & Dardanelles (Turkish Straits)", "Montreux Convention 1936", "Global Hydrocarbon Transit Routes"],
            "examTags": COMMON_TAGS
        },
        {
            "slug": "strategic_canals_suez_panama_taiwan_strait_mapping",
            "name": "Canals & Passages: Suez Canal, Panama Canal, Taiwan Strait & Gibraltar",
            "parentId": f"{mapping_domain_id}.strategic_straits_chokepoints_canals",
            "description": "Man-made international canals and critical oceanic waterways: Suez Canal (193 km sea-level artificial waterway opened in 1869 across the Isthmus of Suez in Egypt, connecting Mediterranean Sea at Port Said to Red Sea at Port Tewfik/Suez; no locks required; enables direct transit between Europe and Asia bypassing Cape of Good Hope); Panama Canal (82 km artificial ship canal opened in 1914 across the Isthmus of Panama, connecting Atlantic Ocean at Colón to Pacific Ocean at Panama City; operates with a freshwater lock system lifting ships 26m to Gatun Lake; expanded Neopanamax locks 2016); Taiwan Strait / Formosa Strait (separates mainland China Fujian province from Taiwan; connects South China Sea with East China Sea); Strait of Gibraltar (connects Atlantic Ocean to Mediterranean Sea; separates Spain/Gibraltar in Europe from Morocco/Ceuta in Africa; 14 km width at narrowest point); Sunda Strait (between Java and Sumatra) and Lombok Strait (deepwater alternative between Bali and Lombok across the Wallace Line); Bering Strait (separates Chukchi Peninsula Russia from Seward Peninsula Alaska USA, connecting Arctic Ocean to Bering Sea).",
            "entities": ["Suez Canal (Port Said to Suez)", "Panama Canal & Gatun Lake Locks", "Taiwan Strait (Formosa Strait)", "Strait of Gibraltar (Europe-Africa Chokepoint)", "Sunda & Lombok Straits (Indonesia)", "Bering Strait (Russia-Alaska Boundary)"],
            "examTags": COMMON_TAGS
        },

        # Topic 5.3: International Land Borders, Landlocked Nations & Disputed Boundary Lines
        {
            "slug": "international_boundary_lines_and_landlocked_countries_mapping",
            "name": "International Boundary Lines, Landlocked States & Cartographic Disputes",
            "parentId": f"{mapping_domain_id}.international_land_borders_disputed_territories",
            "description": "Spatial mapping of world borders, demarcation lines, and geographical classifications: Iconic International Boundary Lines: 49th Parallel (demarcates the long undefended border between United States and Canada from Lake of the Woods to Strait of Georgia), 38th Parallel / DMZ (demarcates North Korea and South Korea along the Demilitarized Zone), 17th Parallel (historical partition line of North and South Vietnam), Radcliffe Line (demarcation between India and Pakistan / Bangladesh established in 1947), McMahon Line (disputed boundary line between India's Arunachal Pradesh and Tibet agreed at 1914 Simla Convention), Durand Line (border between Pakistan and Afghanistan drawn in 1893), Line of Control (LoC in Jammu & Kashmir), Line of Actual Control (LAC between India and China across Ladakh, Middle, and Eastern sectors); Landlocked Nations: Mapping of the world's 44 landlocked states (largest by area Kazakhstan, most populous Ethiopia); Doubly Landlocked Countries (landlocked nations completely surrounded by other landlocked nations: only two in the world: Liechtenstein in Europe and Uzbekistan in Central Asia); Tri-points and enclaves (Cooch Behar historical enclaves, Kalapani-Lipulekh tripoint India-Nepal-China).",
            "entities": ["49th Parallel (US-Canada Border)", "38th Parallel (Korean DMZ)", "Radcliffe Line & McMahon Line", "Durand Line (Pakistan-Afghanistan)", "44 Landlocked Countries (Kazakhstan & Ethiopia)", "Doubly Landlocked (Liechtenstein & Uzbekistan)", "Line of Control (LoC) & Line of Actual Control (LAC)"],
            "examTags": COMMON_TAGS
        },

        # Topic 5.4: Places in News & Conflict Zones
        {
            "slug": "geopolitical_conflict_zones_and_flashpoints_in_news",
            "name": "Geopolitical Flashpoints in News: West Asia, Sahel, South China Sea & Horn of Africa",
            "parentId": f"{mapping_domain_id}.places_in_news_conflict_zones",
            "description": "Geographical locations frequently appearing in contemporary international affairs and UPSC examinations: West Asia / Levant: Gaza Strip (Rafah crossing, Philadelphi Corridor, Khan Younis), West Bank (Jericho, Ramallah, Hebron, Green Line), Golan Heights (strategic plateau overlooking Sea of Galilee, Mount Hermon), Sinai Peninsula, and southern Lebanon (Blue Line, Litani River); Eastern Europe: Donbas region (Donetsk and Luhansk oblasts), Crimea (Sevastopol naval base, Kerch Strait Bridge), Zaporizhzhia (nuclear power plant on Dnipro river), Kherson, and Transnistria enclave in Moldova; South Caucasus: Nagorno-Karabakh (Artsakh enclave, Lachin Corridor, Zangezur Corridor between Azerbaijan and Nakhchivan); Sahel Belt: Coup belt across Mali, Niger, Burkina Faso, Chad, and Sudan (Darfur region, Port Sudan on Red Sea); Horn of Africa: Tigray region in Ethiopia, Grand Ethiopian Renaissance Dam (GERD on Blue Nile), Somaliland port of Berbera, Bab-el-Mandeb maritime corridor; South China Sea: Nine-Dash Line, Spratly Islands (Mischief Reef, Fiery Cross Reef), Paracel Islands (Woody Island), and Scarborough Shoal.",
            "entities": ["Gaza Strip (Rafah & Philadelphi Corridor)", "Golan Heights & Litani River (Lebanon)", "Donbas, Crimea & Zaporizhzhia (Dnipro River)", "Nagorno-Karabakh (Lachin & Zangezur Corridors)", "Sahel Belt (Mali, Niger, Burkina Faso, Sudan)", "Grand Ethiopian Renaissance Dam (GERD)", "South China Sea (Nine-Dash Line & Spratly Islands)"],
            "examTags": COMMON_TAGS
        }
    ]

    added_subtopics = 0
    for sub in subtopics:
        parent_id = sub["parentId"]
        parent_node = nodes.get(parent_id)
        if not parent_node:
            print(f"ERROR: Parent {parent_id} not found for subtopic {sub['slug']}")
            continue

        node_id = f"{parent_id}.{sub['slug']}"
        ancestor_ids = list(parent_node.get("ancestorIds", [])) + [parent_id]
        keywords = generate_keywords(sub["name"], sub["description"], sub["entities"])
        raw_tag_str = make_raw_tag_str(sub["examTags"])

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
            "rawExamTagString": raw_tag_str,
            "description": sub["description"],
            "entities": sub["entities"],
            "keywords": keywords
        }

        nodes[node_id] = node_obj
        if node_id not in parent_node.get("childrenIds", []):
            parent_node["childrenIds"].append(node_id)

        added_subtopics += 1

    # =========================================================================
    # E. RECOMPUTE STATS & PERSIST
    # =========================================================================
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

    print(f"\n=======================================================")
    print(f"Comprehensive Geography Enrichment Completed Successfully!")
    print(f"=======================================================")
    print(f"Added Level-4 Subtopics: {added_subtopics}")
    print(f"Total KG Nodes: {len(nodes)}")
    print(f"  Level 1 (Subjects): {l1_count}")
    print(f"  Level 2 (Domains):  {l2_count}")
    print(f"  Level 3 (Topics):   {l3_count}")
    print(f"  Level 4 (Subtopics):{l4_count}")

if __name__ == "__main__":
    main()
