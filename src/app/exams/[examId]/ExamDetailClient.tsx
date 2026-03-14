'use client';
import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useAppStore } from '@/lib/store';
import { TestConfig, Language } from '@/types';
import { ArrowRight } from 'lucide-react';
import { supabase } from '@/lib/supabase';

const QUESTION_COUNTS = [10, 25, 50, 100];
const DIFFICULTIES = ['mixed', 'easy', 'medium', 'hard'] as const;

export default function ExamDetailClient({ 
    examId, 
    initialExam 
}: { 
    examId: string; 
    initialExam: any 
}) {
    const router = useRouter();
    const { user, language, setActiveSession } = useAppStore();
    const [exam] = useState<any>(initialExam);
    const [availableQs, setAvailableQs] = useState(0);

    const [mode, setMode] = useState<'subject' | 'full'>('full');
    const [subject, setSubject] = useState('');
    const [difficulty, setDifficulty] = useState<'mixed' | 'easy' | 'medium' | 'hard'>('mixed');
    const [count, setCount] = useState(25);
    const [customCount, setCustomCount] = useState('');
    const [testLang, setTestLang] = useState<Language>(language);

    useEffect(() => {
        async function loadQuestionCount() {
            let query = supabase.from('questions').select('id', { count: 'exact', head: true }).eq('exam_id', examId);
            if (mode === 'subject' && subject) query = query.eq('subject', subject);
            if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);

            const { count: qCount } = await query;
            setAvailableQs(qCount || 0);
        }
        loadQuestionCount();
    }, [examId, mode, subject, difficulty]);

    const finalCount = Math.min(Number(customCount) || count, availableQs);

    const handleStart = () => {
        if (!user) { router.push('/login'); return; }
        if (finalCount === 0) return;

        const config: TestConfig = { exam_id: examId, mode, subject: mode === 'subject' ? subject : undefined, difficulty, question_count: finalCount, language: testLang };

        const sessionId = `session_${Date.now()}`;
        setActiveSession({
            id: sessionId,
            user_id: user.id,
            exam_id: examId,
            config,
            questions: [], 
            answers: {},
            started_at: new Date().toISOString(),
            status: 'active',
        });
        router.push(`/test/${sessionId}`);
    };

    return (
        <div style={{ maxWidth: '800px', margin: '0 auto', padding: '32px 24px' }}>
            {/* Exam header */}
            <div className="card" style={{ padding: '28px', marginBottom: '24px', position: 'relative', overflow: 'hidden' }}>
                <div style={{ position: 'absolute', inset: 0, background: 'var(--accent-indigo)', opacity: 0.04 }} />
                <div style={{ position: 'relative' }}>
                    <div style={{ fontSize: '48px', marginBottom: '12px' }}>{exam.id.includes('upsc') ? '🏛️' : exam.id.includes('kpsc') ? '🅺' : '📋'}</div>
                    <h1 style={{ fontSize: '28px', fontWeight: 800, marginBottom: '6px' }}>{exam.title}</h1>
                    <p style={{ color: 'var(--text-muted)', marginBottom: '16px' }}>{exam.description}</p>
                    <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                        {(exam.topics || []).map((s: string) => (
                            <span key={s} className="tag" style={{ background: 'var(--border)', color: 'var(--text-secondary)' }}>{s}</span>
                        ))}
                    </div>
                </div>
            </div>

            {/* Config */}
            <div className="card" style={{ padding: '28px' }}>
                <h2 style={{ fontWeight: 700, fontSize: '18px', marginBottom: '24px' }}>Configure Your Test</h2>

                {/* Test mode */}
                <div style={{ marginBottom: '24px' }}>
                    <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>Test Mode</div>
                    <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '10px' }}>
                        {([['full', '📋 Full Mock Test', 'Random questions from all subjects'], ['subject', '🎯 Subject-wise', 'Focus on one subject']] as const).map(([m, label, desc]) => (
                            <button key={m} onClick={() => setMode(m)} style={{
                                padding: '14px', borderRadius: '10px', border: `2px solid ${mode === m ? 'var(--accent-indigo)' : 'var(--border)'}`,
                                background: mode === m ? 'rgba(99,102,241,0.1)' : 'transparent',
                                cursor: 'pointer', textAlign: 'left', transition: 'all 0.2s',
                            }}>
                                <div style={{ fontWeight: 600, color: 'var(--text-primary)', marginBottom: '4px' }}>{label}</div>
                                <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>{desc}</div>
                            </button>
                        ))}
                    </div>
                </div>

                {/* Subject selector (subject mode only) */}
                {mode === 'subject' && (
                    <div style={{ marginBottom: '24px' }}>
                        <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>Select Subject</div>
                        <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                            {(exam.topics || []).map((s: string) => (
                                <button key={s} onClick={() => setSubject(s)} style={{
                                    padding: '8px 14px', borderRadius: '8px', border: `2px solid ${subject === s ? 'var(--accent-indigo)' : 'var(--border)'}`,
                                    background: subject === s ? 'rgba(99,102,241,0.1)' : 'transparent',
                                    cursor: 'pointer', color: 'var(--text-primary)', fontWeight: 500, fontSize: '13px', transition: 'all 0.2s',
                                }}>{s}</button>
                            ))}
                        </div>
                    </div>
                )}

                {/* Difficulty */}
                <div style={{ marginBottom: '24px' }}>
                    <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>Difficulty</div>
                    <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                        {DIFFICULTIES.map((d) => {
                            return (
                                <button key={d} onClick={() => setDifficulty(d)} style={{
                                    padding: '8px 16px', borderRadius: '8px', cursor: 'pointer', fontWeight: 600, fontSize: '13px',
                                    border: difficulty === d ? '2px solid var(--accent-indigo)' : '2px solid transparent',
                                    background: difficulty === d ? 'rgba(99,102,241,0.1)' : 'var(--bg-secondary)',
                                    color: 'var(--text-primary)', textTransform: 'capitalize', transition: 'all 0.2s',
                                }}>{d === 'mixed' ? '🎲 Mixed' : d === 'easy' ? '🟢 Easy' : d === 'medium' ? '🟡 Medium' : '🔴 Hard'}</button>
                            );
                        })}
                    </div>
                </div>

                {/* Question count */}
                <div style={{ marginBottom: '24px' }}>
                    <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>
                        Number of Questions <span style={{ color: 'var(--text-muted)', fontWeight: 400 }}>({availableQs} available)</span>
                    </div>
                    <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap', marginBottom: '10px' }}>
                        {QUESTION_COUNTS.map((c) => (
                            <button key={c} onClick={() => { setCount(c); setCustomCount(''); }} style={{
                                padding: '8px 16px', borderRadius: '8px', cursor: 'pointer', fontWeight: 600, fontSize: '13px',
                                border: count === c && !customCount ? '2px solid var(--accent-indigo)' : '2px solid var(--border)',
                                background: count === c && !customCount ? 'rgba(99,102,241,0.1)' : 'transparent',
                                color: 'var(--text-primary)', transition: 'all 0.2s',
                                opacity: c > availableQs ? 0.4 : 1,
                            }}>{c}</button>
                        ))}
                    </div>
                    <input
                        className="input"
                        type="number"
                        placeholder="Or enter a custom number..."
                        value={customCount}
                        min={1}
                        max={availableQs}
                        onChange={(e) => setCustomCount(e.target.value)}
                        style={{ maxWidth: '240px' }}
                    />
                </div>

                {/* Language selection */}
                {(examId.startsWith('kpsc') || examId.startsWith('kea')) && (
                    <div style={{ marginBottom: '24px' }}>
                        <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>Test Language</div>
                        <div style={{ display: 'flex', gap: '8px' }}>
                            {['en', 'kn'].map((l) => (
                                <button key={l} onClick={() => setTestLang(l as Language)} style={{
                                    padding: '8px 18px', borderRadius: '8px', cursor: 'pointer', fontWeight: 600, fontSize: '13px',
                                    border: testLang === l ? '2px solid var(--accent-indigo)' : '2px solid var(--border)',
                                    background: testLang === l ? 'rgba(99,102,241,0.1)' : 'transparent',
                                    color: 'var(--text-primary)', transition: 'all 0.2s',
                                }}>{l === 'en' ? '🇬🇧 English' : l === 'kn' ? '🇮🇳 ಕನ್ನಡ' : '🇮🇳 हिन्दी'}</button>
                            ))}
                        </div>
                    </div>
                )}

                {/* Summary and start */}
                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', paddingTop: '20px', borderTop: '1px solid var(--border)', flexWrap: 'wrap', gap: '12px' }}>
                    <div style={{ fontSize: '14px', color: 'var(--text-muted)' }}>
                        <span style={{ color: 'var(--text-primary)', fontWeight: 600 }}>{finalCount} questions</span>
                        {' · '}{mode === 'subject' ? `${subject || 'pick a subject'}` : 'All subjects'}
                        {' · '}{difficulty === 'mixed' ? 'Mixed difficulty' : difficulty}
                    </div>
                    <button
                        onClick={handleStart}
                        disabled={finalCount === 0 || (mode === 'subject' && !subject)}
                        className="btn btn-primary"
                        style={{ padding: '12px 28px', fontSize: '15px' }}
                    >
                        Start Test <ArrowRight size={16} style={{ marginLeft: '8px' }} />
                    </button>
                </div>
            </div>
        </div>
    );
}
