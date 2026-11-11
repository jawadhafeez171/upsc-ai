'use client';
import React from 'react';
import Link from 'next/link';
import { Shield, Clock, User, BookOpen } from 'lucide-react';

interface ExamHeaderProps {
    examTitle: string;
    timeLeft: number;
    activeLang: 'en' | 'kn' | 'hi';
    supportedLangs: ('en' | 'kn' | 'hi')[];
    onToggleLang: () => void;
    onSubmitClick: () => void;
    candidateName: string;
}

export default function ExamHeader({
    examTitle,
    timeLeft,
    activeLang,
    supportedLangs,
    onToggleLang,
    onSubmitClick,
    candidateName
}: ExamHeaderProps) {
    const formatTime = (seconds: number) => {
        const hrs = Math.floor(seconds / 3600);
        const mins = Math.floor((seconds % 3600) / 60);
        const secs = seconds % 60;
        return `${hrs.toString().padStart(2, '0')}:${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
    };

    const isBilingual = supportedLangs.length > 1;
    const secondaryLangName = supportedLangs.includes('kn') ? 'ಕನ್ನಡ' : 'हिन्दी';

    return (
        <header className="cbt-header">
            {/* Left: Brand Identity & Exam Subtitle */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '14px' }}>
                <Link href="/exams" style={{ display: 'flex', alignItems: 'center', gap: '8px', textDecoration: 'none' }}>
                    <div style={{
                        width: '30px', height: '30px', borderRadius: '7px',
                        background: '#1E1B4B', border: '1px solid #312E81',
                        display: 'flex', alignItems: 'center', justifyContent: 'center',
                        color: '#FFFFFF', boxShadow: '0 2px 4px rgba(30,27,75,0.2)'
                    }}>
                        <BookOpen size={16} strokeWidth={2.5} />
                    </div>
                    <div style={{ fontSize: '17px', fontWeight: 800, letterSpacing: '-0.5px', color: 'var(--text-primary)' }}>
                        <span>UPSC </span>
                        <span style={{ color: 'var(--brand-orange, #EA580C)' }}>AI</span>
                    </div>
                </Link>

                <div style={{ width: '1px', height: '22px', background: 'var(--border)' }} />

                <div>
                    <div style={{ fontSize: '10.5px', fontWeight: 800, letterSpacing: '0.06em', color: 'var(--text-secondary)', textTransform: 'uppercase' }}>
                        CBT ASSESSMENT TERMINAL
                    </div>
                    <div style={{ fontSize: '12px', color: 'var(--text-primary)', fontWeight: 600 }}>
                        {examTitle || 'Civil Services Preliminary Examination'}
                    </div>
                </div>
            </div>

            {/* Right: Timer, Language Toggle, Proctor Badge, Submit Button, Avatar */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', flexWrap: 'wrap' }}>
                {/* Timer Badge with Calibrated Urgency */}
                <div className={`cbt-timer-badge ${timeLeft <= 300 ? 'urgent' : timeLeft <= 900 ? 'warning' : 'normal'}`}>
                    <Clock size={15} strokeWidth={2.5} />
                    <span>{formatTime(timeLeft)}</span>
                </div>

                {/* Language Toggle */}
                {isBilingual && (
                    <button
                        onClick={onToggleLang}
                        title="Toggle bilingual question translation"
                        style={{
                            padding: '6px 12px',
                            background: 'var(--bg-card)',
                            border: '1px solid var(--border)',
                            borderRadius: '6px',
                            fontSize: '11.5px',
                            fontWeight: 700,
                            cursor: 'pointer',
                            color: 'var(--text-primary)',
                            display: 'flex',
                            alignItems: 'center',
                            gap: '6px',
                            boxShadow: 'var(--shadow-sm)'
                        }}
                    >
                        <span>{activeLang === 'en' ? `ENG ⇄ ${secondaryLangName}` : `${secondaryLangName.toUpperCase()} ⇄ ENG`}</span>
                    </button>
                )}

                {/* Proctor Active Badge */}
                <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    gap: '6px',
                    padding: '5px 10px',
                    background: 'rgba(16, 185, 129, 0.08)',
                    border: '1px solid rgba(16, 185, 129, 0.25)',
                    borderRadius: '6px',
                    fontSize: '11px',
                    fontWeight: 700,
                    letterSpacing: '0.04em',
                    color: '#047857'
                }}>
                    <Shield size={13} color="#047857" />
                    <span>PROCTOR ACTIVE</span>
                </div>

                {/* Submit Exam Button */}
                <button
                    onClick={onSubmitClick}
                    style={{
                        padding: '6px 14px',
                        background: 'var(--brand-indigo, #1E1B4B)',
                        color: '#FFFFFF',
                        border: '1px solid #312E81',
                        borderRadius: '6px',
                        fontSize: '11.5px',
                        fontWeight: 800,
                        letterSpacing: '0.04em',
                        cursor: 'pointer',
                        boxShadow: '0 2px 4px rgba(30, 27, 75, 0.25)'
                    }}
                >
                    SUBMIT EXAM
                </button>

                {/* User Avatar */}
                <div 
                    title={candidateName}
                    style={{
                        width: '32px',
                        height: '32px',
                        borderRadius: '50%',
                        border: '1px solid var(--border)',
                        background: 'var(--bg-secondary)',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        color: 'var(--text-secondary)',
                        cursor: 'pointer'
                    }}
                >
                    <User size={15} />
                </div>
            </div>
        </header>
    );
}
