'use client';
import React from 'react';
import { Eye, BookOpen, CheckCircle } from 'lucide-react';

interface ExamToolsCardProps {
    onOpenFullPaper: () => void;
    onOpenInstructions: () => void;
    onSubmitExam: () => void;
}

export default function ExamToolsCard({
    onOpenFullPaper,
    onOpenInstructions,
    onSubmitExam
}: ExamToolsCardProps) {
    return (
        <div className="cbt-box" style={{ padding: '14px' }}>
            {/* Top row: Full Paper View + Instructions */}
            <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '8px', marginBottom: '10px' }}>
                <button
                    onClick={onOpenFullPaper}
                    style={{
                        padding: '8px 10px',
                        background: '#FFFFFF',
                        border: '1.5px solid #1E1E1E',
                        borderRadius: '4px',
                        fontSize: '11px',
                        fontWeight: 800,
                        color: '#111827',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        gap: '6px'
                    }}
                >
                    <Eye size={13} />
                    <span>FULL PAPER VIEW</span>
                </button>

                <button
                    onClick={onOpenInstructions}
                    style={{
                        padding: '8px 10px',
                        background: '#FFFFFF',
                        border: '1.5px solid #1E1E1E',
                        borderRadius: '4px',
                        fontSize: '11px',
                        fontWeight: 800,
                        color: '#111827',
                        cursor: 'pointer',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        gap: '6px'
                    }}
                >
                    <BookOpen size={13} />
                    <span>INSTRUCTIONS</span>
                </button>
            </div>

            {/* Bottom button: Large Red Submit CTA */}
            <button
                onClick={onSubmitExam}
                style={{
                    width: '100%',
                    padding: '12px 14px',
                    background: '#DC2626',
                    border: '1.5px solid #DC2626',
                    borderRadius: '5px',
                    color: '#FFFFFF',
                    fontSize: '13px',
                    fontWeight: 900,
                    letterSpacing: '0.05em',
                    cursor: 'pointer',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    gap: '8px',
                    boxShadow: '0 2px 8px rgba(220, 38, 38, 0.35)'
                }}
            >
                <CheckCircle size={16} />
                <span>SUBMIT EXAMINATION</span>
            </button>
        </div>
    );
}
