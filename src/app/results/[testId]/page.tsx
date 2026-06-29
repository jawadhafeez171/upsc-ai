'use client';
import { use, useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { CheckCircle, XCircle, MinusCircle, ChevronDown, ChevronUp, RotateCcw, Home, Loader2 } from 'lucide-react';

type ReviewFilter = 'all' | 'correct' | 'incorrect' | 'skipped' | 'marked';

export default function ResultsPage({ params }: { params: Promise<{ testId: string }> }) {
    const { testId } = use(params);
    const router = useRouter();
    const { completedSessions, setActiveSession } = useAppStore();
    const session = completedSessions.find((s) => s.id === testId);

    const [filter, setFilter] = useState<ReviewFilter>('all');
    const [expanded, setExpanded] = useState<string | null>(null);
    const [exam, setExam] = useState<any>(null);
    const [loadingExam, setLoadingExam] = useState(true);

    useEffect(() => { 
        if (!session) { router.push('/exams'); return; }
        
        async function loadExam() {
            setLoadingExam(true);
            const { data } = await supabase.from('exams').select('id, title').eq('id', session!.exam_id).single();
            if (data) {
                setExam({ 
                    name: data.title, 
                    icon: data.id.includes('upsc') ? '🏛️' : data.id.includes('kpsc') ? '🅺' : '📋' 
                });
            }
            setLoadingExam(false);
        }
        loadExam();
    }, [session, router]);

    if (!session || loadingExam) return (
        <div style={{ padding: '80px', textAlign: 'center', color: 'var(--text-muted)', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
            <Loader2 className="animate-spin" size={32} style={{ marginBottom: '16px', color: 'var(--accent-indigo)' }} />
            Loading your results...
        </div>
    );

    const { questions, answers, score = 0, total_marks = 0, config } = session;
    const lang = config.language;
    const pct = total_marks > 0 ? Math.round((score / total_marks) * 100) : 0;

    const correct = questions.filter((q) => answers[q.id]?.is_correct === true).length;
    const incorrect = questions.filter((q) => answers[q.id]?.is_correct === false).length;
    const skipped = questions.filter((q) => !answers[q.id]?.selected).length;

    const filtered = questions.filter((q) => {
        const a = answers[q.id];
        if (filter === 'correct') return a?.is_correct === true;
        if (filter === 'incorrect') return a?.is_correct === false;
        if (filter === 'skipped') return !a?.selected;
        if (filter === 'marked') return a?.marked_for_review === true;
        return true;
    });

    const wrongQuestions = questions.filter((q) => answers[q.id]?.is_correct === false);

    const retryWrong = () => {
        if (!wrongQuestions.length) return;
        const retrySession = {
            id: `session_${Date.now()}`,
            user_id: session.user_id,
            exam_id: session.exam_id,
            config: { ...config, question_count: wrongQuestions.length },
            questions: wrongQuestions,
            answers: {},
            started_at: new Date().toISOString(),
            status: 'active' as const,
        };
        setActiveSession(retrySession);
        router.push(`/test/${retrySession.id}`);
    };

    const scoreColor = pct >= 60 ? '#10B981' : pct >= 40 ? '#F59E0B' : '#F43F5E';

    // Subject-wise breakdown
    const subjects = [...new Set(questions.map((q) => q.subject))];
    const subjectStats = subjects.map((s) => {
        const qs = questions.filter((q) => q.subject === s);
        const c = qs.filter((q) => answers[q.id]?.is_correct).length;
        return { subject: s, correct: c, total: qs.length, pct: Math.round((c / qs.length) * 100) };
    });

    return (
        <div style={{ maxWidth: '900px', margin: '0 auto', padding: '32px 24px' }}>
            {/* Score hero */}
            <div className="card gradient-border" style={{ padding: '40px', textAlign: 'center', marginBottom: '24px' }}>
                <div style={{ fontSize: '14px', color: 'var(--text-muted)', marginBottom: '8px' }}>{exam?.icon} {exam?.name} · {config.mode === 'subject' ? config.subject : 'Full Mock'}</div>
                <div style={{ fontSize: '72px', fontWeight: 900, color: scoreColor, lineHeight: 1 }}>{pct}%</div>
                <div style={{ fontSize: '18px', color: 'var(--text-muted)', margin: '8px 0 24px' }}>{score} / {total_marks} marks</div>
                <div style={{ display: 'flex', justifyContent: 'center', gap: '32px', flexWrap: 'wrap' }}>
                    <div style={{ textAlign: 'center' }}>
                        <div style={{ fontSize: '24px', fontWeight: 800, color: '#10B981' }}>{correct}</div>
                        <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>Correct ✅</div>
                    </div>
                    <div style={{ textAlign: 'center' }}>
                        <div style={{ fontSize: '24px', fontWeight: 800, color: '#F43F5E' }}>{incorrect}</div>
                        <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>Incorrect ❌</div>
                    </div>
                    <div style={{ textAlign: 'center' }}>
                        <div style={{ fontSize: '24px', fontWeight: 800, color: 'var(--text-muted)' }}>{skipped}</div>
                        <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>Skipped ⏭️</div>
                    </div>
                </div>
            </div>

            {/* Subject breakdown */}
            <div className="card" style={{ padding: '24px', marginBottom: '24px' }}>
                <h2 style={{ fontWeight: 700, marginBottom: '16px' }}>📊 Subject-wise Performance</h2>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                    {subjectStats.map((s) => (
                        <div key={s.subject}>
                            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '13px', marginBottom: '6px' }}>
                                <span style={{ fontWeight: 600 }}>{s.subject}</span>
                                <span style={{ color: s.pct >= 60 ? '#10B981' : s.pct >= 40 ? '#F59E0B' : '#F43F5E' }}>{s.correct}/{s.total} ({s.pct}%)</span>
                            </div>
                            <div className="progress-bar">
                                <div className="progress-fill" style={{ width: `${s.pct}%`, background: s.pct >= 60 ? '#10B981' : s.pct >= 40 ? '#F59E0B' : '#F43F5E' }} />
                            </div>
                        </div>
                    ))}
                </div>
            </div>

            {/* Actions */}
            <div style={{ display: 'flex', gap: '10px', marginBottom: '24px', flexWrap: 'wrap' }}>
                <Link href="/exams" className="btn btn-secondary">
                    <Home size={14} /> New Test
                </Link>
                {wrongQuestions.length > 0 && (
                    <button onClick={retryWrong} className="btn btn-primary">
                        <RotateCcw size={14} /> Retry {wrongQuestions.length} Wrong Questions
                    </button>
                )}
                <Link href="/dashboard" className="btn btn-secondary">📊 Dashboard</Link>
            </div>

            {/* Review section */}
            <div className="card" style={{ padding: '24px' }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '16px', flexWrap: 'wrap', gap: '10px' }}>
                    <h2 style={{ fontWeight: 700 }}>📝 Answer Review</h2>
                    <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                        {(['all', 'correct', 'incorrect', 'skipped'] as ReviewFilter[]).map((f) => (
                            <button key={f} onClick={() => setFilter(f)} style={{
                                padding: '6px 12px', borderRadius: '6px', border: 'none', cursor: 'pointer',
                                fontWeight: 600, fontSize: '12px', textTransform: 'capitalize',
                                background: filter === f ? 'var(--accent-indigo)' : 'var(--bg-secondary)',
                                color: filter === f ? 'white' : 'var(--text-muted)', transition: 'all 0.2s',
                            }}>
                                {f === 'correct' ? '✅' : f === 'incorrect' ? '❌' : f === 'skipped' ? '⏭️' : '📋'} {f}
                            </button>
                        ))}
                    </div>
                </div>

                <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                    {filtered.map((q, i) => {
                        const a = answers[q.id];
                        const isCorrect = a?.is_correct;
                        const wasSkipped = !a?.selected;
                        const isOpen = expanded === q.id;
                        const qText = lang === 'kn' && q.text_kn ? q.text_kn : (lang === 'hi' && q.text_hi ? q.text_hi : q.text);
                        const correctOpt = q.options.find((o) => o.id === q.correct);
                        const selectedOpt = a?.selected ? q.options.find((o) => o.id === a.selected) : null;
                        const expText = lang === 'kn' && q.explanation_kn ? q.explanation_kn : (lang === 'hi' && q.explanation_hi ? q.explanation_hi : q.explanation);

                        return (
                            <div key={q.id} style={{ background: 'var(--bg-secondary)', borderRadius: '10px', overflow: 'hidden', border: `1px solid ${isCorrect ? 'rgba(16,185,129,0.2)' : wasSkipped ? 'var(--border)' : 'rgba(244,63,94,0.2)'}` }}>
                                <button onClick={() => setExpanded(isOpen ? null : q.id)} style={{
                                    width: '100%', padding: '14px 16px', display: 'flex', alignItems: 'flex-start', gap: '12px',
                                    background: 'none', border: 'none', cursor: 'pointer', textAlign: 'left', color: 'var(--text-primary)',
                                }}>
                                    <div style={{ flexShrink: 0, marginTop: '2px' }}>
                                        {isCorrect ? <CheckCircle size={18} color="#10B981" /> : wasSkipped ? <MinusCircle size={18} color="#64748B" /> : <XCircle size={18} color="#F43F5E" />}
                                    </div>
                                    <div style={{ flex: 1 }}>
                                        <div style={{ fontSize: '12px', color: 'var(--text-muted)', marginBottom: '4px' }}>
                                            Q{i + 1} · {q.subject} · <span className={`badge-${q.difficulty}`} style={{ padding: '1px 6px', borderRadius: '4px', fontSize: '10px' }}>{q.difficulty}</span>
                                        </div>
                                        <p style={{ fontSize: '14px', lineHeight: 1.5 }}>{qText}</p>
                                    </div>
                                    {isOpen ? <ChevronUp size={16} color="var(--text-muted)" /> : <ChevronDown size={16} color="var(--text-muted)" />}
                                </button>

                                {isOpen && (
                                    <div style={{ padding: '0 16px 16px 46px' }}>
                                        <div style={{ display: 'flex', flexDirection: 'column', gap: '6px', marginBottom: '12px' }}>
                                            {q.options.map((opt) => {
                                                const optText = lang === 'kn' && opt.text_kn ? opt.text_kn : (lang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                                                const isCorrectOpt = opt.id === q.correct;
                                                const isSelectedOpt = opt.id === a?.selected;
                                                return (
                                                    <div key={opt.id} style={{
                                                        padding: '10px 14px', borderRadius: '8px', fontSize: '14px', display: 'flex', gap: '10px',
                                                        background: isCorrectOpt ? 'rgba(16,185,129,0.1)' : isSelectedOpt && !isCorrectOpt ? 'rgba(244,63,94,0.1)' : 'var(--bg-card)',
                                                        border: `1px solid ${isCorrectOpt ? 'rgba(16,185,129,0.3)' : isSelectedOpt ? 'rgba(244,63,94,0.3)' : 'transparent'}`,
                                                        color: isCorrectOpt ? '#10B981' : isSelectedOpt ? '#F43F5E' : 'var(--text-secondary)',
                                                    }}>
                                                        <span style={{ fontWeight: 700 }}>{opt.id.toUpperCase()}.</span> {optText}
                                                        {isCorrectOpt && <span style={{ marginLeft: 'auto' }}>✅</span>}
                                                        {isSelectedOpt && !isCorrectOpt && <span style={{ marginLeft: 'auto' }}>❌</span>}
                                                    </div>
                                                );
                                            })}
                                        </div>
                                        <div style={{ background: 'rgba(99,102,241,0.08)', border: '1px solid rgba(99,102,241,0.15)', borderRadius: '8px', padding: '12px' }}>
                                            <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--accent-indigo)', marginBottom: '6px' }}>📖 Explanation</div>
                                            <p style={{ fontSize: '13px', color: 'var(--text-secondary)', lineHeight: 1.6 }}>{expText}</p>
                                        </div>
                                    </div>
                                )}
                            </div>
                        );
                    })}
                </div>
            </div>
        </div>
    );
}
