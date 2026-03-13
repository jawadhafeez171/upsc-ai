'use client';
import { useAppStore } from '@/lib/store';
import { useEffect, useState } from 'react';
import { supabase } from '@/lib/supabase';
import { Trophy, Loader2 } from 'lucide-react';

const LEVEL_COLS: Record<string, string> = {
    Aspirant: '#94A3B8', Scholar: '#10B981', Expert: '#6366F1', Legend: '#F59E0B'
};
const RANK_MEDALS = ['🥇', '🥈', '🥉'];

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
                const formatted = data.map((d) => ({
                    user_id: d.id,
                    name: d.name || 'Aspirant',
                    xp: d.xp || 0,
                    level: d.level_name || 'Aspirant',
                    rank: rank++
                }));
                // Make sure logged-in user isn't missing if they're rank > 50
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
            <Loader2 className="animate-spin" size={32} style={{ marginBottom: '16px', color: 'var(--accent-indigo)' }} />
            Loading live leaderboard...
        </div>
    );

    return (
        <div style={{ maxWidth: '700px', margin: '0 auto', padding: '32px 24px' }}>
            <div style={{ marginBottom: '32px', textAlign: 'center' }}>
                <div style={{ fontSize: '48px', marginBottom: '12px' }}>🏆</div>
                <h1 style={{ fontSize: '32px', fontWeight: 800 }}>Leaderboard</h1>
                <p style={{ color: 'var(--text-muted)', marginTop: '6px' }}>Top aspirants ranked by XP earned</p>
            </div>

            {/* Top 3 podium */}
            <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'flex-end', gap: '12px', marginBottom: '32px' }}>
                {[board[1], board[0], board[2]].map((entry, i) => {
                    if (!entry) return null;
                    const heights = [130, 160, 110];
                    const isYou = user && entry.user_id === user.id;
                    return (
                        <div key={entry.user_id} style={{ textAlign: 'center', flex: 1, maxWidth: '160px' }}>
                            <div style={{ fontSize: '20px', marginBottom: '6px' }}>{RANK_MEDALS[i === 1 ? 0 : i === 0 ? 1 : 2]}</div>
                            <div style={{ fontWeight: 700, fontSize: '13px', color: isYou ? 'var(--accent-indigo)' : 'var(--text-primary)', marginBottom: '4px' }}>{entry.name.split(' ')[0]}</div>
                            <div style={{ fontSize: '12px', color: 'var(--text-muted)', marginBottom: '8px' }}>{entry.xp} XP</div>
                            <div style={{
                                height: `${heights[i]}px`,
                                background: i === 1 ? 'linear-gradient(135deg, #F59E0B, #FCD34D)' : i === 0 ? 'linear-gradient(135deg, #94A3B8, #CBD5E1)' : 'linear-gradient(135deg, #B45309, #D97706)',
                                borderRadius: '8px 8px 0 0', display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '24px',
                            }}>
                                {entry.name[0]}
                            </div>
                        </div>
                    );
                })}
            </div>

            {/* Full list */}
            <div className="card" style={{ overflow: 'hidden' }}>
                {board.map((entry) => {
                    const isYou = user && entry.user_id === user.id;
                    return (
                        <div key={entry.user_id} style={{
                            display: 'flex', alignItems: 'center', gap: '14px', padding: '14px 20px',
                            borderBottom: '1px solid var(--border)',
                            background: isYou ? 'rgba(99,102,241,0.08)' : 'transparent',
                            transition: 'background 0.2s',
                        }}>
                            <div style={{ width: '28px', textAlign: 'center', fontWeight: 800, fontSize: '14px', color: entry.rank <= 3 ? '#F59E0B' : 'var(--text-muted)' }}>
                                {entry.rank <= 3 ? RANK_MEDALS[entry.rank - 1] : typeof entry.rank === 'number' ? `#${entry.rank}` : entry.rank}
                            </div>
                            <div style={{ width: 38, height: 38, borderRadius: '50%', background: `linear-gradient(135deg, ${LEVEL_COLS[entry.level]}, ${LEVEL_COLS[entry.level]}88)`, display: 'flex', alignItems: 'center', justifyContent: 'center', fontWeight: 700, color: 'white', fontSize: '15px', flexShrink: 0 }}>
                                {entry.name[0]}
                            </div>
                            <div style={{ flex: 1 }}>
                                <div style={{ fontWeight: 600, fontSize: '14px', color: isYou ? 'var(--accent-indigo)' : 'var(--text-primary)' }}>{entry.name}</div>
                                <div style={{ fontSize: '12px', color: LEVEL_COLS[entry.level] }}>{entry.level}</div>
                            </div>
                            <div style={{ textAlign: 'right' }}>
                                <div style={{ fontWeight: 800, fontSize: '16px', color: 'var(--accent-amber)' }}>{entry.xp}</div>
                                <div style={{ fontSize: '11px', color: 'var(--text-muted)' }}>XP</div>
                            </div>
                        </div>
                    );
                })}
            </div>
        </div>
    );
}
