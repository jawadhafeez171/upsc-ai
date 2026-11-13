'use client';
import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAppStore, useStoreHydrated } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { EXAMS } from '@/lib/mockData';
import {
    ArrowRight,
    TrendingUp,
    Flame,
    FileCheck,
    Target,
    Award,
    BookOpen,
    PlayCircle,
    CheckCircle2,
    Zap,
    Clock,
    Languages,
    ShieldCheck,
    Inbox,
    BarChart3,
    Compass
} from 'lucide-react';

function getBadgeIcon(id: string) {
    switch (id) {
        case 'first-test':
            return <CheckCircle2 size={20} color="#059669" />;
        case 'perfect-score':
            return <Award size={20} color="#D97706" />;
        case 'streak-7':
        case 'streak-30':
            return <Flame size={20} color="#EA580C" />;
        case 'speed-demon':
            return <Zap size={20} color="#2563EB" />;
        case 'history-master':
            return <BookOpen size={20} color="#7C3AED" />;
        case 'night-owl':
            return <Clock size={20} color="#4F46E5" />;
        case 'multilingual':
            return <Languages size={20} color="#0284C7" />;
        default:
            return <ShieldCheck size={20} color="#475569" />;
    }
}

export default function DashboardPage() {
    const router = useRouter();
    const { user, completedSessions, activeSession } = useAppStore();
    const [examsObj, setExamsObj] = useState<Record<string, { name: string; color: string }>>({});
    const hydrated = useStoreHydrated();
    const recentSessions = user
        ? [...completedSessions]
            .filter((s) => s.user_id === user.id)
            .sort((a, b) => new Date(b.finished_at || b.started_at).getTime() - new Date(a.finished_at || a.started_at).getTime())
            .slice(0, 6)
        : [];

    useEffect(() => {
        if (!hydrated) return;
        if (!user) {
            router.replace('/login');
            return;
        }

        async function fetchExams() {
            const { data } = await supabase.from('exams').select('id, title');
            if (data) {
                const m: Record<string, { name: string; color: string }> = {};
                data.forEach((e) => {
                    m[e.id] = {
                        name: e.title,
                        color: e.id.includes('upsc-cse') ? '#1E1B4B' : e.id.includes('epfo') ? '#1E3A8A' : e.id.includes('capf') ? '#0D5D56' : '#2563EB',
                    };
                });
                setExamsObj(m);
            }
        }
        fetchExams();
    }, [hydrated, user, completedSessions, router]);

    if (!user) return null;

    const userSessions = completedSessions.filter((s) => s.user_id === user.id);
    const totalTests = userSessions.length;
    const avgScore = totalTests > 0
        ? Math.round((userSessions.reduce((sum, s) => sum + (s.score || 0), 0) / userSessions.reduce((sum, s) => sum + (s.total_marks || 1), 0)) * 100)
        : 0;

    let attemptedAll = 0, correctAll = 0;
    userSessions.forEach((s) => Object.values(s.answers || {}).forEach((a) => {
        if (a?.selected) { attemptedAll += 1; if (a.is_correct) correctAll += 1; }
    }));
    const accuracyAll = attemptedAll > 0 ? Math.round((correctAll / attemptedAll) * 100) : null;
    const tone = (p: number) => (p >= 65 ? 'var(--success-text)' : p >= 45 ? 'var(--warning-text)' : 'var(--danger-text)');
    const examName = (id: string) => examsObj[id]?.name || EXAMS.find((e) => e.id === id)?.name || id;

    const xpToNextLevel = 1000;
    const xpProgress = Math.min((user.xp % xpToNextLevel) / xpToNextLevel, 1);

    // Compute Subject Performance breakdown
    const subjectStats: Record<string, { correct: number; total: number }> = {};
    userSessions.forEach((session) => {
        if (!session.questions || !session.answers) return;
        session.questions.forEach((q) => {
            const subj = q.subject || 'General Studies';
            if (!subjectStats[subj]) {
                subjectStats[subj] = { correct: 0, total: 0 };
            }
            const ans = session.answers[q.id];
            if (ans?.selected) {
                subjectStats[subj].total += 1;
                if (ans.is_correct) {
                    subjectStats[subj].correct += 1;
                }
            }
        });
    });

    const subjectList = Object.entries(subjectStats)
        .map(([name, data]) => ({
            name,
            accuracy: data.total > 0 ? Math.round((data.correct / data.total) * 100) : 0,
            total: data.total
        }))
        .sort((a, b) => b.total - a.total)
        .slice(0, 5);

    const STATS = [
        { icon: <Flame size={20} />, label: 'Day streak', value: `${user.streak} ${user.streak === 1 ? 'day' : 'days'}` },
        { icon: <FileCheck size={20} />, label: 'Tests completed', value: `${totalTests}` },
        { icon: <Target size={20} />, label: 'Average score', value: totalTests > 0 ? `${avgScore}%` : '—' },
        { icon: <CheckCircle2 size={20} />, label: 'Accuracy', value: accuracyAll === null ? '—' : `${accuracyAll}%` },
    ];

    return (
        <div style={{ background: 'transparent', minHeight: '85vh', padding: '36px 0 60px' }}>
            <div style={{ maxWidth: '1120px', margin: '0 auto', padding: '0 24px' }}>

                {/* Header */}
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '32px', flexWrap: 'wrap', gap: '16px' }}>
                    <div>
                        <h1 style={{ fontSize: 'clamp(24px, 3.5vw, 32px)', fontWeight: 800, letterSpacing: '-0.5px', color: 'var(--text-primary)', marginBottom: '4px' }}>
                            Welcome back, {user.name.split(' ')[0]}
                        </h1>
                        <p style={{ color: 'var(--text-secondary)', fontSize: '14px', margin: 0 }}>
                            Your practice, progress and recent results
                        </p>
                    </div>
                    <Link
                        href="/exams"
                        className="btn btn-primary"
                        style={{
                            borderRadius: '8px',
                            padding: '10px 18px',
                            fontWeight: 700,
                            fontSize: '13px',
                            background: '#1E1B4B',
                            color: '#FFFFFF',
                            border: '1px solid #312E81',
                            display: 'inline-flex',
                            alignItems: 'center',
                            gap: '8px'
                        }}
                    >
                        <span>Start a new test</span>
                        <ArrowRight size={15} />
                    </Link>
                </div>

                {/* Primary Action Banner: Resume Active Test if in progress */}
                {activeSession && activeSession.status === 'active' && (
                    <div style={{
                        background: '#1E1B4B',
                        color: '#FFFFFF',
                        borderRadius: '12px',
                        border: '1px solid #312E81',
                        padding: '20px 24px',
                        marginBottom: '24px',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'space-between',
                        flexWrap: 'wrap',
                        gap: '16px',
                        boxShadow: '0 4px 12px rgba(30, 27, 75, 0.15)'
                    }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '14px' }}>
                            <div style={{
                                width: '44px',
                                height: '44px',
                                borderRadius: '10px',
                                background: 'rgba(255, 255, 255, 0.1)',
                                border: '1px solid rgba(255, 255, 255, 0.2)',
                                display: 'flex',
                                alignItems: 'center',
                                justifyContent: 'center',
                                flexShrink: 0
                            }}>
                                <PlayCircle size={22} color="#FFFFFF" />
                            </div>
                            <div>
                                <div style={{ fontSize: '11px', fontWeight: 700, color: '#A5B4FC', letterSpacing: '0.04em', textTransform: 'uppercase' }}>
                                    Active Examination in Progress
                                </div>
                                <div style={{ fontSize: '16px', fontWeight: 800, marginTop: '2px' }}>
                                    {examName(activeSession.exam_id)}
                                </div>
                                <div style={{ fontSize: '12.5px', color: '#E0E7FF', marginTop: '2px' }}>
                                    {Object.keys(activeSession.answers || {}).length} of {activeSession.questions?.length || 0} questions attempted
                                </div>
                            </div>
                        </div>

                        <Link
                            href={`/test/${activeSession.id}`}
                            style={{
                                background: '#2563EB',
                                color: '#FFFFFF',
                                border: '1px solid #3B82F6',
                                padding: '10px 20px',
                                borderRadius: '8px',
                                fontWeight: 800,
                                fontSize: '13px',
                                textDecoration: 'none',
                                display: 'inline-flex',
                                alignItems: 'center',
                                gap: '6px',
                                letterSpacing: '0.02em',
                                boxShadow: '0 2px 6px rgba(37, 99, 235, 0.3)'
                            }}
                        >
                            <span>Resume Test</span>
                            <ArrowRight size={15} />
                        </Link>
                    </div>
                )}

                {/* Level / XP Progress Card */}
                <div className="card card-static" style={{ padding: '24px', marginBottom: '24px', borderRadius: '12px', border: '1px solid var(--border)', background: 'var(--bg-card)' }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '16px', flexWrap: 'wrap', gap: '12px' }}>
                        <div>
                            <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)' }}>
                                Your level
                            </div>
                            <div style={{ fontSize: '22px', fontWeight: 800, color: 'var(--link-text)', marginTop: '2px' }}>
                                {user.level}
                            </div>
                        </div>
                        <div style={{ textAlign: 'right' }}>
                            <div style={{ fontSize: '12px', fontWeight: 600, color: 'var(--text-muted)' }}>Total XP</div>
                            <div style={{ fontSize: '24px', fontWeight: 800, fontVariantNumeric: 'tabular-nums', marginTop: '2px' }}>
                                {user.xp.toLocaleString()}
                            </div>
                        </div>
                    </div>
                    <div className="progress-bar" style={{ height: '8px', background: 'var(--border)', borderRadius: '9999px', overflow: 'hidden' }}>
                        <div className="progress-fill" style={{ width: `${xpProgress * 100}%`, height: '100%', background: '#2563EB', borderRadius: '9999px', transition: 'width 0.3s ease' }} />
                    </div>
                    <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '11.5px', color: 'var(--text-muted)', marginTop: '8px', fontVariantNumeric: 'tabular-nums' }}>
                        <span>{user.xp % xpToNextLevel} / {xpToNextLevel} XP to the next level</span>
                        <span>{Math.round(xpProgress * 100)}%</span>
                    </div>
                </div>

                {/* Core Stats Grid */}
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(min(100%, 150px), 1fr))', gap: '12px', marginBottom: '24px' }}>
                    {STATS.map((s) => (
                        <div
                            key={s.label}
                            className="stat-card"
                            style={{
                                border: '1px solid var(--border)',
                                background: 'var(--bg-card)',
                                borderRadius: '12px',
                                padding: 'clamp(14px, 3vw, 20px)',
                                textAlign: 'left',
                                display: 'flex',
                                alignItems: 'flex-start',
                                gap: '10px',
                                flexDirection: 'column'
                            }}
                        >
                            <div style={{
                                width: '40px',
                                height: '40px',
                                borderRadius: '10px',
                                background: 'var(--bg-card)',
                                border: '1px solid var(--border)',
                                color: 'var(--text-secondary)',
                                display: 'flex',
                                alignItems: 'center',
                                justifyContent: 'center',
                                flexShrink: 0
                            }}>
                                {s.icon}
                            </div>
                            <div>
                                <div style={{ fontSize: '12px', color: 'var(--text-secondary)', fontWeight: 600 }}>{s.label}</div>
                                <div style={{ fontSize: '22px', fontWeight: 800, color: 'var(--text-primary)', marginTop: '2px', letterSpacing: '-0.3px', fontVariantNumeric: 'tabular-nums' }}>
                                    {s.value}
                                </div>
                            </div>
                        </div>
                    ))}
                </div>

                {/* 2-Column Analytics: Subject Performance + Recent Tests */}
                <div className="dashboard-layout-grid" style={{ marginBottom: '24px' }}>
                    {/* Subject-Wise Mastery */}
                    <div className="card card-static" style={{ padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '20px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                <BarChart3 size={17} color="#2563EB" />
                                <h2 style={{ fontWeight: 800, fontSize: '15px', margin: 0 }}>Accuracy by subject</h2>
                            </div>
                            <span style={{ fontSize: '11px', color: 'var(--text-muted)' }}>Most practised</span>
                        </div>

                        {subjectList.length === 0 ? (
                            <div style={{ textAlign: 'center', padding: '36px 16px', color: 'var(--text-muted)' }}>
                                <Compass size={32} style={{ margin: '0 auto 10px', opacity: 0.4 }} />
                                <p style={{ fontSize: '13px', margin: '0 0 6px', fontWeight: 600 }}>No subject telemetry yet</p>
                                <p style={{ fontSize: '12px', margin: 0, color: 'var(--text-muted)' }}>
                                    Attempt mock tests to analyze your accuracy across Polity, History, Economy, and CSAT.
                                </p>
                            </div>
                        ) : (
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '14px' }}>
                                {subjectList.map((item) => {
                                    const badgeColor = tone(item.accuracy);
                                    const barColor = item.accuracy >= 65 ? '#10B981' : item.accuracy >= 45 ? '#F59E0B' : '#EF4444';
                                    const badgeBg = item.accuracy >= 65 ? 'rgba(16, 185, 129, 0.08)' : item.accuracy >= 45 ? 'rgba(245, 158, 11, 0.08)' : 'rgba(239, 68, 68, 0.08)';
                                    const badgeLabel = item.accuracy >= 65 ? 'Strong' : item.accuracy >= 45 ? 'Developing' : 'Needs Focus';

                                    return (
                                        <div key={item.name}>
                                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', gap: '12px', marginBottom: '6px' }}>
                                                <span style={{ fontSize: '13px', fontWeight: 700, color: 'var(--text-primary)' }}>
                                                    {item.name}
                                                </span>
                                                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                    <span style={{
                                                        fontSize: '11px',
                                                        fontWeight: 800,
                                                        padding: '2px 6px',
                                                        borderRadius: '4px',
                                                        color: badgeColor,
                                                        background: badgeBg,
                                                        border: '1px solid var(--border)',
                                                        whiteSpace: 'nowrap'
                                                    }}>
                                                        {badgeLabel}
                                                    </span>
                                                    <span style={{ fontSize: '12.5px', fontWeight: 800, fontVariantNumeric: 'tabular-nums', color: badgeColor }}>
                                                        {item.accuracy}%
                                                    </span>
                                                </div>
                                            </div>
                                            <div style={{ height: '6px', background: 'var(--border)', borderRadius: '9999px', overflow: 'hidden' }}>
                                                <div
                                                    style={{
                                                        width: `${item.accuracy}%`,
                                                        height: '100%',
                                                        background: barColor,
                                                        borderRadius: '9999px',
                                                        transition: 'width 0.3s ease'
                                                    }}
                                                />
                                            </div>
                                        </div>
                                    );
                                })}
                            </div>
                        )}
                    </div>

                    {/* Recent Tests */}
                    <div className="card card-static" style={{ padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '20px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                <TrendingUp size={17} color="#059669" />
                                <h2 style={{ fontWeight: 800, fontSize: '15px', margin: 0 }}>Recent tests</h2>
                            </div>
                            <Link href="/exams" style={{ display: 'inline-flex', alignItems: 'center', gap: '4px', minHeight: '44px', fontSize: '13px', color: 'var(--link-text)', fontWeight: 700, textDecoration: 'none' }}>
                                All exams <ArrowRight size={14} />
                            </Link>
                        </div>

                        {recentSessions.length === 0 ? (
                            <div style={{ textAlign: 'center', padding: '36px 16px', color: 'var(--text-muted)' }}>
                                <Inbox size={32} style={{ margin: '0 auto 10px', opacity: 0.4 }} />
                                <p style={{ fontSize: '13px', margin: '0 0 6px', fontWeight: 600 }}>No test records recorded</p>
                                <Link href="/exams" style={{ display: 'inline-flex', alignItems: 'center', gap: '4px', minHeight: '44px', color: 'var(--link-text)', fontWeight: 700, textDecoration: 'none', fontSize: '13px' }}>
                                    Take your first mock test <ArrowRight size={14} />
                                </Link>
                            </div>
                        ) : (
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                                {recentSessions.map((s) => {
                                    const examInfo = { name: examName(s.exam_id) };
                                    const pct = Math.round(((s.score || 0) / (s.total_marks || 1)) * 100);
                                    const scoreColor = pct >= 60 ? 'var(--success-text)' : pct >= 40 ? 'var(--warning-text)' : 'var(--danger-text)';

                                    return (
                                        <div
                                            key={s.id}
                                            style={{
                                                display: 'flex',
                                                alignItems: 'center',
                                                justifyContent: 'space-between',
                                                gap: '12px',
                                                padding: '12px 14px',
                                                background: 'var(--bg-secondary)',
                                                borderRadius: '8px',
                                                border: '1px solid var(--border)',
                                            }}
                                        >
                                            <div style={{ flex: 1, minWidth: 0 }}>
                                                <div style={{ fontWeight: 700, fontSize: '13.5px', color: 'var(--text-primary)', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                                                    {examInfo.name}
                                                </div>
                                                <div style={{ fontSize: '11.5px', color: 'var(--text-muted)', marginTop: '2px' }}>
                                                    {s.config?.question_count || s.questions?.length || 0} questions · {s.finished_at ? new Date(s.finished_at).toLocaleDateString('en-IN', { day: 'numeric', month: 'short', year: 'numeric' }) : 'Recent'}
                                                </div>
                                            </div>

                                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                <div style={{
                                                    fontWeight: 800,
                                                    fontSize: '13px',
                                                    color: scoreColor,
                                                    background: 'var(--bg-tertiary)',
                                                    border: '1px solid var(--border)',
                                                    padding: '4px 8px',
                                                    borderRadius: '6px',
                                                    fontVariantNumeric: 'tabular-nums',
                                                    flexShrink: 0,
                                                }}>
                                                    {pct}%
                                                </div>
                                                <Link
                                                    href={`/results/${s.id}`}
                                                    style={{
                                                        fontSize: '12.5px',
                                                        fontWeight: 700,
                                                        color: 'var(--link-text)',
                                                        textDecoration: 'none',
                                                        padding: '8px 12px',
                                                        minHeight: '36px',
                                                        display: 'inline-flex',
                                                        alignItems: 'center',
                                                        borderRadius: '6px',
                                                        border: '1px solid var(--border)',
                                                        background: 'var(--bg-card)',
                                                        whiteSpace: 'nowrap'
                                                    }}
                                                >
                                                    Review
                                                </Link>
                                            </div>
                                        </div>
                                    );
                                })}
                            </div>
                        )}
                    </div>
                </div>

                {/* Badges / Milestones Section */}
                <div className="card card-static" style={{ padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '20px' }}>
                        <Award size={18} color="#D97706" />
                        <h2 style={{ fontWeight: 800, fontSize: '15px', margin: 0 }}>Badges</h2>
                    </div>

                    {user.badges.length === 0 ? (
                        <div style={{ textAlign: 'center', padding: '28px 16px', color: 'var(--text-muted)' }}>
                            <ShieldCheck size={32} style={{ margin: '0 auto 8px', opacity: 0.4 }} />
                            <p style={{ fontSize: '13px', margin: 0 }}>Finish tests and keep a daily streak to earn badges.</p>
                        </div>
                    ) : (
                        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(180px, 1fr))', gap: '12px' }}>
                            {user.badges.map((b) => (
                                <div
                                    key={b.id}
                                    style={{
                                        padding: '14px',
                                        borderRadius: '8px',
                                        border: '1px solid var(--border)',
                                        background: 'var(--bg-secondary)',
                                        display: 'flex',
                                        alignItems: 'center',
                                        gap: '12px'
                                    }}
                                >
                                    <div style={{
                                        width: '38px',
                                        height: '38px',
                                        borderRadius: '8px',
                                        background: 'var(--bg-card)',
                                        border: '1px solid var(--border)',
                                        display: 'flex',
                                        alignItems: 'center',
                                        justifyContent: 'center',
                                        flexShrink: 0
                                    }}>
                                        {getBadgeIcon(b.id)}
                                    </div>
                                    <div style={{ minWidth: 0 }}>
                                        <div style={{ fontSize: '12.5px', fontWeight: 700, color: 'var(--text-primary)', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                                            {b.label}
                                        </div>
                                        <div style={{ fontSize: '11px', color: 'var(--text-muted)', marginTop: '2px', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                                            {b.description || 'Milestone achieved'}
                                        </div>
                                    </div>
                                </div>
                            ))}
                        </div>
                    )}
                </div>

            </div>
        </div>
    );
}
