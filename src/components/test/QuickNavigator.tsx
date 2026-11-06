'use client';
import React from 'react';
import { Zap } from 'lucide-react';

export type QuestionState = 'answered' | 'unanswered' | 'marked' | 'ans_and_marked' | 'not_visited';

interface QuickNavigatorProps {
    totalQuestions: number;
    currentIdx: number;
    markedCount: number;
    unansweredCount: number;
    questionStates: QuestionState[];
    onSelectQuestion: (index: number) => void;
    onJumpNextUnanswered: () => void;
}

export default function QuickNavigator({
    totalQuestions,
    currentIdx,
    markedCount,
    unansweredCount,
    questionStates,
    onSelectQuestion,
    onJumpNextUnanswered
}: QuickNavigatorProps) {
    const progressPercent = totalQuestions > 0 ? ((currentIdx + 1) / totalQuestions) * 100 : 0;

    return (
        <div className="cbt-box" style={{ padding: '8px 14px', marginBottom: '12px' }}>
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: '10px', flexWrap: 'wrap' }}>
                {/* Left: Current Question & Progress */}
                <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                    <span style={{
                        background: '#111827',
                        color: '#FFFFFF',
                        padding: '3px 8px',
                        borderRadius: '4px',
                        fontSize: '11px',
                        fontWeight: 800,
                        letterSpacing: '0.04em'
                    }}>
                        QUESTION {currentIdx + 1} / {totalQuestions}
                    </span>
                    <div style={{ width: '80px', height: '6px', background: '#E5E7EB', borderRadius: '3px', overflow: 'hidden' }}>
                        <div style={{ width: `${progressPercent}%`, height: '100%', background: '#2563EB', transition: 'width 0.2s' }} />
                    </div>
                </div>

                {/* Center: Live status summary */}
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                    <div style={{
                        padding: '3px 8px', borderRadius: '4px',
                        border: '1px solid #7C3AED', background: '#FAF5FF',
                        fontSize: '11px', fontWeight: 800, color: '#7C3AED',
                        display: 'flex', alignItems: 'center', gap: '5px'
                    }}>
                        <span style={{ width: '6px', height: '6px', borderRadius: '50%', background: '#7C3AED' }} />
                        MARKED: {markedCount}
                    </div>

                    <div style={{
                        padding: '3px 8px', borderRadius: '4px',
                        border: '1px solid #DC2626', background: '#FEF2F2',
                        fontSize: '11px', fontWeight: 800, color: '#DC2626',
                        display: 'flex', alignItems: 'center', gap: '5px'
                    }}>
                        <span style={{ width: '6px', height: '6px', borderRadius: '50%', background: '#DC2626' }} />
                        UNANSWERED: {unansweredCount}
                    </div>
                </div>

                {/* Right: Quick Jump to next unanswered */}
                <button
                    onClick={onJumpNextUnanswered}
                    style={{
                        padding: '4px 10px',
                        borderRadius: '4px',
                        border: '1px solid #DC2626',
                        background: '#DC2626',
                        color: '#FFFFFF',
                        fontSize: '11px',
                        fontWeight: 800,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '5px',
                        boxShadow: '0 1px 3px rgba(220, 38, 38, 0.2)'
                    }}
                >
                    <Zap size={12} fill="#FFFFFF" />
                    NEXT UNANSWERED
                </button>
            </div>
        </div>
    );
}
