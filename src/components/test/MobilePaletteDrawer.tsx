'use client';
import React from 'react';
import { X, LayoutGrid } from 'lucide-react';
import { QuestionState } from './QuickNavigator';
import CandidateInfoCard from './CandidateInfoCard';
import QuestionPaletteSummary from './QuestionPaletteSummary';
import QuestionPaletteGrid from './QuestionPaletteGrid';
import ExamToolsCard from './ExamToolsCard';

interface MobilePaletteDrawerProps {
    isOpen: boolean;
    onClose: () => void;
    totalQuestions: number;
    currentIdx: number;
    questionStates: QuestionState[];
    onSelectQuestion: (index: number) => void;
    candidateName: string;
    candidateId: string;
    targetExam: string;
    paperTitle: string;
    answeredCount: number;
    notAnsweredCount: number;
    markedReviewCount: number;
    ansAndReviewCount: number;
    notVisitedCount: number;
    onOpenFullPaper: () => void;
    onOpenInstructions: () => void;
    onSubmitExam: () => void;
}

export default function MobilePaletteDrawer({
    isOpen,
    onClose,
    totalQuestions,
    currentIdx,
    questionStates,
    onSelectQuestion,
    candidateName,
    candidateId,
    targetExam,
    paperTitle,
    answeredCount,
    notAnsweredCount,
    markedReviewCount,
    ansAndReviewCount,
    notVisitedCount,
    onOpenFullPaper,
    onOpenInstructions,
    onSubmitExam
}: MobilePaletteDrawerProps) {
    if (!isOpen) return null;

    return (
        <div
            className="cbt-palette-drawer-backdrop"
            onClick={onClose}
        >
            <div
                className="cbt-palette-drawer-content"
                onClick={(e) => e.stopPropagation()}
            >
                {/* Drawer Header */}
                <div className="cbt-drawer-header">
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <div style={{
                            width: '26px',
                            height: '26px',
                            background: '#FACC15',
                            border: '1.5px solid #1E1E1E',
                            borderRadius: '4px',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            color: '#1E1E1E'
                        }}>
                            <LayoutGrid size={15} strokeWidth={2.5} />
                        </div>
                        <span style={{ fontSize: '14px', fontWeight: 900, color: '#111827' }}>
                            QUESTION PALETTE & TOOLS
                        </span>
                    </div>

                    <button
                        onClick={onClose}
                        style={{
                            background: 'none',
                            border: 'none',
                            cursor: 'pointer',
                            color: '#6B7280',
                            padding: '4px'
                        }}
                        aria-label="Close question palette"
                    >
                        <X size={20} strokeWidth={2.5} />
                    </button>
                </div>

                {/* Drawer Body */}
                <div className="cbt-drawer-body">
                    {/* Candidate Info */}
                    <CandidateInfoCard
                        name={candidateName}
                        candidateId={candidateId}
                        targetExam={targetExam}
                    />

                    {/* Question Palette Summary (2x2 Matrix) */}
                    <QuestionPaletteSummary
                        total={totalQuestions}
                        answered={answeredCount}
                        notAnswered={notAnsweredCount}
                        markedReview={markedReviewCount}
                        ansAndReview={ansAndReviewCount}
                        notVisited={notVisitedCount}
                    />

                    {/* 10-Column Question Palette Grid */}
                    <QuestionPaletteGrid
                        totalQuestions={totalQuestions}
                        currentIdx={currentIdx}
                        questionStates={questionStates}
                        onSelectQuestion={(idx) => {
                            onSelectQuestion(idx);
                            onClose();
                        }}
                        paperTitle={paperTitle}
                    />

                    {/* Exam Tools Card (Full Paper, Instructions, Submit) */}
                    <ExamToolsCard
                        onOpenFullPaper={() => {
                            onOpenFullPaper();
                            onClose();
                        }}
                        onOpenInstructions={() => {
                            onOpenInstructions();
                            onClose();
                        }}
                        onSubmitExam={() => {
                            onSubmitExam();
                            onClose();
                        }}
                    />
                </div>
            </div>
        </div>
    );
}
