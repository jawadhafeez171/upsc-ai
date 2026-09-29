'use client';
import { useState, useEffect } from 'react';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import { ArrowRight, Zap, BarChart2, Globe, RotateCcw, Target, Trophy, Sparkles, CheckCircle2 } from 'lucide-react';
import { EXAMS } from '@/lib/mockData';
import { t } from '@/lib/i18n';
import { Language } from '@/types';
import { useTheme } from '@/components/layout/ThemeProvider';
import { OptionFormatter, ExplanationFormatter } from '@/components/ui/QuestionFormatter';

const FEATURES = [
  { emoji: '🎯', title: 'Subject-Wise Focus', desc: 'Drill into individual chapters across 23 core subjects including Karnataka History, Polity & Economy.', chip: 'chip-peach' },
  { emoji: '🏆', title: 'Live Leaderboards', desc: 'Compete against thousands of state and national civil services aspirants in real-time.', chip: 'chip-sage' },
  { emoji: '🌐', title: 'Bilingual Mastery', desc: 'Study in English & Kannada with instant side-by-side translation and native font rendering.', chip: 'chip-sky' },
  { emoji: '📊', title: 'Deep Telemetry', desc: 'Receive granular accuracy ratings and per-question speed analytics after every session.', chip: 'chip-lavender' },
  { emoji: '🔄', title: 'Smart Weak Area Retest', desc: 'Auto-assemble custom 10-question drill sets targeting past incorrect responses in 1-click.', chip: 'chip-peach' },
  { emoji: '⚡', title: 'Instant Detailed Explanations', desc: 'Detailed, step-by-step rationale for every option right after selecting your answer.', chip: 'chip-sage' },
];

const QUICK_LAUNCHES = [
  {
    title: 'KPSC KAS 2024 Prelims',
    desc: 'Paper 1 & Paper 2 (August & December Sittings)',
    badge: '🔥 Latest Papers',
    link: '/exams/kpsc-kas',
    color: '#2563EB'
  },
  {
    title: 'UPSC CSE GS-1 (1995–2024)',
    desc: '3,320+ Curated General Studies Prelims PYQs',
    badge: '🏛️ Premier Exam',
    link: '/exams/upsc-cse',
    color: '#0D9488'
  },
  {
    title: 'UPSC CSAT Paper 2 (2013–2026)',
    desc: '1,120 Real Aptitude, GMA & Reading Comprehension Qs',
    badge: '🧠 CSAT Archive',
    link: '/exams/upsc-cse',
    color: '#D97706'
  },
  {
    title: 'UPSC CAPF (AC) 2014–2026',
    desc: '1,625 Real Assistant Commandant Paper 1 PYQs (13 Years)',
    badge: '🎖️ 13 Full Papers',
    link: '/exams/upsc-capf',
    color: '#0D5D56'
  },
  {
    title: 'KSP Police Constable 2026',
    desc: 'HK & State-wide NHK Official Key Validated Papers',
    badge: '🚔 200 Questions',
    link: '/exams/ksp-pc',
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
  const [totalQuestions, setTotalQuestions] = useState<number>(7466);

  useEffect(() => {
    async function fetchTotalQuestions() {
      try {
        const [q1, q2, q3, q4, q5] = await Promise.all([
          supabase.from('upsc_questions').select('id', { count: 'exact', head: true }),
          supabase.from('csat_pyq').select('id', { count: 'exact', head: true }),
          supabase.from('kas_questions').select('id', { count: 'exact', head: true }),
          supabase.from('pc_pyq').select('id', { count: 'exact', head: true }),
          supabase.from('capf_pyq').select('id', { count: 'exact', head: true })
        ]);
        const sum = (q1.count || 3321) + (q2.count || 1120) + (q3.count || 1200) + (q4.count || 200) + (q5.count || 1625);
        setTotalQuestions(sum);
      } catch (e) {
        console.error('Error fetching question count:', e);
      }
    }
    fetchTotalQuestions();
  }, []);

  return (
    <div style={{ background: 'var(--bg-primary)', paddingBottom: '80px' }}>

      {/* ── 1. HERO SECTION WITH SEAMLESS CREATIVE GRADIENT ── */}
      <section className="hero-gradient-section">
        {/* Cool Steel Cyan Glow Node */}
        <div className="hero-orb-cyan" />
        {/* Warm Terracotta Coral Glow Node */}
        <div className="hero-orb-coral" />
        {/* Vignette Overlay */}
        <div className="hero-gradient-overlay" />

        <div style={{ maxWidth: '1200px', margin: '0 auto', padding: '0 24px', width: '100%', position: 'relative', zIndex: 2 }}>
          
          <div style={{ maxWidth: '840px', margin: '0 auto', textAlign: 'center' }}>
            
            {/* Badge */}
            <div className="fade-in-up hero-top-badge">
              <Sparkles size={14} style={{ color: '#2563EB' }} /> {totalQuestions.toLocaleString()}+ Verified UPSC, KPSC & Police PYQs (2011–2026)
            </div>

            {/* Creative Lab Bold Headline */}
            <h1 className="fade-in-up-d1 hero-creative-title" style={{
              fontSize: 'clamp(32px, 5.2vw, 56px)', marginBottom: '20px',
            }}>
              Master KPSC KAS & UPSC Prelims <br />
              <span className="hero-creative-gradient-text">Bilingual PYQs</span> with Peak Accuracy
            </h1>

            {/* Description */}
            <p className="fade-in-up-d2 hero-desc">
              Master civil service prelims with real exam papers in English & Kannada. Instant explanations, subject drills, and detailed weakness telemetry.
            </p>

            {/* Main CTAs */}
            <div className="fade-in-up-d3" style={{ display: 'flex', gap: '14px', justifyContent: 'center', flexWrap: 'wrap', marginBottom: '32px' }}>
              <Link href="/exams" className="btn btn-primary btn-lg">
                Browse All {totalQuestions.toLocaleString()} Questions <ArrowRight size={18} />
              </Link>
              {!user && (
                <Link href="/register" className="btn btn-secondary btn-lg">
                  Create Free Account
                </Link>
              )}
            </div>

            {/* Sub-Text Callout matching Creative Lab style */}
            <div style={{
              display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '8px', flexWrap: 'wrap',
              paddingTop: '20px', borderTop: '1px solid var(--border)'
            }}>
              <span className="hero-sub-text-pill">🏛️ 4,440+ UPSC CSE & CSAT</span>
              <span className="hero-sub-text-pill">🎖️ 1,625 UPSC CAPF</span>
              <span className="hero-sub-text-pill">🅺 1,200 KPSC KAS</span>
              <span className="hero-sub-text-pill">🚔 200 KSP Police Constable</span>
              <span className="hero-sub-text-pill">🌐 Bilingual EN/KN/HI Support</span>
            </div>

          </div>

          {/* QUICK-START TILES */}
          <div style={{ marginTop: '24px' }}>
            <div style={{ fontSize: '12px', fontWeight: 800, color: 'var(--text-muted)', textTransform: 'uppercase', letterSpacing: '0.08em', textAlign: 'center', marginBottom: '16px' }}>
              ⚡ 1-Click Practice Launchpad
            </div>
            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(260px, 1fr))', gap: '16px' }}>
              {QUICK_LAUNCHES.map((item) => (
                <Link key={item.title} href={item.link} style={{ textDecoration: 'none' }}>
                  <div className="card" style={{
                    padding: '20px', borderRadius: '8px', border: '1.5px solid var(--border)',
                    background: 'var(--bg-card)', transition: 'all 0.2s ease', cursor: 'pointer',
                    position: 'relative', overflow: 'hidden', height: '100%',
                    boxShadow: 'var(--shadow-card)',
                    display: 'flex', flexDirection: 'column', justifyContent: 'space-between'
                  }}>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '12px' }}>
                      <span style={{ fontSize: '11px', fontWeight: 800, color: '#111827', background: '#FEF08A', border: '1px solid #1E1E1E', padding: '3px 8px', borderRadius: '4px' }}>
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
        <section style={{ marginBottom: '60px', marginTop: '30px' }}>
          <div className="card" style={{
            padding: '32px', borderRadius: '8px', border: '1.5px solid var(--border)',
            background: 'var(--bg-card)',
            boxShadow: 'var(--shadow-card)'
          }}>
            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '20px', flexWrap: 'wrap', gap: '12px' }}>
              <div>
                <span className="tag chip-peach" style={{ marginBottom: '8px', display: 'inline-block' }}>💡 Try Before You Start</span>
                <h2 style={{ fontSize: '20px', fontWeight: 800 }}>Interactive Practice Preview</h2>
              </div>

              {/* Language Switcher */}
              <div style={{ display: 'flex', gap: '4px', background: 'var(--bg-tertiary)', padding: '4px', borderRadius: '6px', border: '1px solid var(--border)' }}>
                <button
                  onClick={() => setDemoLang('en')}
                  style={{
                    padding: '6px 14px', borderRadius: '4px', border: '1px solid var(--border)', cursor: 'pointer',
                    fontSize: '12px', fontWeight: 700,
                    background: demoLang === 'en' ? '#111827' : 'transparent',
                    color: demoLang === 'en' ? '#FFFFFF' : 'var(--text-secondary)',
                    boxShadow: demoLang === 'en' ? '1px 1px 0px var(--border)' : 'none',
                    transition: 'all 0.15s'
                  }}
                >
                  🇬🇧 English
                </button>
                <button
                  onClick={() => setDemoLang('kn')}
                  style={{
                    padding: '6px 14px', borderRadius: '4px', border: '1px solid var(--border)', cursor: 'pointer',
                    fontSize: '12px', fontWeight: 700,
                    background: demoLang === 'kn' ? '#111827' : 'transparent',
                    color: demoLang === 'kn' ? '#FFFFFF' : 'var(--text-secondary)',
                    boxShadow: demoLang === 'kn' ? '1px 1px 0px var(--border)' : 'none',
                    transition: 'all 0.15s'
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
                let borderStyle = '1.5px solid var(--border)';
                let bgStyle = 'var(--bg-card)';

                if (isSelected) {
                  if (isCorrect) {
                    borderStyle = '1.5px solid #16A34A';
                    bgStyle = '#F0FDF4';
                  } else {
                    borderStyle = '1.5px solid #DC2626';
                    bgStyle = '#FEF2F2';
                  }
                }

                return (
                  <button
                    key={opt.id}
                    onClick={() => setDemoSelected(opt.id)}
                    style={{
                      padding: '14px 18px', borderRadius: '6px', cursor: 'pointer', textAlign: 'left',
                      border: borderStyle, background: bgStyle, color: 'var(--text-primary)',
                      display: 'flex', alignItems: 'center', gap: '14px', transition: 'all 0.2s',
                      boxShadow: 'var(--shadow-sm)'
                    }}
                  >
                    <span style={{
                      width: 30, height: 30, borderRadius: '4px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                      fontSize: '13px', fontWeight: 800, flexShrink: 0,
                      background: isSelected ? (isCorrect ? '#16A34A' : '#DC2626') : 'var(--bg-tertiary)',
                      color: isSelected ? '#FFFFFF' : 'var(--text-primary)',
                      border: '1px solid var(--border)',
                    }}>
                      {opt.id.toUpperCase()}
                    </span>
                    <div style={{ flex: 1, lineHeight: 1.6, fontSize: '13.5px' }}>
                      <OptionFormatter text={demoLang === 'kn' ? opt.text_kn : opt.text_en} />
                    </div>
                  </button>
                );
              })}
            </div>

            {/* AI Explanation Accordion */}
            {demoSelected && (
              <div style={{
                padding: '16px', borderRadius: '6px',
                background: demoSelected === SAMPLE_QUESTION.correct ? '#F0FDF4' : '#FFFBEB',
                border: demoSelected === SAMPLE_QUESTION.correct ? '1.5px solid #16A34A' : '1.5px solid #F59E0B',
                boxShadow: 'var(--shadow-sm)',
                animation: 'fadeIn 0.3s ease'
              }}>
                <div style={{ display: 'flex', alignItems: 'center', gap: '8px', fontWeight: 800, fontSize: '13px', color: demoSelected === SAMPLE_QUESTION.correct ? '#16A34A' : '#B45309', marginBottom: '8px' }}>
                  <CheckCircle2 size={16} /> {demoSelected === SAMPLE_QUESTION.correct ? 'Correct Answer! (Option A)' : 'Explanation (Correct Answer: Option A)'}
                </div>
                <div style={{ fontSize: '13.5px', color: 'var(--text-primary)', lineHeight: 1.65 }}>
                  <ExplanationFormatter text={demoLang === 'kn' ? SAMPLE_QUESTION.explanation_kn : SAMPLE_QUESTION.explanation_en} />
                </div>
              </div>
            )}
          </div>
        </section>

        {/* ── 3. FEATURED EXAM PAPERS ── */}
        <section style={{ marginBottom: '80px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end', marginBottom: '32px', flexWrap: 'wrap', gap: '12px' }}>
            <div>
              <div style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', fontSize: '11px', fontWeight: 800, color: '#111827', background: '#FEF08A', border: '1px solid #1E1E1E', borderRadius: '4px', padding: '4px 10px', marginBottom: '12px', boxShadow: '1px 1px 0px var(--border)' }}>
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
            {EXAMS.map((exam) => {
              const isNational = exam.category === 'upsc' || exam.category === 'defence' || exam.id.startsWith('upsc');
              const categoryLabel = exam.category === 'upsc' ? '🏛️ UPSC'
                : exam.category === 'defence' ? '⚔️ Defence (National)'
                : exam.category === 'teaching' ? '👩‍🏫 Teaching'
                : '🅺 Karnataka';

              return (
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
                        <span className={`tag ${isNational ? 'chip-peach' : 'chip-sage'}`}>
                          {categoryLabel}
                        </span>
                        {exam.languages.includes('kn') && (
                          <span className="tag chip-sky">ಕನ್ನಡ</span>
                        )}
                      </div>
                      <span style={{ color: 'var(--brand-orange)', fontSize: '12px', fontWeight: 800 }}>Start Test →</span>
                    </div>
                  </div>
                </Link>
              );
            })}
          </div>
        </section>

        {/* ── 4. WHY MOCKIQ BENTO GRID ── */}
        <section style={{ marginBottom: '80px' }}>
          <div style={{ textAlign: 'center', marginBottom: '48px' }}>
            <div style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', fontSize: '11px', fontWeight: 800, color: '#111827', background: '#FEF08A', border: '1px solid #1E1E1E', borderRadius: '4px', padding: '4px 10px', marginBottom: '16px', boxShadow: '1px 1px 0px var(--border)' }}>
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
              <div key={feature.title} className="card" style={{ padding: '24px', borderRadius: '8px', border: '1.5px solid var(--border)', boxShadow: 'var(--shadow-card)' }}>
                <div style={{
                  width: 44, height: 44, borderRadius: '8px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                  fontSize: '22px', marginBottom: '16px', background: 'var(--bg-tertiary)', border: '1px solid var(--border)',
                  boxShadow: '1px 1px 0px var(--border)'
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
