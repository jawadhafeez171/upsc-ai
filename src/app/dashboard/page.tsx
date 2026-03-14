'use client';
import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { ALL_BADGES } from '@/lib/mockData';
import { supabase } from '@/lib/supabase';
import { Flame, Star, Trophy, BookOpen, Target, TrendingUp } from 'lucide-react';

function XPBar({ xp, level }: { xp: number; level: string }) {
    const thresholds: Record<string, [number, number]> = {
        Aspirant: [0, 500], Scholar: [500, 1500], Expert: [1500, 3000], Legend: [3000, 5000],
    };
    const [min, max] = thresholds[level] || [0, 500];
    const pct = Math.min(((xp - min) / (max - min)) * 100, 100);
    const levelColors: Record<string, string> = { Aspirant: '#94A3B8', Scholar: '#10B981', Expert: '#6366F1', Legend: '#F59E0B' };

    return (
        <div>
            <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '12px', color: 'var(--text-muted)', marginBottom: '6px' }}>
                <span style={{ color: levelColors[level], fontWeight: 700 }}>{level}</span>
                <span>{xp} / {max} XP</span>
            </div>
            <div className="progress-bar">
                <div className="progress-fill" style={{ width: `${pct}%`, background: `linear-gradient(90deg, ${levelColors[level]}, ${levelColors[level]}aa)` }} />
            </div>
        </div>
    );
}

export default function DashboardPage() {
    const router = useRouter();
    const { user, completedSessions } = useAppStore();

    const [examsObj, setExamsObj] = useState<Record<string, any>>({});
    const [userRank, setUserRank] = useState<number | null>(null);
    const [cloudHistory, setCloudHistory] = useState<any[]>([]);

    useEffect(() => {
        if (!user) router.push('/login');
        
        async function fetchDashboardData() {
            if (!user) return;
            // Fetch exams lookup
            const { data: examsData } = await supabase.from('exams').select('id, title');
            if (examsData) {
                const map: Record<string, any> = {};
                examsData.forEach(e => map[e.id] = { name: e.title, icon: e.id.includes('upsc') ? '🏛️' : e.id.includes('kpsc') ? '🅺' : '📋' });
                setExamsObj(map);
            }
            
            
            // Calculate real rank
            let { count } = await supabase.from('profiles').select('id', { count: 'exact', head: true }).gt('xp', user.xp);
            setUserRank((count || 0) + 1);

            // Fetch recent test history from the cloud
            const { data: historyData } = await supabase.from('test_history').select('*').eq('user_id', user.id).order('created_at', { ascending: false });
            if (historyData) setCloudHistory(historyData);
        }
        
        fetchDashboardData();
    }, [user, router]);

    if (!user) return null;

    const recentSessions = cloudHistory.slice(0, 5);
    const totalTests = cloudHistory.length;
    const avgScore = totalTests > 0
        ? Math.round(cloudHistory.reduce((acc, s) => acc + ((s.score || 0) / (s.total_marks || 1)) * 100, 0) / totalTests)
        : 0;

    return (
        <div style={{ maxWidth: '1100px', margin: '0 auto', padding: '32px 24px' }}>
            {/* Header */}
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '32px', flexWrap: 'wrap', gap: '16px' }}>
                <div>
                    <div style={{ fontSize: '14px', color: 'var(--text-muted)' }}>Welcome back,</div>
                    <h1 style={{ fontSize: '30px', fontWeight: 800 }}>{user.name} 👋</h1>
                </div>
                <Link href="/exams" className="btn btn-primary">
                    <Target size={16} /> Start a Test
                </Link>
            </div>

            {/* Stats grid */}
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(180px, 1fr))', gap: '16px', marginBottom: '32px' }}>
                {/* XP Card */}
                <div className="card" style={{ padding: '20px', gridColumn: 'span 2' }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: '4px' }}>
                        <span style={{ fontSize: '13px', color: 'var(--text-muted)' }}>Progress</span>
                        {userRank !== null && <span style={{ fontSize: '12px', fontWeight: 600, color: 'var(--accent-indigo)', background: 'rgba(99,102,241,0.1)', padding: '2px 8px', borderRadius: '12px' }}>Rank #{userRank}</span>}
                    </div>
                    <div style={{ fontSize: '32px', fontWeight: 800, marginBottom: '12px' }}>{user.xp} <span style={{ fontSize: '16px', color: 'var(--accent-amber)' }}>XP</span></div>
                    <XPBar xp={user.xp} level={user.level} />
                </div>
                {[
                    { 
                        icon: <Flame size={20} color="#F59E0B" />, 
                        label: 'Day Streak', 
                        value: `${user.streak} 🔥`,
                        sub: user.last_active ? `Last active: ${new Date(user.last_active).toLocaleDateString()}` : 'No activity yet'
                    },
                    { icon: <BookOpen size={20} color="#6366F1" />, label: 'Tests Taken', value: totalTests },
                    { icon: <Star size={20} color="#10B981" />, label: 'Avg Score', value: totalTests > 0 ? `${avgScore}%` : '—' },
                    { icon: <Trophy size={20} color="#06B6D4" />, label: 'Badges', value: user.badges.length },
                ].map((s) => (
                    <div key={s.label} className="card" style={{ padding: '20px' }}>
                        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '8px' }}>
                            <span style={{ fontSize: '13px', color: 'var(--text-muted)' }}>{s.label}</span>
                            {s.icon}
                        </div>
                        <div style={{ fontSize: '28px', fontWeight: 800 }}>{s.value}</div>
                        {s.sub && <div style={{ fontSize: '11px', color: 'var(--text-muted)', marginTop: '4px' }}>{s.sub}</div>}
                    </div>
                ))}
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '24px' }}>
                {/* Badges */}
                <div className="card" style={{ padding: '24px' }}>
                    <h2 style={{ fontWeight: 700, marginBottom: '16px', display: 'flex', gap: '8px', alignItems: 'center' }}>
                        <span>🏅</span> Badges
                    </h2>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '12px' }}>
                        {ALL_BADGES.map((badge) => {
                            const earned = user.badges.some((b) => b.type === badge.type);
                            return (
                                <div key={badge.id} title={`${badge.label}: ${badge.description}`} style={{
                                    display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '6px',
                                    opacity: earned ? 1 : 0.3, filter: earned ? 'none' : 'grayscale(1)',
                                    cursor: 'default',
                                }}>
                                    <div style={{ fontSize: '28px' }}>{badge.icon}</div>
                                    <div style={{ fontSize: '10px', color: 'var(--text-muted)', textAlign: 'center', lineHeight: 1.2 }}>{badge.label}</div>
                                    {earned && <div style={{ width: '6px', height: '6px', borderRadius: '50%', background: '#10B981' }} />}
                                </div>
                            );
                        })}
                    </div>
                </div>

                {/* Recent tests */}
                <div className="card" style={{ padding: '24px' }}>
                    <h2 style={{ fontWeight: 700, marginBottom: '16px', display: 'flex', gap: '8px', alignItems: 'center' }}>
                        <TrendingUp size={18} /> Recent Tests
                    </h2>
                    {recentSessions.length === 0 ? (
                        <div style={{ textAlign: 'center', padding: '32px 0', color: 'var(--text-muted)' }}>
                            <div style={{ fontSize: '32px', marginBottom: '8px' }}>📭</div>
                            No tests taken yet.<br />
                            <Link href="/exams" style={{ color: 'var(--accent-indigo)', fontWeight: 600, textDecoration: 'none', fontSize: '14px' }}>Start one now →</Link>
                        </div>
                    ) : (
                        <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                            {recentSessions.map((s) => {
                                const examInfo = examsObj[s.exam_id] || { name: s.exam_id, icon: '📋' };
                                const pct = Math.round(((s.score || 0) / (s.total_marks || 1)) * 100);
                                return (
                                    <div key={s.id} style={{ display: 'flex', alignItems: 'center', gap: '12px', padding: '10px', background: 'var(--bg-secondary)', borderRadius: '8px' }}>
                                        <div style={{ fontSize: '20px' }}>{examInfo.icon}</div>
                                        <div style={{ flex: 1 }}>
                                            <div style={{ fontWeight: 600, fontSize: '13px' }}>{examInfo.name}</div>
                                            <div style={{ fontSize: '11px', color: 'var(--text-muted)' }}>{s.config?.question_count || 0} questions · {s.config?.mode === 'subject' ? s.config.subject : 'Full Mock'}</div>
                                        </div>
                                        <div style={{ fontWeight: 700, fontSize: '15px', color: pct >= 60 ? '#10B981' : pct >= 40 ? '#F59E0B' : '#F43F5E' }}>{pct}%</div>
                                    </div>
                                );
                            })}
                        </div>
                    )}
                </div>
            </div>

            <style>{`
        @media (max-width: 768px) {
          div[style*="grid-template-columns: 1fr 1fr"] { grid-template-columns: 1fr !important; }
        }
      `}</style>
        </div>
    );
}
