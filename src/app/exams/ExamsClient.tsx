'use client';
import Link from 'next/link';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import {
    Search,
    ArrowRight,
    BookOpen,
    Zap,
    Shield,
    ShieldCheck,
    Info,
    Landmark,
    MapPin,
    GraduationCap,
    Swords,
    Inbox
} from 'lucide-react';
import { Exam } from '@/types';

type CategoryFilter = 'all' | 'national' | 'karnataka' | 'police' | 'teaching' | 'defence';

function getExamIcon(exam: Exam) {
    const c = 'var(--text-secondary)';
    if (exam.id.includes('upsc-cse')) return <Landmark size={22} color={c} />;
    if (exam.id.includes('capf') || exam.id.includes('cds') || exam.category === 'defence') return <Swords size={22} color={c} />;
    if (exam.id.includes('psi') || exam.id.includes('pc') || exam.id.includes('police')) return <ShieldCheck size={22} color={c} />;
    if (exam.category === 'teaching' || exam.id.includes('tet') || exam.id.includes('kset')) return <GraduationCap size={22} color={c} />;
    if (exam.category === 'karnataka' || exam.id.includes('kpsc') || exam.id.includes('kas') || exam.id.includes('kea')) return <MapPin size={22} color={c} />;
    return <BookOpen size={22} color={c} />;
}

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

    const filters: { key: CategoryFilter; label: string; icon: React.ReactNode; count: number }[] = [
        { key: 'all', label: 'All Exams', icon: <BookOpen size={14} />, count: exams.length },
        { key: 'national', label: 'National (UPSC / Defence)', icon: <Landmark size={14} />, count: nationalExams.length },
        { key: 'karnataka', label: 'Karnataka (KEA / KPSC / KSP)', icon: <MapPin size={14} />, count: karnatakaExams.length },
        { key: 'police', label: 'Police (PSI / PC)', icon: <ShieldCheck size={14} />, count: exams.filter(e => e.id.includes('psi') || e.id.includes('pc') || e.id.includes('capf')).length },
        { key: 'teaching', label: 'Teaching (TET / KSET)', icon: <GraduationCap size={14} />, count: exams.filter(e => e.category === 'teaching').length },
        { key: 'defence', label: 'Defence (CDS / CAPF)', icon: <Swords size={14} />, count: exams.filter(e => e.category === 'defence').length },
    ];

    const renderExamCard = (exam: Exam) => {
        const displayName = language === 'kn' && exam.name_kn ? exam.name_kn : exam.name;
        const displayDesc = language === 'kn' && exam.description_kn ? exam.description_kn : exam.description;
        const displaySubjects = language === 'kn' && exam.subjects_kn ? exam.subjects_kn : exam.subjects;

        return (
            <div 
                key={exam.id} 
                className="card card-static"
                style={{
                    borderRadius: '12px', padding: '24px',
                    display: 'flex', flexDirection: 'column', justifyContent: 'space-between',
                    border: '1px solid var(--border)',
                    boxShadow: 'var(--shadow-card)',
                    transition: 'all 0.2s',
                    position: 'relative', overflow: 'hidden'
                }}
            >
                {/* Top Card Row */}
                <div>
                    <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', marginBottom: '14px' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '12px' }}>
                            <div style={{ 
                                width: '42px', height: '42px', borderRadius: '10px', 
                                background: 'var(--bg-tertiary)', border: '1px solid var(--border)',
                                display: 'flex', alignItems: 'center', justifyContent: 'center',
                                flexShrink: 0
                            }}>
                                {getExamIcon(exam)}
                            </div>
                            <div>
                                <h3 style={{ fontSize: '17px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '2px', lineHeight: 1.25 }}>
                                    {displayName}
                                </h3>
                                <div style={{ display: 'flex', gap: '6px', alignItems: 'center' }}>
                                    <span style={{ fontSize: '11px', fontWeight: 800, textTransform: 'uppercase', color: 'var(--brand-orange-text)' }}>
                                        {exam.category}
                                    </span>
                                    <span style={{ fontSize: '12px', color: 'var(--text-muted)' }}>•</span>
                                    <span style={{ fontSize: '11px', fontWeight: 600, color: 'var(--text-muted)' }}>
                                        {exam.languages.includes('kn') ? 'English & Kannada' : exam.languages.includes('hi') ? 'English & Hindi' : 'English'}
                                    </span>
                                </div>
                            </div>
                        </div>

                        {exam.badge && (
                            <span style={{ 
                                fontSize: '11px', fontWeight: 700, padding: '2px 8px', borderRadius: '6px',
                                background: 'var(--bg-tertiary)', color: 'var(--text-secondary)',
                                border: '1px solid var(--border)', whiteSpace: 'nowrap', flexShrink: 0, marginLeft: '8px'
                            }}>
                                {exam.badge}
                            </span>
                        )}
                    </div>

                    {/* Description */}
                    <p style={{ fontSize: '13px', color: 'var(--text-secondary)', lineHeight: 1.55, marginBottom: '16px', minHeight: '40px' }}>
                        {displayDesc}
                    </p>

                    {/* Syllabus Topic Chips */}
                    <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px', marginBottom: '20px' }}>
                        {(displaySubjects || []).slice(0, 3).map((sub, idx) => (
                            <span
                                key={idx}
                                title={sub}
                                style={{
                                    fontSize: '11.5px', fontWeight: 600, padding: '3px 8px', borderRadius: '6px',
                                    background: 'var(--bg-tertiary)', color: 'var(--text-secondary)',
                                    border: '1px solid var(--border)',
                                    maxWidth: '100%', whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis'
                                }}
                            >
                                {sub}
                            </span>
                        ))}
                        {(displaySubjects || []).length > 3 && (
                            <span style={{ fontSize: '11.5px', fontWeight: 600, padding: '3px 6px', borderRadius: '6px', color: 'var(--text-muted)' }}>
                                +{(displaySubjects || []).length - 3} more
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
                            padding: '9px 12px', minHeight: '40px', borderRadius: '8px',
                            background: 'var(--bg-secondary)', color: 'var(--text-primary)',
                            border: '1px solid var(--border)', fontSize: '13px', fontWeight: 700,
                            textDecoration: 'none', transition: 'all 0.15s',
                            boxShadow: 'var(--shadow-sm)'
                        }}
                    >
                        <Info size={14} color="var(--link-text)" />
                        About exam
                    </Link>

                    <Link 
                        href={`/exams/${exam.id}?tab=practice`}
                        style={{
                            display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '6px',
                            padding: '9px 12px', minHeight: '40px', borderRadius: '8px',
                            background: '#1E1B4B', color: '#FFFFFF',
                            fontSize: '13px', fontWeight: 700, textDecoration: 'none',
                            border: '1px solid #312E81',
                            boxShadow: '0 1px 3px rgba(30, 27, 75, 0.25)',
                            transition: 'all 0.15s'
                        }}
                    >
                        <Zap size={14} color="#FFFFFF" />
                        Practise
                    </Link>
                </div>
            </div>
        );
    };

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '44px 0 80px' }}>
            <div style={{ maxWidth: '1200px', margin: '0 auto', padding: '0 24px' }}>

                {/* Clean Headline (No kicker above) */}
                <div style={{ textAlign: 'center', marginBottom: '36px' }}>
                    <h1 style={{ fontSize: 'clamp(28px, 4vw, 42px)', fontWeight: 900, letterSpacing: '-0.025em', color: 'var(--text-primary)', marginBottom: '10px' }}>
                        Exams
                    </h1>
                    <p style={{ color: 'var(--text-secondary)', fontSize: '15.5px', maxWidth: '720px', margin: '0 auto', lineHeight: 1.6 }}>
                        Pick an exam to see its pattern and syllabus, then practise its previous-year questions on a timed exam screen.
                    </p>
                </div>

                {/* Filter & Search Controls */}
                <div className="catalog-controls" style={{
                    marginBottom: '36px',
                    background: 'var(--bg-card)', padding: '16px 20px', borderRadius: '12px',
                    border: '1px solid var(--border)', boxShadow: 'var(--shadow-card)'
                }}>
                    {/* Category Filter Pills */}
                    <div className="catalog-filters" role="group" aria-label="Filter exams by category">
                        {filters.map((f) => {
                            const isActive = filter === f.key;
                            return (
                                <button
                                    key={f.key}
                                    type="button"
                                    aria-pressed={isActive}
                                    onClick={() => setFilter(f.key)}
                                    style={{
                                        padding: '7px 14px', borderRadius: '8px', cursor: 'pointer',
                                        fontWeight: 700, fontSize: '12.5px', fontFamily: 'inherit',
                                        background: isActive ? '#1E1B4B' : 'var(--bg-secondary)',
                                        color: isActive ? '#FFFFFF' : 'var(--text-secondary)',
                                        border: isActive ? '1px solid #312E81' : '1px solid var(--border)',
                                        boxShadow: isActive ? '0 1px 3px rgba(30, 27, 75, 0.25)' : 'var(--shadow-sm)',
                                        transition: 'all 0.15s ease',
                                        display: 'inline-flex',
                                        alignItems: 'center',
                                        gap: '6px'
                                    }}
                                >
                                    {f.icon}
                                    <span>{f.label}</span>
                                    <span style={{
                                        fontSize: '11px',
                                        fontWeight: 800,
                                        opacity: isActive ? 0.9 : 0.6,
                                        padding: '1px 5px',
                                        borderRadius: '4px',
                                        background: isActive ? 'rgba(255, 255, 255, 0.15)' : 'var(--border)'
                                    }}>
                                        {f.count}
                                    </span>
                                </button>
                            );
                        })}
                    </div>

                    {/* Search Input */}
                    <div className="catalog-search">
                        <span style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--text-muted)', display: 'flex', alignItems: 'center' }}>
                            <Search size={15} />
                        </span>
                        <input
                            type="search"
                            aria-label="Search exams by name or subject"
                            placeholder="Search by exam or subject…"

                            value={searchQuery}
                            onChange={(e) => setSearchQuery(e.target.value)}
                            className="input"
                            style={{ paddingLeft: '36px', height: '38px', width: '100%', borderRadius: '6px', fontSize: '13px' }}
                        />
                    </div>
                </div>

                {/* Main Content Layout */}
                {totalFiltered === 0 ? (
                    <div className="card card-static" style={{ textAlign: 'center', padding: '56px 24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                        <Inbox size={40} style={{ margin: '0 auto 12px', opacity: 0.4 }} />
                        <h3 style={{ fontSize: '17px', fontWeight: 800, marginBottom: '6px' }}>No examinations found</h3>
                        <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', margin: '0 0 16px' }}>Try a different search or category.</p>
                        <button type="button" className="btn btn-ghost" onClick={() => { setSearchQuery(''); setFilter('all'); }} style={{ margin: '0 auto' }}>Clear filters</button>
                    </div>
                ) : (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '44px' }}>
                        
                        {/* 1. NATIONAL & CENTRAL EXAMINATIONS */}
                        {filteredNational.length > 0 && (
                            <div>
                                <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '18px' }}>
                                    <div style={{ 
                                        width: '34px', height: '34px', borderRadius: '8px', 
                                        background: 'rgba(37, 99, 235, 0.08)', border: '1px solid rgba(37, 99, 235, 0.2)',
                                        display: 'flex', alignItems: 'center', justifyContent: 'center' 
                                    }}>
                                        <Landmark size={17} color="#2563EB" />
                                    </div>
                                    <div>
                                        <h2 style={{ fontSize: '19px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                            National & Central Government Examinations
                                        </h2>
                                        <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>
                                            Premier civil, defence, and central services across India ({filteredNational.length} Exams)
                                        </div>
                                    </div>
                                </div>

                                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(340px, 1fr))', gap: '18px' }}>
                                    {filteredNational.map(renderExamCard)}
                                </div>
                            </div>
                        )}

                        {/* 2. KARNATAKA STATE GOVERNMENT EXAMINATIONS */}
                        {filteredKarnataka.length > 0 && (
                            <div>
                                <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '18px' }}>
                                    <div style={{ 
                                        width: '34px', height: '34px', borderRadius: '8px', 
                                        background: 'rgba(234, 88, 12, 0.08)', border: '1px solid rgba(234, 88, 12, 0.2)',
                                        display: 'flex', alignItems: 'center', justifyContent: 'center' 
                                    }}>
                                        <MapPin size={17} color="var(--brand-orange, #EA580C)" />
                                    </div>
                                    <div>
                                        <h2 style={{ fontSize: '19px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                            Karnataka State Government Examinations
                                        </h2>
                                        <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>
                                            State administrative, revenue, police, teaching, and board examinations ({filteredKarnataka.length} Exams)
                                        </div>
                                    </div>
                                </div>

                                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(340px, 1fr))', gap: '18px' }}>
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
