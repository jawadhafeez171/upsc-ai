'use client';
import { use, useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAppStore, useStoreHydrated } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import {
    CheckCircle,
    XCircle,
    MinusCircle,
    ChevronDown,
    ChevronUp,
    RotateCcw,
    Home,
    Loader2,
    Check,
    X,
    AlertTriangle,
    Gift,
    BookOpen,
    BarChart3,
    Clock,
    Target
} from 'lucide-react';
import QuestionFormatter, { OptionFormatter, ExplanationFormatter } from '@/components/ui/QuestionFormatter';
import PassageCard from '@/components/ui/PassageCard';
import { isValidImageUrl } from '@/lib/imageUtils';

type ReviewFilter = 'all' | 'correct' | 'incorrect' | 'skipped' | 'dropped';

export default function ResultsPage({ params }: { params: Promise<{ testId: string }> }) {
    const { testId } = use(params);
    const router = useRouter();
    const { completedSessions, setActiveSession } = useAppStore();
    const session = completedSessions.find((s) => s.id === testId);
    const hydrated = useStoreHydrated();

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
        if (!hydrated) return;
        if (!session) {
            router.replace('/exams');
            return;
        }
        async function loadExam() {
            setLoadingExam(true);
            const { data } = await supabase.from('exams').select('id, title').eq('id', session!.exam_id).single();
            if (data) {
                setExam({ name: data.title });
            }
            setLoadingExam(false);
        }
        loadExam();
    }, [hydrated, session, router]);

    if (!session || loadingExam) {
        return (
            <div style={{ padding: '80px', textAlign: 'center', color: 'var(--text-muted)', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
                <Loader2 className="animate-spin" size={28} style={{ marginBottom: '12px', color: '#2563EB' }} />
                <span>Loading examination results...</span>
            </div>
        );
    }

    const { questions, answers, score = 0, total_marks = 0, config } = session;
    const lang = activeLang;
    const pct = total_marks > 0 ? Math.round((score / total_marks) * 100) : 0;
    const dropped = questions.filter((q) => q.correct?.toLowerCase() === 'x').length;
    const correct = questions.filter((q) => answers[q.id]?.is_correct === true && q.correct?.toLowerCase() !== 'x').length;
    const incorrect = questions.filter((q) => answers[q.id]?.is_correct === false).length;
    const skipped = questions.filter((q) => !answers[q.id]?.selected && q.correct?.toLowerCase() !== 'x').length;
    const attempted = correct + incorrect;
    const accuracy = attempted > 0 ? Math.round((correct / attempted) * 100) : 0;
    const tone = (p: number) => (p >= 60 ? 'var(--success-text)' : p >= 40 ? 'var(--warning-text)' : 'var(--danger-text)');

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
        const retrySession = {
            id: `session_${Date.now()}`,
            user_id: session.user_id,
            exam_id: session.exam_id,
            config: { ...config, question_count: wrongQuestions.length },
            questions: wrongQuestions,
            answers: {},
            started_at: new Date().toISOString(),
            status: 'active' as const
        };
        setActiveSession(retrySession);
        router.push(`/test/${retrySession.id}`);
    };

    const subjects = [...new Set(questions.map((q) => q.subject))];
    const subjectStats = subjects.map((s) => {
        const qs = questions.filter((q) => q.subject === s);
        const c = qs.filter((q) => answers[q.id]?.is_correct).length;
        return { subject: s, correct: c, total: qs.length, pct: Math.round((c / qs.length) * 100) };
    });

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '36px 0 60px' }}>
            <div style={{ maxWidth: '920px', margin: '0 auto', padding: '0 24px' }}>

                {/* Scorecard Box */}
                <div className="card card-static" style={{ padding: '32px', textAlign: 'center', marginBottom: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                    <h1 style={{ fontSize: '15px', color: 'var(--text-secondary)', margin: '0 0 18px', fontWeight: 700, letterSpacing: 0 }}>
                        {exam?.name || 'Examination'} · {config.mode === 'subject' ? config.subject : 'Full paper'} — result
                    </h1>

                    <div style={{
                        width: '108px',
                        height: '108px',
                        borderRadius: '50%',
                        background: pct >= 60 ? 'rgba(16, 185, 129, 0.08)' : pct >= 40 ? 'rgba(245, 158, 11, 0.08)' : 'rgba(239, 68, 68, 0.08)',
                        border: `2px solid ${pct >= 60 ? '#10B981' : pct >= 40 ? '#F59E0B' : '#EF4444'}`,
                        display: 'flex',
                        flexDirection: 'column',
                        alignItems: 'center',
                        justifyContent: 'center',
                        margin: '0 auto 16px',
                    }}>
                        <div style={{ fontSize: '30px', fontWeight: 900, fontFamily: 'var(--font-mono, monospace)', color: tone(pct) }}>
                            {pct}%
                        </div>
                        <div style={{ fontSize: '10.5px', color: 'var(--text-secondary)', fontWeight: 700, textTransform: 'uppercase', letterSpacing: '0.04em' }}>Score</div>
                    </div>

                    <div style={{ fontSize: '16px', fontWeight: 800, marginBottom: '4px', color: 'var(--text-primary)', fontVariantNumeric: 'tabular-nums' }}>
                        {score} / {total_marks} marks
                    </div>
                    <div style={{ fontSize: '13px', color: 'var(--text-secondary)', marginBottom: '24px' }}>
                        {attempted > 0 ? `${accuracy}% accuracy on ${attempted} attempted question${attempted === 1 ? '' : 's'}` : 'No questions attempted'}
                    </div>

                    {/* Breakdown Pills */}
                    <div style={{ display: 'flex', justifyContent: 'center', gap: '24px', flexWrap: 'wrap' }}>
                        {[
                            { label: 'Correct', value: correct, icon: <CheckCircle size={16} color="var(--success-text)" />, color: 'var(--success-text)', bg: 'rgba(16, 185, 129, 0.06)' },
                            { label: 'Incorrect', value: incorrect, icon: <XCircle size={16} color="var(--danger-text)" />, color: 'var(--danger-text)', bg: 'rgba(239, 68, 68, 0.06)' },
                            { label: 'Unattempted', value: skipped, icon: <MinusCircle size={16} color="var(--text-muted)" />, color: 'var(--text-secondary)', bg: 'rgba(100, 116, 139, 0.06)' },
                            ...(dropped > 0 ? [{ label: 'Dropped (Bonus)', value: dropped, icon: <Gift size={16} color="var(--warning-text)" />, color: 'var(--warning-text)', bg: 'rgba(245, 158, 11, 0.06)' }] : []),
                        ].map((s) => (
                            <div key={s.label} style={{
                                padding: '10px 16px',
                                borderRadius: '8px',
                                background: s.bg,
                                border: '1px solid var(--border)',
                                minWidth: '100px',
                                textAlign: 'center'
                            }}>
                                <div style={{ fontSize: '20px', fontWeight: 900, color: s.color, fontFamily: 'var(--font-mono, monospace)' }}>
                                    {s.value}
                                </div>
                                <div style={{ fontSize: '11.5px', color: 'var(--text-secondary)', fontWeight: 700, display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '5px', marginTop: '2px' }}>
                                    {s.icon}
                                    <span>{s.label}</span>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>

                {/* Subject-Wise Performance Breakdown */}
                <div className="card card-static" style={{ padding: '24px', marginBottom: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '16px' }}>
                        <BarChart3 size={17} color="#2563EB" />
                        <h2 style={{ fontWeight: 800, fontSize: '15.5px', margin: 0 }}>Subject-Wise Performance</h2>
                    </div>

                    <div style={{ display: 'flex', flexDirection: 'column', gap: '14px' }}>
                        {subjectStats.map((s) => (
                            <div key={s.subject}>
                                <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '13px', marginBottom: '6px' }}>
                                    <span style={{ fontWeight: 700, color: 'var(--text-primary)' }}>{s.subject}</span>
                                    <span style={{ fontWeight: 700, fontVariantNumeric: 'tabular-nums', color: tone(s.pct), whiteSpace: 'nowrap', marginLeft: '12px' }}>
                                        {s.correct}/{s.total} ({s.pct}%)
                                    </span>
                                </div>
                                <div className="progress-bar" style={{ height: '6px', background: 'var(--border)', borderRadius: '9999px', overflow: 'hidden' }}>
                                    <div
                                        className="progress-fill"
                                        style={{
                                            width: `${s.pct}%`,
                                            height: '100%',
                                            background: s.pct >= 60 ? '#10B981' : s.pct >= 40 ? '#F59E0B' : '#EF4444',
                                            borderRadius: '9999px',
                                            transition: 'width 0.3s ease'
                                        }}
                                    />
                                </div>
                            </div>
                        ))}
                    </div>
                </div>

                {/* Actions Row */}
                <div style={{ display: 'flex', gap: '10px', marginBottom: '24px', flexWrap: 'wrap' }}>
                    <Link
                        href="/exams"
                        className="btn btn-secondary"
                        style={{
                            padding: '9px 18px',
                            borderRadius: '8px',
                            fontWeight: 700,
                            fontSize: '13px',
                            display: 'inline-flex',
                            alignItems: 'center',
                            gap: '6px',
                            background: 'var(--bg-card)',
                            border: '1px solid var(--border)',
                            color: 'var(--text-primary)'
                        }}
                    >
                        <Home size={15} />
                        <span>All Examinations</span>
                    </Link>

                    {wrongQuestions.length > 0 && (
                        <button
                            type="button"
                            onClick={retryWrong}
                            className="btn btn-primary"
                            style={{
                                padding: '9px 18px',
                                borderRadius: '8px',
                                fontWeight: 700,
                                fontSize: '13px',
                                background: '#1E1B4B',
                                color: '#FFFFFF',
                                border: '1px solid #312E81',
                                display: 'inline-flex',
                                alignItems: 'center',
                                gap: '6px',
                                cursor: 'pointer'
                            }}
                        >
                            <RotateCcw size={15} />
                            <span>Retry {wrongQuestions.length} Incorrect Questions</span>
                        </button>
                    )}
                </div>

                {/* Question Review Section */}
                <div className="card card-static" style={{ padding: 'clamp(14px, 4vw, 24px)', borderRadius: '12px', border: '1px solid var(--border)' }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '20px', flexWrap: 'wrap', gap: '12px' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                            <BookOpen size={17} color="#2563EB" />
                            <h2 style={{ fontWeight: 800, fontSize: '15.5px', margin: 0 }}>Detailed Question Review</h2>
                        </div>

                        <div style={{ display: 'flex', gap: '10px', alignItems: 'center', flexWrap: 'wrap' }}>
                            {/* Language switcher */}
                            {(() => {
                                const isUpsc = session?.config?.exam_id === 'upsc-cse' || session?.config?.exam_id === 'upsc-capf' || session?.config?.exam_id === 'upsc-epfo';
                                const isKarnataka = session?.config?.exam_id?.startsWith('kpsc') || session?.config?.exam_id?.startsWith('kea') || session?.config?.exam_id?.startsWith('ksp');
                                if (!isUpsc && !isKarnataka) return null;
                                const langOptions = isUpsc ? (['en', 'hi'] as const) : (['en', 'kn'] as const);
                                return (
                                    <div style={{ display: 'flex', gap: '3px', background: 'var(--bg-tertiary)', padding: '3px', borderRadius: '8px', border: '1px solid var(--border)' }}>
                                        {langOptions.map((l) => (
                                            <button
                                                key={l}
                                                type="button"
                                                onClick={() => setActiveLang(l)}
                                                aria-pressed={activeLang === l}
                                                style={{
                                                    padding: '6px 12px',
                                                    minHeight: '32px',
                                                    borderRadius: '6px',
                                                    border: 'none',
                                                    fontSize: '12px',
                                                    fontWeight: 700,
                                                    cursor: 'pointer',
                                                    background: activeLang === l ? '#1E1B4B' : 'transparent',
                                                    color: activeLang === l ? '#FFFFFF' : 'var(--text-secondary)',
                                                    boxShadow: activeLang === l ? '0 1px 2px rgba(30,27,75,0.2)' : 'none',
                                                    transition: 'all 0.15s ease'
                                                }}
                                            >
                                                {l.toUpperCase()}
                                            </button>
                                        ))}
                                    </div>
                                );
                            })()}

                            {/* Filter Buttons */}
                            <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                                {((['all', 'correct', 'incorrect', 'skipped', ...(dropped > 0 ? ['dropped'] : [])]) as ReviewFilter[]).map((f) => {
                                    const isActive = filter === f;
                                    return (
                                        <button
                                            key={f}
                                            type="button"
                                            onClick={() => setFilter(f)}
                                            aria-pressed={isActive}
                                            style={{
                                                padding: '6px 12px',
                                                minHeight: '36px',
                                                borderRadius: '6px',
                                                border: isActive ? '1px solid #1E1B4B' : '1px solid var(--border)',
                                                cursor: 'pointer',
                                                fontWeight: 700,
                                                fontSize: '12.5px',
                                                textTransform: 'capitalize',
                                                background: isActive ? '#1E1B4B' : 'var(--bg-card)',
                                                color: isActive ? '#FFFFFF' : 'var(--text-secondary)',
                                                boxShadow: isActive ? '0 1px 3px rgba(30,27,75,0.2)' : 'var(--shadow-sm)',
                                                transition: 'all 0.15s ease',
                                            }}
                                        >
                                            {f === 'dropped' ? `Dropped (${dropped})` : f}
                                        </button>
                                    );
                                })}
                            </div>
                        </div>
                    </div>

                    {/* Question List */}
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                        {filtered.map((q, i) => {
                            const a = answers[q.id];
                            const isDropped = q.correct?.toLowerCase() === 'x';
                            const isCorrect = a?.is_correct || isDropped;
                            const wasSkipped = !a?.selected && !isDropped;
                            const isOpen = expanded === q.id;
                            const qText = lang === 'kn' && q.text_kn ? q.text_kn : (lang === 'hi' && q.text_hi ? q.text_hi : q.text);
                            const expText = lang === 'kn' && q.explanation_kn ? q.explanation_kn : (lang === 'hi' && q.explanation_hi ? q.explanation_hi : q.explanation);

                            return (
                                <div key={q.id} style={{ background: 'var(--bg-secondary)', borderRadius: '10px', border: '1px solid var(--border)', overflow: 'hidden' }}>
                                    <button
                                        type="button"
                                        onClick={() => setExpanded(isOpen ? null : q.id)}
                                        aria-expanded={isOpen}
                                        style={{
                                            width: '100%',
                                            padding: '14px clamp(10px, 3vw, 16px)',
                                            display: 'flex',
                                            alignItems: 'flex-start',
                                            gap: 'clamp(8px, 2.5vw, 12px)',
                                            background: 'none',
                                            border: 'none',
                                            cursor: 'pointer',
                                            textAlign: 'left',
                                            color: 'var(--text-primary)',
                                        }}
                                    >
                                        <div style={{ flexShrink: 0, marginTop: '2px' }}>
                                            {isDropped ? (
                                                <AlertTriangle size={17} color="#D97706" />
                                            ) : isCorrect ? (
                                                <CheckCircle size={17} color="#059669" />
                                            ) : wasSkipped ? (
                                                <MinusCircle size={17} color="#64748B" />
                                            ) : (
                                                <XCircle size={17} color="#DC2626" />
                                            )}
                                        </div>
                                        <div style={{ flex: 1, minWidth: 0 }}>
                                            <div style={{ fontSize: '12px', color: 'var(--text-muted)', marginBottom: '4px', fontWeight: 600, display: 'flex', flexWrap: 'wrap', gap: '4px 10px', alignItems: 'center' }}>
                                                <span>Question {i + 1} · {lang === 'kn' && q.subject_kannada ? q.subject_kannada : q.subject}</span>
                                                {!isDropped && (
                                                    <span style={{ fontWeight: 700, color: isCorrect ? 'var(--success-text)' : wasSkipped ? 'var(--text-secondary)' : 'var(--danger-text)' }}>
                                                        {wasSkipped ? 'Skipped' : `Your answer ${a?.selected?.toUpperCase()}`} · Key {q.correct?.toUpperCase()}
                                                    </span>
                                                )}
                                            </div>
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
                                            <div style={{ fontWeight: 600, fontSize: '13.5px', lineHeight: 1.55 }}>
                                                <QuestionFormatter text={qText} />
                                                {isValidImageUrl(q.image_url) && (
                                                    <div style={{ marginTop: '12px', borderRadius: '8px', overflow: 'hidden', border: '1px solid var(--border)', background: 'var(--bg-card)', display: 'flex', justifyContent: 'center', padding: '12px' }}>
                                                        <img src={q.image_url} alt="Question Diagram" style={{ maxWidth: '100%', maxHeight: '200px', objectFit: 'contain' }} />
                                                    </div>
                                                )}
                                            </div>
                                        </div>
                                        <div style={{ flexShrink: 0, marginTop: '2px' }}>
                                            {isOpen ? <ChevronUp size={16} color="var(--text-muted)" /> : <ChevronDown size={16} color="var(--text-muted)" />}
                                        </div>
                                    </button>

                                    {isOpen && (
                                        <div style={{ padding: '0 16px 16px clamp(16px, 6vw, 45px)' }}>
                                            {isDropped && (
                                                <div style={{
                                                    padding: '10px 14px',
                                                    marginBottom: '14px',
                                                    borderRadius: '8px',
                                                    background: 'rgba(245, 158, 11, 0.08)',
                                                    border: '1px solid #FCD34D',
                                                    color: 'var(--warning-text)',
                                                    display: 'flex',
                                                    alignItems: 'flex-start',
                                                    gap: '8px'
                                                }}>
                                                    <AlertTriangle size={16} color="#D97706" style={{ marginTop: '2px', flexShrink: 0 }} />
                                                    <div>
                                                        <div style={{ fontWeight: 700, fontSize: '12.5px' }}>
                                                            Official Commission Dropped Question (Key: &apos;X&apos;)
                                                        </div>
                                                        <div style={{ fontSize: '12px', color: 'var(--text-secondary)', marginTop: '2px', lineHeight: 1.4 }}>
                                                            This question was cancelled by the commission in the final key. Full credit has been awarded with zero negative penalty.
                                                        </div>
                                                    </div>
                                                </div>
                                            )}

                                            {/* Options Grid */}
                                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px', marginBottom: '14px' }}>
                                                {q.options.map((opt) => {
                                                    const optText = lang === 'kn' && opt.text_kn ? opt.text_kn : (lang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                                                    const isCorrectOpt = opt.id === q.correct;
                                                    const isSelectedOpt = opt.id === a?.selected;
                                                    let bg = 'var(--bg-card)';
                                                    let border = '1px solid var(--border)';
                                                    let badgeBg = 'var(--bg-tertiary)';
                                                    let badgeCol = 'var(--text-primary)';

                                                    if (isCorrectOpt) {
                                                        bg = 'rgba(16, 185, 129, 0.08)';
                                                        border = '1px solid #10B981';
                                                        badgeBg = '#10B981';
                                                        badgeCol = '#FFFFFF';
                                                    } else if (isSelectedOpt) {
                                                        bg = 'rgba(239, 68, 68, 0.08)';
                                                        border = '1px solid #EF4444';
                                                        badgeBg = '#EF4444';
                                                        badgeCol = '#FFFFFF';
                                                    }

                                                    return (
                                                        <div key={opt.id} style={{
                                                            padding: '10px 14px', borderRadius: '8px', display: 'flex', alignItems: 'center', gap: '10px',
                                                            background: bg, border: border, transition: 'all 0.15s'
                                                        }}>
                                                            <div style={{
                                                                width: '26px', height: '26px', borderRadius: '6px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                                                                fontSize: '12px', fontWeight: 800, flexShrink: 0,
                                                                background: badgeBg, color: badgeCol, border: isCorrectOpt || isSelectedOpt ? 'none' : '1px solid var(--border)',
                                                                fontFamily: 'var(--font-mono, monospace)'
                                                            }}>
                                                                {opt.id.toUpperCase()}
                                                            </div>
                                                            <div style={{ flex: 1, fontSize: '13px' }}>
                                                                <OptionFormatter text={optText} />
                                                            </div>
                                                            {isCorrectOpt && (
                                                                <span style={{ fontSize: '11.5px', fontWeight: 800, color: 'var(--success-text)', display: 'flex', alignItems: 'center', gap: '3px', whiteSpace: 'nowrap' }}>
                                                                    <Check size={14} strokeWidth={3} />
                                                                    Official Key
                                                                </span>
                                                            )}
                                                            {isSelectedOpt && !isCorrectOpt && (
                                                                <span style={{ fontSize: '11.5px', fontWeight: 800, color: 'var(--danger-text)', display: 'flex', alignItems: 'center', gap: '3px', whiteSpace: 'nowrap' }}>
                                                                    <X size={14} strokeWidth={3} />
                                                                    Your Choice
                                                                </span>
                                                            )}
                                                        </div>
                                                    );
                                                })}
                                            </div>

                                            {/* Explanation Box */}
                                            <div style={{ background: 'var(--bg-card)', borderRadius: '8px', padding: '16px', border: '1px solid var(--border)', boxShadow: 'var(--shadow-sm)' }}>
                                                <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--brand-orange-text)', marginBottom: '8px', textTransform: 'uppercase', letterSpacing: '0.04em', display: 'flex', alignItems: 'center', gap: '6px' }}>
                                                    <BookOpen size={13} />
                                                    <span>Explanation & Standard Citation</span>
                                                </div>
                                                <div style={{ fontSize: '13px', lineHeight: 1.6, color: 'var(--text-secondary)' }}>
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
