'use client';
import { use, useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { CheckCircle, XCircle, MinusCircle, ChevronDown, ChevronUp, RotateCcw, Home, Loader2 } from 'lucide-react';
import QuestionFormatter from '@/components/ui/QuestionFormatter';
type ReviewFilter = 'all' | 'correct' | 'incorrect' | 'skipped';

export default function ResultsPage({ params }: { params: Promise<{ testId: string }> }) {
    const { testId } = use(params);
    const router = useRouter();
    const { completedSessions, setActiveSession } = useAppStore();
    const session = completedSessions.find((s) => s.id === testId);

    const [filter, setFilter] = useState<ReviewFilter>('all');
    const [expanded, setExpanded] = useState<string | null>(null);
    const [exam, setExam] = useState<any>(null);
    const [loadingExam, setLoadingExam] = useState(true);
    const [activeLang, setActiveLang] = useState<'en' | 'kn' | 'hi'>('en');

    useEffect(() => {
        if (session?.config?.language) {
            setActiveLang(session.config.language);
        }
    }, [session?.config?.language]);

    useEffect(() => {
        if (!session) { router.push('/exams'); return; }
        async function loadExam() {
            setLoadingExam(true);
            const { data } = await supabase.from('exams').select('id, title').eq('id', session!.exam_id).single();
            if (data) setExam({ name: data.title, icon: data.id.includes('upsc') ? '🏛️' : data.id.includes('kpsc') ? '🅺' : '📋' });
            setLoadingExam(false);
        }
        loadExam();
    }, [session, router]);

    if (!session || loadingExam) return (
        <div style={{ padding: '80px', textAlign: 'center', color: 'var(--text-muted)', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
            <Loader2 className="animate-spin" size={28} style={{ marginBottom: '12px', color: 'var(--brand-orange)' }} />
            Loading results...
        </div>
    );

    const { questions, answers, score = 0, total_marks = 0, config } = session;
    const lang = activeLang;
    const pct = total_marks > 0 ? Math.round((score / total_marks) * 100) : 0;
    const correct = questions.filter((q) => answers[q.id]?.is_correct === true).length;
    const incorrect = questions.filter((q) => answers[q.id]?.is_correct === false).length;
    const skipped = questions.filter((q) => !answers[q.id]?.selected).length;

    const filtered = questions.filter((q) => {
        const a = answers[q.id];
        if (filter === 'correct') return a?.is_correct === true;
        if (filter === 'incorrect') return a?.is_correct === false;
        if (filter === 'skipped') return !a?.selected;
        return true;
    });

    const wrongQuestions = questions.filter((q) => answers[q.id]?.is_correct === false);
    const retryWrong = () => {
        if (!wrongQuestions.length) return;
        const retrySession = { id: `session_${Date.now()}`, user_id: session.user_id, exam_id: session.exam_id, config: { ...config, question_count: wrongQuestions.length }, questions: wrongQuestions, answers: {}, started_at: new Date().toISOString(), status: 'active' as const };
        setActiveSession(retrySession);
        router.push(`/test/${retrySession.id}`);
    };

    const scoreColor = pct >= 60 ? 'var(--accent-sage)' : pct >= 40 ? 'var(--accent-peach)' : 'rgba(225, 29, 72, 0.1)';

    const subjects = [...new Set(questions.map((q) => q.subject))];
    const subjectStats = subjects.map((s) => {
        const qs = questions.filter((q) => q.subject === s);
        const c = qs.filter((q) => answers[q.id]?.is_correct).length;
        return { subject: s, correct: c, total: qs.length, pct: Math.round((c / qs.length) * 100) };
    });

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '40px 0' }}>
            <div style={{ maxWidth: '880px', margin: '0 auto', padding: '0 24px' }}>
                {/* Score */}
                <div className="card" style={{ padding: '32px', textAlign: 'center', marginBottom: '20px' }}>
                    <div style={{ fontSize: '14px', color: 'var(--text-secondary)', marginBottom: '20px', fontWeight: 500 }}>
                        {exam?.icon} {exam?.name} · {config.mode === 'subject' ? config.subject : 'Full'}
                    </div>
                    <div style={{
                        width: '110px', height: '110px', borderRadius: '50%', background: scoreColor,
                        display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center',
                        margin: '0 auto 20px',
                    }}>
                        <div style={{ fontSize: '32px', fontWeight: 800, color: 'var(--text-primary)' }}>{pct}%</div>
                        <div style={{ fontSize: '11px', color: 'var(--text-secondary)', fontWeight: 600 }}>Score</div>
                    </div>
                    <div style={{ fontSize: '15px', fontWeight: 600, marginBottom: '24px' }}>{score}/{total_marks} marks</div>
                    <div style={{ display: 'flex', justifyContent: 'center', gap: '32px' }}>
                        {[
                            { label: 'Correct', value: correct, emoji: '✅', color: 'var(--brand-teal)' },
                            { label: 'Wrong', value: incorrect, emoji: '❌', color: 'var(--brand-orange)' },
                            { label: 'Skipped', value: skipped, emoji: '⏭️', color: 'var(--text-muted)' },
                        ].map((s) => (
                            <div key={s.label} style={{ textAlign: 'center' }}>
                                <div style={{ fontSize: '22px', fontWeight: 800, color: s.color }}>{s.value}</div>
                                <div style={{ fontSize: '12px', color: 'var(--text-secondary)' }}>{s.emoji} {s.label}</div>
                            </div>
                        ))}
                    </div>
                </div>

                {/* Subject breakdown */}
                <div className="card" style={{ padding: '24px', marginBottom: '20px' }}>
                    <h2 style={{ fontWeight: 700, fontSize: '16px', marginBottom: '16px' }}>📊 Subject Breakdown</h2>
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '14px' }}>
                        {subjectStats.map((s) => (
                            <div key={s.subject}>
                                <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '13px', marginBottom: '6px' }}>
                                    <span style={{ fontWeight: 600 }}>{s.subject}</span>
                                    <span style={{ fontWeight: 600, color: s.pct >= 60 ? 'var(--brand-teal)' : 'var(--brand-orange)' }}>{s.correct}/{s.total}</span>
                                </div>
                                <div className="progress-bar" style={{ height: '6px' }}>
                                    <div className="progress-fill" style={{ width: `${s.pct}%`, background: s.pct >= 60 ? 'var(--brand-teal)' : s.pct >= 40 ? '#F59E0B' : 'var(--brand-orange)' }} />
                                </div>
                            </div>
                        ))}
                    </div>
                </div>

                {/* Actions */}
                <div style={{ display: 'flex', gap: '8px', marginBottom: '20px', flexWrap: 'wrap' }}>
                    <Link href="/exams" className="btn btn-secondary" style={{ padding: '8px 16px' }}><Home size={14} /> New Test</Link>
                    {wrongQuestions.length > 0 && (
                        <button onClick={retryWrong} className="btn btn-primary" style={{ padding: '8px 16px' }}>
                            <RotateCcw size={14} /> Retry {wrongQuestions.length} Wrong
                        </button>
                    )}
                </div>

                {/* Review */}
                <div className="card" style={{ padding: '24px' }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '16px', flexWrap: 'wrap', gap: '12px' }}>
                        <h2 style={{ fontWeight: 700, fontSize: '16px' }}>📝 Review</h2>
                        <div style={{ display: 'flex', gap: '12px', alignItems: 'center', flexWrap: 'wrap' }}>
                            {/* Language switcher */}
                            {(session?.config?.exam_id?.startsWith('kpsc') || session?.config?.exam_id?.startsWith('kea') || session?.config?.exam_id === 'upsc-cse') && (
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
                            )}

                            <div style={{ display: 'flex', gap: '4px' }}>
                                {(['all', 'correct', 'incorrect', 'skipped'] as ReviewFilter[]).map((f) => (
                                    <button key={f} onClick={() => setFilter(f)} style={{
                                        padding: '5px 12px', borderRadius: '8px', border: 'none', cursor: 'pointer',
                                        fontWeight: 600, fontSize: '12px', textTransform: 'capitalize',
                                        background: filter === f ? 'var(--brand-orange)' : 'var(--bg-secondary)',
                                        color: filter === f ? 'white' : 'var(--text-secondary)', transition: 'all 0.15s',
                                    }}>{f}</button>
                                ))}
                            </div>
                        </div>
                    </div>

                    <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                        {filtered.map((q, i) => {
                            const a = answers[q.id];
                            const isCorrect = a?.is_correct;
                            const wasSkipped = !a?.selected;
                            const isOpen = expanded === q.id;
                            const qText = lang === 'kn' && q.text_kn ? q.text_kn : (lang === 'hi' && q.text_hi ? q.text_hi : q.text);
                            const expText = lang === 'kn' && q.explanation_kn ? q.explanation_kn : (lang === 'hi' && q.explanation_hi ? q.explanation_hi : q.explanation);

                            return (
                                <div key={q.id} style={{ background: 'var(--bg-secondary)', borderRadius: '10px', overflow: 'hidden' }}>
                                    <button onClick={() => setExpanded(isOpen ? null : q.id)} style={{
                                        width: '100%', padding: '12px 14px', display: 'flex', alignItems: 'flex-start', gap: '10px',
                                        background: 'none', border: 'none', cursor: 'pointer', textAlign: 'left', color: 'var(--text-primary)',
                                    }}>
                                        <div style={{ flexShrink: 0, marginTop: '2px' }}>
                                            {isCorrect ? <CheckCircle size={16} color="var(--brand-teal)" /> : wasSkipped ? <MinusCircle size={16} color="var(--text-muted)" /> : <XCircle size={16} color="var(--brand-orange)" />}
                                        </div>
                                        <div style={{ flex: 1 }}>
                                            <div style={{ fontSize: '11px', color: 'var(--text-muted)', marginBottom: '2px' }}>Q{i + 1} · {q.subject}</div>
                                            <div style={{ fontWeight: 600 }}>
                                                <QuestionFormatter text={qText} />
                                            </div>
                                        </div>
                                        {isOpen ? <ChevronUp size={14} color="var(--text-muted)" /> : <ChevronDown size={14} color="var(--text-muted)" />}
                                    </button>

                                    {isOpen && (
                                        <div style={{ padding: '0 14px 14px 38px' }}>
                                            <div style={{ display: 'flex', flexDirection: 'column', gap: '6px', marginBottom: '12px' }}>
                                                {q.options.map((opt) => {
                                                    const optText = lang === 'kn' && opt.text_kn ? opt.text_kn : (lang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                                                    const isCorrectOpt = opt.id === q.correct;
                                                    const isSelectedOpt = opt.id === a?.selected;
                                                    let bg = 'var(--bg-card)'; let col = 'var(--text-secondary)';
                                                    if (isCorrectOpt) { bg = 'var(--accent-sage)'; col = '#0D5D56'; }
                                                    else if (isSelectedOpt) { bg = 'var(--accent-peach)'; col = '#8B4513'; }
                                                    return (
                                                        <div key={opt.id} style={{ padding: '8px 12px', borderRadius: '8px', fontSize: '13px', display: 'flex', gap: '8px', background: bg, color: col, fontWeight: isCorrectOpt || isSelectedOpt ? 600 : 400 }}>
                                                            <span style={{ fontWeight: 700 }}>{opt.id.toUpperCase()}.</span> {optText}
                                                            {isCorrectOpt && <span style={{ marginLeft: 'auto' }}>✅</span>}
                                                            {isSelectedOpt && !isCorrectOpt && <span style={{ marginLeft: 'auto' }}>❌</span>}
                                                        </div>
                                                    );
                                                })}
                                            </div>
                                            <div style={{ background: 'var(--bg-card)', borderRadius: '8px', padding: '12px', boxShadow: 'var(--shadow-sm)' }}>
                                                <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--brand-orange)', marginBottom: '4px', textTransform: 'uppercase' }}>💡 Explanation</div>
                                                <p style={{ fontSize: '13px', color: 'var(--text-secondary)', lineHeight: 1.5, whiteSpace: 'pre-line' }}>{expText}</p>
                                            </div>
                                        </div>
                                    )}
                                </div>
                            );
                        })}
                    </div>
                </div>
            </div>
        </div>
    );
}
