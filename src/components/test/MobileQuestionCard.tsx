'use client';
import React, { useState, useEffect } from 'react';
import { Volume2, VolumeX, Star, ChevronDown, ChevronUp, Check, SlidersHorizontal } from 'lucide-react';
import QuestionFormatter, { OptionFormatter } from '@/components/ui/QuestionFormatter';
import PassageCard from '@/components/ui/PassageCard';
import { isValidImageUrl } from '@/lib/imageUtils';

interface Option {
    id: string;
    text: string;
    text_kn?: string;
    text_hi?: string;
}

interface MobileQuestionCardProps {
    questionNumber: number;
    question: {
        id: string;
        text: string;
        text_kn?: string;
        text_hi?: string;
        options: Option[];
        passage?: string;
        passage_kn?: string;
        passage_hi?: string;
        group_label?: string;
        image_url?: string;
        explanation?: string;
        subject?: string;
        sub_topic?: string;
    };
    activeLang: 'en' | 'kn' | 'hi';
    positiveMarks: number;
    negativeDeduction: number;
    selectedOptionId?: string;
    eliminatedOptionIds: Record<string, boolean>;
    onSelectOption: (optionId: string) => void;
    onToggleEliminate: (optionId: string) => void;
    isBookmarked: boolean;
    onToggleBookmark: () => void;
    confidence: 'low' | 'med' | 'high' | null;
    onSetConfidence: (level: 'low' | 'med' | 'high') => void;
    answeredCount: number;
    markedCount: number;
    totalQuestions: number;
    onPreviewImage: (imageUrl: string) => void;
}

export default function MobileQuestionCard({
    questionNumber,
    question,
    activeLang,
    positiveMarks,
    negativeDeduction,
    selectedOptionId,
    eliminatedOptionIds,
    onSelectOption,
    onToggleEliminate,
    isBookmarked,
    onToggleBookmark,
    confidence,
    onSetConfidence,
    answeredCount,
    markedCount,
    totalQuestions,
    onPreviewImage
}: MobileQuestionCardProps) {
    const [showVernacular, setShowVernacular] = useState(false);
    const [isSpeaking, setIsSpeaking] = useState(false);

    // Stop speaking when question changes
    useEffect(() => {
        if (typeof window !== 'undefined' && 'speechSynthesis' in window) {
            window.speechSynthesis.cancel();
            setIsSpeaking(false);
        }
    }, [question.id]);

    const handleToggleSpeech = () => {
        if (typeof window === 'undefined' || !('speechSynthesis' in window)) return;

        if (isSpeaking) {
            window.speechSynthesis.cancel();
            setIsSpeaking(false);
        } else {
            const utteranceText = `${question.text}. ${question.options.map(o => `Option ${o.id}: ${o.text}`).join('. ')}`;
            const utterance = new SpeechSynthesisUtterance(utteranceText);
            utterance.rate = 0.95;
            utterance.onend = () => setIsSpeaking(false);
            utterance.onerror = () => setIsSpeaking(false);
            window.speechSynthesis.speak(utterance);
            setIsSpeaking(true);
        }
    };

    const qPrimaryText = activeLang === 'kn' && question.text_kn ? question.text_kn : (activeLang === 'hi' && question.text_hi ? question.text_hi : question.text);
    const vernacularText = activeLang === 'en' ? (question.text_kn || question.text_hi) : question.text;
    const vernacularLabel = question.text_kn ? 'ಕನ್ನಡದಲ್ಲಿ ವೀಕ್ಷಿಸಿ (Kannada Translation)' : (question.text_hi ? 'हिन्दी अनुवाद देखें (Hindi Translation)' : 'View Alternative Translation');
    const vernacularBadge = question.text_kn ? 'KN' : 'HI';

    const remainingCount = Math.max(0, totalQuestions - answeredCount);

    return (
        <div style={{ display: 'flex', flexDirection: 'column' }}>
            {/* 1. MCQ Type & Marks scheme top bar */}
            <div className="cbt-mobile-mcq-meta">
                <div className="cbt-mcq-type-badge">
                    <span>MCQ</span>
                    <span style={{ color: '#9CA3AF', fontWeight: 400 }}>·</span>
                    <span>Single Choice</span>
                </div>

                <div className="cbt-mcq-marks-pill">
                    <span style={{ color: '#16A34A', fontWeight: 900 }}>+{positiveMarks.toFixed(2)}</span>
                    <span style={{ margin: '0 4px', color: '#9CA3AF' }}>/</span>
                    <span style={{ color: '#DC2626', fontWeight: 900 }}>-{negativeDeduction.toFixed(2)}</span>
                </div>
            </div>

            {/* 2. Main Question Card */}
            <div className="cbt-mobile-card">
                {/* Header row: Question Number + TTS + Bookmark */}
                <div className="cbt-card-header-row">
                    <div className="cbt-question-title">
                        QUESTION {questionNumber}
                    </div>

                    <div className="cbt-card-action-icons">
                        <button
                            onClick={handleToggleSpeech}
                            className={`cbt-icon-btn ${isSpeaking ? 'active' : ''}`}
                            title={isSpeaking ? 'Stop reading' : 'Read question aloud'}
                            aria-label="Text to speech"
                        >
                            {isSpeaking ? <VolumeX size={16} strokeWidth={2.2} /> : <Volume2 size={16} strokeWidth={2.2} />}
                        </button>

                        <button
                            onClick={onToggleBookmark}
                            className={`cbt-icon-btn ${isBookmarked ? 'active' : ''}`}
                            title={isBookmarked ? 'Remove bookmark' : 'Bookmark question'}
                            aria-label="Bookmark question"
                        >
                            <Star size={16} strokeWidth={2.2} fill={isBookmarked ? '#EAB308' : 'none'} color={isBookmarked ? '#EAB308' : '#4B5563'} />
                        </button>
                    </div>
                </div>

                {/* Common Passage / Directions Card if present */}
                {(question.passage || question.passage_kn || question.passage_hi) && (
                    <PassageCard
                        passage={question.passage}
                        passage_kn={question.passage_kn}
                        passage_hi={question.passage_hi}
                        group_label={question.group_label}
                        activeLang={activeLang}
                    />
                )}

                {/* Question Prompt with rich statement formatting */}
                <div className="cbt-question-prompt">
                    <QuestionFormatter text={qPrimaryText} />
                </div>

                {/* Diagram Image if available */}
                {isValidImageUrl(question.image_url) && (
                    <div
                        onClick={() => onPreviewImage(question.image_url!)}
                        style={{
                            borderRadius: '6px',
                            overflow: 'hidden',
                            border: '1.5px solid #1E1E1E',
                            background: '#F9FAFB',
                            display: 'flex',
                            flexDirection: 'column',
                            alignItems: 'center',
                            padding: '12px',
                            cursor: 'zoom-in'
                        }}
                    >
                        <img
                            src={question.image_url}
                            alt="Question Diagram"
                            style={{ maxWidth: '100%', maxHeight: '240px', objectFit: 'contain' }}
                        />
                        <div style={{ fontSize: '11px', color: '#2563EB', fontWeight: 700, marginTop: '6px' }}>
                            🔍 Tap to view high-resolution diagram
                        </div>
                    </div>
                )}

                {/* Collapsible Vernacular Translation Accordion */}
                {vernacularText && (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '6px' }}>
                        <button
                            onClick={() => setShowVernacular(prev => !prev)}
                            className="cbt-vernacular-toggle"
                            aria-expanded={showVernacular}
                        >
                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                <span style={{
                                    background: '#B45309',
                                    color: '#FFFFFF',
                                    borderRadius: '3px',
                                    padding: '1px 5px',
                                    fontSize: '10px',
                                    fontWeight: 900
                                }}>
                                    {vernacularBadge}
                                </span>
                                <span>{vernacularLabel}</span>
                            </div>
                            {showVernacular ? <ChevronUp size={16} /> : <ChevronDown size={16} />}
                        </button>

                        {showVernacular && (
                            <div className="cbt-vernacular-content">
                                <QuestionFormatter text={vernacularText} />
                            </div>
                        )}
                    </div>
                )}
            </div>

            {/* 3. Answer Options Section */}
            <div className="cbt-options-section">
                <div className="cbt-options-meta-header">
                    <span>SELECT AN ANSWER</span>
                    <span className="cbt-eliminate-hint">
                        <SlidersHorizontal size={11} strokeWidth={2} />
                        Tap strikethrough to eliminate
                    </span>
                </div>

                {question.options.map((opt) => {
                    const optText = activeLang === 'kn' && opt.text_kn ? opt.text_kn : (activeLang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                    const isSelected = selectedOptionId === opt.id;
                    const isEliminated = !!eliminatedOptionIds[opt.id];

                    return (
                        <div
                            key={opt.id}
                            onClick={() => onSelectOption(opt.id)}
                            className={`cbt-option-row ${isSelected ? 'selected' : ''} ${isEliminated ? 'eliminated' : ''}`}
                        >
                            <div className="cbt-option-left">
                                <div className="cbt-option-badge">
                                    {isSelected ? <Check size={14} strokeWidth={3} /> : opt.id.toUpperCase()}
                                </div>
                                <div className="cbt-option-text">
                                    <OptionFormatter text={optText} />
                                </div>
                            </div>

                            <div className="cbt-option-right">
                                {isSelected && (
                                    <span className="cbt-chosen-pill">CHOSEN</span>
                                )}

                                <button
                                    type="button"
                                    onClick={(e) => {
                                        e.stopPropagation();
                                        onToggleEliminate(opt.id);
                                    }}
                                    className="cbt-option-eliminate-btn"
                                    title={isEliminated ? 'Restore option' : 'Eliminate option'}
                                    aria-label="Eliminate option"
                                >
                                    <span style={{ fontSize: '16px', fontWeight: 900, lineHeight: 1 }}>∓</span>
                                </button>
                            </div>
                        </div>
                    );
                })}
            </div>

            {/* 4. Telemetry Summary Row */}
            <div className="cbt-mobile-telemetry-row">
                <div>
                    <span style={{ color: '#111827' }}>● Answered:</span> <strong>{answeredCount}</strong>
                </div>
                <div>
                    <span style={{ color: '#DC2626' }}>● Marked:</span> <strong>{markedCount}</strong>
                </div>
                <div>
                    <span style={{ color: '#6B7280' }}>● Remaining:</span> <strong>{remainingCount}</strong>
                </div>
            </div>

            {/* 5. Self-Assessment Confidence Selector */}
            <div className="cbt-confidence-row">
                <div className="cbt-confidence-label">
                    <span>🎯</span>
                    <span>Self-Assessment Confidence</span>
                </div>

                <div className="cbt-confidence-group">
                    {(['low', 'med', 'high'] as const).map((lvl) => (
                        <button
                            key={lvl}
                            onClick={() => onSetConfidence(lvl)}
                            className={`cbt-conf-btn ${confidence === lvl ? 'active' : ''}`}
                        >
                            {lvl.toUpperCase()}
                        </button>
                    ))}
                </div>
            </div>
        </div>
    );
}
