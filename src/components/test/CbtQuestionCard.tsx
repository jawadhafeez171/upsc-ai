'use client';
import React, { useState } from 'react';
import { Flag, X, RefreshCw, ZoomIn, AlertCircle } from 'lucide-react';
import QuestionFormatter, { OptionFormatter } from '@/components/ui/QuestionFormatter';
import PassageCard from '@/components/ui/PassageCard';
import { isValidImageUrl } from '@/lib/imageUtils';

interface Option {
    id: string;
    text: string;
    text_kn?: string;
    text_hi?: string;
}

interface CbtQuestionCardProps {
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
        node_id?: string;
    };
    activeLang: 'en' | 'kn' | 'hi';
    supportedLangs: ('en' | 'kn' | 'hi')[];
    onToggleLang: () => void;
    selectedOptionId?: string;
    eliminatedOptionIds: Record<string, boolean>;
    onSelectOption: (optionId: string) => void;
    onToggleEliminate: (optionId: string) => void;
    fontSizePercent: number;
    onReportDiscrepancy: () => void;
    onPreviewImage: (imageUrl: string) => void;
}

export default function CbtQuestionCard({
    questionNumber,
    question,
    activeLang,
    supportedLangs,
    onToggleLang,
    selectedOptionId,
    eliminatedOptionIds,
    onSelectOption,
    onToggleEliminate,
    fontSizePercent,
    onReportDiscrepancy,
    onPreviewImage
}: CbtQuestionCardProps) {
    const hasTranslation = activeLang !== 'en' && ((activeLang === 'kn' && question.text_kn) || (activeLang === 'hi' && question.text_hi));
    const secondaryLangLabel = activeLang === 'kn' ? 'KANNADA ACTIVE' : 'HINDI ACTIVE';

    // Parse question statement blocks if question text has numbered statements: "1. ... 2. ..." or "1) ... 2) ..."
    const parseStatementBlocks = (rawText: string) => {
        const statementRegex = /(?:^|\n)\s*(?:\[?(\d+)\]?|\(?(\d+)\))\s*[\.\)]\s*([^\n]+)/g;
        const matches = [...rawText.matchAll(statementRegex)];
        if (matches.length >= 2) {
            // Found numbered statements
            const firstIndex = rawText.indexOf(matches[0][0]);
            const preamble = rawText.slice(0, firstIndex).trim();
            const statements = matches.map((m) => ({ num: m[1] || m[2], text: m[3].trim() }));
            const lastMatchEnd = (matches[matches.length - 1].index || 0) + matches[matches.length - 1][0].length;
            const postamble = rawText.slice(lastMatchEnd).trim();
            return { hasBlocks: true, preamble, statements, postamble };
        }
        return { hasBlocks: false, text: rawText };
    };

    const parsedEnglish = parseStatementBlocks(question.text);
    const parsedSecondary = hasTranslation ? parseStatementBlocks(activeLang === 'kn' ? (question.text_kn || '') : (question.text_hi || '')) : null;

    // Generate statutory or factual reference note for the exam tip box
    const tipText = question.explanation 
        ? question.explanation.slice(0, 140).replace(/^[A-Z]\s*is\s*correct[\.:\s]*/i, '') + (question.explanation.length > 140 ? '...' : '')
        : 'Carefully eliminate improbable statement pairs before finalizing response.';
    const tipRef = question.node_id ? question.node_id.toUpperCase().replace(/_/g, '-') : (question.sub_topic ? question.sub_topic.toUpperCase() : 'GS-STANDARD');

    return (
        <div className="cbt-box" style={{ padding: '20px 24px', marginBottom: '14px', fontSize: `${fontSizePercent}%` }}>
            {/* Top Bar: Benchmark info + Language status pill + Report Discrepancy */}
            <div style={{
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                paddingBottom: '12px',
                marginBottom: '16px',
                borderBottom: '1px solid #E5E7EB',
                flexWrap: 'wrap',
                gap: '8px'
            }}>
                <div style={{ fontSize: '11px', fontWeight: 800, color: '#374151', letterSpacing: '0.04em' }}>
                    ■ PRELIMS MOCK BENCHMARK • CODE D
                </div>

                <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                    {supportedLangs.length > 1 && (
                        <button
                            onClick={onToggleLang}
                            style={{
                                display: 'inline-flex',
                                alignItems: 'center',
                                gap: '5px',
                                padding: '3px 8px',
                                borderRadius: '4px',
                                border: '1px solid #1E1E1E',
                                background: '#F8FAF6',
                                fontSize: '11px',
                                fontWeight: 800,
                                color: '#166534',
                                cursor: 'pointer'
                            }}
                        >
                            <span>文 {secondaryLangLabel}</span>
                        </button>
                    )}

                    <button
                        onClick={onReportDiscrepancy}
                        style={{
                            display: 'inline-flex',
                            alignItems: 'center',
                            gap: '4px',
                            background: 'transparent',
                            border: 'none',
                            color: '#6B7280',
                            fontSize: '11.5px',
                            fontWeight: 600,
                            cursor: 'pointer'
                        }}
                    >
                        <Flag size={12} />
                        <span>Report Discrepancy</span>
                    </button>
                </div>
            </div>

            {/* Common Passage / Comprehension if any */}
            {(question.passage || question.passage_kn || question.passage_hi) && (
                <div style={{ marginBottom: '16px' }}>
                    <PassageCard
                        passage={question.passage}
                        passage_kn={question.passage_kn}
                        passage_hi={question.passage_hi}
                        group_label={question.group_label}
                        activeLang={activeLang}
                        compact
                    />
                </div>
            )}

            {/* Question Number Badge & Statement Area */}
            <div style={{ display: 'flex', alignItems: 'flex-start', gap: '14px', marginBottom: '20px' }}>
                {/* Yellow Question Number Badge */}
                <div style={{
                    width: '36px',
                    height: '36px',
                    background: '#FACC15',
                    color: '#000000',
                    border: '1.5px solid #1E1E1E',
                    borderRadius: '4px',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'center',
                    fontSize: '16px',
                    fontWeight: 900,
                    flexShrink: 0,
                    marginTop: '2px',
                    boxShadow: '0 1px 3px rgba(0,0,0,0.1)'
                }}>
                    {questionNumber}
                </div>

                {/* Main Question Body */}
                <div style={{ flex: 1 }}>
                    {/* If parsed into structured blocks */}
                    {parsedEnglish.hasBlocks ? (
                        <div>
                            {/* Preamble */}
                            <div style={{ fontSize: '15px', fontWeight: 700, lineHeight: 1.6, color: '#111827', marginBottom: '8px' }}>
                                <QuestionFormatter text={parsedEnglish.preamble!} />
                            </div>
                            {parsedSecondary?.hasBlocks && (
                                <div style={{ fontSize: '14px', color: '#4B5563', lineHeight: 1.6, marginBottom: '14px' }}>
                                    <QuestionFormatter text={parsedSecondary.preamble!} />
                                </div>
                            )}

                            {/* Statement Blocks [1], [2], [3] */}
                            <div style={{ margin: '14px 0', display: 'flex', flexDirection: 'column', gap: '10px' }}>
                                {parsedEnglish.statements!.map((st, sIdx) => {
                                    const secSt = parsedSecondary?.hasBlocks ? parsedSecondary.statements![sIdx] : null;
                                    return (
                                        <div key={sIdx} className="cbt-statement-box">
                                            <div className="cbt-statement-num">
                                                {st.num}
                                            </div>
                                            <div style={{ flex: 1 }}>
                                                <div style={{ fontSize: '14px', fontWeight: 600, color: '#1F2937', lineHeight: 1.5 }}>
                                                    <QuestionFormatter text={st.text} />
                                                </div>
                                                {secSt && (
                                                    <div style={{ fontSize: '13px', color: '#4B5563', marginTop: '2px', lineHeight: 1.5 }}>
                                                        <QuestionFormatter text={secSt.text} />
                                                    </div>
                                                )}
                                            </div>
                                        </div>
                                    );
                                })}
                            </div>

                            {/* Postamble / Sub-prompt */}
                            {parsedEnglish.postamble && (
                                <div style={{ marginTop: '12px' }}>
                                    <div style={{ fontSize: '14.5px', fontWeight: 800, color: '#111827', lineHeight: 1.5 }}>
                                        <QuestionFormatter text={parsedEnglish.postamble} />
                                    </div>
                                    {parsedSecondary?.hasBlocks && parsedSecondary.postamble && (
                                        <div style={{ fontSize: '13.5px', color: '#4B5563', marginTop: '2px', lineHeight: 1.5 }}>
                                            <QuestionFormatter text={parsedSecondary.postamble} />
                                        </div>
                                    )}
                                </div>
                            )}
                        </div>
                    ) : (
                        /* Standard Continuous Text */
                        <div>
                            <div style={{ fontSize: '15px', fontWeight: 700, lineHeight: 1.6, color: '#111827' }}>
                                <QuestionFormatter text={question.text} />
                            </div>
                            {hasTranslation && (
                                <div style={{ fontSize: '14px', color: '#4B5563', marginTop: '8px', lineHeight: 1.6 }}>
                                    <QuestionFormatter text={activeLang === 'kn' ? (question.text_kn || '') : (question.text_hi || '')} />
                                </div>
                            )}
                        </div>
                    )}

                    {/* Diagram Image if any */}
                    {isValidImageUrl(question.image_url) && (
                        <div
                            onClick={() => onPreviewImage(question.image_url!)}
                            title="Click to expand diagram"
                            style={{
                                marginTop: '14px',
                                borderRadius: '6px',
                                border: '1.5px solid #1E1E1E',
                                background: '#FFFFFF',
                                padding: '12px',
                                display: 'flex',
                                flexDirection: 'column',
                                alignItems: 'center',
                                cursor: 'zoom-in'
                            }}
                        >
                            <img src={question.image_url} alt="Question Diagram" style={{ maxWidth: '100%', maxHeight: '240px', objectFit: 'contain' }} />
                            <div style={{ fontSize: '11px', color: '#2563EB', fontWeight: 700, marginTop: '6px', display: 'flex', alignItems: 'center', gap: '4px' }}>
                                <ZoomIn size={12} /> Click to expand diagram
                            </div>
                        </div>
                    )}
                </div>
            </div>

            {/* Options Section */}
            <div style={{ marginTop: '24px' }}>
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '12px', flexWrap: 'wrap', gap: '6px' }}>
                    <div style={{ fontSize: '11px', fontWeight: 800, textTransform: 'uppercase', letterSpacing: '0.06em', color: '#555E6C' }}>
                        SELECT CANDIDATE RESPONSE
                    </div>
                    <div style={{ fontSize: '10.5px', fontFamily: 'var(--cbt-font-mono)', fontWeight: 600, color: '#6B7280' }}>
                        SHORTCUTS: PRESS KEYS [A, B, C, D]
                    </div>
                </div>

                <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                    {question.options.map((opt) => {
                        const isSelected = selectedOptionId === opt.id;
                        const isEliminated = !!eliminatedOptionIds[opt.id];
                        const optSecondary = hasTranslation ? (activeLang === 'kn' ? opt.text_kn : opt.text_hi) : undefined;

                        return (
                            <div
                                key={opt.id}
                                onClick={() => {
                                    if (!isEliminated) {
                                        onSelectOption(opt.id);
                                    }
                                }}
                                className={`cbt-option-row ${isSelected ? 'selected' : ''} ${isEliminated ? 'eliminated' : ''}`}
                            >
                                <div style={{ display: 'flex', alignItems: 'flex-start', gap: '12px', flex: 1 }}>
                                    {/* Letter Badge */}
                                    <div className="cbt-option-badge">
                                        {opt.id.toUpperCase()}
                                    </div>

                                    {/* Option Content & Selected Pill */}
                                    <div style={{ flex: 1 }}>
                                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px', flexWrap: 'wrap' }}>
                                            <div className="cbt-option-text" style={{ fontSize: '14px', fontWeight: isSelected ? 800 : 600, color: '#111827', lineHeight: 1.4 }}>
                                                <OptionFormatter text={opt.text} />
                                            </div>
                                            {isSelected && (
                                                <span style={{
                                                    background: '#000000',
                                                    color: '#FFFFFF',
                                                    fontSize: '9.5px',
                                                    fontWeight: 900,
                                                    padding: '1px 6px',
                                                    borderRadius: '3px',
                                                    letterSpacing: '0.06em'
                                                }}>
                                                    SELECTED
                                                </span>
                                            )}
                                        </div>

                                        {optSecondary && (
                                            <div className="cbt-option-text" style={{ fontSize: '13px', color: '#4B5563', marginTop: '2px', lineHeight: 1.4 }}>
                                                <OptionFormatter text={optSecondary} />
                                            </div>
                                        )}
                                    </div>
                                </div>

                                {/* Eliminate / Restore Button */}
                                <button
                                    onClick={(e) => {
                                        e.stopPropagation();
                                        onToggleEliminate(opt.id);
                                    }}
                                    className="cbt-eliminate-btn"
                                    title={isEliminated ? 'Restore option' : 'Cross out option (50-50 elimination)'}
                                >
                                    {isEliminated ? (
                                        <>
                                            <RefreshCw size={11} /> RESTORE
                                        </>
                                    ) : (
                                        <>
                                            <X size={11} /> ELIMINATE
                                        </>
                                    )}
                                </button>
                            </div>
                        );
                    })}
                </div>
            </div>

            {/* Bottom Tip / Revision Reference Box */}
            <div style={{
                marginTop: '20px',
                background: '#F8F6F0',
                border: '1px solid #D1CBBE',
                borderRadius: '6px',
                padding: '10px 14px',
                display: 'flex',
                alignItems: 'center',
                justifyContent: 'space-between',
                flexWrap: 'wrap',
                gap: '10px'
            }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', flex: 1, minWidth: '240px' }}>
                    <div style={{ fontWeight: 800, fontSize: '11px', color: '#111827', letterSpacing: '0.04em', display: 'flex', alignItems: 'center', gap: '4px' }}>
                        <span>💡 EXAM TIP:</span>
                    </div>
                    <div style={{ fontSize: '12px', color: '#4B5563', lineHeight: 1.4 }}>
                        {tipText}
                    </div>
                </div>

                <div style={{
                    fontSize: '10.5px',
                    fontFamily: 'var(--cbt-font-mono)',
                    fontWeight: 700,
                    color: '#6B7280',
                    letterSpacing: '0.04em'
                }}>
                    REF: {tipRef}
                </div>
            </div>
        </div>
    );
}
