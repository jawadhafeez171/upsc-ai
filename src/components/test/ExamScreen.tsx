'use client';
import { useEffect, useId, useRef, useState, type ReactNode } from 'react';
import { BookOpen, Flag, X, ZoomIn, Grid3X3, FileText, HelpCircle, Volume2, VolumeX, Star, SkipForward, Info } from 'lucide-react';
import QuestionFormatter, { OptionFormatter } from '@/components/ui/QuestionFormatter';
import PassageCard from '@/components/ui/PassageCard';
import { isValidImageUrl } from '@/lib/imageUtils';

export type QuestionState = 'not_visited' | 'unanswered' | 'answered' | 'marked' | 'ans_and_marked';
export type ExamLang = 'en' | 'hi' | 'kn';
const LANG_NAME: Record<ExamLang, string> = { en: 'English', hi: 'हिन्दी', kn: 'ಕನ್ನಡ' };
const LANG_NAME_EN: Record<ExamLang, string> = { en: 'English', hi: 'Hindi', kn: 'Kannada' };

/* ── Dialog primitive: role=dialog, focus in, focus trapped, Escape closes, focus restored ── */
export function Dialog({ open, onClose, labelId, initialFocus, children, sheet = false, dismissable = true }: {
    open: boolean; onClose: () => void; labelId: string; initialFocus?: React.RefObject<HTMLElement | null>;
    children: ReactNode; sheet?: boolean; dismissable?: boolean;
}) {
    const panel = useRef<HTMLDivElement>(null);
    // Keep the latest handlers in refs so the focus effect runs only when the dialog opens/closes,
    // not on every parent re-render (the exam timer re-renders the page every second).
    const onCloseRef = useRef(onClose);
    const focusRef = useRef(initialFocus);
    useEffect(() => { onCloseRef.current = onClose; focusRef.current = initialFocus; });
    useEffect(() => {
        if (!open) return;
        const previouslyFocused = document.activeElement as HTMLElement | null;
        const focusFirst = () => {
            const target = focusRef.current?.current || panel.current?.querySelector<HTMLElement>('button, [href], input, select, textarea');
            target?.focus();
        };
        const t = setTimeout(focusFirst, 0);
        const onKey = (e: KeyboardEvent) => {
            if (e.key === 'Escape' && dismissable) { e.stopPropagation(); onCloseRef.current(); return; }
            if (e.key !== 'Tab' || !panel.current) return;
            const items = [...panel.current.querySelectorAll<HTMLElement>('button:not([disabled]), [href], input:not([disabled]), select, textarea, [tabindex]:not([tabindex="-1"])')];
            if (!items.length) return;
            const first = items[0], last = items[items.length - 1];
            if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
            else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
        };
        document.addEventListener('keydown', onKey, true);
        return () => { clearTimeout(t); document.removeEventListener('keydown', onKey, true); previouslyFocused?.focus?.(); };
    }, [open, dismissable]);
    if (!open) return null;
    return (
        <div className={`es-scrim${sheet ? ' es-sheet-scrim' : ''}`} onMouseDown={(e) => { if (dismissable && e.target === e.currentTarget) onClose(); }}>
            <div ref={panel} className={sheet ? 'es-sheet' : 'es-dialog'} role="dialog" aria-modal="true" aria-labelledby={labelId}>
                {children}
            </div>
        </div>
    );
}

export function PaletteCell({ n, state, current, onClick, label }: { n: number; state: QuestionState; current?: boolean; onClick?: () => void; label?: string }) {
    const stateLabel = { not_visited: 'not visited', unanswered: 'not answered', answered: 'answered', marked: 'marked for review', ans_and_marked: 'answered and marked for review' }[state];
    if (!onClick) return <span className="es-cell" data-s={state} aria-hidden="true">{n}</span>;
    return (
        <button type="button" className="es-cell" data-s={state} aria-current={current ? 'true' : undefined}
            aria-label={label || `Question ${n}, ${stateLabel}${current ? ', current' : ''}`} onClick={onClick}>
            {n}
        </button>
    );
}

/* ── Header ── */
export function ExamTopBar({ examTitle, paperTitle, timeLeft, lang, langs, onLang, practice, onPractice, onLeave, onOpenPalette, currentIdx, total }: {
    examTitle: string; paperTitle: string; timeLeft: number; lang: ExamLang; langs: ExamLang[]; onLang: (l: ExamLang) => void;
    practice: boolean; onPractice: () => void; onLeave: () => void; onOpenPalette: () => void; currentIdx: number; total: number;
}) {
    const h = Math.floor(timeLeft / 3600), m = Math.floor((timeLeft % 3600) / 60), s = timeLeft % 60;
    const clock = h > 0 ? `${h}:${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}` : `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
    const level = timeLeft <= 300 ? 'urgent' : timeLeft <= 900 ? 'warn' : undefined;
    return (
        <header className="es-header">
            <button type="button" className="es-logo" onClick={onLeave} aria-label="UPSC AI — leave this test">
                <span className="es-logo-mark"><BookOpen size={16} aria-hidden="true" /></span>
                <span className="es-logo-text">UPSC AI</span>
            </button>
            <div className="es-title">
                <strong>{examTitle}</strong>
                <span>{paperTitle}</span>
            </div>
            <div className="es-header-right">
                <span className="es-chip es-only-mobile">Q {currentIdx + 1}/{total}</span>
                {langs.length > 1 && (
                    <div className="es-seg" role="group" aria-label="Question language">
                        {langs.map((l) => (
                            <button key={l} type="button" lang={l} aria-pressed={lang === l} onClick={() => onLang(l)}>{LANG_NAME[l]}</button>
                        ))}
                    </div>
                )}
                <button type="button" className="es-switch es-only-desktop" role="switch" aria-checked={practice} onClick={onPractice}>
                    <span className="es-switch-track" aria-hidden="true" /> Practice tools
                </button>
                <div className="es-timer" data-level={level} role="timer" aria-label={`Time left ${clock}`}>
                    <small>Time left</small>
                    <b>{clock}</b>
                </div>
                <button type="button" className="es-icon-btn es-only-mobile" onClick={onOpenPalette} aria-label="Open question palette">
                    <Grid3X3 size={20} aria-hidden="true" />
                </button>
            </div>
        </header>
    );
}

/* ── Question ── */
type Opt = { id: string; text: string; text_hi?: string; text_kn?: string };
export type ExamQuestion = {
    id: string; text: string; text_hi?: string; text_kn?: string; options: Opt[];
    passage?: string; passage_hi?: string; passage_kn?: string; group_label?: string;
    image_url?: string; subject?: string; subject_kannada?: string;
};

function parseStatements(raw: string) {
    const re = /(?:^|\n)\s*(?:\[?(\d+)\]?|\(?(\d+)\))\s*[.)]\s*([^\n]+)/g;
    const m = [...raw.matchAll(re)];
    if (m.length < 2) return null;
    const first = raw.indexOf(m[0][0]);
    const lastEnd = (m[m.length - 1].index || 0) + m[m.length - 1][0].length;
    return { pre: raw.slice(0, first).trim(), items: m.map((x) => ({ n: x[1] || x[2], t: x[3].trim() })), post: raw.slice(lastEnd).trim() };
}

export function QuestionPanel({
    question, number, total, lang, fontPct, onZoom, positive, negative, selected, eliminated, onSelect, onEliminate,
    practice, bookmarked, onBookmark, confidence, onConfidence, onReport, onPreviewImage, children,
}: {
    question: ExamQuestion; number: number; total: number; lang: ExamLang; fontPct: number; onZoom: (d: -1 | 0 | 1) => void;
    positive: number; negative: number; selected?: string; eliminated: Record<string, boolean>;
    onSelect: (id: string) => void; onEliminate: (id: string) => void; practice: boolean;
    bookmarked: boolean; onBookmark: () => void; confidence: 'low' | 'med' | 'high' | null; onConfidence: (c: 'low' | 'med' | 'high') => void;
    onReport: () => void; onPreviewImage: (url: string) => void; children?: ReactNode;
}) {
    const groupName = useId();
    const [speaking, setSpeaking] = useState(false);
    const alt = lang === 'hi' ? question.text_hi : lang === 'kn' ? question.text_kn : undefined;
    const missingTranslation = lang !== 'en' && !alt;
    // In Hindi/Kannada mode the chosen language leads and English follows, as on bilingual papers.
    const primary = alt || question.text;
    const secondary = alt ? question.text : undefined;
    const pPrimary = parseStatements(primary);
    const pSecondary = secondary ? parseStatements(secondary) : null;
    const optText = (o: Opt) => (lang === 'hi' ? o.text_hi : lang === 'kn' ? o.text_kn : undefined);

    useEffect(() => () => { if (typeof window !== 'undefined' && 'speechSynthesis' in window) window.speechSynthesis.cancel(); }, [question.id]);
    const toggleSpeech = () => {
        if (typeof window === 'undefined' || !('speechSynthesis' in window)) return;
        if (speaking) { window.speechSynthesis.cancel(); setSpeaking(false); return; }
        const u = new SpeechSynthesisUtterance(`${question.text}. ${question.options.map((o) => `Option ${o.id}: ${o.text}`).join('. ')}`);
        u.rate = 0.95; u.onend = () => setSpeaking(false);
        window.speechSynthesis.speak(u); setSpeaking(true);
    };

    return (
        <section className="es-panel es-question" aria-labelledby="es-qno">
            <div className="es-qhead">
                <div id="es-qno" className="es-qno">Question {number} <span>of {total}</span></div>
                <div className="es-qmeta">
                    <span className="es-marks">Marks <b>+{positive}</b> · Wrong <i>−{negative}</i></span>
                    {practice && question.subject && <span className="es-chip">{lang === 'kn' && question.subject_kannada ? question.subject_kannada : question.subject}</span>}
                    <div className="es-zoom es-only-desktop" role="group" aria-label={`Text size ${fontPct}%`}>
                        <button type="button" onClick={() => onZoom(-1)} aria-label="Smaller text">A−</button>
                        <button type="button" onClick={() => onZoom(0)} aria-label="Reset text size">{fontPct}%</button>
                        <button type="button" onClick={() => onZoom(1)} aria-label="Larger text">A+</button>
                    </div>
                    <button type="button" className="es-text-btn es-only-desktop" onClick={onReport}><Flag size={15} aria-hidden="true" /> Report an issue</button>
                </div>
            </div>

            <div className="es-qbody" style={{ fontSize: `${fontPct}%` }}>
                <div className="es-reading">
                    {missingTranslation && (
                        <p className="es-lang-note" role="note">
                            <Info size={17} aria-hidden="true" style={{ flexShrink: 0, marginTop: 2 }} />
                            <span>A {LANG_NAME_EN[lang]} version isn’t available for this question, so it’s shown in English.</span>
                        </p>
                    )}

                    {(question.passage || question.passage_hi || question.passage_kn) && (
                        <div style={{ marginBottom: 16 }}>
                            <PassageCard passage={question.passage} passage_hi={question.passage_hi} passage_kn={question.passage_kn} group_label={question.group_label} activeLang={lang} compact />
                        </div>
                    )}

                    {pPrimary ? (
                        <div lang={alt ? lang : 'en'}>
                            {pPrimary.pre && <div className="es-stem"><QuestionFormatter text={pPrimary.pre} /></div>}
                            <ol className="es-statements">
                                {pPrimary.items.map((st, i) => (
                                    <li key={i} className="es-statement">
                                        <span className="es-statement-num" aria-hidden="true">{st.n}</span>
                                        <div>
                                            <span className="cbt-sr-only">Statement {st.n}: </span>
                                            <QuestionFormatter text={st.t} />
                                            {pSecondary?.items[i] && <small lang="en"><QuestionFormatter text={pSecondary.items[i].t} /></small>}
                                        </div>
                                    </li>
                                ))}
                            </ol>
                            {pPrimary.post && <div className="es-prompt"><QuestionFormatter text={pPrimary.post} /></div>}
                            {pSecondary?.post && <div className="es-stem-alt" lang="en"><QuestionFormatter text={pSecondary.post} /></div>}
                        </div>
                    ) : (
                        <div>
                            <div className="es-stem" lang={alt ? lang : 'en'}><QuestionFormatter text={primary} /></div>
                            {secondary && <div className="es-stem-alt" lang="en"><QuestionFormatter text={secondary} /></div>}
                        </div>
                    )}

                    {isValidImageUrl(question.image_url) && (
                        <button type="button" className="es-figure" onClick={() => onPreviewImage(question.image_url!)}>
                            {/* eslint-disable-next-line @next/next/no-img-element */}
                            <img src={question.image_url} alt={`Diagram for question ${number}`} />
                            <span><ZoomIn size={13} aria-hidden="true" style={{ verticalAlign: '-2px' }} /> Enlarge diagram</span>
                        </button>
                    )}

                    <fieldset className="es-options">
                        <legend>Choose one answer <span className="es-only-desktop" style={{ display: 'inline' }}>· keys <kbd>A</kbd>–<kbd>D</kbd></span></legend>
                        <div className="es-opt-list">
                            {question.options.map((o, oi) => {
                                const letter = 'ABCDEFGH'[oi] ?? o.id.toUpperCase();
                                const isSel = selected === o.id;
                                const isElim = !!eliminated[o.id];
                                const sec = optText(o);
                                return (
                                    <div key={o.id} className="es-opt-row">
                                        <label className="es-opt" data-selected={isSel ? '' : undefined} data-eliminated={isElim ? '' : undefined}>
                                            <input type="radio" name={groupName} value={o.id} checked={isSel} onChange={() => onSelect(o.id)} />
                                            <span className="es-opt-key" aria-hidden="true">{letter}</span>
                                            <span className="es-opt-text">
                                                <span className="cbt-sr-only">Option {letter}: </span>
                                                {sec ? <><span lang={lang}><OptionFormatter text={sec} /></span><small lang="en"><OptionFormatter text={o.text} /></small></> : <OptionFormatter text={o.text} />}
                                                {isElim && <span className="cbt-sr-only"> (crossed out)</span>}
                                            </span>
                                        </label>
                                        {practice && (
                                            <button type="button" className="es-elim" aria-pressed={isElim} onClick={() => onEliminate(o.id)}
                                                aria-label={`${isElim ? 'Restore' : 'Cross out'} option ${letter}`} title={isElim ? 'Restore option' : 'Cross out option'}>
                                                <X size={18} aria-hidden="true" />
                                            </button>
                                        )}
                                    </div>
                                );
                            })}
                        </div>
                    </fieldset>

                    {practice && (
                        <div className="es-practice-row">
                            <span>Practice tools:</span>
                            <button type="button" className="es-text-btn" aria-pressed={bookmarked} onClick={onBookmark}>
                                <Star size={15} aria-hidden="true" fill={bookmarked ? 'currentColor' : 'none'} /> {bookmarked ? 'Bookmarked' : 'Bookmark'}
                            </button>
                            <button type="button" className="es-text-btn" aria-pressed={speaking} onClick={toggleSpeech}>
                                {speaking ? <VolumeX size={15} aria-hidden="true" /> : <Volume2 size={15} aria-hidden="true" />} {speaking ? 'Stop reading' : 'Read aloud'}
                            </button>
                            <span>Confidence</span>
                            <div className="es-seg" role="group" aria-label="Confidence in your answer">
                                {(['low', 'med', 'high'] as const).map((c) => (
                                    <button key={c} type="button" aria-pressed={confidence === c} onClick={() => onConfidence(c)}>{c === 'med' ? 'Medium' : c[0].toUpperCase() + c.slice(1)}</button>
                                ))}
                            </div>
                        </div>
                    )}
                </div>
            </div>
            {children}
        </section>
    );
}

/* ── Action bar (sticky on desktop, fixed on mobile) ── */
export function ActionBar({ canPrev, hasAnswer, marked, isLast, onPrev, onClear, onMark, onNext }: {
    canPrev: boolean; hasAnswer: boolean; marked: boolean; isLast: boolean;
    onPrev: () => void; onClear: () => void; onMark: () => void; onNext: () => void;
}) {
    return (
        <div className="es-actions" role="group" aria-label="Question actions">
            <button type="button" className="es-btn" onClick={onPrev} disabled={!canPrev}>
                <span className="es-btn-label-long">Previous</span><span className="es-btn-label-short">Back</span> <kbd>P</kbd>
            </button>
            <button type="button" className="es-btn" onClick={onClear} disabled={!hasAnswer} aria-keyshortcuts="Backspace Delete">
                <span className="es-btn-label-long">Clear response</span><span className="es-btn-label-short">Clear</span> <kbd>⌫</kbd>
            </button>
            <span className="es-actions-spacer" />
            <button type="button" className="es-btn es-btn-review" onClick={onMark} aria-pressed={marked} aria-keyshortcuts="M">
                <span className="es-btn-label-long">{marked ? 'Unmark review & next' : 'Mark for review & next'}</span><span className="es-btn-label-short">{marked ? 'Unmark' : 'Review'}</span> <kbd>M</kbd>
            </button>
            <button type="button" className="es-btn es-btn-primary" onClick={onNext} aria-keyshortcuts="N">
                <span className="es-btn-label-long">{isLast ? 'Save & finish' : 'Save & next'}</span><span className="es-btn-label-short">{isLast ? 'Finish' : 'Next'}</span> <kbd>N</kbd>
            </button>
        </div>
    );
}

/* ── Palette ── */
type Filter = 'all' | 'answered' | 'unanswered' | 'marked';
export function PalettePanel({ states, currentIdx, onJump, counts, candidate }: {
    states: QuestionState[]; currentIdx: number; onJump: (i: number) => void;
    counts: Record<QuestionState, number>; candidate: string;
}) {
    const [filter, setFilter] = useState<Filter>('all');
    const show = (s: QuestionState) => filter === 'all' || (filter === 'answered' && (s === 'answered' || s === 'ans_and_marked'))
        || (filter === 'unanswered' && (s === 'unanswered' || s === 'not_visited')) || (filter === 'marked' && (s === 'marked' || s === 'ans_and_marked'));
    const legend: [QuestionState, string][] = [['answered', 'Answered'], ['unanswered', 'Not answered'], ['not_visited', 'Not visited'], ['marked', 'Marked for review'], ['ans_and_marked', 'Answered & marked (will be evaluated)']];
    return (
        <div className="es-palette">
            <p className="es-candidate">Candidate: <b>{candidate}</b></p>
            <ul className="es-legend" aria-label="Question status">
                {legend.map(([s, label]) => (
                    <li key={s}><PaletteCell n={counts[s]} state={s} /> <span>{label}</span></li>
                ))}
            </ul>
            <div className="es-filters" role="group" aria-label="Show questions">
                {([['all', 'All'], ['answered', 'Answered'], ['unanswered', 'Not answered'], ['marked', 'Marked']] as [Filter, string][]).map(([f, label]) => (
                    <button key={f} type="button" aria-pressed={filter === f} onClick={() => setFilter(f)}>{label}</button>
                ))}
            </div>
            <div className="es-grid" role="group" aria-label="Go to question">
                {states.map((s, i) => show(s) && (
                    <PaletteCell key={i} n={i + 1} state={s} current={i === currentIdx} onClick={() => onJump(i)} />
                ))}
            </div>
        </div>
    );
}

export function PaletteActions({ onNextUnanswered, onPaper, onInstructions, onSubmit }: { onNextUnanswered: () => void; onPaper: () => void; onInstructions: () => void; onSubmit: () => void }) {
    return (
        <div className="es-side-actions">
            <button type="button" className="es-btn" onClick={onNextUnanswered}><SkipForward size={16} aria-hidden="true" /> Next unanswered</button>
            <button type="button" className="es-btn" onClick={onPaper}><FileText size={16} aria-hidden="true" /> Question paper</button>
            <button type="button" className="es-btn" onClick={onInstructions}><HelpCircle size={16} aria-hidden="true" /> Instructions</button>
            <button type="button" className="es-btn es-btn-submit" onClick={onSubmit}>Submit test</button>
        </div>
    );
}

/* ── Submit / leave / time ── */
export function SubmitDialog({ open, onClose, onConfirm, counts, total, timeLeft }: {
    open: boolean; onClose: () => void; onConfirm: () => void; counts: Record<QuestionState, number>; total: number; timeLeft: number;
}) {
    const back = useRef<HTMLButtonElement>(null);
    const mins = Math.floor(timeLeft / 60), secs = timeLeft % 60;
    const rows: [QuestionState, string, string?][] = [
        ['answered', 'Answered'], ['ans_and_marked', 'Answered & marked for review', 'Will be evaluated'],
        ['marked', 'Marked for review, not answered'], ['unanswered', 'Not answered'], ['not_visited', 'Not visited'],
    ];
    const unattempted = counts.marked + counts.unanswered + counts.not_visited;
    return (
        <Dialog open={open} onClose={onClose} labelId="es-submit-h" initialFocus={back}>
            <div className="es-dialog-head">
                <h2 id="es-submit-h">Submit this test?</h2>
                <p>{mins}m {secs}s left. After you submit you can’t change any answer.</p>
            </div>
            <div className="es-dialog-body">
                <table className="es-summary">
                    <tbody>
                        {rows.map(([s, label, note]) => (
                            <tr key={s}>
                                <th scope="row"><PaletteCell n={counts[s]} state={s} /><span>{label}{note && <small>{note}</small>}</span></th>
                                <td>{counts[s]}</td>
                            </tr>
                        ))}
                    </tbody>
                    <tfoot><tr><th scope="row">Total</th><td>{total}</td></tr></tfoot>
                </table>
                {unattempted > 0 && <p className="es-note">{unattempted} {unattempted === 1 ? 'question has' : 'questions have'} no answer and will score zero.</p>}
            </div>
            <div className="es-dialog-foot">
                <button ref={back} type="button" className="es-btn" onClick={onClose}>Return to test</button>
                <button type="button" className="es-btn es-btn-danger" onClick={onConfirm}>Submit test</button>
            </div>
        </Dialog>
    );
}

export function LeaveDialog({ open, onClose, onLeave }: { open: boolean; onClose: () => void; onLeave: () => void }) {
    const stay = useRef<HTMLButtonElement>(null);
    return (
        <Dialog open={open} onClose={onClose} labelId="es-leave-h" initialFocus={stay}>
            <div className="es-dialog-head">
                <h2 id="es-leave-h">Leave this test?</h2>
                <p>Your answers won’t be saved and the attempt won’t be scored. To keep your result, submit the test instead.</p>
            </div>
            <div className="es-dialog-foot">
                <button ref={stay} type="button" className="es-btn es-btn-primary" onClick={onClose}>Stay in test</button>
                <button type="button" className="es-btn" onClick={onLeave}>Leave without saving</button>
            </div>
        </Dialog>
    );
}

export function TimeUpDialog({ open }: { open: boolean }) {
    return (
        <Dialog open={open} onClose={() => {}} labelId="es-timeup-h" dismissable={false}>
            <div className="es-timeup" role="alert">
                <h2 id="es-timeup-h">Time’s up</h2>
                <p>Submitting your answers…</p>
            </div>
        </Dialog>
    );
}

export function TimeToast({ message, onDismiss }: { message: string | null; onDismiss: () => void }) {
    return (
        <div aria-live="assertive" aria-atomic="true">
            {message && (
                <div className="es-toast" role="status">
                    <span>{message}</span>
                    <button type="button" onClick={onDismiss}>OK</button>
                </div>
            )}
        </div>
    );
}

/* ── Mobile palette sheet ── */
export function PaletteSheet({ open, onClose, children, footer }: { open: boolean; onClose: () => void; children: ReactNode; footer: ReactNode }) {
    const closeBtn = useRef<HTMLButtonElement>(null);
    return (
        <Dialog open={open} onClose={onClose} labelId="es-sheet-h" sheet initialFocus={closeBtn}>
            <div className="es-sheet-head">
                <h2 id="es-sheet-h">Questions</h2>
                <button ref={closeBtn} type="button" className="es-icon-btn" onClick={onClose} aria-label="Close question palette"><X size={20} aria-hidden="true" /></button>
            </div>
            <div className="es-sheet-body">{children}</div>
            <div className="es-sheet-foot">{footer}</div>
        </Dialog>
    );
}
