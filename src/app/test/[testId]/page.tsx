'use client';
import { use, useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { Clock, Flag, ChevronLeft, ChevronRight, Loader2 } from 'lucide-react';
import { Question } from '@/types';
import { QUESTIONS } from '@/lib/mockData';
import QuestionFormatter, { OptionFormatter } from '@/components/ui/QuestionFormatter';
import PassageCard from '@/components/ui/PassageCard';
import { isValidImageUrl } from '@/lib/imageUtils';

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
    const { activeSession, addCompletedSession, setActiveSession } = useAppStore();

    const [questions, setQuestions] = useState<Question[]>([]);
    const [answers, setAnswers] = useState<Record<string, { question_id: string; selected?: string; marked_for_review: boolean; is_correct?: boolean; time_spent: number }>>({});
    const [currentIdx, setCurrentIdx] = useState(0);
    const [timeLeft, setTimeLeft] = useState(0);
    const [loading, setLoading] = useState(true);
    const [activeLang, setActiveLang] = useState<'en' | 'kn' | 'hi'>('en');
    const [previewImage, setPreviewImage] = useState<string | null>(null);

    useEffect(() => {
        if (activeSession?.config?.language) {
            setActiveLang(activeSession.config.language);
        }
    }, [activeSession]);

    useEffect(() => {
        if (!activeSession || activeSession.id !== testId) { router.push('/exams'); return; }
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
                        const correctChar = ['a', 'b', 'c', 'd'].includes(rawAns) ? rawAns : 'a';
                        return {
                            id: dbq.id || `csat-${dbq.year || 2020}-q${dbq.question_number || 1}`,
                            exam_id: 'upsc-cse',
                            subject: dbq.domain || dbq.subject || 'CSAT Aptitude',
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
                        const correctChar = ['a', 'b', 'c', 'd'].includes(rawAns) ? rawAns : 'a';
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

    const formatTime = (s: number) => `${Math.floor(s / 60)}:${(s % 60).toString().padStart(2, '0')}`;

    const handleSubmit = () => {
        if (questions.length === 0) return;
        let score = 0; let correctCount = 0;
        const checkedAnswers = { ...answers };
        questions.forEach((q) => {
            const ans = checkedAnswers[q.id];
            if (ans && ans.selected) {
                const isCorrect = ans.selected === q.correct;
                ans.is_correct = isCorrect;
                if (isCorrect) { score += 1; correctCount++; } else { score -= 0.33; }
            } else {
                checkedAnswers[q.id] = { question_id: q.id, marked_for_review: false, time_spent: 0, is_correct: undefined };
            }
        });
        const sessionUpdate = { ...activeSession!, questions, answers: checkedAnswers, finished_at: new Date().toISOString(), status: 'completed' as const, score: Math.max(0, parseFloat(score.toFixed(2))), total_marks: questions.length };
        useAppStore.getState().syncProgress(correctCount * 10, sessionUpdate);
        addCompletedSession(sessionUpdate);
        router.push(`/results/${activeSession!.id}`);
    };

    if (loading) return (
        <div style={{ padding: '80px', textAlign: 'center', color: 'var(--text-muted)', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
            <Loader2 className="animate-spin" size={28} style={{ marginBottom: '12px', color: 'var(--brand-orange)' }} />
            <span style={{ fontSize: '15px' }}>Loading your test...</span>
        </div>
    );

    if (questions.length === 0) {
        return (
            <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '80px 24px', textAlign: 'center', color: 'var(--text-muted)' }}>
                <div style={{ maxWidth: '400px', margin: '0 auto', background: 'var(--bg-secondary)', padding: '32px', borderRadius: '16px', boxShadow: 'var(--shadow-card)' }}>
                    <div style={{ fontSize: '40px', marginBottom: '16px' }}>⚠️</div>
                    <h3 style={{ color: 'var(--text-primary)', fontWeight: 800, fontSize: '18px', marginBottom: '8px' }}>No Questions Found</h3>
                    <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.5, marginBottom: '24px' }}>
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
    const lang = activeLang;
    const qText = lang === 'kn' && question.text_kn ? question.text_kn : (lang === 'hi' && question.text_hi ? question.text_hi : question.text);
    const currentAnswer = answers[question.id];
    const isTimeLow = timeLeft < 60;

    const selectOption = (optId: string) => {
        setAnswers((prev) => ({ ...prev, [question.id]: { question_id: question.id, selected: optId, is_correct: undefined, marked_for_review: prev[question.id]?.marked_for_review || false, time_spent: 0 } }));
    };
    const toggleMark = () => {
        setAnswers((prev) => ({ ...prev, [question.id]: { ...prev[question.id], question_id: question.id, marked_for_review: !prev[question.id]?.marked_for_review, time_spent: 0 } }));
    };

    const answered = Object.values(answers).filter((a) => a.selected).length;
    const marked = Object.values(answers).filter((a) => a.marked_for_review).length;

    const getNavBg = (q: typeof question) => {
        const a = answers[q.id];
        if (!a || (!a.selected && !a.marked_for_review)) return 'var(--bg-secondary)';
        if (a.marked_for_review) return 'var(--accent-peach)';
        if (a.selected) return 'var(--accent-sage)';
        return 'var(--bg-secondary)';
    };

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '24px 0' }}>
            <div style={{ maxWidth: '900px', margin: '0 auto', padding: '0 24px' }}>
                {/* Top bar */}
                <div className="card" style={{ padding: '12px 20px', marginBottom: '16px', display: 'flex', alignItems: 'center', justifyContent: 'space-between', flexWrap: 'wrap', gap: '8px' }}>
                    <div style={{ fontSize: '14px', fontWeight: 600, color: 'var(--text-secondary)' }}>
                        Q {currentIdx + 1}/{questions.length}
                        <span style={{ marginLeft: '10px', color: 'var(--text-muted)' }}>· {answered} answered</span>
                    </div>

                    {/* Language switcher */}
                    {activeSession?.config?.exam_id === 'upsc-cse' ? (
                        <div style={{ display: 'flex', gap: '2px', background: 'var(--bg-secondary)', padding: '2px', borderRadius: '8px', border: '1px solid var(--border)' }}>
                            {(['en', 'hi'] as const).map((l) => (
                                <button
                                    key={l}
                                    onClick={() => setActiveLang(l)}
                                    style={{
                                        padding: '4px 10px',
                                        borderRadius: '6px',
                                        border: 'none',
                                        fontSize: '11px',
                                        fontWeight: 700,
                                        cursor: 'pointer',
                                        background: activeLang === l ? 'var(--brand-orange)' : 'transparent',
                                        color: activeLang === l ? 'white' : 'var(--text-secondary)',
                                        transition: 'all 0.15s'
                                    }}
                                >
                                    {l === 'en' ? '🇬🇧 EN' : '🇮🇳 HI'}
                                </button>
                            ))}
                        </div>
                    ) : (activeSession?.config?.exam_id?.startsWith('kpsc') || activeSession?.config?.exam_id?.startsWith('kea') || activeSession?.config?.exam_id?.startsWith('ksp')) ? (
                        <div style={{ display: 'flex', gap: '2px', background: 'var(--bg-secondary)', padding: '2px', borderRadius: '8px', border: '1px solid var(--border)' }}>
                            {(['en', 'kn'] as const).map((l) => (
                                <button
                                    key={l}
                                    onClick={() => setActiveLang(l)}
                                    style={{
                                        padding: '4px 10px',
                                        borderRadius: '6px',
                                        border: 'none',
                                        fontSize: '11px',
                                        fontWeight: 700,
                                        cursor: 'pointer',
                                        background: activeLang === l ? 'var(--brand-orange)' : 'transparent',
                                        color: activeLang === l ? 'white' : 'var(--text-secondary)',
                                        transition: 'all 0.15s'
                                    }}
                                >
                                    {l === 'en' ? '🇬🇧 EN' : '🇮🇳 KN'}
                                </button>
                            ))}
                        </div>
                    ) : null}

                    <div style={{ display: 'flex', alignItems: 'center', gap: '6px', fontWeight: 700, fontSize: '16px', color: isTimeLow ? 'var(--accent-rose)' : 'var(--text-primary)' }}>
                        <Clock size={15} /> {formatTime(timeLeft)}
                    </div>
                    <div style={{ display: 'flex', gap: '8px', fontSize: '12px', fontWeight: 600 }}>
                        <span style={{ color: 'var(--brand-teal)' }}>✅ {answered}</span>
                        <span style={{ color: 'var(--brand-orange)' }}>📌 {marked}</span>
                    </div>
                </div>

                <div className="test-layout-grid">
                    {/* Question */}
                    <div className="card" style={{ padding: '24px' }}>
                        <div style={{ display: 'flex', gap: '6px', marginBottom: '16px' }}>
                            <span className="tag chip-sky">{lang === 'kn' && question.subject_kannada ? question.subject_kannada : question.subject}</span>
                            <span className={`tag badge-${question.difficulty}`}>{question.difficulty}</span>
                        </div>

                        {/* Common Passage / Directions Card */}
                        {(question.passage || question.passage_kn || question.passage_hi) && (
                            <PassageCard
                                passage={question.passage}
                                passage_kn={question.passage_kn}
                                passage_hi={question.passage_hi}
                                group_label={question.group_label}
                                activeLang={lang}
                            />
                        )}

                        <div style={{ fontWeight: 600, marginBottom: '24px' }}>
                            <QuestionFormatter text={qText} />
                            {isValidImageUrl(question.image_url) && (
                                <div
                                    onClick={() => setPreviewImage(question.image_url!)}
                                    title="Click to expand diagram"
                                    style={{
                                        marginTop: '16px', borderRadius: '12px', overflow: 'hidden',
                                        border: '1px solid var(--border)', background: 'var(--bg-secondary)',
                                        display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center',
                                        padding: '16px', cursor: 'zoom-in', transition: 'all 0.2s'
                                    }}
                                >
                                    <img src={question.image_url} alt="Question Diagram" style={{ maxWidth: '100%', maxHeight: '300px', objectFit: 'contain' }} />
                                    <div style={{ fontSize: '11px', color: 'var(--brand-orange)', fontWeight: 600, marginTop: '8px' }}>🔍 Click to view full resolution</div>
                                </div>
                            )}
                        </div>

                        {(() => {
                            const isShortOptions = (question.options?.length || 0) <= 4 && question.options?.every((opt) => {
                                const optText = lang === 'kn' && opt.text_kn ? opt.text_kn : (lang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                                return (optText?.trim().length || 0) <= 36 && !optText?.includes('\n');
                            });

                            return (
                                <div style={{
                                    display: isShortOptions ? 'grid' : 'flex',
                                    gridTemplateColumns: isShortOptions ? 'repeat(auto-fit, minmax(280px, 1fr))' : undefined,
                                    flexDirection: isShortOptions ? undefined : 'column',
                                    gap: '12px'
                                }}>
                                    {question.options.map((opt) => {
                                        const optText = lang === 'kn' && opt.text_kn ? opt.text_kn : (lang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                                        const isSelected = currentAnswer?.selected === opt.id;
                                        return (
                                            <button key={opt.id} onClick={() => selectOption(opt.id)} style={{
                                                display: 'flex', alignItems: 'center', gap: '14px', padding: '16px 20px',
                                                borderRadius: '14px', cursor: 'pointer', textAlign: 'left', width: '100%',
                                                border: isSelected ? '2px solid var(--brand-orange)' : '1px solid var(--border)',
                                                background: isSelected ? 'rgba(37, 99, 235, 0.12)' : 'var(--bg-card-solid)',
                                                color: 'var(--text-primary)', transition: 'all 0.2s ease',
                                                boxShadow: isSelected ? '0 4px 16px rgba(37,99,235,0.2)' : '0 2px 8px rgba(0,0,0,0.04)',
                                            }}>
                                                <div style={{
                                                    width: 34, height: 34, borderRadius: '10px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                                                    fontSize: '14px', fontWeight: 800, flexShrink: 0,
                                                    background: isSelected ? 'var(--brand-orange)' : 'var(--bg-tertiary)',
                                                    color: isSelected ? 'white' : 'var(--text-primary)',
                                                    border: isSelected ? 'none' : '1px solid var(--border)',
                                                    boxShadow: '0 2px 6px rgba(0,0,0,0.06)',
                                                }}>{opt.id.toUpperCase()}</div>
                                                <div style={{ flexGrow: 1, lineHeight: 1.6 }}>
                                                    <OptionFormatter text={optText} />
                                                </div>
                                            </button>
                                        );
                                    })}
                                </div>
                            );
                        })()}

                        <div className="test-controls" style={{ display: 'flex', justifyContent: 'space-between', marginTop: '24px', gap: '8px', flexWrap: 'wrap' }}>
                            <div style={{ display: 'flex', gap: '6px' }}>
                                <button onClick={() => setCurrentIdx((i) => Math.max(0, i - 1))} disabled={currentIdx === 0} className="btn btn-secondary" style={{ padding: '8px 14px' }}>
                                    <ChevronLeft size={14} /> Prev
                                </button>
                                <button onClick={() => setCurrentIdx((i) => Math.min(questions.length - 1, i + 1))} disabled={currentIdx === questions.length - 1} className="btn btn-secondary" style={{ padding: '8px 14px' }}>
                                    Next <ChevronRight size={14} />
                                </button>
                            </div>
                            <div style={{ display: 'flex', gap: '6px' }}>
                                <button onClick={toggleMark} className="btn" style={{
                                    padding: '8px 14px', fontSize: '13px', fontWeight: 600,
                                    background: currentAnswer?.marked_for_review ? 'var(--accent-peach)' : 'var(--bg-secondary)',
                                    color: 'var(--text-primary)', border: 'none',
                                    }}>
                                    <Flag size={13} /> {currentAnswer?.marked_for_review ? 'Marked' : 'Mark'}
                                </button>
                                {currentIdx === questions.length - 1 && (
                                    <button onClick={handleSubmit} className="btn btn-primary" style={{ padding: '8px 18px' }}>Submit</button>
                                )}
                            </div>
                        </div>
                    </div>

                    {/* Navigator */}
                    <div className="card" style={{ padding: '16px' }}>
                        <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '10px', textTransform: 'uppercase' }}>Navigator</div>
                        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(32px, 1fr))', gap: '4px' }}>
                            {questions.map((q, i) => (
                                <button key={q.id} onClick={() => setCurrentIdx(i)} style={{
                                    height: 32, borderRadius: '8px', border: 'none', cursor: 'pointer',
                                    fontWeight: 700, fontSize: '11px', transition: 'all 0.15s',
                                    background: i === currentIdx ? 'var(--brand-orange)' : getNavBg(q),
                                    color: i === currentIdx ? 'white' : 'var(--text-primary)',
                                    position: 'relative'
                                }}>
                                    {i + 1}
                                    {q.group_id && (
                                        <span
                                            style={{
                                                position: 'absolute',
                                                bottom: '2px',
                                                left: '50%',
                                                transform: 'translateX(-50%)',
                                                width: '12px',
                                                height: '2.5px',
                                                borderRadius: '2px',
                                                background: i === currentIdx ? 'white' : 'var(--brand-orange)'
                                            }}
                                            title={q.group_label || 'Linked question'}
                                        />
                                    )}
                                </button>
                            ))}
                        </div>
                        <div style={{ marginTop: '16px', fontSize: '11px', display: 'flex', flexDirection: 'column', gap: '6px', color: 'var(--text-muted)' }}>
                            <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 10, height: 10, borderRadius: '4px', background: 'var(--accent-sage)' }} /> Answered</div>
                            <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 10, height: 10, borderRadius: '4px', background: 'var(--accent-peach)' }} /> Marked</div>
                            <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 10, height: 10, borderRadius: '4px', background: 'var(--bg-secondary)' }} /> Not visited</div>
                            <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 12, height: 3, borderRadius: '2px', background: 'var(--brand-orange)' }} /> Linked Passage</div>
                        </div>
                        <button onClick={handleSubmit} className="btn btn-primary" style={{ width: '100%', marginTop: '16px', padding: '10px' }}>
                            Submit Test
                        </button>
                    </div>
                </div>

                {/* Diagram Lightbox Preview Modal */}
                {previewImage && (
                    <div onClick={() => setPreviewImage(null)} style={{
                        position: 'fixed', inset: 0, zIndex: 100, background: 'rgba(5, 8, 17, 0.88)',
                        backdropFilter: 'blur(8px)', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '24px', cursor: 'zoom-out'
                    }}>
                        <div style={{ position: 'relative', maxWidth: '90vw', maxHeight: '90vh', textAlign: 'center' }}>
                            <img src={previewImage} alt="Diagram Expanded View" style={{ maxWidth: '100%', maxHeight: '80vh', borderRadius: '16px', border: '1px solid var(--border)', boxShadow: '0 12px 40px rgba(0,0,0,0.6)' }} />
                            <div style={{ textAlign: 'center', color: '#94A3B8', fontSize: '13px', marginTop: '12px', fontWeight: 500 }}>Click anywhere to close preview</div>
                        </div>
                    </div>
                )}
            </div>
        </div>
    );
}
