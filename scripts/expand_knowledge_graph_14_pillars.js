const fs = require('fs');
const path = require('path');

const mdPath = path.join(__dirname, '..', 'knowledge_graph.md');
let md = fs.readFileSync(mdPath, 'utf-8');

// 1. Update Top Canonical Subject Overview (lines 80-95)
const oldPillarsOverview = `11. **Ethics, Integrity & Aptitude** \`[UPSC: Mains-GS4] [KAS: Mains-GS4]\`
12. **General Mental Ability, Quantitative Aptitude & Comprehension** \`[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]\``;

const newPillarsOverview = `11. **Ethics, Integrity & Aptitude** \`[UPSC: Mains-GS4] [KAS: Mains-GS4]\`
12. **General Mental Ability, Quantitative Aptitude & Comprehension** \`[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]\`
13. **Educational Psychology, Child Development & Teaching Pedagogy** \`[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]\`
14. **Language Proficiency, Grammar & Communication (General Kannada & General English)** \`[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]\``;

md = md.replace(oldPillarsOverview, newPillarsOverview);

// 2. Add Karnataka Gram Swaraj & Panchayat Raj System into Section 5 (Polity & Governance)
const Section5Target = `- Governance, Administration & Public Policy in Karnataka \`[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]\``;
const Section5Addition = `- Governance, Administration & Public Policy in Karnataka \`[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]\`
- Karnataka Gram Swaraj & Panchayat Raj System \`[KAS: Prelims-P1, Mains-GS2] [KEA: PDO, VAO] [State-PSC: General Studies]\``;

md = md.replace(Section5Target, Section5Addition);

const Section5DeepTarget = `Governance, Administration & Public Policy in Karnataka \`[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]\`

- State Secretariat & Executive Framework (Chief Secretary as Administrative Head, Secretariat Structure, Divisional Commissioners & Revenue Divisions, Deputy Commissioner / District Magistrate Role & Responsibilities, Sub-Divisional Officers & Tahsildars, Revenue Hierarchy)
- Decentralized Governance & Panchayati Raj in Karnataka (Abdul Nazir Sab Legacy; 1983 & 1993 Acts; Landmark 2015 Amendments; 3-Tier Structure - Gram, Taluk, Zilla Panchayats; 50% Women Reservation; Standing Committees, Social Audit, Ward Sabha & Gram Sabha Empowerment; Bruhat Bengaluru Mahanagara Palike / BBMP Act 2020)
- Article 371J Special Constitutional Provisions (Hyderabad-Karnataka / Kalyana Karnataka Region; 98th Constitutional Amendment Act 2012; Kalyana Karnataka Regional Development Board / KKRDB; Educational Reservations & Local Cadre Public Employment Quotas in 7 Districts - Bidar, Kalaburagi, Yadgir, Raichur, Koppal, Ballari, Vijayanagara)
- State Anti-Corruption & Accountability Architecture (Karnataka Lokayukta - Karnataka Lokayukta Act 1984, Upalokayuktas, Anti-Corruption Bureau / ACB Restructuring & High Court Judgment Restoring Lokayukta Police Powers; Karnataka Public Service Commission / KPSC Constitutional Mandate; Administrative Reforms Commissions - KARC-I & KARC-II / P.B. Mahishi & T.M. Vijay Bhaskar Committees)
- Public Service Delivery, Transparency & Digital Governance (Karnataka Guarantee of Services to Citizens Act 2011 / Sakala Act - Statutory Timelines & Compensatory Penalties for Over 1,000+ Services; Citizen Charters; Janaspandana Citizen Grievance Portal; Mahiti Hakku / RTI Implementation)
- Landmark E-Governance Platforms in Karnataka (Bhoomi - Digital Land Records & RTC; Khajane II - Integrated Financial Management System; Seva Sindhu - Unified Citizen Service Delivery Portal; FRUITS - Farmer Registration and Unified Beneficiary Information System; Kutumba - Social Entitlement & Beneficiary Registry; e-Parihara - Direct Disaster Compensation Disbursement; e-Kshana - Real-time Caste & Income Certificates; Bhu-Suraksha - Drone Land Resurvey)`;

const Section5DeepAddition = `Governance, Administration & Public Policy in Karnataka \`[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]\`

- State Secretariat & Executive Framework (Chief Secretary as Administrative Head, Secretariat Structure, Divisional Commissioners & Revenue Divisions, Deputy Commissioner / District Magistrate Role & Responsibilities, Sub-Divisional Officers & Tahsildars, Revenue Hierarchy)
- Decentralized Governance & Panchayati Raj in Karnataka (Abdul Nazir Sab Legacy; 1983 & 1993 Acts; Landmark 2015 Amendments; 3-Tier Structure - Gram, Taluk, Zilla Panchayats; 50% Women Reservation; Standing Committees, Social Audit, Ward Sabha & Gram Sabha Empowerment; Bruhat Bengaluru Mahanagara Palike / BBMP Act 2020)
- Article 371J Special Constitutional Provisions (Hyderabad-Karnataka / Kalyana Karnataka Region; 98th Constitutional Amendment Act 2012; Kalyana Karnataka Regional Development Board / KKRDB; Educational Reservations & Local Cadre Public Employment Quotas in 7 Districts - Bidar, Kalaburagi, Yadgir, Raichur, Koppal, Ballari, Vijayanagara)
- State Anti-Corruption & Accountability Architecture (Karnataka Lokayukta - Karnataka Lokayukta Act 1984, Upalokayuktas, Anti-Corruption Bureau / ACB Restructuring & High Court Judgment Restoring Lokayukta Police Powers; Karnataka Public Service Commission / KPSC Constitutional Mandate; Administrative Reforms Commissions - KARC-I & KARC-II / P.B. Mahishi & T.M. Vijay Bhaskar Committees)
- Public Service Delivery, Transparency & Digital Governance (Karnataka Guarantee of Services to Citizens Act 2011 / Sakala Act - Statutory Timelines & Compensatory Penalties for Over 1,000+ Services; Citizen Charters; Janaspandana Citizen Grievance Portal; Mahiti Hakku / RTI Implementation)
- Landmark E-Governance Platforms in Karnataka (Bhoomi - Digital Land Records & RTC; Khajane II - Integrated Financial Management System; Seva Sindhu - Unified Citizen Service Delivery Portal; FRUITS - Farmer Registration and Unified Beneficiary Information System; Kutumba - Social Entitlement & Beneficiary Registry; e-Parihara - Direct Disaster Compensation Disbursement; e-Kshana - Real-time Caste & Income Certificates; Bhu-Suraksha - Drone Land Resurvey)

Karnataka Gram Swaraj & Panchayat Raj System \`[KAS: Prelims-P1, Mains-GS2] [KEA: PDO, VAO] [State-PSC: General Studies]\`

- Evolution & Constitutional Architecture of Karnataka PRIs (Kondajji Basappa Committee 1974, Abdul Nazir Sab Vision 1983 Act, Conformance to 73rd Constitutional Amendment Act 1992, Enactment of Karnataka Panchayat Raj Act 1993, Re-naming as Karnataka Gram Swaraj and Panchayat Raj Act 2015)
- Legal Architecture & 21 Chapters of the 1993 Act (Chapter I to XXI Detailed Framework - Definitions, Ward Sabha & Gram Sabha Constitutions, Gram Panchayat Composition & Functioning, Staffing & PDO Powers, Property Tax Levy, Appeals, Dispute Resolutions, State Election Commission Oversight)
- Landmark 2015 S.G. Ramesh Kumar Committee Amendments (Statutory Ward Sabhas, Mandatory Citizen Charters, Functional Devolution of 29 Subjects, Entrusted Functions & Discretionary Functions, Two-Child Norm Removal, Compulsory Voting Provisions & Literacy Disqualifications)
- Three-Tier PRI Structure, Powers & Functions (Gram Panchayat - Sarpanch/Adhyaksha, Upadhyaksha, Panchayat Development Officer / PDO & Secretary, Grama Sabha Quorum, Standing Committees: Production, Social Justice, Amenities; Taluk Panchayat - Taluk Adhyaksha, Executive Officer / EO, Taluk Planning Committee; Zilla Panchayat - ZP Adhyaksha, Chief Executive Officer / CEO, Standing Committees: Finance & Audit, Education & Health, Agriculture & Industry, Social Justice)
- PRI Financial Architecture, Taxation & Social Audits (Own Source Revenue - Property Tax, Trade License Fees, Water Rates; State Finance Commission / SFC Transfers; Central Finance Commission / 15th FC Grants; Gram Panchayat Accounts, e-Swathu Software for Property Registration, Panchatantra 2.0 Accounting Software, Bapuji Seva Kendra / BSK Delivery, Social Audit Directorates)
- Flagship Rural Development & Empowerment Schemes (Mahatma Gandhi National Rural Employment Guarantee Scheme / MGNREGS - 100 Days Guaranteed Wage Employment, Social Audits; Pradhan Mantri Awas Yojana - Gramin / PMAY-G - Housing for All; Swachh Bharat Mission - Gramin / SBM-G - ODF Plus Status, Solid & Liquid Waste Management / SLWM; Jal Jeevan Mission / JJM - Functional Household Tap Connections; National Rural Livelihood Mission / NRLM - Sanjeevini Self Help Groups; Pradhan Mantri Gram Sadak Yojana / PMGSY; Deen Dayal Upadhyaya Grameen Kaushalya Yojana / DDU-GKY)`;

md = md.replace(Section5DeepTarget, Section5DeepAddition);

// 3. Add Computer Awareness & ICT Literacy into Section 9 (Science, Tech & Defence)
const Section9Target = `- Emerging Technologies & Future Frontiers \`[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]\``;
const Section9Addition = `- Emerging Technologies & Future Frontiers \`[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]\`
- Computer Awareness, Information Technology & Cyber Literacy \`[SSC: CGL-Tier2] [KEA: VAO, CTI, FDA] [Banking: Computer] [KSET: ICT]\``;

md = md.replace(Section9Target, Section9Addition);

const Section9DeepTarget = `Emerging Technologies & Future Frontiers \`[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]\`

- Artificial Intelligence, Machine Learning & Deep Learning (Generative AI, Large Language Models / LLMs, Neural Networks, Natural Language Processing / NLP, Computer Vision, Ethics of AI, Algorithmic Bias)
- Robotics & Automation (Industrial Robotics, Collaborative Robots / Cobots, Autonomous Systems, Unmanned Aerial Vehicles / UAVs & Drones, Drone Rules 2021)
- Nanotechnology & Advanced Materials (Nanoparticles, Carbon Nanotubes, Graphene, Metamaterials, Quantum Dots, Applications in Medicine / Targeted Drug Delivery, Electronics, Energy Storage)
- Supercomputing, Quantum Computing & Semiconductors (National Supercomputing Mission / NSM - PARAM Series; Quantum Computing Principles - Superposition, Qubits, Quantum Entanglement; India Semiconductor Mission / ISM, Silicon Photonics)
- Blockchain Technology & Distributed Ledgers (Consensus Mechanisms - Proof of Work / Proof of Stake; Cryptography; Smart Contracts, Decentralized Finance / DeFi, Central Bank Digital Currency / CBDC - Digital Rupee / e₹)
- Big Data, Cloud Computing & Edge Computing (Data Lakes, Cloud Service Models - IaaS, PaaS, SaaS; Edge AI, Fog Computing, Internet of Things / IoT, Industrial IoT / Industry 4.0)`;

const Section9DeepAddition = `Emerging Technologies & Future Frontiers \`[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]\`

- Artificial Intelligence, Machine Learning & Deep Learning (Generative AI, Large Language Models / LLMs, Neural Networks, Natural Language Processing / NLP, Computer Vision, Ethics of AI, Algorithmic Bias)
- Robotics & Automation (Industrial Robotics, Collaborative Robots / Cobots, Autonomous Systems, Unmanned Aerial Vehicles / UAVs & Drones, Drone Rules 2021)
- Nanotechnology & Advanced Materials (Nanoparticles, Carbon Nanotubes, Graphene, Metamaterials, Quantum Dots, Applications in Medicine / Targeted Drug Delivery, Electronics, Energy Storage)
- Supercomputing, Quantum Computing & Semiconductors (National Supercomputing Mission / NSM - PARAM Series; Quantum Computing Principles - Superposition, Qubits, Quantum Entanglement; India Semiconductor Mission / ISM, Silicon Photonics)
- Blockchain Technology & Distributed Ledgers (Consensus Mechanisms - Proof of Work / Proof of Stake; Cryptography; Smart Contracts, Decentralized Finance / DeFi, Central Bank Digital Currency / CBDC - Digital Rupee / e₹)
- Big Data, Cloud Computing & Edge Computing (Data Lakes, Cloud Service Models - IaaS, PaaS, SaaS; Edge AI, Fog Computing, Internet of Things / IoT, Industrial IoT / Industry 4.0)

Computer Awareness, Information Technology & Cyber Literacy \`[SSC: CGL-Tier2] [KEA: VAO, CTI, FDA] [Banking: Computer] [KSET: ICT]\`

- Computer Hardware Architecture & Components (Central Processing Unit / CPU - ALU, Control Unit, Registers, Clock Speed; Memory Hierarchy - Primary Memory: RAM / SRAM, DRAM, ROM / PROM, EPROM, EEPROM, Cache Memory L1/L2/L3, Virtual Memory; Secondary Storage - HDD, SSD / NVMe, Optical Discs, Flash Drives; Input & Output Devices - Keyboards, Optical Scanners, Biometric Sensors, Printers: Impact vs Non-Impact, Plotters, Displays: LCD, OLED; Motherboard Architecture & Expansion Buses: PCI, USB, HDMI)
- Operating Systems, File Systems & System Utilities (OS Fundamentals - Functions of OS, Batch Processing, Multiprogramming, Multitasking, Time-Sharing, Real-Time OS; Popular OS Architectures - Microsoft Windows 10/11, Linux Kernel & Distros: Ubuntu, Fedora, Unix, Apple macOS, Android, iOS; File Systems - NTFS, FAT32, ext4, APFS; System Management - Device Drivers, Task Manager, Disk Defragmenter, BIOS/UEFI, System Booting Process)
- Office Productivity Suites & Document Processing (Word Processing - MS Word & Google Docs: Formatting, Mail Merge, Tables, Macros, Header/Footer; Spreadsheets - MS Excel & Google Sheets: Cells, Ranges, Formulas: SUM, AVERAGE, VLOOKUP, XLOOKUP, INDEX-MATCH, IF-ELSE, Pivot Tables, Charts, Data Sorting & Filtering; Presentation Software - MS PowerPoint & Google Slides: Slide Transitions, Animations, Slide Master; Database Management Basics - MS Access & SQL: Relational Tables, Queries, Primary & Foreign Keys)
- Computer Networking, Internet Protocols & Web Technologies (Network Topology - Star, Bus, Ring, Mesh, Tree, Hybrid; Network Types - LAN, WAN, MAN, PAN, WLAN, VPN; OSI 7-Layer Model & TCP/IP 4-Layer Model; Network Protocols - HTTP/HTTPS, FTP, SMTP, POP3, IMAP, DNS, DHCP, IPv4 vs IPv6 Addressing, MAC Address; Web Architecture - Client-Server Model, URLs, Web Browsers, Search Engines, HTML5, CSS3, JavaScript Basics, Cookies & Caching)
- Cyber Security, Threats & Defensive Countermeasures (Cyber Threats & Attack Vectors - Viruses, Worms, Trojan Horses, Spyware, Adware, Ransomware, Keyloggers, Rootkits, Botnets; Cyber Attacks - Phishing, Vishing, Smishing, Denial of Service / DoS & DDoS, Man-in-the-Middle / MitM, SQL Injection, Zero-Day Exploits; Cyber Defences - Firewalls, Anti-virus/Anti-malware Suites, Intrusion Detection Systems / IDS, Cryptographic Techniques: Symmetric vs Asymmetric Encryption, Public/Private Key, Digital Signatures, SSL/TLS Certificates, Two-Factor Authentication / 2FA; Legal Framework - Information Technology Act 2000 & 2008 Amendments, Section 66A repeal, National Cyber Security Policy, CERT-In, Digital Personal Data Protection / DPDP Act 2023)`;

md = md.replace(Section9DeepTarget, Section9DeepAddition);

// 4. Add Pillar 13 & Pillar 14 at the end of Section 12
const Section12EndTarget = `General Mental Ability & Logical Reasoning \`[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [Banking: Reasoning]\`

- Logical & Analytical Reasoning (Deductive Logic - Syllogisms / Venn Diagram & Rules Method, Logical Deductions; Spatial & Relational Logic - Linear & Circular Seating Arrangements, Blood Relations & Family Trees, Direction Sense & Compass Problems, Clocks & Calendar Calculations)
- Data Interpretation & Data Sufficiency (Data Formats - Bar Charts, Pie Charts, Line Graphs, Data Tables, Mixed Graphs; Data Sufficiency - Evaluating Sufficiency of Given Statements to Answer Questions)
- Problem Solving & Pattern Recognition (Coding, Series & Puzzles - Coding-Decoding, Number Series, Letter Series, Matrix & Grid Puzzles, Ranking & Ordering, Cube Folding & Dice)`;

const Section13And14Full = `General Mental Ability & Logical Reasoning \`[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Reasoning] [Banking: Reasoning]\`

- Logical & Analytical Reasoning (Deductive Logic - Syllogisms / Venn Diagram & Rules Method, Logical Deductions; Spatial & Relational Logic - Linear & Circular Seating Arrangements, Blood Relations & Family Trees, Direction Sense & Compass Problems, Clocks & Calendar Calculations)
- Data Interpretation & Data Sufficiency (Data Formats - Bar Charts, Pie Charts, Line Graphs, Data Tables, Mixed Graphs; Data Sufficiency - Evaluating Sufficiency of Given Statements to Answer Questions)
- Problem Solving & Pattern Recognition (Coding, Series & Puzzles - Coding-Decoding, Number Series, Letter Series, Matrix & Grid Puzzles, Ranking & Ordering, Cube Folding & Dice)

==================================================
13. EDUCATIONAL PSYCHOLOGY, CHILD DEVELOPMENT & TEACHING PEDAGOGY \`[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]\`
==================================================

Educational Psychology, Child Development & Teaching Pedagogy

- Child Development & Growth Dynamics
- Theories of Learning, Cognition & Intelligence
- Inclusive Education, Diverse Learners & Special Needs (CWSN)
- Pedagogical Strategies, Curriculum & Classroom Management
- Educational Assessment, Evaluation & Measurement
- National Educational Policies, Legal Frameworks & Teacher Aptitude

Child Development & Growth Dynamics \`[Teaching: KARTET, GPSTR, HSTR, CTET]\`

- Concept of Growth & Development (Principles of Development - Cephalocaudal & Proximodistal Trends, Continuity, Individual Differences, Inter-relation; Stages of Human Development - Infancy, Early Childhood, Middle Childhood, Adolescence: Physical, Motor, Social, Emotional & Cognitive Milestones)
- Heredity & Environmental Determinants (Nature vs Nurture Debate, Role of Genetics & Heredity, Environmental Factors - Family, Parenting Styles, Schooling, Peer Groups, Socio-Economic Context, Bronfenbrenner's Ecological Systems Theory)
- Socialization Processes & Moral Growth (Agents of Socialization - Family, School, Peer Groups, Mass Media; Developing Self-Concept, Gender Identity & Stereotypes; Adolescent Dynamics - Identity vs Role Confusion / Erik Erikson, Emotional Turmoil, Peer Pressure & Career Orientation)

Theories of Learning, Cognition & Intelligence \`[Teaching: KARTET, GPSTR, HSTR, CTET]\`

- Cognitive Development Theories (Jean Piaget - Stages: Sensorimotor, Pre-operational, Concrete Operational, Formal Operational; Schemas, Assimilation, Accommodation, Equilibration; Lev Vygotsky - Socio-Cultural Perspective, Zone of Proximal Development / ZPD, Scaffolding, More Knowledgeable Other / MKO, Private Speech)
- Moral Development Frameworks (Lawrence Kohlberg - Pre-Conventional, Conventional, Post-Conventional Stages; Carol Gilligan Ethics of Care Critique)
- Behavioral & Constructivist Learning Paradigms (Ivan Pavlov Classical Conditioning - Stimulus, Response, Extinction; B.F. Skinner Operant Conditioning - Reinforcement & Punishment Schedules; Edward Thorndike Connectionism / Laws of Learning - Readiness, Exercise, Effect; Constructivist Learning - Jerome Bruner Discovery Learning, Representation Modes: Enactive, Iconic, Symbolic; Albert Bandura Social Learning Theory - Modeling, Observational Learning, Vicarious Reinforcement)
- Theories of Intelligence & Creativity (Charles Spearman Two-Factor Theory - General 'g' & Specific 's' factors; Howard Gardner Theory of Multiple Intelligences - 8 Intelligences: Linguistic, Logical-Mathematical, Spatial, Bodily-Kinesthetic, Musical, Interpersonal, Intrapersonal, Naturalistic; Robert Sternberg Triarchic Theory - Analytical, Creative, Practical; Emotional Intelligence in Education - Daniel Goleman Model; Creativity - Convergent vs Divergent Thinking, Fostering Innovation in Classrooms)

Inclusive Education, Diverse Learners & Special Needs (CWSN) \`[Teaching: KARTET, GPSTR, HSTR, CTET]\`

- Philosophy of Inclusive Education (Transition from Segregation & Integration to Mainstream Inclusion; Barrier-Free Environment; Universal Design for Learning / UDL; Equity vs Equality in Classrooms)
- Addressing Specific Learning Disabilities & Neurodiversity (Dyslexia - Reading Difficulty, Dysgraphia - Writing Impairment, Dyscalculia - Mathematical Disability, Dyspraxia - Motor Skills, Attention Deficit Hyperactivity Disorder / ADHD, Autism Spectrum Disorder / ASD)
- Educating Gifted, Talented & Underprivileged Learners (Identification of Gifted & Creative Children - Enriched Curriculum, Acceleration, Talent Search; Socio-Economically Disadvantaged Groups / SEDGs, First-Generation Learners, Gender Sensitization in Schooling)

Pedagogical Strategies, Curriculum & Classroom Management \`[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1]\`

- Teaching Methods & Models of Instruction (Teacher-Centered vs Learner-Centered Approaches; Problem-Based Learning / PBL, Project Method / William Kilpatrick, Inquiry-Based Learning, Collaborative & Cooperative Learning / Jigsaw Technique, Experiential Learning / David Kolb Cycle)
- Curriculum Planning & Taxonomy of Educational Objectives (Bloom's Revised Taxonomy - Cognitive Domain: Remembering, Understanding, Applying, Analyzing, Evaluating, Creating; Affective Domain / Krathwohl; Psychomotor Domain / Dave & Simpson; Micro-Teaching & Lesson Planning - 5E Model: Engage, Explore, Explain, Elaborate, Evaluate)
- Classroom Dynamics & Motivation Theories (Intrinsic vs Extrinsic Motivation; Abraham Maslow Hierarchy of Needs in Education; Self-Determination Theory; Classroom Management Strategies - Positive Behaviour Support / PBS, Restorative Practices, Conflict Resolution)

Educational Assessment, Evaluation & Measurement \`[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1]\`

- Assessment Paradigms (Assessment for Learning - Formative & Diagnostic Assessment; Assessment of Learning - Summative Evaluation; Assessment as Learning - Self & Peer Assessment; Continuous and Comprehensive Evaluation / CCE - Scholastic & Co-scholastic Domains)
- Tools & Techniques of Evaluation (Rubrics, Portfolios, Anecdotal Records, Cumulative Record Cards / CRC, Rating Scales, Checklists; Standardized vs Teacher-Made Tests; Test Construction - Reliability, Validity, Objectivity, Usability, Blueprint Preparation)
- Remedial Teaching & Feedback Mechanisms (Identifying Learning Gaps, Error Analysis, Tailored Remedial Interventions, Feedback Delivery - Specific, Timely & Actionable)

National Educational Policies, Legal Frameworks & Teacher Aptitude \`[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]\`

- National Education Policy 2020 (NEP 2020 Architecture - Foundational, Preparatory, Middle, Secondary 5+3+3+4 Stage Structure; Foundational Literacy & Numeracy / NIPUN Bharat Mission; Mother Tongue / Regional Language Medium; National Curriculum Framework / NCF-FS 2022 & NCF-SE 2023; PARAKH Assessment Centre; Higher Education Commission of India / HECI)
- Constitutional & Statutory Framework for Education (Article 21A Right to Free & Compulsory Education; Right of Children to Free and Compulsory Education Act 2009 / RTE Act - 25% EWS Reservation, Pupil-Teacher Ratio / PTR, No-Detention Policy & Amendment, School Management Committees / SMC; Protection of Children from Sexual Offences / POCSO Act 2012; Rights of Persons with Disabilities / RPwD Act 2016)
- Research & Teaching Aptitude for Higher Education / KSET / NET (Characteristics of Higher Education Teaching; Research Methodology - Qualitative vs Quantitative Methods, Experimental Research, Action Research, Sampling Techniques, Hypothesis Formulation, Academic Ethics, Citation Standards & Plagiarism Avoidance)

==================================================
14. LANGUAGE PROFICIENCY, GRAMMAR & COMMUNICATION (GENERAL KANNADA & GENERAL ENGLISH) \`[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]\`
==================================================

Language Proficiency, Grammar & Communication (General Kannada & General English)

- General Kannada Grammar & Structure (ಕನ್ನಡ ವ್ಯಾಕರಣ)
- Kannada Vocabulary, Usage & Idioms (ಶಬ್ದ ಸಂಪತ್ತು ಮತ್ತು ನುಡಿಗಟ್ಟುಗಳು)
- Kannada Literature, Authors & Sahitya Academy Awards (ಕನ್ನಡ ಸಾಹಿತ್ಯ ಪರಿಚಯ)
- Translation & Precis Writing (ಭಾಷಾಂತರ ಮತ್ತು ಸಂಕ್ಷೇಪಣ)
- General English Grammar & Syntax
- English Vocabulary, Idioms & Phrasal Verbs
- Reading Comprehension, Sentence Correction & Verbal Ability

General Kannada Grammar & Structure (ಕನ್ನಡ ವ್ಯಾಕರಣ) \`[KPSC: CTI, FDA, SDA] [KEA: VAO] [KAS: Compulsory-Lang]\`

- ವರ್ಣಮಾಲೆ ಮತ್ತು ಧ್ವನಿ ರಚನೆ (ಕನ್ನಡ ಅಕ್ಷರಮಾಲೆ - 49 ಅಕ್ಷರಗಳು: ಸ್ವರಗಳು 13, ಯೋಗವಾಹಗಳು 2, ವ್ಯಂಜನಗಳು 34; ವರ್ಗೀಯ ವ್ಯಂಜನಗಳು 25: ಅಲ್ಪಪ್ರಾಣ, ಮಹಾಪ್ರಾಣ, ಅನುನಾಸಿಕ; ಅವರ್ಗೀಯ ವ್ಯಂಜನಗಳು 9; ಹ್ರಸ್ವ ಸ್ವರ, ದೀರ್ಘ ಸ್ವರ, ಪ್ಲುತ ಸ್ವರ; ಸಂಧ್ಯಕ್ಷರಗಳು: ಐ, ಔ; ಗುಣಿತಾಕ್ಷರಗಳು ಮತ್ತು ಸಂಯುಕ್ತಾಕ್ಷರಗಳು / ಒತ್ತಕ್ಷರಗಳು: ಸಜಾತೀಯ, ವಿಜಾತೀಯ)
- ಸಂಧಿ ಪ್ರಕರಣ (ಕನ್ನಡ ಸಂಧಿಗಳು: ಲೋಪ ಸಂಧಿ, ಆಗಮ ಸಂಧಿ / ಯಕಾರಾಗಮ, ವಕಾರಾಗಮ, ಆದೇಶ ಸಂಧಿ / ಪ, ಬ, ಮ ಗಳಿಗೆ ವ, ಕ, ತ, ಪ ಗಳಿಗೆ ಗ, ದ, ಬ; ಸಂಸ್ಕೃತ ಸಂಧಿಗಳು: ಸವರ್ಣದೀರ್ಘ ಸಂಧಿ, ಗುಣ ಸಂಧಿ, ವೃದ್ಧಿ ಸಂಧಿ, ಯಣ್ ಸಂಧಿ, ಜಶ್ತ್ವ ಸಂಧಿ, ಶ್ಚುತ್ವ ಸಂಧಿ, ಅನುನಾಸಿಕ ಸಂಧಿ)
- ನಾಮಪದ ಮತ್ತು ವಿಭಕ್ತಿ ಪ್ರತ್ಯಯಗಳು (ನಾಮಪದಗಳ ಪ್ರಕಾರಗಳು: ರೂಢನಾಮ, ಅಂಕಿತನಾಮ, ಅನ್ವರ್ಥನಾಮ, ಭಾವನಾಮ, ಸರ್ವನಾಮ; ಲಿಂಗ, ವಚನ / ಏಕವಚನ-ಬಹುವಚನ; ವಿಭಕ್ತಿಗಳು ಮತ್ತು ಕಾರಕಾರ್ಥಗಳು: ಪ್ರಥಮಾ - ಕರ್ತೃ, ದ್ವಿತೀಯಾ - ಕರ್ಮ, ತೃತೀಯಾ - ಕರಣ, ಚತುರ್ಥಿ - ಸಂಪ್ರದಾನ, ಪಂಚಮೀ - ಅಪಾದಾನ, ಷಷ್ಠೀ - ಸಂಬಂಧ, ಸಪ್ತಮೀ - ಅಧಿಕರಣ, ಸಂಬೋಧನಾ ವಿಭಕ್ತಿ)
- ಸಮಾಸ ಪ್ರಕರಣ (ಸಮಾಸಗಳ ವಿಧಗಳು - ತತ್ಪುರುಷ ಸಮಾಸ, ಕರ್ಮಧಾರಯ ಸಮಾಸ, ದ್ವಿಗು ಸಮಾಸ, ಬಹುವ್ರೀಹಿ ಸಮಾಸ, ದ್ವಂದ್ವ ಸಮಾಸ, ಅಂಶಿ ಸಮಾಸ, ಗಮಕ ಸಮಾಸ, ಕ್ರಿಯಾ ಸಮಾಸ; ಪೂರ್ವಪದ, ಉತ್ತರಪದ, ಅನ್ಯಪದ ಪ್ರಾಧಾನ್ಯತೆ)
- ವಾಕ್ಯ ರಚನೆ ಮತ್ತು ಕರ್ತರಿ-ಕರ್ಮಣಿ ಪ್ರಯೋಗ (ಕ್ರಿಯಾಪದಗಳ ರಚನೆ - ಧಾತು, ಕಾಲಸೂಚಕ ಪ್ರತ್ಯಯ, ಆಖ್ಯಾತ ಪ್ರತ್ಯಯ; ಭೂತಕಾಲ, ವರ್ತಮಾನಕಾಲ, ಭವಿಷ್ಯತ್ಕಾಲ; ಪ್ರೇರಣಾರ್ಥಕ, ಸಂಭಾವನಾರ್ಥಕ, ನಿಷೇಧಾರ್ಥಕ ಕ್ರಿಯಾರೂಪಗಳು; ಕರ್ತರಿ ಪ್ರಯೋಗ ಮತ್ತು ಕರ್ಮಣಿ ಪ್ರಯೋಗ / 'ಅಲ್ಪಡು' ಧಾತು ಬಳಕೆ; ವಾಕ್ಯಗಳ ವಿಧಗಳು: ಸಾಮಾನ್ಯ ವಾಕ್ಯ, ಸಂಯೋಜಿತ ವಾಕ್ಯ, ಮಿಶ್ರ ವಾಕ್ಯ)

Kannada Vocabulary, Usage & Idioms (ಶಬ್ದ ಸಂಪತ್ತು ಮತ್ತು ನುಡಿಗಟ್ಟುಗಳು) \`[KPSC: CTI, FDA, SDA] [KEA: VAO]\`

- ತತ್ಸಮ-ತದ್ಭವ ಮತ್ತು ಶಬ್ದ ಮೂಲಗಳು (ಸಂಸ್ಕೃತ ಮೂಲ ತತ್ಸಮಗಳು ಮತ್ತು ಕನ್ನಡಕ್ಕೆ ಹೊಂದಿಕೊಂಡ ತದ್ಭವ ರೂಪಗಳು; ಅನ್ಯದೇಶ್ಯ ಶಬ್ದಗಳು: ಪರ್ಷಿಯನ್, ಅರೇಬಿಕ್, ಪೋರ್ಚುಗೀಸ್, ಇಂಗ್ಲಿಷ್ ಶಬ್ದಗಳು; ದೇಶ್ಯ ಶಬ್ದಗಳು)
- ಸಮಾನಾರ್ಥಕ, ನಾನಾರ್ಥಕ ಮತ್ತು ವಿರುದ್ಧ ಪದಗಳು (ಪರ್ಯಾಯ ಪದಕೋಶ, ನಾನಾರ್ಥ ಕೊಡುವ ಶಬ್ದಗಳು, ವಿರೋಧಾರ್ಥಕ ಶಬ್ದಗಳು, ಜೋಡುನುಡಿಗಳು / ಜೋಡುಪದಗಳು, ದ್ವಿರುಕ್ತಿಗಳು, ಅನುಕರಣಾವ್ಯಯಗಳು)
- ನುಡಿಗಟ್ಟುಗಳು ಮತ್ತು ಗಾದೆ ಮಾತುಗಳು (ಜನಪ್ರಿಯ ಕನ್ನಡ ನುಡಿಗಟ್ಟುಗಳ ಅರ್ಥ ವಿವರಣೆ, ಗಾದೆಗಳ ವಿಸ್ತರಣೆ ಮತ್ತು ತಾತ್ಪರ್ಯ, ಜನಪದ ನಾಣ್ಣುಡಿಗಳು, ಅರ್ಥವ್ಯತ್ಯಾಸ ತಿಳಿಸುವ ಪದಗಳು)
- ಅಲಂಕಾರ ಮತ್ತು ಛಂದಸ್ಸು (ಶಬ್ದಾಲಂಕಾರ: ಅನುಪ್ರಾಸ / ವೃತ್ಯಾನುಪ್ರಾಸ, ಛೇಕಾನುಪ್ರಾಸ; ಯಮಕ; ಚಿತ್ರಕವಿತೆ; ಅರ್ಥಾಲಂಕಾರ: ಉಪಮಾಲಂಕಾರ, ರೂಪಕಾಲಂಕಾರ, ದೃಷ್ಟಾಂತಾಲಂಕಾರ, ಉತ್ಪ್ರೇಕ್ಷಾಲಂಕಾರ, ಅರ್ಥಾಂತರನ್ಯಾಸಾಲಂಕಾರ; ಛಂದಸ್ಸು: ಮಾತ್ರಾಗಣ, ಅಕ್ಷರಗಣ, ಅಂಶಗಣ; ಕಂದ ಪದ್ಯ, ರಗಳೆ, ಷಟ್ಪದಿ: ಶರ, ಕುಸುಮ, ಭೋಗ, ಭಾಮಿನಿ, ವಾರ್ಧಕ, ಪರಿವರ್ಧಿನಿ; ವೃತ್ತಗಳು: ಉತ್ಪಲಮಾಲಾ, ಚಂಪಕಮಾಲಾ, ಶಾರ್ದೂಲವಿಕ್ರೀಡಿತ, ಮತ್ತೇಭವಿಕ್ರೀಡಿತ)

Kannada Literature, Authors & Sahitya Academy Awards (ಕನ್ನಡ ಸಾಹಿತ್ಯ ಪರಿಚಯ) \`[KPSC: CTI, FDA, SDA] [KAS: Prelims-P1, Mains-GS1]\`

- ಕನ್ನಡ ಸಾಹಿತ್ಯ ಚರಿತ್ರೆ ಮತ್ತು ಯುಗಗಳು (ಪೂರ್ವ ಹಳಗನ್ನಡ / ಕವಿರಾಜಮಾರ್ಗ, ಪಂಪ ಪೂರ್ವ ಯುಗ; ಹಳಗನ್ನಡ ಯುಗ / ಪಂಪ, ರನ್ನ, ಪೊನ್ನ, ಜನ್ನ, ನಾಗವರ್ಮ; ನಡುಗನ್ನಡ ಯುಗ / ವಚನ ಸಾಹಿತ್ಯ: ಬಸವೇಶ್ವರ, ಅಲ್ಲಮಪ್ರಭು, ಅಕ್ಕಮಹಾದೇವಿ, ಚನ್ನಬಸವಣ್ಣ; ಹರಿದಾಸ ಸಾಹಿತ್ಯ: ಪುರಂದರದಾಸರು, ಕನಕದಾಸರು, ವಿಜಯದಾಸರು; ರಗಳೆ & ಷಟ್ಪದಿ ಕವಿಗಳು: ಹರಿಹರ, ರಾಘವಾಂಕ, ಕುಮಾರವ್ಯಾಸ, ಚಾಮರಸ, ಲಕ್ಷ್ಮೀಶ; ಹೊಸಗನ್ನಡ ನವೋದಯ, ಪ್ರಗತಿಶೀಲ, ನವ್ಯ, ಬಂಡಾಯ ಮತ್ತು ದಲಿತ ಸಾಹಿತ್ಯ ಚಳವಳಿಗಳು)
- ಜ್ಞಾನಪೀಠ ಮತ್ತು ಕೇಂದ್ರ ಸಾಹಿತ್ಯ ಅಕಾಡೆಮಿ ಪ್ರಶಸ್ತಿ ಪುರಸ್ಕೃತರು (ಕನ್ನಡದ 8 ಜ್ಞಾನಪೀಠ ಪುರಸ್ಕೃತರು: ಕುವೆಂಪು, ದ.ರಾ. ಬೇಂದ್ರೆ, ಕೆ. ಶಿವರಾಮ ಕಾರಂತ, ಮಾಸ್ತಿ ವೆಂಕಟೇಶ ಅಯ್ಯಂಗಾರ್, ವಿ.ಕೃ. ಗೋಕಾಕ್, ಯು.ಆರ್. ಅನಂತಮೂರ್ತಿ, ಗಿರೀಶ್ ಕಾರ್ನಾಡ್, ಚಂದ್ರಶೇಖರ ಕಂಬಾರ; ಪ್ರಮುಖ ಕೃತಿಗಳು, ಕಾವ್ಯನಾಮಗಳು ಮತ್ತು ಬಿರುದುಗಳು)

Translation & Precis Writing (ಭಾಷಾಂತರ ಮತ್ತು ಸಂಕ್ಷೇಪಣ) \`[KSP: PSI-Paper1] [KAS: Compulsory-Lang] [KEA: VAO]\`

- English to Kannada Translation Principles (Contextual Translation vs Literal Translation, Technical & Administrative Terminology, Sentence Restructuring / SVO in English to SOV in Kannada, Translating Legal & Governance Idioms)
- Kannada to English Translation Principles (Grammatical Equivalence, Active Voice preference, Precision of Vocabulary, Paragraph Flow & Cohesion)
- Precis Writing & Comprehension (Summarization Methodology - 1/3rd Rule, Retaining Central Thesis, Elimination of Examples & Superfluous Details, Assigning Title; Passage Analysis & Direct Answer Framing)

General English Grammar & Syntax \`[SSC: English] [KPSC: CTI, FDA, SDA] [KEA: VAO] [Banking: English]\`

- Parts of Speech & Sentence Architecture (Nouns: Types, Countable/Uncountable, Plural Rules; Pronouns: Personal, Relative, Reflexive, Demonstrative; Adjectives & Degrees of Comparison; Adverbs: Time, Place, Manner, Frequency; Prepositions: Spatial, Temporal, Complex Prepositions; Conjunctions: Coordinating, Subordinating, Correlative; Interjections)
- Tenses, Verb Forms & Subject-Verb Agreement (Present, Past, Future Tense Sub-types - Simple, Continuous, Perfect, Perfect Continuous; Modal Auxiliaries - Can, Could, May, Might, Shall, Should, Will, Would, Must, Ought to; Subject-Verb Agreement Rules - Proximity, Collective Nouns, Indefinite Pronouns, Compound Subjects)
- Voice, Narration & Sentence Transformation (Active vs Passive Voice Conversion Rules across all tenses, Modals & Imperative sentences; Direct vs Indirect Speech / Narration - Tense backshifting, Reporting verbs, Pronoun & Time/Place adverbial shifts, Interrogative & Exclamatory conversions; Simple, Compound & Complex Sentence Transformations)

English Vocabulary, Idioms & Phrasal Verbs \`[SSC: English] [Banking: English] [KPSC: CTI, FDA, SDA] [KEA: VAO]\`

- Lexical Building Blocks (Root Words: Greek & Latin roots; Prefixes & Suffixes; Synonyms & Antonyms; Homonyms, Homophones & Commonly Confused Words; One-Word Substitutions)
- Idioms, Phrases & Phrasal Verbs (Popular Idiomatic Expressions with contextual meanings; Common Phrasal Verbs - Prepositional Verbs: Break down, Bring up, Call off, Carry out, Look into, Put up with, Turn down; Collocations in Business & Administrative English)

Reading Comprehension, Sentence Correction & Verbal Ability \`[SSC: English] [Banking: English] [UPSC: Prelims-CSAT] [KAS: Prelims-P2]\`

- Sentence Correction & Spotting Errors (Common Grammatical Errors - Dangling Modifiers, Redundancies, Misplaced Prepositions, Faulty Parallelism, Tense Inconsistencies, Double Negatives)
- Verbal Ability & Sentence Rearrangement (Para Jumbles / Sentence Reordering - Identifying Opening Sentences, Connecting Links, Pronoun References, Concluding Sentences; Cloze Test - Contextual Word Fillers; Sentence Completion & Double Fillers)`;

md = md.replace(Section12EndTarget, Section13And14Full);

fs.writeFileSync(mdPath, md, 'utf-8');
console.log('Successfully added Module 13 (Child Development & Pedagogy) and Module 14 (Language Proficiency) to knowledge_graph.md');
