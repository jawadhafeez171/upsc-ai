'use client';
import Link from 'next/link';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import { Search } from 'lucide-react';

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
        { key: 'all' as const, label: '🌐 All Exams' },
        { key: 'upsc' as const, label: '🏛️ UPSC' },
        { key: 'karnataka' as const, label: '🅺 Karnataka' },
    ];

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '80vh', padding: '40px 0' }}>
            <div style={{ maxWidth: '1080px', margin: '0 auto', padding: '0 24px' }}>
                
                {/* Header */}
                <div style={{ marginBottom: '32px' }}>
                    <h1 style={{ fontSize: '28px', fontWeight: 800, marginBottom: '6px', color: 'var(--text-primary)' }}>📚 Exam Directory</h1>
                    <p style={{ color: 'var(--text-secondary)', fontSize: '15px' }}>Pick an exam, configure your mock test, and start practicing.</p>
                </div>

                {/* Filter + Search */}
                <div style={{ display: 'flex', justifyContent: 'space-between', gap: '16px', marginBottom: '28px', flexWrap: 'wrap', alignItems: 'center' }}>
                    <div style={{ display: 'flex', gap: '6px', background: 'var(--bg-secondary)', padding: '4px', borderRadius: '10px' }}>
                        {filters.map((f) => (
                            <button key={f.key} onClick={() => setFilter(f.key)} style={{
                                padding: '7px 14px', borderRadius: '8px', border: 'none', cursor: 'pointer',
                                fontWeight: 600, fontSize: '13px',
                                background: filter === f.key ? 'var(--bg-card)' : 'transparent',
                                color: filter === f.key ? 'var(--text-primary)' : 'var(--text-secondary)',
                                boxShadow: filter === f.key ? 'var(--shadow-sm)' : 'none',
                                transition: 'all 0.15s',
                            }}>
                                {f.label}
                            </button>
                        ))}
                    </div>

                    <div style={{ position: 'relative', width: '100%', maxWidth: '280px' }}>
                        <span style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)' }}>
                            <Search size={14} />
                        </span>
                        <input
                            type="text"
                            placeholder="Search exams..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="input"
                            style={{ paddingLeft: '34px', height: '38px' }}
                        />
                    </div>
                </div>

                {/* Grid */}
                {filtered.length === 0 ? (
                    <div className="card" style={{ textAlign: 'center', padding: '48px 24px' }}>
                        <div style={{ fontSize: '40px', marginBottom: '12px' }}>🔍</div>
                        <h3 style={{ fontSize: '16px', fontWeight: 700, color: 'var(--text-primary)', marginBottom: '4px' }}>No exams found</h3>
                        <p style={{ fontSize: '13px', color: 'var(--text-secondary)' }}>Try a different search or filter.</p>
                    </div>
                ) : (
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(260px, 1fr))', gap: '16px' }}>
                        {filtered.map((exam) => (
                            <Link key={exam.id} href={`/exams/${exam.id}`} style={{ textDecoration: 'none' }}>
                                <div className="card hover-lift" style={{ padding: '20px', cursor: 'pointer', display: 'flex', flexDirection: 'column', height: '100%' }}>
                                    <div style={{ fontSize: '28px', marginBottom: '10px' }}>{exam.icon}</div>
                                    <h3 style={{ fontWeight: 700, fontSize: '15px', marginBottom: '6px', color: 'var(--text-primary)' }}>
                                        {language === 'kn' && exam.name_kn ? exam.name_kn : exam.name}
                                    </h3>
                                    <p style={{ fontSize: '13px', color: 'var(--text-secondary)', marginBottom: '14px', lineHeight: 1.45, flexGrow: 1 }}>
                                        {language === 'kn' && exam.description_kn ? exam.description_kn : exam.description}
                                    </p>
                                    
                                    <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap', marginBottom: '14px' }}>
                                        {(exam.topics || []).slice(0, 3).map((s: string) => (
                                            <span key={s} className="tag" style={{ background: 'var(--bg-secondary)', color: 'var(--text-secondary)' }}>{s}</span>
                                        ))}
                                        {exam.topics && exam.topics.length > 3 && (
                                            <span className="tag" style={{ background: 'var(--bg-secondary)', color: 'var(--text-muted)' }}>+{exam.topics.length - 3}</span>
                                        )}
                                    </div>

                                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', borderTop: '1px solid var(--border)', paddingTop: '12px', marginTop: 'auto' }}>
                                        <div style={{ display: 'flex', gap: '6px' }}>
                                            {(exam.id.startsWith('kpsc') || exam.id.startsWith('kea')) && (
                                                <span className="tag chip-sage">ಕನ್ನಡ</span>
                                            )}
                                        </div>
                                        <span style={{ color: 'var(--brand-orange)', fontWeight: 600, fontSize: '13px' }}>
                                            Configure →
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
