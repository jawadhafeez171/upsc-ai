import { Language } from '@/types';

type Translations = Record<string, Record<Language, string>>;

export const translations: Translations = {
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
};

export function t(key: string, lang: Language): string {
    const entry = translations[key];
    if (!entry) return key;
    return entry[lang] ?? entry['en'];
}
