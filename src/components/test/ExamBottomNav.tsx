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
                        background: '#FFFFFF',
                        border: '1.5px solid #1E1E1E',
                        borderRadius: '6px',
                        color: isFirst ? '#9CA3AF' : '#111827',
                        borderColor: isFirst ? '#D1D5DB' : '#1E1E1E',
                        fontWeight: 800,
                        fontSize: '13px',
                        cursor: isFirst ? 'not-allowed' : 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px'
                    }}
                >
                    <ArrowLeft size={14} />
                    <span>PREVIOUS (Q.{Math.max(1, currentIdx)})</span>
                </button>

                {hasSelectedAnswer && (
                    <button
                        onClick={onClearResponse}
                        style={{
                            background: 'transparent',
                            border: 'none',
                            color: '#6B7280',
                            fontWeight: 700,
                            fontSize: '12px',
                            cursor: 'pointer',
                            textDecoration: 'underline'
                        }}
                    >
                        CLEAR RESPONSE
                    </button>
                )}
            </div>

            {/* Right: Mark for Review & Next + Save & Next */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                <button
                    onClick={onToggleMarkAndNext}
                    style={{
                        padding: '9px 18px',
                        background: isMarkedForReview ? '#F59E0B' : '#FACC15',
                        border: '1.5px solid #1E1E1E',
                        borderRadius: '6px',
                        color: '#000000',
                        fontWeight: 800,
                        fontSize: '13px',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                        boxShadow: '0 2px 4px rgba(250, 204, 21, 0.3)'
                    }}
                >
                    <Bookmark size={14} fill={isMarkedForReview ? '#000000' : 'none'} />
                    <span>{isMarkedForReview ? 'UNMARK REVIEW & NEXT' : 'MARK FOR REVIEW & NEXT'}</span>
                </button>

                <button
                    onClick={onNext}
                    style={{
                        padding: '9px 22px',
                        background: '#111827',
                        border: '1.5px solid #111827',
                        borderRadius: '6px',
                        color: '#FFFFFF',
                        fontWeight: 800,
                        fontSize: '13px',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '8px',
                        boxShadow: '0 2px 6px rgba(0,0,0,0.2)'
                    }}
                >
                    <span>{isLast ? 'REVIEW & SUBMIT' : 'SAVE & NEXT'}</span>
                    <ArrowRight size={14} />
                </button>
            </div>
        </div>
    );
}
