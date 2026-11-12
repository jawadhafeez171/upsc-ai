'use client';
import { use, useEffect, useRef, useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { Loader2 } from 'lucide-react';
import { Question } from '@/types';
import { QUESTIONS } from '@/lib/mockData';
import { getMarkingScheme } from '@/lib/marking';
import { isValidImageUrl } from '@/lib/imageUtils';
import '@/app/test/cbt-terminal.css';
import { InstructionsModal, FullPaperModal, ReportDiscrepancyModal } from '@/components/test/ExamModals';
import {
    ExamTopBar, QuestionPanel, ActionBar, PalettePanel, PaletteActions, PaletteSheet,
    SubmitDialog, LeaveDialog, TimeUpDialog, TimeToast, type QuestionState, type ExamLang,
} from '@/components/test/ExamScreen';
import '@/app/test/exam-screen.css';

const CSAT_SUBJECTS = [
    'Reading Comprehension & Interpersonal Skills',
    'Quantitative Aptitude & Basic Numeracy',
    'General Mental Ability & Logical Reasoning'
];

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
    const [isMobilePaletteOpen, setIsMobilePaletteOpen] = useState(false);
    const [bookmarkedQuestions, setBookmarkedQuestions] = useState<Record<string, boolean>>({});
    const [confidenceRatings, setConfidenceRatings] = useState<Record<string, 'low' | 'med' | 'high'>>({});
    // Exam-day defaults: study aids (elimination, bookmarks, read-aloud, confidence, subject) are opt-in.
    const [practiceTools, setPracticeTools] = useState(false);
    const [showLeave, setShowLeave] = useState(false);
    const [timeNotice, setTimeNotice] = useState<string | null>(null);
    const [timeUp, setTimeUp] = useState(false);
    const submittedRef = useRef(false);

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
                    // Subject drill across "All papers": only pull from the paper that subject belongs to
                    const subjectSel = config.mode === 'subject' && config.subject ? config.subject : null;
                    const isCsatSubject = !!subjectSel && CSAT_SUBJECTS.includes(subjectSel);
                    if (subjectSel && !isCsatSubject) q1 = q1.ilike('subject', `%${subjectSel}%`);
                    if (isCsatSubject) q2 = q2.or(`domain.ilike.%${subjectSel}%,sub_topic.ilike.%${subjectSel}%`);
                    const [{ data: d1 }, { data: d2 }] = await Promise.all([
                        isCsatSubject ? Promise.resolve({ data: null }) : q1,
                        subjectSel && !isCsatSubject ? Promise.resolve({ data: null }) : q2,
                    ]);
                    let csatData = d2;
                    if ((!csatData || csatData.length === 0) && (!subjectSel || isCsatSubject)) {
                        try {
                            const csatModule = await import('@/data/upsc_pyq/csat/2020_csat.json');
                            csatData = [...(csatModule.default || csatModule)];
                            if (isCsatSubject) {
                                const subLower = subjectSel!.toLowerCase();
                                csatData = csatData.filter((q: { domain?: string; sub_topic?: string }) =>
                                    q.domain?.toLowerCase().includes(subLower) || q.sub_topic?.toLowerCase().includes(subLower)
                                );
                            }
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
                            const hkMod = await import('@/data/pc/hk_dar_pc_2026_sept.json');
                            const hkItems = (hkMod.default || hkMod).map((q: any) => ({
                                ...q,
                                id: `pc-hk-2026-q${q.question_number}`,
                                paper_code: 'hk',
                                exam_id: 'ksp-pc'
                            }));
                            localPool = [...localPool, ...hkItems];
                        }
                        if (!config.paper_code || config.paper_code === 'all' || config.paper_code === 'nhk') {
                            const nhkMod = await import('@/data/pc/nhk_dar_pc_2026_sept.json');
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
            } else if (config.exam_id === 'ksp-psi') {
                let query = supabase.from('psi_pyq').select('*');
                if (config.paper) {
                    query = query.eq('paper', config.paper);
                } else {
                    query = query.eq('paper', 2);
                }
                if (config.cadre && config.cadre !== 'all') {
                    query = query.eq('cadre', config.cadre);
                }
                if (config.mode === 'subject' && config.subject) {
                    query = query.or(`subject.eq."${config.subject}",subject_kannada.eq."${config.subject}"`);
                }
                if (config.difficulty && config.difficulty !== 'mixed') {
                    query = query.eq('difficulty', config.difficulty);
                }
                if (config.year && config.year !== 'all') {
                    query = query.eq('year', config.year);
                }
                const { data } = await query;
                if (data && data.length > 0) {
                    selectedRawQuestions = data;
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
            } else if (config.exam_id === 'upsc-epfo') {
                let query = supabase.from('epfo_pyq').select('*');
                if (config.paper_code && config.paper_code !== 'all') {
                    query = query.eq('paper_code', config.paper_code);
                }
                if (config.year && config.year !== 'all') {
                    query = query.eq('year', config.year);
                }
                if (config.mode === 'subject' && config.subject) {
                    query = query.or(`subject.eq."${config.subject}",subject_hindi.eq."${config.subject}"`);
                }
                if (config.difficulty && config.difficulty !== 'mixed') {
                    query = query.eq('difficulty', config.difficulty);
                }
                const { data, error: epfoErr } = await query;
                if (!epfoErr && data && data.length > 0) {
                    selectedRawQuestions = data;
                } else {
                    // Fallback to local JSON file if offline or network failure
                    try {
                        const epfoMod = await import('@/data/epfo/epfo-all-papers.json');
                        let pool: any[] = epfoMod.default || epfoMod;
                        if (config.paper_code && config.paper_code !== 'all') {
                            pool = pool.filter((q: any) => q.paper_code === config.paper_code);
                        }
                        if (config.year && config.year !== 'all') {
                            pool = pool.filter((q: any) => q.year === Number(config.year));
                        }
                        if (config.mode === 'subject' && config.subject) {
                            pool = pool.filter((q: any) => q.subject === config.subject || q.subject_hindi === config.subject);
                        }
                        if (config.difficulty && config.difficulty !== 'mixed') {
                            pool = pool.filter((q: any) => q.difficulty === config.difficulty);
                        }
                        selectedRawQuestions = pool;
                    } catch (e) {
                        console.error('Local JSON fallback error for upsc-epfo:', e);
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
            } else if (config.exam_id === 'kea' || config.exam_id?.startsWith('kea-')) {
                let query = supabase.from('kea_questions').select('*');
                if (config.paper_code && config.paper_code !== 'all') {
                    if (config.paper_code === 'fda-sda') {
                        query = query.or('paper_code.ilike.%fda%,paper_code.ilike.%sda%,paper_code.ilike.%kec1%');
                    } else if (config.paper_code === 'vao') {
                        query = query.or('paper_code.ilike.%vao%,paper_code.ilike.%compulsory_kannada%');
                    } else if (config.paper_code === 'police') {
                        query = query.or('paper_code.ilike.%civilpc%,paper_code.ilike.%ksrp%,paper_code.ilike.%psi%');
                    } else if (config.paper_code === 'leg-council') {
                        query = query.ilike('paper_code', '%legcouncil%');
                    } else if (config.paper_code === 'tech-eng') {
                        query = query.or('paper_code.ilike.%bwssb%,paper_code.ilike.%kuwsdb%,paper_code.ilike.%kridl%,paper_code.ilike.%ksscl%,paper_code.ilike.%gttc%');
                    } else if (config.paper_code === 'coaching') {
                        query = query.or('paper_code.ilike.%coaching%,paper_code.ilike.%swd%,paper_code.ilike.%bcwd%,paper_code.ilike.%minority%');
                    } else {
                        query = query.eq('paper_code', config.paper_code);
                    }
                } else if (config.exam_id === 'kea-vao') {
                    query = query.or('paper_code.ilike.%vao%,paper_code.ilike.%compulsory_kannada%');
                } else if (config.exam_id === 'kea-kset') {
                    query = query.ilike('paper_code', '%kset%');
                }

                if (config.mode === 'subject' && config.subject) {
                    query = query.or(`subject.eq."${config.subject}",subject_kannada.eq."${config.subject}"`);
                }
                if (config.difficulty && config.difficulty !== 'mixed') query = query.eq('difficulty', config.difficulty);
                if (config.year && config.year !== 'all') query = query.eq('year', config.year);
                
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
                } else if (config.exam_id === 'ksp-psi') {
                    selectedRawQuestions = assignQuestionGroups(selectedRawQuestions);

                    if (config.mode === 'yearwise' || (config.year && config.year !== 'all') || (config.cadre && config.cadre !== 'all')) {
                        sortedQuestions = [...selectedRawQuestions].sort((a, b) => (a.question_number || 0) - (b.question_number || 0));
                    } else {
                        sortedQuestions = groupPreservingShuffle(selectedRawQuestions);
                    }
                    if (config.question_count && config.question_count < sortedQuestions.length) {
                        sortedQuestions = safeSliceQuestions(sortedQuestions, config.question_count);
                    }
                } else if (config.exam_id === 'kea' || config.exam_id?.startsWith('kea-')) {
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
                } else if (config.exam_id === 'upsc-epfo') {
                    if (config.mode === 'yearwise' || (config.year && config.year !== 'all') || (config.paper_code && config.paper_code !== 'all')) {
                        sortedQuestions = [...selectedRawQuestions].sort((a, b) => (a.question_number || 0) - (b.question_number || 0));
                    } else {
                        sortedQuestions = [...selectedRawQuestions].sort(() => Math.random() - 0.5);
                    }
                    if (config.question_count && config.question_count < sortedQuestions.length) {
                        sortedQuestions = sortedQuestions.slice(0, config.question_count);
                    }
                } else if (config.exam_id === 'kpsc-kas') {
                    if (config.mode === 'yearwise') {
                        sortedQuestions.sort((a, b) => {
                            const numA = parseInt(a.id.match(/-q(\d+)$/)?.[1] || '0', 10);
                            const numB = parseInt(b.id.match(/-q(\d+)$/)?.[1] || '0', 10);
                            return numA - numB;
                        });
                    } else {
                        sortedQuestions = [...selectedRawQuestions].sort(() => Math.random() - 0.5);
                    }
                } else if (config.exam_id === 'upsc-capf') {
                    if (config.mode === 'yearwise') {
                        sortedQuestions = [...selectedRawQuestions].sort((a, b) => (a.year || 0) - (b.year || 0) || (a.question_number || 0) - (b.question_number || 0));
                    } else {
                        sortedQuestions = [...selectedRawQuestions].sort(() => Math.random() - 0.5);
                    }
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
                // Every exam honours the number of questions chosen on the setup page.
                if (config.question_count && config.question_count < sortedQuestions.length && !(config.exam_id === 'upsc-cse' && config.paper === 2)) {
                    sortedQuestions = safeSliceQuestions(sortedQuestions, config.question_count);
                }

                const formattedQs: Question[] = sortedQuestions.map((dbq) => {
                    // Police Sub-Inspector (PSI), Police Constable (PC) & KEA Question Format (from psi_pyq, pc_pyq, kea_questions)
                    if (dbq.option_1_english || dbq.option_1_kannada || dbq.exam_id === 'ksp-psi' || config.exam_id === 'ksp-psi' || dbq.exam_id === 'ksp-pc' || dbq.exam_id === 'kea' || config.exam_id === 'kea' || config.exam_id?.startsWith('kea-')) {
                        const optionsList = [
                            { id: '1', text: dbq.option_1_english || dbq.option_1_kannada || '', text_kn: dbq.option_1_kannada || undefined },
                            { id: '2', text: dbq.option_2_english || dbq.option_2_kannada || '', text_kn: dbq.option_2_kannada || undefined },
                            { id: '3', text: dbq.option_3_english || dbq.option_3_kannada || '', text_kn: dbq.option_3_kannada || undefined },
                            { id: '4', text: dbq.option_4_english || dbq.option_4_kannada || '', text_kn: dbq.option_4_kannada || undefined }
                        ];
                        const rawAns = String(dbq.key_answer || '1').trim();
                        return {
                            id: dbq.id || `${config.exam_id || 'kea'}-${dbq.paper_code || 'paper'}-q${dbq.question_number || 1}`,
                            exam_id: dbq.exam_id || config.exam_id || 'kea',
                            subject: dbq.subject || 'General Knowledge',
                            difficulty: (dbq.difficulty || 'medium').toLowerCase() as any,
                            text: dbq.question_english || dbq.question_kannada || '',
                            text_kn: dbq.question_kannada || undefined,
                            options: optionsList,
                            correct: rawAns,
                            explanation: dbq.explanation_english || dbq.explanation_kannada || 'No explanation available.',
                            explanation_kn: dbq.explanation_kannada || undefined,
                            image_url: isValidImageUrl(dbq.image_url) ? dbq.image_url.trim() : undefined,
                            passage: dbq.passage_english?.trim() || dbq.passage_kannada?.trim() || undefined,
                            passage_kn: dbq.passage_kannada?.trim() || undefined,
                            group_id: dbq.group_id || undefined,
                            group_label: dbq.group_label || undefined,
                            subject_kannada: dbq.subject_kannada || undefined,
                            sub_topic_kannada: dbq.sub_topic_kannada || undefined,
                            node_id: dbq.node_id || undefined,
                            domain: dbq.domain || undefined,
                            sub_topic: dbq.sub_topic || undefined,
                            tags: Array.isArray(dbq.tags) ? dbq.tags : (dbq.tags ? [dbq.tags] : undefined)
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
                            sub_topic_kannada: dbq.sub_topic_kannada || undefined,
                            node_id: dbq.node_id || undefined,
                            domain: dbq.domain || undefined,
                            sub_topic: dbq.sub_topic || undefined,
                            tags: Array.isArray(dbq.tags) ? dbq.tags : (dbq.tags ? [dbq.tags] : undefined),
                            secondary_node_ids: Array.isArray(dbq.secondary_node_ids) ? dbq.secondary_node_ids : undefined
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
                const qSecs = config.exam_id === 'upsc-epfo' ? 60 : 72;
                setTimeLeft(formattedQs.length * qSecs);
                setActiveSession({ ...activeSession!, questions: formattedQs });
            } else {
                // Fallback to local QUESTIONS if remote database returns 0 matching rows
                let fallback = QUESTIONS.filter(q => q.exam_id === config.exam_id);
                if (config.mode === 'subject' && config.subject) {
                    // Never substitute other subjects for a subject drill — show "No Questions Found" instead
                    fallback = fallback.filter(q => q.subject.toLowerCase() === config.subject?.toLowerCase());
                } else if (fallback.length === 0) {
                    fallback = QUESTIONS;
                }
                const finalFallback = fallback.slice(0, config.question_count || 10);
                setQuestions(finalFallback);
                const fallbackSecs = config.exam_id === 'upsc-epfo' ? 60 : 72;
                setTimeLeft(finalFallback.length * fallbackSecs);
                setActiveSession({ ...activeSession!, questions: finalFallback });
            }
            setLoading(false);
        }
        if (activeSession.questions && activeSession.questions.length > 0) {
            const resumeSecs = activeSession.config?.exam_id === 'upsc-epfo' ? 60 : 72;
            setQuestions(activeSession.questions); setAnswers(activeSession.answers || {}); setTimeLeft(activeSession.questions.length * resumeSecs); setLoading(false);
        } else { fetchQuestions(); }
    }, [testId, activeSession?.id, router]);

    useEffect(() => {
        if (loading || timeUp || timeLeft <= 0) return;
        const timer = setInterval(() => {
            setTimeLeft((t) => {
                if (t <= 1) { clearInterval(timer); setTimeUp(true); return 0; }
                if (t === 301) setTimeNotice('5 minutes left.');
                if (t === 61) setTimeNotice('1 minute left. Your answers will be submitted when time runs out.');
                return t - 1;
            });
        }, 1000);
        return () => clearInterval(timer);
    }, [loading, timeLeft, timeUp]);

    useEffect(() => {
        if (!timeNotice) return;
        const t = setTimeout(() => setTimeNotice(null), 10000);
        return () => clearTimeout(t);
    }, [timeNotice]);

    // Warn before closing or reloading the tab mid-test
    useEffect(() => {
        if (loading || questions.length === 0) return;
        const onBeforeUnload = (e: BeforeUnloadEvent) => {
            if (submittedRef.current) return;
            e.preventDefault();
            e.returnValue = '';
        };
        window.addEventListener('beforeunload', onBeforeUnload);
        return () => window.removeEventListener('beforeunload', onBeforeUnload);
    }, [loading, questions.length]);

    // Remember the practice-tools preference
    useEffect(() => {
        try { setPracticeTools(localStorage.getItem('upsc-practice-tools') === '1'); } catch {}
    }, []);
    const togglePracticeTools = () => {
        setPracticeTools((v) => {
            try { localStorage.setItem('upsc-practice-tools', v ? '0' : '1'); } catch {}
            return !v;
        });
    };

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

    const isUpsc = activeSession?.config?.exam_id === 'upsc-cse' || activeSession?.config?.exam_id === 'upsc-capf' || activeSession?.config?.exam_id === 'upsc-epfo';
    const isKarnataka = activeSession?.config?.exam_id?.startsWith('kpsc') || activeSession?.config?.exam_id?.startsWith('kea') || activeSession?.config?.exam_id?.startsWith('ksp');
    const supportedLangs: ('en' | 'kn' | 'hi')[] = isUpsc ? ['en', 'hi'] : (isKarnataka ? ['en', 'kn'] : ['en']);


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
                selected: optId,
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
        if (questions.length === 0 || submittedRef.current) return;
        submittedRef.current = true;
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

    const handleToggleBookmark = (qId: string) => {
        setBookmarkedQuestions(prev => ({ ...prev, [qId]: !prev[qId] }));
    };

    const handleSetConfidence = (qId: string, level: 'low' | 'med' | 'high') => {
        setConfidenceRatings(prev => ({ ...prev, [qId]: level }));
    };

    // Keyboard shortcuts — A–D answer, N next, P previous, M mark & next, Backspace/Delete clear.
    // Enter and Space are left to the focused control; arrows are left to radio groups.
    useEffect(() => {
        const handleKeyDown = (e: KeyboardEvent) => {
            if (showInstructions || showFullPaper || showSubmitModal || showDiscrepancy || showLeave || timeUp || isMobilePaletteOpen) return;
            if (e.ctrlKey || e.metaKey || e.altKey) return;
            const t = e.target as HTMLElement | null;
            const tag = t?.tagName?.toLowerCase();
            const isRadio = tag === 'input' && (t as HTMLInputElement).type === 'radio';
            if ((tag === 'input' && !isRadio) || tag === 'textarea' || tag === 'select' || t?.isContentEditable) return;

            const key = e.key.toLowerCase();
            const optionIndex: Record<string, number> = { a: 0, b: 1, c: 2, d: 3, '1': 0, '2': 1, '3': 2, '4': 3 };
            if (key in optionIndex) {
                const opt = questions[currentIdx]?.options[optionIndex[key]];
                if (opt) { e.preventDefault(); handleSelectOption(opt.id); }
            } else if (key === 'n' || (key === 'arrowright' && !isRadio)) {
                e.preventDefault(); handleSaveAndNext();
            } else if (key === 'p' || (key === 'arrowleft' && !isRadio)) {
                e.preventDefault(); setCurrentIdx(i => Math.max(0, i - 1));
            } else if (key === 'm') {
                e.preventDefault(); handleToggleMarkAndNext();
            } else if (key === 'backspace' || key === 'delete') {
                e.preventDefault(); handleClearResponse();
            }
        };

        window.addEventListener('keydown', handleKeyDown);
        return () => window.removeEventListener('keydown', handleKeyDown);
    }, [currentIdx, questions, answers, eliminatedOptions, showInstructions, showFullPaper, showSubmitModal, showDiscrepancy, showLeave, timeUp, isMobilePaletteOpen]);

    // When time runs out, show the notice briefly, then submit.
    useEffect(() => {
        if (!timeUp) return;
        const t = setTimeout(() => handleSubmit(), 1800);
        return () => clearTimeout(t);
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [timeUp]);

    if (loading) return (
        <div style={{ padding: '80px', textAlign: 'center', color: '#6B7280', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
            <Loader2 className="animate-spin" size={28} style={{ marginBottom: '12px', color: '#2563EB' }} />
            <span style={{ fontSize: '15px', fontWeight: 600 }}>Loading your test…</span>
        </div>
    );

    if (questions.length === 0) {
        return (
            <div style={{ background: '#F4F1EA', minHeight: '85vh', padding: '80px 24px', textAlign: 'center', color: '#6B7280' }}>
                <div className="cbt-box" style={{ maxWidth: '440px', margin: '0 auto', background: '#FFFFFF', padding: '32px' }}>
                    <h1 style={{ color: '#111827', fontWeight: 800, fontSize: '20px', marginBottom: '8px' }}>No questions found</h1>
                    <p style={{ fontSize: '13.5px', color: '#4B5563', lineHeight: 1.5, marginBottom: '24px' }}>
                        No questions match this configuration. Try a different subject, year or difficulty.
                    </p>
                    <button onClick={() => router.push('/exams')} className="btn btn-primary" style={{ width: '100%' }}>
                        Back to exams
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

    const counts: Record<QuestionState, number> = { answered: 0, unanswered: 0, not_visited: 0, marked: 0, ans_and_marked: 0 };
    questionStates.forEach((st) => { counts[st] += 1; });

    const candidateName = user?.name || 'Candidate';
    const examTitle = activeSession?.config?.exam_id === 'upsc-cse'
        ? 'UPSC Civil Services (Preliminary)'
        : activeSession?.config?.exam_id === 'upsc-capf' ? 'UPSC CAPF (AC)'
        : (activeSession?.config?.exam_id || 'Practice test').toUpperCase().replace(/-/g, ' ');
    const cfgPaper = activeSession?.config?.paper;
    const paperTitle = activeSession?.config?.exam_id === 'upsc-cse'
        ? (cfgPaper === 2 ? 'Paper II · CSAT' : 'Paper I · General Studies')
        : (typeof cfgPaper === 'number' ? `Paper ${cfgPaper}` : 'Full paper');
    const lang = activeLang as ExamLang;
    const answer = answers[question.id];
    const zoom = (d: -1 | 0 | 1) => (d === 0 ? handleZoomReset() : d > 0 ? handleZoomIn() : handleZoomOut());
    const jump = (idx: number) => { setCurrentIdx(idx); setIsMobilePaletteOpen(false); };
    const openSubmit = () => { setIsMobilePaletteOpen(false); setShowSubmitModal(true); };

    return (
        <div className="cbt-terminal-wrapper es">
            <h1 className="cbt-sr-only">{examTitle}, {paperTitle} — question {currentIdx + 1} of {questions.length}</h1>

            <ExamTopBar
                examTitle={examTitle}
                paperTitle={paperTitle}
                timeLeft={timeLeft}
                lang={lang}
                langs={supportedLangs as ExamLang[]}
                onLang={(l) => setActiveLang(l)}
                practice={practiceTools}
                onPractice={togglePracticeTools}
                onLeave={() => setShowLeave(true)}
                onOpenPalette={() => setIsMobilePaletteOpen(true)}
                currentIdx={currentIdx}
                total={questions.length}
            />

            <main className="es-main">
                <QuestionPanel
                    question={question}
                    number={currentIdx + 1}
                    total={questions.length}
                    lang={lang}
                    fontPct={fontSizePercent}
                    onZoom={zoom}
                    positive={marking.positive}
                    negative={marking.negative}
                    selected={answer?.selected}
                    eliminated={eliminatedOptions[question.id] || {}}
                    onSelect={handleSelectOption}
                    onEliminate={handleToggleEliminate}
                    practice={practiceTools}
                    bookmarked={!!bookmarkedQuestions[question.id]}
                    onBookmark={() => handleToggleBookmark(question.id)}
                    confidence={confidenceRatings[question.id] || null}
                    onConfidence={(c) => handleSetConfidence(question.id, c)}
                    onReport={() => setShowDiscrepancy(true)}
                    onPreviewImage={(url) => setPreviewImage(url)}
                >
                    <ActionBar
                        canPrev={currentIdx > 0}
                        hasAnswer={!!answer?.selected}
                        marked={!!answer?.marked_for_review}
                        isLast={currentIdx === questions.length - 1}
                        onPrev={() => setCurrentIdx(i => Math.max(0, i - 1))}
                        onClear={handleClearResponse}
                        onMark={handleToggleMarkAndNext}
                        onNext={handleSaveAndNext}
                    />
                </QuestionPanel>

                <aside className="es-side" aria-label="Question palette">
                    <div className="es-panel">
                        <PalettePanel states={questionStates} currentIdx={currentIdx} onJump={jump} counts={counts} candidate={candidateName} />
                        <PaletteActions
                            onNextUnanswered={handleJumpNextUnanswered}
                            onPaper={() => setShowFullPaper(true)}
                            onInstructions={() => setShowInstructions(true)}
                            onSubmit={openSubmit}
                        />
                    </div>
                </aside>
            </main>

            {/* Mobile: palette, tools and submit live in one sheet */}
            <PaletteSheet
                open={isMobilePaletteOpen}
                onClose={() => setIsMobilePaletteOpen(false)}
                footer={<button type="button" className="es-btn es-btn-submit" onClick={openSubmit}>Submit test</button>}
            >
                <PalettePanel states={questionStates} currentIdx={currentIdx} onJump={jump} counts={counts} candidate={candidateName} />
                <div className="es-sheet-tools">
                    <button type="button" className="es-btn" onClick={() => { handleJumpNextUnanswered(); setIsMobilePaletteOpen(false); }}>Next unanswered</button>
                    <button type="button" className="es-btn" onClick={() => { setIsMobilePaletteOpen(false); setShowFullPaper(true); }}>Question paper</button>
                    <button type="button" className="es-btn" onClick={() => { setIsMobilePaletteOpen(false); setShowInstructions(true); }}>Instructions</button>
                    <button type="button" className="es-btn" onClick={() => { setIsMobilePaletteOpen(false); setShowDiscrepancy(true); }}>Report an issue</button>
                    <div className="es-zoom" role="group" aria-label={`Text size ${fontSizePercent}%`}>
                        <button type="button" onClick={handleZoomOut} aria-label="Smaller text">A−</button>
                        <button type="button" onClick={handleZoomReset} aria-label="Reset text size">{fontSizePercent}%</button>
                        <button type="button" onClick={handleZoomIn} aria-label="Larger text">A+</button>
                    </div>
                    <button type="button" className="es-switch" role="switch" aria-checked={practiceTools} onClick={togglePracticeTools}>
                        <span className="es-switch-track" aria-hidden="true" /> Practice tools
                    </button>
                </div>
            </PaletteSheet>

            <TimeToast message={timeNotice} onDismiss={() => setTimeNotice(null)} />
            <TimeUpDialog open={timeUp} />

            <SubmitDialog
                open={showSubmitModal}
                onClose={() => setShowSubmitModal(false)}
                onConfirm={handleSubmit}
                counts={counts}
                total={questions.length}
                timeLeft={timeLeft}
            />

            <LeaveDialog
                open={showLeave}
                onClose={() => setShowLeave(false)}
                onLeave={() => { submittedRef.current = true; setShowLeave(false); router.push('/exams'); }}
            />

            <InstructionsModal
                isOpen={showInstructions}
                onClose={() => setShowInstructions(false)}
                examTitle={examTitle}
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

            <ReportDiscrepancyModal
                isOpen={showDiscrepancy}
                onClose={() => setShowDiscrepancy(false)}
                questionNumber={currentIdx + 1}
                questionId={question?.id || ''}
            />

            {previewImage && (
                <div role="dialog" aria-modal="true" aria-label="Enlarged diagram" onClick={() => setPreviewImage(null)} style={{
                    position: 'fixed', inset: 0, zIndex: 110, background: 'rgba(5, 8, 17, 0.88)',
                    display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '24px', cursor: 'zoom-out'
                }}>
                    <div style={{ position: 'relative', maxWidth: '90vw', maxHeight: '90vh', textAlign: 'center' }}>
                        {/* eslint-disable-next-line @next/next/no-img-element */}
                        <img src={previewImage} alt="Diagram, enlarged" style={{ maxWidth: '100%', maxHeight: '80vh', borderRadius: '8px', background: '#FFFFFF' }} />
                        <div style={{ textAlign: 'center', color: '#CBD5E1', fontSize: '14px', marginTop: '12px', fontWeight: 600 }}>Click anywhere to close</div>
                    </div>
                </div>
            )}
        </div>
    );
}
