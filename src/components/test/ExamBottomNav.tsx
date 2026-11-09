'use client';
import React from 'react';
import { ArrowLeft, ArrowRight, Bookmark } from 'lucide-react';

interface ExamBottomNavProps {
    currentIdx: number;
    totalQuestions: number;
    hasSelectedAnswer: boolean;
    isMarkedForReview: boolean;
    onPrev: () => void;
    onNext: () => void;
    onClearResponse: () => void;
    onToggleMarkAndNext: () => void;
}

export default function ExamBottomNav({
    currentIdx,
    totalQuestions,
    hasSelectedAnswer,
    isMarkedForReview,
    onPrev,
    onNext,
    onClearResponse,
    onToggleMarkAndNext
}: ExamBottomNavProps) {
    const isFirst = currentIdx === 0;
    const isLast = currentIdx === totalQuestions - 1;

    return (
        <div className="cbt-box" style={{
            padding: '12px 20px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'space-between',
            flexWrap: 'wrap',
            gap: '12px'
        }}>
            {/* Left: Previous + Clear Response */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '14px' }}>
                <button
                    onClick={onPrev}
                    disabled={isFirst}
                    style={{
                        padding: '9px 18px',
                        background: 'var(--bg-card)',
                        border: '1px solid var(--border)',
                        borderRadius: '6px',
                        color: isFirst ? 'var(--text-muted)' : 'var(--text-primary)',
                        borderColor: isFirst ? 'var(--border)' : 'var(--border)',
                        fontWeight: 700,
                        fontSize: '13px',
                        cursor: isFirst ? 'not-allowed' : 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                        boxShadow: 'var(--shadow-sm)'
                    }}
                >
                    <ArrowLeft size={14} />
                    <span>PREVIOUS</span>
                    <kbd style={{ fontSize: '10px', background: 'var(--bg-secondary)', color: 'var(--text-secondary)', padding: '1px 5px', borderRadius: '3px', fontWeight: 700 }}>P</kbd>
                </button>

                {hasSelectedAnswer && (
                    <button
                        onClick={onClearResponse}
                        style={{
                            background: 'transparent',
                            border: 'none',
                            color: 'var(--text-muted)',
                            fontWeight: 600,
                            fontSize: '12px',
                            cursor: 'pointer',
                            display: 'flex',
                            alignItems: 'center',
                            gap: '4px'
                        }}
                    >
                        <span>CLEAR RESPONSE</span>
                        <kbd style={{ fontSize: '9.5px', background: 'var(--bg-secondary)', color: 'var(--text-muted)', padding: '1px 4px', borderRadius: '2px', fontWeight: 700 }}>C</kbd>
                    </button>
                )}
            </div>

            {/* Right: Mark for Review & Next + Save & Next */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                <button
                    onClick={onToggleMarkAndNext}
                    style={{
                        padding: '9px 16px',
                        background: isMarkedForReview ? '#7C3AED' : 'rgba(124, 58, 237, 0.08)',
                        border: '1px solid #7C3AED',
                        borderRadius: '6px',
                        color: isMarkedForReview ? '#FFFFFF' : '#7C3AED',
                        fontWeight: 700,
                        fontSize: '13px',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                        boxShadow: '0 1px 3px rgba(124, 58, 237, 0.15)'
                    }}
                >
                    <Bookmark size={14} fill={isMarkedForReview ? '#FFFFFF' : 'none'} />
                    <span>{isMarkedForReview ? 'UNMARK REVIEW' : 'MARK FOR REVIEW & NEXT'}</span>
                    <kbd style={{ fontSize: '10px', background: isMarkedForReview ? 'rgba(0,0,0,0.2)' : 'rgba(124,58,237,0.1)', color: isMarkedForReview ? '#FFFFFF' : '#7C3AED', padding: '1px 5px', borderRadius: '3px', fontWeight: 700 }}>M</kbd>
                </button>

                {/* Primary Action Button: Save & Next in Royal Blue */}
                <button
                    onClick={onNext}
                    style={{
                        padding: '9px 24px',
                        background: 'var(--brand-blue, #2563EB)',
                        border: '1px solid #1D4ED8',
                        borderRadius: '6px',
                        color: '#FFFFFF',
                        fontWeight: 800,
                        fontSize: '13px',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '8px',
                        boxShadow: '0 2px 6px rgba(37, 99, 235, 0.3)'
                    }}
                >
                    <span>{isLast ? 'REVIEW & SUBMIT' : 'SAVE & NEXT'}</span>
                    <ArrowRight size={14} />
                    <kbd style={{ fontSize: '10px', background: 'rgba(255,255,255,0.25)', color: '#FFFFFF', padding: '1px 5px', borderRadius: '3px', fontWeight: 700 }}>N / ↵</kbd>
                </button>
            </div>
        </div>
    );
}
