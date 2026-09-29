'use client';
import React from 'react';
import Link from 'next/link';
import { Shield, Clock, User, Check } from 'lucide-react';
import { Language } from '@/types';

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
            {/* Left: MockIQ Logo & Exam Subtitle */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '14px' }}>
                <Link href="/exams" style={{ display: 'flex', alignItems: 'center', gap: '8px', textDecoration: 'none' }}>
                    <div style={{
                        width: '28px', height: '28px', borderRadius: '6px',
                        background: '#2563EB', display: 'flex', alignItems: 'center', justifyContent: 'center',
                        color: '#FFFFFF'
                    }}>
                        <Check size={18} strokeWidth={3.5} />
                    </div>
                    <div style={{ fontSize: '18px', fontWeight: 800, letterSpacing: '-0.5px', color: '#111827' }}>
                        <span>MockI</span>
                        <span style={{ color: '#2563EB' }}>Q</span>
                    </div>
                </Link>

                <div style={{ width: '1px', height: '24px', background: '#D1D5DB' }} />

                <div>
                    <div style={{ fontSize: '11px', fontWeight: 800, letterSpacing: '0.08em', color: '#111827', textTransform: 'uppercase' }}>
                        MOCKIQ LIVE
                    </div>
                    <div style={{ fontSize: '11px', color: '#6B7280', fontWeight: 500 }}>
                        {examTitle || 'UPSC / KPSC Benchmark Mock'}
                    </div>
                </div>
            </div>

            {/* Right: Timer, Language Toggle, Proctor Badge, Submit Button, Avatar */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', flexWrap: 'wrap' }}>
                {/* Timer Badge */}
                <div className="cbt-timer-badge">
                    <Clock size={16} strokeWidth={2.5} />
                    <span>{formatTime(timeLeft)}</span>
                </div>

                {/* Language Toggle */}
                {isBilingual && (
                    <button
                        onClick={onToggleLang}
                        title="Toggle bilingual question translation"
                        style={{
                            padding: '6px 12px',
                            background: '#FFFFFF',
                            border: '1.5px solid #1E1E1E',
                            borderRadius: '6px',
                            fontSize: '12px',
                            fontWeight: 700,
                            cursor: 'pointer',
                            color: '#111827',
                            display: 'flex',
                            alignItems: 'center',
                            gap: '6px',
                            boxShadow: '0 1px 3px rgba(0,0,0,0.05)'
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
                    padding: '6px 12px',
                    background: '#FFFFFF',
                    border: '1.5px solid #1E1E1E',
                    borderRadius: '6px',
                    fontSize: '11px',
                    fontWeight: 700,
                    letterSpacing: '0.04em',
                    color: '#15803D'
                }}>
                    <Shield size={14} color="#15803D" />
                    <span>PROCTOR ACTIVE</span>
                </div>

                {/* Submit Exam Button */}
                <button
                    onClick={onSubmitClick}
                    style={{
                        padding: '6px 14px',
                        background: '#111827',
                        color: '#FFFFFF',
                        border: '1.5px solid #111827',
                        borderRadius: '6px',
                        fontSize: '12px',
                        fontWeight: 800,
                        letterSpacing: '0.04em',
                        cursor: 'pointer',
                        boxShadow: '0 2px 6px rgba(0,0,0,0.15)'
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
                        border: '1.5px solid #1E1E1E',
                        background: '#F1EDE4',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        color: '#111827',
                        cursor: 'pointer'
                    }}
                >
                    <User size={16} />
                </div>
            </div>
        </header>
    );
}
