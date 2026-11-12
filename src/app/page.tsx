'use client';
import { useState, useEffect } from 'react';
import Link from 'next/link';
import { ArrowRight } from 'lucide-react';
import { supabase } from '@/lib/supabase';
import { getMarkingScheme, formatMarks } from '@/lib/marking';
import './home.css';

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

export default function HomePage() {
  const [stats, setStats] = useState<Record<string, Stat>>({});
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

  const primaryCta = (
    <Link href="/exams/upsc-cse?paper=1&count=100" className="hp-btn hp-btn-primary">
      Set up a GS Paper 1 mock <ArrowRight size={17} />
    </Link>
  );
  const secondaryCta = <Link href="/exams" className="hp-btn hp-btn-secondary">Browse all exams</Link>;

  return (
    <div className="hp">
      {/* ── Hero ── */}
      <section className="hp-hero">
        <div className="hp-wrap">
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

