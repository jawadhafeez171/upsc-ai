'use client';
import React, { useRef, useEffect, useState } from 'react';
import { FastForward, Navigation, Sliders } from 'lucide-react';
import { QuestionState } from './QuickNavigator';

type JumpFilter = 'all' | 'review' | 'unanswered';

interface MobileJumpNavProps {
    totalQuestions: number;
    currentIdx: number;
    questionStates: QuestionState[];
    onSelectQuestion: (index: number) => void;
    onJumpNextUnanswered: () => void;
    markedCount: number;
    unansweredCount: number;
}

export default function MobileJumpNav({
    totalQuestions,
    currentIdx,
    questionStates,
    onSelectQuestion,
    onJumpNextUnanswered,
    markedCount,
    unansweredCount
}: MobileJumpNavProps) {
    const [activeFilter, setActiveFilter] = useState<JumpFilter>('all');
    const scrollContainerRef = useRef<HTMLDivElement>(null);
    const activeItemRef = useRef<HTMLButtonElement>(null);

    // Auto-scroll the active question into center view in the horizontal jump bar
    useEffect(() => {
        if (activeItemRef.current && scrollContainerRef.current) {
            const container = scrollContainerRef.current;
            const item = activeItemRef.current;
            const scrollLeft = item.offsetLeft - (container.clientWidth / 2) + (item.clientWidth / 2);
            container.scrollTo({ left: Math.max(0, scrollLeft), behavior: 'smooth' });
        }
    }, [currentIdx]);

    // Filter questions if user selects "Review" or "Unanswered"
    const visibleIndices = Array.from({ length: totalQuestions }, (_, i) => i).filter((i) => {
        if (activeFilter === 'all') return true;
        const state = questionStates[i];
        if (activeFilter === 'review') return state === 'marked' || state === 'ans_and_marked';
        if (activeFilter === 'unanswered') return state === 'unanswered' || state === 'not_visited';
        return true;
    });

    return (
        <div className="cbt-mobile-jump-wrapper">
            {/* 1. Quick Filter Pills Row */}
            <div className="cbt-mobile-filters-row">
                <button
                    onClick={() => setActiveFilter('all')}
                    className={`cbt-filter-pill ${activeFilter === 'all' ? 'active' : ''}`}
                >
                    All
                </button>
                <button
                    onClick={() => setActiveFilter('review')}
                    className={`cbt-filter-pill ${activeFilter === 'review' ? 'active' : ''}`}
                >
                    <span style={{ color: '#7C3AED' }}>●</span> Review ({markedCount})
                </button>
                <button
                    onClick={() => setActiveFilter('unanswered')}
                    className={`cbt-filter-pill ${activeFilter === 'unanswered' ? 'active' : ''}`}
                >
                    <span style={{ color: '#DC2626' }}>●</span> Unanswered ({unansweredCount})
                </button>

                <button
                    onClick={onJumpNextUnanswered}
                    className="cbt-filter-next-unans"
                    title="Jump to Next Unanswered Question"
                >
                    <FastForward size={12} strokeWidth={2.5} />
                    <span>Next Unanswered</span>
                </button>
            </div>

            {/* 2. Horizontal Jump Pill Row */}
            <div className="cbt-mobile-jump-row">
                <div className="cbt-jump-label">
                    <Navigation size={12} strokeWidth={2.5} />
                    <span>JUMP:</span>
                </div>

                <div ref={scrollContainerRef} className="cbt-jump-scroll">
                    {visibleIndices.map((i) => {
                        const state = questionStates[i] || 'not_visited';
                        const isActive = i === currentIdx;
                        return (
                            <button
                                key={i}
                                ref={isActive ? activeItemRef : null}
                                onClick={() => onSelectQuestion(i)}
                                className={`cbt-jump-box ${state} ${isActive ? 'active' : ''}`}
                                title={`Question ${i + 1} (${state})`}
                            >
                                {i + 1}
                            </button>
                        );
                    })}
                </div>
            </div>

            {/* 3. Scrub Navigation Slider Bar */}
            <div className="cbt-mobile-scrub-bar">
                <div className="cbt-scrub-header">
                    <div className="cbt-scrub-title">
                        <Sliders size={12} strokeWidth={2.5} />
                        <span>Scrub Navigation</span>
                    </div>
                    <div className="cbt-scrub-count-badge">
                        Q {currentIdx + 1} / {totalQuestions}
                    </div>
                </div>

                <div className="cbt-scrub-slider-container">
                    <input
                        type="range"
                        min={0}
                        max={Math.max(0, totalQuestions - 1)}
                        value={currentIdx}
                        onChange={(e) => onSelectQuestion(parseInt(e.target.value, 10))}
                        className="cbt-scrub-slider"
                        aria-label="Question scrubber slider"
                    />
                    <div className="cbt-scrub-ticks">
                        <span>| 1</span>
                        <span>| {Math.round(totalQuestions * 0.25)}</span>
                        <span>| {Math.round(totalQuestions * 0.5)}</span>
                        <span>| {Math.round(totalQuestions * 0.75)}</span>
                        <span>| {totalQuestions}</span>
                    </div>
                </div>
            </div>
        </div>
    );
}
