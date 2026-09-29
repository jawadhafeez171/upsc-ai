'use client';
import { use, useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { Loader2 } from 'lucide-react';
import { Question } from '@/types';
import { QUESTIONS } from '@/lib/mockData';
import { isValidImageUrl } from '@/lib/imageUtils';
import '@/app/test/cbt-terminal.css';
import ExamHeader from '@/components/test/ExamHeader';
import ExamSubHeader from '@/components/test/ExamSubHeader';
import QuickNavigator, { QuestionState } from '@/components/test/QuickNavigator';
import CbtQuestionCard from '@/components/test/CbtQuestionCard';
import ExamBottomNav from '@/components/test/ExamBottomNav';
import CandidateInfoCard from '@/components/test/CandidateInfoCard';
import QuestionPaletteSummary from '@/components/test/QuestionPaletteSummary';
import QuestionPaletteGrid from '@/components/test/QuestionPaletteGrid';
import ExamToolsCard from '@/components/test/ExamToolsCard';
import { InstructionsModal, FullPaperModal, SubmitExamModal, ReportDiscrepancyModal } from '@/components/test/ExamModals';

const CSAT_EN_PATTERNS = [
    /With reference to the above passage/i,
    /Based on the above passage/i,
    /On the basis of the above passage/i,
    /Which one of the following/i,
    /Which of the following/i,
    /In the context of the above passage/i,
    /In the context of India/i,
    /According to the above passage/i,
    /According to the passage/i,
    /The author's central focus/i,
    /What is the most logical/i
];

const CSAT_HI_PATTERNS = [
    /उपर्युक्त (?:परिच्छेद|गद्यांश)/,
    /इस (?:परिच्छेद|गद्यांश) से/,
    /निम्नलिखित में से कौन-सा|निम्नलिखित में से कौन सा|निम्नलिखित में से कौन से/,
    /निम्न कथनों में से/,
    /उपर्युक्त में से कौन-सा|उपर्युक्त में से कौन सा|उपर्युक्त में से कौन से/,
    /भारत के संदर्भ में/,
    /लेखक के अनुसार/,
    /इस परिच्छेद का मुख्य/,
    /परिच्छेद द्वारा संप्रेषित/
];

function processCsatQuestion(q: any): any {
    if (q.passage_english && q.passage_english.trim()) {
        return q;
    }
    const qe = q.question_english || '';
    const qh = q.question_hindi || '';

    if (qe.includes('Passage') || qe.includes('Directions')) {
        const linesE = qe.trim().split('\n');
        let splitEIdx = -1;
        for (let i = 0; i < linesE.length; i++) {
            if (CSAT_EN_PATTERNS.some((p) => p.test(linesE[i]))) {
                splitEIdx = i;
                break;
            }
        }

        const linesH = qh.trim().split('\n');
        let splitHIdx = -1;
        for (let i = 0; i < linesH.length; i++) {
            if (CSAT_HI_PATTERNS.some((p) => p.test(linesH[i]))) {
                splitHIdx = i;
                break;
            }
        }

        if (splitEIdx !== -1) {
            const passE = linesE.slice(0, splitEIdx).join('\n').trim();
            const stmtE = linesE.slice(splitEIdx).join('\n').trim();
            const passH = splitHIdx !== -1 ? linesH.slice(0, splitHIdx).join('\n').trim() : '';
            const stmtH = splitHIdx !== -1 ? linesH.slice(splitHIdx).join('\n').trim() : qh;

            return {
                ...q,
                passage_english: passE,
                question_english: stmtE,
                passage_hindi: passH,
                question_hindi: stmtH
            };
        }
    }
    return q;
}

function cleanPassageKey(rawPassage: string): string {
    return rawPassage
        .replace(/^Directions[^\n]*\n?/im, '')
        .replace(/^Read the following[^\n]*\n?/im, '')
        .replace(/^निम्नलिखित प्रश्नांश[^\n]*\n?/im, '')
        .replace(/^नीचे दिए गए[^\n]*\n?/im, '')
        .trim()
        .slice(0, 80);
}

// Helper functions for question grouping and shuffle preservation
function assignQuestionGroups(rawQuestions: any[]): any[] {
    const passageMap = new Map<string, { groupId: string; count: number; firstQNum: number }>();

    for (const q of rawQuestions) {
        const passage = (q.passage_english || q.passage_kannada || q.passage_hindi || '').trim();
        if (passage.length > 10) {
            const cleanKey = cleanPassageKey(passage);
            const prefix = q.paper_code || q.exam_id || 'q';
            const key = `${prefix}_${cleanKey}`;
            if (!passageMap.has(key)) {
                passageMap.set(key, {
                    groupId: `grp_${prefix}_${q.question_number || Math.random().toString(36).substring(2, 6)}`,
                    count: 0,
                    firstQNum: q.question_number || 0
                });
            }
            passageMap.get(key)!.count++;
        }
    }

    return rawQuestions.map((q) => {
        const passage = (q.passage_english || q.passage_kannada || q.passage_hindi || '').trim();
        if (passage.length > 10) {
            const cleanKey = cleanPassageKey(passage);
            const prefix = q.paper_code || q.exam_id || 'q';
            const key = `${prefix}_${cleanKey}`;
            const grp = passageMap.get(key);
            if (grp && grp.count > 1) {
                return {
                    ...q,
                    group_id: grp.groupId,
                    group_label: `Linked Questions (${grp.count} Qs)`
                };
            }
        }
        return q;
    });
}

function groupPreservingShuffle(questions: any[]): any[] {
    const blocks: any[][] = [];
    const groupMap = new Map<string, any[]>();

    for (const q of questions) {
        if (q.group_id) {
            if (!groupMap.has(q.group_id)) {
                const block: any[] = [];
                groupMap.set(q.group_id, block);
                blocks.push(block);
            }
            groupMap.get(q.group_id)!.push(q);
        } else {
            blocks.push([q]);
        }
    }

    for (const block of blocks) {
        if (block.length > 1) {
            block.sort((a, b) => (a.question_number || 0) - (b.question_number || 0));
        }
    }

    const shuffledBlocks = [...blocks].sort(() => Math.random() - 0.5);
    return shuffledBlocks.flat();
}

function safeSliceQuestions(questions: any[], maxCount: number): any[] {
    if (!maxCount || questions.length <= maxCount) return questions;

    let sliced = questions.slice(0, maxCount);
    const lastQ = sliced[sliced.length - 1];

    if (lastQ?.group_id) {
        const remainingInGroup = questions.slice(maxCount).filter((q) => q.group_id === lastQ.group_id);
        if (remainingInGroup.length > 0) {
            sliced = [...sliced, ...remainingInGroup];
        }
    }
    return sliced;
}

export default function TestPage({ params }: { params: Promise<{ testId: string }> }) {
    const { testId } = use(params);
    const router = useRouter();
    const { activeSession, addCompletedSession, setActiveSession, user } = useAppStore();

    const [questions, setQuestions] = useState<Question[]>([]);
    const [answers, setAnswers] = useState<Record<string, { question_id: string; selected?: string; marked_for_review: boolean; is_correct?: boolean; time_spent: number }>>({});
    const [currentIdx, setCurrentIdx] = useState(0);
    const [timeLeft, setTimeLeft] = useState(0);
    const [loading, setLoading] = useState(true);
    const [activeLang, setActiveLang] = useState<'en' | 'kn' | 'hi'>('en');
    const [previewImage, setPreviewImage] = useState<string | null>(null);

    // CBT Terminal Specific States
    const [visitedQuestions, setVisitedQuestions] = useState<Set<string>>(new Set());
    const [eliminatedOptions, setEliminatedOptions] = useState<Record<string, Record<string, boolean>>>({});
    const [fontSizePercent, setFontSizePercent] = useState<number>(100);
    const [showInstructions, setShowInstructions] = useState(false);
    const [showFullPaper, setShowFullPaper] = useState(false);
    const [showSubmitModal, setShowSubmitModal] = useState(false);
    const [showDiscrepancy, setShowDiscrepancy] = useState(false);

    useEffect(() => {
        if (activeSession?.config?.language) {
            setActiveLang(activeSession.config.language);
        }
    }, [activeSession]);

    useEffect(() => {
        if (!activeSession || activeSession.id !== testId) {
            if (testId === 'demo' || !activeSession) {
                const fallbackSession: any = {
                    id: testId,
                    created_at: new Date().toISOString(),
                    config: {
                        exam_id: 'upsc-cse',
                        mode: 'mock',
                        paper: 1,
                        language: 'en',
                        difficulty: 'mixed',
                        year: 'all',
                        question_count: 25
                    },
                    status: 'in_progress',
                    score: 0,
                    total_marks: 50,
                    questions: []
                };
                setActiveSession(fallbackSession);
                return;
            }
            router.push('/exams');
            return;
        }
        async function fetchQuestions() {
            setLoading(true);
            const { config } = activeSession!;
            let selectedRawQuestions: any[] = [];

            if (config.exam_id === 'upsc-cse') {
                if (config.paper === 2) {
                    let query = supabase.from('csat_pyq').select('*').gt('year', 0);
                    if (config.mode === 'subject' && config.subject) query = query.or(`domain.ilike.%${config.subject}%,sub_topic.ilike.%${config.subject}%`);
                    if (config.difficulty && config.difficulty !== 'mixed') query = query.eq('difficulty', config.difficulty);
                    if (config.year && config.year !== 'all') query = query.eq('year', config.year);
                    const { data, error } = await query;

                    let rawPool: any[] = [];
                    if (!error && data && data.length > 0) {
                        rawPool = data;
                    } else {
                        // Local fallback for CSAT 2020
                        try {
                            const csatModule = await import('@/data/upsc_pyq/csat/2020_csat.json');
                            let filtered = [...(csatModule.default || csatModule)];
                            if (config.mode === 'subject' && config.subject) {
                                const subLower = config.subject.toLowerCase();
                                filtered = filtered.filter((q: any) => 
                                    q.domain?.toLowerCase().includes(subLower) || 
                                    q.sub_topic?.toLowerCase().includes(subLower) ||
                                    q.subject?.toLowerCase().includes(subLower)
                                );
                            }
                            if (config.difficulty && config.difficulty !== 'mixed') {
                                filtered = filtered.filter((q: any) => q.difficulty?.toLowerCase() === config.difficulty);
                            }
                            rawPool = filtered;
                        } catch (err) {
                            console.error('CSAT fallback error:', err);
                        }
                    }

                    // Process CSAT passages and preserve question groups
                    const processed = rawPool.map(processCsatQuestion);
                    const grouped = assignQuestionGroups(processed);

                    if (config.mode === 'yearwise' || (config.year && config.year !== 'all' && config.mode !== 'subject')) {
                        selectedRawQuestions = [...grouped].sort((a, b) => (a.question_number || 0) - (b.question_number || 0));
                    } else {
                        selectedRawQuestions = groupPreservingShuffle(grouped);
                    }

                    if (config.question_count && config.question_count < selectedRawQuestions.length) {
                        selectedRawQuestions = safeSliceQuestions(selectedRawQuestions, config.question_count);
                    }
                } else if (config.paper === 1) {
                    let query = supabase.from('upsc_questions').select('*').gt('year', 0);
                    if (config.mode === 'subject' && config.subject) query = query.ilike('subject', `%${config.subject}%`);
                    if (config.difficulty && config.difficulty !== 'mixed') query = query.eq('difficulty', config.difficulty);
                    if (config.year && config.year !== 'all') query = query.eq('year', config.year);
                    const { data, error } = await query;

                    if (!error && data && data.length > 0) {
                        const shuffled = [...data].sort(() => Math.random() - 0.5);
                        selectedRawQuestions = shuffled.slice(0, Math.min(config.question_count || 25, shuffled.length));
                    }
                } else {
                    let q1 = supabase.from('upsc_questions').select('*').gt('year', 0);
                    let q2 = supabase.from('csat_pyq').select('*').gt('year', 0);
                    if (config.difficulty && config.difficulty !== 'mixed') {
                        q1 = q1.eq('difficulty', config.difficulty);
                        q2 = q2.eq('difficulty', config.difficulty);
                    }
                    if (config.year && config.year !== 'all') {
                        q1 = q1.eq('year', config.year);
                        q2 = q2.eq('year', config.year);
                    }
                    const [{ data: d1 }, { data: d2 }] = await Promise.all([q1, q2]);
                    let csatData = d2;
                    if (!csatData || csatData.length === 0) {
                        try {
                            const csatModule = await import('@/data/upsc_pyq/csat/2020_csat.json');
                            csatData = [...(csatModule.default || csatModule)];
                        } catch (e) {}
                    }
                    const processedCsat = (csatData || []).map(processCsatQuestion);
                    const groupedCsat = assignQuestionGroups(processedCsat);
                    let combined = [...(d1 || []), ...groupedCsat];
                    selectedRawQuestions = groupPreservingShuffle(combined);
                    if (config.question_count && config.question_count < selectedRawQuestions.length) {
                        selectedRawQuestions = safeSliceQuestions(selectedRawQuestions, config.question_count);
                    }
                }
            } else if (config.exam_id === 'ksp-pc') {
                let query = supabase.from('pc_pyq').select('*');
                if (config.paper_code && config.paper_code !== 'all') {
                    query = query.eq('paper_code', config.paper_code);
                }
                if (config.mode === 'subject' && config.subject) {
                    query = query.or(`subject.eq."${config.subject}",subject_kannada.eq."${config.subject}"`);
                }
                if (config.difficulty && config.difficulty !== 'mixed') {
                    query = query.eq('difficulty', config.difficulty);
                }
                const { data } = await query;
                if (data && data.length > 0) {
                    selectedRawQuestions = data;
                } else {
                    // Fallback to local JSON files if offline or network failure
                    try {
                        let localPool: any[] = [];
                        if (!config.paper_code || config.paper_code === 'all' || config.paper_code === 'hk') {
                            const hkMod = await import('@/data/upsc_pyq/pc/hk_dar_pc_2026_sept.json');
                            const hkItems = (hkMod.default || hkMod).map((q: any) => ({
                                ...q,
                                id: `pc-hk-2026-q${q.question_number}`,
                                paper_code: 'hk',
                                exam_id: 'ksp-pc'
                            }));
                            localPool = [...localPool, ...hkItems];
                        }
                        if (!config.paper_code || config.paper_code === 'all' || config.paper_code === 'nhk') {
                            const nhkMod = await import('@/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json');
                            const nhkItems = (nhkMod.default || nhkMod).map((q: any) => ({
                                ...q,
                                id: `pc-nhk-2026-q${q.question_number}`,
                                paper_code: 'nhk',
                                exam_id: 'ksp-pc'
                            }));
                            localPool = [...localPool, ...nhkItems];
                        }
                        if (config.mode === 'subject' && config.subject) {
                            localPool = localPool.filter((q: any) => q.subject === config.subject || q.subject_kannada === config.subject);
                        }
                        if (config.difficulty && config.difficulty !== 'mixed') {
                            localPool = localPool.filter((q: any) => q.difficulty === config.difficulty);
                        }
                        selectedRawQuestions = localPool;
                    } catch (e) {
                        console.error('Local JSON fallback error for ksp-pc:', e);
                    }
                }
            } else if (config.exam_id === 'upsc-capf') {
                let query = supabase.from('capf_pyq').select('*');
                if (config.mode === 'subject' && config.subject) {
                    query = query.or(`subject.eq."${config.subject}",subject_hindi.eq."${config.subject}"`);
                }
                if (config.difficulty && config.difficulty !== 'mixed') query = query.eq('difficulty', config.difficulty);
                if (config.year && config.year !== 'all') query = query.eq('year', config.year);
                const { data } = await query;
                if (data && data.length > 0) {
                    selectedRawQuestions = data;
                } else {
                    // Fallback to local JSON files if offline or network failure
                    try {
                        const capfFiles: Record<string, () => Promise<any>> = {
                            '2014': () => import('@/data/upsc_capf/CAPF_2014_Paper1_GS.json'),
                            '2015': () => import('@/data/upsc_capf/CAPF_2015_Paper1_GS.json'),
                            '2016': () => import('@/data/upsc_capf/CAPF_2016_Paper1_GS.json'),
                            '2017': () => import('@/data/upsc_capf/CAPF_2017_Paper1_GS.json'),
                            '2018': () => import('@/data/upsc_capf/CAPF_2018_Paper1_GS.json'),
                            '2019': () => import('@/data/upsc_capf/CAPF_2019_Paper1_GS.json'),
                            '2020': () => import('@/data/upsc_capf/CAPF_2020_Paper1_GS.json'),
                            '2021': () => import('@/data/upsc_capf/CAPF_2021_Paper1_GS.json'),
                            '2022': () => import('@/data/upsc_capf/CAPF_2022_Paper1_GS.json'),
                            '2023': () => import('@/data/upsc_capf/CAPF_2023_Paper1_GS.json'),
                            '2024': () => import('@/data/upsc_capf/CAPF_2024_Paper1_GS.json'),
                            '2025': () => import('@/data/upsc_capf/CAPF_2025_Paper1_GS.json'),
                            '2026': () => import('@/data/upsc_capf/CAPF_2026_Paper1_GS.json'),
                        };
                        let pool: any[] = [];
                        if (config.year && config.year !== 'all' && capfFiles[String(config.year)]) {
                            const mod = await capfFiles[String(config.year)]();
                            pool = mod.default || mod;
                        } else {
                            const allMods = await Promise.all(Object.values(capfFiles).map(fn => fn()));
                            pool = allMods.flatMap(m => m.default || m);
                        }
                        if (config.mode === 'subject' && config.subject) {
                            pool = pool.filter((q: any) => q.subject === config.subject || q.subject_hindi === config.subject);
                        }
                        if (config.difficulty && config.difficulty !== 'mixed') {
                            pool = pool.filter((q: any) => q.difficulty === config.difficulty);
                        }
                        selectedRawQuestions = pool;
                    } catch (e) {
                        console.error('Local JSON fallback error for upsc-capf:', e);
                    }
                }
            } else if (config.exam_id === 'kpsc-kas') {
                let query = supabase.from('kas_questions').select('*');
                if (config.mode === 'subject' && config.subject) query = query.eq('subject', config.subject);
                if (config.difficulty && config.difficulty !== 'mixed') query = query.eq('difficulty', config.difficulty);
                if (config.year && config.year !== 'all') query = query.eq('year', config.year);
                if (config.paper && config.paper !== 'all') query = query.eq('paper', config.paper);
                if (config.month && config.month !== 'all') query = query.eq('month', config.month);
                const { data } = await query;
                if (data) selectedRawQuestions = data;
            } else {
                let query = supabase.from('questions').select('*').eq('exam_id', config.exam_id);
                if (config.mode === 'subject' && config.subject) query = query.eq('subject', config.subject);
                if (config.difficulty && config.difficulty !== 'mixed') query = query.eq('difficulty', config.difficulty);
                const { data } = await query;
                if (data) selectedRawQuestions = data;
            }

            if (selectedRawQuestions.length > 0) {
                let sortedQuestions = [...selectedRawQuestions];
                if (config.exam_id === 'ksp-pc') {
                    // Group linked questions sharing common passages
                    selectedRawQuestions = assignQuestionGroups(selectedRawQuestions);

                    if (config.mode === 'yearwise' || (config.paper_code && config.paper_code !== 'all')) {
                        sortedQuestions = [...selectedRawQuestions].sort((a, b) => (a.question_number || 0) - (b.question_number || 0));
                    } else {
                        sortedQuestions = groupPreservingShuffle(selectedRawQuestions);
                    }
                    if (config.question_count && config.question_count < sortedQuestions.length) {
                        sortedQuestions = safeSliceQuestions(sortedQuestions, config.question_count);
                    }
                } else if (config.exam_id === 'upsc-cse' && config.paper === 2) {
                    // CSAT: preserve the groupPreservingShuffle and sorted order
                    sortedQuestions = selectedRawQuestions;
                } else if (config.exam_id === 'kpsc-kas') {
                    sortedQuestions.sort((a, b) => {
                        const numA = parseInt(a.id.match(/-q(\d+)$/)?.[1] || '0', 10);
                        const numB = parseInt(b.id.match(/-q(\d+)$/)?.[1] || '0', 10);
                        return numA - numB;
                    });
                } else {
                    const shuffledFinal = [...selectedRawQuestions].sort(() => Math.random() - 0.5);
                    const diffOrder: Record<string, number> = { easy: 0, medium: 1, hard: 2 };
                    shuffledFinal.sort((a, b) => {
                        const subA = a.domain || a.subject_name || a.subject || '';
                        const subB = b.domain || b.subject_name || b.subject || '';
                        const diffA = (a.difficulty || 'medium').toLowerCase();
                        const diffB = (b.difficulty || 'medium').toLowerCase();
                        if (subA !== subB) return subA.localeCompare(subB);
                        return (diffOrder[diffA] ?? 1) - (diffOrder[diffB] ?? 1);
                    });
                    sortedQuestions = shuffledFinal;
                }

                const formattedQs: Question[] = sortedQuestions.map((dbq) => {
                    // Police Constable (PC) CAR/DAR Question Format (from pc_pyq or JSON)
                    if (dbq.option_1_english || dbq.paper_code || dbq.exam_id === 'ksp-pc') {
                        const optionsList = [
                            { id: '1', text: dbq.option_1_english || '', text_kn: dbq.option_1_kannada || undefined },
                            { id: '2', text: dbq.option_2_english || '', text_kn: dbq.option_2_kannada || undefined },
                            { id: '3', text: dbq.option_3_english || '', text_kn: dbq.option_3_kannada || undefined },
                            { id: '4', text: dbq.option_4_english || '', text_kn: dbq.option_4_kannada || undefined }
                        ];
                        const rawAns = String(dbq.key_answer || '1').trim();
                        return {
                            id: dbq.id || `pc-${dbq.paper_code || 'car'}-2026-q${dbq.question_number || 1}`,
                            exam_id: 'ksp-pc',
                            subject: dbq.subject || 'General Knowledge',
                            difficulty: (dbq.difficulty || 'medium').toLowerCase() as any,
                            text: dbq.question_english || '',
                            text_kn: dbq.question_kannada || undefined,
                            options: optionsList,
                            correct: rawAns,
                            explanation: dbq.explanation_english || 'No explanation available.',
                            explanation_kn: dbq.explanation_kannada || undefined,
                            image_url: isValidImageUrl(dbq.image_url) ? dbq.image_url.trim() : undefined,
                            passage: dbq.passage_english?.trim() || undefined,
                            passage_kn: dbq.passage_kannada?.trim() || undefined,
                            group_id: dbq.group_id || undefined,
                            group_label: dbq.group_label || undefined,
                            subject_kannada: dbq.subject_kannada || undefined,
                            sub_topic_kannada: dbq.sub_topic_kannada || undefined
                        };
                    } else if (dbq.question_english) {
                        const optionsList = [
                            { id: 'a', text: dbq.option_a_english || '', text_hi: dbq.option_a_hindi || undefined },
                            { id: 'b', text: dbq.option_b_english || '', text_hi: dbq.option_b_hindi || undefined },
                            { id: 'c', text: dbq.option_c_english || '', text_hi: dbq.option_c_hindi || undefined },
                            { id: 'd', text: dbq.option_d_english || '', text_hi: dbq.option_d_hindi || undefined }
                        ];
                        const rawAns = (dbq.key_answer || 'a').toLowerCase().trim();
                        const correctChar = ['a', 'b', 'c', 'd', '1', '2', '3', '4', 'x'].includes(rawAns) ? rawAns : 'a';
                        return {
                            id: dbq.id || `${config.exam_id || 'exam'}-${dbq.year || 2020}-q${dbq.question_number || 1}`,
                            exam_id: dbq.exam_id || config.exam_id || 'upsc-cse',
                            subject: dbq.subject || dbq.domain || 'General Studies',
                            difficulty: (dbq.difficulty || 'medium').toLowerCase() as any,
                            text: dbq.question_english,
                            text_hi: dbq.question_hindi || undefined,
                            options: optionsList,
                            correct: correctChar,
                            explanation: dbq.explanation_english || 'No explanation available.',
                            explanation_hi: dbq.explanation_hindi || undefined,
                            image_url: isValidImageUrl(dbq.image_url) ? dbq.image_url.trim() : undefined,
                            passage: dbq.passage_english?.trim() || undefined,
                            passage_hi: dbq.passage_hindi?.trim() || undefined,
                            group_id: dbq.group_id || undefined,
                            group_label: dbq.group_label || undefined,
                            subject_kannada: dbq.subject_kannada || undefined,
                            sub_topic_kannada: dbq.sub_topic_kannada || undefined
                        };
                    } else if (dbq.options_en && Array.isArray(dbq.options_en)) {
                        return {
                            id: dbq.id,
                            exam_id: dbq.exam_id || 'upsc-cse',
                            subject: dbq.subject || 'General Studies',
                            difficulty: (dbq.difficulty || 'medium').toLowerCase() as any,
                            text: dbq.text_en,
                            text_hi: dbq.text_hi || undefined,
                            text_kn: dbq.text_kn || undefined,
                            options: dbq.options_en.map((opt: string, idx: number) => ({
                                id: String.fromCharCode(97 + idx),
                                text: opt,
                                text_hi: dbq.options_hi?.[idx] || undefined,
                                text_kn: dbq.options_kn?.[idx] || undefined
                            })),
                            correct: dbq.correct_option || (dbq.correct_index !== undefined ? String.fromCharCode(97 + dbq.correct_index) : 'a'),
                            explanation: dbq.explanation_en || 'No explanation available.',
                            explanation_hi: dbq.explanation_hi || undefined,
                            explanation_kn: dbq.explanation_kn || undefined,
                            image_url: isValidImageUrl(dbq.image_url) ? dbq.image_url.trim() : undefined,
                            subject_kannada: dbq.subject_kannada || undefined,
                            sub_topic_kannada: dbq.sub_topic_kannada || undefined
                        };
                    } else if (dbq.content_key) {
                        const rawAns = (dbq['Correct Answer'] || 'a').toLowerCase().trim();
                        const correctChar = ['a', 'b', 'c', 'd', '1', '2', '3', '4', 'x'].includes(rawAns) ? rawAns : 'a';
                        const optionsList = [
                            { id: 'a', text: dbq.option_a_en, text_hi: dbq.option_a_hi !== 'None' ? dbq.option_a_hi : undefined },
                            { id: 'b', text: dbq.option_b_en, text_hi: dbq.option_b_hi !== 'None' ? dbq.option_b_hi : undefined },
                            { id: 'c', text: dbq.option_c_en, text_hi: dbq.option_c_hi !== 'None' ? dbq.option_c_hi : undefined },
                            { id: 'd', text: dbq.option_d_en, text_hi: dbq.option_d_hi !== 'None' ? dbq.option_d_hi : undefined }
                        ];
                        return {
                            id: dbq.content_key,
                            exam_id: 'upsc-cse',
                            subject: dbq.subject_name || 'General Awareness',
                            difficulty: (dbq.difficulty || 'medium').toLowerCase() as any,
                            text: dbq.question_en,
                            text_hi: dbq.question_hi !== 'None' ? dbq.question_hi : undefined,
                            options: optionsList,
                            correct: correctChar,
                            explanation: dbq.Explanation || dbq.explanation_correct || 'No explanation available.',
                            explanation_hi: dbq.explanation_hi !== 'None' ? dbq.explanation_hi : undefined,
                            image_url: isValidImageUrl(dbq.image_url) ? dbq.image_url.trim() : undefined,
                            subject_kannada: dbq.subject_kannada || undefined,
                            sub_topic_kannada: dbq.sub_topic_kannada || undefined
                        };
                    } else {
                        return {
                            id: dbq.id,
                            exam_id: dbq.exam_id,
                            subject: dbq.subject,
                            difficulty: dbq.difficulty,
                            text: dbq.text_en,
                            text_kn: dbq.text_kn,
                            options: (dbq.options_en || []).map((optId: string, idx: number) => ({
                                id: String.fromCharCode(97 + idx),
                                text: optId,
                                text_kn: dbq.options_kn?.[idx] || undefined,
                                text_hi: dbq.options_hi?.[idx] || undefined
                            })),
                            correct: String.fromCharCode(97 + dbq.correct_index),
                            explanation: dbq.explanation_en,
                            explanation_kn: dbq.explanation_kn,
                            explanation_hi: dbq.explanation_hi,
                            image_url: isValidImageUrl(dbq.image_url) ? dbq.image_url.trim() : undefined,
                            subject_kannada: dbq.subject_kannada || undefined,
                            sub_topic_kannada: dbq.sub_topic_kannada || undefined
                        };
                    }
                });
                setQuestions(formattedQs);
                setTimeLeft(formattedQs.length * 72);
                setActiveSession({ ...activeSession!, questions: formattedQs });
            } else {
                // Fallback to local QUESTIONS if remote database returns 0 matching rows
                let fallback = QUESTIONS.filter(q => q.exam_id === config.exam_id);
                if (config.mode === 'subject' && config.subject) {
                    const subFiltered = fallback.filter(q => q.subject.toLowerCase() === config.subject?.toLowerCase());
                    if (subFiltered.length > 0) fallback = subFiltered;
                }
                if (fallback.length === 0) fallback = QUESTIONS;
                const finalFallback = fallback.slice(0, config.question_count || 10);
                setQuestions(finalFallback);
                setTimeLeft(finalFallback.length * 72);
                setActiveSession({ ...activeSession!, questions: finalFallback });
            }
            setLoading(false);
        }
        if (activeSession.questions && activeSession.questions.length > 0) {
            setQuestions(activeSession.questions); setAnswers(activeSession.answers || {}); setTimeLeft(activeSession.questions.length * 72); setLoading(false);
        } else { fetchQuestions(); }
    }, [testId, activeSession?.id, router]);

    useEffect(() => {
        if (loading || timeLeft <= 0) return;
        const timer = setInterval(() => {
            setTimeLeft((t) => { if (t <= 1) { clearInterval(timer); handleSubmit(); return 0; } return t - 1; });
        }, 1000);
        return () => clearInterval(timer);
    }, [loading, timeLeft]);

    // Track visited questions
    useEffect(() => {
        if (questions[currentIdx]?.id) {
            setVisitedQuestions(prev => {
                if (prev.has(questions[currentIdx].id)) return prev;
                const next = new Set(prev);
                next.add(questions[currentIdx].id);
                return next;
            });
        }
    }, [currentIdx, questions]);

    const isCse = activeSession?.config?.exam_id === 'upsc-cse' || activeSession?.config?.exam_id === 'upsc-capf';
    const isKarnataka = activeSession?.config?.exam_id?.startsWith('kpsc') || activeSession?.config?.exam_id?.startsWith('kea') || activeSession?.config?.exam_id?.startsWith('ksp');
    const supportedLangs: ('en' | 'kn' | 'hi')[] = isCse ? ['en', 'hi'] : (isKarnataka ? ['en', 'kn'] : ['en']);

    const handleToggleLang = () => {
        if (supportedLangs.length <= 1) return;
        if (supportedLangs.includes('kn')) {
            setActiveLang(prev => (prev === 'kn' ? 'en' : 'kn'));
        } else if (supportedLangs.includes('hi')) {
            setActiveLang(prev => (prev === 'hi' ? 'en' : 'hi'));
        }
    };

    const getMarkingScheme = (examId?: string, paper?: number | string) => {
        if (examId === 'upsc-cse' && (paper === 2 || paper === '2')) {
            return { positive: 2.50, negative: 0.83 };
        }
        if (examId === 'upsc-cse' || examId === 'upsc-capf') {
            return { positive: 2.00, negative: 0.66 };
        }
        if (examId?.startsWith('kpsc')) {
            return { positive: 2.00, negative: 0.50 };
        }
        if (examId?.startsWith('ksp')) {
            return { positive: 1.00, negative: 0.25 };
        }
        return { positive: 2.00, negative: 0.66 };
    };

    const marking = getMarkingScheme(activeSession?.config?.exam_id, activeSession?.config?.paper);

    const handleZoomIn = () => setFontSizePercent(p => Math.min(130, p + 10));
    const handleZoomOut = () => setFontSizePercent(p => Math.max(90, p - 10));
    const handleZoomReset = () => setFontSizePercent(100);

    const handleToggleEliminate = (optId: string) => {
        const currentQ = questions[currentIdx];
        if (!currentQ) return;
        setEliminatedOptions(prev => {
            const currentElims = { ...(prev[currentQ.id] || {}) };
            currentElims[optId] = !currentElims[optId];
            return { ...prev, [currentQ.id]: currentElims };
        });
    };

    const handleSelectOption = (optId: string) => {
        const currentQ = questions[currentIdx];
        if (!currentQ) return;
        if (eliminatedOptions[currentQ.id]?.[optId]) {
            handleToggleEliminate(optId);
        }
        setAnswers(prev => ({
            ...prev,
            [currentQ.id]: {
                question_id: currentQ.id,
                selected: prev[currentQ.id]?.selected === optId ? undefined : optId,
                is_correct: undefined,
                marked_for_review: prev[currentQ.id]?.marked_for_review || false,
                time_spent: prev[currentQ.id]?.time_spent || 0
            }
        }));
    };

    const handleClearResponse = () => {
        const currentQ = questions[currentIdx];
        if (!currentQ) return;
        setAnswers(prev => {
            const copy = { ...prev };
            if (copy[currentQ.id]) {
                copy[currentQ.id] = {
                    ...copy[currentQ.id],
                    selected: undefined
                };
            }
            return copy;
        });
    };

    const handleToggleMarkAndNext = () => {
        const currentQ = questions[currentIdx];
        if (!currentQ) return;
        setAnswers(prev => ({
            ...prev,
            [currentQ.id]: {
                question_id: currentQ.id,
                selected: prev[currentQ.id]?.selected,
                marked_for_review: !prev[currentQ.id]?.marked_for_review,
                time_spent: prev[currentQ.id]?.time_spent || 0
            }
        }));
        if (currentIdx < questions.length - 1) {
            setCurrentIdx(i => i + 1);
        }
    };

    const handleSaveAndNext = () => {
        if (currentIdx < questions.length - 1) {
            setCurrentIdx(i => i + 1);
        } else {
            setShowSubmitModal(true);
        }
    };

    const handleJumpNextUnanswered = () => {
        for (let i = 1; i <= questions.length; i++) {
            const checkIdx = (currentIdx + i) % questions.length;
            const qId = questions[checkIdx].id;
            if (!answers[qId]?.selected) {
                setCurrentIdx(checkIdx);
                return;
            }
        }
    };

    const handleSubmit = () => {
        if (questions.length === 0) return;
        let score = 0; let correctCount = 0;
        const checkedAnswers = { ...answers };
        const posMarks = marking.positive;
        const negMarks = marking.negative;

        questions.forEach((q) => {
            const ans = checkedAnswers[q.id];
            const isDropped = q.correct?.toLowerCase() === 'x';
            if (isDropped) {
                score += posMarks;
                correctCount++;
                if (ans) {
                    ans.is_correct = true;
                } else {
                    checkedAnswers[q.id] = { question_id: q.id, marked_for_review: false, time_spent: 0, is_correct: true };
                }
            } else if (ans && ans.selected) {
                const isCorrect = ans.selected.toLowerCase() === q.correct?.toLowerCase();
                ans.is_correct = isCorrect;
                if (isCorrect) { score += posMarks; correctCount++; } else { score -= negMarks; }
            } else {
                checkedAnswers[q.id] = { question_id: q.id, marked_for_review: false, time_spent: 0, is_correct: undefined };
            }
        });
        const totalMarks = questions.length * posMarks;
        const sessionUpdate = {
            ...activeSession!,
            questions,
            answers: checkedAnswers,
            finished_at: new Date().toISOString(),
            status: 'completed' as const,
            score: Math.max(0, parseFloat(score.toFixed(2))),
            total_marks: totalMarks
        };
        useAppStore.getState().syncProgress(correctCount * 10, sessionUpdate);
        addCompletedSession(sessionUpdate);
        router.push(`/results/${activeSession!.id}`);
    };

    // Keyboard Shortcuts
    useEffect(() => {
        const handleKeyDown = (e: KeyboardEvent) => {
            if (showInstructions || showFullPaper || showSubmitModal || showDiscrepancy) return;
            const targetTag = (e.target as HTMLElement)?.tagName?.toLowerCase();
            if (targetTag === 'input' || targetTag === 'textarea' || targetTag === 'select') return;

            const key = e.key.toLowerCase();
            if (key === '1' || key === 'a') {
                handleSelectOption('a');
            } else if (key === '2' || key === 'b') {
                handleSelectOption('b');
            } else if (key === '3' || key === 'c') {
                handleSelectOption('c');
            } else if (key === '4' || key === 'd') {
                handleSelectOption('d');
            } else if (key === 'arrowright' || key === 'n') {
                e.preventDefault();
                handleSaveAndNext();
            } else if (key === 'arrowleft' || key === 'p') {
                e.preventDefault();
                setCurrentIdx(i => Math.max(0, i - 1));
            } else if (key === 'r' || key === 'm') {
                e.preventDefault();
                handleToggleMarkAndNext();
            }
        };

        window.addEventListener('keydown', handleKeyDown);
        return () => window.removeEventListener('keydown', handleKeyDown);
    }, [currentIdx, questions, answers, showInstructions, showFullPaper, showSubmitModal, showDiscrepancy]);

    if (loading) return (
        <div style={{ padding: '80px', textAlign: 'center', color: '#6B7280', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
            <Loader2 className="animate-spin" size={28} style={{ marginBottom: '12px', color: '#2563EB' }} />
            <span style={{ fontSize: '15px', fontWeight: 600 }}>Loading CBT Assessment Terminal...</span>
        </div>
    );

    if (questions.length === 0) {
        return (
            <div style={{ background: '#F4F1EA', minHeight: '85vh', padding: '80px 24px', textAlign: 'center', color: '#6B7280' }}>
                <div className="cbt-box" style={{ maxWidth: '440px', margin: '0 auto', background: '#FFFFFF', padding: '32px' }}>
                    <div style={{ fontSize: '40px', marginBottom: '16px' }}>⚠️</div>
                    <h3 style={{ color: '#111827', fontWeight: 800, fontSize: '18px', marginBottom: '8px' }}>No Questions Found</h3>
                    <p style={{ fontSize: '13.5px', color: '#4B5563', lineHeight: 1.5, marginBottom: '24px' }}>
                        No questions match this configuration. Make sure you run the seed script!
                    </p>
                    <button onClick={() => router.push('/exams')} className="btn btn-primary" style={{ width: '100%' }}>
                        Back to Catalog
                    </button>
                </div>
            </div>
        );
    }

    const question = questions[currentIdx];

    // Compute status states
    const questionStates: QuestionState[] = questions.map(q => {
        const a = answers[q.id];
        const isVisited = visitedQuestions.has(q.id);
        if (!a && !isVisited) return 'not_visited';
        if (a?.selected && a?.marked_for_review) return 'ans_and_marked';
        if (a?.marked_for_review) return 'marked';
        if (a?.selected) return 'answered';
        if (isVisited) return 'unanswered';
        return 'not_visited';
    });

    const answeredCount = questions.filter(q => answers[q.id]?.selected && !answers[q.id]?.marked_for_review).length;
    const notAnsweredCount = questions.filter(q => visitedQuestions.has(q.id) && !answers[q.id]?.selected && !answers[q.id]?.marked_for_review).length;
    const markedReviewCount = questions.filter(q => !answers[q.id]?.selected && answers[q.id]?.marked_for_review).length;
    const ansAndReviewCount = questions.filter(q => answers[q.id]?.selected && answers[q.id]?.marked_for_review).length;
    const notVisitedCount = questions.filter(q => !visitedQuestions.has(q.id) && !answers[q.id]?.selected && !answers[q.id]?.marked_for_review).length;

    const candidateName = user?.name || 'Aspirant Candidate';
    const candidateId = `UPS-${testId.slice(0, 6).toUpperCase()}`;
    const targetExam = activeSession?.config?.exam_id === 'upsc-cse'
        ? (activeSession?.config?.paper === 2 ? 'UPSC CSE (CSAT PAPER II)' : 'UPSC CSE (GS PAPER I)')
        : (activeSession?.config?.exam_id === 'upsc-capf' ? 'UPSC CAPF (AC) PAPER I' : (activeSession?.config?.exam_id?.toUpperCase() || 'CIVIL SERVICES EXAM'));

    const examTitle = targetExam;
    const paperTitle = activeSession?.config?.paper === 2 ? 'Paper II (CSAT)' : 'Paper I (GS)';

    return (
        <div className="cbt-terminal-wrapper">
            {/* 1. Global Header Bar */}
            <ExamHeader
                examTitle={examTitle}
                timeLeft={timeLeft}
                activeLang={activeLang}
                supportedLangs={supportedLangs}
                onToggleLang={handleToggleLang}
                onSubmitClick={() => setShowSubmitModal(true)}
                candidateName={candidateName}
            />

            {/* 2. Sub-Header Toolbar */}
            <ExamSubHeader
                currentIdx={currentIdx}
                totalQuestions={questions.length}
                subject={activeLang === 'kn' && question.subject_kannada ? question.subject_kannada : (question.subject || 'General Studies')}
                subTopic={activeLang === 'kn' && question.sub_topic_kannada ? question.sub_topic_kannada : question.sub_topic}
                positiveMarks={marking.positive}
                negativeDeduction={marking.negative}
                fontSizePercent={fontSizePercent}
                onZoomIn={handleZoomIn}
                onZoomOut={handleZoomOut}
                onZoomReset={handleZoomReset}
            />

            {/* 3. Main CBT Canvas */}
            <div style={{ maxWidth: '1440px', margin: '0 auto', padding: '16px 20px' }}>
                <div className="cbt-main-grid">
                    {/* Left Column: Test Flow & Questions */}
                    <div style={{ display: 'flex', flexDirection: 'column' }}>
                        {/* Quick Question Navigator with dynamic scrubber */}
                        <QuickNavigator
                            totalQuestions={questions.length}
                            currentIdx={currentIdx}
                            markedCount={markedReviewCount + ansAndReviewCount}
                            unansweredCount={notAnsweredCount}
                            questionStates={questionStates}
                            onSelectQuestion={(idx) => setCurrentIdx(idx)}
                            onJumpNextUnanswered={handleJumpNextUnanswered}
                        />

                        {/* CBT Question Card with crisp statement boxes and elimination */}
                        <CbtQuestionCard
                            questionNumber={currentIdx + 1}
                            question={question}
                            activeLang={activeLang}
                            supportedLangs={supportedLangs}
                            onToggleLang={handleToggleLang}
                            selectedOptionId={answers[question.id]?.selected}
                            eliminatedOptionIds={eliminatedOptions[question.id] || {}}
                            onSelectOption={handleSelectOption}
                            onToggleEliminate={handleToggleEliminate}
                            fontSizePercent={fontSizePercent}
                            onReportDiscrepancy={() => setShowDiscrepancy(true)}
                            onPreviewImage={(url) => setPreviewImage(url)}
                        />

                        {/* Bottom Action Bar */}
                        <ExamBottomNav
                            currentIdx={currentIdx}
                            totalQuestions={questions.length}
                            hasSelectedAnswer={!!answers[question.id]?.selected}
                            isMarkedForReview={!!answers[question.id]?.marked_for_review}
                            onPrev={() => setCurrentIdx(i => Math.max(0, i - 1))}
                            onNext={handleSaveAndNext}
                            onClearResponse={handleClearResponse}
                            onToggleMarkAndNext={handleToggleMarkAndNext}
                        />
                    </div>

                    {/* Right Column: Palette & Sidebar Tools */}
                    <div style={{ display: 'flex', flexDirection: 'column' }}>
                        {/* Candidate Information Card */}
                        <CandidateInfoCard
                            name={candidateName}
                            candidateId={candidateId}
                            targetExam={targetExam}
                        />

                        {/* Question Palette Summary (2x2 Matrix) */}
                        <QuestionPaletteSummary
                            total={questions.length}
                            answered={answeredCount}
                            notAnswered={notAnsweredCount}
                            markedReview={markedReviewCount}
                            ansAndReview={ansAndReviewCount}
                            notVisited={notVisitedCount}
                        />

                        {/* 10-Column Question Palette Grid */}
                        <QuestionPaletteGrid
                            totalQuestions={questions.length}
                            currentIdx={currentIdx}
                            questionStates={questionStates}
                            onSelectQuestion={(idx) => setCurrentIdx(idx)}
                            paperTitle={paperTitle}
                        />

                        {/* Exam Tools Card */}
                        <ExamToolsCard
                            onOpenFullPaper={() => setShowFullPaper(true)}
                            onOpenInstructions={() => setShowInstructions(true)}
                            onSubmitExam={() => setShowSubmitModal(true)}
                        />
                    </div>
                </div>
            </div>

            {/* 4. Modals */}
            <InstructionsModal
                isOpen={showInstructions}
                onClose={() => setShowInstructions(false)}
                examTitle={targetExam}
                positiveMarks={marking.positive}
                negativeDeduction={marking.negative}
                durationMinutes={Math.round(questions.length * 1.2)}
            />

            <FullPaperModal
                isOpen={showFullPaper}
                onClose={() => setShowFullPaper(false)}
                questions={questions}
                answers={answers}
                activeLang={activeLang}
                onJumpToQuestion={(idx) => setCurrentIdx(idx)}
            />

            <SubmitExamModal
                isOpen={showSubmitModal}
                onClose={() => setShowSubmitModal(false)}
                onConfirmSubmit={handleSubmit}
                totalQuestions={questions.length}
                answeredCount={answeredCount + ansAndReviewCount}
                unansweredCount={notAnsweredCount + notVisitedCount}
                markedReviewCount={markedReviewCount + ansAndReviewCount}
                timeLeft={timeLeft}
            />

            <ReportDiscrepancyModal
                isOpen={showDiscrepancy}
                onClose={() => setShowDiscrepancy(false)}
                questionNumber={currentIdx + 1}
                questionId={question?.id || ''}
            />

            {/* Diagram Lightbox Preview */}
            {previewImage && (
                <div onClick={() => setPreviewImage(null)} style={{
                    position: 'fixed', inset: 0, zIndex: 110, background: 'rgba(5, 8, 17, 0.88)',
                    backdropFilter: 'blur(8px)', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '24px', cursor: 'zoom-out'
                }}>
                    <div style={{ position: 'relative', maxWidth: '90vw', maxHeight: '90vh', textAlign: 'center' }}>
                        <img src={previewImage} alt="Diagram Expanded View" style={{ maxWidth: '100%', maxHeight: '80vh', borderRadius: '8px', border: '1.5px solid #1E1E1E', boxShadow: '0 12px 40px rgba(0,0,0,0.6)' }} />
                        <div style={{ textAlign: 'center', color: '#94A3B8', fontSize: '13px', marginTop: '12px', fontWeight: 600 }}>Click anywhere to close preview</div>
                    </div>
                </div>
            )}
        </div>
    );
}
