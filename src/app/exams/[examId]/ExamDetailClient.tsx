'use client';
import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useAppStore } from '@/lib/store';
import { TestConfig, Language } from '@/types';
import {
    ArrowRight,
    Clock,
    Target,
    HelpCircle,
    CheckSquare,
    Layers,
    Sliders,
    Landmark,
    MapPin,
    BookOpen
} from 'lucide-react';
import { supabase } from '@/lib/supabase';

const QUESTION_COUNTS = [10, 25, 50, 100];
const DIFFICULTIES = ['mixed', 'easy', 'medium', 'hard'] as const;

function getExamIcon(id: string) {
    if (id.includes('upsc')) return <Landmark size={28} color="#2563EB" />;
    if (id.includes('kpsc') || id.includes('kea') || id.includes('kas')) return <MapPin size={28} color="#EA580C" />;
    return <BookOpen size={28} color="#2563EB" />;
}

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
        <div style={{ background: 'transparent', minHeight: '85vh', padding: '36px 0 60px' }}>
            <div style={{ maxWidth: '960px', margin: '0 auto', padding: '0 24px' }}>

                {/* Exam header */}
                <div className="card" style={{ padding: '28px', marginBottom: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                    <div style={{
                        width: '52px',
                        height: '52px',
                        borderRadius: '12px',
                        background: 'var(--bg-tertiary)',
                        border: '1px solid var(--border)',
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'center',
                        marginBottom: '16px'
                    }}>
                        {getExamIcon(exam.id || examId)}
                    </div>
                    <h1 style={{ fontSize: '24px', fontWeight: 800, marginBottom: '6px', color: 'var(--text-primary)' }}>{exam.title}</h1>
                    <p style={{ color: 'var(--text-secondary)', fontSize: '14px', lineHeight: 1.55, marginBottom: '14px' }}>{exam.description}</p>
                    <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                        {(exam.topics || []).map((s: string) => (
                            <span key={s} className="tag" style={{ background: 'var(--bg-tertiary)', color: 'var(--text-secondary)', border: '1px solid var(--border)', borderRadius: '6px', fontSize: '11.5px', padding: '3px 8px' }}>
                                {s}
                            </span>
                        ))}
                    </div>
                </div>

                {/* Config + Summary */}
                <div className="exam-detail-split" style={{ display: 'grid', gridTemplateColumns: '1.2fr 0.8fr', gap: '20px', alignItems: 'start' }}>
                    
                    {/* Left: Config */}
                    <div className="card" style={{ padding: '24px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px', marginBottom: '20px' }}>
                            <Sliders size={18} color="#2563EB" />
                            <h2 style={{ fontWeight: 800, fontSize: '16px', margin: 0 }}>Configure Examination Practice</h2>
                        </div>

                        {/* Mode */}
                        <div style={{ marginBottom: '24px' }}>
                            <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase', letterSpacing: '0.04em' }}>
                                Examination Mode
                            </div>
                            <div className="exam-config-grid">
                                {([
                                    ['full', 'Full Mock', 'All syllabus topics combined', <Layers key="full" size={15} />],
                                    ['subject', 'Subject Focus', 'Target specific subject module', <Target key="subj" size={15} />]
                                ] as const).map(([m, label, desc, icon]) => (
                                    <button
                                        key={m}
                                        type="button"
                                        onClick={() => setMode(m)}
                                        style={{
                                            padding: '14px',
                                            borderRadius: '8px',
                                            border: mode === m ? '1.5px solid #1E1B4B' : '1px solid var(--border)',
                                            cursor: 'pointer',
                                            textAlign: 'left',
                                            background: mode === m ? '#1E1B4B' : 'var(--bg-secondary)',
                                            color: mode === m ? '#FFFFFF' : 'var(--text-primary)',
                                            boxShadow: mode === m ? '0 1px 3px rgba(30,27,75,0.2)' : 'var(--shadow-sm)',
                                            transition: 'all 0.15s ease',
                                        }}
                                    >
                                        <div style={{ fontWeight: 800, fontSize: '13.5px', display: 'flex', alignItems: 'center', gap: '6px' }}>
                                            {icon}
                                            <span>{label}</span>
                                        </div>
                                        <div style={{ fontSize: '11px', color: mode === m ? '#E0E7FF' : 'var(--text-secondary)', marginTop: '3px' }}>
                                            {desc}
                                        </div>
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* Subject */}
                        {mode === 'subject' && (
                            <div style={{ marginBottom: '24px' }}>
                                <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase', letterSpacing: '0.04em' }}>
                                    Select Subject Module
                                </div>
                                <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                                    {(exam.topics || []).map((s: string) => (
                                        <button
                                            key={s}
                                            type="button"
                                            onClick={() => setSubject(s)}
                                            style={{
                                                padding: '6px 12px',
                                                borderRadius: '6px',
                                                border: subject === s ? '1px solid #1E1B4B' : '1px solid var(--border)',
                                                cursor: 'pointer',
                                                fontWeight: 700,
                                                fontSize: '12px',
                                                background: subject === s ? '#1E1B4B' : 'var(--bg-secondary)',
                                                color: subject === s ? '#FFFFFF' : 'var(--text-secondary)',
                                                boxShadow: subject === s ? '0 1px 3px rgba(30,27,75,0.2)' : 'var(--shadow-sm)',
                                                transition: 'all 0.15s ease',
                                            }}
                                        >
                                            {s}
                                        </button>
                                    ))}
                                </div>
                            </div>
                        )}

                        {/* Difficulty */}
                        <div style={{ marginBottom: '24px' }}>
                            <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase', letterSpacing: '0.04em' }}>
                                Difficulty Calibration
                            </div>
                            <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap' }}>
                                {DIFFICULTIES.map((d) => (
                                    <button
                                        key={d}
                                        type="button"
                                        onClick={() => setDifficulty(d)}
                                        style={{
                                            padding: '6px 12px',
                                            borderRadius: '6px',
                                            cursor: 'pointer',
                                            fontWeight: 700,
                                            fontSize: '12px',
                                            border: difficulty === d ? '1px solid #1E1B4B' : '1px solid var(--border)',
                                            background: difficulty === d ? '#1E1B4B' : 'var(--bg-secondary)',
                                            color: difficulty === d ? '#FFFFFF' : 'var(--text-secondary)',
                                            boxShadow: difficulty === d ? '0 1px 3px rgba(30,27,75,0.2)' : 'var(--shadow-sm)',
                                            textTransform: 'capitalize',
                                            transition: 'all 0.15s ease',
                                        }}
                                    >
                                        {d}
                                    </button>
                                ))}
                            </div>
                        </div>

                        {/* Question Count */}
                        <div style={{ marginBottom: '20px' }}>
                            <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase', letterSpacing: '0.04em' }}>
                                Number of Questions <span style={{ fontWeight: 500, textTransform: 'none', color: 'var(--text-muted)' }}>({availableQs} available)</span>
                            </div>
                            <div style={{ display: 'flex', gap: '6px', flexWrap: 'wrap', marginBottom: '10px' }}>
                                {QUESTION_COUNTS.map((c) => (
                                    <button
                                        key={c}
                                        type="button"
                                        onClick={() => { setCount(c); setCustomCount(''); }}
                                        style={{
                                            padding: '6px 14px',
                                            borderRadius: '6px',
                                            cursor: 'pointer',
                                            fontWeight: 700,
                                            fontSize: '12.5px',
                                            border: count === c && !customCount ? '1px solid #1E1B4B' : '1px solid var(--border)',
                                            background: count === c && !customCount ? '#1E1B4B' : 'var(--bg-secondary)',
                                            color: count === c && !customCount ? '#FFFFFF' : 'var(--text-secondary)',
                                            boxShadow: count === c && !customCount ? '0 1px 3px rgba(30,27,75,0.2)' : 'var(--shadow-sm)',
                                            transition: 'all 0.15s ease',
                                            opacity: c > availableQs ? 0.4 : 1,
                                            fontFamily: 'var(--font-mono, monospace)'
                                        }}
                                        disabled={c > availableQs}
                                    >
                                        {c}
                                    </button>
                                ))}
                            </div>
                            <input
                                className="input"
                                type="number"
                                placeholder="Custom count..."
                                value={customCount}
                                min={1}
                                max={availableQs}
                                onChange={(e) => setCustomCount(e.target.value)}
                                style={{ maxWidth: '180px', height: '36px', borderRadius: '6px', fontSize: '13px' }}
                            />
                        </div>

                        {/* Language */}
                        {(examId.startsWith('kpsc') || examId.startsWith('kea')) && (
                            <div>
                                <div style={{ fontSize: '11px', fontWeight: 800, color: 'var(--text-secondary)', marginBottom: '8px', textTransform: 'uppercase', letterSpacing: '0.04em' }}>
                                    Examination Language
                                </div>
                                <div style={{ display: 'flex', gap: '6px' }}>
                                    {[
                                        { code: 'en', label: 'English' },
                                        { code: 'kn', label: 'ಕನ್ನಡ (Kannada)' }
                                    ].map((l) => (
                                        <button
                                            key={l.code}
                                            type="button"
                                            onClick={() => setTestLang(l.code as Language)}
                                            style={{
                                                padding: '6px 14px',
                                                borderRadius: '6px',
                                                cursor: 'pointer',
                                                fontWeight: 700,
                                                fontSize: '12.5px',
                                                border: testLang === l.code ? '1px solid #1E1B4B' : '1px solid var(--border)',
                                                background: testLang === l.code ? '#1E1B4B' : 'var(--bg-secondary)',
                                                color: testLang === l.code ? '#FFFFFF' : 'var(--text-secondary)',
                                                boxShadow: testLang === l.code ? '0 1px 3px rgba(30,27,75,0.2)' : 'var(--shadow-sm)',
                                                transition: 'all 0.15s ease',
                                            }}
                                        >
                                            {l.label}
                                        </button>
                                    ))}
                                </div>
                            </div>
                        )}
                    </div>

                    {/* Right: Summary */}
                    <div className="card" style={{ padding: '24px', borderRadius: '12px', position: 'sticky', top: '76px', background: 'var(--bg-secondary)', border: '1px solid var(--border)' }}>
                        <h3 style={{ fontSize: '16px', fontWeight: 800, marginBottom: '18px', color: 'var(--text-primary)' }}>Examination Summary</h3>

                        <div style={{ display: 'flex', flexDirection: 'column', gap: '14px', marginBottom: '24px' }}>
                            {[
                                { icon: <Target size={15} />, label: 'Exam', value: exam.title },
                                { icon: <HelpCircle size={15} />, label: 'Questions', value: `${finalCount} (${mode === 'subject' ? (subject || '—') : 'Full Mock'})` },
                                { icon: <Clock size={15} />, label: 'Est. Duration', value: `${Math.round(finalCount * 1.2)} Minutes` },
                                { icon: <CheckSquare size={15} />, label: 'Negative Marking', value: exam.negative_marking > 0 ? `-${exam.negative_marking}` : 'None' },
                            ].map((item) => (
                                <div key={item.label} style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                                    <div style={{ color: '#2563EB', flexShrink: 0 }}>{item.icon}</div>
                                    <div>
                                        <div style={{ fontSize: '11px', color: 'var(--text-muted)' }}>{item.label}</div>
                                        <div style={{ fontSize: '13px', fontWeight: 700, color: 'var(--text-primary)' }}>{item.value}</div>
                                    </div>
                                </div>
                            ))}
                        </div>

                        <button
                            type="button"
                            onClick={handleStart}
                            disabled={finalCount === 0 || (mode === 'subject' && !subject)}
                            className="btn btn-primary"
                            style={{
                                width: '100%',
                                padding: '12px',
                                fontSize: '14px',
                                fontWeight: 800,
                                background: '#1E1B4B',
                                color: '#FFFFFF',
                                border: '1px solid #312E81',
                                borderRadius: '8px',
                                display: 'inline-flex',
                                alignItems: 'center',
                                justifyContent: 'center',
                                gap: '8px',
                                cursor: (finalCount === 0 || (mode === 'subject' && !subject)) ? 'not-allowed' : 'pointer'
                            }}
                        >
                            <span>Start Examination</span>
                            <ArrowRight size={15} />
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
