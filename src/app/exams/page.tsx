'use client';
import Link from 'next/link';
import { useState, useEffect } from 'react';
import { supabase } from '@/lib/supabase';
import { useAppStore } from '@/lib/store';
import { Filter } from 'lucide-react';

export default function ExamsPage() {
    const { language } = useAppStore();
    const [filter, setFilter] = useState<'all' | 'upsc' | 'karnataka'>('all');
    const [exams, setExams] = useState<any[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        async function fetchExams() {
            const { data, error } = await supabase.from('exams').select('*').order('created_at', { ascending: true });
            if (!error && data) {
                setExams(data);
            }
            setLoading(false);
        }
        fetchExams();
    }, []);

    // Helper to map DB topics array to subjects format expected by UI
    const filtered = filter === 'all' ? exams : exams.filter((e) => {
        // Mock data had 'category'. DB doesn't have it natively, let's infer from ID or title for now
        if (filter === 'upsc') return e.id.startsWith('upsc') || e.id.startsWith('rbi');
        if (filter === 'karnataka') return e.id.startsWith('kpsc') || e.id.startsWith('kea');
        return true;
    });

    if (loading) {
        return <div style={{ textAlign: 'center', padding: '100px', color: 'var(--text-muted)' }}>Loading exams...</div>;
    }

    return (
        <div style={{ maxWidth: '1100px', margin: '0 auto', padding: '32px 24px' }}>
            <div style={{ marginBottom: '32px' }}>
                <h1 style={{ fontSize: '32px', fontWeight: 800, marginBottom: '8px' }}>Choose Your Exam</h1>
                <p style={{ color: 'var(--text-muted)' }}>Select an exam to start practicing. Subject-wise or full mock test.</p>
            </div>

            {/* Filter tabs */}
            <div style={{ display: 'flex', gap: '8px', marginBottom: '28px', background: 'var(--bg-card)', padding: '4px', borderRadius: '10px', width: 'fit-content', border: '1px solid var(--border)' }}>
                {(['all', 'upsc', 'karnataka'] as const).map((f) => (
                    <button key={f} onClick={() => setFilter(f)} style={{
                        padding: '8px 18px', borderRadius: '8px', border: 'none', cursor: 'pointer', fontWeight: 600, fontSize: '13px',
                        background: filter === f ? 'linear-gradient(135deg, #6366F1, #8B5CF6)' : 'transparent',
                        color: filter === f ? 'white' : 'var(--text-secondary)',
                        textTransform: 'capitalize', transition: 'all 0.2s',
                    }}>
                        {f === 'all' ? '🌐 All' : f === 'upsc' ? '🏛️ UPSC' : '🅺 Karnataka'}
                    </button>
                ))}
            </div>

            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '20px' }}>
                {filtered.map((exam) => (
                    <Link key={exam.id} href={`/exams/${exam.id}`} style={{ textDecoration: 'none' }}>
                        <div className="card" style={{ padding: '24px', cursor: 'pointer', position: 'relative', overflow: 'hidden' }}>
                            <div style={{ position: 'absolute', top: 0, right: 0, width: '120px', height: '120px', background: exam.color, opacity: 0.06, borderRadius: '0 0 0 120px' }} />
                            <div style={{ fontSize: '36px', marginBottom: '12px' }}>{exam.icon}</div>
                            <div style={{ fontWeight: 700, fontSize: '18px', marginBottom: '4px' }}>
                                {language === 'kn' && exam.name_kn ? exam.name_kn : exam.name}
                            </div>
                            <div style={{ fontSize: '13px', color: 'var(--text-muted)', marginBottom: '16px', lineHeight: 1.5 }}>
                                {language === 'kn' && exam.description_kn ? exam.description_kn : exam.description}
                            </div>
                            <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap', marginBottom: '12px' }}>
                                {(exam.topics || []).slice(0, 3).map((s: string) => (
                                    <span key={s} className="tag" style={{ background: 'var(--border)', color: 'var(--text-secondary)', fontSize: '11px' }}>{s}</span>
                                ))}
                                {exam.topics && exam.topics.length > 3 && <span className="tag" style={{ background: 'var(--border)', color: 'var(--text-muted)', fontSize: '11px' }}>+{exam.topics.length - 3}</span>}
                            </div>
                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                                <div style={{ display: 'flex', gap: '6px' }}>
                                    {/* Languages aren't currently in the DB schema for exams directly, we assume Kn based on ID for now */}
                                    {(exam.id.startsWith('kpsc') || exam.id.startsWith('kea')) && (
                                        <span className="tag" style={{ background: 'rgba(6,182,212,0.1)', color: 'var(--accent-cyan)', border: '1px solid rgba(6,182,212,0.2)', fontSize: '11px' }}>ಕನ್ನಡ</span>
                                    )}
                                    {/* We didn't migrate negative_marking, so assume 0.33 for UPSC for now */}
                                    {exam.id.startsWith('upsc') && (
                                        <span className="tag badge-hard" style={{ fontSize: '11px' }}>-0.33 mark</span>
                                    )}
                                </div>
                                <span style={{ color: 'var(--accent-indigo)', fontWeight: 600, fontSize: '13px' }}>Start →</span>
                            </div>
                        </div>
                    </Link>
                ))}
            </div>
        </div>
    );
}
