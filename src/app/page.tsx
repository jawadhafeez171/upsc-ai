'use client';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { ArrowRight, BookOpen, Trophy, Zap, Globe, CheckCircle, Star } from 'lucide-react';
import { EXAMS } from '@/lib/mockData';
import { t } from '@/lib/i18n';
import { Language } from '@/types';

export default function HomePage() {
  const { user, language } = useAppStore();
  const lang = language as Language;

  return (
    <div style={{ maxWidth: '1200px', margin: '0 auto', padding: '0 24px' }}>
      {/* Hero */}
      <section style={{ textAlign: 'center', padding: '80px 0 60px' }} className="fade-in">
        <div style={{
          display: 'inline-flex', alignItems: 'center', gap: '6px',
          background: 'rgba(99, 102, 241, 0.1)', border: '1px solid rgba(99, 102, 241, 0.3)',
          borderRadius: '20px', padding: '6px 14px', fontSize: '13px', color: 'var(--accent-indigo)',
          marginBottom: '28px', fontWeight: 500,
        }}>
          <Zap size={13} /> {t('heroBadge', lang)}
        </div>
        <h1 style={{ fontSize: 'clamp(36px, 6vw, 64px)', fontWeight: 800, lineHeight: 1.1, marginBottom: '20px' }}>
          {t('heroTitlePart1', lang)} <span className="gradient-text">{t('heroTitlePart2', lang)}</span><br />{t('heroTitlePart3', lang)}
        </h1>
        <p style={{ fontSize: '18px', color: 'var(--text-secondary)', maxWidth: '560px', margin: '0 auto 40px', lineHeight: 1.7 }}>
          {t('heroDesc', lang)}
        </p>
        <div style={{ display: 'flex', gap: '12px', justifyContent: 'center', flexWrap: 'wrap' }}>
          <Link href="/exams" className="btn btn-primary" style={{ padding: '14px 28px', fontSize: '15px' }}>
            {t('browseExams', lang)} <ArrowRight size={16} />
          </Link>
          {!user && (
            <Link href="/register" className="btn btn-secondary" style={{ padding: '14px 28px', fontSize: '15px' }}>
              {t('startFree', lang)} →
            </Link>
          )}
        </div>
      </section>

      {/* Stats */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(160px, 1fr))', gap: '16px', marginBottom: '64px' }}>
        {[
          { num: '8+', labelKey: 'examsCovered', icon: '📋' },
          { num: '27+', labelKey: 'totalQuestions', icon: '❓' },
          { num: '3', labelKey: 'languages', icon: '🌐' },
          { num: '100%', labelKey: 'freeAccess', icon: '🎁' },
        ].map((s) => (
          <div key={s.labelKey} className="card" style={{ padding: '20px', textAlign: 'center' }}>
            <div style={{ fontSize: '28px', marginBottom: '8px' }}>{s.icon}</div>
            <div style={{ fontSize: '28px', fontWeight: 800, color: 'var(--text-primary)' }}>{s.num}</div>
            <div style={{ fontSize: '13px', color: 'var(--text-muted)' }}>{t(s.labelKey, lang)}</div>
          </div>
        ))}
      </div>

      {/* Exam Tiles */}
      <section style={{ marginBottom: '64px' }}>
        <h2 style={{ fontSize: '26px', fontWeight: 700, marginBottom: '8px' }}>{t('featuredExams', lang)}</h2>
        <p style={{ color: 'var(--text-muted)', marginBottom: '24px' }}>{t('featuredDesc', lang)}</p>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(240px, 1fr))', gap: '16px' }}>
          {EXAMS.map((exam) => (
            <Link key={exam.id} href={`/exams/${exam.id}`} style={{ textDecoration: 'none' }}>
              <div className="card" style={{ padding: '20px', cursor: 'pointer', position: 'relative', overflow: 'hidden' }}>
                <div style={{ position: 'absolute', inset: 0, opacity: 0.04, background: exam.color }} />
                <div style={{ fontSize: '28px', marginBottom: '10px' }}>{exam.icon}</div>
                <div style={{ fontWeight: 700, fontSize: '16px', marginBottom: '4px' }}>{exam.name}</div>
                <div style={{ fontSize: '12px', color: 'var(--text-muted)', marginBottom: '12px', lineHeight: 1.4 }}>{exam.description}</div>
                <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                  <span className="tag" style={{ background: 'var(--border)', color: 'var(--text-secondary)' }}>
                    {exam.category === 'upsc' ? '🏛️ UPSC' : '🅺 Karnataka'}
                  </span>
                  {exam.languages.includes('kn') && (
                    <span className="tag" style={{ background: 'rgba(6, 182, 212, 0.1)', color: 'var(--accent-cyan)', border: '1px solid rgba(6, 182, 212, 0.2)' }}>
                      ಕನ್ನಡ
                    </span>
                  )}
                </div>
              </div>
            </Link>
          ))}
        </div>
      </section>

      {/* Features */}
      <section style={{ marginBottom: '64px' }}>
        <h2 style={{ fontSize: '26px', fontWeight: 700, marginBottom: '24px' }}>{t('whyUpsc', lang)}</h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(260px, 1fr))', gap: '16px' }}>
          {[
            { icon: '🎯', titleKey: 'subjectWisePractice', descKey: 'subjectWiseDesc' },
            { icon: '📋', titleKey: 'fullMock', descKey: 'fullMockDesc' },
            { icon: '🔥', titleKey: 'gamifiedLearning', descKey: 'gamifiedDesc' },
            { icon: '🌐', titleKey: 'multilingual', descKey: 'multilingualDesc' },
            { icon: '📊', titleKey: 'detailedAnalytics', descKey: 'analyticsDesc' },
            { icon: '📖', titleKey: 'fullExplanations', descKey: 'explanationsDesc' },
          ].map((f) => (
            <div key={f.titleKey} className="card" style={{ padding: '20px' }}>
              <div style={{ fontSize: '28px', marginBottom: '10px' }}>{f.icon}</div>
              <div style={{ fontWeight: 600, marginBottom: '6px' }}>{t(f.titleKey, lang)}</div>
              <div style={{ fontSize: '13px', color: 'var(--text-muted)', lineHeight: 1.5 }}>{t(f.descKey, lang)}</div>
            </div>
          ))}
        </div>
      </section>

      {/* CTA */}
      {!user && (
        <section style={{
          textAlign: 'center', padding: '48px', borderRadius: '20px', marginBottom: '64px',
          background: 'linear-gradient(135deg, rgba(99,102,241,0.15), rgba(139,92,246,0.15))',
          border: '1px solid rgba(99,102,241,0.2)',
        }}>
          <div style={{ fontSize: '36px', marginBottom: '12px' }}>🚀</div>
          <h2 style={{ fontSize: '28px', fontWeight: 700, marginBottom: '12px' }}>{t('readyStart', lang)}</h2>
          <p style={{ color: 'var(--text-muted)', marginBottom: '24px' }}>{t('readyDesc', lang)}</p>
          <Link href="/register" className="btn btn-primary" style={{ padding: '14px 32px', fontSize: '16px' }}>
            {t('createFreeAccount', lang)} <ArrowRight size={16} />
          </Link>
        </section>
      )}
    </div>
  );
}
