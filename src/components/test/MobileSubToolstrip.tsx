'use client';
import React from 'react';
import { Check } from 'lucide-react';

interface MobileSubToolstripProps {
    subject: string;
    subTopic?: string;
    negativeDeduction: number;
    fontSizePercent: number;
    onZoomIn: () => void;
    onZoomReset: () => void;
    answeredCount: number;
    totalQuestions: number;
}

export default function MobileSubToolstrip({
    subject,
    subTopic,
    negativeDeduction,
    fontSizePercent,
    onZoomIn,
    onZoomReset,
    answeredCount,
    totalQuestions
}: MobileSubToolstripProps) {
    const formattedSubject = subTopic ? `${subject} (${subTopic})` : subject;
    const isZoomed = fontSizePercent > 100;

    return (
        <div className="cbt-mobile-substrip">
            {/* 1. Subject Pill */}
            <div className="cbt-substrip-subject" title={formattedSubject}>
                <span style={{ color: '#EAB308', fontSize: '14px' }}>●</span>
                <span>{formattedSubject.toUpperCase()}</span>
            </div>

            {/* 2. Negative Marks Badge */}
            <div className="cbt-substrip-neg">
                -{negativeDeduction.toFixed(2)} Neg
            </div>

            {/* 3. Zoom Toggle Button */}
            <button
                onClick={isZoomed ? onZoomReset : onZoomIn}
                className="cbt-substrip-zoom"
                title="Toggle Text Size"
            >
                <span style={{ fontSize: '11px', fontWeight: isZoomed ? 400 : 800 }}>A</span>
                <span style={{ fontSize: '12.5px', fontWeight: isZoomed ? 800 : 400, color: '#2563EB' }}>A+</span>
            </button>

            {/* 4. Yellow Answered Counter Badge */}
            <div className="cbt-substrip-progress" title="Answered Questions">
                <Check size={13} strokeWidth={3} />
                <span>{answeredCount}/{totalQuestions}</span>
            </div>
        </div>
    );
}
