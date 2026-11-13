'use client';
import { useState } from 'react';
import { useAppStore } from '@/lib/store';
import { CURRENT_AFFAIRS } from '@/lib/mockData';
import { Language } from '@/types';
import { Newspaper, Calendar } from 'lucide-react';

const CATEGORIES = ['All', 'Economy', 'Polity', 'Science & Tech', 'Environment', 'International'];

export default function CurrentAffairsPage() {
    // One language setting for the whole site: these tabs and the navbar switch stay in step.
    const { language: tabLang, setLanguage: setTabLang } = useAppStore();
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
                        Current affairs
                    </h1>
                </div>
                <p style={{ color: 'var(--text-secondary)', fontSize: '14.5px', margin: 0 }}>
                    Short daily summaries of national, state and international news that matter for the exams.
                </p>
            </div>

            {/* Language tabs */}
            <div style={{ display: 'flex', gap: '4px', marginBottom: '20px', background: 'var(--bg-tertiary)', padding: '3px', borderRadius: '8px', width: 'fit-content', border: '1px solid var(--border)' }}>
                {(['en', 'hi', 'kn'] as Language[]).map((l) => (
                    <button
                        key={l}
                        type="button"
                        onClick={() => setTabLang(l)}
                        aria-pressed={tabLang === l}
                        style={{
                            padding: '8px 14px',
                            minHeight: '36px',
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
                            aria-pressed={isActive}
                            style={{
                                padding: '8px 14px',
                                minHeight: '36px',
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
                    const prettyDate = (() => {
                        const d = new Date(article.date);
                        return isNaN(d.getTime()) ? article.date : d.toLocaleDateString('en-IN', { day: 'numeric', month: 'short', year: 'numeric' });
                    })();

                    return (
                        <article key={article.id} className="card card-static" style={{ padding: 'clamp(16px, 4vw, 24px)', borderRadius: '12px', border: '1px solid var(--border)' }}>
                            <div style={{ display: 'flex', gap: '10px', alignItems: 'center', marginBottom: '10px', flexWrap: 'wrap' }}>
                                <span style={{
                                    background: 'var(--bg-tertiary)',
                                    color: 'var(--text-secondary)',
                                    border: '1px solid var(--border)',
                                    fontSize: '11.5px',
                                    fontWeight: 700,
                                    padding: '2px 8px',
                                    borderRadius: '4px'
                                }}>
                                    {article.category}
                                </span>
                                <span style={{ fontSize: '12px', color: 'var(--text-muted)', display: 'flex', alignItems: 'center', gap: '4px' }}>
                                    <Calendar size={13} />
                                    <time dateTime={article.date}>{prettyDate}</time>
                                </span>
                            </div>
                            <h3 style={{ fontSize: '16.5px', fontWeight: 800, marginBottom: '10px', lineHeight: 1.4, color: 'var(--text-primary)' }}>
                                {title}
                            </h3>
                            <p style={{ fontSize: '14.5px', color: 'var(--text-secondary)', lineHeight: 1.7, margin: 0, maxWidth: '72ch' }}>
                                {body}
                            </p>
                        </article>
                    );
                })}
            </div>
        </div>
    );
}
