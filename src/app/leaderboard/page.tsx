'use client';
import { useAppStore } from '@/lib/store';
import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import { Loader2 } from 'lucide-react';

const RANK_EMOJI = ['🥇', '🥈', '🥉'];

export default function LeaderboardPage() {
    const { user } = useAppStore();
    const [board, setBoard] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function fetchLeaderboard() {
            setLoading(true);
            const { data } = await supabase.from('profiles').select('id, name, xp, level_name').order('xp', { ascending: false }).limit(50);
            if (data) {
                let rank = 1;
                const formatted = data.map((d) => ({ user_id: d.id, name: d.name || 'Aspirant', xp: d.xp || 0, level: d.level_name || 'Aspirant', rank: rank++ }));
                if (user && !formatted.find(f => f.user_id === user.id)) {
                    formatted.push({ user_id: user.id, name: user.name + ' (You)', xp: user.xp, level: user.level, rank: '-' as any });
                }
                setBoard(formatted);
            }
            setLoading(false);
        }
        fetchLeaderboard();
    }, [user]);

    if (loading) return (
        <div style={{ padding: '80px', textAlign: 'center', color: 'var(--text-muted)', display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
            <Loader2 className="animate-spin" size={28} style={{ marginBottom: '12px', color: 'var(--brand-orange)' }} />
            Loading leaderboard...
        </div>
    );

    const top3 = board.slice(0, 3);

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '40px 0' }}>
            <div style={{ maxWidth: '680px', margin: '0 auto', padding: '0 24px' }}>
                
                {/* Header */}
                <div style={{ textAlign: 'center', marginBottom: '36px' }}>
                    <h1 style={{ fontSize: '28px', fontWeight: 800, marginBottom: '6px' }}>🏆 Leaderboard</h1>
                    <p style={{ color: 'var(--text-secondary)', fontSize: '15px' }}>See how you stack up against other aspirants.</p>
                </div>

                {/* Podium */}
                {top3.length >= 3 && (
                    <div style={{ display: 'flex', alignItems: 'flex-end', justifyContent: 'center', gap: '12px', marginBottom: '32px' }}>
                        {[top3[1], top3[0], top3[2]].map((entry, i) => {
                            const isYou = user && entry.user_id === user.id;
                            const heights = ['90px', '120px', '70px'];
                            const bgs = ['var(--accent-sage)', 'var(--accent-peach)', 'var(--accent-sky)'];
                            return (
                                <div key={entry.user_id} style={{ textAlign: 'center', flex: 1, maxWidth: '140px' }}>
                                    <div style={{ fontSize: '22px', marginBottom: '4px' }}>{RANK_EMOJI[i === 1 ? 0 : i === 0 ? 1 : 2]}</div>
                                    <div style={{ fontWeight: 600, fontSize: '13px', color: isYou ? 'var(--brand-orange)' : 'var(--text-primary)', marginBottom: '2px' }}>{entry.name.split(' ')[0]}</div>
                                    <div style={{ fontSize: '12px', color: 'var(--text-muted)', marginBottom: '6px' }}>{entry.xp} XP</div>
                                    <div style={{
                                        height: heights[i], background: bgs[i],
                                        borderRadius: '10px 10px 0 0', display: 'flex', alignItems: 'center', justifyContent: 'center',
                                        fontSize: '18px', fontWeight: 700, color: 'var(--text-primary)',
                                    }}>
                                        {entry.name[0]}
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                )}

                {/* Full list */}
                <div className="card" style={{ overflow: 'hidden' }}>
                    {board.map((entry, idx) => {
                        const isYou = user && entry.user_id === user.id;
                        return (
                            <div key={entry.user_id} style={{
                                display: 'flex', alignItems: 'center', gap: '12px', padding: '14px 20px',
                                borderBottom: idx < board.length - 1 ? '1px solid var(--border)' : 'none',
                                background: isYou ? 'var(--accent-peach)' : 'transparent',
                                transition: 'background 0.15s',
                            }}>
                                <div style={{ width: '28px', textAlign: 'center', fontWeight: 700, fontSize: '13px', color: entry.rank <= 3 ? 'var(--brand-orange)' : 'var(--text-muted)' }}>
                                    {entry.rank <= 3 ? RANK_EMOJI[entry.rank - 1] : `#${entry.rank}`}
                                </div>
                                <div style={{
                                    width: 34, height: 34, borderRadius: '10px',
                                    background: isYou ? 'var(--brand-orange)' : 'var(--bg-secondary)',
                                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                                    fontWeight: 700, fontSize: '14px', flexShrink: 0,
                                    color: isYou ? 'white' : 'var(--text-primary)',
                                }}>{entry.name[0]}</div>
                                <div style={{ flex: 1 }}>
                                    <div style={{ fontWeight: 600, fontSize: '14px', color: isYou ? 'var(--brand-orange)' : 'var(--text-primary)' }}>{entry.name}</div>
                                    <div style={{ fontSize: '12px', color: 'var(--text-muted)', fontWeight: 500 }}>{entry.level}</div>
                                </div>
                                <div style={{ textAlign: 'right' }}>
                                    <div style={{ fontWeight: 800, fontSize: '15px' }}>{entry.xp}</div>
                                    <div style={{ fontSize: '10px', color: 'var(--text-muted)' }}>XP</div>
                                </div>
                            </div>
                        );
                    })}
                </div>
            </div>
        </div>
    );
}
