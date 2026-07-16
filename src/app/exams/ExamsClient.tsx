'use client';
import Link from 'next/link';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import { Search, ArrowRight } from 'lucide-react';

export default function ExamsClient({ initialExams }: { initialExams: any[] }) {
    const { language } = useAppStore();
    const [filter, setFilter] = useState<'all' | 'upsc' | 'karnataka'>('all');
    const [searchQuery, setSearchQuery] = useState('');
    const [exams] = useState<any[]>(initialExams);

    const filtered = exams.filter((e) => {
        const matchesCategory = filter === 'all' ||
            (filter === 'upsc' && (e.id.startsWith('upsc') || e.id.startsWith('rbi'))) ||
            (filter === 'karnataka' && (e.id.startsWith('kpsc') || e.id.startsWith('kea')));

        const nameText = (language === 'kn' && e.name_kn ? e.name_kn : (e.name || '')).toLowerCase();
        const descText = (language === 'kn' && e.description_kn ? e.description_kn : (e.description || '')).toLowerCase();
        const matchesSearch = nameText.includes(searchQuery.toLowerCase()) || descText.includes(searchQuery.toLowerCase());

        return matchesCategory && matchesSearch;
    });

    const filters = [
        { key: 'all' as const, label: 'All Exams' },
        { key: 'upsc' as const, label: '🏛️ UPSC' },
        { key: 'karnataka' as const, label: '🅺 Karnataka' },
    ];

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '48px 0' }}>
            <div style={{ maxWidth: '1080px', margin: '0 auto', padding: '0 24px' }}>

                {/* Header */}
                <div style={{ marginBottom: '40px' }} className="fade-in-up">
                    <div style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', fontSize: '12px', fontWeight: 600, color: 'var(--brand-orange)', background: 'rgba(242, 107, 29, 0.1)', border: '1px solid rgba(242, 107, 29, 0.2)', borderRadius: '999px', padding: '5px 14px', marginBottom: '16px' }}>
                        EXAM CATALOG
                    </div>
                    <h1 style={{ fontSize: 'clamp(28px, 4vw, 42px)', fontWeight: 900, letterSpacing: '-0.8px', marginBottom: '10px' }}>
                        Find Your Exam
                    </h1>
                    <p style={{ color: 'var(--text-secondary)', fontSize: '15px', lineHeight: 1.6 }}>
                        Pick an exam, configure your mock test, and start practicing.
                    </p>
                </div>

                {/* Filter + Search Row */}
                <div style={{ display: 'flex', justifyContent: 'space-between', gap: '16px', marginBottom: '32px', flexWrap: 'wrap', alignItems: 'center' }}>
                    {/* Filter Pills */}
                    <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                        {filters.map((f) => (
                            <button
                                key={f.key}
                                onClick={() => setFilter(f.key)}
                                style={{
                                    padding: '8px 18px', borderRadius: '999px', cursor: 'pointer',
                                    fontWeight: 600, fontSize: '13px', fontFamily: 'inherit',
                                    background: filter === f.key
                                        ? 'linear-gradient(135deg, var(--brand-orange), var(--brand-orange-dim))'
                                        : 'var(--bg-card)',
                                    color: filter === f.key ? 'white' : 'var(--text-secondary)',
                                    border: filter === f.key ? 'none' : '1px solid var(--border)',
                                    boxShadow: filter === f.key ? '0 2px 12px rgba(242,107,29,0.35)' : 'none',
                                    transition: 'all 0.2s',
                                    backdropFilter: 'blur(8px)',
                                }}
                            >
                                {f.label}
                            </button>
                        ))}
                    </div>

                    {/* Search */}
                    <div style={{ position: 'relative', width: '100%', maxWidth: '300px' }}>
                        <span style={{ position: 'absolute', left: '14px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)', display: 'flex', alignItems: 'center' }}>
                            <Search size={15} />
                        </span>
                        <input
                            type="text"
                            placeholder="Search exams..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="input"
                            style={{ paddingLeft: '40px', height: '42px' }}
                        />
                    </div>
                </div>

                {/* Grid */}
                {filtered.length === 0 ? (
                    <div className="card" style={{ textAlign: 'center', padding: '64px 24px' }}>
                        <div style={{ fontSize: '48px', marginBottom: '16px' }}>🔍</div>
                        <h3 style={{ fontSize: '18px', fontWeight: 700, marginBottom: '8px' }}>No exams found</h3>
                        <p style={{ fontSize: '14px', color: 'var(--text-secondary)' }}>Try a different search or filter.</p>
                    </div>
                ) : (
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '16px' }}>
                        {filtered.map((exam) => (
                            <Link key={exam.id} href={`/exams/${exam.id}`} style={{ textDecoration: 'none' }}>
                                <div className="exam-card" style={{ borderTop: `2px solid ${exam.color}` }}>
                                    {/* Gradient overlay */}
                                    <div style={{
                                        position: 'absolute', top: 0, left: 0, right: 0, height: '60px',
                                        background: `linear-gradient(180deg, ${exam.color}14 0%, transparent 100%)`,
                                        pointerEvents: 'none',
                                    }} />
                                    <div className="exam-icon-wrapper" style={{ background: `${exam.color}15`, border: `1px solid ${exam.color}30` }}>
                                        {exam.icon}
                                    </div>
                                    <h3 style={{ fontWeight: 700, fontSize: '15px', marginBottom: '8px' }}>
                                        {language === 'kn' && exam.name_kn ? exam.name_kn : exam.name}
                                    </h3>
                                    <p style={{ fontSize: '13px', color: 'var(--text-secondary)', marginBottom: '16px', lineHeight: 1.55, flexGrow: 1 }}>
                                        {language === 'kn' && exam.description_kn ? exam.description_kn : exam.description}
                                    </p>

                                    {/* Topics */}
                                    <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap', marginBottom: '16px' }}>
                                        {(exam.topics || []).slice(0, 3).map((s: string) => (
                                            <span key={s} className="tag" style={{ background: 'var(--bg-secondary)', color: 'var(--text-muted)', border: '1px solid var(--border)', fontSize: '11px' }}>{s}</span>
                                        ))}
                                        {exam.topics && exam.topics.length > 3 && (
                                            <span className="tag" style={{ background: 'var(--bg-secondary)', color: 'var(--text-muted)', border: '1px solid var(--border)', fontSize: '11px' }}>+{exam.topics.length - 3}</span>
                                        )}
                                    </div>

                                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderTop: '1px solid var(--border)', paddingTop: '14px', marginTop: 'auto' }}>
                                        <div style={{ display: 'flex', gap: '6px' }}>
                                            {(exam.id.startsWith('kpsc') || exam.id.startsWith('kea')) && (
                                                <span className="tag chip-sage">ಕನ್ನಡ</span>
                                            )}
                                        </div>
                                        <span style={{ color: 'var(--brand-orange)', fontWeight: 600, fontSize: '13px', display: 'flex', alignItems: 'center', gap: '4px' }}>
                                            Configure <ArrowRight size={13} />
                                        </span>
                                    </div>
                                </div>
                            </Link>
                        ))}
                    </div>
                )}
            </div>
        </div>
    );
}
