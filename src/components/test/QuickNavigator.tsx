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
    // Generate adjacent question range centered on current question
    const windowSize = 5;
    const startIdx = Math.max(0, currentIdx - windowSize);
    const endIdx = Math.min(totalQuestions - 1, currentIdx + windowSize);

    const adjacentIndices: number[] = [];
    for (let i = startIdx; i <= endIdx; i++) {
        adjacentIndices.push(i);
    }

    const progressPercent = totalQuestions > 1 ? (currentIdx / (totalQuestions - 1)) * 100 : 0;

    return (
        <div className="cbt-box" style={{ padding: '14px 18px', marginBottom: '14px' }}>
            {/* Top row: Filter pills & Next Unanswered button */}
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: '8px', flexWrap: 'wrap', marginBottom: '12px' }}>
                <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                    <div style={{
                        padding: '4px 10px', borderRadius: '4px',
                        border: '1px solid #1E1E1E', background: '#FFFFFF',
                        fontSize: '11.5px', fontWeight: 800, color: '#111827'
                    }}>
                        ALL ({totalQuestions})
                    </div>

                    <div style={{
                        padding: '4px 10px', borderRadius: '4px',
                        border: '1px solid #7C3AED', background: '#FFFFFF',
                        fontSize: '11.5px', fontWeight: 800, color: '#7C3AED',
                        display: 'flex', alignItems: 'center', gap: '5px'
                    }}>
                        <span style={{ width: '7px', height: '7px', borderRadius: '50%', background: '#7C3AED' }} />
                        MARKED ({markedCount})
                    </div>

                    <div style={{
                        padding: '4px 10px', borderRadius: '4px',
                        border: '1px solid #DC2626', background: '#FFFFFF',
                        fontSize: '11.5px', fontWeight: 800, color: '#DC2626',
                        display: 'flex', alignItems: 'center', gap: '5px'
                    }}>
                        <span style={{ width: '7px', height: '7px', borderRadius: '50%', background: '#DC2626' }} />
                        UNANSWERED ({unansweredCount})
                    </div>
                </div>

                <button
                    onClick={onJumpNextUnanswered}
                    style={{
                        padding: '5px 12px',
                        borderRadius: '4px',
                        border: '1px solid #DC2626',
                        background: '#DC2626',
                        color: '#FFFFFF',
                        fontSize: '11.5px',
                        fontWeight: 800,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '6px',
                        boxShadow: '0 1px 4px rgba(220, 38, 38, 0.25)'
                    }}
                >
                    <Zap size={13} fill="#FFFFFF" />
                    NEXT UNANSWERED
                </button>
            </div>

            {/* Middle row: ADJACENT strip */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '14px', flexWrap: 'wrap' }}>
                <span style={{ fontSize: '11px', fontWeight: 800, color: '#555E6C', letterSpacing: '0.05em' }}>
                    ADJACENT:
                </span>
                <div style={{ display: 'flex', gap: '5px', flexWrap: 'wrap' }}>
                    {adjacentIndices.map((idx) => {
                        const state = questionStates[idx] || 'not_visited';
                        const isCurrent = idx === currentIdx;

                        let bg = '#E2E8F0';
                        let textColor = '#475569';
                        let borderColor = '#CBD5E1';

                        if (state === 'answered') {
                            bg = '#16A34A';
                            textColor = '#FFFFFF';
                            borderColor = '#15803D';
                        } else if (state === 'unanswered') {
                            bg = '#DC2626';
                            textColor = '#FFFFFF';
                            borderColor = '#B91C1C';
                        } else if (state === 'marked' || state === 'ans_and_marked') {
                            bg = '#7C3AED';
                            textColor = '#FFFFFF';
                            borderColor = '#6D28D9';
                        }

                        return (
                            <button
                                key={idx}
                                onClick={() => onSelectQuestion(idx)}
                                style={{
                                    width: '32px',
                                    height: '28px',
                                    background: bg,
                                    color: textColor,
                                    border: isCurrent ? '2.5px solid #000000' : `1px solid ${borderColor}`,
                                    borderRadius: '4px',
                                    fontWeight: isCurrent ? 900 : 700,
                                    fontSize: '12px',
                                    cursor: 'pointer',
                                    display: 'flex',
                                    alignItems: 'center',
                                    justifyContent: 'center',
                                    boxShadow: isCurrent ? '0 0 0 2px #FACC15' : 'none',
                                    transform: isCurrent ? 'scale(1.06)' : 'none',
                                    transition: 'all 0.1s'
                                }}
                            >
                                {idx + 1}
                            </button>
                        );
                    })}
                </div>
            </div>

            {/* Bottom row: Range scrubber */}
            <div>
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '6px' }}>
                    <div style={{ fontSize: '10.5px', fontWeight: 700, color: '#6B7280' }}>
                        ⊶ Exam Progress Range:
                    </div>
                    <div style={{
                        background: '#111827',
                        color: '#FFFFFF',
                        padding: '2px 8px',
                        borderRadius: '3px',
                        fontSize: '10px',
                        fontWeight: 800,
                        letterSpacing: '0.05em'
                    }}>
                        CURRENT: QUESTION {currentIdx + 1} OF {totalQuestions}
                    </div>
                </div>

                <div style={{ position: 'relative', padding: '6px 0' }}>
                    <input
                        type="range"
                        min={0}
                        max={Math.max(0, totalQuestions - 1)}
                        value={currentIdx}
                        onChange={(e) => onSelectQuestion(Number(e.target.value))}
                        style={{
                            width: '100%',
                            height: '6px',
                            borderRadius: '3px',
                            accentColor: '#111827',
                            cursor: 'pointer',
                            outline: 'none'
                        }}
                    />
                    {/* Tick markers */}
                    <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '10px', fontWeight: 700, color: '#6B7280', marginTop: '2px' }}>
                        <span>Q 01</span>
                        <span>Q {Math.round(totalQuestions * 0.25)}</span>
                        <span>Q {Math.round(totalQuestions * 0.5)}</span>
                        <span>Q {Math.round(totalQuestions * 0.75)}</span>
                        <span>Q {totalQuestions}</span>
                    </div>
                </div>
            </div>
        </div>
    );
}
