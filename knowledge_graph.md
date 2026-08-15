# ENTERPRISE KNOWLEDGE GRAPH ARCHITECTURE

You are an Enterprise Knowledge Graph Architect.

This Knowledge Graph is the universal foundation for an AI-powered competitive examination platform supporting **UPSC Civil Services, KPSC/KAS, State PSCs, SSC CGL, and Banking examinations**.

This is NOT a chatbot project.  
This is NOT a RAG project.  
This is NOT a database design exercise.  
It is a **Knowledge Engineering Project**.

The knowledge graph serves as the single source of truth for:
• Current Affairs  
• Static Notes  
• Previous Years' Questions (PYQs)  
• Practice MCQs  
• Revision Notes  
• Flashcards  
• Mind Maps  
• AI Tutor  
• Answer Writing Evaluation  
• Multi-Exam Syllabus Projections  

--------------------------------------------------
CORE PHILOSOPHY & DESIGN PRINCIPLES
--------------------------------------------------

1. **Subject-First, Universal Knowledge Tree**:
   Knowledge is organized by foundational academic disciplines (Subjects & Domains), not fragmented by specific exams or individual papers. Exam syllabi (e.g. UPSC GS-1, KAS Paper-2) are represented as **Projection Tags** on top of the universal graph.

2. **Single Source of Truth & Reusable Nodes**:
   Every concept exists only once in the graph. Never duplicate nodes.
   *Example*: "Brihadeeswara Temple" exists once under `Art, Culture & Heritage` and is tagged for `[UPSC: Prelims-GS1, Mains-GS1]`, `[KAS: Prelims-P1, Mains-GS1]`, and `[SSC: GA]` with semantic edges linking it to `Chola Dynasty` in `History`.

3. **Multi-Exam Tagging Metadata**:
   Every domain, sub-topic, and entity node carries standardized exam projection tags:
   - `[UPSC: Prelims-GS1 / Prelims-CSAT / Mains-GS1..4]`
   - `[KAS: Prelims-P1 / Prelims-P2 / Mains-GS1..4]`
   - `[SSC: GA / Quant / Reasoning / English]`
   - `[Banking: GA / Quant / Reasoning / English]`
   - `[State-PSC: General Studies]`

4. **Deep Semantic Interlinking**:
   Relationships connect knowledge across domains (e.g., *Buddhism* connects *Ancient History* ↔ *Art & Culture* ↔ *Indian Philosophy* ↔ *Ethics & Moral Thinkers*).

--------------------------------------------------
NODE SCHEMA & RELATIONSHIPS
--------------------------------------------------

### What is a Node?
A node represents an ontological entity:
Subject | Domain | Category | Period | Empire | Dynasty | Movement | Philosophy | Person | Institution | Event | Treaty | Law | Article | Book | Place | Concept | Scheme | Report | Metric | Organism | Technology

### Node Properties
Every node contains:
- `id`: Unique URI / Identifier
- `name`: Canonical Name
- `type`: Ontological Class
- `description`: Formal academic definition
- `exam_tags`: Array of Exam/Paper mappings
- `parent`: Hierarchical parent
- `children`: Sub-topics / Entities
- `aliases`: Synonyms & regional variants
- `keywords`: High-frequency search & retrieval terms

### Core Relationship Types
- `parent_of` / `child_of` (Taxonomic hierarchy)
- `part_of` / `composed_of` (Structural decomposition)
- `preceded_by` / `succeeded_by` (Chronology)
- `ruled_by` / `ruled_over` (Political authority)
- `founded_by` / `built_by` (Creation & patronage)
- `located_in` (Geographical spatial link)
- `influenced_by` / `influenced` (Intellectual & artistic diffusion)
- `caused_by` / `led_to` (Causality & consequence)
- `governed_by` / `mandated_under` (Legal & statutory authority)
- `applied_in` (Technological & administrative utility)
- `tested_in` (PYQ & MCQ question links)

--------------------------------------------------
CANONICAL SUBJECT HIERARCHY
--------------------------------------------------

1. **History** `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
2. **Art, Culture & Heritage** `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
3. **Geography & Earth Systems** `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`
4. **Indian Society & Social Justice** `[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]`
5. **Indian Polity, Constitution & Governance** `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`
6. **International Relations & Global Institutions** `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`
7. **Indian Economy & Development** `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
8. **Environment, Ecology & Disaster Management** `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`
9. **Science, Technology & Defence** `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`
10. **Internal Security** `[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`
11. **Ethics, Integrity & Aptitude** `[UPSC: Mains-GS4] [KAS: Mains-GS4]`
12. **General Mental Ability, Quantitative Aptitude & Comprehension** `[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]`
13. **Educational Psychology, Child Development & Teaching Pedagogy** `[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]`
14. **Language Proficiency, Grammar & Communication (General Kannada & General English)** `[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]`

==================================================
1. HISTORY `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
==================================================

History

- Ancient India `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
- Medieval India `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
- Modern India `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
- Indian Freedom Struggle `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
- Post-Independence India `[UPSC: Mains-GS1] [KAS: Mains-GS1]`
- World History `[UPSC: Mains-GS1]`
- History of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

Ancient India `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Sources of Ancient Indian History
- Prehistoric India
- Indus Valley Civilization
- Vedic Age
- Mahajanapadas & Magadhan Hegemony
- Religious Movements: Buddhism
- Religious Movements: Jainism
- Persian & Greek Invasions
- Mauryan Empire
- Post-Mauryan Kingdoms
- Gupta Empire
- Post-Gupta Period & Harshavardhana
- South Indian Kingdoms
- Indian Influence in South-East Asia

Sources of Ancient Indian History `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Archaeological Sources (Inscriptions & Epigraphy - Ashokan Edicts, Allahabad Pillar, Junagadh Rock Inscription; Numismatics - Punch-Marked Coins, Indo-Greek Gold Coins, Gupta Coins; Monuments & Excavation Sites)
- Literary Sources (Indigenous Religious Texts - Vedas, Upanishads, Epics, Puranas, Tripitakas, Jatakas, Jain Agamas; Secular Literature - Kautilya's Arthashastra, Megasthenes' Indica, Kalidasa, Banabhatta, Rajatarangini; Foreign Travelogues - Faxian, Xuanzang, Yijing, Al-Biruni)

Prehistoric India `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Palaeolithic Age (Lower, Middle & Upper Palaeolithic; Hunter-Gatherer Economy; Handaxe & Cleaver Traditions; Core-Flake Tool Typology; Soan Valley, Belan Valley, Attirampakkam)
- Mesolithic Age (Microlithic Industry; Geometric & Non-geometric Tools; Domestication of Animals - Bagor, Adamgarh; Prehistoric Cave Art - Rock Shelters of Bhimbetka)
- Neolithic Age (Transition to Food Production; Sedentary Agriculture; Polished Stone Tools; Pottery Traditions; Mehrgarh, Burzahom, Gufkral, Chirand, Paiyampalli)
- Chalcolithic Cultures (Copper-Stone Technology; Regional Cultures - Ahar-Banas, Kayatha, Malwa, Jorwe; Inamgaon & Daimabad Settlements; Ochre Coloured Pottery / OCP & Copper Hoards)

Indus Valley Civilization `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Extent, Geography & Chronology (Mature Harappan Phase 2600–1900 BCE; Extent: Manda in North, Daimabad in South, Sutkagen Dor in West, Alamgirpur in East)
- Major Urban Centers & Findings (Harappa - Granaries, Cemetery R-37; Mohenjo-daro - Great Bath, Granary, Bronze Dancing Girl, Priest-King; Lothal - Artificial Tidal Dockyard, Rice Husk; Dholavira - Water Reservoirs, Three-Tier Town Division, Signboard; Kalibangan - Ploughed Field, Fire Altars; Rakhigarhi - Largest Harappan Site; Chanhudaro - Bead-Making Factory, City Without Citadel)
- Town Planning & Architecture (Grid Iron Pattern, Citadel vs Lower Town, Burnt Brick Architecture, Advanced Drainage & Sanitation Systems)
- Economy, Trade & Crafts (Agriculture - Wheat, Barley, Cotton; Craft Specialization - Bead-making, Metallurgy, Seal-carving; Trade Networks - Meluhha / Mesopotamia Maritime Trade, Dilmun, Makan)
- Harappan Society, Religion & Art (Pashupati Seal / Proto-Shiva, Mother Goddess Figurines, Trefoil Pattern, Terracotta Toys, Undeciphered Boustrophedon Script, Standardised Weights & Measures)
- Decline of Harappan Civilization (Theories: Aryan Invasion Theory, Climate Change & Tectonic Shifts, Drying of Saraswati / Ghaggar-Hakra River, Ecological Overexploitation)

Vedic Age `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Early Vedic / Rigvedic Period (Geography / Sapta Sindhu; Pastoral & Semi-Nomadic Economy, Cattle Wealth / Gavisti; Tribal Polity - Rajan, Sabha, Samiti, Vidatha, Gana; Social Organization - Kula, Grama, Vis, Jana; Egalitarian Tendencies & Position of Women - Gargi, Maitreyi, Lopamudra; Rigvedic Pantheon - Indra / Purandara, Agni, Varuna, Soma)
- Later Vedic Period (Geographical Expansion into Gangetic Plains / Aryavarta; Painted Grey Ware / PGW Culture; Iron Technology / Krishna Ayas & Settled Agriculture; Political Evolution - Territorial Kingdoms / Rashtra, Sacrifices - Rajasuya, Ashvamedha, Vajapeya; Social Stratification - Varna System Rigidity, Gotra System, Ashramas / 4 Stages of Life; Later Vedic Deities - Prajapati, Rudra, Vishnu; Philosophical Rebellion - Upanishads, Moksha, Brahman & Atman)

Mahajanapadas & Magadhan Hegemony `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- 16 Mahajanapadas & State Systems (Monarchical States - Magadha, Kosala, Vatsa, Avanti; Republican States / Ganasanghas - Vajji Confederacy, Mallas; Second Urbanisation & Rise of Guilds / Shrenis; Punch-Marked Coinage / Karshapanas)
- Rise of Magadha & Dynasties (Geographical, Mineral & Agricultural Factors; Haryanka Dynasty - Bimbisara, Ajatashatru & 1st Buddhist Council; Shishunaga Dynasty - Kalashoka & 2nd Buddhist Council; Nanda Dynasty - Mahapadma Nanda / Ekarat, Military Might & Alexander's Halted March)

Religious Movements: Buddhism `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Gautama Buddha & Core Doctrine (Life of Siddhartha Gautama, Four Sights, Enlightenment at Bodh Gaya, Dhammachakkappavattana at Sarnath, Mahaparinirvana at Kushinagar)
- Philosophical Tenets (Four Noble Truths / Arya Satya, Noble Eightfold Path / Ashtangika Marga, Pratityasamutpada / Dependent Origination, Anatta / Non-Self, Anicca / Impermanence, Nirvana)
- Buddhist Councils (1st Council at Rajgriha - Sutta Pitaka & Vinaya Pitaka compilation; 2nd Council at Vaishali - Schism into Sthaviravadins & Mahasanghikas; 3rd Council at Pataliputra - Abhidhamma Pitaka & Ashoka's Patronage; 4th Council at Kundalvana Kashmir - Division into Hinayana & Mahayana)
- Buddhist Sects & Bodhisattvas (Hinayana / Theravada, Mahayana, Vajrayana / Tantric Buddhism; Bodhisattva Concept - Avalokiteshvara / Padmapani, Maitreya / Future Buddha, Manjushri, Vajrapani)
- Monastic Architecture & University Centers (Viharas, Chaityas, Stupas; Ancient Universities - Nalanda, Vikramashila, Odantapuri, Valabhi, Taxila)

Religious Movements: Jainism `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Vardhamana Mahavira & Tirthankaras (24 Tirthankaras - Rishabhanatha 1st, Parshvanatha 23rd, Vardhamana Mahavira 24th; Mahavira's Life & Kaivalya / Omniscience)
- Philosophical Doctrines (Anekantavada / Doctrine of Manifold Nature of Reality, Syadvada / Theory of Conditioned Predication, Nayavada, Ahimsa / Non-violence, Karma & Moksha)
- Five Great Vows / Mahavratas (Ahimsa, Satya, Asteya, Brahmacharya, Aparigraha; Triratnas - Right Faith, Right Knowledge, Right Conduct)
- Jain Councils & Schism (1st Council at Pataliputra - Sthulabhadra; 2nd Council at Valabhi - Devardhi Kshamasramana; Schism into Digambaras / Sky-clad & Svetambaras / White-clad; Jain Sects - Bispanthi, Terapanthi, Sthanakvasi, Murtipujaka)

Persian & Greek Invasions `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Achaemenid Persian Invasion (Cyrus the Great & Darius I Invasions; Kharosthi Script Introduction; Indo-Persian Trade & Cultural Exchange; Rock Edict Traditions)
- Macedonian / Greek Invasion (Alexander the Great's Indian Campaign 326 BCE, Battle of Hydaspes / Jhelum with King Porus, Impact on Trade Routes, Foundation of Indo-Greek Settlements)

Mauryan Empire `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Foundation & Political History (Chandragupta Maurya & Defeat of Seleucus Nicator, Megasthenes' Embassy; Bindusara / Amitraghata; Ashoka the Great - Kalinga War 261 BCE & Transformation from Bherighosha to Dhammaghosha)
- Ashoka's Dhamma & Inscriptions (Principles of Dhamma, Religious Tolerance, Moral Code; Major Rock Edicts I–XIV, Pillar Edicts I–VII, Minor Rock Edicts, Cave Inscriptions; Languages & Scripts - Prakrit, Greek, Aramaic, Brahmi, Kharosthi)
- Mauryan Administration & Economy (Kautilya's Arthashastra - Saptanga Theory of State, Central Bureaucracy - Tirthas, Adhyakshas; Provincial Administration - Kumaramatyas; Municipal Administration - Six Committees of Five; Espionage / Gudhapurushas; Revenue Administration - Samaharta, Sannidhata; Agriculture, Crown Lands / Sita, Guilds / Shrenis)
- Mauryan Art & Architecture (Monolithic Ashokan Pillars, Lion Capital of Sarnath, Sanchi Stupa, Bharhut Stupa, Barabar Rock-Cut Caves)
- Decline of the Mauryas (Causes - Ashoka's Pacifism vs Administrative Over-centralisation, Financial Crunch, Pushyamitra Shunga's Coup 185 BCE)

Post-Mauryan Kingdoms `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Indigenous Dynasties (Shunga Dynasty - Pushyamitra Shunga, Patanjali's Mahabhasya, Bharhut Stupa Renovations; Kanva Dynasty - Vasudeva Kanva; Satavahana Empire - Simuka, Gautamiputra Satakarni / Nasik Prashasti, Nanaghat Inscription of Naganika, Land Grants to Brahmins & Buddhists, Amaravati & Nagarjunakonda Art; Chedi Dynasty of Kalinga - Kharavela & Hathigumpha Inscription)
- Foreign Dynasties & Invasions (Indo-Greeks - Demetrius, Menander / King Milinda & Milinda Panha; Indo-Scythians / Shakas - Western Kshatrapas, Rudradaman I & Junagadh Rock Inscription in Pure Sanskrit, Saka Era 78 CE; Indo-Parthians / Pahlavas - Gondophares; Kushana Empire - Kujula Kadphises, Kanishka I: Patronage to 4th Buddhist Council, Silk Route Control, Pure Gold Coinage, Gandhara & Mathura Art Schools)

Gupta Empire `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Foundation & Imperial Expansion (Chandragupta I & Gupta Era 319–320 CE; Samudragupta / Indian Napoleon - Prayag Prashasti / Allahabad Pillar Inscription by Harishena, Digvijaya Policy; Chandragupta II Vikramaditya - Defeat of Shakas, Navratnas / Nine Gems, Faxian's Travelogue; Kumaragupta I - Foundation of Nalanda University; Skandagupta - Repelling the Hunas, Junagadh Inscription)
- Gupta Administration, Society & Economy (Decentralised Administration, Feudalisation of Polity & Land Grants / Agrahara, Position of Women, Rise of Kayasthas, Agrarian Expansion & Vishti / Forced Labour, Decline of Urban Centers & Long-distance Maritime Trade)
- Classical Age of Literature, Science & Art (Kalidasa - Shakuntala, Meghaduta; Vishakhadatta - Mudrarakshasa; Shudraka - Mrichhakatika; Scientific Treatises - Aryabhata / Aryabhatiya, Varahamihira / Panchasiddhantika, Brahmagupta, Sushruta Samhita, Charaka Samhita; Gupta Temple Architecture - Dashavatara Temple Deogarh, Bhitargaon Brick Temple; Ajanta Cave Paintings Phase II; Sultanganj Bronze Buddha)
- Decline of the Guptas (Huna Invasions / Toramana & Mihirakula, Rise of Feudatories / Yashodharman of Malwa, Internal Succession Disputes, Economic Disruption)

Post-Gupta Period & Harshavardhana `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Regional Successor Kingdoms (Pushyabhuti / Vardhana Dynasty of Thanesar & Kannauj; Maitrakas of Valabhi; Maukharis of Kannauj; Gaudas of Bengal / King Shashanka)
- Harshavardhana's Reign & Administration (Harsha's Military Campaigns, Defeat by Pulakeshin II on Narmada River / Aihole Inscription, Kannauj Assembly & Prayag Mahamoksha Parishad, Banabhatta's Harshacharita & Kadambari, Harsha's Literary Works - Ratnavali, Priyadarsika, Nagananda; Xuanzang's Account of Indian Society, Nalanda University under Shilabhadra)

South Indian Kingdoms `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Sangam Age (Three Sangams at Madurai; Sangam Literature - Tolkappiyam, Ettuthokai, Pattupattu, Pathinenkilkanakku / Tirukkural; Post-Sangam Epics - Silappatikaram / Ilango Adigal, Manimekalai / Sathanar; Sangam Polity - Cheras / Vanji, Cholas / Uraiyur & Puhar, Pandyas / Madurai; Sangam Economy & Roman Trade - Arikamedu Excavations; Tinai / Five Landscape Eco-zones)
- Pallava Dynasty (Early & Imperial Pallavas - Simhavishnu, Mahendravarman I / Mattavilasa Prahasana, Narasimhavarman I Mahamalla / Defeat of Pulakeshin II & Vatapi Conquest; Pallava-Chalukya Conflict; Pallava Architecture - Rock-cut Mandapas, Monolithic Rathas at Mamallapuram, Shore Temple, Kailasanatha Temple at Kanchipuram)
- Imperial Chola Empire (Vijayalaya, Parantaka I / Uttaramerur Inscription & Village Administration; Rajaraja I - Brihadeeswara Temple Thanjavur, Conquest of Sri Lanka; Rajendra I - Gangaikondachola, Naval Expedition to Srivijaya / Southeast Asia; Chola Administration - Central Control & Village Autonomy / Ur, Sabha, Nagaram; Chola Bronze Sculptures / Nataraja)
- Chalukyas of Badami & Kalyani (Pulakeshin I, Pulakeshin II - Aihole Inscription by Ravikirti, Conflict with Harsha & Pallavas; Badami Cave Temples, Aihole & Pattadakal Temples / Virupaksha Temple; Western Chalukyas of Kalyani - Someshvara, Vikramaditya VI / Bilhana's Vikramankadevacharita)
- Rashtrakuta Dynasty (Dantidurga, Krishna I - Kailash Rock-Cut Temple at Ellora, Amoghavarsha I - Kavirajamarga & Jain Patronage, Indra III, Krishna III; Tripartite Struggle for Kannauj; Arab Accounts of Suleiman & Al-Masudi)
- Hoysala Dynasty (Vishnuvardhana, Ballala II; Hoysala Architecture - Star-shaped / Stellated Plans, Chloritic Schist Carvings, Chennakesava Temple Belur, Hoysaleswara Temple Halebidu, Keshava Temple Somanathapura)

Indian Influence in South-East Asia `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Indianisation & Maritime Networks (Maritime Trade Routes, Cultural Diffusion, Spread of Sanskrit, Epics / Ramayana & Mahabharata, Dharmashastras)
- Southeast Asian Kingdoms & Monuments (Funan & Chenla; Srivijaya Maritime Empire in Sumatra & Malacca Strait; Sailendra Dynasty in Java - Borobudur Stupa; Khmer Empire in Cambodia - Angkor Wat, Angkor Thom & Bayon Temple; Champa Kingdom in Vietnam - My Son Sanctuary; Pagan Kingdom in Myanmar - Ananda Temple; Majapahit Empire in Indonesia)

Medieval India `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Early Medieval Period & Tripartite Struggle
- Delhi Sultanate
- Vijayanagara Empire & Deccan Sultanates
- Bhakti & Sufi Movements
- Mughal Empire
- Sur Empire Interregnum
- Maratha Empire & Regional States

Early Medieval Period & Tripartite Struggle `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Tripartite Struggle for Kannauj (Gurjara-Pratiharas - Nagabhata I, Mihira Bhoja, Mahendrapala; Palas of Bengal - Gopala, Dharmapala: Revival of Nalanda & Vikramashila, Devapala; Rashtrakutas of Manyakheta; Political Instability & Feudal Fragmentation)
- Early Arab & Turkish Invasions (Arab Conquest of Sindh 712 CE - Muhammad bin Qasim & Chachnama; Mahmud of Ghazni's 17 Expeditions - Somnath Raid 1026, Patronage to Al-Biruni / Kitab-ul-Hind & Firdausi / Shahnama; Muhammad Ghori's Invasions - 1st Battle of Tarain 1191, 2nd Battle of Tarain 1192 / Defeat of Prithviraj Chauhan, Battle of Chandawar 1194 / Defeat of Jaichand, Qutb-ud-din Aibak & Bakhtiyar Khalji's Destruction of Nalanda)

Delhi Sultanate `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Mamluk / Slave Dynasty (Qutb-ud-din Aibak / Lakhbaksh, Construction of Qutub Minar & Quwwat-ul-Islam; Shamsuddin Iltutmish - Real Founder, Introduction of Silver Tanka & Copper Jital, Chalisa / Turkan-i-Chahalgani, Iqta System; Razia Sultan - First Female Monarch of Delhi; Ghiyasuddin Balban - Theory of Kingship: Niyabat-i-Khudai & Zill-i-Ilahi, Sijda & Paibos, Destruction of Chahalgani, Blood and Iron Policy)
- Khalji Dynasty (Jalaluddin Khalji - Humanitarian Policy; Alauddin Khalji - Imperialist Conquests: Gujarat, Ranthambore, Chittor / Rani Padmini, South Indian Expeditions under Malik Kafur: Devagiri, Warangal, Dwarasamudra, Madurai; Administrative & Market Reforms - Diwan-i-Riyasat, Shahna-i-Mandi, Price Control of Commodities, Dagh / Branding of Horses & Chehra / Descriptive Rolls of Soldiers, Biswa Land Measurement System)
- Tughlaq Dynasty (Ghiyasuddin Tughlaq; Muhammad bin Tughlaq - Visionary Experiments: Token Currency / Bronze & Copper Coins, Capital Transfer to Daulatabad / Devagiri, Taxation in Doab, Khurasan & Qarachil Expeditions, Diwan-i-Kohi / Agriculture Department; Ibn Battuta's Rihla; Firoz Shah Tughlaq - Administrative & Canal Infrastructure, Diwan-i-Khairat, Diwan-i-Bandagan, Diwan-i-Istihqaq, Jizya on Brahmins; Timur's Invasion of Delhi 1398)
- Sayyid & Lodi Dynasties (Sayyid Dynasty - Khizr Khan, Mubarak Shah; Lodi Dynasty / First Afghan Dynasty - Bahlul Lodi, Sikandar Lodi - Foundation of Agra & Gaz-i-Sikandari, Ibrahim Lodi - Conflict with Nobles & Defeat at First Battle of Panipat 1526 by Babur)
- Sultanate Administration, Economy & Culture (Central Administration - Wazir / Prime Minister, Diwan-i-Arz / Military, Diwan-i-Insha / Royal Correspondence, Diwan-i-Rasalat / Foreign Affairs, Qazi-ul-Quzat / Justice; Land Revenue - Kharaj, Khams, Jizya, Zakat; Architectural Innovations - Arch, Dome, Vault, Minaret; Amir Khusrau / Tuti-e-Hind, Sitar & Qawwali Development)

Vijayanagara Empire & Deccan Sultanates `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Vijayanagara Empire (Founding 1336 by Harihara I & Bukka I with blessings of Sage Vidyaranya; Four Dynasties - Sangama Dynasty, Saluva Dynasty, Tuluva Dynasty: Krishnadevaraya 1509–1529 - Conquest of Raichur Doab, Odisha Campaigns, Literary Patronage / Ashtadiggajas, 'Amuktamalyada' & 'Jambavati Kalyanam', Construction of Hazara Rama & Vijaya Vittala Temples; Aravidu Dynasty - Battle of Talikota / Rakshasi-Tangadi 1565 & Destruction of Hampi; Administrative Systems - Nayankara System / Amaranayakas, Ayagar Village System; Foreign Accounts - Nicolo de Conti, Abdur Razzaq, Duarte Barbosa, Domingo Paes, Fernao Nuniz)
- Bahmani Sultanate & Deccan Sultanates (Bahmani Kingdom Founding 1347 - Alauddin Hasan Bahman Shah / Hasan Gangu; Mahmud Gawan's Prime Ministership & Madrasa at Bidar; Fragmentation into Five Deccan Sultanates - Bijapur / Adil Shahi: Gol Gumbaz & Ibrahim Rauza, Golconda / Qutb Shahi: Charminar & Golconda Fort, Ahmadnagar / Nizam Shahi: Malik Ambar & Guerrilla Tactics, Berar / Imad Shahi, Bidar / Barid Shahi)

Bhakti & Sufi Movements `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Bhakti Movement in South & North India (South India - Alvars / Vaishnavite Saints: Andal, Nammalvar, Divya Prabandham; Nayanars / Saivite Saints: Appar, Sambandar, Sundarar, Manikkavacakar, Tevaram; Acharyas - Adi Shankara / Advaita Vedanta, Ramanujacharya / Vishishtadvaita, Madhvacharya / Dvaita, Nimbarka / Dvaitadvaita, Vallabhacharya / Shuddhadvaita; North Indian Saguna Tradition - Tulsidas / Ramcharitmanas, Surdas, Mirabai, Chaitanya Mahaprabhu / Gaudiya Vaishnavism, Sankardev / Neo-Vaishnavism in Assam; Nirguna Tradition - Kabir / Bijak, Doha, Universal Brotherhood; Guru Nanak / Sikhism Foundation, Guru Granth Sahib, Sangat & Pangat; Dadu Dayal, Ravidas; Maharashtra Dharma / Varkari Sect - Jnaneshwar, Namdev, Eknath, Tukaram, Samarth Ramdas)
- Sufism & Silsilas (Core Principles - Khanqah, Sama / Spiritual Music, Zikr, Fana / Union with Divine, Wahdat-ul-Wujud / Unity of Being; Major Silsilas - Chishti Order: Khwaja Moinuddin Chishti of Ajmer, Qutbuddin Bakhtiyar Kaki, Baba Farid, Nizamuddin Auliya / Mehboob-e-Ilahi, Amir Khusrau; Suhrawardi Order - Bahauddin Zakariya; Qadiri Order - Dara Shikoh's Patronage; Naqshbandi Order - Sheikh Ahmad Sirhindi & Orthodox Revival)

Mughal Empire `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Early Mughals & Expansion (Babur - 1st Battle of Panipat 1526, Battle of Khanwa 1527 against Rana Sanga, Battle of Chanderi 1528, Battle of Ghagra 1529, Tuzuk-i-Baburi / Baburnama, Charbagh Style; Humayun - Battles of Chausa 1539 & Kannauj 1540 against Sher Shah Suri, 15-Year Exile in Persia, Restoration of Rule 1555, Dinpanah & Humayun's Tomb)
- Akbar the Great (Accession & Regency of Bairam Khan, Second Battle of Panipat 1556 against Hemu; Territorial Expansion - Conquest of Malwa, Gondwana / Rani Durgavati, Gujarat, Bengal, Kashmir, Deccan; Rajput Policy - Matrimonial Alliances, High Mansabs to Raja Man Singh & Bhagwant Das, Battle of Haldighati 1576 against Maharana Pratap; Religious Reforms - Abolition of Jizya 1564 & Pilgrim Tax, Ibadat Khana at Fatehpur Sikri 1575, Mahzarnama / Infallibility Decree 1579, Din-i-Ilahi / Tauhid-i-Ilahi 1582, Principle of Sulh-i-Kul / Universal Peace; Administrative Innovations - Mansabdari System: Zat & Sawar ranks, Jagirdari System, Dahsala Land Revenue System / Todar Mal's Bandobast; Nine Jewels / Navratnas - Birbal, Abul Fazl / Ain-i-Akbari & Akbarnama, Tansen, Todar Mal, Man Singh, Faizi, Abdul Rahim Khan-i-Khanan, Fakir Aziao-Din, Mullah Do-Piaza)
- Jahangir & Shah Jahan (Jahangir - Chain of Justice / Zanjir-i-Adl, Rebellion of Prince Khusrau & Execution of Guru Arjan Dev 1606, Nur Jahan's Junta & Political Influence, European Travellers: William Hawkins & Sir Thomas Roe, Zenith of Mughal Miniature Paintings / Ustad Mansur & Bishandas; Shah Jahan - Golden Age of Mughal Architecture: Taj Mahal, Red Fort, Jama Masjid, Peacock Throne / Takht-i-Taus, Moti Masjid; War of Succession - Battle of Samugarh & Battle of Deorai, Dara Shikoh / Majma-ul-Bahrain translation of Upanishads vs Aurangzeb)
- Aurangzeb & Mughal Decline (Aurangzeb / Alamgir - Deccan Campaigns / Deccan Ulcer, Annexation of Bijapur 1686 & Golconda 1687, Reimposition of Jizya 1679, Conflict with Sikhs / Execution of Guru Tegh Bahadur 1675 & Creation of Khalsa 1699 by Guru Gobind Singh, Conflict with Marathas / Chhatrapati Shivaji Maharaj, Conflict with Rajputs & Jats; Agrarian Crisis, Jagirdari Crisis, Rise of Regional Aspirations)
- Mughal Administration, Economy & Culture (Central Ministers - Vakil, Wazir / Diwan, Mir Bakshi, Mir Saman, Chief Qazi; Provincial Administration - Subah / Subedar, Sarkar / Faujdar & Amalguzar, Pargana / Shiqdar & Amil, Village / Muqaddam & Patwari; Revenue Classification - Polaj, Parauti, Chachar, Banjar; Trade & Currency - Silver Rupiya, Dam, Karkhanas; Decline & Later Mughals - Bahadur Shah I, Farrukhsiyar's 1717 Farman to EIC, Muhammad Shah Rangeela & Nadir Shah's Invasion 1739 / Koh-i-Noor & Peacock Throne, Ahmad Shah Abdali's Raids, Bahadur Shah II Zafar 1857)

Sur Empire Interregnum `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Sher Shah Suri & Administrative Reforms (Sher Shah Suri 1540–1545; Central Administration & Division into Sarkars and Parganas; Revenue System - Measurement of Land, Ray / Schedule of Crop Rates, Patta & Qabuliyat; Currency Reform - Standard Silver Rupiya & Copper Dam; Infrastructure - Grand Trunk Road / Sadak-e-Azam from Sonargaon to Indus, Sarais / Rest Houses, Postal System / Dak Chowki; Military Reorganisation - Dagh & Chehra; Architectural Masterpieces - Rohtas Fort, Qila-i-Kuhna Mosque, Sasaram Tomb)

Maratha Empire & Regional States `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Chhatrapati Shivaji Maharaj & Early Maratha State (Shivaji's Early Conquests - Torna, Kondana, Purandar; Conflict with Bijapur / Afzal Khan Episode; Conflict with Mughals / Shaista Khan Episode & Sack of Surat; Treaty of Purandar 1665 with Raja Jai Singh; Escape from Agra 1666; Coronation as Chhatrapati at Raigad 1674; Administration - Ashtapradhan Council: Peshwa, Amatya, Sachiv, Mantri, Senapati, Sumant, Nyayadhish, Panditrao; Revenue System - Chauth / 1/4th Tax & Sardeshmukhi / 10th Tax, Abolition of Jagirdari / Direct Kathi Measurement; Military - Guerrilla Warfare / Ganimi Kava, Paga Regular Cavalry & Silahdars, Maratha Navy under Kanhoji Angre)
- Peshwa Era & Maratha Expansion (Balaji Vishwanath - First Hereditary Peshwa, Farrukhsiyar's Treaty 1719; Baji Rao I - Rapid Expansion into North India, Battle of Palkhed 1728 against Nizam, Capture of Malwa & Gujarat, March on Delhi 1737; Balaji Baji Rao / Nana Saheb - Extension to Punjab & Bengal; Third Battle of Panipat 1761 - Marathas under Sadashivrao Bhau vs Ahmad Shah Abdali, Devastating Maratha Defeat & Consequences)
- Maratha Confederacy & Anglo-Maratha Wars (Five Major Houses - Peshwa of Pune, Scindia of Gwalior / Mahadji Scindia, Holkar of Indore / Ahilyabai Holkar, Bhonsle of Nagpur, Gaekwad of Baroda; Nana Fadnavis & Internal Rivalries; Anglo-Maratha Wars I, II, III; Annexation of Maratha State 1818)
- 18th Century Regional States (Bengal - Murshid Quli Khan, Alivardi Khan; Awadh - Saadat Khan Burhan-ul-Mulk, Safdarjung, Asaf-ud-Daula / Bara Imambara; Hyderabad - Nizam-ul-Mulk Asaf Jah 1724; Mysore - Hyder Ali & Tipu Sultan: Modern Army, French Assistance, Rocket Technology, Jacobin Club, Tree of Liberty; Punjab - Twelve Sikh Misls, Maharaja Ranjit Singh: Consolidation of Punjab, Fauj-i-Khas Modern Army, Treaty of Amritsar 1809 with British)

Modern India `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Advent of European Traders & Anglo-French Rivalry
- British Conquest & Consolidation of India
- British Expansionist Policies & Administrative Machinery
- Economic Impact of British Rule
- Socio-Religious Reform Movements
- Early Peasant, Tribal & Civil Uprisings

Advent of European Traders & Anglo-French Rivalry `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- European Trading Companies (Portuguese East India Company / Estado da India - Vasco da Gama 1498 at Calicut, Francisco de Almeida & Blue Water Policy, Afonso de Albuquerque & Conquest of Goa 1510, Cartaz System; Dutch East India Company / VOC - Factories at Pulicat, Surat, Chinsurah, Defeat at Battle of Colachel 1741 by Marthanda Varma & Battle of Bedara 1759 by British; English East India Company / EIC - Royal Charter 1600, Captain William Hawkins 1608, Sir Thomas Roe 1615, Factories at Surat, Madras / Fort St. George, Bombay / Charles II Dowry, Calcutta / Fort William; French East India Company / Compagnie des Indes - Founded 1664 by Colbert, Centers at Pondicherry / Francois Martin, Chandernagore, Mahe, Karaikal)
- Anglo-French Carnatic Wars (1st Carnatic War 1746–48 - War of Austrian Succession in Europe, Dupleix's Ambitions, Battle of St. Thome, Treaty of Aix-la-Chapelle; 2nd Carnatic War 1749–54 - Succession Wars in Hyderabad & Carnatic, Battle of Ambur, Robert Clive's Siege of Arcot, Treaty of Pondicherry & Recall of Dupleix; 3rd Carnatic War 1758–63 - Seven Years' War in Europe, Count de Lally, Battle of Wandiwash 1760 / Sir Eyre Coote, Treaty of Paris 1763 & End of French Political Ambitions)

British Conquest & Consolidation of India `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- British Conquest of Bengal (Siraj-ud-Daulah's Grievances - Dastak Misuse, Fortification of Calcutta; Black Hole Tragedy; Battle of Plassey 23 June 1757 - Robert Clive's Treachery with Mir Jafar, Jagat Seth & Rai Durlabh; Mir Jafar & Mir Qasim - Transfer of Capital to Munger, Free Duty Trade for Indians; Battle of Buxar 22 October 1764 - Major Hector Munro vs Combined Army of Mir Qasim, Shuja-ud-Daula / Awadh, & Shah Alam II / Mughal Emperor; Treaty of Allahabad 1765 - Grant of Diwani Rights of Bengal, Bihar & Odisha to EIC, Dual Government in Bengal 1765–1772 / Clive, Devastating Bengal Famine 1770)
- Subjugation of Mysore & Marathas (Anglo-Mysore Wars: 1st War 1767–69 / Treaty of Madras, 2nd War 1780–84 / Treaty of Mangalore & Death of Hyder Ali, 3rd War 1790–92 / Lord Cornwallis & Treaty of Seringapatam, 4th War 1799 / Lord Wellesley, Death of Tipu Sultan & Restoration of Wodeyars under Subsidiary Alliance; Anglo-Maratha Wars: 1st War 1775–82 / Treaty of Surat, Purandar, Wadgaon & Salbai 1782; 2nd War 1803–05 / Treaty of Bassein 1802 with Baji Rao II, Defeat of Scindias & Bhonsles; 3rd War 1817–18 / Lord Hastings, Pindaris Suppression, Abolition of Peshwaship)
- Conquest of Sindh, Punjab & Frontier Regions (Annexation of Sindh 1843 - Sir Charles Napier / 'A piece of rascality'; Anglo-Sikh Wars: 1st War 1845–46 / Battles of Mudki, Sobraon, Treaty of Lahore, 2nd War 1848–49 / Lord Dalhousie, Annexation of Punjab, Koh-i-Noor Diamond Transfer; Anglo-Burmese Wars I, II, III & Annexation of Burma; Anglo-Afghan Wars I / Lord Auckland & Disastrous Retreat, II / Lord Lytton, Treaty of Gandamak, Durand Line 1893; Anglo-Nepalese War 1814–16 & Treaty of Sugauli)

British Expansionist Policies & Administrative Machinery `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Expansionist Doctrines (Policy of Ring Fence - Warren Hastings; Subsidiary Alliance System - Lord Wellesley: Conditions, Native Troop Stationing, British Resident, States - Hyderabad 1798, Mysore 1799, Tanjore, Awadh 1801, Peshwa 1802, Bhonsle, Scindia; Doctrine of Lapse - Lord Dalhousie: Abolition of Adopted Heir Rights, Annexed States - Satara 1848, Jaitpur, Sambalpur, Baghat, Udaipur, Jhansi 1853, Nagpur 1854; Annexation of Awadh 1856 on Grounds of Misgovernance / Nawab Wajid Ali Shah)
- Administrative, Judicial & Police Systems (Civil Services - Lord Cornwallis / Father of Civil Services, Charter Act 1853 / Open Competition, Satyendranath Tagore / First Indian ICS 1863, Aitchison Commission 1886; Police Reforms - Cornwallis Daroga System, Police Act 1861, Fraser Commission 1902; Judicial System - Warren Hastings' District Diwani & Faujdari Adalats, Cornwallis Code 1793 / Separation of Revenue & Judicial Functions, Macaulay's Law Commission 1834, Indian Penal Code 1860, Criminal Procedure Code 1861; Army - Racial Segregation, Martial Races Concept, Peel Commission 1859 Post-Revolt Reorganisation)

Economic Impact of British Rule `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Colonial Land Revenue Systems (Permanent Settlement / Zamindari System 1793 - Lord Cornwallis & John Shore in Bengal, Bihar, Odisha, Sunset Law, Creation of Loyal Landlord Class, Absentee Landlordism; Ryotwari System 1820 - Thomas Munro & Alexander Read in Madras, Bombay, Assam, Direct Settlement with Ryots, High Revenue Demand; Mahalwari System 1822 - Holt Mackenzie & Robert Merttins Bird in NWFP, Central Provinces, Punjab, Collective Village / Mahal Responsibility)
- Deindustrialisation & Commercialisation (Destruction of Traditional Handicrafts & Weavers / 'Bones of cotton weavers bleaching the plains of India', Tariff Discrimination, Loss of Royal Patronage; Commercialisation of Agriculture - Coerced Cultivation of Indigo, Opium, Cotton, Jute, Sugar; Rural Indebtedness & Money-lenders / Mahajans; Transformation from Exporter of Finished Goods to Exporter of Raw Materials & Importer of Manufactured Goods)
- Drain of Wealth & Famine Dynamics (Drain of Wealth Theory - Dadabhai Naoroji: 'Poverty and Un-British Rule in India', R.C. Dutt: 'Economic History of India', Dinshaw Wacha, G.V. Joshi; Components of Drain - Home Charges, Dividends, Interest on Debt, Pensions, Remittances; Famines in British India - Bengal Famine 1770, Orissa Famine 1866, Great Famine 1876–78, Bengal Famine 1943; Famine Commissions - Strachey Commission 1880, Lyall Commission 1897, MacDonnell Commission 1900 / Famine Codes)

Socio-Religious Reform Movements `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Bengal & Eastern India Reforms (Raja Ram Mohan Roy - Father of Modern Indian Renaissance, Atmiya Sabha 1814, Brahmo Sabha 1828 / Brahmo Samaj, Anti-Sati Campaign & Regulation XVII 1829, Sambad Kaumudi, Mirat-ul-Akbar, Vedanta College; Debendranath Tagore & Tattvabodhini Sabha; Keshub Chandra Sen & Brahmo Samaj of India; Sadharan Brahmo Samaj; Young Bengal Movement - Henry Louis Vivian Derozio; Ishwar Chandra Vidyasagar - Sanskrit College, Widow Remarriage Act 1856, Bethune School for Women's Education)
- Western & Central India Reforms (Paramahansa Mandali 1849; Prarthana Samaj 1867 - Atmaram Pandurang, Mahadev Govind Ranade, R.G. Bhandarkar; Satyashodhak Samaj 1873 - Jyotirao Phule: 'Gulamgiri', Sarvajanik Satyadharma, Education for Shudras & Women, Savitribai Phule; Gopalhari Deshmukh / Lokahitawadi; Gopal Ganesh Agarkar / Sudharak; Servants of India Society 1905 - Gopal Krishna Gokhale; Social Service League - N.M. Joshi; Depressed Classes Mission - V.R. Shinde; Bahishkrit Hitakarini Sabha 1924 & Mahad Satyagraha 1927 - Dr. B.R. Ambedkar)
- Northern India Reforms (Arya Samaj 1875 - Swami Dayanand Saraswati: 'Satyarth Prakash', Slogan 'Go Back to the Vedas', Rejection of Idol Worship & Caste Hierarchy, Shuddhi Movement, DAV Schools vs Gurukul Kangri / Swami Shraddhanand; Ramakrishna Movement - Sri Ramakrishna Paramahansa & Swami Vivekananda: Belur Math, Ramakrishna Mission 1897, Chicago Parliament of Religions 1893, Practical Vedanta; Theosophical Society - Madame Blavatsky & Colonel Olcott, Annie Besant: Central Hindu College Varanasi)
- Southern India Reforms (Self-Respect Movement 1925 - E.V. Ramasamy / Periyar: Kudi Arasu, Anti-Brahminism; Sree Narayana Guru Dharma Paripalana / SNDP Movement - Sree Narayana Guru: 'One Caste, One Religion, One God for All', Aravippuram Movement 1888; Temple Entry Movements - Vaikom Satyagraha 1924 / T.K. Madhavan, K. Kelappan, Guruvayur Satyagraha 1931; Justice Party / South Indian Liberal Federation 1916)
- Muslim, Parsi & Sikh Reform Movements (Aligarh Movement - Sir Syed Ahmed Khan: Scientific Society, MAO College Aligarh 1875, Tahdhib-ul-Akhlaq, Modern Western Education for Muslims; Deoband School 1866 - Mohammad Qasim Nanautavi & Rashid Ahmad Gangohi, Orthodox Revivalist & Anti-British; Wahabi / Walliullah Movement; Ahmadiyya Movement - Mirza Ghulam Ahmad; Parsi Reform - Rahnumai Mazdayasnan Sabha 1851: Naoroji Furdunji, Dadabhai Naoroji, S.S. Bengalee, Rast Goftar; Sikh Reform - Singh Sabha Movement 1873, Akali Movement / Gurdwara Reform Movement 1920–25 & SGPC Act 1925)

Early Peasant, Tribal & Civil Uprisings `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Civil Rebellions (Sanyasi & Fakir Rebellion 1763–1800 in Bengal - Majnu Shah, Bhawani Pathak, Debi Chaudhurani, Bankim Chandra Chattopadhyay's 'Anandamath' & 'Vande Mataram'; Revolt of Raja Chait Singh of Varanasi; Poligar Rebellions 1799–1805 in Tamil Nadu - Veerapandiya Kattabomman; Paika Rebellion 1817 in Odisha - Bakshi Jagabandhu; Kittur Rebellion 1824 in Karnataka - Rani Chennamma & Rayanna; Ramosi Uprisings - Chittur Singh & Umaji Naik)
- Tribal Movements & Insurrections (Pahariya Rebellion 1778 in Rajmahal Hills; Chuar Uprising 1766–1816; Kol Mutiny 1831–32 in Chhotanagpur - Buddho Bhagat; Santhal Hool 1855–56 - Sidhu, Kanhu, Chand, Bhairav against Dikus / Outsiders, Establishment of Santhal Parganas; Rampa Rebellion 1879 & 1922–24 - Alluri Sitarama Raju; Munda Ulgulan / Great Tumult 1899–1900 - Birsa Munda: Dharti Aba, Khuntkatti System, Chhotanagpur Tenancy Act 1908; Khasi Uprising - U Tirot Sing; Kuki Revolt & Zeliangrong Movement - Rani Gaidinliu; Chenchu Tribal Movement)
- Peasant Movements (Pagal Panthis 1825 - Karam Shah & Tipu Shah; Faraizi Movement 1838 - Haji Shariatullah & Dudu Miyan; Moplah / Mappila Uprisings in Malabar 1836–1921; Indigo Revolt 1859–60 in Bengal - Bishnu Charan Biswas & Digambar Biswas, Dinabandhu Mitra's 'Nil Darpan', Indigo Commission 1860; Pabna Agrarian Leagues 1873 in Bengal - Ishan Chandra Roy, Bengal Tenancy Act 1885; Deccan Riots 1875 in Maharashtra - Social Boycott of Marwari & Gujarati Moneylenders, Deccan Agriculturists' Relief Act 1879)

Indian Freedom Struggle `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Revolt of 1857
- Growth of Modern Nationalism & Early Political Associations
- Foundation of INC & Moderate Phase (1885–1905)
- Swadeshi Movement, Extremism & Revolutionary Nationalism Phase I (1905–1918)
- Gandhian Era: Early Satyagrahas & Non-Cooperation Movement (1915–1922)
- Swarajists, Revolutionary Nationalism Phase II & Left-Wing Upsurge (1922–1929)
- Simon Commission, Nehru Report & Civil Disobedience Movement (1927–1934)
- Constitutional Impasse, 1937 Elections & Pre-War Politics (1935–1939)
- WWII, Cripps Mission, Quit India Movement & INA (1939–1945)
- Post-War Nationalist Upsurge, Cabinet Mission & Independence (1945–1947)

Revolt of 1857 `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Causes of the Revolt (Political Causes - Doctrine of Lapse, Annexation of Awadh, Disrespect to Mughal Emperor; Socio-Religious Causes - Religious Disabilities Act 1856, Lex Loci Act, Christian Missionary Activities, Abolition of Sati & Widow Remarriage fears; Economic Causes - Ruin of Handicrafts, High Land Revenue, Confiscation of Inam Lands; Military Causes - General Service Enlistment Act 1856, Overseas Allowance / Bhatta abolition, Racial Discrimination; Immediate Cause - Introduction of Enfield Rifle & Greased Cartridges of Cow and Pig Fat)
- Outbreak, Major Centers & Leadership (Outbreak at Barrackpore 29 March 1857 - Mangal Pandey; Mutiny at Meerut 10 May 1857; Centers & Leaders: Delhi - Bahadur Shah II Zafar & General Bakht Khan; Kanpur - Nana Saheb / Dhondu Pant, Tantia Tope, Azimullah Khan; Lucknow - Begum Hazrat Mahal & Birjis Qadr; Jhansi - Rani Lakshmibai; Bihar / Arrah - Kunwar Singh & Amar Singh; Faizabad - Maulvi Ahmadullah; Bareilly - Khan Bahadur Khan; Allahabad - Liaquat Ali)
- British Suppression & Leaders (Capture of Delhi - John Nicholson & Hudson; Suppression in Kanpur & Lucknow - Colin Campbell & James Outram; Jhansi & Gwalior - Hugh Rose)
- Nature, Causes of Failure & Impact (Nature Debate - Sepoy Mutiny / British Historians, First War of Indian Independence / V.D. Savarkar, National Uprising / Disraeli; Causes of Failure - Limited Geographic Spread, Lack of Central Leadership, Non-participation of Modern Intelligentsia & Princely States; Administrative Impact - Government of India Act 1858 / Crown Rule, Queen Victoria's Proclamation 1858, Abolition of Board of Control & Court of Directors, Secretary of State for India, Peel Commission 1859 Army Reorganisation - Martial & Non-Martial Class Division)

Growth of Modern Nationalism & Early Political Associations `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Factors in Rise of Nationalism (Impact of Western Education & Ideas of Liberty/Equality; Role of Press & Vernacular Literature; Administrative & Economic Unification under Railways & Telegraph; Reactionary Policies of Lord Lytton - Vernacular Press Act 1878, Arms Act 1878, Imperial Durbar during Famine 1877; Ilbert Bill Controversy 1883 / Lord Ripon)
- Early Political Organisations (Landholders' Society 1838 / First Political Body; British Indian Association 1851 - Radhakanta Deb; East India Association 1866 in London - Dadabhai Naoroji; Poona Sarvajanik Sabha 1870 - M.G. Ranade, G.V. Joshi; Indian Association of Calcutta 1876 - Surendranath Banerjee & Ananda Mohan Bose, Civil Service Agitation; Bombay Presidency Association 1885 - Pherozeshah Mehta, Badruddin Tyabji, K.T. Telang; Madras Mahajana Sabha 1884 - M. Veeraraghavachariar, G. Subramania Iyer, P. Anandacharlu)

Foundation of INC & Moderate Phase (1885–1905) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Foundation of Indian National Congress (First Session at Gokuldas Tejpal Sanskrit College Bombay 28–31 Dec 1885, 72 Delegates, President W.C. Bonnerjee; Role of A.O. Hume; Theories of Origin - Safety Valve Theory / Lala Lajpat Rai & R.P. Dutt, Lightning Conductor Theory / G.K. Gokhale)
- Moderate Leadership & Ideology (Key Leaders - Dadabhai Naoroji / Grand Old Man of India, Gopal Krishna Gokhale, Pherozeshah Mehta, Dinshaw Wacha, Surendranath Banerjee, Rashbehari Ghosh; Belief in British Sense of Justice, Method of 3Ps - Prayer, Petition, Protest; Demands - Expansion of Legislative Councils, Indianisation of Civil Services, Separation of Judiciary from Executive, Reduction of Military Expenditure & Land Revenue)
- Achievements & Limitations (Economic Critique of British Imperialism; Creation of National Awakening; Indian Councils Act 1892; Limitations - Narrow Social Base / Elitist, Lack of Faith in Masses, Inability to Extract Substantial Constitutional Concessions)

Swadeshi Movement, Extremism & Revolutionary Nationalism Phase I (1905–1918) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Partition of Bengal & Swadeshi Movement (Lord Curzon's Motives - Administrative Convenience vs Weakening Bengal as Epicenter of Nationalism; Partition Announcement 1905; Swadeshi & Boycott Resolution at Town Hall Calcutta 7 Aug 1905; Day of Partition 16 Oct 1905 observed as Day of Mourning / Raksha Bandhan; Boycott of Manchester Cloth & Liverpool Salt; National Education Movement - National Council of Education 1906, Bengal National College / Aurobindo Ghosh; Swadeshi Enterprises - Bengal Chemical Swadeshi Stores / Acharya P.C. Ray, Swadeshi Steam Navigation Company / V.O. Chidambaram Pillai; Mass Mobilisation - Swadesh Bandhab Samiti / Ashwini Kumar Dutta, Folk Theatre / Jatras)
- Extremist Phase & Leadership (Rise of Extremism - Lal-Bal-Pal: Lala Lajpat Rai / Punjab, Bal Gangadhar Tilak / Maharashtra: Slogan 'Swaraj is my birthright and I shall have it', Ganpati & Shivaji Festivals, Kesari & Mahratta; Bipin Chandra Pal & Aurobindo Ghosh / Bengal: Concept of Passive Resistance, New Lamps for Old; Surat Split 1907 - Moderate-Extremist Rift over Presidentship & Boycott Scope, Rash Behari Ghosh as President, Expulsion of Extremists; British Repression - Seditious Meetings Act 1907, Criminal Law Amendment Act 1908, Newspaper Act 1908, Tilak's Imprisonment at Mandalay Jail 1908–1914)
- Revolutionary Activities Phase I: Domestic & Abroad (Domestic - Anushilan Samiti: Pramathanath Mitra, Barindra Kumar Ghosh, Bhupendranath Dutta, 'Jugantar' Journal; Alipore Bomb Conspiracy Case 1908 - Khudiram Bose & Prafulla Chaki's attempt on Kingsford, Defense by C.R. Das, Aurobindo's Spiritual Retirement to Pondicherry; Mitra Mela & Abhinav Bharat 1904 - V.D. Savarkar & Ganesh Savarkar; Curzon Wyllie Assassination 1909 by Madan Lal Dhingra; Delhi Conspiracy Case 1912 - Bomb on Viceroy Hardinge by Rash Behari Bose & Sachin Sanyal; Revolutionary Abroad - India House London: Shyamji Krishna Varma; Madame Bhikaji Cama - Unfurling First Indian Flag at Stuttgart Socialist Congress 1907; Ghadar Movement 1913 in San Francisco - Lala Har Dayal, Sohan Singh Bhakna, Kartar Singh Sarabha, 'Ghadar' Journal; Komagata Maru Incident 1914 - Gurdit Singh, Budge Budge Riots; Berlin Committee / Zimmermann Plan - Virendranath Chattopadhyaya; Singapore Mutiny 1915)
- Constitutional Reforms & Political Realignment (Morley-Minto Reforms / Indian Councils Act 1909 - Introduction of Separate Electorates for Muslims / Seed of Communalism, Non-official Majorities in Provincial Councils; Delhi Durbar 1911 - Annulment of Bengal Partition, Transfer of Capital from Calcutta to Delhi; Home Rule League Movement 1916 - Tilak's League in Maharashtra/Karnataka & Besant's League in Rest of India, Newspapers / New India & Commonweal; Lucknow Session of INC 1916 - A.C. Majumdar President: Moderate-Extremist Reunion & Lucknow Pact / Congress-League Accord: Joint Demands for Self-Government & Congress Acceptance of Separate Electorates; Montagu's August Declaration 1917 / 'Responsible Government as an Integral Part of British Empire')

Gandhian Era: Early Satyagrahas & Non-Cooperation Movement (1915–1922) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Emergence of Mahatma Gandhi (Early Life & Legal Career; South African Experiments 1893–1914 - Passive Resistance / Satyagraha against Asiatic Registration Act, Poll Tax & Non-Christian Marriages, Natal Indian Congress, Indian Opinion Newspaper, Phoenix Settlement & Tolstoy Farm; Return to India 9 Jan 1915 / Pravasi Bharatiya Divas, Gopal Krishna Gokhale as Political Guru, Foundation of Sabarmati Ashram 1915)
- Early Indian Satyagrahas (Champaran Satyagraha 1917 / First Civil Disobedience - Indigo Planters & Tinkathia System / 3/20th, Raj Kumar Shukla, Induction of Rajendra Prasad & J.B. Kripalani, Abolition of Tinkathia; Ahmedabad Mill Strike 1918 / First Hunger Strike - Plague Bonus Dispute, Anusuya Sarabhai, 35% Wage Hike Award; Kheda Satyagraha 1918 / First Non-Cooperation - Crop Failure & Revenue Remission Demand, Sardar Vallabhbhai Patel & Indulal Yagnik)
- Anti-Rowlatt Campaign & Jallianwala Bagh (Montagu-Chelmsford Reforms / Government of India Act 1919 - Introduction of Dyarchy in Provinces: Transferred vs Reserved Subjects, Bicameral Central Legislature; Anarchical and Revolutionary Crimes Act / Rowlatt Act 1919 - Detention without Trial, Slogan 'No Dalil, No Vakil, No Appeal'; Rowlatt Satyagraha & Satyagraha Sabha; Arrest of Dr. Saifuddin Kitchlew & Dr. Satyapal; Jallianwala Bagh Massacre 13 April 1919 / Baisakhi Day - General Dyer's Open Fire, Thousands Killed; Rabindranath Tagore's Renunciation of Knighthood, Gandhi Returns Kaisar-i-Hind Medal; Hunter Commission of Inquiry & Indemnity Act)
- Khilafat Agitation & Non-Cooperation Movement (Khilafat Movement 1919 - Post-WWI Dismemberment of Ottoman Empire & Caliphate, All India Khilafat Committee: Maulana Azad, Ali Brothers / Shaukat Ali & Mohammad Ali, Gandhi as President of All India Khilafat Conference; Non-Cooperation Movement Resolution - Calcutta Special Session Sept 1920 / Lala Lajpat Rai & Nagpur Session Dec 1920 / C. Vijayaraghavachariar: Swaraj Goal within One Year, Reorganisation of Provincial Congress Committees on Linguistic Lines; Programmes & Boycotts - Surrender of Titles, Boycott of Government Schools, Courts, Foreign Goods & Liquor, Promotion of Khadi, Charkha, Panchayats & National Schools / Kashi Vidyapeeth, Jamia Millia; Mass Spread - Baba Ramchandra's Kisan Movement in Awadh, Eka Movement / Madari Pasi, Forest Satyagrahas in Andhra, Akali Movement in Punjab; Chauri Chaura Incident 4 Feb 1922 in Gorakhpur - Burning of Police Station & Death of 22 Policemen; Bardoli Resolution 12 Feb 1922 & Withdrawal of Movement; Arrest & Imprisonment of Gandhi / 6 Years by Judge Broomfield)

Swarajists, Revolutionary Nationalism Phase II & Left-Wing Upsurge (1922–1929) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Swarajists vs No-Changers (Gaya Session 1922 / C.R. Das; Debate on Council Entry; Pro-Changers / Swaraj Party Jan 1923 - C.R. Das / President, Motilal Nehru / Secretary, Vithalbhai Patel; Strategy of 'Ending or Mending the Councils'; No-Changers - C. Rajagopalachari, Sardar Patel, Rajendra Prasad, M.A. Ansari: Focus on Constructive Work, Khadi & Harijan Upliftment; Swarajist Achievements - Election Victories 1923, Defeating Public Safety Bill 1928, Election of Vithalbhai Patel as Central Legislative Assembly Speaker 1925; Decline post-death of C.R. Das 1925 & Rise of Responsivists / N.C. Kelkar, M.M. Malaviya, Lala Lajpat Rai)
- Revolutionary Nationalism Phase II (Hindustan Republican Association / HRA 1924 in Kanpur - Sachindra Nath Sanyal / 'Bandi Jiwan', Ram Prasad Bismil, Ashfaqulla Khan, Jogesh Chandra Chatterjee; Kakori Train Action 9 Aug 1925 - Looting of Government Cash, Execution of Bismil, Ashfaqulla, Roshan Singh, Rajendra Lahiri; Hindustan Socialist Republican Association / HSRA 1928 at Feroz Shah Kotla Delhi - Chandrashekhar Azad, Bhagat Singh, Sukhdev, Rajguru; Murder of Assistant SP Saunders 1928 to avenge Lala Lajpat Rai's death during Simon Protests; Central Legislative Assembly Bomb Case 8 April 1929 - Bhagat Singh & Batukeshwar Dutt: 'To make the deaf hear', Slogan 'Inquilab Zindabad'; Lahore Conspiracy Case & 63-Day Hunger Strike of Jatin Das; Martyrdom of Chandrashekhar Azad at Alfred Park Allahabad Feb 1931; Execution of Bhagat Singh, Rajguru & Sukhdev 23 March 1931; Chittagong Armoury Raid 18 April 1930 - Indian Republican Army / Surya Sen / Master Da, Pritilata Waddedar / Pahartali European Club attack, Kalpana Datta, Santi & Suniti / Assassination of Magistrate Stevens, Bina Das / Shooting at Governor Jackson)
- Growth of Socialist, Communist & Working Class Movements (Influence of Russian Revolution 1917; Formation of Communist Party of India - Tashkent 1920 / M.N. Roy & Kanpur 1925 / Satyabhakta; Workers' and Peasants' Parties / WPPs; British Conspiracy Trials against Communists - Peshawar 1922, Kanpur Bolshevik 1924, Meerut Conspiracy Case 1929 / S.A. Dange, Muzaffar Ahmad, P.C. Joshi; Trade Union Movement - All India Trade Union Congress / AITUC 1920: Lala Lajpat Rai First President, N.M. Joshi, Dewan Chaman Lall; Congress Socialist Party / CSP 1934 within INC - Jayaprakash Narayan, Acharya Narendra Deva, Ram Manohar Lohia, Minoo Masani; Peasant Mobilisation - All India Kisan Sabha / AIKS 1936 at Lucknow: Swami Sahajanand Saraswati First President, N.G. Ranga)

Simon Commission, Nehru Report & Civil Disobedience Movement (1927–1934) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Simon Commission & The Nehru Report (Indian Statutory Commission / Simon Commission Appointed 1927 - All-White Commission of 7 MPs, Lord Birkenhead's Challenge; Complete Boycott by Congress, Liberal Federation & Muslim League / Slogan 'Simon Go Back'; Protests in Madras / T. Prakasam, Lahore / Lathi-charge on Lala Lajpat Rai & Death; All Parties Conference 1928 & Nehru Committee Report - Motilal Nehru / Chairman, Jawaharlal Nehru / Secretary: Demand for Dominion Status, Fundamental Rights / 19 Rights including Adult Suffrage, Joint Electorates with Reservation for Minorities, Linguistic Provinces, Rejection of Separate Electorates; Young Nationalist Opposition - Jawaharlal Nehru & Subhash Chandra Bose form Independence for India League demanding Complete Independence; Jinnah's Fourteen Points 1929 & Breakdown of Consensus)
- Purna Swaraj & Launch of Civil Disobedience (Irwin's Deepavali Declaration 1929; Lahore Session of INC Dec 1929 - Jawaharlal Nehru President: Passing of Historic 'Purna Swaraj' / Complete Independence Resolution, Launch of Civil Disobedience, Tricolour Unfurled on Banks of River Ravi 31 Dec 1929, 26 January 1930 declared as First Independence Day; Gandhi's 11-Point Ultimatum to Lord Irwin; Dandi March 12 March – 6 April 1930 - 78 Followers, 240 Miles from Sabarmati to Dandi Coast, Breaking of Salt Law; Nationwide Salt Satyagraha - C. Rajagopalachari / Vedaranyam March in Tamil Nadu, K. Kelappan / Payyanur March in Malabar; Dharsana Salt Works Raid May 1930 - Sarojini Naidu, Imam Saheb, Manilal Gandhi & Brutal Police Lathi-charge / Webb Miller's Report)
- Spread of Movement & Regional Variations (Peshawar / NWFP - Khan Abdul Ghaffar Khan / Frontier Gandhi, Khudai Khidmatgars / Red Shirts, Garhwal Rifles Refusal to Fire on Unarmed Crowds / Chandra Singh Garhwali; Eastern India - Chowkidari Tax Refusal in Bihar & Bengal; Nagaland & Manipur - Rani Gaidinliu / Heraka Religious Movement; Central Provinces & Maharashtra - Forest Satyagrahas; Sholapur Textile Workers Strike & Parallel Rule; Participation of Women, Students & Merchants; Complete Boycott of British Imports)
- Round Table Conferences & Pacts (First Round Table Conference Nov 1930–Jan 1931 in London - Boycotted by Congress; Gandhi-Irwin Pact / Delhi Pact 5 March 1931 - Discontinuation of Civil Disobedience, Participation in 2nd RTC, Release of Political Prisoners not guilty of violence, Right to make salt for personal consumption; Karachi Session of INC March 1931 - Sardar Patel President: Endorsement of Gandhi-Irwin Pact, Historic Resolutions on Fundamental Rights & National Economic Programme / drafted by Nehru; Second Round Table Conference Sept–Dec 1931 - Gandhi Sole Representative of INC, Deadlock on Minorities & Separate Electorates; Resumption of Civil Disobedience 1932 & Severe Government Repression; Communal Award Aug 1932 / Ramsay MacDonald - Separate Electorates for Depressed Classes; Gandhi's Fast unto Death in Yerwada Jail & Poona Pact Sept 1932 / Gandhi & Dr. B.R. Ambedkar: Abandonment of Separate Electorates, Increase in Reserved Seats for Depressed Classes / from 71 to 147; Third Round Table Conference Nov–Dec 1932; Formal Withdrawal of Civil Disobedience Movement May 1934)

Constitutional Impasse, 1937 Elections & Pre-War Politics (1935–1939) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Government of India Act 1935 (White Paper on Constitutional Reforms 1933; Joint Select Committee Report; Salient Features - All-India Federation of British Provinces & Princely States / Never came into force due to princely non-accession, Provincial Autonomy replacing Dyarchy, Dyarchy at the Center / Reserved Subjects: Defense & External Affairs, Bicameralism in 6 Provinces, Federal Court 1937, Reserve Bank of India 1935, Federal / Provincial / Joint Public Service Commissions, Three Legislative Lists: Federal, Provincial, Concurrent; Residuary Powers to Governor-General)
- 1937 Provincial Elections & Congress Ministries (1937 Elections in 11 Provinces; Congress Formed Ministries in 8 Provinces - Madras, UP, Central Provinces, Bihar, Orissa, Bombay, NWFP, Assam; 28 Months of Congress Rule - Civil Liberties Restoration, Agrarian Relief & Tenancy Legislation, Labour Reforms, Primary Education / Wardha Scheme of Basic Education 1937, National Planning Committee 1938 / Subhash Chandra Bose President, Nehru Chairman; Resignation of Congress Ministries Oct–Nov 1939 over unilateral British declaration dragging India into World War II without consulting Indian leaders; Muslim League observes 'Day of Deliverance' 22 Dec 1939)
- Haripura, Tripuri Crisis & Forward Bloc (Haripura Congress Session 1938 - Subhash Chandra Bose elected President unopposed; Tripuri Congress Session 1939 - Bose defeats Gandhi's nominee Pattabhi Sitaramayya, Ideological Rift over Strategy against British, Pant Resolution, Resignation of Bose; Bose Founds All India Forward Bloc May 1939)

WWII, Cripps Mission, Quit India Movement & INA (1939–1945) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Wartime Offers & Deadlock (Muslim League's Lahore Resolution March 1940 / 'Pakistan Resolution' moved by Fazlul Huq; Linlithgow's August Offer 1940 - Dominion Status after War, Expansion of Viceroy's Council, Post-War Constituent Assembly, Minority Veto on Future Constitution / Rejected by Congress; Individual Satyagraha Oct 1940 / 'Delhi Chalo Satyagraha' - Limited Protest for Free Speech against War: Acharya Vinoba Bhave / 1st Satyagrahi, Jawaharlal Nehru / 2nd, Brahma Datt / 3rd; Cripps Mission March 1942 / Sir Stafford Cripps - Post-War Dominion Status, Constitution-Making Body with Princely State Nominees, Right of Provinces to Secede from Union / Rejected by Congress as 'Post-dated Cheque on a Crashing Bank', Rejected by Muslim League for not granting Pakistan explicitly)
- Quit India Movement / August Kranti 1942 (All India Congress Committee / AICC Session at Gowalia Tank Maidan Bombay 8 August 1942; Passing of Historic 'Quit India Resolution'; Gandhi's Mantra 'Do or Die' / Karo ya Maro; Launch of Operation Zero Hour by British on 9 August morning & Immediate Arrest of all Top Congress Leaders / Gandhi sent to Aga Khan Palace, CWC members to Ahmednagar Fort; Spontaneous Mass Uprisings & Attacks on Police Stations, Railway Tracks, Post Offices; Underground Leadership - Jayaprakash Narayan / Hazaribagh Jail Escape, Aruna Asaf Ali / Unfurling Flag at Gowalia Tank, Ram Manohar Lohia, Achyut Patwardhan, Sucheta Kripalani; Underground Radio Broadcasts - Usha Mehta & Babu Bhai Prasad; Parallel Governments / Prati Sarkars - Ballia UP / Chittu Pandey, Tamluk Bengal / Jatiya Sarkar & Matangini Hazra's Martyrdom, Satara Maharashtra / Prati Sarkar under Nana Patil & Y.B. Chavan; Ruthless Suppression by British - Machine Gunning from Air, Firing, Collective Fines; Severe Bengal Famine of 1943 - 3 Million Deaths due to British Denial Policy & War Inflation)
- Subhash Chandra Bose & Indian National Army / INA (Bose's House Arrest & Great Escape from Calcutta Jan 1941 / via Kabul & Moscow to Berlin; Foundation of Free India Center & Indian Legion in Germany; U-Boat Voyage to Tokyo 1943; Indian Independence League - Rash Behari Bose; Origin of INA / Azad Hind Fauj - Captain Mohan Singh & Indian POWs of Malayan Campaign 1942; Bose Takes Command of INA at Singapore July 1943; Slogans 'Delhi Chalo', 'Jai Hind', 'Give me blood, and I shall give you freedom'; Formation of Provisional Government of Free India / Arzi Hukumat-e-Azad Hind 21 Oct 1943; INA Brigades - Gandhi, Nehru, Azad, Subhash & Rani of Jhansi Women's Regiment / Captain Lakshmi Sahgal; Andaman & Nicobar Handed Over by Japanese / Renamed Shaheed & Swaraj Dweep; INA Imphal & Kohima Campaign 1944; Retreat & Death of Netaji in Taihoku Plane Crash 18 Aug 1945)

Post-War Nationalist Upsurge, Cabinet Mission & Independence (1945–1947) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Post-War Political Moves & Trials (C.R. Formula 1944 / Rajagopalachari Formula for Congress-League Cooperation & Gandhi-Jinnah Talks 1944; Desai-Liaquat Pact 1945; Wavell Plan & Simla Conference June 1945 - Proposed Reconstruction of Executive Council, Breakdown over Jinnah's Demand for Sole Right to Nominate Muslim Members; INA Trials at Red Fort Nov 1945 - Joint Trial of Prem Sahgal, Gurbaksh Singh Dhillon & Shah Nawaz Khan; INA Defense Committee - Bhulabhai Desai, Tej Bahadur Sapru, Asaf Ali, Jawaharlal Nehru; Nationwide Protests & Commutation of Sentences; Royal Indian Navy / RIN Mutiny 18–23 Feb 1946 - Ratings of HMIS Talwar Strike against Racial Discrimination, Low Quality Food & Abuse, B.C. Dutt, Spread to 78 Ships, Surrender on Advice of Sardar Patel & Jinnah; Royal Indian Air Force / RIAF & Army Strikes)
- Cabinet Mission Plan & Interim Government (British Prime Minister Clement Attlee's Historic Declaration 15 March 1946; Cabinet Mission Arrives March 1946 - Lord Pethick-Lawrence / Secretary of State, Sir Stafford Cripps, A.V. Alexander; Proposals - Rejection of Full Pakistan, Three-Tier Federal Structure: Center with Defense/Foreign Affairs/Communications, Three Groups of Provinces: Section A / Hindu Majority, Section B / Muslim Majority NW, Section C / Muslim Majority Bengal & Assam, Compulsory Grouping Clause, Constituent Assembly to be elected indirectly by Provincial Assemblies; Initial Acceptance by Congress & League; Nehru's Press Conference Statement on Grouping Sovereignty & Muslim League's Rejection; Direct Action Day 16 August 1946 called by Jinnah / Great Calcutta Killings & Communal Riots in Noakhali, Bihar, Punjab; Formation of Interim Government 2 Sept 1946 - Jawaharlal Nehru Vice-President, Muslim League joins later Oct 1946 with Liaquat Ali Khan as Finance Member; First Meeting of Constituent Assembly 9 Dec 1946 / Boycotted by Muslim League, Dr. Sachchidananda Sinha Temporary President, Dr. Rajendra Prasad Elected Permanent President 11 Dec 1946, Objectives Resolution by Nehru 13 Dec 1946)
- Partition & Transfer of Power (Attlee's Statement 20 Feb 1947 - British Departure from India by 30 June 1948, Appointment of Lord Mountbatten as Last Viceroy; Mountbatten Plan / 3rd June Plan 1947 - Principle of Partition of British India Accepted, Referendum in NWFP & Sylhet, Boundary Commission under Sir Cyril Radcliffe for Punjab & Bengal Partition, Date of Independence Advanced to 15 August 1947; Indian Independence Act 1947 Passed by British Parliament 18 July 1947 - Creation of Two Independent Dominions of India & Pakistan, Abolition of Office of Viceroy & Secretary of State, Lapse of British Paramountcy over Princely States; Midnight of 14–15 August 1947 - India Achieves Independence, Nehru's 'Tryst with Destiny' Speech; Horrors of Partition - Massive Migration, Communal Carnage, Refugee Crisis)

Post-Independence India `[UPSC: Mains-GS1] [KAS: Mains-GS1]`

- Integration of Princely States & Territorial Consolidation
- Linguistic Reorganisation of States & National Consolidation
- Tribal Integration, Border Policies & Regional Dynamics
- Planned Economy, Agrarian Reforms & Industrial Transformation
- Foreign Policy Architecture, Non-Alignment & Geopolitical Wars
- Democratic Crises, Social Movements & Economic Liberalisation (1975–1991)

Integration of Princely States & Territorial Consolidation `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Accession of 565 Princely States (Sardar Vallabhbhai Patel / Iron Man of India, V.P. Menon / Secretary Ministry of States; Three Instruments - Instrument of Accession / Defense, External Affairs, Communications; Standstill Agreement; Privy Purses Incentive; Seamless Accession of Majority States)
- Complex Accession Cases (Junagadh - Nawab's Flight to Pakistan, Formation of Arzi Hukumat / Samaldas Gandhi, Plebiscite Feb 1948 & Merger with India; Hyderabad - Nizam Mir Osman Ali Khan, Razakars Militia under Kasim Razvi, Internal Peasant Revolt in Telangana, Operation Polo / Police Action Sept 1948 & Accession; Jammu & Kashmir - Maharaja Hari Singh, Standstill Proposal, Pakistani Tribal Invasion / Operation Gulmarg Oct 1947, Maharaja Signs Instrument of Accession 26 Oct 1947, Indian Army Airlift, Indo-Pak War 1947–48, UN Ceasefire 1 Jan 1949, Article 370 Special Status)
- Territorial Consolidation of Enclaves (French Enclaves - Peaceful Transfer: Chandernagore 1949, De Facto Transfer of Pondicherry, Karaikal, Mahe, Yanam 1954, De Jure Treaty 1962; Portuguese Enclaves - Dadra & Nagar Haveli Liberated 1954; Operation Vijay Dec 1961 - Military Liberation of Goa, Daman & Diu; Merger of Sikkim 1975 - 35th & 36th Constitutional Amendment Acts)

Linguistic Reorganisation of States & National Consolidation `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Linguistic Demands & Commissions (Dhar Commission 1948 / Linguistic Provinces Commission - Recommended Administrative Convenience over Language; JVP Committee 1948 - Jawaharlal Nehru, Vallabhbhai Patel, Pattabhi Sitaramayya - Advised Postponing Linguistic Division; Potti Sreeramulu's 56-Day Fast unto Death & Creation of Andhra State Oct 1953 as First Linguistic State from Madras Presidency)
- States Reorganisation Commission & Implementation (Fazal Ali Commission 1953 - Members: Justice Fazal Ali, K.M. Panikkar, H.N. Kunzru; Rejection of 'One Language, One State' Theory, Acceptance of Linguistic Reorganisation with National Unity & Administrative Viability; States Reorganisation Act 1956 & 7th Constitutional Amendment Act 1956 - Creation of 14 States & 6 Union Territories; Subsequent Bifurcations - Bombay Reorganisation Act 1960 / Gujarat & Maharashtra, Nagaland 1963, Punjab Reorganisation Act 1966 / Punjab, Haryana, Chandigarh, Himachal Pradesh, North-Eastern Reorganisation Act 1971 / Manipur, Meghalaya, Tripura, Mizoram & Arunachal Pradesh 1987; Creation of Chhattisgarh, Uttarakhand, Jharkhand 2000; Telangana 2014; Jammu & Kashmir Reorganisation Act 2019)
- Official Language & National Integration (Constitutional Compromise / Munshi-Ayyangar Formula - Hindi in Devanagari Script as Official Language of Union, English as Associate Official Language for 15 Years; Anti-Hindi Agitations in Tamil Nadu 1965; Official Languages Act 1963 & 1967 Amendment - Indefinite Continuation of English alongside Hindi / Bilingual Policy)

Tribal Integration, Border Policies & Regional Dynamics `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Nehruvian Tribal Panchsheel & Integration (Jawaharlal Nehru & Verrier Elwin; Principles - Self-Development without Imposition, Respect for Tribal Land & Forest Rights, Training Indigenous Administrators, Non-over-administration, Evaluation by Human Character; Fifth Schedule / Tribal Advisory Councils & Sixth Schedule / Autonomous District Councils Architecture; Forest Rights & Displacement Issues)
- North-East Integration & Border Insurgency (Naga National Council / NNC - Angami Zapu Phizo, Naga Peace Accord 1975 / Shillong Accord; Mizo National Front / MNF - Pu Laldenga, Mizo Famine / Mautam 1959, Mizoram Peace Accord 1986; Assam Agitation 1979–1985 / AASU against Illegal Immigration, Signing of Historic Assam Accord 1985; Armed Forces Special Powers Act / AFSPA 1958)

Planned Economy, Agrarian Reforms & Industrial Transformation `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Planning Architecture & Five Year Plans (Setting up of Planning Commission March 1950 / Nehru Chairman; National Development Council / NDC 1952; 1st Five Year Plan 1951–56 / Harrod-Domar Model - Focus on Agriculture, Irrigation & Power: Bhakra Nangal, Hirakud, Damodar Valley Corporation; 2nd Five Year Plan 1956–61 / Nehru-Mahalanobis Strategy - Heavy Industrialisation, Capital Goods Production, Public Sector Dominance, Steel Plants: Rourkela, Bhilai, Durgapur; 3rd Five Year Plan 1961–66 & Plan Holiday 1966–69 due to Wars & Severe Droughts)
- Agrarian Reforms & Food Security (First Phase: Institutional Reforms - Abolition of Intermediaries / Zamindari Abolition Acts, Tenancy Reforms: Security of Tenure & Fair Rents, Land Ceiling Acts, Bhoodan & Gramdan Movement 1951 / Acharya Vinoba Bhave; Limitations of Land Reforms; Second Phase: Technological Revolution - Green Revolution Mid-1960s: High Yielding Variety / HYV Seeds of Wheat & Rice, Norman Borlaug & M.S. Swaminathan, Intensive Agricultural District Programme / IADP, Chemical Fertilizers, Tube-well Irrigation, MSP & Commission for Agricultural Costs and Prices / CACP, Food Corporation of India / FCI 1965; Operation Flood / White Revolution 1970 - Dr. Verghese Kurien, National Dairy Development Board / NDDB, Amul Cooperative Model)

Foreign Policy Architecture, Non-Alignment & Geopolitical Wars `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Foundations of Indian Foreign Policy (Anti-Imperialism, Anti-Apartheid, Peaceful Co-existence; Panchsheel / Five Principles of Peaceful Coexistence 1954 - Signed between Nehru & Zhou Enlai; Non-Aligned Movement / NAM - Bandung Conference 1955, First NAM Summit at Belgrade 1961: Nehru, Josip Broz Tito, Gamal Abdel Nasser, Kwame Nkrumah, Sukarno)
- Geopolitical Wars & Border Conflicts (Indo-China War 1962 - Aksai Chin & McMahon Line Disputes, Forward Policy, Chinese Incursion, Devastating Indian Setback, Resignation of V.K. Krishna Menon; Indo-Pak War 1965 - Operation Desert Hawk in Rann of Kutch, Operation Gibraltar in Kashmir, Lal Bahadur Shastri's Leadership 'Jai Jawan, Jai Kisan', Tashkent Agreement Jan 1966 mediated by USSR / Shastri's Sudden Demise; Indo-Pak War of 1971 & Liberation of Bangladesh - Operation Searchlight Genocide in East Pakistan, Mukti Bahini, Refugee Crisis, Indo-Soviet Treaty of Friendship and Cooperation August 1971, 13-Day War Dec 1971, Surrender of 93,000 Pakistani Troops under General Niazi to General Jagjit Singh Aurora, Shimla Agreement 1972 between Indira Gandhi & Zulfikar Ali Bhutto / Line of Control / LoC)
- Strategic Autonomy & Nuclear Programme (Dr. Homi J. Bhabha & Tata Institute of Fundamental Research; Three-Stage Nuclear Power Programme; Pokhran I / Operation Smiling Buddha May 1974 - Peaceful Nuclear Explosion / PNE; Creation of Nuclear Suppliers Group / NSG; Pokhran II / Operation Shakti May 1998 under Atal Bihari Vajpayee; Draft Nuclear Doctrine 1999 - No First Use / NFU, Credible Minimum Deterrent, Civilian Political Control; Kargil War May–July 1999 / Operation Vijay - Repelling Pakistani Intruders from Kargil, Dras & Batalik Sectors)

Democratic Crises, Social Movements & Economic Liberalisation (1975–1991) `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- The Emergency Era (1975–1977) (Context - Economic Hardship, High Inflation, Gujarat Navnirman Movement 1974, Bihar Movement / JP Movement under Jayaprakash Narayan: Call for 'Total Revolution' / Sampoorna Kranti, Railway Strike 1974 / George Fernandes, Allahabad High Court Verdict June 1975 / Justice Jagmohan Lal Sinha declaring Indira Gandhi's election invalid; Declaration of National Emergency on Grounds of 'Internal Disturbance' 25 June 1975 under Article 352; Suspension of Fundamental Rights, Censorship of Press, Jailing of Opposition Leaders; 42nd Constitutional Amendment Act 1976 / 'Mini Constitution'; 1977 General Elections - Total Defeat of Congress, First Non-Congress Government under Morarji Desai / Janata Party; 44th Constitutional Amendment Act 1978 - Safeguards against Emergency Abuse / 'Armed Rebellion' replaced 'Internal Disturbance', Article 20 & 21 non-suspendable)
- Social Movements & Political Realignments (Chipko Movement 1973 in Uttarakhand - Sunderlal Bahuguna, Gaura Devi, Chandi Prasad Bhatt; Silent Valley Movement in Kerala 1978; Narmada Bachao Andolan - Medha Patkar, Baba Amte; Farmers' Movements - Bharatiya Kisan Union / Mahendra Singh Tikait, Shetkari Sanghatana / Sharad Joshi; Mandal Commission Report Implementation 1990 by V.P. Singh Government - 27% Reservation for OBCs in Central Services, Anti-Reservation Protests, Supreme Court Indra Sawhney Judgment 1992 / 50% Ceiling on Reservations & Creamy Layer Concept)
- 1991 Economic Crisis & LPG Reforms (Balance of Payments Crisis 1991 - Forex Reserves depleted to 2 Weeks of Imports, Gulf War Oil Shock, Fiscal Profligacy, Pledging of Gold with Bank of England; P.V. Narasimha Rao Government & Finance Minister Dr. Manmohan Singh; Landmark Economic Reforms of 1991 - LPG Paradigm: Liberalisation / Abolition of Industrial Licensing / License-Raj, Privatisation / Disinvestment in PSUs, Globalisation / Rupee Devaluation, Tariff Reductions, Current Account Convertibility; Entry into WTO 1995)

World History `[UPSC: Mains-GS1]`

- Renaissance, Enlightenment & Scientific Revolution
- American Revolution & Creation of US Republic
- French Revolution & Napoleonic Era
- Industrial Revolution & Rise of Capitalism and Socialism
- 19th Century Nationalism & Unification of Italy and Germany
- Imperialism, Colonialism & Partition of Africa and Asia
- World War I & Russian Revolution
- Interwar Period, Great Depression & Rise of Fascism and Nazism
- World War II & Post-War International Order
- Cold War Era, Decolonisation & Disintegration of USSR

Renaissance, Enlightenment & Scientific Revolution `[UPSC: Mains-GS1]`

- Renaissance & Humanism (Fall of Constantinople 1453 to Ottoman Turks; Revival of Classical Greco-Roman Learning; Humanism - Petrarch / Father of Humanism, Boccaccio's Decameron, Machiavelli's The Prince; Renaissance Art & Architecture - Leonardo da Vinci: Mona Lisa & The Last Supper, Michelangelo: Sistine Chapel Ceiling & Statue of David, Raphael; Invention of Printing Press 1450 by Johannes Gutenberg; Vernacular Literature - Dante's Divine Comedy, Erasmus' In Praise of Folly, Shakespeare)
- Geographical Discoveries & Commercial Revolution (Motives - Gold, God, Glory; Maritime Pioneers - Prince Henry the Navigator, Bartolomeu Dias / Cape of Good Hope 1488, Christopher Columbus 1492 / New World, Vasco da Gama 1498 / India, Ferdinand Magellan / Circumnavigation 1519–22; Treaty of Tordesillas 1494; Commercial Revolution - Mercantilism, Joint-Stock Companies, Chartered Monopolies, Inflow of Bullion from Americas)
- Protestant Reformation & Counter-Reformation (Corruption in Roman Catholic Church - Sale of Indulgences & Simony; Martin Luther's 95 Theses 1517 at Wittenberg, Slogan 'Faith Alone', Diet of Worms 1521, Protestant Schism; John Calvin & Calvinism; English Reformation - King Henry VIII & Act of Supremacy 1534; Catholic Counter-Reformation - Council of Trent 1545–63, Society of Jesus / Jesuits founded by Ignatius of Loyola; Thirty Years' War 1618–1648 & Peace of Westphalia 1648 / Birth of Sovereign Nation-State System)
- Scientific Revolution & The Enlightenment (Scientific Breakthroughs - Nicolaus Copernicus / Heliocentric Model, Johannes Kepler / Laws of Planetary Motion, Galileo Galilei / Telescope & Trial by Inquisition, Isaac Newton / Principia Mathematica & Universal Gravitation, Francis Bacon / Empirical Method, Rene Descartes / Rationalism 'Cogito, ergo sum'; The Enlightenment Philosophers - John Locke / Two Treatises of Government: Natural Rights to Life, Liberty & Property; Voltaire / Freedom of Speech & Religious Tolerance; Montesquieu / Spirit of the Laws: Theory of Separation of Powers; Jean-Jacques Rousseau / The Social Contract: Popular Sovereignty & General Will; Denis Diderot / Encyclopedia; Cesare Beccaria / Crime & Punishment; Immanuel Kant / What is Enlightenment?)

American Revolution & Creation of US Republic `[UPSC: Mains-GS1]`

- Colonial Background & Causes of Revolution (Thirteen American Colonies; British Mercantilist Policies - Navigation Acts, Wool Act, Iron Act; French and Indian War / Seven Years' War 1756–63; Proclamation of 1763; British Tax Acts - Sugar Act 1764, Stamp Act 1765 / Slogan 'No Taxation without Representation', Declaratory Act 1766, Townshend Acts 1767; Boston Massacre 1770; Tea Act 1773 & Boston Tea Party Dec 1773 / Sons of Liberty; Coercive Acts / Intolerable Acts 1774)
- Revolutionary War & Declaration of Independence (First Continental Congress 1774 in Philadelphia; Outbreak of War 1775 - Battles of Lexington and Concord; Second Continental Congress 1775 - George Washington appointed Commander-in-Chief; Thomas Paine's Pamphlet 'Common Sense'; Adoption of Declaration of Independence 4 July 1776 / Drafted by Thomas Jefferson: Inalienable Rights to Life, Liberty and Pursuit of Happiness; Turning Point - Battle of Saratoga 1777 & French Alliance under Lafayette; Siege of Yorktown 1781 / Surrender of Lord Cornwallis; Treaty of Paris 1783 - British Recognition of Independence of United States)
- US Constitution & Global Significance (Articles of Confederation & Weaknesses; Philadelphia Constitutional Convention 1787 - Federal Structure, Great Compromise, Separation of Powers & Checks and Balances; Federalist Papers - Alexander Hamilton, James Madison, John Jay; US Constitution Enacted 1789; Bill of Rights 1791 / First 10 Amendments guaranteeing Fundamental Liberties; Global Impact - Inspiration for French Revolution, Anti-colonial Movements in Latin America, First Modern Democratic Constitutional Republic)

French Revolution & Napoleonic Era `[UPSC: Mains-GS1]`

- Causes of the French Revolution (Social Injustice - Ancien Regime / Three Estates System: First Estate / Clergy: 1% population, 10% land, Tax Exempt; Second Estate / Nobility: 2% population, 25% land, Tax Exempt; Third Estate / Commoners, Peasantry, Bourgeoisie: 97% population, Bearing all Taxes / Taille, Tithe, Gabelle, Corvee; Economic Bankruptcy - Extravagance of Versailles, War Debts from Seven Years' War & American Revolution, Crop Failures & Bread Riots 1788–89; Incompetence of Louis XVI & Marie Antoinette; Intellectual Ferment - Ideas of Voltaire, Montesquieu, Rousseau)
- Outbreak & Constitutional Phase (1789–1792) (Summoning of Estates-General at Versailles May 1789; Deadlock over Voting System; Formation of National Assembly by Third Estate 17 June 1789; Tennis Court Oath 20 June 1789 / Vow not to separate until Constitution is drafted; Storming of the Bastille Prison 14 July 1789 / Symbol of Despotism; Great Fear in Countryside; National Assembly Decrees 4 August 1789 / Abolition of Feudalism & Serfdom; Adoption of 'Declaration of the Rights of Man and of the Citizen' 26 August 1789 - Slogan 'Liberty, Equality, Fraternity'; Women's March on Versailles Oct 1789; Civil Constitution of the Clergy 1790; Constitution of 1791 / Constitutional Monarchy; Flight to Varennes June 1791)
- Radical Phase: Reign of Terror & Republic (1792–1794) (Outbreak of Revolutionary Wars against Austria & Prussia 1792; Declaration of Pillnitz; Rise of Political Clubs - Jacobins / Radicals under Maximilien Robespierre, Danton & Marat vs Girondins / Moderates; Attack on Tuileries Palace 10 August 1792; September Massacres; National Convention Proclaims First French Republic 21 Sept 1792; Trial & Execution of Louis XVI by Guillotine Jan 1793 & Marie Antoinette Oct 1793; Committee of Public Safety & Reign of Terror 1793–1794 - Law of Suspects, Guillotining of 40,000 Counter-revolutionaries, De-Christianisation Campaign & Cult of Supreme Being; Thermidorian Reaction July 1794 - Fall & Execution of Robespierre; The Directory 1795–1799 / Five-member Executive & Widespread Inefficiency)
- Rise of Napoleon Bonaparte & Imperial Era (1799–1815) (Coup of 18 Brumaire Nov 1799 - Napoleon Overthrows Directory, Establishes The Consulate / First Consul; Proclamation of French Empire 1804 & Napoleon Crowns Himself Emperor; Napoleonic Reforms - Napoleonic Code / Civil Code of 1804: Equality before Law, Abolition of Feudal Privileges, Protection of Property Rights; Concordat of 1801 with Pope; Bank of France 1800; Lycees Educational System; Legion of Honour; Napoleonic Wars - Battle of Austerlitz 1805 / Battle of Three Emperors, Battle of Jena 1806, Defeat at Sea in Battle of Trafalgar 1805 by Admiral Nelson; Continental System 1806 / Economic Blockade of Britain through Berlin & Milan Decrees; Downfall - Peninsular War in Spain 1808–14 / Spanish Ulcer, Disastrous Russian Campaign 1812 / Scorched Earth Policy & Winter Retreat, Battle of Leipzig / Battle of Nations 1813; Abdication & Exile to Elba 1814; Hundred Days Return 1815 & Final Defeat at Battle of Waterloo 18 June 1815 by Duke of Wellington & Blucher; Exile & Death at Saint Helena 1821)
- Congress of Vienna 1815 & Concert of Europe (Congress of Vienna 1815 - Prince Klemens von Metternich of Austria, Tsar Alexander I of Russia, Lord Castlereagh of Britain, Talleyrand of France; Guiding Principles - Balance of Power, Legitimacy / Restoration of Bourbon Monarchy in France under Louis XVIII, Containment of France; Holy Alliance & Quadruple Alliance; Metternich System / Suppression of Liberalism & Nationalism across Europe)

Industrial Revolution & Rise of Capitalism and Socialism `[UPSC: Mains-GS1]`

- Origins & Technology of Industrial Revolution (Agricultural Revolution in Britain - Enclosure Acts, Crop Rotation / Townshend, Jethro Tull's Seed Drill; Why Britain First? - Abundance of Coal & Iron Ore, Capital Accumulation from Colonial Trade, Stable Parliamentary Government, Naval Supremacy, Free Domestic Market; Key Inventions: Textile Sector - Flying Shuttle / John Kay 1733, Spinning Jenny / James Hargreaves 1764, Water Frame / Richard Arkwright 1769, Power Loom / Edmund Cartwright 1785, Cotton Gin / Eli Whitney 1793; Power & Metallurgy - Steam Engine / Thomas Newcomen & James Watt 1769, Puddling Process for Wrought Iron / Henry Cort, Bessemer Steel Process 1856; Transport & Communications - Macadamised Roads, Canals / Bridgewater Canal, Steam Locomotives / George Stephenson's Rocket 1829, Steamships / Robert Fulton, Electric Telegraph / Samuel Morse 1844; Second Industrial Revolution / Electricity, Chemical Industries, Petroleum, Internal Combustion Engine, Assembly Line / Henry Ford)
- Socio-Economic Transformations & Consequences (Rise of Factory System; Massive Urbanisation - Growth of Industrial Cities: Manchester, Birmingham, Leeds, Overcrowded Slums, Sanitation Crises, Cholera Outbreaks; Exploitation of Working Class - 14–16 Hour Workdays, Hazardous Working Conditions, Rampant Child & Female Labour; Disruption of Traditional Cottage Industries; Emergence of Distinct Class Structure - Industrial Bourgeoisie / Capitalists vs Proletariat / Industrial Working Class)
- Rise of Economic Ideologies: Capitalism to Marxism (Classical Capitalism / Laissez-Faire - Adam Smith: 'Wealth of Nations' 1776, Invisible Hand, Free Market Economy; Thomas Malthus / Essay on Population; David Ricardo / Iron Law of Wages; Early Resistance - Luddite Movement 1811–1816 / Smashing of Textile Machines, Peterloo Massacre 1819; Working Class Legislation - Factory Acts 1833 & Mines Act 1842 in Britain; Chartism Movement 1838–1848 / People's Charter demanding Universal Male Suffrage & Secret Ballot; Utopian Socialism - Robert Owen / New Lanark Cooperative Experiments, Claude Henri de Saint-Simon, Charles Fourier; Scientific Socialism & Marxism - Karl Marx & Friedrich Engels: 'The Communist Manifesto' 1848, 'Das Kapital' 1867, Historical Materialism, Theory of Surplus Value, Class Struggle / 'Workers of the world unite; you have nothing to lose but your chains', Dictatorship of the Proletariat & Stateless Communist Society; First International 1864 & Second International 1889)

19th Century Nationalism & Unification of Italy and Germany `[UPSC: Mains-GS1]`

- Revolutionary Waves in Europe (Revolutions of 1820 - Spain, Portugal, Naples, Greek War of Independence 1821–1832 / Treaty of Constantinople; Revolutions of 1830 / July Revolution in France: Overthrow of Charles X & Rise of Citizen King Louis Philippe, Belgian Independence; Revolutions of 1848 / 'Spring of Nations' - February Revolution in France / Fall of Monarchy & Creation of Second Republic under Louis Napoleon / Napoleon III, Revolutions in Austrian Empire / Fall of Metternich, Frankfurt Parliament in Germany / Attempt to create Unified Democratic Germany)
- Unification of Italy / Risorgimento (Fragmented Italy - Austrian Control of Lombardy & Venetia, Kingdom of Sardinia-Piedmont under House of Savoy, Papal States, Kingdom of Two Sicilies under Bourbons; Four Pillars of Italian Unification: Giuseppe Mazzini / The Soul - Young Italy 1831, Republican Vision; Count Camillo di Cavour / The Brain - Prime Minister of Sardinia-Piedmont, Modernisation, French Alliance with Napoleon III / Plombieres Agreement 1858, Austro-Sardinian War 1859 / Annexation of Lombardy; Giuseppe Garibaldi / The Sword - Red Shirts Expedition of the Thousand 1860, Conquest of Two Sicilies / Naples & Sicily, Handover of Territory to King Victor Emmanuel II; King Victor Emmanuel II / The Body - Proclaimed King of United Italy 1861; Annexation of Venetia 1866 via Austro-Prussian War; Annexation of Rome 1870 via Franco-Prussian War / Rome declared Capital of Italy)
- Unification of Germany (Fragmented German Confederation / 39 States under Austrian Dominance; Economic Foundation - Zollverein 1834 / Prussian-led Customs Union excluding Austria; Otto von Bismarck / Iron Chancellor of Prussia under King Wilhelm I - Policy of 'Blood and Iron' / Slogan 'The great questions of the day will not be settled by speeches and majority decisions, but by iron and blood', Rejection of Liberalism; Three Wars of German Unification: Danish War 1864 - Prussia & Austria defeat Denmark / Annexation of Schleswig & Holstein; Austro-Prussian War / Seven Weeks' War 1866 - Prussian Victory at Battle of Sadowa / Koniggratz, Treaty of Prague, Dissolution of German Confederation & Creation of North German Confederation under Prussian Leadership; Franco-Prussian War 1870–71 - Ems Telegram, Decisive Prussian Victory at Battle of Sedan 1870, Capture of Napoleon III, Siege of Paris; Proclamation of German Empire / Second Reich 18 Jan 1871 in Hall of Mirrors at Versailles, King Wilhelm I Crowned Kaiser, Treaty of Frankfurt May 1871 - French Cession of Alsace and Lorraine to Germany)

Imperialism, Colonialism & Partition of Africa and Asia `[UPSC: Mains-GS1]`

- Age of Imperialism: Motives & Mechanisms (Old Colonialism / 16th–18th Century Trade Enclaves vs New Imperialism / 1870–1914 Territorial Conquest; Driving Forces - Industrial Capitalism / Search for Guaranteed Raw Material Sources & Captive Consumer Markets, Capital Export / Surplus Capital Investments, Geopolitical Rivalry & Naval Bases, Strategic Control of Chokepoints, Social Darwinism & Racial Superiority Theories / Rudyard Kipling's 'White Man's Burden', Christian Missionary Zeal)
- Scramble for Africa (1880–1914) (Dark Continent Exploration - David Livingstone & Henry Morton Stanley; King Leopold II of Belgium & Brutal Exploitation of Congo Free State / Rubber & Ivory Atrocities; Berlin West Africa Conference 1884–85 / Otto von Bismarck: Principle of 'Effective Occupation' & Carve-up of African Continent without African representation; British Empire in Africa - Cecil Rhodes / 'Cape to Cairo' Dream, Anglo-Zulu War 1879, Boer Wars 1880–1902 / Treaty of Vereeniging, British Control of Egypt & Suez Canal 1882, Sudan / Battle of Omdurman 1898, Fashoda Incident 1898; French Empire in Africa - West Africa, Equatorial Africa, Algeria, Madagascar; German Colonies - German East Africa, German South-West Africa / Herero Genocide; Italian Attempts - Defeat at Battle of Adwa 1896 by Ethiopia / Only Independent African States: Ethiopia & Liberia)
- Imperialism in Asia & Breakdown of Traditional Empires (Imperialism in China - Qing / Manchu Dynasty; Canton System; Opium Trade & British Smuggling; First Opium War 1839–1842 - Commissioner Lin Zexu, Treaty of Nanking 1842: Cession of Hong Kong, Opening of Five Treaty Ports, Extraterritorial Rights; Second Opium War 1856–1860 - Burning of Summer Palace, Treaty of Tientsin; Spheres of Influence & 'Carving of the Chinese Melon' by Britain, France, Germany, Russia, Japan; US Open Door Policy 1899 / John Hay; Internal Crises - Taiping Rebellion 1850–64 / Hong Xiuquan, Boxer Rebellion 1899–1901 / Anti-foreign Society of Righteous and Harmonious Fists crushed by Eight-Nation Alliance; Chinese Revolution of 1911 - Dr. Sun Yat-sen, Three Principles of the People / Nationalism, Democracy, Livelihood, Overthrow of Qing Dynasty & Proclamation of Republic of China 1912; Colonisation of Southeast Asia - French Indochina / Vietnam, Cambodia, Laos, Dutch East Indies / Indonesia, British Malaya & Burma, Spanish-American War 1898 & US Colonisation of Philippines; Modernisation of Japan - Commodore Perry's Black Ships 1853, Meiji Restoration 1868: Abolition of Feudalism / Samurai Class, Rapid Industrialisation & Westernisation, First Sino-Japanese War 1894–95 / Treaty of Shimonoseki, Russo-Japanese War 1904–05 / Battle of Tsushima: First Victory of Asian Power over European Empire, Treaty of Portsmouth 1905, Annexation of Korea 1910)

World War I & Russian Revolution `[UPSC: Mains-GS1]`

- Causes of World War I (M-A-I-N Framework: Militarism - Anglo-German Naval Race, Conscription Armies; Alliances System - Bismarck's Web of Treaties, Triple Alliance 1882: Germany, Austria-Hungary, Italy vs Triple Entente 1907: Britain, France, Russia; Imperialism & Colonial Clashes - Moroccan Crises 1905 & 1911; Extreme Nationalism - Pan-Slavism, Revanchism / French desire for Alsace-Lorraine; Balkan Powder Keg - Annexation of Bosnia-Herzegovina 1908 by Austria, Balkan Wars 1912–1913; Immediate Trigger - Assassination of Archduke Franz Ferdinand of Austria and his wife Sophie at Sarajevo 28 June 1914 by Gavrilo Princip / Serbian Black Hand; Blank Cheque Assurance from Germany to Austria, Austro-Hungarian Ultimatum to Serbia, July Crisis 1914 & Outbreak of War)
- Course of the Great War (Schlieffen Plan & German Invasion of Belgium; Battle of the Marne 1914 - Miracle of the Marne; Deadlock & Trench Warfare on Western Front; Major Battles - Battle of Verdun 1916 / 'They shall not pass', Battle of the Somme 1916 / Tanks First Used, Battle of Passchendaele 1917; Eastern Front - Battle of Tannenberg 1914, Russian Collapses; Gallipoli Campaign 1915 - Allied Defeat against Ottoman Empire under Mustafa Kemal; War at Sea - Battle of Jutland 1916, Unrestricted German Submarine Warfare / U-Boats, Sinking of Lusitania 1915; New Technologies of Warfare - Machine Guns, Poison Gas / Chlorine & Mustard Gas, Fighter Airplanes, Submarines, Tanks; Global Dimensions - Middle Eastern Front / Lawrence of Arabia, Balfour Declaration 1917, Indian Troops in WWI; Turning Points - Entry of United States into War April 1917 / Zimmermann Telegram, Russian Exit from War Post-Bolshevik Revolution / Treaty of Brest-Litovsk March 1918; German Spring Offensive 1918 & Allied Hundred Days Counter-Offensive; Collapse of Central Powers & Abdication of Kaiser Wilhelm II; Armistice Signed 11 November 1918)
- Russian Revolutions of 1917 & Soviet State (Autocratic Rule of Romanov Dynasty / Tsar Nicholas II & Tsarina Alexandra, Rasputin's Malign Influence; Socio-Economic Hardship, Agrarian Poverty, Landless Peasantry, Exploited Factory Workers; Bloody Sunday Massacre Jan 1905 & 1905 Revolution / Creation of State Duma; Devastating Russian Disasters in WWI / 2 Million Casualties, Food Shortages; February / March Revolution 1917 - Bread Riots & Strike in Petrograd, Mutiny of Soldiers, Abdication of Tsar Nicholas II; Establishment of Provisional Government under Prince Lvov & Alexander Kerensky; Emergence of Dual Power / Petrograd Soviet of Workers' and Soldiers' Deputies; Return of Vladimir Lenin from Exile / 'April Theses': Slogan 'All Power to the Soviets', 'Peace, Land and Bread'; Kornilov Affair; October / November Revolution 1917 - Red Guards under Leon Trotsky Seize Petrograd, Storming of Winter Palace, Overthrow of Provisional Government, Proclamation of Soviet Power; Early Bolshevik Decrees - Decree on Land, Decree on Peace; Dissolution of Constituent Assembly; Treaty of Brest-Litovsk 1918; Russian Civil War 1918–1921 - Red Army / Trotsky vs White Army / Monarchists, Liberals, Foreign Interventionist Troops; War Communism & Red Terror; Kronstadt Rebellion 1921; New Economic Policy / NEP 1921 - Reintroduction of Limited Private Trade; Formation of USSR / Union of Soviet Socialist Republics 1922; Death of Lenin 1924 & Rise of Joseph Stalin - Elimination of Trotsky, Slogan 'Socialism in One Country', Five Year Plans / Rapid Industrialisation, Forced Collectivisation of Agriculture / Liquidation of Kulaks, Great Purges & Gulag System)
- Paris Peace Conference & Treaties of 1919 (Big Four - Woodrow Wilson / USA, David Lloyd George / Britain, Georges Clemenceau / France, Vittorio Orlando / Italy; Woodrow Wilson's Fourteen Points - Self-Determination, Freedom of the Seas, League of Nations; Treaty of Versailles with Germany 28 June 1919 - War Guilt Clause / Article 231, Loss of All Colonies, Cession of Alsace-Lorraine to France, Demilitarisation of Rhineland, Saar Coalfields to France for 15 Years, German Military Capped at 100,000 Troops, No Tanks, No Air Force, No Submarines, Astronomical Reparations / £6.6 Billion; Other Treaties - Treaty of Saint-Germain / Austria, Treaty of Trianon / Hungary, Treaty of Neuilly / Bulgaria, Treaty of Sevres 1920 / Ottoman Empire replaced by Treaty of Lausanne 1923 after Mustafa Kemal Ataturk's Turkish War of Independence; League of Nations Created 1920 - Headquarters at Geneva, Assembly, Council, Permanent Court of International Justice, Mandate System; Structural Flaws - US Non-Membership / Senate Rejection, Exclusion of USSR & Germany initially, Absence of Enforcement Army)

Interwar Period, Great Depression & Rise of Fascism and Nazism `[UPSC: Mains-GS1]`

- The Great Depression & Economic Collapse (1929–1939) (Roaring Twenties & US Economic Boom; Overproduction in Agriculture & Industry, Speculation on Wall Street; Wall Street Crash / Black Tuesday 29 October 1929; Banking Panics, Global Credit Freeze, Collapse of World Trade by 66%; Mass Unemployment / 25% in USA, 33% in Germany; Dust Bowl Crisis; Socio-Political Fallout - Rise of Extremist Ideologies, Destruction of Democratic Centrist Coalitions; Policy Responses - Protectionism / Smoot-Hawley Tariff Act 1930, Keynesian Deficit Financing / John Maynard Keynes' General Theory 1936, Franklin D. Roosevelt's 'New Deal' 1933 - Relief, Recovery, Reform: CCC, TVA, Social Security Act 1935)
- Rise of Fascism in Italy (Post-WWI Italian Frustration / 'Mutilated Victory' - Lack of Territorial Gains at Versailles / Fiume Crisis; Post-war Economic Turmoil, Inflation, Unemployment, Peasant Land Seizures, Red Biennium / Biennio Rosso 1919–20; Benito Mussolini & Founding of National Fascist Party 1921; Blackshirts Militia / Squadristi; March on Rome Oct 1922 - King Victor Emmanuel III Invites Mussolini to Form Government; Murder of Socialist Leader Giacomo Matteotti 1924; Establishment of Totalitarian Dictatorship / Il Duce - Acerbo Law, Banning Opposition Parties, OVRA Secret Police, Censorship, Corporate State; Lateran Accords 1929 with Roman Catholic Church / Vatican Sovereignty; Aggressive Foreign Policy - Invasion of Abyssinia / Ethiopia 1935 / Use of Mustard Gas, Rome-Berlin Axis 1936, Annexation of Albania 1939)
- Rise of Nazism & Totalitarian Third Reich in Germany (Weaknesses of Weimar Republic 1919–1933 - 'Stab in the Back' / Dolchstosslegende Myth, Rejection of Versailles Diktat, Hyperinflation Crisis 1923 / French Occupation of Ruhr; Adolf Hitler & National Socialist German Workers' Party / NSDAP; Munich Beer Hall Putsch 1923 & Hitler's Imprisonment / Writing of 'Mein Kampf' - Aryan Master Race / Herrenvolk, Anti-Semitism, Anti-Marxism, Quest for Lebensraum / Living Space in the East; Electoral Breakthrough during Great Depression; Appointment of Hitler as Chancellor 30 Jan 1933 by President Paul von Hindenburg; Reichstag Fire Feb 1933 & Reichstag Fire Decree; Enabling Act March 1933 / Dictatorial Powers; Gleichschaltung / Total Nazification of Society; Night of the Long Knives June 1934 / Purge of SA under Ernst Rohm; SS under Heinrich Himmler & Gestapo; Joseph Goebbels & Ministry of Public Enlightenment and Propaganda; Anti-Semitic Persecution - Nuremberg Laws 1935 / Stripping Jews of Citizenship, Kristallnacht / Night of Broken Glass Nov 1938, Concentration Camps / Dachau)
- Breakdown of Collective Security & Drift to War (Japanese Aggression - Mukden Incident 1931, Invasion of Manchuria & Establishment of Puppet State Manchukuo, League of Nations Lytton Report & Japan's Walkout 1933, Second Sino-Japanese War 1937, Nanking Massacre; German Rearmament - Hitler Repudiates Versailles Treaty 1935, Anglo-German Naval Agreement 1935, Remilitarisation of the Rhineland 1936; Spanish Civil War 1936–1939 - Republican Government vs Nationalist Rebels under General Francisco Franco, Foreign Intervention: Axis Support / Condor Legion Bombing of Guernica vs Soviet & International Brigades Support, Victory of Franco's Fascist Dictatorship; British & French Policy of Appeasement - Neville Chamberlain; Anschluss with Austria March 1938; Sudetenland Crisis & Munich Agreement Sept 1938 - Betrayal of Czechoslovakia / 'Peace for our time'; Complete Dismemberment of Czechoslovakia March 1939; British & French Guarantees to Poland; Nazi-Soviet Non-Aggression Pact / Molotov-Ribbentrop Pact August 1939 - Secret Protocol for Partition of Poland)

World War II & Post-War International Order `[UPSC: Mains-GS1]`

- Outbreak & Blitzkrieg Across Europe (1939–1941) (German Invasion of Poland 1 Sept 1939 / Blitzkrieg / Lightning War; Britain & France Declare War on Germany 3 Sept 1939; Soviet Invasion of Eastern Poland & Winter War against Finland; Phoney War 1939–40; German Invasions of Denmark & Norway April 1940; Blitzkrieg in the West May 1940 - Invasion of Low Countries / Netherlands, Belgium & France, Fall of France June 1940, Miracle of Dunkirk Evacuation / Operation Dynamo, Establishment of Vichy France under Marshal Petain, Free French Movement under General Charles de Gaulle; Battle of Britain July–Oct 1940 - German Luftwaffe vs RAF / Radar Technology, Winston Churchill's Leadership 'Never in the field of human conflict was so much owed by so many to so few', The Blitz; German Invasion of Balkans & Greece April 1941; Operation Barbarossa 22 June 1941 - German Invasion of Soviet Union / Largest Land Invasion in History, Sieges of Leningrad & Moscow)
- The Pacific War & The Turning Points (1941–1943) (Japanese Expansionism & US Oil Embargo; Japanese Surprise Attack on Pearl Harbor 7 Dec 1941 / 'A date which will live in infamy'; US Entry into WWII; Japanese Conquest of Southeast Asia - Fall of Singapore, Philippines / Bataan Death March, Burma; Atlantic Charter August 1941 / Roosevelt & Churchill; Turning Points of the War: Pacific - Battle of Midway June 1942 / Decisive US Naval Victory, Island Hopping Campaign; North Africa - Battle of El Alamein Oct–Nov 1942 / Montgomery Defeats Rommel's Afrika Korps, Operation Torch; Eastern Front - Battle of Stalingrad August 1942–Feb 1943 / Catastrophic German Defeat & Surrender of 6th Army under Paulus, Battle of Kursk July 1943 / Largest Tank Battle in History)
- Allied Counter-Offensives & Defeat of Axis (1943–1945) (Allied Invasion of Sicily & Italy July 1943 - Fall of Mussolini; Tehran Conference Nov 1943 / First Meeting of Big Three - Roosevelt, Churchill, Stalin; D-Day Normandy Landings 6 June 1944 / Operation Overlord - Allied Landings on Five Beaches under General Dwight D. Eisenhower, Liberation of Paris August 1944; Battle of the Bulge Dec 1944; Soviet Advance through Eastern Europe / Operation Bagration; Yalta Conference Feb 1945 - Division of Germany into 4 Occupation Zones, Free Elections in Eastern Europe Pledge, Soviet Agreement to enter Pacific War, UN Voting Formula; Fall of Berlin April–May 1945, Suicide of Hitler 30 April 1945, V-E Day / Victory in Europe 8 May 1945; Potsdam Conference July–August 1945 - Truman, Attlee, Stalin: Potsdam Declaration Demanding Unconditional Japanese Surrender; The Holocaust / Shoah - Systematic Murder of 6 Million Jews & Millions of Others, Wannsee Conference 1942 / Final Solution, Extermination Camps: Auschwitz-Birkenau, Treblinka, Sobibor; Nuremberg Trials 1945–46 & Tokyo War Crimes Trials / Crimes against Humanity; Pacific Denouement - Battles of Iwo Jima & Okinawa, Manhattan Project / J. Robert Oppenheimer, Atomic Bombings of Hiroshima / Little Boy 6 August 1945 & Nagasaki / Fat Man 9 August 1945, Soviet Declaration of War on Japan, Surrender of Japan on USS Missouri 2 Sept 1945 / V-J Day)
- Post-War Architecture & Founding of the United Nations (Human & Economic Cost of WWII / 70+ Million Dead; Demise of European Global Dominance; Emergence of Two Superpowers - USA & USSR; Dumbarton Oaks Conference 1944 & San Francisco Conference April–June 1945; Signing of UN Charter 26 June 1945 / Effective 24 Oct 1945; Key Organs - General Assembly, Security Council / P5 with Veto: USA, USSR, UK, France, China, Economic and Social Council / ECOSOC, International Court of Justice / ICJ, Secretariat, Trusteeship Council; Universal Declaration of Human Rights / UDHR 10 Dec 1948 drafted by Eleanor Roosevelt; Bretton Woods Conference 1944 - Creation of International Monetary Fund / IMF & World Bank / IBRD, General Agreement on Tariffs and Trade / GATT 1947)

Cold War Era, Decolonisation & Disintegration of USSR `[UPSC: Mains-GS1]`

- Emergence of the Cold War (1945–1953) (Ideological Divide - Democratic Capitalism vs Authoritarian Communism; Churchill's 'Iron Curtain' Speech 1946 at Fulton Missouri; Soviet Expansion in Eastern Europe / Satellite States - Poland, East Germany, Hungary, Czechoslovakia, Romania, Bulgaria; US Containment Policy - George F. Kennan's 'Long Telegram' 1946 & 'X' Article; Truman Doctrine 1947 / Financial & Military Aid to Greece & Turkey to resist Communism; Marshall Plan 1947 / European Recovery Programme; Soviet Response - Cominform 1947 & Comecon 1949; First Cold War Flashpoint - Berlin Blockade & Berlin Airlift 1948–49; Partition of Germany 1949 - Federal Republic of Germany / FRG / West Germany vs German Democratic Republic / GDR / East Germany; Military Blocs - North Atlantic Treaty Organisation / NATO 1949 vs Warsaw Pact 1955; Nuclear Arms Race - Soviet Atomic Bomb 1949, Hydrogen Bombs 1952/53; Chinese Communist Revolution 1949 - Mao Zedong Proclaims People's Republic of China / PRC, Chiang Kai-shek Flees to Taiwan; Korean War 1950–1953 - North Korean Invasion across 38th Parallel, UN Intervention under Douglas MacArthur, Chinese Intervention, Armistice 1953 / DMZ)
- Cold War Crises & Nuclear Brinkmanship (1953–1979) (Nikita Khrushchev & De-Stalinisation / 'Secret Speech' 1956, Doctrine of 'Peaceful Coexistence'; Hungarian Uprising 1956 Crushed by Soviet Tanks; Suez Crisis 1956 - Nasser Nationalises Canal, Anglo-French-Israeli Invasion Halted by US/Soviet Pressure; Space Race - Soviet Launch of Sputnik 1957 & Yuri Gagarin 1961, US Apollo 11 Moon Landing 1969 / Neil Armstrong; U-2 Spy Plane Incident 1960; Construction of Berlin Wall August 1961 / Checkpoint Charlie; Cuban Missile Crisis Oct 1962 - Fidel Castro's Communist Cuba, Bay of Pigs 1961, Soviet Nuclear Missiles in Cuba, US Naval Quarantine / John F. Kennedy vs Khrushchev, Brink of Nuclear War, Removal of Missiles in exchange for US pledge not to invade Cuba & Secret Removal of Jupiter Missiles from Turkey, Installation of Moscow-Washington Hotline & Partial Test Ban Treaty / PTBT 1963; Vietnam War 1955–1975 - Domino Theory, Gulf of Tonkin Resolution 1964, Viet Cong Guerrilla Warfare / Ho Chi Minh, Tet Offensive 1968, US Anti-War Protests, Fall of Saigon 1975 & Communist Unification of Vietnam; Prague Spring 1968 in Czechoslovakia - Alexander Dubcek / 'Socialism with a human face', Warsaw Pact Invasion, Brezhnev Doctrine; Era of Detente 1970s - US-China Rapprochement 1972 / Nixon Visits China, Strategic Arms Limitation Talks / SALT I 1972 & SALT II 1979, Helsinki Accords 1975; Middle East Flashpoints - Six-Day War 1967, Yom Kippur War 1973 & OPEC Oil Embargo, Camp David Accords 1978, Iranian Islamic Revolution 1979 / Ayatollah Khomeini, Soviet Invasion of Afghanistan Dec 1979 / End of Detente & US Support for Mujahideen)
- Global Decolonisation Movement (Decolonisation Wave across Asia & Africa; South & Southeast Asia - Independence of India & Pakistan 1947, Burma & Ceylon 1948, Indonesian National Revolution 1945–49 against Dutch / Sukarno, First Indochina War 1946–54 / Battle of Dien Bien Phu & Geneva Accords 1954; Africa - Year of Africa 1960 / 17 Nations Gain Independence, Ghana Independence 1957 / Kwame Nkrumah, Kenyan Mau Mau Rebellion & Independence 1963 / Jomo Kenyatta, Algerian War of Independence 1954–1962 / FLN vs France, Evian Accords, Congo Crisis 1960 / Patrice Lumumba Assassination, Portuguese Colonial War & Independence of Angola and Mozambique 1975; Dismantling of Apartheid in South Africa - Nelson Mandela, African National Congress / ANC, Sharpeville Massacre 1960, Soweto Uprising 1976, Release of Mandela 1990 & First Multiracial Elections 1994; Rise of Third World & Non-Aligned Movement - Bandung Conference 1955, Belgrade Conference 1961)
- Disintegration of the Soviet Union & End of Cold War (1980–1991) (Stagnant Soviet Economy / Brezhnev Era Stagnation, Massive Military Burden, Afghan War Quagmire; Ronald Reagan's Strategic Defense Initiative / SDI / 'Star Wars', Reagan-Gorbachev Summits / Geneva, Reykjavik, Washington; Mikhail Gorbachev becomes General Secretary 1985; Reform Policies - Glasnost / Political Openness, Freedom of Speech and Media, Perestroika / Economic Restructuring, Decentralisation, Democratizatsiya; Repeal of Brezhnev Doctrine / Sinatra Doctrine / Allowing Eastern Bloc Countries to Choose their own Path; Fall of Communism in Eastern Europe 1989 - Solidarity Movement in Poland / Lech Walesa, Peaceful Velvet Revolution in Czechoslovakia / Vaclav Havel, Overthrow of Ceaușescu in Romania; Fall of the Berlin Wall 9 November 1989 & German Reunification 3 October 1990; Nationalist Uprisings within USSR - Baltic States / Lithuania, Latvia, Estonia declare Independence 1990; Failed August Coup 1991 by Communist Hardliners, Boris Yeltsin's Resistance; Belavezha Accords Dec 1991 - Dissolution of USSR & Creation of Commonwealth of Independent States / CIS; Resignation of Mikhail Gorbachev 25 Dec 1991; End of the Cold War & Emergence of Post-Cold War World Order)

History of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Sources & Prehistoric Karnataka
- Ancient Dynasties of Karnataka
- Medieval Dynasties of Karnataka
- Vijayanagara Empire & Nayaka Kingdoms
- Bahmanis & Deccan Sultanates in Karnataka
- Wodeyars of Mysore & Hyder-Tipu Era
- Socio-Religious & Cultural Movements in Karnataka
- Armed Resistance & Freedom Movement in Karnataka
- Karnataka Unification Movement (Ekikarana) & Post-Independence Social Transformation

Sources & Prehistoric Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Epigraphical & Archaeological Sources (Halmidi Inscription 450 CE / Oldest Kannada Inscription by Kadamba Kakusthavarma; Talagunda Pillar Inscription / Shantivarma; Ashokan Minor Rock Edicts in Karnataka - Maski Inscription / Mentioning 'Devanampriya Asoka', Brahmagiri, Siddapura, Sannati Excavations & Kanaganahalli Stupa / Ranyo Asoka Portrait, Chandravalli Excavations, Aihole Inscription of Pulakeshin II by Ravikirti, Badami Cliff Inscription; Numismatics - Padmatankas of Kadambas, Pagodas / Varahas of Vijayanagara, Coins of Western Gangas)
- Prehistoric Sites of Karnataka (Palaeolithic - Hunasagi & Baichbal Valleys / Acheulian Tools, Kibbanahalli Complex, Anagawadi; Mesolithic - Jalahalli, Sanganakallu, Bellary; Neolithic - Brahmagiri, Piklihal, Hallur / Oldest Iron Age Evidence in South India ~1000 BCE, Kupgal Rock Art / Ashmounds of South India, T. Narsipur; Megalithic - Hirebenakal Dolmens / UNESCO Tentative List, Savandurga, Brahmagiri Cist Burials)

Ancient Dynasties of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Kadambas of Banavasi (First Indigenous Kannada Dynasty 345 CE; Founded by Mayurasharma after Clash with Pallavas; Capital Banavasi / Vaijayanti; Kakusthavarma & Royal Matrimonial Alliances; Halmidi Inscription; Development of Kadamba Shikara Architecture & Early Kannada Script)
- Western Gangas of Talakad (Founded by Konganivarma / Madhava I; Capitals - Kolar / Kuvalala & Talakad; Prominent Rulers - Durvinita / Patron of Sanskrit & Kannada, Commentator on Bharavi's Kiratarjuniya; Shivamara II / Gajashtaka; Chavundaraya / Prime Minister & Military Commander - Commissioned 57-ft Monolithic Gommateshwara Statue at Shravanabelagola 981 CE, Author of Chavundaraya Purana; Panchakuta Basadi & Ganga Architecture)
- Chalukyas of Badami / Early Western Chalukyas (Founded by Pulakeshin I 543 CE; Capital Vatapi / Badami; Kirtivarman I; Pulakeshin II 610–642 CE - Greatest Ruler, Overcame Chhatra-Bhanga Coalition, Conquest of Kadambas & Gangas, Battle of Narmada ~618 CE defeating Harshavardhana of Kannauj / assumed title 'Parameshvara', Conflict with Pallava Mahendravarman I, Xuanzang's Visit & Glorious Description 640 CE, Defeat & Death against Pallava Narasimhavarman I / Vatapi Konda; Vikramaditya I & II - Conquest of Kanchipuram; Structural & Rock-Cut Temple Architecture - Aihole / 'Cradle of Indian Temple Architecture' / Lad Khan, Durga Temple, Huchappayya; Badami Rock-Cut Caves; Pattadakal UNESCO World Heritage Site - Virupaksha Temple built by Queen Lokamahadevi, Mallikarjuna Temple)
- Rashtrakutas of Manyakheta (Founded by Dantidurga 753 CE / Ellora Inscription; Capital Malkhed / Manyakheta; Krishna I - Built Monolithic Kailasanatha Rock-Cut Temple at Ellora / Cave 16; Govinda III & Dhruva - Northern Expeditions & Tripartite Struggle for Kannauj; Amoghavarsha I Nrupatunga 814–878 CE - Golden Age of Peace & Literature, Author of 'Kavirajamarga' / Oldest Extant Kannada Literary Work with Sri Vijaya, Slogan 'Kaveriyinda Godavarivarege' defining Kannada Land Extent, Travelogue of Arab Merchant Sulaiman ranking Rashtrakutas among 4 Great World Empires alongside Rome, Baghdad & China; Krishna III - Battle of Takkolam 949 CE against Cholas; Literary Patronage - Pampa / 'Adi Kavi' / Vikramarjuna Vijaya, Ponna / Shantipurana; Jain Architectural Masterpieces)

Medieval Dynasties of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Western Chalukyas of Kalyana / Later Chalukyas (Founded by Tailapa II 973 CE after overthrowing Rashtrakutas; Capital Kalyana / Basavakalyana; Someshwara I - Shifted Capital, Battle of Koppam; Vikramaditya VI 1076–1126 CE - Longest & Most Glorious Reign, Established Chalukya-Vikrama Era 1076, Patron of Kashmiri Poet Bilhana / 'Vikramankadevacharita' & Jurist Vijnaneshwara / 'Mitakshara' Legal Code; Someshwara III - Author of Encyclopedic Treatise 'Manasollasa' / 'Abhilashitartha Chintamani'; Architecture - Gadag Style / Lakkundi Brahma Jinalaya, Itagi Mahadeva Temple / 'Emperor among Temples' / Devalaya Chakravarti, Kuruvatti, Chaudayyadanapura)
- Kalachuris of Kalyana & Seunas (Bijjala II - Usurped Throne of Kalyana; Basaveshwara as Prime Minister & Finance Minister; Rise of Sharana Movement & Social Upheaval; Seunas / Yadavas of Devagiri - Bhillama V, Singhana II; Kannada-Marathi Cultural Synthesis; Hemadpanthi Architecture)
- Hoysalas of Dvarasamudra / Halebidu (Origins from Sasakapura / Angadi - Legend of Sala & Tiger / 'Poy Sala'; Prominent Rulers - Nripakama, Vinayaditya; Bittiga / Vishnuvardhana 1108–1152 CE - Converted from Jainism to Srivaishnavism by Ramanujacharya, Conquest of Gangavadi / 'Talakadu Konda', Commissioned Chennakeshava Temple at Belur & Hoysaleshwara Temple at Halebidu; Veera Ballala II - Defeated Chalukyas & Yadavas, Assumed Imperial Titles; Veera Ballala III - Last Great Ruler, Fought against Delhi Sultanate / Malik Kafur & Muhammad bin Tughlaq, Allied with Harihara & Bukka; Hoysala Architectural Style / UNESCO World Heritage 2023 - Soapstone / Chloritic Schist Material, Stellate / Star-Shaped Platform / Jagati, Intricate Miniature Carvings, Belur Chennakeshava, Halebidu Hoysaleshwara, Somanathapura Keshava Temple; Literary Jewels - Janna / Yashodhara Charite, Harihara / Ragale, Raghavanka / Harishchandra Kavya)

Vijayanagara Empire & Nayaka Kingdoms `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Vijayanagara Empire (Founding 1336 on Banks of Tungabhadra by Harihara I & Bukka I under Spiritual Guidance of Sage Vidyaranya of Sringeri Sharada Peetham; Four Ruling Dynasties: Sangama Dynasty - Devaraya I / Barrage across Tungabhadra, Nicolo de Conti Visit; Devaraya II / Praudha Devaraya / Gajabetekara, Abdur Razzaq Visit; Saluva Dynasty - Saluva Narasimha; Tuluva Dynasty - Krishnadevaraya 1509–1529 CE: Zenith of Empire, Battle of Raichur 1520, Capture of Udayagiri & Kondavidu, Ashtadiggajas in Court, Amuktamalyada, Mahanavami Dibba, Hazara Rama Temple, Vijaya Vittala Temple & Stone Chariot, City of Nagalapura; Achyuta Deva Raya & Fernao Nuniz Visit; Aravidu Dynasty - Battle of Talikota / Rakkasa-Tangadi 1565 CE, Combined Forces of Bijapur, Golconda, Ahmadnagar & Bidar Defeat Vijayanagara under Aliya Rama Raya, Sacking and Ruin of Hampi; Administrative Machinery - Nayankara System / Amaranayakas, Ayagar Village System, Council of Ministers, Provincial Division / Rajya, Vishaya, Sthala, Grama; Foreign Chroniclers - Duarte Barbosa, Domingo Paes, Fernao Nuniz)
- Post-Vijayanagara Nayaka Kingdoms (Nayakas of Keladi / Ikkeri / Bednore - Chaudappa Nayaka, Sadashiva Nayaka, Keladi Shivappa Nayaka: Innovative 'Sist' Land Revenue Assessment System, Rani Chennamma of Keladi: Sheltered Rajaram / Shivaji's Son against Aurangzeb's Mughal Forces; Nayakas of Chitradurga - Timmanna Nayaka, Madakari Nayaka V, Epic Defense of Chitradurga Fort / Heroism of Onake Obavva against Hyder Ali's Troops; Yelahanka Nadaprabhus - Kempegowda I: Founded Bengaluru 1537, Built Pete / Markets & Bengaluru Fort, Four Watch Towers; Kempegowda II; Surapura Nayakas)

Bahmanis & Deccan Sultanates in Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Bahmani Sultanate (Founded 1347 by Alauddin Hasan Bahman Shah; Capital Gulbarga / Ahsanabad / Gulbarga Fort & Jamia Masjid; Shift of Capital to Bidar 1424 by Ahmad Shah Wali / Bidar Fort, Mahmud Gawan's Prime Ministership 1466–1481 - Administrative Reforms, Expansion, Three-Storey Mahmud Gawan Madrasa at Bidar)
- Adil Shahis of Bijapur & Barid Shahis of Bidar (Yusuf Adil Shah 1489; Ali Adil Shah I - Gagan Mahal; Ibrahim Adil Shah II / 'Jagadguru Badshah' - Author of 'Kitab-i-Navras', Built Ibrahim Rauza / 'Taj Mahal of the Deccan', Patron of Saraswati & Hindu Traditions; Mohammed Adil Shah - Built Gol Gumbaz / World's Second Largest Dome & Whispering Gallery; Annexation by Aurangzeb 1686; Barid Shahis of Bidar - Rangin Mahal & Bidriware Crafts)

Wodeyars of Mysore & Hyder-Tipu Era `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Early Wodeyar Dynasty of Mysore (Founded 1399 by Yaduraya & Krishnaraya; Raja Wodeyar 1610 - Captured Srirangapatna from Vijayanagara Viceroy, Started Grand Mysore Dasara Tradition; Kanthirava Narasaraja Wodeyar - First Coinage / Kanthirayi Fanams; Chikka Devaraja Wodeyar 1673–1704 - Centralized Administration / Athara Kutcheri / 18 Administrative Departments, Devaraja Market, Purchased Bengaluru from Maratha Ekoji 1687)
- Hyder Ali & Tipu Sultan Era (1761–1799) (Hyder Ali - Rise from Faujdar of Dindigul, Usurped Real Power from Dalwoy Nanjarajaiah, Modern Dindigul Arsenal with French Aid, First & Second Anglo-Mysore Wars, Naval Ambitions; Tipu Sultan / 'Tiger of Mysore' 1782–1799 - Modernization of Army & State, Mysore Iron-Cased Rockets / Rocketry Pioneer, War with British / 3rd & 4th Anglo-Mysore Wars, Treaty of Seringapatam 1792, Embassies to France, Turkey & Afghanistan, Tree of Liberty planted at Srirangapatna & Jacobin Club Membership, Commercial Reforms - State Trading Monopoly, Silk / Sericulture Industry Introduction, Modern Navy, Solar Calendar / Mauludi, Coinage & Weights, Fall & Martyrdom at Srirangapatna 4 May 1799)
- Princely State of Mysore & British Paramountcy (Restoration of Wodeyars under Mummadi Krishnaraja Wodeyar III 1799 under Subsidiary Alliance, Dewan Purnaiah's Regency; Nagar Peasant Revolt 1830–31 / Budi Basappa; British Takeover & Direct Commissioners' Rule 1831–1881: Sir Mark Cubbon 1834–1861 - Administrative Consolidation, Expansion of Roads & Railways, Bowring - Police, Judicial & Educational Reforms; Rendition of Mysore 1881 - Handover of Power back to Chamarajendra Wodeyar X by Lord Ripon; Establishment of Mysore Representative Assembly 1881 / First Democratic Legislative Body in Princely India under Dewan C. Rangacharlu)
- Modernization & 'Model Mysore' under Nalwadi Krishnaraja Wodeyar (1902–1940) (Nalwadi Krishnaraja Wodeyar / Rajarshi - Transformative Progressive Rule; Dewans: Sir K. Seshadri Iyer - Shivanasamudra Hydroelectric Project 1902 / First in Asia, KGF Electrification; Sir M. Visvesvaraya / Statesman-Engineer 1912–1918 - Slogan 'Industrialise or Perish', Built Krishnaraja Sagara / KRS Dam & Brindavan Gardens, Founded University of Mysore 1916, Mysore Iron & Steel Works Bhadravathi, State Bank of Mysore, Karnataka Chamber of Commerce, Sandalwood Oil Factory, Primary Education Expansion; Sir M. Kantaraj Urs - First Backward Classes Commission / Lesley Miller Committee 1918 & Mysore Backward Classes Reservation Order 1921; Sir Mirza Ismail 1926–1941 - Industrialisation, Hindustan Aeronautics Limited / HAL 1940, Glass Factory, Mysore Paper Mills, Mandya Sugar Factory; Jayachamarajendra Wodeyar - Accession to Indian Union 1947, First Rajpramukh & Governor of Mysore)

Socio-Religious & Cultural Movements in Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Vachana Movement & Veerashaiva / Sharana Revolution (12th Century Radical Socio-Religious Reformation; Key Sharanas - Basaveshwara / Basavanna / Bhakti Bhandari, Allama Prabhu / President of Anubhava Mantapa, Akka Mahadevi, Chennabasavanna, Madivala Machideva, Jedara Dasimayya, Hadapada Appanna, Ambigara Chowdayya; Core Principles - 'Kayaka' / Dignity of Labour / 'Work is Worship' / Kayakave Kailasa; 'Dasoha' / Selfless Sharing & Distribution of Wealth; Universal Equality, Complete Rejection of Caste Hierarchy, Vedic Ritualism & Gender Inequality; Anubhava Mantapa at Basavakalyan / First Socio-Spiritual Democratic Parliament; Vachana Literature in Simple Vernacular Kannada; Inter-Caste Marriage of Haralayya & Madhuvarasa's Children leading to Kalyana Revolution)
- Haridasa Movement & Dasa Sahitya (Vaishnava Bhakti Movement spreading Madhvacharya's Dvaita Philosophy; Two Groups - Vyasakuta / Sanskrit Scholars & Dasakuta / Kannada Folk Preachers; Purandara Dasa / 'Pitamaha of Carnatic Music' / Sangeeta Pitamaha - Standardized Carnatic Graded Lessons / Swaravalis, Alankaras, Composed Thousands of Kritis / Keerthanas, Social Criticism; Kanaka Dasa - Kuruba Community Background, Composed 'Ramadhanya Charite' / Allegory of Millet vs Rice / Class Critique, 'Nalacharitre', 'Haribhaktisara', 'Mohana Tarangini', Kanakana Kindi Miracle at Udupi Krishna Matha; Vyasathirtha, Vadiraja Tirtha, Jagannatha Dasa / Harikathamritasara)

Armed Resistance & Freedom Movement in Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Early Armed Uprisings against British (Kittur Rebellion 1824 - Rani Chennamma of Kittur Defying British Doctrine of Lapse / Thackeray's Attack, Sangolli Rayanna's Guerrilla Warfare 1829–30, Bichugatti Channabasappa; Bedas of Halagali 1857 - Armed Resistance against Disarmament Act; Surapura Revolt 1857–58 - Raja Venkatappa Nayaka IV / Alliance with Peshwa Emissaries & British Suppression by Meadows Taylor; Revolt of Babasaheb / Bhaskar Rao Bhave of Naragund 1858; Mundargi Bheema Rao Rebellion 1858 at Koppal Fort; Canara Coastal Resistance - Rani Abbakka Chowta of Ullal / Defeating Portuguese Fleets)
- Nationalist Movement & Gandhian Agitations in Karnataka (Belgaum INC Session 1924 - 39th Session, Sole Congress Session Presided over by Mahatma Gandhi, Resolution for Unification of Karnataka; Salt Satyagraha 1930 - Ankola Salt Satyagraha / 'Dandi of Karnataka' led by M.P. Nadkarni, Karnad Sadashiva Rao, Hardekar Manjappa / 'Karnataka Gandhi'; Forest Satyagrahas - Sirsi, Siddapura, Hirekerur; No-Tax Campaigns; Shivapura Flag Satyagraha 1938 - Hoisting National Tricolour at Maddur led by T. Subramanyam & K.C. Reddy; Vidurashwatha Tragedy 25 April 1938 in Kolar / Chikkaballapur - British Police Firing on Peaceful Satyagrahis Killing 35 / Known as 'Jallianwala Bagh of Karnataka'; Quit India Movement 1942 - Isur Village Revolt in Shimoga / Declared Independent Republic / Slogan 'Esuru Kottaru Isuru Kodevu', Execution of Isur Patriots: Gurappa, Jinahalli Mallappa, Halappa, Suryanarayanachari; Mailara Mahadevappa's Revolutionary Martyrdom; Mysore Chalo Movement Sept 1947 - Demand for Responsible Democratic Government in Princely Mysore, K.C. Reddy becomes First Chief Minister of Mysore State Oct 1947)

Karnataka Unification Movement (Ekikarana) & Post-Independence Social Transformation `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Karnataka Ekikarana Movement (Partitioned Karnataka across 20+ Administrative Units / Bombay Presidency, Madras Presidency, Hyderabad State, Mysore Princely State, Coorg / Kodagu, Small Sansthanas; Pioneers - Aluru Venkata Rao / 'Karnataka Gatha Vaibhava' 1912 / Slogan 'Sirigannadam Gelge' / Father of Kannada Renaissance; Institutions - Karnataka Vidyavardhaka Sangha Dharwad 1890 / R.H. Deshpande, Kannada Sahitya Parishat Bengaluru 1915; Karnataka Ekikarana Sabha 1916; All Karnataka Unification Conference Belagavi 1924; K.P. Puttanna Chetty, Huilgol Narayana Rao / 'Udayavagali Namma Cheluva Kannada Nadu'; Post-1947 Commissions - Dhar Commission 1948, JVP Committee 1948, Fazal Ali States Reorganisation Commission / SRC 1953–55 / Unification of Kannada-speaking Areas; Birth of Unified Mysore State on 1 November 1956 with 19 Districts / First Chief Minister S. Nijalingappa; Renaming of Mysore State as 'Karnataka' on 1 November 1973 under Chief Minister D. Devaraj Urs)
- Social Engineering & Land Reforms under D. Devaraj Urs (Longest Serving Chief Minister 1972–1980; Radical Land Reforms Amendment Act 1974 - Elimination of Tenancy, Grant of Land Ownership to Tillers / 'Uluvanige Bhoomi' / Surplus Land Redistribution; Kagodu Satyagraha 1951 Legacy / Shantaveri Gopala Gowda & Dr. Rammanohar Lohia; First Karnataka Backward Classes Commission 1972–75 under L.G. Havanur / Havanur Report Implementing Extensive OBC Reservations in Education & Jobs; Abolition of Bonded Labour / Jeetha System & Elimination of Manual Carrying of Nightsoil; Debt Relief Act for Rural Poor; Gokak Agitation 1982 / Gokak Committee Report - Mass Movement led by Dr. Rajkumar demanding First Language Status for Kannada in Schools; Mahajan Commission on Belagavi Border Dispute)

==================================================
2. ART, CULTURE & HERITAGE `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
==================================================

Art, Culture & Heritage

- Indian Architecture & Sculpture
- Indian Paintings & Visual Arts
- Performing Arts (Dance, Music, Theatre & Puppetry)
- Indian Literature & Languages
- Schools of Indian Philosophy
- Fairs, Festivals, Crafts & UNESCO Heritage

Indian Architecture & Sculpture `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Harappan Architecture & Town Planning (Citadel, Great Bath, Granaries, Drainage System)
- Mauryan Art & Pillars (Ashokan Pillars, Stupas, Sanchi, Bharhut, Rock-Cut Caves - Barabar)
- Post-Mauryan Caves & Sculpture (Karle, Bhaja, Kanheri, Gandhara, Mathura & Amaravati Schools of Art)
- Temple Architecture Styles (Nagara Style - Odisha, Khajuraho, Solanki; Dravida Style - Pallava, Chola, Vijayanagara; Vesara / Chalukyan Style - Badami, Pattadakal, Hoysala)
- Indo-Islamic Architecture (Imperial / Delhi Sultanate Style, Provincial Styles, Mughal Architecture - Taj Mahal, Fatehpur Sikri, Red Fort)
- Colonial & Modern Architecture (Indo-Saracenic Architecture, Neo-Gothic Style, Neo-Classical Style, Lutyens' Delhi)

Indian Paintings & Visual Arts `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Prehistoric Rock Art (Bhimbetka, Lakhudiyar, Kupgallu)
- Ancient & Medieval Murals (Ajanta Caves, Ellora, Bagh Caves, Sittanavasal, Lepakshi)
- Miniature Painting Traditions (Pala & Jain Manuscript Paintings, Mughal School, Rajasthani Schools - Mewar, Marwar, Kishangarh Bani Thani, Pahari Schools - Basohli, Kangra)
- Folk & Regional Painting Styles (Madhubani / Mithila, Kalamkari, Pattachitra, Warli, Tanjore Paintings, Phad, Gond, Cheriyal)

Performing Arts (Dance, Music, Theatre & Puppetry) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Classical Dance Traditions (Bharatanatyam, Kathak, Kathakali, Kuchipudi, Manipuri, Mohiniyattam, Odissi, Sattriya)
- Folk Dances of India (Bhangra, Ghoomar, Chhau, Garba, Lavani, Yakshagana, Bihu, Rouf, Koodiyattam)
- Indian Classical Music Systems (Hindustani Music - Dhrupad, Khayal, Thumri, Tappa; Carnatic Music - Kriti, Varnam, Ragam Tanam Pallavi)
- Musical Instruments & Folk Music (Stringed / Tat, Wind / Sushira, Percussion / Avanaddha, Solid / Ghana; Baul, Bihu, Pandavani, Bhatiali)
- Traditional Theatre Forms & Puppetry (Yakshagana, Nautanki, Jatra, Bhavai, Tamasha, Dashavatar, Bhand Pather; String, Glove, Rod & Shadow Puppetry)

Indian Literature & Languages `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Vedic, Epic & Puranic Literature (Rigveda, Samaveda, Yajurveda, Atharvaveda, Upanishads, Mahabharata, Ramayana, Puranas)
- Classical & Religious Texts (Buddhist Canon - Tripitakas, Jatakas; Jain Canon - Agamas; Sangam Literature - Ettuthokai, Pattupattu, Silappatikaram, Manimekalai)
- Medieval & Bhakti-Sufi Literature (Kabir, Tulsidas, Surdas, Guru Nanak, Amir Khusrau, Alvars & Nayanars Compositions)
- Scientific, Astronomical & Legal Treatises (Aryabhatiya, Sushruta Samhita, Charaka Samhita, Arthashastra, Manusmriti, Mitakshara, Dayabhaga)

Schools of Indian Philosophy `[UPSC: Prelims-GS1, Mains-GS1, Mains-GS4] [KAS: Paper-2, Paper-4]`

- Orthodox / Astika Systems (Samkhya - Kapila, Yoga - Patanjali, Nyaya - Gautama, Vaisheshika - Kanada, Mimamsa - Jaimini, Vedanta - Shankara, Ramanuja, Madhva)
- Heterodox / Nastika Systems (Carvaka / Lokayata Materialism, Ajivika Determinism, Jain Philosophy - Anekantavada, Syadvada, Buddhist Philosophy - Pratityasamutpada, Anatta, Shunyata)

Fairs, Festivals, Crafts & UNESCO Heritage `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Traditional Handicrafts & Textiles (Kanjeevaram, Banarasi, Ikat, Chanderi, Pashmina, Chikankari, Zardozi, Terracotta, Bidriware)
- UNESCO World Heritage Sites & Intangible Cultural Heritage (Kumbh Mela, Yoga, Vedic Chanting, Ramlila, Chhau Dance, Mudiyettu, Durga Puja, Garba)

==================================================
3. GEOGRAPHY & EARTH SYSTEMS `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`
==================================================

Geography & Earth Systems

- Physical Geography & Earth Systems (Geomorphology)
- Climatology & Atmospheric Dynamics
- Oceanography & Marine Systems
- Indian Physical Geography & Monsoon Architecture
- Economic & Resource Geography
- Human Geography & Population Settlements
- Geography of Karnataka `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]`

Physical Geography & Earth Systems (Geomorphology) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Earth's Origin & Internal Structure (Crust, Mantle, Core, Discontinuities - Mohorovicic, Gutenberg, Seismic Waves P & S)
- Continental Drift & Plate Tectonics (Pangaea, Plate Boundaries - Divergent, Convergent, Transform, Sea Floor Spreading, Ring of Fire)
- Earthquakes, Tsunamis & Volcanism (Epicentre, Focus, Richter Scale, Volcanic Landforms - Intrusive & Extrusive, Caldera, Shield, Composite)
- Geomorphic Processes & Landform Evolution (Weathering - Physical, Chemical, Biological; Mass Wasting; Fluvial, Glacial, Aeolian, Karst & Coastal Landforms)

Climatology & Atmospheric Dynamics `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Atmosphere Structure & Heat Budget (Troposphere, Stratosphere, Mesosphere, Thermosphere; Insolation, Terrestrial Radiation, Atmospheric Heat Budget)
- Atmospheric Pressure & Global Wind Belts (Pressure Belts - Equatorial Low, Subtropical High, Subpolar Low; Planetary Winds - Trade Winds, Westerlies, Polar Easterlies; Jet Streams)
- Air Masses, Fronts & Cyclogenesis (Air Mass Types, Fronts - Warm, Cold, Occluded; Tropical Cyclones vs Temperate / Extra-Tropical Cyclones, Eye of Cyclone)
- World Climate Regions (Equatorial, Tropical Monsoon, Savanna, Mediterranean, Steppe, Taiga, Tundra, Desert Climates)

Oceanography & Marine Systems `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Ocean Floor Relief & Features (Continental Shelf, Slope, Abyssal Plains, Oceanic Trenches, Mid-Oceanic Ridges)
- Ocean Water Dynamics (Temperature & Salinity Distribution, Ocean Currents - Warm & Cold Currents, Thermohaline Circulation, Tides - Spring & Neap Tides)
- Marine Ecosystems & Conservation (Coral Reefs - Fringing, Barrier, Atoll; Coral Bleaching, Blue Carbon, Ocean Acidification, EEZ, Marine Protected Areas)

Indian Physical Geography & Monsoon Architecture `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Physiographic Divisions of India (Himalayan Mountain System, Northern Great Plains, Peninsular Plateau, Coastal Plains, Lakshadweep & Andaman Nicobar Islands)
- Drainage Systems of India (Himalayan Rivers - Indus, Ganga, Brahmaputra; Peninsular Rivers - Narmada, Tapi, Godavari, Krishna, Kaveri, Mahanadi; River Interlinking)
- Indian Monsoon & Climate Dynamics (South-West & North-East Monsoons, Mechanism of Monsoon - ITCZ Shift, Jet Streams, El Niño, La Niña, Indian Ocean Dipole / IOD, Western Disturbances)
- Soils & Natural Vegetation of India (Soil Types - Alluvial, Black / Regur, Red, Laterite, Arid, Saline; Forest Types - Tropical Evergreen, Deciduous, Thorn, Montane, Mangroves)

Economic & Resource Geography `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Global & Indian Distribution of Natural Resources (Mineral Resources - Iron Ore, Bauxite, Copper, Coal, Petroleum, Natural Gas, Uranium; Water Resources, Land & Soil Resources)
- Location Factors of Primary, Secondary & Tertiary Industries (Raw Material, Power, Labour, Market, Transport; Iron & Steel, Cotton Textile, Petrochemical, Pharmaceutical, IT Industries)

Human Geography & Population Settlements `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

- Global & Indian Demographic Trends (Population Distribution, Density, Growth Models - Demographic Transition Theory, Migration Types & Push-Pull Factors)
- Human Settlements & Urban Systems (Rural Settlement Types - Clustered, Dispersed; Urban Classification, Conurbations, Megalopolis, Functional Classification of Towns)

Geography of Karnataka `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]`

- Physiography & Relief Divisions of Karnataka
- Drainage Systems & River Basins of Karnataka
- Climate, Rainfall & Agro-Climatic Zones of Karnataka
- Soils & Natural Vegetation of Karnataka
- Biodiversity, Protected Areas & Conservation in Karnataka
- Mineral, Power & Economic Resources of Karnataka

Physiography & Relief Divisions of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Karavali / Coastal Plains (Canara Coast stretching ~320 km between Karwar in North to Mangaluru in South; Narrow Coastal Strip bounded by Arabian Sea & Western Ghats; Estuaries, Spits & Lagoons; Major River Outlets - Netravati, Gurupura, Sharavathi, Gangavali, Aghanashini, Kali; Major Ports - New Mangalore Port / Only Major Port of Karnataka, Karwar Port, Malpe, Tadadi, Belekeri; St. Mary's Islands / Columnar Basaltic Lava Geo-Heritage Site)
- Malnad / Western Ghats / Sahyadri Range (Continuous Mountainous Escarpment; Average Elevation 900–1500m; Peak Formations - Mullayanagiri 1930m / Highest Peak in Karnataka in Chikmagalur / Baba Budangiri Range / Chandra Drona Parvatha; Kudremukh 1894m / Horse-face Peak; Pushpagiri / Kumara Parvatha 1712m in Kodagu-Dakshina Kannada border; Brahmagiri 1608m; Tadiandamol 1748m / Highest Peak of Kodagu; Agumbe Ghat; Major Mountain Passes / Ghats - Charmadi Ghat / Chikmagalur-Mangalore link, Shiradi Ghat / Hassan-Mangalore link, Sampaje Ghat / Kodagu-Mangalore link, Hulikal Ghat / Shimoga-Udupi link, Agumbe Ghat / Shimoga-Udupi link)
- Northern Maidan / Bayaluseeme (Extensive Treeless Semi-Arid Plateau formed by Deccan Trap Lava Flows & Ancient Granites; Krishna, Bhima, Ghataprabha & Malaprabha River Plains; Black Cotton Soils / Regur; Residual Monadnocks & Flat-Topped Mesas; Drought-Prone Dry Landscape covering Belagavi, Bagalkote, Vijayapura, Kalaburagi, Yadgir, Raichur, Koppal, Gadag, Ballari & Vijayanagara districts; Kappatagudda Hill Range)
- Southern Maidan / Mysore Plateau (Rolling Undulating Plateau between 600–900m Elevation; Archean Granites & Gneisses; Red Soils; Cauvery, Hemavati, Shimsha, Arkavathi & Palar-Pennar River Valleys; Distinct Residual Hill Clusters - Savandurga / Largest Monolithic Hill in Asia, Madhugiri / Second Largest Monolithic Fort in Asia, Shivagange, Nandi Hills / Chikkaballapur, Chamundi Hills / Mysuru, Biligirirangana Hills / BR Hills / Ecological Transition between Western & Eastern Ghats, Male Mahadeshwara Hills / MM Hills)

Drainage Systems & River Basins of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- East-Flowing River Systems (Major Drainage directed towards Bay of Bengal across Peninsular Gradient):
  - Krishna River Basin (Drains ~60% of State Area; Origin at Mahabaleshwar in Maharashtra; Enters Karnataka at Hipparagi; Major Tributaries in Karnataka: Bhima River / Origin Bhimashankar; Ghataprabha River / Gokak Falls; Malaprabha River / Origin Kanakumbi, Peacock Sanctuary at Bankapura; Tungabhadra River / Formed by Confluence of Tunga & Bhadra at Kudli near Shivamogga, Tributary Varada; Vedavati / Hagari River / Vani Vilasa Sagara / Mari Kanive Dam in Chitradurga / Oldest Dam in Karnataka 1907; Major Irrigation Projects: Upper Krishna Project / UKP - Almatti Dam / Lal Bahadur Shastri Reservoir & Narayanpur Dam / Basavasagara Reservoir; Tungabhadra Dam at Hosapete / Pampa Sagara)
  - Cauvery / Kaveri River Basin (Lifeline of Southern Karnataka; Origin at Talakaveri in Brahmagiri Hills of Kodagu District 1341m; Eastward Flow across Mysore Plateau; Major Left-Bank Tributaries: Harangi, Hemavati / Gorur Dam, Shimsha, Arkavathi; Major Right-Bank Tributaries: Lakshmana Tirtha, Kabini / Beechanahalli Dam, Suvarnavathi; Waterfalls & Gorges: Chunchanakatte Falls, Shivanasamudra Falls / Gaganachukki & Bharachukki / Asia's First Hydroelectric Power Project 1902, Mekedatu Gorge / Proposed Balancing Reservoir at Arkavathi Confluence; Major Reservoirs: Krishnaraja Sagara / KRS Dam at Kannambadi built under Sir M. Visvesvaraya; Inter-State Cauvery Water Dispute with Tamil Nadu)
  - Pennar & Palar River Basins (Uttara Pinakini / North Pennar, Dakshina Pinakini / South Pennar & Palar Rivers originating in Nandi Hills / Chennakesava Hills of Chikkaballapur District, draining eastern arid plateau into Andhra Pradesh & Tamil Nadu)
- West-Flowing River Systems (Short, Rapid, High-Velocity Torrential Rivers draining into Arabian Sea through Malnad & Coastal Escarpments):
  - Sharavathi River (Origin at Ambuthirtha in Thirthahalli Taluk of Shivamogga; Jog Falls / Gersoppa / Raja, Roarer, Rocket & Rani / 253m Drop / Major Plunge Waterfall in India; Linganamakki Dam / Largest Reservoir by Water Capacity in Karnataka, Sharavathi Hydroelectric Project)
  - Kali River (Origin at Diggi in Uttara Kannada; Supa Dam Hydroelectric Project, Kodasalli Dam, Kadra Dam; Karwar Estuary)
  - Netravati & Gurupura Rivers (Netravati Origin at Bangrabalige Valley in Kudremukh; Confluence with Kumaradhara at Uppinangadi; Lifeline of Dakshina Kannada; Yettinahole Water Diversion Project)
  - Other West-Flowing Rivers: Aghanashini River / Unchalli Falls / Lushington Falls, Pristine Estuary / Ramsar Site; Gangavali / Bedthi River / Magod Falls; Varahi River / Kunchikal Falls / Underground Hydroelectric Station; Mahadayi / Mandovi River / Origin at Khanapur in Belagavi, Kalasa-Banduri Nala Drinking Water Project Dispute with Goa)

Climate, Rainfall & Agro-Climatic Zones of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Climate & Monsoon Dynamics (Tropical Monsoon Climate; Four Distinct Seasons: Dry Winter / Jan–Feb, Hot Pre-Monsoon Summer / March–May / Mango Showers / Coffee Showers, South-West Monsoon Season / Mungaru / June–Sept / Accounts for ~80% of Annual Rainfall, North-East Post-Monsoon Season / Hingaru / Oct–Dec / Retreating Monsoon Rainfall in Southern & Eastern Districts)
- Rainfall Distribution & Spatial Variation (Heavy Orographic Rainfall in Malnad & Coastal Belt: Agumbe in Shivamogga & Hulikal / ~8000mm Annual Rainfall / 'Cherrapunji of South India', Bhagamandala in Kodagu; Steep Rain-Shadow Effect eastward of Western Ghats: Semi-Arid Core of Central & Northern Karnataka receiving <500mm Annual Rainfall / Nayakarahatti & Challakere in Chitradurga, Bagalkote, Vijayapura; High Frequency of Agricultural Droughts)
- 10 Agro-Climatic Zones of Karnataka (Demarcated by NARP / ICAR based on Rainfall, Soil & Cropping Patterns):
  1. North-Eastern Transition Zone (Bidar, Kalaburagi / Pulses, Black Soil, Moderate Rainfall)
  2. North-Eastern Dry Zone (Raichur, Yadgir, Kalaburagi / Cotton, Jowar, Deep Black Soils)
  3. Northern Dry Zone (Vijayapura, Bagalkote, Gadag, Belagavi, Koppal, Ballari / Largest Zone, Low Rainfall, Bajra, Sunflower, Jowar)
  4. Central Dry Zone (Chitradurga, Davanagere, Tumakuru / Millets, Groundnut, Maize)
  5. Eastern Dry Zone (Bengaluru Urban & Rural, Kolar, Chikkaballapur, Ramanagara / Ragi, Mulberry / Sericulture, Vegetables)
  6. Southern Dry Zone (Mysuru, Mandya, Chamarajanagar / Paddy, Sugarcane, Ragi, Cauvery Canal Irrigation)
  7. Southern Transition Zone (Hassan, Mysuru, Shivamogga / Transitional Cropping, Ragi, Tobacco, Potato)
  8. Northern Transition Zone (Dharwad, Belagavi, Haveri / High Agricultural Productivity, Cotton, Soybean, Wheat, Chilli)
  9. Hilly / Malnad Zone (Uttara Kannada, Shivamogga, Chikmagalur, Hassan, Kodagu / Plantation Crops: Coffee, Arecanut, Pepper, Cardamom, Tea, Paddy)
  10. Coastal Zone (Dakshina Kannada, Udupi, Uttara Kannada coastal strip / Coconut, Arecanut, Paddy, Cashew, Fisheries)

Soils & Natural Vegetation of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Major Soil Types of Karnataka:
  - Red Soils / Alfisols & Inceptisols (Largest Soil Group in Karnataka ~50% area; Red Sandy Loams & Red Clay Loams; Formed from Archean Gneisses & Granites; Rich in Iron Oxides & Potash, Deficient in Nitrogen, Phosphorus & Humus; Predominant in Southern Maidan - Tumakuru, Kolar, Bengaluru, Mandya, Mysuru; Ideal for Ragi, Groundnut, Pulses, Millets)
  - Black Cotton Soils / Regur / Vertisols (Covers ~28% area; Formed from Weathering of Deccan Basaltic Traps; High Clay Content, High Moisture Retentivity, Self-Ploughing Nature with Deep Cracks during Summer; Rich in Calcium Carbonate, Magnesium & Lime, Poor in Nitrogen & Organic Matter; Predominant in Northern Maidan - Kalaburagi, Vijayapura, Bagalkote, Belagavi, Dharwad, Raichur; Ideal for Cotton, Jowar, Wheat, Sunflower, Bengal Gram)
  - Laterite Soils / Ultisols & Oxisols (Formed by Intense Leaching under High Temperature & Heavy Rainfall; Acidic, Rich in Iron & Aluminium Hydroxides, Deficient in Lime & Silica; Found in Coastal Plains & Malnad Plateaus - Uttara Kannada, Udupi, Dakshina Kannada, Kodagu, Chikmagalur; Highly Suitable for Plantation Crops: Coffee, Tea, Cashew, Rubber, Arecanut)
  - Alluvial & Coastal Soils / Entisols (Narrow Belts along River Valleys & Coastal Plains; High Fertility, Rich in Organic Matter, Well-Drained; Paddy, Coconut, Banana)
- Forest Cover & Natural Vegetation Types:
  - Forest Area (~20.1% of State Geographical Area; Western Ghats as Global Biodiversity Hotspot):
  - Tropical Wet Evergreen & Semi-Evergreen Forests (Western Slopes of Western Ghats / Annual Rainfall >2500mm; Dense Multi-Layered Canopy; Rosewood / Dalbergia latifolia, Ebony, Mahogany, White Cedar / Dysoxylum, Gurjan, Wild Jackfruit, Cinnamon; Silent Valley type microhabitats in Agumbe, Bhagamandala)
  - Tropical Moist Deciduous Forests (Transition Zone of Malnad & Foot of Western Ghats / Rainfall 1500–2500mm; Shed leaves in early summer; Teak / Tectona grandis, Rosewood, Honne / Pterocarpus marsupium, Mathi / Terminalia tomentosa, Dindiga, Bamboo Brakes, Sandalwood / Santalum album / 'Sandalwood State' / 'Gandhada Gudi')
  - Tropical Dry Deciduous Forests (Eastern slopes of Ghats & Southern Maidan / Rainfall 750–1500mm; Teak, Axle-wood / Anogeissus, Bael, Neem, Palas / Flame of the Forest, Red Sanders in border areas)
  - Tropical Thorn & Scrub Forests (Northern & Central Dry Plains / Rainfall <750mm; Xerophytic Adaptations, Thorns, Spines & Fleshy Stems; Acacia / Babul, Kair, Euphorbias, Prosopis, Zizyphus / Ber, Cactus)
  - Coastal Mangroves (Estuarine Intertidal Mudflats; Halophytic Vegetation with Pneumatophores / Stilt Roots; Karwar, Honnavar, Aghanashini Estuary, Gangavali & Kundapura Mangroves)

Biodiversity, Protected Areas & Conservation in Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- National Parks of Karnataka:
  - Bandipur National Park (Chamarajanagar / Part of Nilgiri Biosphere Reserve; Established as Venugopala Wildlife Park 1931 by Mysore Maharaja; Project Tiger Site 1973; High Density of Bengal Tigers, Asian Elephants, Indian Gaur, Dholes; Moyar River / Kabini River borders)
  - Nagarahole / Rajiv Gandhi National Park (Kodagu & Mysuru districts; Part of Nilgiri Biosphere Reserve; Kabini River separates Bandipur & Nagarahole; High Density of Tigers, Leopards, Elephants, Marsh Crocodiles)
  - Kudremukh National Park (Chikmagalur, Udupi & Dakshina Kannada / Tropical Wet Evergreen Forests; Origin of Tunga, Bhadra & Netravati Rivers; Shola-Grassland Ecosystem; Lion-Tailed Macaque / LTM habitat; Iron Ore Mining Halted for Eco-Restoration)
  - Bannerghatta National Park (Bengaluru Urban / Biological Park, Tiger & Lion Safari, Butterfly Park, Elephant Wildlife Corridor connecting BM Betta & Talli Reserve Forests)
  - Anshi National Park / Kali Tiger Reserve (Uttara Kannada / Moist Evergreen Rainforests, Kali River Basin, Black Panther / Melanistic Leopard Population, Great Indian Hornbill)
- Tiger Reserves & Biosphere Reserves:
  - 5 Tiger Reserves of Karnataka (Bandipur, Nagarahole, BRT / Biligirirangana Hills Tiger Reserve, Bhadra Tiger Reserve, Kali Tiger Reserve / Formerly Anshi-Dandeli)
  - Nilgiri Biosphere Reserve (First Biosphere Reserve in India 1986; Karnataka Sector covers Bandipur, Nagarahole & Nagarhole-Mudumalai-Wayanad Contiguous Forest Landscape)
- Wildlife & Bird Sanctuaries of Prominence:
  - Bhadra Wildlife Sanctuary / Muthodi (Chikmagalur / Bhadra Dam / Tiger Reserve)
  - Dandeli Wildlife Sanctuary & Hornbill Conservation Reserve (Uttara Kannada)
  - Daroji Sloth Bear Sanctuary (Ballari-Vijayanagara / Dedicated Habitat for Melursus ursinus)
  - Ramadevara Betta Vulture Sanctuary (Ramanagara / Long-Billed Vulture Protection)
  - Ranganathittu Bird Sanctuary (Mandya / Cauvery Islets / Declared Ramsar Wetland Site)
  - Magadi Kere Bird Sanctuary (Gadag / Bar-Headed Goose Wintering Site / Ramsar Site)
  - Ankasamudra Bird Conservation Reserve (Vijayanagara / Ramsar Site)
  - Aghanashini Estuary (Uttara Kannada / Marine & Brackish Water Wetland / Ramsar Site)
  - Kokkare Bellur Pelicanry (Mandya / Spot-Billed Pelicans & Painted Storks Co-existing with Villagers)
  - UNESCO World Heritage Sites (Western Ghats Sub-Clusters in Karnataka - Agumbe, Kudremukh, Pushpagiri, Talakaveri, Brahmagiri)

Mineral, Power & Economic Resources of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]`

- Mineral Resources of Karnataka (Richest Archean Craton / Dharwar Craton Geological Formations):
  - Metallic Minerals:
    - Iron Ore (Extensive Banded Iron Formations / BIF - Magnetite & Hematite; Major Belts: Bellary-Hospet-Sandur Sector / High Grade Hematite, Kudremukh / Magnetite deposits, Kemmangundi / Bababudan Hills in Chikmagalur / Historic Feeder to Bhadravathi Steel Plant, Chitradurga, Tumakuru)
    - Gold (Karnataka produces over 99% of India's Primary Gold; Hutti Gold Mines in Raichur / Only active primary underground gold mining company in India; Historic Kolar Gold Fields / KGF in Champion Reefs - Extensively mined up to 3.2 km depth / Closed in 2001)
    - Manganese (Associated with Iron Ore Formations; Sandur, Kumsi in Shivamogga, Belagavi, Uttara Kannada)
    - Copper (Ingaldhal Mines in Chitradurga, Kalyadi in Hassan, Thinthini in Raichur)
    - Bauxite (Aluminium Ore formed in Lateritic Caps; Belagavi / Supplies INDAL Smelter, Uttara Kannada, Dakshina Kannada)
    - Chromite (Byrapur in Hassan District)
  - Non-Metallic & Industrial Minerals:
    - Limestone & Dolomite (Extensive Bhima & Kaladgi Rock Basins; Major Cement Clusters in Kalaburagi / Sedam, Wadi, Malkhed, Bagalkote, Belagavi)
    - Granite & Dimensional Stones (Ilkal Red Granite / Bagalkote, Ruby Red / Chamarajanagar, Bengaluru Grey Granite, Black Granite / Kanakapura)
    - Silica Sand & Quartz (Coastal Udupi & Dakshina Kannada, Belagavi)
- Energy, Power Infrastructure & Industrial Corridors of Karnataka:
  - Hydroelectric Power (First State in Asia to harness Commercial Hydro Power: Shivanasamudra 1902; Mahatma Gandhi Sharavathi Hydroelectric Project at Jog Falls; Linganamakki Powerhouse, Supa Dam on Kali, Varahi Underground Powerhouse, Kadra & Kodasalli Projects, Almatti Dam Hydel Project)
  - Thermal Power Stations (Raichur Thermal Power Station / RTPS / First Coal-Fired TPS in Karnataka; Bellary Thermal Power Station / BTPS at Kudatini; Yermarus Thermal Power Station / YTPS in Raichur)
  - Nuclear Energy (Kaiga Atomic Power Station in Uttara Kannada / 4 Units of Pressurised Heavy Water Reactors / PHWR / Indigenous Nuclear Technology)
  - Renewable Energy Leadership (Karnataka is a National Leader in Clean Energy Generation):
    - Solar Energy: Pavagada Solar Park / 'Shakti Sthala' in Tumakuru District / 2,050 MW Capacity / One of the Largest Ultra-Mega Solar Parks in the World; PM-KUSUM Decentralized Solarisation
    - Wind Energy: Wind Power Farms in Kappatagudda / Gadag, Jogimatti / Chitradurga, Harapanahalli, Belagavi, Chikkaballapur
  - Major Industrial & Economic Hubs:
    - IT & Biotechnology Hub (Bengaluru / 'Silicon Valley of India' / Electronic City, Whitefield; Mysore IT Hub)
    - Heavy Engineering, Aerospace & Defence Corridor (HAL, BEL, BEML, ISRO, DRDO, Gas Turbine Research Establishment)
    - Textile & Garment Clusters (Ballari / Jeans Capital of India, Doddaballapura, Ilkal Sarees, Guledgudda Khana, Mysore Silk)
    - Automobile & Machinery Corridors (Bidadi / Toyota, Narasapura & Peenya Industrial Area / Largest MSME Industrial Estate in SE Asia)

==================================================
4. INDIAN SOCIETY & SOCIAL JUSTICE `[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]`
==================================================

Indian Society & Social Justice

- Salient Features of Indian Society & Diversity
- Social Institutions (Family, Marriage, Caste & Tribe)
- Role of Women & Women's Movements
- Population Dynamics & Demographic Issues
- Poverty, Inequality & Developmental Challenges
- Urbanisation & Urban Social Issues
- Social Empowerment, Communalism, Regionalism & Secularism
- Welfare Schemes for Vulnerable Sections
- Social Sector Development (Health & Education)
- Issues Relating to Poverty & Hunger

Salient Features of Indian Society & Diversity `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Pluralism & Cultural Diversity (Linguistic, Religious, Ethnic, Regional Diversity)
- Unity in Diversity (Integrating Factors, Composite Culture / Ganga-Jamuni Tehzeeb, Constitutional Values)

Social Institutions (Family, Marriage, Caste & Tribe) `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Kinship & Family Systems (Joint Family vs Nuclear Family, Matrilineal vs Patrilineal Systems, Changing Family Structures)
- Marriage Institutions (Traditional Patterns, Inter-caste & Inter-religious Marriages, Modern Legislative Reforms)
- Caste System & Varna (Origins, Jati Hierarchy, Caste Mobility, Sanskritisation, Caste in Modern Politics, Affirmative Action)
- Tribal Communities / Particularly Vulnerable Tribal Groups - PVTGs (Tribal Distribution, Fifth & Sixth Schedules, Forest Rights Act, Tribal Integration Policies)

Role of Women & Women's Movements `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Status of Women in India (Gender Inequality, Patriarchal Structures, Sex Ratio, Female Labour Force Participation Rate / FLFPR)
- Women Organisations & Movements (Historical Reformers, Pre-Independence Movement, Post-Independence Feminist Waves, Self-Help Groups / SHGs)
- Legislative & Social Safeguards (POSH Act, Domestic Violence Act, Maternity Benefit Act, Reservation for Women in Panchayats & Parliament)

Population Dynamics & Demographic Issues `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Demographic Profile of India (Census Trends, Population Growth Rate, Total Fertility Rate / TFR, Replacement Level Fertility)
- Demographic Dividend & Ageing (Young Population Opportunities, Skill Development, Ageing Population & Geriatric Care)
- Migration Patterns (Internal Migration - Rural to Urban, Rural to Rural; International Emigration, Remittances, Brain Drain)

Poverty, Inequality & Developmental Challenges `[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]`

- Poverty Concepts & Measurement (Absolute vs Relative Poverty, Poverty Line Committees - Tendulkar, Rangarajan, Multidimensional Poverty Index / MPI)
- Social Exclusion & Vulnerability (Hunger, Malnutrition, Stunting, Wasting, Food Security - NFSA, Public Distribution System / PDS)

Urbanisation & Urban Social Issues `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Urbanisation Trends & Sprawl (Growth of Megacities, Census Towns, Slumification, Urban Infrastructure Deficit)
- Urban Social Problems (Urban Poverty, Crime, Housing Shortages, Environmental Degradation, Water Scarcity, Traffic Congestion)

Social Empowerment, Communalism, Regionalism & Secularism `[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]`

- Social Empowerment (Empowerment of Marginalised Groups - Scheduled Castes, Scheduled Tribes, OBCs, LGBTQ+, Persons with Disabilities / Divyangjan, Elderly)
- Communalism (Historical Roots, Major Causes, Majoritarianism vs Minority Anxiety, Communal Violence, Constitutional Solutions)
- Regionalism & Sub-Nationalism (Sons of the Soil Doctrine, Demand for New States, Regional Disparities, Inter-State Water Disputes)
- Indian vs Western Secularism (Equal Respect for All Religions / Sarva Dharma Sambhava, State Neutrality, Principled Distance Model)

Welfare Schemes for Vulnerable Sections `[UPSC: Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Protection of Marginalised Groups (Schemes & Acts for SC/ST, Women, Children, Elderly, Disabled / Divyangjan, Transgenders, Minorities)
- Institutional Safeguards (National Commissions, Social Welfare Boards, Rights-based Approach to Welfare)

Social Sector Development (Health & Education) `[UPSC: Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Health Sector Reforms (National Health Policy, Ayushman Bharat / PM-JAY, Health Infrastructure Deficit, Universal Health Coverage)
- Education Sector Reforms (National Education Policy / NEP 2020, Right to Education / RTE Act, Higher Education Governance, Digital Education Initiatives)

Issues Relating to Poverty & Hunger `[UPSC: Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Hunger & Malnutrition Architecture (Global Hunger Index, POSHAN Abhiyaan, Food Security Act, Malnutrition-Poverty Cycle)

==================================================
5. INDIAN POLITY, CONSTITUTION & GOVERNANCE `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`
==================================================

Indian Polity, Constitution & Governance

- Historical Background & Making of the Constitution
- Salient Features, Amendments & Basic Structure
- Fundamental Rights, DPSP & Fundamental Duties
- Union Executive & State Executive
- Parliament & State Legislatures
- Indian Judiciary & Judicial System
- Federal Structure, Center-State Relations & Devolution
- Local Governance (Panchayati Raj & Municipalities)
- Statutory, Regulatory & Quasi-Judicial Bodies
- Good Governance & Administrative Reforms
- Transparency, Accountability & Citizen Charters
- E-Governance Models & Digital Public Infrastructure
- Role of Civil Services in a Democracy
- Governance, Administration & Public Policy in Karnataka `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]`
- Karnataka Gram Swaraj & Panchayat Raj System `[KAS: Prelims-P1, Mains-GS2] [KEA: PDO, VAO] [State-PSC: General Studies]`

Historical Background & Making of the Constitution `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

- Regulating & Charter Acts (Regulating Act 1773, Pitt's India Act 1784, Charter Acts 1813, 1833, 1853)
- Government of India Acts (1858, 1892, Indian Councils Act 1909 / Morley-Minto, GOI Act 1919 / Montagu-Chelmsford, GOI Act 1935, Indian Independence Act 1947)
- Constituent Assembly & Drafting Process (Objectives Resolution, Committees, Debates, Enactment & Adoption)

Salient Features, Amendments & Basic Structure `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

- Salient Features of the Indian Constitution (Written, Rigid vs Flexible, Federal with Unitary Bias, Parliamentary Form, Integrated Judiciary)
- Preamble (Sovereign, Socialist, Secular, Democratic, Republic, Justice, Liberty, Equality, Fraternity)
- Major Constitutional Amendments (42nd, 44th, 73rd, 74th, 86th, 101st GST, 103rd EWS, 104th, 105th, 106th Nari Shakti Vandan)
- Basic Structure Doctrine (Kesavananda Bharati Case 1973, Minerva Mills Case, Evolution & Core Principles)

Fundamental Rights, DPSP & Fundamental Duties `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

- Fundamental Rights - Part III / Articles 12-35 (Right to Equality 14-18, Right to Freedom 19-22, Against Exploitation 23-24, Freedom of Religion 25-28, Cultural & Educational 29-30, Constitutional Remedies 32; Judicial Review & Writs - Habeas Corpus, Mandamus, Prohibition, Certiorari, Quo-Warranto)
- Directive Principles of State Policy - Part IV / Articles 36-51 (Socialistic, Gandhian, Liberal-Intellectual Principles; Fundamental Rights vs DPSP Conflict & Harmony)
- Fundamental Duties - Part IV-A / Article 51A (Swaran Singh Committee, 42nd & 86th Amendments, Enforceability & Moral Obligation)

Union Executive & State Executive `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

- Union Executive (President - Election, Impeachment, Powers - Executive, Legislative, Financial, Judicial, Veto, Ordinance, Pardoning 72; Vice-President; Prime Minister & Council of Ministers - Collective Responsibility, Cabinet Committees)
- State Executive (Governor - Appointment, Constitutional Role, Discretionary Powers, Ordinance Power 213; Chief Minister & State Council of Ministers)

Parliament & State Legislatures `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

- Structure & Composition (Lok Sabha, Rajya Sabha, Vidhan Sabha, Vidhan Parishad; Qualification & Disqualification - Article 102, Representation of the People Act 1951, Anti-Defection Law / 10th Schedule)
- Legislative Procedure & Bills (Ordinary Bills, Money Bills Article 110, Financial Bills, Constitutional Amendment Bills, Joint Sitting Article 108)
- Parliamentary Committees & Control (Public Accounts Committee, Estimates Committee, COPU, Departmentally Related Standing Committees; Parliamentary Privileges Article 105)

Indian Judiciary & Judicial System `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

- Supreme Court of India (Original, Appellate, Advisory Article 143, Writ Jurisdiction Article 32, Court of Record Article 129, Collegium System vs NJAC)
- High Courts & Subordinate Judiciary (High Court Jurisdiction Article 226, Judicial Review, Judicial Activism vs Judicial Overreach, Public Interest Litigation / PIL)
- Judicial Reforms & Alternative Dispute Resolution (Pending Cases, E-Courts, Lok Adalats, Gram Nyayalayas, Arbitration & Conciliation)

Federal Structure, Center-State Relations & Devolution `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Legislative & Administrative Relations (Seventh Schedule - Union, State, Concurrent Lists; Residuary Powers; Emergency Provisions Articles 352, 356, 360)
- Financial Relations & Tax Devolution (Distribution of Revenues, Goods & Services Tax / GST Council Article 279A, Finance Commission Article 280, Grants-in-Aid)
- Federal Dynamics & Dispute Resolution (Cooperative & Competitive Federalism, Inter-State Councils Article 263, Zonal Councils, Inter-State River Water Disputes Article 262)

Local Governance (Panchayati Raj & Municipalities) `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

- 73rd & 74th Constitutional Amendment Acts (Three-Tier Panchayati Raj System, Gram Sabha, Urban Local Bodies - Municipal Corporations, Councils, Nagar Panchayats)
- Devolution & Decentralisation Issues (3 Fs - Funds, Functions, Functionaries; PESA Act 1996 - Extension to Scheduled Areas, State Finance Commissions)

Statutory, Regulatory & Quasi-Judicial Bodies `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

- Constitutional Bodies (Election Commission Article 324, Union & State Public Service Commissions, CAG Article 148, Finance Commission, National Commissions for SC/ST/NCBC)
- Statutory & Regulatory Bodies (NITI Aayog, NHRC, CIC, CVC, CBI, Enforcement Directorate / ED, Competition Commission of India / CCI, National Green Tribunal / NGT, SEBI, RBI, IRDAI)

Good Governance & Administrative Reforms `[UPSC: Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Good Governance Principles (Participation, Rule of Law, Transparency, Responsiveness, Consensus Oriented, Equity & Inclusiveness, Effectiveness & Accountability)
- Civil Services Reforms (Recruitment Reforms, Lateral Entry, Capacity Building - Mission Karmayogi, Performance Appraisal, Civil Service Neutrality vs Commitment)

Transparency, Accountability & Citizen Charters `[UPSC: Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Right to Information Act 2005 (RTI Architecture, Exemptions Section 8, Information Commissions, Judicial & Legislative Accountability)
- Accountability Tools & Social Audit (Citizen's Charters, Social Audit Mechanisms, Whistleblower Protection, Lokpal & Lokayuktas Act 2013)

E-Governance Models & Digital Public Infrastructure `[UPSC: Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Digital India & Public Infrastructure (Aadhaar / India Stack, UPI, DigiLocker, COWIN, e-RUPI, Open Network for Digital Commerce / ONDC)
- E-Governance Applications (e-Seva, UMANG, PRAGATI Platform, Direct Benefit Transfer / DBT, Open Government Data)

Role of Civil Services in a Democracy `[UPSC: Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Civil Services Dynamics (Bureaucracy & Development, Politicization of Civil Services, Specialist vs Generalist Debate, Administrative Ethics)

Governance, Administration & Public Policy in Karnataka `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]`

- Constitutional & Administrative Structure of Karnataka
- Local Self-Government & Decentralisation (Panchayati Raj & ULBs)
- State Statutory, Regulatory & Oversight Bodies
- Good Governance, Administrative Reforms & Citizen Service Delivery
- E-Governance Innovations & Digital Public Infrastructure in Karnataka

Constitutional & Administrative Structure of Karnataka `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]`

- State Executive & Secretariat Hierarchy (Governor's Powers & Constitutional Role; Chief Minister & Council of Ministers; Karnataka Government Secretariat / Vidhana Soudha & Vikas Soudha; Chief Secretary as Head of Civil Administration; Additional Chief Secretaries, Principal Secretaries & Departmental Directorates; Field Administration - Regional Commissioners / 4 Divisions: Bengaluru, Mysuru, Belagavi, Kalaburagi; Deputy Commissioner / District Magistrate / District Collector as Pivot of District Administration; Assistant Commissioners / Sub-Divisions, Tahsildars / Taluks, Revenue Inspectors / Hoblis, Village Administrative Officers / VAOs & Grama Sahayaks)
- State Legislature & Special Constitutional Status (Bicameral System - Karnataka Legislative Assembly / Vidhana Sabha: 224 Elected Members + Speaker & Deputy Speaker; Karnataka Legislative Council / Vidhana Parishad: 75 Members, Chairman; Legislative Procedures, Committees - Public Accounts Committee / PAC, Estimates Committee, Committee on Public Undertakings / COPU; Special Constitutional Status for Kalyana Karnataka under Article 371J / 98th Constitutional Amendment Act 2012: 6 Districts - Bidar, Kalaburagi, Yadgir, Raichur, Koppal, Ballari & Vijayanagara; Kalyana Karnataka Region Development Board / KKRDB; Educational & Employment Reservations / Local Cadre Allocation under Article 371J)

Local Self-Government & Decentralisation (Panchayati Raj & ULBs) `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]`

- Panchayati Raj System in Karnataka (Pioneering Role of Karnataka in Democratic Decentralisation; Abdul Nazir Sab Legacy - 1983 Landmark Panchayati Raj Act; Karnataka Gram Swaraj and Panchayat Raj Act 1993 & Extensive 2015 Amendments based on Ramesh Kumar Committee Recommendations; 3-Tier Decentralised Architecture: Grama Panchayat / Executive Officer & Adhyaksha, Taluk Panchayat, Zilla Panchayat / Chief Executive Officer / CEO / IAS cadre; Mandatory Grama Sabha & Ward Sabha Deliberations; Standing Committees; Devolution of 29 Functions under 11th Schedule; Karnataka State Election Commission & State Finance Commission Devolution Formula)
- Urban Local Governance & Metropolitan Administration (Karnataka Municipal Corporations Act 1976 & Karnataka Municipalities Act 1964; Bruhat Bengaluru Mahanagara Palike / BBMP - BBMP Act 2020, Ward Committees, Zonal Commissioners, Chief Commissioner; Restructuring Proposals for Bengaluru Governance / Brand Bengaluru; City Municipal Corporations / CMCs, Town Municipal Councils / TMCs, Town Panchayats, Directorate of Municipal Administration / DMA; Metropolitan Planning Committee / MPC, Bangalore Development Authority / BDA, BMRDA, BWSSB, BMTC, Namma Metro / BMRCL)

State Statutory, Regulatory & Oversight Bodies `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]`

- Karnataka Public Service Commission / KPSC (Constitutional Status under Article 315; Composition, Functions, Conduct of Gazetted Probationers Examination / KAS recruitment, PC Hota Committee Reforms on KPSC Examination Transparency & Digital Evaluation)
- Karnataka Lokayukta (Established under Karnataka Lokayukta Act 1984; Renowned as the Most Powerful Anti-Corruption & Ombudsman Institution in India; Jurisdiction over Chief Minister, Ministers, MLAs & Public Servants; Investigative Wing headed by ADGP Police; Powers of Suo-Motu Investigation, Raid & Asset Attachment; Upalokayuktas; Justice N. Venkatachala & Justice Santosh Hegde Era / Historic Illegal Mining Reports)
- State Commissions & Regulatory Authorities (Karnataka State Human Rights Commission / KSHRC; Karnataka State Information Commission / KSIC under RTI Act; Karnataka State Commission for Backward Classes / KSCBC - Historic Commissions: L.G. Havanur 1975, T. Venkataswamy 1983, Justice O. Chinnappa Reddy 1990; Karnataka State Commission for Women, Karnataka State Commission for Protection of Child Rights / KSCPCR, Real Estate Regulatory Authority / RERA Karnataka, Karnataka Electricity Regulatory Commission / KERC)

Good Governance, Administrative Reforms & Citizen Service Delivery `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]`

- Administrative Reforms Commissions of Karnataka (KARC-I under Harnahalli Ramaswamy; KARC-II under T.M. Vijay Bhaskar - 100+ Transformative Recommendations: Rationalisation of Departmental Directorates, Digital File Movement via e-Office, Cadre Management, Outsourcing Non-Core Activities, Performance Appraisal & Citizen-Centric Restructuring)
- Citizen Service Guarantees & Redressal Platforms (Karnataka Guarantee of Services to Citizens Act 2011 / 'Sakala Act' / Mission Sakala - Statutory Guarantee of Time-Bound Delivery of 1,000+ Government Services, Mandatory Delay Compensations, Sakala Mission Directorate; Janaspandana / Integrated Public Grievance Redressal System / IPGRS; Bapuji Seva Kendra / BSK at Grama Panchayat level; Grama One / Karnataka One / Bangalore One Integrated Citizen Service Centers)

E-Governance Innovations & Digital Public Infrastructure in Karnataka `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]`

- Pioneer Land & Financial E-Governance Platforms (Bhoomi Project - First & Largest Online Land Records Management System in India / Digitisation of RTC / Record of Rights, Tenancy & Crops / Pahani, Mutation Automation, Spatial Integration with Dishaank Geo-App; Khajane & Khajane II - Comprehensive Integrated Financial Management System / IFMS, Real-time Treasury Digitisation, Electronic Payments & Budget Control; e-Swathu & e-Aasthi - Digital Property Mutation & Title Verification in Rural and Urban Local Bodies)
- Unified Beneficiary & Service Delivery Platforms (Seva Sindhu - Single-Window Digital Delivery Gateway for all Government Services; FRUITS Portal / Farmer Registration and Unified Beneficiary Information System - Core Integrated Database linking Land Ownership, Soil Health, Crop Survey, PM-KISAN, Institutional Credit & Subsidies; Kutumba - Unified Family Social Security Database for Entitlement-based Welfare Delivery; e-Procurement Portal - India's First Unified Online Public Procurement & Tender System; e-Parihara - Automated Drought & Flood Relief Disbursement through Direct Benefit Transfer / DBT; Bhoo Samruddhi - Convergence of Agriculture and Allied Sector Extension Services)

==================================================
6. INTERNATIONAL RELATIONS & GLOBAL INSTITUTIONS `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`
==================================================

International Relations & Global Institutions

- India's Foreign Policy & Bilateral Relations
- Regional & Multilateral Groupings
- Global Institutions, Agreements & Treaties
- Indian Diaspora

India's Foreign Policy & Bilateral Relations `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Guiding Principles of Foreign Policy (Panchsheel, Non-Aligned Movement / NAM, Strategic Autonomy, Neighbourhood First Policy, Act East Policy, Think West Policy)
- Relations with Immediate Neighbours (Pakistan, Bangladesh, Nepal, Bhutan, Sri Lanka, Maldives, Myanmar, Afghanistan)
- Relations with Major Global Powers (United States, Russia, China, European Union, Japan, Australia)

Regional & Multilateral Groupings `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Indo-Pacific & Trans-Regional Alliances (QUAD, I2U2, BRICS, Shanghai Cooperation Organisation / SCO, G20, Global South Alliances)
- Regional Organisations (ASEAN, SAARC, BIMSTEC, G7, IORA, Indian Ocean Rim Association)

Global Institutions, Agreements & Treaties `[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- International Organisations & Reform (United Nations Security Council / UNSC Reforms, World Trade Organization / WTO & Dispute Settlement, International Monetary Fund / IMF, World Bank, World Health Organization / WHO)
- Global Climate & Maritime Frameworks (UNFCCC Climate Architecture, UNCLOS Maritime Law, Global Tax Regimes)

Indian Diaspora `[UPSC: Mains-GS2] [KAS: Prelims-P1, Mains-GS2]`

- Diaspora Dynamics (Non-Resident Indians / NRIs, Overseas Citizens of India / OCI, Remittances, Geopolitical Soft Power, Pravasi Bharatiya Divas)

==================================================
7. INDIAN ECONOMY & DEVELOPMENT `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
==================================================

Indian Economy & Development

- Macroeconomic Fundamentals & National Income Accounting
- Planning, Mobilisation of Resources & Inclusive Growth
- Monetary Policy & Banking Architecture
- Fiscal Policy, Public Finance & Taxation
- Agriculture, Food Management & Subsidies
- Industrial Policy, Manufacturing & Services
- Infrastructure, Energy & Investment Models
- External Sector, Balance of Payments & Foreign Trade
- Economy & Development of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS3]`

Macroeconomic Fundamentals & National Income Accounting `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- National Income Aggregates (Gross Domestic Product / GDP - Constant vs Current Prices, Gross National Product / GNP, Net National Product / NNP at Factor Cost vs Market Price, Gross Value Added / GVA)
- Methodologies & Deflators (Output / Production Method, Income Method, Expenditure Method / Consumption + Investment + Government + Net Exports, GDP Deflator vs Consumer Price Index / CPI & Wholesale Price Index / WPI)
- Growth & Development Dynamics (Economic Growth vs Economic Development, Potential GDP & Output Gap, Business Cycles - Recession, Depression, Stagflation, Reflation, Middle-Income Trap)
- Inflation Metrics & Control (Headline vs Core Inflation, Demand-Pull vs Cost-Push Inflation, CPI-Combined, CPI-IW, CPI-AL, WPI Indices, Base Effect, Producer Price Index / PPI)

Planning, Mobilisation of Resources & Inclusive Growth `[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`

- Evolution of Planning in India (Harrod-Domar & Mahalanobis Strategies, Indicative Planning, Five-Year Plans 1st to 12th, Structural Weaknesses of Planning Commission)
- NITI Aayog & Transformational Governance (Think Tank Mandate, Cooperative & Competitive Federalism, Governing Council, Aspirational Districts Programme / ADP, Aspirational Blocks Programme, Composite Water Management Index, SDG India Index, Export Preparedness Index)
- Mobilisation of Resources & Capital Formation (Domestic Resource Mobilisation - Savings Rate, Gross Fixed Capital Formation / GFCF, Financial vs Physical Savings, Foreign Capital Inflows)
- Inclusive Growth & Inequality Dynamics (Multidimensional Poverty Index / NITI Aayog MPI, Gini Coefficient & Lorenz Curve, Jobless Growth, Female Labour Force Participation Rate / FLFPR, Formalisation of Informal Economy, Financial Inclusion - PM Jan Dhan Yojana / PMJDY, JAM Trinity)

Monetary Policy & Banking Architecture `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA] [Banking]`

- Monetary Policy Framework & RBI Operations (Flexible Inflation Targeting Framework / 4% +/- 2%, Monetary Policy Committee / MPC - Composition & Voting, Policy Rates - Repo Rate, Standing Deposit Facility / SDF, Marginal Standing Facility / MSF, Reverse Repo; Reserve Ratios - Cash Reserve Ratio / CRR, Statutory Liquidity Ratio / SLR; Quantitative Tools - Open Market Operations / OMO, Operation Twist, Long-Term Repo Operations / LTRO; Qualitative Tools - Margin Requirements, Moral Suasion)
- Money Supply & Liquidity (Monetary Aggregates - Reserve Money / M0, Narrow Money / M1, Intermediate Money / M2, Broad Money / M3; Money Multiplier Effect, Velocity of Money)
- Banking Structure & Regulatory Framework (Scheduled Commercial Banks - Public Sector Banks, Private Banks, Foreign Banks; Differentiated Banks - Small Finance Banks / SFBs, Payments Banks; Regional Rural Banks / RRBs, Cooperative Banks - Primary Agricultural Credit Societies / PACS, Urban Cooperative Banks / UCBs regulated under Dual Control & Banking Regulation Amendment Act 2020)
- Non-Performing Assets & Resolution Architecture (Gross vs Net NPAs, Special Mention Accounts / SMA-0, 1, 2, Stressed Assets; Twin Balance Sheet Syndrome; Insolvency and Bankruptcy Code / IBC 2016 - National Company Law Tribunal / NCLT, Insolvency and Bankruptcy Board of India / IBBI, Committee of Creditors; Bad Bank - National Asset Reconstruction Company Limited / NARCL & India Debt Resolution Company Limited / IDRCL; Prompt Corrective Action / PCA Framework, BASEL III Norms - Capital Adequacy Ratio / CRAR, Tier 1 & Tier 2 Capital)
- Non-Banking Financial Institutions & Capital Markets (Non-Banking Financial Companies / NBFCs - Systemically Important NBFCs, Scale-Based Regulatory Framework; Primary vs Secondary Markets, Initial Public Offerings / IPOs, SEBI Regulatory Framework, Stock Exchanges - BSE, NSE, Algorithmic & High-Frequency Trading, Mutual Funds & Systematic Investment Plans / SIPs, Credit Rating Agencies / CRAs)

Fiscal Policy, Public Finance & Taxation `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Union Budget & Public Finance Architecture (Constitutional Provisions - Article 112 / Annual Financial Statement; Budget Structure - Consolidated Fund of India Article 266(1), Contingency Fund Article 267, Public Account Article 266(2); Revenue Receipts vs Capital Receipts, Revenue Expenditure vs Capital Expenditure / Capex Multiplier Effect)
- Deficit Concepts & Fiscal Discipline (Revenue Deficit / Effective Revenue Deficit, Fiscal Deficit - Borrowing Requirement of Government, Primary Deficit; Fiscal Responsibility and Budget Management / FRBM Act 2003 - N.K. Singh Committee Recommendations, Debt-to-GDP Ratio Targets, Escape Clauses)
- Direct Taxation & Reforms (Income Tax Slabs & New Tax Regime, Corporate Tax Reforms - Reduction to 22% / 15% for new manufacturing units, Minimum Alternate Tax / MAT, Equalisation Levy / Google Tax, Faceless Assessment & Taxpayer's Charter, Base Erosion and Profit Shifting / BEPS, Double Tax Avoidance Agreements / DTAA, General Anti-Avoidance Rules / GAAR)
- Indirect Taxation & GST Architecture (Goods and Services Tax / GST - 101st Constitutional Amendment Act, Destination-based Consumption Tax, Subsumed Taxes; Dual GST Model - CGST, SGST, IGST; GST Council Article 279A - Composition & Decision Mechanism; Inverted Duty Structure, Input Tax Credit / ITC Fraud, E-Way Bill, GST Compensation Cess Mechanism)
- Public Debt & Fiscal Federalism (Internal vs External Public Debt, Sovereign Green Bonds, Ways and Means Advances / WMA; Finance Commission Article 280 - Terms of Reference, Vertical vs Horizontal Devolution Criteria, Post-Devolution Revenue Deficit Grants, Performance-linked Incentives)

Agriculture, Food Management & Subsidies `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Cropping Patterns & Agrarian Systems (Kharif, Rabi & Zaid Seasons; Crop Diversity - Cereals, Pulses, Oilseeds, Commercial Crops; Millets / Shree Anna - Climate Resilient Crops, International Year of Millets 2023; Precision Farming & Zero Budget Natural Farming / ZBNF)
- Irrigation Infrastructure & Water Productivity (Types - Surface, Groundwater, Canal Irrigation; Micro-Irrigation - Drip & Sprinkler Systems; Pradhan Mantri Krishi Sinchayee Yojana / PMKSY - Per Drop More Crop, Har Khet Ko Pani; Command Area Development; Groundwater Overexploitation & Atal Bhujal Yojana)
- Farm Inputs, Credit & Crop Insurance (Fertilizer Architecture - Urea, DAP, MOP; Nutrient Based Subsidy / NBS Scheme, Nano Urea & Nano DAP, Direct Benefit Transfer / DBT in Fertilizers; Institutional Credit - Priority Sector Lending / PSL Norms, Kisan Credit Card / KCC, Interest Subvention Scheme; Pradhan Mantri Fasal Bima Yojana / PMFBY - Yield Index vs Weather Index, PM KISAN / Income Support Scheme)
- Agricultural Pricing & Market Reforms (Minimum Support Price / MSP - Comprehensive Cost C2 + 50% vs A2+FL; Commission for Agricultural Costs and Prices / CACP; PM-AASHA Scheme; Market Architecture - Agricultural Produce Market Committees / APMC, Model APMC Act, Electronic National Agriculture Market / e-NAM, Farmer Producer Organisations / FPOs, Contract Farming Regulations)
- Food Processing & Supply Chain Logistics (Mega Food Parks Scheme, PM Formalisation of Micro food processing Enterprises / PMFME, Operation Greens / TOP to TOTAL, Pradhan Mantri Kisan SAMPADA Yojana; Cold Chain Infrastructure, Post-Harvest Losses, Food Quality Standards / FSSAI)
- Buffer Stocking & Public Distribution System (Food Corporation of India / FCI - Procurement, Storage & Distribution, Economic Cost of Foodgrains, Open Market Sale Scheme / OMSS; National Food Security Act / NFSA 2013 - Targeted Public Distribution System / TPDS, Antyodaya Anna Yojana / AAY, Priority Households; One Nation One Ration Card / ONORC, Direct Benefit Transfer / DBT in Food Subsidy, Food Subsidy Bill Reforms)

Industrial Policy, Manufacturing & Services `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Industrial Policy & Structural Evolution (Industrial Policy Resolutions 1948, 1956 / License Raj, 1991 Industrial Policy Liberalisation; Index of Industrial Production / IIP - Eight Core Industries / 40.27% weightage: Refinery Products, Electricity, Steel, Coal, Crude Oil, Natural Gas, Cement, Fertilizers; Annual Survey of Industries / ASI)
- Manufacturing Initiatives & Make in India (Make in India 2.0; Production Linked Incentive / PLI Schemes across 14 Champion Sectors; National Capital Goods Policy; Phased Manufacturing Programme / PMP; Ease of Doing Business Reforms - Single Window Clearance, National Single Window System / NSWS, Decriminalisation of Minor Offenses)
- MSME Sector Architecture (Revised MSME Definition 2020 - Composite Criteria of Investment & Annual Turnover for Micro, Small, Medium Enterprises; Udyam Registration Portal; Credit Guarantee Schemes - CGTMSE, Emergency Credit Line Guarantee Scheme / ECLGS; Schemes - RAMP, CHAMPIONS Portal, TReDS / Trade Receivables Discounting System, Public Procurement Policy for MSMEs)
- Public Sector Enterprises & Disinvestment (Central Public Sector Enterprises / CPSEs - Maharatna, Navratna, Miniratna Classification Criteria; New Public Sector Enterprise Policy 2021 - Strategic vs Non-Strategic Sectors; Disinvestment Modes - Minority Stake Sale, Strategic Disinvestment, Asset Monetisation / National Monetisation Pipeline / NMP, Department of Investment and Public Asset Management / DIPAM)
- Services Sector & Logistics Transformation (Services Growth Driver - IT-BPM, Financial Services, Global Capability Centers / GCCs, Medical Tourism, Education Services; Logistics Ecosystem - National Logistics Policy / NLP, Unified Logistics Interface Platform / ULIP, PM Gati Shakti National Master Plan - Multi-modal Connectivity, Reduction of Logistics Cost from 14% to Global Benchmarks)

Infrastructure, Energy & Investment Models `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`

- Physical Infrastructure Systems (Road Infrastructure - National Highways Authority of India / NHAI, Bharatmala Pariyojana; Railways Modernisation - Dedicated Freight Corridors / DFC: Western & Eastern DFCs, Vande Bharat Trains, National Rail Plan 2030, High-Speed Rail Projects; Port & Maritime Infrastructure - Sagarmala Programme, Major Ports Authority Act 2021, Coastal Economic Zones / CEZs; Civil Aviation - UDAN Scheme / Regional Connectivity Scheme, Airport Privatisation & PPP Models)
- Energy Transition & Power Sector Architecture (Primary Energy Mix - Coal, Oil, Natural Gas, Renewables; Power Generation, Transmission & Distribution; Power Grid Architecture - One Sun, One World, One Grid / OSOWOG, National Grid; Financial Stress in DISCOMs - Ujjwal DISCOM Assurance Yojana / UDAY, Revamped Distribution Sector Scheme / RDSS; Renewable Energy Targets - 500 GW Non-Fossil Capacity by 2030, National Solar Mission, PM-KUSUM Scheme, Offshore Wind Energy Policy, National Green Hydrogen Mission / 5 MMT Target by 2030)
- Investment Models & Project Financing (Public-Private Partnership / PPP Models - Build-Operate-Transfer / BOT: Toll vs Annuity, Engineering-Procurement-Construction / EPC, Hybrid Annuity Model / HAM, Swiss Challenge Method; Alternate Financing Vehicles - Infrastructure Investment Trusts / InvITs, Real Estate Investment Trusts / REITs, National Infrastructure Pipeline / NIP, National Bank for Financing Infrastructure and Development / NaBFID, National Investment and Infrastructure Fund / NIIF)

External Sector, Balance of Payments & Foreign Trade `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Balance of Payments Architecture (BOP Structure - Current Account: Merchandise Trade Balance, Invisibles: Services, Transfers, Income; Capital Account: Foreign Direct Investment / FDI, Foreign Portfolio Investment / FPI, External Commercial Borrowings / ECBs, NRI Deposits, External Assistance; Current Account Deficit / CAD & Sustainable Thresholds)
- Foreign Exchange & Currency Dynamics (Foreign Exchange Reserves - Components: Foreign Currency Assets, Gold, SDRs, Reserve Tranche Position in IMF; Exchange Rate Regimes - Clean vs Dirty Float, Nominal Effective Exchange Rate / NEER vs Real Effective Exchange Rate / REER; Currency Convertibility - Full Current Account Convertibility / Article VIII of IMF, Tarapore Committee Recommendations on Capital Account Convertibility; Internationalisation of Indian Rupee - Vostro Accounts, Rupee-denominated Trade Settlement)
- Foreign Trade Policy & International Agreements (Foreign Trade Policy 2023 - Target of $2 Trillion Exports by 2030, Four Pillars: Incentive to Remission, Export Promotion through Collaboration, Districts as Export Hubs, E-Commerce Exports; Trade Instruments - RoDTEP, RoSCTL, Duty Drawback; Free Trade Agreements / FTAs - Comprehensive Economic Partnership Agreements / CEPA with UAE, ECTA with Australia, Trade & Economic Partnership Agreement / TEPA with EFTA, European Union FTA negotiations; Trade Remedies - Anti-Dumping Duty, Countervailing Duty / CVD, Safeguard Duty; Global Supply Chain Realignment - China+1 Strategy, Supply Chain Resilience Initiative / SCRI)

Economy & Development of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS3]`

- Macroeconomic Profile & State Finances of Karnataka
- Agriculture, Allied Sectors & Rural Transformation in Karnataka
- Industrial Policies, Manufacturing & Innovation Ecosystem
- Flagship Welfare & Guarantee Schemes of Karnataka (Pancha Guarantees)
- Regional Imbalances, Nanjundappa Committee & Kalyana Karnataka Development

Macroeconomic Profile & State Finances of Karnataka `[KAS: Prelims-P2, Mains-GS3] [UPSC: Mains-GS3]`

- GSDP Trends & Sectoral Composition (Gross State Domestic Product / GSDP - 4th Largest State Economy in India; High Economic Growth Rate; Structural Shift: Services Sector ~64% / Major Growth Engine, Industry & Manufacturing ~21%, Agriculture & Allied Sectors ~15%; High Per Capita Net State Domestic Product / NSDP exceeding National Average; Economic Survey of Karnataka Annual Highlights)
- Public Finance, Fiscal Health & KFRA (Karnataka Fiscal Responsibility Act / KFRA 2002 - Pioneer State in Enacting Statutory Fiscal Discipline; Key KFRA Mandates: Elimination of Revenue Deficit, Fiscal Deficit capped <3% of GSDP, Total Outstanding Liabilities capped <25% of GSDP; State Own Tax Revenue / SOTR - Major Sources: State GST / SGST, State Excise Duties, Stamps and Registration Fees, Motor Vehicle Taxes; State Non-Tax Revenue; Central Tax Devolution & 15th Finance Commission Concerns regarding Horizontal Devolution Formula; Public Debt Sustainability & Capital Expenditure / Capex Priorities)

Agriculture, Allied Sectors & Rural Transformation in Karnataka `[KAS: Prelims-P2, Mains-GS3] [UPSC: Mains-GS3]`

- Agrarian Profile & Cropping Patterns (Net Sown Area ~53% of Total Geographical Area; Extreme Vulnerability to Rainfall Variability - Karnataka has the Second Largest Extent of Rainfed & Arid Farmland in India after Rajasthan; Cropping Trends: Foodgrains - Ragi in Southern Maidan, Jowar & Bajra in Northern Maidan, Paddy in Coastal & Canal Command Areas, Maize; Pulses - Kalaburagi as 'Tur Bowl of Karnataka' / Geographical Indication / GI Tag for Gulbarga Tur Dal; Commercial Crops - Sugarcane / Belagavi & Mandya, Cotton, Groundnut, Sunflower, Tobacco / Mysuru)
- High-Value Plantation & Horticulture Crops (Coffee - Karnataka accounts for ~70% of India's Total Coffee Production / Arabica & Robusta in Kodagu, Chikmagalur, Hassan / GI Tags for Coorg Arabica & Chikmagalur Arabica; Sericulture & Silk - Karnataka produces ~50% of India's Total Mulberry Raw Silk / Ramanagara Silk Cocoon Market as Largest in Asia, Mysore Silk GI; Spices - Black Pepper, Cardamom, Ginger; Arecanut - Shivamogga & Coastal Belt; Floriculture & Horticulture Leadership)
- State Agricultural Schemes & Farm Modernisation (Krishi Bhagya Scheme - Rainwater Harvesting, Farm Ponds with Polythene Lining & Diesel Pumpsets for Rainfed Agriculture; Raitha Siri Scheme - Financial Incentive for Cultivation of Millets / Siri Dhanya; Yashaswini Health Insurance Scheme for Rural Cooperative Farmers; Ksheera Sanjeevini & Pashu Bhagya - Livestock & Dairy Promotion; Organic Farming Policy & Zero Budget Natural Farming / ZBNF Pilots; Agricultural Produce Market Committees / APMC Reforms & ReMSoL / Rashtriya e-Market Services Joint Venture)

Industrial Policies, Manufacturing & Innovation Ecosystem `[KAS: Prelims-P2, Mains-GS3] [UPSC: Mains-GS3]`

- Industrial Policy Framework & 'Beyond Bengaluru' (Karnataka Industrial Policy 2020–2025 - Focus on Holistic Industrialisation across Tier-2 and Tier-3 Cities / 'Beyond Bengaluru' Mission; Special Investment Zones & Mega Clusters: Machine Tool Park at Vasanthanarasapura in Tumakuru / First Integrated Machine Tool Park in India; Aerospace & Defence Park at Devanahalli; Bulk Drug & Pharmaceutical Park at Yadgir; Plastic Park at Ganjimutt Mangaluru; Textile Parks at Kalaburagi & Ballari; KIADB / Karnataka Industrial Areas Development Board & KSSIDC)
- Innovation, Startups & Knowledge Economy Leadership (Karnataka ranks #1 in NITI Aayog's India Innovation Index; Bengaluru as 'Silicon Valley of India' & Startup Capital / Home to 40+ Tech Unicorns; Global Capability Centers / GCCs - Hosting 30%+ of India's GCCs; Karnataka Startup Policy 2022–2027; ELEVATE Scheme - Idea2PoC Seed Grant Scheme for Tech Startups; Karnataka Innovation and Technology Society / KITS; Biotechnology Excellence / Bengaluru Tech Summit / Bangalore Bioinnovation Centre / BBC; Semiconductor & Electronics System Design and Manufacturing / ESDM Policy)
- Major Infrastructure Corridors & Industrial Logistics (Chennai-Bengaluru Industrial Corridor / CBIC, Bengaluru-Mumbai Economic Corridor / BMEC, Hyderabad-Bengaluru Industrial Corridor; Dedicated Freight Logistics Parks; Inland Container Depots / ICD Whitefield; Special Economic Zones / SEZs)

Flagship Welfare & Guarantee Schemes of Karnataka (Pancha Guarantees) `[KAS: Prelims-P2, Mains-GS3] [UPSC: Mains-GS3]`

- The Five Transformative Guarantees (Pancha Guarantee Schemes - Universal Social Protection Model):
  1. Gruha Lakshmi Scheme (Direct Benefit Transfer of ₹2,000 per month directly to Bank Account of the Woman Head of every Eligible Family / Largest Women Empowerment DBT Scheme in India).
  2. Gruha Jyothi Scheme (Provision of Free Domestic Electricity up to 200 units per month for all Domestic Households in Karnataka based on Average Consumption Patterns).
  3. Yuva Nidhi Scheme (Unemployment Financial Assistance Scheme for Educated Youth: ₹3,000 per month for Unemployed Graduates and ₹1,500 per month for Unemployed Diploma Holders for up to 2 years).
  4. Shakti Scheme (Free Bus Travel Scheme for all Domiciled Women, Transgenders & Students across Karnataka in Non-AC City, Suburban and Ordinary State Transport Buses - KSRTC, BMTC, NWKRTC, KKRTC).
  5. Anna Bhagya Scheme (Provision of 10 kg of Free Foodgrains / Rice per person per month to all BPL & Antyodaya Cardholders, with DBT Cash Component for additional grains).
- Comprehensive Social Security & Human Development Schemes:
  - Ksheera Bhagya Scheme (Provision of Free Nutritious Milk to School Children from Class 1 to 10 and Anganwadis 5 days a week).
  - Mathru Poorna Scheme (Midday Hot Cooked Nutritious Meal Programme for Pregnant and Lactating Women in Anganwadis to combat Maternal & Infant Malnutrition).
  - Ganga Kalyana Scheme (Free Drilling of Irrigation Borewells with Submersible Pumpsets & Power Supply for Marginal SC, ST & OBC Farmers).
  - Arivu Education Loan Scheme (Subsidised Higher Education Loan Scheme for Minority & Backward Classes Students pursuing Professional Courses).
  - Bhagyalakshmi Scheme (Financial Security & Life Insurance Scheme for the Girl Child in BPL Families).
  - Vidyasiri / Food and Accommodation Scheme (Financial Assistance for Post-Matric SC/ST/OBC Students studying in Colleges without Hostel Facility).

Regional Imbalances, Nanjundappa Committee & Kalyana Karnataka Development `[KAS: Prelims-P2, Mains-GS3] [UPSC: Mains-GS3]`

- Dr. D.M. Nanjundappa High Power Committee (High Power Committee on Redressal of Regional Imbalances in Karnataka / HPCFRRI 2002; Diagnostic Study of Socio-Economic Disparities between North Karnataka / Kalyana & Kittur Karnataka and South Karnataka / Old Mysore Region):
  - Comprehensive Deprivation Index (CDI) & Methodology (Computed based on 35 Socio-Economic Indicators across 5 Sectors: Agriculture, Industry, Economic Infrastructure, Social Infrastructure & Demography).
  - Classification of 175 Taluks in Karnataka: 39 Most Backward Taluks, 40 More Backward Taluks, 35 Backward Taluks, 61 Relatively Developed Taluks; Overwhelming Concentration of Backward Taluks in North Karnataka districts (Kalaburagi, Raichur, Bidar, Koppal, Yadgir, Vijayapura, Bagalkote).
  - Recommendations & Special Development Plan / SDP (Cumulative SDP Allocation Framework for Targeted Capital Infusion into Education, Healthcare, Irrigation, Connectivity & Industrial Decentralisation; Establishment of High Court Benches at Dharwad & Kalaburagi; Establishment of New Universities in Backward Districts; Ongoing Institutional Monitoring of Nanjundappa Committee Mandates).

==================================================
8. ENVIRONMENT, ECOLOGY & DISASTER MANAGEMENT `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`
==================================================

Environment, Ecology & Disaster Management

- Fundamental Ecology & Ecosystem Dynamics
- Biodiversity, Wildlife Conservation & Protected Areas
- Environmental Pollution, Waste Management & Remediation
- Climate Change Science, Carbon Markets & Global Conventions
- Environmental Legislation, Institutions & EIA in India
- Hazard Profiles & Disaster Vulnerability in India
- Institutional, Legal & Operational Framework
- Risk Reduction, Resilience & Global Conventions

Fundamental Ecology & Ecosystem Dynamics `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Ecosystem Hierarchy & Dynamics (Levels of Ecological Organisation - Organism, Population, Community, Ecosystem, Biome, Biosphere; Ecosystem Components - Abiotic vs Biotic; Ecosystem Functions - Productivity: Primary vs Secondary, Decomposition, Energy Flow, Nutrient Cycling)
- Energy Flow & Trophic Structure (Lakes & Forests Energy Dynamics, Lindeman's 10% Trophic Efficiency Law, Food Chains - Grazing Food Chain / GFC vs Detritus Food Chain / DFC, Complex Food Webs; Ecological Pyramids - Pyramid of Numbers: Upright vs Inverted / Tree Ecosystem, Pyramid of Biomass: Upright / Terrestrial vs Inverted / Aquatic, Pyramid of Energy: Always Upright)
- Biogeochemical Cycles (Gaseous Cycles - Carbon Cycle, Nitrogen Cycle / Nitrogen Fixation, Nitrification, Assimilation, Ammonification, Denitrification; Sedimentary Cycles - Phosphorus Cycle, Sulphur Cycle; Water / Hydrological Cycle)
- Ecological Interactions & Principles (Symbiotic Interactions - Mutualism, Commensalism; Antagonistic Interactions - Parasitism, Predation, Amensalism, Competition; Gause's Competitive Exclusion Principle; Ecological Succession - Primary vs Secondary Succession, Seral Stages, Pioneer Species vs Climax Community; Ecological Concepts - Niche / Fundamental vs Realised Niche, Habitat, Ecotone & Edge Effect, Carrying Capacity, Homeostasis)

Biodiversity, Wildlife Conservation & Protected Areas `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Biodiversity Fundamentals & Patterns (Three Levels - Genetic Diversity, Species Diversity, Ecosystem Diversity; Gradients of Biodiversity - Latitudinal Gradient, Species-Area Relationship / Alexander von Humboldt; Global Biodiversity Hotspots - Norman Myers Criteria: Western Ghats & Sri Lanka, Eastern Himalayas, Indo-Burma, Sundaland; Mega-Biodiverse Countries)
- In-Situ Conservation Architecture (Protected Area Network under Wildlife Protection Act 1972 - National Parks: Highest Protection, No Human Rights / Grazing; Wildlife Sanctuaries: Limited Human Activities Allowed; Conservation Reserves & Community Reserves; Biosphere Reserves - UNESCO Man and the Biosphere / MAB Programme: Core, Buffer & Transition Zones / 12 of 18 in WNBR network; Tiger Reserves / Project Tiger 1973 & National Tiger Conservation Authority / NTCA, M-STrIPES Monitoring; Elephant Reserves / Project Elephant 1992, MIKE Programme, Elephant Corridors; Marine Protected Areas / MPAs)
- Ex-Situ Conservation & Botanical Science (Botanical Gardens, Zoological Parks, Seed Banks, Gene Banks, Cryopreservation, Captive Breeding Programmes)
- Species Profiling & Conservation Status (IUCN Red List Categories - Extinct / EX, Extinct in the Wild / EW, Critically Endangered / CR: Great Indian Bustard, Gharial, Jerdon's Courser, Pygmy Hog, Hangul; Endangered / EN: Royal Bengal Tiger, Asian Elephant, Snow Leopard, One-horned Rhinoceros, Lion-tailed Macaque, Gangetic Dolphin; Vulnerable / VU: Olive Ridley Turtle, Dugong, Nilgiri Tahr; Conservation Classifications - Keystone Species, Umbrella Species, Flagship Species, Indicator Species, Invasive Alien Species / Lantana camara, Prosopis juliflora, Water Hyacinth)
- Aquatic Ecosystems & Coastal Conservation (Wetland Ecology - Wetland Classification, Ecological Services, Ramsar Convention on Wetlands 1971, Montreux Record / Keoladeo & Loktak Lake, Amrit Dharohar Initiative; Mangrove Ecosystems - Halophytes, Pneumatophores / Stilt Roots, Sundarbans, Bhitarkanika, MISHTI Scheme; Coral Reef Ecosystems - Fringing, Barrier, Atoll Reefs; Coral Bleaching - Thermal Stress, Zooxanthellae Expulsion, Ocean Acidification)

Environmental Pollution, Waste Management & Remediation `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Air Pollution & Atmospheric Quality (Major Pollutants - PM2.5, PM10, SO2, NO2, CO, Ozone / O3, Lead, Ammonia; National Air Quality Index / AQI; National Clean Air Programme / NCAP; Commission for Air Quality Management / CAQM in NCR; Stubble Burning / Parali Issue & Bio-decomposers; Vehicular Emissions - Bharat Stage VI / BS-VI Emission Norms, EV Transition / FAME Scheme; Industrial Pollution - Flue Gas Desulfurization / FGD, Fly Ash Management Rules; Acid Rain Dynamics & Photochemical Smog)
- Water Pollution & Aquatic Degradation (Pollution Indicators - Dissolved Oxygen / DO, Biochemical Oxygen Demand / BOD, Chemical Oxygen Demand / COD; Eutrophication & Algal Blooms, Dead Zones / Hypoxia; Industrial Effluents & Heavy Metal Poisoning - Minamata Disease / Mercury, Itai-Itai / Cadmium, Fluorosis, Arsenic Contamination in Gangetic Basin; River Rejuvenation - Namami Gange Programme, National River Conservation Plan; Groundwater Contamination & Depletion)
- Land Degradation, Soil Pollution & Desertification (Soil Salinisation, Waterlogging, Soil Erosion, Loss of Organic Carbon; United Nations Convention to Combat Desertification / UNCCD, Bonn Challenge / Restoration of Degraded Land, Land Degradation Neutrality / LDN Targets by 2030)
- Waste Management Architecture (Solid Waste Management Rules 2016 - Source Segregation, Waste-to-Energy, Sanitary Landfills; Plastic Waste Management Rules 2021 & 2022 Amendments - Ban on Single-Use Plastics / SUPs, Extended Producer Responsibility / EPR Framework; E-Waste Management Rules 2022 - Solar PV Modules Inclusion; Biomedical Waste Management Rules; Hazardous and Other Wastes Rules; Construction and Demolition / C&D Waste Management)
- Environmental Remediation Technologies (Bioremediation - In-situ: Bioventing, Biosparging; Ex-situ: Bioreactors; Phytoremediation - Phytoextraction, Phytodegradation, Rhizofiltration; Mycoremediation, Oilzapper Microbial Technology for Marine Oil Spills)

Climate Change Science, Carbon Markets & Global Conventions `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`

- Climate Change Science & Global Warming (Greenhouse Effect & Greenhouse Gases / GHGs - CO2, CH4, N2O, HFCs, PFCs, SF6, NF3; Global Warming Potential / GWP; Intergovernmental Panel on Climate Change / IPCC Assessment Reports / AR6 Synthesis Report - 1.5°C Warming Limit, Carbon Budget, Tipping Points, Sea Level Rise, Cryosphere Melting / Third Pole Thawing; Urban Heat Island / UHI Effect)
- International Climate Architecture & Treaties (United Nations Framework Convention on Climate Change / UNFCCC 1992 Earth Summit; Kyoto Protocol 1997 - Annex I vs Non-Annex I Parties, Clean Development Mechanism / CDM, Common But Differentiated Responsibilities and Respective Capabilities / CBDR-RC; Paris Agreement 2015 / COP21 - Nationally Determined Contributions / NDCs, Global Stocktake / GST, Long-Term Low Emission Development Strategies / LT-LEDS; Glasgow COP26 - India's Panchamrit Targets: Net-Zero by 2070, 500 GW Non-fossil Capacity, Mission LiFE; Sharm El-Sheikh COP27 & Dubai COP28 - Loss and Damage Fund, Global Renewables and Energy Efficiency Pledge)
- Carbon Markets & Economic Instruments (Carbon Pricing - Carbon Tax vs Cap-and-Trade Systems; Carbon Credits & Offsets, Article 6 of Paris Agreement / Article 6.2 Bilateral vs Article 6.4 Multilateral Mechanism; Carbon Credit Trading Scheme / CCTS in India under Energy Conservation Amendment Act 2022; EU Carbon Border Adjustment Mechanism / CBAM & Impact on Exports)
- Multilateral Environmental Agreements / MEAs (Chemical & Hazardous Waste Conventions - Stockholm Convention on Persistent Organic Pollutants / POPs / Dirty Dozen, Basel Convention on Transboundary Movement of Hazardous Wastes, Rotterdam Convention on Prior Informed Consent / PIC, Minamata Convention on Mercury; Ozone Layer Protection - Vienna Convention 1985, Montreal Protocol 1987 & Kigali Amendment 2016 / HFC Phase-down; Wildlife & Habitat Conventions - CITES / Convention on International Trade in Endangered Species, CMS / Bonn Convention on Migratory Species, International Whaling Commission)

Environmental Legislation, Institutions & EIA in India `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`

- Core Environmental Legislation (Wildlife Protection Act 1972 & Wildlife Protection Amendment Act 2022 - Rationalisation of Schedules from VI to IV, CITES Appendices Integration; Water Prevention and Control of Pollution Act 1974 & 2024 Amendment; Air Prevention and Control of Pollution Act 1981; Environment Protection Act 1986 / Umbrella Legislation Post-Bhopal Gas Tragedy; Forest Conservation Act 1980 & Van Sanrakshan Evam Samvardhan Adhiniyam 2023 / Forest Amendment Act; Biological Diversity Act 2002 & 2023 Amendment - Access and Benefit Sharing / ABS Mechanism; Forest Rights Act / FRA 2006 - Individual Forest Rights / IFR & Community Forest Rights / CFR)
- Environmental Impact Assessment & Regulatory Processes (Environmental Impact Assessment / EIA Notification 2006 & 2020 Draft Rules; Four Stages of EIA - Screening, Scoping, Public Consultation, Appraisal; Category A / Central MoEFCC vs Category B / State SEIAA Projects; Coastal Regulation Zone / CRZ Notifications - CRZ I, II, III, IV Ecosystem Zonation)
- Environmental Institutions & Statutory Bodies (Ministry of Environment, Forest and Climate Change / MoEFCC; Central Pollution Control Board / CPCB & State Pollution Control Boards / SPCBs; National Biodiversity Authority / NBA, State Biodiversity Boards / SBBs & Biodiversity Management Committees / BMCs; National Green Tribunal / NGT Act 2010 - Jurisdiction, Principles of Natural Justice, Polluter Pays Principle & Precautionary Principle; National Tiger Conservation Authority / NTCA; Wildlife Crime Control Bureau / WCCB; Genetic Engineering Appraisal Committee / GEAC; Compensatory Afforestation Fund Management and Planning Authority / CAMPA Act 2016)

Hazard Profiles & Disaster Vulnerability in India `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`

- Geophysical Hazards (Earthquakes - Seismic Zonation of India: Zone II to Zone V / High Seismic Vulnerability of Himalayas, Liquefaction, Bureau of Indian Standards / BIS Codes; Tsunamis - Subduction Zone Earthquakes, Early Warning Systems / INCOIS; Landslides - Western Ghats & Himalayan Vulnerability, National Landslide Susceptibility Mapping, Slope Stabilisation Techniques)
- Hydrometeorological Hazards (Floods - Brahmaputra & Gangetic Basin Inundations, River Bank Erosion, Structural vs Non-Structural Mitigation; Urban Flooding - Encroachment of Wetlands, Concretisation, Stormwater Drainage Deficits / Chennai, Mumbai, Bengaluru Floods; Cyclones - Bay of Bengal vs Arabian Sea Cyclones, Storm Surges, National Cyclone Risk Mitigation Project / NCRMP; Droughts - Meteorological, Hydrological, Agricultural & Socio-Economic Droughts, Drought Prone Areas Programme / DPAP; Heatwaves & Coldwaves - IMD Criteria, Urban Heat Islands, Heat Action Plans / HAPs; Glacial Lake Outburst Floods / GLOFs & Cloudbursts - Himalayan Cryosphere Degradation, Early Warning Sensor Systems)
- Anthropogenic & Technological Hazards (Industrial & Chemical Disasters - Toxic Gas Leaks / Bhopal Gas Disaster 1984, Petroleum Depots Fires; Nuclear Hazards - Nuclear Plant Safety, Radiation Leaks; Dam Failures & Breakages - Dam Safety Act 2021; Forest Fires - Controlled Burning, Sentinel Satellite Fire Alerts / Forest Survey of India; Biological Disasters & Epidemics - Public Health Emergency Framework)

Institutional, Legal & Operational Framework `[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`

- Disaster Management Act 2005 (Statutory Framework, Shift from Relief-Centric Reactive Approach to Proactive Prevention & Mitigation)
- Three-Tier Institutional Architecture (National Level - National Disaster Management Authority / NDMA chaired by Prime Minister, National Executive Committee / NEC; State Level - State Disaster Management Authority / SDMA chaired by Chief Minister; District Level - District Disaster Management Authority / DDMA co-chaired by District Magistrate / Collector & Zilla Parishad Chairperson)
- Operational & Capacity Building Agencies (National Disaster Response Force / NDRF - Specialised Multi-disciplinary Force, Standard Operating Procedures; State Disaster Response Force / SDRF; National Institute of Disaster Management / NIDM - Human Resource Development, Research, Capacity Building; Civil Defence & Home Guards; Aapda Mitra Scheme / Community Volunteer Training)
- Early Warning Infrastructure & Forecasting (India Meteorological Department / IMD - Doppler Weather Radars, Colour-Coded Weather Warnings: Green, Yellow, Orange, Red; Indian National Centre for Ocean Information Services / INCOIS - Tsunami & Ocean State Warning; Central Water Commission / CWC - Flood Forecasting Stations; Indian Space Research Organisation / ISRO - Disaster Management Support Programme)

Risk Reduction, Resilience & Global Conventions `[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`

- Global Frameworks & Protocols (Yokohama Strategy 1994, Hyogo Framework for Action 2005–2015; Sendai Framework for Disaster Risk Reduction 2015–2030 - Four Priorities for Action: Understanding Disaster Risk, Strengthening Disaster Risk Governance, Investing in Disaster Risk Reduction for Resilience, Enhancing Disaster Preparedness for Effective Response and to 'Build Back Better')
- Prime Minister's 10-Point Agenda on DRR (Integration of DRR into Development Planning, Disaster Risk Insurance, Women's Leadership in Disaster Management, Global Mapping of Disaster Risks, Leveraging Technology, Network of Universities, Social Media Utilities)
- Disaster Resilient Infrastructure & Global Alliances (Coalition for Disaster Resilient Infrastructure / CDRI - Global Initiative Launched by India; Infrastructure for Resilient Island States / IRIS; Disaster Resilient Housing, Retrofitting Infrastructure; Climate Change Adaptation / CCA & DRR Synergy)
- Financial Architecture for Disaster Management (National Disaster Response Fund / NDRF & National Disaster Mitigation Fund / NDMF under 15th Finance Commission Recommendations; State Disaster Response Fund / SDRF & State Disaster Mitigation Fund / SDMF; Parametric Insurance & Catastrophe Bonds)

==================================================
9. SCIENCE, TECHNOLOGY & DEFENCE `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`
==================================================

Science, Technology & Defence

- Space Technology & Astronomy
- Biotechnology, Health & Life Sciences
- Information & Communication Technology (ICT), AI & Cyber Security
- Defence Technology
- Nuclear Technology & Energy
- Nanoscience & Advanced Materials
- Applied & Fundamental Sciences

Space Technology & Astronomy `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Indian Space Programme & ISRO Missions (Lunar Exploration - Chandrayaan-1, 2, 3, LuPEX; Planetary & Solar Missions - Mangalyaan / MOM, Aditya-L1, Shukrayaan; Human Spaceflight Programme - Gaganyaan, Bharatiya Antariksha Station; Space Astronomy Observatories - AstroSat, XPoSat)
- Launch Vehicles & Propulsion Systems (Historical Launchers - SLV-3, ASLV; Operational Workhorses - PSLV, GSLV Mk II, LVM3 / GSLV Mk III, SSLV; Next-Gen Propulsion & Reusable Tech - RLV-TD, NGLV, Scramjet Engine Technology)
- Orbits, Satellite Navigation & Applications (Satellite Orbits - LEO, MEO, GEO/GSO, Sun-Synchronous Orbit, Molniya Orbit; Orbital Mechanics & Transfer Dynamics - Lagrange Points L1–L5, Gravity Assist, Hohmann Transfer; Regional & Global Navigation Systems - NavIC / IRNSS, GAGAN, GPS, GLONASS, Galileo)
- Deep Space Observatories, Cosmology & Astrophysics (Space & Ground Telescopes - James Webb Space Telescope, Hubble, Thirty Meter Telescope, Square Kilometre Array; Cosmic Phenomena & Astrophysics - Black Holes, Dark Matter & Dark Energy, Gravitational Waves & LIGO India, Exoplanets, Solar Flares & Coronal Mass Ejections)
- Space Governance, Commercialization & Space Environment (Space Debris & Sustainability - Kessler Syndrome, Project NETRA, IADC Guidelines; Space Law & Regulatory Bodies - Outer Space Treaty 1967, Artemis Accords, IN-SPACe, NewSpace India Limited)

Biotechnology, Health & Life Sciences `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Genomics, Genetics & Gene Editing (Molecular Biology Foundations - DNA, RNA, Plasmids, Chromosomes; Gene Editing Tools & Techniques - CRISPR-Cas9, TALENs, Zinc Finger Nucleases; Genome Sequencing Initiatives - Human Genome Project, Genome India Project, Earth BioGenome; Advanced Genetic Therapies - Gene Therapy, Somatic vs Germline Editing, Three-Parent Babies / Mitochondrial Replacement Therapy)
- Cell Biology & Reproductive Technology (Stem Cell Science - Embryonic Stem Cells, Induced Pluripotent Stem Cells / iPSCs, Cord Blood Banking; Assisted Reproductive Technologies - In Vitro Fertilization / IVF, Surrogacy Regulation, Amniocentesis, Pre-implantation Genetic Diagnosis)
- Immunology, Infectious Diseases & Public Health (Pathogens & Vectors - Viruses, Bacteria, Fungi, Protozoa, Prions; Zoonotic & Epidemic Diseases - COVID-19 / SARS-CoV-2, Dengue, Zika, Mpox, Ebola, Nipah, Malaria, Tuberculosis; Public Health Crises & Global Frameworks - Antimicrobial Resistance / AMR, Superbugs, One Health Approach, WHO Priority Pathogens)
- Vaccine Platforms & Advanced Therapeutics (Vaccine Technologies - mRNA Vaccines, Viral Vector Vaccines, Inactivated/Attenuated, Protein Subunit, DNA Vaccines; Targeted Immunotherapies - Monoclonal Antibodies, CAR-T Cell Therapy, Cancer Vaccines)
- Agricultural Biotechnology & Bio-Economy (Genetically Modified Organisms - Bt Cotton, GM Mustard / DMH-11, Golden Rice, Transgenic Crops; Advanced Crop Improvement - Tissue Culture, Marker-Assisted Selection, RNA Interference, Bio-fortification)

Information & Communication Technology (ICT), AI & Cyber Security `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Artificial Intelligence & Robotics (Core AI Paradigms - Machine Learning, Deep Learning, Neural Networks, Computer Vision, Natural Language Processing; Generative AI & Frontier Models - Large Language Models / LLMs, Multimodal AI, Deepfakes, Synthetic Media; Robotics & Autonomous Systems - Humanoid Robotics, Swarm Robotics, Autonomous Vehicles; AI Ethics & Global Governance - AI Bias, Responsible AI, Bletchley Declaration, IndiaAI Mission)
- Telecommunications & Wireless Infrastructure (Cellular Network Evolution - 1G to 5G Architecture, 6G Research, Open RAN; Short & Long-Range Wireless Technologies - Wi-Fi 6/7, Li-Fi, Bluetooth, NFC, RFID, Optical Fiber Infrastructure)
- High-Performance & Quantum Computing (High-Performance Computing - Supercomputing Architecture, National Supercomputing Mission, PARAM Siddhi, Pratyush, Mihir; Quantum Information Science - Qubits, Quantum Entanglement, Superposition, National Quantum Mission; Semiconductor Ecosystem - Microprocessors - Shakti & Vega, Wafer Fabrication, India Semiconductor Mission / ISM)
- Emerging Web Frameworks & Distributed Ledger Technology (Blockchain & Web 3.0 - Decentralized Architecture, Cryptocurrencies, Central Bank Digital Currency / CBDC, Smart Contracts; Advanced Digital Paradigms - Internet of Things / IoT, Edge Computing, Big Data Analytics, Spatial Computing / Metaverse)
- Cyber Security, Threats & Digital Governance (Vector Threats & Exploits - Malware, Ransomware, Phishing, Zero-Day Exploits, Pegasus / Spyware; Critical Information Infrastructure & Defense - CERT-In, NCIIPC, Cyber Swachhta Kendra; Digital Privacy & Legislation - Digital Personal Data Protection Act 2023, IT Act 2000)

Defence Technology `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Missile Systems & Artillery (Integrated Guided Missile Development Programme - IGMDP: Prithvi, Agni Series I–V, Trishul, Akash, Nag; Cruise & Hypersonic Systems - BrahMos, Nirbhay, Hypersonic Technology Demonstrator Vehicle / HSTDV; Air Defence & Artillery - S-400 Triumf, VSHORADS, Ballistic Missile Defence / BMD, Pinaka Rocket System)
- Naval Warfare & Submarines (Submarine Fleet - Project 75 Kalvari-class diesel-electric, Project 75I, Nuclear Submarines - INS Arihant & INS Arighat; Naval Aviation & Surface Combatants - Aircraft Carriers - INS Vikrant & INS Vikramaditya, Guided Missile Destroyers)
- Military Aviation & Unmanned Aerial Systems (UAVs) (Combat Aircraft & Helicopters - Tejas LCA, Advanced Medium Combat Aircraft / AMCA, Rafale, Prachand LCH; Unmanned Aerial Vehicles & Swarms - Rustom, Tapas-BH-201, Ghatak UCAV, Anti-Drone Systems, Swarm Drones)

Nuclear Technology & Energy `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Nuclear Energy Programme & Reactors (India's Three-Stage Nuclear Power Programme - Stage 1: PHWR & Natural Uranium, Stage 2: Fast Breeder Reactor / PFBR & Plutonium, Stage 3: Thorium-based Reactors; Reactor Installations - Kudankulam, Kakrapar, Kalpakkam / PFBR, KAMINI)
- Fundamental Particle Physics & Research Facilities (Nuclear Physics Reactions - Nuclear Fission, Nuclear Fusion, ITER Project, Tokamak; Particle Accelerators & Research - CERN, Large Hadron Collider, Higgs Boson, India-based Neutrino Observatory / INO; Applied Radioisotopes - Nuclear Medicine, Radiation Oncology, Food Irradiation, Industrial Radiography)
- International Nuclear Governance & Treaties (Global Regulatory Framework - IAEA, Non-Proliferation Treaty / NPT, Comprehensive Nuclear-Test-Ban Treaty / CTBT; Export Control Regimes - Nuclear Suppliers Group / NSG, Missile Technology Control Regime / MTCR, Australia Group, Wassenaar Arrangement)

Nanoscience & Advanced Materials `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`

- Nanotechnology Applications (Synthesis & Materials - Nanoparticles, Carbon Nanotubes / CNTs, Quantum Dots, Nano-emulsions; Sectoral Applications - Nano-fertilizers / Nano Urea, Targeted Drug Delivery, Nano-sensors, National Nano Mission)
- Advanced & Critical Materials (Advanced Functional Materials - Graphene, Aerogels, Metamaterials, Superconductors, Shape Memory Alloys; Strategic Critical Minerals - Lithium, Cobalt, Nickel, Rare Earth Permanent Magnets, KABIL Initiative)

Applied & Fundamental Sciences `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]`

- Applied Physics (Wave Optics & Radiation - Refraction, Total Internal Reflection, Polarization, Dispersion, Lasers, LED vs OLED vs Sodium Lamps; Electromagnetic Spectrum - Gamma Rays, X-Rays, UV, Visible, Infrared, Microwaves, Radio Waves)
- Applied Chemistry (Chemical Compounds & Industrial Materials - Acids & Bases, Polymers & Plastics, Surfactants, Food Preservatives; Clean Energy Chemistry - Ethanol Blending / E20, Compressed Bio-Gas / CBG, Green Hydrogen, Fuel Cells, Li-ion Batteries)
- Applied Biology & Human Physiology (Human Systems & Biochemistry - Hormones, Enzymes, Vitamins & Deficiency Diseases, Blood Groups & Transfusion; Plant Biology & Physiology - Photosynthesis, Nitrogen Fixation, Plant Hormones - Auxin, Cytokinin, Gibberellin)

==================================================
10. INTERNAL SECURITY `[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]`
==================================================

Internal Security

- Linkages between Development & Extremism (LWE)
- Terrorism, Insurgencies & Cross-Border Security
- Border Management & Coastal Security
- Transnational Organised Crime & Illicit Financial Flows
- Cyber Warfare, Critical Infrastructure & Digital Security
- Security Forces, Intelligence Agencies & Statutory Mandates

Linkages between Development & Extremism (LWE) `[UPSC: Mains-GS3]`

- Genesis & Ideology of Left-Wing Extremism (Naxalbari Uprising 1967 - Charu Majumdar, Kanu Sanyal; CPI / Maoist Formation 2004; Ideology of Protracted People's War & Overthrow of State; Red Corridor Geography - Dandakaranya Region, Bastar, Malkangiri, Jharkhand, Odisha, Andhra-Odisha Border / AOB)
- Root Causes of Left-Wing Extremism (Agrarian Distress & Feudal Exploitation, Tribal Land Alienation, Displacement due to Mining & Development Projects, Non-implementation of Forest Rights Act / FRA & PESA Act 1996, Mining Royalty Deficits, Governance Deficit & Lack of Basic Infrastructure - Healthcare, Education, Roads)
- Multi-Pronged Government Counter-LWE Strategy (Security Measures - Deployment of Central Armed Police Forces / CRPF CoBRA Commandos, Special Operations Group / SOG Greyhounds in Andhra/Telangana; SAMADHAN Doctrine - Smart Leadership, Aggressive Strategy, Motivation and Training, Actionable Intelligence, Dashboard-based KPIs, Harnessing Technology, Action Plan for each Theatre, No Access to Financing; Surrender and Rehabilitation Policies; Development Interventions - Road Requirement Plan / RRP, Mobile Towers Installation in LWE Areas, Eklavya Model Residential Schools / EMRSs, Aspirational Districts Programme, Post Office & Banking Access in Bastar)

Terrorism, Insurgencies & Cross-Border Security `[UPSC: Mains-GS3]`

- Cross-Border Terrorism & Proxy Warfare in Jammu & Kashmir (Historical Evolution of Pakistan-sponsored Proxy War; Terrorist Groups - Lashkar-e-Taiba / LeT, Jaish-e-Mohammed / JeM, Hizbul Mujahideen, The Resistance Front / TRF; Shift to Hybrid Terrorism, Sticky Bombs & Targeted Killings; Post-Article 370 Security Paradigm, Counter-Infiltration Grid / Line of Control, Operation All Out; De-radicalisation Programmes & Sports/Skill Engagement Schemes)
- Insurgency in North-East India (Historical Drivers - Ethnic Sub-nationalism, Influx of Illegal Immigrants, Porous International Borders, Geographic Isolation; Nagaland Insurgency - Naga National Council / NNC, NSCN-IM vs NSCN-K, Framework Agreement 2015 & Naga Peace Talks; Assam Insurgency - United Liberation Front of Asom / ULFA Pro-talks Accord 2023, Bodo Accords 2020; Manipur Ethnic Conflict & Insurgent Groups - Meitei UNLF, Kuki-Zo Militancy, Suspension of Operations / SoO Agreements; Peace Accords - Bru-Reang Settlement 2020, Karbi Anglong Agreement 2021)
- Religious & Political Radicalisation (Online Radicalisation Models, Lone-Wolf Attacks, ISIS / Al-Qaeda in Indian Subcontinent / AQIS propaganda; Counter-Radicalisation Strategies - Police Community Outreach, Cyber Patrols, Islamic Scholars Collaboration)

Border Management & Coastal Security `[UPSC: Mains-GS3]`

- Land Border Security Architecture (Total Land Borders 15,106.7 km across 7 Countries; Indo-Pak Border - Line of Control / LoC, International Border / IB, Sir Creek Dispute, Tunnels & Drone Infiltration; Indo-China Border - Line of Actual Control / LAC 3,488 km: Western / Ladakh, Middle / Uttarakhand-HP, Eastern / Arunachal Sectors, Infrastructure Build-up / Vibrant Villages Programme; Indo-Bangladesh Border - Enclaves Exchange / 100th Constitutional Amendment Act, Cattle Smuggling, Illegal Migration, Riverine Border Challenges; Indo-Myanmar Border - Free Movement Regime / FMR Review, Kaladan Multi-Modal Transit Transport Project, Insurgent Hideouts; Indo-Nepal & Indo-Bhutan Open Borders - Smuggling of Fake Currency, Narcotics, Human Trafficking)
- Smart Border Management Technologies (Comprehensive Integrated Border Management System / CIBMS - Thermal Imagers, Underground Seismic Sensors, Fiber-Optic Sensors, Radar, Micro-UAVs; BOLD-QIT Project on Bangladesh Border; Anti-Drone Systems & Jamming Technologies)
- Coastal & Maritime Security Architecture (7,516.6 km Coastline & Exclusive Economic Zone / EEZ; Post-26/11 Coastal Security Overhaul; Three-Tier Coastal Security Structure - Indian Navy / Deep Sea beyond 12 NM, Indian Coast Guard / ICG / 12 to 200 NM, State Coastal Marine Police / Territorial Waters up to 12 NM; Coastal Surveillance Network - Chain of Static Radars, Automatic Identification System / AIS, National Command Control Communication and Intelligence Network / NC3I Network; Sagar Prahari Bal; Biometric Cards for Fishermen & Vessel Tracking Systems)
- Island Security & Maritime Chokepoints (Strategic Value of Andaman & Nicobar Islands - Malacca Strait Chokepoint, Joint Services Command at Port Blair; Lakshadweep Islands - Nine Degree Channel Protection)

Transnational Organised Crime & Illicit Financial Flows `[UPSC: Mains-GS3]`

- Nexus Between Organised Crime & Terrorism (Crime-Terror Continuum; Mutual Logistics - Weapons, False Passports, Safe Houses, Intelligence; Financing Terrorism through Narcotics & Extortion)
- Drug Trafficking & Narco-Terrorism (India's Geopolitical Vulnerability - Sandwich between 'Golden Crescent' / Iran-Afghanistan-Pakistan & 'Golden Triangle' / Myanmar-Laos-Thailand; Synthetic Drugs & Darknet Trade, Maritime Drug Smuggling via Arabian Sea; Narcotics Control Bureau / NCB, Prevention of Illicit Traffic in Narcotic Drugs and Psychotropic Substances Act / PITNDPS, National Narcotics Coordination Portal / NCORD)
- Money Laundering, Hawala & Terror Financing (Hawala Informal Value Transfer Systems; Money Laundering Stages - Placement, Layering, Integration; Trade-Based Money Laundering / TBML; Prevention of Money Laundering Act / PMLA 2002 & Enforcement Directorate / ED Powers; Financial Intelligence Unit - India / FIU-IND; Fake Indian Currency Notes / FICN; Crypto Assets in Terror Financing)
- International Regimes Against Illicit Financing (Financial Action Task Force / FATF - 40 Recommendations on AML & 9 Special Recommendations on CFT, Mutual Evaluations, Grey List vs Black List Sanctions; UN Convention against Transnational Organized Crime / UNTOC / Palermo Convention; UN Convention Against Corruption / UNCAC)

Cyber Warfare, Critical Infrastructure & Digital Security `[UPSC: Mains-GS3]`

- Vector Threats & Digital Warfare (State-Sponsored Advanced Persistent Threats / APTs, Critical Infrastructure Attacks, Distributed Denial of Service / DDoS, Ransomware on Healthcare & Power Grids / AIIMS Ransomware Attack 2022, Supply Chain Attacks, Pegasus Spyware & Mobile Exploits)
- Critical Information Infrastructure / CII Protection (National Critical Information Infrastructure Protection Centre / NCIIPC under Section 70A of IT Act 2000; Sectoral Computer Emergency Response Teams / CERTs - Power, Finance, Telecom; Indian Computer Emergency Response Team / CERT-In - Incident Response, 6-Hour Reporting Mandate; Cyber Swachhta Kendra / Botnet Cleaning Center; Indian Cyber Crime Coordination Centre / I4C & National Cybercrime Reporting Portal)
- National Cyber Governance Framework (National Cyber Security Strategy; Information Technology Act 2000 & Section 66F / Cyber Terrorism; Digital Personal Data Protection Act 2023 / DPDP; International Cyber Norms - Budapest Convention on Cybercrime / India non-signatory, UN Group of Governmental Experts / UN GGE & Open-Ended Working Group / OEWG)

Security Forces, Intelligence Agencies & Statutory Mandates `[UPSC: Mains-GS3]`

- Central Armed Police Forces / CAPFs (Border Security Force / BSF - Indo-Pak & Indo-Bangladesh Borders; Central Reserve Police Force / CRPF - Internal Security & Counter-LWE Operations; Central Industrial Security Force / CISF - Critical Infrastructure, Airports, Metro Rail, Atomic Plants; Indo-Tibetan Border Police / ITBP - Indo-China Border / High Altitude Warfare; Sashastra Seema Bal / SSB - Indo-Nepal & Indo-Bhutan Borders; Assam Rifles - Indo-Myanmar Border & Counter-Insurgency in North-East / Dual Control under MHA & MoD; National Security Guard / NSG - Black Cats Counter-Terrorism Federal Contingency Force)
- Intelligence & Investigation Architecture (Intelligence Bureau / IB - Domestic Intelligence, Counter-Intelligence; Research and Analysis Wing / RAW - External Intelligence, Strategic Analysis; National Investigation Agency / NIA - Federal Counter-Terrorism Investigation Agency under NIA Act 2008 & 2019 Amendment / Extraterritorial Jurisdiction; National Intelligence Grid / NATGRID - Integrated Intelligence Master Database; Multi-Agency Centre / MAC - Real-time Intelligence Sharing Mechanism; National Technical Research Organisation / NTRO)
- Armed Forces Special Powers Act / AFSPA (Armed Forces (Special Powers) Act 1958 - Declaration of Disturbed Area under Section 3, Special Powers to Armed Forces: Arrest without Warrant, Fire upon Suspects, Search Premises; Legal Safeguards - Section 6 Prior Central Sanction for Prosecution; Supreme Court 1997 Guidelines / Naga People's Movement for Human Rights Case; Justice Jeevan Reddy Committee 2005 Recommendations; Progressive Phased Revocation of AFSPA in Assam, Nagaland & Manipur)

==================================================
11. ETHICS, INTEGRITY & APTITUDE `[UPSC: Mains-GS4] [KAS: Mains-GS4]`
==================================================

Ethics, Integrity & Aptitude

- Ethics & Human Interface
- Attitude & Aptitude
- Emotional Intelligence & Moral Thinkers
- Probity in Governance & Public Service Values
- Case Studies

Ethics & Human Interface `[UPSC: Mains-GS4] [KAS: Mains-GS4]`

- Essence, Determinants & Consequences of Ethics (Fundamentals of Ethics - Definition of Morality, Ethics, Values, Norms; Moral Relativism vs Absolutism; Determinants of Ethical Action - Object, Intention, Circumstance, Conscience, Intuition; Consequences of Ethics - Individual Peace, Social Harmony, Institutional Efficiency, Good Governance)
- Dimensions of Ethics (Domain-Specific Ethics - Personal Ethics, Professional Ethics, Public Life Ethics, Environmental Ethics, Bioethics, Media Ethics, Cyber Ethics)
- Human Values & Lessons from Great Leaders & Reformers (Values Exemplified by Thinkers & Reformers - Truth & Non-Violence: Mahatma Gandhi; Compassion: Buddha & Mahavira; Justice & Social Equality: B.R. Ambedkar; Rationalism: Raja Ram Mohan Roy; Service: Mother Teresa; Excellence & Integrity: A.P.J. Abdul Kalam)
- Role of Family, Society & Educational Institutions (Value Inculcation Agents - Role of Family in Early Socialisation, Role of Educational Institutions & Teachers, Role of Peer Groups & Mass Media)

Attitude & Aptitude `[UPSC: Mains-GS4] [KAS: Mains-GS4]`

- Content, Structure & Functions of Attitude (Attitude Architecture - ABC Model: Affective, Behavioural, Cognitive components; Functions of Attitude - Knowledge, Ego-Defensive, Value-Expressive, Utilitarian; Relation of Attitude to Thought & Behaviour - Cognitive Dissonance Theory / Leon Festinger, Attitude-Behaviour Gap)
- Moral & Political Attitudes (Ideological & Political Orientation - Political Socialisation, Political Tolerance, Moral Attitudes - Honesty, Duty, Justice)
- Social Influence & Persuasion (Persuasive Communication - Elaboration Likelihood Model, Source Credibility, Emotional Appeals, Nudge Theory / Richard Thaler, Social Proof)
- Foundational Values for Civil Services (Core Administrative Values - Integrity, Impartiality, Non-partisanship, Objectivity, Empathy, Tolerance, Compassion towards Vulnerable Sections, Commitment to Public Service)

Emotional Intelligence & Moral Thinkers `[UPSC: Mains-GS4] [KAS: Mains-GS4]`

- Concepts & Components of Emotional Intelligence (Emotional Intelligence Frameworks - Daniel Goleman Model: Self-awareness, Self-regulation, Internal Motivation, Empathy, Social Skills; Ability Model - Mayer-Salovey)
- Utilities of Emotional Intelligence in Governance (Administrative Applications of EI - Stress Management, Conflict Resolution, Public Crisis Management, Crisis Leadership, Team Building, Negotiation)
- Contributions of Moral Thinkers & Philosophers (Indian Moral Thinkers & Traditions - Kautilya Arthashastra Ethics, Thirukkural Principles, Swami Vivekananda's Practical Vedanta, Aurobindo, Rabindranath Tagore, Buddha, Mahavira; Western Moral Philosophers - Socrates, Plato's Cardinal Virtues, Aristotle's Virtue Ethics & Golden Mean, Immanuel Kant's Categorical Imperative & Deontology, J.S. Mill & Jeremy Bentham's Utilitarianism, John Rawls' Theory of Justice & Veil of Ignorance, Thomas Hobbes, John Locke, Jean-Jacques Rousseau)

Probity in Governance & Public Service Values `[UPSC: Mains-GS4] [KAS: Mains-GS4]`

- Concept of Public Service & Philosophical Basis of Governance (Public Trust Doctrine - Governance as Trusteeship, Public Interest, Accountability to Citizens)
- Transparency, RTI & Information Sharing (Open Governance - Right to Information as an Ethical Imperative, Proactive Disclosure, Freedom of Information)
- Codes of Ethics & Codes of Conduct (Governance Guidelines - Nolan Committee 7 Principles of Public Life: Selflessness, Integrity, Objectivity, Accountability, Openness, Honesty, Leadership; Central Civil Services Conduct Rules)
- Citizen's Charters, Work Culture & Quality of Service Delivery (Administrative Work Culture - Service Delivery Excellence, Professional Ethics, Punctuality, Responsiveness, Empathy in Service Delivery)
- Challenges of Corruption (Ethical Analysis of Corruption - Causes: Greed, Lack of Transparency, Monopoly, Discretion; Impact on Society; Prevention of Corruption Act, Lokpal & Lokayuktas, Whistleblower Protection)

Case Studies `[UPSC: Mains-GS4] [KAS: Mains-GS4]`

- Ethical Dilemmas in Administration & Public Life (Common Dilemma Scenarios - Rule of Law vs Compassion, Political Pressure vs Duty, Professional Integrity vs Friendship, Economic Development vs Environmental Protection)
- Conflict of Interest & Decision Making Under Pressure (Managing Conflicts - Personal Interest vs Public Duty, Pecuniary Interests, Recusal Mechanisms, Transparency)
- Crisis Management & Public Resource Allocation (Ethical Resource Distribution - Disaster Response Ethics, Triage in Emergency Healthcare, Vulnerable Section Prioritisation)

==================================================
12. GENERAL MENTAL ABILITY, QUANTITATIVE APTITUDE & COMPREHENSION `[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]`
==================================================

General Mental Ability, Quantitative Aptitude & Comprehension

- Reading Comprehension & Interpersonal Skills
- Quantitative Aptitude & Basic Numeracy
- General Mental Ability & Logical Reasoning

Reading Comprehension & Interpersonal Skills `[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: English] [Banking: English]`

- Reading Comprehension & Inference (Passage Analysis - Central Idea Identification, Author's Tone, Main Thesis vs Supporting Evidence; Inference & Assumption Testing - Logical Inferences, Implicit Assumptions, Direct & Indirect Conclusions; Passages Types - Economic, Philosophical, Scientific, Environmental, Social, Geopolitical Passages)
- Critical Reasoning & Analytical Ability (Logical Arguments - Strengthening & Weakening Arguments, Evaluating Premise & Conclusion, Paradox Resolution)
- Interpersonal & Communication Skills (Verbal Reasoning - Statement-Argument, Statement-Assumption, Course of Action, Cause & Effect)

Quantitative Aptitude & Basic Numeracy `[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [Banking: Quant]`

- Number Systems & Basic Arithmetic (Fundamentals of Numbers - Types of Numbers: Natural, Integers, Rational, Prime; Divisibility Rules, Unit Digit Calculations; Factors, Multiples & Remainders - LCM & HCF, Remainder Theorems, Number of Factors, Trailing Zeros)
- Percentages, Averages & Ratio-Proportion (Proportional Math - Percentages & Percentage Change, Averages & Weighted Averages, Mixtures & Alligations, Ratio & Proportion, Partnerships)
- Profit, Loss, Interest & Discount (Commercial Mathematics - Cost Price, Selling Price, Profit & Loss Percentage, Marked Price & Discounts, Simple Interest, Compound Interest & Compounding Frequency)
- Time, Work, Speed & Distance (Time & Motion Kinetics - Time & Work, Pipes & Cisterns, Speed-Time-Distance, Relative Speed, Problems on Trains, Boats & Streams)
- Permutation, Combination & Probability (Combinatorics - Fundamental Counting Principle, Factorials, Permutations / Arrangements, Combinations / Selections; Probability Science - Sample Space, Events, Independent & Mutually Exclusive Events, Conditional Probability)
- Mensuration & Geometry (Spatial Measurement - 2D Geometrical Shapes: Triangles, Circles, Quadrilaterals; Perimeter & Area; 3D Solids: Cubes, Cuboids, Cylinders, Cones, Spheres; Surface Area & Volume)

General Mental Ability & Logical Reasoning `[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [Banking: Reasoning]`

- Logical & Analytical Reasoning (Deductive Logic - Syllogisms / Venn Diagram & Rules Method, Logical Deductions; Spatial & Relational Logic - Linear & Circular Seating Arrangements, Blood Relations & Family Trees, Direction Sense & Compass Problems, Clocks & Calendar Calculations)
- Data Interpretation & Data Sufficiency (Data Formats - Bar Charts, Pie Charts, Line Graphs, Data Tables, Mixed Graphs; Data Sufficiency - Evaluating Sufficiency of Given Statements to Answer Questions)
- Problem Solving & Pattern Recognition (Coding, Series & Puzzles - Coding-Decoding, Number Series, Letter Series, Matrix & Grid Puzzles, Ranking & Ordering, Cube Folding & Dice)

==================================================
13. EDUCATIONAL PSYCHOLOGY, CHILD DEVELOPMENT & TEACHING PEDAGOGY `[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]`
==================================================

Educational Psychology, Child Development & Teaching Pedagogy

- Child Development & Growth Dynamics
- Theories of Learning, Cognition & Intelligence
- Inclusive Education, Diverse Learners & Special Needs (CWSN)
- Pedagogical Strategies, Curriculum & Classroom Management
- Educational Assessment, Evaluation & Measurement
- National Educational Policies, Legal Frameworks & Teacher Aptitude

Child Development & Growth Dynamics `[Teaching: KARTET, GPSTR, HSTR, CTET]`

- Concept of Growth & Development (Principles of Development - Cephalocaudal & Proximodistal Trends, Continuity, Individual Differences, Inter-relation; Stages of Human Development - Infancy, Early Childhood, Middle Childhood, Adolescence: Physical, Motor, Social, Emotional & Cognitive Milestones)
- Heredity & Environmental Determinants (Nature vs Nurture Debate, Role of Genetics & Heredity, Environmental Factors - Family, Parenting Styles, Schooling, Peer Groups, Socio-Economic Context, Bronfenbrenner's Ecological Systems Theory)
- Socialization Processes & Moral Growth (Agents of Socialization - Family, School, Peer Groups, Mass Media; Developing Self-Concept, Gender Identity & Stereotypes; Adolescent Dynamics - Identity vs Role Confusion / Erik Erikson, Emotional Turmoil, Peer Pressure & Career Orientation)

Theories of Learning, Cognition & Intelligence `[Teaching: KARTET, GPSTR, HSTR, CTET]`

- Cognitive Development Theories (Jean Piaget - Stages: Sensorimotor, Pre-operational, Concrete Operational, Formal Operational; Schemas, Assimilation, Accommodation, Equilibration; Lev Vygotsky - Socio-Cultural Perspective, Zone of Proximal Development / ZPD, Scaffolding, More Knowledgeable Other / MKO, Private Speech)
- Moral Development Frameworks (Lawrence Kohlberg - Pre-Conventional, Conventional, Post-Conventional Stages; Carol Gilligan Ethics of Care Critique)
- Behavioral & Constructivist Learning Paradigms (Ivan Pavlov Classical Conditioning - Stimulus, Response, Extinction; B.F. Skinner Operant Conditioning - Reinforcement & Punishment Schedules; Edward Thorndike Connectionism / Laws of Learning - Readiness, Exercise, Effect; Constructivist Learning - Jerome Bruner Discovery Learning, Representation Modes: Enactive, Iconic, Symbolic; Albert Bandura Social Learning Theory - Modeling, Observational Learning, Vicarious Reinforcement)
- Theories of Intelligence & Creativity (Charles Spearman Two-Factor Theory - General 'g' & Specific 's' factors; Howard Gardner Theory of Multiple Intelligences - 8 Intelligences: Linguistic, Logical-Mathematical, Spatial, Bodily-Kinesthetic, Musical, Interpersonal, Intrapersonal, Naturalistic; Robert Sternberg Triarchic Theory - Analytical, Creative, Practical; Emotional Intelligence in Education - Daniel Goleman Model; Creativity - Convergent vs Divergent Thinking, Fostering Innovation in Classrooms)

Inclusive Education, Diverse Learners & Special Needs (CWSN) `[Teaching: KARTET, GPSTR, HSTR, CTET]`

- Philosophy of Inclusive Education (Transition from Segregation & Integration to Mainstream Inclusion; Barrier-Free Environment; Universal Design for Learning / UDL; Equity vs Equality in Classrooms)
- Addressing Specific Learning Disabilities & Neurodiversity (Dyslexia - Reading Difficulty, Dysgraphia - Writing Impairment, Dyscalculia - Mathematical Disability, Dyspraxia - Motor Skills, Attention Deficit Hyperactivity Disorder / ADHD, Autism Spectrum Disorder / ASD)
- Educating Gifted, Talented & Underprivileged Learners (Identification of Gifted & Creative Children - Enriched Curriculum, Acceleration, Talent Search; Socio-Economically Disadvantaged Groups / SEDGs, First-Generation Learners, Gender Sensitization in Schooling)

Pedagogical Strategies, Curriculum & Classroom Management `[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1]`

- Teaching Methods & Models of Instruction (Teacher-Centered vs Learner-Centered Approaches; Problem-Based Learning / PBL, Project Method / William Kilpatrick, Inquiry-Based Learning, Collaborative & Cooperative Learning / Jigsaw Technique, Experiential Learning / David Kolb Cycle)
- Curriculum Planning & Taxonomy of Educational Objectives (Bloom's Revised Taxonomy - Cognitive Domain: Remembering, Understanding, Applying, Analyzing, Evaluating, Creating; Affective Domain / Krathwohl; Psychomotor Domain / Dave & Simpson; Micro-Teaching & Lesson Planning - 5E Model: Engage, Explore, Explain, Elaborate, Evaluate)
- Classroom Dynamics & Motivation Theories (Intrinsic vs Extrinsic Motivation; Abraham Maslow Hierarchy of Needs in Education; Self-Determination Theory; Classroom Management Strategies - Positive Behaviour Support / PBS, Restorative Practices, Conflict Resolution)

Educational Assessment, Evaluation & Measurement `[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1]`

- Assessment Paradigms (Assessment for Learning - Formative & Diagnostic Assessment; Assessment of Learning - Summative Evaluation; Assessment as Learning - Self & Peer Assessment; Continuous and Comprehensive Evaluation / CCE - Scholastic & Co-scholastic Domains)
- Tools & Techniques of Evaluation (Rubrics, Portfolios, Anecdotal Records, Cumulative Record Cards / CRC, Rating Scales, Checklists; Standardized vs Teacher-Made Tests; Test Construction - Reliability, Validity, Objectivity, Usability, Blueprint Preparation)
- Remedial Teaching & Feedback Mechanisms (Identifying Learning Gaps, Error Analysis, Tailored Remedial Interventions, Feedback Delivery - Specific, Timely & Actionable)

National Educational Policies, Legal Frameworks & Teacher Aptitude `[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]`

- National Education Policy 2020 (NEP 2020 Architecture - Foundational, Preparatory, Middle, Secondary 5+3+3+4 Stage Structure; Foundational Literacy & Numeracy / NIPUN Bharat Mission; Mother Tongue / Regional Language Medium; National Curriculum Framework / NCF-FS 2022 & NCF-SE 2023; PARAKH Assessment Centre; Higher Education Commission of India / HECI)
- Constitutional & Statutory Framework for Education (Article 21A Right to Free & Compulsory Education; Right of Children to Free and Compulsory Education Act 2009 / RTE Act - 25% EWS Reservation, Pupil-Teacher Ratio / PTR, No-Detention Policy & Amendment, School Management Committees / SMC; Protection of Children from Sexual Offences / POCSO Act 2012; Rights of Persons with Disabilities / RPwD Act 2016)
- Research & Teaching Aptitude for Higher Education / KSET / NET (Characteristics of Higher Education Teaching; Research Methodology - Qualitative vs Quantitative Methods, Experimental Research, Action Research, Sampling Techniques, Hypothesis Formulation, Academic Ethics, Citation Standards & Plagiarism Avoidance)

==================================================
14. LANGUAGE PROFICIENCY, GRAMMAR & COMMUNICATION (GENERAL KANNADA & GENERAL ENGLISH) `[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]`
==================================================

Language Proficiency, Grammar & Communication (General Kannada & General English)

- General Kannada Grammar & Structure (ಕನ್ನಡ ವ್ಯಾಕರಣ)
- Kannada Vocabulary, Usage & Idioms (ಶಬ್ದ ಸಂಪತ್ತು ಮತ್ತು ನುಡಿಗಟ್ಟುಗಳು)
- Kannada Literature, Authors & Sahitya Academy Awards (ಕನ್ನಡ ಸಾಹಿತ್ಯ ಪರಿಚಯ)
- Translation & Precis Writing (ಭಾಷಾಂತರ ಮತ್ತು ಸಂಕ್ಷೇಪಣ)
- General English Grammar & Syntax
- English Vocabulary, Idioms & Phrasal Verbs
- Reading Comprehension, Sentence Correction & Verbal Ability

General Kannada Grammar & Structure (ಕನ್ನಡ ವ್ಯಾಕರಣ) `[KPSC: CTI, FDA, SDA] [KEA: VAO] [KAS: Compulsory-Lang]`

- ವರ್ಣಮಾಲೆ ಮತ್ತು ಧ್ವನಿ ರಚನೆ (ಕನ್ನಡ ಅಕ್ಷರಮಾಲೆ - 49 ಅಕ್ಷರಗಳು: ಸ್ವರಗಳು 13, ಯೋಗವಾಹಗಳು 2, ವ್ಯಂಜನಗಳು 34; ವರ್ಗೀಯ ವ್ಯಂಜನಗಳು 25: ಅಲ್ಪಪ್ರಾಣ, ಮಹಾಪ್ರಾಣ, ಅನುನಾಸಿಕ; ಅವರ್ಗೀಯ ವ್ಯಂಜನಗಳು 9; ಹ್ರಸ್ವ ಸ್ವರ, ದೀರ್ಘ ಸ್ವರ, ಪ್ಲುತ ಸ್ವರ; ಸಂಧ್ಯಕ್ಷರಗಳು: ಐ, ಔ; ಗುಣಿತಾಕ್ಷರಗಳು ಮತ್ತು ಸಂಯುಕ್ತಾಕ್ಷರಗಳು / ಒತ್ತಕ್ಷರಗಳು: ಸಜಾತೀಯ, ವಿಜಾತೀಯ)
- ಸಂಧಿ ಪ್ರಕರಣ (ಕನ್ನಡ ಸಂಧಿಗಳು: ಲೋಪ ಸಂಧಿ, ಆಗಮ ಸಂಧಿ / ಯಕಾರಾಗಮ, ವಕಾರಾಗಮ, ಆದೇಶ ಸಂಧಿ / ಪ, ಬ, ಮ ಗಳಿಗೆ ವ, ಕ, ತ, ಪ ಗಳಿಗೆ ಗ, ದ, ಬ; ಸಂಸ್ಕೃತ ಸಂಧಿಗಳು: ಸವರ್ಣದೀರ್ಘ ಸಂಧಿ, ಗುಣ ಸಂಧಿ, ವೃದ್ಧಿ ಸಂಧಿ, ಯಣ್ ಸಂಧಿ, ಜಶ್ತ್ವ ಸಂಧಿ, ಶ್ಚುತ್ವ ಸಂಧಿ, ಅನುನಾಸಿಕ ಸಂಧಿ)
- ನಾಮಪದ ಮತ್ತು ವಿಭಕ್ತಿ ಪ್ರತ್ಯಯಗಳು (ನಾಮಪದಗಳ ಪ್ರಕಾರಗಳು: ರೂಢನಾಮ, ಅಂಕಿತನಾಮ, ಅನ್ವರ್ಥನಾಮ, ಭಾವನಾಮ, ಸರ್ವನಾಮ; ಲಿಂಗ, ವಚನ / ಏಕವಚನ-ಬಹುವಚನ; ವಿಭಕ್ತಿಗಳು ಮತ್ತು ಕಾರಕಾರ್ಥಗಳು: ಪ್ರಥಮಾ - ಕರ್ತೃ, ದ್ವಿತೀಯಾ - ಕರ್ಮ, ತೃತೀಯಾ - ಕರಣ, ಚತುರ್ಥಿ - ಸಂಪ್ರದಾನ, ಪಂಚಮೀ - ಅಪಾದಾನ, ಷಷ್ಠೀ - ಸಂಬಂಧ, ಸಪ್ತಮೀ - ಅಧಿಕರಣ, ಸಂಬೋಧನಾ ವಿಭಕ್ತಿ)
- ಸಮಾಸ ಪ್ರಕರಣ (ಸಮಾಸಗಳ ವಿಧಗಳು - ತತ್ಪುರುಷ ಸಮಾಸ, ಕರ್ಮಧಾರಯ ಸಮಾಸ, ದ್ವಿಗು ಸಮಾಸ, ಬಹುವ್ರೀಹಿ ಸಮಾಸ, ದ್ವಂದ್ವ ಸಮಾಸ, ಅಂಶಿ ಸಮಾಸ, ಗಮಕ ಸಮಾಸ, ಕ್ರಿಯಾ ಸಮಾಸ; ಪೂರ್ವಪದ, ಉತ್ತರಪದ, ಅನ್ಯಪದ ಪ್ರಾಧಾನ್ಯತೆ)
- ವಾಕ್ಯ ರಚನೆ ಮತ್ತು ಕರ್ತರಿ-ಕರ್ಮಣಿ ಪ್ರಯೋಗ (ಕ್ರಿಯಾಪದಗಳ ರಚನೆ - ಧಾತು, ಕಾಲಸೂಚಕ ಪ್ರತ್ಯಯ, ಆಖ್ಯಾತ ಪ್ರತ್ಯಯ; ಭೂತಕಾಲ, ವರ್ತಮಾನಕಾಲ, ಭವಿಷ್ಯತ್ಕಾಲ; ಪ್ರೇರಣಾರ್ಥಕ, ಸಂಭಾವನಾರ್ಥಕ, ನಿಷೇಧಾರ್ಥಕ ಕ್ರಿಯಾರೂಪಗಳು; ಕರ್ತರಿ ಪ್ರಯೋಗ ಮತ್ತು ಕರ್ಮಣಿ ಪ್ರಯೋಗ / 'ಅಲ್ಪಡು' ಧಾತು ಬಳಕೆ; ವಾಕ್ಯಗಳ ವಿಧಗಳು: ಸಾಮಾನ್ಯ ವಾಕ್ಯ, ಸಂಯೋಜಿತ ವಾಕ್ಯ, ಮಿಶ್ರ ವಾಕ್ಯ)

Kannada Vocabulary, Usage & Idioms (ಶಬ್ದ ಸಂಪತ್ತು ಮತ್ತು ನುಡಿಗಟ್ಟುಗಳು) `[KPSC: CTI, FDA, SDA] [KEA: VAO]`

- ತತ್ಸಮ-ತದ್ಭವ ಮತ್ತು ಶಬ್ದ ಮೂಲಗಳು (ಸಂಸ್ಕೃತ ಮೂಲ ತತ್ಸಮಗಳು ಮತ್ತು ಕನ್ನಡಕ್ಕೆ ಹೊಂದಿಕೊಂಡ ತದ್ಭವ ರೂಪಗಳು; ಅನ್ಯದೇಶ್ಯ ಶಬ್ದಗಳು: ಪರ್ಷಿಯನ್, ಅರೇಬಿಕ್, ಪೋರ್ಚುಗೀಸ್, ಇಂಗ್ಲಿಷ್ ಶಬ್ದಗಳು; ದೇಶ್ಯ ಶಬ್ದಗಳು)
- ಸಮಾನಾರ್ಥಕ, ನಾನಾರ್ಥಕ ಮತ್ತು ವಿರುದ್ಧ ಪದಗಳು (ಪರ್ಯಾಯ ಪದಕೋಶ, ನಾನಾರ್ಥ ಕೊಡುವ ಶಬ್ದಗಳು, ವಿರೋಧಾರ್ಥಕ ಶಬ್ದಗಳು, ಜೋಡುನುಡಿಗಳು / ಜೋಡುಪದಗಳು, ದ್ವಿರುಕ್ತಿಗಳು, ಅನುಕರಣಾವ್ಯಯಗಳು)
- ನುಡಿಗಟ್ಟುಗಳು ಮತ್ತು ಗಾದೆ ಮಾತುಗಳು (ಜನಪ್ರಿಯ ಕನ್ನಡ ನುಡಿಗಟ್ಟುಗಳ ಅರ್ಥ ವಿವರಣೆ, ಗಾದೆಗಳ ವಿಸ್ತರಣೆ ಮತ್ತು ತಾತ್ಪರ್ಯ, ಜನಪದ ನಾಣ್ಣುಡಿಗಳು, ಅರ್ಥವ್ಯತ್ಯಾಸ ತಿಳಿಸುವ ಪದಗಳು)
- ಅಲಂಕಾರ ಮತ್ತು ಛಂದಸ್ಸು (ಶಬ್ದಾಲಂಕಾರ: ಅನುಪ್ರಾಸ / ವೃತ್ಯಾನುಪ್ರಾಸ, ಛೇಕಾನುಪ್ರಾಸ; ಯಮಕ; ಚಿತ್ರಕವಿತೆ; ಅರ್ಥಾಲಂಕಾರ: ಉಪಮಾಲಂಕಾರ, ರೂಪಕಾಲಂಕಾರ, ದೃಷ್ಟಾಂತಾಲಂಕಾರ, ಉತ್ಪ್ರೇಕ್ಷಾಲಂಕಾರ, ಅರ್ಥಾಂತರನ್ಯಾಸಾಲಂಕಾರ; ಛಂದಸ್ಸು: ಮಾತ್ರಾಗಣ, ಅಕ್ಷರಗಣ, ಅಂಶಗಣ; ಕಂದ ಪದ್ಯ, ರಗಳೆ, ಷಟ್ಪದಿ: ಶರ, ಕುಸುಮ, ಭೋಗ, ಭಾಮಿನಿ, ವಾರ್ಧಕ, ಪರಿವರ್ಧಿನಿ; ವೃತ್ತಗಳು: ಉತ್ಪಲಮಾಲಾ, ಚಂಪಕಮಾಲಾ, ಶಾರ್ದೂಲವಿಕ್ರೀಡಿತ, ಮತ್ತೇಭವಿಕ್ರೀಡಿತ)

Kannada Literature, Authors & Sahitya Academy Awards (ಕನ್ನಡ ಸಾಹಿತ್ಯ ಪರಿಚಯ) `[KPSC: CTI, FDA, SDA] [KAS: Prelims-P1, Mains-GS1]`

- ಕನ್ನಡ ಸಾಹಿತ್ಯ ಚರಿತ್ರೆ ಮತ್ತು ಯುಗಗಳು (ಪೂರ್ವ ಹಳಗನ್ನಡ / ಕವಿರಾಜಮಾರ್ಗ, ಪಂಪ ಪೂರ್ವ ಯುಗ; ಹಳಗನ್ನಡ ಯುಗ / ಪಂಪ, ರನ್ನ, ಪೊನ್ನ, ಜನ್ನ, ನಾಗವರ್ಮ; ನಡುಗನ್ನಡ ಯುಗ / ವಚನ ಸಾಹಿತ್ಯ: ಬಸವೇಶ್ವರ, ಅಲ್ಲಮಪ್ರಭು, ಅಕ್ಕಮಹಾದೇವಿ, ಚನ್ನಬಸವಣ್ಣ; ಹರಿದಾಸ ಸಾಹಿತ್ಯ: ಪುರಂದರದಾಸರು, ಕನಕದಾಸರು, ವಿಜಯದಾಸರು; ರಗಳೆ & ಷಟ್ಪದಿ ಕವಿಗಳು: ಹರಿಹರ, ರಾಘವಾಂಕ, ಕುಮಾರವ್ಯಾಸ, ಚಾಮರಸ, ಲಕ್ಷ್ಮೀಶ; ಹೊಸಗನ್ನಡ ನವೋದಯ, ಪ್ರಗತಿಶೀಲ, ನವ್ಯ, ಬಂಡಾಯ ಮತ್ತು ದಲಿತ ಸಾಹಿತ್ಯ ಚಳವಳಿಗಳು)
- ಜ್ಞಾನಪೀಠ ಮತ್ತು ಕೇಂದ್ರ ಸಾಹಿತ್ಯ ಅಕಾಡೆಮಿ ಪ್ರಶಸ್ತಿ ಪುರಸ್ಕೃತರು (ಕನ್ನಡದ 8 ಜ್ಞಾನಪೀಠ ಪುರಸ್ಕೃತರು: ಕುವೆಂಪು, ದ.ರಾ. ಬೇಂದ್ರೆ, ಕೆ. ಶಿವರಾಮ ಕಾರಂತ, ಮಾಸ್ತಿ ವೆಂಕಟೇಶ ಅಯ್ಯಂಗಾರ್, ವಿ.ಕೃ. ಗೋಕಾಕ್, ಯು.ಆರ್. ಅನಂತಮೂರ್ತಿ, ಗಿರೀಶ್ ಕಾರ್ನಾಡ್, ಚಂದ್ರಶೇಖರ ಕಂಬಾರ; ಪ್ರಮುಖ ಕೃತಿಗಳು, ಕಾವ್ಯನಾಮಗಳು ಮತ್ತು ಬಿರುದುಗಳು)

Translation & Precis Writing (ಭಾಷಾಂತರ ಮತ್ತು ಸಂಕ್ಷೇಪಣ) `[KSP: PSI-Paper1] [KAS: Compulsory-Lang] [KEA: VAO]`

- English to Kannada Translation Principles (Contextual Translation vs Literal Translation, Technical & Administrative Terminology, Sentence Restructuring / SVO in English to SOV in Kannada, Translating Legal & Governance Idioms)
- Kannada to English Translation Principles (Grammatical Equivalence, Active Voice preference, Precision of Vocabulary, Paragraph Flow & Cohesion)
- Precis Writing & Comprehension (Summarization Methodology - 1/3rd Rule, Retaining Central Thesis, Elimination of Examples & Superfluous Details, Assigning Title; Passage Analysis & Direct Answer Framing)

General English Grammar & Syntax `[SSC: English] [KPSC: CTI, FDA, SDA] [KEA: VAO] [Banking: English]`

- Parts of Speech & Sentence Architecture (Nouns: Types, Countable/Uncountable, Plural Rules; Pronouns: Personal, Relative, Reflexive, Demonstrative; Adjectives & Degrees of Comparison; Adverbs: Time, Place, Manner, Frequency; Prepositions: Spatial, Temporal, Complex Prepositions; Conjunctions: Coordinating, Subordinating, Correlative; Interjections)
- Tenses, Verb Forms & Subject-Verb Agreement (Present, Past, Future Tense Sub-types - Simple, Continuous, Perfect, Perfect Continuous; Modal Auxiliaries - Can, Could, May, Might, Shall, Should, Will, Would, Must, Ought to; Subject-Verb Agreement Rules - Proximity, Collective Nouns, Indefinite Pronouns, Compound Subjects)
- Voice, Narration & Sentence Transformation (Active vs Passive Voice Conversion Rules across all tenses, Modals & Imperative sentences; Direct vs Indirect Speech / Narration - Tense backshifting, Reporting verbs, Pronoun & Time/Place adverbial shifts, Interrogative & Exclamatory conversions; Simple, Compound & Complex Sentence Transformations)

English Vocabulary, Idioms & Phrasal Verbs `[SSC: English] [Banking: English] [KPSC: CTI, FDA, SDA] [KEA: VAO]`

- Lexical Building Blocks (Root Words: Greek & Latin roots; Prefixes & Suffixes; Synonyms & Antonyms; Homonyms, Homophones & Commonly Confused Words; One-Word Substitutions)
- Idioms, Phrases & Phrasal Verbs (Popular Idiomatic Expressions with contextual meanings; Common Phrasal Verbs - Prepositional Verbs: Break down, Bring up, Call off, Carry out, Look into, Put up with, Turn down; Collocations in Business & Administrative English)

Reading Comprehension, Sentence Correction & Verbal Ability `[SSC: English] [Banking: English] [UPSC: Prelims-CSAT] [KAS: Prelims-P2]`

- Sentence Correction & Spotting Errors (Common Grammatical Errors - Dangling Modifiers, Redundancies, Misplaced Prepositions, Faulty Parallelism, Tense Inconsistencies, Double Negatives)
- Verbal Ability & Sentence Rearrangement (Para Jumbles / Sentence Reordering - Identifying Opening Sentences, Connecting Links, Pronoun References, Concluding Sentences; Cloze Test - Contextual Word Fillers; Sentence Completion & Double Fillers)

--------------------------------------------------
FUTURE EXTENSION PATTERNS
--------------------------------------------------

### 1. State-Specific Knowledge Injection (e.g., KPSC / KAS)
State-specific modules attach directly into the canonical subject pillars without altering core universal nodes:
- `History` → `Regional History` → `Karnataka History` `[KAS: Prelims-P1, Mains-GS1]` (Kadambas, Gangas, Chalukyas of Badami, Rashtrakutas, Hoysalas, Vijayanagara, Wodeyars of Mysore, Hyder Ali & Tipu Sultan, Unification of Karnataka Movement)
- `Geography` → `Regional Geography` → `Karnataka Geography` `[KAS: Prelims-P1, Mains-GS1]` (Physiography: Coastal Plains, Malnad, Maidan; River Basins: Krishna, Kaveri, Tungabhadra; Soils & Forests; Mineral Resources)
- `Indian Economy` → `Regional Economy` → `Karnataka State Economy` `[KAS: Prelims-P2, Mains-GS3]` (State Budget, GSDP Trends, IT/Biotech Corridor, Irrigation & Drought Management, State Welfare Schemes - Gruha Lakshmi, Yuva Nidhi, Anna Bhagya)

### 2. Content Attachment Model
Learning artifacts link directly to Node IDs:
- `PYQ` ➔ linked to `[Node_ID]` with exam tag (`year`, `exam: UPSC_CSE_2023`, `question_type: Prelims_MCQ / Mains_10M`)
- `Current_Affair_Article` ➔ linked to `[Node_ID]` with temporal stamp and context summary.
- `Mind_Map / Flashcard` ➔ generated automatically from node hierarchy and relationship edges.