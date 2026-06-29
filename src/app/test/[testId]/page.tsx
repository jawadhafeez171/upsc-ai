'use client';
import { use, useEffect, useRef, useState, useCallback } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { useAppStore } from '@/lib/store';
import { TestAnswer, Question } from '@/types';
import { ChevronLeft, ChevronRight, Flag, Send, Clock, Loader2 } from 'lucide-react';

function formatTime(s: number) {
    const m = Math.floor(s / 60);
    const sec = s % 60;
    return `${m.toString().padStart(2, '0')}:${sec.toString().padStart(2, '0')}`;
}

export default function TestPage({ params }: { params: Promise<{ testId: string }> }) {
    const { testId } = use(params);
    const router = useRouter();
    const { 
        activeSession, 
        setActiveSession, 
        addCompletedSession, 
        syncProgress,
        user 
    } = useAppStore();

    const [currentIdx, setCurrentIdx] = useState(0);
    const [answers, setAnswers] = useState<Record<string, TestAnswer>>({});
    const [timeLeft, setTimeLeft] = useState(0);
    const [loadingQuestions, setLoadingQuestions] = useState(true);
    const [submitted, setSubmitted] = useState(false);
    const timerRef = useRef<ReturnType<typeof setInterval> | null>(null);

    useEffect(() => {
        if (submitted) return;
        if (!activeSession || activeSession.id !== testId) { router.push('/exams'); return; }
        
        async function initTest() {
            if (activeSession?.questions && activeSession.questions.length > 0) {
                // Questions are already loaded (e.g. page refresh and they were in localStorage)
                setLoadingQuestions(false);
                const mins = activeSession.questions.length * (120/100); // roughly 1.2 min per q
                setTimeLeft(Math.round(mins * 60));
                setAnswers(activeSession.answers || {});
                return;
            }

            // Need to fetch questions based on config
            const config = activeSession!.config;
            let selectedRawQuestions: any[] = [];

            if (config.exam_id === 'upsc-cse') {
                const SubjectTableMap: Record<string, string> = {
                    'Ancient History': 'PYQ Ancient History',
                    'Art and Culture': 'PYQ Art and Culture',
                    'Modern History': 'PYQ Modern History',
                    'Polity': 'PYQ Polity',
                    'Economics': 'PYQ Economics',
                    'Geography': 'PYQ Geography',
                    'Environment': 'PYQ Environement',
                    'IR and Current Affairs': 'PYQ IR and Current Affairs',
                    'General Awareness': 'PYQ General Awareness'
                };

                // Helper to get candidate keys & difficulties
                const fetchCandidateIds = async (tableName: string) => {
                    let query = supabase.from(tableName).select('content_key, difficulty');
                    if (config.difficulty !== 'mixed') {
                        query = query.ilike('difficulty', config.difficulty);
                    }
                    const { data } = await query;
                    return (data || []).map(r => ({
                        content_key: r.content_key,
                        difficulty: r.difficulty || 'medium',
                        tableName
                    }));
                };

                let candidates: { content_key: string; difficulty: string; tableName: string }[] = [];

                if (config.mode === 'subject' && config.subject) {
                    const tableName = SubjectTableMap[config.subject];
                    if (tableName) {
                        candidates = await fetchCandidateIds(tableName);
                    }
                } else {
                    // Full test mode - fetch from all tables
                    const tables = Object.values(SubjectTableMap);
                    const results = await Promise.all(tables.map(t => fetchCandidateIds(t)));
                    candidates = results.flat();
                }

                if (candidates.length === 0) {
                    console.error("No questions found for the selected UPSC CSE config");
                    router.push('/exams');
                    return;
                }

                // Shuffle candidate IDs and select the count
                const shuffledCandidates = [...candidates].sort(() => Math.random() - 0.5);
                const selectedCandidates = shuffledCandidates.slice(0, Math.min(config.question_count, candidates.length));

                // Group selected keys by table to batch query
                const groupedByTable: Record<string, string[]> = {};
                selectedCandidates.forEach(c => {
                    if (!groupedByTable[c.tableName]) groupedByTable[c.tableName] = [];
                    groupedByTable[c.tableName].push(c.content_key);
                });

                // Batch fetch rows in parallel
                const fetchFullRows = Object.entries(groupedByTable).map(async ([tableName, keys]) => {
                    const { data } = await supabase.from(tableName).select('*').in('content_key', keys);
                    return (data || []).map(row => ({ ...row, _source_table: tableName }));
                });

                const fullRowsResult = await Promise.all(fetchFullRows);
                selectedRawQuestions = fullRowsResult.flat();
            } else {
                // Fallback for other exams
                let query = supabase.from('questions').select('*').eq('exam_id', config.exam_id);
                if (config.mode === 'subject' && config.subject) {
                    query = query.eq('subject', config.subject);
                }
                if (config.difficulty !== 'mixed') {
                    query = query.eq('difficulty', config.difficulty);
                }

                const { data, error } = await query;
                if (error || !data || data.length === 0) {
                    console.error("Failed to load questions", error);
                    router.push('/exams');
                    return;
                }

                // Shuffle and cap at question_count
                const shuffled = [...data].sort(() => Math.random() - 0.5);
                selectedRawQuestions = shuffled.slice(0, Math.min(config.question_count, shuffled.length));
            }

            // Shuffle all selected raw questions to mix subjects/difficulties
            const shuffledFinal = [...selectedRawQuestions].sort(() => Math.random() - 0.5);

            // Sort logically (by subject then difficulty)
            const diffOrder: Record<string, number> = { easy: 0, medium: 1, hard: 2 };
            shuffledFinal.sort((a, b) => {
                const subA = a.subject_name || a.subject || '';
                const subB = b.subject_name || b.subject || '';
                const diffA = (a.difficulty || 'medium').toLowerCase();
                const diffB = (b.difficulty || 'medium').toLowerCase();
                if (subA !== subB) return subA.localeCompare(subB);
                return (diffOrder[diffA] ?? 1) - (diffOrder[diffB] ?? 1);
            });

            // Map DB format to UI format (handling both schemas)
            const formattedQs: Question[] = shuffledFinal.map(dbq => {
                const isPyqSchema = !!dbq.content_key;

                if (isPyqSchema) {
                    // Mapping for the new 38-column PYQ schema
                    const rawAns = (dbq['Correct Answer'] || 'a').toLowerCase().trim();
                    const correctChar = ['a', 'b', 'c', 'd'].includes(rawAns) ? rawAns : 'a';

                    // Prepare options list
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
                        explanation_hi: dbq.explanation_hi !== 'None' ? dbq.explanation_hi : undefined
                    };
                } else {
                    // Mapping for the old questions schema
                    return {
                        id: dbq.id,
                        exam_id: dbq.exam_id,
                        subject: dbq.subject,
                        difficulty: dbq.difficulty,
                        text: dbq.text_en,
                        text_kn: dbq.text_kn,
                        options: dbq.options_en.map((optId: string, idx: number) => ({
                            id: String.fromCharCode(97 + idx), // a, b, c, d
                            text: optId,
                            text_kn: dbq.options_kn?.[idx] || undefined
                        })),
                        correct: String.fromCharCode(97 + dbq.correct_index),
                        explanation: dbq.explanation_en,
                        explanation_kn: dbq.explanation_kn
                    };
                }
            });

            // Save back to Zustand
            setActiveSession({ ...activeSession!, questions: formattedQs });
            
            setLoadingQuestions(false);
            const mins = formattedQs.length * (120/100);
            setTimeLeft(Math.round(mins * 60));
            setAnswers(activeSession!.answers || {});
        }

        initTest();
    }, [activeSession?.id, testId, router]); // purposely omitting activeSession to avoid infinite loops on mount when we update it

    useEffect(() => {
        if (loadingQuestions || submitted || !activeSession) return;
        timerRef.current = setInterval(() => {
            setTimeLeft((prev) => {
                if (prev <= 1) { handleSubmit(); return 0; }
                return prev - 1;
            });
        }, 1000);
        return () => { if (timerRef.current) clearInterval(timerRef.current); };
    }, [loadingQuestions, submitted]);

    const handleSubmit = useCallback(() => {
        if (submitted || !activeSession) return;
        setSubmitted(true);
        if (timerRef.current) clearInterval(timerRef.current);

        const questions = activeSession.questions;
        let score = 0;
        let totalMarks = questions.length;
        const negMark = 0; // simplified

        const finalAnswers = { ...answers };
        questions.forEach((q) => {
            if (!finalAnswers[q.id]) {
                finalAnswers[q.id] = { question_id: q.id, marked_for_review: false, time_spent: 0 };
            }
            const ans = finalAnswers[q.id];
            if (ans.selected) {
                if (ans.selected === q.correct) {
                    score += 1;
                    finalAnswers[q.id] = { ...ans, is_correct: true };
                } else {
                    score = Math.max(0, score - negMark);
                    finalAnswers[q.id] = { ...ans, is_correct: false };
                }
            }
        });

        const completedSession = {
            ...activeSession,
            answers: finalAnswers,
            finished_at: new Date().toISOString(),
            score,
            total_marks: totalMarks,
            status: 'completed' as const,
        };

        if (user?.id) {
            const initialTime = Math.round(questions.length * 1.2 * 60);
            supabase.from('test_history').insert({
                user_id: user.id,
                exam_id: activeSession.exam_id,
                score,
                total_marks: totalMarks,
                time_spent: Math.max(0, initialTime - timeLeft),
                config: activeSession.config
            }).then(({ error }) => {
                if (error) console.error("Failed to save test history to Supabase:", error);
            });
        }

        addCompletedSession(completedSession);
        const xp = Math.round((score / totalMarks) * 100);
        syncProgress(xp, completedSession);
        setActiveSession(null);
        router.push(`/results/${testId}`);
    }, [submitted, activeSession, answers, addCompletedSession, syncProgress, setActiveSession, testId, router]);

    if (!activeSession) return null;
    if (loadingQuestions || !activeSession.questions || activeSession.questions.length === 0) {
        return (
            <div style={{ height: '70vh', display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', color: 'var(--text-muted)' }}>
                <Loader2 size={32} strokeWidth={2} style={{ animation: 'spin 1.5s linear infinite', marginBottom: '16px', color: 'var(--accent-indigo)' }} />
                <h3>Preparing your test paper...</h3>
            </div>
        );
    }

    const { questions } = activeSession;
    const question = questions[currentIdx];
    const lang = activeSession.config.language;
    const qText = lang === 'kn' && question.text_kn ? question.text_kn : (lang === 'hi' && question.text_hi ? question.text_hi : question.text);
    const currentAnswer = answers[question.id];
    const isTimeLow = timeLeft < 60;

    const selectOption = (optId: string) => {
        setAnswers((prev) => ({
            ...prev,
            [question.id]: { question_id: question.id, selected: optId, is_correct: undefined, marked_for_review: prev[question.id]?.marked_for_review || false, time_spent: 0 },
        }));
    };

    const toggleMark = () => {
        setAnswers((prev) => ({
            ...prev,
            [question.id]: { ...prev[question.id], question_id: question.id, marked_for_review: !prev[question.id]?.marked_for_review, time_spent: 0 },
        }));
    };

    const getNavColor = (q: typeof question) => {
        const a = answers[q.id];
        if (!a || (!a.selected && !a.marked_for_review)) return 'var(--border)';
        if (a.marked_for_review) return '#F59E0B';
        if (a.selected) return '#10B981';
        return 'var(--border)';
    };

    const answered = Object.values(answers).filter((a) => a.selected).length;
    const marked = Object.values(answers).filter((a) => a.marked_for_review).length;

    return (
        <div style={{ maxWidth: '900px', margin: '0 auto', padding: '16px 24px' }}>
            {/* Top bar */}
            <div className="card" style={{ padding: '12px 20px', marginBottom: '16px', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)' }}>
                    Q {currentIdx + 1} / {questions.length}
                    <span style={{ marginLeft: '12px', opacity: 0.5 }}>Answered: {answered}</span>
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '6px', fontWeight: 700, fontSize: '16px', color: isTimeLow ? '#F43F5E' : 'var(--text-primary)' }}>
                    <Clock size={16} /> {formatTime(timeLeft)}
                </div>
                <div style={{ display: 'flex', gap: '4px', fontSize: '12px' }}>
                    <span style={{ color: '#10B981' }}>✅ {answered}</span>
                    <span style={{ color: '#F59E0B', marginLeft: '8px' }}>📌 {marked}</span>
                    <span style={{ color: 'var(--text-muted)', marginLeft: '8px' }}>⬜ {questions.length - answered - marked}</span>
                </div>
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: '1fr auto', gap: '16px', alignItems: 'start' }}>
                {/* Question card */}
                <div className="card" style={{ padding: '28px' }}>
                    {/* Subject + difficulty tags */}
                    <div style={{ display: 'flex', gap: '8px', marginBottom: '16px' }}>
                        <span className="tag" style={{ background: 'var(--border)', color: 'var(--text-secondary)' }}>{question.subject}</span>
                        <span className={`tag badge-${question.difficulty}`}>{question.difficulty}</span>
                    </div>

                    <p style={{ fontSize: '17px', fontWeight: 500, lineHeight: 1.6, marginBottom: '24px', color: 'var(--text-primary)' }}>{qText}</p>

                    {/* Options */}
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                        {question.options.map((opt) => {
                            const optText = lang === 'kn' && opt.text_kn ? opt.text_kn : (lang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                            const isSelected = currentAnswer?.selected === opt.id;
                            return (
                                <button
                                    key={opt.id}
                                    onClick={() => selectOption(opt.id)}
                                    style={{
                                        display: 'flex', alignItems: 'center', gap: '12px',
                                        padding: '14px 16px', borderRadius: '10px', cursor: 'pointer', textAlign: 'left',
                                        border: `2px solid ${isSelected ? 'var(--accent-indigo)' : 'var(--border)'}`,
                                        background: isSelected ? 'rgba(99,102,241,0.12)' : 'var(--bg-secondary)',
                                        color: 'var(--text-primary)', transition: 'all 0.15s', width: '100%', fontSize: '15px',
                                    }}
                                >
                                    <div style={{
                                        width: 28, height: 28, borderRadius: '50%', display: 'flex', alignItems: 'center',
                                        justifyContent: 'center', fontSize: '13px', fontWeight: 700, flexShrink: 0,
                                        background: isSelected ? 'var(--accent-indigo)' : 'var(--border)',
                                        color: isSelected ? 'white' : 'var(--text-muted)',
                                    }}>{opt.id.toUpperCase()}</div>
                                    {optText}
                                </button>
                            );
                        })}
                    </div>

                    {/* Controls */}
                    <div style={{ display: 'flex', justifyContent: 'space-between', marginTop: '24px', gap: '10px', flexWrap: 'wrap' }}>
                        <div style={{ display: 'flex', gap: '8px' }}>
                            <button onClick={() => setCurrentIdx((i) => Math.max(0, i - 1))} disabled={currentIdx === 0} className="btn btn-secondary" style={{ padding: '10px 16px' }}>
                                <ChevronLeft size={16} /> Prev
                            </button>
                            <button onClick={() => setCurrentIdx((i) => Math.min(questions.length - 1, i + 1))} disabled={currentIdx === questions.length - 1} className="btn btn-secondary" style={{ padding: '10px 16px' }}>
                                Next <ChevronRight size={16} />
                            </button>
                        </div>
                        <div style={{ display: 'flex', gap: '8px' }}>
                            <button onClick={toggleMark} className="btn" style={{
                                padding: '10px 14px', fontSize: '13px',
                                background: currentAnswer?.marked_for_review ? 'rgba(245,158,11,0.15)' : 'transparent',
                                color: currentAnswer?.marked_for_review ? '#F59E0B' : 'var(--text-secondary)',
                                border: `1px solid ${currentAnswer?.marked_for_review ? '#F59E0B' : 'var(--border)'}`,
                            }}>
                                <Flag size={14} /> Mark
                            </button>
                            {currentIdx === questions.length - 1 && (
                                <button onClick={handleSubmit} className="btn btn-primary" style={{ padding: '10px 20px' }}>
                                    <Send size={14} /> Submit
                                </button>
                            )}
                        </div>
                    </div>
                </div>

                {/* Navigator */}
                <div className="card" style={{ padding: '16px', minWidth: '180px' }}>
                    <div style={{ fontSize: '12px', fontWeight: 600, color: 'var(--text-muted)', marginBottom: '10px' }}>NAVIGATOR</div>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(5, 1fr)', gap: '6px' }}>
                        {questions.map((q, i) => (
                            <button
                                key={q.id}
                                onClick={() => setCurrentIdx(i)}
                                style={{
                                    width: 30, height: 30, borderRadius: '6px', border: 'none', cursor: 'pointer',
                                    fontWeight: 600, fontSize: '11px', transition: 'all 0.15s',
                                    background: i === currentIdx ? 'var(--accent-indigo)' : getNavColor(q),
                                    color: i === currentIdx || answers[q.id]?.selected ? 'white' : 'var(--text-muted)',
                                }}
                            >{i + 1}</button>
                        ))}
                    </div>
                    <div style={{ marginTop: '16px', fontSize: '11px', display: 'flex', flexDirection: 'column', gap: '4px', color: 'var(--text-muted)' }}>
                        <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 10, height: 10, borderRadius: '2px', background: '#10B981' }} /> Answered</div>
                        <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 10, height: 10, borderRadius: '2px', background: '#F59E0B' }} /> Marked</div>
                        <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 10, height: 10, borderRadius: '2px', background: 'var(--border)' }} /> Not visited</div>
                    </div>
                    <button onClick={handleSubmit} className="btn btn-primary" style={{ width: '100%', marginTop: '16px', padding: '10px' }}>
                        <Send size={13} /> Submit Test
                    </button>
                </div>
            </div>

            <style>{`
        @media (max-width: 700px) {
          div[style*="grid-template-columns: 1fr auto"] { grid-template-columns: 1fr !important; }
        }
      `}</style>
        </div>
    );
}
