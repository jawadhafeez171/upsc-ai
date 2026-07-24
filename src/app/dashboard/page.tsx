'use client';
import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { ArrowRight, TrendingUp, Flame, Star, Award, BookOpen } from 'lucide-react';

export default function DashboardPage() {
    const router = useRouter();
    const { user, completedSessions } = useAppStore();
    const [recentSessions, setRecentSessions] = useState<any[]>([]);
    const [examsObj, setExamsObj] = useState<Record<string, { name: string; icon: string; color: string }>>({});

    useEffect(() => {
        if (!user) { router.push('/login'); return; }
        const sorted = [...completedSessions].filter((s) => s.user_id === user.id)
            .sort((a, b) => new Date(b.finished_at || b.started_at).getTime() - new Date(a.finished_at || a.started_at).getTime())
            .slice(0, 5);
        setRecentSessions(sorted);
        async function fetchExams() {
            const { data } = await supabase.from('exams').select('id, title');
            if (data) {
                const m: Record<string, { name: string; icon: string; color: string }> = {};
                data.forEach((e) => {
                    m[e.id] = {
                        name: e.title,
                        icon: e.id.includes('upsc') ? '🏛️' : e.id.includes('kpsc') ? '🅺' : '📋',
                        color: e.id.includes('upsc-cse') ? '#082C54' : e.id.includes('capf') ? '#0D5D56' : 'var(--brand-orange)',
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

    const STATS = [
        { emoji: '🔥', label: 'Day Streak', value: `${user.streak}`, color: 'var(--brand-gold)', bg: 'rgba(217, 119, 6, 0.1)', border: 'rgba(217, 119, 6, 0.25)' },
        { emoji: '📝', label: 'Tests Taken', value: `${totalTests}`, color: 'var(--brand-orange)', bg: 'rgba(37, 99, 235, 0.1)', border: 'rgba(37, 99, 235, 0.25)' },
        { emoji: '⭐', label: 'Avg Score', value: totalTests > 0 ? `${avgScore}%` : '—', color: 'var(--brand-teal)', bg: 'rgba(13, 148, 136, 0.1)', border: 'rgba(13, 148, 136, 0.25)' },
        { emoji: '🏅', label: 'Badges', value: `${user.badges.length}`, color: '#8B5CF6', bg: 'rgba(139, 92, 246, 0.1)', border: 'rgba(139, 92, 246, 0.25)' },
    ];

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '48px 0' }}>
            <div style={{ maxWidth: '1080px', margin: '0 auto', padding: '0 24px' }}>

                {/* Header */}
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '40px', flexWrap: 'wrap', gap: '16px' }} className="fade-in-up">
                    <div>
                        <p style={{ color: 'var(--text-muted)', fontSize: '13px', fontWeight: 500, marginBottom: '6px', textTransform: 'uppercase', letterSpacing: '0.06em' }}>Dashboard</p>
                        <h1 style={{ fontSize: 'clamp(26px, 4vw, 36px)', fontWeight: 900, letterSpacing: '-0.8px', marginBottom: '6px' }}>
                            Welcome back, <span className="gradient-text">{user.name.split(' ')[0]}</span> 👋
                        </h1>
                        <p style={{ color: 'var(--text-secondary)', fontSize: '15px' }}>Here&apos;s your preparation overview.</p>
                    </div>
                    <Link href="/exams" className="btn btn-primary" style={{ borderRadius: '10px' }}>
                        New Test <ArrowRight size={15} />
                    </Link>
                </div>

                {/* XP / Level Card */}
                <div className="card fade-in-up-d1" style={{ padding: '28px', marginBottom: '24px', background: 'linear-gradient(135deg, rgba(37,99,235,0.08) 0%, rgba(13,148,136,0.04) 100%)', borderColor: 'rgba(37,99,235,0.2)' }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '20px', flexWrap: 'wrap', gap: '12px' }}>
                        <div>
                            <div style={{ fontSize: '11px', fontWeight: 600, color: 'var(--text-muted)', textTransform: 'uppercase', letterSpacing: '0.08em', marginBottom: '6px' }}>Your Level</div>
                            <div style={{ fontSize: '24px', fontWeight: 900, background: 'linear-gradient(135deg, var(--brand-orange), var(--brand-gold))', WebkitBackgroundClip: 'text', WebkitTextFillColor: 'transparent', backgroundClip: 'text' }}>
                                {user.level}
                            </div>
                        </div>
                        <div style={{ textAlign: 'right' }}>
                            <div style={{ fontSize: '11px', color: 'var(--text-muted)', marginBottom: '4px' }}>Total XP</div>
                            <div style={{ fontSize: '28px', fontWeight: 900, letterSpacing: '-0.5px' }}>{user.xp.toLocaleString()}</div>
                        </div>
                    </div>
                    <div className="progress-bar">
                        <div className="progress-fill" style={{ width: `${xpProgress * 100}%` }} />
                    </div>
                    <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '11px', color: 'var(--text-muted)', marginTop: '8px' }}>
                        <span>{user.xp % xpToNextLevel} / {xpToNextLevel} XP</span>
                        <span>Next level</span>
                    </div>
                </div>

                {/* Stats Grid */}
                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))', gap: '12px', marginBottom: '24px' }} className="fade-in-up-d2">
                    {STATS.map((s) => (
                        <div key={s.label} className="stat-card" style={{ border: `1px solid ${s.border}`, background: s.bg }}>
                            <div style={{ fontSize: '24px', marginBottom: '10px' }}>{s.emoji}</div>
                            <div style={{ fontSize: '32px', fontWeight: 900, letterSpacing: '-0.5px', color: s.color, marginBottom: '4px' }}>{s.value}</div>
                            <div style={{ fontSize: '12px', color: 'var(--text-secondary)', fontWeight: 500 }}>{s.label}</div>
                        </div>
                    ))}
                </div>

                {/* Bottom Grid: Recent Tests + Badges */}
                <div className="dashboard-layout-grid fade-in-up-d3">
                    {/* Recent Tests */}
                    <div className="card" style={{ padding: '28px' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '24px' }}>
                            <TrendingUp size={16} style={{ color: 'var(--brand-orange)' }} />
                            <h2 style={{ fontWeight: 700, fontSize: '16px' }}>Recent Tests</h2>
                        </div>
                        {recentSessions.length === 0 ? (
                            <div style={{ textAlign: 'center', padding: '40px 0', color: 'var(--text-muted)' }}>
                                <div style={{ fontSize: '40px', marginBottom: '12px' }}>📭</div>
                                <p style={{ fontSize: '13px', marginBottom: '12px' }}>No tests yet.</p>
                                <Link href="/exams" style={{ color: 'var(--brand-orange)', fontWeight: 600, textDecoration: 'none', fontSize: '13px' }}>Take your first test →</Link>
                            </div>
                        ) : (
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                                {recentSessions.map((s) => {
                                    const examInfo = examsObj[s.exam_id] || { name: s.exam_id, icon: '📋', color: 'var(--brand-orange)' };
                                    const pct = Math.round(((s.score || 0) / (s.total_marks || 1)) * 100);
                                    const scoreColor = pct >= 60 ? 'var(--brand-teal)' : pct >= 40 ? '#F59E0B' : '#F43F5E';
                                    return (
                                        <div key={s.id} style={{
                                            display: 'flex', alignItems: 'center', gap: '14px',
                                            padding: '14px 16px', background: 'var(--bg-secondary)', borderRadius: '12px',
                                            border: '1px solid var(--border)',
                                        }}>
                                            <div style={{ fontSize: '22px', width: 36, textAlign: 'center', flexShrink: 0 }}>{examInfo.icon}</div>
                                            <div style={{ flex: 1, minWidth: 0 }}>
                                                <div style={{ fontWeight: 600, fontSize: '14px', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>{examInfo.name}</div>
                                                <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>{s.config?.question_count || 0} questions</div>
                                            </div>
                                            <div style={{
                                                fontWeight: 800, fontSize: '16px', color: scoreColor,
                                                background: `${scoreColor}15`, border: `1px solid ${scoreColor}30`,
                                                padding: '4px 10px', borderRadius: '8px', flexShrink: 0,
                                            }}>{pct}%</div>
                                        </div>
                                    );
                                })}
                            </div>
                        )}
                    </div>

                    {/* Badges */}
                    <div className="card" style={{ padding: '28px' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '24px' }}>
                            <Award size={16} style={{ color: 'var(--brand-gold)' }} />
                            <h2 style={{ fontWeight: 700, fontSize: '16px' }}>Badges</h2>
                        </div>
                        {user.badges.length === 0 ? (
                            <div style={{ textAlign: 'center', padding: '40px 0', color: 'var(--text-muted)' }}>
                                <div style={{ fontSize: '40px', marginBottom: '12px' }}>🎯</div>
                                <p style={{ fontSize: '13px' }}>Complete tests to earn badges!</p>
                            </div>
                        ) : (
                            <div className="dashboard-badges-grid">
                                {user.badges.map((b) => (
                                    <div key={b.id} style={{ textAlign: 'center' }}>
                                        <div style={{
                                            width: 52, height: 52, borderRadius: '14px',
                                            background: 'rgba(245,158,11,0.1)', border: '1px solid rgba(245,158,11,0.2)',
                                            display: 'flex', alignItems: 'center', justifyContent: 'center',
                                            fontSize: '24px', margin: '0 auto 8px',
                                        }}>{b.icon || '🎖️'}</div>
                                        <div style={{ fontSize: '11px', fontWeight: 600, color: 'var(--text-secondary)', maxWidth: '72px', margin: '0 auto' }}>{b.label}</div>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>
                </div>

            </div>
        </div>
    );
}
