'use client';
import React from 'react';

interface ExamSubHeaderProps {
    currentIdx: number;
    totalQuestions: number;
    subject: string;
    subTopic?: string;
    positiveMarks: number;
    negativeDeduction: number;
    fontSizePercent: number;
    onZoomIn: () => void;
    onZoomOut: () => void;
    onZoomReset: () => void;
}

export default function ExamSubHeader({
    currentIdx,
    totalQuestions,
    subject,
    subTopic,
    positiveMarks,
    negativeDeduction,
    fontSizePercent,
    onZoomIn,
    onZoomOut,
    onZoomReset
}: ExamSubHeaderProps) {
    const formattedSubject = subTopic ? `${subject} (${subTopic})` : subject;

    return (
        <div className="cbt-sub-header">
            {/* Left: Q. Number badge + Subject pill + Pattern pill */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '8px', flexWrap: 'wrap' }}>
                {/* Question Number Badge */}
                <div style={{
                    background: '#111827',
                    color: '#FFFFFF',
                    padding: '5px 12px',
                    borderRadius: '4px',
                    fontWeight: 800,
                    fontSize: '12.5px',
                    fontFamily: 'var(--cbt-font-mono)',
                    border: '1px solid #111827'
                }}>
                    Q. {currentIdx + 1} / {totalQuestions}
                </div>

                {/* Subject Pill */}
                <div style={{
                    background: '#FFFFFF',
                    border: '1px solid #9CA3AF',
                    borderRadius: '4px',
                    padding: '4px 10px',
                    fontSize: '12px',
                    fontWeight: 700,
                    color: '#1F2937'
                }}>
                    <span style={{ color: '#4B5563', fontWeight: 600 }}>Subject: </span>
                    <span>{formattedSubject || 'General Studies'}</span>
                </div>

                {/* Exam Pattern Pill */}
                <div style={{
                    background: '#FFFFFF',
                    border: '1px solid #9CA3AF',
                    borderRadius: '4px',
                    padding: '4px 10px',
                    fontSize: '12px',
                    color: '#4B5563',
                    fontWeight: 600
                }}>
                    Single Choice Statement (UPSC/KPSC Pattern)
                </div>
            </div>

            {/* Right: Positive Marks + Negative Marks + Zoom Adjuster */}
            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                {/* Positive Marks */}
                <div style={{
                    background: 'rgba(22, 163, 74, 0.12)',
                    border: '1px solid rgba(22, 163, 74, 0.4)',
                    color: '#15803D',
                    padding: '4px 8px',
                    borderRadius: '4px',
                    fontSize: '12px',
                    fontWeight: 800
                }}>
                    +{positiveMarks.toFixed(2)} Marks
                </div>

                {/* Negative Marks */}
                <div style={{
                    background: negativeDeduction > 0 ? 'rgba(220, 38, 38, 0.12)' : 'rgba(100, 116, 139, 0.12)',
                    border: negativeDeduction > 0 ? '1px solid rgba(220, 38, 38, 0.4)' : '1px solid rgba(100, 116, 139, 0.4)',
                    color: negativeDeduction > 0 ? '#B91C1C' : '#475569',
                    padding: '4px 8px',
                    borderRadius: '4px',
                    fontSize: '12px',
                    fontWeight: 800
                }}>
                    {negativeDeduction > 0 ? `-${negativeDeduction.toFixed(2)} Negative (1/3rd)` : 'No Negative'}
                </div>

                {/* Font Size Adjuster Controls */}
                <div style={{
                    display: 'flex',
                    background: '#FFFFFF',
                    border: '1px solid #1E1E1E',
                    borderRadius: '4px',
                    overflow: 'hidden'
                }}>
                    <button
                        onClick={onZoomOut}
                        title="Decrease text size"
                        style={{
                            padding: '3px 7px',
                            background: 'transparent',
                            border: 'none',
                            borderRight: '1px solid #D1D5DB',
                            fontSize: '11px',
                            fontWeight: 700,
                            cursor: 'pointer',
                            color: '#111827'
                        }}
                    >
                        A-
                    </button>
                    <button
                        onClick={onZoomReset}
                        title="Reset text size"
                        style={{
                            padding: '3px 8px',
                            background: 'transparent',
                            border: 'none',
                            borderRight: '1px solid #D1D5DB',
                            fontSize: '11px',
                            fontWeight: 700,
                            cursor: 'pointer',
                            color: '#111827'
                        }}
                    >
                        {fontSizePercent}%
                    </button>
                    <button
                        onClick={onZoomIn}
                        title="Increase text size"
                        style={{
                            padding: '3px 7px',
                            background: 'transparent',
                            border: 'none',
                            fontSize: '11px',
                            fontWeight: 700,
                            cursor: 'pointer',
                            color: '#111827'
                        }}
                    >
                        A+
                    </button>
                </div>
            </div>
        </div>
    );
}
