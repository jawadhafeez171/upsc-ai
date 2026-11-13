'use client';
import { useAppStore } from '@/lib/store';
import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import { Loader2, Trophy, Medal, Award, Crown } from 'lucide-react';

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
            <Loader2 className="animate-spin" size={28} style={{ marginBottom: '12px', color: '#2563EB' }} />
            <span>Loading leaderboard standings...</span>
        </div>
    );

    const top3 = board.slice(0, 3);

    return (
        <div style={{ background: 'transparent', minHeight: '85vh', padding: '36px 0 60px' }}>
            <div style={{ maxWidth: '720px', margin: '0 auto', padding: '0 24px' }}>
                
                {/* Header (No emoji in heading) */}
                <div style={{ textAlign: 'center', marginBottom: '36px' }}>
                    <div style={{
                        width: '44px',
                        height: '44px',
                        borderRadius: '12px',
                        background: '#1E1B4B',
                        border: '1px solid #312E81',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        margin: '0 auto 12px',
                        boxShadow: '0 2px 8px rgba(30, 27, 75, 0.25)'
                    }}>
                        <Trophy size={22} color="#F59E0B" />
                    </div>
                    <h1 style={{ fontSize: '28px', fontWeight: 800, marginBottom: '6px', color: 'var(--text-primary)' }}>
                        Leaderboard
                    </h1>
                    <p style={{ color: 'var(--text-secondary)', fontSize: '14.5px', margin: 0 }}>
                        Aspirants ranked by XP earned from completed practice tests.
                    </p>
                </div>

                {/* Podium */}
                {top3.length >= 3 && (
                    <div style={{ display: 'flex', alignItems: 'flex-end', justifyContent: 'center', gap: '16px', marginBottom: '36px' }}>
                        {[top3[1], top3[0], top3[2]].map((entry, i) => {
                            const isYou = user && entry.user_id === user.id;
                            const heights = ['90px', '125px', '75px'];
                            const podiumBgs = ['rgba(148, 163, 184, 0.08)', 'rgba(37, 99, 235, 0.1)', 'rgba(217, 119, 6, 0.08)'];
                            const borders = ['1px solid #CBD5E1', '1.5px solid #2563EB', '1px solid #FDE68A'];
                            const rankIcons = [
                                <Medal key="2" size={20} color="#94A3B8" />,
                                <Crown key="1" size={24} color="#D97706" />,
                                <Award key="3" size={20} color="#B45309" />
                            ];

                            return (
                                <div key={entry.user_id} style={{ textAlign: 'center', flex: 1, maxWidth: '160px' }}>
                                    <div style={{ display: 'flex', justifyContent: 'center', marginBottom: '6px' }}>
                                        {rankIcons[i]}
                                    </div>
                                    <div style={{ fontWeight: 800, fontSize: '13.5px', color: isYou ? '#2563EB' : 'var(--text-primary)', marginBottom: '2px', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                                        {entry.name.split(' ')[0]}
                                    </div>
                                    <div style={{ fontSize: '12px', color: 'var(--warning-text)', fontWeight: 800, fontVariantNumeric: 'tabular-nums', marginBottom: '8px' }}>
                                        {entry.xp} XP
                                    </div>
                                    <div style={{
                                        height: heights[i], background: podiumBgs[i], border: borders[i],
                                        borderRadius: '12px 12px 0 0', display: 'flex', alignItems: 'center', justifyContent: 'center',
                                        fontSize: '20px', fontWeight: 900, color: 'var(--text-primary)',
                                        boxShadow: i === 1 ? '0 4px 16px rgba(37,99,235,0.2)' : 'none',
                                    }}>
                                        {entry.name[0]}
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                )}

                {/* Full list */}
                <div className="card" style={{ overflow: 'hidden', borderRadius: '12px', border: '1px solid var(--border)' }}>
                    {board.map((entry, idx) => {
                        const isYou = user && entry.user_id === user.id;
                        return (
                            <div key={entry.user_id} style={{
                                display: 'flex', alignItems: 'center', gap: '14px', padding: '12px 18px',
                                borderBottom: idx < board.length - 1 ? '1px solid var(--border)' : 'none',
                                background: isYou ? 'rgba(37, 99, 235, 0.08)' : 'transparent',
                                transition: 'background 0.15s ease',
                            }}>
                                <div style={{ width: '28px', textAlign: 'center', fontWeight: 800, fontSize: '12.5px', color: entry.rank <= 3 ? 'var(--warning-text)' : 'var(--text-muted)', fontVariantNumeric: 'tabular-nums' }}>
                                    #{entry.rank}
                                </div>
                                <div style={{
                                    width: 34, height: 34, borderRadius: '8px',
                                    background: isYou ? '#1E1B4B' : 'var(--bg-tertiary)',
                                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                                    fontWeight: 800, fontSize: '13px', flexShrink: 0,
                                    color: isYou ? '#FFFFFF' : 'var(--text-primary)',
                                    border: isYou ? '1px solid #312E81' : '1px solid var(--border)',
                                }}>
                                    {entry.name[0]}
                                </div>
                                <div style={{ flex: 1, minWidth: 0 }}>
                                    <div style={{ fontWeight: 700, fontSize: '13.5px', color: isYou ? '#2563EB' : 'var(--text-primary)', overflow: 'hidden', textOverflow: 'ellipsis', whiteSpace: 'nowrap' }}>
                                        {entry.name}
                                    </div>
                                    <div style={{ fontSize: '11.5px', color: 'var(--text-muted)', fontWeight: 500 }}>
                                        {entry.level} Tier
                                    </div>
                                </div>
                                <div style={{ textAlign: 'right' }}>
                                    <div style={{ fontWeight: 800, fontSize: '14px', fontVariantNumeric: 'tabular-nums', color: 'var(--text-primary)' }}>
                                        {entry.xp}
                                    </div>
                                    <div style={{ fontSize: '10px', color: 'var(--text-muted)', fontWeight: 700 }}>XP</div>
                                </div>
                            </div>
                        );
                    })}
                </div>
            </div>
        </div>
    );
}
