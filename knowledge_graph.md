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
- Art, Architecture & Cultural Heritage of Karnataka
- Martial Arts, Traditional Sports & Indian Calendar Systems
- Cultural Institutions, Numismatics & Heritage Governance

Indian Architecture & Sculpture `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

### Harappan Architecture & Town Planning (Citadel, Great Bath, Granaries, Drainage System)

- **Harappan Citadel, Lower Town & Drainage Infrastructure** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Grid-iron layout, citadel on elevated platform, lower town residential quarters, Great Bath with gypsum mortar waterproofing, massive granaries, and underground covered drainage network with inspection manholes.
  *Key Concepts & Entities*: Grid-iron Town Plan • Citadel and Lower Town • Great Bath Mohenjo-daro • Brick Granaries • Covered Drainage Systems • Lothal Dockyard

- **Harappan Sculptures: Bronze Dancing Girl & Steatite Priest** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Lost-wax (cire-perdue) technique in bronze Dancing Girl of Mohenjo-daro, steatite bearded Priest-King draped in trefoil patterned shawl, red sandstone male torso, and terracotta Mother Goddess figurines.
  *Key Concepts & Entities*: Bronze Dancing Girl • Lost-Wax Technique (Cire-Perdue) • Steatite Priest-King • Trefoil Motif • Mother Goddess Figurines • Red Sandstone Male Torso

### Mauryan Art & Pillars (Ashokan Pillars, Stupas, Sanchi, Bharhut, Rock-Cut Caves - Barabar)

- **Ashokan Monolithic Pillars & Sarnath Lion Capital** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Chunar sandstone monolithic shafts with distinctive Mauryan high polish (glass-like sheen), animal capitals (Sarnath Lion Capital, Rampurva Bull, Lauriya-Nandangarh), abacus carvings, and Ashoka Chakra symbolism.
  *Key Concepts & Entities*: Ashokan Monolithic Pillars • Chunar Sandstone Polish • Sarnath Lion Capital • Dharmachakra Symbolism • Rampurva Bull Capital • Abacus Carvings

- **Mauryan Rock-Cut Caves & Didarganj Yakshini** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Barabar and Nagarjuni rock-cut caves dedicated to Ajivika ascetics (Lomas Rishi cave featuring horseshoe-shaped chaitya arch), and life-size polished freestanding stone statues including Didarganj Yakshini holding a flywhisk (chauri).
  *Key Concepts & Entities*: Barabar Hill Caves • Lomas Rishi Chaitya Arch • Ajivika Sect Patronage • Didarganj Yakshini • Parkham Yaksha • Chauri-bearer Sculpture

### Post-Mauryan Caves & Sculpture (Karle, Bhaja, Kanheri, Gandhara, Mathura & Amaravati Schools of Art)

- **Sculpture Schools: Gandhara, Mathura & Amaravati** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Comparative analysis of post-Mauryan sculpture schools: Gandhara (Greco-Roman Apollo-like Buddha, grey/blue schist, wavy hair), Mathura (indigenous, spotted red sandstone, seated fleshy Buddha, Jina, Brahmanical deities), Amaravati (white marble/limestone, dynamic narrative reliefs of Jataka tales).
  *Key Concepts & Entities*: Gandhara Art School • Greco-Buddhist Hybrid Style • Mathura Sculpture School • Spotted Red Sandstone • Amaravati School • White Marble Jataka Reliefs

- **Stupa Architecture (Sanchi) & Western Deccan Caves** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Structural components of Stupa (Anda hemispherical mound, Medhi circular terrace, Harmika square railing, Chhatra threefold umbrella, Torana gateways with intricate narrative carvings at Great Stupa Sanchi); Rock-cut Buddhist Chaityas (prayer halls) and Viharas (monasteries) at Karle, Bhaja, and Kanheri.
  *Key Concepts & Entities*: Great Stupa Sanchi • Torana Gateways • Harmika & Chhatra • Karle Grand Chaitya • Bhaja & Bedse Caves • Rock-cut Viharas

### Temple Architecture Styles (Nagara Style - Odisha, Khajuraho, Solanki; Dravida Style - Pallava, Chola, Vijayanagara; Vesara / Chalukyan Style - Badami, Pattadakal, Hoysala)

- **Nagara Style Temple Architecture (Odisha, Khajuraho, Solanki)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  North Indian Nagara style (curvilinear Shikhara / Rekha-Prasad, Phamsana, Valabhi, Amalaka, Kalasha); Sub-schools: Odisha (Deula, Jagamohana - Konark Sun Temple, Lingaraj), Khajuraho (erotic sculptures, Panchayatana plan, Kandariya Mahadeva), Solanki / Maru-Gurjara (stepped tank Surya Kund at Modhera, Dilwara Jain temples with carved white marble ceilings).
  *Key Concepts & Entities*: Nagara Architecture • Rekha-Prasad Shikhara • Amalaka & Kalasha • Khajuraho Panchayatana Style • Kandariya Mahadeva Temple • Odisha Deula Style • Modhera Sun Temple • Dilwara Marble Carvings

- **Dravida Style Temple Architecture (Pallava, Chola, Nayaka)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  South Indian Dravida style characterized by pyramidal stepped tower (Vimana), monumental entrance gateways (Gopurams), pillared assembly halls (Mandapas), sacred water tanks, and enclosed Prakara walls; Evolution through Pallavas (Shore Temple Mahabalipuram), Imperial Cholas (Brihadeeswara Temple Thanjavur), and Madurai Nayakas (Meenakshi Temple thousand-pillared halls).
  *Key Concepts & Entities*: Dravida Style Architecture • Pyramidal Vimana • Monumental Gopuram • Brihadeeswara Temple Thanjavur • Mahabalipuram Shore Temple • Nayaka Mandapas • Prakara Enclosures

- **Vesara Hybrid Style & Monolithic Rock-Cut Kailasa** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Vesara / Karnataka hybrid school blending Nagara curvilinear profile with Dravida tier articulation; Early experimentation at Aihole, Badami, and Pattadakal (Virupaksha Temple); Pinnacle of rock-cut monolithic excavation in Kailasanatha Temple (Cave 16, Ellora) carved top-down under Rashtrakuta King Krishna I.
  *Key Concepts & Entities*: Vesara Architectural Style • Aihole Experimentation • Pattadakal Virupaksha • Kailasanatha Temple Ellora (Cave 16) • Top-down Monolithic Excavation • Rashtrakuta Patronage

### Indo-Islamic Architecture (Imperial / Delhi Sultanate Style, Provincial Styles, Mughal Architecture - Taj Mahal, Fatehpur Sikri, Red Fort)

- **Delhi Sultanate Architecture (Mamluk, Khalji, Tughlaq, Lodi)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Introduction of true arch (arcuate system), dome, minarets, and geometric arabesque / calligraphic motifs; Mamluk (Qutub Minar, Quwwat-ul-Islam), Khalji (Alai Darwaza red sandstone with white marble), Tughlaq (sloping battered walls, grey stone, Tughlaqabad), and Lodi period (octagonal tombs, double dome introduction).
  *Key Concepts & Entities*: Arcuate Architectural System • True Arch and Dome • Qutub Minar Complex • Alai Darwaza • Tughlaq Battered Walls • Lodi Double Dome Tombs

- **Mughal Architecture: Charbagh, Red Sandstone & Marble Inlay** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  High aesthetic synthesis of Persian, Central Asian, and indigenous Indian traditions; Humayun's Tomb (first Charbagh garden tomb and Persian double dome), Akbar's Fatehpur Sikri (Buland Darwaza, Panch Mahal, Jodha Bai palace), Jahangir's Itimad-ud-Daulah (pioneering Pietra Dura floral inlay), and Shah Jahan's white marble masterpieces (Taj Mahal, Red Fort, Jama Masjid Delhi).
  *Key Concepts & Entities*: Charbagh Garden Layout • Humayun's Tomb • Fatehpur Sikri & Buland Darwaza • Pietra Dura Inlay Technique • Taj Mahal Architecture • Red Fort Diwan-i-Khas

### Colonial & Modern Architecture (Indo-Saracenic Architecture, Neo-Gothic Style, Neo-Classical Style, Lutyens' Delhi)

- **Colonial Indo-Saracenic & Neo-Gothic Architecture** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Portuguese Baroque churches in Old Goa (Basilica of Bom Jesus, Se Cathedral); British colonial architectural styles: Neo-Classical, Victorian Neo-Gothic (Chhatrapati Shivaji Maharaj Terminus Mumbai, St. Paul's Cathedral Kolkata), and Indo-Saracenic synthesis (Gateway of India, Victoria Memorial, Madras High Court).
  *Key Concepts & Entities*: Indo-Saracenic Style • Victorian Neo-Gothic • CSMT Mumbai • Victoria Memorial Kolkata • Goan Baroque Architecture • Basilica of Bom Jesus

- **Modern & Post-Independence Architecture (Lutyens, Corbusier, Baker)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Imperial New Delhi planned by Edwin Lutyens and Herbert Baker (Rashtrapati Bhavan, Parliament House, India Gate); Post-independence modernist city planning by Le Corbusier in Chandigarh (Capitol Complex, concrete brise-soleil); Sustainable, vernacular cost-effective brick architecture of Laurie Baker in Kerala.
  *Key Concepts & Entities*: Lutyens' Delhi Plan • Rashtrapati Bhavan Architecture • Le Corbusier Capitol Complex Chandigarh • Laurie Baker Vernacular Architecture • Post-Independence Modernism

Indian Paintings & Visual Arts `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

### Prehistoric Rock Art (Bhimbetka, Lakhudiyar, Kupgallu)

- **Prehistoric Rock Paintings: Bhimbetka & Lakhudiyar** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Upper Palaeolithic and Mesolithic rock art at UNESCO site Bhimbetka (Madhya Pradesh) and Lakhudiyar (Uttarakhand); natural mineral pigments (red ochre/geru, white from limestone), stick-like human figures, group dancing, animal hunt depictions (bison, boars, deer, elephants).
  *Key Concepts & Entities*: Bhimbetka Caves Rock Art • Mesolithic Hunting Scenes • Red Ochre and White Pigments • Lakhudiyar Rock Shelters • Prehistoric Zoo Rock

### Ancient & Medieval Murals (Ajanta Caves, Ellora, Bagh Caves, Sittanavasal, Lepakshi)

- **Classical Murals: Ajanta, Ellora, Bagh & Sittanavasal** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Technique of Indian mural painting (clay, cow dung, straw plaster ground with lime coat and tempera pigments); Masterpieces at Ajanta Caves (Bodhisattva Padmapani and Vajrapani in Cave 1, Mahajanaka Jataka, Dying Princess), Ellora Kailasa murals, Bagh cave paintings, and Jain murals at Sittanavasal (Pudukkottai).
  *Key Concepts & Entities*: Ajanta Cave Murals • Bodhisattva Padmapani Fresco-Secco • Tempera Technique • Sittanavasal Jain Murals • Bagh Cave Paintings • Jataka Tale Narrative Panels

### Miniature Painting Traditions (Pala & Jain Manuscript Paintings, Mughal School, Rajasthani Schools - Mewar, Marwar, Kishangarh Bani Thani, Pahari Schools - Basohli, Kangra)

- **Mughal Miniatures: Court Chronicles, Realism & Portraiture** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Development of Mughal atelier under Akbar (Hamzanama, Razmnama, Tasvir Khana, blending Persian delicacy with Indian dynamism), Jahangir (flora and fauna naturalism, Ustad Mansur's Siberian crane and dodo paintings, European halo/perspective influence), and Shah Jahan (luxurious gold illumination, static court ceremonies).
  *Key Concepts & Entities*: Mughal Miniature Atelier • Akbari Illustrated Manuscripts (Hamzanama) • Jahangir Flora & Fauna Realism • Ustad Mansur Bird Paintings • Karkhana Painting Studio

- **Rajasthani Miniatures: Kishangarh, Mewar, Bundi & Kota** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Lyrical court and devotional schools of Rajasthan: Mewar (deep vibrant colors, Chawand Ragamala), Bundi and Kota (lush vegetation, hunting expeditions, dramatic skies), and Kishangarh School famous for Radha / 'Bani Thani' painted by Nihal Chand featuring elongated almond eyes and graceful sharp features.
  *Key Concepts & Entities*: Bani Thani (Indian Mona Lisa) • Kishangarh School • Nihal Chand Artist • Mewar Ragamala Paintings • Bundi-Kota Hunting Scenes • Vaishnavite Devotional Themes

- **Pahari (Kangra, Basohli) & Deccani Miniature Schools** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Pahari schools of Himalayan foothills: Basohli (bold fiery colors, beetle-wing casing jewelry, Rasamanjari) and Kangra (refined poetic grace, soft landscapes, Gita Govinda romance under Raja Sansar Chand); Deccani schools of Bijapur, Golconda, and Ahmadnagar (Persian elegance, rich lapis lazuli gold palette, Tarif-i-Husain Shahi).
  *Key Concepts & Entities*: Basohli School Rasamanjari • Kangra Gita Govinda Paintings • Raja Sansar Chand Patronage • Deccani Sultanate Miniatures • Bijapur Portraiture • Najm-ul-Ulum Manuscript

### Folk & Regional Painting Styles (Madhubani / Mithila, Kalamkari, Pattachitra, Warli, Tanjore Paintings, Phad, Gond, Cheriyal)

- **Folk Paintings: Madhubani, Pattachitra & Kalamkari** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Madhubani / Mithila painting of Bihar (ritual wall and floor Kohbar/Aripana art, double line borders, natural dye figures of deities), Pattachitra of Odisha (narrative cloth scrolls painted with tamarind seed glue and mineral colors, Jagannath themes), and Kalamkari of Andhra Pradesh (Srikalahasti freehand temple hangings vs Machilipatnam block-printed textiles).
  *Key Concepts & Entities*: Madhubani / Mithila Painting • Odisha Pattachitra on Cloth • Kalamkari (Srikalahasti & Machilipatnam) • Natural Mineral & Vegetable Dyes • Kohbar Marriage Murals

- **Tribal & Ritual Paintings: Warli, Gond & Pithora** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Warli painting of Maharashtra (monochrome white rice paste on cow-dung mud walls, geometric circles of life, Tarpa dance), Gond painting of central India (dot and line patterns expressing forest ecology, Jangarh Singh Shyam), and Pithora ritual murals of Rathwa tribes in Gujarat.
  *Key Concepts & Entities*: Warli Tribal Art • Tarpa Dance Circle Motif • Gond Art (Dot & Line Style) • Jangarh Singh Shyam • Pithora Ritual Wall Murals • Saura Paintings

Performing Arts (Dance, Music, Theatre & Puppetry) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

### Classical Dance Traditions (Bharatanatyam, Kathak, Kathakali, Kuchipudi, Manipuri, Mohiniyattam, Odissi, Sattriya)

- **Classical Dances: Bharatanatyam, Odissi & Kuchipudi** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Sangeet Natak Akademi recognized classical forms: Bharatanatyam of Tamil Nadu (temple Devadasi solo dance, Ekaharya, Alarippu to Tillana, Lasya and Tandava aspects), Odissi of Odisha (sculptural Tribhanga deflection, Chowk stance, Mahari tradition), and Kuchipudi of Andhra Pradesh (dance-drama, Tarangam dancing on rim of brass plate with water pot, Manduka Shabdam).
  *Key Concepts & Entities*: Bharatanatyam (Ekaharya Tradition) • Alarippu & Tillana • Odissi Tribhanga Posture • Mahari & Gotipua Traditions • Kuchipudi Tarangam (Brass Plate Dance) • Manduka Shabdam

- **Classical Dances: Kathak, Kathakali & Mohiniyattam** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Kathak of North India (storytellers/Kathakars, rhythmic footwork Tatkar, pirouettes Chakkars, Gharanas of Lucknow, Jaipur, Banaras), Kathakali of Kerala (male dance-drama, stylized facial expressions Navarasas, green Paccha noble makeup vs red Kathi villainous makeup), and Mohiniyattam of Kerala (dance of the enchantress, graceful Lasya swaying movements, distinctive white and gold Kasavu costume).
  *Key Concepts & Entities*: Kathak Gharanas (Lucknow, Jaipur, Banaras) • Tatkar Footwork & Chakkars • Kathakali Facial Makeup (Paccha, Kathi, Minukku) • Navarasas Facial Expressions • Mohiniyattam Lasya Dance • Kerala Kasavu Costume

- **Classical Dances: Manipuri, Sattriya & Chhau** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Manipuri of Manipur (Vaishnavite Rasleela, barrel-shaped Potloi skirt, graceful serpentine movements, dynamic Pung Cholom drum dance), Sattriya of Assam (monastic Vaishnavite dance founded by Srimanta Sankardeva, performance in Sattras, Borgeet devotional accompaniment), and Chhau dance (semi-classical martial mask dance of Purulia, Seraikela, and Mayurbhanj, UNESCO ICH).
  *Key Concepts & Entities*: Manipuri Rasleela • Pung Cholom Drum Dance • Potloi Skirt Costume • Sattriya Dance of Assam • Srimanta Sankardeva Sattras • Chhau Martial Mask Dance (Purulia, Seraikela, Mayurbhanj)

### Folk Dances of India (Bhangra, Ghoomar, Chhau, Garba, Lavani, Yakshagana, Bihu, Rouf, Koodiyattam)

- **Major Regional Folk Dances Across Indian States** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Celebrated regional folk dances: Bhangra and Giddha (Punjab), Garba and Dandiya Raas (Gujarat), Ghoomar and Kalbelia (Rajasthan snake-charmer dance, UNESCO ICH), Lavani and Koli (Maharashtra), Bihu (Assam harvest dance), Cheraw (Mizoram bamboo dance), Rouf (Jammu & Kashmir), Hojagiri (Tripura), and Theyyam (Kerala ritual dance).
  *Key Concepts & Entities*: Bhangra & Giddha • Garba & Dandiya • Ghoomar & Kalbelia (UNESCO) • Lavani of Maharashtra • Bihu Harvest Dance Assam • Cheraw Bamboo Dance Mizoram • Theyyam Ritual Dance Kerala

### Indian Classical Music Systems (Hindustani Music - Dhrupad, Khayal, Thumri, Tappa; Carnatic Music - Kriti, Varnam, Ragam Tanam Pallavi)

- **Hindustani Classical Music: Thaats, Gharanas & Forms** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Hindustani music foundation: Swara, Raga, Tala, 10-Thaat classification system by V.N. Bhatkhande; Musical forms: Dhrupad (austere spiritual style, Dagar gharana), Khayal (improvisational style, Gwalior, Kirana, Agra, Patiala gharanas), semi-classical Thumri, Dadra, Tappa, and Tarana.
  *Key Concepts & Entities*: Hindustani 10 Thaats • Dhrupad Vocal Style • Khayal and Major Gharanas • V.N. Bhatkhande Classification • Thumri Semi-Classical • Tala and Laya

- **Carnatic Classical Music: Melakarta, Trinity & Kriti** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  South Indian Carnatic tradition based on 72 Melakarta parent ragas schema formulated by Venkatamakhin; Revered Trinity of Carnatic Music (Tyagaraja, Muthuswami Dikshitar, Syama Sastri); Contributions of Purandara Dasa (Pitamaha of Carnatic music); Musical compositions: Varnam, Kriti (Pallavi, Anupallavi, Charanam), Ragam-Tanam-Pallavi (RTP), and Tillana.
  *Key Concepts & Entities*: Carnatic Trinity (Tyagaraja, Dikshitar, Syama Sastri) • 72 Melakarta Raga Scheme • Purandara Dasa (Carnatic Pitamaha) • Kriti Structure (Pallavi, Anupallavi, Charanam) • Ragam-Tanam-Pallavi • Varnam & Tillana

### Musical Instruments & Folk Music (Stringed / Tat, Wind / Sushira, Percussion / Avanaddha, Solid / Ghana; Baul, Bihu, Pandavani, Bhatiali)

- **Fourfold Classification of Musical Instruments (Vadya)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Ancient Natya Shastra classification into four musical categories: Tata Vadya (stringed chordophones: Sitar, Saraswati Veena, Sarod, Santoor), Sushira Vadya (wind aerophones: Bansuri bamboo flute, Shehnai, Nadaswaram), Avanaddha Vadya (percussion membranophones: Tabla, Mridangam, Pakhawaj, Dholak), and Ghana Vadya (solid idiophones: Ghatam clay pot, Manjira, Jaltarang).
  *Key Concepts & Entities*: Tata Vadya (Chordophones - Sitar, Veena) • Sushira Vadya (Aerophones - Shehnai, Bansuri) • Avanaddha Vadya (Membranophones - Mridangam, Tabla) • Ghana Vadya (Idiophones - Ghatam, Manjira) • Natya Shastra Vadya Classification

### Traditional Theatre Forms & Puppetry (Yakshagana, Nautanki, Jatra, Bhavai, Tamasha, Dashavatar, Bhand Pather; String, Glove, Rod & Shadow Puppetry)

- **Traditional Folk Theatre & Puppetry Traditions of India** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Folk theatre forms: Bhavai (Gujarat), Nautanki (Uttar Pradesh), Tamasha (Maharashtra), Jatra (Bengal), Koodiyattam (Kerala Sanskrit temple theatre, UNESCO ICH), Maach (Madhya Pradesh), Bhand Pather (Kashmir); Four Indian puppetry traditions: String (Kathputli Rajasthan, Gombeyatta Karnataka), Shadow (Togalu Gombeyaata Karnataka, Tholu Bommalata Andhra, Ravanchhaya Odisha), Rod (Putul Nach Bengal, Yampuri Bihar), and Glove (Pavakoothu Kerala).
  *Key Concepts & Entities*: Koodiyattam Sanskrit Theatre (UNESCO) • Bhavai & Tamasha Folk Theatres • Nautanki & Jatra • Kathputli String Puppetry • Togalu Gombeyaata Shadow Puppets • Tholu Bommalata • Pavakoothu Glove Puppets

Indian Literature & Languages `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

### Vedic, Epic & Puranic Literature (Rigveda, Samaveda, Yajurveda, Atharvaveda, Upanishads, Mahabharata, Ramayana, Puranas)

- **Vedic Corpus: Samhitas, Brahmanas, Aranyakas & Upanishads** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Structure of Vedic literature: Four Samhitas (Rigveda hymns, Samaveda chants, Yajurveda sacrificial formulas, Atharvaveda spells and daily life), ritualistic Brahmanas, mystical Aranyakas (forest texts), and philosophical Upanishads / Vedanta expounding the metaphysical relationship between Atman and Brahman (Principal 108 Upanishads, Satyameva Jayate from Mundaka Upanishad).
  *Key Concepts & Entities*: Four Vedas (Rig, Sama, Yajur, Atharva) • Brahmanas Ritual Explanations • Aranyakas Forest Treatises • Upanishads (Mundaka, Chandogya, Mandukya) • Atman-Brahman Philosophy • Satyameva Jayate Motto

### Classical & Religious Texts (Buddhist Canon - Tripitakas, Jatakas; Jain Canon - Agamas; Sangam Literature - Ettuthokai, Pattupattu, Silappatikaram, Manimekalai)

- **Classical Sanskrit Literature: Kalidasa, Bhasa & Epics** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Golden age of classical Sanskrit dramatic and poetic literature: Kalidasa's plays (Abhijnanashakuntalam, Malavikagnimitram) and epics (Raghuvamsha, Kumarasambhava, Meghaduta); Plays of Bhasa (Svapnavasavadatta), Shudraka (Mrichhakatika / The Little Clay Cart), Vishakhadatta (Mudrarakshasa political drama), and Harsha (Ratnavali, Priyadarsika, Nagananda).
  *Key Concepts & Entities*: Kalidasa Dramatic Works • Abhijnanashakuntalam • Meghaduta Lyric Poem • Shudraka's Mrichhakatika • Vishakhadatta's Mudrarakshasa • Bhasa's Plays

- **Sangam Literature Corpus: Ettuthokai, Pattupattu & Epics** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Early Tamil Sangam literature composed in three royal academies at Madurai: Ettuthokai (Eight Anthologies), Pattupattu (Ten Idylls), Tolkappiyam (foundational grammar and poetics by Tolkappiyar), categorized into Akam (internal personal love poetry) and Puram (external heroic war poetry); Five Great Tamil Epics (Aimperumkappiyam) led by Ilango Adigal's Silappadikaram (story of Kannagi's anklet) and Sittalai Sathanar's Manimekalai.
  *Key Concepts & Entities*: Sangam Academies at Madurai • Akam and Puram Poetics • Tolkappiyam Grammar • Silappadikaram (Kannagi's Story) • Manimekalai Buddhist Epic • Ettuthokai & Pattupattu

### Medieval & Bhakti-Sufi Literature (Kabir, Tulsidas, Surdas, Guru Nanak, Amir Khusrau, Alvars & Nayanars Compositions)

- **Bhakti & Sufi Vernacular Literature Across India** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Democratization of spiritual knowledge through regional vernacular languages: Tamil Alvars (Divya Prabandham) and Nayanars (Tevaram); Nirguna poets Kabir (Bijak, Sakhi, Sabad) and Guru Nanak (Guru Granth Sahib); Saguna poets Tulsidas (Ramcharitmanas in Awadhi), Surdas (Sursagar in Brajbhasha), and Mirabai (Rajasthani/Braj padas); Sufi Persian and Hindavi literature pioneered by Amir Khusrau (father of Qawwali and Khari Boli poetry).
  *Key Concepts & Entities*: Alvars (Divya Prabandham) & Nayanars (Tevaram) • Kabir's Bijak and Dohas • Tulsidas Ramcharitmanas • Mirabai Devotional Padas • Amir Khusrau Hindavi Poetry • Sufi Premakhyan (Padmavat by Jayasi)

### Scientific, Astronomical & Legal Treatises (Aryabhatiya, Sushruta Samhita, Charaka Samhita, Arthashastra, Manusmriti, Mitakshara, Dayabhaga)

*(Core Overview Topic)*

### Classical Languages of India & Evolution of Scripts

- **Classical Languages of India: Criteria & Recognized Languages** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Government of India criteria for conferring Classical Language status (high antiquity of early texts over 1500–2000 years, valuable heritage corpus, original literary tradition); Currently recognized classical languages: Tamil (2004), Sanskrit (2005), Telugu (2008), Kannada (2008), Malayalam (2013), Odia (2014), along with newly inducted Marathi, Pali, Prakrit, Assamese, and Bengali (2024).
  *Key Concepts & Entities*: Classical Language Criteria • Tamil & Sanskrit Recognition • Kannada & Telugu Classical Status • Malayalam & Odia Classical Status • 2024 Inclusions (Marathi, Pali, Prakrit, Assamese, Bengali)

- **Evolution of Ancient Indian Scripts (Brahmi, Kharosthi)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Paleography and epigraphic evolution: Brahmi script (mother of most Indian and Southeast Asian writing systems, deciphered by James Prinsep in 1837 for Ashokan edicts, written left-to-right), Kharosthi script (Aramaic-derived, written right-to-left in northwestern Gandhara), development of Gupta script, Siddhamatrika, Nagari/Devanagari, and Southern Grantha/Kadamba scripts.
  *Key Concepts & Entities*: Brahmi Script Decipherment (James Prinsep 1837) • Kharosthi Right-to-Left Script • Ashokan Inscriptions Epigraphy • Devanagari Evolution • Grantha & Kadamba Scripts

Schools of Indian Philosophy `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

### Orthodox / Astika Systems (Samkhya - Kapila, Yoga - Patanjali, Nyaya - Gautama, Vaisheshika - Kanada, Mimamsa - Jaimini, Vedanta - Shankara, Ramanuja, Madhva)

- **Six Orthodox Schools of Indian Philosophy (Shad-Darshana)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Philosophical systems accepting authority of Vedas: Samkhya (Kapila, dualism of Purusha consciousness and Prakriti matter), Yoga (Patanjali, practical meditative Ashtanga eight-fold path), Nyaya (Gautama, rigorous logical reasoning and Pramanas epistemology), Vaisheshika (Kanada, atomic theory of matter and Padarthas categories), Purva Mimamsa (Jaimini, Vedic ritual hermeneutics), and Uttara Mimamsa / Vedanta (Badarayana, Advaita non-dualism of Adi Shankara, Vishishtadvaita of Ramanuja).
  *Key Concepts & Entities*: Shad-Darshana Vedic Philosophy • Samkhya (Purusha-Prakriti Dualism) • Patanjali's Yoga Sutras • Nyaya Epistemology & Pramanas • Vaisheshika Atomic Pluralism • Shankara's Advaita Vedanta • Ramanuja's Vishishtadvaita

### Heterodox / Nastika Systems (Carvaka / Lokayata Materialism, Ajivika Determinism, Jain Philosophy - Anekantavada, Syadvada, Buddhist Philosophy - Pratityasamutpada, Anatta, Shunyata)

- **Heterodox Traditions: Buddhism, Jainism, Charvaka & Ajivika** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Non-Vedic nastika philosophical systems: Buddhism (Gautama Buddha, Four Noble Truths, Noble Eightfold Path, Pratityasamutpada dependent origination, Anatta non-self, Hinayana vs Mahayana vs Vajrayana), Jainism (Lord Mahavira, Triratna, Ahimsa absolute non-violence, Anekantavada multi-faceted reality, Syadvada, Digambara and Svetambara), Charvaka / Lokayata (Brihaspati, radical empiricism and hedonistic materialism, rejecting afterlife), and Ajivika (Makkhali Gosala, strict fatalism and cosmic determinism / Niyati).
  *Key Concepts & Entities*: Four Noble Truths & Eightfold Path • Pratityasamutpada & Anatta • Anekantavada & Syadvada (Jain Epistemology) • Ahimsa and Triratna • Charvaka Materialism (Lokayata) • Ajivika Determinism (Niyati)

Fairs, Festivals, Crafts & UNESCO Heritage `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

### Traditional Handicrafts & Textiles (Kanjeevaram, Banarasi, Ikat, Chanderi, Pashmina, Chikankari, Zardozi, Terracotta, Bidriware)

- **Traditional Indian Textiles, Weaves & Embroidery Crafts** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Celebrated regional textile traditions holding Geographical Indication (GI) tags: Pashmina & Kani shawls (Kashmir), Banarasi brocade silk (UP), Kanjeevaram silk (Tamil Nadu), Patola double-ikat (Patan, Gujarat), Chanderi and Maheshwari (MP), Muga golden silk (Assam); Traditional embroidery styles: Phulkari (Punjab), Chikankari (Lucknow), Kantha (Bengal), Kasuti (Karnataka), and Zardozi metallic embroidery.
  *Key Concepts & Entities*: Pashmina & Kani Shawls (GI) • Banarasi & Kanjeevaram Silks • Patola Double-Ikat Weaving • Muga Silk of Assam • Chikankari & Phulkari Embroidery • Kasuti Embroidery of Karnataka

- **Traditional Metal, Clay, Stone & Wood Crafts of India** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Indigenous non-textile handicrafts: Dhokra lost-wax bell-metal casting (Bastar, Chhattisgarh and Bengal), Bidriware inlaid zinc-copper metalwork (Bidar), Blue Pottery (Jaipur), Bankura terracotta horses (West Bengal), Thanjavur metal plates, Sandalwood carving (Karnataka), and Aranmula Kannadi metal mirrors (Kerala).
  *Key Concepts & Entities*: Dhokra Lost-Wax Bell Metal Craft • Bidriware Silver Inlay Metalwork • Jaipur Blue Pottery • Aranmula Metal Mirror (GI) • Bankura Terracotta Horses • Sandalwood Woodcarving

### UNESCO World Heritage Sites & Intangible Cultural Heritage (Kumbh Mela, Yoga, Vedic Chanting, Ramlila, Chhau Dance, Mudiyettu, Durga Puja, Garba)

- **UNESCO Cultural World Heritage Sites in India** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  In-depth coverage of India's 34+ cultural UNESCO World Heritage sites: Ancient rock sanctuaries (Ajanta, Ellora, Bhimbetka), monumental temple complexes (Khajuraho, Sun Temple Konark, Great Living Chola Temples, Mahabalipuram, Pattadakal, Hampi), Harappan metropolis Dholavira, Kakatiya Rudreshwara (Ramappa) Temple, Santiniketan of Rabindranath Tagore, and the Sacred Ensembles of the Hoysalas (Belur, Halebidu, Somanathapura).
  *Key Concepts & Entities*: UNESCO Cultural Heritage Sites • Dholavira Harappan City (UNESCO) • Kakatiya Ramappa Temple (UNESCO) • Sacred Ensembles of the Hoysalas (UNESCO 2023) • Santiniketan (UNESCO 2023) • Hampi Vijayanagara Ruins

- **UNESCO Representative List of Intangible Cultural Heritage (ICH)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  India's 15 cultural elements inscribed on UNESCO Representative List of Intangible Cultural Heritage of Humanity: Tradition of Vedic Chanting, Ramlila, Koodiyattam Sanskrit theatre, Ramman festival of Garhwal, Mudiyettu ritual theatre of Kerala, Kalbelia folk songs/dances, Chhau dance, Buddhist chanting of Ladakh, Sankirtana of Manipur, Traditional brass and copper craft of utensil making among Thatheras of Jandiala Guru (Punjab), Yoga, Nawrouz, Kumbh Mela, Durga Puja in Kolkata, and Garba dance of Gujarat (2023).
  *Key Concepts & Entities*: UNESCO Intangible Cultural Heritage (ICH) • Tradition of Vedic Chanting • Ramlila & Kumbh Mela • Durga Puja in Kolkata (UNESCO ICH) • Garba of Gujarat (UNESCO ICH 2023) • Thatheras of Jandiala Guru Copper Craft • Koodiyattam & Mudiyettu

### Major Fairs & Religious Cultural Festivals of India

- **Major Fairs & Harvest Festivals Across India** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Fairs and carnivals of cultural significance: Kumbh Mela (Prayagraj, Haridwar, Ujjain, Nashik - largest peaceful religious gathering), Pushkar Camel Fair (Rajasthan), Hornbill Festival (Nagaland 'Festival of Festivals'), Hemis Festival (Ladakh), Thrissur Pooram (Kerala elephant festival); Harvest and New Year festivals: Makar Sankranti, Pongal, Bihu, Baisakhi, Onam, Ugadi, Vishu, Gudi Padwa, Losar, and Cheti Chand.
  *Key Concepts & Entities*: Kumbh Mela (Four Sacred Tirthas) • Pushkar Camel Fair • Hornbill Festival of Nagaland • Hemis Gompa Festival Ladakh • Thrissur Pooram Temple Festival • Harvest Festivals (Pongal, Makar Sankranti, Bihu, Onam)

Art, Architecture & Cultural Heritage of Karnataka `[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]`

### Karnataka Temple Architecture & Sculptural Evolution

- **Badami Chalukya Architecture (Aihole, Badami, Pattadakal)** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  Early Chalukyan architectural revolution (6th–8th century CE): Aihole known as the 'Cradle of Indian Temple Architecture' (Lad Khan, Durga Temple with apsidal Buddhist chaitya plan, Ravana Phadi cave temple), Badami rock-cut cave temples (Cave 3 dedicated to Vishnu with Anantasayana relief), and UNESCO World Heritage site Pattadakal representing climax of early structural temple synthesis (Virupaksha Temple built by Queen Lokamahadevi, Mallikarjuna Temple, Sangameshwara).
  *Key Concepts & Entities*: Aihole Cradle of Temple Architecture • Durga Temple Apsidal Plan Aihole • Badami Rock-Cut Caves (Cave 3 Vishnu) • Pattadakal UNESCO Monuments • Virupaksha Temple Lokamahadevi • Synthesis of Nagara & Dravida

- **Hoysala Architecture & Sculptures (UNESCO World Heritage 2023)** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  Distinctive medieval Hoysala temple style (11th–14th century) constructed using fine-grained chloritic schist (soapstone): Stellate (star-shaped) ground plan raised on a high platform (Jagati), richly carved friezes of elephants, lions, horses, and floral creepers; Celebrated temples: Chennakeshava Temple at Belur (sculpted Madanika/Shalabhanjika bracket figures), Hoysaleshwara Temple at Halebidu (twin Dvikuta shrine with 240+ relief statues), and Keshava Temple at Somanathapura (complete Trikuta shrine); Inscribed on UNESCO World Heritage list in 2023.
  *Key Concepts & Entities*: Hoysala Architecture (UNESCO 2023) • Stellate / Star-shaped Ground Plan • Chloritic Schist / Soapstone Carving • Belur Chennakeshava Temple • Halebidu Hoysaleshwara Dvikuta • Somanathapura Keshava Trikuta • Madanika Bracket Sculptures

- **Vijayanagara Architecture & Hampi UNESCO Monuments** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  Grand imperial architecture of Vijayanagara Empire (14th–16th century) centered at capital Hampi (Pampa Kshetra on Tungabhadra river): Distinctive Kalyana Mandapa (marriage hall) with intricate composite pillars carving rearing Yalis (mythical beasts), open pavilions, massive Raya Gopurams; Iconic monuments: Vitthala Temple complex with 56 musical acoustic pillars and monolithic Stone Chariot (Garuda shrine), Virupaksha Temple, Mahanavami Dibba platform, Lotus Mahal, and Queen's Bath reflecting Islamic-Vijayanagara secular synthesis.
  *Key Concepts & Entities*: Vijayanagara Architectural Style • Hampi UNESCO World Heritage Site • Vitthala Temple Musical Pillars • Monolithic Stone Chariot (Hampi) • Kalyana Mandapa & Rearing Yalis • Mahanavami Dibba Reliefs • Lotus Mahal Secular Architecture

- **Kadamba, Ganga, Rashtrakuta & Deccan Sultanate Architecture** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  Diverse architectural expressions in Karnataka: Kadamba dynasty's stepped pyramidal Shikhara (Kadamba Shikhara, Halasi temples); Western Ganga dynasty's Jain architectural legacy, climaxing in the monolithic 57-foot statue of Gommateshwara / Bahubali carved on Vindhyagiri hill at Shravanabelagola by Chavundaraya (981 CE, Mahamastakabhisheka festival); Adil Shahi dynasty of Bijapur featuring Gol Gumbaz (one of the largest single domes in the world with an acoustic Whispering Gallery) and Ibrahim Rauza.
  *Key Concepts & Entities*: Kadamba Stepped Shikhara • Gommateshwara Monolith Shravanabelagola • Chavundaraya Western Ganga Dynasty • Mahamastakabhisheka Festival • Gol Gumbaz Whispering Gallery • Ibrahim Rauza Bijapur

### Performing Arts, Theatre & Folk Traditions of Karnataka

- **Yakshagana: Coastal & Malnad Traditional Dance-Theatre** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  All-night traditional folk theatre of coastal and Malnad Karnataka: Distinctive regional styles Tenkutittu (Southern style, vibrant percussion Chande/Maddale, Carnatic influence) and Badagutittu (Northern style, Yakshagana headgear Kireeta, dramatic footwork); Performance structure: Prasanga (episodic mythic script from Mahabharata/Ramayana), Himmela (background musical ensemble led by Bhagavatha narrator), Mummela (actors, dancers performing dialogue and impromptu Vachika abhinaya).
  *Key Concepts & Entities*: Yakshagana Dance-Drama • Tenkutittu vs Badagutittu Styles • Bhagavatha (Narrator & Music Director) • Himmela and Mummela Structure • Prasanga Mythological Texts • Kireeta Headgear & Costumes

- **Folk Dances of Karnataka: Dollu Kunitha, Veeragase & Kamsale** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  Rich folk dances and ritual performance traditions: Dollu Kunitha (vigorous drum dance performed by Kuruba community dedicated to deity Beereshwara), Veeragase (energetic warrior martial dance performed during Dasara by Shaivite Jangamas, based on Veerabhadra legends), Kamsale (rhythmic bronze cymbal dance dedicated to Male Mahadeshwara), Goravara Kunitha (devotees of Mailara Linga wearing bear-fur caps and flute/damaruga), Suggi Kunitha, and Somana Kunitha.
  *Key Concepts & Entities*: Dollu Kunitha (Kuruba Drum Dance) • Veeragase (Shaivite Martial Dance) • Kamsale (Male Mahadeshwara Cymbals) • Goravara Kunitha (Mailara Devotees) • Somana Kunitha & Suggi Kunitha

- **Puppetry of Karnataka: Togalu Gombeyaata & Gombeyatta** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  Ancient puppetry heritage of Karnataka: Togalu Gombeyaata (traditional shadow puppetry using translucent dyed deer-skin/goat-leather puppets projected against a backlit white cloth screen, narrating episodes from epic scriptures) and Gombeyatta (intricate traditional string puppetry styled after Yakshagana dance figures with wooden joints and ornate crowns).
  *Key Concepts & Entities*: Togalu Gombeyaata Shadow Puppetry • Leather Puppet Craftsmanship • Gombeyatta String Puppetry • Yakshagana Puppet Styling • Epic Storytelling Traditions

### Karnataka Paintings, Traditional Crafts & GI Heritage

- **Mysore Traditional Paintings: Gesso Work & Royal Patronage** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  Celebrated classical painting style flourishing under the Wodeyar rulers of Mysore (especially Maharaja Krishnaraja Wodeyar III): Delicate muted colors, lustrous gold leaf embossing, unique Gesso paste technique (white lead, gambose, and zinc oxide paste creating tactile low-relief ornamentation on jewelry and thrones), primarily depicting Vaishnavite and Shaivite deities with serene expressions.
  *Key Concepts & Entities*: Mysore Traditional Paintings • Gesso Paste Relief Technique • Pure Gold Leaf Embossing • Mumbra & Shweta Varna Aesthetics • Krishnaraja Wodeyar III Patronage • Devotional Iconography

- **GI-Tagged Handicrafts & Handlooms of Karnataka** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  Karnataka's premier crafts awarded Geographical Indication (GI) status: Channapatna wooden lacquer toys (Gombe made from soft Wrightia tinctoria / Aale mara wood, patronized originally by Tipu Sultan), Bidriware (intricate silver inlay on blackened zinc-copper alloy from Bidar), Mysore Silk (pure mulberry silk with gold zari), Ilkal Sarees (featuring distinctive red Tope Teni pallu and Kasuti embroidery), Sandalwood Carvings, Kinnal Wooden Craft, and Guledgudd Khana.
  *Key Concepts & Entities*: Channapatna Lacquerware Toys (GI) • Bidriware Silver Inlay (GI) • Mysore Silk & Zari Weaving (GI) • Ilkal Sarees & Tope Teni Pallu (GI) • Kinnal Wooden Toys & Idols • Sandalwood Carving Heritage

### Vachana & Haridasa Bhakti Movements of Karnataka

- **Vachana Movement: Basaveshwara, Anubhava Mantapa & Sharanas** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  12th-century socio-religious and literary revolution led by Basaveshwara (Basavanna) and the Sharanas: Radical rejection of caste hierarchies, untouchability, and gender discrimination; Establishment of Anubhava Mantapa at Kalyana (first socio-spiritual parliament); Foundational ethics of 'Kayaka' (dignity of labor) and 'Dasoha' (selfless sharing); Vachana literature in simple Kannada prose-poetry by Basavanna (pen name Koodalasangamadeva), Allama Prabhu, Akka Mahadevi (Chennamallikarjuna), and Channabasavanna.
  *Key Concepts & Entities*: Basaveshwara (Basavanna) • Anubhava Mantapa (Spiritual Parliament) • Vachana Literature in Kannada • Kayaka & Dasoha Philosophy • Akka Mahadevi & Allama Prabhu • Socio-Religious Equality Movement

- **Haridasa Movement: Purandara Dasa & Kanaka Dasa** [KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]
  Bhakti devotional movement in Karnataka spreading Dvaita philosophy through devotional songs (Devaranamas/Kirtanas): Purandara Dasa (revered as Karnataka Sangeeta Pitamaha for structuring fundamental musical exercises / Sarale Varase and composing thousands of Kirtanas praising Lord Vittala) and Kanaka Dasa (saint-philosopher from Kuruba community, composed Mohanatarangini, Nalacharitre, and Ramadhanya Charitre advocating caste equality; associated with Kanakana Kindi window at Udupi Sri Krishna Temple).
  *Key Concepts & Entities*: Purandara Dasa (Karnataka Sangeeta Pitamaha) • Kanaka Dasa & Ramadhanya Charitre • Kanakana Kindi at Udupi • Devaranama Devotional Compositions • Vyasatirtha & Dasa Sahitya • Dvaita Bhakti Tradition

Martial Arts, Traditional Sports & Indian Calendar Systems `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

### Traditional Martial Arts & Indigenous Sports of India

- **Traditional Indian Martial Arts (Kalaripayattu, Thang-Ta, Silambam)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Ancient combat systems of India: Kalaripayattu of Kerala (one of the oldest surviving martial arts, training in Kalari pit arena, weapon forms including Urumi flexible sword), Silambam of Tamil Nadu (bamboo staff martial technique, references in Silappadikaram), Thang-Ta / Huyen Langlon of Manipur (sword and spear armed combat), Gatka of Punjab (Sikh martial art with wooden sticks and shields), Mardani Khel of Maharashtra, and Pari-Khanda of Bihar.
  *Key Concepts & Entities*: Kalaripayattu (Kerala Mother of Martial Arts) • Urumi Flexible Sword • Silambam Bamboo Staff Martial Art • Thang-Ta (Manipur Huyen Langlon) • Gatka Sikh Martial Tradition • Mardani Khel & Pari-Khanda

- **Indigenous Sports & Cultural Animal Events (Mallakhamb, Kambala)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Indigenous physical and community sports: Mallakhamb (traditional acrobatic gymnastics on a vertical wooden pole or rope, state sport of Madhya Pradesh), Kambala (slushy paddy-field buffalo racing festival in coastal Karnataka), Jallikattu (traditional bull-taming sport during Pongal in Tamil Nadu), Vallam Kali (Nehru Trophy snake boat race in Kerala backwaters), and Kabaddi & Kho-Kho.
  *Key Concepts & Entities*: Mallakhamb Pole Gymnastics • Kambala Buffalo Race Karnataka • Jallikattu Bull Taming Event • Vallam Kali Snake Boat Race Kerala • Indigenous Indian Sports

### Indian Calendar Systems, Historical Eras & National Symbols

- **Indian Calendar Systems: Saka, Vikrama Samvat & National Calendar** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Historical astronomical eras and chronological systems in India: Saka Era (commencing 78 CE, instituted by King Kanishka/Chastana, adopted as India's National Calendar on March 22, 1957 alongside Gregorian calendar; months Chaitra through Phalguna), Vikrama Samvat (commencing 57 BCE commemorating King Vikramaditya's victory, lunar calendar base), Kali Era (3102 BCE), and comparison of solar vs lunisolar calculations.
  *Key Concepts & Entities*: Saka Era (78 CE National Calendar) • Saha Calendar Reform Committee (1957) • Chaitra First Month of National Year • Vikrama Samvat (57 BCE) • Lunisolar & Solar Indian Calendars • Regional Eras (Kollam, Hijri)

- **National Symbols, State Insignia & Cultural Heritage Emblems** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Official national cultural emblems: State Emblem of India adapted from Lion Capital of Sarnath (four Asiatic lions, abacus with elephant, horse, bull, lion separated by wheels, motto Satyameva Jayate in Devanagari from Mundaka Upanishad, adopted Jan 26, 1950); National Anthem (Jana Gana Mana by Rabindranath Tagore), National Song (Vande Mataram from Bankim Chandra Chattopadhyay's Anandamath), National Flag design by Pingali Venkayya, and National Animal, Bird, Flower symbols.
  *Key Concepts & Entities*: National Emblem (Sarnath Lion Capital) • Satyameva Jayate (Mundaka Upanishad) • Jana Gana Mana National Anthem • Vande Mataram (Bankim Chandra Anandamath) • Pingali Venkayya Flag Design • State Insignia Protocols

Cultural Institutions, Numismatics & Heritage Governance `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

### Premier National Cultural Institutions, Akademis & Museums

- **Premier Cultural Bodies: ASI, Sangeet Natak, Sahitya & Lalit Kala** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Apex statutory and autonomous cultural institutions under Ministry of Culture: Archaeological Survey of India (ASI, founded 1861 by Alexander Cunningham for conservation of centrally protected monuments), Sangeet Natak Akademi (National Academy of Music, Dance and Drama, established 1953), Sahitya Akademi (National Academy of Letters promoting 24 languages), Lalit Kala Akademi (National Academy of Visual Arts), and National School of Drama (NSD).
  *Key Concepts & Entities*: Archaeological Survey of India (ASI) • Alexander Cunningham (Father of Indian Archaeology) • Sangeet Natak Akademi (1953) • Sahitya Akademi (24 Languages) • Lalit Kala Akademi • National School of Drama (NSD)

- **National Museums, Art Galleries & Cultural Repositories** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Major national repositories of tangible heritage: National Museum (New Delhi, housing Harappan antiquities and Buddhist relics), National Gallery of Modern Art (NGMA, exhibiting Raja Ravi Varma, Amrita Sher-Gil, Bengal School), National Library of India (Kolkata, largest library under Delivery of Books Act), and Indira Gandhi National Centre for the Arts (IGNCA, multidimensional art resource center).
  *Key Concepts & Entities*: National Museum New Delhi • National Gallery of Modern Art (NGMA) • Raja Ravi Varma & Amrita Sher-Gil Collections • National Library Kolkata • IGNCA Cultural Centre

### Ancient & Medieval Indian Coinage (Numismatics)

- **Ancient Indian Coinage: Punch-Marked Coins to Gupta Dinaras** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Chronological evolution of Indian numismatics: Punch-Marked Coins (Puranas/Karshapanas, 6th century BCE Mahajanapadas, silver/copper irregular shapes stamped with symbols of sun, hill, tree); Indo-Greek coinage (first to bear portraits, titles, and bilingual Greek-Kharosthi legends); Kushana coinage (first gold coins in India under Vima Kadphises, high purity gold Dinaras depicting Shiva and Buddha); Gupta coinage (superb artistic gold Dinaras showing rulers as archers, lion-slayers, and lyrist/veena players under Samudragupta).
  *Key Concepts & Entities*: Punch-Marked Coins (Karshapanas) • Indo-Greek Portrait Coinage • Kushana Gold Dinaras (Vima Kadphises) • Gupta Gold Coinage (Dinaras) • Samudragupta Lyrist Type Coins • Ancient Numismatics & Metrology

- **Medieval Coinage: Vijayanagara Varahas, Sher Shah Rupiya & Mughals** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Medieval numismatic developments: South Indian coinage led by Vijayanagara Empire's gold 'Varaha' (also known as Pagoda, depicting deities Venkateshwara, Shiva-Parvati, and Gandabherunda double-headed eagle); Delhi Sultanate coinage (Iltutmish introducing silver Tanka and copper Jital); Sher Shah Suri's standard silver 'Rupiya' (base of modern Rupee) and copper 'Dam'; Mughal coinage system perfected by Akbar featuring circular and square Mohurs with calligraphic Quranic verses and Persian couplets.
  *Key Concepts & Entities*: Vijayanagara Gold Varahas (Pagodas) • Gandabherunda Mythical Emblem • Iltutmish Tanka and Jital • Sher Shah Suri Silver Rupiya • Mughal Gold Mohurs & Zodiac Coins • Calligraphic Numismatic Art

### Government Heritage Conservation Schemes & Cultural Awards

- **Government Heritage Conservation Schemes: PRASHAD, HRIDAY & Mausam** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Central government flagship schemes for heritage conservation and tourism: PRASHAD (Pilgrimage Rejuvenation and Spiritual, Heritage Augmentation Drive), HRIDAY (Heritage City Development and Augmentation Yojana), Adopt a Heritage 2.0 / Apni Dharohar Apni Pehchan initiative, Project Mausam (reconnecting Indian Ocean maritime trade and cultural linkages), and National Mission on Cultural Mapping (Mera Gaon Meri Dharohar).
  *Key Concepts & Entities*: PRASHAD Scheme (Pilgrimage & Heritage) • HRIDAY Heritage City Scheme • Adopt a Heritage 2.0 Initiative • Project Mausam Indian Ocean Cultural Route • Mera Gaon Meri Dharohar Portal

- **National Honours & Cultural Awards (Jnanpith, Akademi, Kalidas)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Pre-eminent national honors in art and literature: Jnanpith Award (highest Indian literary award presented by Bharatiya Jnanpith in 22 Eighth Schedule languages + English); Sahitya Akademi Awards; Sangeet Natak Akademi Fellowship and Amrit Awards; Kalidas Samman (prestigious arts award by MP government); Civilian honors (Padma Vibhushan, Padma Bhushan, Padma Shri) recognizing master craftsmen, folk artists, and classical exponents.
  *Key Concepts & Entities*: Jnanpith Award (Highest Literary Honour) • Sahitya Akademi Awards • Sangeet Natak Akademi Amrit Awards • Kalidas Samman • Padma Awards for Traditional Artists • Cultural Recognition Systems

==================================================
3. GEOGRAPHY & EARTH SYSTEMS `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`
==================================================

Geography & Earth Systems

- Physical Geography & Earth Systems (Geomorphology)
- Climatology
- Oceanography & Marine Systems
- Indian Physical Geography & Monsoon Architecture
- Human Geography & Population Settlements
- Economic & Resource Geography
- Geography of the World
- World Mapping & Geopolitical Locations
- Indian Mapping & Spatial Geography
- Geography of Karnataka
- Karnataka Mapping & Spatial Geography

Physical Geography & Earth Systems (Geomorphology) `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

### Earth and The Solar System

- **Origin of the Universe, Solar System & Nebular Hypothesis** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Cosmological origins: Big Bang Theory (expanding universe, cosmic microwave background radiation), Nebular Hypothesis of Immanuel Kant and Pierre-Simon Laplace, Planetesimal Hypothesis; Accretion of protoplanets, Terrestrial (inner rocky) vs Jovian (outer gas giant) planets, asteroid belt, Kuiper belt, and Oort cloud.
  *Key Concepts & Entities*: Big Bang Theory • Nebular Hypothesis (Kant & Laplace) • Terrestrial vs Jovian Planets • Planetesimal Accretion • Asteroid Belt (Mars & Jupiter) • Kuiper Belt & Oort Cloud

- **Earth's Shape (Geoid), Coordinate System & Motions** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Oblate spheroid and Geoid shape (equatorial bulge due to centrifugal rotation); Earth's orbital motions: Rotation on 23.5 deg tilted axis (day-night cycle, Coriolis effect), Revolution around Sun along elliptical orbit; Perihelion (Jan 3) and Aphelion (July 4); Solstices (Summer June 21, Winter Dec 22) and Equinoxes (Vernal March 21, Autumnal Sept 23); Parallels of Latitude, Meridians of Longitude, International Date Line (IDL at 180 deg with zigzags), and Indian Standard Time (IST at 82.5 deg E).
  *Key Concepts & Entities*: Geoid Shape & Equatorial Bulge • Orbital Revolution & Axis Tilt (23.5 deg) • Solstices and Equinoxes • Perihelion & Aphelion • Latitudes & Longitudes • International Date Line (180 deg) • Indian Standard Time (82.5 deg E)

### Earth's Origin & Internal Structure (Crust, Mantle, Core, Discontinuities - Mohorovicic, Gutenberg, Seismic Waves P & S)

- **Earth's Internal Layers: Crust, Mantle & Core** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Compositional and mechanical stratification: Crust (continental granitic SIAL vs oceanic basaltic SIMA), Mantle (Lithosphere rigid top, semi-molten ductile Asthenosphere source of magma and plate tectonics, lower Mesosphere), and Core / Barysphere (liquid outer core generating geomagnetic geodynamo field, solid crystalline inner core of NIFE iron-nickel at extreme pressure).
  *Key Concepts & Entities*: Continental Crust (SIAL) • Oceanic Crust (SIMA) • Asthenosphere (Partial Melt Zone) • Lower Mantle (Mesosphere) • Liquid Outer Core (Geodynamo) • Solid Inner Core (NIFE)

- **Seismic Discontinuities & Wave Shadow Zones** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Internal density boundaries: Conrad (upper-lower crust), Mohorovicic / Moho (crust-mantle), Repetti (upper-lower mantle), Gutenberg (mantle-outer core), and Lehmann discontinuity (outer-inner core); Seismic wave propagation: Primary (P) longitudinal compressional waves traveling through solids and liquids vs Secondary (S) transverse shear waves penetrating only solids; P-wave shadow zone (105 deg to 142 deg) and total S-wave shadow zone beyond 105 deg proving liquid outer core.
  *Key Concepts & Entities*: Mohorovicic Discontinuity (Moho) • Gutenberg Discontinuity • Lehmann Discontinuity • P-wave Shadow Zone (105-142 deg) • S-wave Complete Shadow Zone (>105 deg) • Seismic Velocity Profile

- **Geological Time Scale & Stratigraphic Eras** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Chronostratigraphic classification of Earth's 4.54 billion year history: Eons (Hadean, Archean, Proterozoic, Phanerozoic), Eras (Paleozoic ancient life, Mesozoic age of reptiles/dinosaurs, Cenozoic age of mammals), Periods (Cambrian, Carboniferous coal formations, Jurassic, Cretaceous Deccan volcanism, Quaternary), and Epochs (Pleistocene ice ages, Holocene recent, Anthropocene proposed).
  *Key Concepts & Entities*: Geological Time Scale • Precambrian Eon • Paleozoic Era (Carboniferous Coal) • Mesozoic Era (Cretaceous Deccan Traps) • Cenozoic Era (Himalayan Orogeny) • Pleistocene Ice Ages & Holocene Epoch

### Continental Drift & Plate Tectonics (Pangaea, Plate Boundaries - Divergent, Convergent, Transform, Sea Floor Spreading, Ring of Fire)

- **Continental Drift Theory & Paleomagnetic Evidence** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Alfred Wegener's Continental Drift Theory (1912): Supercontinent Pangaea surrounded by Panthalassa; Evidence: Jig-saw fit of South American and African Atlantic coastlines, matching ancient orogenic rock belts, fossil distribution of freshwater reptile Mesosaurus and seed fern Glossopteris, and Permo-Carboniferous glacial tillite beds across Gondwana fragments; Paleomagnetism and polar wandering curves confirming continental mobility.
  *Key Concepts & Entities*: Wegener's Continental Drift Theory • Supercontinent Pangaea & Panthalassa • Jig-saw Coastline Matching • Glossopteris & Mesosaurus Fossil Evidence • Carboniferous Glacial Tillite • Paleomagnetism & Polar Wandering

- **Seafloor Spreading & Geomagnetic Reversals** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Harry Hess's Seafloor Spreading hypothesis (1960): Upwelling convection currents in mantle creating new basaltic oceanic crust at Mid-Ocean Ridges (MOR); Vine-Matthews-Morley hypothesis of symmetric magnetic anomalies / paleomagnetic striping parallel to ridge crests recording Earth's magnetic field polarity reversals; Youthful age of oceanic crust (<200 million years) compared to ancient continental rocks.
  *Key Concepts & Entities*: Harry Hess Seafloor Spreading • Mid-Ocean Ridge Upwelling • Vine-Matthews-Morley Hypothesis • Symmetric Magnetic Striping • Geomagnetic Polarity Reversals • Oceanic Crust Subduction

- **Plate Boundaries (Convergent, Divergent, Transform) & Ring of Fire** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Seven major and minor tectonic plates (Pacific, North American, Eurasian, African, Indo-Australian, South American, Antarctic, Nazca, Cocos, Arabian); Plate boundaries: Divergent constructive (Mid-Atlantic Ridge, East African Great Rift Valley), Convergent destructive (Oceanic-Continental forming Andes, Oceanic-Oceanic forming Mariana trench and island arcs, Continental-Continental collision forming Himalayas), and Transform conservative faults (San Andreas Fault California); Pacific Ring of Fire harboring 75% of active volcanoes and 90% of global earthquakes.
  *Key Concepts & Entities*: Major and Minor Tectonic Plates • Divergent Boundaries (Rift Valleys) • Convergent Boundaries (Subduction Zones) • Himalayan Continental Collision • Transform Faults (San Andreas) • Pacific Ring of Fire Subduction

### Geomorphic Processes & Landform Evolution (Weathering - Physical, Chemical, Biological; Mass Wasting; Fluvial, Glacial, Aeolian, Karst & Coastal Landforms)

- **Weathering (Physical, Chemical, Biological) & Mass Movements** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  In-situ disintegration and decomposition: Mechanical weathering (thermal stress shattering, frost wedging in periglacial areas, exfoliation onion-peeling domes, salt haloclasty); Chemical weathering (carbonation of limestone, hydration, oxidation of ferruginous rocks, hydrolysis of feldspars); Biological weathering (root wedging, lichen chelating acids, burrowing fauna); Mass Wasting driven by gravity: Slow movements (soil creep, solifluction), Rapid movements (earthflow, mudflow, debris avalanche), Landslides (rockfall, rotational slump); Slope stability factors and disaster risk reduction.
  *Key Concepts & Entities*: Mechanical Frost Wedging & Exfoliation • Chemical Carbonation & Oxidation • Biological Root Wedging • Soil Creep & Solifluction • Mudflow & Debris Avalanches • Rotational Slump Landslides

- **Fluvial Landforms: River Erosion, Transportation & Deposition** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Fluvial cycle of erosion: Youth stage (downcutting, V-shaped valleys, gorges, Grand Canyon canyons, potholes, plunge pools, waterfalls); Mature stage (lateral planation, meandering courses, oxbow lakes, natural levees, broad floodplains); Old stage (braided river channels, peneplains, monadnocks, delta systems: arcuate Nile/Ganga, bird's-foot Mississippi, estuarine Narmada/Tapi).
  *Key Concepts & Entities*: V-shaped Valleys & Canyons • Potholes & Plunge Pools • Meanders & Oxbow Lakes • Natural Levees & Floodplains • Deltas (Arcuate, Bird's-foot, Estuarine) • Peneplains & Monadnocks

- **Glacial Landforms: Alpine & Continental Glaciation** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Glacial erosion by plucking and abrasion: Cirques (amphitheatre-shaped hollows / corries), Tarn lakes, Aretes knife-edge ridges, Pyramidal horns (Matterhorn), U-shaped glacial troughs, Hanging valleys with waterfalls, truncated spurs, Fiords drowned glacial valleys; Glacial deposition: Unsorted glacial till, Moraines (terminal, lateral, medial, ground), Drumlins (basket-of-eggs topography), Eskers sinuous gravel ridges, Kames, and outwash plains.
  *Key Concepts & Entities*: Cirques & Tarn Lakes • Aretes & Pyramidal Horns • U-shaped Glacial Valleys • Hanging Valleys & Fiords • Moraines (Terminal, Lateral, Medial) • Drumlins & Sinuous Eskers

- **Aeolian Landforms: Desert Wind Erosion & Sand Dunes** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Wind action in arid landscapes: Deflation and abrasion; Erosional: Deflation hollows / blowouts, Mushroom rocks (pedestal rocks), Yardangs wind-carved ridges, Zeugen tabular masses, Inselbergs (isolated residual hills); Depositional: Sand dunes classified by wind regimes (Barchans crescent-shaped pointing downwind, Seif longitudinal dunes, Transverse dunes, Star dunes), Loess vast unstratified wind-blown silt deposits (Huang He basin), Playas ephemeral salt lakes and Bajadas.
  *Key Concepts & Entities*: Mushroom / Pedestal Rocks • Yardangs and Zeugen • Barchans Crescent Dunes • Seif Longitudinal Dunes • Loess Silt Deposits (China) • Playas & Bajadas

- **Karst Topography: Limestone Caves & Speleothems** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Groundwater dissolution in calcium carbonate limestone and dolomite terrain: Surface erosional features: Sinkholes (swallow holes), Doline, Uvala, Polje massive depressions, Lapies furrowed surfaces, Blind valleys; Subterranean depositional features (Speleothems): Stalactites hanging from roof, Stalagmites growing upward from floor, cave pillars/columns formed by coalescence; Indian karst regions: Borra Caves (Visakhapatnam), Gupteswar (Odisha), Bastar.
  *Key Concepts & Entities*: Karst Dissolution Process • Sinkholes, Doline & Polje • Blind Valleys & Lapies • Stalactites and Stalagmites • Cave Columns & Pillars • Borra Caves Limestone Karst

- **Coastal Landforms: Marine Wave Action & Shorelines** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Marine wave hydraulic action, abrasion, and attrition: Erosional features: Sea cliffs, Wave-cut notches, Wave-cut platforms, Sea caves, Sea arches, Sea stacks, Stumps; Depositional features: Sandy and shingle beaches, Spits, Offshore bars and barrier islands, Tombolos (sand bar connecting mainland to offshore island), Coastal lagoons (Chilika Lake, Pulicat, Vembanad); Coastlines of submergence (Ria, Fiord, Dalmatian) vs emergence.
  *Key Concepts & Entities*: Sea Cliffs & Wave-cut Platforms • Sea Caves, Arches & Stacks • Sandy Beaches & Spits • Tombolos (Mainland-Island Connection) • Barrier Islands & Coastal Lagoons • Coastlines of Emergence & Submergence

### Rocks: Formation and Classification

- **Major Mineral Groups & Physical Properties** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Earth crust mineralogy: Major rock-forming mineral groups: Silicates (Feldspar most abundant 50%, Quartz 12%, Pyroxenes, Amphiboles, Mica, Olivine), Carbonates (Calcite, Dolomite), Oxides (Hematite, Magnetite); Physical testing criteria: Mohs Scale of Mineral Hardness (1-Talc, 2-Gypsum, 3-Calcite, 4-Fluorite, 5-Apatite, 6-Orthoclase Feldspar, 7-Quartz, 8-Topaz, 9-Corundum, 10-Diamond), cleavage, fracture, luster, and streak.
  *Key Concepts & Entities*: Silicate Mineral Group • Feldspar & Quartz • Mohs Scale of Mineral Hardness • Cleavage and Fracture • Streak and Luster Properties

- **Igneous, Sedimentary, Metamorphic Rocks & The Rock Cycle** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Classification of rocks: Igneous primary rocks (Plutonic intrusive: Granite, Diorite, Gabbro with coarse crystals; Volcanic extrusive: Basalt, Obsidian, Pumice with fine crystals; Acidic high-silica vs Basic low-silica); Sedimentary stratified rocks (Mechanically formed/clastic: Sandstone, Shale, Conglomerate; Organically formed: Coal, Limestone; Chemically formed: Halite/Rock salt, Gypsum); Metamorphic rocks (Thermal contact vs Dynamic regional metamorphism; Foliated: Slate, Schist, Gneiss; Non-foliated: Marble from limestone, Quartzite from sandstone); Dynamic Rock Cycle driving continual transformation.
  *Key Concepts & Entities*: Igneous Rocks (Granite & Basalt) • Sedimentary Rocks (Stratification & Fossils) • Clastic vs Chemical Sedimentary • Metamorphic Rocks (Foliation & Gneiss) • Marble and Quartzite Metamorphism • The Dynamic Rock Cycle

### Earthquakes: Mechanics, Seismic Waves & Hazard Zones

- **Earthquake Mechanics, Seismic Waves & India's Seismic Zones** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Elastic Rebound Theory; Hypocenter (Focus) vs Epicenter; Seismic waves: Body waves (P compressional, S shear) and Surface waves (Rayleigh ground-roll, Love horizontal shearing causing maximum structural destruction); Measurement scales: Richter scale (logarithmic physical magnitude) vs Modified Mercalli scale (observed human/structural intensity); Seismic Hazard Zonation of India (Zone II low to Zone V very severe in Himalayas, Kutch, Northeast).
  *Key Concepts & Entities*: Elastic Rebound Theory • Focus (Hypocenter) & Epicenter • Body Waves (P and S Waves) • Surface Waves (Rayleigh and Love) • Richter vs Mercalli Intensity Scale • India Seismic Zones (Zone II to V)

### Volcanoes: Volcanism, Intrusive & Extrusive Landforms

- **Volcanism: Intrusive Plutonic & Extrusive Landforms** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Magma vs lava; Intrusive plutonic structures: Batholiths (gigantic granitic core intrusions), Laccoliths (dome-shaped with level base), Lopoliths (saucer-shaped concavity), Phacoliths (anticline crest and syncline trough lens), Sills (horizontal concordant sheets), and Dikes (vertical discordant conduits); Extrusive volcanic morphology: Shield volcanoes (Hawaiian low-viscosity basaltic lava, gentle slopes, Mauna Loa), Composite/Stratovolcanoes (viscous explosive andesite with alternating pyroclastic ash layers, Mt. Fuji, Mt. St. Helens, Vesuvius), Calderas (catastrophic explosive collapses), Flood basalt provinces (Deccan Traps), and mid-ocean ridge fissure eruptions.
  *Key Concepts & Entities*: Plutonic Batholiths & Laccoliths • Concordant Sills & Discordant Dikes • Shield Volcanoes (Basaltic) • Composite / Stratovolcanoes (Andesitic) • Explosive Caldera Collapse • Deccan Traps Flood Basalts

### Tsunamis: Generation, Shoaling & Early Warning Systems

- **Tsunami Generation, Coastal Shoaling & Warning Systems** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Physics of tsunamis: Submarine megathrust earthquake vertical seabed displacement, submarine volcanic caldera collapse or massive undersea landslides; Open ocean characteristics (extreme wavelength hundreds of kilometers, low amplitude <1m, jet-aircraft velocity ~800 km/h); Coastal Shoaling (compressing wave energy, sharp reduction in velocity, dramatic surge in wave height exceeding 10-30 meters); 2004 Indian Ocean tsunami (Sumatra 9.1 Mw earthquake) and 2011 Tohoku tsunami; Indian Ocean Tsunami Early Warning System (INCOIS, Hyderabad) utilizing Deep Ocean Assessment and Reporting of Tsunamis (DART) buoys and bottom pressure recorders.
  *Key Concepts & Entities*: Megathrust Displacement Mechanism • Open-Ocean Wavelength & High Velocity • Coastal Shoaling Effect (Wave Height Surge) • 2004 Indian Ocean Tsunami • INCOIS Tsunami Warning System • DART Buoy Sensor Network

Climatology `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

### Atmosphere Structure & Heat Budget (Troposphere, Stratosphere, Mesosphere, Thermosphere; Insolation, Terrestrial Radiation, Atmospheric Heat Budget)

- **Atmospheric Layers, Composition & Lapse Rates** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Atmospheric composition: Nitrogen 78%, Oxygen 21%, Argon 0.93%, Carbon dioxide 0.04%, water vapour and aerosols; Thermal layers: Troposphere (weather phenomena, thickness 8km at poles to 18km at equator, normal lapse rate 6.5 deg C/km), Stratosphere (Ozone layer absorbing UV rays, absence of vertical convection), Mesosphere (coldest layer -100 deg C, noctilucent clouds, meteor ablation), Thermosphere / Ionosphere (D, E, F layers reflecting HF radio waves, Aurora Borealis and Australis), Exosphere; Adiabatic lapse rates: Dry Adiabatic Lapse Rate (DALR 10 deg C/km) vs Wet/Saturated Adiabatic Lapse Rate (WALR 5-9 deg C/km).
  *Key Concepts & Entities*: Troposphere & Tropopause • Stratosphere & Ozonosphere • Mesosphere Noctilucent Clouds • Ionosphere & Auroral Displays • Normal Environmental Lapse Rate (6.5 deg C/km) • Dry vs Wet Adiabatic Lapse Rate

- **Insolation, Earth's Heat Budget & Albedo** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Solar radiation physics: Solar Constant (1.94 cal/cm2/min); Shortwave solar insolation vs Longwave terrestrial radiation; Earth's Heat Budget: Out of 100 incoming units, 35 units reflected back into space unabsorbed (Albedo of Earth: 27 from clouds, 2 from snow/ice, 6 from atmosphere); Remaining 65 units absorbed (14 by atmosphere, 51 by Earth's surface) and returned through radiation, conduction, and latent heat of condensation maintaining global thermal equilibrium.
  *Key Concepts & Entities*: Solar Constant • Shortwave vs Longwave Radiation • Earth's Albedo (35% Reflection) • Global Heat Budget Equilibrium • Greenhouse Radiative Balance

- **Temperature Inversion: Radiation, Advection & Valley Belts** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Reversal of normal lapse rate where temperature increases with height; Favourable conditions: Long winter nights, clear cloudless skies, calm dry air; Inversion types: Surface / Ground radiation inversion, Advectional inversion (warm air blowing over cold surface), Valley inversion (cold dense air draining down slopes into valley bottoms while thermal belts form on mid-slopes, preventing frost damage to orchards); Inversion impacts: Trapping urban air pollution and smog, radiation fog formation.
  *Key Concepts & Entities*: Temperature Inversion Reversal • Radiation Ground Inversion • Advectional Marine Inversion • Valley Air Drainage & Frost Pockets • Thermal Belts on Slopes • Smog Trapping Effects

### Atmospheric Pressure & Global Wind Belts (Pressure Belts - Equatorial Low, Subtropical High, Subpolar Low; Planetary Winds - Trade Winds, Westerlies, Polar Easterlies; Jet Streams)

- **Global Pressure Belts & Tricellular Circulation (Hadley, Ferrel, Polar)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Seven global pressure belts: Thermal belts (Equatorial Low Pressure Belt / Doldrums / ITCZ, Polar Highs), Dynamic belts (Subtropical High Pressure Belts / Horse Latitudes at 30-35 deg, Subpolar Low Pressure Belts at 60-65 deg); Tricellular meridional circulation cells: Hadley Cell (tropical convection and subtropical subsidence), Ferrel Cell (mid-latitude indirect circulation), Polar Cell; Seasonal latitudinal migration of pressure belts tracking the apparent movement of the Sun.
  *Key Concepts & Entities*: Equatorial Low / ITCZ Doldrums • Subtropical High / Horse Latitudes • Subpolar Lows & Polar Highs • Hadley, Ferrel & Polar Cells • Pressure Belt Seasonal Shifting

- **Coriolis Force, Geostrophic Winds & Polar Jet Streams** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Mechanics of wind: Pressure Gradient Force, Friction; Coriolis Force (apparent deflection proportional to wind velocity and sine of latitude, zero at equator, maximum at poles); Ferrel's Law (deflection to right in Northern Hemisphere, left in Southern Hemisphere); Geostrophic Winds (frictionless upper-air winds blowing parallel to straight isobars where PGF balances Coriolis); Jet Streams: Narrow meandering bands of high-velocity upper-tropospheric winds (Polar Jet Stream, Subtropical Westerly Jet Stream, Tropical Easterly Jet Stream, Rossby Waves and index cycle).
  *Key Concepts & Entities*: Coriolis Force & Ferrel's Law • Pressure Gradient Force • Geostrophic Wind Equilibrium • Polar Front Jet Stream • Subtropical Westerly Jet Stream • Rossby Waves Index Cycle

- **Planetary Winds & World Regional Local Winds** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Primary planetary winds: Trade Winds (Northeast and Southeast Trades), Prevailing Westerlies (Roaring Forties, Furious Fifties, Shrieking Sixties in open Southern Ocean), Polar Easterlies; Periodic daily winds: Land and sea breezes, Anabatic (upslope daytime valley breeze) vs Katabatic (downslope nighttime mountain wind); Regional hot winds: Loo (Indo-Gangetic plain), Chinook (snow-eater, eastern Rockies), Foehn (Alps), Sirocco (Sahara to Mediterranean), Harmattan (Doctor wind, West Africa), Khamsin; Regional cold winds: Mistral (Rhone valley France), Bora (Adriatic coast), Blizzard (polar prairies), Pampero (Argentina pampas).
  *Key Concepts & Entities*: Trade Winds & Prevailing Westerlies • Roaring Forties & Furious Fifties • Land and Sea Breezes • Anabatic & Katabatic Winds • Hot Winds (Chinook, Harmattan, Loo, Foehn) • Cold Winds (Mistral, Bora, Blizzard)

### Air Masses, Fronts & Cyclogenesis (Air Mass Types, Fronts - Warm, Cold, Occluded; Tropical Cyclones vs Temperate / Extra-Tropical Cyclones, Eye of Cyclone)

- **Air Masses Classification & Frontogenesis (Warm, Cold, Occluded)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Air mass definition and source regions: Continental Polar (cP, bitterly cold and stable), Maritime Polar (mP, cool and humid), Continental Tropical (cT, hot and arid), Maritime Tropical (mT, warm and highly unstable); Frontogenesis (creation of fronts) and Frontolysis (dissipation); Front types: Warm Front (gentle slope 1:200, cirrus-altostratus-nimbostratus sequence, broad steady rain), Cold Front (steep slope 1:50, violent cumulonimbus, squall line storms, abrupt post-frontal temperature drop), Occluded Front (cold front overtakes warm front lifting warm air completely), Stationary Front.
  *Key Concepts & Entities*: Air Mass Source Regions (cP, mP, cT, mT) • Warm Front Cloud Sequence • Cold Front Squall Lines • Occluded Front Mechanics • Frontogenesis and Frontolysis

- **Temperate Frontal Cyclones vs Tropical Cyclones** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Comparative cyclonic meteorology: Extra-tropical / Temperate Wave Cyclones (Polar Front Theory of Bjerknes, formation along polar front 35-65 deg, steer from west to east by Westerlies, vast scale >1000km, presence of distinct warm and cold fronts, active over land and sea, year-round); Tropical Cyclones (Thermal engine driven by latent heat of condensation, strictly over warm seas SST > 27 deg C, Coriolis force required, absence of fronts, steer east to west by Trade winds, rapid dissipation over land); Anatomy: Eye (calm, sinking air, clear sky), Eyewall (maximum torrential fury, gale force winds >120 km/h), Spiral rainbands; Storm surge flooding hazard; Regional names: Cyclones (Indian Ocean), Typhoons (Northwest Pacific), Hurricanes (Atlantic/Caribbean), Willy-Willies (Australia).
  *Key Concepts & Entities*: Temperate Wave Cyclones (Bjerknes) • Tropical Cyclone Thermal Engine • Sea Surface Temperature (>27 deg C) • Eye, Eyewall & Rainbands • Storm Surge Hazards • Regional Names (Typhoon, Hurricane, Cyclone)

### World Climate Regions (Equatorial, Tropical Monsoon, Savanna, Mediterranean, Steppe, Taiga, Tundra, Desert Climates)

- **Köppen Climate Classification System & World Biomes** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Wladimir Köppen's empirical climatic classification: Major groups: A (Tropical humid), B (Dry/Arid), C (Warm temperate/Mesothermal), D (Cold snow-forest/Microthermal), E (Polar), H (Highland); Major world biomes: Equatorial Rainforest (Af, Selvas, layered emergent canopy, buttress roots, absence of winter), Tropical Monsoon (Am, seasonal deciduous teak/sal), Tropical Savanna (Aw, Sudan type, tall elephant grass, big game country), Hot Deserts (BWh, xerophytic adaptations, subtropical subsidence), Mediterranean Climate (Cs, winter rain, summer drought, sclerophyllous chaparral vegetation, citrus viticulture), Marine West Coast (Cfb, British type, temperate deciduous forests), Taiga (Df, boreal coniferous evergreen needle-leaf softwood forests), and Tundra (ET, permafrost, lichens and mosses).
  *Key Concepts & Entities*: Köppen Empirical Climate Scheme • Equatorial Selvas Rainforest (Af) • Tropical Savanna Sudan Type (Aw) • Mediterranean Winter Rain (Cs) • Marine West Coast British Type (Cfb) • Taiga Boreal Coniferous (Df) • Tundra Permafrost Biome (ET)

### Atmospheric Moisture, Condensation & Precipitation

- **Atmospheric Humidity, Dew Point & Fog Types** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Moisture metrics: Absolute humidity (mass of water vapor per unit volume), Specific humidity (mass of vapor per mass of moist air), Relative Humidity (RH = actual vapor pressure / saturation vapor pressure * 100%, inversely proportional to temperature); Dew Point temperature and hygroscopic condensation nuclei; Non-cloud condensation: Dew, White frost, Mist, Haze; Fog genesis and types: Radiation fog (ground radiative cooling on calm winter nights), Advection fog (warm moist air advecting over cold surface, Grand Banks), Upslope fog, Evaporation fog / steam fog.
  *Key Concepts & Entities*: Absolute, Specific & Relative Humidity • Dew Point Temperature • Hygroscopic Nuclei • Radiation Fog & Smog • Advection Fog (Sea Fog) • Dew and White Frost

- **Cloud Classification (10 Genera) & Rainfall Types** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  International Cloud Atlas 10 standard cloud genera by altitude: High clouds (Cirrus feathery ice crystals, Cirrostratus lunar/solar halos, Cirrocumulus mackerel sky), Middle clouds (Altostratus, Altocumulus), Low clouds (Stratus low grey overcast, Stratocumulus, Nimbostratus continuous heavy rain), Clouds of vertical development (Cumulus cauliflower fair weather, Cumulonimbus towering anvil thunderheads with lightning and hail); Precipitation physics: Collision-coalescence in warm clouds and Bergeron-Findeisen ice process in cold clouds; Rainfall mechanisms: Convectional (afternoon 4 o'clock showers), Orographic / Relief (heavy windward vs dry leeward rain-shadow), Cyclonic / Frontal.
  *Key Concepts & Entities*: 10 Cloud Genera Classification • Cirrus, Stratus & Cumulus • Cumulonimbus Anvil Thunderheads • Haloes in Cirrostratus • Bergeron-Findeisen Rain Process • Convectional, Orographic & Frontal Rainfall

### Hydrological Cycle & Global Water Balance

- **Global Hydrological Cycle & Global Water Budget** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Earth's water distribution: 97.2% saline in oceans, 2.8% freshwater (68.7% in ice caps and glaciers, 30.1% in groundwater, 0.3% in lakes and rivers, 0.04% in atmosphere); Hydrological Cycle components: Evaporation, Transpiration (Evapotranspiration), Condensation, Precipitation, Infiltration, Percolation, Surface runoff, and Groundwater flow; Global water budget balancing ocean excess evaporation vs land excess precipitation.
  *Key Concepts & Entities*: Global Freshwater Distribution • Hydrological Cycle Mechanics • Evapotranspiration & Runoff • Infiltration and Percolation • Global Water Budget Equilibrium

### Groundwater Hydrology, Aquifers & Springs

- **Groundwater Hydrology: Water Table, Aquifers & Springs** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Subsurface hydrology: Zone of aeration / Vadose zone (soil moisture, capillary fringe) vs Zone of saturation / Phreatic zone; Water Table (fluctuating upper limit of saturation); Porosity vs Permeability; Aquifers: Unconfined (water table aquifer), Confined / Artesian aquifer (trapped between impermeable aquitards/aquicludes under hydrostatic pressure, artesian wells); Perched water table; Natural springs and geysers (Old Faithful, geothermal groundwater heated by magma); Groundwater depletion, saltwater intrusion in coastal aquifers, and artificial recharge.
  *Key Concepts & Entities*: Water Table & Phreatic Zone • Vadose / Aeration Zone • Unconfined vs Confined Aquifers • Artesian Wells & Hydrostatic Pressure • Aquitards and Aquicludes • Groundwater Depletion & Recharge

Oceanography & Marine Systems `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

### Ocean Floor Relief & Features (Continental Shelf, Slope, Abyssal Plains, Oceanic Trenches, Mid-Oceanic Ridges)

- **Ocean Bottom Relief: Continental Shelf, Slope, Rise & Abyssal Plains** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Hypsographic curve of Earth's surface; Major oceanic provinces: Continental Shelf (gently sloping platform <1 deg, width 80km to 1500km in Siberian shelf, shallow depth <200m, richest marine life, commercial fisheries like Grand Banks of Newfoundland and Dogger Bank, offshore petroleum like Mumbai High), Continental Slope (steep incline 2-5 deg marking boundary of continental crust), Continental Rise (gradual apron of turbidity current sediment), and Abyssal Plains (flattest smoothest regions on Earth at depth 3000-6000m, blanketed in pelagic red clay and biogenous oozes).
  *Key Concepts & Entities*: Hypsographic / Hypsometric Curve • Continental Shelf (Fisheries & Oil) • Continental Slope & Continental Rise • Turbidity Currents & Sediment Aprons • Abyssal Plains (Pelagic Oozes)

- **Submarine Canyons, Trenches, Mid-Ocean Ridges & Guyots** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Submarine Canyons (deep V-shaped valleys gouged across continental shelf and slope, e.g., Hudson Canyon, Indus Canyon, Swatch of No Ground); Mid-Oceanic Ridges (continuous 65,000km undersea volcanic mountain chain, central rift valley, hydrothermal vents / black smokers, Mid-Atlantic Ridge, Southwest Indian Ridge); Deep-Sea Trenches (narrow V-shaped subduction chasms: Mariana Trench Challenger Deep 10,994m, Puerto Rico Trench, Sunda/Java Trench); Seamounts (submerged volcanic cones >1000m) and Guyots (flat-topped wave-truncated seamounts).
  *Key Concepts & Entities*: Submarine Canyons (Swatch of No Ground) • Mid-Oceanic Ridge Central Rift • Hydrothermal Vents (Black Smokers) • Mariana Trench Challenger Deep • Seamounts and Flat-Topped Guyots

### Ocean Water Dynamics (Temperature & Salinity Distribution, Ocean Currents - Warm & Cold Currents, Thermohaline Circulation, Tides - Spring & Neap Tides)

- **Ocean Temperature, Salinity & Density Profiles (Thermocline, Halocline)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Physicochemical stratification: Temperature profile: Warm epipelagic mixed layer, Thermocline (rapid temperature decline between 200m-1000m), Cold deep layer; Factors affecting surface temperature: Latitude, upwelling, ocean currents; Salinity: Global average 35 practical salinity units (psu or ‰), Halocline (rapid salinity gradient); Drivers: Evaporation, precipitation, river discharge, ice melting; High-salinity water bodies (Lake Van 330‰, Dead Sea 240‰, Great Salt Lake 220‰, Red Sea 41‰) vs Low-salinity bodies (Baltic Sea 2-7‰, Black Sea); Pycnocline (density stratification zone combining temperature and salinity).
  *Key Concepts & Entities*: Thermocline Temperature Layering • Halocline Salinity Stratification • Pycnocline Density Zone • Average Ocean Salinity (35‰) • High Salinity Seas (Red Sea, Dead Sea) • Low Salinity Seas (Baltic Sea)

- **Ocean Waves: Mechanics, Wave Parameters & Energy** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Wave physics: Wind blowing over fetch generating surface orbital motion; Wave Anatomy: Crest (highest point), Trough (lowest point), Wave Height (vertical distance from trough to crest), Wavelength (horizontal distance between two consecutive crests), Wave Period (time for one wavelength to pass a point), Wave Frequency; Orbital motion of water particles decaying with depth (wave base = wavelength / 2); Shoaling in shallow water where friction slows wave base, steepens wave height, and creates breaking surf (Spilling, Plunging, Surging breakers); Constructive vs Destructive waves shaping coastal morphology.
  *Key Concepts & Entities*: Wave Anatomy (Crest, Trough, Height, Period) • Wind Fetch and Wind Duration • Orbital Particle Motion & Wave Base • Wave Shoaling & Breakers (Surf Zone) • Constructive vs Destructive Waves

- **Tides: Gravitational Forces, Syzygy, Quadrature & Tidal Bores** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Tide generating forces: Differential gravitational attraction of Moon (dominant 2.17x greater) and Sun, balanced by centrifugal force creating two tidal bulges on opposite sides of Earth; Astronomical tidal cycles: Spring Tides (Syzygy alignment: Conjunction/New Moon and Opposition/Full Moon when lunar and solar gravitational forces reinforce each other producing highest tidal range); Neap Tides (Quadrature alignment: First and Third Quarter moons when Sun and Moon act at right angles producing lowest tidal range); Diurnal (one high, one low daily), Semidiurnal (two equal highs, two equal lows daily), Mixed tides; Tidal bore phenomena (steep turbulent wall of water rushing up shallow estuaries, Hooghly River, Qiantang River China, Bay of Fundy world's highest tides 16m); Amphidromic points (cotidal nodal points where tidal range is zero).
  *Key Concepts & Entities*: Tidal Bulges (Moon & Sun Gravitational Forces) • Spring Tides (Syzygy Alignment) • Neap Tides (Quadrature 90 deg) • Semidiurnal & Diurnal Tides • Tidal Bore (Hooghly River) • Bay of Fundy Extreme Tidal Range (16m) • Amphidromic Nodal Points

- **Ocean Currents: Global Gyres & Thermohaline Circulation** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Surface wind-driven ocean circulation: Five major Subtropical Gyres (North/South Atlantic, North/South Pacific, Indian Ocean) circulating clockwise in Northern Hemisphere and counter-clockwise in Southern Hemisphere; Western Boundary Currents (narrow, deep, swift warm currents: Gulf Stream, Kuroshio, Brazil, Agulhas) vs Eastern Boundary Currents (broad, shallow, slow cold currents: California, Canaries, Benguela, Peru / Humboldt); Sargasso Sea enclosed by Atlantic gyre; Seasonal reversal of North Indian Ocean currents (Southwest Monsoon Drift eastward vs Northeast Monsoon Drift westward); Thermohaline Circulation / Global Conveyor Belt driven by cold saline North Atlantic Deep Water (NADW) formation; Coastal upwelling and downwelling mechanisms.
  *Key Concepts & Entities*: Five Subtropical Ocean Gyres • Western Boundary Currents (Gulf Stream, Kuroshio) • Eastern Boundary Currents (Humboldt, Canaries) • Sargasso Sea • North Indian Ocean Monsoon Reversal • Thermohaline Conveyor Belt (NADW) • Coastal Upwelling and Downwelling

- **Ocean-Atmosphere Teleconnections: ENSO (El Niño, La Niña) & Indian Ocean Dipole (IOD)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Coupled ocean-atmosphere teleconnections: Normal Walker Circulation over equatorial Pacific; El Niño Southern Oscillation (ENSO): El Niño warm phase (weakening of Trade winds, eastward displacement of warm water pool, suppression of Peruvian coastal upwelling, collapse of anchovy fishery, teleconnections suppressing Indian monsoon and causing Australian drought); La Niña cold phase (intensified Trade winds, amplified Peruvian upwelling, enhanced monsoon rainfall in India); El Niño Modoki (central Pacific warming anomaly); Indian Ocean Dipole (IOD): Positive IOD (warm Western Indian Ocean, cool Eastern Indian Ocean, favorable for Indian monsoon) vs Negative IOD (cool Western Indian Ocean, suppressed monsoon); ENSO-IOD coupling and global climatic anomalies.
  *Key Concepts & Entities*: Walker Circulation Cell • El Niño (ENSO Warm Phase) • La Niña (ENSO Cold Phase) • Southern Oscillation Index (SOI) • El Niño Modoki • Indian Ocean Dipole (Positive & Negative IOD) • Peruvian Upwelling Suppression • Teleconnections to Indian Monsoon

### Marine Ecosystems & Conservation (Coral Reefs - Fringing, Barrier, Atoll; Coral Bleaching, Blue Carbon, Ocean Acidification, EEZ, Marine Protected Areas)

- **Coral Reefs: Symbiosis, Darwin's Subsidence Theory & Bleaching** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Marine biodiversity hotspots: Hermatypic reef-building polyps in mutualistic symbiosis with photosynthetic Zooxanthellae dinoflagellates; Environmental requirements: Warm shallow tropical waters (20-28 deg C), depth <50m for light penetration, normal salinity 30-35‰, clear sediment-free water; Morphological reef types: Fringing Reefs, Barrier Reefs (Great Barrier Reef Australia), Atolls (Lakshadweep, Maldives); Formation theories: Charles Darwin's Subsidence Theory (fringing -> barrier -> atoll as volcanic island subsides), Reginald Daly's Glacial Control Theory; Coral Bleaching: Expulsion of zooxanthellae under elevated Sea Surface Temperatures and marine heatwaves; Ocean Acidification (carbonic acid reducing carbonate saturation needed for aragonite calcium carbonate skeletons).
  *Key Concepts & Entities*: Coral-Zooxanthellae Symbiosis • Fringing, Barrier & Atoll Reefs • Darwin's Subsidence Theory • Coral Bleaching Thermal Triggers • Ocean Acidification (Carbonate Saturation) • Great Barrier Reef & Lakshadweep Atolls

- **Marine Resources (Polymetallic Nodules), UNCLOS Maritime Zones & Blue Economy** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Ocean economics and international law of the sea: Living resources (pelagic and demersal fisheries, mariculture, seaweed); Non-living marine resources: Polymetallic Nodules / Manganese Nodules on abyssal floor (rich in manganese, nickel, cobalt, copper; India's deep-sea mining exploration block in Central Indian Ocean Basin approved by International Seabed Authority / ISA under Deep Ocean Mission / Samudrayaan), Gas hydrates, Placer mineral sands (monazite, ilmenite on Kerala beaches); United Nations Convention on the Law of the Sea (UNCLOS) maritime zones: Baseline, Internal Waters, Territorial Sea (12 nautical miles, sovereign territory), Contiguous Zone (24 nm, fiscal/customs/immigration jurisdiction), Exclusive Economic Zone / EEZ (200 nm, exclusive sovereign rights to living and non-living resources), High Seas (global commons under ISA jurisdiction).
  *Key Concepts & Entities*: Polymetallic Nodules (Manganese Nodules) • Deep Ocean Mission (Samudrayaan) • International Seabed Authority (ISA) • UNCLOS Maritime Zones (Territorial Sea 12nm) • Exclusive Economic Zone (EEZ 200nm) • High Seas Global Commons • Blue Economy Initiatives

Indian Physical Geography & Monsoon Architecture `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

### Physiographic Divisions of India (Himalayan Mountain System, Northern Great Plains, Peninsular Plateau, Coastal Plains, Lakshadweep & Andaman Nicobar Islands)

- **Himalayan Mountain System: Ranges, Passes & Structural Faults** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Morphotectonic divisions: Trans-Himalayas (Karakoram with K2/Godwin-Austen, Ladakh, Zanskar), Greater Himalayas / Himadri (average elevation 6,000m, Mt. Everest, Kanchenjunga, Nanda Devi), Lesser Himalayas / Himachal (Pir Panjal, Dhauladhar, Nag Tibba, Mahabharat range; famous hill stations & Duns/Duars), Shiwaliks / Outer Himalayas (youngest sedimentary fold range with hogback topography), and Purvanchal / Eastern Hills (Patkai Bum, Naga Hills, Manipur Hills, Mizo/Lushai Hills); Longitudinal divisions: Punjab/Kashmir, Kumaon, Nepal, and Assam Himalayas; Strategic mountain passes: Zoji La, Banihal, Rohtang, Shipki La, Lipulekh, Nathu La, Jelep La, Bomdi La; Structural boundary thrusts: Main Central Thrust (MCT), Main Boundary Thrust (MBT), and Himalayan Frontal Thrust (HFT).
  *Key Concepts & Entities*: Himadri (Greater Himalayas) • Himachal (Lesser Himalayas) • Shiwalik Outer Range • Purvanchal Hills • Karakoram & Zanskar Ranges • Zoji La, Shipki La & Nathu La Passes • Main Central Thrust (MCT) & MBT

- **Northern Great Plains: Bhabar, Tarai, Bhangar & Khadar Morphology** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Geomorphological zones of the Indo-Gangetic-Brahmaputra alluvial trough: Bhabar (narrow 8-10 km piedmont pebble belt at the Shiwalik foot where streams disappear subterraneanly), Tarai (marshy, damp, heavily forested zone of stream re-emergence with high water table), Bhangar (older, elevated alluvium lying above flood levels containing Kankar calcareous nodules), and Khadar / Bet (newer, fertile, annually replenished silt deposits in river floodplains); Regional plain divisions: Rajasthan Plains, Punjab-Haryana Plains, Upper, Middle, and Lower Ganga Plains, and Brahmaputra Valley; Riverine islands such as Majuli on the Brahmaputra (world's largest inhabited river island).
  *Key Concepts & Entities*: Bhabar Pebble Belt • Tarai Marshy Zone • Bhangar Older Alluvium & Kankar • Khadar Floodplain Silt • Indo-Gangetic Alluvial Trough • Majuli River Island

- **Peninsular Plateau: Central Highlands, Deccan & Western-Eastern Ghats** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Ancient Gondwana crystalline plateau: Central Highlands: Aravalli Range (relict fold mountain, Guru Shikhar 1,722m), Malwa Plateau, Bundelkhand, Baghelkhand, and Chota Nagpur Plateau ('Ruhr of India' rich in minerals); Deccan Plateau: Deccan Traps (basaltic lava plateau in Maharashtra), Karnataka/Mysore Plateau (divided into Malnad hill tracts and Maidan rolling plains), and Telangana Plateau; Satpura Range (horst mountain, Dhupgarh peak) and Vindhyan Range; Western Ghats / Sahyadri (continuous escarpment, UNESCO World Heritage site, Anamudi 2,695m highest peak in South India, Doddabetta in Nilgiris, Thal Ghat, Bhor Ghat, Palghat Gap); Eastern Ghats (discontinuous, eroded residual hills dissected by east-flowing rivers, Arma Konda / Jindhagada peak, Shevaroy, Javadi Hills).
  *Key Concepts & Entities*: Chota Nagpur Plateau • Aravalli Range & Guru Shikhar • Deccan Traps Basalt • Western Ghats / Sahyadri & Anamudi • Eastern Ghats Discontinuous Arc • Nilgiri Hills & Doddabetta • Palghat Gap

- **Coastal Plains & Island Territories: Arabian Sea & Bay of Bengal** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Comparative morphology: West Coastal Plain (submerged narrow coastal strip, indented coastline with natural ports, lagoons/Kayals like Vembanad in Kerala, divided into Kathiawar, Konkan, Kannada, and Malabar coasts) vs East Coastal Plain (emergent broad coastal strip, massive river deltas of Mahanadi, Godavari, Krishna, Cauvery, lagoons like Chilika and Pulicat, divided into Utkal, Northern Circars, and Coromandel Coast); Island Territories: Andaman & Nicobar Islands in Bay of Bengal (submerged peaks of Arakan Yoma fold belt, volcanic Barren Island and Narcondam, Ten Degree Channel separating Andaman from Nicobar, Duncan Passage, Great Nicobar biosphere reserve, Indira Point southernmost tip); Lakshadweep Islands in Arabian Sea (coral atoll archipelago, Minicoy island separated by Nine Degree Channel, Eight Degree Channel separating Minicoy from Maldives).
  *Key Concepts & Entities*: West Coastal Plain & Malabar Kayals • East Coastal Plain & Coromandel Coast • Andaman & Nicobar Islands • Barren Island Active Volcano • Ten Degree Channel • Lakshadweep Coral Atolls • Nine Degree Channel

### Drainage Systems of India (Himalayan Rivers - Indus, Ganga, Brahmaputra; Peninsular Rivers - Narmada, Tapi, Godavari, Krishna, Kaveri, Mahanadi; River Interlinking)

- **Himalayan Drainage: Indus, Ganga & Brahmaputra Basins** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Antecedent, perennial, snow-fed drainage: Indus River System (origin near Bokhar Chu glacier near Lake Mansarovar; 5 Punjab tributaries: Jhelum originating at Verinag, Chenab formed by Chandra and Bhaga, Ravi, Beas, Sutlej cutting through Shipki La; Right bank tributaries: Shyok, Gilgit, Hunza, Kabul; Indus Waters Treaty 1960); Ganga River System (Panch Prayag headwaters: Vishnuprayag / Alaknanda-Dhauliganga, Nandaprayag / Nandakini, Karnaprayag / Pindar, Rudraprayag / Mandakini, Devprayag / Bhagirathi-Alaknanda confluence forming Ganga; Left-bank tributaries: Ramganga, Gomti, Ghaghara, Gandak, Kosi 'Sorrow of Bihar'; Right-bank tributaries: Yamuna originating at Yamunotri with Chambal, Betwa, Ken, and Son from Amarkantak; deltaic bifurcation into Hugli and Padma); Brahmaputra River System (origin at Chemayungdung glacier as Yarlung Tsangpo in Tibet, carved Namcha Barwa syntaxis into Arunachal Pradesh as Siang/Dihang; joined by Dibang and Lohit; major tributaries: Subansiri, Kameng, Manas, Sankosh, Teesta; merges with Padma and Meghna into Bay of Bengal).
  *Key Concepts & Entities*: Indus Basin & 5 Punjab Rivers • Indus Waters Treaty 1960 • Panch Prayag (Devprayag Confluence) • Ganga Basin Tributaries • Yamuna, Chambal & Son Rivers • Brahmaputra / Tsangpo Basin • Teesta & Subansiri Tributaries

- **Peninsular Drainage: East-Flowing Deltas & West-Flowing Rift Valleys** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Superimposed, mature, rain-fed peninsular drainage: Major East-Flowing Rivers (drain into Bay of Bengal forming arcuate/bird-foot deltas): Godavari / Dakshin Ganga (longest peninsular river 1,465 km, origin at Trimbakeshwar in Nasik, tributaries: Pravara, Manjira, Penganga, Wainganga, Wardha, Indravati, Sabari); Krishna River (origin at Mahabaleshwar, tributaries: Koyna, Ghataprabha, Malaprabha, Bhima, Tungabhadra); Cauvery / Kaveri (origin at Talakaveri in Brahmagiri hills, perennial character due to SW and NE monsoon rains, tributaries: Harangi, Hemavati, Shimsha, Arkavathi, Kabini, Bhavani, Noyyal, Amaravati; Shivanasamudra & Hogenakkal falls); Mahanadi (origin in Dandakaranya Chhattisgarh, Hirakud Dam, delta in Odisha); Major West-Flowing Rivers (drain into Arabian Sea through estuaries without deltas): Narmada (origin at Amarkantak, flows through tectonic rift valley between Vindhya and Satpura, Dhuandhar falls in marble rocks, Sardar Sarovar Dam); Tapi / Tapti (origin at Multai in Betul, flows through rift valley south of Satpura, Ukai Dam); Sabarmati and Mahi (cuts across Tropic of Cancer twice); Short coastal rivers: Mandovi & Zuari in Goa, Sharavathi (Jog / Gersoppa Falls), Netravathi in Karnataka, Periyar and Bharatapuzha in Kerala.
  *Key Concepts & Entities*: Godavari / Dakshin Ganga Basin • Krishna River & Tungabhadra • Cauvery / Kaveri Basin & Tributaries • Mahanadi River & Hirakud Dam • Narmada Rift Valley & Dhuandhar • Tapi River Estuary • Sharavathi (Jog Falls) & Periyar

- **Inter-State River Water Disputes, Interlinking & Watershed Management** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Water governance, federal hydrological conflicts, and basin management: National River Linking Project (NRLP by NWDA: 14 Himalayan and 16 Peninsular links; Ken-Betwa Link Project connecting MP and UP; Par-Tapi-Narmada link, Godavari-Cauvery link); Inter-State River Water Disputes Act 1956 (Article 262 constitutional bar on Supreme Court jurisdiction; Cauvery Water Disputes Tribunal, Krishna Water Disputes Tribunal, Mahadayi Water Disputes Tribunal, Vansadhara tribunal); Integrated Watershed Management Programme (IWMP under PMKSY - Watershed Development component), Neeranchal National Watershed Project, check dams, and ridge-to-valley conservation approach.
  *Key Concepts & Entities*: National River Linking Project (NRLP) • Ken-Betwa River Link • Inter-State River Water Disputes Act (Article 262) • Cauvery & Krishna Disputes Tribunals • Mahadayi River Dispute • Integrated Watershed Management (PMKSY)

### Indian Monsoon & Climate Dynamics (South-West & North-East Monsoons, Mechanism of Monsoon - ITCZ Shift, Jet Streams, El Niño, La Niña, Indian Ocean Dipole / IOD, Western Disturbances)

- **Monsoon Mechanism: ITCZ Migration, Arabian Sea & Bay of Bengal Branches** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Dynamic mechanism of Indian monsoon: Thermal vs Dynamic theories (Halley's differential heating vs Flohn's seasonal migration of Inter-Tropical Convergence Zone / ITCZ / Monsoon Trough); Onset of Southwest Monsoon (typically June 1 over Kerala coast); Dual branches: Arabian Sea Branch (strikes Western Ghats causing heavy orographic precipitation, moves across Mumbai, Gujarat, and merges with Bengal branch in Punjab) vs Bay of Bengal Branch (strikes Arakan Yoma and Meghalaya hills causing world-record rainfall at Mawsynram and Cherrapunji due to funneling effect, deflects westwards along Indo-Gangetic trough); Monsoon 'Breaks' (shifts of monsoon trough to Himalayan foothills causing plains dry spells and mountain flash floods); Retreating / Northeast Monsoon (October-November withdrawal, retreating cyclones striking Coromandel coast, winter rainfall over Tamil Nadu).
  *Key Concepts & Entities*: ITCZ / Monsoon Trough Migration • Onset of Southwest Monsoon (June 1) • Arabian Sea Monsoon Branch • Bay of Bengal Branch & Funneling Effect • Mawsynram Rainfall Record • Retreating / Northeast Monsoon (Tamil Nadu Rains)

- **Jet Streams & Global Teleconnections: TEJS, STWJ, ENSO, IOD & MJO** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Upper tropospheric steering engines and global teleconnections: Subtropical Westerly Jet Stream (STWJ: presence south of Himalayas in winter, sudden northward bifurcation/withdrawal beyond Tibetan Plateau triggering sudden summer monsoon burst); Tropical Easterly Jet Stream (TEJS: dynamic outflow generated by intense summer heating of Tibetan Plateau anticyclone); Somali / Findlater Low-Level Jet (cross-equatorial low-level flow driving moisture towards peninsular coast); Mascarene High (subtropical high-pressure cell near Madagascar acting as primary monsoon pump); Global teleconnections: El Niño-Southern Oscillation (ENSO: El Niño warming in eastern Pacific suppressing Indian monsoon vs La Niña enhancing rains), Indian Ocean Dipole (positive IOD warming western Indian Ocean aiding monsoon vs negative IOD causing deficit), and Madden-Julian Oscillation (MJO: eastward propagating pulse of cloudiness and convective rainfall).
  *Key Concepts & Entities*: Subtropical Westerly Jet Stream (STWJ) • Tropical Easterly Jet Stream (TEJS) • Tibetan Plateau Thermal Engine • Somali / Findlater Jet & Mascarene High • ENSO Teleconnection to Indian Monsoon • Indian Ocean Dipole (Positive/Negative IOD) • Madden-Julian Oscillation (MJO)

- **Western Disturbances, Pre-Monsoon Showers & Extreme Weather Events** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Winter precipitation and localized convective weather systems: Western Disturbances (shallow extra-tropical cyclonic depressions originating over Mediterranean Sea and Caspian Sea, steered into northwest India by subtropical westerly jet stream; vital winter precipitation for Rabi crops, especially wheat, and snowfall in Western Himalayas; causes cold waves and dense fog); Pre-monsoon convective thunderstorms: Mango Showers (Kerala and coastal Karnataka aiding mango ripening), Blossom Showers / Cherry Blossom (coffee-growing regions of Karnataka), Nor'westers / Kalbaisakhi (severe localized evening thunderstorms with gale winds in West Bengal and Assam / Bardoli Chheerha vital for tea and jute), and Loo (intense, dry, scorching summer winds across northern plains causing severe heatwaves).
  *Key Concepts & Entities*: Western Disturbances (Mediterranean Origin) • Rabi Crop Rainfall & Himalayan Snowfall • Mango Showers & Blossom Showers • Nor'westers / Kalbaisakhi (Bengal) • Bardoli Chheerha (Assam) • Loo Heatwaves & Northern Plains Fog

### Soils & Natural Vegetation of India (Soil Types - Alluvial, Black / Regur, Red, Laterite, Arid, Saline; Forest Types - Tropical Evergreen, Deciduous, Thorn, Montane, Mangroves)

- **Major Soil Groups of India: ICAR Classification & Land Degradation** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  ICAR 8 major soil orders and distribution: Alluvial Soils (most extensive ~40% area, rich in potash and lime, deficient in nitrogen and phosphorus, divided into Khadar and Bhangar); Black / Regur Soils (formed by weathering of Deccan basaltic lava, high montmorillonite clay content, self-ploughing, high moisture retention, ideal for cotton); Red and Yellow Soils (formed on ancient crystalline Archean granites, ferric oxides impart red color, hydrated form appears yellow, widespread in Tamil Nadu, Odisha, Chota Nagpur); Laterite Soils (formed under high temperature and alternate wet-dry seasons by intense leaching of silica, rich in iron and aluminium oxides, bauxite/cashew/tea/coffee); Arid & Desert Soils (sandy, saline, deficient in moisture/humus); Saline & Alkaline Soils (Usar/Reh/Kallar, high capillary evaporation, Punjab/Haryana canal tracts); Peaty and Marshy Soils (Kari soils in Kerala, high organic matter); Soil erosion and land degradation: Sheet, rill, and gully erosion (Chambal badlands/ravines), desertification, wind erosion in Thar, and soil conservation schemes (Soil Health Card Scheme).
  *Key Concepts & Entities*: Alluvial Soils (Khadar & Bhangar) • Black / Regur Soil (Montmorillonite Clay) • Red & Yellow Soils (Ferric Oxides) • Laterite Soil & Intense Leaching • Arid & Saline Soils (Usar / Reh) • Gully Erosion & Chambal Ravines • Soil Health Card Scheme

- **Natural Vegetation & Forest Types of India (Champion & Seth)** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Ecological classification based on rainfall, altitude, and temperature (Champion and Seth system): Tropical Wet Evergreen Forests (rainfall >250 cm, Western Ghats, NE India, multi-layered canopy, rosewood, mahogany, ebony); Tropical Semi-Evergreen Forests; Tropical Moist Deciduous Forests (most widespread forest type in India, rainfall 100-200 cm, teak, sal, shisham, sandalwood, mahua); Tropical Dry Deciduous Forests (rainfall 70-100 cm, transition to open woodland, tendu, palas, amaltas, bel); Tropical Thorn Forests (rainfall <70 cm, arid/semi-arid, xerophytic acacias, euphorbias, date palms); Montane Subtropical and Temperate Forests (broadleaf evergreen oaks/chestnuts, coniferous pines/deodar/spruce, Sholas of Nilgiris and Annamalai); Alpine Forests and Tundra (silver fir, junipers, rhododendrons); Littoral & Swamp / Mangrove Forests (halophytic vegetation, pneumatophores / breathing roots, stilt roots, Sundarbans Sundari trees Heritiera fomes, Godavari-Krishna deltas, Pichavaram).
  *Key Concepts & Entities*: Tropical Wet Evergreen Forests • Tropical Moist Deciduous (Teak & Sal) • Tropical Dry Deciduous (Tendu & Palas) • Montane Temperate Shola Forests • Coniferous Deodar & Pine Forests • Littoral & Swamp Mangroves • Sundarbans & Pichavaram Mangroves

- **Forest Conservation, ISFR Dynamics & Policy Frameworks** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Biennial assessment and statutory conservation architecture: India State of Forest Report (ISFR published biennially by Forest Survey of India / FSI; parameters: Forest Cover categorized into Very Dense Forest >70% canopy, Moderately Dense Forest 40-70%, and Open Forest 10-40%; Tree Cover outside recorded forests; Mangrove cover trends; Forest fire vulnerability mapping; Growing stock and carbon stock assessments); Legal categorization: Reserved Forests (highest protection under Indian Forest Act 1927), Protected Forests, and Village Forests; Conservation frameworks: Compensatory Afforestation Fund Management and Planning Authority (CAMPA Act 2016), National Mission for a Green India (GIM), Joint Forest Management (JFM), and social forestry programs.
  *Key Concepts & Entities*: India State of Forest Report (ISFR / FSI) • Very Dense vs Moderately Dense Forest Cover • Tree Cover Outside Forests (TOF) • Carbon Stock Assessments • Reserved & Protected Forests (IFA 1927) • CAMPA Act 2016 • Green India Mission (GIM)

Human Geography & Population Settlements `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

### Global & Indian Demographic Trends (Population Distribution, Density, Growth Models - Demographic Transition Theory, Migration Types & Push-Pull Factors)

- **Demographic Attributes: Vital Rates, Fertility & Demographic Dividend** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Core demographic metrics and population structures: Vital rates: Crude Birth Rate (CBR), Crude Death Rate (CDR), Natural Growth Rate; Total Fertility Rate (TFR: national replacement level of 2.1, regional divergence between northern states like Bihar/UP and southern states like Kerala/Tamil Nadu); Mortality indicators: Infant Mortality Rate (IMR), Under-5 Mortality Rate, Maternal Mortality Ratio (MMR); Population pyramids and age structures (expansive, constrictive, stationary); Dependency Ratio (youth vs elderly dependency); Demographic Dividend (working-age cohort 15-59 years, opportunity window and human capital constraints); Sex Ratio (national trends, Child Sex Ratio 0-6 years, regional imbalances, Beti Bachao Beti Padhao initiative).
  *Key Concepts & Entities*: Total Fertility Rate (TFR & 2.1 Replacement) • Crude Birth & Death Rates • Infant Mortality Rate (IMR) • Maternal Mortality Ratio (MMR) • Demographic Dividend (15-59 Cohort) • Child Sex Ratio Dynamics • Population Age Pyramids

- **Theories of Population Growth: Malthus, Marx & Demographic Transition** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Classical and modern population doctrines: Malthusian Theory of Population (Essay on the Principle of Population 1798: food production grows arithmetically 1, 2, 3, 4 while population grows geometrically 1, 2, 4, 8; Malthusian catastrophe; Preventive checks vs Positive checks like famine/pestilence/war); Marxist critique of Malthus (poverty as a result of capitalist distribution, not biological overpopulation); Demographic Transition Model (DTM: 5 stages: Stage 1 High Stationary / high birth & death, Stage 2 Early Expanding / death rate falls while birth rate remains high causing population explosion, Stage 3 Late Expanding / birth rate begins declining, Stage 4 Low Stationary / low birth & death, Stage 5 Declining / sub-replacement fertility; India positioned in Stage 3 late expanding transition).
  *Key Concepts & Entities*: Malthusian Theory of Population • Arithmetic vs Geometric Growth • Preventive & Positive Checks • Demographic Transition Model (5 Stages) • Stage 2 Population Explosion • India Stage 3 Transition

- **Migration Dynamics: Streams, Push-Pull Determinants & Socio-Economic Impact** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Spatial mobility of populations: Internal migration streams in India (rural-to-rural predominantly female marriage migration, rural-to-urban predominantly male economic migration, urban-to-urban, and urban-to-rural counter-urbanization); Migration theories: Ravenstein's Laws of Migration, Everett Lee's Push and Pull Factors (push: agrarian distress, lack of employment, floods/droughts; pull: higher wages, industrial jobs, educational infrastructure); Inter-state vs intra-state migration corridors (UP/Bihar to Maharashtra, Gujarat, Delhi, Punjab); Socio-economic consequences: Remittance economies (domestic and international remittances from Gulf), feminization of agriculture in source areas, pressure on urban civic infrastructure and growth of informal settlements, brain drain vs brain gain.
  *Key Concepts & Entities*: Rural-to-Rural & Rural-to-Urban Migration • Push-Pull Factors (Everett Lee) • Inter-State Migration Corridors • Remittance Economy & Agrarian Impact • Feminization of Agriculture • Urban Infrastructure Strain

### Human Settlements & Urban Systems (Rural Settlement Types - Clustered, Dispersed; Urban Classification, Conurbations, Megalopolis, Functional Classification of Towns)

- **Rural Settlement Morphology: Spatial Types & Vernacular Architecture** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Geographical morphology of rural dwellings: Physical, cultural, and historical determinants of settlement patterns (water points/wet point settlements, defensibility, fertile soil); Four standard morphological types: Clustered / Compact / Nucleated settlements (closely built houses, common in fertile alluvial plains of Ganga and valley tracts), Semi-clustered / Fragmented settlements (segregation or grouping of specific castes/clans on the periphery, Gujarat plains, Rajasthan), Hamleted settlements (physically separated units bearing local names like Panna, Para, Palli, Nagla, Dhani across Middle Ganga plain and lower Himalayas), and Dispersed / Isolated settlements (isolated farmsteads or huts scattered over hills, Western Ghats, Meghalaya, Himachal Pradesh); Vernacular building materials adapted to local micro-climates (adobe, thatch, stone masonry, bamboo).
  *Key Concepts & Entities*: Clustered / Nucleated Settlements • Semi-Clustered Morphology • Hamleted Settlements (Panna / Para / Palli) • Dispersed / Isolated Mountain Huts • Wet Point Settlement Determinants • Vernacular Architecture

- **Urbanization Processes: Census Criteria, Hierarchy & Functional Towns** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Criteria, taxonomy, and distribution of urban centres: Census of India definition of Urban: Statutory Towns (all places with a municipality, corporation, cantonment board, or notified town area committee) vs Census Towns (places satisfying three criteria: minimum population of 5,000, at least 75% of male working population engaged in non-agricultural pursuits, and a density of at least 400 persons/sq km); Urban hierarchy: Class I towns (>100,000 population), Metropolitan cities / Million-plus cities, and Megacities (>10 million population); Conurbations and Urban Agglomerations (UAs); Ashok Mitra's functional classification of Indian cities: Administrative/capital towns, Industrial/manufacturing cities, Mining towns, Garrison/cantonment towns, Commercial/trading ports, and Religious/cultural/educational centers.
  *Key Concepts & Entities*: Statutory Towns vs Census Towns • Census 3-Fold Urban Criteria • Metropolitan & Megacity Classifications • Urban Agglomerations (UAs) • Ashok Mitra Functional Classification • Conurbations & Urban Hierarchy

- **Urban Morphology: Spatial Models, Slums & Sustainable City Missions** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Internal spatial structure and contemporary challenges of cities: Classical urban land-use models: Concentric Zone Model (Ernest Burgess - Central Business District / CBD, zone of transition, commuter zone), Sector Model (Homer Hoyt - transport corridors and radial sectors), and Multiple Nuclei Model (Chauncy Harris & Edward Ullman - polycentric urban growth); Mark Jefferson's Primate City concept and Zipf's Rank-Size Rule; Critical urban challenges: Proliferation of informal settlements/slums (Dharavi in Mumbai), urban sprawling, Urban Heat Island (UHI) effect, urban flooding due to encroachment of wetlands, acute water stress (Day Zero crises), municipal solid waste management, air quality crises; National urban missions: Smart Cities Mission, AMRUT (Atal Mission for Rejuvenation and Urban Transformation), Pradhan Mantri Awas Yojana - Urban (PMAY-U), and Swachh Bharat Mission - Urban.
  *Key Concepts & Entities*: Concentric Zone Model (Burgess) • Sector Model (Hoyt) • Multiple Nuclei Model (Harris & Ullman) • Primate City & Rank-Size Rule • Urban Heat Island (UHI) Effect • Informal Settlements & Slums (Dharavi) • Smart Cities Mission & AMRUT

### Tribal Demographics, PVTGs & Cultural Anthropology

- **Tribal Demographics: Geographic Belts, Major Tribes & Linguistic Families** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Geographical distribution, demographic attributes, and ethnographic profiles: Constitutional status (Scheduled Tribes under Article 342, comprising 8.6% of India's population as per Census 2011; state distributions: Madhya Pradesh highest ST population, Lakshadweep and Mizoram highest percentage share, absence in Punjab/Haryana); Major geographic belts: Central Tribal Belt (over 55% of tribal population: Gonds, Bhils, Santhals, Oraon, Munda, Ho across MP, Chhattisgarh, Jharkhand, Odisha, Rajasthan), North-Eastern Tribal Belt (Nagas, Mizos, Khasis, Garos, Bodos, Apatanis), Western Ghats & Southern Hills (Toda of Nilgiris pastoralists, Irula snake-catchers, Kadar, Kurumba), and Himalayan / Sub-Himalayan Belt (Gaddis, Gujjars, Bakarwals transhumant pastoralists, Bhotias); Linguistic classifications: Austro-Asiatic (Mundari, Santhali, Khasi), Tibeto-Burman (NE tribes), Dravidian (Gondi, Kurukh, Toda), and Indo-Aryan (Bhil).
  *Key Concepts & Entities*: Scheduled Tribes (Article 342 & 8.6% Share) • Central Tribal Belt (Gonds, Bhils, Santhals) • North-Eastern Tribes (Nagas, Khasis, Garos) • Transhumant Pastoralists (Gaddis & Bakarwals) • Nilgiri Tribes (Toda & Irula) • Austro-Asiatic & Tibeto-Burman Languages

- **Particularly Vulnerable Tribal Groups (PVTGs) & Statutory Rights** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Ethnographic vulnerability criteria, statutory safeguards, and affirmative policies: Particularly Vulnerable Tribal Groups (PVTGs: created based on Dhebar Commission recommendations 1973; 75 identified groups across 18 states and UT of Andaman & Nicobar Islands; Odisha has highest number 13 PVTGs); Fourfold identification criteria: Pre-agricultural level of technology (hunting-gathering/shifting cultivation), stagnant or declining population, extremely low literacy, and subsistence level of economy; Iconic PVTG communities: Great Andamanese, Sentinelese (uncontacted hunter-gatherers of North Sentinel Island), Jarawas, Onge, Shompen of Nicobar; Birhor of Jharkhand, Chenchus of Nallamala Hills, Dongria Kondh of Niyamgiri Hills, Maria Gond; Statutory frameworks: Panchayats (Extension to Scheduled Areas) Act 1996 (PESA: Gram Sabha self-governance over minor forest produce and land acquisition), Forest Rights Act 2006 (FRA: Individual Forest Rights, Community Forest Rights, Habitat Rights for PVTGs), and PM-JANMAN scheme (Pradhan Mantri Janjati Adivasi Nyaya Maha Abhiyan).
  *Key Concepts & Entities*: 75 Identified PVTGs (Dhebar Commission) • Andamanese, Sentinelese, Jarawas & Onge • Dongria Kondh (Niyamgiri) & Chenchus • Fourfold PVTG Identification Criteria • PESA Act 1996 & Gram Sabha Rights • Forest Rights Act 2006 (FRA) • PM-JANMAN Mission

Economic & Resource Geography `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

### Global & Indian Distribution of Natural Resources (Mineral Resources - Iron Ore, Bauxite, Copper, Coal, Petroleum, Natural Gas, Uranium; Water Resources, Land & Soil Resources)

- **Metallic & Non-Metallic Mineral Belts: India & Global Reserves** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Geological distribution and spatial concentrations of minerals: Iron Ore (Hematite 75% and Magnetite 25% reserves; Major Indian belts: Odisha-Jharkhand belt with Badampahar, Noamundi, Gua; Durg-Bastar-Chandrapur belt with Bailadila mechanized mines in Chhattisgarh; Bellary-Chitradurga-Chikmagalur-Tumkur belt in Karnataka with Kudremukh and Sandur hills; Goa-Ratnagiri belt; Global iron ore reserves: Pilbara region in Australia, Carajás and Minas Gerais in Brazil, Lake Superior region USA, Anshan China, Krivoy Rog Ukraine); Bauxite & Aluminium (Odisha Panchpatmali deposits largest producer, Gujarat Jamnagar, Jharkhand Lohardaga, MP Amarkantak plateau; Global: Weipa Australia, Guinea Boké, Jamaica); Copper Ore (Malanjkhand in Balaghat MP, Khetri copper belt in Rajasthan, Singhbhum Jharkhand; Global: Atacama Chuquicamata Chile largest open-pit, DRC-Zambia Copperbelt); Manganese (Balaghat MP, Nagpur-Bhandara Maharashtra, Keonjhar Odisha; Global: South Africa Kalahari basin, Gabon); Chromite (Sukinda valley in Jajpur Odisha 90% reserves); Non-metallic minerals: Mica (Koderma in Jharkhand 'Mica capital', Nellore in Andhra Pradesh, Bhilwara Rajasthan), Limestone (cement raw material in MP, Rajasthan, Andhra Pradesh), and Gypsum.
  *Key Concepts & Entities*: Hematite & Magnetite Belts • Bailadila & Kudremukh Iron Mines • Pilbara (Australia) & Carajás (Brazil) • Bauxite (Panchpatmali Odisha) • Khetri & Malanjkhand Copper Belts • Chuquicamata Copper (Chile) • Mica & Sukinda Valley Chromite

- **Energy Resources: Coal, Hydrocarbons, Critical Minerals & Renewables** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Spatial mapping of conventional and non-conventional energy resources: Coal (Gondwana coal ~250 million years old, non-coking/bituminous, 98% Indian reserves located in river valleys: Damodar valley with Jharia oldest/richest coalfield and Raniganj, Son valley with Singrauli, Mahanadi valley with Talcher, Wardha-Godavari valley; Tertiary coal ~15-60 million years old, high sulphur/moisture, Makum in Assam, lignite brown coal at Neyveli Tamil Nadu; Global: Appalachian basin USA, Ruhr Germany, Shanxi China, Newcastle Australia); Petroleum & Natural Gas (Onshore: Brahmaputra valley Digboi oldest oilfield, Naharkatiya, Moran-Hugrijan; Gujarat basin Ankleshwar, Kalol, Cambay; Rajasthan Barmer basin Mangala, Bhagyam, Aishwarya; Offshore: Mumbai High on continental shelf, Bassein gas field, Krishna-Godavari deepwater basin KG-D6; Strategic Petroleum Reserves: Padur, Mangalore, Visakhapatnam, Chandikhol); Nuclear Energy & Critical Minerals (Uranium: Jaduguda and Narwapahar in Singhbhum Jharkhand, Tummalapalle in Andhra Pradesh largest reserve in carbonate rock; Thorium: Monazite beach sands of Kerala Chavara and Odisha; Critical Minerals & Rare Earth Elements: Lithium discovery in Reasi J&K and Mandya Karnataka); Renewable Energy Geography (Solar parks: Bhadla Rajasthan largest, Pavagada Karnataka, Kurnool; Wind energy corridors: Muppandal wind farm in Tamil Nadu, Jaisalmer, coastal Gujarat; Green Hydrogen mission hubs).
  *Key Concepts & Entities*: Gondwana Coal Basins (Jharia & Raniganj) • Tertiary Lignite (Neyveli) • Offshore Mumbai High & KG-D6 Gas Basin • Strategic Petroleum Reserves (SPR) • Uranium (Jaduguda & Tummalapalle) • Monazite Thorium Beach Sands • Solar Parks (Bhadla & Pavagada) • Muppandal Wind Energy Corridor

- **Water Resources: Multipurpose River Valley Projects & Irrigation Networks** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Surface and groundwater endowments and hydraulic infrastructure: Surface water resources (12 major river basins; utilizable surface flow constraints); Major Multipurpose River Valley Projects ('Temples of Modern India'): Bhakra-Nangal Project on Sutlej (Gobind Sagar reservoir), Hirakud Dam on Mahanadi (longest earthen dam), Tehri Dam on Bhagirathi (highest dam), Sardar Sarovar Dam on Narmada, Damodar Valley Corporation (DVC model of US Tennessee Valley Authority: Tilaiya, Maithon, Panchet, Konar), Nagarjuna Sagar and Srisailam on Krishna; Irrigation systems: Canal irrigation (dominant in northern alluvial plains: Indira Gandhi Canal / Rajasthan Canal bringing Sutlej-Beas waters to Thar desert, Western Yamuna Canal), Tubewell and well irrigation (over 60% irrigated area, leading to groundwater overdraft, dark blocks in Punjab, Haryana, Western UP), and Tank irrigation (traditional method in rocky, undulating Peninsular India, Eri tanks in Tamil Nadu); Micro-irrigation infrastructure (drip and sprinkler systems under Pradhan Mantri Krishi Sinchayee Yojana - Per Drop More Crop).
  *Key Concepts & Entities*: Multipurpose River Valley Projects • Bhakra Nangal & Tehri Dams • Hirakud & Sardar Sarovar Dams • Damodar Valley Corporation (DVC) • Indira Gandhi Canal (Rajasthan) • Tubewell vs Traditional Tank Irrigation • PMKSY (Per Drop More Crop)

### Location Factors of Primary, Secondary & Tertiary Industries (Raw Material, Power, Labour, Market, Transport; Iron & Steel, Cotton Textile, Petrochemical, Pharmaceutical, IT Industries)

- **Industrial Location Theories: Weberian Least Cost & Locational Factors** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Theoretical models and economic geography of industrial siting: Alfred Weber's Theory of Industrial Location / Least Cost Theory (Material Index = weight of localized raw material / weight of finished product; Gross / Weight-losing raw materials MI > 1 pulling industry to raw material source; Pure raw materials MI = 1 locating anywhere; Ubiquitous raw materials like air/water pulling towards market; Concept of Isotims lines of equal transport cost and Isodapanes lines of equal total transport costs, Critical Isodapane; Labour orientation and agglomeration economies); August Lösch's Profit Maximization Theory and Walter Christaller's Central Place Theory; Primary locational factors: Raw material proximity, energy/power availability, skilled/unskilled labour, transport networks, capital access, government industrial zoning, environmental clearances, and port proximity for export-oriented manufacturing.
  *Key Concepts & Entities*: Alfred Weber Least Cost Theory • Material Index (Weight-Losing vs Pure) • Isotims & Isodapanes (Critical Isodapane) • Agglomeration Economies • August Lösch Profit Maximization • Primary Industrial Locational Factors

- **Heavy Metallurgical & Engineering Clusters: Iron, Steel & Automobile** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Locational dynamics of heavy resource-based industries: Iron & Steel Industry (weight-losing industry requiring iron ore, coking coal, limestone, dolomite, manganese; Historical locational shifts: Coalfields orientation to Iron ore fields orientation, and modern shift towards coastal locations for cheap seaborne coking coal imports and exports); Major Indian steel plants: TISCO Jamshedpur (pioneer private sector, confluence of Subarnarekha and Kharkai), IISCO Burnpur, Public sector SAIL plants: Bhilai (Chhattisgarh, Russian collaboration, Bailadila/Dalli-Rajhara ore), Rourkela (Odisha, German collaboration), Durgapur (West Bengal, British collaboration), Bokaro (Jharkhand), Visakhapatnam Steel Plant / RINL (India's first shore-based integrated steel plant), Salem Steel Plant in Tamil Nadu, and JSW Vijayanagar in Karnataka; Global steel belts: Rust Belt in USA (Pittsburgh 'Steel City'), Ruhr Valley in Germany, Anshan-Benxi and Wuhan in China; Automobile Industry (agglomeration economies, supply chain hubs: Delhi-NCR Gurgaon-Manesar, Chennai 'Detroit of Asia', Pune-Chakan-Pimpri belt, Sanand in Gujarat).
  *Key Concepts & Entities*: Iron & Steel Locational Shifts • TISCO Jamshedpur & Bokaro Steel • SAIL Plants (Bhilai, Rourkela, Durgapur) • Visakhapatnam Shore-Based Steel Plant • American Rust Belt & German Ruhr Valley • Automobile Hubs (Chennai, Pune, Gurgaon)

- **Textile, Chemical & Agro-Processing Industries: Cotton, Sugar & Jute** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Locational shifts and clustering of consumer and agro-based industries: Cotton Textile Industry (pure raw material, historically located in Mumbai and Ahmedabad due to humid maritime climate preventing yarn breakage, port facilities, and black soil hinterland; subsequent spatial decentralization to handloom/powerloom hubs in Coimbatore 'Manchester of South India', Tirupur knitwear capital, Surat synthetic textiles, Ludhiana woolen knitwear); Jute Industry (highly localized in Hooghly river basin West Bengal due to proximity to raw jute cultivation in Ganga-Brahmaputra delta, abundant fresh water for retting, cheap labour from Bihar/Odisha, and Kolkata port); Sugar Industry (weight-losing, perishable raw material crushed within 24 hours of harvest; major locational shift from Northern India UP/Bihar to Southern and Western India Maharashtra/Karnataka/Tamil Nadu driven by tropical maritime climate, longer crushing season, higher sucrose content in cane, and thriving cooperative sugar mill structure); Chemical and Petrochemical complexes (concentrated near refineries and ports: Jamnagar refinery complex, Dahej PCPIR in Gujarat, Nagothane in Maharashtra).
  *Key Concepts & Entities*: Cotton Textile (Mumbai to Coimbatore & Tirupur) • Jute Retting & Hooghly River Basin • Sugar Industry Shift (North to Maharashtra) • Tropical vs Subtropical Cane Sucrose Content • Petrochemical Hubs (Jamnagar & Dahej PCPIR) • Agro-Processing Cooperatives

- **Footloose, Knowledge-Based & High-Tech IT Corridors** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Post-industrial economic geography and service clustering: Footloose Industries (industries with no specific raw material or market weight bias, negligible transport costs relative to value, highly dependent on component interchangeability, precision engineering, electronics assembly); Information Technology (IT) and Software Services (agglomeration driven by human capital, educational ecosystems, telecommunications infrastructure, venture capital, and airport connectivity; Major Indian IT corridors: Bengaluru 'Silicon Valley of India', Hyderabad 'Cyberabad', Pune Hinjawadi, Chennai OMR corridor, Delhi-NCR Gurgaon/Noida; Global tech clusters: Silicon Valley California, Route 128 Boston, Shenzhen hardware capital); Global Capability Centers (GCCs), semiconductor fabrication geography, and biotechnology hubs (Genome Valley Hyderabad).
  *Key Concepts & Entities*: Footloose Industry Concept • IT Corridors (Bengaluru, Hyderabad, Pune) • Silicon Valley & Global Tech Hubs • Semiconductor Fabrication Geography • Global Capability Centers (GCCs) • Biotechnology Parks (Genome Valley)

### Agricultural Geography, Cropping Patterns & Food Security

- **Cropping Patterns & Geographic Belts of Food & Commercial Crops** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Geographical distribution, climatic thresholds, and agrarian zoning of major crops: Major cropping seasons: Kharif (monsoon sowings June-July: Rice, Maize, Jowar, Bajra, Cotton, Jute, Groundnut), Rabi (winter sowings October-November: Wheat, Barley, Gram, Mustard), and Zaid (summer inter-cropping: watermelons, cucumbers, vegetables); Food grain geography: Rice (staple crop requiring >100 cm rainfall, high temperature >25 deg C, alluvial clayey soils; West Bengal, UP, Punjab, coastal deltas), Wheat (temperate crop requiring cool growing season 10-15 deg C, bright sunshine at harvest, 50-75 cm rainfall, well-drained loams; Punjab, Haryana, UP, MP), Millets / Nutri-Cereals (hardy, drought-resistant C4 crops: Jowar in Maharashtra/Karnataka, Bajra in Rajasthan, Ragi in Karnataka); Pulses (leguminous nitrogen-fixing crops, MP, Rajasthan, Maharashtra); Commercial crops: Sugarcane (tropical/subtropical, 100-150 cm rainfall; UP, Maharashtra, Karnataka), Cotton (black regur soil, 210 frost-free days, Gujarat, Maharashtra, Telangana), Jute (golden fiber, warm humid deltaic climate; West Bengal, Assam, Bihar), Tea (plantation crop requiring acidic highland slopes, 150-250 cm rainfall, shade trees; Assam Brahmaputra valley, Darjeeling, Nilgiris), Coffee (plantation crop requiring well-drained volcanic/humus soils, 150-200 cm rain; Karnataka 70% national output with Arabica and Robusta in Kodagu/Chikkamagaluru, Wayanad Kerala).
  *Key Concepts & Entities*: Kharif, Rabi & Zaid Seasons • Rice & Wheat Agro-Climatic Requirements • Millets / Nutri-Cereals (Jowar, Bajra, Ragi) • Cotton Belt (Black Regur Soil & 210 Frost-Free Days) • Sugarcane Production Belts • Tea (Assam & Darjeeling) & Coffee (Karnataka) • Pulses & Nitrogen Fixation

- **Agricultural Revolutions, Land Reforms & Food Security Architecture** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Technological transformations, institutional reforms, and food management: Agricultural revolutions: Green Revolution (launched in mid-1960s with High Yielding Variety / HYV semi-dwarf seeds developed by Norman Borlaug & M.S. Swaminathan, intensive chemical fertilizers, canal/tubewell irrigation; initial focus on wheat and rice in Punjab, Haryana, and Western UP; ecological fallouts: groundwater depletion, soil salinization, nitrate pollution, regional disparities; Rainbow Revolution concept), White Revolution / Operation Flood (Dr. Verghese Kurien, National Dairy Development Board, Anand cooperative model AMUL, dairy self-sufficiency), Blue Revolution (fisheries and aquaculture), Yellow Revolution (oilseeds), Silver Revolution (poultry); Institutional Land Reforms: Abolition of intermediaries (Zamindari abolition), tenancy reforms (security of tenure, fair rent), land ceiling acts and redistribution of surplus land, consolidation of fragmented land holdings; Food security architecture: Minimum Support Price (MSP recommended by CACP based on A2+FL/C2 cost metrics), Food Corporation of India (FCI buffer stocking), Public Distribution System (Targeted PDS / One Nation One Ration Card), and National Food Security Act 2013 (NFSA: legal entitlement covering 75% rural and 50% urban population, Antyodaya Anna Yojana).
  *Key Concepts & Entities*: Green Revolution (Swaminathan & Borlaug) • HYV Seeds & Ecological Side Effects • White Revolution / Operation Flood (AMUL) • Blue, Yellow & Rainbow Revolutions • Land Reforms (Zamindari Abolition & Ceilings) • MSP & Commission for Agricultural Costs and Prices (CACP) • Public Distribution System (PDS) & NFSA 2013

Geography of the World `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]`

### Regional Geography of United States: Physiography, Agricultural & Industrial Belts

- **United States: Physiographic Provinces, River Basins & Great Lakes** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Major morphological provinces of the continental United States: Atlantic & Gulf Coastal Plains (broad lowlands, barrier islands, Everglades subtropical wetland); Appalachian Highlands (ancient, folded and eroded mountains: Blue Ridge, Great Valley, Allegheny and Cumberland Plateaus); Interior Plains / Great Plains (vast semi-arid grassland plateau stretching from the 100th meridian west to the Rocky Mountains, drained by Missouri and Arkansas rivers); Rocky Mountains (young fold cordillera, Continental Divide / Great Divide separating Pacific and Atlantic drainages, Mt. Elbert 4,401m); Intermontane Plateaus (Colorado Plateau with Grand Canyon carved by Colorado River, Columbia-Snake basalt plateau, Great Basin region of endorheic inland drainage including Great Salt Lake and Death Valley - lowest point in North America -86m); Pacific Mountain System (Cascade Range with volcanic peaks Mt. Rainier and Mt. St. Helens, Sierra Nevada fault-block range with Mt. Whitney, Central Valley of California, and San Andreas transform fault zone); Major drainage networks: Mississippi-Missouri river system (longest river network in North America, bird-foot delta on Gulf of Mexico), Ohio River, Colorado River (Hoover Dam & Lake Mead), Columbia River (Grand Coulee Dam), Rio Grande (international border with Mexico); Great Lakes System (Superior largest freshwater lake, Michigan entirely within US, Huron, Erie, Ontario, interconnected by St. Mary's River, Detroit River, and Niagara Falls with Welland Canal).
  *Key Concepts & Entities*: Appalachian Highlands • Great Plains & 100th Meridian • Rocky Mountains & Continental Divide • Colorado Plateau & Grand Canyon • Great Basin & Death Valley (-86m) • Mississippi-Missouri Drainage System • Great Lakes (Superior, Michigan, Huron, Erie, Ontario) • San Andreas Fault Zone

- **United States: Agricultural Belts, Manufacturing Belts & Tech Complexes** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Spatial specialization of American agricultural and industrial economies: Agricultural Belts: Corn Belt (Midwest states: Iowa, Illinois, Indiana, Nebraska; rich Mollisol soils, feed grains and livestock fattening), Wheat Belt (divided into Spring Wheat Belt in North Dakota/Montana and Winter Wheat Belt in Kansas/Oklahoma), Dairy Belt (northern states around Great Lakes: Wisconsin, Minnesota, New York), Cotton Belt (historical South, now diversified into poultry and soybeans), Fruit and Vegetable Belts (California Central Valley Mediterranean irrigation farming, Florida citrus); Industrial complexes: American Manufacturing Belt / Rust Belt (historical industrial heartland from New England through Pittsburgh, Cleveland, Detroit to Chicago; Pittsburgh iron and steel hub, Detroit automotive capital, Chicago meatpacking and transport crossroads; deindustrialization and restructuring); Modern Sun Belt and High-Tech growth corridors: Silicon Valley in California (San Jose, Palo Alto, Cupertino - global epicenter of software, venture capital, and semiconductors), Texas Silicon Hills (Austin tech cluster) and Gulf Coast Petrochemical Belt (Houston oil refining and aerospace), Pacific Northwest (Seattle aerospace Boeing and software Microsoft/Amazon), Research Triangle in North Carolina (Raleigh-Durham-Chapel Hill).
  *Key Concepts & Entities*: Corn Belt (Midwest Mollisols) • Wheat Belt (Spring & Winter Wheat) • Dairy Belt (Wisconsin & Great Lakes) • American Manufacturing Belt (Rust Belt) • Silicon Valley (San Jose & Bay Area) • Texas Silicon Hills (Austin) & Houston Petrochemicals • Pacific Northwest (Seattle Tech & Aerospace)

### Regional Geography of Canada: Canadian Shield, Prairies & Energy Wealth

- **Canada: Canadian Shield, Glacial Drainage & Arctic Tundra** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Physical architecture and northern environments of Canada: Canadian Shield / Laurentian Plateau (vast U-shaped region of exposed pre-Cambrian crystalline igneous and metamorphic rocks covering over half of Canada, heavily scoured by Pleistocene continental ice sheets; thousands of glacial lakes: Great Bear Lake, Great Slave Lake deepest in North America, Lake Athabasca, Reindeer Lake, Lake Winnipeg); St. Lawrence Lowlands and River (vital commercial waterway linking Great Lakes to the Atlantic Ocean via the St. Lawrence Seaway); Appalachian Region of the Maritime Provinces (Nova Scotia, New Brunswick, Newfoundland); Western Canadian Cordillera (Canadian Rockies, Coast Mountains, Mount Logan 5,959m highest peak in Canada located in Yukon); Arctic Archipelago and Tundra biome (permafrost, muskeg bogs, pingos, Beaufort Sea, Northwest Passage maritime route through high-latitude ice).
  *Key Concepts & Entities*: Canadian Shield (Laurentian Plateau) • Glacial Lakes (Great Bear & Great Slave Lakes) • St. Lawrence Seaway Maritime Corridor • Canadian Cordillera & Mount Logan • Arctic Archipelago & Permafrost Tundra • Northwest Passage Arctic Route

- **Canada: Prairie Grain Belts, Tar Sands & Mineral Resources** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Economic geography, agricultural production, and resource distribution of Canada: Prairie Provinces (Alberta, Saskatchewan, Manitoba: vast expanse of fertile Chernozem / black soils; leading global producer and exporter of spring wheat, canola, barley; Winnipeg known as the 'Gateway to the West' and grain exchange capital); Mineral and energy resources: Athabasca Oil Sands in northern Alberta (world's third-largest proven petroleum reserves in the form of bitumen); Conventional oil and natural gas in Western Canada Sedimentary Basin; Nickel and copper deposits at Sudbury Basin in Ontario (formed by ancient meteorite impact); Uranium deposits in Athabasca Basin (Saskatchewan leading global exporter); Potash reserves in Saskatchewan (world's largest producer and exporter for fertilizers); Diamond mines in Northwest Territories; Forestry and paper pulp industry across the extensive Boreal Taiga forest belt; Hydroelectric power generation (James Bay Project in Quebec, Churchill Falls in Labrador).
  *Key Concepts & Entities*: Canadian Prairies (Alberta, Saskatchewan, Manitoba) • Chernozem Soils & Spring Wheat Export • Athabasca Oil Sands (Bitumen Deposits) • Sudbury Nickel Basin (Meteorite Impact) • Saskatchewan Potash & Uranium Reserves • Boreal Forest Paper Pulp & James Bay Hydro

### Regional Geography of Russia & Central Asia: Siberia, Steppes & Hydrocarbon Basins

- **Russia: Physical Divides, Siberian Drainage & Lake Baikal** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Continental physiography of the Russian Federation across 11 time zones: European Russia: East European / Russian Plain (undulating lowlands, Valdai Hills source of major rivers, Moscow basin); Ural Mountains (ancient north-south trending Hercynian fold mountain chain serving as the traditional geographic boundary between Europe and Asia); Asian Russia / Siberia: West Siberian Plain (world's largest continuous flat alluvial plain, drained by the Ob-Irtysh system, characterized by extensive peat bogs and swamps like Vasyugan Swamp), Central Siberian Plateau (elevated plateau between Yenisey and Lena rivers underlain by Siberian Traps volcanic basalt), and East Siberian Highlands (Verkhoyansk and Chersky ranges, Oymyakon pole of cold in northern hemisphere); Kamchatka Peninsula (active volcanism on Pacific Ring of Fire, Klyuchevskaya Sopka); Major river networks draining north into the Arctic Ocean: Ob River (with Irtysh), Yenisey River, and Lena River; Volga River (longest river in Europe 3,530 km, 'Mother Volga', draining into landlocked Caspian Sea); Lake Baikal in southern Siberia (world's oldest and deepest freshwater lake 1,642m, holds 20% of Earth's unfrozen surface freshwater, UNESCO site).
  *Key Concepts & Entities*: Ural Mountains (Europe-Asia Divide) • East European Plain & Volga River • West Siberian Plain & Vasyugan Swamps • Central Siberian Plateau & Siberian Traps • North-Draining Siberian Rivers (Ob, Yenisey, Lena) • Lake Baikal (Deepest Freshwater Lake 1,642m) • Kamchatka Volcanic Peninsula & Oymyakon

- **Central Asia: Steppes, Tian Shan-Pamirs & Caspian Energy Basins** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Geographical and resource profile of the five Central Asian republics (Kazakhstan, Uzbekistan, Turkmenistan, Kyrgyzstan, Tajikistan): Physical relief: Kazakh Steppe (vast open grassland extending across northern Kazakhstan); Tian Shan and Pamir mountain ranges ('Roof of the World', Ismail Samani peak, Fedchenko Glacier); Deserts: Kyzylkum Desert (Uzbekistan and Kazakhstan) and Karakum Desert (Turkmenistan); Drainage and environmental tragedy: Amu Darya and Syr Darya rivers originating in glaciers and historically feeding the Aral Sea (now largely desiccated due to Soviet cotton irrigation diversions); Fergana Valley (densely populated, fertile agricultural heartland shared across complex enclaves of Uzbekistan, Kyrgyzstan, and Tajikistan); Mineral and energy wealth: Caspian Sea Basin hydrocarbons (Tengiz, Kashagan, and Karachaganak fields in Kazakhstan, Galkynysh giant gas field in Turkmenistan); Uranium reserves of Kazakhstan (world's leading producer ~43% global output); Cotton agriculture and Baikonur Cosmodrome.
  *Key Concepts & Entities*: Kazakh Steppe & Aral Sea Desiccation • Pamir Knot & Tian Shan Ranges • Amu Darya & Syr Darya Rivers • Fergana Valley Agricultural Oasis • Kaspian Hydrocarbon Basins (Tengiz & Kashagan) • Turkmenistan Galkynysh Gas Field • Kazakhstan Uranium Reserves

### Regional Geography of China & East Asia: Relief, River Basins & Industrial Clusters

- **China: Three Topographic Steps, Major River Basins & Deserts** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Three-step topographical staircase of China descending from west to east: Step 1: Qinghai-Tibet Plateau ('Roof of the World', average elevation >4,500m, source of Asia's major rivers / 'Water Tower of Asia', bounded by Himalayas, Kunlun, and Qilian mountains); Step 2: Intermediate plateaus and basins (elevation 1,000-2,000m: Tarim Basin with hyper-arid Taklamakan Desert and Lop Nur nuclear test site, Junggar Basin, Inner Mongolian Plateau, Loess Plateau with thick wind-blown silt deposits, and Sichuan Red Basin / fertile purple-earth basin); Step 3: Low-lying coastal plains and hills (elevation <500m: Northeast / Manchurian Plain, North China Plain, Middle-Lower Yangtze Plain); Major River Systems: Yangtze River / Chang Jiang (longest river in Asia 6,300 km, Three Gorges Dam, flows through Sichuan basin and Shanghai delta), Yellow River / Huang He (second longest 5,464 km, carries world's highest sediment load from Loess Plateau, historically prone to catastrophic floods / 'China's Sorrow', delta on Bohai Sea), Xi Jiang / Pearl River (southern commercial artery), and Heilongjiang / Amur River (border with Russia).
  *Key Concepts & Entities*: Three-Step Topographical Staircase • Qinghai-Tibet Plateau ('Water Tower of Asia') • Tarim Basin & Taklamakan Desert • Loess Plateau Silt Deposits • Sichuan Red Basin (Purple Earth) • Yangtze River (Chang Jiang) & Three Gorges Dam • Yellow River (Huang He) & Bohai Delta

- **China: Agricultural Zones, Coastal SEZs & Rare Earth Belts** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Agrarian divisions, rapid coastal industrialization, and resource clusters of China: Agricultural geography: Qinling Mountains-Huai River line dividing China into two distinct agricultural zones: Northern Dry Farming Zone (wheat, corn, millets, soybeans in North China and Manchurian Plains) vs Southern Wet Paddy Rice Zone (double-cropped paddy rice, tea, freshwater aquaculture in Yangtze basin and South China); Special Economic Zones (SEZs) and industrial clusters: Pearl River Delta / Greater Bay Area (Shenzhen, Guangzhou, Dongguan, Hong Kong - world's hardware and electronics manufacturing hub), Yangtze River Delta (Shanghai, Suzhou, Hangzhou, Ningbo - finance, high-tech, automotive, chemicals), and Bohai Bay Economic Rim (Beijing, Tianjin, Hebei / Jing-Jin-Ji cluster); Energy and mineral centers: Coal belts of Shanxi and Inner Mongolia, Daqing oilfield in Heilongjiang, and Bayan Obo mine in Inner Mongolia (world's largest deposit of Rare Earth Elements / REEs).
  *Key Concepts & Entities*: Qinling-Huai River Line (Wheat vs Rice Divide) • Pearl River Delta SEZ (Greater Bay Area) • Yangtze River Delta Industrial Belt • Bohai Economic Rim (Jing-Jin-Ji) • Shanxi Coalfields & Daqing Oilfield • Bayan Obo Rare Earth Elements (REEs)

### Regional Geography of Japan: Archipelago Tectonics & Tokaido Industrial Megalopolis

- **Japan: Archipelago Physiography, Ring of Fire & Tectonic Hazards** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Insular physical geography and tectonic dynamics of the Japanese archipelago: Four main islands stretching in an arc from northeast to southwest: Hokkaido (northernmost, cold temperate climate, Sapporo plain), Honshu (largest and most populous island, containing Tokyo, Kyoto, Osaka, and the high Japanese Alps / Hida, Kiso, and Akaishi ranges), Shikoku (smallest main island, citrus and maritime farming), and Kyushu (southernmost, subtropical climate, active volcanism); Tectonic setting: Located at the complex convergence zone of four tectonic plates (Pacific, Philippine Sea, Eurasian, and North American / Okhotsk plates); Pacific Ring of Fire volcanism: Over 100 active volcanoes including Mount Fuji (composite stratovolcano, 3,776m highest peak in Japan, dormant since 1707); High seismic vulnerability: Frequent megathrust earthquakes and devastating tsunamis (Great Kanto Earthquake 1923, Great Hanshin-Awake Earthquake 1995, 2011 Tohoku megathrust earthquake and tsunami triggering Fukushima Daiichi disaster); Limited flat land: Over 73% mountainous terrain, confining urban populations to narrow coastal alluvial plains such as Kanto Plain (largest plain in Honshu surrounding Tokyo), Nobi Plain (Nagoya), and Kansai Plain (Osaka-Kobe).
  *Key Concepts & Entities*: Four Main Japanese Islands (Honshu, Hokkaido, Kyushu, Shikoku) • Japanese Alps (Hida, Kiso, Akaishi) • Mount Fuji (3,776m Composite Volcano) • Four-Plate Tectonic Convergence • 2011 Tohoku Earthquake & Megathrust Tsunami • Kanto Plain & Tokyo Alluvial Basin • Ring of Fire Active Volcanism

- **Japan: Tokaido Megalopolis, Manufacturing Prowess & Fisheries** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Industrial structure, export-led manufacturing, and marine economic geography of Japan: Resource scarcity: Acute deficiency in indigenous fossil fuels (imports 99% petroleum and coal) and metallic ores, compelling the development of highly efficient port-based import-refine-export industrial models; Pacific Coast Industrial Belt / Tokaido Megalopolis (continuous urban-industrial corridor along the southern Pacific coast of Honshu home to over 60% of Japan's population and industrial output): Keihin Industrial Region (Tokyo-Yokohama-Kawasaki: precision machinery, electronics, publishing, optics), Chukyo Industrial Region (Nagoya-Toyota City: world's leading automotive manufacturing hub / Toyota headquarters, aviation, ceramics), Hanshin Industrial Region (Osaka-Kobe-Kyoto: heavy steel, shipbuilding, chemicals, electronics), and Kitakyushu-Setouchi Region (northern Kyushu and Inland Sea: heavy metallurgy, chemicals, semiconductors); Marine economy: One of the world's premier fishing and aquaculture nations, greatly favored by the convergence of the warm northward-flowing Kuroshio Current and cold nutrient-rich southward-flowing Oyashio Current in the northwest Pacific, generating exceptionally fertile pelagic fishing grounds.
  *Key Concepts & Entities*: Tokaido Megalopolis Industrial Corridor • Keihin Region (Tokyo-Yokohama Precision Engineering) • Chukyo Region (Nagoya & Toyota City Automotive) • Hanshin Region (Osaka-Kobe Metallurgy) • Import-Dependent Port-Based Manufacturing • Kuroshio-Oyashio Convergence Marine Fisheries

### Regional Geography of South Asia: Subcontinent Relief, Drainage & Climate Vulnerability

- **South Asia: Subcontinental Morphology, Drainage Networks & Deserts** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Unified geomorphic and hydrological entity of the South Asian realm: Terrestrial borders and countries: Bounded by the towering Himalayas in the north, Karakoram and Hindu Kush in the northwest, Arakan Yoma in the east, and the vast expanse of the Indian Ocean in the south; Comprises 8 nations: India, Pakistan, Bangladesh, Nepal, Bhutan, Sri Lanka, Maldives, and Afghanistan; Major physiographic divisions: Himalayan mountain wall, Indo-Gangetic-Brahmaputra alluvial plains, Thar / Great Indian Desert (extending into Sindh and Punjab as Cholistan), Balochistan Plateau (arid intermontane basins and Chagai Hills), Potwar Plateau and Salt Range in Pakistan; Major drainage networks: Indus River Basin (draining northwest into Arabian Sea via Kotri delta), Ganga-Brahmaputra-Meghna Basin (draining southeast into Bay of Bengal through the world's largest delta / Sundarbans mangrove swamp); Island nations: Sri Lanka (Central Highlands with Mount Pidurutalagala, Mahaweli Ganga river, Jaffna peninsula connected via Elephant Pass) and Maldives (low-lying coral atoll chain with 26 natural atolls resting on the Chagos-Laccadive submarine ridge).
  *Key Concepts & Entities*: Himalayan-Hindu Kush Mountain Arc • Indo-Gangetic-Brahmaputra Alluvial Realm • Thar Desert & Cholistan Dunes • Potwar Plateau & Salt Range • Ganga-Brahmaputra-Meghna Sundarbans Delta • Sri Lanka Central Highlands & Mahaweli Ganga • Maldives Coral Atoll Chain

- **South Asia: Monsoon Agriculture, Water Treaties & Natural Disasters** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Climatic rhythms, agrarian dependencies, transboundary hydrology, and disaster vulnerabilities across South Asia: Climatic dominance: Governed by the seasonal reversal of the South Asian Monsoon system, ranging from super-humid rainforest environments in Bangladesh and Western Ghats to hyper-arid conditions in Balochistan and Thar; Agricultural specialization: Jute and wet rice cultivation in the fertile floodplains of Bangladesh, intensive wheat and cotton farming in the irrigated Indus basin of Pakistani Punjab and Sindh, tea plantations on the highland slopes of Sri Lanka (Ceylon tea) and Nepal; Transboundary water governance: Indus Waters Treaty 1960 between India and Pakistan (allocating eastern rivers Ravi, Beas, Sutlej to India and western rivers Indus, Jhelum, Chenab to Pakistan), Ganga Water Sharing Treaty 1996 between India and Bangladesh (Farakka Barrage water allocations); Severe environmental vulnerabilities: Glacial Lake Outburst Floods (GLOFs) in Nepal and Bhutan, seismic hazards along the Himalayan collision boundary (2015 Gorkha Nepal earthquake), catastrophic tropical cyclones striking the shallow Bay of Bengal coast (Bangladesh and Odisha), and existential sea level rise threats confronting the low-lying Maldives and Bengal delta.
  *Key Concepts & Entities*: South Asian Monsoon Agricultural Rhythm • Indus Waters Treaty 1960 (India-Pakistan) • Ganga Water Sharing Treaty (Farakka Barrage) • Ceylon Tea & Bengal Jute Agriculture • Glacial Lake Outburst Floods (GLOFs) • Himalayan Seismicity & 2015 Nepal Earthquake • Bay of Bengal Tropical Cyclones & Maldives Sea Rise

### Regional Geography of South-East Asia: Mainland River Systems & Insular Archipelagos

- **Mainland Southeast Asia: Indochina River Basins & Deltas** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Geographical profile of mainland Indochina: Five sovereign nations: Myanmar (Burma), Thailand, Laos (only landlocked country in SE Asia), Cambodia, and Vietnam; Morphological structure: North-to-south trending parallel mountain ranges (Arakan Yoma, Shan Plateau, Bilauktaung Range, and Annamite Range / Cordillera separating Vietnam from Laos) alternating with deep river valleys and broad alluvial floodplains; Major southward-flowing river systems: Mekong River (longest in SE Asia 4,350 km, 'Lancang' in Tibet, flows through 6 countries forming borders between Laos, Myanmar, and Thailand, crossing Cambodia and discharging through a vast 9-mouthed delta in southern Vietnam), Irrawaddy River (vital commercial lifeline of Myanmar flowing into Andaman Sea via vast delta) and its tributary Chindwin, Salween River (draining deep gorges across Shan Plateau), Chao Phraya River (Thailand's sacred river, irrigating the fertile central plain rice bowl before flowing through Bangkok into Gulf of Thailand), and Red River / Song Hong (northern Vietnam draining into Gulf of Tonkin); Tonle Sap Lake in Cambodia (largest freshwater lake in SE Asia, unique hydrological feature with seasonal flow reversal from Mekong during summer monsoon expansion).
  *Key Concepts & Entities*: Mekong River Basin & Nine-Mouthed Delta • Irrawaddy & Salween Rivers (Myanmar) • Chao Phraya River & Bangkok Plain • Red River Delta (Vietnam) • Tonle Sap Lake (Seasonal Flow Reversal) • Annamite Range & Shan Plateau • Laos Landlocked Geography

- **Maritime Southeast Asia: Archipelagos, Ring of Fire & Resources** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Insular physical and economic geography of maritime Southeast Asia: Sovereign archipelago nations: Indonesia (world's largest island country with >17,000 islands: Sumatra, Java - world's most populous island with extremely fertile volcanic soils, Kalimantan / Indonesian Borneo, Sulawesi / Celebes, Maluku Spice Islands, and Western New Guinea / Papua), Philippines (over 7,100 islands: Luzon in north, Mindanao in south, Visayas in center), Malaysia (Peninsular Malaysia and East Malaysia / Sabah and Sarawak on northern Borneo), Singapore (island city-state at southern tip of Malay Peninsula), Brunei, and Timor-Leste; Tectonic framework: Sunda Shelf (continental extension linking mainland to Sumatra, Java, and Borneo) and Sahul Shelf (Australian continental extension); Intense Ring of Fire volcanism: Over 130 active volcanoes in Indonesia (Krakatoa / Krakatau, Mount Merapi near Yogyakarta, Mount Bromo, Mount Tambora 1815 super-eruption) and Philippines (Mount Pinatubo 1991 eruption, Mount Mayon perfect cone, Taal volcano); Economic resource wealth: Palm oil (Indonesia and Malaysia produce over 85% global supply), natural rubber, tin mining (Bangka-Belitung islands in Indonesia), petroleum and liquefied natural gas (LNG in Brunei, Natuna Sea, East Kalimantan), copper and gold (Grasberg mine in Papua - one of the world's largest open-pit gold and copper mines).
  *Key Concepts & Entities*: Indonesian Archipelago (>17,000 Islands) • Java Volcanic Fertility & Sumatra • Philippines Archipelago (Luzon & Mindanao) • Sunda Shelf vs Sahul Shelf • Volcanism (Krakatoa, Merapi, Tambora, Pinatubo) • Palm Oil & Rubber Global Hegemony • Grasberg Copper-Gold Mine (Papua)

### Regional Geography of New Zealand: Southern Alps, Volcanic Zones & Pastoral Economy

- **New Zealand: Southern Alps, Fiordland & Taupo Volcanic Zone** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Physiographic contrast between the two main islands separated by the narrow Cook Strait: South Island / Te Waipounamu (larger, dominated by the formidable Southern Alps fold mountain range running along the western spine for 500 km; Mount Cook / Aoraki 3,724m highest peak; extensive Alpine Fault plate boundary between Pacific and Australian plates; heavy Pleistocene and active glaciation: Tasman Glacier, Franz Josef, and Fox Glaciers; glacial lakes like Lake Wakatipu and Lake Te Anau; spectacular glacial fiords in Fiordland National Park including Milford Sound and Doubtful Sound; broad Canterbury Plains on the eastern rain-shadow side formed by coalescing glacial outwash fans); North Island / Te Ika-a-Maui (characterized by active volcanism and thermal phenomena on the Taupo Volcanic Zone: Mount Ruapehu active stratovolcano, Mount Ngauruhoe, Mount Tongariro, Mount Taranaki / Egmont isolated volcanic cone; Lake Taupo world's largest rhyolitic super-volcanic caldera lake; extensive geothermal fields, geysers, and boiling mud pools of Rotorua; rolling pastoral hill country).
  *Key Concepts & Entities*: Cook Strait Separation • Southern Alps & Mount Cook (Aoraki 3,724m) • Alpine Fault Plate Boundary • Fiordland (Milford Sound & Doubtful Sound) • Canterbury Plains Alluvial Fans • Taupo Volcanic Zone & Lake Taupo Caldera • Rotorua Geothermal Geysers & Mud Pools

- **New Zealand: Marine Climate, Pastoral Dairy Economy & Geothermal Energy** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Temperate climate dynamics, pastoral agriculture, energy systems, and isolated biogeography: Climate regime: Marine West Coast temperate climate (Köppen Cfb) governed by prevailing moisture-laden Westerlies; dramatic orographic rainfall contrast (over 6,000 mm rain on the western slopes of the Southern Alps vs semi-arid rain-shadow <600 mm on the eastern Canterbury Plains); Pastoral economic dominance: World's premier exporter of dairy products (Fonterra cooperative handling ~95% of NZ export milk, highly efficient year-round pasture-based dairy farming without indoor barns); Extensive sheep farming on highland tussock grasslands for coarse wool and lamb meat; Viticulture and fruit horticulture (Marlborough Sauvignon Blanc wine region, Hawke's Bay, kiwifruit production in Bay of Plenty); Energy resources: Clean renewable energy profile with over 80% electricity from renewables (hydroelectric dams on Waikato and Clutha rivers, pioneer geothermal energy harnessing at Wairakei geothermal power station); Unique island biogeography: Prolonged evolutionary isolation since breaking away from Gondwana ~80 million years ago, resulting in distinct avifauna and absence of native land mammals (flightless Kiwi bird, Kakapo, Takahe, ancient Tuatara reptile).
  *Key Concepts & Entities*: Marine West Coast Climate (Köppen Cfb) • Orographic Westerlies & Canterbury Rain Shadow • Fonterra Dairy Cooperative Export Dominance • Pastoral Sheep Farming & Tussock Grasslands • Marlborough Viticulture & Kiwifruit • Wairakei Geothermal Power Station • Isolated Biogeography (Kiwi & Tuatara)

### Continental Geography: Europe, Africa, South America, Australia & Antarctica

- **Europe: Morphological Belts, Rhine-Danube Basins & Alpine Arc** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Continental structure of Europe across four major morphological belts: 1. Western Uplands (ancient eroded Caledonian crystalline massifs: Scandinavian Highlands with glacial fjords, Scottish Highlands, Massif Central); 2. North European Plain (unbroken lowland plain stretching from southwestern France across northern Germany, Poland, and into Russia, intensive agriculture and industrial settlements); 3. Central Uplands (heavily forested Hercynian plateaus: Ardennes, Black Forest / Schwarzwald, Vosges, Bohemian Massif); 4. Alpine Mountain System (young Tertiary fold mountain arcs: Alps with Mont Blanc 4,809m, Pyrenees separating France and Spain, Apennines of Italy, Carpathians, Balkans, and Caucasus with Mount Elbrus 5,642m highest peak in Europe); Major river arteries: Rhine River (vital commercial waterway flowing from Swiss Alps through German industrial core to Rotterdam port / Europoort on North Sea), Danube River (longest river in EU 2,850 km, flowing east through 10 countries and 4 national capitals Vienna, Bratislava, Budapest, Belgrade into Black Sea delta), and Po River (northern Italian industrial and agrarian basin / Lombardy plain).
  *Key Concepts & Entities*: North European Plain • Alpine Mountain Arc (Mont Blanc & Elbrus) • Rhine River & Rotterdam Europoort • Danube River Basin (10 Countries) • Po River & Lombardy Plain • Scandinavian Glacial Fjords • Black Forest (Schwarzwald)

- **Africa: Great Rift Valley, Congo Rainforest, Nile & Sahara** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Geomorphology and drainage of the African plateau continent: East African Great Rift Valley (continental divergent boundary stretching over 6,000 km from Jordan/Red Sea through Ethiopia, Kenya, Tanzania to Mozambique; Western and Eastern Rift branches; deep rift lakes: Lake Tanganyika world's longest freshwater lake and second deepest 1,470m, Lake Malawi / Nyasa; Lake Victoria shallow inland depression lake, Africa's largest; isolated volcanic peaks: Mount Kilimanjaro 5,895m highest peak in Africa, Mount Kenya); Vast drainage basins: Nile River (longest river on Earth 6,650 km, formed by confluence of White Nile from Lake Victoria and Blue Nile from Lake Tana in Ethiopia at Khartoum Sudan, Aswan High Dam, fertile Nile delta), Congo River Basin (world's deepest river >220m and second largest by discharge, cuts equator twice through equatorial rainforest / Selvas), and Niger River (inland delta in Mali); Deserts: Sahara Desert (largest hot desert in world, erg sand dunes, reg stony desert, hamada rock plateaus), Sahel semi-arid transition zone, Namib Desert (coastal hyper-arid desert under cold Benguela current), and Kalahari Basin (semi-desert red sand sheets); Victoria Falls on Zambezi River; Atlas Mountains in northwest and Drakensberg escarpment in south.
  *Key Concepts & Entities*: East African Great Rift Valley • Mount Kilimanjaro (5,895m) & Mount Kenya • Lake Tanganyika & Lake Victoria • Nile River Basin & Aswan Dam • Congo River Equatorial Basin • Sahara Desert & Sahel Transition Zone • Namib & Kalahari Deserts • Victoria Falls (Zambezi River)

- **South America: Andes Cordillera, Amazon Basin & Grassland Biomes** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Tripartite physical architecture and biomes of South America: 1. Western Cordillera / Andes Mountains (longest continental mountain range on Earth 7,000 km, formed by subduction of Nazca plate beneath South American plate; Mount Aconcagua 6,961m highest peak in the Western Hemisphere; Altiplano high-altitude plateau with Lake Titicaca world's highest navigable lake; Cotopaxi and Chimborazo volcanoes); 2. Eastern Crystalline Highlands (ancient Brazilian Shield and Guiana Highlands; Angel Falls in Venezuela highest waterfall in world 979m); 3. Central Lowland River Basins: Amazon Basin (world's largest drainage basin and highest discharge, drained by Amazon River and 1,100 tributaries, home to Amazon Rainforest / Amazonia 'lungs of the Earth' with unmatched biodiversity), Orinoco Basin, and Paraná-Paraguay-Río de la Plata system (Itaipu Dam); Distinctive biomes: Pampas (vast temperate grasslands of Argentina and Uruguay, fertile Mollisols, wheat and cattle estancias), Llanos (tropical savanna grasslands of Orinoco basin in Venezuela/Colombia), Campos and Cerrado (tropical savanna of central Brazil), Gran Chaco (dry scrub lowland), and Atacama Desert in northern Chile (driest non-polar desert on Earth created by rain-shadow of Andes and cold offshore Humboldt / Peru Current).
  *Key Concepts & Entities*: Andes Cordillera & Mount Aconcagua (6,961m) • Altiplano & Lake Titicaca • Amazon River Basin & Rainforest (Amazonia) • Angel Falls & Guiana Highlands • Pampas Temperate Grasslands (Argentina) • Llanos & Cerrado Tropical Savannas • Atacama Desert (Humboldt Current Aridity)

- **Australia, Oceania & Antarctica: Great Barrier Reef & Polar Ice Cap** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Physiography and environmental systems of Australia, Pacific Oceania, and Antarctica: Australia: Tripartite relief: Eastern Highlands / Great Dividing Range (Mount Kosciuszko 2,228m highest peak), Central Lowlands (endorheic drainage of Lake Eyre lowest point in Australia -15m, Great Artesian Basin largest artesian groundwater aquifer in world, Murray-Darling river system), and Western Plateau / Outback (ancient eroded shield, Great Victoria and Great Sandy Deserts, Uluru / Ayers Rock inselberg); Great Barrier Reef along Queensland coast (world's largest coral reef ecosystem, UNESCO World Heritage, stretching over 2,300 km); Oceania sub-regions: Melanesia (Papua New Guinea, Fiji, Solomon Islands), Micronesia (Guam, Marshall Islands, Palau), and Polynesia (Hawaii, Samoa, Tonga, Easter Island); Antarctica: Fifth-largest continent, 98% covered by the Antarctic Ice Sheet (averaging 1.9 km thickness, holds 70% of world's freshwater and 90% of Earth's ice); Transantarctic Mountains dividing East and West Antarctica; Vinson Massif (4,892m highest summit); Ross Ice Shelf and Ronne Ice Shelf; Coldest, windiest, and driest continent (polar desert); Antarctic Treaty System 1959 (preserving continent for peaceful scientific research); Indian Antarctic Research Stations: Dakshin Gangotri (1983 historical), Maitri (1989), and Bharati (2012 in Larsemann Hills).
  *Key Concepts & Entities*: Great Dividing Range & Mount Kosciuszko • Great Barrier Reef (2,300 km Coral System) • Murray-Darling Basin & Lake Eyre • Great Artesian Basin (Groundwater) • Melanesia, Micronesia & Polynesia Sub-Regions • Antarctic Ice Sheet & Vinson Massif • Antarctic Treaty & Indian Stations (Maitri, Bharati)

Geography of Karnataka `[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]`

### Physiography & Relief Divisions of Karnataka

- **Karavali / Coastal Plains** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Canara Coast stretching ~320 km between Karwar in North to Mangaluru in South; Narrow Coastal Strip bounded by Arabian Sea & Western Ghats; Estuaries, Spits & Lagoons; Major River Outlets - Netravati, Gurupura, Sharavathi, Gangavali, Aghanashini, Kali; Major Ports - New Mangalore Port / Only Major Port of Karnataka, Karwar Port, Malpe, Tadadi, Belekeri; St. Mary's Islands / Columnar Basaltic Lava Geo-Heritage Site
  *Key Concepts & Entities*: Canara Coast stretching ~320 km between Karwar in North to Mangaluru in South • Narrow Coastal Strip bounded by Arabian Sea & Western Ghats • Estuaries, Spits & Lagoons • Major River Outlets - Netravati, Gurupura, Sharavathi, Gangavali, Aghanashini, Kali • Major Ports - New Mangalore Port • Only Major Port of Karnataka, Karwar Port, Malpe, Tadadi, Belekeri • St. Mary's Islands • Columnar Basaltic Lava Geo-Heritage Site

- **Malnad / Western Ghats / Sahyadri Range** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Continuous Mountainous Escarpment; Average Elevation 900–1500m; Peak Formations - Mullayanagiri 1930m / Highest Peak in Karnataka in Chikmagalur / Baba Budangiri Range / Chandra Drona Parvatha; Kudremukh 1894m / Horse-face Peak; Pushpagiri / Kumara Parvatha 1712m in Kodagu-Dakshina Kannada border; Brahmagiri 1608m; Tadiandamol 1748m / Highest Peak of Kodagu; Agumbe Ghat; Major Mountain Passes / Ghats - Charmadi Ghat / Chikmagalur-Mangalore link, Shiradi Ghat / Hassan-Mangalore link, Sampaje Ghat / Kodagu-Mangalore link, Hulikal Ghat / Shimoga-Udupi link, Agumbe Ghat / Shimoga-Udupi link
  *Key Concepts & Entities*: Continuous Mountainous Escarpment • Average Elevation 900–1500m • Peak Formations - Mullayanagiri 1930m • Highest Peak in Karnataka in Chikmagalur • Baba Budangiri Range • Chandra Drona Parvatha • Kudremukh 1894m • Horse-face Peak • Pushpagiri • Kumara Parvatha 1712m in Kodagu-Dakshina Kannada border • Brahmagiri 1608m • Tadiandamol 1748m • Highest Peak of Kodagu • Agumbe Ghat • Major Mountain Passes • Ghats - Charmadi Ghat • Chikmagalur-Mangalore link, Shiradi Ghat • Hassan-Mangalore link, Sampaje Ghat • Kodagu-Mangalore link, Hulikal Ghat • Shimoga-Udupi link, Agumbe Ghat • Shimoga-Udupi link

- **Northern Maidan / Bayaluseeme** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Extensive Treeless Semi-Arid Plateau formed by Deccan Trap Lava Flows & Ancient Granites; Krishna, Bhima, Ghataprabha & Malaprabha River Plains; Black Cotton Soils / Regur; Residual Monadnocks & Flat-Topped Mesas; Drought-Prone Dry Landscape covering Belagavi, Bagalkote, Vijayapura, Kalaburagi, Yadgir, Raichur, Koppal, Gadag, Ballari & Vijayanagara districts; Kappatagudda Hill Range
  *Key Concepts & Entities*: Extensive Treeless Semi-Arid Plateau formed by Deccan Trap Lava Flows & Ancient Granites • Krishna, Bhima, Ghataprabha & Malaprabha River Plains • Black Cotton Soils • Regur • Residual Monadnocks & Flat-Topped Mesas • Drought-Prone Dry Landscape covering Belagavi, Bagalkote, Vijayapura, Kalaburagi, Yadgir, Raichur, Koppal, Gadag, Ballari & Vijayanagara districts • Kappatagudda Hill Range

- **Southern Maidan / Mysore Plateau** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Rolling Undulating Plateau between 600–900m Elevation; Archean Granites & Gneisses; Red Soils; Cauvery, Hemavati, Shimsha, Arkavathi & Palar-Pennar River Valleys; Distinct Residual Hill Clusters - Savandurga / Largest Monolithic Hill in Asia, Madhugiri / Second Largest Monolithic Fort in Asia, Shivagange, Nandi Hills / Chikkaballapur, Chamundi Hills / Mysuru, Biligirirangana Hills / BR Hills / Ecological Transition between Western & Eastern Ghats, Male Mahadeshwara Hills / MM Hills
  *Key Concepts & Entities*: Rolling Undulating Plateau between 600–900m Elevation • Archean Granites & Gneisses • Red Soils • Cauvery, Hemavati, Shimsha, Arkavathi & Palar-Pennar River Valleys • Distinct Residual Hill Clusters - Savandurga • Largest Monolithic Hill in Asia, Madhugiri • Second Largest Monolithic Fort in Asia, Shivagange, Nandi Hills • Chikkaballapur, Chamundi Hills • Mysuru, Biligirirangana Hills • BR Hills • Ecological Transition between Western & Eastern Ghats, Male Mahadeshwara Hills • MM Hills

### Drainage Systems & River Basins of Karnataka

- **East-Flowing River Systems (Major Drainage directed towards Bay of Bengal across Peninsular Gradient):** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Krishna River Basin** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Drains ~60% of State Area; Origin at Mahabaleshwar in Maharashtra; Enters Karnataka at Hipparagi; Major Tributaries in Karnataka: Bhima River / Origin Bhimashankar; Ghataprabha River / Gokak Falls; Malaprabha River / Origin Kanakumbi, Peacock Sanctuary at Bankapura; Tungabhadra River / Formed by Confluence of Tunga & Bhadra at Kudli near Shivamogga, Tributary Varada; Vedavati / Hagari River / Vani Vilasa Sagara / Mari Kanive Dam in Chitradurga / Oldest Dam in Karnataka 1907; Major Irrigation Projects: Upper Krishna Project / UKP - Almatti Dam / Lal Bahadur Shastri Reservoir & Narayanpur Dam / Basavasagara Reservoir; Tungabhadra Dam at Hosapete / Pampa Sagara
  *Key Concepts & Entities*: Drains ~60% of State Area • Origin at Mahabaleshwar in Maharashtra • Enters Karnataka at Hipparagi • Major Tributaries in Karnataka: Bhima River • Origin Bhimashankar • Ghataprabha River • Gokak Falls • Malaprabha River • Origin Kanakumbi, Peacock Sanctuary at Bankapura • Tungabhadra River • Formed by Confluence of Tunga & Bhadra at Kudli near Shivamogga, Tributary Varada • Vedavati • Hagari River • Vani Vilasa Sagara • Mari Kanive Dam in Chitradurga • Oldest Dam in Karnataka 1907 • Major Irrigation Projects: Upper Krishna Project • UKP - Almatti Dam • Lal Bahadur Shastri Reservoir & Narayanpur Dam • Basavasagara Reservoir • Tungabhadra Dam at Hosapete • Pampa Sagara

- **Cauvery / Kaveri River Basin** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Lifeline of Southern Karnataka; Origin at Talakaveri in Brahmagiri Hills of Kodagu District 1341m; Eastward Flow across Mysore Plateau; Major Left-Bank Tributaries: Harangi, Hemavati / Gorur Dam, Shimsha, Arkavathi; Major Right-Bank Tributaries: Lakshmana Tirtha, Kabini / Beechanahalli Dam, Suvarnavathi; Waterfalls & Gorges: Chunchanakatte Falls, Shivanasamudra Falls / Gaganachukki & Bharachukki / Asia's First Hydroelectric Power Project 1902, Mekedatu Gorge / Proposed Balancing Reservoir at Arkavathi Confluence; Major Reservoirs: Krishnaraja Sagara / KRS Dam at Kannambadi built under Sir M. Visvesvaraya; Inter-State Cauvery Water Dispute with Tamil Nadu
  *Key Concepts & Entities*: Lifeline of Southern Karnataka • Origin at Talakaveri in Brahmagiri Hills of Kodagu District 1341m • Eastward Flow across Mysore Plateau • Major Left-Bank Tributaries: Harangi, Hemavati • Gorur Dam, Shimsha, Arkavathi • Major Right-Bank Tributaries: Lakshmana Tirtha, Kabini • Beechanahalli Dam, Suvarnavathi • Waterfalls & Gorges: Chunchanakatte Falls, Shivanasamudra Falls • Gaganachukki & Bharachukki • Asia's First Hydroelectric Power Project 1902, Mekedatu Gorge • Proposed Balancing Reservoir at Arkavathi Confluence • Major Reservoirs: Krishnaraja Sagara • KRS Dam at Kannambadi built under Sir M. Visvesvaraya • Inter-State Cauvery Water Dispute with Tamil Nadu

- **Pennar & Palar River Basins** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Uttara Pinakini / North Pennar, Dakshina Pinakini / South Pennar & Palar Rivers originating in Nandi Hills / Chennakesava Hills of Chikkaballapur District, draining eastern arid plateau into Andhra Pradesh & Tamil Nadu
  *Key Concepts & Entities*: Uttara Pinakini • North Pennar, Dakshina Pinakini • South Pennar & Palar Rivers originating in Nandi Hills • Chennakesava Hills of Chikkaballapur District, draining eastern arid plateau into Andhra Pradesh & Tamil Nadu

- **West-Flowing River Systems (Short, Rapid, High-Velocity Torrential Rivers draining into Arabian Sea through Malnad & Coastal Escarpments):** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Sharavathi River** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Origin at Ambuthirtha in Thirthahalli Taluk of Shivamogga; Jog Falls / Gersoppa / Raja, Roarer, Rocket & Rani / 253m Drop / Major Plunge Waterfall in India; Linganamakki Dam / Largest Reservoir by Water Capacity in Karnataka, Sharavathi Hydroelectric Project
  *Key Concepts & Entities*: Origin at Ambuthirtha in Thirthahalli Taluk of Shivamogga • Jog Falls • Gersoppa • Raja, Roarer, Rocket & Rani • 253m Drop • Major Plunge Waterfall in India • Linganamakki Dam • Largest Reservoir by Water Capacity in Karnataka, Sharavathi Hydroelectric Project

- **Kali River** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Origin at Diggi in Uttara Kannada; Supa Dam Hydroelectric Project, Kodasalli Dam, Kadra Dam; Karwar Estuary
  *Key Concepts & Entities*: Origin at Diggi in Uttara Kannada • Supa Dam Hydroelectric Project, Kodasalli Dam, Kadra Dam • Karwar Estuary

- **Netravati & Gurupura Rivers** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Netravati Origin at Bangrabalige Valley in Kudremukh; Confluence with Kumaradhara at Uppinangadi; Lifeline of Dakshina Kannada; Yettinahole Water Diversion Project
  *Key Concepts & Entities*: Netravati Origin at Bangrabalige Valley in Kudremukh • Confluence with Kumaradhara at Uppinangadi • Lifeline of Dakshina Kannada • Yettinahole Water Diversion Project

- **Other West-Flowing Rivers: Aghanashini River / Unchalli Falls / Lushington Falls, Pristine Estuary / Ramsar Site; Gangavali / Bedthi River / Magod Falls; Varahi River / Kunchikal Falls / Underground Hydroelectric Station; Mahadayi / Mandovi River / Origin at Khanapur in Belagavi, Kalasa-Banduri Nala Drinking Water Project Dispute with Goa)** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

### Climate, Rainfall & Agro-Climatic Zones of Karnataka

- **Climate & Monsoon Dynamics** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Tropical Monsoon Climate; Four Distinct Seasons: Dry Winter / Jan–Feb, Hot Pre-Monsoon Summer / March–May / Mango Showers / Coffee Showers, South-West Monsoon Season / Mungaru / June–Sept / Accounts for ~80% of Annual Rainfall, North-East Post-Monsoon Season / Hingaru / Oct–Dec / Retreating Monsoon Rainfall in Southern & Eastern Districts
  *Key Concepts & Entities*: Tropical Monsoon Climate • Four Distinct Seasons: Dry Winter • Jan–Feb, Hot Pre-Monsoon Summer • March–May • Mango Showers • Coffee Showers, South-West Monsoon Season • Mungaru • June–Sept • Accounts for ~80% of Annual Rainfall, North-East Post-Monsoon Season • Hingaru • Oct–Dec • Retreating Monsoon Rainfall in Southern & Eastern Districts

- **Rainfall Distribution & Spatial Variation** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Heavy Orographic Rainfall in Malnad & Coastal Belt: Agumbe in Shivamogga & Hulikal / ~8000mm Annual Rainfall / 'Cherrapunji of South India', Bhagamandala in Kodagu; Steep Rain-Shadow Effect eastward of Western Ghats: Semi-Arid Core of Central & Northern Karnataka receiving <500mm Annual Rainfall / Nayakarahatti & Challakere in Chitradurga, Bagalkote, Vijayapura; High Frequency of Agricultural Droughts
  *Key Concepts & Entities*: Heavy Orographic Rainfall in Malnad & Coastal Belt: Agumbe in Shivamogga & Hulikal • ~8000mm Annual Rainfall • 'Cherrapunji of South India', Bhagamandala in Kodagu • Steep Rain-Shadow Effect eastward of Western Ghats: Semi-Arid Core of Central & Northern Karnataka receiving <500mm Annual Rainfall • Nayakarahatti & Challakere in Chitradurga, Bagalkote, Vijayapura • High Frequency of Agricultural Droughts

- **10 Agro-Climatic Zones of Karnataka (Demarcated by NARP / ICAR based on Rainfall, Soil & Cropping Patterns):** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

### Soils & Natural Vegetation of Karnataka

- **Major Soil Types of Karnataka:** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Red Soils / Alfisols & Inceptisols** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Largest Soil Group in Karnataka ~50% area; Red Sandy Loams & Red Clay Loams; Formed from Archean Gneisses & Granites; Rich in Iron Oxides & Potash, Deficient in Nitrogen, Phosphorus & Humus; Predominant in Southern Maidan - Tumakuru, Kolar, Bengaluru, Mandya, Mysuru; Ideal for Ragi, Groundnut, Pulses, Millets
  *Key Concepts & Entities*: Largest Soil Group in Karnataka ~50% area • Red Sandy Loams & Red Clay Loams • Formed from Archean Gneisses & Granites • Rich in Iron Oxides & Potash, Deficient in Nitrogen, Phosphorus & Humus • Predominant in Southern Maidan - Tumakuru, Kolar, Bengaluru, Mandya, Mysuru • Ideal for Ragi, Groundnut, Pulses, Millets

- **Black Cotton Soils / Regur / Vertisols** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Covers ~28% area; Formed from Weathering of Deccan Basaltic Traps; High Clay Content, High Moisture Retentivity, Self-Ploughing Nature with Deep Cracks during Summer; Rich in Calcium Carbonate, Magnesium & Lime, Poor in Nitrogen & Organic Matter; Predominant in Northern Maidan - Kalaburagi, Vijayapura, Bagalkote, Belagavi, Dharwad, Raichur; Ideal for Cotton, Jowar, Wheat, Sunflower, Bengal Gram
  *Key Concepts & Entities*: Covers ~28% area • Formed from Weathering of Deccan Basaltic Traps • High Clay Content, High Moisture Retentivity, Self-Ploughing Nature with Deep Cracks during Summer • Rich in Calcium Carbonate, Magnesium & Lime, Poor in Nitrogen & Organic Matter • Predominant in Northern Maidan - Kalaburagi, Vijayapura, Bagalkote, Belagavi, Dharwad, Raichur • Ideal for Cotton, Jowar, Wheat, Sunflower, Bengal Gram

- **Laterite Soils / Ultisols & Oxisols** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Formed by Intense Leaching under High Temperature & Heavy Rainfall; Acidic, Rich in Iron & Aluminium Hydroxides, Deficient in Lime & Silica; Found in Coastal Plains & Malnad Plateaus - Uttara Kannada, Udupi, Dakshina Kannada, Kodagu, Chikmagalur; Highly Suitable for Plantation Crops: Coffee, Tea, Cashew, Rubber, Arecanut
  *Key Concepts & Entities*: Formed by Intense Leaching under High Temperature & Heavy Rainfall • Acidic, Rich in Iron & Aluminium Hydroxides, Deficient in Lime & Silica • Found in Coastal Plains & Malnad Plateaus - Uttara Kannada, Udupi, Dakshina Kannada, Kodagu, Chikmagalur • Highly Suitable for Plantation Crops: Coffee, Tea, Cashew, Rubber, Arecanut

- **Alluvial & Coastal Soils / Entisols** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Narrow Belts along River Valleys & Coastal Plains; High Fertility, Rich in Organic Matter, Well-Drained; Paddy, Coconut, Banana
  *Key Concepts & Entities*: Narrow Belts along River Valleys & Coastal Plains • High Fertility, Rich in Organic Matter, Well-Drained • Paddy, Coconut, Banana

- **Forest Cover & Natural Vegetation Types:** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Forest Area (~20.1% of State Geographical Area; Western Ghats as Global Biodiversity Hotspot):** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Tropical Wet Evergreen & Semi-Evergreen Forests** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Western Slopes of Western Ghats / Annual Rainfall >2500mm; Dense Multi-Layered Canopy; Rosewood / Dalbergia latifolia, Ebony, Mahogany, White Cedar / Dysoxylum, Gurjan, Wild Jackfruit, Cinnamon; Silent Valley type microhabitats in Agumbe, Bhagamandala
  *Key Concepts & Entities*: Western Slopes of Western Ghats • Annual Rainfall >2500mm • Dense Multi-Layered Canopy • Rosewood • Dalbergia latifolia, Ebony, Mahogany, White Cedar • Dysoxylum, Gurjan, Wild Jackfruit, Cinnamon • Silent Valley type microhabitats in Agumbe, Bhagamandala

- **Tropical Moist Deciduous Forests** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Transition Zone of Malnad & Foot of Western Ghats / Rainfall 1500–2500mm; Shed leaves in early summer; Teak / Tectona grandis, Rosewood, Honne / Pterocarpus marsupium, Mathi / Terminalia tomentosa, Dindiga, Bamboo Brakes, Sandalwood / Santalum album / 'Sandalwood State' / 'Gandhada Gudi'
  *Key Concepts & Entities*: Transition Zone of Malnad & Foot of Western Ghats • Rainfall 1500–2500mm • Shed leaves in early summer • Teak • Tectona grandis, Rosewood, Honne • Pterocarpus marsupium, Mathi • Terminalia tomentosa, Dindiga, Bamboo Brakes, Sandalwood • Santalum album • 'Sandalwood State' • 'Gandhada Gudi'

- **Tropical Dry Deciduous Forests** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Eastern slopes of Ghats & Southern Maidan / Rainfall 750–1500mm; Teak, Axle-wood / Anogeissus, Bael, Neem, Palas / Flame of the Forest, Red Sanders in border areas
  *Key Concepts & Entities*: Eastern slopes of Ghats & Southern Maidan • Rainfall 750–1500mm • Teak, Axle-wood • Anogeissus, Bael, Neem, Palas • Flame of the Forest, Red Sanders in border areas

- **Tropical Thorn & Scrub Forests** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Northern & Central Dry Plains / Rainfall <750mm; Xerophytic Adaptations, Thorns, Spines & Fleshy Stems; Acacia / Babul, Kair, Euphorbias, Prosopis, Zizyphus / Ber, Cactus
  *Key Concepts & Entities*: Northern & Central Dry Plains • Rainfall <750mm • Xerophytic Adaptations, Thorns, Spines & Fleshy Stems • Acacia • Babul, Kair, Euphorbias, Prosopis, Zizyphus • Ber, Cactus

- **Coastal Mangroves** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Estuarine Intertidal Mudflats; Halophytic Vegetation with Pneumatophores / Stilt Roots; Karwar, Honnavar, Aghanashini Estuary, Gangavali & Kundapura Mangroves
  *Key Concepts & Entities*: Estuarine Intertidal Mudflats • Halophytic Vegetation with Pneumatophores • Stilt Roots • Karwar, Honnavar, Aghanashini Estuary, Gangavali & Kundapura Mangroves

### Biodiversity, Protected Areas & Conservation in Karnataka

- **National Parks of Karnataka:** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Bandipur National Park** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Chamarajanagar / Part of Nilgiri Biosphere Reserve; Established as Venugopala Wildlife Park 1931 by Mysore Maharaja; Project Tiger Site 1973; High Density of Bengal Tigers, Asian Elephants, Indian Gaur, Dholes; Moyar River / Kabini River borders
  *Key Concepts & Entities*: Chamarajanagar • Part of Nilgiri Biosphere Reserve • Established as Venugopala Wildlife Park 1931 by Mysore Maharaja • Project Tiger Site 1973 • High Density of Bengal Tigers, Asian Elephants, Indian Gaur, Dholes • Moyar River • Kabini River borders

- **Nagarahole / Rajiv Gandhi National Park** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Kodagu & Mysuru districts; Part of Nilgiri Biosphere Reserve; Kabini River separates Bandipur & Nagarahole; High Density of Tigers, Leopards, Elephants, Marsh Crocodiles
  *Key Concepts & Entities*: Kodagu & Mysuru districts • Part of Nilgiri Biosphere Reserve • Kabini River separates Bandipur & Nagarahole • High Density of Tigers, Leopards, Elephants, Marsh Crocodiles

- **Kudremukh National Park** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Chikmagalur, Udupi & Dakshina Kannada / Tropical Wet Evergreen Forests; Origin of Tunga, Bhadra & Netravati Rivers; Shola-Grassland Ecosystem; Lion-Tailed Macaque / LTM habitat; Iron Ore Mining Halted for Eco-Restoration
  *Key Concepts & Entities*: Chikmagalur, Udupi & Dakshina Kannada • Tropical Wet Evergreen Forests • Origin of Tunga, Bhadra & Netravati Rivers • Shola-Grassland Ecosystem • Lion-Tailed Macaque • LTM habitat • Iron Ore Mining Halted for Eco-Restoration

- **Bannerghatta National Park** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Bengaluru Urban / Biological Park, Tiger & Lion Safari, Butterfly Park, Elephant Wildlife Corridor connecting BM Betta & Talli Reserve Forests
  *Key Concepts & Entities*: Bengaluru Urban • Biological Park, Tiger & Lion Safari, Butterfly Park, Elephant Wildlife Corridor connecting BM Betta & Talli Reserve Forests

- **Anshi National Park / Kali Tiger Reserve** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Uttara Kannada / Moist Evergreen Rainforests, Kali River Basin, Black Panther / Melanistic Leopard Population, Great Indian Hornbill
  *Key Concepts & Entities*: Uttara Kannada • Moist Evergreen Rainforests, Kali River Basin, Black Panther • Melanistic Leopard Population, Great Indian Hornbill

- **Tiger Reserves & Biosphere Reserves:** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **5 Tiger Reserves of Karnataka** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Bandipur, Nagarahole, BRT / Biligirirangana Hills Tiger Reserve, Bhadra Tiger Reserve, Kali Tiger Reserve / Formerly Anshi-Dandeli
  *Key Concepts & Entities*: Bandipur, Nagarahole, BRT • Biligirirangana Hills Tiger Reserve, Bhadra Tiger Reserve, Kali Tiger Reserve • Formerly Anshi-Dandeli

- **Nilgiri Biosphere Reserve** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  First Biosphere Reserve in India 1986; Karnataka Sector covers Bandipur, Nagarahole & Nagarhole-Mudumalai-Wayanad Contiguous Forest Landscape
  *Key Concepts & Entities*: First Biosphere Reserve in India 1986 • Karnataka Sector covers Bandipur, Nagarahole & Nagarhole-Mudumalai-Wayanad Contiguous Forest Landscape

- **Wildlife & Bird Sanctuaries of Prominence:** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Bhadra Wildlife Sanctuary / Muthodi** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Chikmagalur / Bhadra Dam / Tiger Reserve
  *Key Concepts & Entities*: Chikmagalur • Bhadra Dam • Tiger Reserve

- **Dandeli Wildlife Sanctuary & Hornbill Conservation Reserve** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Uttara Kannada
  *Key Concepts & Entities*: Uttara Kannada

- **Daroji Sloth Bear Sanctuary** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Ballari-Vijayanagara / Dedicated Habitat for Melursus ursinus
  *Key Concepts & Entities*: Ballari-Vijayanagara • Dedicated Habitat for Melursus ursinus

- **Ramadevara Betta Vulture Sanctuary** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Ramanagara / Long-Billed Vulture Protection
  *Key Concepts & Entities*: Ramanagara • Long-Billed Vulture Protection

- **Ranganathittu Bird Sanctuary** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Mandya / Cauvery Islets / Declared Ramsar Wetland Site
  *Key Concepts & Entities*: Mandya • Cauvery Islets • Declared Ramsar Wetland Site

- **Magadi Kere Bird Sanctuary** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Gadag / Bar-Headed Goose Wintering Site / Ramsar Site
  *Key Concepts & Entities*: Gadag • Bar-Headed Goose Wintering Site • Ramsar Site

- **Ankasamudra Bird Conservation Reserve** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Vijayanagara / Ramsar Site
  *Key Concepts & Entities*: Vijayanagara • Ramsar Site

- **Aghanashini Estuary** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Uttara Kannada / Marine & Brackish Water Wetland / Ramsar Site
  *Key Concepts & Entities*: Uttara Kannada • Marine & Brackish Water Wetland • Ramsar Site

- **Kokkare Bellur Pelicanry** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Mandya / Spot-Billed Pelicans & Painted Storks Co-existing with Villagers
  *Key Concepts & Entities*: Mandya • Spot-Billed Pelicans & Painted Storks Co-existing with Villagers

- **UNESCO World Heritage Sites** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Western Ghats Sub-Clusters in Karnataka - Agumbe, Kudremukh, Pushpagiri, Talakaveri, Brahmagiri
  *Key Concepts & Entities*: Western Ghats Sub-Clusters in Karnataka - Agumbe, Kudremukh, Pushpagiri, Talakaveri, Brahmagiri

### Mineral, Power & Economic Resources of Karnataka

- **Mineral Resources of Karnataka (Richest Archean Craton / Dharwar Craton Geological Formations):** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Metallic Minerals:** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Iron Ore** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Extensive Banded Iron Formations / BIF - Magnetite & Hematite; Major Belts: Bellary-Hospet-Sandur Sector / High Grade Hematite, Kudremukh / Magnetite deposits, Kemmangundi / Bababudan Hills in Chikmagalur / Historic Feeder to Bhadravathi Steel Plant, Chitradurga, Tumakuru
  *Key Concepts & Entities*: Extensive Banded Iron Formations • BIF - Magnetite & Hematite • Major Belts: Bellary-Hospet-Sandur Sector • High Grade Hematite, Kudremukh • Magnetite deposits, Kemmangundi • Bababudan Hills in Chikmagalur • Historic Feeder to Bhadravathi Steel Plant, Chitradurga, Tumakuru

- **Gold** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Karnataka produces over 99% of India's Primary Gold; Hutti Gold Mines in Raichur / Only active primary underground gold mining company in India; Historic Kolar Gold Fields / KGF in Champion Reefs - Extensively mined up to 3.2 km depth / Closed in 2001
  *Key Concepts & Entities*: Karnataka produces over 99% of India's Primary Gold • Hutti Gold Mines in Raichur • Only active primary underground gold mining company in India • Historic Kolar Gold Fields • KGF in Champion Reefs - Extensively mined up to 3.2 km depth • Closed in 2001

- **Manganese** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Associated with Iron Ore Formations; Sandur, Kumsi in Shivamogga, Belagavi, Uttara Kannada
  *Key Concepts & Entities*: Associated with Iron Ore Formations • Sandur, Kumsi in Shivamogga, Belagavi, Uttara Kannada

- **Copper** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Ingaldhal Mines in Chitradurga, Kalyadi in Hassan, Thinthini in Raichur
  *Key Concepts & Entities*: Ingaldhal Mines in Chitradurga, Kalyadi in Hassan, Thinthini in Raichur

- **Bauxite** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Aluminium Ore formed in Lateritic Caps; Belagavi / Supplies INDAL Smelter, Uttara Kannada, Dakshina Kannada
  *Key Concepts & Entities*: Aluminium Ore formed in Lateritic Caps • Belagavi • Supplies INDAL Smelter, Uttara Kannada, Dakshina Kannada

- **Chromite** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Byrapur in Hassan District
  *Key Concepts & Entities*: Byrapur in Hassan District

- **Non-Metallic & Industrial Minerals:** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Limestone & Dolomite** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Extensive Bhima & Kaladgi Rock Basins; Major Cement Clusters in Kalaburagi / Sedam, Wadi, Malkhed, Bagalkote, Belagavi
  *Key Concepts & Entities*: Extensive Bhima & Kaladgi Rock Basins • Major Cement Clusters in Kalaburagi • Sedam, Wadi, Malkhed, Bagalkote, Belagavi

- **Granite & Dimensional Stones** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Ilkal Red Granite / Bagalkote, Ruby Red / Chamarajanagar, Bengaluru Grey Granite, Black Granite / Kanakapura
  *Key Concepts & Entities*: Ilkal Red Granite • Bagalkote, Ruby Red • Chamarajanagar, Bengaluru Grey Granite, Black Granite • Kanakapura

- **Silica Sand & Quartz** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Coastal Udupi & Dakshina Kannada, Belagavi
  *Key Concepts & Entities*: Coastal Udupi & Dakshina Kannada, Belagavi

- **Energy, Power Infrastructure & Industrial Corridors of Karnataka:** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Hydroelectric Power** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  First State in Asia to harness Commercial Hydro Power: Shivanasamudra 1902; Mahatma Gandhi Sharavathi Hydroelectric Project at Jog Falls; Linganamakki Powerhouse, Supa Dam on Kali, Varahi Underground Powerhouse, Kadra & Kodasalli Projects, Almatti Dam Hydel Project
  *Key Concepts & Entities*: First State in Asia to harness Commercial Hydro Power: Shivanasamudra 1902 • Mahatma Gandhi Sharavathi Hydroelectric Project at Jog Falls • Linganamakki Powerhouse, Supa Dam on Kali, Varahi Underground Powerhouse, Kadra & Kodasalli Projects, Almatti Dam Hydel Project

- **Thermal Power Stations** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Raichur Thermal Power Station / RTPS / First Coal-Fired TPS in Karnataka; Bellary Thermal Power Station / BTPS at Kudatini; Yermarus Thermal Power Station / YTPS in Raichur
  *Key Concepts & Entities*: Raichur Thermal Power Station • RTPS • First Coal-Fired TPS in Karnataka • Bellary Thermal Power Station • BTPS at Kudatini • Yermarus Thermal Power Station • YTPS in Raichur

- **Nuclear Energy** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Kaiga Atomic Power Station in Uttara Kannada / 4 Units of Pressurised Heavy Water Reactors / PHWR / Indigenous Nuclear Technology
  *Key Concepts & Entities*: Kaiga Atomic Power Station in Uttara Kannada • 4 Units of Pressurised Heavy Water Reactors • PHWR • Indigenous Nuclear Technology

- **Renewable Energy Leadership (Karnataka is a National Leader in Clean Energy Generation):** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Solar Energy: Pavagada Solar Park / 'Shakti Sthala' in Tumakuru District / 2,050 MW Capacity / One of the Largest Ultra-Mega Solar Parks in the World; PM-KUSUM Decentralized Solarisation** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Wind Energy: Wind Power Farms in Kappatagudda / Gadag, Jogimatti / Chitradurga, Harapanahalli, Belagavi, Chikkaballapur** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **Major Industrial & Economic Hubs:** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]

- **IT & Biotechnology Hub** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Bengaluru / 'Silicon Valley of India' / Electronic City, Whitefield; Mysore IT Hub
  *Key Concepts & Entities*: Bengaluru • 'Silicon Valley of India' • Electronic City, Whitefield • Mysore IT Hub

- **Heavy Engineering, Aerospace & Defence Corridor** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  HAL, BEL, BEML, ISRO, DRDO, Gas Turbine Research Establishment
  *Key Concepts & Entities*: HAL, BEL, BEML, ISRO, DRDO, Gas Turbine Research Establishment

- **Textile & Garment Clusters** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Ballari / Jeans Capital of India, Doddaballapura, Ilkal Sarees, Guledgudda Khana, Mysore Silk
  *Key Concepts & Entities*: Ballari • Jeans Capital of India, Doddaballapura, Ilkal Sarees, Guledgudda Khana, Mysore Silk

- **Automobile & Machinery Corridors** [KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]
  Bidadi / Toyota, Narasapura & Peenya Industrial Area / Largest MSME Industrial Estate in SE Asia
  *Key Concepts & Entities*: Bidadi • Toyota, Narasapura & Peenya Industrial Area • Largest MSME Industrial Estate in SE Asia

### 1. North-Eastern Transition Zone (Bidar, Kalaburagi / Pulses, Black Soil, Moderate Rainfall)

*(Core Regional / Mapping Topic)*

### 2. North-Eastern Dry Zone (Raichur, Yadgir, Kalaburagi / Cotton, Jowar, Deep Black Soils)

*(Core Regional / Mapping Topic)*

### 3. Northern Dry Zone (Vijayapura, Bagalkote, Gadag, Belagavi, Koppal, Ballari / Largest Zone, Low Rainfall, Bajra, Sunflower, Jowar)

*(Core Regional / Mapping Topic)*

### 4. Central Dry Zone (Chitradurga, Davanagere, Tumakuru / Millets, Groundnut, Maize)

*(Core Regional / Mapping Topic)*

### 5. Eastern Dry Zone (Bengaluru Urban & Rural, Kolar, Chikkaballapur, Ramanagara / Ragi, Mulberry / Sericulture, Vegetables)

*(Core Regional / Mapping Topic)*

### 6. Southern Dry Zone (Mysuru, Mandya, Chamarajanagar / Paddy, Sugarcane, Ragi, Cauvery Canal Irrigation)

*(Core Regional / Mapping Topic)*

### 7. Southern Transition Zone (Hassan, Mysuru, Shivamogga / Transitional Cropping, Ragi, Tobacco, Potato)

*(Core Regional / Mapping Topic)*

### 8. Northern Transition Zone (Dharwad, Belagavi, Haveri / High Agricultural Productivity, Cotton, Soybean, Wheat, Chilli)

*(Core Regional / Mapping Topic)*

### 9. Hilly / Malnad Zone (Uttara Kannada, Shivamogga, Chikmagalur, Hassan, Kodagu / Plantation Crops: Coffee, Arecanut, Pepper, Cardamom, Tea, Paddy)

*(Core Regional / Mapping Topic)*

### 10. Coastal Zone (Dakshina Kannada, Udupi, Uttara Kannada coastal strip / Coconut, Arecanut, Paddy, Cashew, Fisheries)

*(Core Regional / Mapping Topic)*

World Mapping & Geopolitical Locations `[UPSC: Prelims-GS1, Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

### Enclosed Seas, Marginal Seas & Bordering Nations (Mediterranean Sea, Black Sea, Caspian Sea, Red Sea, Baltic Sea, Persian Gulf, Aral Sea, Dead Sea)

- **Enclosed Seas: Mediterranean, Black, Caspian & Baltic Basins** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Bordering nations, strategic straits, and maritime geography of major enclosed and marginal seas: Mediterranean Sea (surrounded by 21 nations across Europe, Asia, and Africa; connected to Atlantic via Strait of Gibraltar, to Red Sea via Suez Canal, to Sea of Marmara via Dardanelles; major marginal seas: Tyrrhenian, Adriatic, Ionian, Aegean, Ligurian; major islands: Sicily, Sardinia, Cyprus, Corsica, Crete); Black Sea (bordered by 6 nations: Turkey, Georgia, Russia, Ukraine, Romania, Bulgaria; connected to Sea of Azov via Kerch Strait, to Marmara via Bosphorus; Danube, Dnieper, and Don river inflows); Caspian Sea (world's largest inland water body / lake; bordered by TARIK nations: Turkmenistan, Azerbaijan, Russia, Iran, Kazakhstan; Volga and Ural rivers discharge); Baltic Sea (bordered by 9 nations: Sweden, Finland, Russia, Estonia, Latvia, Lithuania, Poland, Germany, Denmark; connected to North Sea through Danish Straits / Kattegat and Skagerrak).
  *Key Concepts & Entities*: Mediterranean Sea 21 Bordering Nations • Black Sea & 6 Bordering Nations • Caspian Sea TARIK Nations • Baltic Sea 9 Bordering Nations • Sea of Azov & Kerch Strait • Aegean & Adriatic Marginal Seas

- **Marginal Seas & Depressions: Red Sea, Persian Gulf & Dead Sea** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Spatial delineation and littoral states of critical Middle Eastern and Central Asian waters: Red Sea (rift basin bordered by 6 nations: Egypt, Sudan, Eritrea, Djibouti on west; Saudi Arabia, Yemen on east; northern forks: Gulf of Suez and Gulf of Aqaba; southern outlet: Bab-el-Mandeb); Persian Gulf / Arabian Gulf (surrounded by 8 littoral nations: Iran, Iraq, Kuwait, Saudi Arabia, Bahrain, Qatar, UAE, Oman; connected to Gulf of Oman and Arabian Sea through the narrow Strait of Hormuz; Tigris-Euphrates / Shatt al-Arab delta inflow); Dead Sea (hypersaline endorheic lake in Jordan Rift Valley bordered by Israel, West Bank, and Jordan; lowest land elevation on Earth -430m below sea level; high salinity ~34% preventing macroscopic aquatic life); Aral Sea (endangered hyper-saline remnant depression shared by Uzbekistan and Kazakhstan, desiccated due to diversion of Amu Darya and Syr Darya rivers).
  *Key Concepts & Entities*: Red Sea Bordering Nations (Egypt, Sudan, Saudi) • Gulf of Aqaba & Gulf of Suez • Persian Gulf 8 Littoral Nations • Bab-el-Mandeb & Strait of Hormuz • Dead Sea Hypersaline Depression (-430m) • Aral Sea Remnant Basins

### Strategic Maritime Straits, Canals & Chokepoints (Strait of Hormuz, Bab-el-Mandeb, Malacca Strait, Bosphorus & Dardanelles, Kerch Strait, Taiwan Strait, Suez Canal, Panama Canal)

- **Global Maritime Chokepoints: Hormuz, Malacca, Bab-el-Mandeb & Turkish Straits** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Spatial geography, maritime jurisdictions, and strategic transit vulnerabilities: Strait of Hormuz (connects Persian Gulf to Gulf of Oman; separates Iran from Oman's Musandam Peninsula; world's most critical oil transit chokepoint handling ~20% of global petroleum); Strait of Malacca (narrow 800 km strait connecting Indian Ocean / Andaman Sea to South China Sea; separates Peninsular Malaysia from Indonesian island of Sumatra; shortest sea route between Middle East/India and East Asia; Singapore chokepoint); Bab-el-Mandeb / 'Gate of Tears' (separates Yemen on Arabian Peninsula from Djibouti and Eritrea in the Horn of Africa; connects Red Sea to Gulf of Aden; high piracy and Houthi maritime security threat); Turkish Straits: Bosphorus Strait (separates European and Asian parts of Istanbul, connects Black Sea to Sea of Marmara) and Dardanelles Strait (connects Sea of Marmara to Aegean Sea; Montreux Convention 1936 regulating naval transit).
  *Key Concepts & Entities*: Strait of Hormuz (Musandam Peninsula & Iran) • Strait of Malacca (Malaysia-Sumatra-Singapore) • Bab-el-Mandeb (Yemen & Djibouti Chokepoint) • Bosphorus & Dardanelles (Turkish Straits) • Montreux Convention 1936 • Global Hydrocarbon Transit Routes

- **Canals & Passages: Suez Canal, Panama Canal, Taiwan Strait & Gibraltar** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Man-made international canals and critical oceanic waterways: Suez Canal (193 km sea-level artificial waterway opened in 1869 across the Isthmus of Suez in Egypt, connecting Mediterranean Sea at Port Said to Red Sea at Port Tewfik/Suez; no locks required; enables direct transit between Europe and Asia bypassing Cape of Good Hope); Panama Canal (82 km artificial ship canal opened in 1914 across the Isthmus of Panama, connecting Atlantic Ocean at Colón to Pacific Ocean at Panama City; operates with a freshwater lock system lifting ships 26m to Gatun Lake; expanded Neopanamax locks 2016); Taiwan Strait / Formosa Strait (separates mainland China Fujian province from Taiwan; connects South China Sea with East China Sea); Strait of Gibraltar (connects Atlantic Ocean to Mediterranean Sea; separates Spain/Gibraltar in Europe from Morocco/Ceuta in Africa; 14 km width at narrowest point); Sunda Strait (between Java and Sumatra) and Lombok Strait (deepwater alternative between Bali and Lombok across the Wallace Line); Bering Strait (separates Chukchi Peninsula Russia from Seward Peninsula Alaska USA, connecting Arctic Ocean to Bering Sea).
  *Key Concepts & Entities*: Suez Canal (Port Said to Suez) • Panama Canal & Gatun Lake Locks • Taiwan Strait (Formosa Strait) • Strait of Gibraltar (Europe-Africa Chokepoint) • Sunda & Lombok Straits (Indonesia) • Bering Strait (Russia-Alaska Boundary)

### Places in News & Conflict Zones (West Asia / Levant: Gaza, West Bank, Golan Heights, Sinai; Sahel Region: Mali, Niger, Burkina Faso, Chad; Horn of Africa: Tigray, Somaliland; Eastern Europe: Donbas, Crimea, Zaporizhzhia; South China Sea)

- **Geopolitical Flashpoints in News: West Asia, Sahel, South China Sea & Horn of Africa** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Geographical locations frequently appearing in contemporary international affairs and UPSC examinations: West Asia / Levant: Gaza Strip (Rafah crossing, Philadelphi Corridor, Khan Younis), West Bank (Jericho, Ramallah, Hebron, Green Line), Golan Heights (strategic plateau overlooking Sea of Galilee, Mount Hermon), Sinai Peninsula, and southern Lebanon (Blue Line, Litani River); Eastern Europe: Donbas region (Donetsk and Luhansk oblasts), Crimea (Sevastopol naval base, Kerch Strait Bridge), Zaporizhzhia (nuclear power plant on Dnipro river), Kherson, and Transnistria enclave in Moldova; South Caucasus: Nagorno-Karabakh (Artsakh enclave, Lachin Corridor, Zangezur Corridor between Azerbaijan and Nakhchivan); Sahel Belt: Coup belt across Mali, Niger, Burkina Faso, Chad, and Sudan (Darfur region, Port Sudan on Red Sea); Horn of Africa: Tigray region in Ethiopia, Grand Ethiopian Renaissance Dam (GERD on Blue Nile), Somaliland port of Berbera, Bab-el-Mandeb maritime corridor; South China Sea: Nine-Dash Line, Spratly Islands (Mischief Reef, Fiery Cross Reef), Paracel Islands (Woody Island), and Scarborough Shoal.
  *Key Concepts & Entities*: Gaza Strip (Rafah & Philadelphi Corridor) • Golan Heights & Litani River (Lebanon) • Donbas, Crimea & Zaporizhzhia (Dnipro River) • Nagorno-Karabakh (Lachin & Zangezur Corridors) • Sahel Belt (Mali, Niger, Burkina Faso, Sudan) • Grand Ethiopian Renaissance Dam (GERD) • South China Sea (Nine-Dash Line & Spratly Islands)

### International Land Borders, Landlocked Nations & Disputed Boundary Lines (Radcliffe Line, McMahon Line, Durand Line, 38th Parallel, 49th Parallel, Kuril Islands, Senkaku/Diaoyu, Spratly/Paracel)

- **International Boundary Lines, Landlocked States & Cartographic Disputes** [UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]
  Spatial mapping of world borders, demarcation lines, and geographical classifications: Iconic International Boundary Lines: 49th Parallel (demarcates the long undefended border between United States and Canada from Lake of the Woods to Strait of Georgia), 38th Parallel / DMZ (demarcates North Korea and South Korea along the Demilitarized Zone), 17th Parallel (historical partition line of North and South Vietnam), Radcliffe Line (demarcation between India and Pakistan / Bangladesh established in 1947), McMahon Line (disputed boundary line between India's Arunachal Pradesh and Tibet agreed at 1914 Simla Convention), Durand Line (border between Pakistan and Afghanistan drawn in 1893), Line of Control (LoC in Jammu & Kashmir), Line of Actual Control (LAC between India and China across Ladakh, Middle, and Eastern sectors); Landlocked Nations: Mapping of the world's 44 landlocked states (largest by area Kazakhstan, most populous Ethiopia); Doubly Landlocked Countries (landlocked nations completely surrounded by other landlocked nations: only two in the world: Liechtenstein in Europe and Uzbekistan in Central Asia); Tri-points and enclaves (Cooch Behar historical enclaves, Kalapani-Lipulekh tripoint India-Nepal-China).
  *Key Concepts & Entities*: 49th Parallel (US-Canada Border) • 38th Parallel (Korean DMZ) • Radcliffe Line & McMahon Line • Durand Line (Pakistan-Afghanistan) • 44 Landlocked Countries (Kazakhstan & Ethiopia) • Doubly Landlocked (Liechtenstein & Uzbekistan) • Line of Control (LoC) & Line of Actual Control (LAC)

Indian Mapping & Spatial Geography `[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

### Indian River Systems & Tributaries Spatial Layout (Indus Basin, Ganga Basin, Brahmaputra Basin, Peninsular Rivers: Godavari, Krishna, Cauvery, Mahanadi, Narmada, Tapi - Left & Right Bank Tributaries, North-to-South & West-to-East Ordering)

*(Core Regional / Mapping Topic)*

### Himalayan Ranges, Mountain Passes & Glaciers (Karakoram, Ladakh, Zanskar, Great Himalayas, Pir Panjal, Dhauladhar, Shiwaliks; Passes: Zoji La, Khardung La, Rohtang, Shipki La, Lipulekh, Nathu La, Jelep La, Bomdi La; Glaciers: Siachen, Gangotri, Zemu)

*(Core Regional / Mapping Topic)*

### Protected Areas & Biogeography Spatial Layout (North-to-South and West-to-East Sequential Ordering of National Parks, Tiger Reserves, Ramsar Wetlands, Biosphere Reserves & Wildlife Corridors in India)

*(Core Regional / Mapping Topic)*

### Peninsular Hills, Plateaus & Mountain Passes (Aravalli, Vindhya, Satpura, Western Ghats / Sahyadri, Eastern Ghats, Nilgiri Hills, Anaimalai, Cardamom Hills; Thal Ghat, Bhor Ghat, Palghat Gap, Shencottah Gap; Anamudi & Doddabetta Peaks)

*(Core Regional / Mapping Topic)*

### Coastal Features, Island Territories & Maritime Channels (10 Degree Channel: Andaman & Nicobar, 9 Degree Channel: Minicoy & Lakshadweep, 8 Degree Channel: Minicoy & Maldives, Palk Strait, Gulf of Mannar, Rann of Kutch, Sir Creek, Konkan & Coromandel Coast)

*(Core Regional / Mapping Topic)*

### Major Sea Ports, National Waterways, Dedicated Freight Corridors & Industrial Transport Corridors (Major 13 Ports, NW-1 to NW-5, Western & Eastern DFC, Golden Quadrilateral & Strategic Expressways)

*(Core Regional / Mapping Topic)*

Karnataka Mapping & Spatial Geography `[UPSC: Prelims-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]`

### Karnataka River Basins, Tributaries, Waterfalls & Major Dams Spatial Distribution (Krishna, Cauvery, Godavari, Pennar, West-Flowing Rivers: Sharavathi, Bedthi, Netravathi; Waterfalls: Jog, Shivanasamudra, Gokak, Magod, Abbey; Dams: KRS, Almatti, Tungabhadra, Linganamakki)

*(Core Regional / Mapping Topic)*

### Western Ghats Mountain Peaks & Elevations Descending Order in Karnataka (Mullayanagiri 1930m, Bababudangiri 1895m, Kudremukh 1894m, Pushpagiri / Kumara Parvatha 1712m, Tadiandamol 1748m, Biligirirangana Hills)

*(Core Regional / Mapping Topic)*

### 10 Agro-Climatic Zones, District Boundaries, National Parks & Mineral Belts of Karnataka (Coastal, Hilly/Malnad, Northern Dry, Central Dry, Southern Dry; Sandur/Bellary Iron Ore, Kolar Gold, Hassan Chromite; Bandipur, Nagarhole, Kudremukh, Anshi, Bannerghatta)

*(Core Regional / Mapping Topic)*

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

- Ethics & Human Interface (Essence, determinants and consequences of Ethics in human actions; Dimensions of ethics; Ethics in private and public relationships; Human Values – lessons from the lives and teachings of great leaders, reformers and administrators; Role of family, society and educational institutions in inculcating values)
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
12. GENERAL MENTAL ABILITY, QUANTITATIVE APTITUDE & COMPREHENSION [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]
==================================================

General Mental Ability, Quantitative Aptitude & Comprehension

- Reading Comprehension & Interpersonal Skills
- Quantitative Aptitude & Basic Numeracy
- General Mental Ability & Logical Reasoning

Reading Comprehension & Interpersonal Skills [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]

### Reading Comprehension & Inference
*(Passage Analysis - Central Idea Identification, Author's Tone, Main Thesis vs Supporting Evidence; Inference & Assumption Testing - Logical Inferences, Implicit Assumptions, Direct & Indirect Conclusions; Passages Types - Economic, Philosophical, Scientific, Environmental, Social, Geopolitical Passages)*

- **Unified Core Topic**: Direct passage analysis, premise-conclusion evaluation, implicit assumptions, crucial takeaways, and logical corollaries across economic, philosophical, scientific, environmental, social, and geopolitical texts.

### Critical Reasoning & Analytical Ability
*(Logical Arguments - Strengthening & Weakening Arguments, Evaluating Premise & Conclusion, Paradox Resolution)*

- **Strengthening & Weakening Logical Arguments** [UPSC: Prelims-CSAT] [KAS: Prelims-P2] [BANKING: Critical-Reasoning]
  Evaluating arguments by introducing new evidence that bolsters or undermines the author's stated conclusion; identifying flaws in logic, counter-evidence, and ungrounded leaps.
  *Key Concepts & Entities*: Strengthen Argument • Weaken Argument • Flaws in Reasoning • Counter Evidence • Premise Support

- **Paradox Resolution & Premise Consistency** [UPSC: Prelims-CSAT] [KAS: Prelims-P2] [BANKING: Critical-Reasoning]
  Resolving apparent contradictions or counterintuitive statistical paradoxes in verbal statements; checking consistency and validity among interdependent premises.
  *Key Concepts & Entities*: Paradox Resolution • Apparent Contradiction • Premise Consistency • Logical Reconciliation

### Interpersonal & Communication Skills
*(Verbal Reasoning - Statement-Argument, Statement-Assumption, Course of Action, Cause & Effect)*

- **Statement-Assumption, Argument & Course of Action** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Verbal-Reasoning] [BANKING: Reasoning]
  Evaluating strong vs weak arguments, determining valid assumptions underlying policy statements, and selecting feasible, balanced, and non-drastic courses of action.
  *Key Concepts & Entities*: Statement and Arguments • Statement and Assumptions • Statement and Conclusions • Course of Action • Strong vs Weak Arguments

- **Cause and Effect Analysis** [UPSC: Prelims-CSAT] [KAS: Prelims-P2] [SSC: Verbal-Reasoning] [BANKING: Reasoning]
  Determining whether two related events represent an independent cause, principal effect, common cause, or coincidental correlation.
  *Key Concepts & Entities*: Cause and Effect • Principal Cause • Independent Cause • Common Cause Effect

- **Administrative Decision Making & Situational Judgement** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1]
  Handling administrative ethical dilemmas, public service conflicts of interest, disaster emergency response prioritization, stakeholder negotiation, and ethical balance.
  *Key Concepts & Entities*: Administrative Decision Making • Situational Judgement • Crisis Management • Public Service Ethics • Conflict Resolution

Quantitative Aptitude & Basic Numeracy [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]

### Number Systems & Basic Arithmetic
*(Fundamentals of Numbers - Types of Numbers: Natural, Integers, Rational, Prime; Divisibility Rules, Unit Digit Calculations; Factors, Multiples & Remainders - LCM & HCF, Remainder Theorems, Number of Factors, Trailing Zeros)*

- **Number Classification & Divisibility Rules** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Classification of numbers (natural, integers, rational, irrational, prime, composite, co-prime); divisibility tests for 2 through 19, 72, 88, 99; properties of consecutive integers.
  *Key Concepts & Entities*: Natural Numbers • Integers • Prime Numbers • Co-prime Numbers • Divisibility Rules for 7, 11, 13, 72, 88 • Consecutive Integers

- **Remainders, Unit Digits & Factorial Arithmetic** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Remainder theorems (Euler's totient, Fermat's Little theorem, Wilson's theorem, polynomial remainders), cyclicity of powers and unit digit calculation, trailing zeros in factorials.
  *Key Concepts & Entities*: Remainder Theorems • Euler Totient Function • Fermat's Little Theorem • Unit Digit Cyclicity • Trailing Zeros in n! • Highest Power of Prime dividing n!

- **LCM, HCF, Factors & Multiples** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Highest Common Factor (HCF), Least Common Multiple (LCM), product rule, number of factors/divisors, sum of divisors, bells tolling / circular track meeting times.
  *Key Concepts & Entities*: LCM and HCF • Prime Factorization • Total Number of Factors • Sum and Product of Factors • Word Problems on HCF & LCM

- **Fractions, Decimals, Surds & Indices** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Operations on recurring decimals, continued fractions, surds simplification, laws of indices, ascending/descending comparison of exponents and irrational roots.
  *Key Concepts & Entities*: Recurring Decimals • Continued Fractions • Surds Simplification • Laws of Indices • Exponent Comparison

- **Algebraic Identities & Linear / Quadratic Equations** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Standard polynomial identities, roots of quadratic equations, nature of roots (discriminant), simultaneous linear equations, word problems involving unknown variables.
  *Key Concepts & Entities*: Algebraic Identities • Linear Equations in Two Variables • Quadratic Equations • Nature of Roots • Algebraic Word Problems

- **Progressions & Number Sequences (AP & GP)** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Arithmetic Progression (AP) nth term and sum of n terms, Geometric Progression (GP) nth term and finite/infinite series sums, harmonic progression basics.
  *Key Concepts & Entities*: Arithmetic Progression (AP) • Geometric Progression (GP) • nth Term Formula • Sum of n Terms • Infinite GP Series

### Percentages, Averages & Ratio-Proportion
*(Proportional Math - Percentages & Percentage Change, Averages & Weighted Averages, Mixtures & Alligations, Ratio & Proportion, Partnerships)*

- **Percentages, Successive Change & Base Effects** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Percentage calculation, percentage increase/decrease, formula for successive percentage changes (a + b + ab/100), base shift concepts, population depreciation/growth over years.
  *Key Concepts & Entities*: Percentage Calculations • Successive Percentage Change • Base Shift Concept • Population Growth & Depreciation • Pass/Fail Exam Cutoffs

- **Averages, Weighted Averages & Alligations** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Arithmetic mean, weighted averages, effect of inclusion/exclusion/replacement on group averages, alligation rule and multi-mixture blending.
  *Key Concepts & Entities*: Arithmetic Average • Weighted Average • Change in Average on Replacement • Mixtures and Alligations • Alligation Cross Method

- **Ratio, Proportion, Variation & Partnerships** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Compound ratios, mean/third/fourth proportional, direct and inverse variation, capital-time profit sharing in business partnerships, coin denomination word problems.
  *Key Concepts & Entities*: Direct & Inverse Proportion • Mean Proportional • Business Partnerships • Profit Sharing Ratio • Coin Counting Puzzles

- **Problems on Ages** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Formulation of simultaneous linear equations based on chronological age relations (past, present, future age ratios and differentials).
  *Key Concepts & Entities*: Age Word Problems • Past Present Future Age Ratios • Age Difference Invariance

### Profit, Loss, Interest & Discount
*(Commercial Mathematics - Cost Price, Selling Price, Profit & Loss Percentage, Marked Price & Discounts, Simple Interest, Compound Interest & Compounding Frequency)*

- **Profit, Loss, Marked Price & Dishonest Dealers** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Cost price, selling price, profit/loss percentage, marked price, trade discounts, successive discounts equivalent single discount, faulty weights and dishonest seller calculations.
  *Key Concepts & Entities*: Cost Price and Selling Price • Profit and Loss Percentage • Marked Price and Discount • Successive Discounts • Dishonest Dealer & Faulty Weights

- **Simple Interest & Installments** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Principles of Simple Interest (SI = P*R*T/100), interest calculations with variable rates and fractional years, finding sum and principal, simple interest installments and loan amortization.
  *Key Concepts & Entities*: Simple Interest (SI) • Principal and Amount • Variable Rates of Simple Interest • Simple Interest Installments • SI Word Problems

- **Compound Interest & Periodical Compounding** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Compound Interest (CI) with annual, semi-annual, and quarterly compounding; difference between CI and SI for 2 & 3 years; compounding growth in population/depreciation; equal annual installments (EMI).
  *Key Concepts & Entities*: Compound Interest (CI) • Compounding Frequency (Half-yearly, Quarterly) • Difference between CI and SI Formula • Population Compounding & Depreciation • Equal Annual Installments (EMI)

### Time, Work, Speed & Distance
*(Time & Motion Kinetics - Time & Work, Pipes & Cisterns, Speed-Time-Distance, Relative Speed, Problems on Trains, Boats & Streams)*

- **Time & Work, Pipes & Cisterns, Wages** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Unitary work method, individual vs combined efficiency, alternate day work cycles, inlet/outlet pipes with negative work rates, division of wages based on work contribution.
  *Key Concepts & Entities*: Time and Work Efficiency • Man-Hours Work Formula • Alternate Working Days • Pipes and Cisterns • Work and Wages Division

- **Speed, Time & Distance, Problems on Trains** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Speed conversions (km/h to m/s), average speed for harmonic journeys, relative speed of objects moving in same vs opposite directions, train crossing a pole/platform/another train.
  *Key Concepts & Entities*: Speed-Time-Distance Formula • Average Speed for Round Trips • Relative Speed • Train Crossing Moving Objects • Train Crossing Bridges and Platforms

- **Boats, Streams, Races & Circular Motion** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Speed in still water vs stream velocity, upstream and downstream speed, linear races with distance/time head starts, circular track meeting times and lead laps.
  *Key Concepts & Entities*: Upstream and Downstream Speed • Boats and Streams Formula • Linear Races Head Starts • Dead Heats • Circular Track Motion

### Permutation, Combination & Probability
*(Combinatorics - Fundamental Counting Principle, Factorials, Permutations / Arrangements, Combinations / Selections; Probability Science - Sample Space, Events, Independent & Mutually Exclusive Events, Conditional Probability)*

- **Fundamental Counting Principle & Permutations** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Multiplication and addition principles of counting, factorials, permutations of n distinct objects, arrangements with repetition, arrangements with restrictions, circular permutations.
  *Key Concepts & Entities*: Fundamental Principle of Counting • Factorial Properties • Permutations nPr • Arrangements with Restricted Positions • Circular Permutations (n-1)!

- **Combinations, Selections & Geometric Combinatorics** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Selection formula nCr, committee/team formation with conditions, distribution of identical items into distinct groups, number of diagonals in polygons, triangles formed by points.
  *Key Concepts & Entities*: Combinations nCr • Committee Formation Constraints • Geometric Selections (Lines, Triangles, Diagonals) • Handshake Problems • Partitioning into Groups

- **Probability, Independent Events & Conditional Odds** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Classical definition of probability, sample spaces (coins, dice, deck of 52 cards, balls from urns), addition theorem P(A u B), mutually exclusive vs independent events, conditional probability P(A|B).
  *Key Concepts & Entities*: Classical Probability • Sample Space & Favourable Outcomes • Dice and Coin Probability • Playing Cards & Urns • Independent Events • Conditional Probability

- **Set Theory, Venn Diagrams & Maxima-Minima** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Two-set and three-set Venn diagrams, union and intersection formulas, survey data deductions, determining maximum and minimum overlap among groups.
  *Key Concepts & Entities*: Two-set Venn Diagram • Three-set Venn Diagram • Set Union & Intersection • Maxima and Minima in Overlapping Sets • Survey Data Analysis

### Mensuration & Geometry
*(Spatial Measurement - 2D Geometrical Shapes: Triangles, Circles, Quadrilaterals; Perimeter & Area; 3D Solids: Cubes, Cuboids, Cylinders, Cones, Spheres; Surface Area & Volume)*

- **2D Geometry & Mensuration (Lines, Triangles, Quadrilaterals, Circles)** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Angle properties, Pythagoras theorem, triangle congruence & similarity, area of triangles (Heron's formula), rectangles, rhombuses, trapezoids, circles (arcs, sectors, segments), inscribed/circumscribed shapes.
  *Key Concepts & Entities*: Pythagorean Triples • Triangle Area (Heron's Formula) • Circles, Sectors and Arcs • Quadrilaterals & Parallelograms • Regular Polygons • Inscribed & Circumscribed Circles

- **3D Mensuration (Cubes, Cuboids, Cylinders, Cones, Spheres)** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant] [BANKING: Quant]
  Total surface area, lateral surface area, volume of standard 3D solids (cube, cuboid, cylinder, cone, sphere, hemisphere, frustum), melting and recasting solids into new shapes.
  *Key Concepts & Entities*: Cube and Cuboid Volume & Surface Area • Cylinder and Cone Mensuration • Sphere and Hemisphere Properties • Melting & Recasting Metal Shapes • Water Level Rise in Containers

General Mental Ability & Logical Reasoning [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]

### Logical & Analytical Reasoning
*(Deductive Logic - Syllogisms / Venn Diagram & Rules Method, Logical Deductions; Spatial & Relational Logic - Linear & Circular Seating Arrangements, Blood Relations & Family Trees, Direction Sense & Compass Problems, Clocks & Calendar Calculations)*

- **Syllogisms & Categorical Propositions** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Deductive categorical syllogisms (All A are B, Some A are B, No A is B, Some A are not B), Euler/Venn diagram representation, 'Only a few', possibility conclusions, reverse syllogisms.
  *Key Concepts & Entities*: Categorical Propositions • Standard Syllogism Deductions • Possibility Cases in Syllogisms • Venn Diagram Method for Syllogisms • Only a Few / Some Not Rules

- **Linear, Circular & Complex Seating Arrangements** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Linear row seating (unidirectional and bidirectional facing), circular table arrangements (inward, outward, mixed facing), rectangular/polygonal seating with multi-variable attributes.
  *Key Concepts & Entities*: Linear Row Arrangements • Circular Seating Arrangements (Inward/Outward) • Multi-variable Seating Puzzles • Double Row Parallel Arrangements

- **Blood Relations & Coded Family Trees** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Deciphering kinship relations from direct descriptive statements, generation tree diagramming, coded blood relations, paternal vs maternal lineages.
  *Key Concepts & Entities*: Family Tree Generation Diagrams • Direct Statement Kinship • Coded Blood Relations • Paternal vs Maternal Relations

- **Direction Sense, Cardinal Movements & Shadows** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  8-point compass directions (North, South, East, West, NE, NW, SE, SW), distance tracking via Pythagoras theorem, angular clockwise/counter-clockwise turns, sunrise and sunset shadow directions.
  *Key Concepts & Entities*: Cardinal & Intercardinal Directions • Pythagoras Distance Calculation • Angular Turns (Clockwise/Anti-clockwise) • Sunrise and Sunset Shadow Logic

- **Clocks: Angles, Coincidence & Faulty Clocks** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Angle between hour hand and minute hand at any given time, times when hands coincide (0 deg), form a right angle (90 deg), or are in opposite directions (180 deg), fast and slow gaining/losing clocks.
  *Key Concepts & Entities*: Angle Between Clock Hands Formula • Coincidence of Clock Hands • Opposite Hands (180 Degrees) • Right Angles in Clocks • Gaining and Losing Time (Faulty Clocks)

- **Calendars: Odd Days, Leap Years & Repetition** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Counting odd days in normal and leap years, century odd days (100, 200, 300, 400 years), finding the exact day of the week for historical dates, repetition of annual calendar cycles.
  *Key Concepts & Entities*: Odd Days Calculation • Leap Year & Solar Year Rules • Century Leap Days • Day Determination for Past/Future Dates • Calendar Repetition Cycle

### Data Interpretation & Data Sufficiency
*(Data Formats - Bar Charts, Pie Charts, Line Graphs, Data Tables, Mixed Graphs; Data Sufficiency - Evaluating Sufficiency of Given Statements to Answer Questions)*

- **Tabular DI & Missing Data Tables** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: DI] [BANKING: DI]
  Single & multi-variable numerical data tables, missing value deductions based on conditional row/column totals, percentages, ratios, and averages.
  *Key Concepts & Entities*: Tabular Data Interpretation • Missing Data Tables • Row-Column Aggregates • Multi-Variable Matrix • Table Percentage Growth

- **Bar Charts (Simple, Grouped & Stacked)** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: DI] [BANKING: DI]
  Horizontal and vertical bar charts, clustered/grouped bar charts, subdivided/stacked component bar charts, and cumulative percentage bar graphs.
  *Key Concepts & Entities*: Single Bar Chart • Grouped / Clustered Bars • Stacked / Subdivided Bar Charts • Percentage Component Bar Chart • Comparative YoY Growth

- **Line Graphs & Multi-Series Trend Curves** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: DI] [BANKING: DI]
  Single and multi-line graphs, continuous time-series trend analysis, YoY & CAGR growth curves, intersecting lines and break-even comparison points.
  *Key Concepts & Entities*: Line Graph • Multi-Line Comparison • Continuous Time Series • YoY Trend Curves • Intersecting Data Lines

- **Pie Charts (Percentage & Degree Distribution)** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: DI] [BANKING: DI]
  Single circular distribution charts, percentage-based vs degree-based (360 deg) sector angle conversions, dual/comparative pie charts across years or categories.
  *Key Concepts & Entities*: Single Pie Chart • Degree to Percentage Conversion (3.6 deg = 1%) • Dual Comparative Pie Charts • Sector Value Calculations • Multi-Tier Circular Distribution

- **Mixed Graphs & Multi-Axis Combinations** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: DI] [BANKING: DI]
  Hybrid multi-format visualizations (Bar + Line combo charts, Table + Pie chart combinations), dual vertical axis (Y1 and Y2) with different units and scales.
  *Key Concepts & Entities*: Mixed Charts (Bar + Line) • Dual Y-Axis Plots • Table and Pie Combinations • Volume vs Percentage Mix • Hybrid Multi-Layer Graphs

- **Caselet DI & Textual Paragraph Data** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: DI] [BANKING: DI]
  Unstructured paragraph caselets, converting complex textual descriptions into structured tables or mathematical models, variable-driven algebraic caselets.
  *Key Concepts & Entities*: Caselet DI (Paragraph Data) • Tabular Structuring of Text • Variable-Driven Caselets • Arithmetic Word Caselets

- **Venn Diagram-Based DI & Set Caselets** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: DI] [BANKING: DI]
  Visual and numerical representation of datasets using 2-set, 3-set, and 4-set Venn diagrams; calculating exclusive category values ('Only A', 'Only B and C'), total intersections, survey data analysis, and maxima/minima in set overlaps.
  *Key Concepts & Entities*: Venn Diagram Data Interpretation • 2-Set Venn Calculations • 3-Set Venn Overlaps • Exclusive Regions ('Only A') • Survey Dataset Deductions • Overlap Maxima and Minima

- **Radar, Spider & Scatter Plots** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: DI] [BANKING: DI]
  Multi-dimensional radial spider/web charts, triangular coordinate plots, scatter plots showing distribution and correlation between two quantitative variables.
  *Key Concepts & Entities*: Radar / Spider Chart • Radial Axis Grid • Triangular Coordinate Charts • Scatter Plots • Multi-Dimensional Performance Mapping

- **Data Sufficiency (Arithmetic, Algebraic & Logical Statements)** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Determining whether Statement 1 alone, Statement 2 alone, both statements together, or neither statement is sufficient to answer questions in algebra, geometry, order/ranking, or kinship.
  *Key Concepts & Entities*: Two-Statement Data Sufficiency • Three-Statement Data Sufficiency • Sufficiency Decision Matrix (A/B/C/D/E) • Arithmetic & Algebraic DS • Reasoning & Direction DS

### Problem Solving & Pattern Recognition
*(Coding, Series & Puzzles - Coding-Decoding, Number Series, Letter Series, Matrix & Grid Puzzles, Ranking & Ordering, Cube Folding & Dice)*

- **Number, Letter & Alphanumeric Symbol Series** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Arithmetic, geometric, alternating, square/cube, difference-of-differences numerical series; alphabetical step series, alphanumeric sequence with symbols and conditional filters.
  *Key Concepts & Entities*: Difference of Differences Series • Alternating Number Series • Square and Cube Series • Alphabet Progression Series • Alpha-Numeric Symbol Sequences

- **Coding-Decoding & Substitution Logic** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Letter-to-letter shifting (forward/reverse alphabetical positions), letter-to-number substitution, symbol coding, fictitious language / Chinese coding, matrix coordinate coding.
  *Key Concepts & Entities*: Letter Positional Shifting • Reverse Alphabet Coding • Fictitious Language Coding (Word Substitution) • Matrix Coding & Decryption

- **Order, Ranking & Comparative Inequalities** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Calculating total people in a queue from left/right ranks, interchanging positions, overlapping ranking, chain inequalities (A > B >= C = D) and deduced relations.
  *Key Concepts & Entities*: Single-Row Position Ranking • Interchanging Positions in Queue • Overlapping vs Non-overlapping Ranks • Coded Inequalities

- **Cubes & Dice (Opposite Faces, Nets & Painted Slices)** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Standard vs ordinary dice, identifying opposite faces from 2 or more dice positions, unfolded dice nets folding rules, painted cube slicing (faces painted on 3, 2, 1, 0 sides).
  *Key Concepts & Entities*: Standard vs Non-Standard Dice • Adjacent and Opposite Faces of Dice • Unfolded Dice Nets • Painted Cube Slicing Formulas n^3

- **Non-Verbal Reasoning & Visual Patterns** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  Horizontal and vertical mirror images, water reflections, paper folding and punch hole patterns, embedded figures, figure matrix completion, geometric figure series.
  *Key Concepts & Entities*: Mirror Images & Inversions • Water Reflection Logic • Paper Folding & Hole Punching • Embedded Hidden Figures • Figure Matrix & Series Completion

- **Mathematical Operators & Cryptarithmetic Puzzles** [UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [BANKING: Reasoning]
  BODMAS evaluation after interchanging signs and numbers, balancing equations, alphabetic cryptarithmetic arithmetic puzzles (letter substitution for digits 0-9).
  *Key Concepts & Entities*: BODMAS Sign Interchange • Balancing Equations • Symbolic Math Operators • Cryptarithmetic Letter Puzzles

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