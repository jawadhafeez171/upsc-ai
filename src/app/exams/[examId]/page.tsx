'use client';
import { use, useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { supabase } from '@/lib/supabase';
import { useAppStore } from '@/lib/store';
import { TestConfig, Language } from '@/types';
import { ArrowRight, AlertTriangle } from 'lucide-react';

const QUESTION_COUNTS = [10, 25, 50, 100];
const DIFFICULTIES = ['mixed', 'easy', 'medium', 'hard'] as const;
const YEARS = [
    'all',
    2024, 2023, 2022, 2021, 2020,
    2019, 2018, 2017, 2016, 2015,
    2014, 2013, 2012, 2011, 2010,
    2009, 2008, 2007, 2006, 2005,
    2004, 2003, 2002, 2001, 2000,
    1999, 1998, 1997, 1996, 1995
] as const;

export default function ExamDetailPage({ params }: { params: Promise<{ examId: string }> }) {
    const { examId } = use(params);
    const router = useRouter();
    const { user, language, setActiveSession } = useAppStore();
    const [exam, setExam] = useState<any>(null);
    const [loading, setLoading] = useState(true);
    const [availableQs, setAvailableQs] = useState(0);

    const [mode, setMode] = useState<'subject' | 'full'>('full');
    const [subject, setSubject] = useState('');
    const [difficulty, setDifficulty] = useState<'mixed' | 'easy' | 'medium' | 'hard'>('mixed');
    const [year, setYear] = useState<number | 'all'>('all');
    const [paper, setPaper] = useState<number | 'all'>('all');
    const [count, setCount] = useState(25);
    const [customCount, setCustomCount] = useState('');
    const [testLang, setTestLang] = useState<Language>(language);

    useEffect(() => {
        async function loadExamData() {
            setLoading(true);
            const { data: examData } = await supabase.from('exams').select('*').eq('id', examId).single();
            if (examData) {
                if (examId === 'upsc-cse') {
                    examData.topics = [
                        'Ancient History',
                        'Art and Culture',
                        'Modern History',
                        'Polity',
                        'Economics',
                        'Geography',
                        'Environment',
                        'IR and Current Affairs',
                        'General Awareness'
                    ];
                } else if (examId === 'kpsc-kas') {
                    examData.topics = [
                        'Ancient History',
                        'Medieval History',
                        'Modern History',
                        'Karnataka History',
                        'Indian Polity',
                        'Geography',
                        'Karnataka Geography',
                        'Economy',
                        'Karnataka Economy',
                        'Science',
                        'Environment',
                        'Karnataka Administration',
                        'International Relations',
                        'Current Affairs',
                        'General Mental Ability'
                    ];
                }
                setExam(examData);
                
                // Get question count for this specific config
                let qCount = 0;
                if (examId === 'upsc-cse') {
                    const SubjectTableMap: Record<string, string> = {
                        'Ancient History': 'PYQ Ancient History',
                        'Art and Culture': 'PYQ Art and Culture',
                        'Modern History': 'PYQ Modern History',
                        'Polity': 'PYQ Polity',
                        'Economics': 'PYQ Economics',
                        'Geography': 'PYQ Geography',
                        'Environment': 'PYQ Environement',
                        'IR and Current Affairs': 'PYQ IR and Current Affairs',
                        'General Awareness': 'PYQ General Awareness'
                    };

                    if (mode === 'subject' && subject) {
                        const tableName = SubjectTableMap[subject];
                        if (tableName) {
                            let query = supabase.from(tableName).select('content_key', { count: 'exact', head: true });
                            if (difficulty !== 'mixed') {
                                query = query.ilike('difficulty', difficulty);
                            }
                            if (year !== 'all') {
                                query = query.eq('Year', year);
                            }
                            const { count } = await query;
                            qCount = count || 0;
                        }
                    } else {
                        // Full test mode - sum count from all tables
                        const promises = Object.values(SubjectTableMap).map(async (tableName) => {
                            let query = supabase.from(tableName).select('content_key', { count: 'exact', head: true });
                            if (difficulty !== 'mixed') {
                                query = query.ilike('difficulty', difficulty);
                            }
                            if (year !== 'all') {
                                query = query.eq('Year', year);
                            }
                            const { count } = await query;
                            return count || 0;
                        });
                        const counts = await Promise.all(promises);
                        qCount = counts.reduce((acc, c) => acc + c, 0);
                    }
                } else if (examId === 'kpsc-kas') {
                    let query = supabase.from('kas_questions').select('id', { count: 'exact', head: true });
                    if (mode === 'subject' && subject) query = query.eq('subject', subject);
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                    if (year !== 'all') query = query.eq('year', year);
                    if (paper !== 'all') query = query.eq('paper', paper);

                    const { count } = await query;
                    qCount = count || 0;
                } else {
                    let query = supabase.from('questions').select('id', { count: 'exact', head: true }).eq('exam_id', examId);
                    if (mode === 'subject' && subject) query = query.eq('subject', subject);
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);

                    const { count } = await query;
                    qCount = count || 0;
                }
                setAvailableQs(qCount);
            }
            setLoading(false);
        }
        loadExamData();
    }, [examId, mode, subject, difficulty, year, paper]);

    if (loading) return <div style={{ padding: '80px', textAlign: 'center', color: 'var(--text-muted)' }}>Loading exam...</div>;
    if (!exam) return <div style={{ padding: '80px', textAlign: 'center' }}>Exam not found</div>;

    const finalCount = Math.min(Number(customCount) || count, availableQs);

    const handleStart = () => {
        if (!user) { router.push('/login'); return; }
        if (finalCount === 0) return;

        const config: TestConfig = {
            exam_id: examId,
            mode,
            subject: mode === 'subject' ? subject : undefined,
            difficulty,
            question_count: finalCount,
            language: testLang,
            year: examId === 'upsc-cse' || examId === 'kpsc-kas' ? year : undefined,
            paper: examId === 'kpsc-kas' ? paper : undefined
        };

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

            <div className="card" style={{ padding: '28px' }}>
                <h2 style={{ fontWeight: 700, fontSize: '18px', marginBottom: '24px' }}>Configure Your Test</h2>

                <div style={{ marginBottom: '24px' }}>
                    <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>Test Mode</div>
                    <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '10px' }}>
                        {([['full', '📋 Full Mock Test', 'Random questions from all subjects'], ['subject', '🎯 Subject-wise', 'Focus on one subject']] as const).map(([m, label, desc]) => (
                            <button key={m} onClick={() => setMode(m)} style={{
                                padding: '14px', borderRadius: '12px', border: `2px solid ${mode === m ? 'var(--accent-indigo)' : 'var(--border)'}`,
                                background: mode === m ? 'rgba(184, 62, 17, 0.08)' : 'transparent',
                                cursor: 'pointer', textAlign: 'left', transition: 'all 0.2s',
                            }}>
                                <div style={{ fontWeight: 600, color: 'var(--text-primary)', marginBottom: '4px' }}>{label}</div>
                                <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>{desc}</div>
                            </button>
                        ))}
                    </div>
                </div>

                {mode === 'subject' && (
                    <div style={{ marginBottom: '24px' }}>
                        <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>Select Subject</div>
                        <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                            {(exam.topics || []).map((s: string) => (
                                <button key={s} onClick={() => setSubject(s)} style={{
                                    padding: '8px 14px', borderRadius: '8px', border: `2px solid ${subject === s ? 'var(--accent-indigo)' : 'var(--border)'}`,
                                    background: subject === s ? 'rgba(184, 62, 17, 0.08)' : 'transparent',
                                    cursor: 'pointer', color: 'var(--text-primary)', fontWeight: 550, fontSize: '13px', transition: 'all 0.2s',
                                }}>{s}</button>
                            ))}
                        </div>
                    </div>
                )}

                <div style={{ marginBottom: '24px' }}>
                    <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>Difficulty</div>
                    <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                        {DIFFICULTIES.map((d) => {
                            return (
                                <button key={d} onClick={() => setDifficulty(d)} style={{
                                    padding: '8px 16px', borderRadius: '8px', cursor: 'pointer', fontWeight: 650, fontSize: '13px',
                                    border: difficulty === d ? '2px solid var(--accent-indigo)' : '2px solid transparent',
                                    background: difficulty === d ? 'rgba(184, 62, 17, 0.08)' : 'var(--bg-secondary)',
                                    color: 'var(--text-primary)', textTransform: 'capitalize', transition: 'all 0.2s',
                                }}>{d === 'mixed' ? '🎲 Mixed' : d === 'easy' ? '🟢 Easy' : d === 'medium' ? '🟡 Medium' : '🔴 Hard'}</button>
                            );
                        })}
                    </div>
                </div>

                {examId === 'upsc-cse' && (
                    <div style={{ marginBottom: '24px' }}>
                        <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>PYQ Year</div>
                        <select
                            className="input"
                            value={year}
                            onChange={(e) => {
                                const val = e.target.value;
                                setYear(val === 'all' ? 'all' : Number(val));
                            }}
                            style={{ maxWidth: '240px', height: '42px' }}
                        >
                            <option value="all">🌐 All Years (1995 - 2024)</option>
                            {YEARS.filter(y => y !== 'all').map((y) => (
                                <option key={y} value={y}>📅 {y} Prelims</option>
                            ))}
                        </select>
                    </div>
                )}

                {examId === 'kpsc-kas' && (
                    <div style={{ display: 'flex', gap: '16px', flexWrap: 'wrap', marginBottom: '24px' }}>
                        <div>
                            <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>PYQ Year</div>
                            <select
                                className="input"
                                value={year}
                                onChange={(e) => {
                                    const val = e.target.value;
                                    setYear(val === 'all' ? 'all' : Number(val));
                                }}
                                style={{ minWidth: '200px', height: '42px' }}
                            >
                                <option value="all">🌐 All Years</option>
                                <option value={2025}>📅 2025 Prelims</option>
                            </select>
                        </div>
                        <div>
                            <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>Select Paper</div>
                            <select
                                className="input"
                                value={paper}
                                onChange={(e) => {
                                    const val = e.target.value;
                                    setPaper(val === 'all' ? 'all' : Number(val));
                                }}
                                style={{ minWidth: '200px', height: '42px' }}
                            >
                                <option value="all">📚 All Papers</option>
                                <option value={1}>📝 Paper 1 (General Studies)</option>
                                <option value={2}>📝 Paper 2 (General Studies, Science, CSAT)</option>
                            </select>
                        </div>
                    </div>
                )}

                <div style={{ marginBottom: '24px' }}>
                    <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>
                        Number of Questions <span style={{ color: 'var(--text-muted)', fontWeight: 400 }}>({availableQs} available)</span>
                    </div>
                    <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap', marginBottom: '10px' }}>
                        {QUESTION_COUNTS.map((c) => (
                            <button key={c} onClick={() => { setCount(c); setCustomCount(''); }} style={{
                                padding: '8px 16px', borderRadius: '8px', cursor: 'pointer', fontWeight: 650, fontSize: '13px',
                                border: count === c && !customCount ? '2px solid var(--accent-indigo)' : '2px solid var(--border)',
                                background: count === c && !customCount ? 'rgba(184, 62, 17, 0.08)' : 'transparent',
                                color: 'var(--text-primary)', transition: 'all 0.2s',
                                opacity: c > availableQs ? 0.4 : 1,
                            }} disabled={c > availableQs}>{c}</button>
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

                {(examId.startsWith('kpsc') || examId.startsWith('kea')) && (
                    <div style={{ marginBottom: '24px' }}>
                        <div style={{ fontSize: '13px', fontWeight: 600, color: 'var(--text-secondary)', marginBottom: '10px' }}>Test Language</div>
                        <div style={{ display: 'flex', gap: '8px' }}>
                            {['en', 'kn'].map((l) => (
                                <button key={l} onClick={() => setTestLang(l as Language)} style={{
                                    padding: '8px 18px', borderRadius: '8px', cursor: 'pointer', fontWeight: 650, fontSize: '13px',
                                    border: testLang === l ? '2px solid var(--accent-indigo)' : '2px solid var(--border)',
                                    background: testLang === l ? 'rgba(184, 62, 17, 0.08)' : 'transparent',
                                    color: 'var(--text-primary)', transition: 'all 0.2s',
                                }}>{l === 'en' ? '🇬🇧 English' : l === 'kn' ? '🇮🇳 ಕನ್ನಡ' : '🇮🇳 हिन्दी'}</button>
                            ))}
                        </div>
                    </div>
                )}

                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', paddingTop: '20px', borderTop: '1px solid var(--border)', flexWrap: 'wrap', gap: '12px' }}>
                    <div style={{ fontSize: '14px', color: 'var(--text-muted)' }}>
                        <span style={{ color: 'var(--text-primary)', fontWeight: 600 }}>{finalCount} questions</span>
                        {' · '}{mode === 'subject' ? `${subject || 'pick a subject'}` : 'All subjects'}
                        {' · '}{difficulty === 'mixed' ? 'Mixed difficulty' : difficulty}
                        {examId === 'upsc-cse' && ` · ${year === 'all' ? 'All years' : `${year} paper`}`}
                        {examId === 'kpsc-kas' && ` · ${year === 'all' ? 'All years' : `${year}`} · ${paper === 'all' ? 'All papers' : `Paper ${paper}`}`}
                    </div>
                    <button
                        onClick={handleStart}
                        disabled={finalCount === 0 || (mode === 'subject' && !subject)}
                        className="btn btn-primary"
                        style={{ padding: '12px 28px', fontSize: '15px' }}
                    >
                        Start Test <ArrowRight size={16} />
                    </button>
                </div>
            </div>
        </div>
    );
}
