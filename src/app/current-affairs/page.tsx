'use client';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import { CURRENT_AFFAIRS } from '@/lib/mockData';
import { Language } from '@/types';
import { Newspaper, Calendar } from 'lucide-react';

const CATEGORIES = ['All', 'Economy', 'Polity', 'Science & Tech', 'Environment', 'International'];

export default function CurrentAffairsPage() {
    const { language } = useAppStore();
    const [tabLang, setTabLang] = useState<Language>(language);
    const [category, setCategory] = useState('All');

    const LANG_LABELS: Record<Language, string> = { en: 'English', hi: 'हिन्दी', kn: 'ಕನ್ನಡ' };

    const filtered = CURRENT_AFFAIRS.filter((a) => category === 'All' || a.category === category);

    return (
        <div style={{ maxWidth: '880px', margin: '0 auto', padding: '36px 24px 60px' }}>
            <div style={{ marginBottom: '32px' }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '8px' }}>
                    <div style={{
                        width: '38px',
                        height: '38px',
                        borderRadius: '10px',
                        background: '#1E1B4B',
                        border: '1px solid #312E81',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        color: '#FFFFFF'
                    }}>
                        <Newspaper size={18} />
                    </div>
                    <h1 style={{ fontSize: '28px', fontWeight: 800, margin: 0, color: 'var(--text-primary)' }}>
                        Current Affairs Digest
                    </h1>
                </div>
                <p style={{ color: 'var(--text-secondary)', fontSize: '14.5px', margin: 0 }}>
                    Concise daily exam-oriented summaries curated across national, regional, and international affairs.
                </p>
            </div>

            {/* Language tabs */}
            <div style={{ display: 'flex', gap: '4px', marginBottom: '20px', background: 'var(--bg-tertiary)', padding: '3px', borderRadius: '8px', width: 'fit-content', border: '1px solid var(--border)' }}>
                {(['en', 'hi', 'kn'] as Language[]).map((l) => (
                    <button
                        key={l}
                        type="button"
                        onClick={() => setTabLang(l)}
                        style={{
                            padding: '6px 14px',
                            borderRadius: '6px',
                            border: 'none',
                            cursor: 'pointer',
                            fontWeight: 700,
                            fontSize: '12px',
                            transition: 'all 0.15s ease',
                            background: tabLang === l ? '#1E1B4B' : 'transparent',
                            color: tabLang === l ? '#FFFFFF' : 'var(--text-secondary)',
                            boxShadow: tabLang === l ? '0 1px 2px rgba(30,27,75,0.2)' : 'none',
                        }}
                    >
                        {LANG_LABELS[l]}
                    </button>
                ))}
            </div>

            {/* Category filter */}
            <div style={{ display: 'flex', gap: '6px', marginBottom: '24px', flexWrap: 'wrap' }}>
                {CATEGORIES.map((c) => {
                    const isActive = category === c;
                    return (
                        <button
                            key={c}
                            type="button"
                            onClick={() => setCategory(c)}
                            style={{
                                padding: '6px 14px',
                                borderRadius: '6px',
                                border: isActive ? '1px solid #1E1B4B' : '1px solid var(--border)',
                                background: isActive ? '#1E1B4B' : 'var(--bg-secondary)',
                                cursor: 'pointer',
                                fontWeight: 700,
                                fontSize: '12px',
                                color: isActive ? '#FFFFFF' : 'var(--text-secondary)',
                                transition: 'all 0.15s ease',
                                boxShadow: isActive ? '0 1px 3px rgba(30,27,75,0.2)' : 'var(--shadow-sm)'
                            }}
                        >
                            {c}
                        </button>
                    );
                })}
            </div>

            {/* Articles */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                {filtered.map((article) => {
                    const title = tabLang === 'hi' ? article.title_hi : tabLang === 'kn' ? article.title_kn : article.title_en;
                    const body = tabLang === 'hi' ? article.body_hi : tabLang === 'kn' ? article.body_kn : article.body_en;
                    const categoryColors: Record<string, string> = {
                        Economy: '#059669',
                        Polity: '#2563EB',
                        'Science & Tech': '#7C3AED',
                        Environment: '#0D9488',
                        International: '#D97706'
                    };
                    const color = categoryColors[article.category] || '#2563EB';

                    return (
                        <div key={article.id} className="card" style={{ padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                            <div style={{ display: 'flex', gap: '10px', alignItems: 'center', marginBottom: '10px', flexWrap: 'wrap' }}>
                                <span style={{
                                    background: `${color}12`,
                                    color: color,
                                    border: `1px solid ${color}30`,
                                    fontSize: '11px',
                                    fontWeight: 700,
                                    padding: '2px 8px',
                                    borderRadius: '4px'
                                }}>
                                    {article.category}
                                </span>
                                <span style={{ fontSize: '12px', color: 'var(--text-muted)', display: 'flex', alignItems: 'center', gap: '4px' }}>
                                    <Calendar size={13} />
                                    {article.date}
                                </span>
                            </div>
                            <h3 style={{ fontSize: '16.5px', fontWeight: 800, marginBottom: '10px', lineHeight: 1.4, color: 'var(--text-primary)' }}>
                                {title}
                            </h3>
                            <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.65, margin: 0 }}>
                                {body}
                            </p>
                        </div>
                    );
                })}
            </div>
        </div>
    );
}
