'use client';
import { use, useState, useEffect } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import Link from 'next/link';
import { supabase } from '@/lib/supabase';
import { useAppStore } from '@/lib/store';
import { EXAMS } from '@/lib/mockData';
import { getExamInfo, ExamInfo } from '@/data/examDetails';
import { TestConfig, Language, TestMode } from '@/types';
import { 
    ArrowRight, AlertTriangle, BookOpen, Zap, Info, Shield, 
    Award, CheckCircle2, DollarSign, Briefcase, Calendar, 
    Layers, HelpCircle, ChevronRight, UserCheck, Scale, Landmark,
    Compass, BrainCircuit
} from 'lucide-react';
import ExamMindMapVisualizer from '@/components/graph/ExamMindMapVisualizer';

const QUESTION_COUNTS = [10, 25, 50, 100];
const DIFFICULTIES = ['mixed', 'easy', 'medium', 'hard'] as const;

type ActiveTab = 'practice' | 'about' | 'services' | 'mindmap';

export default function ExamDetailPage({ params }: { params: Promise<{ examId: string }> }) {
    const { examId } = use(params);
    const searchParams = useSearchParams();
    const router = useRouter();
    const { user, language, setActiveSession } = useAppStore();

    // Determine initial tab from query parameter: ?tab=about | ?tab=services | ?tab=mindmap | default practice
    const tabParam = searchParams.get('tab');
    const initialTab: ActiveTab = tabParam === 'about' ? 'about' : tabParam === 'services' ? 'services' : tabParam === 'mindmap' ? 'mindmap' : 'practice';
    const [activeTab, setActiveTab] = useState<ActiveTab>(initialTab);

    const [exam, setExam] = useState<any>(null);
    const [examInfo, setExamInfo] = useState<ExamInfo | undefined>(undefined);
    const [loading, setLoading] = useState(true);
    const [availableQs, setAvailableQs] = useState(0);

    const [mode, setMode] = useState<TestMode>('full');
    const [subject, setSubject] = useState('');
    const [difficulty, setDifficulty] = useState<'mixed' | 'easy' | 'medium' | 'hard'>('mixed');
    const [year, setYear] = useState<number | 'all'>('all');
    const [paper, setPaper] = useState<number | 'all'>('all');
    const [month, setMonth] = useState<string | 'all'>('all');
    const [count, setCount] = useState(25);
    const [customCount, setCustomCount] = useState('');
    const [testLang, setTestLang] = useState<Language>(language);

    useEffect(() => {
        async function loadExamData() {
            setLoading(true);
            const localExam = EXAMS.find(e => e.id === examId);
            const detailedInfo = getExamInfo(examId);
            setExamInfo(detailedInfo);

            let loadedExam: any = localExam || null;

            try {
                const { data: dbData } = await supabase.from('exams').select('*').eq('id', examId).single();
                if (dbData) {
                    loadedExam = { ...localExam, ...dbData, title: dbData.title || localExam?.name, topics: localExam?.subjects || dbData.topics };
                }
            } catch (e) {
                console.log('Using local exam fallback:', e);
            }

            if (loadedExam) {
                if (!loadedExam.topics || loadedExam.topics.length === 0) {
                    loadedExam.topics = localExam?.subjects || [];
                }
                setExam(loadedExam);

                // Calculate available questions
                let qCount = 0;
                if (examId === 'upsc-cse') {
                    let query = supabase.from('upsc_questions').select('id', { count: 'exact', head: true }).gt('year', 0);
                    if (mode === 'subject' && subject) query = query.ilike('subject', `%${subject}%`);
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                    if (year !== 'all') query = query.eq('year', year);
                    if (paper !== 'all') query = query.eq('paper', paper);
                    const { count: uCount } = await query;
                    qCount = uCount || 0;
                } else if (examId === 'kpsc-kas') {
                    let query = supabase.from('kas_questions').select('id', { count: 'exact', head: true });
                    if (mode === 'subject' && subject) query = query.eq('subject', subject);
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                    if (year !== 'all') query = query.eq('year', year);
                    if (paper !== 'all') query = query.eq('paper', paper);
                    if (month !== 'all') query = query.eq('month', month);

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
    }, [examId, mode, subject, difficulty, year, paper, month]);

    if (loading) {
        return <div style={{ padding: '100px 20px', textAlign: 'center', color: 'var(--text-muted)' }}>Loading examination details...</div>;
    }
    if (!exam) {
        return (
            <div style={{ maxWidth: '600px', margin: '80px auto', textAlign: 'center', padding: '32px' }} className="card">
                <h2>Exam Not Found</h2>
                <p style={{ color: 'var(--text-muted)', margin: '12px 0 20px' }}>The requested examination is not cataloged yet.</p>
                <Link href="/exams" className="btn btn-primary">Return to Exam Catalog</Link>
            </div>
        );
    }

    const finalCount = Math.min(Number(customCount) || count, availableQs || 25);

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
            paper: examId === 'kpsc-kas' ? paper : undefined,
            month: examId === 'kpsc-kas' ? month : undefined
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

    const examTitle = language === 'kn' && exam.name_kn ? exam.name_kn : (exam.title || exam.name);
    const examDesc = language === 'kn' && exam.description_kn ? exam.description_kn : exam.description;
    const examTopics = language === 'kn' && exam.subjects_kn ? exam.subjects_kn : (exam.topics || exam.subjects || []);

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '100vh', padding: '40px 0 80px' }}>
            <div style={{ maxWidth: '960px', margin: '0 auto', padding: '0 20px' }}>
                
                {/* Back to Catalog Breadcrumb */}
                <div style={{ marginBottom: '20px' }}>
                    <Link 
                        href="/exams" 
                        style={{ display: 'inline-flex', alignItems: 'center', gap: '6px', fontSize: '13.5px', fontWeight: 600, color: 'var(--brand-orange)', textDecoration: 'none' }}
                    >
                        ← Back to Exam Catalog
                    </Link>
                </div>

                {/* Exam Banner Header */}
                <div className="card" style={{ padding: '28px 32px', marginBottom: '24px', borderRadius: '20px', border: '1px solid var(--border)' }}>
                    <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', gap: '16px', flexWrap: 'wrap' }}>
                        <div style={{ display: 'flex', alignItems: 'center', gap: '16px' }}>
                            <div style={{ 
                                width: '56px', height: '56px', borderRadius: '16px', 
                                background: 'var(--bg-tertiary)', border: '1px solid var(--border)',
                                display: 'flex', alignItems: 'center', justifyContent: 'center', fontSize: '28px' 
                            }}>
                                {exam.icon || '🏛️'}
                            </div>
                            <div>
                                <h1 style={{ fontSize: 'clamp(22px, 3.5vw, 32px)', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '4px' }}>
                                    {examTitle}
                                </h1>
                                <p style={{ fontSize: '14.5px', color: 'var(--text-secondary)', margin: 0, lineHeight: 1.5 }}>
                                    {examDesc}
                                </p>
                            </div>
                        </div>

                        {examInfo && (
                            <span style={{ 
                                fontSize: '12px', fontWeight: 800, padding: '4px 12px', borderRadius: '9999px',
                                background: 'rgba(255, 107, 43, 0.12)', color: 'var(--brand-orange)',
                                border: '1px solid rgba(255, 107, 43, 0.25)', height: 'fit-content'
                            }}>
                                {examInfo.jobRole.cadre}
                            </span>
                        )}
                    </div>

                    {/* Three-Category Tab Navigation Bar */}
                    <div style={{ display: 'flex', gap: '10px', marginTop: '24px', borderTop: '1px solid var(--border)', paddingTop: '20px', flexWrap: 'wrap' }}>
                        {/* Tab 1: Practice Mocks */}
                        <button
                            onClick={() => setActiveTab('practice')}
                            style={{
                                display: 'flex', alignItems: 'center', gap: '8px',
                                padding: '10px 18px', borderRadius: '12px', cursor: 'pointer',
                                fontSize: '13.5px', fontWeight: 700, transition: 'all 0.2s',
                                background: activeTab === 'practice' ? 'var(--brand-orange)' : 'var(--bg-tertiary)',
                                color: activeTab === 'practice' ? '#FFFFFF' : 'var(--text-secondary)',
                                border: activeTab === 'practice' ? '1px solid var(--brand-orange)' : '1px solid var(--border)',
                                boxShadow: activeTab === 'practice' ? '0 2px 8px rgba(255,107,43,0.3)' : 'none'
                            }}
                        >
                            <Zap size={16} />
                            Launch Mock Test
                        </button>

                        {/* Tab 2: About Exam & Pattern */}
                        <button
                            onClick={() => setActiveTab('about')}
                            style={{
                                display: 'flex', alignItems: 'center', gap: '8px',
                                padding: '10px 18px', borderRadius: '12px', cursor: 'pointer',
                                fontSize: '13.5px', fontWeight: 700, transition: 'all 0.2s',
                                background: activeTab === 'about' ? 'var(--brand-teal)' : 'var(--bg-tertiary)',
                                color: activeTab === 'about' ? '#FFFFFF' : 'var(--text-secondary)',
                                border: activeTab === 'about' ? '1px solid var(--brand-teal)' : '1px solid var(--border)',
                                boxShadow: activeTab === 'about' ? '0 2px 8px rgba(13,148,136,0.3)' : 'none'
                            }}
                        >
                            <BookOpen size={16} />
                            About Exam & Pattern
                        </button>

                        {/* Tab 3: Services & Job Roles (Separate Category) */}
                        <button
                            onClick={() => setActiveTab('services')}
                            style={{
                                display: 'flex', alignItems: 'center', gap: '8px',
                                padding: '10px 18px', borderRadius: '12px', cursor: 'pointer',
                                fontSize: '13.5px', fontWeight: 700, transition: 'all 0.2s',
                                background: activeTab === 'services' ? '#2563EB' : 'var(--bg-tertiary)',
                                color: activeTab === 'services' ? '#FFFFFF' : 'var(--text-secondary)',
                                border: activeTab === 'services' ? '1px solid #2563EB' : '1px solid var(--border)',
                                boxShadow: activeTab === 'services' ? '0 2px 8px rgba(37,99,235,0.3)' : 'none'
                            }}
                        >
                            <Briefcase size={16} />
                            Services & Job Roles
                        </button>

                        {/* Tab 4: Syllabus Mind Map */}
                        <button
                            onClick={() => setActiveTab('mindmap')}
                            style={{
                                display: 'flex', alignItems: 'center', gap: '8px',
                                padding: '10px 18px', borderRadius: '12px', cursor: 'pointer',
                                fontSize: '13.5px', fontWeight: 700, transition: 'all 0.2s',
                                background: activeTab === 'mindmap' ? '#8B5CF6' : 'var(--bg-tertiary)',
                                color: activeTab === 'mindmap' ? '#FFFFFF' : 'var(--text-secondary)',
                                border: activeTab === 'mindmap' ? '1px solid #8B5CF6' : '1px solid var(--border)',
                                boxShadow: activeTab === 'mindmap' ? '0 2px 8px rgba(139,92,246,0.3)' : 'none'
                            }}
                        >
                            <Compass size={16} />
                            Syllabus Mind Map
                        </button>
                    </div>
                </div>

                {/* ═══════════════════════════════════════════════════════════════
                    TAB 1: PRACTICE MOCK TEST
                ═══════════════════════════════════════════════════════════════ */}
                {activeTab === 'practice' && (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
                        
                        {/* Mode Selector */}
                        <div className="card" style={{ padding: '24px', borderRadius: '18px' }}>
                            <label style={{ fontSize: '13px', fontWeight: 800, textTransform: 'uppercase', color: 'var(--text-muted)', marginBottom: '12px', display: 'block', letterSpacing: '0.05em' }}>
                                1. Select Test Mode
                            </label>
                            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(260px, 1fr))', gap: '12px' }}>
                                <button
                                    onClick={() => { setMode('full'); setSubject(''); }}
                                    style={{
                                        padding: '16px', borderRadius: '14px', cursor: 'pointer', textAlign: 'left',
                                        background: mode === 'full' ? 'rgba(255, 107, 43, 0.08)' : 'var(--bg-primary)',
                                        border: mode === 'full' ? '2px solid var(--brand-orange)' : '1px solid var(--border)',
                                        transition: 'all 0.15s'
                                    }}
                                >
                                    <div style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '4px' }}>
                                        🎯 Full Exam Mock Test
                                    </div>
                                    <div style={{ fontSize: '12.5px', color: 'var(--text-secondary)', lineHeight: 1.4 }}>
                                        Simulate real exam with questions mixed across all syllabus topics.
                                    </div>
                                </button>

                                <button
                                    onClick={() => { setMode('yearwise'); setSubject(''); }}
                                    style={{
                                        padding: '16px', borderRadius: '14px', cursor: 'pointer', textAlign: 'left',
                                        background: mode === 'yearwise' ? 'rgba(37, 99, 235, 0.08)' : 'var(--bg-primary)',
                                        border: mode === 'yearwise' ? '2px solid #2563EB' : '1px solid var(--border)',
                                        transition: 'all 0.15s'
                                    }}
                                >
                                    <div style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '4px' }}>
                                        📅 Year-Wise & Paper-Wise PYQ
                                    </div>
                                    <div style={{ fontSize: '12.5px', color: 'var(--text-secondary)', lineHeight: 1.4 }}>
                                        Practice real previous year question papers (2011–2024) by Paper 1 / Paper 2.
                                    </div>
                                </button>

                                <button
                                    onClick={() => { setMode('subject'); setSubject(examTopics[0] || ''); }}
                                    style={{
                                        padding: '16px', borderRadius: '14px', cursor: 'pointer', textAlign: 'left',
                                        background: mode === 'subject' ? 'rgba(13, 148, 136, 0.08)' : 'var(--bg-primary)',
                                        border: mode === 'subject' ? '2px solid var(--brand-teal)' : '1px solid var(--border)',
                                        transition: 'all 0.15s'
                                    }}
                                >
                                    <div style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '4px' }}>
                                        📚 Subject-Wise Drill
                                    </div>
                                    <div style={{ fontSize: '12.5px', color: 'var(--text-secondary)', lineHeight: 1.4 }}>
                                        Focus practice on a specific syllabus domain or weak subject.
                                    </div>
                                </button>
                            </div>

                            {/* Year-Wise & Paper-Wise Filters */}
                            {(mode === 'yearwise' || examId === 'upsc-cse' || examId === 'kpsc-kas') && (
                                <div style={{ marginTop: '20px', paddingTop: '16px', borderTop: '1px solid var(--border)', display: 'flex', flexDirection: 'column', gap: '16px' }}>
                                    {/* Paper Selector */}
                                    <div>
                                        <label style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '8px', display: 'flex', alignItems: 'center', gap: '6px' }}>
                                            <span>📄 SELECT EXAM PAPER:</span>
                                        </label>
                                        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                                            <button
                                                onClick={() => setPaper('all')}
                                                style={{
                                                    padding: '7px 14px', borderRadius: '10px', cursor: 'pointer',
                                                    fontSize: '12.5px', fontWeight: 700,
                                                    background: paper === 'all' ? '#2563EB' : 'var(--bg-primary)',
                                                    color: paper === 'all' ? '#FFFFFF' : 'var(--text-secondary)',
                                                    border: paper === 'all' ? '1px solid #2563EB' : '1px solid var(--border)',
                                                    transition: 'all 0.15s'
                                                }}
                                            >
                                                All Papers (Combined)
                                            </button>
                                            <button
                                                onClick={() => setPaper(1)}
                                                style={{
                                                    padding: '7px 14px', borderRadius: '10px', cursor: 'pointer',
                                                    fontSize: '12.5px', fontWeight: 700,
                                                    background: paper === 1 ? '#2563EB' : 'var(--bg-primary)',
                                                    color: paper === 1 ? '#FFFFFF' : 'var(--text-secondary)',
                                                    border: paper === 1 ? '1px solid #2563EB' : '1px solid var(--border)',
                                                    transition: 'all 0.15s'
                                                }}
                                            >
                                                {examId === 'upsc-cse' ? 'Paper 1: General Studies (GS-1)' : 'Paper 1: General Studies & Humanities'}
                                            </button>
                                            <button
                                                onClick={() => setPaper(2)}
                                                style={{
                                                    padding: '7px 14px', borderRadius: '10px', cursor: 'pointer',
                                                    fontSize: '12.5px', fontWeight: 700,
                                                    background: paper === 2 ? '#2563EB' : 'var(--bg-primary)',
                                                    color: paper === 2 ? '#FFFFFF' : 'var(--text-secondary)',
                                                    border: paper === 2 ? '1px solid #2563EB' : '1px solid var(--border)',
                                                    transition: 'all 0.15s'
                                                }}
                                            >
                                                {examId === 'upsc-cse' ? 'Paper 2: CSAT / Aptitude' : 'Paper 2: Science & Tech, Environment & GMA'}
                                            </button>
                                        </div>
                                    </div>

                                    {/* Year Selector */}
                                    <div>
                                        <label style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '8px', display: 'flex', alignItems: 'center', gap: '6px' }}>
                                            <span>📅 SELECT EXAM YEAR:</span>
                                        </label>
                                        <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                                            <button
                                                onClick={() => setYear('all')}
                                                style={{
                                                    padding: '6px 12px', borderRadius: '9px', cursor: 'pointer',
                                                    fontSize: '12px', fontWeight: 700,
                                                    background: year === 'all' ? 'var(--brand-orange)' : 'var(--bg-primary)',
                                                    color: year === 'all' ? '#FFFFFF' : 'var(--text-secondary)',
                                                    border: year === 'all' ? '1px solid var(--brand-orange)' : '1px solid var(--border)',
                                                    transition: 'all 0.15s'
                                                }}
                                            >
                                                All Years (2011–2024)
                                            </button>
                                            {(examId === 'kpsc-kas' 
                                                ? [2024, 2020, 2017, 2015, 2014, 2012, 2011]
                                                : [2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011]
                                            ).map((yr) => {
                                                const isSelected = year === yr;
                                                return (
                                                    <button
                                                        key={yr}
                                                        onClick={() => setYear(yr)}
                                                        style={{
                                                            padding: '6px 12px', borderRadius: '9px', cursor: 'pointer',
                                                            fontSize: '12px', fontWeight: 700,
                                                            background: isSelected ? 'var(--brand-orange)' : 'var(--bg-primary)',
                                                            color: isSelected ? '#FFFFFF' : 'var(--text-secondary)',
                                                            border: isSelected ? '1px solid var(--brand-orange)' : '1px solid var(--border)',
                                                            transition: 'all 0.15s'
                                                        }}
                                                    >
                                                        {yr} {yr === 2024 ? '🔥' : ''}
                                                    </button>
                                                );
                                            })}
                                        </div>
                                    </div>
                                </div>
                            )}

                            {/* Subject Picker if mode is subject */}
                            {mode === 'subject' && (
                                <div style={{ marginTop: '20px', paddingTop: '16px', borderTop: '1px solid var(--border)' }}>
                                    <label style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '8px', display: 'block' }}>
                                        CHOOSE SUBJECT / TOPIC:
                                    </label>
                                    <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                                        {examTopics.map((sub: string) => {
                                            const isSelected = subject === sub;
                                            return (
                                                <button
                                                    key={sub}
                                                    onClick={() => setSubject(sub)}
                                                    style={{
                                                        padding: '7px 14px', borderRadius: '10px', cursor: 'pointer',
                                                        fontSize: '13px', fontWeight: 600,
                                                        background: isSelected ? 'var(--brand-teal)' : 'var(--bg-primary)',
                                                        color: isSelected ? '#FFFFFF' : 'var(--text-secondary)',
                                                        border: isSelected ? '1px solid var(--brand-teal)' : '1px solid var(--border)',
                                                        transition: 'all 0.15s'
                                                    }}
                                                >
                                                    {sub}
                                                </button>
                                            );
                                        })}
                                    </div>
                                </div>
                            )}
                        </div>

                        {/* Difficulty & Language */}
                        <div className="card" style={{ padding: '24px', borderRadius: '18px', display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '20px' }}>
                            <div>
                                <label style={{ fontSize: '13px', fontWeight: 800, textTransform: 'uppercase', color: 'var(--text-muted)', marginBottom: '10px', display: 'block', letterSpacing: '0.05em' }}>
                                    2. Difficulty Level
                                </label>
                                <div style={{ display: 'flex', gap: '8px', flexWrap: 'wrap' }}>
                                    {DIFFICULTIES.map((d) => (
                                        <button
                                            key={d}
                                            onClick={() => setDifficulty(d)}
                                            style={{
                                                padding: '8px 14px', borderRadius: '10px', cursor: 'pointer',
                                                fontSize: '13px', fontWeight: 700, textTransform: 'capitalize',
                                                background: difficulty === d ? 'var(--bg-secondary)' : 'var(--bg-primary)',
                                                color: difficulty === d ? 'var(--brand-orange)' : 'var(--text-secondary)',
                                                border: difficulty === d ? '1.5px solid var(--brand-orange)' : '1px solid var(--border)',
                                            }}
                                        >
                                            {d}
                                        </button>
                                    ))}
                                </div>
                            </div>

                            <div>
                                <label style={{ fontSize: '13px', fontWeight: 800, textTransform: 'uppercase', color: 'var(--text-muted)', marginBottom: '10px', display: 'block', letterSpacing: '0.05em' }}>
                                    3. Language Medium
                                </label>
                                <div style={{ display: 'flex', gap: '8px' }}>
                                    <button
                                        onClick={() => setTestLang('en')}
                                        style={{
                                            padding: '8px 16px', borderRadius: '10px', cursor: 'pointer',
                                            fontSize: '13px', fontWeight: 700,
                                            background: testLang === 'en' ? 'var(--bg-secondary)' : 'var(--bg-primary)',
                                            color: testLang === 'en' ? 'var(--brand-teal)' : 'var(--text-secondary)',
                                            border: testLang === 'en' ? '1.5px solid var(--brand-teal)' : '1px solid var(--border)',
                                        }}
                                    >
                                        English
                                    </button>
                                    {exam.languages.includes('hi') && (
                                        <button
                                            onClick={() => setTestLang('hi')}
                                            style={{
                                                padding: '8px 16px', borderRadius: '10px', cursor: 'pointer',
                                                fontSize: '13px', fontWeight: 700,
                                                background: testLang === 'hi' ? 'var(--bg-secondary)' : 'var(--bg-primary)',
                                                color: testLang === 'hi' ? 'var(--brand-teal)' : 'var(--text-secondary)',
                                                border: testLang === 'hi' ? '1.5px solid var(--brand-teal)' : '1px solid var(--border)',
                                            }}
                                        >
                                            हिन्दी (Hindi)
                                        </button>
                                    )}
                                    {exam.languages.includes('kn') && (
                                        <button
                                            onClick={() => setTestLang('kn')}
                                            style={{
                                                padding: '8px 16px', borderRadius: '10px', cursor: 'pointer',
                                                fontSize: '13px', fontWeight: 700,
                                                background: testLang === 'kn' ? 'var(--bg-secondary)' : 'var(--bg-primary)',
                                                color: testLang === 'kn' ? 'var(--brand-teal)' : 'var(--text-secondary)',
                                                border: testLang === 'kn' ? '1.5px solid var(--brand-teal)' : '1px solid var(--border)',
                                            }}
                                        >
                                            ಕನ್ನಡ (Kannada)
                                        </button>
                                    )}
                                </div>
                            </div>
                        </div>

                        {/* Question Count & Start CTA */}
                        <div className="card" style={{ padding: '24px', borderRadius: '18px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '14px' }}>
                                <label style={{ fontSize: '13px', fontWeight: 800, textTransform: 'uppercase', color: 'var(--text-muted)', letterSpacing: '0.05em' }}>
                                    4. Number of Questions
                                </label>
                                <span style={{ fontSize: '13px', color: availableQs > 0 ? 'var(--brand-orange)' : 'var(--text-muted)', fontWeight: 700 }}>
                                    {availableQs > 0 ? `${availableQs.toLocaleString()} Questions Available in Pool` : 'Calculating question pool...'}
                                </span>
                            </div>

                            <div style={{ display: 'flex', gap: '10px', flexWrap: 'wrap', marginBottom: '24px' }}>
                                {QUESTION_COUNTS.map((c) => (
                                    <button
                                        key={c}
                                        onClick={() => { setCount(c); setCustomCount(''); }}
                                        style={{
                                            padding: '9px 18px', borderRadius: '10px', cursor: 'pointer',
                                            fontSize: '14px', fontWeight: 700,
                                            background: count === c && !customCount ? 'var(--brand-orange)' : 'var(--bg-primary)',
                                            color: count === c && !customCount ? '#FFFFFF' : 'var(--text-secondary)',
                                            border: count === c && !customCount ? '1px solid var(--brand-orange)' : '1px solid var(--border)',
                                        }}
                                    >
                                        {c} Qs
                                    </button>
                                ))}
                            </div>

                            {/* Negative Marking Alert */}
                            <div style={{ 
                                display: 'flex', alignItems: 'center', gap: '10px', 
                                padding: '12px 16px', borderRadius: '12px', marginBottom: '20px',
                                background: 'rgba(255, 107, 43, 0.08)', border: '1px solid rgba(255, 107, 43, 0.2)' 
                            }}>
                                <AlertTriangle size={18} color="var(--brand-orange)" />
                                <span style={{ fontSize: '13px', color: 'var(--text-secondary)', fontWeight: 600 }}>
                                    Negative marking rule: <strong>{exam.negative_marking > 0 ? `${exam.negative_marking} mark deduction per wrong answer` : 'No negative marking'}</strong>.
                                </span>
                            </div>

                            {/* Start Test Button */}
                            <button
                                onClick={handleStart}
                                style={{
                                    width: '100%', padding: '16px', borderRadius: '14px', cursor: 'pointer',
                                    background: 'var(--brand-orange)', color: '#FFFFFF',
                                    fontSize: '16px', fontWeight: 800, border: 'none',
                                    display: 'flex', alignItems: 'center', justifyContent: 'center', gap: '10px',
                                    boxShadow: '0 4px 16px rgba(255, 107, 43, 0.35)', transition: 'all 0.15s'
                                }}
                            >
                                <Zap size={18} />
                                Start {finalCount} Question Mock Test ➔
                            </button>
                        </div>
                    </div>
                )}

                {/* ═══════════════════════════════════════════════════════════════
                    TAB 2: ABOUT EXAM & OFFICIAL PATTERN
                ═══════════════════════════════════════════════════════════════ */}
                {activeTab === 'about' && examInfo && (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
                        
                        {/* Exam Overview & Conducting Body Card */}
                        <div className="card" style={{ padding: '28px', borderRadius: '20px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '14px' }}>
                                <Landmark size={20} color="var(--brand-teal)" />
                                <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                    Overview & Conducting Authority
                                </h2>
                            </div>
                            <p style={{ fontSize: '14.5px', color: 'var(--text-secondary)', lineHeight: 1.7, marginBottom: '18px' }}>
                                {language === 'kn' && examInfo.overview_kn ? examInfo.overview_kn : examInfo.overview}
                            </p>
                            <div style={{ display: 'flex', gap: '12px', flexWrap: 'wrap' }}>
                                <div style={{ background: 'var(--bg-secondary)', padding: '10px 16px', borderRadius: '10px' }}>
                                    <span style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>CONDUCTING BODY: </span>
                                    <span style={{ fontSize: '13px', fontWeight: 800, color: 'var(--text-primary)' }}>
                                        {language === 'kn' && examInfo.conductingBody_kn ? examInfo.conductingBody_kn : examInfo.conductingBody}
                                    </span>
                                </div>
                                <div style={{ background: 'var(--bg-secondary)', padding: '10px 16px', borderRadius: '10px' }}>
                                    <span style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>CATEGORY: </span>
                                    <span style={{ fontSize: '13px', fontWeight: 800, color: 'var(--brand-orange)', textTransform: 'uppercase' }}>
                                        {examInfo.category}
                                    </span>
                                </div>
                            </div>
                        </div>

                        {/* Official Exam Pattern & Stages Card */}
                        <div className="card" style={{ padding: '28px', borderRadius: '20px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '16px' }}>
                                <Scale size={20} color="var(--brand-orange)" />
                                <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                    Official Examination Stages & Pattern
                                </h2>
                            </div>

                            <div style={{ display: 'flex', flexDirection: 'column', gap: '18px' }}>
                                {examInfo.stages.map((stg) => (
                                    <div key={stg.stageNumber} style={{ border: '1px solid var(--border)', borderRadius: '14px', overflow: 'hidden' }}>
                                        <div style={{ background: 'var(--bg-secondary)', padding: '14px 18px', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                <span style={{ fontSize: '11px', fontWeight: 800, padding: '3px 8px', borderRadius: '6px', background: 'var(--brand-orange)', color: '#FFFFFF' }}>
                                                    STAGE {stg.stageNumber}
                                                </span>
                                                <span style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)' }}>
                                                    {stg.stageName}
                                                </span>
                                            </div>
                                            <span style={{ fontSize: '13px', fontWeight: 700, color: 'var(--brand-teal)' }}>
                                                {stg.totalMarks > 0 ? `${stg.totalMarks} Marks` : 'Qualifying'}
                                            </span>
                                        </div>

                                        <div style={{ padding: '16px 18px' }}>
                                            <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', marginBottom: stg.papers.length > 0 ? '14px' : '0', lineHeight: 1.5 }}>
                                                {stg.description}
                                            </p>

                                            {stg.papers.length > 0 && (
                                                <div style={{ display: 'flex', flexDirection: 'column', gap: '10px' }}>
                                                    {stg.papers.map((p, pIdx) => (
                                                        <div key={pIdx} style={{ background: 'var(--bg-tertiary)', padding: '12px 14px', borderRadius: '10px' }}>
                                                            <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '6px' }}>
                                                                <span style={{ fontSize: '14px', fontWeight: 700, color: 'var(--text-primary)' }}>
                                                                    {p.paperName}
                                                                </span>
                                                                <span style={{ fontSize: '12.5px', fontWeight: 700, color: 'var(--brand-orange)' }}>
                                                                    {p.marks} Marks ({p.durationMinutes} mins)
                                                                </span>
                                                            </div>
                                                            <div style={{ fontSize: '12px', color: 'var(--text-muted)' }}>
                                                                Negative Marking: {p.negativeMarking} • Syllabus: {p.subjects.join(', ')}
                                                            </div>
                                                        </div>
                                                    ))}
                                                </div>
                                            )}
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>

                        {/* Eligibility Criteria & Age Limits Card */}
                        <div className="card" style={{ padding: '28px', borderRadius: '20px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '16px' }}>
                                <UserCheck size={20} color="#8B5CF6" />
                                <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                    Eligibility & Age Limits
                                </h2>
                            </div>

                            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))', gap: '14px', marginBottom: '20px' }}>
                                <div style={{ background: 'var(--bg-secondary)', padding: '14px', borderRadius: '12px' }}>
                                    <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>GENERAL / UNRESERVED</div>
                                    <div style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginTop: '2px' }}>
                                        {examInfo.eligibility.ageLimit.general}
                                    </div>
                                </div>
                                {examInfo.eligibility.ageLimit.obc && (
                                    <div style={{ background: 'var(--bg-secondary)', padding: '14px', borderRadius: '12px' }}>
                                        <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>OBC (NON-CREAMY LAYER)</div>
                                        <div style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginTop: '2px' }}>
                                            {examInfo.eligibility.ageLimit.obc}
                                        </div>
                                    </div>
                                )}
                                {examInfo.eligibility.ageLimit.sc_st && (
                                    <div style={{ background: 'var(--bg-secondary)', padding: '14px', borderRadius: '12px' }}>
                                        <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>SC / ST</div>
                                        <div style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginTop: '2px' }}>
                                            {examInfo.eligibility.ageLimit.sc_st}
                                        </div>
                                    </div>
                                )}
                                {examInfo.eligibility.ageLimit.obc_2a_2b_3a_3b && (
                                    <div style={{ background: 'var(--bg-secondary)', padding: '14px', borderRadius: '12px' }}>
                                        <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>OBC / 2A, 2B, 3A, 3B</div>
                                        <div style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginTop: '2px' }}>
                                            {examInfo.eligibility.ageLimit.obc_2a_2b_3a_3b}
                                        </div>
                                    </div>
                                )}
                                {examInfo.eligibility.ageLimit.sc_st_cat1 && (
                                    <div style={{ background: 'var(--bg-secondary)', padding: '14px', borderRadius: '12px' }}>
                                        <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>SC / ST / CAT-1</div>
                                        <div style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginTop: '2px' }}>
                                            {examInfo.eligibility.ageLimit.sc_st_cat1}
                                        </div>
                                    </div>
                                )}
                            </div>

                            <div>
                                <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '4px' }}>EDUCATIONAL QUALIFICATION:</div>
                                <p style={{ fontSize: '14px', color: 'var(--text-secondary)', lineHeight: 1.5, margin: 0 }}>
                                    {examInfo.eligibility.educationalQualification}
                                </p>
                            </div>

                            {examInfo.eligibility.physicalStandards && examInfo.eligibility.physicalStandards.length > 0 && (
                                <div style={{ marginTop: '16px', paddingTop: '14px', borderTop: '1px solid var(--border)' }}>
                                    <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '6px' }}>PHYSICAL STANDARDS & ENDURANCE:</div>
                                    <ul style={{ paddingLeft: '20px', margin: 0, display: 'flex', flexDirection: 'column', gap: '4px' }}>
                                        {examInfo.eligibility.physicalStandards.map((std, idx) => (
                                            <li key={idx} style={{ fontSize: '13px', color: 'var(--text-secondary)' }}>{std}</li>
                                        ))}
                                    </ul>
                                </div>
                            )}
                        </div>

                        {/* High-Yield Syllabus Focus Card */}
                        {examInfo.syllabusFocus && examInfo.syllabusFocus.length > 0 && (
                            <div className="card" style={{ padding: '28px', borderRadius: '20px' }}>
                                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '16px', flexWrap: 'wrap', gap: '10px' }}>
                                    <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                                        <Layers size={20} color="var(--brand-orange)" />
                                        <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                            High-Yield Syllabus Focus Areas
                                        </h2>
                                    </div>
                                    <Link 
                                        href="/graph" 
                                        style={{ fontSize: '13px', fontWeight: 700, color: 'var(--brand-teal)', textDecoration: 'none' }}
                                    >
                                        Explore 14-Pillar Knowledge Graph ➔
                                    </Link>
                                </div>

                                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))', gap: '12px' }}>
                                    {examInfo.syllabusFocus.map((foc, fIdx) => (
                                        <div key={fIdx} style={{ background: 'var(--bg-secondary)', padding: '16px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '8px' }}>
                                                <span style={{ fontSize: '14px', fontWeight: 800, color: 'var(--text-primary)' }}>{foc.pillarName}</span>
                                                <span style={{ fontSize: '11px', fontWeight: 800, color: 'var(--brand-orange)', background: 'rgba(255, 107, 43, 0.1)', padding: '2px 8px', borderRadius: '6px' }}>{foc.weightage}</span>
                                            </div>
                                            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px' }}>
                                                {foc.topics.map((tp, tIdx) => (
                                                    <span key={tIdx} style={{ fontSize: '11.5px', color: 'var(--text-muted)', background: 'var(--bg-tertiary)', padding: '3px 8px', borderRadius: '6px' }}>
                                                        {tp}
                                                    </span>
                                                ))}
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        )}

                        {/* FAQs Card */}
                        {examInfo.faqs && examInfo.faqs.length > 0 && (
                            <div className="card" style={{ padding: '28px', borderRadius: '20px' }}>
                                <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '16px' }}>
                                    <HelpCircle size={20} color="var(--brand-orange)" />
                                    <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                        Frequently Asked Questions
                                    </h2>
                                </div>

                                <div style={{ display: 'flex', flexDirection: 'column', gap: '12px' }}>
                                    {examInfo.faqs.map((faq, fIdx) => (
                                        <div key={fIdx} style={{ background: 'var(--bg-secondary)', padding: '16px', borderRadius: '12px' }}>
                                            <div style={{ fontSize: '14.5px', fontWeight: 700, color: 'var(--text-primary)', marginBottom: '6px' }}>
                                                Q: {faq.question}
                                            </div>
                                            <div style={{ fontSize: '13.5px', color: 'var(--text-secondary)', lineHeight: 1.6 }}>
                                                A: {faq.answer}
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        )}
                    </div>
                )}

                {/* ═══════════════════════════════════════════════════════════════
                    TAB 3: SERVICES & JOB ROLES (SEPARATE DEDICATED CATEGORY)
                ═══════════════════════════════════════════════════════════════ */}
                {activeTab === 'services' && examInfo && (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>

                        {/* ── ALLOCATED SERVICES & CADRES DIRECTORY (IF COMPOSITE EXAM) ── */}
                        {examInfo.allocatedServices && examInfo.allocatedServices.length > 0 && (
                            <div className="card" style={{ padding: '28px', borderRadius: '20px', border: '1px solid var(--border)' }}>
                                <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '8px' }}>
                                    <div style={{ 
                                        width: '36px', height: '36px', borderRadius: '10px', 
                                        background: 'rgba(37, 99, 235, 0.1)', border: '1px solid rgba(37, 99, 235, 0.25)',
                                        display: 'flex', alignItems: 'center', justifyContent: 'center' 
                                    }}>
                                        <Award size={18} color="#2563EB" />
                                    </div>
                                    <div>
                                        <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                            Services & Cadres Allotted ({examInfo.allocatedServices.length} Distinct Services)
                                        </h2>
                                        <div style={{ fontSize: '13px', color: 'var(--text-muted)' }}>
                                            Candidates qualify and are allotted into the following premier services based on their final rank and service preferences:
                                        </div>
                                    </div>
                                </div>

                                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(320px, 1fr))', gap: '16px', marginTop: '20px' }}>
                                    {examInfo.allocatedServices.map((srv) => {
                                        const srvName = language === 'kn' && srv.serviceName_kn ? srv.serviceName_kn : srv.serviceName;
                                        const isAIS = srv.group.includes('All India') || srv.group.includes('Group A');

                                        return (
                                            <div 
                                                key={srv.serviceCode}
                                                style={{
                                                    background: 'var(--bg-secondary)', padding: '18px', borderRadius: '14px',
                                                    border: '1px solid var(--border)', display: 'flex', flexDirection: 'column', justifyContent: 'space-between'
                                                }}
                                            >
                                                <div>
                                                    <div style={{ display: 'flex', alignItems: 'flex-start', justifyContent: 'space-between', marginBottom: '10px' }}>
                                                        <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                            <span style={{ 
                                                                fontSize: '13px', fontWeight: 900, color: '#FFFFFF',
                                                                background: isAIS ? 'var(--brand-orange)' : 'var(--brand-teal)',
                                                                padding: '4px 10px', borderRadius: '8px'
                                                            }}>
                                                                {srv.serviceCode}
                                                            </span>
                                                            <span style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>
                                                                {srv.group}
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <h3 style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '4px' }}>
                                                        {srvName}
                                                    </h3>
                                                    <div style={{ fontSize: '12.5px', fontWeight: 600, color: 'var(--brand-teal)', marginBottom: '10px' }}>
                                                        🏢 {srv.department}
                                                    </div>

                                                    <p style={{ fontSize: '13px', color: 'var(--text-secondary)', lineHeight: 1.5, marginBottom: '14px' }}>
                                                        {srv.roleDescription}
                                                    </p>
                                                </div>

                                                <div style={{ borderTop: '1px solid var(--border)', paddingTop: '10px', marginTop: 'auto', display: 'flex', flexDirection: 'column', gap: '4px' }}>
                                                    <div style={{ fontSize: '11.5px', color: 'var(--text-muted)' }}>
                                                        <strong>Entry Post:</strong> {srv.entryDesignation}
                                                    </div>
                                                    <div style={{ fontSize: '11.5px', color: 'var(--brand-orange)' }}>
                                                        <strong>Apex Rank:</strong> {srv.careerApex}
                                                    </div>
                                                </div>
                                            </div>
                                        );
                                    })}
                                </div>
                            </div>
                        )}

                        {/* Job Profile & Day-to-Day Responsibilities Card */}
                        <div className="card" style={{ padding: '28px', borderRadius: '20px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '14px' }}>
                                <Briefcase size={20} color="var(--brand-orange)" />
                                <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                    Executive Role & Statutory Responsibilities
                                </h2>
                            </div>

                            <div style={{ 
                                display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(200px, 1fr))', gap: '12px',
                                background: 'var(--bg-secondary)', padding: '16px', borderRadius: '14px', marginBottom: '20px'
                            }}>
                                <div>
                                    <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>PRIMARY DESIGNATION</div>
                                    <div style={{ fontSize: '14.5px', fontWeight: 700, color: 'var(--text-primary)', marginTop: '2px' }}>
                                        {examInfo.jobRole.designation}
                                    </div>
                                </div>
                                <div>
                                    <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>CADRE & CLASS</div>
                                    <div style={{ fontSize: '14.5px', fontWeight: 700, color: 'var(--brand-orange)', marginTop: '2px' }}>
                                        {examInfo.jobRole.cadre}
                                    </div>
                                </div>
                                <div>
                                    <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>DEPARTMENT</div>
                                    <div style={{ fontSize: '14.5px', fontWeight: 700, color: 'var(--text-primary)', marginTop: '2px' }}>
                                        {examInfo.jobRole.department}
                                    </div>
                                </div>
                            </div>

                            <h3 style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '10px' }}>
                                Key On-Duty Responsibilities:
                            </h3>
                            <ul style={{ paddingLeft: '20px', display: 'flex', flexDirection: 'column', gap: '8px', marginBottom: '24px' }}>
                                {examInfo.jobRole.keyResponsibilities.map((resp, idx) => (
                                    <li key={idx} style={{ fontSize: '14px', color: 'var(--text-secondary)', lineHeight: 1.6 }}>
                                        {resp}
                                    </li>
                                ))}
                            </ul>

                            <h3 style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)', marginBottom: '10px' }}>
                                Career Progression Ladder:
                            </h3>
                            <div style={{ display: 'flex', flexDirection: 'column', gap: '8px', marginBottom: '20px' }}>
                                {examInfo.jobRole.careerProgression.map((step, idx) => (
                                    <div key={idx} style={{ display: 'flex', alignItems: 'center', gap: '10px', fontSize: '13.5px', color: 'var(--text-secondary)', background: 'var(--bg-tertiary)', padding: '10px 14px', borderRadius: '10px' }}>
                                        <ChevronRight size={16} color="var(--brand-teal)" />
                                        <span>{step}</span>
                                    </div>
                                ))}
                            </div>

                            <div>
                                <div style={{ fontSize: '12px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '4px' }}>POSTING LOCATIONS & JURISDICTION:</div>
                                <p style={{ fontSize: '13.5px', color: 'var(--text-secondary)', margin: 0, lineHeight: 1.5 }}>
                                    {examInfo.jobRole.postingLocations}
                                </p>
                            </div>
                        </div>

                        {/* Salary, Pay Scale & Allowances Card */}
                        <div className="card" style={{ padding: '28px', borderRadius: '20px' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '16px' }}>
                                <DollarSign size={20} color="var(--brand-teal)" />
                                <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                    Salary Structure & Government Perks
                                </h2>
                            </div>

                            <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(220px, 1fr))', gap: '16px', marginBottom: '20px' }}>
                                <div style={{ background: 'var(--bg-secondary)', padding: '16px', borderRadius: '14px' }}>
                                    <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--text-muted)' }}>PAY SCALE / LEVEL</div>
                                    <div style={{ fontSize: '16px', fontWeight: 800, color: 'var(--text-primary)', marginTop: '4px' }}>
                                        {examInfo.jobRole.payScale.level}
                                    </div>
                                    <div style={{ fontSize: '12.5px', color: 'var(--text-muted)', marginTop: '2px' }}>
                                        Basic: {examInfo.jobRole.payScale.basicPayRange}
                                    </div>
                                </div>

                                <div style={{ background: 'rgba(13, 148, 136, 0.08)', border: '1px solid rgba(13, 148, 136, 0.2)', padding: '16px', borderRadius: '14px' }}>
                                    <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--brand-teal)' }}>APPROX GROSS SALARY</div>
                                    <div style={{ fontSize: '18px', fontWeight: 900, color: 'var(--brand-teal)', marginTop: '4px' }}>
                                        {examInfo.jobRole.payScale.approxMonthlyGross}
                                    </div>
                                </div>
                            </div>

                            <div style={{ fontSize: '13px', fontWeight: 700, color: 'var(--text-muted)', marginBottom: '8px' }}>
                                INCLUDED BENEFITS & ENTITLEMENTS:
                            </div>
                            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                                {examInfo.jobRole.payScale.perks.map((perk, idx) => (
                                    <span key={idx} style={{ display: 'inline-flex', alignItems: 'center', gap: '6px', fontSize: '12.5px', fontWeight: 600, padding: '5px 12px', borderRadius: '8px', background: 'var(--bg-tertiary)', color: 'var(--text-secondary)' }}>
                                        <CheckCircle2 size={13} color="var(--brand-teal)" />
                                        {perk}
                                    </span>
                                ))}
                            </div>
                        </div>
                    </div>
                )}

                {/* ═══════════════════════════════════════════════════════════════
                    TAB 4: SYLLABUS MIND MAP (EXAM-TAILORED PRUNED HIERARCHY)
                ═══════════════════════════════════════════════════════════════ */}
                {activeTab === 'mindmap' && (
                    <div>
                        <ExamMindMapVisualizer initialExamId={examId} showExamPicker={false} />
                    </div>
                )}
            </div>
        </div>
    );
}
