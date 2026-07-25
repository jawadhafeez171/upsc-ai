'use client';
import { useState } from 'react';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { ArrowRight, Zap, BarChart2, Globe, RotateCcw, Target, Trophy, Sparkles, CheckCircle2 } from 'lucide-react';
import { EXAMS } from '@/lib/mockData';
import { t } from '@/lib/i18n';
import { Language } from '@/types';
import { useTheme } from '@/components/layout/ThemeProvider';

const FEATURES = [
  { emoji: '🎯', title: 'Subject-Wise Focus', desc: 'Drill into individual chapters across 23 core subjects including Karnataka History, Polity & Economy.', chip: 'chip-peach' },
  { emoji: '🏆', title: 'Live Leaderboards', desc: 'Compete against thousands of state and national civil services aspirants in real-time.', chip: 'chip-sage' },
  { emoji: '🌐', title: 'Bilingual Mastery', desc: 'Study in English & Kannada with instant side-by-side translation and native font rendering.', chip: 'chip-sky' },
  { emoji: '📊', title: 'Deep Telemetry', desc: 'Receive granular accuracy ratings and per-question speed analytics after every session.', chip: 'chip-lavender' },
  { emoji: '🔄', title: 'AI Weak Area Retest', desc: 'Auto-assemble custom 10-question drill sets targeting past incorrect responses in 1-click.', chip: 'chip-peach' },
  { emoji: '⚡', title: 'Instant AI Explanations', desc: 'Detailed, step-by-step rationale for every option right after selecting your answer.', chip: 'chip-sage' },
];

const QUICK_LAUNCHES = [
  {
    title: 'KPSC KAS 2024 Prelims',
    desc: 'Paper 1 & Paper 2 Full 200 Questions',
    badge: '🔥 Latest Paper',
    link: '/exams/kpsc-kas',
    color: '#2563EB'
  },
  {
    title: 'KPSC KAS 2020 Prelims',
    desc: 'Paper 1 & Paper 2 Full 200 Questions',
    badge: '📜 Historical PYQ',
    link: '/exams/kpsc-kas',
    color: '#0D9488'
  },
  {
    title: 'Karnataka GK & Administration',
    desc: 'History, Geography & State Economy Drill',
    badge: '🎯 State Special',
    link: '/exams/kpsc-kas',
    color: '#D97706'
  },
  {
    title: 'Daily 10-Question Challenge',
    desc: 'Mixed GS & Current Affairs Practice',
    badge: '⚡ Quick 5-Min Test',
    link: '/exams/kpsc-kas',
    color: '#8B5CF6'
  }
];

const SAMPLE_QUESTION = {
  text_en: "Which dynasty built the famous Rock-Cut Cave Temples of Badami and the monolithic Kailash Temple at Ellora?",
  text_kn: "ಬಾದಾಮಿಯ ಪ್ರಸಿದ್ಧ ಕಲ್ಲಿನ ಗುಹಾ ದೇವಾಲಯಗಳನ್ನು ಮತ್ತು ಎಲ್ಲೋರಾದ ಏಕಶಿಲೆಯ ಕೈಲಾಸ ದೇವಾಲಯವನ್ನು ನಿರ್ಮಿಸಿದ ರಾಜವಂಶಗಳು ಯಾವುವು?",
  options: [
    { id: 'a', text_en: 'Badami Chalukyas & Rashtrakutas', text_kn: 'ಬಾದಾಮಿ ಚಾಲುಕ್ಯರು ಮತ್ತು ರಾಷ್ಟ್ರಕೂಟರು' },
    { id: 'b', text_en: 'Cholas & Pallavas', text_kn: 'ಚೋಳರು ಮತ್ತು ಪಲ್ಲವರು' },
    { id: 'c', text_en: 'Hoysalas & Kadambas', text_kn: 'ಹೊಯ್ಸಳರು ಮತ್ತು ಕಾದಂಬರ' },
    { id: 'd', text_en: 'Vijayanagara Empire & Bahmanis', text_kn: 'ವಿಜಯನಗರ ಸಾಮ್ರಾಜ್ಯ ಮತ್ತು ಬಹುಮನಿ' }
  ],
  correct: 'a',
  explanation_en: "The Chalukyas of Badami built the magnificent rock-cut cave temples at Badami (6th–8th century CE), while King Krishna I of the Rashtrakuta Dynasty commissioned the monolithic Kailash Temple (Cave 16) at Ellora.",
  explanation_kn: "ಬಾದಾಮಿ ಚಾಲುಕ್ಯರು ಬಾದಾಮಿಯಲ್ಲಿ ಪ್ರಸಿದ್ಧ ಕಲ್ಲಿನ ಗುಹಾ ದೇವಾಲಯಗಳನ್ನು ನಿರ್ಮಿಸಿದರು. ರಾಷ್ಟ್ರಕೂಟ ರಾಜ 1ನೇ ಕೃಷ್ಣನು ಎಲ್ಲೋರಾದಲ್ಲಿ ವಿಶ್ವಪ್ರಸಿದ್ಧ ಏಕಶಿಲೆಯ ಕೈಲಾಸ ದೇವಾಲಯವನ್ನು (ಗುಹೆ 16) ನಿರ್ಮಿಸಿದನು."
};

export default function HomePage() {
  const { user, language } = useAppStore();
  const lang = language as Language;

  // Demo Question State
  const [demoSelected, setDemoSelected] = useState<string | null>(null);
  const [demoLang, setDemoLang] = useState<'en' | 'kn'>('en');

  return (
    <div style={{ background: 'var(--bg-primary)', paddingBottom: '80px' }}>

      {/* ── 1. HERO & QUICK-START LAUNCHPAD ── */}
      <section style={{ position: 'relative', overflow: 'hidden', padding: '110px 0 60px', display: 'flex', alignItems: 'center' }}>
        <div className="hero-glow-1" />
        <div className="hero-glow-2" />

        <div style={{ maxWidth: '1200px', margin: '0 auto', padding: '0 24px', width: '100%', position: 'relative', zIndex: 1 }}>
          <div style={{ maxWidth: '820px', margin: '0 auto', textAlign: 'center', marginBottom: '48px' }}>
            
            {/* Badge */}
            <div className="fade-in-up" style={{
              display: 'inline-flex', alignItems: 'center', gap: '8px',
              background: 'rgba(37, 99, 235, 0.1)', border: '1px solid rgba(37, 99, 235, 0.25)',
              borderRadius: '999px', padding: '6px 18px', fontSize: '13px', fontWeight: 600,
              color: 'var(--brand-orange)', marginBottom: '24px', backdropFilter: 'blur(8px)',
            }}>
              <Sparkles size={14} /> 1,200+ Verified KPSC & UPSC PYQs (2011 - 2024)
            </div>

            {/* Headline */}
            <h1 className="fade-in-up-d1" style={{
              fontSize: 'clamp(36px, 5.5vw, 62px)', fontWeight: 900, lineHeight: 1.1,
              letterSpacing: '-1.5px', marginBottom: '20px', color: 'var(--text-primary)',
            }}>
              Practice KPSC KAS & UPSC <br />
              <span className="gradient-text">Bilingual PYQs</span> with AI Speed
            </h1>

            {/* Description */}
            <p className="fade-in-up-d2" style={{
              fontSize: '17px', color: 'var(--text-secondary)', marginBottom: '32px',
              lineHeight: 1.7, maxWidth: '640px', margin: '0 auto 36px',
            }}>
              Master civil service prelims with real exam papers in English & Kannada. Instant explanations, subject drills, and AI weakness telemetry.
            </p>

            {/* Main CTAs */}
            <div className="fade-in-up-d3" style={{ display: 'flex', gap: '14px', justifyContent: 'center', flexWrap: 'wrap' }}>
              <Link href="/exams" className="btn btn-primary btn-lg" style={{ borderRadius: '12px', padding: '14px 28px', fontSize: '15px' }}>
                Browse All 1,200 Questions <ArrowRight size={18} />
              </Link>
              {!user && (
                <Link href="/register" className="btn btn-secondary btn-lg" style={{ borderRadius: '12px', padding: '14px 28px', fontSize: '15px' }}>
                  Create Free Account
                </Link>
              )}
            </div>
          </div>

          {/* QUICK-START TILES */}
          <div style={{ marginTop: '20px' }}>
            <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase', letterSpacing: '0.08em', textAlign: 'center', marginBottom: '16px' }}>
              ⚡ 1-Click Practice Launchpad
            </div>
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(260px, 1fr))', gap: '16px' }}>
              {QUICK_LAUNCHES.map((item) => (
                <Link key={item.title} href={item.link} style={{ textDecoration: 'none' }}>
                  <div className="card" style={{
                    padding: '20px', borderRadius: '16px', border: '1px solid var(--border)',
                    background: 'var(--bg-card)', transition: 'all 0.2s ease', cursor: 'pointer',
                    position: 'relative', overflow: 'hidden', height: '100%',
                    display: 'flex', flexDirection: 'column', justifyContent: 'space-between'
                  }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '12px' }}>
                      <span style={{ fontSize: '11px', fontWeight: 700, color: item.color, background: `${item.color}15`, padding: '4px 10px', borderRadius: '999px' }}>
                        {item.badge}
                      </span>
                      <ArrowRight size={16} style={{ color: 'var(--text-muted)' }} />
                    </div>
                    <h3 style={{ fontSize: '16px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '4px' }}>{item.title}</h3>
                    <p style={{ fontSize: '13px', color: 'var(--text-secondary)' }}>{item.desc}</p>
                  </div>
                </Link>
              ))}
            </div>
          </div>

        </div>
      </section>

      <div style={{ maxWidth: '1100px', margin: '0 auto', padding: '0 24px' }}>

        {/* ── 2. LIVE INTERACTIVE DEMO PLAYER ── */}
        <section style={{ marginBottom: '80px', marginTop: '20px' }}>
          <div className="card" style={{
            padding: '32px', borderRadius: '24px', border: '1px solid var(--border)',
            background: 'linear-gradient(135deg, rgba(37,99,235,0.06) 0%, rgba(13,148,136,0.04) 100%)',
            boxShadow: '0 12px 40px rgba(0,0,0,0.15)'
          }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '20px', flexWrap: 'wrap', gap: '12px' }}>
              <div>
                <span className="tag chip-peach" style={{ marginBottom: '8px', display: 'inline-block' }}>💡 Try Before You Start</span>
                <h2 style={{ fontSize: '20px', fontWeight: 800 }}>Interactive Practice Preview</h2>
              </div>

              {/* Language Switcher */}
              <div style={{ display: 'flex', gap: '4px', background: 'var(--bg-secondary)', padding: '4px', borderRadius: '10px', border: '1px solid var(--border)' }}>
                <button
                  onClick={() => setDemoLang('en')}
                  style={{
                    padding: '6px 14px', borderRadius: '8px', border: 'none', cursor: 'pointer',
                    fontSize: '12px', fontWeight: 700,
                    background: demoLang === 'en' ? 'var(--brand-orange)' : 'transparent',
                    color: demoLang === 'en' ? 'white' : 'var(--text-secondary)',
                    transition: 'all 0.2s'
                  }}
                >
                  🇬🇧 English
                </button>
                <button
                  onClick={() => setDemoLang('kn')}
                  style={{
                    padding: '6px 14px', borderRadius: '8px', border: 'none', cursor: 'pointer',
                    fontSize: '12px', fontWeight: 700,
                    background: demoLang === 'kn' ? 'var(--brand-orange)' : 'transparent',
                    color: demoLang === 'kn' ? 'white' : 'var(--text-secondary)',
                    transition: 'all 0.2s'
                  }}
                >
                  🇮🇳 ಕನ್ನಡ
                </button>
              </div>
            </div>

            {/* Question Text */}
            <div style={{ fontSize: '16px', fontWeight: 600, color: 'var(--text-primary)', marginBottom: '20px', lineHeight: 1.6 }}>
              {demoLang === 'kn' ? SAMPLE_QUESTION.text_kn : SAMPLE_QUESTION.text_en}
            </div>

            {/* Options */}
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))', gap: '10px', marginBottom: '20px' }}>
              {SAMPLE_QUESTION.options.map((opt) => {
                const isSelected = demoSelected === opt.id;
                const isCorrect = opt.id === SAMPLE_QUESTION.correct;
                let borderStyle = '1px solid var(--border)';
                let bgStyle = 'var(--bg-card)';

                if (isSelected) {
                  if (isCorrect) {
                    borderStyle = '1px solid var(--accent-emerald)';
                    bgStyle = 'rgba(16, 185, 129, 0.12)';
                  } else {
                    borderStyle = '1px solid var(--accent-rose)';
                    bgStyle = 'rgba(244, 63, 94, 0.12)';
                  }
                }

                return (
                  <button
                    key={opt.id}
                    onClick={() => setDemoSelected(opt.id)}
                    style={{
                      padding: '14px', borderRadius: '12px', cursor: 'pointer', textAlign: 'left',
                      border: borderStyle, background: bgStyle, color: 'var(--text-primary)',
                      fontSize: '14px', fontWeight: isSelected ? 700 : 500,
                      display: 'flex', alignItems: 'center', gap: '10px', transition: 'all 0.2s'
                    }}
                  >
                    <span style={{
                      width: 24, height: 24, borderRadius: '6px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                      fontSize: '12px', fontWeight: 800,
                      background: isSelected ? (isCorrect ? 'var(--accent-emerald)' : 'var(--accent-rose)') : 'var(--bg-tertiary)',
                      color: isSelected ? 'white' : 'var(--text-secondary)'
                    }}>
                      {opt.id.toUpperCase()}
                    </span>
                    {demoLang === 'kn' ? opt.text_kn : opt.text_en}
                  </button>
                );
              })}
            </div>

            {/* AI Explanation Accordion */}
            {demoSelected && (
              <div style={{
                padding: '16px', borderRadius: '14px',
                background: demoSelected === SAMPLE_QUESTION.correct ? 'rgba(16, 185, 129, 0.1)' : 'rgba(217, 119, 6, 0.1)',
                border: demoSelected === SAMPLE_QUESTION.correct ? '1px solid rgba(16, 185, 129, 0.3)' : '1px solid rgba(217, 119, 6, 0.3)',
                animation: 'fadeIn 0.3s ease'
              }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', fontWeight: 700, fontSize: '13px', color: demoSelected === SAMPLE_QUESTION.correct ? 'var(--accent-emerald)' : 'var(--brand-gold)', marginBottom: '6px' }}>
                  <CheckCircle2 size={16} /> {demoSelected === SAMPLE_QUESTION.correct ? 'Correct Answer! (Option A)' : 'Explanation (Correct Answer: Option A)'}
                </div>
                <div style={{ fontSize: '13.5px', color: 'var(--text-primary)', lineHeight: 1.6 }}>
                  {demoLang === 'kn' ? SAMPLE_QUESTION.explanation_kn : SAMPLE_QUESTION.explanation_en}
                </div>
              </div>
            )}
          </div>
        </section>

        {/* ── 3. FEATURED EXAM PAPERS ── */}
        <section style={{ marginBottom: '80px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end', marginBottom: '32px', flexWrap: 'wrap', gap: '12px' }}>
            <div>
              <div style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', fontSize: '12px', fontWeight: 600, color: 'var(--brand-orange)', background: 'rgba(37, 99, 235, 0.1)', border: '1px solid rgba(37, 99, 235, 0.2)', borderRadius: '999px', padding: '5px 14px', marginBottom: '12px' }}>
                EXAM CATALOG
              </div>
              <h2 style={{ fontSize: 'clamp(22px, 3vw, 30px)', fontWeight: 800, letterSpacing: '-0.5px' }}>
                {t('featuredExams', lang)}
              </h2>
              <p style={{ color: 'var(--text-secondary)', fontSize: '14px', marginTop: '6px' }}>{t('featuredDesc', lang)}</p>
            </div>
            <Link href="/exams" className="btn btn-ghost" style={{ fontSize: '14px', gap: '6px' }}>
              View all <ArrowRight size={14} />
            </Link>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '16px' }}>
            {EXAMS.map((exam) => (
              <Link key={exam.id} href={`/exams/${exam.id}`} style={{ textDecoration: 'none' }}>
                <div className="exam-card" style={{ borderTop: `3px solid ${exam.color}` }}>
                  <div className="exam-icon-wrapper" style={{ background: `${exam.color}15`, border: `1px solid ${exam.color}30` }}>
                    {exam.icon}
                  </div>
                  <h3 style={{ fontWeight: 800, fontSize: '16px', marginBottom: '6px' }}>
                    {lang === 'kn' && exam.name_kn ? exam.name_kn : exam.name}
                  </h3>
                  <p style={{ fontSize: '13px', color: 'var(--text-secondary)', marginBottom: '16px', lineHeight: 1.5, flexGrow: 1 }}>
                    {lang === 'kn' && exam.description_kn ? exam.description_kn : exam.description}
                  </p>
                  <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap', paddingTop: '14px', borderTop: '1px solid var(--border)', marginTop: 'auto', justifyContent: 'space-between', alignItems: 'center' }}>
                    <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                      <span className="tag chip-sage">
                        {exam.category === 'upsc' ? '🏛️ UPSC' : '🅺 Karnataka'}
                      </span>
                      {exam.languages.includes('kn') && (
                        <span className="tag chip-sky">ಕನ್ನಡ</span>
                      )}
                    </div>
                    <span style={{ color: 'var(--brand-orange)', fontSize: '12px', fontWeight: 700 }}>Start Test →</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </section>

        {/* ── 4. WHY MOCKIQ BENTO GRID ── */}
        <section style={{ marginBottom: '80px' }}>
          <div style={{ textAlign: 'center', marginBottom: '48px' }}>
            <div style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', fontSize: '12px', fontWeight: 600, color: 'var(--brand-teal)', background: 'rgba(13, 148, 136, 0.1)', border: '1px solid rgba(13, 148, 136, 0.2)', borderRadius: '999px', padding: '5px 14px', marginBottom: '16px' }}>
              PLATFORM FEATURES
            </div>
            <h2 style={{ fontSize: 'clamp(24px, 3.5vw, 36px)', fontWeight: 800, marginBottom: '12px', letterSpacing: '-0.5px' }}>
              Engineered for Serious Aspirants
            </h2>
            <p style={{ color: 'var(--text-secondary)', fontSize: '15px', maxWidth: '480px', margin: '0 auto', lineHeight: 1.7 }}>
              Structured, high-precision tools designed to maximize your score on exam day.
            </p>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', gap: '16px' }}>
            {FEATURES.map((feature) => (
              <div key={feature.title} className="card" style={{ padding: '28px', borderRadius: '16px' }}>
                <div style={{
                  width: 48, height: 48, borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                  fontSize: '22px', marginBottom: '16px', background: 'var(--bg-tertiary)'
                }}>
                  {feature.emoji}
                </div>
                <h3 style={{ fontSize: '16.5px', fontWeight: 800, marginBottom: '8px' }}>{feature.title}</h3>
                <p style={{ fontSize: '14px', color: 'var(--text-secondary)', lineHeight: 1.6 }}>{feature.desc}</p>
              </div>
            ))}
          </div>
        </section>

      </div>
    </div>
  );
}
