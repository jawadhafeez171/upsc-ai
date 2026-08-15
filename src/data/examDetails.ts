export interface ExamStageDetail {
    stageNumber: number;
    stageName: string;
    stageName_kn?: string;
    mode: 'Objective (CBT/OMR)' | 'Descriptive' | 'Physical Test (PET/PST)' | 'Interview / Viva Voce';
    totalMarks: number;
    durationMinutes: number;
    description: string;
    papers: {
        paperName: string;
        paperName_kn?: string;
        questionsCount?: number;
        marks: number;
        durationMinutes: number;
        negativeMarking: string;
        subjects: string[];
    }[];
}

export interface AllocatedService {
    serviceCode: string;
    serviceName: string;
    serviceName_kn?: string;
    group: 'All India Service (AIS)' | 'Group A Central Service' | 'Group B Central Service' | 'Group A State Service' | 'Group B State Service' | 'Group C State Service' | 'Defence Academy / Wing';
    entryDesignation: string;
    department: string;
    roleDescription: string;
    careerApex: string;
}

export interface ExamInfo {
    id: string;
    slug: string;
    title: string;
    title_kn?: string;
    shortName: string;
    conductingBody: string;
    conductingBody_kn?: string;
    tagline: string;
    tagline_kn?: string;
    category: 'upsc' | 'karnataka' | 'defence' | 'teaching' | 'regulatory' | 'ssc';
    overview: string;
    overview_kn?: string;
    
    // Allocated Services & Cadres
    allocatedServices?: AllocatedService[];
    
    // Career & Job Role
    jobRole: {
        designation: string;
        designation_kn?: string;
        cadre: string;
        department: string;
        department_kn?: string;
        keyResponsibilities: string[];
        keyResponsibilities_kn?: string[];
        careerProgression: string[];
        postingLocations: string;
        payScale: {
            level: string;
            basicPayRange: string;
            approxMonthlyGross: string;
            perks: string[];
        };
    };

    // Eligibility & Qualifications
    eligibility: {
        ageLimit: {
            general: string;
            obc?: string;
            sc_st?: string;
            obc_2a_2b_3a_3b?: string;
            sc_st_cat1?: string;
        };
        educationalQualification: string;
        educationalQualification_kn?: string;
        attemptsAllowed?: string;
        physicalStandards?: string[];
    };

    // Examination Architecture & Pattern
    stages: ExamStageDetail[];

    // Key Syllabus Focus Areas
    syllabusFocus: {
        pillarName: string;
        weightage: 'High' | 'Very High' | 'Medium' | 'Qualifying';
        topics: string[];
    }[];

    faqs: {
        question: string;
        answer: string;
    }[];
}

export const EXAM_DETAILS: Record<string, ExamInfo> = {
    'upsc-cse': {
        id: 'upsc-cse',
        slug: 'upsc-cse',
        title: 'UPSC Civil Services Examination (CSE)',
        title_kn: 'ಯುಪಿಎಸ್‌ಸಿ ನಾಗರಿಕ ಸೇವಾ ಪರೀಕ್ಷೆ (ಸಿಎಸ್‌ಇ)',
        shortName: 'UPSC CSE',
        conductingBody: 'Union Public Service Commission (UPSC)',
        conductingBody_kn: 'ಕೇಂದ್ರ ಲೋಕಸೇವಾ ಆಯೋಗ',
        tagline: 'India\'s premier examination for recruitment into IAS, IPS, IFS, IRS, and 20+ Group A Central Services.',
        category: 'upsc',
        overview: 'The Civil Services Examination (CSE) is India\'s most prestigious nationwide competitive examination conducted by UPSC for recruitment to higher civil services including the Indian Administrative Service (IAS), Indian Police Service (IPS), Indian Foreign Service (IFS), and Indian Revenue Service (IRS).',
        allocatedServices: [
            {
                serviceCode: 'IAS',
                serviceName: 'Indian Administrative Service',
                serviceName_kn: 'ಭಾರತೀಯ ಆಡಳಿತ ಸೇವೆ (ಐಎಎಸ್)',
                group: 'All India Service (AIS)',
                entryDesignation: 'Sub-Divisional Magistrate (SDM) / Assistant Commissioner',
                department: 'Department of Personnel & Training (DoPT) / State Cadres',
                roleDescription: 'Apex civil service responsible for policy formulation, district administration, revenue courts, and overall governance machinery.',
                careerApex: 'Cabinet Secretary of India / Chief Secretary of State'
            },
            {
                serviceCode: 'IPS',
                serviceName: 'Indian Police Service',
                serviceName_kn: 'ಭಾರತೀಯ ಪೊಲೀಸ್ ಸೇವೆ (ಐಪಿಎಸ್)',
                group: 'All India Service (AIS)',
                entryDesignation: 'Assistant Superintendent of Police (ASP)',
                department: 'Ministry of Home Affairs (MHA) / State Police Cadres',
                roleDescription: 'Law enforcement, crime investigation, public order management, VIP security, and intelligence command.',
                careerApex: 'Director General of Police (DGP) / Director IB / Director CBI'
            },
            {
                serviceCode: 'IFS',
                serviceName: 'Indian Foreign Service',
                serviceName_kn: 'ಭಾರತೀಯ ವಿದೇಶಾಂಗ ಸೇವೆ (ಐಎಫ್‌ಎಸ್)',
                group: 'Group A Central Service',
                entryDesignation: 'Third Secretary / Under Secretary',
                department: 'Ministry of External Affairs (MEA)',
                roleDescription: 'Diplomatic missions, bilateral diplomacy, international treaty negotiations, trade pacts, and consular services worldwide.',
                careerApex: 'Foreign Secretary of India / Ambassador to UN / High Commissioner'
            },
            {
                serviceCode: 'IRS (IT)',
                serviceName: 'Indian Revenue Service (Income Tax)',
                serviceName_kn: 'ಭಾರತೀಯ ಕಂದಾಯ ಸೇವೆ (ಆದಾಯ ತೆರಿಗೆ)',
                group: 'Group A Central Service',
                entryDesignation: 'Assistant Commissioner of Income Tax (ACIT)',
                department: 'Department of Revenue / Central Board of Direct Taxes (CBDT)',
                roleDescription: 'Direct tax administration, investigation of black money, tax evasion probes, and national revenue collection.',
                careerApex: 'Chairman, CBDT / Principal Chief Commissioner of Income Tax'
            },
            {
                serviceCode: 'IRS (C&IT)',
                serviceName: 'Indian Revenue Service (Customs & Indirect Taxes / GST)',
                serviceName_kn: 'ಭಾರತೀಯ ಕಂದಾಯ ಸೇವೆ (ಕಸ್ಟಮ್ಸ್ & ಜಿಎಸ್‌ಟಿ)',
                group: 'Group A Central Service',
                entryDesignation: 'Assistant Commissioner of Customs & GST',
                department: 'Department of Revenue / Central Board of Indirect Taxes & Customs (CBIC)',
                roleDescription: 'Enforcing Goods & Services Tax (GST), maritime customs ports surveillance, anti-smuggling, and international trade tariffs.',
                careerApex: 'Chairman, CBIC / Principal Director General (DGGI)'
            },
            {
                serviceCode: 'IA&AS',
                serviceName: 'Indian Audit and Accounts Service',
                serviceName_kn: 'ಭಾರತೀಯ ಲೆಕ್ಕಪರಿಶೋಧನೆ ಮತ್ತು ಲೆಕ್ಕಪತ್ರ ಸೇವೆ',
                group: 'Group A Central Service',
                entryDesignation: 'Assistant Accountant General (DAG)',
                department: 'Comptroller and Auditor General of India (CAG)',
                roleDescription: 'Financial audit, performance audit, and compliance audit of all Union and State government accounts and public sector undertakings.',
                careerApex: 'Deputy Comptroller & Auditor General (Deputy CAG)'
            },
            {
                serviceCode: 'IRMS',
                serviceName: 'Indian Railway Management Service',
                serviceName_kn: 'ಭಾರತೀಯ ರೈಲ್ವೆ ನಿರ್ವಹಣಾ ಸೇವೆ',
                group: 'Group A Central Service',
                entryDesignation: 'Assistant Divisional Operations / Commercial Manager',
                department: 'Ministry of Railways / Railway Board',
                roleDescription: 'Management, operations, commercial logistics, and passenger safety across the vast Indian Railways network.',
                careerApex: 'Chairman & CEO, Railway Board / General Manager'
            },
            {
                serviceCode: 'IDAS',
                serviceName: 'Indian Defence Accounts Service',
                group: 'Group A Central Service',
                entryDesignation: 'Assistant Controller of Defence Accounts',
                department: 'Ministry of Defence / CGDA',
                roleDescription: 'Financial advice, budgeting, and audit of the Indian Armed Forces and ordnance factories.',
                careerApex: 'Controller General of Defence Accounts (CGDA)'
            },
            {
                serviceCode: 'DANICS / DANIPS',
                serviceName: 'Delhi, Andaman & Nicobar Islands Civil & Police Service',
                group: 'Group B Central Service',
                entryDesignation: 'Sub-Divisional Magistrate / Assistant Commissioner of Police',
                department: 'Ministry of Home Affairs / UT Administrations',
                roleDescription: 'Administrative and executive police leadership in Union Territories (Delhi, Daman & Diu, Lakshadweep, Andaman).',
                careerApex: 'Promotion to IAS / IPS AGMUT Cadre'
            }
        ],
        jobRole: {
            designation: 'Sub-Divisional Magistrate (SDM) / Assistant Commissioner / ASP / Assistant Secretary',
            cadre: 'Group A',
            department: 'Government of India & State All-India Service Cadres',
            keyResponsibilities: [
                'District Administration, Law and Order maintenance, and revenue collection.',
                'Formulation, implementation, and ground monitoring of central and state welfare policies.',
                'Disaster management, crisis response, and developmental administration.',
                'Magisterial powers under CrPC, land disputes resolution, and statutory regulatory oversight.'
            ],
            careerProgression: [
                'SDM / Assistant Commissioner ➔ District Magistrate (DM / Deputy Commissioner)',
                'District Collector / SP ➔ Divisional Commissioner / DIG of Police',
                'Joint Secretary / Inspector General ➔ Additional Secretary / Principal Secretary',
                'Cabinet Secretary of India / Director General of Police (DGP)'
            ],
            postingLocations: 'Districts and State Secretariats nationwide, Union Ministries in New Delhi, and Indian Diplomatic Missions abroad.',
            payScale: {
                level: 'Level 10 to Level 17 (7th Pay Commission)',
                basicPayRange: '₹56,100 – ₹2,50,000',
                approxMonthlyGross: '₹95,000 – ₹2,80,000+ (plus DA, HRA, official bungalow, vehicle, and security)',
                perks: ['Government Accommodation', 'Official Vehicle with Driver', 'Security Guard', 'CGHS Medical Care', 'Annual Leave Travel Concession']
            }
        },
        eligibility: {
            ageLimit: {
                general: '21 to 32 years (6 attempts)',
                obc: '21 to 35 years (9 attempts - Non-Creamy Layer)',
                sc_st: '21 to 37 years (Unlimited attempts)'
            },
            educationalQualification: 'Graduation degree in any discipline from a recognized University.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Preliminary Examination (Objective / Screening)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 400,
                durationMinutes: 240,
                description: 'Screening test consisting of two objective papers held on a single day. Paper-2 (CSAT) is qualifying in nature (33% required).',
                papers: [
                    {
                        paperName: 'General Studies Paper I (GS-1)',
                        questionsCount: 100,
                        marks: 200,
                        durationMinutes: 120,
                        negativeMarking: '0.33 (1/3rd mark deduction)',
                        subjects: ['Ancient, Medieval & Modern History', 'Art and Culture', 'Indian and World Geography', 'Indian Polity & Governance', 'Economic & Social Development', 'Environmental Ecology & Climate Change', 'General Science & S&T', 'Current Events']
                    },
                    {
                        paperName: 'General Studies Paper II (CSAT)',
                        questionsCount: 80,
                        marks: 200,
                        durationMinutes: 120,
                        negativeMarking: '0.33 (1/3rd mark deduction)',
                        subjects: ['Reading Comprehension', 'Interpersonal & Communication Skills', 'Logical Reasoning & Analytical Ability', 'Decision Making & Problem Solving', 'Basic Numeracy & Data Interpretation']
                    }
                ]
            },
            {
                stageNumber: 2,
                stageName: 'Mains Examination (Descriptive / Written)',
                mode: 'Descriptive',
                totalMarks: 1750,
                durationMinutes: 1620,
                description: '9 written descriptive papers. 2 qualifying language papers (Indian Language + English) and 7 merit-ranking papers (Essay, GS 1–4, Optional 1 & 2).',
                papers: [
                    { paperName: 'Essay Paper', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Two philosophical / socioeconomic essays'] },
                    { paperName: 'General Studies I', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Indian Heritage, History, Geography of the World and Society'] },
                    { paperName: 'General Studies II', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Governance, Constitution, Polity, Social Justice and International Relations'] },
                    { paperName: 'General Studies III', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Technology, Economic Development, Biodiversity, Environment, Security and Disaster Management'] },
                    { paperName: 'General Studies IV', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Ethics, Integrity and Aptitude'] },
                    { paperName: 'Optional Paper 1', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Candidate Selected Optional Discipline'] },
                    { paperName: 'Optional Paper 2', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Candidate Selected Optional Discipline'] }
                ]
            },
            {
                stageNumber: 3,
                stageName: 'Personality Test (Interview)',
                mode: 'Interview / Viva Voce',
                totalMarks: 275,
                durationMinutes: 35,
                description: 'In-person interview before an unbiased UPSC board in New Delhi assessing intellectual caliber, social traits, moral integrity, leadership, and crisis judgment.',
                papers: []
            }
        ],
        syllabusFocus: [
            { pillarName: 'Indian Polity & Governance', weightage: 'Very High', topics: ['Constitutional Articles', 'Preamble', 'Fundamental Rights', 'Parliamentary Procedures', 'Judicial Review', 'Statutory Bodies'] },
            { pillarName: 'Economy & Development', weightage: 'Very High', topics: ['Monetary Policy', 'Inflation', 'Fiscal Deficit', 'Banking Architecture', 'External Sector', 'Union Budget'] },
            { pillarName: 'Environment & Ecology', weightage: 'Very High', topics: ['National Parks', 'Biodiversity Hotspots', 'UNFCCC COP Agreements', 'Wildlife Protection Act', 'Renewable Energy'] },
            { pillarName: 'History & Art Culture', weightage: 'High', topics: ['Freedom Struggle 1857-1947', 'Indus Valley', 'Temple Architecture', 'Bhakti-Sufi Movements'] }
        ],
        faqs: [
            { question: 'Is CSAT marks counted for Prelims ranking?', answer: 'No. CSAT (Paper II) is purely qualifying. Candidates must score minimum 33% (66 marks out of 200). Merit for Mains qualification is determined solely by Paper I (GS-1).' },
            { question: 'What is the medium of writing UPSC CSE Mains?', answer: 'Candidates can write the Mains examination in English, Hindi, or any of the 22 Eighth Schedule languages including Kannada.' }
        ]
    },

    'kpsc-kas': {
        id: 'kpsc-kas',
        slug: 'kpsc-kas',
        title: 'KPSC Karnataka Administrative Service (KAS)',
        title_kn: 'ಕೆಪಿಎಸ್‌ಸಿ ಕರ್ನಾಟಕ ಆಡಳಿತ ಸೇವೆ (ಕೆಎಎಸ್)',
        shortName: 'KPSC KAS',
        conductingBody: 'Karnataka Public Service Commission (KPSC)',
        conductingBody_kn: 'ಕರ್ನಾಟಕ ಲೋಕಸೇವಾ ಆಯೋಗ',
        tagline: 'Karnataka\'s highest state civil service examination for Assistant Commissioners, Tahsildars, DySPs, and Commercial Tax Officers.',
        category: 'karnataka',
        overview: 'KPSC Gazetted Probationers Examination (KAS) is the premier state-level competitive examination in Karnataka for recruitment to Group A and Group B administrative leadership posts in the State Government.',
        allocatedServices: [
            {
                serviceCode: 'KAS (Jr Scale)',
                serviceName: 'Karnataka Administrative Service (Junior Scale)',
                serviceName_kn: 'ಕರ್ನಾಟಕ ಆಡಳಿತ ಸೇವೆ (ಕಿರಿಯ ಶ್ರೇಣಿ - ಸಹಾಯಕ ಆಯುಕ್ತರು)',
                group: 'Group A State Service',
                entryDesignation: 'Assistant Commissioner (AC / Sub-Divisional Magistrate)',
                department: 'Revenue Department / DPAR',
                roleDescription: 'Head of Revenue Sub-Division, Executive Magistrate under CrPC, Land Acquisition Officer, and Sub-Divisional election returning officer.',
                careerApex: 'IAS Conferred / Deputy Commissioner (DC) / Principal Secretary'
            },
            {
                serviceCode: 'KSPS (DySP)',
                serviceName: 'Karnataka State Police Service',
                serviceName_kn: 'ಕರ್ನಾಟಕ ರಾಜ್ಯ ಪೊಲೀಸ್ ಸೇವೆ (ಡಿವೈಎಸ್‌ಪಿ)',
                group: 'Group A State Service',
                entryDesignation: 'Deputy Superintendent of Police (DySP / SDPO)',
                department: 'Home Department / Karnataka State Police',
                roleDescription: 'Commanding police sub-divisions, supervising police station investigations, VIP security, and maintaining district public order.',
                careerApex: 'IPS Conferred / Superintendent of Police (SP) / Inspector General of Police (IGP)'
            },
            {
                serviceCode: 'KCT (CTO)',
                serviceName: 'Karnataka Commercial Taxes Service',
                serviceName_kn: 'ಕರ್ನಾಟಕ ವಾಣಿಜ್ಯ ತೆರಿಗೆ ಸೇವೆ (ವಾಣಿಜ್ಯ ತೆರಿಗೆ ಅಧಿಕಾರಿ)',
                group: 'Group A State Service',
                entryDesignation: 'Commercial Tax Officer (CTO)',
                department: 'Finance Department / Commercial Taxes Department',
                roleDescription: 'GST enforcement, corporate tax audit, assessment of commercial revenue, and anti-tax evasion raids.',
                careerApex: 'Additional Commissioner of Commercial Taxes / Joint Commissioner'
            },
            {
                serviceCode: 'KRDPR (EO)',
                serviceName: 'Karnataka Rural Development & Panchayat Raj Service',
                serviceName_kn: 'ಗ್ರಾಮೀಣಾಭಿವೃದ್ಧಿ & ಪಂಚಾಯತ್ ರಾಜ್ ಸೇವೆ (ಕಾರ್ಯನಿರ್ವಾಹಕ ಅಧಿಕಾರಿ)',
                group: 'Group A State Service',
                entryDesignation: 'Executive Officer (EO - Taluk Panchayat)',
                department: 'Rural Development & Panchayat Raj Department (RDPR)',
                roleDescription: 'Administrative head of Taluk Panchayat, supervising all Gram Panchayats and implementing rural employment & housing programs.',
                careerApex: 'Chief Executive Officer (CEO) of Zilla Panchayat'
            },
            {
                serviceCode: 'KSAD (Asst Controller)',
                serviceName: 'Karnataka State Accounts Department',
                serviceName_kn: 'ರಾಜ್ಯ ಲೆಕ್ಕಪತ್ರ ಇಲಾಖೆ (ಸಹಾಯಕ ನಿಯಂತ್ರಕರು)',
                group: 'Group A State Service',
                entryDesignation: 'Assistant Controller of State Accounts',
                department: 'Finance Department (KSAD)',
                roleDescription: 'Financial auditing, budget management, and treasury scrutiny of State Government departments and universities.',
                careerApex: 'Controller of State Accounts / Director of Treasuries'
            },
            {
                serviceCode: 'KAS (Group B)',
                serviceName: 'Tahsildar (Grade-2) / KAS Group B',
                serviceName_kn: 'ತಹಶೀಲ್ದಾರ್ (ಗ್ರೇಡ್-೨)',
                group: 'Group B State Service',
                entryDesignation: 'Tahsildar (Taluk Administrative & Revenue Head)',
                department: 'Revenue Department',
                roleDescription: 'Taluk Magistrate, presiding over Taluk revenue courts, issuing caste/income/land certificates, and natural disaster management.',
                careerApex: 'Assistant Commissioner / Senior Tahsildar (Grade-1)'
            },
            {
                serviceCode: 'ARCS',
                serviceName: 'Assistant Registrar of Co-operative Societies',
                serviceName_kn: 'ಸಹಕಾರ ಸಂಘಗಳ ಸಹಾಯಕ ನಿಬಂಧಕರು',
                group: 'Group B State Service',
                entryDesignation: 'Assistant Registrar of Co-operative Societies (ARCS)',
                department: 'Co-operation Department',
                roleDescription: 'Regulating cooperative banks (DCC/Apex Bank), agricultural credit societies, and resolving cooperative disputes.',
                careerApex: 'Joint Registrar / Additional Registrar of Co-operative Societies'
            },
            {
                serviceCode: 'ADSW / ADBCW',
                serviceName: 'Assistant Director of Social Welfare / Backward Classes',
                serviceName_kn: 'ಸಹಾಯಕ ನಿರ್ದೇಶಕರು (ಸಮಾಜ ಕಲ್ಯಾಣ / ಹಿಂದುಳಿದ ವರ್ಗಗಳ ಕಲ್ಯಾಣ)',
                group: 'Group B State Service',
                entryDesignation: 'Assistant Director of Social Welfare',
                department: 'Social Welfare & Backward Classes Departments',
                roleDescription: 'Managing post-matric hostels, scholarship distributions, and SC/ST/OBC community development schemes.',
                careerApex: 'Joint Director of Social Welfare / Deputy Director'
            },
            {
                serviceCode: 'DMA (Chief Officer)',
                serviceName: 'Chief Officer (Grade-1) / Municipal Commissioner',
                serviceName_kn: 'ಮುಖ್ಯ ಅಧಿಕಾರಿ (ಗ್ರೇಡ್-೧) / ಪುರಸಭೆ ಆಯುಕ್ತರು',
                group: 'Group B State Service',
                entryDesignation: 'Chief Officer / City Municipal Council Commissioner',
                department: 'Directorate of Municipal Administration (DMA)',
                roleDescription: 'Urban civic administration, town planning, property tax management, and solid waste management in urban local bodies.',
                careerApex: 'Commissioner of City Corporation (CC) / Joint Director DMA'
            }
        ],
        jobRole: {
            designation: 'Assistant Commissioner (AC / Sub-Divisional Magistrate) / Tahsildar / DySP / Commercial Tax Officer (CTO)',
            cadre: 'Group A',
            department: 'Revenue, Police, Commercial Taxes, Rural Development & Panchayat Raj, Finance',
            keyResponsibilities: [
                'Sub-division / Taluk revenue administration, land acquisition, and farmer welfare oversight.',
                'Implementation of Karnataka flagship guarantee schemes (Gruha Lakshmi, Yuva Nidhi, Anna Bhagya, Shakti, Gruha Jyothi).',
                'Supervision of Gram Panchayats, Taluk Panchayats, and execution of Sakala Act service delivery.',
                'Maintaining law, order, and riot containment under the Karnataka Police Act.'
            ],
            careerProgression: [
                'Assistant Commissioner (AC) / Grade-I Tahsildar ➔ Deputy Secretary / Senior AC',
                'Additional Deputy Commissioner (ADC) ➔ IAS Induction (Conferment of Indian Administrative Service)',
                'Deputy Commissioner / District Magistrate (DM) ➔ Secretary / Principal Secretary to Govt of Karnataka'
            ],
            postingLocations: 'Taluk Headquarters, Sub-Divisional Headquarters, District Collectorates across 31 Karnataka Districts, and Vidhana Soudha, Bengaluru.',
            payScale: {
                level: 'Group A: ₹52,650 – ₹97,100 (6th/7th State Pay Commission)',
                basicPayRange: '₹52,650 – ₹97,100',
                approxMonthlyGross: '₹75,000 – ₹1,35,000+ (plus DA, HRA, Medical & Government Quarters)',
                perks: ['Government Official Quarters', 'Official Government Vehicle', 'Telephone & Medical Allowances', 'State Health Scheme (KGID / Arogya Sanjeevini)']
            }
        },
        eligibility: {
            ageLimit: {
                general: '21 to 38 years',
                obc_2a_2b_3a_3b: '21 to 41 years (Cat 2A, 2B, 3A, 3B)',
                sc_st_cat1: '21 to 43 years (SC, ST, Category-1)'
            },
            educationalQualification: 'Graduation degree in any discipline from a recognized University.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Preliminary Examination (Objective / OMR)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 400,
                durationMinutes: 240,
                description: 'Two objective papers of 200 marks each. Negative marking of 0.25 (1/4th) per wrong answer.',
                papers: [
                    {
                        paperName: 'Paper 1 (General Studies, Indian & Karnataka History/Polity/Economy)',
                        questionsCount: 100,
                        marks: 200,
                        durationMinutes: 120,
                        negativeMarking: '0.25 mark deduction',
                        subjects: ['Current Affairs', 'Indian & Karnataka History', 'Indian & Karnataka Geography', 'Indian Constitution & Karnataka Governance', 'Economic & Social Development, Karnataka Economy']
                    },
                    {
                        paperName: 'Paper 2 (General Science, Environment & General Mental Ability)',
                        questionsCount: 100,
                        marks: 200,
                        durationMinutes: 120,
                        negativeMarking: '0.25 mark deduction',
                        subjects: ['State Current Affairs', 'General Science & S&T', 'Ecology & Environment', 'General Mental Ability (Maths, Reasoning, Comprehension in Kannada & English)']
                    }
                ]
            },
            {
                stageNumber: 2,
                stageName: 'Mains Examination (Descriptive)',
                mode: 'Descriptive',
                totalMarks: 1250,
                durationMinutes: 1260,
                description: '2 Qualifying language papers (Kannada & English - 150 marks each) + 5 Merit Ranking Papers (Essay, GS-1, GS-2, GS-3, GS-4 - 250 marks each).',
                papers: [
                    { paperName: 'Essay Paper', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Two Essays: National/International Issues + State/Local Issues'] },
                    { paperName: 'GS-1 (History, Heritage of India & Karnataka, Economy)', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['History of India & Karnataka', 'Social Structure', 'Indian & Karnataka Economy', 'Data Analysis'] },
                    { paperName: 'GS-2 (Geography, Constitution, Public Administration)', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Physical Geography', 'Constitution of India', 'Karnataka Administrative System', 'Lokayukta', 'Sakala'] },
                    { paperName: 'GS-3 (Science & Tech, Environmental Ecology of Karnataka)', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Science and Technology in Development', 'Ecology and Environment of Karnataka and India'] },
                    { paperName: 'GS-4 (Ethics, Integrity and Aptitude)', marks: 250, durationMinutes: 180, negativeMarking: 'None', subjects: ['Ethics and Human Interface', 'Attitude', 'Emotional Intelligence', 'Case Studies'] }
                ]
            },
            {
                stageNumber: 3,
                stageName: 'Personality Test (Interview)',
                mode: 'Interview / Viva Voce',
                totalMarks: 50,
                durationMinutes: 25,
                description: 'Personal interview conducted by KPSC board at Udyoga Soudha, Bengaluru.',
                papers: []
            }
        ],
        syllabusFocus: [
            { pillarName: 'Karnataka History & Heritage', weightage: 'Very High', topics: ['Kadambas', 'Chalukyas of Badami', 'Rashtrakutas', 'Hoysalas', 'Vijayanagara Empire', 'Mysore Wodeyars', 'Unification Movement', 'Vachana Movement'] },
            { pillarName: 'Karnataka Geography & Economy', weightage: 'Very High', topics: ['Kaveri & Krishna Basins', 'Western Ghats', 'State GSDP Trends', 'Karnataka Budget', 'Industrial Policy'] },
            { pillarName: 'Karnataka Governance & Admin', weightage: 'High', topics: ['Article 371J', 'Karnataka Lokayukta Act 1984', 'Sakala Act 2011', 'Panchayat Raj 1993 Act', 'BBMP Act 2020'] }
        ],
        faqs: [
            { question: 'Are Karnataka History and Geography compulsory in KAS?', answer: 'Yes! Over 40% of the questions in Paper 1 and Mains GS-1/GS-2 specifically focus on Karnataka\'s history, heritage, geography, economy, and public governance.' }
        ]
    },

    'kea-vao': {
        id: 'kea-vao',
        slug: 'kea-vao',
        title: 'KEA Village Administrative Officer (VAO)',
        title_kn: 'ಕೆಇಎ ಗ್ರಾಮ ಆಡಳಿತಾಧಿಕಾರಿ (ವಿಎಒ / ಕಂದಾಯ ಇಲಾಖೆ)',
        shortName: 'KEA VAO',
        conductingBody: 'Karnataka Examinations Authority (KEA) & Revenue Department',
        conductingBody_kn: 'ಕರ್ನಾಟಕ ಪರೀಕ್ಷಾ ಪ್ರಾಧಿಕಾರ ಮತ್ತು ಕಂದಾಯ ಇಲಾಖೆ',
        tagline: 'Grassroots revenue administration examination for Village Administrative Officers (formerly Village Accountants).',
        category: 'karnataka',
        overview: 'Village Administrative Officer (VAO), formerly designated as Village Accountant (ಗ್ರಾಮ ಲೆಕ್ಕಿಗ / VA), is the foremost revenue official at the village circle level in Karnataka. KEA conducts this competitive exam for recruitment into Karnataka Revenue Department.',
        jobRole: {
            designation: 'Village Administrative Officer (VAO / ಗ್ರಾಮ ಆಡಳಿತಾಧಿಕಾರಿ)',
            cadre: 'Group C',
            department: 'Revenue Department, Government of Karnataka',
            keyResponsibilities: [
                'Maintaining village land records, RTC (ಪಹಣಿ / Record of Rights, Tenancy and Crops), and Mutation registers via Bhoomi software.',
                'Issuing real-time caste, income, residence, and legal heir certificates via e-Kshana and Seva Sindhu.',
                'Assisting in crop surveys (ಬೆಳೆ ಸಮೀಕ್ಷೆ) and disaster damage assessments (e-Parihara drought/flood compensation).',
                'Executing revenue recoveries, village tax collections, and acting as local custodian of government lands.'
            ],
            careerProgression: [
                'Village Administrative Officer (VAO) ➔ Revenue Inspector (RI / ಕಂದಾಯ ನಿರೀಕ್ಷಕರು)',
                'Revenue Inspector (RI) ➔ Deputy Tahsildar (ಉಪ ತಹಶೀಲ್ದಾರ್)',
                'Deputy Tahsildar ➔ Grade-II Tahsildar / Taluk Executive Magistrate'
            ],
            postingLocations: 'Village Panchayats and Nadakacheri (ನಾಡಕಚೇರಿ) Revenue Circles across Karnataka.',
            payScale: {
                level: 'Pay Scale: ₹21,400 – ₹42,000 (Group C)',
                basicPayRange: '₹21,400 – ₹42,000',
                approxMonthlyGross: '₹32,000 – ₹48,000+ (plus DA, HRA, Medical allowances)',
                perks: ['Government Pension (NPS)', 'Medical Reimbursement (Arogya Sanjeevini)', 'Travelling Allowances']
            }
        },
        eligibility: {
            ageLimit: {
                general: '18 to 35 years',
                obc_2a_2b_3a_3b: '18 to 38 years (2A, 2B, 3A, 3B)',
                sc_st_cat1: '18 to 40 years (SC, ST, Category-1)'
            },
            educationalQualification: 'Passed 12th Standard / 2nd PUC from Karnataka Pre-University Board or equivalent CBSE/ICSE diploma.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Compulsory Kannada Language Test',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 150,
                durationMinutes: 120,
                description: 'Qualifying Kannada test for candidates who have not studied Kannada as first or second language in SSLC (Minimum 50 marks required).',
                papers: [
                    {
                        paperName: 'Compulsory Kannada Test',
                        questionsCount: 150,
                        marks: 150,
                        durationMinutes: 120,
                        negativeMarking: 'None',
                        subjects: ['Kannada Grammar', 'Vocabulary', 'Sentence Formation', 'Comprehension']
                    }
                ]
            },
            {
                stageNumber: 2,
                stageName: 'Main Competitive Examination (OMR Based)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 200,
                durationMinutes: 240,
                description: 'Two objective papers of 100 marks each determining the final merit rank.',
                papers: [
                    {
                        paperName: 'Paper 1: General Knowledge, Kannada & English',
                        questionsCount: 100,
                        marks: 100,
                        durationMinutes: 120,
                        negativeMarking: '0.25 mark deduction',
                        subjects: ['General Knowledge & Current Affairs (40 Marks)', 'General Kannada Grammar & Usage (30 Marks)', 'General English (30 Marks)']
                    },
                    {
                        paperName: 'Paper 2: Computer Knowledge & Mental Ability',
                        questionsCount: 100,
                        marks: 100,
                        durationMinutes: 120,
                        negativeMarking: '0.25 mark deduction',
                        subjects: ['Computer Literacy & MS Office (40 Marks)', 'Arithmetic, Numerical Ability & Reasoning (60 Marks)']
                    }
                ]
            }
        ],
        syllabusFocus: [
            { pillarName: 'General Kannada Grammar', weightage: 'Very High', topics: ['ವರ್ಣಮಾಲೆ', 'ಸಂಧಿ', 'ಸಮಾಸ', 'ತತ್ಸಮ-ತದ್ಭವ', 'ವಿಭಕ್ತಿ', 'ಗಾದೆಗಳು', 'ನುಡಿಗಟ್ಟುಗಳು'] },
            { pillarName: 'Computer Literacy & MS Office', weightage: 'Very High', topics: ['MS Word', 'MS Excel Formulas', 'File Systems', 'Internet & E-Governance Portals (Bhoomi, Seva Sindhu)'] },
            { pillarName: 'General Knowledge & Current Affairs', weightage: 'High', topics: ['Karnataka History', 'Geography of Karnataka', 'Indian Constitution Basics', 'Five Guarantees Schemes'] }
        ],
        faqs: [
            { question: 'Is interview conducted for KEA VAO?', answer: 'No. Selection is purely based on the merit score secured in the 200-mark Main Competitive Examination.' }
        ]
    },

    'kea-pdo': {
        id: 'kea-pdo',
        slug: 'kea-pdo',
        title: 'KEA / KPSC Panchayat Development Officer (PDO)',
        title_kn: 'ಕೆಇಎ / ಕೆಪಿಎಸ್‌ಸಿ ಪಂಚಾಯತ್ ಅಭಿವೃದ್ಧಿ ಅಧಿಕಾರಿ (ಪಿಡಿಒ)',
        shortName: 'KEA PDO',
        conductingBody: 'Karnataka Examinations Authority (KEA) & RDPR Department',
        conductingBody_kn: 'ಕರ್ನಾಟಕ ಪರೀಕ್ಷಾ ಪ್ರಾಧಿಕಾರ ಮತ್ತು ಗ್ರಾಮೀಣಾಭಿವೃದ್ಧಿ ಇಲಾಖೆ',
        tagline: 'Rural administrative leadership post managing Gram Panchayat governance, budget, and development projects.',
        category: 'karnataka',
        overview: 'Panchayat Development Officer (PDO / ಪಂಚಾಯತ್ ಅಭಿವೃದ್ಧಿ ಅಧಿಕಾರಿ) is the Chief Executive Officer of the Gram Panchayat in Karnataka, responsible for executing rural governance under the landmark Karnataka Gram Swaraj and Panchayat Raj Act 1993.',
        jobRole: {
            designation: 'Panchayat Development Officer (PDO / ಗ್ರೇಡ್-೧)',
            cadre: 'Group C',
            department: 'Rural Development and Panchayat Raj (RDPR), Govt of Karnataka',
            keyResponsibilities: [
                'Executive head of Gram Panchayat: Managing GP meetings, budget preparation, and annual action plans.',
                'Implementation of MGNREGA, Swachh Bharat Mission (Grameen), Jal Jeevan Mission, and PMAY-G housing.',
                'Collection of GP property taxes, issuance of trade licenses, and maintaining digital assets on Panchatantra 2.0 and e-Swathu.',
                'Acting as Member Secretary for Gram Sabha and Ward Sabha meetings, ensuring citizen charter compliance.'
            ],
            careerProgression: [
                'Panchayat Development Officer (PDO) ➔ Assistant Director (Panchayat Raj / ಸಹಾಯಕ ನಿರ್ದೇಶಕರು)',
                'Assistant Director ➔ Executive Officer (EO / ತಾಲೂಕು ಪಂಚಾಯತ್ ಇಒ)',
                'Executive Officer (EO) ➔ Deputy Secretary / Chief Planning Officer (ZP)'
            ],
            postingLocations: 'Gram Panchayat Headquarters in rural taluks across Karnataka.',
            payScale: {
                level: 'Pay Scale: ₹37,900 – ₹70,850 (Group C Executive)',
                basicPayRange: '₹37,900 – ₹70,850',
                approxMonthlyGross: '₹52,000 – ₹78,000+ (plus DA, HRA, Travel Allowances)',
                perks: ['NPS Pension Scheme', 'Government Official Allowance', 'Medical Scheme (Arogya Sanjeevini)']
            }
        },
        eligibility: {
            ageLimit: {
                general: '18 to 35 years',
                obc_2a_2b_3a_3b: '18 to 38 years',
                sc_st_cat1: '18 to 40 years'
            },
            educationalQualification: 'Graduation degree in any discipline from a recognized University.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Main Competitive Examination (OMR Based · 2 Papers)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 200,
                durationMinutes: 240,
                description: 'Paper 1 (General Knowledge, Languages, Computer) + Paper 2 (100% Dedicated to Karnataka Gram Swaraj & Panchayat Raj Act 1993 & Rural Development Schemes).',
                papers: [
                    {
                        paperName: 'Paper 1: General Knowledge, General Kannada, English & Computer',
                        questionsCount: 100,
                        marks: 100,
                        durationMinutes: 120,
                        negativeMarking: '0.25 mark deduction',
                        subjects: ['General Knowledge (40 Marks)', 'General Kannada (20 Marks)', 'General English (20 Marks)', 'Computer Knowledge (20 Marks)']
                    },
                    {
                        paperName: 'Paper 2: Rural Development & Karnataka Gram Swaraj Act 1993',
                        questionsCount: 100,
                        marks: 100,
                        durationMinutes: 120,
                        negativeMarking: '0.25 mark deduction',
                        subjects: ['Karnataka Gram Swaraj and Panchayat Raj Act 1993 (All 21 Chapters & 2015 Amendments)', 'Panchayat Administration & Taxation', 'MGNREGA', 'PMAY-G', 'Jal Jeevan Mission', 'SBM-G', 'NRLM / Sanjeevini']
                    }
                ]
            }
        ],
        syllabusFocus: [
            { pillarName: 'Karnataka Gram Swaraj Act 1993', weightage: 'Very High', topics: ['21 Chapters of 1993 Act', '2015 Ramesh Kumar Amendments', 'Ward Sabha & Gram Sabha Powers', 'PDO Powers & Staff Responsibilities', 'e-Swathu & Panchatantra 2.0'] },
            { pillarName: 'Rural Development Flagship Schemes', weightage: 'Very High', topics: ['MGNREGA 100-Day Wage Employment', 'PMAY-G Housing Criteria', 'Swachh Bharat Solid/Liquid Waste', 'JJM Tap Water Supply'] },
            { pillarName: 'General Kannada & Computer', weightage: 'High', topics: ['Kannada Grammar', 'Tatsama-Tadbhava', 'MS Office Basics', 'Networking Fundamentals'] }
        ],
        faqs: [
            { question: 'Why is Paper 2 so important in PDO exam?', answer: 'Paper 2 is entirely dedicated to the Karnataka Panchayat Raj Act 1993 and Rural Development Schemes. Scoring high in Paper 2 is the single biggest determinant of qualifying in the top merit ranks.' }
        ]
    },

    'ksp-psi': {
        id: 'ksp-psi',
        slug: 'ksp-psi',
        title: 'KSP Police Sub-Inspector (PSI)',
        title_kn: 'ಕೆಎಸ್‌ಪಿ ಪೊಲೀಸ್ ಸಬ್-ಇನ್‌ಸ್ಪೆಕ್ಟರ್ (ಪಿಎಸ್‌ಐ - ಸಿವಿಲ್ / ಸಶಸ್ತ್ರ)',
        shortName: 'KSP PSI',
        conductingBody: 'Karnataka State Police (KSP) Recruitment Board',
        conductingBody_kn: 'ಕರ್ನಾಟಕ ರಾಜ್ಯ ಪೊಲೀಸ್ ನೇಮಕಾತಿ ಮಂಡಳಿ',
        tagline: 'Karnataka\'s flagship police service examination for Sub-Inspectors leading police stations and crime investigation.',
        category: 'karnataka',
        overview: 'Police Sub-Inspector (PSI) in Karnataka State Police is the commanding Station House Officer (SHO) at police stations, empowered with investigation and statutory enforcement under the Criminal Procedure Code (CrPC) and Karnataka Police Act.',
        jobRole: {
            designation: 'Police Sub-Inspector (PSI - Civil / CAR / DAR / KSISF / Wireless)',
            cadre: 'Group C Executive (Subordinate Officer)',
            department: 'Home Department / Karnataka State Police',
            keyResponsibilities: [
                'Station House Officer (SHO): Supervising law & order, crime prevention, and emergency response in station jurisdiction.',
                'Conducting criminal investigations, filing FIRs, collecting evidence, and presenting charge-sheets in Magistrate courts.',
                'Managing VIP security, bandobast during festivals and elections, and traffic regulation.',
                'Supervising Assistant Sub-Inspectors (ASI), Head Constables (HC), and Police Constables (PC).'
            ],
            careerProgression: [
                'Police Sub-Inspector (PSI) ➔ Police Inspector (PI / Circle Inspector / CPI)',
                'Police Inspector ➔ Deputy Superintendent of Police (DySP / ACP)',
                'Deputy Superintendent of Police ➔ Superintendent of Police (SP / Non-IPS State Cadre) / IPS Induction'
            ],
            postingLocations: 'Police Stations, Crime Branches, Traffic Divisions, and CID units across Karnataka.',
            payScale: {
                level: 'Pay Scale: ₹37,900 – ₹70,850 (Group C Executive)',
                basicPayRange: '₹37,900 – ₹70,850',
                approxMonthlyGross: '₹55,000 – ₹82,000+ (plus Uniform, Risk, Kit, and Medical Allowances)',
                perks: ['Police Uniform Allowance', 'Risk & Conveyance Allowance', 'Free Police Quarters / HRA', 'Arogya Bhagya Medical Coverage']
            }
        },
        eligibility: {
            ageLimit: {
                general: '21 to 30 years',
                obc_2a_2b_3a_3b: '21 to 32 years',
                sc_st_cat1: '21 to 32 years'
            },
            educationalQualification: 'Graduation degree in any discipline from a recognized University.',
            physicalStandards: [
                'Height: Minimum 168 cm (Male), 157 cm (Female)',
                'Chest: 86 cm with 5 cm expansion (Male)',
                'Endurance Test: 1600m run in 7 mins (Male), 400m in 2 mins (Female)',
                'Long Jump: 3.80m (Male), 2.50m (Female); High Jump: 1.20m (Male), 0.90m (Female)'
            ]
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Physical Standard Test (PST) & Endurance Test (ET)',
                mode: 'Physical Test (PET/PST)',
                totalMarks: 0,
                durationMinutes: 60,
                description: 'Mandatory physical measurement and fitness endurance tests (Qualifying in nature).',
                papers: []
            },
            {
                stageNumber: 2,
                stageName: 'Written Examination (Paper 1 Descriptive + Paper 2 Objective)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 200,
                durationMinutes: 180,
                description: 'Paper 1 (50 Marks Descriptive: Essay, Precis, English-to-Kannada Translation, Kannada-to-English Translation) + Paper 2 (150 Marks Objective General Studies).',
                papers: [
                    {
                        paperName: 'Paper 1 (Descriptive: Translation, Essay & Precis)',
                        marks: 50,
                        durationMinutes: 90,
                        negativeMarking: 'None',
                        subjects: ['Essay Writing (20 Marks)', 'English to Kannada Translation (10 Marks)', 'Kannada to English Translation (10 Marks)', 'Precis Writing (10 Marks)']
                    },
                    {
                        paperName: 'Paper 2 (Objective General Studies & Mental Ability)',
                        questionsCount: 100,
                        marks: 150,
                        durationMinutes: 90,
                        negativeMarking: '0.375 mark deduction (25% of 1.5 marks per question)',
                        subjects: ['Indian Constitution & Polity', 'Indian & Karnataka History', 'Geography & Natural Resources', 'General Science', 'Current Affairs', 'Mental Ability & Logical Reasoning']
                    }
                ]
            }
        ],
        syllabusFocus: [
            { pillarName: 'Translation & Language Grammar', weightage: 'Very High', topics: ['English to Kannada Translation', 'Kannada to English Translation', 'Essay Formulation', 'Precis Summarization'] },
            { pillarName: 'Indian Constitution & Police Powers', weightage: 'Very High', topics: ['Fundamental Rights', 'Criminal Justice System', 'Police Act Provisions', 'Judiciary', 'Parliament'] },
            { pillarName: 'History & Karnataka Heritage', weightage: 'High', topics: ['Freedom Movement', 'Unification of Karnataka', 'Modern Karnataka Dynasties'] }
        ],
        faqs: [
            { question: 'Is translation compulsory in PSI exam?', answer: 'Yes! Paper 1 has 20 marks dedicated exclusively to bilingual translation (10 marks English-to-Kannada and 10 marks Kannada-to-English).' }
        ]
    },

    'ksp-pc': {
        id: 'ksp-pc',
        slug: 'ksp-pc',
        title: 'KSP Police Constable (Civil & Armed)',
        title_kn: 'ಕೆಎಸ್‌ಪಿ ಪೊಲೀಸ್ ಕಾನ್ಸ್ಟೇಬಲ್ (ಸಿವಿಲ್ ಮತ್ತು ಸಿಎಆರ್/ಡಿಎಆರ್)',
        shortName: 'KSP PC',
        conductingBody: 'Karnataka State Police (KSP)',
        conductingBody_kn: 'ಕರ್ನಾಟಕ ರಾಜ್ಯ ಪೊಲೀಸ್',
        tagline: 'Frontline police law-enforcement cadre maintaining public safety across Karnataka.',
        category: 'karnataka',
        overview: 'Police Constable (PC) forms the backbone of frontline policing and law enforcement in Karnataka, responsible for beat patrolling, crime prevention, and traffic management.',
        jobRole: {
            designation: 'Police Constable (Civil / Armed Police / CAR / DAR)',
            cadre: 'Group C Subordinate',
            department: 'Home Department / Karnataka State Police',
            keyResponsibilities: [
                'Beat patrolling, maintaining street vigilance, and preventing petty crimes.',
                'Assisting Investigating Officers during crime scene visits, inquests, and bandobast.',
                'Escorting accused individuals to magistrate courts and prison facilities.',
                'Traffic management, crowd control during processions, and VIP escorts.'
            ],
            careerProgression: [
                'Police Constable (PC) ➔ Head Constable (HC)',
                'Head Constable ➔ Assistant Sub-Inspector (ASI)',
                'Assistant Sub-Inspector ➔ Police Sub-Inspector (PSI)'
            ],
            postingLocations: 'Police Stations, Outposts, Traffic Police Stations, and District Armed Reserves across Karnataka.',
            payScale: {
                level: 'Pay Scale: ₹23,500 – ₹47,650',
                basicPayRange: '₹23,500 – ₹47,650',
                approxMonthlyGross: '₹34,000 – ₹51,000+ (plus Uniform, Risk, and Kit allowances)',
                perks: ['Police Free Housing / HRA', 'Risk Allowance', 'Arogya Bhagya Health Coverage']
            }
        },
        eligibility: {
            ageLimit: {
                general: '19 to 27 years',
                obc_2a_2b_3a_3b: '19 to 30 years',
                sc_st_cat1: '19 to 30 years'
            },
            educationalQualification: 'Passed 12th Standard / 2nd PUC or equivalent 3-year Diploma.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Written Examination (Objective OMR)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 100,
                durationMinutes: 90,
                description: '100 objective questions covering General Knowledge, Science, Geography, Constitution, Mental Ability and Current Affairs.',
                papers: [
                    {
                        paperName: 'Objective General Knowledge & Aptitude',
                        questionsCount: 100,
                        marks: 100,
                        durationMinutes: 90,
                        negativeMarking: '0.25 mark deduction',
                        subjects: ['General Knowledge', 'General Science', 'Indian Constitution', 'Indian & Karnataka History', 'Geography', 'Mental Ability & Basic Arithmetic', 'Current Affairs']
                    }
                ]
            },
            {
                stageNumber: 2,
                stageName: 'Physical Standard & Endurance Test (PST/ET)',
                mode: 'Physical Test (PET/PST)',
                totalMarks: 0,
                durationMinutes: 60,
                description: 'Height measurement, chest expansion (men), and physical running endurance test (Qualifying).',
                papers: []
            }
        ],
        syllabusFocus: [
            { pillarName: 'General Knowledge & Current Affairs', weightage: 'High', topics: ['Karnataka State Affairs', 'Indian Constitution Basics', 'Freedom Struggle', 'National Events'] },
            { pillarName: 'Everyday Science & Mental Ability', weightage: 'High', topics: ['Human Biology', 'Physics in Daily Life', 'Number Series', 'Blood Relations'] }
        ],
        faqs: [
            { question: 'Is Kannada language mandatory for KSP PC?', answer: 'Yes, candidates must be proficient in reading and writing Kannada as daily station diary entries are maintained in Kannada.' }
        ]
    },

    'kpsc-group-c': {
        id: 'kpsc-group-c',
        slug: 'kpsc-group-c',
        title: 'KPSC Group C Non-Technical (CTI / ESI / FDA / SDA)',
        title_kn: 'ಕೆಪಿಎಸ್‌ಸಿ ಗ್ರೂಪ್ ಸಿ ನಾನ್-ಟೆಕ್ನಿಕಲ್ (ಸಿಟಿಐ / ಇಎಸ್‌ಐ / ಎಫ್‌ಡಿಎ / ಎಸ್‌ಡಿಎ)',
        shortName: 'KPSC Group C',
        conductingBody: 'Karnataka Public Service Commission (KPSC)',
        conductingBody_kn: 'ಕರ್ನಾಟಕ ಲೋಕಸೇವಾ ಆಯೋಗ',
        tagline: 'Karnataka\'s major clerical and non-technical recruitment for Commercial Tax Inspectors, Excise Sub-Inspectors, and Executive Assistants.',
        category: 'karnataka',
        overview: 'KPSC Group C Non-Technical examinations recruit for vital departmental executive and clerical positions including Commercial Tax Inspector (CTI), Excise Sub-Inspector (ESI), First Division Assistant (FDA), and Second Division Assistant (SDA).',
        allocatedServices: [
            {
                serviceCode: 'CTI',
                serviceName: 'Commercial Tax Inspector',
                serviceName_kn: 'ವಾಣಿಜ್ಯ ತೆರಿಗೆ ನಿರೀಕ್ಷಕರು (ಸಿಟಿಐ)',
                group: 'Group C State Service',
                entryDesignation: 'Commercial Tax Inspector (CTI)',
                department: 'Commercial Taxes Department',
                roleDescription: 'GST registration verification, business establishment inspection, e-way bill enforcement, and commercial tax audits.',
                careerApex: 'Commercial Tax Officer (CTO / Group A)'
            },
            {
                serviceCode: 'ESI',
                serviceName: 'Excise Sub-Inspector',
                serviceName_kn: 'ಅಬಕಾರಿ ಉಪ-ನಿರೀಕ್ಷಕರು (ಇಎಸ್‌ಐ)',
                group: 'Group C State Service',
                entryDesignation: 'Excise Sub-Inspector (Range In-charge)',
                department: 'Karnataka State Excise Department',
                roleDescription: 'Patrolling, curbing illicit liquor manufacturing/smuggling, inspecting distillery licenses, and enforcing the Karnataka Excise Act.',
                careerApex: 'Excise Superintendent / Deputy Commissioner of Excise'
            },
            {
                serviceCode: 'FDA',
                serviceName: 'First Division Assistant (FDA / Senior Assistant)',
                serviceName_kn: 'ಪ್ರಥಮ ದರ್ಜೆ ಸಹಾಯಕರು (ಎಫ್‌ಡಿಎ)',
                group: 'Group C State Service',
                entryDesignation: 'First Division Assistant (Head Clerk)',
                department: 'Karnataka State Secretariat / DC Offices / District Courts',
                roleDescription: 'Managing case files, preparing administrative notes, processing government schemes, and departmental accounting.',
                careerApex: 'Under Secretary / Section Officer / Administrative Officer'
            },
            {
                serviceCode: 'SDA',
                serviceName: 'Second Division Assistant (SDA / Junior Assistant)',
                serviceName_kn: 'ದ್ವಿತೀಯ ದರ್ಜೆ ಸಹಾಯಕರು (ಎಸ್‌ಡಿಎ)',
                group: 'Group C State Service',
                entryDesignation: 'Second Division Assistant',
                department: 'All Karnataka State Government Departments',
                roleDescription: 'Maintaining office registers, public citizen inward/outward letters, digital data entry, and record management.',
                careerApex: 'First Division Assistant (FDA) ➔ Section Officer'
            }
        ],
        jobRole: {
            designation: 'Commercial Tax Inspector (CTI) / Excise Sub-Inspector (ESI) / FDA / SDA',
            cadre: 'Group C Non-Technical',
            department: 'Commercial Taxes, Excise, Treasury, and Secretariat Departments',
            keyResponsibilities: [
                'Commercial Tax Inspector (CTI): GST audit verification, return assessments, and monitoring commercial border checkpoints.',
                'Excise Sub-Inspector (ESI): Enforcing the Karnataka Excise Act, inspecting liquor outlets, and preventing illicit liquor trade.',
                'First Division Assistant (FDA): File management, drafting government orders, and auditing departmental accounts in government secretariats.'
            ],
            careerProgression: [
                'CTI / FDA ➔ Assistant Commercial Tax Officer (ACTO) / Superintendent',
                'ACTO ➔ Commercial Tax Officer (CTO / Group A)',
                'CTO ➔ Joint Commissioner of Commercial Taxes'
            ],
            postingLocations: 'Commercial Tax Offices, Excise Ranges, and District Secretariats across Karnataka.',
            payScale: {
                level: 'Pay Scale: ₹27,650 – ₹62,600 (CTI / FDA)',
                basicPayRange: '₹27,650 – ₹62,600',
                approxMonthlyGross: '₹42,000 – ₹68,000+ (plus DA, HRA, allowances)',
                perks: ['NPS Pension Scheme', 'Arogya Sanjeevini Medical Scheme', 'State Festival Allowances']
            }
        },
        eligibility: {
            ageLimit: {
                general: '18 to 35 years',
                obc_2a_2b_3a_3b: '18 to 38 years',
                sc_st_cat1: '18 to 40 years'
            },
            educationalQualification: 'Graduation degree in any discipline for CTI/FDA/ESI; 12th/PUC for SDA.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Competitive Examination (OMR Based · 2 Papers)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 200,
                durationMinutes: 210,
                description: 'Paper 1 (100 Marks General Knowledge) + Paper 2 (100 Marks: General Kannada 35M, General English 35M, Computer Knowledge 30M).',
                papers: [
                    {
                        paperName: 'Paper 1: General Knowledge',
                        questionsCount: 100,
                        marks: 100,
                        durationMinutes: 90,
                        negativeMarking: '0.25 mark deduction',
                        subjects: ['Current Affairs', 'Indian & Karnataka History', 'Indian Polity & Governance', 'Geography', 'Indian & Karnataka Economy', 'Everyday Science']
                    },
                    {
                        paperName: 'Paper 2: General Kannada, General English & Computer Knowledge',
                        questionsCount: 100,
                        marks: 100,
                        durationMinutes: 120,
                        negativeMarking: '0.25 mark deduction',
                        subjects: ['General Kannada Grammar & Usage (35 Marks)', 'General English Grammar & Vocabulary (35 Marks)', 'Computer Awareness & MS Office (30 Marks)']
                    }
                ]
            }
        ],
        syllabusFocus: [
            { pillarName: 'General Kannada Grammar', weightage: 'Very High', topics: ['ವರ್ಣಮಾಲೆ', 'ಸಂಧಿ', 'ಸಮಾಸ', 'ತತ್ಸಮ-ತದ್ಭವ', 'ವಿಭಕ್ತಿ', 'ಗಾದೆಗಳು'] },
            { pillarName: 'Computer Awareness', weightage: 'Very High', topics: ['MS Word', 'MS Excel', 'Internet Protocols', 'File Types'] },
            { pillarName: 'General English Grammar', weightage: 'High', topics: ['Parts of Speech', 'Tenses', 'Active/Passive Voice', 'Direct/Indirect Speech', 'Idioms'] }
        ],
        faqs: [
            { question: 'What is the role of Commercial Tax Inspector (CTI)?', answer: 'CTIs enforce GST compliance, inspect commercial entities, investigate tax evasion, and monitor state commercial tax collections.' }
        ]
    },

    'kartet': {
        id: 'kartet',
        slug: 'kartet',
        title: 'KARTET (Karnataka Teachers Eligibility Test)',
        title_kn: 'ಕರ್ನಾಟಕ ಶಿಕ್ಷಕರ ಅರ್ಹತಾ ಪರೀಕ್ಷೆ (ಕೆ-ಟೆಟ್)',
        shortName: 'KARTET',
        conductingBody: 'School Education Department, Government of Karnataka',
        conductingBody_kn: 'ಶಾಲಾ ಶಿಕ್ಷಣ ಮತ್ತು ಸಾಕ್ಷರತಾ ಇಲಾಖೆ, ಕರ್ನಾಟಕ ಸರ್ಕಾರ',
        tagline: 'Mandatory state qualifying examination for primary and upper-primary school teachers in Karnataka.',
        category: 'teaching',
        overview: 'Karnataka Teachers Eligibility Test (KARTET) is the statutory qualifying examination conducted by the School Education Department under NCTE norms for appointment as teachers in Classes 1 to 8 in Karnataka.',
        jobRole: {
            designation: 'Primary School Teacher (Classes 1–5) / Upper Primary School Teacher (Classes 6–8)',
            cadre: 'Group C (Teaching Cadre)',
            department: 'Department of School Education & Literacy, Karnataka',
            keyResponsibilities: [
                'Teaching foundational curriculum in government, aided, and private primary / higher primary schools.',
                'Implementing Continuous and Comprehensive Evaluation (CCE) and student progress tracking.',
                'Fostering inclusive education for children with special needs (CWSN) under NEP 2020 and RTE Act 2009.',
                'Coordinating midday meal programs, parent-teacher meetings, and school development committees (SDMC).'
            ],
            careerProgression: [
                'Primary School Teacher (PST / GPT) ➔ Senior Primary School Teacher',
                'Senior Primary School Teacher ➔ Headmaster / Headmistress (HM)',
                'Headmaster ➔ Block Education Officer (BEO) / Assistant Director'
            ],
            postingLocations: 'Government, Aided, and Unaided Schools across rural and urban Karnataka.',
            payScale: {
                level: 'Pay Scale: ₹27,650 – ₹52,650 (State Teaching Pay Scale)',
                basicPayRange: '₹27,650 – ₹52,650',
                approxMonthlyGross: '₹40,000 – ₹58,000+ (plus DA, HRA, allowances)',
                perks: ['Vacation Leave', 'KGID / Arogya Sanjeevini Health Coverage', 'NPS Pension Benefits']
            }
        },
        eligibility: {
            ageLimit: {
                general: '18 to 40 years',
                obc_2a_2b_3a_3b: '18 to 43 years',
                sc_st_cat1: '18 to 45 years'
            },
            educationalQualification: 'Paper 1: PUC/12th (50%) + D.El.Ed / D.Ed; Paper 2: Graduation (50%) + B.Ed / D.El.Ed.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Paper 1 (For Teaching Classes 1 to 5 - Primary Stage)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 150,
                durationMinutes: 150,
                description: '150 objective questions of 1 mark each. No negative marking. Qualifying score: 60% (90 marks for General, 55% / 82.5 marks for Reserved categories).',
                papers: [
                    {
                        paperName: 'Paper 1 (Primary Teacher Eligibility)',
                        questionsCount: 150,
                        marks: 150,
                        durationMinutes: 150,
                        negativeMarking: 'None',
                        subjects: ['Child Development & Pedagogy (30 Qs)', 'Language I - Kannada (30 Qs)', 'Language II - English (30 Qs)', 'Mathematics (30 Qs)', 'Environmental Studies - EVS (30 Qs)']
                    }
                ]
            },
            {
                stageNumber: 2,
                stageName: 'Paper 2 (For Teaching Classes 6 to 8 - Higher Primary Stage)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 150,
                durationMinutes: 150,
                description: '150 objective questions. Candidate chooses either Maths & Science Stream OR Social Science Stream.',
                papers: [
                    {
                        paperName: 'Paper 2 (Higher Primary Teacher Eligibility)',
                        questionsCount: 150,
                        marks: 150,
                        durationMinutes: 150,
                        negativeMarking: 'None',
                        subjects: ['Child Development & Pedagogy (30 Qs)', 'Language I - Kannada (30 Qs)', 'Language II - English (30 Qs)', 'Specific Subject Stream: Maths & Science (60 Qs) OR Social Studies (60 Qs)']
                    }
                ]
            }
        ],
        syllabusFocus: [
            { pillarName: 'Child Development & Pedagogy (CDP)', weightage: 'Very High', topics: ['Piaget Cognitive Stages', 'Vygotsky ZPD & Scaffolding', 'Kohlberg Moral Development', 'Inclusive Education & CWSN', 'CCE Assessment', 'Bloom Taxonomy'] },
            { pillarName: 'Language I & II (Kannada & English)', weightage: 'Very High', topics: ['Kannada Grammar & Pedagogy', 'English Grammar & Comprehension', 'Methods of Language Teaching'] },
            { pillarName: 'Social Studies & Environmental Studies', weightage: 'High', topics: ['Karnataka & Indian History', 'Earth & Solar System', 'Ecology & Pollution', 'Indian Constitution'] }
        ],
        faqs: [
            { question: 'What is the validity of KARTET certificate?', answer: 'KARTET qualifying certificate now has Lifetime Validity as per amended NCTE and Karnataka Government rules.' }
        ]
    },

    'kea-kset': {
        id: 'kea-kset',
        slug: 'kea-kset',
        title: 'KEA Assistant Professor & KSET',
        title_kn: 'ಕೆಇಎ ಸಹಾಯಕ ಪ್ರಾಧ್ಯಾಪಕರು ಮತ್ತು ಕೆ-ಸೆಟ್ (KSET)',
        shortName: 'KSET',
        conductingBody: 'Karnataka Examinations Authority (KEA) / Nodal Agency',
        conductingBody_kn: 'ಕರ್ನಾಟಕ ಪರೀಕ್ಷಾ ಪ್ರಾಧಿಕಾರ (ಕೆಇಎ)',
        tagline: 'Karnataka State Eligibility Test & Assistant Professor recruitment for Government First Grade Colleges and Universities.',
        category: 'teaching',
        overview: 'Karnataka State Eligibility Test (KSET) is conducted by KEA to determine eligibility for Assistant Professorship in First Grade Degree Colleges and Universities across Karnataka, adhering strictly to UGC guidelines.',
        jobRole: {
            designation: 'Assistant Professor / Lecturer',
            cadre: 'Group A (Academic / UGC Scale)',
            department: 'Department of Collegiate Education, Govt of Karnataka',
            keyResponsibilities: [
                'Teaching undergraduate and postgraduate courses in government and constituent degree colleges.',
                'Guiding student research dissertations, conducting academic seminars, and publishing research papers.',
                'Developing semester curriculum, setting university examination papers, and conducting evaluations.',
                'Participating in college accreditation (NAAC), NSS/NCC programs, and internal quality cells (IQAC).'
            ],
            careerProgression: [
                'Assistant Professor (Academic Level 10) ➔ Associate Professor (Academic Level 13A)',
                'Associate Professor ➔ Professor (Academic Level 14)',
                'Professor ➔ College Principal / University Dean / Vice-Chancellor'
            ],
            postingLocations: 'Government First Grade Degree Colleges (GFGC) and State Universities across Karnataka.',
            payScale: {
                level: 'UGC 7th Pay Scale: Academic Level 10 (₹57,700 – ₹1,82,400)',
                basicPayRange: '₹57,700 – ₹1,82,400',
                approxMonthlyGross: '₹92,000 – ₹1,35,000+ (plus UGC DA, HRA, Medical)',
                perks: ['UGC Research Grants', 'Summer & Winter Vacations', 'Sabbatical Leave for Research', 'Arogya Sanjeevini Health Scheme']
            }
        },
        eligibility: {
            ageLimit: {
                general: 'No upper age limit for KSET; 21 to 40 years for direct Assistant Professor recruitment'
            },
            educationalQualification: 'Master\'s degree (Post-Graduation) with minimum 55% marks (50% for SC/ST/Cat-I/OBC) from a recognized University.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'KSET Written Examination (Objective OMR · 2 Papers)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 300,
                durationMinutes: 180,
                description: 'Paper 1 (General Paper on Teaching & Research Aptitude - 100 Marks) + Paper 2 (Core Subject - 200 Marks).',
                papers: [
                    {
                        paperName: 'Paper 1: Teaching & Research Aptitude',
                        questionsCount: 50,
                        marks: 100,
                        durationMinutes: 60,
                        negativeMarking: 'None',
                        subjects: ['Teaching Aptitude', 'Research Aptitude', 'Reading Comprehension', 'Communication', 'Mathematical Reasoning & DI', 'Information & Communication Technology (ICT)', 'People, Development & Environment', 'Higher Education System']
                    },
                    {
                        paperName: 'Paper 2: Core Subject Domain',
                        questionsCount: 100,
                        marks: 200,
                        durationMinutes: 120,
                        negativeMarking: 'None',
                        subjects: ['Candidate Specialization Post-Graduate Subject (History, Kannada, Economics, Physics, Commerce, etc.)']
                    }
                ]
            }
        ],
        syllabusFocus: [
            { pillarName: 'Teaching & Research Aptitude', weightage: 'Very High', topics: ['Learner Characteristics', 'Methods of Teaching', 'Research Methods & Ethics', 'ICT in Education', 'SDGs & Higher Education Polity'] },
            { pillarName: 'ICT & Cyber Systems', weightage: 'High', topics: ['Digital Initiatives in Higher Education', 'E-Governance', 'Basics of Internet & Intranet'] }
        ],
        faqs: [
            { question: 'Is KSET qualification valid across India?', answer: 'KSET certificate qualifies you for Assistant Professorship in all universities and colleges across Karnataka. For all-India eligibility, candidates can appear for UGC NET.' }
        ]
    },

    'upsc-capf': {
        id: 'upsc-capf',
        slug: 'upsc-capf',
        title: 'UPSC Central Armed Police Forces (CAPF - AC)',
        title_kn: 'ಯುಪಿಎಸ್‌ಸಿ ಕೇಂದ್ರ ಸಶಸ್ತ್ರ ಪೊಲೀಸ್ ಪಡೆ (ಅಸಿಸ್ಟೆಂಟ್ ಕಮಾಂಡೆಂಟ್)',
        shortName: 'UPSC CAPF',
        conductingBody: 'Union Public Service Commission (UPSC)',
        conductingBody_kn: 'ಕೇಂದ್ರ ಲೋಕಸೇವಾ ಆಯೋಗ',
        tagline: 'Direct entry as Gazetted Class-1 Officer (Assistant Commandant) in BSF, CRPF, CISF, ITBP, and SSB.',
        category: 'defence',
        overview: 'UPSC CAPF (Assistant Commandant) examination recruits directly into the rank of Assistant Commandant (equivalent to ACP / DSP in Police and Captain in Army) in India\'s five paramilitary forces: BSF, CRPF, CISF, ITBP, and SSB.',
        allocatedServices: [
            {
                serviceCode: 'BSF',
                serviceName: 'Border Security Force',
                serviceName_kn: 'ಗಡಿ ಭದ್ರತಾ ಪಡೆ (ಬಿಎಸ್‌ಎಫ್)',
                group: 'All India Service (AIS)',
                entryDesignation: 'Assistant Commandant (Company Commander)',
                department: 'Ministry of Home Affairs (MHA)',
                roleDescription: 'Defending India\'s land borders along Pakistan and Bangladesh, anti-trans-border crime, and desert/riverine combat operations.',
                careerApex: 'Director General (DG) / Additional Director General (ADG)'
            },
            {
                serviceCode: 'CRPF',
                serviceName: 'Central Reserve Police Force',
                serviceName_kn: 'ಕೇಂದ್ರ ಮೀಸಲು ಪೊಲೀಸ್ ಪಡೆ (ಸಿಆರ್‌ಪಿಎಫ್)',
                group: 'All India Service (AIS)',
                entryDesignation: 'Assistant Commandant (Company Commander)',
                department: 'Ministry of Home Affairs (MHA)',
                roleDescription: 'Premier internal security force executing counter-terrorism in J&K, anti-Naxal operations (CoBRA), and major election security.',
                careerApex: 'Director General (DG) / Special Director General'
            },
            {
                serviceCode: 'CISF',
                serviceName: 'Central Industrial Security Force',
                serviceName_kn: 'ಕೇಂದ್ರ ಕೈಗಾರಿಕಾ ಭದ್ರತಾ ಪಡೆ (ಸಿಐಎಸ್ಎಫ್)',
                group: 'All India Service (AIS)',
                entryDesignation: 'Assistant Commandant',
                department: 'Ministry of Home Affairs (MHA)',
                roleDescription: 'Securing critical national assets, nuclear installations, ISRO space centers, seaports, Delhi Metro, and 65+ civil airports.',
                careerApex: 'Director General (DG), CISF'
            },
            {
                serviceCode: 'ITBP',
                serviceName: 'Indo-Tibetan Border Police',
                serviceName_kn: 'ಭಾರತ-ಟಿಬೆಟ್ ಗಡಿ ಪೊಲೀಸ್ (ಐಟಿಬಿಪಿ)',
                group: 'All India Service (AIS)',
                entryDesignation: 'Assistant Commandant',
                department: 'Ministry of Home Affairs (MHA)',
                roleDescription: 'Guarding the 3,488 km high-altitude Himalayan frontier along the Indo-China LAC (Ladakh to Arunachal Pradesh).',
                careerApex: 'Director General (DG), ITBP'
            },
            {
                serviceCode: 'SSB',
                serviceName: 'Sashastra Seema Bal',
                serviceName_kn: 'ಸಶಸ್ತ್ರ ಸೀಮಾ ಬಲ್ (ಎಸ್‌ಎಸ್‌ಬಿ)',
                group: 'All India Service (AIS)',
                entryDesignation: 'Assistant Commandant',
                department: 'Ministry of Home Affairs (MHA)',
                roleDescription: 'Manning and securing India\'s open international borders along Nepal and Bhutan, intelligence gathering, and border security.',
                careerApex: 'Director General (DG), SSB'
            }
        ],
        jobRole: {
            designation: 'Assistant Commandant (AC / Company Commander)',
            cadre: 'Group A Gazetted Combat Officer',
            department: 'Ministry of Home Affairs (MHA), Government of India',
            keyResponsibilities: [
                'Company Commander: Leading a paramilitary company of ~135 combat troops in tactical operations.',
                'Border security & anti-infiltration patrols (BSF / ITBP / SSB along Pakistan, China, Nepal, Bangladesh borders).',
                'Counter-insurgency and anti-Naxal operations (CRPF in Jammu & Kashmir and Left-Wing Extremism zones).',
                'Industrial security, critical infrastructure, and airport defense (CISF).'
            ],
            careerProgression: [
                'Assistant Commandant (AC) ➔ Deputy Commandant (DC)',
                'Deputy Commandant ➔ Second-in-Command (2IC) ➔ Commandant (Battalion Commander)',
                'Commandant ➔ DIG ➔ Inspector General (IG) ➔ Additional Director General (ADG)'
            ],
            postingLocations: 'International Border Posts, Counter-Terrorism Theatres (J&K, North-East), Metro Airports, and MHA Headquarters.',
            payScale: {
                level: 'Level 10 (7th Pay Commission): ₹56,100 – ₹1,77,500',
                basicPayRange: '₹56,100 – ₹1,77,500',
                approxMonthlyGross: '₹95,000 – ₹1,35,000+ (plus Military Hardship / High Altitude / Risk Allowances)',
                perks: ['Free Officer Accommodation', 'Subsidized Military Canteen (CLDS)', 'Government Vehicle', 'CGHS Medical Care', 'Risk & Tough Location Allowances up to ₹25,000/mo']
            }
        },
        eligibility: {
            ageLimit: {
                general: '20 to 25 years',
                obc: '20 to 28 years (OBC Non-Creamy Layer)',
                sc_st: '20 to 30 years'
            },
            educationalQualification: 'Graduation degree in any discipline from a recognized University.',
            physicalStandards: [
                'Height: Minimum 165 cm (Male), 157 cm (Female)',
                'Chest: 81 cm with 5 cm expansion (Male)',
                '100m Race: 16 seconds (Male), 18 seconds (Female)',
                '800m Race: 3 mins 45 secs (Male), 4 mins 45 secs (Female)',
                'Long Jump: 3.5 meters (Male), 3.0 meters (Female)',
                'Shot Put (7.26 kg): 4.5 meters (Male)'
            ]
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Written Examination (Paper 1 Objective + Paper 2 Descriptive)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 450,
                durationMinutes: 300,
                description: 'Paper 1 (250 Marks Objective General Ability) held in morning session + Paper 2 (200 Marks Descriptive Essay, Comprehension, Precis, Counter-Arguments) in afternoon session.',
                papers: [
                    {
                        paperName: 'Paper 1: General Ability & Intelligence',
                        questionsCount: 125,
                        marks: 250,
                        durationMinutes: 120,
                        negativeMarking: '0.33 mark deduction',
                        subjects: ['General Science', 'Current Events of National & International Importance', 'Indian Polity & Economy', 'History of India', 'Indian & World Geography', 'General Mental Ability']
                    },
                    {
                        paperName: 'Paper 2: General Studies, Essay & Comprehension',
                        marks: 200,
                        durationMinutes: 180,
                        negativeMarking: 'None',
                        subjects: ['Essays in English/Hindi (80 Marks)', 'Comprehension, Precis Writing, Counter-Argument Reports, Grammar (120 Marks)']
                    }
                ]
            },
            {
                stageNumber: 2,
                stageName: 'Physical Standards & Medical Examination (PET/PST)',
                mode: 'Physical Test (PET/PST)',
                totalMarks: 0,
                durationMinutes: 60,
                description: 'Mandatory physical measurement and endurance test conducted by CAPF nodal forces.',
                papers: []
            },
            {
                stageNumber: 3,
                stageName: 'Interview / Personality Test',
                mode: 'Interview / Viva Voce',
                totalMarks: 150,
                durationMinutes: 30,
                description: 'Conducted at UPSC Headquarters, Dholpur House, New Delhi.',
                papers: []
            }
        ],
        syllabusFocus: [
            { pillarName: 'Internal Security & Defence', weightage: 'Very High', topics: ['Border Management', 'Left-Wing Extremism', 'Cyber Warfare', 'Paramilitary Operations', 'Disaster Management'] },
            { pillarName: 'Indian Polity & Freedom Struggle', weightage: 'Very High', topics: ['Fundamental Rights', 'Emergency Provisions', 'Modern Freedom Movement 1857-1947', 'Federal Structure'] },
            { pillarName: 'General Science & Geography', weightage: 'High', topics: ['Physics, Chemistry, Biology in daily life', 'Physical & Strategic Geography of India'] }
        ],
        faqs: [
            { question: 'What forces are covered under UPSC CAPF?', answer: 'BSF (Border Security Force), CRPF (Central Reserve Police Force), CISF (Central Industrial Security Force), ITBP (Indo-Tibetan Border Police), and SSB (Sashastra Seema Bal).' }
        ]
    },

    'upsc-cds': {
        id: 'upsc-cds',
        slug: 'upsc-cds',
        title: 'UPSC Combined Defence Services (CDS)',
        title_kn: 'ಯುಪಿಎಸ್‌ಸಿ ಸಂಯೋಜಿತ ರಕ್ಷಣಾ ಸೇವೆಗಳು (ಸಿಡಿಎಸ್)',
        shortName: 'UPSC CDS',
        conductingBody: 'Union Public Service Commission (UPSC)',
        conductingBody_kn: 'ಕೇಂದ್ರ ಲೋಕಸೇವಾ ಆಯೋಗ',
        tagline: 'Commissioning as Lieutenant / Sub-Lieutenant / Flying Officer in the Indian Army, Navy, and Air Force.',
        category: 'defence',
        overview: 'UPSC CDS examination is conducted twice a year (CDS I & CDS II) for commissioning permanent and short-service officers into the Indian Military Academy (IMA), Indian Naval Academy (INA), Air Force Academy (AFA), and Officers Training Academy (OTA).',
        allocatedServices: [
            {
                serviceCode: 'IMA',
                serviceName: 'Indian Military Academy (Dehradun)',
                serviceName_kn: 'ಭಾರತೀಯ ಮಿಲಿಟರಿ ಅಕಾಡೆಮಿ (ಡೆಹ್ರಾಡೂನ್)',
                group: 'Defence Academy / Wing',
                entryDesignation: 'Lieutenant (Indian Army - Permanent Commission)',
                department: 'Ministry of Defence / Indian Army',
                roleDescription: 'Permanent Commission into Combat Arms (Infantry, Armoured Corps, Mechanised Infantry, Artillery, Engineers, Signals).',
                careerApex: 'General (Chief of the Army Staff / Chief of Defence Staff)'
            },
            {
                serviceCode: 'INA',
                serviceName: 'Indian Naval Academy (Ezhimala)',
                serviceName_kn: 'ಭಾರತೀಯ ನೌಕಾ ಅಕಾಡೆಮಿ (ಎಝಿಮಲ)',
                group: 'Defence Academy / Wing',
                entryDesignation: 'Sub-Lieutenant (Indian Navy - Permanent Commission)',
                department: 'Ministry of Defence / Indian Navy',
                roleDescription: 'Executive Officer commanding warships, submarines, naval aviation, or naval engineering & weapons systems.',
                careerApex: 'Admiral (Chief of the Naval Staff)'
            },
            {
                serviceCode: 'AFA',
                serviceName: 'Air Force Academy (Dundigal / Hyderabad)',
                serviceName_kn: 'ಏರ್ ಫೋರ್ಸ್ ಅಕಾಡೆಮಿ (ಹೈದರಾಬಾದ್)',
                group: 'Defence Academy / Wing',
                entryDesignation: 'Flying Officer (Indian Air Force - Permanent Commission)',
                department: 'Ministry of Defence / Indian Air Force',
                roleDescription: 'Fighter Pilot, Transport/Helicopter Pilot, Fighter Controller, Navigation, and Ground Duty technical leadership.',
                careerApex: 'Air Chief Marshal (Chief of the Air Staff)'
            },
            {
                serviceCode: 'OTA',
                serviceName: 'Officers Training Academy (Chennai)',
                serviceName_kn: 'ಆಫೀಸರ್ಸ್ ಟ್ರೈನಿಂಗ್ ಅಕಾಡೆಮಿ (ಚೆನ್ನೈ)',
                group: 'Defence Academy / Wing',
                entryDesignation: 'Lieutenant (Indian Army - Short Service Commission)',
                department: 'Ministry of Defence / Indian Army',
                roleDescription: 'Short Service Commission (10+4 years) for Men and Women officers in Indian Army combat support and logistical arms.',
                careerApex: 'Major General / Option to convert to Permanent Commission'
            }
        ],
        jobRole: {
            designation: 'Lieutenant (Army) / Sub-Lieutenant (Navy) / Flying Officer (Air Force)',
            cadre: 'Defence Officer (Commissioned Officer)',
            department: 'Ministry of Defence / Indian Armed Forces',
            keyResponsibilities: [
                'Platoon / Troop Commander: Leading combat troops in border defense, air defense, or naval fleet operations.',
                'Commanding armored columns, artillery batteries, infantry assault teams, or naval warships.',
                'Executing humanitarian assistance, disaster relief (HADR), and United Nations peacekeeping missions.',
                'Continuous operational readiness, weapons maintenance, and troops tactical training.'
            ],
            careerProgression: [
                'Lieutenant ➔ Captain (2 years) ➔ Major (6 years)',
                'Major ➔ Lieutenant Colonel (13 years) ➔ Colonel (Selection Board)',
                'Colonel ➔ Brigadier ➔ Major General ➔ Lieutenant General ➔ General (Chief of Army Staff)'
            ],
            postingLocations: 'Military Garrisons, High-Altitude Border Bases (Siachen, LAC, LOC), Naval Dockyards, and Air Force Bases across India.',
            payScale: {
                level: 'Level 10 (7th Pay Commission): ₹56,100 – ₹1,77,500 + MSP',
                basicPayRange: '₹56,100 – ₹1,77,500',
                approxMonthlyGross: '₹1,05,000 – ₹1,55,000+ (includes Military Service Pay / MSP ₹15,500/mo + DA + Hardship Allowances)',
                perks: ['Officer Mess & Free Bungalow Quarters', 'Defence Canteen (CSD)', 'Army Air Travel Vouchers', 'Military Hospital Complete Family Healthcare']
            }
        },
        eligibility: {
            ageLimit: {
                general: 'IMA: 19 to 24 years; INA: 19 to 24 years; AFA: 20 to 24 years; OTA: 19 to 25 years'
            },
            educationalQualification: 'IMA & OTA: Degree from a recognized University; INA: Engineering Degree; AFA: Degree with Physics & Math at 10+2 or Bachelor of Engineering.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Written Examination (Objective OMR)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 300,
                durationMinutes: 360,
                description: 'For IMA, INA, AFA: English (100M) + General Knowledge (100M) + Elementary Mathematics (100M). For OTA: English (100M) + General Knowledge (100M).',
                papers: [
                    {
                        paperName: 'English Language',
                        questionsCount: 120,
                        marks: 100,
                        durationMinutes: 120,
                        negativeMarking: '0.33 mark deduction',
                        subjects: ['Reading Comprehension', 'Sentence Arrangement', 'Synonyms & Antonyms', 'Ordering of Words', 'Idioms & Phrases', 'Error Detection']
                    },
                    {
                        paperName: 'General Knowledge',
                        questionsCount: 120,
                        marks: 100,
                        durationMinutes: 120,
                        negativeMarking: '0.33 mark deduction',
                        subjects: ['General Science (Physics, Chemistry, Biology - Class 9-10 level)', 'Indian History & Freedom Struggle', 'Geography of India & World', 'Indian Polity & Constitution', 'Defence & Current Affairs']
                    },
                    {
                        paperName: 'Elementary Mathematics (Except OTA)',
                        questionsCount: 100,
                        marks: 100,
                        durationMinutes: 120,
                        negativeMarking: '0.33 mark deduction',
                        subjects: ['Arithmetic & Number Systems', 'Algebra & Quadratic Equations', 'Trigonometry & Heights/Distances', 'Geometry & Mensuration', 'Statistics & Probability']
                    }
                ]
            },
            {
                stageNumber: 2,
                stageName: 'SSB Interview (Service Selection Board)',
                mode: 'Interview / Viva Voce',
                totalMarks: 300,
                durationMinutes: 3000,
                description: '5-Day comprehensive assessment involving Screening Tests (OIR & PPDT), Psychological Testing (TAT, WAT, SRT), Group Testing Officer (GTO) Ground Tasks, and Personal Interview.',
                papers: []
            }
        ],
        syllabusFocus: [
            { pillarName: 'General Science & Defence GK', weightage: 'Very High', topics: ['Physics Mechanics & Optics', 'Chemistry Everyday Compounds', 'Human Biology & Health', 'Defence Exercises & Missiles'] },
            { pillarName: 'English Grammar & Vocabulary', weightage: 'Very High', topics: ['Reading Comprehension', 'Idioms', 'Ordering of Sentences', 'Direct/Indirect Speech'] },
            { pillarName: 'Elementary Mathematics', weightage: 'Very High', topics: ['Trigonometry', 'Circles & Triangles Geometry', 'Mensuration 3D Solids', 'Speed-Time-Distance'] }
        ],
        faqs: [
            { question: 'Is Mathematics required for Officers Training Academy (OTA)?', answer: 'No. Candidates applying for OTA appear only for English (100 Marks) and General Knowledge (100 Marks). Elementary Mathematics is not required for OTA.' }
        ]
    },

    'karnataka-gpstr': {
        id: 'karnataka-gpstr',
        slug: 'karnataka-gpstr',
        title: 'Karnataka GPSTR (Graduate Primary School Teachers)',
        title_kn: 'ಪದವೀಧರ ಪ್ರಾಥಮಿಕ ಶಾಲಾ ಶಿಕ್ಷಕರ ನೇಮಕಾತಿ (GPSTR - 6 ರಿಂದ 8ನೇ ತರಗತಿ)',
        shortName: 'Karnataka GPSTR',
        conductingBody: 'School Education Department & CAC, Karnataka',
        conductingBody_kn: 'ಶಾಲಾ ಶಿಕ್ಷಣ ಇಲಾಖೆ ಮತ್ತು ಕೇಂದ್ರೀಯ ದಾಖಲಾತಿ ಘಟಕ (CAC)',
        tagline: 'Direct recruitment examination for Graduate Primary School Teachers (GPT) in Government Schools for Classes 6 to 8.',
        category: 'teaching',
        overview: 'Karnataka GPSTR (Graduate Primary School Teacher Recruitment) is conducted by the Centralized Admission Cell (CAC) under the Department of School Education for direct recruitment of graduate subject teachers (Social Science, Mathematics & Science, English, Kannada) in Government Higher Primary Schools.',
        jobRole: {
            designation: 'Graduate Primary Teacher (GPT / ಪದವೀಧರ ಪ್ರಾಥಮಿಕ ಶಿಕ್ಷಕರು)',
            cadre: 'Group C (Teaching Cadre)',
            department: 'Department of School Education & Literacy, Govt of Karnataka',
            keyResponsibilities: [
                'Teaching specialized subjects (Social Science, Mathematics, Science, Languages) in Classes 6 to 8.',
                'Preparing lesson plans, diagnostic learning tools, and conducting formative/summative evaluations (CCE).',
                'Implementing NEP 2020 experiential learning, STEM modules, and student remedial programs.',
                'Managing school academic events, midday meal administration, and student mental health counselling.'
            ],
            careerProgression: [
                'Graduate Primary Teacher (GPT) ➔ High School Teacher (HST / Group B)',
                'High School Teacher ➔ High School Headmaster (HM)',
                'Headmaster ➔ Block Education Officer (BEO) / Deputy Director of Public Instruction (DDPI)'
            ],
            postingLocations: 'Government Higher Primary Schools (GHPS) across 31 Karnataka Districts.',
            payScale: {
                level: 'Pay Scale: ₹27,650 – ₹52,650 (State Teaching Pay Scale)',
                basicPayRange: '₹27,650 – ₹52,650',
                approxMonthlyGross: '₹42,000 – ₹62,000+ (plus DA, HRA, Teaching Allowances)',
                perks: ['Vacation Leave', 'Arogya Sanjeevini State Health Insurance', 'NPS Pension Benefits']
            }
        },
        eligibility: {
            ageLimit: {
                general: '21 to 40 years',
                obc_2a_2b_3a_3b: '21 to 43 years',
                sc_st_cat1: '21 to 45 years'
            },
            educationalQualification: 'Graduation degree in relevant subject with minimum 50% marks + B.Ed / D.El.Ed + Passed KARTET / CTET Paper 2.'
        },
        stages: [
            {
                stageNumber: 1,
                stageName: 'Competitive Written Examination (3 Papers)',
                mode: 'Objective (CBT/OMR)',
                totalMarks: 400,
                durationMinutes: 420,
                description: 'Paper 1 (150 Marks General Paper) + Paper 2 (150 Marks Subject Paper) + Paper 3 (100 Marks Descriptive Kannada Language Proficiency Test).',
                papers: [
                    {
                        paperName: 'Paper 1: General Studies & Educational Psychology',
                        questionsCount: 150,
                        marks: 150,
                        durationMinutes: 150,
                        negativeMarking: 'None',
                        subjects: ['General Knowledge & Current Affairs (25M)', 'General Kannada (25M)', 'General English (25M)', 'Educational Psychology & Child Rights (50M)', 'Computer Literacy & Value Education (25M)']
                    },
                    {
                        paperName: 'Paper 2: Subject Content & Pedagogy',
                        questionsCount: 150,
                        marks: 150,
                        durationMinutes: 150,
                        negativeMarking: 'None',
                        subjects: ['Selected Subject Stream: Mathematics & Science OR Social Studies (History, Geography, Polity, Economics) & Subject Pedagogy']
                    },
                    {
                        paperName: 'Paper 3: Descriptive Kannada Language Proficiency',
                        marks: 100,
                        durationMinutes: 120,
                        negativeMarking: 'None',
                        subjects: ['Descriptive Kannada Essay, Translation, Letter Writing & Grammar (Qualifying min 50 marks)']
                    }
                ]
            }
        ],
        syllabusFocus: [
            { pillarName: 'Educational Psychology & Pedagogy', weightage: 'Very High', topics: ['Piaget & Vygotsky Theories', 'Inclusive Education', 'Child Rights & POCSO', 'Teaching Models', 'CCE Evaluation'] },
            { pillarName: 'Subject Content Domain', weightage: 'Very High', topics: ['Class 6-10 Karnataka State Board & NCERT Textbooks', 'Methodology of Subject Instruction'] },
            { pillarName: 'General Kannada & Computer Literacy', weightage: 'High', topics: ['Kannada Grammar', 'MS Office', 'Internet Basics'] }
        ],
        faqs: [
            { question: 'Is KARTET or CTET required for GPSTR?', answer: 'Yes. Candidates must have qualified KARTET (Paper 2) or CTET (Paper 2) in the relevant stream to be eligible to apply for GPSTR recruitment.' }
        ]
    }
};

export function getExamInfo(examId: string): ExamInfo | undefined {
    return EXAM_DETAILS[examId];
}
