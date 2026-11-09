'use client';
import { useState, useEffect } from 'react';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { supabase } from '@/lib/supabase';
import {
  ArrowRight,
  Target,
  Clock,
  Languages,
  BarChart2,
  Repeat,
  BookOpen,
  RotateCcw,
  CheckCircle2,
  Building2,
  ShieldCheck,
  Award,
  ChevronRight,
  Brain,
  Scale,
  Layers
} from 'lucide-react';
import { OptionFormatter, ExplanationFormatter } from '@/components/ui/QuestionFormatter';

interface DemoQuestion {
  text_en: string;
  text_hi: string;
  text_kn: string;
  options: {
    id: string;
    text_en: string;
    text_hi: string;
    text_kn: string;
  }[];
  correct: string;
  explanation_en: string;
  explanation_hi: string;
  explanation_kn: string;
  citation: string;
}

const SAMPLE_QUESTION: DemoQuestion = {
  text_en: "With reference to the Constitution of India, consider the following statements:\n1. The Preamble is a part of the Constitution and can be amended under Article 368 without altering the 'Basic Structure'.\n2. The Preamble is non-justiciable; its provisions are not enforceable in any court of law.",
  text_hi: "भारत के संविधान के संदर्भ में, निम्नलिखित कथनों पर विचार कीजिए:\n1. प्रस्तावना संविधान का एक भाग है और 'मूल संरचना' को बदले बिना अनुच्छेद 368 के तहत इसमें संशोधन किया जा सकता है।\n2. प्रस्तावना गैर-न्यायसंगत है; इसके प्रावधान कानून की किसी भी अदालत में लागू करने योग्य नहीं हैं।",
  text_kn: "ಭಾರತದ ಸಂವಿಧಾನಕ್ಕೆ ಸಂಬಂಧಿಸಿದಂತೆ, ಈ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ:\n1. ಪ್ರಸ್ತಾವನೆಯು ಸಂವಿಧಾನದ ಒಂದು ಭಾಗವಾಗಿದ್ದು, 'ಮೂಲ ಸಂರಚನೆ'ಯನ್ನು ಬದಲಾಯಿಸದೆ 368 ನೇ ವಿಧಿಯ ಅಡಿಯಲ್ಲಿ ತಿದ್ದುಪಡಿ ಮಾಡಬಹುದು.\n2. ಪ್ರಸ್ತಾವನೆಯು ನ್ಯಾಯಯುತವಲ್ಲ; ಇದರ ನಿಬಂಧನೆಗಳನ್ನು ಯಾವುದೇ ನ್ಯಾಯಾಲಯದಲ್ಲಿ ಜಾರಿಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.",
  options: [
    { id: 'a', text_en: '1 only', text_hi: 'केवल 1', text_kn: 'ಕೇವಲ 1' },
    { id: 'b', text_en: '2 only', text_hi: 'केवल 2', text_kn: 'ಕೇವಲ 2' },
    { id: 'c', text_en: 'Both 1 and 2', text_hi: '1 और 2 दोनों', text_kn: '1 ಮತ್ತು 2 ಎರಡೂ' },
    { id: 'd', text_en: 'Neither 1 nor 2', text_hi: 'न तो 1 और न ही 2', text_kn: '1 ಅಥವಾ 2 ಎರಡೂ ಅಲ್ಲ' }
  ],
  correct: 'c',
  explanation_en: "Correct Answer: (c) Both 1 and 2.\n\n• Statement 1 is correct: In the landmark Kesavananda Bharati case (1973), the Supreme Court held that the Preamble is an integral part of the Constitution and can be amended under Article 368, subject to the condition that no amendment is done to the 'Basic Structure'. It was amended once by the 42nd Constitutional Amendment Act (1976).\n• Statement 2 is correct: The Preamble is neither a source of power to the legislature nor a prohibition upon the powers of legislature. It is non-justiciable, meaning that its provisions are not directly enforceable in courts of law.",
  explanation_hi: "सही उत्तर: (c) 1 और 2 दोनों।\n\n• कथन 1 सही है: ऐतिहासिक केशवानंद भारती मामले (1973) में, सर्वोच्च न्यायालय ने माना कि प्रस्तावना संविधान का अभिन्न अंग है और अनुच्छेद 368 के तहत इसमें संशोधन किया जा सकता है, बशर्ते कि 'मूल संरचना' में कोई बदलाव न हो। इसे 42वें संविधान संशोधन अधिनियम (1976) द्वारा एक बार संशोधित किया गया था।\n• कथन 2 सही है: प्रस्तावना न तो विधायिका की शक्ति का स्रोत है और न ही विधायिका की शक्तियों पर निषेध। यह गैर-न्यायसंगत है, अर्थात इसके प्रावधान अदालतों में सीधे लागू करने योग्य नहीं हैं।",
  explanation_kn: "ಸರಿಯಾದ ಉತ್ತರ: (c) 1 ಮತ್ತು 2 ಎರಡೂ.\n\n• ಹೇಳಿಕೆ 1 ಸರಿಯಾಗಿದೆ: ಐತಿಹಾಸಿಕ ಕೇಶವಾನಂದ ಭಾರತೀ ಪ್ರಕರಣದಲ್ಲಿ (1973), ಸುಪ್ರೀಂ ಕೋರ್ಟ್ ಪ್ರಸ್ತಾವನೆಯು ಸಂವಿಧಾನದ ಅವಿಭಾಜ್ಯ ಅಂಗವಾಗಿದೆ ಮತ್ತು 'ಮೂಲ ಸಂರಚನೆ'ಗೆ ಧಕ್ಕೆ ತರದಂತೆ 368 ನೇ ವಿಧಿಯ ಅಡಿಯಲ್ಲಿ ತಿದ್ದುಪಡಿ ಮಾಡಬಹುದು ಎಂದು ತೀರ್ಪು ನೀಡಿತು.\n• ಹೇಳಿಕೆ 2 ಸರಿಯಾಗಿದೆ: ಪ್ರಸ್ತಾವನೆಯು ನ್ಯಾಯಯುತವಲ್ಲ, ಅಂದರೆ ಇದರ ನಿಬಂಧನೆಗಳನ್ನು ಕಾನೂನಿನ ಯಾವುದೇ ನ್ಯಾಯಾಲಯದಲ್ಲಿ ನೇರವಾಗಿ ಜಾರಿಗೊಳಿಸಲಾಗುವುದಿಲ್ಲ.",
  citation: "Ref: M. Laxmikanth, Indian Polity (7th Ed.), Chapter 4: 'Preamble of the Constitution' · UPSC CSE 2020 / 2017 PYQ"
};

const PLATFORM_PILLARS = [
  {
    icon: Target,
    title: 'Subject & Topic Hierarchy',
    desc: 'Filter 30 years of questions across Polity, Modern History, Economy, Geography, Environment, and Science & Technology down to specific sub-themes.',
    color: '#2563EB'
  },
  {
    icon: Clock,
    title: 'Statutory CBT Simulation',
    desc: 'Official 120-minute timer, 10-column question palette matrix, mark-for-review workflows, and exact +2.00 / -0.66 negative marking calculations.',
    color: '#0D9488'
  },
  {
    icon: Languages,
    title: 'Authentic Bilingual Parity',
    desc: 'Complete English, Hindi, and Kannada support with dedicated Devanagari script scaling (106%) and generous line heights to prevent reading fatigue.',
    color: '#D97706'
  },
  {
    icon: BarChart2,
    title: 'Diagnostic Mistake Telemetry',
    desc: 'Identify accuracy blind spots, unattempted question clusters, and pacing bottlenecks to target revision with surgical precision.',
    color: '#7C3AED'
  },
  {
    icon: Repeat,
    title: 'Weak Area Revision Retest',
    desc: 'Auto-assemble custom 10-question practice drills targeting your past incorrect or unattempted questions in one click.',
    color: '#DC2626'
  },
  {
    icon: BookOpen,
    title: 'Verified Standard Citations',
    desc: 'Every question is cross-referenced with standard civil services sources (NCERT, Laxmikanth, Spectrum, Ramesh Singh) and official UPSC answer keys.',
    color: '#059669'
  }
];

const CURATED_EXAMS = [
  {
    id: 'upsc-cse-gs1',
    title: 'UPSC CSE Prelims: GS Paper 1',
    period: '1995–2024 · 30 Sittings',
    count: '3,320+ Questions',
    badge: 'Premier National Exam',
    desc: 'Complete 30-year archive spanning Indian Polity, Modern History, Economy, Environment, Geography, and Sci-Tech.',
    link: '/exams/upsc-cse',
    accentColor: '#2563EB'
  },
  {
    id: 'upsc-csat-paper2',
    title: 'UPSC CSAT: General Studies Paper 2',
    period: '2013–2024 · 12 Sittings',
    count: '1,120 Questions',
    badge: 'Mandatory Qualifying Paper',
    desc: 'Reading Comprehension passages, Quantitative Aptitude, Logical Reasoning, and Data Interpretation with step-by-step solutions.',
    link: '/exams/upsc-cse',
    accentColor: '#D97706'
  },
  {
    id: 'upsc-capf-ac',
    title: 'UPSC CAPF (Assistant Commandant)',
    period: '2014–2026 · 13 Years',
    count: '1,625 Questions',
    badge: 'Defence & Paramilitary',
    desc: 'Complete 13-year official Paper 1 archive validated against statutory UPSC keys for paramilitary civil leadership aspirants.',
    link: '/exams/upsc-capf',
    accentColor: '#0D5D56'
  },
  {
    id: 'kpsc-kas-prelims',
    title: 'KPSC KAS Civil Services Prelims',
    period: '2014–2024 Sittings',
    count: '1,200 Questions',
    badge: 'State Civil Services',
    desc: 'Paper 1 (General Studies) & Paper 2 (General Aptitude) with 100% bilingual English and Kannada translation parity.',
    link: '/exams/kpsc-kas',
    accentColor: '#0D9488'
  }
];

export default function HomePage() {
  const [demoSelected, setDemoSelected] = useState<string | null>(null);
  const [demoLang, setDemoLang] = useState<'en' | 'hi' | 'kn'>('en');
  const [totalQuestions, setTotalQuestions] = useState<number>(14890);

  useEffect(() => {
    async function fetchTotalQuestions() {
      try {
        const [q1, q2, q3, q4, q5, q6, q7] = await Promise.all([
          supabase.from('upsc_questions').select('id', { count: 'exact', head: true }),
          supabase.from('csat_pyq').select('id', { count: 'exact', head: true }),
          supabase.from('kas_questions').select('id', { count: 'exact', head: true }),
          supabase.from('pc_pyq').select('id', { count: 'exact', head: true }),
          supabase.from('capf_pyq').select('id', { count: 'exact', head: true }),
          supabase.from('epfo_pyq').select('id', { count: 'exact', head: true }),
          supabase.from('kea_questions').select('id', { count: 'exact', head: true })
        ]);
        const sum =
          (q1.count || 3321) +
          (q2.count || 1120) +
          (q3.count || 1200) +
          (q4.count || 200) +
          (q5.count || 1625) +
          (q6.count || 1060) +
          (q7.count || 6364);
        setTotalQuestions(sum);
      } catch (e) {
        console.error('Error fetching question count:', e);
      }
    }
    fetchTotalQuestions();
  }, []);

  const handleResetDemo = () => {
    setDemoSelected(null);
  };

  return (
    <div style={{ background: 'var(--bg-primary)', minHeight: '100vh', paddingBottom: '90px' }}>

      {/* ── 1. EDITORIAL HERO SECTION (FOCUSED SINGLE-COLUMN) ── */}
      <section style={{
        padding: '64px 24px 52px',
        borderBottom: '1.5px solid var(--border)',
        background: 'var(--bg-secondary)',
        position: 'relative'
      }}>
        <div style={{ maxWidth: '1040px', margin: '0 auto', textAlign: 'center' }}>

          {/* Master Display Headline (Clean, no kicker above) */}
          <h1 style={{
            fontFamily: 'var(--font-sans), sans-serif',
            fontSize: 'clamp(32px, 4.8vw, 54px)',
            fontWeight: 900,
            letterSpacing: '-0.035em',
            lineHeight: 1.15,
            color: 'var(--text-primary)',
            marginBottom: '20px',
            maxWidth: '960px',
            marginInline: 'auto'
          }}>
            Master UPSC CSE & State PCS Prelims <br className="hidden-mobile" />
            with <span style={{ color: '#C2410C' }}>30-Year PYQ Precision</span>
          </h1>

          {/* Academic Lead Paragraph */}
          <p style={{
            fontSize: 'clamp(15px, 1.2vw + 0.5rem, 18px)',
            color: 'var(--text-secondary)',
            lineHeight: 1.65,
            maxWidth: '760px',
            margin: '0 auto 32px'
          }}>
            Over {totalQuestions.toLocaleString()}+ verified questions spanning 1995 to 2024. Exact Computer-Based Test
            simulation, bilingual English, Hindi, and Kannada parity, and rigorous step-by-step reasoning citing standard civil services sources.
          </p>

          {/* Primary Action Button Pair */}
          <div style={{ display: 'flex', gap: '14px', justifyContent: 'center', flexWrap: 'wrap', marginBottom: '36px' }}>
            <Link
              href="/exams/upsc-cse"
              className="btn btn-primary"
              style={{
                padding: '13px 28px',
                fontSize: '14.5px',
                fontWeight: 700,
                borderRadius: '8px',
                background: '#1E1B4B',
                color: '#FFFFFF',
                border: '1px solid #312E81',
                gap: '8px',
                display: 'inline-flex',
                alignItems: 'center'
              }}
            >
              <span>Start 100-Question Prelims Mock</span>
              <ArrowRight size={16} />
            </Link>

            <Link
              href="/exams"
              className="btn btn-secondary"
              style={{
                padding: '13px 24px',
                fontSize: '14.5px',
                fontWeight: 700,
                borderRadius: '8px',
                background: 'var(--bg-card)',
                border: '1px solid var(--border)',
                color: 'var(--text-primary)'
              }}
            >
              <span>Browse 30-Year PYQ Catalog</span>
            </Link>
          </div>

          {/* Verifiable Trust Metrics Strip (Strictly Lucide SVG icons, NO emojis) */}
          <div style={{
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            gap: '10px',
            flexWrap: 'wrap',
            paddingTop: '22px',
            borderTop: '1px solid var(--border)'
          }}>
            <span className="hero-sub-text-pill" style={{ display: 'inline-flex', alignItems: 'center', gap: '6px' }}>
              <Building2 size={13} color="#2563EB" />
              <span>3,320+ UPSC CSE GS-1</span>
            </span>
            <span className="hero-sub-text-pill" style={{ display: 'inline-flex', alignItems: 'center', gap: '6px' }}>
              <Brain size={13} color="#D97706" />
              <span>1,120 CSAT Paper II</span>
            </span>
            <span className="hero-sub-text-pill" style={{ display: 'inline-flex', alignItems: 'center', gap: '6px' }}>
              <ShieldCheck size={13} color="#0D5D56" />
              <span>1,625 CAPF (AC)</span>
            </span>
            <span className="hero-sub-text-pill" style={{ display: 'inline-flex', alignItems: 'center', gap: '6px' }}>
              <Layers size={13} color="#0D9488" />
              <span>1,200 KPSC KAS</span>
            </span>
            <span className="hero-sub-text-pill" style={{ display: 'inline-flex', alignItems: 'center', gap: '6px' }}>
              <Scale size={13} color="#7C3AED" />
              <span>+2.00 / -0.66 Scoring</span>
            </span>
            <span className="hero-sub-text-pill" style={{ display: 'inline-flex', alignItems: 'center', gap: '6px' }}>
              <Languages size={13} color="#2563EB" />
              <span>English · Hindi · Kannada</span>
            </span>
          </div>

        </div>
      </section>

      {/* ── 2. LIVE INTERACTIVE DEMO PLAYER ── */}
      <div style={{ maxWidth: '1120px', margin: '0 auto', padding: '0 24px' }}>

        <section style={{ marginTop: '44px', marginBottom: '64px' }}>
          <div className="card" style={{
            padding: '28px 32px',
            borderRadius: '12px',
            border: '1px solid var(--border)',
            background: 'var(--bg-card)',
            boxShadow: 'var(--shadow-card)'
          }}>
            {/* Demonstrator Header */}
            <div style={{
              display: 'flex',
              justifyContent: 'space-between',
              alignItems: 'center',
              marginBottom: '20px',
              flexWrap: 'wrap',
              gap: '14px',
              paddingBottom: '16px',
              borderBottom: '1px solid var(--border)'
            }}>
              <h2 style={{ fontSize: '18px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                Test Your Conceptual Grasp on Real UPSC Questions
              </h2>

              {/* Toolbar: Language Switcher & Reset Button */}
              <div style={{ display: 'flex', alignItems: 'center', gap: '8px', flexWrap: 'wrap' }}>
                <div style={{
                  display: 'flex',
                  gap: '3px',
                  background: 'var(--bg-tertiary)',
                  padding: '3px',
                  borderRadius: '8px',
                  border: '1px solid var(--border)'
                }}>
                  <button
                    type="button"
                    onClick={() => setDemoLang('en')}
                    style={{
                      padding: '4px 10px',
                      borderRadius: '6px',
                      border: 'none',
                      cursor: 'pointer',
                      fontSize: '11.5px',
                      fontWeight: 700,
                      background: demoLang === 'en' ? '#1E1B4B' : 'transparent',
                      color: demoLang === 'en' ? '#FFFFFF' : 'var(--text-secondary)',
                      boxShadow: demoLang === 'en' ? '0 1px 2px rgba(30,27,75,0.2)' : 'none',
                      transition: 'all 0.15s ease'
                    }}
                  >
                    English
                  </button>
                  <button
                    type="button"
                    onClick={() => setDemoLang('hi')}
                    style={{
                      padding: '4px 10px',
                      borderRadius: '6px',
                      border: 'none',
                      cursor: 'pointer',
                      fontSize: '11.5px',
                      fontWeight: 700,
                      background: demoLang === 'hi' ? '#1E1B4B' : 'transparent',
                      color: demoLang === 'hi' ? '#FFFFFF' : 'var(--text-secondary)',
                      boxShadow: demoLang === 'hi' ? '0 1px 2px rgba(30,27,75,0.2)' : 'none',
                      transition: 'all 0.15s ease'
                    }}
                  >
                    हिन्दी
                  </button>
                  <button
                    type="button"
                    onClick={() => setDemoLang('kn')}
                    style={{
                      padding: '4px 10px',
                      borderRadius: '6px',
                      border: 'none',
                      cursor: 'pointer',
                      fontSize: '11.5px',
                      fontWeight: 700,
                      background: demoLang === 'kn' ? '#1E1B4B' : 'transparent',
                      color: demoLang === 'kn' ? '#FFFFFF' : 'var(--text-secondary)',
                      boxShadow: demoLang === 'kn' ? '0 1px 2px rgba(30,27,75,0.2)' : 'none',
                      transition: 'all 0.15s ease'
                    }}
                  >
                    ಕನ್ನಡ
                  </button>
                </div>

                {demoSelected && (
                  <button
                    type="button"
                    onClick={handleResetDemo}
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '5px',
                      padding: '5px 10px',
                      borderRadius: '6px',
                      border: '1px solid var(--border)',
                      background: 'var(--bg-secondary)',
                      color: 'var(--text-secondary)',
                      fontSize: '11.5px',
                      fontWeight: 700,
                      cursor: 'pointer',
                      boxShadow: 'var(--shadow-sm)'
                    }}
                    title="Reset choice"
                  >
                    <RotateCcw size={12} />
                    <span>Reset</span>
                  </button>
                )}
              </div>
            </div>

            {/* Question Statement */}
            <div style={{
              fontSize: '15px',
              fontWeight: 600,
              color: 'var(--text-primary)',
              marginBottom: '20px',
              lineHeight: 1.65,
              whiteSpace: 'pre-line'
            }}>
              {demoLang === 'hi'
                ? SAMPLE_QUESTION.text_hi
                : demoLang === 'kn'
                ? SAMPLE_QUESTION.text_kn
                : SAMPLE_QUESTION.text_en}
            </div>

            {/* 4 Options Grid */}
            <div style={{
              display: 'grid',
              gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))',
              gap: '12px',
              marginBottom: '20px'
            }}>
              {SAMPLE_QUESTION.options.map((opt) => {
                const isSelected = demoSelected === opt.id;
                const isCorrect = opt.id === SAMPLE_QUESTION.correct;
                let borderStyle = '1px solid var(--border)';
                let bgStyle = 'var(--bg-secondary)';

                if (isSelected) {
                  if (isCorrect) {
                    borderStyle = '1.5px solid #10B981';
                    bgStyle = 'rgba(16, 185, 129, 0.08)';
                  } else {
                    borderStyle = '1.5px solid #EF4444';
                    bgStyle = 'rgba(239, 68, 68, 0.08)';
                  }
                }

                return (
                  <button
                    key={opt.id}
                    type="button"
                    onClick={() => setDemoSelected(opt.id)}
                    style={{
                      padding: '14px 16px',
                      borderRadius: '8px',
                      cursor: 'pointer',
                      textAlign: 'left',
                      border: borderStyle,
                      background: bgStyle,
                      color: 'var(--text-primary)',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '12px',
                      transition: 'all 0.15s ease',
                      boxShadow: 'var(--shadow-sm)'
                    }}
                  >
                    <span style={{
                      width: 28,
                      height: 28,
                      borderRadius: '6px',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                      fontSize: '12px',
                      fontWeight: 800,
                      flexShrink: 0,
                      background: isSelected ? (isCorrect ? '#10B981' : '#EF4444') : 'var(--bg-card)',
                      color: isSelected ? '#FFFFFF' : 'var(--text-primary)',
                      border: '1px solid var(--border)',
                      fontFamily: 'var(--font-mono, monospace)'
                    }}>
                      {opt.id.toUpperCase()}
                    </span>
                    <div style={{ flex: 1, lineHeight: 1.5, fontSize: '13.5px', fontWeight: 500 }}>
                      <OptionFormatter
                        text={
                          demoLang === 'hi'
                            ? opt.text_hi
                            : demoLang === 'kn'
                            ? opt.text_kn
                            : opt.text_en
                        }
                      />
                    </div>
                  </button>
                );
              })}
            </div>

            {/* Explanation Breakdown Box */}
            {demoSelected && (
              <div style={{
                padding: '16px 20px',
                borderRadius: '8px',
                background: demoSelected === SAMPLE_QUESTION.correct ? 'rgba(16, 185, 129, 0.06)' : 'rgba(245, 158, 11, 0.06)',
                border: demoSelected === SAMPLE_QUESTION.correct ? '1px solid #86EFAC' : '1px solid #FDE68A',
                boxShadow: 'var(--shadow-sm)'
              }}>
                <div style={{
                  display: 'flex',
                  alignItems: 'center',
                  gap: '8px',
                  fontWeight: 800,
                  fontSize: '13px',
                  color: demoSelected === SAMPLE_QUESTION.correct ? '#059669' : '#B45309',
                  marginBottom: '8px'
                }}>
                  <CheckCircle2 size={16} />
                  <span>
                    {demoSelected === SAMPLE_QUESTION.correct
                      ? 'Correct Response! (+2.00 Marks Awarded)'
                      : 'Incorrect Response (-0.66 Marks Penalty) · Official Key: (c)'}
                  </span>
                </div>
                <div style={{
                  fontSize: '13.5px',
                  color: 'var(--text-primary)',
                  lineHeight: 1.65,
                  whiteSpace: 'pre-line',
                  marginBottom: '10px'
                }}>
                  <ExplanationFormatter
                    text={
                      demoLang === 'hi'
                        ? SAMPLE_QUESTION.explanation_hi
                        : demoLang === 'kn'
                        ? SAMPLE_QUESTION.explanation_kn
                        : SAMPLE_QUESTION.explanation_en
                    }
                  />
                </div>
                <div style={{
                  fontSize: '11px',
                  fontWeight: 700,
                  color: 'var(--text-muted)',
                  borderTop: '1px solid var(--border)',
                  paddingTop: '8px',
                  fontFamily: 'var(--font-mono, monospace)'
                }}>
                  {SAMPLE_QUESTION.citation}
                </div>
              </div>
            )}
          </div>
        </section>

        {/* ── 3. CURATED CIVIL SERVICES EXAM TRACKS ── */}
        <section style={{ marginBottom: '72px' }}>
          <div style={{
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'flex-end',
            marginBottom: '24px',
            flexWrap: 'wrap',
            gap: '12px'
          }}>
            <div>
              <h2 style={{ fontSize: 'clamp(22px, 3vw, 28px)', fontWeight: 800, letterSpacing: '-0.02em', margin: 0 }}>
                Primary Examination Archives
              </h2>
              <p style={{ color: 'var(--text-secondary)', fontSize: '14px', marginTop: '4px', margin: 0 }}>
                Full mock sittings and subject chapter tests validated with official commission answer keys.
              </p>
            </div>

            <Link href="/exams" className="btn btn-ghost" style={{ fontSize: '13px', fontWeight: 700, gap: '6px', color: '#2563EB', textDecoration: 'none' }}>
              <span>View All Papers</span>
              <ArrowRight size={14} />
            </Link>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(250px, 1fr))', gap: '16px' }}>
            {CURATED_EXAMS.map((exam) => (
              <Link key={exam.id} href={exam.link} style={{ textDecoration: 'none' }}>
                <div className="card" style={{
                  padding: '22px',
                  borderRadius: '12px',
                  border: '1px solid var(--border)',
                  background: 'var(--bg-card)',
                  boxShadow: 'var(--shadow-card)',
                  height: '100%',
                  display: 'flex',
                  flexDirection: 'column',
                  justifyContent: 'space-between',
                  transition: 'transform 0.15s ease'
                }}>
                  <div>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '12px' }}>
                      <span style={{
                        fontSize: '11px',
                        fontWeight: 700,
                        color: exam.accentColor,
                        background: 'rgba(37, 99, 235, 0.08)',
                        border: '1px solid rgba(37, 99, 235, 0.25)',
                        padding: '3px 10px',
                        borderRadius: '6px'
                      }}>
                        {exam.badge}
                      </span>
                      <span style={{ fontSize: '11px', fontWeight: 600, color: 'var(--text-muted)' }}>
                        {exam.period}
                      </span>
                    </div>

                    <h3 style={{ fontSize: '15.5px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '6px' }}>
                      {exam.title}
                    </h3>
                    <p style={{ fontSize: '13px', color: 'var(--text-secondary)', lineHeight: 1.55, marginBottom: '16px' }}>
                      {exam.desc}
                    </p>
                  </div>

                  <div style={{
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    paddingTop: '12px',
                    borderTop: '1px solid var(--border)',
                    marginTop: 'auto'
                  }}>
                    <span style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-primary)' }}>
                      {exam.count}
                    </span>
                    <span style={{
                      fontSize: '12px',
                      fontWeight: 700,
                      color: '#C2410C',
                      display: 'flex',
                      alignItems: 'center',
                      gap: '4px'
                    }}>
                      <span>Enter CBT</span>
                      <ChevronRight size={14} />
                    </span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </section>

        {/* ── 4. WHY UPSC AI: ENGINEERED FOR SERIOUS ASPIRANTS ── */}
        <section style={{ marginBottom: '72px' }}>
          <div style={{ textAlign: 'center', marginBottom: '36px' }}>
            <h2 style={{ fontSize: 'clamp(24px, 3.2vw, 32px)', fontWeight: 800, letterSpacing: '-0.02em', margin: 0 }}>
              Engineered for Serious Civil Services Aspirants
            </h2>
            <p style={{ color: 'var(--text-secondary)', fontSize: '14.5px', maxWidth: '520px', margin: '8px auto 0', lineHeight: 1.6 }}>
              A distraction-free technical assessment workspace built around actual exam conditions.
            </p>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(320px, 1fr))', gap: '16px' }}>
            {PLATFORM_PILLARS.map((pillar) => {
              const IconComp = pillar.icon;
              return (
                <div key={pillar.title} className="card" style={{
                  padding: '24px',
                  borderRadius: '12px',
                  border: '1px solid var(--border)',
                  boxShadow: 'var(--shadow-card)',
                  background: 'var(--bg-card)'
                }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '10px' }}>
                    <IconComp size={19} color={pillar.color} strokeWidth={2.4} />
                    <h3 style={{ fontSize: '15.5px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                      {pillar.title}
                    </h3>
                  </div>
                  <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.6, margin: 0 }}>
                    {pillar.desc}
                  </p>
                </div>
              );
            })}
          </div>
        </section>

        {/* ── 5. CLOSING CONVERSION BLOCK (PEAK-END REASSURANCE) ── */}
        <section style={{
          padding: '44px 32px',
          borderRadius: '16px',
          border: '1px solid var(--border)',
          background: 'var(--bg-card)',
          boxShadow: 'var(--shadow-card)',
          textAlign: 'center',
          marginBottom: '20px'
        }}>
          <h2 style={{
            fontSize: 'clamp(22px, 3vw, 30px)',
            fontWeight: 800,
            letterSpacing: '-0.02em',
            marginBottom: '12px',
            color: 'var(--text-primary)'
          }}>
            Ready to test your Prelims stamina under official conditions?
          </h2>

          <p style={{
            fontSize: '15px',
            color: 'var(--text-secondary)',
            maxWidth: '620px',
            margin: '0 auto 28px',
            lineHeight: 1.6
          }}>
            Launch an authentic 120-minute Computer-Based Test right now. Instant scoring breakdown, 1/3rd negative marking
            telemetry, and zero registration paywalls.
          </p>

          <div style={{ display: 'flex', gap: '12px', justifyContent: 'center', flexWrap: 'wrap' }}>
            <Link
              href="/exams/upsc-cse"
              className="btn btn-primary"
              style={{
                padding: '12px 28px',
                fontSize: '14.5px',
                fontWeight: 700,
                borderRadius: '8px',
                background: '#1E1B4B',
                color: '#FFFFFF',
                border: '1px solid #312E81',
                display: 'inline-flex',
                alignItems: 'center',
                gap: '8px'
              }}
            >
              <span>Launch 100-Question Prelims Mock</span>
              <ArrowRight size={16} />
            </Link>

            <Link
              href="/exams"
              className="btn btn-secondary"
              style={{
                padding: '12px 24px',
                fontSize: '14.5px',
                fontWeight: 700,
                borderRadius: '8px',
                background: 'var(--bg-secondary)',
                border: '1px solid var(--border)',
                color: 'var(--text-primary)'
              }}
            >
              <span>Explore All Exam Papers</span>
            </Link>
          </div>
        </section>

      </div>
    </div>
  );
}
