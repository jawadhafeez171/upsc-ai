'use client';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { ArrowRight, BookOpen, Trophy, Globe, Sparkles, Users, CheckCircle } from 'lucide-react';
import { EXAMS } from '@/lib/mockData';
import { t } from '@/lib/i18n';
import { Language } from '@/types';

export default function HomePage() {
  const { user, language } = useAppStore();
  const lang = language as Language;

  return (
    <div style={{ background: 'var(--bg-primary)' }}>
      <div style={{ maxWidth: '1080px', margin: '0 auto', padding: '0 24px' }}>
        
        {/* Hero Section */}
        <section style={{ padding: '80px 0 64px', textAlign: 'center' }}>
          
          {/* Centered Copy */}
          <div style={{ maxWidth: '680px', margin: '0 auto' }} className="fade-in-up">
            <div style={{
              display: 'inline-flex', alignItems: 'center', gap: '6px',
              background: 'var(--accent-peach)', borderRadius: '6px',
              padding: '5px 12px', fontSize: '12px', fontWeight: 600,
              color: '#8B4513', marginBottom: '20px'
            }}>
              ✨ Practice Smart. Achieve More.
            </div>
            <h1 style={{ fontSize: 'clamp(34px, 5vw, 48px)', fontWeight: 800, lineHeight: 1.15, color: 'var(--text-primary)', marginBottom: '20px', letterSpacing: '-0.5px' }}>
              {t('heroTitlePart1', lang)}{' '}
              <span style={{ color: 'var(--brand-orange)' }}>{t('heroTitlePart2', lang)}</span>{' '}
              {t('heroTitlePart3', lang)}
            </h1>
            <p style={{ fontSize: '16.5px', color: 'var(--text-secondary)', marginBottom: '32px', lineHeight: 1.7, maxWidth: '580px', margin: '0 auto 32px' }}>
              {t('heroDesc', lang)}
            </p>
            <div style={{ display: 'flex', gap: '12px', justifyContent: 'center', flexWrap: 'wrap' }}>
              <Link href="/exams" className="btn btn-primary" style={{ padding: '12px 28px', fontSize: '15px' }}>
                {t('browseExams', lang)} <ArrowRight size={16} />
              </Link>
              {!user && (
                <Link href="/register" className="btn btn-secondary" style={{ padding: '12px 28px', fontSize: '15px' }}>
                  {t('startFree', lang)}
                </Link>
              )}
            </div>

            {/* Social proof */}
            <div style={{ display: 'flex', gap: '24px', justifyContent: 'center', marginTop: '40px', flexWrap: 'wrap' }}>
              {[
                { emoji: '📝', label: '8+ Exam formats' },
                { emoji: '🌍', label: '3 Languages' },
                { emoji: '⚡', label: 'Instant results' },
              ].map((item) => (
                <div key={item.label} style={{ display: 'flex', alignItems: 'center', gap: '6px', fontSize: '13.5px', color: 'var(--text-secondary)', fontWeight: 500 }}>
                  <span>{item.emoji}</span> {item.label}
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Stats Row */}
        <section style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))', gap: '16px', padding: '40px 0', borderTop: '1px solid var(--border)', borderBottom: '1px solid var(--border)', marginBottom: '64px' }}>
          {[
            { num: '8+', label: t('examsCovered', lang) || 'Exam Formats', emoji: '📋' },
            { num: '27+', label: t('totalQuestions', lang) || 'Practice Questions', emoji: '❓' },
            { num: '3', label: t('languages', lang) || 'Study Languages', emoji: '🌐' },
            { num: '100%', label: t('freeAccess', lang) || 'Aspirants Served', emoji: '🎯' },
          ].map((s) => (
            <div key={s.label} style={{ textAlign: 'center', padding: '12px' }}>
              <div style={{ fontSize: '14px', marginBottom: '4px' }}>{s.emoji}</div>
              <div style={{ fontSize: '28px', fontWeight: 800, color: 'var(--text-primary)', letterSpacing: '-0.5px' }}>{s.num}</div>
              <div style={{ fontSize: '13px', color: 'var(--text-secondary)', fontWeight: 500, marginTop: '2px' }}>{s.label}</div>
            </div>
          ))}
        </section>

        {/* Why MockIQ */}
        <section style={{ marginBottom: '64px' }}>
          <div style={{ textAlign: 'center', marginBottom: '36px' }}>
            <h2 style={{ fontSize: '28px', fontWeight: 800, marginBottom: '8px' }}>Why aspirants love MockIQ</h2>
            <p style={{ color: 'var(--text-secondary)', fontSize: '15px', maxWidth: '480px', margin: '0 auto' }}>Everything you need for structured exam preparation, in one cozy workspace.</p>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(280px, 1fr))', gap: '16px' }}>
            {[
              { emoji: '🎯', title: 'Subject-Wise Focus', desc: 'Isolate individual chapters to practice targeted concepts. Go deep on what matters.', chip: 'chip-peach' },
              { emoji: '🏆', title: 'Live Leaderboard', desc: 'See how you rank against other aspirants. Healthy competition drives better results.', chip: 'chip-sage' },
              { emoji: '🌍', title: 'Multilingual', desc: 'Study in English, Hindi, or Kannada. Switch languages mid-session if you prefer.', chip: 'chip-sky' },
              { emoji: '📊', title: 'Deep Analytics', desc: 'Subject-wise breakdown after every test. Know exactly where to improve.', chip: 'chip-lavender' },
              { emoji: '🔄', title: 'Retry Weak Areas', desc: 'After results, retry only the questions you got wrong. Efficient revision.', chip: 'chip-peach' },
              { emoji: '⚡', title: 'Instant Feedback', desc: 'Get detailed explanations for every question right after submission.', chip: 'chip-sage' },
            ].map((feature) => (
              <div key={feature.title} className="card" style={{ padding: '24px' }}>
                <div style={{ fontSize: '28px', marginBottom: '12px' }}>{feature.emoji}</div>
                <h3 style={{ fontSize: '16px', fontWeight: 700, marginBottom: '6px', color: 'var(--text-primary)' }}>{feature.title}</h3>
                <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.5 }}>{feature.desc}</p>
              </div>
            ))}
          </div>
        </section>

        {/* Featured Exams */}
        <section style={{ marginBottom: '64px' }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-end', marginBottom: '24px' }}>
            <div>
              <h2 style={{ fontSize: '24px', fontWeight: 800 }}>{t('featuredExams', lang)}</h2>
              <p style={{ color: 'var(--text-secondary)', fontSize: '14px', marginTop: '4px' }}>{t('featuredDesc', lang)}</p>
            </div>
            <Link href="/exams" style={{ fontSize: '14px', fontWeight: 600, color: 'var(--brand-orange)', textDecoration: 'none' }}>
              View all →
            </Link>
          </div>

          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(260px, 1fr))', gap: '16px' }}>
            {EXAMS.map((exam) => (
              <Link key={exam.id} href={`/exams/${exam.id}`} style={{ textDecoration: 'none' }}>
                <div className="card hover-lift" style={{ padding: '20px', cursor: 'pointer', display: 'flex', flexDirection: 'column', height: '100%' }}>
                  <div style={{ fontSize: '28px', marginBottom: '10px' }}>{exam.icon}</div>
                  <h3 style={{ fontWeight: 700, fontSize: '15px', marginBottom: '6px', color: 'var(--text-primary)' }}>
                    {lang === 'kn' && exam.name_kn ? exam.name_kn : exam.name}
                  </h3>
                  <p style={{ fontSize: '13px', color: 'var(--text-secondary)', marginBottom: '14px', lineHeight: 1.45, flexGrow: 1 }}>
                    {lang === 'kn' && exam.description_kn ? exam.description_kn : exam.description}
                  </p>
                  <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap', paddingTop: '12px', borderTop: '1px solid var(--border)', marginTop: 'auto' }}>
                    <span className={`tag ${exam.category === 'upsc' ? 'chip-peach' : 'chip-sage'}`}>
                      {exam.category === 'upsc' ? '🏛️ UPSC' : '🅺 Karnataka'}
                    </span>
                    {exam.languages.includes('kn') && (
                      <span className="tag chip-sky">ಕನ್ನಡ</span>
                    )}
                  </div>
                </div>
              </Link>
            ))}
          </div>
        </section>

        {/* CTA */}
        {!user && (
          <section style={{
            textAlign: 'center', padding: '48px 32px', borderRadius: '16px', marginBottom: '64px',
            background: 'var(--bg-secondary)', position: 'relative'
          }}>
            <div style={{ fontSize: '40px', marginBottom: '12px' }}>🚀</div>
            <h2 style={{ fontSize: '26px', fontWeight: 800, marginBottom: '8px', color: 'var(--text-primary)' }}>{t('readyStart', lang)}</h2>
            <p style={{ color: 'var(--text-secondary)', marginBottom: '24px', maxWidth: '420px', margin: '0 auto 24px', fontSize: '15px', lineHeight: 1.5 }}>
              {t('readyDesc', lang)}
            </p>
            <Link href="/register" className="btn btn-primary" style={{ padding: '12px 32px', fontSize: '15px' }}>
              {t('createFreeAccount', lang)} <ArrowRight size={16} />
            </Link>
          </section>
        )}
      </div>
    </div>
  );
}
