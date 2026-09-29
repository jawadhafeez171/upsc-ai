'use client';
import React from 'react';

interface QuestionPaletteSummaryProps {
    total: number;
    answered: number;
    notAnswered: number;
    markedReview: number;
    ansAndReview: number;
    notVisited: number;
}

export default function QuestionPaletteSummary({
    total,
    answered,
    notAnswered,
    markedReview,
    ansAndReview,
    notVisited
}: QuestionPaletteSummaryProps) {
    return (
        <div className="cbt-box" style={{ padding: '12px 14px', marginBottom: '14px' }}>
            {/* Header */}
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '10px' }}>
                <div style={{ fontSize: '11px', fontWeight: 800, color: '#374151', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                    QUESTION PALETTE STATUS
                </div>
                <div style={{ fontSize: '11px', fontWeight: 800, color: '#111827', fontFamily: 'var(--cbt-font-mono)' }}>
                    {total} Total
                </div>
            </div>

            {/* 2x2 Matrix */}
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '8px', marginBottom: '8px' }}>
                {/* 1. Answered */}
                <div style={{
                    background: '#F0FDF4',
                    border: '1px solid #86EFAC',
                    borderRadius: '4px',
                    padding: '6px 10px',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px'
                }}>
                    <div style={{
                        width: '22px', height: '22px', borderRadius: '3px',
                        background: '#16A34A', color: '#FFFFFF',
                        fontWeight: 900, fontSize: '11px',
                        display: 'flex', alignItems: 'center', justifyContent: 'center',
                        fontFamily: 'var(--cbt-font-mono)'
                    }}>
                        {answered}
                    </div>
                    <div style={{ fontSize: '11.5px', fontWeight: 700, color: '#166534' }}>
                        Answered
                    </div>
                </div>

                {/* 2. Not Answered */}
                <div style={{
                    background: '#FEF2F2',
                    border: '1px solid #FECACA',
                    borderRadius: '4px',
                    padding: '6px 10px',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px'
                }}>
                    <div style={{
                        width: '22px', height: '22px', borderRadius: '3px',
                        background: '#DC2626', color: '#FFFFFF',
                        fontWeight: 900, fontSize: '11px',
                        display: 'flex', alignItems: 'center', justifyContent: 'center',
                        fontFamily: 'var(--cbt-font-mono)'
                    }}>
                        {notAnswered}
                    </div>
                    <div style={{ fontSize: '11.5px', fontWeight: 700, color: '#991B1B' }}>
                        Not Answered
                    </div>
                </div>

                {/* 3. Marked Review */}
                <div style={{
                    background: '#FAF5FF',
                    border: '1px solid #E9D5FF',
                    borderRadius: '4px',
                    padding: '6px 10px',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px'
                }}>
                    <div style={{
                        width: '22px', height: '22px', borderRadius: '3px',
                        background: '#7C3AED', color: '#FFFFFF',
                        fontWeight: 900, fontSize: '11px',
                        display: 'flex', alignItems: 'center', justifyContent: 'center',
                        fontFamily: 'var(--cbt-font-mono)'
                    }}>
                        {markedReview}
                    </div>
                    <div style={{ fontSize: '11.5px', fontWeight: 700, color: '#6B21A8' }}>
                        Marked Review
                    </div>
                </div>

                {/* 4. Ans & Review */}
                <div style={{
                    background: '#FAF5FF',
                    border: '1px solid #C084FC',
                    borderRadius: '4px',
                    padding: '6px 10px',
                    display: 'flex',
                    alignItems: 'center',
                    gap: '8px'
                }}>
                    <div style={{
                        width: '22px', height: '22px', borderRadius: '3px',
                        background: '#7C3AED', color: '#FFFFFF',
                        fontWeight: 900, fontSize: '11px',
                        display: 'flex', alignItems: 'center', justifyContent: 'center',
                        position: 'relative',
                        overflow: 'hidden',
                        fontFamily: 'var(--cbt-font-mono)'
                    }}>
                        <span style={{
                            position: 'absolute', top: 0, right: 0,
                            width: 0, height: 0,
                            borderStyle: 'solid',
                            borderWidth: '0 8px 8px 0',
                            borderColor: 'transparent #16A34A transparent transparent'
                        }} />
                        {ansAndReview}
                    </div>
                    <div style={{ fontSize: '11.5px', fontWeight: 700, color: '#581C87' }}>
                        Ans & Review
                    </div>
                </div>
            </div>

            {/* 5. Not Visited (Remaining in Bank) */}
            <div style={{
                background: '#F1F5F9',
                border: '1px solid #CBD5E1',
                borderRadius: '4px',
                padding: '6px 10px',
                display: 'flex',
                alignItems: 'center',
                gap: '8px'
            }}>
                <div style={{
                    width: '22px', height: '22px', borderRadius: '3px',
                    background: '#94A3B8', color: '#FFFFFF',
                    fontWeight: 900, fontSize: '11px',
                    display: 'flex', alignItems: 'center', justifyContent: 'center',
                    fontFamily: 'var(--cbt-font-mono)'
                }}>
                    {notVisited}
                </div>
                <div style={{ fontSize: '11.5px', fontWeight: 700, color: '#475569' }}>
                    Not Visited (Remaining in Bank)
                </div>
            </div>
        </div>
    );
}
