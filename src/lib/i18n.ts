import { Language } from '@/types';

type Translations = Record<string, Record<Language, string>>;

export const translations: Translations = {
    // --- Existing test/profile strings ---
    home: { en: 'Home', hi: 'होम', kn: 'ಮನೆ' },
    exams: { en: 'Exams', hi: 'परीक्षाएं', kn: 'ಪರೀಕ್ಷೆಗಳು' },
    currentAffairs: { en: 'Current Affairs', hi: 'समसामयिक', kn: 'ಪ್ರಚಲಿತ ಘಟನೆ' },
    leaderboard: { en: 'Leaderboard', hi: 'लीडरबोर्ड', kn: 'लीडरबोर्ड' },
    dashboard: { en: 'Dashboard', hi: 'डैशबोर्ड', kn: 'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್' },
    login: { en: 'Login', hi: 'लॉगिन', kn: 'ಲಾಗಿನ್' },
    register: { en: 'Register', hi: 'रजिस्टर', kn: 'ನೋಂದಣಿ' },
    logout: { en: 'Logout', hi: 'लॉगआउट', kn: 'ಲಾಗ್‌ಔಟ್' },
    startTest: { en: 'Start Test', hi: 'परीक्षा शुरू करें', kn: 'ಪರೀಕ್ಷೆ ಪ್ರಾರಂಭಿಸಿ' },
    submitTest: { en: 'Submit Test', hi: 'परीक्षा जमा करें', kn: 'ಪರೀಕ್ಷೆ ಸಲ್ಲಿಸಿ' },
    nextQuestion: { en: 'Next', hi: 'अगला', kn: 'ಮುಂದೆ' },
    prevQuestion: { en: 'Previous', hi: 'पिछला', kn: 'ಹಿಂದೆ' },
    markReview: { en: 'Mark for Review', hi: 'समीक्षा के लिए चिह्नित करें', kn: 'ಪರಿಶೀಲನೆಗಾಗಿ ಗುರುತಿಸಿ' },
    timeLeft: { en: 'Time Left', hi: 'शेष समय', kn: 'ಉಳಿದ ಸಮಯ' },
    question: { en: 'Question', hi: 'प्रश्न', kn: 'ಪ್ರಶ್ನೆ' },
    subjectWise: { en: 'Subject-wise', hi: 'विषयवार', kn: 'ವಿಷಯವಾರು' },
    fullMock: { en: 'Full Mock Test', hi: 'पूर्ण मॉक', kn: 'ಪೂರ್ಣ ಮಾದರಿ' },
    easy: { en: 'Easy', hi: 'सरल', kn: 'ಸುಲಭ' },
    medium: { en: 'Medium', hi: 'मध्यम', kn: 'ಮಧ್ಯಮ' },
    hard: { en: 'Hard', hi: 'कठिन', kn: 'ಕಷ್ಟ' },
    mixed: { en: 'Mixed', hi: 'मिश्रित', kn: 'ಮಿಶ್ರಿತ' },
    yourScore: { en: 'Your Score', hi: 'आपका स्कोर', kn: 'ನಿಮ್ಮ ಸ್ಕೋರ್' },
    correct: { en: 'Correct', hi: 'सही', kn: 'ಸರಿ' },
    incorrect: { en: 'Incorrect', hi: 'गलत', kn: 'ತಪ್ಪು' },
    skipped: { en: 'Skipped', hi: 'छोड़े गए', kn: 'ಬಿಟ್ಟಿದ್ದು' },
    reviewAnswers: { en: 'Review Answers', hi: 'उत्तरों की समीक्षा करें', kn: 'ಉತ್ತರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ' },
    retryWrong: { en: 'Retry Wrong', hi: 'गलत उत्तरों का पुनः प्रयास करें', kn: 'ತಪ್ಪು ಉತ್ತರಗಳನ್ನು ಮರುಪ್ರಯತ್ನಿಸಿ' },
    explanation: { en: 'Explanation', hi: 'व्याख्या', kn: 'ವಿವರಣೆ' },
    xpEarned: { en: 'XP Earned', hi: 'XP अर्जित', kn: 'XP ಗಳಿಸಿದ' },
    dailyStreak: { en: 'Day Streak', hi: 'दिन स्ट्रीक', kn: 'ದಿನ ಸ್ಟ್ರೀಕ್' },
    level: { en: 'Level', hi: 'स्तर', kn: 'ಹಂತ' },
    badges: { en: 'Badges', hi: 'बैज', kn: 'ಬ್ಯಾಡ್ಜ್' },

    // --- Homepage Translations ---
    heroBadge: { en: 'Mock Tests · English, Hindi & Kannada', hi: 'मॉक टेस्ट · अंग्रेजी, हिंदी और कन्नड़', kn: 'ಅಣಕು ಪರೀಕ್ಷೆಗಳು · ಇಂಗ್ಲೀಷ್, ಹಿಂದಿ & ಕನ್ನಡ' },
    heroTitlePart1: { en: 'Mock Tests for', hi: 'मॉक टेस्ट', kn: 'ಅಣಕು ಪರೀಕ್ಷೆಗಳು' },
    heroTitlePart2: { en: 'UPSC & KPSC', hi: 'UPSC और KPSC', kn: 'UPSC ಮತ್ತು KPSC' },
    heroTitlePart3: { en: 'Exam Preparation', hi: 'परीक्षा की तैयारी के लिए', kn: 'ಪರೀಕ್ಷೆಯ ತಯಾರಿಗಾಗಿ' },
    heroDesc: { en: 'Practice with subject-wise mock tests, track your scores, and get detailed explanations — in English, Hindi & Kannada.', hi: 'विषयवार मॉक टेस्ट से अभ्यास करें, अपने स्कोर ट्रैक करें, और विस्तृत स्पष्टीकरण पाएं — अंग्रेजी, हिंदी और कन्नड़ में।', kn: 'ವಿಷಯವಾರು ಅಣಕು ಪರೀಕ್ಷೆಗಳೊಂದಿಗೆ ಅಭ್ಯಾಸ ಮಾಡಿ, ನಿಮ್ಮ ಅಂಕಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ, ಮತ್ತು ವಿವರವಾದ ವಿವರಣೆಗಳನ್ನು ಪಡೆಯಿರಿ — ಇಂಗ್ಲಿಷ್, ಹಿಂದಿ ಮತ್ತು ಕನ್ನಡದಲ್ಲಿ.' },
    browseExams: { en: 'Browse Exams', hi: 'परीक्षाएं ब्राउज़ करें', kn: 'ಪರೀಕ್ಷೆಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ' },
    startFree: { en: 'Get Started', hi: 'शुरू करें', kn: 'ಪ್ರಾರಂಭಿಸಿ' },
    
    // Stats
    examsCovered: { en: 'Exams Covered', hi: 'कवर की गई परीक्षाएं', kn: 'ಪರೀಕ್ಷೆಗಳು' },
    totalQuestions: { en: 'Questions', hi: 'प्रश्न', kn: 'ಪ್ರಶ್ನೆಗಳು' },
    languages: { en: 'Languages', hi: 'भाषाएँ', kn: 'ಭಾಷೆಗಳು' },
    freeAccess: { en: 'Aspirants Served', hi: 'उम्मीदवार', kn: 'ಆಕಾಂಕ್ಷಿಗಳು' },

    // Features section
    featuredExams: { en: 'Featured Exams', hi: 'विशेष रुप से प्रदर्शित परीक्षाएं', kn: 'ವೈಶಿಷ್ಟ್ಯಪೂರ್ಣ ಪರೀಕ್ಷೆಗಳು' },
    featuredDesc: { en: 'UPSC and Karnataka state exams — practice in your language', hi: 'यूपीएससी और कर्नाटक राज्य परीक्षाएं — अपनी भाषा में अभ्यास करें', kn: 'ಯುಪಿಎಸ್‌ಸಿ ಮತ್ತು ಕರ್ನಾಟಕ ರಾಜ್ಯ ಪರೀಕ್ಷೆಗಳು — ನಿಮ್ಮ ಭಾಷೆಯಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿ' },
    whyUpsc: { en: 'Why MockIQ?', hi: 'MockIQ क्यों?', kn: 'MockIQ ಏಕೆ?' },
    subjectWisePractice: { en: 'Subject-Wise Practice', hi: 'विषयवार अभ्यास', kn: 'ವಿಷಯವಾರು ಅಭ್ಯಾಸ' },
    subjectWiseDesc: { en: 'Focus on weak areas. Filter by subject and difficulty — Easy, Medium, Hard.', hi: 'कमजोर क्षेत्रों पर ध्यान दें। विषय और कठिनाई के आधार पर फ़िल्टर करें - सरल, मध्यम, कठिन।', kn: 'ದುರ್ಬಲ ಪ್ರದೇಶಗಳ ಮೇಲೆ ಗಮನಹರಿಸಿ. ವಿಷಯ ಮತ್ತು ಕಷ್ಟದ ಆಧಾರದ ಮೇಲೆ ಫಿಲ್ಟರ್ ಮಾಡಿ — ಸುಲಭ, ಮಧ್ಯಮ, ಕಷ್ಟ.' },
    fullMockDesc: { en: 'Simulated exams with realistic question distribution and negative marking.', hi: 'यथार्थवादी प्रश्न वितरण और नकारात्मक अंकन के साथ नकली परीक्षाएं।', kn: 'ನೈಜ ಪ್ರಶ್ನೆ ವಿತರಣೆ ಮತ್ತು ನಕಾರಾತ್ಮಕ ಅಂಕಗಳೊಂದಿಗೆ ಅಣಕು ಪರೀಕ್ಷೆಗಳು.' },
    gamifiedLearning: { en: 'Gamified Learning', hi: 'गेमिफाइड लर्निंग', kn: 'ಕ್ರಿಯಾತ್ಮಕ ಕಲಿಕೆ' },
    gamifiedDesc: { en: 'Earn XP, level up, maintain streaks, unlock badges.', hi: 'XP अर्जित करें, स्तर बढ़ाएं, स्ट्रीक्स बनाए रखें, बैज अनलॉक करें।', kn: 'XP ಗಳಿಸಿ, ಲೆವೆಲ್ ಅಪ್ ಮಾಡಿ, ಸ್ಟ್ರೀಕ್ಸ್ ಕಾಯ್ದುಕೊಳ್ಳಿ, ಬ್ಯಾಡ್ಜ್‌ಗಳನ್ನು ಪಡೆಯಿರಿ.' },
    multilingual: { en: 'Multilingual', hi: 'बहुभाषी', kn: 'ಬಹುಭಾಷಾ' },
    multilingualDesc: { en: 'Tests and solutions in English, Hindi, and Kannada.', hi: 'अंग्रेजी, हिंदी और कन्नड़ में परीक्षण और समाधान।', kn: 'ಇಂಗ್ಲಿಷ್, ಹಿಂದಿ ಮತ್ತು ಕನ್ನಡದಲ್ಲಿ ಪರೀಕ್ಷೆಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು.' },
    detailedAnalytics: { en: 'Detailed Analytics', hi: 'विस्तृत एनालिटिक्स', kn: 'ವಿವರವಾದ ವಿಶ್ಲೇಷಣೆ' },
    analyticsDesc: { en: 'Subject-wise accuracy, difficulty-wise breakdown, score trends.', hi: 'विषय-वार सटीकता, कठिनाई-वार टूटना, स्कोर रुझान।', kn: 'ವಿಷಯ-ವಾರು ನಿಖರತೆ, ಕಷ್ಟದ-ವಾರು ವಿಭಜನೆ, ಅಂಕಗಳ ಪ್ರವೃತ್ತಿಗಳು.' },
    fullExplanations: { en: 'Full Explanations', hi: 'पूर्ण स्पष्टीकरण', kn: 'ಪೂರ್ಣ ವಿವರणेಗಳು' },
    explanationsDesc: { en: 'Every question has a detailed explanation. Review wrong answers instantly.', hi: 'हर प्रश्न का विस्तृत स्पष्टीकरण है। तुरंत गलत उत्तरों की समीक्षा करें।', kn: 'ಪ್ರತಿ ಪ್ರಶ್ನೆಗೆ ವಿವರವಾದ ವಿವರಣೆಯಿದೆ. ತಪ್ಪಾದ ಉತ್ತರಗಳನ್ನು ತಕ್ಷಣ ಪರಿಶೀಲಿಸಿ.' },

    // CTA
    readyStart: { en: 'Ready to start your journey?', hi: 'अपनी यात्रा शुरू करने के लिए तैयार हैं?', kn: 'ನಿಮ್ಮ ಪ್ರಯಾಣವನ್ನು ಪ್ರಾರಂಭಿಸಲು ಸಿದ್ಧರಿದ್ದೀರಾ?' },
    readyDesc: { en: 'Join thousands of aspirants preparing smarter with MockIQ.', hi: 'MockIQ के साथ अधिक स्मार्ट तैयारी करने वाले हजारों उम्मीदवारों में शामिल हों।', kn: 'MockIQ ನೊಂದಿಗೆ ಚುರುಕಾಗಿ ತಯಾರಿ ನಡೆಸುತ್ತಿರುವ ಸಾವಿರಾರು ಆಕಾಂಕ್ಷಿಗಳನ್ನು ಸೇರಿ.' },
    createFreeAccount: { en: 'Create Account', hi: 'खाता बनाएँ', kn: 'ಖಾತೆಯನ್ನು ರಚಿಸಿ' },
};

export function t(key: string, lang: Language): string {
    const entry = translations[key];
    if (!entry) return key;
    return entry[lang] ?? entry['en'];
}
