'use client';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { ArrowRight, BookOpen, Trophy, Zap, Globe, CheckCircle, Star } from 'lucide-react';
import { EXAMS } from '@/lib/mockData';

export default function HomePage() {
  const { user } = useAppStore();

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
          <Zap size={13} /> Free Mock Tests · English & Kannada
        </div>
        <h1 style={{ fontSize: 'clamp(36px, 6vw, 64px)', fontWeight: 800, lineHeight: 1.1, marginBottom: '20px' }}>
          Crack Your <span className="gradient-text">Dream Exam</span><br />with AI-Powered Practice
        </h1>
        <p style={{ fontSize: '18px', color: 'var(--text-secondary)', maxWidth: '560px', margin: '0 auto 40px', lineHeight: 1.7 }}>
          Comprehensive mock tests for UPSC, Karnataka state exams. Subject-wise practice, full mocks, gamified learning — in English & Kannada.
        </p>
        <div style={{ display: 'flex', gap: '12px', justifyContent: 'center', flexWrap: 'wrap' }}>
          <Link href="/exams" className="btn btn-primary" style={{ padding: '14px 28px', fontSize: '15px' }}>
            Browse Exams <ArrowRight size={16} />
          </Link>
          {!user && (
            <Link href="/register" className="btn btn-secondary" style={{ padding: '14px 28px', fontSize: '15px' }}>
              Start Free →
            </Link>
          )}
        </div>
      </section>

      {/* Stats */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(160px, 1fr))', gap: '16px', marginBottom: '64px' }}>
        {[
          { num: '8+', label: 'Exams Covered', icon: '📋' },
          { num: '27+', label: 'Questions', icon: '❓' },
          { num: '3', label: 'Languages', icon: '🌐' },
          { num: '100%', label: 'Free Access', icon: '🎁' },
        ].map((s) => (
          <div key={s.label} className="card" style={{ padding: '20px', textAlign: 'center' }}>
            <div style={{ fontSize: '28px', marginBottom: '8px' }}>{s.icon}</div>
            <div style={{ fontSize: '28px', fontWeight: 800, color: 'var(--text-primary)' }}>{s.num}</div>
            <div style={{ fontSize: '13px', color: 'var(--text-muted)' }}>{s.label}</div>
          </div>
        ))}
      </div>

      {/* Exam Tiles */}
      <section style={{ marginBottom: '64px' }}>
        <h2 style={{ fontSize: '26px', fontWeight: 700, marginBottom: '8px' }}>Featured Exams</h2>
        <p style={{ color: 'var(--text-muted)', marginBottom: '24px' }}>UPSC and Karnataka state exams — practice in your language</p>
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
        <h2 style={{ fontSize: '26px', fontWeight: 700, marginBottom: '24px' }}>Why UPSC AI?</h2>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(260px, 1fr))', gap: '16px' }}>
          {[
            { icon: '🎯', title: 'Subject-Wise Practice', desc: 'Focus on weak areas. Filter by subject and difficulty — Easy, Medium, Hard.' },
            { icon: '📋', title: 'Full Mock Tests', desc: 'Simulated exams with realistic question distribution and negative marking.' },
            { icon: '🔥', title: 'Gamified Learning', desc: 'Earn XP, level up, maintain streaks, unlock badges.' },
            { icon: '🌐', title: 'Multilingual', desc: 'Tests and solutions in English, Hindi, and Kannada.' },
            { icon: '📊', title: 'Detailed Analytics', desc: 'Subject-wise accuracy, difficulty-wise breakdown, score trends.' },
            { icon: '📖', title: 'Full Explanations', desc: 'Every question has a detailed explanation. Review wrong answers instantly.' },
          ].map((f) => (
            <div key={f.title} className="card" style={{ padding: '20px' }}>
              <div style={{ fontSize: '28px', marginBottom: '10px' }}>{f.icon}</div>
              <div style={{ fontWeight: 600, marginBottom: '6px' }}>{f.title}</div>
              <div style={{ fontSize: '13px', color: 'var(--text-muted)', lineHeight: 1.5 }}>{f.desc}</div>
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
          <h2 style={{ fontSize: '28px', fontWeight: 700, marginBottom: '12px' }}>Ready to start your journey?</h2>
          <p style={{ color: 'var(--text-muted)', marginBottom: '24px' }}>Join thousands of aspirants preparing smarter with UPSC AI.</p>
          <Link href="/register" className="btn btn-primary" style={{ padding: '14px 32px', fontSize: '16px' }}>
            Create Free Account <ArrowRight size={16} />
          </Link>
        </section>
      )}
    </div>
  );
}
