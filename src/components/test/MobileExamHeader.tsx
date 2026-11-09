'use client';
import React from 'react';
import Link from 'next/link';
import { Clock, LayoutGrid, BookOpen } from 'lucide-react';

interface MobileExamHeaderProps {
    timeLeft: number;
    currentIdx: number;
    activeLang: 'en' | 'kn' | 'hi';
    supportedLangs: ('en' | 'kn' | 'hi')[];
    onToggleLang: () => void;
    onOpenPalette: () => void;
    candidateName: string;
}

export default function MobileExamHeader({
    timeLeft,
    currentIdx,
    activeLang,
    supportedLangs,
    onToggleLang,
    onOpenPalette,
    candidateName
}: MobileExamHeaderProps) {
    const formatTime = (seconds: number) => {
        const hrs = Math.floor(seconds / 3600);
        const mins = Math.floor((seconds % 3600) / 60);
        const secs = seconds % 60;
        return `${hrs.toString().padStart(2, '0')}:${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    };

    const isBilingual = supportedLangs.length > 1;
    const secondaryLangText = supportedLangs.includes('kn') ? 'ಕನ್ನಡ' : 'हिन्दी';
    const initials = candidateName
        ? candidateName.split(' ').map((p) => p[0]).join('').slice(0, 2).toUpperCase()
        : 'UA';

    return (
        <header className="cbt-mobile-header" role="banner">
            {/* 1. UPSC AI Branded Logo */}
            <Link href="/exams" className="cbt-mobile-logo" title="MockIQ / UPSC AI">
                <div style={{
                    width: '28px',
                    height: '28px',
                    borderRadius: '7px',
                    background: '#1E1B4B',
                    border: '1px solid #312E81',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    color: '#FFFFFF',
                    flexShrink: 0
                }}>
                    <BookOpen size={14} color="#FFFFFF" strokeWidth={2.5} />
                </div>
                <span>
                    UPSC <span style={{ color: 'var(--brand-orange, #EA580C)' }}>AI</span>
                </span>
            </Link>

            {/* 2. Calibrated Countdown Timer Pill */}
            <div
                className={`cbt-mobile-timer ${timeLeft <= 300 ? 'urgent' : timeLeft <= 900 ? 'warning' : 'normal'}`}
                title="Time Remaining"
                aria-label={`Time remaining: ${formatTime(timeLeft)}`}
            >
                <Clock size={12} strokeWidth={2.5} color={timeLeft <= 300 ? '#DC2626' : timeLeft <= 900 ? '#D97706' : '#94A3B8'} />
                <span>{formatTime(timeLeft)}</span>
            </div>

            {/* 3. Question Index & Bilingual Toggle Chip */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                <div style={{
                    background: '#1E1B4B',
                    color: '#FFFFFF',
                    border: '1px solid #312E81',
                    borderRadius: '5px',
                    padding: '3px 7px',
                    fontSize: '11px',
                    fontWeight: 800,
                    fontFamily: 'var(--cbt-font-mono, monospace)'
                }}>
                    Q{currentIdx + 1}
                </div>

                {isBilingual && (
                    <button
                        type="button"
                        onClick={onToggleLang}
                        className="cbt-mobile-lang-chip"
                        title="Switch Language"
                        aria-label="Switch Language"
                    >
                        <span>{activeLang === 'en' ? `EN/${secondaryLangText}` : `${secondaryLangText}/EN`}</span>
                    </button>
                )}
            </div>

            {/* 4. Question Palette Drawer Toggle */}
            <button
                type="button"
                onClick={onOpenPalette}
                className="cbt-mobile-palette-btn"
                title="Open Question Palette & Tools"
                aria-label="Open Question Palette"
            >
                <LayoutGrid size={18} strokeWidth={2.2} />
            </button>

            {/* 5. User Profile Avatar Button */}
            <div
                className="cbt-mobile-avatar-btn"
                title={candidateName}
                style={{
                    background: '#1E1B4B',
                    color: '#FFFFFF',
                    border: '1px solid #312E81',
                    fontWeight: 800
                }}
            >
                {initials}
            </div>
        </header>
    );
}
