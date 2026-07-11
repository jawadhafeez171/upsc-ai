'use client';
import { use, useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { Clock, Flag, ChevronLeft, ChevronRight, Loader2 } from 'lucide-react';
import { Question } from '@/types';

export default function TestPage({ params }: { params: Promise<{ testId: string }> }) {
    const { testId } = use(params);
    const router = useRouter();
    const { activeSession, addCompletedSession, setActiveSession } = useAppStore();

    const [questions, setQuestions] = useState<Question[]>([]);
    const [answers, setAnswers] = useState<Record<string, { question_id: string; selected?: string; marked_for_review: boolean; is_correct?: boolean; time_spent: number }>>({});
    const [currentIdx, setCurrentIdx] = useState(0);
    const [timeLeft, setTimeLeft] = useState(0);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        if (!activeSession || activeSession.id !== testId) { router.push('/exams'); return; }
        async function fetchQuestions() {
            setLoading(true);
            const { config } = activeSession!;
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
                    const tables = Object.values(SubjectTableMap);
                    const results = await Promise.all(tables.map(t => fetchCandidateIds(t)));
                    candidates = results.flat();
                }

                if (candidates.length > 0) {
                    const shuffledCandidates = [...candidates].sort(() => Math.random() - 0.5);
                    const selectedCandidates = shuffledCandidates.slice(0, Math.min(config.question_count, candidates.length));

                    const groupedByTable: Record<string, string[]> = {};
                    selectedCandidates.forEach(c => {
                        if (!groupedByTable[c.tableName]) groupedByTable[c.tableName] = [];
                        groupedByTable[c.tableName].push(c.content_key);
                    });

                    const fetchFullRows = Object.entries(groupedByTable).map(async ([tableName, keys]) => {
                        const { data } = await supabase.from(tableName).select('*').in('content_key', keys);
                        return (data || []).map(row => ({ ...row, _source_table: tableName }));
                    });

                    const fullRowsResult = await Promise.all(fetchFullRows);
                    selectedRawQuestions = fullRowsResult.flat();
                }
            } else {
                let query = supabase.from('questions').select('*').eq('exam_id', config.exam_id);
                if (config.mode === 'subject' && config.subject) query = query.eq('subject', config.subject);
                if (config.difficulty && config.difficulty !== 'mixed') query = query.eq('difficulty', config.difficulty);
                const { data } = await query;
                if (data) selectedRawQuestions = data;
            }

            if (selectedRawQuestions.length > 0) {
                const shuffledFinal = [...selectedRawQuestions].sort(() => Math.random() - 0.5);
                const diffOrder: Record<string, number> = { easy: 0, medium: 1, hard: 2 };
                shuffledFinal.sort((a, b) => {
                    const subA = a.subject_name || a.subject || '';
                    const subB = b.subject_name || b.subject || '';
                    const diffA = (a.difficulty || 'medium').toLowerCase();
                    const diffB = (b.difficulty || 'medium').toLowerCase();
                    if (subA !== subB) return subA.localeCompare(subB);
                    return (diffOrder[diffA] ?? 1) - (diffOrder[diffB] ?? 1);
                });

                const formattedQs: Question[] = shuffledFinal.map((dbq) => {
                    const isPyqSchema = !!dbq.content_key;
                    if (isPyqSchema) {
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
                            explanation_hi: dbq.explanation_hi !== 'None' ? dbq.explanation_hi : undefined
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
                            explanation_hi: dbq.explanation_hi
                        };
                    }
                });
                setQuestions(formattedQs);
                setTimeLeft(formattedQs.length * 72);
                setActiveSession({ ...activeSession!, questions: formattedQs });
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
    const lang = activeSession!.config.language;
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
                            <span className="tag chip-sky">{question.subject}</span>
                            <span className={`tag badge-${question.difficulty}`}>{question.difficulty}</span>
                        </div>
                        <p style={{ fontSize: '16px', fontWeight: 600, lineHeight: 1.6, marginBottom: '24px', color: 'var(--text-primary)' }}>{qText}</p>

                        <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                            {question.options.map((opt) => {
                                const optText = lang === 'kn' && opt.text_kn ? opt.text_kn : (lang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                                const isSelected = currentAnswer?.selected === opt.id;
                                return (
                                    <button key={opt.id} onClick={() => selectOption(opt.id)} style={{
                                        display: 'flex', alignItems: 'center', gap: '10px', padding: '12px 14px',
                                        borderRadius: '10px', cursor: 'pointer', textAlign: 'left', width: '100%',
                                        border: 'none',
                                        background: isSelected ? 'var(--accent-peach)' : 'var(--bg-secondary)',
                                        color: 'var(--text-primary)', transition: 'all 0.15s', fontSize: '14px',
                                        fontWeight: isSelected ? 600 : 400,
                                    }}>
                                        <div style={{
                                            width: 26, height: 26, borderRadius: '8px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                                            fontSize: '12px', fontWeight: 700, flexShrink: 0,
                                            background: isSelected ? 'var(--brand-orange)' : 'var(--bg-card)',
                                            color: isSelected ? 'white' : 'var(--text-secondary)',
                                            boxShadow: isSelected ? 'none' : 'var(--shadow-sm)',
                                        }}>{opt.id.toUpperCase()}</div>
                                        {optText}
                                    </button>
                                );
                            })}
                        </div>

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
                                }}>{i + 1}</button>
                            ))}
                        </div>
                        <div style={{ marginTop: '16px', fontSize: '11px', display: 'flex', flexDirection: 'column', gap: '6px', color: 'var(--text-muted)' }}>
                            <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 10, height: 10, borderRadius: '4px', background: 'var(--accent-sage)' }} /> Answered</div>
                            <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 10, height: 10, borderRadius: '4px', background: 'var(--accent-peach)' }} /> Marked</div>
                            <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}><div style={{ width: 10, height: 10, borderRadius: '4px', background: 'var(--bg-secondary)' }} /> Not visited</div>
                        </div>
                        <button onClick={handleSubmit} className="btn btn-primary" style={{ width: '100%', marginTop: '16px', padding: '10px' }}>
                            Submit Test
                        </button>
                    </div>
                </div>
            </div>
        </div>
    );
}
