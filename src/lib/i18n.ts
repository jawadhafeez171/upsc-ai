import { Language } from '@/types';

type Translations = Record<string, Record<Language, string>>;

export const translations: Translations = {
    // --- Existing test/profile strings ---
    home: { en: 'Home', hi: 'होम', kn: 'ಮನೆ' },
    exams: { en: 'Exams', hi: 'परीक्षाएं', kn: 'ಪರೀಕ್ಷೆಗಳು' },
    currentAffairs: { en: 'Current Affairs', hi: 'समसामयिक', kn: 'ಪ್ರಚಲಿತ ಘಟನೆ' },
    leaderboard: { en: 'Leaderboard', hi: 'लीडरबोर्ड', kn: 'ಲೀಡರ್‌ಬೋರ್ಡ್' },
    dashboard: { en: 'Dashboard', hi: 'डैशबोर्ड', kn: 'ಡ್ಯಾಶ್‌ಬೋರ್ಡ್' },
    login: { en: 'Login', hi: 'लॉगिन', kn: 'ಲಾಗಿನ್' },
    register: { en: 'Register', hi: 'रजिस्टर', kn: 'ನೋಂದಣಿ' },
    logout: { en: 'Logout', hi: 'लॉगआउट', kn: 'ಲಾಗ್‌ಔಟ್' },
    startTest: { en: 'Start Test', hi: 'परीक्षा शुरू करें', kn: 'ಪರೀಕ್ಷೆ ಪ್ರಾರಂಭಿಸಿ' },
    submitTest: { en: 'Submit Test', hi: 'परीक्षा जमा करें', kn: 'ಪರೀಕ್ಷೆ ಸಲ್ಲಿಸಿ' },
    nextQuestion: { en: 'Next', hi: 'अगला', kn: 'ಮುಂದೆ' },
    prevQuestion: { en: 'Previous', hi: 'पिछला', kn: 'ಹಿಂದೆ' },
    markReview: { en: 'Mark for Review', hi: 'समीक्षा चिह्न', kn: 'ಪರಿಶೀಲನೆ ಗುರುತು' },
    timeLeft: { en: 'Time Left', hi: 'बचा समय', kn: 'ಉಳಿದ ಸಮಯ' },
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
    skipped: { en: 'Skipped', hi: 'छोड़े', kn: 'ಬಿಟ್ಟಿದ್ದು' },
    reviewAnswers: { en: 'Review Answers', hi: 'उत्तर समीक्षा', kn: 'ಉತ್ತರ ಪರಿಶೀಲಿಸಿ' },
    retryWrong: { en: 'Retry Wrong', hi: 'गलत दोबारा करें', kn: 'ತಪ್ಪು ಮರುಪ್ರಯತ್ನ' },
    explanation: { en: 'Explanation', hi: 'व्याख्या', kn: 'ವಿವರಣೆ' },
    xpEarned: { en: 'XP Earned', hi: 'XP अर्जित', kn: 'XP ಗಳಿಸಿದ' },
    dailyStreak: { en: 'Day Streak', hi: 'दिन स्ट्रीक', kn: 'ದಿನ ಸ್ಟ್ರೀಕ್' },
    level: { en: 'Level', hi: 'स्तर', kn: 'ಹಂತ' },
    badges: { en: 'Badges', hi: 'बैज', kn: 'ಬ್ಯಾಡ್ಜ್' },

    // --- Homepage Translations ---
    heroBadge: { en: 'Free Mock Tests · English & Kannada', hi: 'मुफ्त मॉक टेस्ट · अंग्रेजी और कन्नड़', kn: 'ಉಚಿತ ಅಣಕು ಪರೀಕ್ಷೆಗಳು · ಇಂಗ್ಲೀಷ್ & ಕನ್ನಡ' },
    heroTitlePart1: { en: 'Crack Your', hi: 'क्रैक करें अपनी', kn: 'ನಿಮ್ಮ ಕನಸಿನ' },
    heroTitlePart2: { en: 'Dream Exam', hi: 'ड्रीम परीक्षा', kn: 'ಪರೀಕ್ಷೆಯನ್ನು ಭೇದಿಸಿ' },
    heroTitlePart3: { en: 'with AI-Powered Practice', hi: 'AI-संचालित अभ्यास के साथ', kn: 'AI-ಚಾಲಿತ ಅಭ್ಯಾಸದೊಂದಿಗೆ' },
    heroDesc: { en: 'Comprehensive mock tests for UPSC, Karnataka state exams. Subject-wise practice, full mocks, gamified learning — in English & Kannada.', hi: 'यूपीएससी, कर्नाटक राज्य परीक्षाओं के लिए व्यापक मॉक टेस्ट। विषयवार अभ्यास, पूर्ण मॉक, गेमीफाइड लर्निंग — अंग्रेजी और कन्नड़ में।', kn: 'ಯುಪಿಎಸ್‌ಸಿ, ಕರ್ನಾಟಕ ರಾಜ್ಯ ಪರೀಕ್ಷೆಗಳಿಗೆ ಸಮಗ್ರ ಅಣಕು ಪರೀಕ್ಷೆಗಳು. ವಿಷಯವಾರು ಅಭ್ಯಾಸ, ಪೂರ್ಣ ಮಾದರಿ, ಗೇಮಿಫೈಡ್ ಕಲಿಕೆ — ಇಂಗ್ಲಿಷ್ ಮತ್ತು ಕನ್ನಡದಲ್ಲಿ.' },
    browseExams: { en: 'Browse Exams', hi: 'परीक्षाएं ब्राउज़ करें', kn: 'ಪರೀಕ್ಷೆಗಳನ್ನು ಬ್ರೌಸ್ ಮಾಡಿ' },
    startFree: { en: 'Start Free', hi: 'मुफ़्त शुरू करें', kn: 'ಉಚಿತವಾಗಿ ಪ್ರಾರಂಭಿಸಿ' },
    
    // Stats
    examsCovered: { en: 'Exams Covered', hi: 'कवर की गई परीक्षाएं', kn: 'ಪರೀಕ್ಷೆಗಳು' },
    totalQuestions: { en: 'Questions', hi: 'प्रश्न', kn: 'ಪ್ರಶ್ನೆಗಳು' },
    languages: { en: 'Languages', hi: 'भाषाएँ', kn: 'ಭಾಷೆಗಳು' },
    freeAccess: { en: 'Free Access', hi: 'मुफ़्त पहुँच', kn: 'ಉಚಿತ ಪ್ರವೇಶ' },

    // Features section
    featuredExams: { en: 'Featured Exams', hi: 'विशेष रुप से प्रदर्शित परीक्षाएं', kn: 'ವೈಶಿಷ್ಟ್ಯಪೂರ್ಣ ಪರೀಕ್ಷೆಗಳು' },
    featuredDesc: { en: 'UPSC and Karnataka state exams — practice in your language', hi: 'यूपीएससी और कर्नाटक राज्य परीक्षाएं — अपनी भाषा में अभ्यास करें', kn: 'ಯುಪಿಎಸ್‌ಸಿ ಮತ್ತು ಕರ್ನಾಟಕ ರಾಜ್ಯ ಪರೀಕ್ಷೆಗಳು — ನಿಮ್ಮ ಭಾಷೆಯಲ್ಲಿ ಅಭ್ಯಾಸ ಮಾಡಿ' },
    whyUpsc: { en: 'Why UPSC AI?', hi: 'UPSC AI क्यों?', kn: 'UPSC AI ಏಕೆ?' },
    subjectWisePractice: { en: 'Subject-Wise Practice', hi: 'विषयवार अभ्यास', kn: 'ವಿಷಯವಾರು ಅಭ್ಯಾಸ' },
    subjectWiseDesc: { en: 'Focus on weak areas. Filter by subject and difficulty — Easy, Medium, Hard.', hi: 'कमजोर क्षेत्रों पर ध्यान दें। विषय और कठिनाई के अनुसार फ़िल्टर करें - सरल, मध्यम, कठिन।', kn: 'ದುರ್ಬಲ ಪ್ರದೇಶಗಳ ಮೇಲೆ ಕೇಂದ್ರೀಕರಿಸಿ. ವಿಷಯ ಮತ್ತು ಕಷ್ಟಕ್ಕೆ ಅನುಗುಣವಾಗಿ ಫಿಲ್ಟರ್ ಮಾಡಿ — ಸುಲಭ, ಮಧ್ಯಮ, ಕಷ್ಟ.' },
    fullMockDesc: { en: 'Simulated exams with realistic question distribution and negative marking.', hi: 'यथार्थवादी प्रश्न वितरण और नकारात्मक अंकन के साथ नकली परीक्षाएं।', kn: 'ನೈಜ ಪ್ರಶ್ನೆ ವಿತರಣೆ ಮತ್ತು ನಕಾರಾತ್ಮಕ ಅಂಕಗಳೊಂದಿಗೆ ಸಿಮ್ಯುಲೇಟೆಡ್ ಪರೀಕ್ಷೆಗಳು.' },
    gamifiedLearning: { en: 'Gamified Learning', hi: 'गेमिफाइड लर्निंग', kn: 'ಗೇಮಿಫೈಡ್ ಕಲಿಕೆ' },
    gamifiedDesc: { en: 'Earn XP, level up, maintain streaks, unlock badges.', hi: 'XP अर्जित करें, स्तर बढ़ाएं, स्ट्रीक्स बनाए रखें, बैज अनलॉक करें।', kn: 'XP ಗಳಿಸಿ, ಲೆವೆಲ್ ಅಪ್ ಮಾಡಿ, ಸ್ಟ್ರೀಕ್ಸ್ ಕಾಯ್ದುಕೊಳ್ಳಿ, ಬ್ಯಾಡ್ಜ್‌ಗಳನ್ನು ಅನ್ಲಾಕ್ ಮಾಡಿ.' },
    multilingual: { en: 'Multilingual', hi: 'बहुभाषी', kn: 'ಬಹುಭಾಷಾ' },
    multilingualDesc: { en: 'Tests and solutions in English, Hindi, and Kannada.', hi: 'अंग्रेजी, हिंदी और कन्नड़ में परीक्षण और समाधान।', kn: 'ಇಂಗ್ಲಿಷ್, ಹಿಂದಿ ಮತ್ತು ಕನ್ನಡದಲ್ಲಿ ಪರೀಕ್ಷೆಗಳು ಮತ್ತು ಪರಿಹಾರಗಳು.' },
    detailedAnalytics: { en: 'Detailed Analytics', hi: 'विस्तृत एनालिटिक्स', kn: 'ವಿವರವಾದ ವಿಶ್ಲೇಷಣೆ' },
    analyticsDesc: { en: 'Subject-wise accuracy, difficulty-wise breakdown, score trends.', hi: 'विषय-वार सटीकता, कठिनाई-वार टूटना, स्कोर रुझान।', kn: 'ವಿಷಯ-ವಾರು ನಿಖರತೆ, ಕಷ್ಟದ-ವಾರು ವಿಭಜನೆ, ಅಂಕಗಳ ಪ್ರವೃತ್ತಿಗಳು.' },
    fullExplanations: { en: 'Full Explanations', hi: 'पूर्ण स्पष्टीकरण', kn: 'ಪೂರ್ಣ ವಿವರಣೆಗಳು' },
    explanationsDesc: { en: 'Every question has a detailed explanation. Review wrong answers instantly.', hi: 'हर प्रश्न का विस्तृत स्पष्टीकरण है। तुरंत गलत उत्तरों की समीक्षा करें।', kn: 'ಪ್ರತಿ ಪ್ರಶ್ನೆಗೆ ವಿವರವಾದ ವಿವರಣೆಯಿದೆ. ತಪ್ಪಾದ ಉತ್ತರಗಳನ್ನು ತಕ್ಷಣ ಪರಿಶೀಲಿಸಿ.' },

    // CTA
    readyStart: { en: 'Ready to start your journey?', hi: 'अपनी यात्रा शुरू करने के लिए तैयार हैं?', kn: 'ನಿಮ್ಮ ಪ್ರಯಾಣವನ್ನು ಪ್ರಾರಂಭಿಸಲು ಸಿದ್ಧರಿದ್ದೀರಾ?' },
    readyDesc: { en: 'Join thousands of aspirants preparing smarter with UPSC AI.', hi: 'UPSC AI के साथ अधिक स्मार्ट तैयारी करने वाले हजारों उम्मीदवारों में शामिल हों।', kn: 'UPSC AI ನೊಂದಿಗೆ ಚುರುಕಾಗಿ ತಯಾರಿ ನಡೆಸುತ್ತಿರುವ ಸಾವಿರಾರು ಆಕಾಂಕ್ಷಿಗಳನ್ನು ಸೇರಿ.' },
    createFreeAccount: { en: 'Create Free Account', hi: 'मुफ़्त खाता बनाएँ', kn: 'ಉಚಿತ ಖಾತೆಯನ್ನು ರಚಿಸಿ' },
};

export function t(key: string, lang: Language): string {
    const entry = translations[key];
    if (!entry) return key;
    return entry[lang] ?? entry['en'];
}
