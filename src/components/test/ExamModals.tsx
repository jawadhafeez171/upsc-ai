'use client';
import React, { useState } from 'react';
import { X, CheckCircle, AlertTriangle, BookOpen, Clock, Send, Eye } from 'lucide-react';
import QuestionFormatter, { OptionFormatter } from '@/components/ui/QuestionFormatter';

// ─── 1. INSTRUCTIONS MODAL ───────────────────────────────────────
interface InstructionsModalProps {
    isOpen: boolean;
    onClose: () => void;
    examTitle: string;
    positiveMarks: number;
    negativeDeduction: number;
    durationMinutes: number;
}

export function InstructionsModal({
    isOpen,
    onClose,
    examTitle,
    positiveMarks,
    negativeDeduction,
    durationMinutes
}: InstructionsModalProps) {
    if (!isOpen) return null;

    return (
        <div style={{
            position: 'fixed', inset: 0, zIndex: 100,
            background: 'rgba(0, 0, 0, 0.75)',
            display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '20px'
        }}>
            <div className="cbt-box" style={{
                maxWidth: '680px', width: '100%', maxHeight: '85vh',
                display: 'flex', flexDirection: 'column', background: '#FFFFFF',
                borderRadius: '8px', overflow: 'hidden'
            }}>
                {/* Header */}
                <div style={{
                    padding: '16px 20px', background: '#F8F6F0',
                    borderBottom: '1.5px solid #1E1E1E',
                    display: 'flex', alignItems: 'center', justifyContent: 'space-between'
                }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <BookOpen size={18} color="#2563EB" />
                        <h3 style={{ margin: 0, fontSize: '16px', fontWeight: 800, color: '#111827' }}>
                            Examination Instructions & Marking Scheme
                        </h3>
                    </div>
                    <button onClick={onClose} style={{ background: 'none', border: 'none', cursor: 'pointer', color: '#6B7280' }}>
                        <X size={20} />
                    </button>
                </div>

                {/* Content */}
                <div style={{ padding: '20px', overflowY: 'auto', fontSize: '13.5px', lineHeight: 1.6, color: '#374151' }}>
                    <div style={{
                        background: '#EFF6FF', border: '1px solid #BFDBFE',
                        borderRadius: '6px', padding: '12px 16px', marginBottom: '16px'
                    }}>
                        <div style={{ fontWeight: 800, color: '#1E40AF', marginBottom: '4px' }}>
                            {examTitle}
                        </div>
                        <div style={{ fontSize: '12.5px', color: '#1D4ED8' }}>
                            Duration: {durationMinutes} Minutes · Objective Type Computer-Based Test (CBT)
                        </div>
                    </div>

                    <h4 style={{ fontSize: '14px', fontWeight: 800, color: '#111827', margin: '14px 0 8px' }}>
                        1. Scoring & Marking Guidelines
                    </h4>
                    <ul style={{ paddingLeft: '20px', margin: 0 }}>
                        <li>Each question answered correctly awards <strong>+{positiveMarks.toFixed(2)} marks</strong>.</li>
                        <li>
                            {negativeDeduction > 0 ? (
                                <>For each incorrect answer, <strong>-{negativeDeduction.toFixed(2)} marks (1/3rd penalty)</strong> will be deducted from your total score.</>
                            ) : (
                                <>There is <strong>no negative marking</strong> for wrong answers in this examination sitting.</>
                            )}
                        </li>
                        <li>Unattempted questions receive <strong>0 marks</strong> (no positive or negative deduction).</li>
                        <li>Official commission dropped/cancelled questions (Key: &apos;X&apos;) carry <strong>full positive bonus marks</strong> with zero negative penalty.</li>
                    </ul>

                    <h4 style={{ fontSize: '14px', fontWeight: 800, color: '#111827', margin: '18px 0 8px' }}>
                        2. Navigation & Question Palette Symbols
                    </h4>
                    <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))', gap: '8px', margin: '8px 0' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                            <div style={{ width: '16px', height: '16px', borderRadius: '3px', background: '#16A34A' }} />
                            <span><strong>Green:</strong> Answered question</span>
                        </div>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                            <div style={{ width: '16px', height: '16px', borderRadius: '3px', background: '#DC2626' }} />
                            <span><strong>Red:</strong> Visited but unanswered</span>
                        </div>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                            <div style={{ width: '16px', height: '16px', borderRadius: '3px', background: '#7C3AED' }} />
                            <span><strong>Purple:</strong> Marked for review</span>
                        </div>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                            <div style={{ width: '16px', height: '16px', borderRadius: '3px', background: '#E2E8F0', border: '1px solid #CBD5E1' }} />
                            <span><strong>Grey:</strong> Not yet visited</span>
                        </div>
                    </div>

                    <h4 style={{ fontSize: '14px', fontWeight: 800, color: '#111827', margin: '18px 0 8px' }}>
                        3. Keyboard Shortcuts
                    </h4>
                    <div style={{ background: '#F8FAF6', border: '1px solid #D1D5DB', borderRadius: '6px', padding: '10px 14px' }}>
                        <div style={{ display: 'grid', gridTemplateColumns: '120px 1fr', gap: '6px', fontSize: '12px' }}>
                            <div><kbd style={{ background: '#E2E8F0', padding: '2px 6px', borderRadius: '3px' }}>A</kbd>, <kbd style={{ background: '#E2E8F0', padding: '2px 6px', borderRadius: '3px' }}>B</kbd>, <kbd style={{ background: '#E2E8F0', padding: '2px 6px', borderRadius: '3px' }}>C</kbd>, <kbd style={{ background: '#E2E8F0', padding: '2px 6px', borderRadius: '3px' }}>D</kbd></div>
                            <div>Select respective option</div>
                            <div><kbd style={{ background: '#E2E8F0', padding: '2px 6px', borderRadius: '3px' }}>Enter</kbd> or <kbd style={{ background: '#E2E8F0', padding: '2px 6px', borderRadius: '3px' }}>N</kbd></div>
                            <div>Save & Next question</div>
                            <div><kbd style={{ background: '#E2E8F0', padding: '2px 6px', borderRadius: '3px' }}>P</kbd></div>
                            <div>Previous question</div>
                            <div><kbd style={{ background: '#E2E8F0', padding: '2px 6px', borderRadius: '3px' }}>R</kbd></div>
                            <div>Toggle Mark for Review</div>
                        </div>
                    </div>
                </div>

                {/* Footer */}
                <div style={{ padding: '14px 20px', borderTop: '1px solid #E5E7EB', display: 'flex', justifyContent: 'flex-end', background: '#F9FAFB' }}>
                    <button
                        onClick={onClose}
                        style={{
                            padding: '8px 20px', background: '#111827', color: '#FFFFFF',
                            borderRadius: '5px', fontWeight: 800, fontSize: '13px', cursor: 'pointer', border: 'none'
                        }}
                    >
                        Got It, Resume Test
                    </button>
                </div>
            </div>
        </div>
    );
}

// ─── 2. FULL PAPER VIEW MODAL ──────────────────────────────────
interface FullPaperModalProps {
    isOpen: boolean;
    onClose: () => void;
    questions: any[];
    answers: Record<string, any>;
    activeLang: 'en' | 'kn' | 'hi';
    onJumpToQuestion: (index: number) => void;
}

export function FullPaperModal({
    isOpen,
    onClose,
    questions,
    answers,
    activeLang,
    onJumpToQuestion
}: FullPaperModalProps) {
    if (!isOpen) return null;

    return (
        <div style={{
            position: 'fixed', inset: 0, zIndex: 100,
            background: 'rgba(0, 0, 0, 0.75)',
            display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '20px'
        }}>
            <div className="cbt-box" style={{
                maxWidth: '920px', width: '100%', maxHeight: '90vh',
                display: 'flex', flexDirection: 'column', background: '#FFFFFF',
                borderRadius: '8px', overflow: 'hidden'
            }}>
                {/* Header */}
                <div style={{
                    padding: '16px 20px', background: '#F8F6F0',
                    borderBottom: '1.5px solid #1E1E1E',
                    display: 'flex', alignItems: 'center', justifyContent: 'space-between'
                }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                        <Eye size={18} color="#2563EB" />
                        <h3 style={{ margin: 0, fontSize: '16px', fontWeight: 800, color: '#111827' }}>
                            Full Question Paper View ({questions.length} Questions)
                        </h3>
                    </div>
                    <button onClick={onClose} style={{ background: 'none', border: 'none', cursor: 'pointer', color: '#6B7280' }}>
                        <X size={20} />
                    </button>
                </div>

                {/* Question List */}
                <div style={{ padding: '20px', overflowY: 'auto', display: 'flex', flexDirection: 'column', gap: '16px' }}>
                    {questions.map((q, idx) => {
                        const ans = answers[q.id];
                        const isAnswered = !!ans?.selected;
                        const qText = activeLang === 'kn' && q.text_kn ? q.text_kn : (activeLang === 'hi' && q.text_hi ? q.text_hi : q.text);

                        return (
                            <div
                                key={q.id}
                                style={{
                                    border: '1px solid #D1D5DB',
                                    borderRadius: '6px',
                                    padding: '14px 16px',
                                    background: isAnswered ? '#F0FDF4' : '#FFFFFF'
                                }}
                            >
                                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '8px' }}>
                                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                        <span style={{
                                            background: '#FACC15', color: '#000000',
                                            padding: '2px 8px', borderRadius: '4px',
                                            fontWeight: 900, fontSize: '12px'
                                        }}>
                                            Q.{idx + 1}
                                        </span>
                                        <span style={{ fontSize: '12px', color: '#6B7280', fontWeight: 600 }}>
                                            {q.subject || 'General Studies'}
                                        </span>
                                    </div>

                                    <button
                                        onClick={() => {
                                            onJumpToQuestion(idx);
                                            onClose();
                                        }}
                                        style={{
                                            padding: '4px 10px',
                                            background: '#111827',
                                            color: '#FFFFFF',
                                            border: 'none',
                                            borderRadius: '4px',
                                            fontSize: '11px',
                                            fontWeight: 700,
                                            cursor: 'pointer'
                                        }}
                                    >
                                        Jump to Question
                                    </button>
                                </div>

                                <div style={{ fontSize: '13.5px', fontWeight: 600, color: '#111827', lineHeight: 1.5, marginBottom: '10px' }}>
                                    <QuestionFormatter text={qText} />
                                </div>

                                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))', gap: '6px' }}>
                                    {q.options?.map((opt: any) => {
                                        const optText = activeLang === 'kn' && opt.text_kn ? opt.text_kn : (activeLang === 'hi' && opt.text_hi ? opt.text_hi : opt.text);
                                        const isSelected = ans?.selected === opt.id;
                                        return (
                                            <div
                                                key={opt.id}
                                                style={{
                                                    fontSize: '12px',
                                                    padding: '6px 10px',
                                                    borderRadius: '4px',
                                                    border: isSelected ? '1.5px solid #16A34A' : '1px solid #E5E7EB',
                                                    background: isSelected ? '#DCFCE7' : '#F9FAFB',
                                                    fontWeight: isSelected ? 800 : 500,
                                                    color: isSelected ? '#15803D' : '#374151'
                                                }}
                                            >
                                                <strong>({opt.id.toUpperCase()})</strong> <OptionFormatter text={optText} />
                                                {isSelected && <span style={{ marginLeft: '4px' }}>✓</span>}
                                            </div>
                                        );
                                    })}
                                </div>
                            </div>
                        );
                    })}
                </div>

                {/* Footer */}
                <div style={{ padding: '12px 20px', borderTop: '1px solid #E5E7EB', display: 'flex', justifyContent: 'flex-end', background: '#F9FAFB' }}>
                    <button
                        onClick={onClose}
                        style={{
                            padding: '8px 18px', background: '#111827', color: '#FFFFFF',
                            borderRadius: '5px', fontWeight: 800, fontSize: '12.5px', cursor: 'pointer', border: 'none'
                        }}
                    >
                        Close Paper View
                    </button>
                </div>
            </div>
        </div>
    );
}

// ─── 3. SUBMIT CONFIRMATION MODAL ──────────────────────────────
interface SubmitExamModalProps {
    isOpen: boolean;
    onClose: () => void;
    onConfirmSubmit: () => void;
    totalQuestions: number;
    answeredCount: number;
    unansweredCount: number;
    markedReviewCount: number;
    timeLeft: number;
}

export function SubmitExamModal({
    isOpen,
    onClose,
    onConfirmSubmit,
    totalQuestions,
    answeredCount,
    unansweredCount,
    markedReviewCount,
    timeLeft
}: SubmitExamModalProps) {
    if (!isOpen) return null;

    const formatRemaining = (sec: number) => {
        const mins = Math.floor(sec / 60);
        const s = sec % 60;
        return `${mins}m ${s}s`;
    };

    return (
        <div style={{
            position: 'fixed', inset: 0, zIndex: 100,
            background: 'rgba(0, 0, 0, 0.75)',
            display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '20px'
        }}>
            <div className="cbt-box" style={{
                maxWidth: '520px', width: '100%',
                background: '#FFFFFF', borderRadius: '8px', overflow: 'hidden'
            }}>
                {/* Header */}
                <div style={{
                    padding: '16px 20px', background: '#FEF2F2',
                    borderBottom: '1.5px solid #FCA5A5',
                    display: 'flex', alignItems: 'center', gap: '10px'
                }}>
                    <AlertTriangle size={22} color="#DC2626" />
                    <div>
                        <h3 style={{ margin: 0, fontSize: '16px', fontWeight: 800, color: '#991B1B' }}>
                            Submit Examination?
                        </h3>
                        <div style={{ fontSize: '12px', color: '#B91C1C', marginTop: '2px' }}>
                            You cannot change your answers after final submission.
                        </div>
                    </div>
                </div>

                {/* Telemetry Summary Table */}
                <div style={{ padding: '20px' }}>
                    <div style={{
                        display: 'grid', gridTemplateColumns: 'repeat(2, 1fr)', gap: '10px',
                        marginBottom: '16px'
                    }}>
                        <div style={{ background: '#F0FDF4', border: '1px solid #86EFAC', borderRadius: '6px', padding: '12px', textAlign: 'center' }}>
                            <div style={{ fontSize: '24px', fontWeight: 900, color: '#16A34A', fontFamily: 'var(--cbt-font-mono)' }}>
                                {answeredCount}
                            </div>
                            <div style={{ fontSize: '12px', fontWeight: 700, color: '#166534' }}>
                                Total Answered
                            </div>
                        </div>

                        <div style={{ background: '#FEF2F2', border: '1px solid #FECACA', borderRadius: '6px', padding: '12px', textAlign: 'center' }}>
                            <div style={{ fontSize: '24px', fontWeight: 900, color: '#DC2626', fontFamily: 'var(--cbt-font-mono)' }}>
                                {unansweredCount}
                            </div>
                            <div style={{ fontSize: '12px', fontWeight: 700, color: '#991B1B' }}>
                                Not Answered
                            </div>
                        </div>

                        <div style={{ background: '#FAF5FF', border: '1px solid #E9D5FF', borderRadius: '6px', padding: '12px', textAlign: 'center' }}>
                            <div style={{ fontSize: '24px', fontWeight: 900, color: '#7C3AED', fontFamily: 'var(--cbt-font-mono)' }}>
                                {markedReviewCount}
                            </div>
                            <div style={{ fontSize: '12px', fontWeight: 700, color: '#6B21A8' }}>
                                Marked for Review
                            </div>
                        </div>

                        <div style={{ background: '#F1F5F9', border: '1px solid #CBD5E1', borderRadius: '6px', padding: '12px', textAlign: 'center' }}>
                            <div style={{ fontSize: '24px', fontWeight: 900, color: '#475569', fontFamily: 'var(--cbt-font-mono)' }}>
                                {formatRemaining(timeLeft)}
                            </div>
                            <div style={{ fontSize: '12px', fontWeight: 700, color: '#475569' }}>
                                Time Remaining
                            </div>
                        </div>
                    </div>

                    {unansweredCount > 0 && (
                        <div style={{
                            background: '#FFFBEB', border: '1px solid #FCD34D',
                            borderRadius: '6px', padding: '10px 12px', fontSize: '12.5px',
                            color: '#92400E', display: 'flex', alignItems: 'center', gap: '8px'
                        }}>
                            <span>⚠️ You have {unansweredCount} unanswered questions remaining in this paper.</span>
                        </div>
                    )}
                </div>

                {/* Actions */}
                <div style={{
                    padding: '14px 20px', borderTop: '1px solid #E5E7EB',
                    display: 'flex', justifyContent: 'flex-end', gap: '10px', background: '#F9FAFB'
                }}>
                    <button
                        onClick={onClose}
                        style={{
                            padding: '9px 18px', background: '#FFFFFF', border: '1.5px solid #1E1E1E',
                            color: '#111827', borderRadius: '6px', fontWeight: 700, fontSize: '13px', cursor: 'pointer'
                        }}
                    >
                        Return to Test
                    </button>
                    <button
                        onClick={onConfirmSubmit}
                        style={{
                            padding: '9px 22px', background: '#DC2626', border: '1.5px solid #DC2626',
                            color: '#FFFFFF', borderRadius: '6px', fontWeight: 900, fontSize: '13px', cursor: 'pointer',
                            display: 'flex', alignItems: 'center', gap: '6px',
                            boxShadow: '0 2px 6px rgba(220, 38, 38, 0.3)'
                        }}
                    >
                        <CheckCircle size={15} />
                        Confirm & Submit Test
                    </button>
                </div>
            </div>
        </div>
    );
}

// ─── 4. REPORT DISCREPANCY MODAL ──────────────────────────────
interface ReportModalProps {
    isOpen: boolean;
    onClose: () => void;
    questionNumber: number;
    questionId: string;
}

export function ReportDiscrepancyModal({
    isOpen,
    onClose,
    questionNumber,
    questionId
}: ReportModalProps) {
    const [issueType, setIssueType] = useState('translation');
    const [comment, setComment] = useState('');
    const [submitted, setSubmitted] = useState(false);

    if (!isOpen) return null;

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        setSubmitted(true);
        setTimeout(() => {
            setSubmitted(false);
            setComment('');
            onClose();
        }, 1500);
    };

    return (
        <div style={{
            position: 'fixed', inset: 0, zIndex: 100,
            background: 'rgba(0, 0, 0, 0.75)',
            display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '20px'
        }}>
            <div className="cbt-box" style={{
                maxWidth: '480px', width: '100%',
                background: '#FFFFFF', borderRadius: '8px', overflow: 'hidden'
            }}>
                <div style={{
                    padding: '14px 18px', background: '#F8F6F0',
                    borderBottom: '1.5px solid #1E1E1E',
                    display: 'flex', alignItems: 'center', justifyContent: 'space-between'
                }}>
                    <h3 style={{ margin: 0, fontSize: '15px', fontWeight: 800, color: '#111827' }}>
                        Report Discrepancy — Q.{questionNumber}
                    </h3>
                    <button onClick={onClose} style={{ background: 'none', border: 'none', cursor: 'pointer', color: '#6B7280' }}>
                        <X size={18} />
                    </button>
                </div>

                {submitted ? (
                    <div style={{ padding: '32px 20px', textAlign: 'center' }}>
                        <CheckCircle size={32} color="#16A34A" style={{ margin: '0 auto 8px' }} />
                        <div style={{ fontWeight: 800, fontSize: '15px', color: '#166534' }}>Report Logged</div>
                        <div style={{ fontSize: '12.5px', color: '#6B7280', marginTop: '4px' }}>
                            Thank you for helping us maintain official question fidelity!
                        </div>
                    </div>
                ) : (
                    <form onSubmit={handleSubmit} style={{ padding: '18px' }}>
                        <div style={{ marginBottom: '12px' }}>
                            <label style={{ fontSize: '12px', fontWeight: 700, color: '#374151', display: 'block', marginBottom: '6px' }}>
                                Issue Category:
                            </label>
                            <select
                                value={issueType}
                                onChange={(e) => setIssueType(e.target.value)}
                                style={{ width: '100%', padding: '8px 10px', borderRadius: '4px', border: '1px solid #D1D5DB', fontSize: '13px' }}
                            >
                                <option value="translation">Translation / Language mismatch</option>
                                <option value="typo">Spelling or formatting typo</option>
                                <option value="diagram">Image or diagram unclear</option>
                                <option value="answer">Disputed answer key</option>
                            </select>
                        </div>

                        <div style={{ marginBottom: '16px' }}>
                            <label style={{ fontSize: '12px', fontWeight: 700, color: '#374151', display: 'block', marginBottom: '6px' }}>
                                Observations (Optional):
                            </label>
                            <textarea
                                rows={3}
                                value={comment}
                                onChange={(e) => setComment(e.target.value)}
                                placeholder="Describe the discrepancy..."
                                style={{ width: '100%', padding: '8px 10px', borderRadius: '4px', border: '1px solid #D1D5DB', fontSize: '13px', resize: 'vertical' }}
                            />
                        </div>

                        <div style={{ display: 'flex', justifyContent: 'flex-end', gap: '8px' }}>
                            <button
                                type="button"
                                onClick={onClose}
                                style={{ padding: '7px 14px', background: '#FFFFFF', border: '1px solid #D1D5DB', borderRadius: '4px', fontWeight: 600, fontSize: '12px', cursor: 'pointer' }}
                            >
                                Cancel
                            </button>
                            <button
                                type="submit"
                                style={{ padding: '7px 16px', background: '#111827', color: '#FFFFFF', border: 'none', borderRadius: '4px', fontWeight: 800, fontSize: '12px', cursor: 'pointer' }}
                            >
                                Submit Report
                            </button>
                        </div>
                    </form>
                )}
            </div>
        </div>
    );
}
