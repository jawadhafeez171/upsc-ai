'use client';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import { CURRENT_AFFAIRS } from '@/lib/mockData';
import { Language } from '@/types';

const CATEGORIES = ['All', 'Economy', 'Polity', 'Science & Tech', 'Environment', 'International'];

export default function CurrentAffairsPage() {
    const { language } = useAppStore();
    const [tabLang, setTabLang] = useState<Language>(language);
    const [category, setCategory] = useState('All');

    const LANG_LABELS: Record<Language, string> = { en: '🇬🇧 English', hi: '🇮🇳 हिन्दी', kn: '🇮🇳 ಕನ್ನಡ' };

    const filtered = CURRENT_AFFAIRS.filter((a) => category === 'All' || a.category === category);

    return (
        <div style={{ maxWidth: '860px', margin: '0 auto', padding: '32px 24px' }}>
            <div style={{ marginBottom: '32px' }}>
                <h1 style={{ fontSize: '32px', fontWeight: 800, marginBottom: '8px' }}>📰 Current Affairs</h1>
                <p style={{ color: 'var(--text-muted)' }}>Daily digest for exam aspirants — concise summaries in your language</p>
            </div>

            {/* Language tabs */}
            <div style={{ display: 'flex', gap: '8px', marginBottom: '20px', background: 'var(--bg-card)', padding: '4px', borderRadius: '10px', width: 'fit-content', border: '1px solid var(--border)' }}>
                {(['en', 'hi', 'kn'] as Language[]).map((l) => (
                    <button key={l} onClick={() => setTabLang(l)} style={{
                        padding: '8px 18px', borderRadius: '8px', border: 'none', cursor: 'pointer',
                        fontWeight: 600, fontSize: '13px', transition: 'all 0.15s ease',
                        background: tabLang === l ? '#2563EB' : 'transparent',
                        color: tabLang === l ? '#FFFFFF' : 'var(--text-secondary)',
                    }}>{LANG_LABELS[l]}</button>
                ))}
            </div>

            {/* Category filter */}
            <div style={{ display: 'flex', gap: '6px', marginBottom: '24px', flexWrap: 'wrap' }}>
                {CATEGORIES.map((c) => (
                    <button key={c} onClick={() => setCategory(c)} style={{
                        padding: '6px 14px', borderRadius: '20px',
                        border: category === c ? '1px solid #2563EB' : '1px solid var(--border)',
                        background: category === c ? '#EFF6FF' : 'var(--bg-secondary)',
                        cursor: 'pointer', fontWeight: 600, fontSize: '12px',
                        color: category === c ? '#1D4ED8' : 'var(--text-secondary)',
                        transition: 'all 0.15s ease',
                    }}>{c}</button>
                ))}
            </div>

            {/* Articles */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                {filtered.map((article) => {
                    const title = tabLang === 'hi' ? article.title_hi : tabLang === 'kn' ? article.title_kn : article.title_en;
                    const body = tabLang === 'hi' ? article.body_hi : tabLang === 'kn' ? article.body_kn : article.body_en;
                    const categoryColors: Record<string, string> = {
                        Economy: '#10B981', Polity: '#0D9488', 'Science & Tech': '#2563EB', Environment: '#16A34A', International: '#F59E0B'
                    };
                    const color = categoryColors[article.category] || '#2563EB';
                    return (
                        <div key={article.id} className="card" style={{ padding: '24px', borderRadius: '12px' }}>
                            <div style={{ display: 'flex', gap: '10px', alignItems: 'center', marginBottom: '10px', flexWrap: 'wrap' }}>
                                <span className="tag" style={{ background: `${color}15`, color: color, border: `1px solid ${color}35`, fontSize: '11px', borderRadius: '6px' }}>
                                    {article.category}
                                </span>
                                <span style={{ fontSize: '12px', color: 'var(--text-muted)' }}>{article.date}</span>
                            </div>
                            <h3 style={{ fontSize: '17px', fontWeight: 700, marginBottom: '10px', lineHeight: 1.4 }}>{title}</h3>
                            <p style={{ fontSize: '14px', color: 'var(--text-secondary)', lineHeight: 1.7 }}>{body}</p>
                        </div>
                    );
                })}
            </div>
        </div>
    );
}
