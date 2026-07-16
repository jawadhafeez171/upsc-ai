'use client';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { ArrowRight, Zap, BarChart2, Globe, RotateCcw, Target, Trophy } from 'lucide-react';
import { EXAMS } from '@/lib/mockData';
import { t } from '@/lib/i18n';
import { Language } from '@/types';
import { useTheme } from '@/components/layout/ThemeProvider';

const FEATURES = [
  { emoji: '🎯', icon: Target, title: 'Subject-Wise Focus', desc: 'Drill into individual chapters. Practice targeted concepts and go deep on what matters most.', chip: 'chip-peach' },
  { emoji: '🏆', icon: Trophy, title: 'Live Leaderboard', desc: 'See how you rank against other aspirants. Healthy competition drives better results.', chip: 'chip-sage' },
  { emoji: '🌍', icon: Globe, title: 'Multilingual', desc: 'Study in English, Hindi, or Kannada. Switch languages mid-session for flexibility.', chip: 'chip-sky' },
  { emoji: '📊', icon: BarChart2, title: 'Deep Analytics', desc: 'Subject-wise breakdown after every test. Know exactly where you need to improve.', chip: 'chip-lavender' },
  { emoji: '🔄', icon: RotateCcw, title: 'Retry Weak Areas', desc: 'After results, retry only the questions you got wrong. Maximum revision efficiency.', chip: 'chip-peach' },
  { emoji: '⚡', icon: Zap, title: 'Instant Feedback', desc: 'Detailed explanations for every question right after submission. No waiting.', chip: 'chip-sage' },
];

const STATS = [
  { num: '8+', label: 'Exam Formats', emoji: '📋' },
  { num: '1000+', label: 'Practice Questions', emoji: '❓' },
  { num: '3', label: 'Study Languages', emoji: '🌐' },
  { num: '100%', label: 'Free to Use', emoji: '🎯' },
];

export default function HomePage() {
  const { user, language } = useAppStore();
  const lang = language as Language;
  const { theme } = useTheme();

  return (
    <div style={{ background: 'var(--bg-primary)' }}>

      {/* ── HERO ── */}
      <section style={{ position: 'relative', overflow: 'hidden', padding: '100px 0 80px', minHeight: '80vh', display: 'flex', alignItems: 'center' }}>
        {/* Glow blobs */}
        <div className="hero-glow-1" />
        <div className="hero-glow-2" />
        {/* Subtle grid overlay */}
        <div style={{
          position: 'absolute', inset: 0, pointerEvents: 'none',
          backgroundImage: theme === 'dark'
            ? 'radial-gradient(circle at 1px 1px, rgba(255,255,255,0.03) 1px, transparent 0)'
            : 'radial-gradient(circle at 1px 1px, rgba(0,0,0,0.04) 1px, transparent 0)',
          backgroundSize: '32px 32px',
        }} />

        <div style={{ maxWidth: '1080px', margin: '0 auto', padding: '0 24px', width: '100%', position: 'relative', zIndex: 1 }}>
          <div style={{ maxWidth: '720px', margin: '0 auto', textAlign: 'center' }}>
            {/* Badge */}
            <div className="fade-in-up" style={{
              display: 'inline-flex', alignItems: 'center', gap: '8px',
              background: 'rgba(242, 107, 29, 0.1)', border: '1px solid rgba(242, 107, 29, 0.25)',
              borderRadius: '999px', padding: '6px 16px', fontSize: '12px', fontWeight: 600,
              color: 'var(--brand-orange)', marginBottom: '28px', backdropFilter: 'blur(8px)',
            }}>
              <span style={{ width: 6, height: 6, borderRadius: '50%', background: 'var(--brand-orange)', display: 'inline-block', boxShadow: '0 0 8px var(--brand-orange)' }} />
              Practice Smart. Achieve More.
            </div>

            {/* Headline */}
            <h1 className="fade-in-up-d1" style={{
              fontSize: 'clamp(38px, 6vw, 64px)', fontWeight: 900, lineHeight: 1.08,
              letterSpacing: '-1.5px', marginBottom: '24px', color: 'var(--text-primary)',
            }}>
              {t('heroTitlePart1', lang)}{' '}
              <span className="gradient-text">{t('heroTitlePart2', lang)}</span>{' '}
              {t('heroTitlePart3', lang)}
            </h1>

            {/* Description */}
            <p className="fade-in-up-d2" style={{
              fontSize: '17px', color: 'var(--text-secondary)', marginBottom: '40px',
              lineHeight: 1.75, maxWidth: '560px', margin: '0 auto 40px',
            }}>
              {t('heroDesc', lang)}
            </p>

            {/* CTAs */}
            <div className="fade-in-up-d3" style={{ display: 'flex', gap: '12px', justifyContent: 'center', flexWrap: 'wrap' }}>
              <Link href="/exams" className="btn btn-primary btn-lg">
                {t('browseExams', lang)} <ArrowRight size={18} />
              </Link>
              {!user && (
                <Link href="/register" className="btn btn-secondary btn-lg">
                  {t('startFree', lang)}
                </Link>
              )}
            </div>

            {/* Social proof chips */}
            <div className="fade-in-up-d4" style={{ display: 'flex', gap: '20px', justifyContent: 'center', marginTop: '48px', flexWrap: 'wrap' }}>
              {[
                { emoji: '📝', label: '8+ Exam formats' },
                { emoji: '🌍', label: '3 Languages' },
                { emoji: '⚡', label: 'Instant results' },
              ].map((item) => (
                <div key={item.label} style={{ display: 'flex', alignItems: 'center', gap: '6px', fontSize: '13px', color: 'var(--text-muted)', fontWeight: 500 }}>
                  <span>{item.emoji}</span> {item.label}
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      <div style={{ maxWidth: '1080px', margin: '0 auto', padding: '0 24px' }}>

        {/* ── STATS ROW ── */}
        <section style={{ marginBottom: '80px' }}>
          <div style={{
            display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(180px, 1fr))', gap: '12px',
          }}>
            {STATS.map((s, i) => (
              <div key={s.label} className={`stat-card fade-in-up-d${Math.min(i + 1, 4)}`}>
                <div style={{ fontSize: '20px', marginBottom: '8px' }}>{s.emoji}</div>
                <div style={{ fontSize: '36px', fontWeight: 900, letterSpacing: '-1px', background: 'linear-gradient(135deg, var(--brand-orange), var(--brand-gold))', WebkitBackgroundClip: 'text', WebkitTextFillColor: 'transparent', backgroundClip: 'text' }}>{s.num}</div>
                <div style={{ fontSize: '13px', color: 'var(--text-secondary)', fontWeight: 500, marginTop: '4px' }}>{s.label}</div>
              </div>
            ))}
          </div>
        </section>

        {/* ── WHY MOCKIQ ── */}
        <section style={{ marginBottom: '80px' }}>
          <div style={{ textAlign: 'center', marginBottom: '48px' }}>
            <div style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', fontSize: '12px', fontWeight: 600, color: 'var(--brand-teal)', background: 'rgba(26, 190, 170, 0.1)', border: '1px solid rgba(26,190,170,0.2)', borderRadius: '999px', padding: '5px 14px', marginBottom: '16px' }}>
              WHY MOCKIQ
            </div>
            <h2 style={{ fontSize: 'clamp(24px, 3.5vw, 36px)', fontWeight: 800, marginBottom: '12px', letterSpacing: '-0.5px' }}>
              Built for serious aspirants
            </h2>
            <p style={{ color: 'var(--text-secondary)', fontSize: '15px', maxWidth: '480px', margin: '0 auto', lineHeight: 1.7 }}>
              Everything you need for structured, high-quality exam preparation — in one focused platform.
            </p>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', gap: '16px' }}>
            {FEATURES.map((feature, i) => (
              <div key={feature.title} className={`card fade-in-up-d${Math.min(i % 3 + 1, 4)}`} style={{ padding: '28px' }}>
                <div style={{
                  width: 48, height: 48, borderRadius: '12px', display: 'flex', alignItems: 'center', justifyContent: 'center',
                  fontSize: '22px', marginBottom: '16px',
                  background: feature.chip === 'chip-peach' ? 'rgba(242,107,29,0.1)' :
                    feature.chip === 'chip-sage' ? 'rgba(26,190,170,0.1)' :
                    feature.chip === 'chip-sky' ? 'rgba(59,130,246,0.1)' : 'rgba(139,92,246,0.1)',
                }}>
                  {feature.emoji}
                </div>
                <h3 style={{ fontSize: '16px', fontWeight: 700, marginBottom: '8px' }}>{feature.title}</h3>
                <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.6 }}>{feature.desc}</p>
              </div>
            ))}
          </div>
        </section>

        {/* ── FEATURED EXAMS ── */}
        <section style={{ marginBottom: '80px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end', marginBottom: '32px', flexWrap: 'wrap', gap: '12px' }}>
            <div>
              <div style={{ display: 'inline-flex', alignItems: 'center', gap: '8px', fontSize: '12px', fontWeight: 600, color: 'var(--brand-orange)', background: 'rgba(242, 107, 29, 0.1)', border: '1px solid rgba(242, 107, 29, 0.2)', borderRadius: '999px', padding: '5px 14px', marginBottom: '12px' }}>
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

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(260px, 1fr))', gap: '16px' }}>
            {EXAMS.map((exam) => (
              <Link key={exam.id} href={`/exams/${exam.id}`} style={{ textDecoration: 'none' }}>
                <div className="exam-card" style={{ borderTop: `2px solid ${exam.color}` }}>
                  {/* Subtle gradient header */}
                  <div style={{
                    position: 'absolute', top: 0, left: 0, right: 0, height: '60px',
                    background: `linear-gradient(180deg, ${exam.color}14 0%, transparent 100%)`,
                    pointerEvents: 'none',
                  }} />
                  <div className="exam-icon-wrapper" style={{ background: `${exam.color}15`, border: `1px solid ${exam.color}30` }}>
                    {exam.icon}
                  </div>
                  <h3 style={{ fontWeight: 700, fontSize: '15px', marginBottom: '6px' }}>
                    {lang === 'kn' && exam.name_kn ? exam.name_kn : exam.name}
                  </h3>
                  <p style={{ fontSize: '13px', color: 'var(--text-secondary)', marginBottom: '16px', lineHeight: 1.5, flexGrow: 1 }}>
                    {lang === 'kn' && exam.description_kn ? exam.description_kn : exam.description}
                  </p>
                  <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap', paddingTop: '14px', borderTop: '1px solid var(--border)', marginTop: 'auto', justifyContent: 'space-between', alignItems: 'center' }}>
                    <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                      <span className={`tag ${exam.category === 'upsc' ? 'chip-peach' : 'chip-sage'}`}>
                        {exam.category === 'upsc' ? '🏛️ UPSC' : '🅺 Karnataka'}
                      </span>
                      {exam.languages.includes('kn') && (
                        <span className="tag chip-sky">ಕನ್ನಡ</span>
                      )}
                    </div>
                    <span style={{ color: 'var(--brand-orange)', fontSize: '12px', fontWeight: 600 }}>Start →</span>
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </section>

        {/* ── CTA BANNER ── */}
        {!user && (
          <section style={{ marginBottom: '80px' }}>
            <div style={{
              position: 'relative', overflow: 'hidden',
              padding: '60px 40px', borderRadius: '24px', textAlign: 'center',
              background: 'linear-gradient(135deg, rgba(242,107,29,0.12) 0%, rgba(26,190,170,0.06) 100%)',
              border: '1px solid rgba(242, 107, 29, 0.2)',
            }}>
              {/* Inner glow */}
              <div style={{
                position: 'absolute', top: '-40px', left: '50%', transform: 'translateX(-50%)',
                width: '300px', height: '300px', borderRadius: '50%',
                background: 'radial-gradient(circle, rgba(242,107,29,0.15) 0%, transparent 70%)',
                pointerEvents: 'none',
              }} />
              <div style={{ position: 'relative', zIndex: 1 }}>
                <div style={{ fontSize: '48px', marginBottom: '16px' }}>🚀</div>
                <h2 style={{ fontSize: 'clamp(22px, 3.5vw, 34px)', fontWeight: 800, marginBottom: '12px', letterSpacing: '-0.5px' }}>
                  {t('readyStart', lang)}
                </h2>
                <p style={{ color: 'var(--text-secondary)', marginBottom: '32px', maxWidth: '440px', margin: '0 auto 32px', fontSize: '15px', lineHeight: 1.7 }}>
                  {t('readyDesc', lang)}
                </p>
                <Link href="/register" className="btn btn-primary btn-lg">
                  {t('createFreeAccount', lang)} <ArrowRight size={18} />
                </Link>
              </div>
            </div>
          </section>
        )}

      </div>
    </div>
  );
}
