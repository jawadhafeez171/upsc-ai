'use client';
import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
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
    const [recentSessions, setRecentSessions] = useState<any[]>([]);
    const [examsObj, setExamsObj] = useState<Record<string, { name: string; color: string }>>({});

    useEffect(() => {
        if (!user) {
            router.push('/login');
            return;
        }

        const sorted = [...completedSessions]
            .filter((s) => s.user_id === user.id)
            .sort((a, b) => new Date(b.finished_at || b.started_at).getTime() - new Date(a.finished_at || a.started_at).getTime())
            .slice(0, 6);
        setRecentSessions(sorted);

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
    }, [user, completedSessions, router]);

    if (!user) return null;

    const userSessions = completedSessions.filter((s) => s.user_id === user.id);
    const totalTests = userSessions.length;
    const avgScore = totalTests > 0
        ? Math.round((userSessions.reduce((sum, s) => sum + (s.score || 0), 0) / userSessions.reduce((sum, s) => sum + (s.total_marks || 1), 0)) * 100)
        : 0;

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
        {
            icon: <Flame size={20} color="#EA580C" />,
            label: 'Day Streak',
            value: `${user.streak} Days`,
            color: '#EA580C',
            bg: 'rgba(234, 88, 12, 0.06)',
            border: 'rgba(234, 88, 12, 0.2)'
        },
        {
            icon: <FileCheck size={20} color="#2563EB" />,
            label: 'Tests Completed',
            value: `${totalTests}`,
            color: '#2563EB',
            bg: 'rgba(37, 99, 235, 0.06)',
            border: 'rgba(37, 99, 235, 0.2)'
        },
        {
            icon: <Target size={20} color="#059669" />,
            label: 'Average Score',
            value: totalTests > 0 ? `${avgScore}%` : 'N/A',
            color: '#059669',
            bg: 'rgba(16, 185, 129, 0.06)',
            border: 'rgba(16, 185, 129, 0.2)'
        },
        {
            icon: <Award size={20} color="#7C3AED" />,
            label: 'Academic Standing',
            value: user.level,
            color: '#7C3AED',
            bg: 'rgba(124, 58, 237, 0.06)',
            border: 'rgba(124, 58, 237, 0.2)'
        },
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
                            Candidate Performance & Examination Telemetry
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
                        <span>Start New Mock</span>
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
                                    {examsObj[activeSession.exam_id]?.name || 'Mock Examination'}
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
                <div className="card" style={{ padding: '24px', marginBottom: '24px', borderRadius: '12px', border: '1px solid var(--border)', background: 'var(--bg-card)' }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '16px', flexWrap: 'wrap', gap: '12px' }}>
                        <div>
                            <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)' }}>
                                Academic Standing
                            </div>
                            <div style={{ fontSize: '22px', fontWeight: 800, color: 'var(--brand-blue, #2563EB)', marginTop: '2px' }}>
                                {user.level} Level
                            </div>
                        </div>
                        <div style={{ textAlign: 'right' }}>
                            <div style={{ fontSize: '12px', fontWeight: 600, color: 'var(--text-muted)' }}>Accumulated XP</div>
                            <div style={{ fontSize: '24px', fontWeight: 800, fontFamily: 'var(--font-mono, monospace)', marginTop: '2px' }}>
                                {user.xp.toLocaleString()}
                            </div>
                        </div>
                    </div>
                    <div className="progress-bar" style={{ height: '8px', background: 'var(--border)', borderRadius: '9999px', overflow: 'hidden' }}>
                        <div className="progress-fill" style={{ width: `${xpProgress * 100}%`, height: '100%', background: '#2563EB', borderRadius: '9999px', transition: 'width 0.3s ease' }} />
                    </div>
                    <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '11.5px', color: 'var(--text-muted)', marginTop: '8px', fontFamily: 'var(--font-mono, monospace)' }}>
                        <span>{user.xp % xpToNextLevel} / {xpToNextLevel} XP towards next tier</span>
                        <span>{Math.round(xpProgress * 100)}%</span>
                    </div>
                </div>

                {/* Core Stats Grid */}
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(220px, 1fr))', gap: '14px', marginBottom: '24px' }}>
                    {STATS.map((s) => (
                        <div
                            key={s.label}
                            className="stat-card"
                            style={{
                                border: `1px solid ${s.border}`,
                                background: s.bg,
                                borderRadius: '12px',
                                padding: '20px',
                                textAlign: 'left',
                                display: 'flex',
                                alignItems: 'flex-start',
                                gap: '14px'
                            }}
                        >
                            <div style={{
                                width: '40px',
                                height: '40px',
                                borderRadius: '10px',
                                background: 'var(--bg-card)',
                                border: `1px solid ${s.border}`,
                                display: 'flex',
                                alignItems: 'center',
                                justifyContent: 'center',
                                flexShrink: 0
                            }}>
                                {s.icon}
                            </div>
                            <div>
                                <div style={{ fontSize: '12px', color: 'var(--text-secondary)', fontWeight: 600 }}>{s.label}</div>
                                <div style={{ fontSize: '22px', fontWeight: 800, color: s.color, marginTop: '2px', letterSpacing: '-0.3px' }}>
                                    {s.value}
                                </div>
                            </div>
                        </div>
                    ))}
                </div>

                {/* 2-Column Analytics: Subject Performance + Recent Tests */}
                <div className="dashboard-layout-grid" style={{ marginBottom: '24px' }}>
                    {/* Subject-Wise Mastery */}
                    <div className="card" style={{ padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '20px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                <BarChart3 size={17} color="#2563EB" />
                                <h2 style={{ fontWeight: 800, fontSize: '15px', margin: 0 }}>Subject-Wise Accuracy</h2>
                            </div>
                            <span style={{ fontSize: '11px', color: 'var(--text-muted)' }}>Top Topics</span>
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
                                    const badgeColor = item.accuracy >= 65 ? '#059669' : item.accuracy >= 45 ? '#D97706' : '#DC2626';
                                    const badgeBg = item.accuracy >= 65 ? 'rgba(16, 185, 129, 0.08)' : item.accuracy >= 45 ? 'rgba(245, 158, 11, 0.08)' : 'rgba(239, 68, 68, 0.08)';
                                    const badgeLabel = item.accuracy >= 65 ? 'Strong' : item.accuracy >= 45 ? 'Developing' : 'Needs Focus';

                                    return (
                                        <div key={item.name}>
                                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '6px' }}>
                                                <span style={{ fontSize: '13px', fontWeight: 700, color: 'var(--text-primary)' }}>
                                                    {item.name}
                                                </span>
                                                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                    <span style={{
                                                        fontSize: '10px',
                                                        fontWeight: 800,
                                                        padding: '2px 6px',
                                                        borderRadius: '4px',
                                                        color: badgeColor,
                                                        background: badgeBg,
                                                        border: `1px solid ${badgeColor}30`
                                                    }}>
                                                        {badgeLabel}
                                                    </span>
                                                    <span style={{ fontSize: '12.5px', fontWeight: 800, fontFamily: 'var(--font-mono, monospace)', color: badgeColor }}>
                                                        {item.accuracy}%
                                                    </span>
                                                </div>
                                            </div>
                                            <div style={{ height: '6px', background: 'var(--border)', borderRadius: '9999px', overflow: 'hidden' }}>
                                                <div
                                                    style={{
                                                        width: `${item.accuracy}%`,
                                                        height: '100%',
                                                        background: badgeColor,
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
                    <div className="card" style={{ padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                        <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '20px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                <TrendingUp size={17} color="#059669" />
                                <h2 style={{ fontWeight: 800, fontSize: '15px', margin: 0 }}>Recent Test Records</h2>
                            </div>
                            <Link href="/exams" style={{ fontSize: '12px', color: '#2563EB', fontWeight: 700, textDecoration: 'none' }}>
                                Browse Mocks →
                            </Link>
                        </div>

                        {recentSessions.length === 0 ? (
                            <div style={{ textAlign: 'center', padding: '36px 16px', color: 'var(--text-muted)' }}>
                                <Inbox size={32} style={{ margin: '0 auto 10px', opacity: 0.4 }} />
                                <p style={{ fontSize: '13px', margin: '0 0 6px', fontWeight: 600 }}>No test records recorded</p>
                                <Link href="/exams" style={{ color: '#2563EB', fontWeight: 700, textDecoration: 'none', fontSize: '12.5px' }}>
                                    Take your first mock examination →
                                </Link>
                            </div>
                        ) : (
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                                {recentSessions.map((s) => {
                                    const examInfo = examsObj[s.exam_id] || { name: s.exam_id, color: '#2563EB' };
                                    const pct = Math.round(((s.score || 0) / (s.total_marks || 1)) * 100);
                                    const scoreColor = pct >= 60 ? '#059669' : pct >= 40 ? '#D97706' : '#DC2626';

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
                                                    {s.config?.question_count || s.questions?.length || 0} questions · {s.finished_at ? new Date(s.finished_at).toLocaleDateString() : 'Recent'}
                                                </div>
                                            </div>

                                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                <div style={{
                                                    fontWeight: 800,
                                                    fontSize: '13px',
                                                    color: scoreColor,
                                                    background: `${scoreColor}12`,
                                                    border: `1px solid ${scoreColor}30`,
                                                    padding: '4px 8px',
                                                    borderRadius: '6px',
                                                    fontFamily: 'var(--font-mono, monospace)',
                                                    flexShrink: 0,
                                                }}>
                                                    {pct}%
                                                </div>
                                                <Link
                                                    href={`/results/${s.id}`}
                                                    style={{
                                                        fontSize: '11.5px',
                                                        fontWeight: 700,
                                                        color: '#2563EB',
                                                        textDecoration: 'none',
                                                        padding: '4px 8px',
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
                <div className="card" style={{ padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '20px' }}>
                        <Award size={18} color="#D97706" />
                        <h2 style={{ fontWeight: 800, fontSize: '15px', margin: 0 }}>Milestones & Accolades</h2>
                    </div>

                    {user.badges.length === 0 ? (
                        <div style={{ textAlign: 'center', padding: '28px 16px', color: 'var(--text-muted)' }}>
                            <ShieldCheck size={32} style={{ margin: '0 auto 8px', opacity: 0.4 }} />
                            <p style={{ fontSize: '13px', margin: 0 }}>Complete examinations and practice streaks to unlock accolades.</p>
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
