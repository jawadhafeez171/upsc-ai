'use client';
import React from 'react';
import Link from 'next/link';
import { Clock, LayoutGrid, User, Check } from 'lucide-react';

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
        : 'IQ';

    return (
        <header className="cbt-mobile-header">
            {/* 1. MockIQ Branded Logo */}
            <Link href="/exams" className="cbt-mobile-logo" title="MockIQ Live Terminal">
                <div className="cbt-mobile-logo-badge">
                    <Check size={14} strokeWidth={3} />
                </div>
                <span>Mock<span style={{ color: '#2563EB' }}>IQ</span></span>
            </Link>

            {/* 2. Red Countdown Timer Pill */}
            <div className="cbt-mobile-timer" title="Time Remaining">
                <Clock size={12} strokeWidth={2.5} color="#EF4444" />
                <span>{formatTime(timeLeft)}</span>
            </div>

            {/* 3. Question Index & Bilingual Toggle Chip */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
                <div style={{
                    background: '#111827',
                    color: '#FFFFFF',
                    borderRadius: '4px',
                    padding: '3px 6px',
                    fontSize: '11px',
                    fontWeight: 900,
                    fontFamily: 'var(--cbt-font-mono, monospace)'
                }}>
                    Q{currentIdx + 1}
                </div>

                {isBilingual && (
                    <button
                        onClick={onToggleLang}
                        className="cbt-mobile-lang-chip"
                        title="Switch Language"
                    >
                        <span>{activeLang === 'en' ? `ENG/${secondaryLangText}` : `${secondaryLangText}/ENG`}</span>
                    </button>
                )}
            </div>

            {/* 4. Yellow Grid Button (Opens Mobile Question Palette Drawer) */}
            <button
                onClick={onOpenPalette}
                className="cbt-mobile-palette-btn"
                title="Open Question Palette & Tools"
                aria-label="Open Question Palette"
            >
                <LayoutGrid size={18} strokeWidth={2.5} />
            </button>

            {/* 5. User Profile Avatar Button */}
            <div className="cbt-mobile-avatar-btn" title={candidateName}>
                {initials}
            </div>
        </header>
    );
}
