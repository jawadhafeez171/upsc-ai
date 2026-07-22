export type Difficulty = 'easy' | 'medium' | 'hard';
export type Language = 'en' | 'hi' | 'kn';
export type TestMode = 'subject' | 'full';
export type ExamCategory = 'upsc' | 'karnataka';

export interface Option {
    id: string;
    text: string;
    text_kn?: string;
    text_hi?: string;
}

export interface Question {
    id: string;
    exam_id: string;
    subject: string;
    difficulty: Difficulty;
    text: string;
    text_kn?: string;
    text_hi?: string;
    options: Option[];
    correct: string; // option id
    explanation: string;
    explanation_kn?: string;
    explanation_hi?: string;
}

export interface Exam {
    id: string;
    name: string;
    name_kn?: string;
    category: ExamCategory;
    description: string;
    description_kn?: string;
    languages: Language[];
    negative_marking: number; // 0 = none, 0.33 = 1/3
    subjects: string[];
    icon: string;
    color: string;
}

export interface TestConfig {
    exam_id: string;
    mode: TestMode;
    subject?: string;
    difficulty: Difficulty | 'mixed';
    question_count: number;
    language: Language;
    year?: number | 'all';
    paper?: number | 'all';
}

export interface TestAnswer {
    question_id: string;
    selected?: string;
    is_correct?: boolean;
    marked_for_review: boolean;
    time_spent: number; // seconds
}

export interface TestSession {
    id: string;
    user_id: string;
    exam_id: string;
    config: TestConfig;
    questions: Question[];
    answers: Record<string, TestAnswer>;
    started_at: string;
    finished_at?: string;
    score?: number;
    total_marks?: number;
    status: 'active' | 'completed';
}

export interface Badge {
    id: string;
    type: string;
    label: string;
    description: string;
    icon: string;
    earned_at?: string;
}

export type Level = 'Aspirant' | 'Scholar' | 'Expert' | 'Legend';

export interface User {
    id: string;
    name: string;
    email: string;
    avatar?: string;
    xp: number;
    level: Level;
    streak: number;
    last_active: string;
    badges: Badge[];
    exam_preference?: string;
    language: Language;
}

export interface CurrentArticle {
    id: string;
    date: string;
    category: string;
    title_en: string;
    title_hi: string;
    title_kn: string;
    body_en: string;
    body_hi: string;
    body_kn: string;
}

export interface LeaderboardEntry {
    rank: number;
    user_id: string;
    name: string;
    avatar?: string;
    xp: number;
    level: Level;
    tests_taken: number;
}
