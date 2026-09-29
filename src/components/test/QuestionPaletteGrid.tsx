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
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '10px' }}>
                <div style={{ fontSize: '11px', fontWeight: 800, color: '#374151', textTransform: 'uppercase', letterSpacing: '0.05em' }}>
                    QUESTION PALETTE
                </div>
                <div style={{ display: 'flex', alignItems: 'center', gap: '4px' }}>
                    <span style={{
                        background: '#111827',
                        color: '#FFFFFF',
                        fontSize: '9px',
                        fontWeight: 900,
                        padding: '2px 5px',
                        borderRadius: '3px',
                        letterSpacing: '0.04em'
                    }}>
                        CBT STANDARD
                    </span>
                    <span style={{
                        color: '#2563EB',
                        fontSize: '11px',
                        fontWeight: 800
                    }}>
                        {paperTitle}
                    </span>
                </div>
            </div>

            {/* Filter Buttons */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '6px', marginBottom: '10px', flexWrap: 'wrap' }}>
                <span style={{ fontSize: '10px', fontWeight: 800, color: '#6B7280', letterSpacing: '0.05em' }}>
                    FILTER:
                </span>
                <button
                    onClick={() => setFilter('all')}
                    style={{
                        padding: '3px 8px',
                        borderRadius: '3px',
                        border: filter === 'all' ? '1px solid #111827' : '1px solid #D1D5DB',
                        background: filter === 'all' ? '#111827' : '#FFFFFF',
                        color: filter === 'all' ? '#FFFFFF' : '#374151',
                        fontSize: '10.5px',
                        fontWeight: 700,
                        cursor: 'pointer'
                    }}
                >
                    All
                </button>
                <button
                    onClick={() => setFilter('ans')}
                    style={{
                        padding: '3px 8px',
                        borderRadius: '3px',
                        border: filter === 'ans' ? '1px solid #16A34A' : '1px solid #D1D5DB',
                        background: filter === 'ans' ? '#16A34A' : '#FFFFFF',
                        color: filter === 'ans' ? '#FFFFFF' : '#15803D',
                        fontSize: '10.5px',
                        fontWeight: 700,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '3px'
                    }}
                >
                    <span style={{ width: '5px', height: '5px', borderRadius: '50%', background: filter === 'ans' ? '#FFFFFF' : '#16A34A' }} />
                    Ans
                </button>
                <button
                    onClick={() => setFilter('unans')}
                    style={{
                        padding: '3px 8px',
                        borderRadius: '3px',
                        border: filter === 'unans' ? '1px solid #DC2626' : '1px solid #D1D5DB',
                        background: filter === 'unans' ? '#DC2626' : '#FFFFFF',
                        color: filter === 'unans' ? '#FFFFFF' : '#B91C1C',
                        fontSize: '10.5px',
                        fontWeight: 700,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '3px'
                    }}
                >
                    <span style={{ width: '5px', height: '5px', borderRadius: '50%', background: filter === 'unans' ? '#FFFFFF' : '#DC2626' }} />
                    Unans
                </button>
                <button
                    onClick={() => setFilter('review')}
                    style={{
                        padding: '3px 8px',
                        borderRadius: '3px',
                        border: filter === 'review' ? '1px solid #7C3AED' : '1px solid #D1D5DB',
                        background: filter === 'review' ? '#7C3AED' : '#FFFFFF',
                        color: filter === 'review' ? '#FFFFFF' : '#6D28D9',
                        fontSize: '10.5px',
                        fontWeight: 700,
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        gap: '3px'
                    }}
                >
                    <span style={{ width: '5px', height: '5px', borderRadius: '50%', background: filter === 'review' ? '#FFFFFF' : '#7C3AED' }} />
                    Review
                </button>
            </div>

            {/* Total Questions label */}
            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '8px', fontSize: '10.5px', fontWeight: 700, color: '#4B5563' }}>
                <span>Questions Matrix</span>
                <span>{totalQuestions} Questions</span>
            </div>

            {/* 10-column Grid */}
            <div style={{
                display: 'grid',
                gridTemplateColumns: 'repeat(10, 1fr)',
                gap: '4px',
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
                            onClick={() => onSelectQuestion(i)}
                            className={`cbt-palette-cell state-${state} ${isCurrent ? 'state-active' : ''}`}
                            style={{
                                opacity: isDimmed ? 0.25 : 1,
                                height: '28px'
                            }}
                            title={`Question ${i + 1} - ${state.replace(/_/g, ' ')}`}
                        >
                            {i + 1}
                        </button>
                    );
                })}
            </div>
        </div>
    );
}
