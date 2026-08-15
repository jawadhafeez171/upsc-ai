'use client';
import Link from 'next/link';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import { Search, ArrowRight, BookOpen, Zap, Shield, Sparkles, CheckCircle2, Award, Info, Landmark, MapPin } from 'lucide-react';
import { Exam } from '@/types';

type CategoryFilter = 'all' | 'national' | 'karnataka' | 'police' | 'teaching' | 'defence';

export default function ExamsClient({ initialExams }: { initialExams: Exam[] }) {
    const { language } = useAppStore();
    const [filter, setFilter] = useState<CategoryFilter>('all');
    const [searchQuery, setSearchQuery] = useState('');
    const [exams] = useState<Exam[]>(initialExams);

    // Grouping helper
    const isNational = (e: Exam) => e.category === 'upsc' || e.category === 'defence' || e.id.startsWith('upsc') || e.id.startsWith('rbi') || e.id.startsWith('ssc');
    const isKarnataka = (e: Exam) => !isNational(e);

    const nationalExams = exams.filter(isNational);
    const karnatakaExams = exams.filter(isKarnataka);

    const filterFn = (e: Exam) => {
        let matchesCategory = true;
        if (filter === 'national') {
            matchesCategory = isNational(e);
        } else if (filter === 'karnataka') {
            matchesCategory = isKarnataka(e);
        } else if (filter === 'police') {
            matchesCategory = e.id.includes('psi') || e.id.includes('pc') || e.id.includes('police') || e.id.includes('capf');
        } else if (filter === 'teaching') {
            matchesCategory = e.category === 'teaching' || e.id.includes('tet') || e.id.includes('kset') || e.id.includes('gpstr');
        } else if (filter === 'defence') {
            matchesCategory = e.category === 'defence' || e.id.includes('cds') || e.id.includes('capf');
        }

        const nameText = (language === 'kn' && e.name_kn ? e.name_kn : (e.name || '')).toLowerCase();
        const descText = (language === 'kn' && e.description_kn ? e.description_kn : (e.description || '')).toLowerCase();
        const subjectsText = (e.subjects || []).join(' ').toLowerCase();
        const matchesSearch = nameText.includes(searchQuery.toLowerCase()) || 
                              descText.includes(searchQuery.toLowerCase()) ||
                              subjectsText.includes(searchQuery.toLowerCase());

        return matchesCategory && matchesSearch;
    };

    const filteredNational = nationalExams.filter(filterFn);
    const filteredKarnataka = karnatakaExams.filter(filterFn);
    const totalFiltered = filteredNational.length + filteredKarnataka.length;

    const filters: { key: CategoryFilter; label: string; count: number }[] = [
        { key: 'all', label: 'All Exams', count: exams.length },
        { key: 'national', label: '🏛️ National (UPSC / Defence)', count: nationalExams.length },
        { key: 'karnataka', label: '🅺 Karnataka (KEA / KPSC / KSP)', count: karnatakaExams.length },
        { key: 'police', label: '👮 Police (PSI / PC)', count: exams.filter(e => e.id.includes('psi') || e.id.includes('pc') || e.id.includes('capf')).length },
        { key: 'teaching', label: '👩‍🏫 Teaching (TET / KSET)', count: exams.filter(e => e.category === 'teaching').length },
        { key: 'defence', label: '⚔️ Defence (CDS / CAPF)', count: exams.filter(e => e.category === 'defence').length },
    ];

    const renderExamCard = (exam: Exam) => {
        const displayName = language === 'kn' && exam.name_kn ? exam.name_kn : exam.name;
        const displayDesc = language === 'kn' && exam.description_kn ? exam.description_kn : exam.description;
        const displaySubjects = language === 'kn' && exam.subjects_kn ? exam.subjects_kn : exam.subjects;

        return (
            <div 
                key={exam.id} 
                className="card"
                style={{
                    borderRadius: '18px', padding: '24px',
                    display: 'flex', flexDirection: 'column', justifyContent: 'space-between',
                    border: '1px solid var(--border)',
                    transition: 'all 0.2s',
                    position: 'relative', overflow: 'hidden'
                }}
            >
                {/* Top Card Row */}
                <div>
                    <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', marginBottom: '14px' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                            <div style={{ 
                                width: '46px', height: '46px', borderRadius: '12px', 
                                background: 'var(--bg-tertiary)', border: '1px solid var(--border)',
                                display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '22px' 
                            }}>
                                {exam.icon}
                            </div>
                            <div>
                                <h2 style={{ fontSize: '18px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '2px', lineHeight: 1.2 }}>
                                    {displayName}
                                </h2>
                                <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}>
                                    <span style={{ fontSize: '11px', fontWeight: 700, textTransform: 'uppercase', color: 'var(--brand-orange)' }}>
                                        {exam.category}
                                    </span>
                                    <span style={{ fontSize: '12px', color: 'var(--text-muted)' }}>•</span>
                                    <span style={{ fontSize: '11px', fontWeight: 600, color: 'var(--text-muted)' }}>
                                        {exam.languages.includes('kn') ? 'English & Kannada' : 'English'}
                                    </span>
                                </div>
                            </div>
                        </div>

                        {exam.badge && (
                            <span style={{ 
                                fontSize: '11px', fontWeight: 800, padding: '3px 8px', borderRadius: '6px',
                                background: 'rgba(255, 107, 43, 0.12)', color: 'var(--brand-orange)',
                                border: '1px solid rgba(255, 107, 43, 0.25)'
                            }}>
                                {exam.badge}
                            </span>
                        )}
                    </div>

                    {/* Description */}
                    <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.5, marginBottom: '16px', minHeight: '40px' }}>
                        {displayDesc}
                    </p>

                    {/* Syllabus Topic Chips */}
                    <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px', marginBottom: '20px' }}>
                        {(displaySubjects || []).slice(0, 4).map((sub, idx) => (
                            <span 
                                key={idx}
                                style={{
                                    fontSize: '11.5px', fontWeight: 600, padding: '3px 9px', borderRadius: '6px',
                                    background: 'var(--bg-tertiary)', color: 'var(--text-secondary)',
                                    border: '1px solid var(--border)'
                                }}
                            >
                                {sub}
                            </span>
                        ))}
                        {(displaySubjects || []).length > 4 && (
                            <span style={{ fontSize: '11.5px', fontWeight: 600, padding: '3px 8px', borderRadius: '6px', color: 'var(--text-muted)' }}>
                                +{(displaySubjects || []).length - 4} more
                            </span>
                        )}
                    </div>
                </div>

                {/* Action Buttons: About & Practice */}
                <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '10px', borderTop: '1px solid var(--border)', paddingTop: '16px' }}>
                    <Link 
                        href={`/exams/${exam.id}?tab=about`}
                        style={{
                            display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '6px',
                            padding: '10px 12px', borderRadius: '10px',
                            background: 'var(--bg-tertiary)', color: 'var(--text-primary)',
                            border: '1px solid var(--border)', fontSize: '13px', fontWeight: 700,
                            textDecoration: 'none', transition: 'all 0.15s'
                        }}
                    >
                        <Info size={14} color="var(--brand-teal)" />
                        About Exam
                    </Link>

                    <Link 
                        href={`/exams/${exam.id}?tab=practice`}
                        style={{
                            display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '6px',
                            padding: '10px 12px', borderRadius: '10px',
                            background: 'var(--brand-orange)', color: '#FFFFFF',
                            fontSize: '13px', fontWeight: 700, textDecoration: 'none',
                            boxShadow: '0 2px 8px rgba(255, 107, 43, 0.3)',
                            transition: 'all 0.15s'
                        }}
                    >
                        <Zap size={14} />
                        Practice
                    </Link>
                </div>
            </div>
        );
    };

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '48px 0 80px' }}>
            <div style={{ maxWidth: '1200px', margin: '0 auto', padding: '0 24px' }}>

                {/* Hero Header */}
                <div style={{ textAlign: 'center', marginBottom: '40px' }}>
                    <div style={{ 
                        display: 'inline-flex', alignItems: 'center', gap: '8px', 
                        fontSize: '12.5px', fontWeight: 700, color: 'var(--brand-orange)', 
                        background: 'rgba(255, 107, 43, 0.1)', border: '1px solid rgba(255, 107, 43, 0.25)', 
                        borderRadius: '999px', padding: '6px 16px', marginBottom: '14px' 
                    }}>
                        <Award size={15} />
                        COMPREHENSIVE EXAM CATALOG
                    </div>
                    <h1 style={{ fontSize: 'clamp(28px, 4vw, 44px)', fontWeight: 900, letterSpacing: '-0.02em', color: 'var(--text-primary)', marginBottom: '12px' }}>
                        Find Your Target Examination
                    </h1>
                    <p style={{ color: 'var(--text-secondary)', fontSize: '16px', maxWidth: '720px', margin: '0 auto', lineHeight: 1.6 }}>
                        Explore official exam patterns, career progression guides, salary structures, and practice syllabus-accurate mock tests.
                    </p>
                </div>

                {/* Filter & Search Controls */}
                <div style={{ 
                    display: 'flex', justifyContent: 'space-between', gap: '16px', 
                    marginBottom: '36px', flexWrap: 'wrap', alignItems: 'center',
                    background: 'var(--bg-card)', padding: '16px 20px', borderRadius: '18px',
                    border: '1px solid var(--border)', boxShadow: 'var(--shadow-sm)'
                }}>
                    {/* Category Filter Pills */}
                    <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                        {filters.map((f) => {
                            const isActive = filter === f.key;
                            return (
                                <button
                                    key={f.key}
                                    onClick={() => setFilter(f.key)}
                                    style={{
                                        padding: '7px 16px', borderRadius: '12px', cursor: 'pointer',
                                        fontWeight: 700, fontSize: '13px', fontFamily: 'inherit',
                                        background: isActive ? 'var(--brand-orange)' : 'var(--bg-tertiary)',
                                        color: isActive ? '#FFFFFF' : 'var(--text-secondary)',
                                        border: isActive ? '1px solid var(--brand-orange)' : '1px solid var(--border)',
                                        boxShadow: isActive ? '0 2px 8px rgba(255,107,43,0.3)' : 'none',
                                        transition: 'all 0.2s',
                                    }}
                                >
                                    {f.label}
                                </button>
                            );
                        })}
                    </div>

                    {/* Search Input */}
                    <div style={{ position: 'relative', width: '100%', maxWidth: '320px' }}>
                        <span style={{ position: 'absolute', left: '14px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)', display: 'flex', alignItems: 'center' }}>
                            <Search size={16} />
                        </span>
                        <input
                            type="text"
                            placeholder="Search by exam, post, or topic..."
                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="input"
                            style={{ paddingLeft: '40px', height: '42px', width: '100%', borderRadius: '10px', fontSize: '13.5px' }}
                        />
                    </div>
                </div>

                {/* Main Content Layout */}
                {totalFiltered === 0 ? (
                    <div className="card" style={{ textAlign: 'center', padding: '64px 24px', borderRadius: '18px' }}>
                        <div style={{ fontSize: '48px', marginBottom: '16px' }}>🔍</div>
                        <h3 style={{ fontSize: '18px', fontWeight: 700, marginBottom: '8px' }}>No exams found</h3>
                        <p style={{ fontSize: '14px', color: 'var(--text-secondary)' }}>Try adjusting your search or category filter.</p>
                    </div>
                ) : (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '48px' }}>
                        
                        {/* 1. NATIONAL & CENTRAL EXAMINATIONS (FIRST) */}
                        {filteredNational.length > 0 && (
                            <div>
                                <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '20px' }}>
                                    <div style={{ 
                                        width: '36px', height: '36px', borderRadius: '10px', 
                                        background: 'rgba(59, 130, 246, 0.1)', border: '1px solid rgba(59, 130, 246, 0.25)',
                                        display: 'flex', alignItems: 'center', justifyContent: 'center' 
                                    }}>
                                        <Landmark size={18} color="#3B82F6" />
                                    </div>
                                    <div>
                                        <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                            National & Central Government Examinations
                                        </h2>
                                        <div style={{ fontSize: '12.5px', color: 'var(--text-muted)' }}>
                                            Premier civil, defence, and central services across India ({filteredNational.length} Exams)
                                        </div>
                                    </div>
                                </div>

                                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(350px, 1fr))', gap: '20px' }}>
                                    {filteredNational.map(renderExamCard)}
                                </div>
                            </div>
                        )}

                        {/* 2. KARNATAKA STATE GOVERNMENT EXAMINATIONS (SECOND) */}
                        {filteredKarnataka.length > 0 && (
                            <div>
                                <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '20px' }}>
                                    <div style={{ 
                                        width: '36px', height: '36px', borderRadius: '10px', 
                                        background: 'rgba(242, 107, 29, 0.1)', border: '1px solid rgba(242, 107, 29, 0.25)',
                                        display: 'flex', alignItems: 'center', justifyContent: 'center' 
                                    }}>
                                        <MapPin size={18} color="var(--brand-orange)" />
                                    </div>
                                    <div>
                                        <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                            Karnataka State Government Examinations
                                        </h2>
                                        <div style={{ fontSize: '12.5px', color: 'var(--text-muted)' }}>
                                            State administrative, revenue, police, teaching, and board examinations ({filteredKarnataka.length} Exams)
                                        </div>
                                    </div>
                                </div>

                                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(350px, 1fr))', gap: '20px' }}>
                                    {filteredKarnataka.map(renderExamCard)}
                                </div>
                            </div>
                        )}
                    </div>
                )}
            </div>
        </div>
    );
}
