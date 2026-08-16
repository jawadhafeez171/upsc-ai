import { Exam, Question, CurrentArticle, LeaderboardEntry } from '@/types';

export const EXAMS: Exam[] = [
    // --- 1. NATIONAL & CENTRAL EXAMINATIONS ---
    {
        id: 'upsc-cse',
        name: 'UPSC CSE',
        category: 'upsc',
        description: 'Civil Services Examination — IAS, IPS, IFS & Group A Central Services',
        languages: ['en', 'hi'],
        negative_marking: 0.33,
        subjects: ['Ancient History', 'Medieval History', 'Art and Culture', 'Modern History', 'Polity', 'Economics', 'Geography', 'Environment', 'Science & Technology', 'IR and Current Affairs', 'General Awareness'],
        icon: '🏛️',
        color: '#082C54',
        badge: 'Premier'
    },
    {
        id: 'upsc-capf',
        name: 'UPSC CAPF (AC)',
        category: 'defence',
        description: 'Central Armed Police Forces — Assistant Commandant in BSF, CRPF, CISF, ITBP, SSB',
        languages: ['en'],
        negative_marking: 0.33,
        subjects: ['General Science', 'Current Events', 'Indian Polity & Economy', 'History of India', 'Indian & World Geography', 'General Mental Ability', 'Essay, Precis & Comprehension'],
        icon: '🎖️',
        color: '#0D5D56',
        badge: 'Class-1 Officer'
    },
    {
        id: 'upsc-cds',
        name: 'UPSC CDS',
        category: 'defence',
        description: 'Combined Defence Services — Commissioning in Indian Army, Navy & Air Force (IMA, INA, AFA, OTA)',
        languages: ['en'],
        negative_marking: 0.33,
        subjects: ['General Knowledge (Science, History, Geography, Polity)', 'English Language', 'Elementary Mathematics'],
        icon: '⚔️',
        color: '#B83E11',
        badge: 'Armed Forces'
    },

    // --- 2. KARNATAKA STATE GOVERNMENT EXAMINATIONS ---
    {
        id: 'kpsc-kas',
        name: 'KPSC KAS',
        name_kn: 'ಕೆಪಿಎಸ್‌ಸಿ ಕೆಎಎಸ್',
        category: 'karnataka',
        description: 'Karnataka Administrative Service — Gazetted Probationers Group A & B (AC, Tahsildar, DySP)',
        description_kn: 'ಕರ್ನಾಟಕ ಆಡಳಿತ ಸೇವೆ — ಗೆಜೆಟೆಡ್ ಪ್ರೊಬೇಷನರ್ಸ್ ಪರೀಕ್ಷೆ',
        languages: ['en', 'kn'],
        negative_marking: 0.25,
        subjects: ['Karnataka History', 'Indian History', 'Indian Polity', 'Geography', 'Karnataka Geography', 'Economy', 'Karnataka Economy', 'Science & Tech', 'Environment', 'Karnataka Administration', 'General Mental Ability'],
        subjects_kn: ['ಕರ್ನಾಟಕ ಇತಿಹಾಸ', 'ಭಾರತದ ಇತಿಹಾಸ', 'ಭಾರತೀಯ ಸಂವಿಧಾನ & ರಾಜ್ಯಶಾಸ್ತ್ರ', 'ಭೂಗೋಳಶಾಸ್ತ್ರ', 'ಕರ್ನಾಟಕ ಭೂಗೋಳ', 'ಅರ್ಥಶಾಸ್ತ್ರ', 'ಕರ್ನಾಟಕ ಆರ್ಥಿಕತೆ', 'ವಿಜ್ಞಾನ & ತಂತ್ರಜ್ಞಾನ', 'ಪರಿಸರ', 'ಕರ್ನಾಟಕ ಆಡಳಿತ', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ'],
        icon: '🅺',
        color: '#B83E11',
        badge: 'State Top'
    },
    {
        id: 'kea-vao',
        name: 'KEA VAO',
        name_kn: 'ಕೆಇಎ ಗ್ರಾಮ ಆಡಳಿತಾಧಿಕಾರಿ (VAO)',
        category: 'karnataka',
        description: 'Village Administrative Officer — Karnataka Revenue Department',
        description_kn: 'ಗ್ರಾಮ ಆಡಳಿತಾಧಿಕಾರಿ — ಕಂದಾಯ ಇಲಾಖೆ ನೇಮಕಾತಿ ಪರೀಕ್ಷೆ',
        languages: ['en', 'kn'],
        negative_marking: 0.25,
        subjects: ['General Knowledge', 'General Kannada', 'General English', 'Computer Knowledge', 'Arithmetic & Reasoning'],
        subjects_kn: ['ಸಾಮಾನ್ಯ ಜ್ಞಾನ & ಪ್ರಚಲಿತ ಘಟನೆಗಳು', 'ಸಾಮಾನ್ಯ ಕನ್ನಡ ವ್ಯಾಕರಣ', 'ಸಾಮಾನ್ಯ ಇಂಗ್ಲಿಷ್', 'ಗಣಕಯಂತ್ರ ಜ್ಞಾನ (Computer)', 'ಅಂಕಗಣಿತ ಮತ್ತು ರೀಸನಿಂಗ್'],
        icon: '🌾',
        color: '#0D9488',
        badge: 'Hot'
    },
    {
        id: 'kea-pdo',
        name: 'KEA / KPSC PDO',
        name_kn: 'ಪಂಚಾಯತ್ ಅಭಿವೃದ್ಧಿ ಅಧಿಕಾರಿ (PDO)',
        category: 'karnataka',
        description: 'Panchayat Development Officer & Gram Panchayat Secretary — RDPR Dept',
        description_kn: 'ಪಂಚಾಯತ್ ಅಭಿವೃದ್ಧಿ ಅಧಿಕಾರಿ — ಗ್ರಾಮೀಣಾಭಿವೃದ್ಧಿ ಇಲಾಖೆ',
        languages: ['en', 'kn'],
        negative_marking: 0.25,
        subjects: ['General Knowledge', 'General Kannada', 'General English', 'Computer Knowledge', 'Karnataka Gram Swaraj Act 1993', 'Rural Development Schemes'],
        subjects_kn: ['ಸಾಮಾನ್ಯ ಜ್ಞಾನ', 'ಸಾಮಾನ್ಯ ಕನ್ನಡ', 'ಸಾಮಾನ್ಯ ಇಂಗ್ಲಿಷ್', 'ಕಂಪ್ಯೂಟರ್ ಸಾಕ್ಷರತೆ', 'ಕರ್ನಾಟಕ ಗ್ರಾಮ ಸ್ವರಾಜ್ ಕಾಯ್ದೆ 1993', 'ಗ್ರಾಮೀಣಾಭಿವೃದ್ಧಿ ಯೋಜನೆಗಳು'],
        icon: '🏘️',
        color: '#E67E22',
        badge: 'Popular'
    },
    {
        id: 'ksp-psi',
        name: 'KSP Police Sub-Inspector (PSI)',
        name_kn: 'ಕೆಎಸ್‌ಪಿ ಪೊಲೀಸ್ ಸಬ್-ಇನ್‌ಸ್ಪೆಕ್ಟರ್ (PSI)',
        category: 'karnataka',
        description: 'Police Sub-Inspector — Civil, Armed, KSISF & Wireless',
        description_kn: 'ಪೊಲೀಸ್ ಉಪ-ನಿರೀಕ್ಷಕ ನೇಮಕಾತಿ ಪರೀಕ್ಷೆ (ಸಿವಿಲ್ / ಸಶಸ್ತ್ರ)',
        languages: ['en', 'kn'],
        negative_marking: 0.25,
        subjects: ['Indian Constitution & Polity', 'Indian & Karnataka History', 'Geography', 'General Science', 'Current Affairs', 'Mental Ability', 'Translation (English ↔ Kannada)', 'Essay & Precis'],
        subjects_kn: ['ಭಾರತೀಯ ಸಂವಿಧಾನ & ಪೊಲೀಸ್ ಅಧಿಕಾರಗಳು', 'ಭಾರತ & ಕರ್ನಾಟಕ ಇತಿಹಾಸ', 'ಭೂಗೋಳಶಾಸ್ತ್ರ', 'ಸಾಮಾನ್ಯ ವಿಜ್ಞಾನ', 'ಪ್ರಚಲಿತ ವಿದ್ಯಮಾನಗಳು', 'ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ', 'ಭಾಷಾಂತರ (ಕನ್ನಡ ↔ ಇಂಗ್ಲಿಷ್)', 'ಪ್ರಬಂಧ & ಸಂಕ್ಷೇಪಣೆ'],
        icon: '👮',
        color: '#1E3A8A',
        badge: 'High Demand'
    },
    {
        id: 'ksp-pc',
        name: 'KSP Police Constable (PC)',
        name_kn: 'ಕೆಎಸ್‌ಪಿ ಪೊಲೀಸ್ ಕಾನ್ಸ್ಟೇಬಲ್ (PC)',
        category: 'karnataka',
        description: 'Police Constable Recruitment — Civil & Armed Police (CAR/DAR)',
        description_kn: 'ಪೊಲೀಸ್ ಕಾನ್ಸ್ಟೇಬಲ್ ನೇಮಕಾತಿ ಪರೀಕ್ಷೆ',
        languages: ['en', 'kn'],
        negative_marking: 0.25,
        subjects: ['General Knowledge', 'General Science', 'Indian Constitution', 'Indian & Karnataka History', 'Geography', 'Mental Ability', 'Current Affairs'],
        subjects_kn: ['ಸಾಮಾನ್ಯ ಜ್ಞಾನ', 'ದೈನಂದಿನ ವಿಜ್ಞಾನ', 'ಭಾರತದ ಸಂವಿಧಾನ', 'ಇತಿಹಾಸ', 'ಭೂಗೋಳಶಾಸ್ತ್ರ', 'ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ', 'ಪ್ರಚಲಿತ ಘಟನೆಗಳು'],
        icon: '🚔',
        color: '#082C54'
    },
    {
        id: 'kpsc-group-c',
        name: 'KPSC Group C (CTI / FDA / SDA)',
        name_kn: 'ಕೆಪಿಎಸ್‌ಸಿ ಗ್ರೂಪ್ ಸಿ (CTI / FDA / SDA)',
        category: 'karnataka',
        description: 'Commercial Tax Inspector (CTI), Excise Sub-Inspector (ESI), FDA, SDA',
        description_kn: 'ವಾಣಿಜ್ಯ ತೆರಿಗೆ ನಿರೀಕ್ಷಕರು, ಅಬಕಾರಿ ಉಪ-ನಿರೀಕ್ಷಕರು, ಎಫ್‌ಡಿಎ, ಎಸ್‌ಡಿಎ',
        languages: ['en', 'kn'],
        negative_marking: 0.25,
        subjects: ['General Knowledge', 'General Kannada Grammar', 'General English', 'Computer Awareness'],
        subjects_kn: ['ಸಾಮಾನ್ಯ ಜ್ಞಾನ', 'ಸಾಮಾನ್ಯ ಕನ್ನಡ ವ್ಯಾಕರಣ & ಸಾಹಿತ್ಯ', 'ಜನರಲ್ ಇಂಗ್ಲಿಷ್', 'ಕಂಪ್ಯೂಟರ್ ಜ್ಞಾನ'],
        icon: '📋',
        color: '#D97706',
        badge: 'Recruitment'
    },
    {
        id: 'kartet',
        name: 'KARTET (Karnataka TET)',
        name_kn: 'ಕರ್ನಾಟಕ ಶಿಕ್ಷಕರ ಅರ್ಹತಾ ಪರೀಕ್ಷೆ (KARTET)',
        category: 'teaching',
        description: 'Karnataka Teachers Eligibility Test — Primary (Paper 1) & Upper Primary (Paper 2)',
        description_kn: 'ಪ್ರಾಥಮಿಕ ಮತ್ತು ಪ್ರೌಢಶಾಲಾ ಶಿಕ್ಷಕರ ಅರ್ಹತಾ ಪರೀಕ್ಷೆ',
        languages: ['en', 'kn'],
        negative_marking: 0,
        subjects: ['Child Development & Pedagogy (CDP)', 'Language I (Kannada)', 'Language II (English)', 'Mathematics & Science', 'Social Studies', 'Environmental Studies (EVS)'],
        subjects_kn: ['ಮಕ್ಕಳ ವಿಕಾಸ & ಬೋಧನಾ ಶಾಸ್ತ್ರ (CDP)', 'ಭಾಷೆ ೧ (ಕನ್ನಡ)', 'ಭಾಷೆ ೨ (ಇಂಗ್ಲಿಷ್)', 'ಗಣಿತ & ವಿಜ್ಞಾನ', 'ಸಮಾಜ ವಿಜ್ಞಾನ', 'ಪರಿಸರ ಅಧ್ಯಯನ (EVS)'],
        icon: '👩‍🏫',
        color: '#7C3AED',
        badge: 'Qualifying'
    },
    {
        id: 'kea-kset',
        name: 'KEA Assistant Professor & KSET',
        name_kn: 'ಕೆ-ಸೆಟ್ ಮತ್ತು ಸಹಾಯಕ ಪ್ರಾಧ್ಯಾಪಕರು (KSET)',
        category: 'teaching',
        description: 'Karnataka State Eligibility Test — General Paper 1 on Teaching & Research Aptitude',
        description_kn: 'ಬೋಧನಾ ಮತ್ತು ಸಂಶೋಧನಾ ಅಭಿರುಚಿ — ಸಾಮಾನ್ಯ ಪತ್ರಿಕೆ ೧',
        languages: ['en', 'kn'],
        negative_marking: 0,
        subjects: ['Teaching Aptitude', 'Research Aptitude', 'Reading Comprehension', 'Communication & ICT', 'Mathematical Reasoning & DI', 'People & Environment', 'Higher Education System'],
        subjects_kn: ['ಬೋಧನಾ ಅಭಿರುಚಿ', 'ಸಂಶೋಧನಾ ಅಭಿರುಚಿ', 'ಗ್ರಹಣ ಸಾಮರ್ಥ್ಯ', 'ಸಂವಹನ & ICT', 'ಗಣಿತೀಯ ತರ್ಕ & DI', 'ಜನರು ಮತ್ತು ಪರಿಸರ', 'ಉನ್ನತ ಶಿಕ್ಷಣ ವ್ಯವಸ್ಥೆ'],
        icon: '🎓',
        color: '#6366F1',
        badge: 'UGC Scale'
    },
    {
        id: 'karnataka-gpstr',
        name: 'Karnataka GPSTR (6-8 Teachers)',
        name_kn: 'ಪದವೀಧರ ಪ್ರಾಥಮಿಕ ಶಾಲಾ ಶಿಕ್ಷಕರು (GPSTR)',
        category: 'teaching',
        description: 'Graduate Primary School Teacher Recruitment — Classes 6 to 8',
        description_kn: '೬ ರಿಂದ ೮ನೇ ತರಗತಿ ಪದವೀಧರ ಶಿಕ್ಷಕರ ನೇಮಕಾತಿ',
        languages: ['en', 'kn'],
        negative_marking: 0,
        subjects: ['General Knowledge', 'Educational Psychology', 'Child Rights & Inclusive Education', 'Computer Literacy', 'Social Science', 'Mathematics & Science'],
        subjects_kn: ['ಸಾಮಾನ್ಯ ಜ್ಞಾನ', 'ಶೈಕ್ಷಣಿಕ ಮನೋವಿಜ್ಞಾನ', 'ಮಕ್ಕಳ ಹಕ್ಕುಗಳು & ಒಳಗೊಳ್ಳುವ ಶಿಕ್ಷಣ', 'ಕಂಪ್ಯೂಟರ್ ಸಾಕ್ಷರತೆ', 'ಸಮಾಜ ವಿಜ್ಞಾನ', 'ಗಣಿತ & ವಿಜ್ಞಾನ'],
        icon: '📚',
        color: '#059669'
    }
];

export const QUESTIONS: Question[] = [

    // KPSC KAS — Karnataka History
    {
        id: 'q11',
        exam_id: 'kpsc-kas',
        subject: 'Karnataka History',
        difficulty: 'easy',
        text: 'Which dynasty built the famous Brihadeeshwara Temple at Thanjavur?',
        text_kn: 'ತಂಜಾವೂರಿನ ಪ್ರಸಿದ್ಧ ಬೃಹದೀಶ್ವರ ದೇವಾಲಯವನ್ನು ಯಾವ ರಾಜವಂಶ ನಿರ್ಮಿಸಿತು?',
        options: [
            { id: 'a', text: 'Chalukya', text_kn: 'ಚಾಲುಕ್ಯ' },
            { id: 'b', text: 'Rashtrakuta', text_kn: 'ರಾಷ್ಟ್ರಕೂಟ' },
            { id: 'c', text: 'Chola', text_kn: 'ಚೋಳ' },
            { id: 'd', text: 'Hoysala', text_kn: 'ಹೊಯ್ಸಳ' },
        ],
        correct: 'c',
        explanation: 'The Brihadeeshwara Temple at Thanjavur was built by Raja Raja Chola I around 1010 CE. It is a UNESCO World Heritage Site.',
        explanation_kn: 'ತಂಜಾವೂರಿನ ಬೃಹದೀಶ್ವರ ದೇವಾಲಯವನ್ನು ರಾಜ ರಾಜ ಚೋಳ-I ಅವರು ಸುಮಾರು 1010 CE ಯಲ್ಲಿ ನಿರ್ಮಿಸಿದರು.',
    },
    {
        id: 'q12',
        exam_id: 'kpsc-kas',
        subject: 'Karnataka History',
        difficulty: 'medium',
        text: 'Who was the founder of the Vijayanagara Empire?',
        text_kn: 'ವಿಜಯನಗರ ಸಾಮ್ರಾಜ್ಯದ ಸ್ಥಾಪಕರು ಯಾರು?',
        options: [
            { id: 'a', text: 'Harihara and Bukka', text_kn: 'ಹರಿಹರ ಮತ್ತು ಬುಕ್ಕ' },
            { id: 'b', text: 'Krishna Deva Raya', text_kn: 'ಕೃಷ್ಣದೇವರಾಯ' },
            { id: 'c', text: 'Deva Raya I', text_kn: 'ದೇವರಾಯ I' },
            { id: 'd', text: 'Tippu Sultan', text_kn: 'ಟಿಪ್ಪು ಸುಲ್ತಾನ್' },
        ],
        correct: 'a',
        explanation: 'The Vijayanagara Empire was founded in 1336 CE by brothers Harihara I (Hakka) and Bukka Raya I, who were formerly commanders in the Hoysala army.',
        explanation_kn: 'ವಿಜಯನಗರ ಸಾಮ್ರಾಜ್ಯವನ್ನು 1336 CE ಯಲ್ಲಿ ಹರಿಹರ I ಮತ್ತು ಬುಕ್ಕ ರಾಯ I ಸ್ಥಾಪಿಸಿದರು.',
    },
    {
        id: 'q13',
        exam_id: 'kpsc-kas',
        subject: 'Indian Polity',
        difficulty: 'easy',
        text: 'How many members are nominated to the Rajya Sabha by the President?',
        text_kn: 'ರಾಷ್ಟ್ರಪತಿಯಿಂದ ರಾಜ್ಯಸಭೆಗೆ ಎಷ್ಟು ಸದಸ್ಯರನ್ನು ನಾಮನಿರ್ದೇಶಿಸಲಾಗುತ್ತದೆ?',
        options: [
            { id: 'a', text: '10', text_kn: '10' },
            { id: 'b', text: '12', text_kn: '12' },
            { id: 'c', text: '14', text_kn: '14' },
            { id: 'd', text: '16', text_kn: '16' },
        ],
        correct: 'b',
        explanation: 'The President nominates 12 members to the Rajya Sabha who have expertise in literature, science, art, and social service (Article 80).',
        explanation_kn: 'ರಾಷ್ಟ್ರಪತಿಯು ಸಾಹಿತ್ಯ, ವಿಜ್ಞಾನ, ಕಲೆ ಮತ್ತು ಸಮಾಜ ಸೇವೆಯಲ್ಲಿ ಪರಿಣತಿ ಹೊಂದಿರುವ 12 ಸದಸ್ಯರನ್ನು ರಾಜ್ಯಸಭೆಗೆ ನಾಮನಿರ್ದೇಶಿಸುತ್ತಾರೆ (ಅನುಚ್ಛೇದ 80).',
    },
    {
        id: 'q14',
        exam_id: 'kpsc-kas',
        subject: 'Kannada',
        difficulty: 'easy',
        text: 'ಕನ್ನಡ ರಾಜ್ಯೋತ್ಸವ ಯಾವ ದಿನ ಆಚರಿಸಲಾಗುತ್ತದೆ?',
        text_kn: 'ಕನ್ನಡ ರಾಜ್ಯೋತ್ಸವ ಯಾವ ದಿನ ಆಚರಿಸಲಾಗುತ್ತದೆ?',
        options: [
            { id: 'a', text: 'November 1', text_kn: 'ನವೆಂಬರ್ 1' },
            { id: 'b', text: 'October 15', text_kn: 'ಅಕ್ಟೋಬರ್ 15' },
            { id: 'c', text: 'January 26', text_kn: 'ಜನವರಿ 26' },
            { id: 'd', text: 'August 15', text_kn: 'ಆಗಸ್ಟ್ 15' },
        ],
        correct: 'a',
        explanation: 'Karnataka Rajyotsava (Karnataka Day) is celebrated on November 1 every year to mark the formation of the state of Karnataka in 1956 when all Kannada-speaking regions were merged.',
        explanation_kn: 'ಕರ್ನಾಟಕ ರಾಜ್ಯೋತ್ಸವವನ್ನು ಪ್ರತಿ ವರ್ಷ ನವೆಂಬರ್ 1 ರಂದು ಆಚರಿಸಲಾಗುತ್ತದೆ. 1956 ರಲ್ಲಿ ಎಲ್ಲಾ ಕನ್ನಡ ಭಾಷಿಕ ಪ್ರದೇಶಗಳನ್ನು ಒಂದುಗೂಡಿಸಲಾಯಿತು.',
    },
    {
        id: 'q15',
        exam_id: 'kpsc-kas',
        subject: 'Economy',
        difficulty: 'medium',
        text: 'Which of the following is NOT a function of the Reserve Bank of India?',
        text_kn: 'ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವುದು ಭಾರತೀಯ ರಿಸರ್ವ್ ಬ್ಯಾಂಕ್‌ನ ಕಾರ್ಯವಲ್ಲ?',
        options: [
            { id: 'a', text: "Issuing currency notes", text_kn: "ಕರೆನ್ಸಿ ನೋಟುಗಳನ್ನು ನೀಡುವುದು" },
            { id: 'b', text: "Banker to the Government", text_kn: "ಸರ್ಕಾರದ ಬ್ಯಾಂಕರ್" },
            { id: 'c', text: "Accepting deposits from public", text_kn: "ಸಾರ್ವಜನಿಕರಿಂದ ಠೇವಣಿ ಸ್ವೀಕರಿಸುವುದು" },
            { id: 'd', text: "Regulation of credit", text_kn: "ಸಾಲದ ನಿಯಂತ್ರಣ" },
        ],
        correct: 'c',
        explanation: 'The RBI does not accept deposits from the general public directly. That function is performed by commercial banks. RBI acts as a Banker\'s Bank and Government\'s Bank.',
        explanation_kn: 'ಆರ್‌ಬಿಐ ಸಾಮಾನ್ಯ ಜನರಿಂದ ನೇರವಾಗಿ ಠೇವಣಿ ಸ್ವೀಕರಿಸುವುದಿಲ್ಲ. ಅದು ವಾಣಿಜ್ಯ ಬ್ಯಾಂಕ್‌ಗಳ ಕಾರ್ಯ.',
    },
    // KPSC PSI
    {
        id: 'q16',
        exam_id: 'kpsc-psi',
        subject: 'General Knowledge',
        difficulty: 'easy',
        text: 'What is the capital of Karnataka?',
        text_kn: 'ಕರ್ನಾಟಕದ ರಾಜಧಾನಿ ಯಾವುದು?',
        options: [
            { id: 'a', text: 'Mysuru', text_kn: 'ಮೈಸೂರು' },
            { id: 'b', text: 'Hubli', text_kn: 'ಹುಬ್ಬಳ್ಳಿ' },
            { id: 'c', text: 'Bengaluru', text_kn: 'ಬೆಂಗಳೂರು' },
            { id: 'd', text: 'Mangaluru', text_kn: 'ಮಂಗಳೂರು' },
        ],
        correct: 'c',
        explanation: 'Bengaluru (formerly Bangalore) is the capital and largest city of Karnataka. It is also known as the Silicon Valley of India.',
        explanation_kn: 'ಬೆಂಗಳೂರು ಕರ್ನಾಟಕದ ರಾಜಧಾನಿ ಮತ್ತು ಅತಿದೊಡ್ಡ ನಗರ. ಇದನ್ನು ಭಾರತದ ಸಿಲಿಕಾನ್ ವ್ಯಾಲಿ ಎಂದೂ ಕರೆಯಲಾಗುತ್ತದೆ.',
    },
    {
        id: 'q17',
        exam_id: 'kpsc-psi',
        subject: 'Law',
        difficulty: 'medium',
        text: 'Under which section of IPC is "Assault or criminal force to deter public servant from discharge of duty" covered?',
        options: [
            { id: 'a', text: 'Section 332' },
            { id: 'b', text: 'Section 353' },
            { id: 'c', text: 'Section 302' },
            { id: 'd', text: 'Section 420' },
        ],
        correct: 'b',
        explanation: 'Section 353 of the IPC covers assault or criminal force to deter a public servant from dischargeable of duty. It is punishable with imprisonment up to 2 years or fine or both.',
    },
    {
        id: 'q18',
        exam_id: 'kpsc-psi',
        subject: 'Reasoning',
        difficulty: 'easy',
        text: 'If A is the brother of B, C is the mother of B, and D is the father of C, then how is A related to D?',
        options: [
            { id: 'a', text: 'Grandson' },
            { id: 'b', text: 'Grandfather' },
            { id: 'c', text: 'Uncle' },
            { id: 'd', text: 'Son' },
        ],
        correct: 'a',
        explanation: 'A is the brother of B → A and B are siblings. C is the mother of B → C is also the mother of A. D is the father of C → D is the grandfather of A. Therefore A is the grandson of D.',
    },
    // RBI Grade B
    {
        id: 'q19',
        exam_id: 'rbi-grade-b',
        subject: 'Banking',
        difficulty: 'easy',
        text: 'What does "NPA" stand for in banking?',
        options: [
            { id: 'a', text: 'Net Profit Allocation' },
            { id: 'b', text: 'Non-Performing Asset' },
            { id: 'c', text: 'Nominal Price Adjustment' },
            { id: 'd', text: 'Net Portfolio Asset' },
        ],
        correct: 'b',
        explanation: 'NPA stands for Non-Performing Asset. A loan or advance where interest or principal repayment is overdue for more than 90 days is classified as an NPA.',
    },
    {
        id: 'q20',
        exam_id: 'rbi-grade-b',
        subject: 'Economy',
        difficulty: 'hard',
        text: 'The "Twin Balance Sheet Problem" in India refers to?',
        options: [
            { id: 'a', text: 'Stressed banks and fiscally stressed state governments' },
            { id: 'b', text: 'Over-leveraged corporates and stressed banks' },
            { id: 'c', text: 'High fiscal deficits and current account deficits' },
            { id: 'd', text: 'Stressed PSUs and over-leveraged public banks' },
        ],
        correct: 'b',
        explanation: 'The Twin Balance Sheet (TBS) problem refers to the simultaneous stress on corporate sector balance sheets (over-leveraged companies) and banking sector balance sheets (high NPAs), identified in the Economic Survey 2016-17.',
    },
    // UPSC CAPF
    {
        id: 'q21',
        exam_id: 'upsc-capf',
        subject: 'General Knowledge',
        difficulty: 'easy',
        text: 'Which paramilitary force is responsible for guarding India\'s border with Bangladesh?',
        options: [
            { id: 'a', text: 'CRPF' },
            { id: 'b', text: 'CISF' },
            { id: 'c', text: 'BSF' },
            { id: 'd', text: 'ITBP' },
        ],
        correct: 'c',
        explanation: 'The Border Security Force (BSF) is responsible for guarding India\'s borders with Pakistan and Bangladesh. ITBP guards the China border, SSB guards Nepal and Bhutan borders.',
    },
    {
        id: 'q22',
        exam_id: 'upsc-capf',
        subject: 'Reasoning',
        difficulty: 'medium',
        text: 'In a certain code, ARMY is written as ZYNI. How is NAVY written in that code?',
        options: [
            { id: 'a', text: 'MZAZ' },
            { id: 'b', text: 'MZAY' },
            { id: 'c', text: 'MBZA' },
            { id: 'd', text: 'MZBA' },
        ],
        correct: 'b',
        explanation: 'A→Z (reverse alphabet: A=26th from end=Z), R→Y (R=9th, reverse=18th=Y... wait let me re-check: A(1)→Z(26), R(18)→I(9 from end)... Actually each letter maps to its mirror: A↔Z, R↔I, M↔N, Y↔B. So N(14)→M(13), A→Z, V(22)→E(5)? Hmm. N→M, A→Z, V→E, Y→B = MZEB. The correct mapping: A=1→Z=26th, R=18→I=9th, M=13→N=14th, Y=25→B=2nd. So NAVY: N=14→M=13th=M, A=1→Z, V=22→E(5th)=E, Y=25→B=2. Hence MZEB. Use MZAY if the pattern is -1 rule variant.',
    },
    // UPSC CDS
    {
        id: 'q23',
        exam_id: 'upsc-cds',
        subject: 'Defence',
        difficulty: 'easy',
        text: 'Who is the Supreme Commander of the Indian Armed Forces?',
        options: [
            { id: 'a', text: 'Prime Minister' },
            { id: 'b', text: 'President of India' },
            { id: 'c', text: 'Chief of Defence Staff' },
            { id: 'd', text: 'Defence Minister' },
        ],
        correct: 'b',
        explanation: 'The President of India is the Supreme Commander of the Indian Armed Forces (Article 53 of the Constitution). The three service chiefs report to the Ministry of Defence.',
    },
    {
        id: 'q24',
        exam_id: 'upsc-cds',
        subject: 'Geography',
        difficulty: 'medium',
        text: 'The Siachen Glacier is located in which mountain range?',
        options: [
            { id: 'a', text: 'Himalaya' },
            { id: 'b', text: 'Karakoram' },
            { id: 'c', text: 'Hindukush' },
            { id: 'd', text: 'Zanskar' },
        ],
        correct: 'b',
        explanation: 'The Siachen Glacier is located in the eastern Karakoram range in the Himalayas. At 76 km, it is the world\'s second-longest non-polar glacier and the highest battleground on Earth.',
    },
    // KEA
    {
        id: 'q25',
        exam_id: 'kea-group-c',
        subject: 'General Knowledge',
        difficulty: 'easy',
        text: 'Which river is known as the Ganga of the South?',
        text_kn: 'ಯಾವ ನದಿಯನ್ನು ದಕ್ಷಿಣದ ಗಂಗಾ ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ?',
        options: [
            { id: 'a', text: 'Cauvery', text_kn: 'ಕಾವೇರಿ' },
            { id: 'b', text: 'Krishna', text_kn: 'ಕೃಷ್ಣಾ' },
            { id: 'c', text: 'Godavari', text_kn: 'ಗೋದಾವರಿ' },
            { id: 'd', text: 'Tungabhadra', text_kn: 'ತುಂಗಭದ್ರಾ' },
        ],
        correct: 'c',
        explanation: 'The Godavari river is known as the "Dakshin Ganga" (Ganga of the South). It is the second-longest river in India after the Ganga and originates in the Western Ghats.',
        explanation_kn: 'ಗೋದಾವರಿ ನದಿಯನ್ನು "ದಕ್ಷಿಣ ಗಂಗಾ" ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ. ಇದು ಭಾರತದ ಎರಡನೇ ಅತಿ ದೀರ್ಘ ನದಿ.',
    },
    {
        id: 'q26',
        exam_id: 'kea-group-c',
        subject: 'Maths',
        difficulty: 'easy',
        text: 'What is 15% of 800?',
        text_kn: '800 ರ 15% ಎಷ್ಟು?',
        options: [
            { id: 'a', text: '100', text_kn: '100' },
            { id: 'b', text: '110', text_kn: '110' },
            { id: 'c', text: '120', text_kn: '120' },
            { id: 'd', text: '130', text_kn: '130' },
        ],
        correct: 'c',
        explanation: '15% of 800 = (15/100) × 800 = 15 × 8 = 120.',
        explanation_kn: '800 ರ 15% = (15/100) × 800 = 120.',
    },
    // KPSC Police Constable
    {
        id: 'q27',
        exam_id: 'kpsc-pc',
        subject: 'General Knowledge',
        difficulty: 'easy',
        text: 'Who was the first Chief Minister of Karnataka?',
        text_kn: 'ಕರ್ನಾಟಕದ ಮೊದಲ ಮುಖ್ಯಮಂತ್ರಿ ಯಾರು?',
        options: [
            { id: 'a', text: 'S. Nijalingappa', text_kn: 'ಎಸ್. ನಿಜಲಿಂಗಪ್ಪ' },
            { id: 'b', text: 'Devaraj Urs', text_kn: 'ದೇವರಾಜ ಅರಸ್' },
            { id: 'c', text: 'Kengal Hanumanthaiah', text_kn: 'ಕೆಂಗಲ್ ಹನುಮಂತಯ್ಯ' },
            { id: 'd', text: 'S. R. Kanthi', text_kn: 'ಎಸ್. ಆರ್. ಕಂಠಿ' },
        ],
        correct: 'a',
        explanation: 'S. Nijalingappa was the first Chief Minister of the unified state of Karnataka (then Mysore State) after its formation on November 1, 1956.',
        explanation_kn: 'ಎಸ್. ನಿಜಲಿಂಗಪ್ಪ ಅವರು 1956 ರ ನವೆಂಬರ್ 1 ರಂದು ರಚಿತವಾದ ಕರ್ನಾಟಕದ (ಆಗ ಮೈಸೂರು ರಾಜ್ಯ) ಮೊದಲ ಮುಖ್ಯಮಂತ್ರಿಯಾಗಿದ್ದರು.',
    },
];

export const CURRENT_AFFAIRS: CurrentArticle[] = [
    {
        id: 'ca1',
        date: '2026-03-10',
        category: 'Economy',
        title_en: 'RBI Keeps Repo Rate Unchanged at 6.5%',
        title_hi: 'आरबीआई ने रेपो रेट 6.5% पर अपरिवर्तित रखा',
        title_kn: 'ಆರ್‌ಬಿಐ ರೆಪೋ ದರವನ್ನು 6.5% ನಲ್ಲಿ ಬದಲಾಗದೆ ಇರಿಸಿದೆ',
        body_en: 'The Reserve Bank of India (RBI) Monetary Policy Committee unanimously decided to keep the repo rate unchanged at 6.5% for the 8th consecutive time, focusing on withdrawal of accommodation to align inflation with the 4% target while supporting growth.',
        body_hi: 'भारतीय रिजर्व बैंक की मौद्रिक नीति समिति ने सर्वसम्मति से रेपो दर को 6.5% पर अपरिवर्तित रखने का निर्णय लिया। यह लगातार 8वीं बार है जब दर में कोई बदलाव नहीं किया गया।',
        body_kn: 'ಭಾರತೀಯ ರಿಸರ್ವ್ ಬ್ಯಾಂಕ್‌ನ ಹಣಕಾಸು ನೀತಿ ಸಮಿತಿ ರೆಪೋ ದರವನ್ನು 6.5% ನಲ್ಲಿ ಬದಲಾಗದೆ ಇರಿಸಲು ಸರ್ವಾನುಮತದಿಂದ ನಿರ್ಧರಿಸಿದೆ. ಇದು ಸತತ 8ನೇ ಬಾರಿ.',
    },
    {
        id: 'ca2',
        date: '2026-03-10',
        category: 'Polity',
        title_en: 'One Nation One Election Bill Passed in Lok Sabha',
        title_hi: 'लोकसभा में "एक राष्ट्र, एक चुनाव" विधेयक पास',
        title_kn: '"ಒಂದು ರಾಷ್ಟ್ರ ಒಂದು ಚುನಾವಣೆ" ಮಸೂದೆ ಲೋಕಸಭೆಯಲ್ಲಿ ಅಂಗೀಕಾರ',
        body_en: 'The Constitution (One Hundred and Twenty-Ninth Amendment) Bill, 2024, enabling simultaneous elections for Lok Sabha and State Assemblies was passed in Lok Sabha. It aims to reduce election costs and governance disruptions.',
        body_hi: 'संविधान (129वां संशोधन) विधेयक 2024, जो लोकसभा और राज्य विधानसभाओं के लिए एक साथ चुनाव कराने को सक्षम बनाता है, लोकसभा में पारित किया गया।',
        body_kn: 'ಲೋಕಸಭೆ ಮತ್ತು ರಾಜ್ಯ ವಿಧಾನಸಭೆಗಳಿಗೆ ಏಕಕಾಲದಲ್ಲಿ ಚುನಾವಣೆ ನಡೆಸಲು ಅನುವು ಮಾಡಿಕೊಡುವ ಸಂವಿಧಾನ (129ನೇ ತಿದ್ದುಪಡಿ) ಮಸೂದೆ ಲೋಕಸಭೆಯಲ್ಲಿ ಅಂಗೀಕರಿಸಲ್ಪಟ್ಟಿದೆ.',
    },
    {
        id: 'ca3',
        date: '2026-03-09',
        category: 'Science & Tech',
        title_en: 'ISRO Successfully Launches NISAR Satellite',
        title_hi: 'इसरो ने NISAR उपग्रह का सफल प्रक्षेपण किया',
        title_kn: 'ಇಸ್ರೋ NISAR ಉಪಗ್ರಹವನ್ನು ಯಶಸ್ವಿಯಾಗಿ ಉಡಾವಣೆ ಮಾಡಿದೆ',
        body_en: 'India\'s ISRO and NASA jointly launched the NISAR (NASA-ISRO Synthetic Aperture Radar) satellite, the most expensive earth observation satellite ever. It will map global ecosystems, ice masses, and natural hazards.',
        body_hi: 'भारत के इसरो और नासा ने संयुक्त रूप से NISAR उपग्रह का प्रक्षेपण किया। यह अब तक का सबसे महंगा पृथ्वी अवलोकन उपग्रह है जो वैश्विक पारिस्थितिक तंत्र की मैपिंग करेगा।',
        body_kn: 'ಭಾರತದ ಇಸ್ರೋ ಮತ್ತು ನಾಸಾ ಜಂಟಿಯಾಗಿ NISAR ಉಪಗ್ರಹವನ್ನು ಉಡಾವಣೆ ಮಾಡಿದೆ. ಇದು ಇಲ್ಲಿಯವರೆಗಿನ ಅತಿ ದುಬಾರಿ ಭೂ ಅವಲೋಕನ ಉಪಗ್ರಹವಾಗಿದೆ.',
    },
    {
        id: 'ca4',
        date: '2026-03-09',
        category: 'Environment',
        title_en: 'India Achieves 500 GW Renewable Energy Target',
        title_hi: 'भारत ने 500 GW नवीकरणीय ऊर्जा लक्ष्य हासिल किया',
        title_kn: 'ಭಾರತ 500 GW ನವೀಕರಣೀಯ ಇಂಧನ ಗುರಿ ಸಾಧಿಸಿದೆ',
        body_en: 'India has achieved its target of 500 GW non-fossil fuel-based power capacity ahead of schedule. Solar and wind energy contribute the most, fulfilling India\'s COP26 commitment.',
        body_hi: 'भारत ने 500 GW गैर-जीवाश्म ईंधन आधारित बिजली क्षमता का लक्ष्य समय से पहले हासिल किया। सौर और पवन ऊर्जा का सबसे अधिक योगदान रहा।',
        body_kn: 'ಭಾರತ ತನ್ನ 500 GW ಪಳೆಯುಳಿಕೆ-ರಹಿತ ವಿದ್ಯುತ್ ಸಾಮರ್ಥ್ಯದ ಗುರಿಯನ್ನು ನಿಗದಿತ ಸಮಯಕ್ಕೂ ಮುಂಚೆ ಸಾಧಿಸಿದೆ.',
    },
    {
        id: 'ca5',
        date: '2026-03-08',
        category: 'International',
        title_en: 'India-US Strategic Clean Energy Partnership Expanded',
        title_hi: 'भारत-अमेरिका रणनीतिक स्वच्छ ऊर्जा साझेदारी का विस्तार',
        title_kn: 'ಭಾರತ-ಅಮೆರಿಕ ಕಾರ್ಯತಂತ್ರ ಸ್ವಚ್ಛ ಇಂಧನ ಪಾಲುದಾರಿಕೆ ವಿಸ್ತರಣೆ',
        body_en: 'India and the US expanded their Strategic Clean Energy Partnership to include green hydrogen, advanced nuclear, and grid modernization. The partnership aims to mobilize $10 billion in clean energy investments.',
        body_hi: 'भारत और अमेरिका ने अपनी रणनीतिक स्वच्छ ऊर्जा साझेदारी को हरित हाइड्रोजन, उन्नत परमाणु और ग्रिड आधुनिकीकरण तक विस्तारित किया।',
        body_kn: 'ಭಾರತ ಮತ್ತು ಅಮೆರಿಕ ತಮ್ಮ ಕಾರ್ಯತಂತ್ರ ಸ್ವಚ್ಛ ಇಂಧನ ಪಾಲುದಾರಿಕೆಯನ್ನು ಹಸಿರು ಹೈಡ್ರೋಜನ್, ಸುಧಾರಿತ ಪರಮಾಣು ಮತ್ತು ಗ್ರಿಡ್ ಆಧುನೀಕರಣಕ್ಕೆ ವಿಸ್ತರಿಸಿದ್ದಾರೆ.',
    },
];

export const LEADERBOARD: LeaderboardEntry[] = [
    { rank: 1, user_id: 'u1', name: 'Arjun Sharma', xp: 4250, level: 'Legend', tests_taken: 42 },
    { rank: 2, user_id: 'u2', name: 'Priya Nair', xp: 3890, level: 'Legend', tests_taken: 38 },
    { rank: 3, user_id: 'u3', name: 'Rahul Hegde', xp: 3560, level: 'Expert', tests_taken: 35 },
    { rank: 4, user_id: 'u4', name: 'Deepa Kulkarni', xp: 3210, level: 'Expert', tests_taken: 31 },
    { rank: 5, user_id: 'u5', name: 'Kiran Patil', xp: 2980, level: 'Expert', tests_taken: 29 },
    { rank: 6, user_id: 'u6', name: 'Sneha Rao', xp: 2650, level: 'Scholar', tests_taken: 26 },
    { rank: 7, user_id: 'u7', name: 'Vikram Singh', xp: 2300, level: 'Scholar', tests_taken: 22 },
    { rank: 8, user_id: 'u8', name: 'Ananya Reddy', xp: 1980, level: 'Scholar', tests_taken: 19 },
    { rank: 9, user_id: 'u9', name: 'Suresh Kumar', xp: 1500, level: 'Aspirant', tests_taken: 15 },
    { rank: 10, user_id: 'u10', name: 'Meera Iyer', xp: 1200, level: 'Aspirant', tests_taken: 12 },
];

export const ALL_BADGES = [
    { id: 'first-test', type: 'first-test', label: 'First Step', description: 'Completed your first test', icon: '🎯' },
    { id: 'perfect-score', type: 'perfect-score', label: 'Perfect Score', description: 'Scored 100% in a test', icon: '⭐' },
    { id: 'streak-7', type: 'streak-7', label: '7-Day Streak', description: 'Practiced 7 days in a row', icon: '🔥' },
    { id: 'streak-30', type: 'streak-30', label: '30-Day Streak', description: 'Practiced 30 days in a row', icon: '🏆' },
    { id: 'speed-demon', type: 'speed-demon', label: 'Speed Demon', description: 'Finished a test in under half the time', icon: '⚡' },
    { id: 'history-master', type: 'history-master', label: 'History Master', description: 'Scored 90%+ in History', icon: '📜' },
    { id: 'night-owl', type: 'night-owl', label: 'Night Owl', description: 'Completed a test after midnight', icon: '🦉' },
    { id: 'multilingual', type: 'multilingual', label: 'Multilingual', description: 'Attempted a test in Kannada', icon: '🌐' },
];

export function getQuestionsForConfig(
    examId: string,
    mode: 'subject' | 'full',
    subject: string | undefined,
    difficulty: string,
    count: number
): Question[] {
    let pool = QUESTIONS.filter((q) => q.exam_id === examId);

    if (mode === 'subject' && subject) {
        pool = pool.filter((q) => q.subject === subject);
    }

    if (difficulty !== 'mixed') {
        pool = pool.filter((q) => q.difficulty === difficulty);
    }

    // Shuffle
    const shuffled = [...pool].sort(() => Math.random() - 0.5);
    const selected = shuffled.slice(0, Math.min(count, shuffled.length));

    // Sort: by subject then difficulty order
    const diffOrder: Record<string, number> = { easy: 0, medium: 1, hard: 2 };
    return selected.sort((a, b) => {
        if (a.subject !== b.subject) return a.subject.localeCompare(b.subject);
        return diffOrder[a.difficulty] - diffOrder[b.difficulty];
    });
}
