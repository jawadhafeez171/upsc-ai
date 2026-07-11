'use client';
import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { BookOpen, Flame, Star, Award, ChevronRight, TrendingUp } from 'lucide-react';

export default function DashboardPage() {
    const router = useRouter();
    const { user, completedSessions } = useAppStore();
    const [recentSessions, setRecentSessions] = useState<any[]>([]);
    const [examsObj, setExamsObj] = useState<Record<string, { name: string; icon: string }>>({});

    useEffect(() => {
        if (!user) { router.push('/login'); return; }
        const sorted = [...completedSessions].filter((s) => s.user_id === user.id)
            .sort((a, b) => new Date(b.finished_at || b.started_at).getTime() - new Date(a.finished_at || a.started_at).getTime())
            .slice(0, 5);
        setRecentSessions(sorted);
        async function fetchExams() {
            const { data } = await supabase.from('exams').select('id, title');
            if (data) {
                const m: Record<string, { name: string; icon: string }> = {};
                data.forEach((e) => { m[e.id] = { name: e.title, icon: e.id.includes('upsc') ? '🏛️' : e.id.includes('kpsc') ? '🅺' : '📋' }; });
                setExamsObj(m);
            }
        }
        fetchExams();
    }, [user, completedSessions, router]);

    if (!user) return null;

    const totalTests = completedSessions.filter((s) => s.user_id === user.id).length;
    const avgScore = totalTests > 0 ? Math.round((completedSessions.filter((s) => s.user_id === user.id).reduce((sum, s) => sum + (s.score || 0), 0) / completedSessions.filter((s) => s.user_id === user.id).reduce((sum, s) => sum + (s.total_marks || 1), 0)) * 100) : 0;

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '40px 0' }}>
            <div style={{ maxWidth: '1080px', margin: '0 auto', padding: '0 24px' }}>
                
                {/* Header */}
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '32px', flexWrap: 'wrap', gap: '16px' }}>
                    <div>
                        <h1 style={{ fontSize: '28px', fontWeight: 800, marginBottom: '4px' }}>👋 Welcome back, {user.name}</h1>
                        <p style={{ color: 'var(--text-secondary)', fontSize: '15px' }}>Here&apos;s your preparation overview.</p>
                    </div>
                    <Link href="/exams" className="btn btn-primary" style={{ padding: '10px 20px' }}>
                        New Test <ChevronRight size={14} />
                    </Link>
                </div>

                {/* Level card */}
                <div className="card" style={{ padding: '24px', marginBottom: '24px', background: 'var(--bg-secondary)' }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '14px', flexWrap: 'wrap', gap: '8px' }}>
                        <div>
                            <div style={{ fontSize: '12px', fontWeight: 600, color: 'var(--text-muted)', textTransform: 'uppercase' }}>Your Level</div>
                            <div style={{ fontSize: '20px', fontWeight: 800, color: 'var(--brand-orange)' }}>{user.level}</div>
                        </div>
                        <div style={{ textAlign: 'right' }}>
                            <div style={{ fontSize: '11px', color: 'var(--text-muted)' }}>Total XP</div>
                            <div style={{ fontSize: '18px', fontWeight: 800 }}>{user.xp}</div>
                        </div>
                    </div>
                    <div className="progress-bar">
                        <div className="progress-fill" style={{ width: `${(user.xp % 1000) / 10}%` }} />
                    </div>
                    <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '11px', color: 'var(--text-muted)', marginTop: '6px' }}>
                        <span>{user.xp % 1000}/1000 XP</span><span>Next level</span>
                    </div>
                </div>

                {/* Stats + Badges */}
                <div className="dashboard-layout-grid" style={{ marginBottom: '24px' }}>
                    <div className="card" style={{ padding: '24px' }}>
                        <h2 style={{ fontWeight: 700, fontSize: '16px', marginBottom: '20px' }}>📊 Your Stats</h2>
                        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '12px' }}>
                            {[
                                { emoji: '🔥', label: 'Streak', value: `${user.streak} days` },
                                { emoji: '📝', label: 'Tests', value: `${totalTests}` },
                                { emoji: '⭐', label: 'Avg Score', value: totalTests > 0 ? `${avgScore}%` : '—' },
                                { emoji: '🏅', label: 'Badges', value: `${user.badges.length}` },
                            ].map((s) => (
                                <div key={s.label} style={{ padding: '14px', background: 'var(--bg-secondary)', borderRadius: '10px' }}>
                                    <div style={{ fontSize: '18px', marginBottom: '4px' }}>{s.emoji}</div>
                                    <div style={{ fontSize: '20px', fontWeight: 800 }}>{s.value}</div>
                                    <div style={{ fontSize: '12px', color: 'var(--text-muted)', fontWeight: 500 }}>{s.label}</div>
                                </div>
                            ))}
                        </div>
                    </div>

                    <div className="card" style={{ padding: '24px' }}>
                        <h2 style={{ fontWeight: 700, fontSize: '16px', marginBottom: '20px' }}>🏅 Badges</h2>
                        {user.badges.length === 0 ? (
                            <div style={{ textAlign: 'center', padding: '32px 0', color: 'var(--text-muted)' }}>
                                <div style={{ fontSize: '32px', marginBottom: '8px' }}>🎯</div>
                                <p style={{ fontSize: '13px' }}>Complete tests to earn badges!</p>
                            </div>
                        ) : (
                            <div className="dashboard-badges-grid">
                                {user.badges.map((b) => (
                                    <div key={b.id} style={{ textAlign: 'center' }}>
                                        <div style={{
                                            width: 48, height: 48, borderRadius: '12px', background: 'var(--accent-peach)',
                                            display: 'flex', alignItems: 'center', justifyContent: 'center',
                                            fontSize: '22px', margin: '0 auto 6px'
                                        }}>{b.icon || '🎖️'}</div>
                                        <div style={{ fontSize: '11px', fontWeight: 600, color: 'var(--text-primary)', maxWidth: '72px', margin: '0 auto' }}>{b.label}</div>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>
                </div>

                {/* Recent tests */}
                <div className="card" style={{ padding: '24px' }}>
                    <h2 style={{ fontWeight: 700, fontSize: '16px', marginBottom: '20px' }}>
                        <TrendingUp size={16} style={{ marginRight: '6px', verticalAlign: 'middle', color: 'var(--brand-orange)' }} />
                        Recent Tests
                    </h2>
                    {recentSessions.length === 0 ? (
                        <div style={{ textAlign: 'center', padding: '32px 0', color: 'var(--text-muted)' }}>
                            <div style={{ fontSize: '32px', marginBottom: '8px' }}>📭</div>
                            <p style={{ fontSize: '13px' }}>No tests yet.</p>
                            <Link href="/exams" style={{ color: 'var(--brand-orange)', fontWeight: 600, textDecoration: 'none', fontSize: '13px' }}>Take your first test →</Link>
                        </div>
                    ) : (
                        <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                            {recentSessions.map((s) => {
                                const examInfo = examsObj[s.exam_id] || { name: s.exam_id, icon: '📋' };
                                const pct = Math.round(((s.score || 0) / (s.total_marks || 1)) * 100);
                                return (
                                    <div key={s.id} style={{ display: 'flex', alignItems: 'center', gap: '12px', padding: '12px 14px', background: 'var(--bg-secondary)', borderRadius: '10px' }}>
                                        <div style={{ fontSize: '22px' }}>{examInfo.icon}</div>
                                        <div style={{ flex: 1 }}>
                                            <div style={{ fontWeight: 600, fontSize: '14px' }}>{examInfo.name}</div>
                                            <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>{s.config?.question_count || 0} questions</div>
                                        </div>
                                        <div style={{ fontWeight: 800, fontSize: '15px', color: pct >= 60 ? 'var(--brand-teal)' : pct >= 40 ? '#F59E0B' : 'var(--brand-orange)' }}>{pct}%</div>
                                    </div>
                                );
                            })}
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}
