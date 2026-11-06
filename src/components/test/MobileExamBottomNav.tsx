'use client';
import React from 'react';
import { Bookmark, RotateCcw, ArrowRight, ArrowLeft, Send } from 'lucide-react';

interface MobileExamBottomNavProps {
    isMarkedForReview: boolean;
    onToggleReview: () => void;
    onClearResponse: () => void;
    onSaveAndNext: () => void;
    onSubmitExam: () => void;
    onPrevious?: () => void;
    canGoPrevious?: boolean;
    isLastQuestion: boolean;
}

export default function MobileExamBottomNav({
    isMarkedForReview,
    onToggleReview,
    onClearResponse,
    onSaveAndNext,
    onSubmitExam,
    onPrevious,
    canGoPrevious = false,
    isLastQuestion
}: MobileExamBottomNavProps) {
    return (
        <nav className="cbt-mobile-bottom-nav" aria-label="Mobile exam navigation controls">
            {/* 1. PREVIOUS */}
            <button
                type="button"
                onClick={onPrevious}
                disabled={!canGoPrevious}
                className="cbt-nav-btn prev"
                style={{ opacity: canGoPrevious ? 1 : 0.4, cursor: canGoPrevious ? 'pointer' : 'not-allowed' }}
                title="Previous Question"
            >
                <ArrowLeft size={14} strokeWidth={2.5} />
                <span>PREV</span>
            </button>

            {/* 2. REVIEW / MARK */}
            <button
                type="button"
                onClick={onToggleReview}
                className={`cbt-nav-btn ${isMarkedForReview ? 'review' : 'clear'}`}
                title="Mark for Review"
            >
                <Bookmark size={14} strokeWidth={2.5} fill={isMarkedForReview ? '#F59E0B' : 'none'} />
                <span>{isMarkedForReview ? 'MARKED' : 'REVIEW'}</span>
            </button>

            {/* 3. CLEAR RESPONSE */}
            <button
                type="button"
                onClick={onClearResponse}
                className="cbt-nav-btn clear"
                title="Clear selected option"
            >
                <RotateCcw size={14} strokeWidth={2.5} />
                <span>CLEAR</span>
            </button>

            {/* 4. PRIMARY ACTION: SAVE & NEXT OR SUBMIT (ON LAST QUESTION) */}
            {isLastQuestion ? (
                <button
                    type="button"
                    onClick={onSubmitExam}
                    className="cbt-nav-btn submit"
                    style={{ background: '#16A34A', borderColor: '#15803D', color: '#FFFFFF' }}
                    title="Review & Submit Examination"
                >
                    <Send size={14} strokeWidth={2.5} />
                    <span>SUBMIT</span>
                </button>
            ) : (
                <button
                    type="button"
                    onClick={onSaveAndNext}
                    className="cbt-nav-btn save-next"
                    title="Save and go to Next Question"
                >
                    <span>NEXT</span>
                    <ArrowRight size={14} strokeWidth={2.5} />
                </button>
            )}
        </nav>
    );
}
