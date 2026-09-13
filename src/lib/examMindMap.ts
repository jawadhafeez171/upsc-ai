import { getKnowledgeGraph } from './knowledgeGraph';

export interface MindMapNode {
    id: string;
    label: string;
    label_kn?: string;
    category: 'exam' | 'stage' | 'paper' | 'domain' | 'topic' | 'entity';
    badge?: string;
    weightage?: 'Very High' | 'High' | 'Medium';
    description?: string;
    entities?: string[];
    children?: MindMapNode[];
    color?: string;
    nodeCount?: number;
}

/**
 * Builds an exam-tailored Mind Map hierarchy pruned strictly to the specific examination syllabus.
 * Directly synchronized with official KPSC KAS Gazette & UPSC Civil Services Notification syllabi.
 */
export function getExamMindMap(examId: string): MindMapNode {
    switch (examId) {
        // ═══════════════════════════════════════════════════════════════
        // 1. KPSC KAS (GAZETTED PROBATIONERS) OFFICIAL SYLLABUS
        // ═══════════════════════════════════════════════════════════════
        case 'kpsc-kas':
            return {
                id: 'kas-root',
                label: 'KPSC KAS (Gazetted Probationers) Examination',
                label_kn: 'ಕೆಪಿಎಸ್‌ಸಿ ಕರ್ನಾಟಕ ಆಡಳಿತ ಸೇವೆ (ಗೆಜೆಟೆಡ್ ಪ್ರೊಬೇಷನರ್ಸ್)',
                category: 'exam',
                color: '#EA580C',
                children: [
                    {
                        id: 'kas-prelims',
                        label: '1. Preliminary Examination (Objective OMR)',
                        label_kn: '೧. ಪ್ರಿಲಿಮಿನರಿ ಪರೀಕ್ಷೆ (ಆಬ್ಜೆಕ್ಟಿವ್ ಮಾದರಿ)',
                        category: 'stage',
                        color: '#F59E0B',
                        children: [
                            {
                                id: 'kas-prelims-p1',
                                label: 'Paper I: General Studies (National & International) & Humanities',
                                label_kn: 'ಪತ್ರಿಕೆ ೧: ರಾಷ್ಟ್ರೀಯ-ಅಂತಾರಾಷ್ಟ್ರೀಯ ಜ್ಞಾನ & ಮಾನವಿಕ ಶಾಸ್ತ್ರಗಳು',
                                category: 'paper',
                                badge: '100 Qs · 200 Marks (2 Hours)',
                                weightage: 'Very High',
                                color: '#D97706',
                                children: [
                                    {
                                        id: 'kas-p1-curr',
                                        label: 'Current Events of National & International Importance',
                                        label_kn: 'ರಾಷ್ಟ್ರೀಯ ಮತ್ತು ಅಂತಾರಾಷ್ಟ್ರೀಯ ಪ್ರಚಲಿತ ಘಟನೆಗಳು',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Major Treaties & Summits', 'National Policies', 'Bilateral Accords', 'Awards & Honors', 'Government Portals']
                                    },
                                    {
                                        id: 'kas-p1-const',
                                        label: 'Indian Constitution & Political System',
                                        label_kn: 'ಭಾರತ ಸಂವಿಧಾನ ಮತ್ತು ರಾಜಕೀಯ ವ್ಯವಸ್ಥೆ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Preamble & Philosophy', 'Fundamental Rights (Articles 12-35)', 'Directive Principles (Articles 36-51)', 'Union & State Executive', 'Parliament & State Legislature', 'Judicial Review & Supreme Court', 'Article 371J Special Status']
                                    },
                                    {
                                        id: 'kas-p1-hist',
                                        label: 'History of India and Karnataka Heritage',
                                        label_kn: 'ಭಾರತ ಮತ್ತು ಕರ್ನಾಟಕ ಇತಿಹಾಸ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Indus Valley & Vedic Period', 'Mauryas, Guptas & Harsha', 'Kadambas, Badami Chalukyas, Rashtrakutas & Hoysalas', 'Vijayanagara Empire & Bahmani Kingdoms', 'Modern Mysore & Diwans', '1857 Revolt & Karnataka Freedom Struggle', 'Karnataka Unification Movement 1956']
                                    },
                                    {
                                        id: 'kas-p1-geo',
                                        label: 'Geography of India and Karnataka',
                                        label_kn: 'ಭಾರತ ಮತ್ತು ಕರ್ನಾಟಕ ಭೂಗೋಳ',
                                        category: 'domain',
                                        weightage: 'High',
                                        entities: ['Physiographic Divisions', 'River Systems (Krishna, Cauvery, Godavari)', 'Monsoon Dynamics & Agro-Climatic Zones', 'Mineral Resources & Industrial Belts', 'Western Ghats Ecology & Bio-hotspots']
                                    },
                                    {
                                        id: 'kas-p1-econ',
                                        label: 'Indian & State Economy - Planning & Development',
                                        label_kn: 'ಭಾರತ ಮತ್ತು ರಾಜ್ಯ ಅರ್ಥವ್ಯವಸ್ಥೆ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['National Income & State GDP', 'Five-Year Plans to NITI Aayog', 'Poverty Alleviation & Employment Schemes', 'Fiscal Policy, GST & Budgeting', 'Rural Development & PRIs']
                                    }
                                ]
                            },
                            {
                                id: 'kas-prelims-p2',
                                label: 'Paper II: State Importance, Science & Tech, Environment & GMA',
                                label_kn: 'ಪತ್ರಿಕೆ ೨: ರಾಜ್ಯ ಪ್ರಮುಖತೆ, ವಿಜ್ಞಾನ, ಪರಿಸರ ಮತ್ತು ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ',
                                category: 'paper',
                                badge: '100 Qs · 200 Marks (2 Hours)',
                                weightage: 'Very High',
                                color: '#0D9488',
                                children: [
                                    {
                                        id: 'kas-p2-state',
                                        label: 'Current Events of State Importance & Karnataka Schemes',
                                        label_kn: 'ರಾಜ್ಯ ಪ್ರಮುಖತೆಯ ಪ್ರಚಲಿತ ವಿದ್ಯಮಾನಗಳು',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Karnataka State Budget', 'Guarantee Schemes (Gruha Lakshmi, Yuva Nidhi, etc.)', 'Industrial & IT Policies of Karnataka', 'State Commissions & Reports']
                                    },
                                    {
                                        id: 'kas-p2-st',
                                        label: 'General Science & Technology',
                                        label_kn: 'ಸಾಮಾನ್ಯ ವಿಜ್ಞಾನ ಮತ್ತು ತಂತ್ರಜ್ಞಾನ',
                                        category: 'domain',
                                        weightage: 'High',
                                        entities: ['Space Technology (ISRO Missions)', 'Biotechnology & Genetic Engineering', 'Information & Communication Tech (ICT)', 'Renewable Energy & Nuclear Power', 'Public Health, Vaccines & Diseases']
                                    },
                                    {
                                        id: 'kas-p2-env',
                                        label: 'Environment & Ecology',
                                        label_kn: 'ಪರಿಸರ ಮತ್ತು ಜೀವಪರಿಸರ ವಿಜ್ಞಾನ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Ecosystem Dynamics & Biodiversity', 'National Parks & Wildlife Sanctuaries in Karnataka', 'Climate Change, COP Summits & Carbon Credits', 'Pollution Control & Waste Management Laws']
                                    },
                                    {
                                        id: 'kas-p2-gma',
                                        label: 'General Mental Ability & Data Interpretation',
                                        label_kn: 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ದತ್ತಾಂಶ ವಿವರಣೆ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Reading Comprehension', 'Logical Reasoning & Analytical Ability', 'Decision Making & Problem Solving', 'Basic Numeracy (Class X Level)', 'Data Interpretation (Charts, Graphs, Tables)']
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        id: 'kas-mains',
                        label: '2. Main Examination (Descriptive Written 1750 Marks)',
                        label_kn: '೨. ಮುಖ್ಯ ಪರೀಕ್ಷೆ (ವಿವರಣಾತ್ಮಕ ಲಿಖಿತ ೧೭೫೦ ಅಂಕಗಳು)',
                        category: 'stage',
                        color: '#2563EB',
                        children: [
                            {
                                id: 'kas-mains-qual',
                                label: 'Qualifying Papers: Compulsory Kannada & English (150 Marks Each)',
                                label_kn: 'ಅರ್ಹತಾ ಪತ್ರಿಕೆಗಳು: ಕಡ್ಡಾಯ ಕನ್ನಡ ಮತ್ತು ಇಂಗ್ಲಿಷ್ (ತಲಾ ೧೫೦ ಅಂಕಗಳು)',
                                category: 'paper',
                                badge: 'Qualifying Standard (SSLC/Class X)',
                                weightage: 'High',
                                color: '#6366F1',
                                children: [
                                    { id: 'kas-kannada-qual', label: 'Compulsory Kannada: Comprehension, Précis, Usage, Vocabulary, Essay', label_kn: 'ಕಡ್ಡಾಯ ಕನ್ನಡ: ಗದ್ಯ ಗ್ರಹಣ, ಸಂಕ್ಷೇಪಣ, ವ್ಯಾಕರಣ, ಶಬ್ದಕೋಶ, ಪ್ರಬಂಧ', category: 'domain', entities: ['ಕನ್ನಡ ಗದ್ಯ ಗ್ರಹಣ (Comprehension)', 'ಸಂಕ್ಷೇಪಣ ಲೇಖನ (Précis Writing)', 'ಕನ್ನಡ ವ್ಯಾಕರಣ ಮತ್ತು ನುಡಿಗಟ್ಟುಗಳು', 'ಕನ್ನಡ ಪ್ರಬಂಧ ಲೇಖನ (Short Essay)'] },
                                    { id: 'kas-english-qual', label: 'Compulsory English: Comprehension, Précis, Usage, Vocabulary, Essay', label_kn: 'ಕಡ್ಡಾಯ ಇಂಗ್ಲಿಷ್: Comprehension, Précis, Grammar & Short Essay', category: 'domain', entities: ['English Comprehension Passage', 'Précis Writing (1/3rd Rule)', 'Grammar, Tenses & Vocabulary', 'Short Essay Composition'] }
                                ]
                            },
                            {
                                id: 'kas-mains-essay',
                                label: 'Paper I: Essay (250 Marks - 3 Hours)',
                                label_kn: 'ಪತ್ರಿಕೆ ೧: ಪ್ರಬಂಧ (೨೫೦ ಅಂಕಗಳು)',
                                category: 'paper',
                                badge: '2 Essays · 125 Marks Each',
                                weightage: 'Very High',
                                color: '#EC4899',
                                children: [
                                    { id: 'kas-essay-sec1', label: 'Section 1: Topics of International / National Importance (125 Marks)', label_kn: 'ವಿಭಾಗ ೧: ರಾಷ್ಟ್ರೀಯ / ಅಂತಾರಾಷ್ಟ್ರೀಯ ವಿಷಯಗಳ ಪ್ರಬಂಧ', category: 'domain', entities: ['Geopolitics & Democracy', 'Economic Reforms & Inclusive Growth', 'Science, Ethics & Artificial Intelligence', 'Climate Action & Sustainable Development'] },
                                    { id: 'kas-essay-sec2', label: 'Section 2: Topics of State Importance / Local Importance (125 Marks)', label_kn: 'ವಿಭಾಗ ೨: ರಾಜ್ಯ / ಪ್ರಾದೇಶಿಕ ವಿಷಯಗಳ ಪ್ರಬಂಧ', category: 'domain', entities: ['Karnataka Socio-Economic Dynamics', 'Rural Development & Water Disputes (Cauvery/Krishna)', 'Education & Health Delivery in Karnataka', 'Culture, Heritage & Industrial Vision'] }
                                ]
                            },
                            {
                                id: 'kas-mains-gs1',
                                label: 'Paper II: General Studies 1 (250 Marks - 3 Hours)',
                                label_kn: 'ಪತ್ರಿಕೆ ೨: ಸಾಮಾನ್ಯ ಅಧ್ಯಯನ ೧ (೨೫೦ ಅಂಕಗಳು)',
                                category: 'paper',
                                badge: 'History, Society & Karnataka Economy',
                                weightage: 'Very High',
                                color: '#F97316',
                                children: [
                                    {
                                        id: 'kas-gs1-sec1',
                                        label: 'Section 1: History and Cultural Heritage (India & Karnataka)',
                                        label_kn: 'ವಿಭಾಗ ೧: ಭಾರತ ಮತ್ತು ಕರ್ನಾಟಕದ ಇತಿಹಾಸ & ಸಾಂಸ್ಕೃತಿಕ ಪರಂಪರೆ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        children: [
                                            { id: 'kas-gs1-u1', label: 'Unit 1: Cultural Heritage of India (Indus, Vedic, Sanskrit Literature, Art/Architecture)', label_kn: 'ಭಾಗ ೧: ಭಾರತದ ಸಾಂಸ್ಕೃತಿಕ ಪರಂಪರೆ', category: 'topic', entities: ['Indus & Vedic Civilizations', 'Ancient Sanskrit Literature', 'Science & Tech in Ancient India', 'Buddhist & Jain Art', 'Temple Architecture Schools'] },
                                            { id: 'kas-gs1-u2', label: 'Unit 2: Transforming Indian Society (Reforms & Reformers, Dalit Movements, Socialist Approach)', label_kn: 'ಭಾಗ ೨: ಭಾರತೀಯ ಸಮಾಜ ಪರಿವರ್ತನೆ', category: 'topic', entities: ['Socio-Religious Reform Movements', 'Raja Ram Mohan Roy, Phule, Periyar, Ambedkar', 'Dalit Movement & Backward Classes Struggle', 'Gram Swaraj & Bhoodan Movement'] },
                                            { id: 'kas-gs1-u3', label: 'Unit 3: From Kadambas to Hoysalas (Halmidi, Badami, Rashtrakutas, Belur Architecture)', label_kn: 'ಭಾಗ ೩: ಕದಂಬರಿಂದ ಹೊಯ್ಸಳರವರೆಗೆ', category: 'topic', entities: ['Kadambas & Halmidi Inscription', 'Badami Chalukya Cave Temples', 'Rashtrakutas (Ellora Kailashnath Temple)', 'Kavirajamarga Literature', 'Hoysala Architecture (Belur, Halebidu)'] },
                                            { id: 'kas-gs1-u4', label: 'Unit 4: Vijayanagara Empire & Thereafter (Vachana Movement, Bahmani, Hyder Ali, Tipu Sultan)', label_kn: 'ಭಾಗ ೪: ವಿಜಯನಗರ ಸಾಮ್ರಾಜ್ಯ ಮತ್ತು ನಂತರದ ಆಡಳಿತ', category: 'topic', entities: ['Vijayanagara Administration & Architecture', 'Vachana & Haridasa Movements', 'Bahmani & Adil Shahi of Bijapur', 'Keladi & Chitradurga Nayakas', 'Hyder Ali & Tipu Sultan Administration & Wars'] },
                                            { id: 'kas-gs1-u5', label: 'Unit 5: Modern Mysore (1799–1947) (Wodeyars, Dewans Progress, Armed Rebellions)', label_kn: 'ಭಾಗ ೫: ಆಧುನಿಕ ಮೈಸೂರು (೧೭೯೯–೧೯೪೭)', category: 'topic', entities: ['Krishnaraja Wodeyar III & IV', 'Dewans of Mysore (Rangacharlu, Seshadri Iyer, Sir M. Visvesvaraya, Mirza Ismail)', 'Armed Rebellions (Kittur Rani Chennamma, Sangolli Rayanna)', 'Nizam Rule in Hyderabad-Karnataka'] },
                                            { id: 'kas-gs1-u6', label: 'Unit 6: Freedom Movement in Karnataka and Unification (1885–1956)', label_kn: 'ಭಾಗ ೬: ಕರ್ನಾಟಕದಲ್ಲಿ ಸ್ವಾತಂತ್ರ್ಯ ಚಳವಳಿ & ಏಕೀಕರಣ', category: 'topic', entities: ['Nationalism in Karnataka', 'Belgaum Congress Session 1924 (Mahatma Gandhi)', 'Isur Rebellion & Vidurashwatha Tragedy', 'Karnataka Unification Movement (Alur Venkata Rao, Huilgol Narayana Rao)', 'Miller Committee Report (1919)'] }
                                        ]
                                    },
                                    {
                                        id: 'kas-gs1-sec2',
                                        label: 'Section 2: Social and Political Perspective',
                                        label_kn: 'ವಿಭಾಗ ೨: ಸಾಮಾಜಿಕ ಮತ್ತು ರಾಜಕೀಯ ದೃಷ್ಟಿಕೋನ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        children: [
                                            { id: 'kas-gs1-s2-u1', label: 'Unit 1: Post-Independent Karnataka (Backward Class Commissions, Dalit & Farmers Movements)', label_kn: 'ಭಾಗ ೧: ಸ್ವಾತಂತ್ರ್ಯೋತ್ತರ ಕರ್ನಾಟಕ', category: 'topic', entities: ['Havanur Commission', 'Venkataswamy Commission', 'Chinnappa Reddy Commission', 'Dalit & Farmers Movements (Nanjundaswamy)', 'Land Reforms Act 1974 (Devaraj Urs)', 'Gokak Movement & Mahajan Report', 'Nanjundappa Regional Disparity Committee'] },
                                            { id: 'kas-gs1-s2-u2', label: 'Unit 2: Social Change & Movements (Theories of Social Structure & Directed Policy)', label_kn: 'ಭಾಗ ೨: ಸಾಮಾಜಿಕ ಬದಲಾವಣೆ', category: 'topic', entities: ['Social Structure & Theories of Change', 'Directed Social Change Policies', 'Backward Classes Empowerment'] },
                                            { id: 'kas-gs1-s2-u3', label: 'Unit 3: Social Change & Modernisation (Sanskritisation, Westernisation, Naxalism)', label_kn: 'ಭಾಗ ೩: ಆಧುನೀಕರಣ ಮತ್ತು ಸವಾಲುಗಳು', category: 'topic', entities: ['M.N. Srinivas (Sanskritisation & Dominant Caste)', 'Westernisation & Urbanisation', 'Role Conflicts & Changing Status of Women', 'Social Evils, Corruption & Naxalism in Karnataka'] },
                                            { id: 'kas-gs1-s2-u4', label: 'Unit 4: Government and Political System in Karnataka', label_kn: 'ಭಾಗ ೪: ಕರ್ನಾಟಕ ಸರ್ಕಾರದ ರಾಜಕೀಯ ವ್ಯವಸ್ಥೆ', category: 'topic', entities: ['Bicameral Legislature in Karnataka', 'Coalition Politics & Party Composition', 'Judiciary & High Court of Karnataka'] },
                                            { id: 'kas-gs1-s2-u5', label: 'Unit 5: Decentralisation of Power (Union/State Relations, Panchayati Raj, Regionalism)', label_kn: 'ಭಾಗ ೫: ಅಧಿಕಾರ ವಿಕೇಂದ್ರೀಕರಣ & ಪಂಚಾಯತ್ ರಾಜ್', category: 'topic', entities: ['Centre-State Administrative & Fiscal Relations', 'Karnataka Gram Swaraj & PR Act', 'Regionalism & Inter-State Disputes'] },
                                            { id: 'kas-gs1-s2-u6', label: 'Unit 6: Socio-Economic System & Globalization Impact', label_kn: 'ಭಾಗ ೬: ಸಾಮಾಜಿಕ-ಆರ್ಥಿಕ ವ್ಯವಸ್ಥೆ', category: 'topic', entities: ['Jajmani System Transformation', 'Market Economy & Trade Unions', 'Impact of Globalisation on Karnataka'] },
                                            { id: 'kas-gs1-s2-u7', label: 'Unit 7: Rural Social System & Rural Development (Bonded Labour Abolition, Green Revolution)', label_kn: 'ಭಾಗ ೭: ಗ್ರಾಮೀಣ ಸಾಮಾಜಿಕ ವ್ಯವಸ್ಥೆ', category: 'topic', entities: ['Village Community & Power Structures', 'Bonded Labour System Abolition Act 1976', 'Impact of Land Reforms & Green Revolution in Karnataka'] }
                                        ]
                                    },
                                    {
                                        id: 'kas-gs1-sec3',
                                        label: 'Section 3: Indian Economy, Planning & Rural Development',
                                        label_kn: 'ವಿಭಾಗ ೩: ಭಾರತ ಮತ್ತು ಕರ್ನಾಟಕ ಆರ್ಥಿಕತೆ, ಯೋಜನೆ & ಗ್ರಾಮೀಣಾಭಿವೃದ್ಧಿ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        children: [
                                            { id: 'kas-gs1-s3-u1', label: 'Unit 1: Indian & Karnataka Economy Post-Independence (Sectoral Growth, Poverty, Inequality)', label_kn: 'ಭಾಗ ೧: ಸ್ವಾತಂತ್ರ್ಯೋತ್ತರ ಆರ್ಥಿಕತೆ', category: 'topic', entities: ['Agriculture, Industry & Services Sectoral Share', 'Poverty Estimation (Tendulkar/Rangarajan)', 'Inequality Indices & Unemployment Trends'] },
                                            { id: 'kas-gs1-s3-u2', label: 'Unit 2: India & International Economic Relations (Trade, Foreign Investment, BoP, Karnataka Exports)', label_kn: 'ಭಾಗ ೨: ಅಂತಾರಾಷ್ಟ್ರೀಯ ಆರ್ಥಿಕ ಸಂಬಂಧಗಳು', category: 'topic', entities: ['Foreign Trade Policy', 'FDI Inflows to Karnataka', 'Balance of Payments (BoP)', 'IT/BT & Electronics Exports from Karnataka'] },
                                            { id: 'kas-gs1-s3-u3', label: 'Unit 3: Development Patterns & Regional Disparities (SEZs, Regional Boards, Article 371J)', label_kn: 'ಭಾಗ ೩: ಪ್ರಾದೇಶಿಕ ಅಸಮಾನತೆಗಳು', category: 'topic', entities: ['Special Economic Zones (SEZs)', 'Kalyana Karnataka Development Board (KKRDB)', 'Article 371J Implementation & Reservation', 'Nanjundappa Committee Recommendations'] },
                                            { id: 'kas-gs1-s3-u4', label: 'Unit 4: Planning in India and Karnataka (Five-Year Plans, NITI Aayog, State Planning)', label_kn: 'ಭಾಗ ೪: ಆರ್ಥಿಕ ಯೋಜನೆಗಳು', category: 'topic', entities: ['Planning Commission to NITI Aayog', '1991 LPG Economic Reforms', 'State Planning Board of Karnataka'] },
                                            { id: 'kas-gs1-s3-u5', label: 'Unit 5: Decentralized Planning (PRIs, DPCs, State Finance Commission)', label_kn: 'ಭಾಗ ೫: ವಿಕೇಂದ್ರೀಕೃತ ಯೋಜನೆ', category: 'topic', entities: ['District Planning Committees (DPC)', 'Top-Down vs Bottom-Up Planning', 'State Finance Commission Devolution'] },
                                            { id: 'kas-gs1-s3-u6', label: 'Unit 6: Rural Development (Agriculture, Credit, Markets, Infrastructure, Housing & Health)', label_kn: 'ಭಾಗ ೬: ಗ್ರಾಮೀಣಾಭಿವೃದ್ಧಿ', category: 'topic', entities: ['NABARD & Rural Credit', 'APMC Agricultural Marketing', 'Rural Housing (Ashraya/PMAY-G)', 'Rural Drinking Water & Healthcare'] },
                                            { id: 'kas-gs1-s3-u7', label: 'Unit 7: Rural Development Initiatives (Poverty Alleviation, PURA, SHGs, Microfinance, Tank Rejuvenation)', label_kn: 'ಭಾಗ ೭: ಗ್ರಾಮೀಣ ಉಪಕ್ರಮಗಳು', category: 'topic', entities: ['MGNREGS & Sanjeevini NRLM', 'Self Help Groups (SHGs) & Stree Shakti', 'Microfinance Institutions', 'Kere Sanjeevini (Tank Rejuvenation)'] },
                                            { id: 'kas-gs1-s3-u8', label: 'Unit 8: Data Collection, Analysis & Interpretation (Statistics, Permutations, Probability, Reasoning)', label_kn: 'ಭಾಗ ೮: ದತ್ತಾಂಶ ವಿಶ್ಲೇಷಣೆ', category: 'topic', entities: ['Measures of Central Tendency', 'Probability & Combinatorics', 'Data Interpretation (Bar/Pie/Line)', 'Quantitative Aptitude Drills'] }
                                        ]
                                    }
                                ]
                            },
                            {
                                id: 'kas-mains-gs2',
                                label: 'Paper III: General Studies 2 (250 Marks - 3 Hours)',
                                label_kn: 'ಪತ್ರಿಕೆ ೩: ಸಾಮಾನ್ಯ ಅಧ್ಯಯನ ೨ (೨೫೦ ಅಂಕಗಳು)',
                                category: 'paper',
                                badge: 'Geography, Constitution & Public Admin',
                                weightage: 'Very High',
                                color: '#0284C7',
                                children: [
                                    {
                                        id: 'kas-gs2-sec1',
                                        label: 'Section 1: Physical Features and Natural Resources (World, India & Karnataka Geography)',
                                        label_kn: 'ವಿಭಾಗ ೧: ಪ್ರಾಕೃತಿಕ ಲಕ್ಷಣಗಳು ಮತ್ತು ನೈಸರ್ಗಿಕ ಸಂಪನ್ಮೂಲಗಳು',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Lithosphere, Atmosphere & Hydrosphere', 'Physiography of World & India', 'Karnataka Physiographic Divisions (Coastal, Malnad, Maidan)', 'Rivers, Soils & Agro-Climatic Zones of Karnataka', 'Minerals & Power Sources (Thermal, Hydel, Solar)', 'Urban Land Use Policy, Slums & Master Plans', 'GIS & Remote Sensing Applications']
                                    },
                                    {
                                        id: 'kas-gs2-sec2',
                                        label: 'Section 2: Overview of the Indian Constitution',
                                        label_kn: 'ವಿಭಾಗ ೨: ಭಾರತದ ಸಂವಿಧಾನ ಸಮಗ್ರ ಪರಿಶೀಲನೆ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Preamble, Fundamental Rights & DPSP', 'SC/ST & OBC Reservations & Atrocities Act', 'Legislative, Administrative & Financial Powers Distribution', 'Bicamera/Unicameral Legislatures, CAG & Attorney General', 'Judicial Review & Basic Structure Doctrine', '73rd & 74th Constitutional Amendments', 'Welfare Commissions (Election Commission, UPSC/KPSC, NHRC, Finance Commission)']
                                    },
                                    {
                                        id: 'kas-gs2-sec3',
                                        label: 'Section 3: Public Administration, Management & International Relations',
                                        label_kn: 'ವಿಭಾಗ ೩: ಸಾರ್ವಜನಿಕ ಆಡಳಿತ, ನಿರ್ವಹಣೆ & ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Public vs Private Administration & New Public Management', 'Organizational Structure, Decision-Making & Delegation', 'Functional Management (HR, Finance, Leadership, Motivation)', 'Management Tools (PERT/CPM, SWOT, PDCA, POSDCORB)', 'Administrative Reforms, Lokpal & Karnataka Lokayukta', 'Citizen Charters & Sakala Act 2011', 'United Nations & Specialized Agencies (WHO, ILO, World Bank, WTO)', 'Regional Groupings (ASEAN, SAARC, QUAD, BRICS, G20)']
                                    }
                                ]
                            },
                            {
                                id: 'kas-mains-gs3',
                                label: 'Paper IV: General Studies 3 (250 Marks - 3 Hours)',
                                label_kn: 'ಪತ್ರಿಕೆ ೪: ಸಾಮಾನ್ಯ ಅಧ್ಯಯನ ೩ (೨೫೦ ಅಂಕಗಳು)',
                                category: 'paper',
                                badge: 'Science & Tech, Agriculture, Bio & Environment',
                                weightage: 'Very High',
                                color: '#16A34A',
                                children: [
                                    {
                                        id: 'kas-gs3-sec1',
                                        label: 'Section 1: Role and Impact of Science & Technology in Development',
                                        label_kn: 'ವಿಭಾಗ ೧: ಅಭಿವೃದ್ಧಿಯಲ್ಲಿ ವಿಜ್ಞಾನ & ತಂತ್ರಜ್ಞಾನದ ಪಾತ್ರ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['National S&T Policies & Digital Divide', 'Space Technology (INSAT, IRS, Chandrayaan, Gaganyaan)', 'Energy Resources (Hydel, Thermal, Nuclear, Solar, Wind, Biofuels, Green Hydrogen)', 'Disasters, Crop Protection & Pests Management', 'Knowledge Society, Human Capital & HDI', 'Water Harvesting & Food Processing Technologies']
                                    },
                                    {
                                        id: 'kas-gs3-sec2',
                                        label: 'Section 2: Advancement in Natural, Life, Agricultural Sciences & Health',
                                        label_kn: 'ವಿಭಾಗ ೨: ಕೃಷಿ, ಜೀವವಿಜ್ಞಾನ ಮತ್ತು ಸಾರ್ವಜನಿಕ ಆರೋಗ್ಯ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Natural Sciences (Plants, Animals, Microorganisms)', 'Agricultural Sciences & Post-Harvest Technology', 'Horticulture & Sericulture in India & Karnataka', 'Biotechnology (Genetic Engineering, Stem Cells, GM Crops, Bio-fertilizers)', 'Animal Husbandry & Dairy Cooperatives (AMUL, KMF Nandini)', 'Agriculture Policies (Seed/Credit, NAIS, WBCIS, WTO-AoA)', 'Health & Hygiene (AYUSH, NRHM, Immunology, Communicable Diseases & Vaccines)']
                                    },
                                    {
                                        id: 'kas-gs3-sec3',
                                        label: 'Section 3: Environment and Ecology',
                                        label_kn: 'ವಿಭಾಗ ೩: ಪರಿಸರ ಮತ್ತು ಜೀವಪರಿಸರ ವಿಜ್ಞಾನ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Wildlife Protection Act 1972 & Project Tiger', 'Natural Resources Conservation (Rainwater, Forests, Land)', 'Ecosystems & Biodiversity Hotspots (Western Ghats)', 'Solid Waste Management Rules & Plastic Recycling', 'Global Climate Challenges (Global Warming, Acid Rain, River Linking, Carbon Credits)', 'Joint Forest Management (JFM) & Community Participation']
                                    }
                                ]
                            },
                            {
                                id: 'kas-mains-gs4',
                                label: 'Paper V: General Studies 4 (250 Marks - 3 Hours)',
                                label_kn: 'ಪತ್ರಿಕೆ ೫: ಸಾಮಾನ್ಯ ಅಧ್ಯಯನ ೪ (೨೫೦ ಅಂಕಗಳು)',
                                category: 'paper',
                                badge: 'Ethics, Integrity & Aptitude Case Studies',
                                weightage: 'Very High',
                                color: '#9333EA',
                                children: [
                                    {
                                        id: 'kas-gs4-sec1',
                                        label: 'Section 1: Ethics in Public Administration',
                                        label_kn: 'ವಿಭಾಗ ೧: ಸಾರ್ವಜನಿಕ ಆಡಳಿತದಲ್ಲಿ ನೀತಿಶಾಸ್ತ್ರ',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Determinants and Consequences of Ethics', 'Ethics in Public & Private Relationships', 'Ethical Dilemmas in Governance, Laws, Rules & Conscience', 'Accountability, Right to Information (RTI) & Anti-Corruption Codes', 'Lessons from Great Leaders, Reformers & Administrators']
                                    },
                                    {
                                        id: 'kas-gs4-sec2',
                                        label: 'Section 2: Integrity & Civil Service Values',
                                        label_kn: 'ವಿಭಾಗ ೨: ಸಮಗ್ರತೆ ಮತ್ತು ನಾಗರಿಕ ಸೇವಾ ಮೌಲ್ಯಗಳು',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Impartiality & Non-Partisanship', 'Objectivity in Administrative Decision Making', 'Dedication to Public Service & Probity', 'Empathy, Tolerance & Compassion towards Weaker Sections']
                                    },
                                    {
                                        id: 'kas-gs4-sec3',
                                        label: 'Section 3: Aptitude & Applied Case Studies',
                                        label_kn: 'ವಿಭಾಗ ೩: ಮನೋಭಾವ & ಅನ್ವಯಿಕ ಕೇಸ್ ಸ್ಟಡಿಗಳು',
                                        category: 'domain',
                                        weightage: 'Very High',
                                        entities: ['Foundational Values for Civil Services', 'Emotional Intelligence in Administration', 'Contributions of Moral Thinkers (India & World)', 'Case Studies on Ethical, Integrity & Governance Dilemmas']
                                    }
                                ]
                            }
                        ]
                    }
                ]
            };

        // ═══════════════════════════════════════════════════════════════
        // 2. UPSC CIVIL SERVICES EXAMINATION (CSE) OFFICIAL SYLLABUS
        // ═══════════════════════════════════════════════════════════════
        case 'upsc-cse':
            return {
                id: 'cse-root',
                label: 'UPSC Civil Services Examination (CSE)',
                label_kn: 'ಯುಪಿಎಸ್‌ಸಿ ಕೇಂದ್ರ ನಾಗರಿಕ ಸೇವೆಗಳ ಪರೀಕ್ಷೆ (ಸಿಎಸ್ಇ)',
                category: 'exam',
                color: '#2563EB',
                children: [
                    {
                        id: 'cse-prelims',
                        label: 'Part-A: Preliminary Examination (Objective 400 Marks)',
                        label_kn: 'ಭಾಗ-ಎ: ಪ್ರಿಲಿಮಿನರಿ ಪರೀಕ್ಷೆ (ಆಬ್ಜೆಕ್ಟಿವ್ ೪೦೦ ಅಂಕಗಳು)',
                        category: 'stage',
                        color: '#F59E0B',
                        children: [
                            {
                                id: 'cse-prelims-gs1',
                                label: 'Paper I: General Studies (200 Marks - 2 Hours)',
                                label_kn: 'ಪತ್ರಿಕೆ ೧: ಸಾಮಾನ್ಯ ಅಧ್ಯಯನ (೨೦೦ ಅಂಕಗಳು)',
                                category: 'paper',
                                badge: '100 MCQs · 200 Marks (Merit Cutoff)',
                                weightage: 'Very High',
                                color: '#D97706',
                                children: [
                                    { id: 'upsc-p1-curr', label: 'Current Events of National and International Importance', label_kn: 'ಪ್ರಚಲಿತ ವಿದ್ಯಮಾನಗಳು', category: 'domain', entities: ['Multilateral Treaties & Summits (G20, QUAD, BRICS)', 'National Missions & Welfare Schemes', 'Bilateral Accords & Maritime Security', 'Indices & Global Reports (UNDP, World Bank, WEF)'] },
                                    { id: 'upsc-p1-hist', label: 'History of India and Indian National Movement', label_kn: 'ಭಾರತದ ಇತಿಹಾಸ ಮತ್ತು ರಾಷ್ಟ್ರೀಯ ಚಳವಳಿ', category: 'domain', entities: ['Ancient India (Indus, Vedic, Mauryas, Guptas)', 'Medieval India (Delhi Sultanate, Mughals, Bhakti-Sufi)', 'Modern India (British Rule, 1857 Revolt, INC Phases)', 'Gandhian Era, Revolutionary Movements & Independence 1947'] },
                                    { id: 'upsc-p1-geo', label: 'Indian and World Geography - Physical, Social, Economic', label_kn: 'ಭಾರತ ಮತ್ತು ವಿಶ್ವ ಭೂಗೋಳ', category: 'domain', entities: ['Geomorphology, Climatology & Oceanography', 'Indian River Basins, Monsoon & Soil Classification', 'Mineral & Energy Resources Distribution', 'Demographics, Urbanisation & Industrial Locations'] },
                                    { id: 'upsc-p1-polity', label: 'Indian Polity & Governance - Constitution, Political System, Panchayati Raj, Public Policy, Rights Issues', label_kn: 'ಭಾರತ ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', category: 'domain', entities: ['Constitutional Framework, Preamble, Fundamental Rights & DPSP', 'Parliament, President & Prime Minister', 'Judiciary, Judicial Review & PIL', 'Federalism, Inter-State Relations & Emergency', '73rd & 74th Amendments (Panchayati Raj & Municipalities)', 'Public Policy & Statutory Commissions'] },
                                    { id: 'upsc-p1-econ', label: 'Economic & Social Development - Sustainable Development, Poverty, Inclusion, Demographics, Social Sector', label_kn: 'ಆರ್ಥಿಕ ಮತ್ತು ಸಾಮಾಜಿಕ ಅಭಿವೃದ್ಧಿ', category: 'domain', entities: ['National Income Accounting (GDP, GVA)', 'Fiscal Policy, Union Budget & Taxation', 'Monetary Policy & RBI Regulations', 'Poverty, Inequality & Employment Indices', 'Inclusive Growth, Capital Markets & Banking Reforms'] },
                                    { id: 'upsc-p1-env', label: 'General Issues on Environmental Ecology, Bio-diversity and Climate Change', label_kn: 'ಪರಿಸರ, ಜೀವವೈವಿಧ್ಯ ಮತ್ತು ಹವಾಮಾನ ಬದಲಾವಣೆ', category: 'domain', entities: ['Ecosystem Dynamics & Trophic Levels', 'Biodiversity Hotspots & Protected Area Network (PA)', 'Climate Change Negotiations (UNFCCC, Paris Agreement, COP)', 'Pollution Control Acts & Environmental Impact Assessment (EIA)'] },
                                    { id: 'upsc-p1-sc', label: 'General Science', label_kn: 'ಸಾಮಾನ್ಯ ವಿಜ್ಞಾನ', category: 'domain', entities: ['Physics, Chemistry & Biology Basics', 'Space Missions (ISRO, NASA)', 'Biotechnology, Genetics & Vaccine Platforms', 'Information Tech, AI, Quantum Computing & Defence Tech'] }
                                ]
                            },
                            {
                                id: 'cse-prelims-csat',
                                label: 'Paper II: CSAT Aptitude (200 Marks - 2 Hours)',
                                label_kn: 'ಪತ್ರಿಕೆ ೨: ಸಿ-ಸ್ಯಾಟ್ ಆಪ್ಟಿಟ್ಯೂಡ್ (೨೦೦ ಅಂಕಗಳು - ೩೩% ಅರ್ಹತೆ)',
                                category: 'paper',
                                badge: '80 MCQs · 200 Marks (33% Qualifying)',
                                weightage: 'High',
                                color: '#0D9488',
                                children: [
                                    { id: 'csat-comp', label: 'Comprehension & Interpersonal Communication Skills', label_kn: 'ಗ್ರಹಣ ಸಾಮರ್ಥ್ಯ', category: 'domain', entities: ['Critical Inferences & Assumptions', 'Logical Corollaries & Central Themes', 'Passage Contextual Synthesis'] },
                                    { id: 'csat-reasoning', label: 'Logical Reasoning, Analytical Ability, Decision Making & Problem Solving', label_kn: 'ತಾರ್ಕಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ನಿರ್ಧಾರ ಕೈಗೊಳ್ಳುವಿಕೆ', category: 'domain', entities: ['Syllogisms & Deductive Logic', 'Seating Arrangements & Puzzles', 'Blood Relations, Direction Sense & Series'] },
                                    { id: 'csat-math', label: 'Basic Numeracy (Class X Level) & Data Interpretation', label_kn: 'ಮೂಲ ಗಣಿತ ಮತ್ತು ದತ್ತಾಂಶ ವಿಶ್ಲೇಷಣೆ', category: 'domain', entities: ['Number System & Divisibility', 'Percentages, Profit & Loss, Ratio & Averages', 'Time & Work, Speed & Distance', 'Data Interpretation (Charts, Graphs, Tables, Data Sufficiency)'] }
                                ]
                            }
                        ]
                    },
                    {
                        id: 'cse-mains',
                        label: 'Part-B: Main Examination (Descriptive Written 1750 Marks + Interview 275 Marks)',
                        label_kn: 'ಭಾಗ-ಬಿ: ಮುಖ್ಯ ಪರೀಕ್ಷೆ (ವಿವರಣಾತ್ಮಕ ಲಿಖಿತ ೧೭೫೦ + ಸಂದರ್ಶನ ೨೭೫ ಅಂಕಗಳು)',
                        category: 'stage',
                        color: '#3B82F6',
                        children: [
                            {
                                id: 'cse-mains-essay',
                                label: 'Paper I: Essay (250 Marks - 3 Hours)',
                                label_kn: 'ಪತ್ರಿಕೆ ೧: ಪ್ರಬಂಧ (೨೫೦ ಅಂಕಗಳು)',
                                category: 'paper',
                                badge: '2 Section Essays · 125 Marks Each',
                                weightage: 'Very High',
                                color: '#EC4899',
                                children: [
                                    { id: 'cse-essay-p1', label: 'Section A: Philosophical, Abstract & Ethical Reflections', label_kn: 'ವಿಭಾಗ ಎ: ತಾತ್ವಿಕ & ನೀತಿಚಿಂತನೆ ಪ್ರಬಂಧ', category: 'domain', entities: ['Philosophical Hooks', 'Epistemological Reasoning', 'Humanistic Paradigms'] },
                                    { id: 'cse-essay-p2', label: 'Section B: Socio-Economic, Geopolitical & Administrative Dimensions', label_kn: 'ವಿಭಾಗ ಬಿ: ಸಾಮಾಜಿಕ-ಆರ್ಥಿಕ & ಆಡಳಿತ ಪ್ರಬಂಧ', category: 'domain', entities: ['PESTLE Framework Synthesis', 'Constitutional Visions', 'Pragmatic Policy Solutions'] }
                                ]
                            },
                            {
                                id: 'cse-mains-gs1',
                                label: 'Paper II: General Studies I (250 Marks) - Indian Heritage, History & Geography of the World and Society',
                                label_kn: 'ಪತ್ರಿಕೆ ೨: ಜಿಎಸ್ ೧ (ಭಾರತೀಯ ಪರಂಪರೆ, ಇತಿಹಾಸ, ಭೂಗೋಳ & ಸಮಾಜ)',
                                category: 'paper',
                                badge: '20 Descriptive Qs · 250 Marks',
                                weightage: 'Very High',
                                color: '#F97316',
                                children: [
                                    { id: 'm1-art', label: 'Indian Culture - Salient Aspects of Art Forms, Literature & Architecture from Ancient to Modern', label_kn: 'ಕಲೆ, ಸಾಹಿತ್ಯ ಮತ್ತು ವಾಸ್ತುಶಿಲ್ಪ', category: 'domain', entities: ['Nagara, Dravida & Vesara Temple Architecture', 'Sculpture (Gandhara, Mathura, Amravati)', 'Classical Dances, Music & Folk Traditions', 'Ancient, Medieval & Modern Literature'] },
                                    { id: 'm1-hist', label: 'Modern Indian History from mid-18th Century, Freedom Struggle & Post-Independence Consolidation', label_kn: 'ಆಧುನಿಕ ಭಾರತದ ಇತಿಹಾಸ & ಸ್ವಾತಂತ್ರ್ಯೋತ್ತರ ಏಕೀಕರಣ', category: 'domain', entities: ['Colonial Expansion & Administrative Systems', 'Socio-Religious Reform Movements', 'Freedom Struggle Stages & Eminent Personalities', 'Reorganization & Consolidation of States Post-1947'] },
                                    { id: 'm1-world', label: 'History of the World (18th Century Events, Industrial Revolution, World Wars, Decolonization)', label_kn: 'ವಿಶ್ವ ಇತಿಹಾಸ', category: 'domain', entities: ['Industrial Revolution', 'American & French Revolutions', 'World War I & II Dynamics', 'Redrawal of National Frontiers, Decolonization & Cold War'] },
                                    { id: 'm1-soc', label: 'Salient Features of Indian Society, Diversity, Women Organizations, Population, Poverty & Urbanization', label_kn: 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ವೈವಿಧ್ಯತೆ', category: 'domain', entities: ['Caste System & Social Stratification', 'Secularism, Communalism & Regionalism', 'Women Empowerment & Gender Justice', 'Globalization Impact on Indian Culture & Social Structure'] },
                                    { id: 'm1-geo', label: 'Salient Features of World Physical Geography, Natural Resources Distribution & Geophysical Phenomena', label_kn: 'ವಿಶ್ವ ಪ್ರಾಕೃತಿಕ ಭೂಗೋಳ & ನೈಸರ್ಗಿಕ ಸಂಪನ್ಮೂಲಗಳು', category: 'domain', entities: ['Plate Tectonics, Earthquakes, Tsunami & Volcanism', 'Cyclone Trajectories & Ocean Currents', 'Distribution of Key Natural Resources (Minerals, Hydrocarbons)', 'Location Factors of Primary, Secondary & Tertiary Industries'] }
                                ]
                            },
                            {
                                id: 'cse-mains-gs2',
                                label: 'Paper III: General Studies II (250 Marks) - Governance, Constitution, Polity, Social Justice & International Relations',
                                label_kn: 'ಪತ್ರಿಕೆ ೩: ಜಿಎಸ್ ೨ (ಆಡಳಿತ, ಸಂವಿಧಾನ, ಸಾಮಾಜಿಕ ನ್ಯಾಯ & ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು)',
                                category: 'paper',
                                badge: '20 Descriptive Qs · 250 Marks',
                                weightage: 'Very High',
                                color: '#0284C7',
                                children: [
                                    { id: 'm2-const', label: 'Indian Constitution - Historical Underpinnings, Evolution, Features, Amendments & Basic Structure', label_kn: 'ಭಾರತ ಸಂವಿಧಾನ ಮತ್ತು ವಿಕಾಸ', category: 'domain', entities: ['Basic Structure Doctrine (Kesavananda Bharati)', 'Federal Architecture & Centre-State Friction Points', 'Separation of Powers & Dispute Redressal Mechanisms', 'Comparison of Indian Constitutional Scheme with other Nations'] },
                                    { id: 'm2-exec-leg', label: 'Structure, Organization & Functioning of Executive, Judiciary, Parliament & State Legislatures', label_kn: 'ಶಾಸಕಾಂಗ, ಕಾರ್ಯಾಂಗ ಮತ್ತು ನ್ಯಾಯಾಂಗ', category: 'domain', entities: ['Parliamentary Committees & Legislative Process', 'Judicial Independence, Appointments (Collegium) & Judicial Activism', 'Representation of People Act Provisions', 'Statutory, Regulatory & Quasi-Judicial Bodies (ECI, CAG, CCI, NGT)'] },
                                    { id: 'm2-gov', label: 'Government Policies, Development Processes, NGOs, SHGs, Citizen Charters, E-Governance & Transparency', label_kn: 'ಆಡಳಿತ ಮತ್ತು ಇ-ಆಡಳಿತ', category: 'domain', entities: ['Welfare Schemes for Vulnerable Sections & Implementation Issues', 'Role of NGOs, SHGs, Charities & Stakeholders', 'Citizen Charters, Transparency & RTI Act', 'E-Governance Models, Successes & Limitations', 'Role of Civil Services in a Democracy'] },
                                    { id: 'm2-ir', label: 'India and its Neighborhood Relations, Bilateral, Regional & Global Groupings, UN & International Bodies', label_kn: 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು', category: 'domain', entities: ['Neighborhood First Policy & Act East Policy', 'Global Groupings (QUAD, I2U2, BRICS, G20, SCO)', 'Impact of Policies of Developed & Developing Nations on India', 'Indian Diaspora & Geopolitical Soft Power', 'UN Security Council Reforms, WTO & IMF Restructuring'] }
                                ]
                            },
                            {
                                id: 'cse-mains-gs3',
                                label: 'Paper IV: General Studies III (250 Marks) - Technology, Economic Development, Bio-diversity, Environment, Security & Disaster Management',
                                label_kn: 'ಪತ್ರಿಕೆ ೪: ಜಿಎಸ್ ೩ (ಆರ್ಥಿಕತೆ, ತಂತ್ರಜ್ಞಾನ, ಪರಿಸರ, ಆಂತರಿಕ ಭದ್ರತೆ & ವಿಪತ್ತು ನಿರ್ವಹಣೆ)',
                                category: 'paper',
                                badge: '20 Descriptive Qs · 250 Marks',
                                weightage: 'Very High',
                                color: '#16A34A',
                                children: [
                                    { id: 'm3-econ', label: 'Indian Economy & Issues relating to Planning, Mobilization of Resources, Growth, Employment & Budgeting', label_kn: 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಬಜೆಟ್', category: 'domain', entities: ['Inclusive Growth & Financial Inclusion', 'Government Budgeting & Fiscal Responsibility (FRBM)', 'Major Crops, Cropping Patterns & Irrigation Systems', 'Agricultural Subsidies, Minimum Support Price (MSP) & PDS Reforms', 'Food Processing & Supply Chain Logistics', 'Infrastructure (Energy, Ports, Roads, Airports, Railways)'] },
                                    { id: 'm3-st', label: 'Science & Technology - Developments, Applications in Everyday Life, Indigenization & Intellectual Property (IPR)', label_kn: 'ವಿಜ್ಞಾನ ಮತ್ತು ತಂತ್ರಜ್ಞಾನ', category: 'domain', entities: ['ISRO Achievements & Deep Space Missions', 'Supercomputing, Artificial Intelligence, Robotics & Quantum Tech', 'Nanotechnology & Biotechnology Breakthroughs', 'Intellectual Property Rights (IPR) & Patent Regimes'] },
                                    { id: 'm3-env', label: 'Conservation, Environmental Pollution, Degradation, EIA & Disaster Management', label_kn: 'ಪರಿಸರ ಸಂರಕ್ಷಣೆ & ವಿಪತ್ತು ನಿರ್ವಹಣೆ', category: 'domain', entities: ['Renewable Energy Transition (Solar, Wind, Green Hydrogen)', 'Pollution Control & Circular Economy Models', 'Environmental Impact Assessment (EIA 2020)', 'Disaster Management Framework (NDMA & Sendai Framework)'] },
                                    { id: 'm3-sec', label: 'Internal Security Challenges - Extremism, Cyber Security, Money Laundering, Border Management & Security Forces', label_kn: 'ಆಂತರಿಕ ಭದ್ರತೆ ಮತ್ತು ಗಡಿ ನಿರ್ವಹಣೆ', category: 'domain', entities: ['Linkages between Development & Spread of Extremism (LWE)', 'Role of External State & Non-State Actors in Internal Security', 'Cyber Warfare, Dark Net Policing & Social Media Challenges', 'Money Laundering & Terror Financing (FATF)', 'Border Security Architecture & Coastal Defence Protocols', 'Security Forces and their Mandates (BSF, CRPF, CISF, NSG, ITBP)'] }
                                ]
                            },
                            {
                                id: 'cse-mains-gs4',
                                label: 'Paper V: General Studies IV (250 Marks) - Ethics, Integrity and Aptitude',
                                label_kn: 'ಪತ್ರಿಕೆ ೫: ಜಿಎಸ್ ೪ (ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಮನೋಸಾಮರ್ಥ್ಯ ಕೇಸ್ ಸ್ಟಡಿಗಳು)',
                                category: 'paper',
                                badge: 'Theory & Applied Case Studies · 250 Marks',
                                weightage: 'Very High',
                                color: '#9333EA',
                                children: [
                                    { id: 'm4-theory', label: 'Ethics and Human Interface - Essence, Determinants, Consequences & Ethical Dimensions in Private & Public Life', label_kn: 'ನೀತಿಶಾಸ್ತ್ರ ಸಿದ್ಧಾಂತಗಳು', category: 'domain', entities: ['Human Values & Lessons from Great Leaders', 'Role of Family, Society & Educational Institutions in Inculcating Values', 'Attitude - Content, Structure, Function & Behavioral Influence', 'Aptitude & Foundational Values for Civil Service (Integrity, Impartiality, Non-partisanship, Objectivity, Empathy)', 'Emotional Intelligence Concepts & Application in Administration', 'Contributions of Moral Thinkers and Philosophers (India & World)', 'Public Service Values, Probity in Governance, Nolan Principles & Code of Ethics'] },
                                    { id: 'm4-cases', label: 'Applied Case Studies on Ethical & Governance Dilemmas', label_kn: 'ಅನ್ವಯಿಕ ಕೇಸ್ ಸ್ಟಡಿಗಳು', category: 'domain', entities: ['Conflict of Interest Scenarios in Public Procurement', 'Whistleblowing & Retaliation Dilemmas', 'Disaster Relief & Resource Rationing Ethics', 'Corporate Governance & Environmental Compliance Case Studies', 'Handling Political Pressure & Preserving Bureaucratic Neutrality'] }
                                ]
                            }
                        ]
                    }
                ]
            };

        // ═══════════════════════════════════════════════════════════════
        // 3. KEA PDO (PANCHAYAT DEVELOPMENT OFFICER)
        // ═══════════════════════════════════════════════════════════════
        case 'kea-pdo':
            return {
                id: 'pdo-root',
                label: 'KEA Panchayat Development Officer (PDO)',
                label_kn: 'ಕೆಇಎ ಪಂಚಾಯತ್ ಅಭಿವೃದ್ಧಿ ಅಧಿಕಾರಿ (ಪಿಡಿಒ)',
                category: 'exam',
                color: '#10B981',
                children: [
                    {
                        id: 'pdo-p2',
                        label: 'Paper 2: Rural Dev & Panchayat Raj (RDPR)',
                        label_kn: 'ಪತ್ರಿಕೆ ೨: ಗ್ರಾಮೀಣಾಭಿವೃದ್ಧಿ ಮತ್ತು ಪಂಚಾಯತ್ ರಾಜ್',
                        category: 'paper',
                        badge: '100 Qs · 100 Marks (Core Focus)',
                        weightage: 'Very High',
                        color: '#0D9488',
                        children: [
                            {
                                id: 'pdo-p2-ch',
                                label: 'Karnataka Gram Swaraj & PR Act 1993 (21 Chapters)',
                                label_kn: 'ಕರ್ನಾಟಕ ಗ್ರಾಮ ಸ್ವರಾಜ್ & ಪಿಆರ್ ಕಾಯ್ದೆ ೧೯೯೩ (೨೧ ಅಧ್ಯಾಯಗಳು)',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Statutory 21 chapters including Ward Sabha, Gram Sabha, GP constitutions, staff roles, and 2015 Ramesh Kumar amendments.',
                                entities: ['Chapter I to XXI', 'Ward Sabha & Gram Sabha Quorum', '2015 Amendments', '50% Women Quota', 'Citizen Charters'],
                                children: [
                                    { id: 'pdo-p2-gp', label: 'Gram Panchayat Composition & Functioning', label_kn: 'ಗ್ರಾಮ ಪಂಚಾಯಿತಿ ರಚನೆ ಮತ್ತು ಕಾರ್ಯಗಳು', category: 'topic', entities: ['Adhyaksha/Upadhyaksha Election', 'Quorum Rules', 'Standing Committees (Production, Social Justice, Amenities)'] },
                                    { id: 'pdo-p2-staff', label: 'Staffing, Powers & Duties of PDO & Secretary', label_kn: 'ಪಿಡಿಒ ಮತ್ತು ಕಾರ್ಯದರ್ಶಿ ಅಧಿಕಾರ ಹಾಗೂ ಕರ್ತವ್ಯಗಳು', category: 'topic', entities: ['PDO Statutory Powers', 'Gram Panchayat Secretary', 'Village Accountants Linkage', 'Appeals to Taluk Executive Officer'] },
                                    { id: 'pdo-p2-disq', label: 'Disqualifications, Resignations & Dispute Resolutions', label_kn: 'ಅನರ್ಹತೆಗಳು ಮತ್ತು ರಾಜೀನಾಮೆ ನಿಯಮಗಳು', category: 'topic', entities: ['Section 12 Disqualifications', 'Two-Child Norm Removal', 'No-Confidence Motion Rules', 'State Election Commission'] }
                                ]
                            },
                            {
                                id: 'pdo-p2-pri-tiers',
                                label: '3-Tier PRI Architecture (GP, TP, ZP)',
                                label_kn: 'ತ್ರಿ-ಹಂತದ ಪಂಚಾಯತ್ ವ್ಯವಸ್ಥೆ',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Functional division, administrative powers, and coordination between Gram, Taluk, and Zilla Panchayats.',
                                entities: ['Gram Panchayat', 'Taluk Panchayat (TP EO)', 'Zilla Panchayat (ZP CEO)', 'Standing Committees', 'Kondajji Basappa & Nazir Sab Legacy'],
                                children: [
                                    { id: 'pdo-p2-tp', label: 'Taluk Panchayat Administration', label_kn: 'ತಾಲೂಕು ಪಂಚಾಯಿತಿ ಆಡಳಿತ', category: 'topic', entities: ['Taluk Adhyaksha', 'Executive Officer (EO)', 'Taluk Planning Committee'] },
                                    { id: 'pdo-p2-zp', label: 'Zilla Panchayat Structure & Executive Roles', label_kn: 'ಜಿಲ್ಲಾ ಪಂಚಾಯಿತಿ ರಚನೆ', category: 'topic', entities: ['ZP Adhyaksha', 'Chief Executive Officer (CEO / IAS/KAS)', 'Standing Committees'] }
                                ]
                            },
                            {
                                id: 'pdo-p2-finance',
                                label: 'PRI Finances, Property Taxation & Digital Portals',
                                label_kn: 'ಪಂಚಾಯತ್ ಆರ್ಥಿಕತೆ, ತೆರಿಗೆ ಮತ್ತು ತಂತ್ರಾಂಶಗಳು',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Revenue generation, digital property registration, accounting systems, and audit directorates.',
                                entities: ['e-Swathu (Form 9 & 11)', 'Panchatantra 2.0', 'Bapuji Seva Kendra (BSK)', 'State Finance Commission (SFC)', '15th Finance Commission Grants', 'Social Audit Directorates'],
                                children: [
                                    { id: 'pdo-p2-eswathu', label: 'e-Swathu Property Registration Portal', label_kn: 'ಇ-ಸ್ವತ್ತು ತಂತ್ರಾಂಶ', category: 'topic', entities: ['Form 9 & Form 11A/11B', 'Digital Signature of PDO', 'Property Tax Assessment', 'Gramathana Boundaries'] },
                                    { id: 'pdo-p2-tax', label: 'Gram Panchayat Own Source Revenue (OSR)', label_kn: 'ಸ್ವಂತ ತೆರಿಗೆ ಆದಾಯ', category: 'topic', entities: ['Property Tax Levy', 'Water Rates', 'Trade License Fees', 'Building Permissions'] }
                                ]
                            },
                            {
                                id: 'pdo-p2-schemes',
                                label: 'Flagship Central & Karnataka Rural Schemes',
                                label_kn: 'ಪ್ರಮುಖ ಗ್ರಾಮೀಣಾಭಿವೃದ್ಧಿ ಯೋಜನೆಗಳು',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Government employment, housing, sanitation, drinking water, and rural connectivity programs.',
                                entities: ['MGNREGS (100 Days Wage)', 'PMAY-G (Housing)', 'SBM-G (ODF Plus & Waste)', 'JJM (Functional Taps)', 'NRLM (Sanjeevini SHGs)', 'PMGSY Rural Roads'],
                                children: [
                                    { id: 'pdo-p2-mgnregs', label: 'MGNREGA 2005 Implementation', label_kn: 'ನರೇಗಾ ಯೋಜನೆ', category: 'topic', entities: ['Job Card Issuance', 'Social Audit Directorate', '100 Days Guaranteed Employment', 'Geo-tagging Assets', 'Unemployment Allowance'] },
                                    { id: 'pdo-p2-sanitation', label: 'Swachh Bharat Mission (Gramin) & Waste Mgmt', label_kn: 'ಸ್ವಚ್ಛ ಭಾರತ ಮಿಷನ್', category: 'topic', entities: ['ODF Plus Status', 'Solid & Liquid Waste Management (SLWM)', 'Greywater Recycling', 'Community Sanitary Complexes'] }
                                ]
                            }
                        ]
                    },
                    {
                        id: 'pdo-p1',
                        label: 'Paper 1: General Studies, Kannada & English',
                        label_kn: 'ಪತ್ರಿಕೆ ೧: ಸಾಮಾನ್ಯ ಜ್ಞಾನ, ಕನ್ನಡ ಮತ್ತು ಇಂಗ್ಲಿಷ್',
                        category: 'paper',
                        badge: '100 Qs · 100 Marks',
                        weightage: 'High',
                        color: '#2563EB',
                        children: [
                            {
                                id: 'pdo-p1-kannada',
                                label: 'General Kannada Grammar & Vocabulary (ಸಾಮಾನ್ಯ ಕನ್ನಡ)',
                                label_kn: 'ಸಾಮಾನ್ಯ ಕನ್ನಡ ವ್ಯಾಕರಣ ಮತ್ತು ಶಬ್ದಕೋಶ',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Complete Kannada language proficiency, sandhi, samasa, idioms, proverbs, and literary stalwarts.',
                                entities: ['ವರ್ಣಮಾಲೆ (೪೯ ಅಕ್ಷರಗಳು)', 'ಕನ್ನಡ & ಸಂಸ್ಕೃತ ಸಂಧಿಗಳು', 'ಸಮಾಸಗಳು (೮ ವಿಧಗಳು)', 'ವಿಭಕ್ತಿ ಪ್ರತ್ಯಯಗಳು', 'ತತ್ಸಮ-ತದ್ಭವ', 'ನುಡಿಗಟ್ಟುಗಳು & ಗಾದೆಗಳು', 'ಜ್ಞಾನಪೀಠ ಪ್ರಶಸ್ತಿ ಪುರಸ್ಕೃತರು'],
                                children: [
                                    { id: 'pdo-p1-sandhi', label: 'ಸಂಧಿ ಪ್ರಕರಣ (ಲೋಪ, ಆಗಮ, ಆದೇಶ, ಸವರ್ಣದೀರ್ಘ)', label_kn: 'ಸಂಧಿ ಪ್ರಕರಣ', category: 'topic', entities: ['ಯಕಾರಾಗಮ', 'ವಕಾರಾಗಮ', 'ಆದೇಶ ಸಂಧಿ', 'ಗುಣ ಸಂಧಿ', 'ವೃದ್ಧಿ ಸಂಧಿ'] },
                                    { id: 'pdo-p1-samasa', label: 'ಸಮಾಸ ಪ್ರಕರಣ (ತತ್ಪುರುಷ, ಕರ್ಮಧಾರಯ, ಬಹುವ್ರೀಹಿ, ದ್ವಂದ್ವ)', label_kn: 'ಸಮಾಸ ಪ್ರಕರಣ', category: 'topic', entities: ['ಅಂಶಿ ಸಮಾಸ', 'ದ್ವಿಗು ಸಮಾಸ', 'ಗಮಕ ಸಮಾಸ', 'ಕ್ರಿಯಾ ಸಮಾಸ'] }
                                ]
                            },
                            {
                                id: 'pdo-p1-english',
                                label: 'General English Grammar & Comprehension',
                                label_kn: 'ಸಾಮಾನ್ಯ ಇಂಗ್ಲಿಷ್ ವ್ಯಾಕರಣ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Grammar fundamentals, parts of speech, tense harmony, vocabulary, and active/passive voice.',
                                entities: ['Parts of Speech', 'Subject-Verb Agreement', 'Active & Passive Voice', 'Direct & Indirect Speech', 'Idioms & Phrasal Verbs', 'Sentence Correction'],
                                children: [
                                    { id: 'pdo-p1-eng-gram', label: 'Tenses, Voice & Speech Transformations', label_kn: 'Tenses & Transformations', category: 'topic', entities: ['Tense Backshifting', 'Voice Conversions', 'Prepositions & Conjunctions'] }
                                ]
                            },
                            {
                                id: 'pdo-p1-gs',
                                label: 'General Studies & Karnataka Administration',
                                label_kn: 'ಸಾಮಾನ್ಯ ಜ್ಞಾನ ಮತ್ತು ಕರ್ನಾಟಕ ಆಡಳಿತ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Karnataka history, geographical features, Article 371J, and digital citizen delivery services.',
                                entities: ['Karnataka History (Kadamba, Vijayanagara, Wodeyar)', 'Article 371J (Kalyana Karnataka)', 'Sakala Act 2011', 'Karnataka Lokayukta', 'Bhoomi & Seva Sindhu'],
                                children: [
                                    { id: 'pdo-p1-kar-hist', label: 'Karnataka Dynasties & Freedom Movement', label_kn: 'ಕರ್ನಾಟಕ ಇತಿಹಾಸ', category: 'topic', entities: ['Chalukyas of Badami', 'Hoysalas of Belur', 'Unification of Karnataka 1956'] },
                                    { id: 'pdo-p1-egov', label: 'Karnataka Digital E-Governance & Sakala', label_kn: 'ಸಕಾಲ ಮತ್ತು ಇ-ಆಡಳಿತ', category: 'topic', entities: ['Guarantee of Services Act 2011', 'Bhoomi RTC Records', 'FRUITS Farmer Portal', 'Kutumba Registry'] }
                                ]
                            }
                        ]
                    }
                ]
            };

        // ═══════════════════════════════════════════════════════════════
        // 4. KARTET & GPSTR (TEACHING EXAMS)
        // ═══════════════════════════════════════════════════════════════
        case 'kartet':
        case 'karnataka-gpstr':
            return {
                id: 'tet-root',
                label: 'KARTET & Karnataka Teaching Examinations',
                label_kn: 'ಕರ್ನಾಟಕ ಶಿಕ್ಷಕರ ಅರ್ಹತಾ ಪರೀಕ್ಷೆ (ಕೆ-ಟೆಟ್ & ಜಿಪಿಎಸ್‌ಟಿಆರ್)',
                category: 'exam',
                color: '#8B5CF6',
                children: [
                    {
                        id: 'tet-cdp',
                        label: 'Child Development & Educational Psychology (CDP)',
                        label_kn: 'ಮಕ್ಕಳ ವಿಕಾಸ ಮತ್ತು ಶೈಕ್ಷಣಿಕ ಮನೋವಿಜ್ಞಾನ',
                        category: 'paper',
                        badge: '30 Qs · 30 Marks (Fundamental)',
                        weightage: 'Very High',
                        color: '#7C3AED',
                        children: [
                            {
                                id: 'tet-cdp-growth',
                                label: 'Child Growth & Developmental Dynamics',
                                label_kn: 'ಮಗುವಿನ ಬೆಳವಣಿಗೆ ಮತ್ತು ವಿಕಾಸದ ನಿಯಮಗಳು',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Principles of development, cephalocaudal/proximodistal trends, heredity vs environment, and developmental milestones.',
                                entities: ['Cephalocaudal & Proximodistal Trends', 'Nature vs Nurture', 'Bronfenbrenner Ecological Systems', 'Erik Erikson Psychosocial Stages', 'Adolescent Turmoil & Identity'],
                                children: [
                                    { id: 'tet-cdp-principles', label: 'Principles of Growth & Development', label_kn: 'ವಿಕಾಸದ ತತ್ವಗಳು', category: 'topic', entities: ['Continuity Principle', 'Individual Differences', 'Inter-relation of Domains'] }
                                ]
                            },
                            {
                                id: 'tet-cdp-theories',
                                label: 'Theories of Cognition, Learning & Intelligence',
                                label_kn: 'ಅರಿವಿನ ಮತ್ತು ಕಲಿಕಾ ಸಿದ್ಧಾಂತಗಳು',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Constructivist, socio-cultural, and behavioral frameworks governing cognitive architecture.',
                                entities: ['Jean Piaget (4 Stages: Sensorimotor, Pre-op, Concrete, Formal)', 'Lev Vygotsky (ZPD, Scaffolding, MKO)', 'Lawrence Kohlberg (Moral Development)', 'Howard Gardner (8 Multiple Intelligences)', 'Thorndike Laws of Learning', 'Pavlov & Skinner Conditioning'],
                                children: [
                                    { id: 'tet-cdp-piaget', label: 'Jean Piaget Cognitive Development Stages', label_kn: 'ಪಿಯಾಜೆ ಅರಿವಿನ ಹಂತಗಳು', category: 'topic', entities: ['Schemas', 'Assimilation & Accommodation', 'Equilibration', 'Conservation Concept', 'Object Permanence'] },
                                    { id: 'tet-cdp-vygotsky', label: 'Lev Vygotsky Socio-Cultural Theory', label_kn: 'ವೈಗೋಟ್ಸ್ಕಿ ಸಿದ್ಧಾಂತ', category: 'topic', entities: ['Zone of Proximal Development (ZPD)', 'Scaffolding Mechanism', 'More Knowledgeable Other (MKO)', 'Private Speech'] },
                                    { id: 'tet-cdp-intelligence', label: 'Multiple Intelligences & Triarchic Theory', label_kn: 'ಬುದ್ಧಿಶಕ್ತಿ ಸಿದ್ಧಾಂತಗಳು', category: 'topic', entities: ['Howard Gardner 8 Intelligences', 'Sternberg Triarchic Theory', 'Emotional Intelligence (Goleman)', 'Creativity & Divergent Thinking'] }
                                ]
                            },
                            {
                                id: 'tet-cdp-inclusive',
                                label: 'Inclusive Education, Diverse Learners & CWSN',
                                label_kn: 'ಸಮನ್ವಯ ಶಿಕ್ಷಣ ಮತ್ತು ವಿಶೇಷ ಅಗತ್ಯವುಳ್ಳ ಮಕ್ಕಳು',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Mainstreaming diverse learners, neurodiversity, learning disabilities, and Universal Design for Learning.',
                                entities: ['Dyslexia (Reading)', 'Dysgraphia (Writing)', 'Dyscalculia (Math)', 'ADHD & Autism', 'Universal Design for Learning (UDL)', 'Gifted & Creative Learners', 'SEDGs Underprivileged Groups'],
                                children: [
                                    { id: 'tet-cdp-disabilities', label: 'Specific Learning Disabilities (SLD)', label_kn: 'ಕಲಿಕಾ ನ್ಯೂನತೆಗಳು', category: 'topic', entities: ['Dyslexia Screening', 'Dysgraphia Interventions', 'Dyscalculia Remediation', 'Assistive Technology'] }
                                ]
                            },
                            {
                                id: 'tet-cdp-pedagogy',
                                label: 'Pedagogical Strategies, Lesson Planning & Evaluation',
                                label_kn: 'ಬೋಧನಾ ತಂತ್ರಗಳು ಮತ್ತು ಮೌಲ್ಯಮಾಪನ',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Bloom Taxonomy, 5E Instructional Model, Continuous Comprehensive Evaluation (CCE), and Diagnostic tests.',
                                entities: ['Bloom Revised Taxonomy (6 Cognitive Levels)', '5E Model (Engage, Explore, Explain, Elaborate, Evaluate)', 'Continuous & Comprehensive Evaluation (CCE)', 'Formative vs Summative Assessment', 'Diagnostic & Remedial Teaching', 'Rubrics & Portfolios'],
                                children: [
                                    { id: 'tet-cdp-bloom', label: 'Bloom Revised Taxonomy of Objectives', label_kn: 'ಬ್ಲೂಮ್ಸ್ ವರ್ಗೀಕರಣ', category: 'topic', entities: ['Remembering, Understanding, Applying', 'Analyzing, Evaluating, Creating', 'Affective & Psychomotor Domains'] },
                                    { id: 'tet-cdp-cce', label: 'CCE & Assessment Paradigms', label_kn: 'ನಿರಂತರ ಸಮಗ್ರ ಮೌಲ್ಯಮಾಪನ (CCE)', category: 'topic', entities: ['Assessment FOR Learning (Formative)', 'Assessment OF Learning (Summative)', 'Assessment AS Learning (Self/Peer)', 'Anecdotal Records & Portfolios'] }
                                ]
                            },
                            {
                                id: 'tet-cdp-policy',
                                label: 'National Educational Policies & Legal Frameworks',
                                label_kn: 'ರಾಷ್ಟ್ರೀಯ ಶಿಕ್ಷಣ ನೀತಿಗಳು ಮತ್ತು ಕಾಯ್ದೆಗಳು',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Constitutional mandates, NEP 2020 5+3+3+4 architecture, and RTE Act 2009 statutory standards.',
                                entities: ['NEP 2020 (5+3+3+4 Structure)', 'NIPUN Bharat (FLN Mission)', 'Article 21A & RTE Act 2009 (25% Quota, PTR 30:1)', 'NCF-FS 2022 & NCF-SE 2023', 'PARAKH Assessment Standard', 'POCSO Act 2012'],
                                children: [
                                    { id: 'tet-cdp-nep', label: 'National Education Policy 2020 Architecture', label_kn: 'ಎನ್‌ಇಪಿ ೨೦೨೦ ರಚನೆ', category: 'topic', entities: ['Foundational Stage (Ages 3-8)', 'Preparatory (8-11)', 'Middle (11-14)', 'Secondary (14-18)', 'Mother Tongue Instruction', 'HECI Restructuring'] },
                                    { id: 'tet-cdp-rte', label: 'Right to Education Act 2009 (RTE)', label_kn: 'ಆರ್‌ಟಿಇ ಕಾಯ್ದೆ ೨೦೦೯', category: 'topic', entities: ['Free & Compulsory Education (6-14 Yrs)', '25% EWS Private School Quota', 'No-Detention Policy & Amendment', 'School Management Committees (SMC)'] }
                                ]
                            }
                        ]
                    },
                    {
                        id: 'tet-lang-methods',
                        label: 'Language Pedagogy & Content (Kannada & English)',
                        label_kn: 'ಭಾಷಾ ಬೋಧನಾಶಾಸ್ತ್ರ (ಕನ್ನಡ ಮತ್ತು ಇಂಗ್ಲಿಷ್)',
                        category: 'paper',
                        badge: '60 Qs · 60 Marks',
                        weightage: 'High',
                        color: '#EC4899',
                        children: [
                            {
                                id: 'tet-kan-ped',
                                label: 'Kannada Language Teaching Methods (ಕನ್ನಡ ಬೋಧನಾಶಾಸ್ತ್ರ)',
                                label_kn: 'ಕನ್ನಡ ಭಾಷಾ ಬೋಧನಾ ಪದ್ಧತಿಗಳು',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Language acquisition skills (LSRW), grammar pedagogy, comprehension, and phonetic principles.',
                                entities: ['ಶ್ರವಣ, ಭಾಷಣ, ವಾಚನ, ಲೇಖನ (LSRW ಕೌಶಲಗಳು)', 'ವ್ಯಾಕರಣ ಬೋಧನಾ ಪದ್ಧತಿಗಳು (ಆಗಮನ-ನಿಗಮನ)', 'ಕನ್ನಡ ವ್ಯಾಕರಣ ರಚನೆ', 'ಪದ್ಯ ಮತ್ತು ಗದ್ಯ ಬೋಧನಾ ವಿಧಾನಗಳು'],
                                children: [
                                    { id: 'tet-kan-lsrw', label: 'Four Core Language Skills (ಕೌಶಲಗಳು)', label_kn: 'ಭಾಷಾ ಕೌಶಲಗಳು', category: 'topic', entities: ['Listening & Speaking', 'Silent & Loud Reading', 'Writing Precision & Calligraphy'] }
                                ]
                            },
                            {
                                id: 'tet-eng-ped',
                                label: 'English Language Teaching (ELT) & Pedagogy',
                                label_kn: 'ಇಂಗ್ಲಿಷ್ ಬೋಧನಾಶಾಸ್ತ್ರ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Second language acquisition, communicative language teaching (CLT), phonics, and grammar.',
                                entities: ['Direct Method vs Grammar-Translation (GTM)', 'Communicative Language Teaching (CLT)', 'Phonetics & IPA Symbols', 'Error Analysis & Remedial English'],
                                children: [
                                    { id: 'tet-eng-clt', label: 'Approaches & Methods of ELT', label_kn: 'ELT Methods', category: 'topic', entities: ['Communicative Approach', 'Bilingual Method', 'Structural Approach', 'Remedial Teaching'] }
                                ]
                            }
                        ]
                    }
                ]
            };

        // ═══════════════════════════════════════════════════════════════
        // 5. KSP PSI (POLICE SUB-INSPECTOR)
        // ═══════════════════════════════════════════════════════════════
        case 'ksp-psi':
            return {
                id: 'psi-root',
                label: 'KSP Police Sub-Inspector (PSI) Examination',
                label_kn: 'ಕರ್ನಾಟಕ ರಾಜ್ಯ ಪೊಲೀಸ್ ಸಬ್-ಇನ್‌ಸ್ಪೆಕ್ಟರ್ (ಪಿಎಸ್‌ಐ)',
                category: 'exam',
                color: '#DC2626',
                children: [
                    {
                        id: 'psi-p1',
                        label: 'Paper 1: Descriptive Translation, Precis & Essay',
                        label_kn: 'ಪತ್ರಿಕೆ ೧: ವಿವರಣಾತ್ಮಕ ಭಾಷಾಂತರ, ಸಂಕ್ಷೇಪಣ ಮತ್ತು ಪ್ರಬಂಧ',
                        category: 'paper',
                        badge: '50 Marks (Qualifying & Merit Filter)',
                        weightage: 'Very High',
                        color: '#B91C1C',
                        children: [
                            {
                                id: 'psi-p1-trans',
                                label: 'Bilingual Translation Techniques (ಭಾಷಾಂತರ)',
                                label_kn: 'ಭಾಷಾಂತರ ಕೌಶಲಗಳು',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Direct legal, administrative, and general passage translation between English and Kannada.',
                                entities: ['English to Kannada Translation (20 Marks)', 'Kannada to English Translation (10 Marks)', 'SVO to SOV Syntactic Shift', 'Legal & Policing Terminology', 'Contextual Equivalence'],
                                children: [
                                    { id: 'psi-p1-eng-kan', label: 'English to Kannada Translation Principles', label_kn: 'ಇಂಗ್ಲಿಷ್‌ನಿಂದ ಕನ್ನಡ ಭಾಷಾಂತರ', category: 'topic', entities: ['Passive to Active Voice in Kannada', 'Administrative Nomenclature', 'Avoiding Literal Word-by-Word Traps'] },
                                    { id: 'psi-p1-kan-eng', label: 'Kannada to English Translation Principles', label_kn: 'ಕನ್ನಡದಿಂದ ಇಂಗ್ಲಿಷ್ ಭಾಷಾಂತರ', category: 'topic', entities: ['Tense Consistency', 'Complex Sentence Breaking', 'Precise Vocabulary Substitution'] }
                                ]
                            },
                            {
                                id: 'psi-p1-precis',
                                label: 'Precis Writing & Summarization (ಸಂಕ್ಷೇಪಣ)',
                                label_kn: 'ಸಂಕ್ಷೇಪಣ ಲೇಖನ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Distilling dense passages into 1/3rd word count while maintaining core thesis and assigning an apt title.',
                                entities: ['1/3rd Rule Calculation', 'Eliminating Analogies & Examples', 'Single Continuous Paragraph Form', 'Appropriate Title Formulation', 'Own Words Expression'],
                                children: [
                                    { id: 'psi-p1-precis-rules', label: 'Rules & Methodology of Precis Writing', label_kn: 'ಸಂಕ್ಷೇಪಣ ನಿಯಮಗಳು', category: 'topic', entities: ['Title Extraction', 'Rough Draft to Final Draft', 'Word Limit Strict Compliance'] }
                                ]
                            },
                            {
                                id: 'psi-p1-essay',
                                label: 'Contemporary Essay Formulation (ಪ್ರಬಂಧ ಲೇಖನ)',
                                label_kn: 'ಪ್ರಬಂಧ ರಚನೆ',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Structured essay on internal security, police reforms, constitutional values, and Karnataka socioeconomic issues.',
                                entities: ['Police Reforms & Prakash Singh Guidelines', 'Cyber Crime & Dark Web Policing', 'Women & Child Safety in Karnataka', 'Artificial Intelligence in Law Enforcement', 'Economic Growth vs Environmental Protection'],
                                children: [
                                    { id: 'psi-p1-essay-struct', label: 'Essay Architecture (Intro, Body, Way Forward)', label_kn: 'ಪ್ರಬಂಧ ಮಾದರಿ', category: 'topic', entities: ['Hook / Quotation Introduction', 'Multi-dimensional Analysis (PESTLE)', 'Forward-Looking Constructive Conclusion'] }
                                ]
                            }
                        ]
                    },
                    {
                        id: 'psi-p2',
                        label: 'Paper 2: General Studies, Constitution & Security',
                        label_kn: 'ಪತ್ರಿಕೆ ೨: ಸಾಮಾನ್ಯ ಜ್ಞಾನ, ಸಂವಿಧಾನ ಮತ್ತು ಆಂತರಿಕ ಭದ್ರತೆ',
                        category: 'paper',
                        badge: '100 Qs · 150 Marks',
                        weightage: 'Very High',
                        color: '#1E40AF',
                        children: [
                            {
                                id: 'psi-p2-const',
                                label: 'Indian Constitution & Criminal Justice System',
                                label_kn: 'ಭಾರತ ಸಂವಿಧಾನ ಮತ್ತು ಅಪರಾಧ ನ್ಯಾಯ ವ್ಯವಸ್ಥೆ',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Fundamental Rights, arrest and detention safeguards (Article 22), emergency powers, and judicial oversight.',
                                entities: ['Article 20 (Self-Incrimination & Double Jeopardy)', 'Article 21 & 22 (Arrest & Detention Protections)', 'D.K. Basu Guidelines on Arrest', 'Preamble, Fundamental Rights & Duties', 'Supreme Court & High Court Writs (Habeas Corpus)'],
                                children: [
                                    { id: 'psi-p2-rights', label: 'Constitutional Rights of Arrested Persons', label_kn: 'ಬಂಧಿತ ವ್ಯಕ್ತಿಯ ಹಕ್ಕುಗಳು', category: 'topic', entities: ['24 Hours Magistrate Production Rule', 'Right to Legal Counsel', 'FIR Statutory Requirements', 'Bail Jurisprudence'] }
                                ]
                            },
                            {
                                id: 'psi-p2-security',
                                label: 'Internal Security, Cyber Crime & Police Administration',
                                label_kn: 'ಆಂತರಿಕ ಭದ್ರತೆ ಮತ್ತು ಪೊಲೀಸ್ ಆಡಳಿತ',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Police organizational hierarchy in Karnataka, coastal security, cyber forensic tools, and riot management.',
                                entities: ['Karnataka Police Act 1963', 'Police Hierarchy (DGP to Constable)', 'Cyber Crime Police Stations (CEN)', 'Coastal Security Police (CSP Karnataka)', 'Organized Crime, Narcotics (NDPS Act) & Human Trafficking'],
                                children: [
                                    { id: 'psi-p2-hierarchy', label: 'Karnataka State Police Cadre & Hierarchy', label_kn: 'ಕರ್ನಾಟಕ ಪೊಲೀಸ್ ಶ್ರೇಣಿ', category: 'topic', entities: ['State Police Chief (DGP)', 'Range IGPs & SPs', 'Sub-Divisional DSP/ACP', 'Station House Officer (Circle Inspector & PSI)'] }
                                ]
                            },
                            {
                                id: 'psi-p2-kar-hist',
                                label: 'Karnataka History, Geography & Modern Freedom Struggle',
                                label_kn: 'ಕರ್ನಾಟಕ ಇತಿಹಾಸ ಮತ್ತು ಭೂಗೋಳ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Key Karnataka dynasties, Mysuru Kingdom, Kittur Rani Chennamma, Sangolli Rayanna, and unification.',
                                entities: ['Kadambas & Halmidi Inscription', 'Vijayanagara Empire (Krishnadevaraya)', 'Kittur Rebellion & Sangolli Rayanna', 'Mysore Civil Service & Diwans (Sir MV, Seshadri Iyer)', 'Karnataka Rivers (Cauvery, Krishna, Sharavathi)'],
                                children: [
                                    { id: 'psi-p2-dynasties', label: 'Major Dynasties & Architectural Heritage', label_kn: 'ಕರ್ನಾಟಕ ರಾಜವಂಶಗಳು', category: 'topic', entities: ['Badami Chalukyas', 'Rashtrakutas', 'Hoysalas of Halebidu', 'Bahmani & Adil Shahi of Vijayapura'] }
                                ]
                            },
                            {
                                id: 'psi-p2-gma',
                                label: 'General Mental Ability, Numerical Logic & Reasoning',
                                label_kn: 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Number series, direction sense, blood relations, syllogisms, speed-distance-time, and data reasoning.',
                                entities: ['Coding-Decoding & Number Series', 'Direction & Distance Problems', 'Blood Relations & Family Tree', 'Syllogisms & Venn Diagrams', 'Percentages, Ratios & Time-Work'],
                                children: [
                                    { id: 'psi-p2-reasoning', label: 'Logical & Analytical Reasoning Drills', label_kn: 'ತಾರ್ಕಿಕ ಸಾಮರ್ಥ್ಯ', category: 'topic', entities: ['Statement & Conclusions', 'Seating Arrangements', 'Clock & Calendar Calculations'] }
                                ]
                            }
                        ]
                    }
                ]
            };

        // ═══════════════════════════════════════════════════════════════
        // 6. KSP POLICE CONSTABLE (PC)
        // ═══════════════════════════════════════════════════════════════
        case 'ksp-pc':
            return {
                id: 'pc-root',
                label: 'KSP Police Constable (PC - Civil & CAR/DAR)',
                label_kn: 'ಕರ್ನಾಟಕ ರಾಜ್ಯ ಪೊಲೀಸ್ ಕಾನ್ಸ್ಟೇಬಲ್ (ಸಿವಿಲ್ & ಸಿಎಆರ್/ಡಿಎಆರ್)',
                category: 'exam',
                color: '#082C54',
                children: [
                    {
                        id: 'pc-written',
                        label: 'Stage 1: Objective Written Examination',
                        label_kn: 'ಹಂತ ೧: ವಸ್ತುನಿಷ್ಠ ಲಿಖಿತ ಪರೀಕ್ಷೆ',
                        category: 'paper',
                        badge: '100 Questions · 100 Marks · 90 Mins',
                        weightage: 'Very High',
                        color: '#0D9488',
                        children: [
                            {
                                id: 'pc-gk-hist',
                                label: 'Indian History & Freedom Struggle (ಇತಿಹಾಸ)',
                                label_kn: 'ಭಾರತ & ಕರ್ನಾಟಕ ಇತಿಹಾಸ',
                                category: 'domain',
                                weightage: 'Very High',
                                description: 'Ancient, Medieval, Modern Indian Freedom Movement, and Karnataka Dynasties (Kadambas, Chalukyas, Vijayanagara, Wodeyars).',
                                entities: ['Vijayanagara Empire & Hampi', 'Mysore Wodeyars & Dewans', '1857 Revolt & Karnataka Rebellions', 'National Movement & Unification of Karnataka'],
                                children: [
                                    { id: 'pc-hist-mod', label: 'Modern India & National Movement', label_kn: 'ಆಧುನಿಕ ಭಾರತ ಮತ್ತು ರಾಷ್ಟ್ರೀಯ ಚಳವಳಿ', category: 'topic', entities: ['Gandhian Era', 'Quit India Movement', 'Social Reform Movements'] }
                                ]
                            },
                            {
                                id: 'pc-polity',
                                label: 'Indian Constitution & Governance (ಭಾರತೀಯ ಸಂವಿಧಾನ)',
                                label_kn: 'ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Preamble, Fundamental Rights, DPSP, Parliament, Executive, Judiciary, and Police Acts.',
                                entities: ['Articles 12-35 (Fundamental Rights)', 'Articles 36-51 (DPSP)', 'President & Governor Roles', 'Karnataka Police Act 1963 & IPC/CrPC/BNS Basics'],
                                children: [
                                    { id: 'pc-pol-fr', label: 'Fundamental Rights & Writs', label_kn: 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು ಮತ್ತು ರಿಟ್‌ಗಳು', category: 'topic', entities: ['Article 32 & 226 Writs', 'Right to Equality', 'Right to Life & Personal Liberty'] }
                                ]
                            },
                            {
                                id: 'pc-science',
                                label: 'General Science & Everyday Technology (ಸಾಮಾನ್ಯ ವಿಜ್ಞಾನ)',
                                label_kn: 'ದೈನಂದಿನ ವಿಜ್ಞಾನ & ತಂತ್ರಜ್ಞಾನ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Physics concepts in daily life, Chemistry basics, Human Biology, Nutrition, and Health.',
                                entities: ['Newtonian Laws & Motion', 'Human Body Systems & Diseases', 'Vitamins & Deficiency Disorders', 'ISRO Satellite Launches & Space Technology'],
                                children: [
                                    { id: 'pc-sci-bio', label: 'Human Physiology & Nutrition', label_kn: 'ಮಾನವ ಶರೀರಶಾಸ್ತ್ರ ಮತ್ತು ಪೋಷಕಾಂಶಗಳು', category: 'topic', entities: ['Blood Circulation & Blood Groups', 'Infectious & Non-infectious Diseases', 'Endocrine Glands'] }
                                ]
                            },
                            {
                                id: 'pc-gma',
                                label: 'Mental Ability & Quantitative Aptitude (ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ)',
                                label_kn: 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ & ಗಣಿತ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Coding-decoding, number series, blood relations, direction sense, and basic arithmetic.',
                                entities: ['Number & Letter Series', 'Coding-Decoding', 'Blood Relations & Direction Sense', 'Time & Work, Speed & Distance, Percentages'],
                                children: [
                                    { id: 'pc-gma-reasoning', label: 'Logical & Analytical Reasoning', label_kn: 'ತಾರ್ಕಿಕ ಸಾಮರ್ಥ್ಯ', category: 'topic', entities: ['Analogy', 'Venn Diagrams', 'Seating Arrangements'] }
                                ]
                            },
                            {
                                id: 'pc-geo-env',
                                label: 'Geography, Karnataka Resources & Environment (ಭೂಗೋಳ & ಪರಿಸರ)',
                                label_kn: 'ಭೂಗೋಳ ಮತ್ತು ಪರಿಸರ ವ್ಯವಸ್ಥೆ',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Rivers of Karnataka, National Parks, Mineral distribution, Census 2011, and Climate.',
                                entities: ['Krishna & Cauvery River Basins', 'Karnataka Census 2011 Demographics', 'Western Ghats Biodiversity & Wildlife Sanctuaries', 'Dams & Hydroelectric Projects in Karnataka'],
                                children: [
                                    { id: 'pc-geo-rivers', label: 'Karnataka River Systems & Irrigation', label_kn: 'ಕರ್ನಾಟಕದ ನದಿ ವ್ಯವಸ್ಥೆ', category: 'topic', entities: ['Krishna, Tungabhadra, Cauvery', 'East & West Flowing Rivers', 'Major Reservoirs (KRS, Almatti)'] }
                                ]
                            }
                        ]
                    },
                    {
                        id: 'pc-pet',
                        label: 'Stage 2: Physical Standard & Endurance Test (ET & PST)',
                        label_kn: 'ಹಂತ ೨: ದೈಹಿಕ ಸಾಮರ್ಥ್ಯ & ಮಾನದಂಡ ಪರೀಕ್ಷೆ',
                        category: 'paper',
                        badge: 'Qualifying Standard',
                        weightage: 'High',
                        color: '#EA580C',
                        children: [
                            {
                                id: 'pc-pst-standards',
                                label: 'Physical Standard Test (PST)',
                                label_kn: 'ದೈಹಿಕ ಗುಣಮಟ್ಟ ಪರೀಕ್ಷೆ (PST)',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Height, chest measurements for male and female candidates.',
                                entities: ['Men: Height Minimum 168 cm, Chest 86 cm (5 cm expansion)', 'Women: Height Minimum 157 cm, Weight 45 kg', 'Tribal Candidates Height Relaxation (155 cm)']
                            },
                            {
                                id: 'pc-et-events',
                                label: 'Endurance Test Events (ET)',
                                label_kn: 'ದೈಹಿಕ ಸಹಿಷ್ಣುತಾ ಪರೀಕ್ಷೆ (ET)',
                                category: 'domain',
                                weightage: 'High',
                                description: 'Running, high jump, long jump, and shot put standards.',
                                entities: ['Men: 1600m Run in 6 mins 30 secs', 'Men: Long Jump 3.80m or High Jump 1.20m', 'Men: Shot Put (7.26 kg) 5.60m', 'Women: 400m Run in 2 mins, Long Jump 2.50m or High Jump 0.90m']
                            }
                        ]
                    }
                ]
            };

        // ═══════════════════════════════════════════════════════════════
        // DEFAULT FALLBACK
        // ═══════════════════════════════════════════════════════════════
        default:
            return getExamMindMap('upsc-cse');
    }
}
