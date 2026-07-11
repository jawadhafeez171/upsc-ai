'use client';
import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useAppStore } from '@/lib/store';
import { TestConfig, Language } from '@/types';
import { ArrowRight, Clock, Target, HelpCircle, CheckSquare } from 'lucide-react';
import { supabase } from '@/lib/supabase';

const QUESTION_COUNTS = [10, 25, 50, 100];
const DIFFICULTIES = ['mixed', 'easy', 'medium', 'hard'] as const;

export default function ExamDetailClient({ examId, initialExam }: { examId: string; initialExam: any }) {
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
        setActiveSession({ id: sessionId, user_id: user.id, exam_id: examId, config, questions: [], answers: {}, started_at: new Date().toISOString(), status: 'active' });
        router.push(`/test/${sessionId}`);
    };

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '85vh', padding: '40px 0' }}>
            <div style={{ maxWidth: '960px', margin: '0 auto', padding: '0 24px' }}>

                {/* Exam header */}
                <div className="card" style={{ padding: '24px', marginBottom: '24px' }}>
                    <div style={{ fontSize: '36px', marginBottom: '10px' }}>{exam.id.includes('upsc') ? '🏛️' : exam.id.includes('kpsc') ? '🅺' : '📋'}</div>
                    <h1 style={{ fontSize: '24px', fontWeight: 800, marginBottom: '6px' }}>{exam.title}</h1>
                    <p style={{ color: 'var(--text-secondary)', fontSize: '14px', lineHeight: 1.5, marginBottom: '14px' }}>{exam.description}</p>
                    <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                        {(exam.topics || []).map((s: string) => (
                            <span key={s} className="tag" style={{ background: 'var(--bg-secondary)', color: 'var(--text-secondary)' }}>{s}</span>
                        ))}
                    </div>
                </div>

                {/* Config + Summary */}
                <div className="exam-detail-split" style={{ display: 'grid', gridTemplateColumns: '1.2fr 0.8fr', gap: '20px', alignItems: 'start' }}>
                    
                    {/* Left: Config */}
                    <div className="card" style={{ padding: '24px' }}>
                        <h2 style={{ fontWeight: 700, fontSize: '17px', marginBottom: '20px' }}>⚙️ Configure Your Test</h2>

                        {/* Mode */}
                        <div style={{ marginBottom: '24px' }}>
                            <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase' }}>Mode</div>
                            <div className="exam-config-grid">
                                {([['full', '📋 Full Mock', 'All subjects combined'], ['subject', '🎯 Subject Focus', 'Pick one topic']] as const).map(([m, label, desc]) => (
                                    <button key={m} onClick={() => setMode(m)} style={{
                                        padding: '12px', borderRadius: '10px',
                                        border: 'none', cursor: 'pointer', textAlign: 'left',
                                        background: mode === m ? 'var(--accent-peach)' : 'var(--bg-secondary)',
                                        transition: 'all 0.15s',
                                    }}>
                                        <div style={{ fontWeight: 700, color: 'var(--text-primary)', fontSize: '13.5px' }}>{label}</div>
                                        <div style={{ fontSize: '11px', color: 'var(--text-secondary)', marginTop: '2px' }}>{desc}</div>
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* Subject */}
                        {mode === 'subject' && (
                            <div style={{ marginBottom: '24px' }}>
                                <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase' }}>Topic</div>
                                <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                                    {(exam.topics || []).map((s: string) => (
                                        <button key={s} onClick={() => setSubject(s)} style={{
                                            padding: '6px 12px', borderRadius: '8px', border: 'none', cursor: 'pointer',
                                            fontWeight: 600, fontSize: '13px',
                                            background: subject === s ? 'var(--accent-sage)' : 'var(--bg-secondary)',
                                            color: 'var(--text-primary)', transition: 'all 0.15s',
                                        }}>{s}</button>
                                    ))}
                                </div>
                            </div>
                        )}

                        {/* Difficulty */}
                        <div style={{ marginBottom: '24px' }}>
                            <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase' }}>Difficulty</div>
                            <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                                {DIFFICULTIES.map((d) => (
                                    <button key={d} onClick={() => setDifficulty(d)} style={{
                                        padding: '6px 14px', borderRadius: '8px', cursor: 'pointer', fontWeight: 600, fontSize: '13px',
                                        border: 'none',
                                        background: difficulty === d ? 'var(--accent-lavender)' : 'var(--bg-secondary)',
                                        color: 'var(--text-primary)', textTransform: 'capitalize', transition: 'all 0.15s',
                                    }}>{d === 'mixed' ? '🎲 Mixed' : d === 'easy' ? '🟢 Easy' : d === 'medium' ? '🟡 Medium' : '🔴 Hard'}</button>
                                ))}
                            </div>
                        </div>

                        {/* Question Count */}
                        <div style={{ marginBottom: '20px' }}>
                            <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase' }}>
                                Questions <span style={{ fontWeight: 500, textTransform: 'lowercase', color: 'var(--text-muted)' }}>({availableQs} available)</span>
                            </div>
                            <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap', marginBottom: '10px' }}>
                                {QUESTION_COUNTS.map((c) => (
                                    <button key={c} onClick={() => { setCount(c); setCustomCount(''); }} style={{
                                        padding: '6px 14px', borderRadius: '8px', cursor: 'pointer', fontWeight: 700, fontSize: '13px',
                                        border: 'none',
                                        background: count === c && !customCount ? 'var(--accent-sky)' : 'var(--bg-secondary)',
                                        color: 'var(--text-primary)', transition: 'all 0.15s',
                                        opacity: c > availableQs ? 0.4 : 1,
                                    }} disabled={c > availableQs}>{c}</button>
                                ))}
                            </div>
                            <input className="input" type="number" placeholder="Custom count..." value={customCount}
                                min={1} max={availableQs} onChange={(e) => setCustomCount(e.target.value)}
                                style={{ maxWidth: '180px', height: '36px' }} />
                        </div>

                        {/* Language */}
                        {(examId.startsWith('kpsc') || examId.startsWith('kea')) && (
                            <div>
                                <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase' }}>Language</div>
                                <div style={{ display: 'flex', gap: '6px' }}>
                                    {['en', 'kn'].map((l) => (
                                        <button key={l} onClick={() => setTestLang(l as Language)} style={{
                                            padding: '6px 14px', borderRadius: '8px', cursor: 'pointer', fontWeight: 600, fontSize: '13px',
                                            border: 'none',
                                            background: testLang === l ? 'var(--accent-sage)' : 'var(--bg-secondary)',
                                            color: 'var(--text-primary)', transition: 'all 0.15s',
                                        }}>{l === 'en' ? '🇬🇧 English' : '🇮🇳 ಕನ್ನಡ'}</button>
                                    ))}
                                </div>
                            </div>
                        )}
                    </div>

                    {/* Right: Summary */}
                    <div className="card" style={{ padding: '24px', position: 'sticky', top: '76px', background: 'var(--bg-secondary)' }}>
                        <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)', textTransform: 'uppercase', marginBottom: '2px' }}>📝 Test summary</div>
                        <h3 style={{ fontSize: '17px', fontWeight: 700, marginBottom: '20px' }}>Ready to go</h3>

                        <div style={{ display: 'flex', flexDirection: 'column', gap: '14px', marginBottom: '24px' }}>
                            {[
                                { icon: <Target size={14} />, label: 'Exam', value: exam.title },
                                { icon: <HelpCircle size={14} />, label: 'Questions', value: `${finalCount} (${mode === 'subject' ? (subject || '—') : 'Full'})` },
                                { icon: <Clock size={14} />, label: 'Est. Time', value: `${Math.round(finalCount * 1.2)} min` },
                                { icon: <CheckSquare size={14} />, label: 'Negative', value: exam.negative_marking > 0 ? `-${exam.negative_marking}` : 'None' },
                            ].map((item) => (
                                <div key={item.label} style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                                    <div style={{ color: 'var(--brand-orange)' }}>{item.icon}</div>
                                    <div>
                                        <div style={{ fontSize: '11px', color: 'var(--text-muted)' }}>{item.label}</div>
                                        <div style={{ fontSize: '13px', fontWeight: 600 }}>{item.value}</div>
                                    </div>
                                </div>
                            ))}
                        </div>

                        <button onClick={handleStart}
                            disabled={finalCount === 0 || (mode === 'subject' && !subject)}
                            className="btn btn-primary"
                            style={{ width: '100%', padding: '12px', fontSize: '15px' }}>
                            Start Test <ArrowRight size={15} />
                        </button>
                    </div>
                </div>
            </div>

            <style>{`
                @media (max-width: 800px) {
                    .exam-detail-split { grid-template-columns: 1fr !important; }
                }
            `}</style>
        </div>
    );
}
