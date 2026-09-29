'use client';
import React from 'react';
import { Bookmark, RotateCcw, ArrowRight, Send } from 'lucide-react';

interface MobileExamBottomNavProps {
    isMarkedForReview: boolean;
    onToggleReview: () => void;
    onClearResponse: () => void;
    onSaveAndNext: () => void;
    onSubmitExam: () => void;
    isLastQuestion: boolean;
}

export default function MobileExamBottomNav({
    isMarkedForReview,
    onToggleReview,
    onClearResponse,
    onSaveAndNext,
    onSubmitExam,
    isLastQuestion
}: MobileExamBottomNavProps) {
    return (
        <nav className="cbt-mobile-bottom-nav" aria-label="Mobile exam navigation controls">
            {/* 1. REVIEW / MARK */}
            <button
                type="button"
                onClick={onToggleReview}
                className={`cbt-nav-btn ${isMarkedForReview ? 'review' : 'clear'}`}
                title="Mark for Review"
            >
                <Bookmark size={14} strokeWidth={2.5} fill={isMarkedForReview ? '#F59E0B' : 'none'} />
                <span>{isMarkedForReview ? 'REVIEWED' : 'REVIEW'}</span>
            </button>

            {/* 2. CLEAR RESPONSE */}
            <button
                type="button"
                onClick={onClearResponse}
                className="cbt-nav-btn clear"
                title="Clear selected option"
            >
                <RotateCcw size={14} strokeWidth={2.5} />
                <span>CLEAR</span>
            </button>

            {/* 3. SAVE & NEXT */}
            <button
                type="button"
                onClick={onSaveAndNext}
                className="cbt-nav-btn save-next"
                title={isLastQuestion ? 'Review Summary & Submit' : 'Save and go to Next Question'}
            >
                <span>{isLastQuestion ? 'SAVE & REVIEW' : 'SAVE & NEXT'}</span>
                <ArrowRight size={14} strokeWidth={2.5} />
            </button>

            {/* 4. SUBMIT EXAM */}
            <button
                type="button"
                onClick={onSubmitExam}
                className="cbt-nav-btn submit"
                title="Submit Examination"
            >
                <Send size={13} strokeWidth={2.5} />
                <span>SUBMIT</span>
            </button>
        </nav>
    );
}
