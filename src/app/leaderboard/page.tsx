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
                    <div style={{ display: 'flex', alignItems: 'flex-end', justifyContent: 'center', gap: '16px', marginBottom: '36px' }}>
                        {[top3[1], top3[0], top3[2]].map((entry, i) => {
                            const isYou = user && entry.user_id === user.id;
                            const heights = ['100px', '135px', '80px'];
                            const podiumBgs = ['rgba(2, 132, 199, 0.15)', 'rgba(37, 99, 235, 0.25)', 'rgba(225, 29, 72, 0.15)'];
                            const borders = ['1px solid rgba(2, 132, 199, 0.4)', '1px solid rgba(37, 99, 235, 0.5)', '1px solid rgba(225, 29, 72, 0.4)'];
                            return (
                                <div key={entry.user_id} style={{ textAlign: 'center', flex: 1, maxWidth: '150px' }}>
                                    <div style={{ fontSize: '24px', marginBottom: '6px' }}>{RANK_EMOJI[i === 1 ? 0 : i === 0 ? 1 : 2]}</div>
                                    <div style={{ fontWeight: 800, fontSize: '14px', color: isYou ? 'var(--brand-orange)' : 'var(--text-primary)', marginBottom: '2px' }}>{entry.name.split(' ')[0]}</div>
                                    <div style={{ fontSize: '12px', color: 'var(--brand-gold)', fontWeight: 700, marginBottom: '8px' }}>{entry.xp} XP</div>
                                    <div style={{
                                        height: heights[i], background: podiumBgs[i], border: borders[i],
                                        borderRadius: '14px 14px 0 0', display: 'flex', alignItems: 'center', justifyContent: 'center',
                                        fontSize: '22px', fontWeight: 800, color: 'var(--text-primary)',
                                        boxShadow: i === 1 ? '0 0 24px rgba(37,99,235,0.3)' : 'none',
                                    }}>
                                        {entry.name[0]}
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                )}

                {/* Full list */}
                <div className="card" style={{ overflow: 'hidden', borderRadius: '16px' }}>
                    {board.map((entry, idx) => {
                        const isYou = user && entry.user_id === user.id;
                        return (
                            <div key={entry.user_id} style={{
                                display: 'flex', alignItems: 'center', gap: '14px', padding: '14px 20px',
                                borderBottom: idx < board.length - 1 ? '1px solid var(--border)' : 'none',
                                background: isYou ? 'rgba(37, 99, 235, 0.12)' : 'transparent',
                                borderLeft: isYou ? '3px solid var(--brand-orange)' : 'none',
                                transition: 'background 0.15s',
                            }}>
                                <div style={{ width: '28px', textAlign: 'center', fontWeight: 800, fontSize: '13px', color: entry.rank <= 3 ? 'var(--brand-gold)' : 'var(--text-muted)' }}>
                                    {entry.rank <= 3 ? RANK_EMOJI[entry.rank - 1] : `#${entry.rank}`}
                                </div>
                                <div style={{
                                    width: 36, height: 36, borderRadius: '10px',
                                    background: isYou ? 'var(--brand-orange)' : 'var(--bg-tertiary)',
                                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                                    fontWeight: 800, fontSize: '14px', flexShrink: 0,
                                    color: isYou ? 'white' : 'var(--text-primary)',
                                    border: '1px solid var(--border)',
                                }}>{entry.name[0]}</div>
                                <div style={{ flex: 1 }}>
                                    <div style={{ fontWeight: 700, fontSize: '14px', color: isYou ? 'var(--brand-orange)' : 'var(--text-primary)' }}>{entry.name}</div>
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
