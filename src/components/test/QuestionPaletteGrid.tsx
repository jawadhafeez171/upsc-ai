'use client';
import React, { useState } from 'react';
import { QuestionState } from './QuickNavigator';

type PaletteFilter = 'all' | 'ans' | 'unans' | 'review';

interface QuestionPaletteGridProps {
    totalQuestions: number;
    currentIdx: number;
    questionStates: QuestionState[];
    onSelectQuestion: (index: number) => void;
    paperTitle?: string;
}

export default function QuestionPaletteGrid({
    totalQuestions,
    currentIdx,
    questionStates,
    onSelectQuestion,
    paperTitle = 'Paper I'
}: QuestionPaletteGridProps) {
    const [filter, setFilter] = useState<PaletteFilter>('all');

    return (
        <div className="cbt-box" style={{ padding: '14px', marginBottom: '14px' }}>
            {/* Header: Title + CBT STANDARD + Paper */}
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '12px' }}>
                <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-secondary, #475569)', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                    QUESTION PALETTE
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '6px' }}>
                    <span style={{
                        background: '#1E1B4B',
                        color: '#FFFFFF',
                        border: '1px solid #312E81',
                        fontSize: '9.5px',
                        fontWeight: 900,
                        padding: '2px 6px',
                        borderRadius: '4px',
                        letterSpacing: '0.04em'
                    }}>
                        CBT STANDARD
                    </span>
                    <span style={{
                        color: 'var(--brand-blue, #2563EB)',
                        fontSize: '11.5px',
                        fontWeight: 800
                    }}>
                        {paperTitle}
                    </span>
                </div>
            </div>

            {/* Filter Buttons */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '6px', marginBottom: '12px', flexWrap: 'wrap' }}>
                <span style={{ fontSize: '10px', fontWeight: 800, color: '#64748B', letterSpacing: '0.05em' }}>
                    FILTER:
                </span>
                <button
                    onClick={() => setFilter('all')}
                    type="button"
                    style={{
                        padding: '3px 9px',
                        borderRadius: '4px',
                        border: filter === 'all' ? '1px solid #1E1B4B' : '1px solid var(--cbt-border, #E2E8F0)',
                        background: filter === 'all' ? '#1E1B4B' : '#FFFFFF',
                        color: filter === 'all' ? '#FFFFFF' : '#334155',
                        fontSize: '11px',
                        fontWeight: 700,
                        cursor: 'pointer',
                        transition: 'all 0.15s ease'
                    }}
                >
                    All
                </button>
                <button
                    onClick={() => setFilter('ans')}
                    type="button"
                    style={{
                        padding: '3px 9px',
                        borderRadius: '4px',
                        border: filter === 'ans' ? '1px solid #10B981' : '1px solid var(--cbt-border, #E2E8F0)',
                        background: filter === 'ans' ? '#047857' : '#FFFFFF',
                        color: filter === 'ans' ? '#FFFFFF' : '#047857',
                        fontSize: '11px',
                        fontWeight: 700,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '4px',
                        transition: 'all 0.15s ease'
                    }}
                >
                    <span style={{ width: '5px', height: '5px', borderRadius: '50%', background: filter === 'ans' ? '#FFFFFF' : '#10B981' }} />
                    Ans
                </button>
                <button
                    onClick={() => setFilter('unans')}
                    type="button"
                    style={{
                        padding: '3px 9px',
                        borderRadius: '4px',
                        border: filter === 'unans' ? '1px solid #EF4444' : '1px solid var(--cbt-border, #E2E8F0)',
                        background: filter === 'unans' ? '#DC2626' : '#FFFFFF',
                        color: filter === 'unans' ? '#FFFFFF' : '#DC2626',
                        fontSize: '11px',
                        fontWeight: 700,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '4px',
                        transition: 'all 0.15s ease'
                    }}
                >
                    <span style={{ width: '5px', height: '5px', borderRadius: '50%', background: filter === 'unans' ? '#FFFFFF' : '#EF4444' }} />
                    Unans
                </button>
                <button
                    onClick={() => setFilter('review')}
                    type="button"
                    style={{
                        padding: '3px 9px',
                        borderRadius: '4px',
                        border: filter === 'review' ? '1px solid #7C3AED' : '1px solid var(--cbt-border, #E2E8F0)',
                        background: filter === 'review' ? '#7C3AED' : '#FFFFFF',
                        color: filter === 'review' ? '#FFFFFF' : '#6D28D9',
                        fontSize: '11px',
                        fontWeight: 700,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '4px',
                        transition: 'all 0.15s ease'
                    }}
                >
                    <span style={{ width: '5px', height: '5px', borderRadius: '50%', background: filter === 'review' ? '#FFFFFF' : '#7C3AED' }} />
                    Review
                </button>
            </div>

            {/* Total Questions label */}
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '8px', fontSize: '10.5px', fontWeight: 700, color: '#475569' }}>
                <span>Questions Matrix</span>
                <span style={{ fontFamily: 'var(--cbt-font-mono)' }}>{totalQuestions} Questions</span>
            </div>

            {/* 10-column Grid */}
            <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(10, 1fr)',
                gap: '5px',
                maxHeight: '340px',
                overflowY: 'auto',
                paddingRight: '2px'
            }}>
                {Array.from({ length: totalQuestions }, (_, i) => {
                    const state = questionStates[i] || 'not_visited';
                    const isCurrent = i === currentIdx;

                    let isDimmed = false;
                    if (filter === 'ans' && state !== 'answered' && state !== 'ans_and_marked') isDimmed = true;
                    if (filter === 'unans' && state !== 'unanswered') isDimmed = true;
                    if (filter === 'review' && state !== 'marked' && state !== 'ans_and_marked') isDimmed = true;

                    return (
                        <button
                            key={i}
                            type="button"
                            onClick={() => onSelectQuestion(i)}
                            className={`cbt-palette-cell state-${state} ${isCurrent ? 'state-active' : ''}`}
                            style={{
                                opacity: isDimmed ? 0.25 : 1,
                                height: '28px'
                            }}
                            title={`Question ${i + 1} - ${state.replace(/_/g, ' ')}`}
                            aria-label={`Question ${i + 1}, status: ${state.replace(/_/g, ' ')}`}
                        >
                            {i + 1}
                        </button>
                    );
                })}
            </div>
        </div>
    );
}
