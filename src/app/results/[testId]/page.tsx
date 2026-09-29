'use client';
import { use, useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { CheckCircle, XCircle, MinusCircle, ChevronDown, ChevronUp, RotateCcw, Home, Loader2 } from 'lucide-react';
import QuestionFormatter, { OptionFormatter, ExplanationFormatter } from '@/components/ui/QuestionFormatter';
import PassageCard from '@/components/ui/PassageCard';
import { isValidImageUrl } from '@/lib/imageUtils';
type ReviewFilter = 'all' | 'correct' | 'incorrect' | 'skipped' | 'dropped';

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
    const dropped = questions.filter((q) => q.correct?.toLowerCase() === 'x').length;
    const correct = questions.filter((q) => answers[q.id]?.is_correct === true && q.correct?.toLowerCase() !== 'x').length;
    const incorrect = questions.filter((q) => answers[q.id]?.is_correct === false).length;
    const skipped = questions.filter((q) => !answers[q.id]?.selected && q.correct?.toLowerCase() !== 'x').length;

    const filtered = questions.filter((q) => {
        const a = answers[q.id];
        const isDropped = q.correct?.toLowerCase() === 'x';
        if (filter === 'correct') return a?.is_correct === true || isDropped;
        if (filter === 'incorrect') return a?.is_correct === false;
        if (filter === 'skipped') return !a?.selected && !isDropped;
        if (filter === 'dropped') return isDropped;
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
                    <div style={{ display: 'flex', justifyContent: 'center', gap: '32px', flexWrap: 'wrap' }}>
                        {[
                            { label: 'Correct', value: correct, emoji: '✅', color: 'var(--brand-teal)' },
                            { label: 'Wrong', value: incorrect, emoji: '❌', color: 'var(--brand-orange)' },
                            { label: 'Skipped', value: skipped, emoji: '⏭️', color: 'var(--text-muted)' },
                            ...(dropped > 0 ? [{ label: 'Dropped (Bonus)', value: dropped, emoji: '🎁', color: '#F59E0B' }] : []),
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
                            {(() => {
                                const isUpsc = session?.config?.exam_id === 'upsc-cse' || session?.config?.exam_id === 'upsc-capf';
                                const isKarnataka = session?.config?.exam_id?.startsWith('kpsc') || session?.config?.exam_id?.startsWith('kea') || session?.config?.exam_id?.startsWith('ksp');
                                if (!isUpsc && !isKarnataka) return null;
                                const langOptions = isUpsc ? (['en', 'hi'] as const) : (['en', 'kn'] as const);
                                return (
                                    <div style={{ display: 'flex', gap: '2px', background: 'var(--bg-tertiary)', padding: '2px', borderRadius: '4px', border: '1px solid var(--border)' }}>
                                        {langOptions.map((l) => (
                                            <button
                                                key={l}
                                                onClick={() => setActiveLang(l)}
                                                style={{
                                                    padding: '4px 10px',
                                                    borderRadius: '4px',
                                                    border: activeLang === l ? '1px solid var(--border)' : '1px solid transparent',
                                                    fontSize: '11px',
                                                    fontWeight: 800,
                                                    cursor: 'pointer',
                                                    background: activeLang === l ? '#111827' : 'transparent',
                                                    color: activeLang === l ? '#FFFFFF' : 'var(--text-secondary)',
                                                    boxShadow: activeLang === l ? '1px 1px 0px var(--border)' : 'none',
                                                    transition: 'all 0.15s'
                                                }}
                                            >
                                                {l === 'en' ? '🇬🇧 EN' : l === 'hi' ? '🇮🇳 HI' : '🇮🇳 KN'}
                                            </button>
                                        ))}
                                    </div>
                                );
                            })()}

                            <div style={{ display: 'flex', gap: '4px', flexWrap: 'wrap' }}>
                                {((['all', 'correct', 'incorrect', 'skipped', ...(dropped > 0 ? ['dropped'] : [])]) as ReviewFilter[]).map((f) => {
                                    const isActive = filter === f;
                                    return (
                                        <button key={f} onClick={() => setFilter(f)} style={{
                                            padding: '5px 12px', borderRadius: '4px', border: '1px solid var(--border)', cursor: 'pointer',
                                            fontWeight: 800, fontSize: '12px', textTransform: 'capitalize',
                                            background: isActive ? '#111827' : 'var(--bg-card)',
                                            color: isActive ? '#FFFFFF' : 'var(--text-primary)',
                                            boxShadow: isActive ? '1px 1px 0px var(--border)' : 'none',
                                            transition: 'all 0.15s',
                                        }}>
                                            {f === 'dropped' ? `🎁 Dropped (${dropped})` : f}
                                        </button>
                                    );
                                })}
                            </div>
                        </div>
                    </div>

                    <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                        {filtered.map((q, i) => {
                            const a = answers[q.id];
                            const isDropped = q.correct?.toLowerCase() === 'x';
                            const isCorrect = a?.is_correct || isDropped;
                            const wasSkipped = !a?.selected && !isDropped;
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
                                            {isDropped ? (
                                                <span style={{ fontSize: '15px', lineHeight: 1 }} title="Officially Dropped (Full credit awarded)">🎁</span>
                                            ) : isCorrect ? (
                                                <CheckCircle size={16} color="var(--brand-teal)" />
                                            ) : wasSkipped ? (
                                                <MinusCircle size={16} color="var(--text-muted)" />
                                            ) : (
                                                <XCircle size={16} color="var(--brand-orange)" />
                                            )}
                                        </div>
                                        <div style={{ flex: 1 }}>
                                            <div style={{ fontSize: '11px', color: 'var(--text-muted)', marginBottom: '2px' }}>Q{i + 1} · {lang === 'kn' && q.subject_kannada ? q.subject_kannada : q.subject}</div>
                                            {(q.passage || q.passage_kn || q.passage_hi) && (
                                                <div style={{ marginTop: '6px', marginBottom: '8px' }}>
                                                    <PassageCard
                                                        passage={q.passage}
                                                        passage_kn={q.passage_kn}
                                                        passage_hi={q.passage_hi}
                                                        group_label={q.group_label}
                                                        activeLang={lang}
                                                        compact
                                                    />
                                                </div>
                                            )}
                                            <div style={{ fontWeight: 600 }}>
                                                <QuestionFormatter text={qText} />
                                                {isValidImageUrl(q.image_url) && (
                                                    <div style={{ marginTop: '12px', borderRadius: '8px', overflow: 'hidden', border: '1px solid var(--border)', background: 'var(--bg-card)', display: 'flex', justifyContent: 'center', padding: '12px' }}>
                                                        <img src={q.image_url} alt="Question Diagram" style={{ maxWidth: '100%', maxHeight: '200px', objectFit: 'contain' }} />
                                                    </div>
                                                )}
                                            </div>
                                        </div>
                                        {isOpen ? <ChevronUp size={14} color="var(--text-muted)" /> : <ChevronDown size={14} color="var(--text-muted)" />}
                                    </button>

                                    {isOpen && (
                                        <div style={{ padding: '0 14px 14px 38px' }}>
                                            {isDropped && (
                                                <div style={{
                                                    padding: '10px 14px',
                                                    marginBottom: '14px',
                                                    borderRadius: '8px',
                                                    background: 'rgba(245, 158, 11, 0.12)',
                                                    border: '1px solid #F59E0B',
                                                    color: '#D97706',
                                                    display: 'flex',
                                                    alignItems: 'flex-start',
                                                    gap: '8px'
                                                }}>
                                                    <span style={{ fontSize: '16px', lineHeight: '18px' }}>⚠️</span>
                                                    <div>
                                                        <div style={{ fontWeight: 700, fontSize: '13px' }}>Official Commission Dropped Question (Answer Key: 'X')</div>
                                                        <div style={{ fontSize: '12px', color: 'var(--text-secondary)', marginTop: '2px', lineHeight: 1.4 }}>
                                                            This question was cancelled / invalidated by the official commission in the final published answer key. Full credit (+1.0) has been awarded with zero negative marking.
                                                        </div>
                                                    </div>
                                                </div>
                                            )}
                                            {(() => {
                                                const isShortOptions = (q.options?.length || 0) <= 4 && q.options?.every((opt) => {
                                                    const optText = lang === 'kn' && opt.text_kn ? opt.text_kn : (lang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                                                    return (optText?.trim().length || 0) <= 36 && !optText?.includes('\n');
                                                });

                                                return (
                                                    <div style={{
                                                        display: isShortOptions ? 'grid' : 'flex',
                                                        gridTemplateColumns: isShortOptions ? 'repeat(auto-fit, minmax(280px, 1fr))' : undefined,
                                                        flexDirection: isShortOptions ? undefined : 'column',
                                                        gap: '8px',
                                                        marginBottom: '14px'
                                                    }}>
                                                        {q.options.map((opt) => {
                                                            const optText = lang === 'kn' && opt.text_kn ? opt.text_kn : (lang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                                                            const isCorrectOpt = opt.id === q.correct;
                                                            const isSelectedOpt = opt.id === a?.selected;
                                                            let bg = 'var(--bg-card-solid)';
                                                            let border = '1px solid var(--border)';
                                                            let badgeBg = 'var(--bg-tertiary)';
                                                            let badgeCol = 'var(--text-primary)';

                                                            if (isCorrectOpt) {
                                                                bg = 'rgba(16, 185, 129, 0.12)';
                                                                border = '1px solid #10B981';
                                                                badgeBg = '#10B981';
                                                                badgeCol = 'white';
                                                            } else if (isSelectedOpt) {
                                                                bg = 'rgba(225, 29, 72, 0.12)';
                                                                border = '1px solid #E11D48';
                                                                badgeBg = '#E11D48';
                                                                badgeCol = 'white';
                                                            }

                                                            return (
                                                                <div key={opt.id} style={{
                                                                    padding: '12px 16px', borderRadius: '12px', display: 'flex', alignItems: 'center', gap: '12px',
                                                                    background: bg, border: border, transition: 'all 0.15s'
                                                                }}>
                                                                    <div style={{
                                                                        width: 30, height: 30, borderRadius: '8px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                                                                        fontSize: '13px', fontWeight: 800, flexShrink: 0,
                                                                        background: badgeBg, color: badgeCol, border: isCorrectOpt || isSelectedOpt ? 'none' : '1px solid var(--border)'
                                                                    }}>
                                                                        {opt.id.toUpperCase()}
                                                                    </div>
                                                                    <div style={{ flex: 1 }}>
                                                                        <OptionFormatter text={optText} />
                                                                    </div>
                                                                    {isCorrectOpt && <span style={{ fontSize: '16px' }}>✅</span>}
                                                                    {isSelectedOpt && !isCorrectOpt && <span style={{ fontSize: '16px' }}>❌</span>}
                                                                </div>
                                                            );
                                                        })}
                                                    </div>
                                                );
                                            })()}
                                            <div style={{ background: 'var(--bg-card)', borderRadius: '12px', padding: '16px', border: '1px solid var(--border)', boxShadow: 'var(--shadow-sm)' }}>
                                                <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--brand-orange)', marginBottom: '8px', textTransform: 'uppercase', letterSpacing: '0.05em' }}>💡 Explanation</div>
                                                <div>
                                                    <ExplanationFormatter text={expText} />
                                                </div>
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
