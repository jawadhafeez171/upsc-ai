'use client';
import { useState, useEffect } from 'react';
import Link from 'next/link';
import { ArrowRight, CheckCircle2, XCircle, RotateCcw, Clock } from 'lucide-react';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { getMarkingScheme, formatMarks } from '@/lib/marking';
import type { Language } from '@/types';
import './home.css';

type DemoLang = 'en' | 'hi' | 'kn';

/* A practice question written in the UPSC "consider the following statements" format. */
const DEMO = {
  text: {
    en: "With reference to the Constitution of India, consider the following statements:\n1. The Preamble is a part of the Constitution and can be amended under Article 368 without altering the 'Basic Structure'.\n2. The Preamble is non-justiciable; its provisions are not enforceable in any court of law.\n\nWhich of the statements given above is/are correct?",
    hi: "भारत के संविधान के संदर्भ में, निम्नलिखित कथनों पर विचार कीजिए:\n1. प्रस्तावना संविधान का एक भाग है और 'मूल संरचना' को बदले बिना अनुच्छेद 368 के तहत इसमें संशोधन किया जा सकता है।\n2. प्रस्तावना गैर-न्यायसंगत है; इसके प्रावधान कानून की किसी भी अदालत में लागू करने योग्य नहीं हैं।\n\nउपर्युक्त में से कौन-सा/से कथन सही है/हैं?",
    kn: "ಭಾರತದ ಸಂವಿಧಾನಕ್ಕೆ ಸಂಬಂಧಿಸಿದಂತೆ, ಈ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ:\n1. ಪ್ರಸ್ತಾವನೆಯು ಸಂವಿಧಾನದ ಒಂದು ಭಾಗವಾಗಿದ್ದು, 'ಮೂಲ ಸಂರಚನೆ'ಯನ್ನು ಬದಲಾಯಿಸದೆ 368 ನೇ ವಿಧಿಯ ಅಡಿಯಲ್ಲಿ ತಿದ್ದುಪಡಿ ಮಾಡಬಹುದು.\n2. ಪ್ರಸ್ತಾವನೆಯು ನ್ಯಾಯಯುತವಲ್ಲ; ಇದರ ನಿಬಂಧನೆಗಳನ್ನು ಯಾವುದೇ ನ್ಯಾಯಾಲಯದಲ್ಲಿ ಜಾರಿಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.\n\nಮೇಲಿನ ಹೇಳಿಕೆಗಳಲ್ಲಿ ಯಾವುದು/ಯಾವುವು ಸರಿ?",
  },
  options: [
    { id: 'a', en: '1 only', hi: 'केवल 1', kn: 'ಕೇವಲ 1' },
    { id: 'b', en: '2 only', hi: 'केवल 2', kn: 'ಕೇವಲ 2' },
    { id: 'c', en: 'Both 1 and 2', hi: '1 और 2 दोनों', kn: '1 ಮತ್ತು 2 ಎರಡೂ' },
    { id: 'd', en: 'Neither 1 nor 2', hi: 'न तो 1 और न ही 2', kn: '1 ಅಥವಾ 2 ಎರಡೂ ಅಲ್ಲ' },
  ],
  correct: 'c',
  explanation: {
    en: "Statement 1 is correct: In Kesavananda Bharati (1973) the Supreme Court held that the Preamble is part of the Constitution and can be amended under Article 368, provided the 'Basic Structure' is not altered. It has been amended once, by the 42nd Amendment Act (1976).\nStatement 2 is correct: The Preamble is neither a source of power to the legislature nor a limit on it. It is non-justiciable — its provisions cannot be enforced directly in a court of law.",
    hi: "कथन 1 सही है: केशवानंद भारती मामले (1973) में सर्वोच्च न्यायालय ने माना कि प्रस्तावना संविधान का अंग है और अनुच्छेद 368 के तहत इसमें संशोधन किया जा सकता है, बशर्ते 'मूल संरचना' में बदलाव न हो। 42वें संविधान संशोधन अधिनियम (1976) द्वारा इसे एक बार संशोधित किया गया।\nकथन 2 सही है: प्रस्तावना न तो विधायिका की शक्ति का स्रोत है और न ही उस पर प्रतिबंध। यह गैर-न्यायसंगत है — इसके प्रावधान अदालतों में सीधे लागू नहीं किए जा सकते।",
    kn: "ಹೇಳಿಕೆ 1 ಸರಿ: ಕೇಶವಾನಂದ ಭಾರತೀ ಪ್ರಕರಣದಲ್ಲಿ (1973) ಸುಪ್ರೀಂ ಕೋರ್ಟ್, ಪ್ರಸ್ತಾವನೆಯು ಸಂವಿಧಾನದ ಭಾಗವಾಗಿದ್ದು 'ಮೂಲ ಸಂರಚನೆ'ಗೆ ಧಕ್ಕೆಯಾಗದಂತೆ 368 ನೇ ವಿಧಿಯ ಅಡಿಯಲ್ಲಿ ತಿದ್ದುಪಡಿ ಮಾಡಬಹುದು ಎಂದು ತೀರ್ಪು ನೀಡಿತು.\nಹೇಳಿಕೆ 2 ಸರಿ: ಪ್ರಸ್ತಾವನೆಯು ನ್ಯಾಯಯುತವಲ್ಲ — ಇದರ ನಿಬಂಧನೆಗಳನ್ನು ನ್ಯಾಯಾಲಯದಲ್ಲಿ ನೇರವಾಗಿ ಜಾರಿಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.",
  },
  source: 'Source: M. Laxmikanth, Indian Polity, chapter “Preamble of the Constitution”.',
};

const UI = {
  en: { paper: 'UPSC CSE · GS Paper 1', practice: 'practice question', q: 'Question', correct: 'Correct answer', yours: 'Your answer', right: 'Correct', wrong: 'Incorrect', again: 'Try again' },
  hi: { paper: 'UPSC CSE · सामान्य अध्ययन प्रश्नपत्र 1', practice: 'अभ्यास प्रश्न', q: 'प्रश्न', correct: 'सही उत्तर', yours: 'आपका उत्तर', right: 'सही', wrong: 'गलत', again: 'फिर से प्रयास करें' },
  kn: { paper: 'UPSC CSE · ಸಾಮಾನ್ಯ ಅಧ್ಯಯನ ಪತ್ರಿಕೆ 1', practice: 'ಅಭ್ಯಾಸ ಪ್ರಶ್ನೆ', q: 'ಪ್ರಶ್ನೆ', correct: 'ಸರಿಯಾದ ಉತ್ತರ', yours: 'ನಿಮ್ಮ ಉತ್ತರ', right: 'ಸರಿ', wrong: 'ತಪ್ಪು', again: 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ' },
} as const;

/* The archive: every exam with its own table. Counts and year ranges are read live. */
const ARCHIVE = [
  { key: 'gs1', name: 'UPSC CSE Prelims — GS Paper 1', note: 'Full mock: 100 questions, 120 minutes', table: 'upsc_questions', paper: undefined as number | undefined, gtYear: true, langs: 'English · Hindi', href: '/exams/upsc-cse?paper=1&count=100' },
  { key: 'csat', name: 'UPSC CSE Prelims — CSAT (Paper 2)', note: 'Qualifying paper: 80 questions', table: 'csat_pyq', paper: undefined, gtYear: true, langs: 'English · Hindi', href: '/exams/upsc-cse?paper=2&count=80' },
  { key: 'capf', name: 'UPSC CAPF (Assistant Commandant)', note: 'Paper 1: General Ability & Intelligence', table: 'capf_pyq', paper: undefined, gtYear: false, langs: 'English · Hindi', href: '/exams/upsc-capf' },
  { key: 'epfo', name: 'UPSC EPFO (EO/AO & APFC)', note: 'Enforcement Officer and APFC papers', table: 'epfo_pyq', paper: undefined, gtYear: false, langs: 'English · Hindi', href: '/exams/upsc-epfo' },
  { key: 'kas', name: 'KPSC KAS Prelims', note: 'Karnataka Administrative Service', table: 'kas_questions', paper: undefined, gtYear: false, langs: 'English · Kannada', href: '/exams/kpsc-kas' },
  { key: 'kea', name: 'KEA recruitment exams', note: 'FDA, SDA, VAO, technical and coaching entrance papers', table: 'kea_questions', paper: undefined, gtYear: false, langs: 'English · Kannada', href: '/exams/kea' },
  { key: 'psi', name: 'KSP Police Sub-Inspector', note: 'Paper 2: General Studies', table: 'psi_pyq', paper: 2, gtYear: false, langs: 'English · Kannada', href: '/exams/ksp-psi' },
  { key: 'pc', name: 'KSP Police Constable', note: 'Civil and armed police papers', table: 'pc_pyq', paper: undefined, gtYear: false, langs: 'English · Kannada', href: '/exams/ksp-pc' },
];

type Stat = { count: number | null; from: number | null; to: number | null };

async function loadStat(row: typeof ARCHIVE[number]): Promise<Stat> {
  const base = () => {
    let q = supabase.from(row.table).select('year');
    if (row.paper) q = q.eq('paper', row.paper);
    q = row.gtYear ? q.gt('year', 0) : q.not('year', 'is', null);
    return q;
  };
  const [countRes, minRes, maxRes] = await Promise.all([
    (() => {
      let q = supabase.from(row.table).select('id', { count: 'exact', head: true });
      if (row.paper) q = q.eq('paper', row.paper);
      if (row.gtYear) q = q.gt('year', 0);
      return q;
    })(),
    base().order('year', { ascending: true }).limit(1),
    base().order('year', { ascending: false }).limit(1),
  ]);
  return {
    count: countRes.error ? null : countRes.count ?? null,
    from: (minRes.data?.[0] as { year?: number } | undefined)?.year ?? null,
    to: (maxRes.data?.[0] as { year?: number } | undefined)?.year ?? null,
  };
}

function useCountdown(startSeconds: number) {
  const [left, setLeft] = useState(startSeconds);
  useEffect(() => {
    const t = setInterval(() => setLeft((s) => (s > 0 ? s - 1 : 0)), 1000);
    return () => clearInterval(t);
  }, []);
  const h = Math.floor(left / 3600), m = Math.floor((left % 3600) / 60), s = left % 60;
  return `${h}:${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
}

function Explanation({ text }: { text: string }) {
  return (
    <div className="hp-explain">
      {text.split('\n').map((line, i) => {
        const t = line.trim();
        if (!t) return null;
        const idx = t.indexOf(':');
        if (idx > 0 && idx < 40) {
          return <p key={i}><strong>{t.slice(0, idx + 1)}</strong>{t.slice(idx + 1)}</p>;
        }
        return <p key={i}>{t}</p>;
      })}
    </div>
  );
}

export default function HomePage() {
  const { language, setLanguage } = useAppStore();
  const lang: DemoLang = language === 'hi' || language === 'kn' ? language : 'en';
  const ui = UI[lang];
  const [picked, setPicked] = useState<string | null>(null);
  const [stats, setStats] = useState<Record<string, Stat>>({});
  const timer = useCountdown(120 * 60);
  const gs = getMarkingScheme('upsc-cse', 1);

  useEffect(() => {
    let alive = true;
    ARCHIVE.forEach((row) => {
      loadStat(row)
        .then((st) => { if (alive) setStats((prev) => ({ ...prev, [row.key]: st })); })
        .catch(() => { if (alive) setStats((prev) => ({ ...prev, [row.key]: { count: null, from: null, to: null } })); });
    });
    return () => { alive = false; };
  }, []);

  const loaded = ARCHIVE.every((r) => stats[r.key]);
  const total = ARCHIVE.reduce((sum, r) => sum + (stats[r.key]?.count ?? 0), 0);
  const isRight = picked === DEMO.correct;
  const correctOpt = DEMO.options.find((o) => o.id === DEMO.correct)!;

  const optState = (id: string) => {
    if (!picked) return undefined;
    if (id === DEMO.correct) return 'correct';
    if (id === picked) return 'wrong';
    return 'dim';
  };

  const primaryCta = (
    <Link href="/exams/upsc-cse?paper=1&count=100" className="hp-btn hp-btn-primary">
      Set up a GS Paper 1 mock <ArrowRight size={17} />
    </Link>
  );
  const secondaryCta = <Link href="/exams" className="hp-btn hp-btn-secondary">Browse all exams</Link>;

  return (
    <div className="hp">
      {/* ── Hero: the promise beside the proof ── */}
      <section className="hp-hero">
        <div className="hp-wrap hp-hero-grid">
          <div className="hp-hero-copy">
            <h1 className="hp-title">Previous‑year papers, practised under <em>exam conditions</em>.</h1>
            <p className="hp-lead">
              {loaded ? <strong>{total.toLocaleString('en-IN')}</strong> : <span className="hp-skel" aria-label="Loading question count" />}{' '}
              previous-year questions from UPSC, KPSC, KEA and KSP — timed, negatively marked and explained, in English, Hindi and Kannada.
            </p>
            <div className="hp-actions">
              {primaryCta}
              {secondaryCta}
            </div>
            <p className="hp-cta-meta">
              100 questions · 120 minutes · +{formatMarks(gs.positive)} for a right answer, −{formatMarks(gs.negative)} for a wrong one
            </p>
            <p className="hp-reassure">Free to use. You sign in when you start a test, so your results and progress are saved.</p>
          </div>

          {/* Live practice question in the exam screen's own chrome */}
          <div className="hp-cbt" aria-label="Try a practice question">
            <div className="hp-cbt-bar">
              <div className="hp-cbt-paper">{ui.paper} <span>· {ui.practice}</span></div>
              <span className="hp-timer" aria-label={`Time left ${timer}`}><Clock size={14} aria-hidden="true" />{timer}</span>
            </div>

            <div className="hp-cbt-body">
              <div className="hp-cbt-head">
                <span className="hp-qno"><b>1</b>{ui.q} 1 / 100</span>
                <div className="hp-seg" role="group" aria-label="Question language">
                  {(['en', 'hi', 'kn'] as const).map((l) => (
                    <button key={l} type="button" aria-pressed={lang === l} onClick={() => setLanguage(l as Language)} lang={l}>
                      {l === 'en' ? 'English' : l === 'hi' ? 'हिन्दी' : 'ಕನ್ನಡ'}
                    </button>
                  ))}
                </div>
              </div>

              <p className="hp-q" lang={lang}>{DEMO.text[lang]}</p>

              <div className="hp-opts" role="group" aria-label="Answer options">
                {DEMO.options.map((o) => {
                  const st = optState(o.id);
                  return (
                    <button
                      key={o.id}
                      type="button"
                      className="hp-opt"
                      data-state={st}
                      disabled={!!picked}
                      aria-pressed={picked === o.id}
                      onClick={() => setPicked(o.id)}
                      lang={lang}
                    >
                      <span className="hp-opt-key">{o.id.toUpperCase()}</span>
                      <span className="hp-opt-text">{o[lang]}</span>
                      {st === 'correct' && <span className="hp-opt-tag"><CheckCircle2 size={15} aria-hidden="true" />{ui.correct}</span>}
                      {st === 'wrong' && <span className="hp-opt-tag"><XCircle size={15} aria-hidden="true" />{ui.yours}</span>}
                    </button>
                  );
                })}
              </div>
            </div>

            {picked && (
              <div className="hp-feedback" aria-live="polite">
                <p className="hp-verdict" style={{ color: isRight ? 'var(--success-text)' : 'var(--danger-text)' }}>
                  {isRight ? <CheckCircle2 size={18} aria-hidden="true" /> : <XCircle size={18} aria-hidden="true" />}
                  <span>
                    {isRight
                      ? `${ui.right} · +${formatMarks(gs.positive)}`
                      : `${ui.wrong} · −${formatMarks(gs.negative)}. ${ui.correct}: (${correctOpt.id}) ${correctOpt[lang]}`}
                  </span>
                </p>
                <Explanation text={DEMO.explanation[lang]} />
                <p className="hp-source">{DEMO.source}</p>
                <button type="button" className="hp-retry" onClick={() => setPicked(null)}>
                  <RotateCcw size={15} aria-hidden="true" /> {ui.again}
                </button>
              </div>
            )}

            <div className="hp-palette">
              <div className="hp-cells" aria-hidden="true">
                {Array.from({ length: 10 }, (_, i) => (
                  <span key={i} className="hp-cell" data-s={i === 0 ? (picked ? 'answered' : 'current') : undefined}>{i + 1}</span>
                ))}
              </div>
              <div className="hp-legend" aria-hidden="true">
                <span><i style={{ background: 'var(--hp-answered)' }} />Answered</span>
                <span><i style={{ background: 'var(--hp-unanswered)' }} />Not answered</span>
                <span><i style={{ background: 'var(--hp-review)' }} />Marked for review</span>
                <span><i style={{ background: 'var(--bg-tertiary)', border: '1px solid var(--border)' }} />Not visited</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <div className="hp-wrap">
        {/* ── The archive, with live numbers ── */}
        <section className="hp-section" aria-labelledby="hp-archive-h">
          <h2 id="hp-archive-h" className="hp-h2">The question archive</h2>
          <p className="hp-sub">Counts and years come straight from the question bank. Pick an exam to set up a mock or drill one subject.</p>
          <ul className="hp-archive">
            <li aria-hidden="true">
              <div className="hp-row hp-row-head">
                <span>Exam</span><span>Years</span><span>Questions</span><span>Languages</span><span />
              </div>
            </li>
            {ARCHIVE.map((row) => {
              const st = stats[row.key];
              const years = st?.from && st?.to ? (st.from === st.to ? `${st.from}` : `${st.from}–${st.to}`) : null;
              return (
                <li key={row.key}>
                  <Link href={row.href} className="hp-row">
                    <span className="hp-exam">{row.name}<small>{row.note}</small></span>
                    <span className="hp-meta">
                    <span className="hp-cellv hp-c-years">{st ? (years ?? '—') : <span className="hp-skel" />}</span>
                    <span className="hp-cellv hp-c-count">
                      {st ? (st.count !== null ? <><strong>{st.count.toLocaleString('en-IN')}</strong> questions</> : '—') : <span className="hp-skel" />}
                    </span>
                    <span className="hp-cellv hp-c-lang">{row.langs}</span>
                    </span>
                    <span className="hp-go hp-c-go">Practise <ArrowRight size={15} aria-hidden="true" /></span>
                  </Link>
                </li>
              );
            })}
          </ul>
        </section>

        {/* ── What the exam screen does ── */}
        <section className="hp-section" aria-labelledby="hp-features-h">
          <h2 id="hp-features-h" className="hp-h2">What you get on the exam screen</h2>
          <p className="hp-sub">Built for long practice sessions: dense statements, two scripts, and a clock you can’t ignore.</p>
          <ul className="hp-features">
            <li className="hp-feature">
              <h3>The full exam screen</h3>
              <p>A question palette, mark for review, a running timer and each exam’s own marking — +{formatMarks(gs.positive)} / −{formatMarks(gs.negative)} for UPSC GS Paper 1.</p>
              <div className="hp-mini" aria-hidden="true">
                {['answered', 'answered', undefined, 'current', undefined].map((s, i) => (
                  <span key={i} className="hp-cell" data-s={s}>{i + 1}</span>
                ))}
              </div>
            </li>
            <li className="hp-feature">
              <h3>Switch language mid-question</h3>
              <p>Read any question in English, then flip it to Hindi for UPSC papers or Kannada for Karnataka papers — options and explanation included.</p>
            </li>
            <li className="hp-feature">
              <h3>See exactly where marks went</h3>
              <p>Your answer against the key for every question, accuracy by subject, and one click to retry only the ones you got wrong.</p>
            </li>
          </ul>
        </section>

        {/* ── Close ── */}
        <section className="hp-close" aria-labelledby="hp-close-h">
          <div>
            <h2 id="hp-close-h" className="hp-h2">Sit a full GS Paper 1 today</h2>
            <p>100 questions, 120 minutes, scored the way UPSC scores it.</p>
          </div>
          <div className="hp-actions">
            {primaryCta}
            {secondaryCta}
          </div>
        </section>
      </div>
    </div>
  );
}

