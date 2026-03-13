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
                        fontWeight: 600, fontSize: '13px', transition: 'all 0.2s',
                        background: tabLang === l ? 'linear-gradient(135deg, #6366F1, #8B5CF6)' : 'transparent',
                        color: tabLang === l ? 'white' : 'var(--text-secondary)',
                    }}>{LANG_LABELS[l]}</button>
                ))}
            </div>

            {/* Category filter */}
            <div style={{ display: 'flex', gap: '6px', marginBottom: '24px', flexWrap: 'wrap' }}>
                {CATEGORIES.map((c) => (
                    <button key={c} onClick={() => setCategory(c)} style={{
                        padding: '6px 14px', borderRadius: '20px', border: `1px solid ${category === c ? 'var(--accent-indigo)' : 'var(--border)'}`,
                        background: category === c ? 'rgba(99,102,241,0.1)' : 'transparent',
                        cursor: 'pointer', fontWeight: 500, fontSize: '12px',
                        color: category === c ? 'var(--accent-indigo)' : 'var(--text-muted)', transition: 'all 0.2s',
                    }}>{c}</button>
                ))}
            </div>

            {/* Articles */}
            <div style={{ display: 'flex', flexDirection: 'column', gap: '16px' }}>
                {filtered.map((article) => {
                    const title = tabLang === 'hi' ? article.title_hi : tabLang === 'kn' ? article.title_kn : article.title_en;
                    const body = tabLang === 'hi' ? article.body_hi : tabLang === 'kn' ? article.body_kn : article.body_en;
                    const categoryColors: Record<string, string> = {
                        Economy: '#10B981', Polity: '#6366F1', 'Science & Tech': '#06B6D4', Environment: '#84CC16', International: '#F59E0B'
                    };
                    return (
                        <div key={article.id} className="card" style={{ padding: '24px', borderLeft: `3px solid ${categoryColors[article.category] || 'var(--accent-indigo)'}` }}>
                            <div style={{ display: 'flex', gap: '10px', alignItems: 'center', marginBottom: '10px', flexWrap: 'wrap' }}>
                                <span className="tag" style={{ background: `${categoryColors[article.category]}22`, color: categoryColors[article.category], border: `1px solid ${categoryColors[article.category]}44`, fontSize: '11px' }}>
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
