'use client';
import React from 'react';
import { Zap } from 'lucide-react';

export type QuestionState = 'answered' | 'unanswered' | 'marked' | 'ans_and_marked' | 'not_visited';

interface QuickNavigatorProps {
    totalQuestions: number;
    currentIdx: number;
    markedCount: number;
    unansweredCount: number;
    questionStates?: QuestionState[];
    onSelectQuestion?: (index: number) => void;
    onJumpNextUnanswered: () => void;
}

export default function QuickNavigator({
    totalQuestions,
    currentIdx,
    markedCount,
    unansweredCount,
    onJumpNextUnanswered
}: QuickNavigatorProps) {
    const progressPercent = totalQuestions > 0 ? ((currentIdx + 1) / totalQuestions) * 100 : 0;

    return (
        <div className="cbt-box" style={{ padding: '10px 16px', marginBottom: '14px' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: '12px', flexWrap: 'wrap' }}>
                {/* Left: Current Question & Progress */}
                <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                    <span style={{
                        background: '#1E1B4B',
                        color: '#FFFFFF',
                        border: '1px solid #312E81',
                        padding: '4px 10px',
                        borderRadius: '6px',
                        fontSize: '11px',
                        fontWeight: 800,
                        letterSpacing: '0.05em',
                        fontFamily: 'var(--cbt-font-mono)'
                    }}>
                        QUESTION {currentIdx + 1} / {totalQuestions}
                    </span>
                    <div
                        role="progressbar"
                        aria-valuenow={currentIdx + 1}
                        aria-valuemin={1}
                        aria-valuemax={totalQuestions}
                        aria-label="Exam Question Progress"
                        style={{ width: '90px', height: '6px', background: 'var(--cbt-border, #E2E8F0)', borderRadius: '9999px', overflow: 'hidden' }}
                    >
                        <div style={{ width: `${progressPercent}%`, height: '100%', background: '#2563EB', transition: 'width 0.25s ease' }} />
                    </div>
                </div>

                {/* Center: Live status summary */}
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                    <div style={{
                        padding: '4px 10px', borderRadius: '6px',
                        border: '1px solid #DDD6FE', background: '#FAF5FF',
                        fontSize: '11px', fontWeight: 800, color: '#6D28D9',
                        display: 'flex', alignItems: 'center', gap: '6px',
                        fontFamily: 'var(--cbt-font-mono)'
                    }}>
                        <span style={{ width: '6px', height: '6px', borderRadius: '50%', background: '#7C3AED' }} />
                        MARKED: {markedCount}
                    </div>

                    <div style={{
                        padding: '4px 10px', borderRadius: '6px',
                        border: '1px solid #FECACA', background: '#FEF2F2',
                        fontSize: '11px', fontWeight: 800, color: '#B91C1C',
                        display: 'flex', alignItems: 'center', gap: '6px',
                        fontFamily: 'var(--cbt-font-mono)'
                    }}>
                        <span style={{ width: '6px', height: '6px', borderRadius: '50%', background: '#DC2626' }} />
                        UNANSWERED: {unansweredCount}
                    </div>
                </div>

                {/* Right: Quick Jump to next unanswered */}
                <button
                    onClick={onJumpNextUnanswered}
                    aria-label="Jump to next unanswered question"
                    style={{
                        padding: '5px 12px',
                        borderRadius: '6px',
                        border: '1px solid #DC2626',
                        background: '#DC2626',
                        color: '#FFFFFF',
                        fontSize: '11px',
                        fontWeight: 800,
                        letterSpacing: '0.02em',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                        boxShadow: '0 1px 3px rgba(220, 38, 38, 0.25)',
                        transition: 'opacity 0.15s ease'
                    }}
                >
                    <Zap size={13} fill="#FFFFFF" />
                    NEXT UNANSWERED
                </button>
            </div>
        </div>
    );
}
