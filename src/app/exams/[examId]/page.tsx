'use client';
import { use, useState, useEffect, useRef, useId, Fragment } from 'react';
import type { KeyboardEvent, ReactNode } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import Link from 'next/link';
import { supabase } from '@/lib/supabase';
import { useAppStore } from '@/lib/store';
import { EXAMS } from '@/lib/mockData';
import { getMarkingScheme, formatMarks } from '@/lib/marking';
import { hasExamMindMap } from '@/lib/mindMapIds';
import { getExamInfo, ExamInfo } from '@/data/examDetails';
import { TestConfig, Language, TestMode } from '@/types';
import { 
    ArrowRight, AlertTriangle, BookOpen, Zap, 
    Award, CheckCircle2, DollarSign, Briefcase, 
    Layers, HelpCircle, ChevronRight, UserCheck, Scale, Landmark,
    Compass, ArrowLeft, Check, CalendarDays, Target, Shuffle
} from 'lucide-react';
import dynamic from 'next/dynamic';

// The syllabus data is large; load it only when the Syllabus map tab opens.
const ExamMindMapVisualizer = dynamic(() => import('@/components/graph/ExamMindMapVisualizer'), { ssr: false });
import './exam-detail.css';

const QUESTION_COUNTS = [10, 25, 50, 100];
const DIFFICULTIES = ['mixed', 'easy', 'medium', 'hard'] as const;
const CSAT_TOPICS = [
    'Reading Comprehension & Interpersonal Skills',
    'Quantitative Aptitude & Basic Numeracy',
    'General Mental Ability & Logical Reasoning'
];

type ActiveTab = 'practice' | 'about' | 'services' | 'mindmap';

type Opt = { key: string; label: string; meta?: string; selected: boolean; onSelect: () => void };

function Chip({ selected, onSelect, meta, muted, disabled, children }: {
    selected: boolean; onSelect: () => void; meta?: string; muted?: boolean; disabled?: boolean; children: ReactNode;
}) {
    return (
        <button
            type="button"
            className="xd-chip"
            aria-pressed={selected}
            data-muted={muted ? '' : undefined}
            disabled={disabled}
            onClick={onSelect}
        >
            <span>{children}</span>
            {meta && <span className="xd-chip-meta">{meta}</span>}
        </button>
    );
}

function OptionGroup({ label, hint, children }: { label: string; hint?: string; children: ReactNode }) {
    const id = useId();
    return (
        <div className="xd-field">
            <span id={id} className="xd-label">
                {label}{hint && <span className="xd-label-hint">{hint}</span>}
            </span>
            <div className="xd-chips" role="group" aria-labelledby={id}>{children}</div>
        </div>
    );
}

export default function ExamDetailPage({ params }: { params: Promise<{ examId: string }> }) {
    const { examId } = use(params);
    const searchParams = useSearchParams();
    const router = useRouter();
    const { user, language, setActiveSession } = useAppStore();

    // Determine initial tab from query parameter: ?tab=about | ?tab=services | ?tab=mindmap | default practice
    const tabParam = searchParams.get('tab');
    const initialTab: ActiveTab = tabParam === 'about' ? 'about' : tabParam === 'services' ? 'services' : tabParam === 'mindmap' && hasExamMindMap(examId) ? 'mindmap' : 'practice';
    const [activeTab, setActiveTab] = useState<ActiveTab>(initialTab);

    const [exam, setExam] = useState<any>(null);
    const [examInfo, setExamInfo] = useState<ExamInfo | undefined>(undefined);
    const [loading, setLoading] = useState(true);
    const [availableQs, setAvailableQs] = useState(0);
    const [countLoading, setCountLoading] = useState(true);
    const loadedExamIdRef = useRef<string | null>(null);

    // Presets from links such as ?mode=subject&subject=Polity (syllabus map practice links)
    const presetMode = searchParams.get('mode');
    const [mode, setMode] = useState<TestMode>(presetMode === 'subject' || presetMode === 'yearwise' ? presetMode : 'full');
    const [subject, setSubject] = useState(presetMode === 'subject' ? (searchParams.get('subject') ?? '') : '');
    const [difficulty, setDifficulty] = useState<'mixed' | 'easy' | 'medium' | 'hard'>('mixed');
    const [year, setYear] = useState<number | 'all'>('all');
    // Presets from links such as /exams/upsc-cse?paper=1&count=100 (homepage CTAs)
    const presetPaper = searchParams.get('paper');
    const presetCount = Number(searchParams.get('count'));
    const validPreset = Number.isInteger(presetCount) && presetCount > 0 && presetCount <= 200 ? presetCount : 0;
    const [paper, setPaper] = useState<number | 'all'>(presetPaper === '1' ? 1 : presetPaper === '2' ? 2 : 'all');
    const [paperCode, setPaperCode] = useState<'all' | 'hk' | 'nhk' | 'eoao' | 'apfc' | 'eoao-apfc' | string>('all');
    const [month, setMonth] = useState<string | 'all'>('all');
    const [count, setCount] = useState(validPreset && QUESTION_COUNTS.includes(validPreset) ? validPreset : 25);
    const [customCount, setCustomCount] = useState(validPreset && !QUESTION_COUNTS.includes(validPreset) ? String(validPreset) : '');
    const [testLang, setTestLang] = useState<Language>(language);

    useEffect(() => {
        let cancelled = false;
        async function loadExamData() {
            // Only blank the whole page on the first load of an exam; filter changes just refresh the count.
            if (loadedExamIdRef.current !== examId) setLoading(true);
            setCountLoading(true);
            const localExam = EXAMS.find(e => e.id === examId);
            if (localExam && !localExam.languages.includes(testLang)) {
                setTestLang(localExam.languages[0] || 'en');
            }
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
                    if (paper === 2) {
                        let query = supabase.from('csat_pyq').select('id', { count: 'exact', head: true }).gt('year', 0);
                        if (mode === 'subject' && subject) query = query.or(`domain.ilike.%${subject}%,sub_topic.ilike.%${subject}%`);
                        if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                        if (year !== 'all') query = query.eq('year', year);
                        const { count: cCount, error: cErr } = await query;
                        if (!cErr && cCount !== null) {
                            qCount = cCount;
                        } else {
                            qCount = mode === 'subject' || difficulty !== 'mixed' ? 0 : 80; // bundled CSAT paper, unfiltered only
                        }
                    } else if (paper === 1) {
                        let query = supabase.from('upsc_questions').select('id', { count: 'exact', head: true }).gt('year', 0);
                        if (mode === 'subject' && subject) query = query.ilike('subject', `%${subject}%`);
                        if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                        if (year !== 'all') query = query.eq('year', year);
                        const { count: uCount } = await query;
                        qCount = uCount || 0;
                    } else if (mode === 'subject' && subject) {
                        // "All papers" + a subject: count only the paper that subject belongs to
                        if (CSAT_TOPICS.includes(subject)) {
                            let query = supabase.from('csat_pyq').select('id', { count: 'exact', head: true }).gt('year', 0)
                                .or(`domain.ilike.%${subject}%,sub_topic.ilike.%${subject}%`);
                            if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                            if (year !== 'all') query = query.eq('year', year);
                            const { count: cCount } = await query;
                            qCount = cCount || 0;
                        } else {
                            let query = supabase.from('upsc_questions').select('id', { count: 'exact', head: true }).gt('year', 0)
                                .ilike('subject', `%${subject}%`);
                            if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                            if (year !== 'all') query = query.eq('year', year);
                            const { count: uCount } = await query;
                            qCount = uCount || 0;
                        }
                    } else {
                        let q1 = supabase.from('upsc_questions').select('id', { count: 'exact', head: true }).gt('year', 0);
                        let q2 = supabase.from('csat_pyq').select('id', { count: 'exact', head: true }).gt('year', 0);
                        if (difficulty !== 'mixed') {
                            q1 = q1.eq('difficulty', difficulty);
                            q2 = q2.eq('difficulty', difficulty);
                        }
                        if (year !== 'all') {
                            q1 = q1.eq('year', year);
                            q2 = q2.eq('year', year);
                        }
                        const [{ count: c1 }, { count: c2, error: c2Err }] = await Promise.all([q1, q2]);
                        qCount = (c1 || 0) + (c2 !== null && !c2Err ? c2 : 80);
                    }
                } else if (examId === 'upsc-capf') {
                    let query = supabase.from('capf_pyq').select('id', { count: 'exact', head: true });
                    if (mode === 'subject' && subject) {
                        query = query.or(`subject.eq."${subject}",subject_hindi.eq."${subject}"`);
                    }
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                    if (year !== 'all') query = query.eq('year', year);

                    const { count: capfCount, error: capfErr } = await query;
                    if (!capfErr && capfCount !== null) {
                        qCount = capfCount;
                    } else {
                        qCount = year === 'all' ? 1625 : 125;
                    }
                } else if (examId === 'upsc-epfo') {
                    let query = supabase.from('epfo_pyq').select('id', { count: 'exact', head: true });
                    if (paperCode !== 'all') query = query.eq('paper_code', paperCode);
                    if (mode === 'subject' && subject) {
                        query = query.or(`subject.eq."${subject}",subject_hindi.eq."${subject}"`);
                    }
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                    if (year !== 'all') query = query.eq('year', year);

                    const { count: epfoCount, error: epfoErr } = await query;
                    if (!epfoErr && epfoCount !== null) {
                        qCount = epfoCount;
                    } else {
                        qCount = year === 'all' ? 1060 : (year === 2012 ? 100 : 120);
                    }
                } else if (examId === 'ksp-pc') {
                    let query = supabase.from('pc_pyq').select('id', { count: 'exact', head: true });
                    if (paperCode !== 'all') query = query.eq('paper_code', paperCode);
                    if (mode === 'subject' && subject) {
                        query = query.or(`subject.eq."${subject}",subject_kannada.eq."${subject}"`);
                    }
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);

                    const { count: pcCount, error: pcErr } = await query;
                    if (!pcErr && pcCount !== null) {
                        qCount = pcCount;
                    } else {
                        qCount = paperCode === 'all' ? 200 : 100;
                    }
                } else if (examId === 'ksp-psi') {
                    let query = supabase.from('psi_pyq').select('id', { count: 'exact', head: true }).eq('paper', 2);
                    if (mode === 'subject' && subject) {
                        query = query.or(`subject.eq."${subject}",subject_kannada.eq."${subject}"`);
                    }
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                    if (year !== 'all') query = query.eq('year', year);
                    const { count: psiCount } = await query;
                    qCount = psiCount || 0;
                } else if (examId === 'kpsc-kas') {
                    let query = supabase.from('kas_questions').select('id', { count: 'exact', head: true });
                    if (mode === 'subject' && subject) query = query.eq('subject', subject);
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                    if (year !== 'all') query = query.eq('year', year);
                    if (paper !== 'all') query = query.eq('paper', paper);
                    if (month !== 'all') query = query.eq('month', month);

                    const { count } = await query;
                    qCount = count || 0;
                } else if (examId === 'kea' || examId.startsWith('kea-')) {
                    let query = supabase.from('kea_questions').select('id', { count: 'exact', head: true });
                    
                    if (paperCode !== 'all') {
                        if (paperCode === 'fda-sda') {
                            query = query.or('paper_code.ilike.%fda%,paper_code.ilike.%sda%,paper_code.ilike.%kec1%');
                        } else if (paperCode === 'vao') {
                            query = query.or('paper_code.ilike.%vao%,paper_code.ilike.%compulsory_kannada%');
                        } else if (paperCode === 'police') {
                            query = query.or('paper_code.ilike.%civilpc%,paper_code.ilike.%ksrp%,paper_code.ilike.%psi%');
                        } else if (paperCode === 'leg-council') {
                            query = query.ilike('paper_code', '%legcouncil%');
                        } else if (paperCode === 'tech-eng') {
                            query = query.or('paper_code.ilike.%bwssb%,paper_code.ilike.%kuwsdb%,paper_code.ilike.%kridl%,paper_code.ilike.%ksscl%,paper_code.ilike.%gttc%');
                        } else if (paperCode === 'coaching') {
                            query = query.or('paper_code.ilike.%coaching%,paper_code.ilike.%swd%,paper_code.ilike.%bcwd%,paper_code.ilike.%minority%');
                        } else {
                            query = query.eq('paper_code', paperCode);
                        }
                    } else if (examId === 'kea-vao') {
                        query = query.or('paper_code.ilike.%vao%,paper_code.ilike.%compulsory_kannada%');
                    } else if (examId === 'kea-kset') {
                        query = query.ilike('paper_code', '%kset%');
                    }

                    if (mode === 'subject' && subject) {
                        query = query.or(`subject.eq."${subject}",subject_kannada.eq."${subject}"`);
                    }
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                    if (year !== 'all') query = query.eq('year', year);

                    const { count: keaCount, error: keaErr } = await query;
                    if (!keaErr && keaCount !== null) {
                        qCount = keaCount;
                    } else {
                        qCount = 6364;
                    }
                } else {
                    let query = supabase.from('questions').select('id', { count: 'exact', head: true }).eq('exam_id', examId);
                    if (mode === 'subject' && subject) query = query.eq('subject', subject);
                    if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);

                    const { count } = await query;
                    qCount = count || 0;
                }
                if (cancelled) return;
                setAvailableQs(qCount);
            }
            if (cancelled) return;
            loadedExamIdRef.current = examId;
            setCountLoading(false);
            setLoading(false);
        }
        loadExamData();
        return () => { cancelled = true; };
    }, [examId, mode, subject, difficulty, year, paper, paperCode, month]);

    if (loading) {
        return (
            <div className="xd-page" aria-busy="true" aria-label="Loading exam">
                <div className="xd-wrap xd-loading">
                    <span className="xd-skel" style={{ width: 90, height: 16 }} />
                    <span className="xd-skel" style={{ width: 260, height: 34, marginTop: 20 }} />
                    <span className="xd-skel" style={{ width: '60%', height: 16, marginTop: 10 }} />
                    <span className="xd-skel" style={{ width: '100%', height: 44, marginTop: 28 }} />
                    <span className="xd-skel" style={{ width: '100%', height: 360, marginTop: 28, borderRadius: 16 }} />
                </div>
            </div>
        );
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

    const finalCount = countLoading ? 0 : Math.min(Number(customCount) || count, availableQs);

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
            year: examId === 'upsc-cse' || examId === 'kpsc-kas' || examId === 'upsc-capf' || examId === 'upsc-epfo' || examId === 'ksp-psi' || examId === 'kea' || examId.startsWith('kea-') ? year : examId === 'ksp-pc' ? 2026 : undefined,
            paper: examId === 'upsc-cse' || examId === 'kpsc-kas' ? paper : examId === 'ksp-pc' ? 1 : examId === 'ksp-psi' ? 2 : ((examId === 'upsc-capf' || examId === 'upsc-epfo') ? 1 : undefined),
            month: examId === 'kpsc-kas' ? month : examId === 'ksp-pc' ? 'September' : undefined,
            paper_code: examId === 'ksp-pc' || examId === 'upsc-epfo' || examId === 'kea' || examId.startsWith('kea-') ? paperCode : undefined
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
    
    // value = the subject name stored on the questions (used for filtering); label = what the button shows
    const subjectValues: string[] = exam.topics || exam.subjects || [];
    // UPSC CSE: Paper 1 subjects and Paper 2 (CSAT) areas are separate lists. When the paper changes,
    // a subject that doesn't belong to it would match nothing — move to the first subject of that paper.
    const selectPaper = (p: number | 'all') => {
        setPaper(p);
        if (examId !== 'upsc-cse' || mode !== 'subject') return;
        const isCsat = CSAT_TOPICS.includes(subject);
        if (p === 2 && !isCsat) setSubject(CSAT_TOPICS[0]);
        else if (p === 1 && isCsat) setSubject(subjectValues[0] || '');
    };
    const subjectLabels: string[] | undefined = language === 'kn' && exam.subjects_kn?.length === subjectValues.length ? exam.subjects_kn : undefined;
    let examTopics: { value: string; label: string }[] = subjectValues.map((v, i) => ({ value: v, label: subjectLabels ? subjectLabels[i] : v }));
    if (examId === 'upsc-cse') {
        const csat = CSAT_TOPICS.map(v => ({ value: v, label: v }));
        if (paper === 2) examTopics = csat;
        else if (paper === 'all') examTopics = [...examTopics, ...csat];
    }

    // ── Practice-tab option model ───────────────────────────────────────
    const isKea = examId === 'kea' || examId.startsWith('kea-');
    const showPaperYear = examId !== 'ksp-pc' && (mode === 'yearwise' || ['upsc-cse', 'kpsc-kas', 'upsc-capf', 'upsc-epfo', 'ksp-psi'].includes(examId) || isKea);

    const codeOpt = (code: string, label: string, meta?: string, onSelect?: () => void): Opt => ({
        key: code, label, meta, selected: paperCode === code, onSelect: onSelect || (() => setPaperCode(code)),
    });
    let paperOptions: Opt[] = [];
    if (examId === 'ksp-pc') {
        paperOptions = [
            codeOpt('all', 'All papers', 'HK + NHK · 200 Qs'),
            codeOpt('hk', 'HK CAR/DAR 2026', 'Hyderabad-Karnataka · 100 Qs'),
            codeOpt('nhk', 'NHK CAR/DAR 2026', 'Non-HK, state-wide · 100 Qs'),
        ];
    } else if (examId === 'ksp-psi') {
        paperOptions = []; // Paper 1 is descriptive; practice uses objective Paper 2
    } else if (isKea) {
        paperOptions = [
            codeOpt('all', 'All papers', '64 papers · 6,364 Qs'),
            codeOpt('fda-sda', 'FDA & SDA', '12 papers'),
            codeOpt('vao', 'VAO & Compulsory Kannada', '4 papers'),
            codeOpt('police', 'Civil PC, KSRP/KSISF & PSI', '5 papers'),
            codeOpt('leg-council', 'Legislative Council', '6 papers'),
            codeOpt('tech-eng', 'Technical & Engineering', 'GTTC, BWSSB, KRIDL'),
            codeOpt('coaching', 'Free coaching entrance', 'SWD, BCWD, IAS/KAS'),
        ];
    } else if (examId === 'upsc-epfo') {
        paperOptions = [
            codeOpt('all', 'All papers', '9 papers · 1,060 Qs'),
            codeOpt('eoao', 'EO/AO', '360 Qs', () => {
                setPaperCode('eoao');
                if (year !== 'all' && ![2023, 2021, 2017].includes(Number(year))) setYear('all');
            }),
            codeOpt('apfc', 'APFC', '580 Qs', () => {
                setPaperCode('apfc');
                if (year !== 'all' && ![2023, 2016, 2012, 2004, 2002].includes(Number(year))) setYear('all');
            }),
            codeOpt('eoao-apfc', 'Combined EO/AO & APFC', '2025 paper · 120 Qs', () => {
                setPaperCode('eoao-apfc');
                setYear(2025);
            }),
        ];
    } else {
        paperOptions = [
            { key: 'all', label: 'All papers', meta: examId === 'upsc-capf' ? '13 years · 1,625 Qs' : 'Combined', selected: paper === 'all', onSelect: () => selectPaper('all') },
            {
                key: '1',
                label: examId === 'upsc-capf' ? 'Paper 1 · General Ability & Intelligence' : examId === 'upsc-cse' ? 'Paper 1 · General Studies' : 'Paper 1 · General Studies & Humanities',
                meta: examId === 'upsc-capf' ? '125 Qs · 250 marks' : undefined,
                selected: paper === 1,
                onSelect: () => selectPaper(1),
            },
        ];
        if (examId !== 'upsc-capf') {
            paperOptions.push({
                key: '2',
                label: examId === 'upsc-cse' ? 'Paper 2 · CSAT' : 'Paper 2 · Science & Tech, Environment & GMA',
                selected: paper === 2,
                onSelect: () => selectPaper(2),
            });
        }
    }

    const yearList: number[] = isKea
        ? [2026, 2025, 2024, 2023]
        : examId === 'upsc-capf'
            ? [2026, 2025, 2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014]
            : examId === 'upsc-epfo'
                ? [2025, 2023, 2021, 2017, 2016, 2012, 2004, 2002]
                : examId === 'kpsc-kas'
                    ? [2024, 2020, 2017, 2015, 2011]
                    : examId === 'ksp-psi'
                    ? [2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016]
                    : examId === 'upsc-cse'
                    ? [2026, 2025, 2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011]
                    : [2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011];
    const allYearsRange = isKea ? '2023–2026' : examId === 'upsc-capf' ? '2014–2026' : examId === 'upsc-epfo' ? '2002–2025' : examId === 'ksp-psi' ? '2016–2024'
        : examId === 'upsc-cse' ? (paper === 2 ? '2013–2026' : paper === 1 ? '1993–2024' : '1993–2026') : '2011–2024';
    const epfoYearMeta = (yr: number) => yr === 2025 ? 'Combined' : yr === 2023 ? 'EO/AO & APFC' : [2021, 2017].includes(yr) ? 'EO/AO' : 'APFC';
    const epfoYearMatches = (yr: number) => examId !== 'upsc-epfo' || paperCode === 'all'
        || (paperCode === 'eoao' && [2023, 2021, 2017].includes(yr))
        || (paperCode === 'apfc' && [2023, 2016, 2012, 2004, 2002].includes(yr))
        || (paperCode === 'eoao-apfc' && yr === 2025);
    const selectYear = (yr: number) => {
        setYear(yr);
        if (yr !== 2024) setMonth('all');
        if (examId === 'upsc-epfo') {
            if (yr === 2025) setPaperCode('eoao-apfc');
            else if ([2021, 2017].includes(yr)) { if (paperCode === 'apfc' || paperCode === 'eoao-apfc') setPaperCode('eoao'); }
            else if ([2016, 2012, 2004, 2002].includes(yr)) { if (paperCode === 'eoao' || paperCode === 'eoao-apfc') setPaperCode('apfc'); }
            else if (yr === 2023 && paperCode === 'eoao-apfc') setPaperCode('all');
        }
    };

    const modes = [
        { id: 'full' as TestMode, title: 'Full mock test', desc: 'Questions from the whole syllabus, shuffled like a fresh paper.', Icon: Shuffle, onSelect: () => { setMode('full'); setSubject(''); } },
        { id: 'yearwise' as TestMode, title: 'Previous year paper', desc: 'A real past paper, in its original question order.', Icon: CalendarDays, onSelect: () => { setMode('yearwise'); setSubject(''); if (examId === 'kpsc-kas' && year === 'all') setYear(2024); } },
        { id: 'subject' as TestMode, title: 'Subject drill', desc: 'Practise one subject at a time to fix weak areas.', Icon: Target, onSelect: () => { setMode('subject'); setSubject(subject || examTopics[0]?.value || ''); } },
    ];

    const countOptions = examId === 'upsc-capf' ? [...QUESTION_COUNTS, 125]
        : examId === 'upsc-epfo' ? [...QUESTION_COUNTS, 120]
            : availableQs >= 200 ? [...QUESTION_COUNTS, 200] : QUESTION_COUNTS;
    const countMeta = (c: number) =>
        (c === 125 && examId === 'upsc-capf') || (c === 120 && examId === 'upsc-epfo') || (c === 100 && availableQs === 100) ? 'Full paper'
            : c === 200 ? 'Full exam' : undefined;
    const requestedCount = Number(customCount) || count;
    const secsPerQ = examId === 'upsc-epfo' ? 60 : 72;
    const marking = getMarkingScheme(examId, paper);
    const durationMin = Math.round((finalCount * secsPerQ) / 60);
    const langNames: Record<string, string> = { en: 'English', hi: 'हिन्दी (Hindi)', kn: 'ಕನ್ನಡ (Kannada)' };

    const summaryRows: [string, string][] = [
        ['Mode', modes.find(m => m.id === mode)?.title || ''],
    ];
    if ((showPaperYear || examId === 'ksp-pc') && paperOptions.length > 0) summaryRows.push(['Paper', paperOptions.find(o => o.selected)?.label || '—']);
    if (examId === 'ksp-psi') summaryRows.push(['Paper', 'Paper 2 · General Studies']);
    if (showPaperYear) {
        const monthLabel = examId === 'kpsc-kas' && year === 2024 && month !== 'all' ? (month === 'august' ? ' · August' : ' · December') : '';
        summaryRows.push(['Year', year === 'all' ? `All (${allYearsRange})` : `${year}${monthLabel}`]);
    }
    if (mode === 'subject') summaryRows.push(['Subject', examTopics.find(t => t.value === subject)?.label || '—']);
    summaryRows.push(['Difficulty', difficulty.charAt(0).toUpperCase() + difficulty.slice(1)]);
    summaryRows.push(['Language', langNames[testLang] || testLang]);
    summaryRows.push(['Duration', finalCount > 0 ? `~${durationMin} min` : '—']);

    const startLabel = countLoading ? 'Checking question pool…' : finalCount > 0 ? `Start ${finalCount}-question test` : 'No questions match';

    const tabs = [
        { id: 'practice' as ActiveTab, label: 'Practice test', Icon: Zap },
        ...(examInfo ? [
            { id: 'about' as ActiveTab, label: 'Exam pattern', Icon: BookOpen },
            { id: 'services' as ActiveTab, label: 'Services & roles', Icon: Briefcase },
        ] : []),
        ...(hasExamMindMap(examId) ? [{ id: 'mindmap' as ActiveTab, label: 'Syllabus map', Icon: Compass }] : []),
    ];
    const selectTab = (id: ActiveTab) => {
        setActiveTab(id);
        router.replace(id === 'practice' ? `/exams/${examId}` : `/exams/${examId}?tab=${id}`, { scroll: false });
    };
    const onTabKey = (e: KeyboardEvent) => {
        if (e.key !== 'ArrowRight' && e.key !== 'ArrowLeft') return;
        const idx = tabs.findIndex(t => t.id === activeTab);
        const next = tabs[(idx + (e.key === 'ArrowRight' ? 1 : tabs.length - 1)) % tabs.length];
        selectTab(next.id);
        document.getElementById(`xd-tab-${next.id}`)?.focus();
    };

    return (
        <div className="xd-page">
            <div className="xd-wrap">

                <Link href="/exams" className="xd-back">
                    <ArrowLeft size={16} /> All exams
                </Link>

                <header className="xd-head">
                    <div style={{ minWidth: 0 }}>
                        <h1 className="xd-title">{examTitle}</h1>
                        <p className="xd-desc">{examDesc}</p>
                    </div>
                    {examInfo && <span className="xd-badge">{examInfo.jobRole.cadre}</span>}
                </header>

                <div className="xd-tabs" role="tablist" aria-label="Exam sections" onKeyDown={onTabKey}>
                    {tabs.map(({ id, label, Icon }) => (
                        <button
                            key={id}
                            id={`xd-tab-${id}`}
                            type="button"
                            role="tab"
                            aria-selected={activeTab === id}
                            aria-controls={`xd-panel-${id}`}
                            tabIndex={activeTab === id ? 0 : -1}
                            className="xd-tab"
                            onClick={() => selectTab(id)}
                        >
                            <Icon size={16} /> {label}
                        </button>
                    ))}
                </div>

                {/* ═══════════════════════════════════════════════════════════════
                    TAB 1: PRACTICE TEST SETUP
                ═══════════════════════════════════════════════════════════════ */}
                {activeTab === 'practice' && (
                    <div id="xd-panel-practice" role="tabpanel" aria-labelledby="xd-tab-practice" className="xd-practice">
                        <div className="xd-panel xd-form">

                            {/* Mode */}
                            <section className="xd-section" aria-labelledby="xd-mode-h">
                                <h2 id="xd-mode-h" className="xd-section-title">Test mode</h2>
                                <p className="xd-section-sub">Choose how questions are picked for this test.</p>
                                <div className="xd-modes" role="group" aria-labelledby="xd-mode-h">
                                    {modes.map(({ id, title, desc, Icon, onSelect }) => (
                                        <button key={id} type="button" className="xd-mode" aria-pressed={mode === id} onClick={onSelect}>
                                            <span className="xd-mode-icon"><Icon size={18} /></span>
                                            <span className="xd-mode-title">{title}</span>
                                            <span className="xd-mode-desc">{desc}</span>
                                            <Check size={18} strokeWidth={2.5} className="xd-mode-check" aria-hidden="true" />
                                        </button>
                                    ))}
                                </div>
                            </section>

                            {/* Paper & year */}
                            {(showPaperYear || examId === 'ksp-pc') && (
                                <section className="xd-section" aria-labelledby="xd-paper-h">
                                    <h2 id="xd-paper-h" className="xd-section-title">{examId === 'ksp-pc' ? 'Paper' : paperOptions.length === 0 ? 'Year' : 'Paper & year'}</h2>
                                    <p className="xd-section-sub">
                                        {examId === 'ksp-pc'
                                            ? 'September 2026 session, checked against the official answer key.'
                                            : mode === 'yearwise' ? 'Pick the paper you want to sit.' : 'Optional — narrow the question pool.'}
                                    </p>

                                    {paperOptions.length > 0 && (
                                        <OptionGroup label={examId === 'ksp-pc' ? 'Cadre / region' : 'Paper'}>
                                            {paperOptions.map(o => (
                                                <Chip key={o.key} selected={o.selected} onSelect={o.onSelect} meta={o.meta}>{o.label}</Chip>
                                            ))}
                                        </OptionGroup>
                                    )}

                                    {showPaperYear && (
                                        <OptionGroup label="Year">
                                            <Chip selected={year === 'all'} onSelect={() => { setYear('all'); setMonth('all'); }} meta={allYearsRange}>All years</Chip>
                                            {yearList.map(yr => (
                                                <Chip
                                                    key={yr}
                                                    selected={year === yr}
                                                    onSelect={() => selectYear(yr)}
                                                    meta={examId === 'upsc-epfo' ? epfoYearMeta(yr) : undefined}
                                                    muted={!epfoYearMatches(yr)}
                                                >
                                                    {yr}
                                                </Chip>
                                            ))}
                                        </OptionGroup>
                                    )}

                                    {examId === 'kpsc-kas' && year === 2024 && (
                                        <OptionGroup label="2024 sitting" hint="KPSC held two sittings in 2024">
                                            <Chip selected={month === 'august'} onSelect={() => setMonth('august')} meta="Original · 27 Aug 2024">August</Chip>
                                            <Chip selected={month === 'december'} onSelect={() => setMonth('december')} meta="Re-exam · 29 Dec 2024">December</Chip>
                                            <Chip selected={month === 'all'} onSelect={() => setMonth('all')} meta="Combined pool">Both sittings</Chip>
                                        </OptionGroup>
                                    )}
                                </section>
                            )}

                            {/* Subject */}
                            {mode === 'subject' && (
                                <section className="xd-section" aria-labelledby="xd-subject-h">
                                    <h2 id="xd-subject-h" className="xd-section-title">Subject</h2>
                                    <p className="xd-section-sub">Only questions from this subject will be included.</p>
                                    <div className="xd-chips" role="group" aria-labelledby="xd-subject-h">
                                        {examTopics.map(({ value, label }) => (
                                            <Chip key={value} selected={subject === value} onSelect={() => setSubject(value)}>{label}</Chip>
                                        ))}
                                    </div>
                                </section>
                            )}

                            {/* Difficulty & language */}
                            <section className="xd-section" aria-label="Difficulty and language">
                                <div className="xd-two">
                                    <div className="xd-field">
                                        <span id="xd-diff-l" className="xd-label">Difficulty</span>
                                        <div className="xd-seg" role="group" aria-labelledby="xd-diff-l">
                                            {DIFFICULTIES.map(d => (
                                                <button key={d} type="button" aria-pressed={difficulty === d} onClick={() => setDifficulty(d)}>{d}</button>
                                            ))}
                                        </div>
                                    </div>
                                    <OptionGroup label="Question language">
                                        {(['en', 'hi', 'kn'] as Language[]).filter(l => l === 'en' || exam.languages.includes(l)).map(l => (
                                            <Chip key={l} selected={testLang === l} onSelect={() => setTestLang(l)}>{langNames[l]}</Chip>
                                        ))}
                                    </OptionGroup>
                                </div>
                            </section>

                            {/* Question count */}
                            <section className="xd-section" aria-labelledby="xd-count-h">
                                <h2 id="xd-count-h" className="xd-section-title">Number of questions</h2>
                                <p className="xd-section-sub">
                                    {!countLoading && availableQs > 0 && requestedCount > availableQs
                                        ? `Only ${availableQs.toLocaleString()} questions match, so the test will include all of them.`
                                        : 'Shorter sets are good for quick revision; full papers build exam stamina.'}
                                </p>
                                <div className="xd-chips" role="group" aria-labelledby="xd-count-h">
                                    {countOptions.map(c => (
                                        <Chip
                                            key={c}
                                            selected={count === c && !customCount}
                                            onSelect={() => { setCount(c); setCustomCount(''); }}
                                            disabled={!countLoading && c > availableQs}
                                            meta={countMeta(c)}
                                        >
                                            {c}
                                        </Chip>
                                    ))}
                                    <label className="xd-count-input" data-active={customCount ? '' : undefined}>
                                        Custom
                                        <input
                                            type="number"
                                            inputMode="numeric"
                                            min={1}
                                            max={availableQs || undefined}
                                            placeholder="—"
                                            value={customCount}
                                            onChange={(e) => setCustomCount(e.target.value.replace(/\D/g, '').slice(0, 4))}
                                            aria-label="Custom number of questions"
                                        />
                                    </label>
                                </div>
                            </section>
                        </div>

                        {/* Summary & start */}
                        <aside className="xd-panel xd-summary" aria-label="Test summary">
                            <div className="xd-pool" aria-live="polite" data-empty={!countLoading && availableQs === 0 ? '' : undefined}>
                                {countLoading
                                    ? <><span className="xd-skel" aria-hidden="true" /><span>Checking question pool…</span></>
                                    : <><strong>{availableQs.toLocaleString()}</strong><span>{availableQs === 1 ? 'question matches' : 'questions match'}</span></>}
                            </div>
                            <dl className="xd-summary-list">
                                {summaryRows.map(([k, v]) => (
                                    <Fragment key={k}><dt>{k}</dt><dd>{v}</dd></Fragment>
                                ))}
                            </dl>
                            <p className="xd-rules">
                                <AlertTriangle size={15} />
                                <span>
                                    {exam.negative_marking > 0
                                        ? <><strong>−{formatMarks(marking.negative)}</strong> of {formatMarks(marking.positive)} marks for each wrong answer. Unanswered questions score zero.</>
                                        : 'No negative marking for this exam.'}
                                </span>
                            </p>
                            <button type="button" className="xd-start" onClick={handleStart} disabled={finalCount === 0}>
                                {startLabel} {finalCount > 0 && <ArrowRight size={17} />}
                            </button>
                            {!user && finalCount > 0 && <p className="xd-start-note">You&apos;ll be asked to sign in first.</p>}
                        </aside>

                        {/* Mobile action bar */}
                        <div className="xd-bar">
                            <div className="xd-bar-info" aria-hidden="true">
                                <strong>{countLoading ? 'Checking pool…' : `${finalCount} questions`}</strong>
                                {!countLoading && finalCount > 0 && `~${durationMin} min · ${availableQs.toLocaleString()} available`}
                                {!countLoading && finalCount === 0 && 'Change the filters above'}
                            </div>
                            <button type="button" className="xd-start" onClick={handleStart} disabled={finalCount === 0}>
                                {finalCount > 0 && !countLoading ? 'Start test' : startLabel} {finalCount > 0 && !countLoading && <ArrowRight size={17} />}
                            </button>
                        </div>
                    </div>
                )}

                {/* ═══════════════════════════════════════════════════════════════
                    TAB 2: ABOUT EXAM & OFFICIAL PATTERN
                ═══════════════════════════════════════════════════════════════ */}
                {activeTab === 'about' && examInfo && (
                    <div id="xd-panel-about" role="tabpanel" aria-labelledby="xd-tab-about" style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>
                        
                        {/* Exam Overview & Conducting Body Card */}
                        <div className="card" style={{ padding: '28px', borderRadius: 'var(--radius-xl)' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '14px' }}>
                                <Landmark size={20} color="var(--text-secondary)" />
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
                                    <span style={{ fontSize: '13px', fontWeight: 800, color: 'var(--brand-orange-text)', textTransform: 'uppercase' }}>
                                        {examInfo.category}
                                    </span>
                                </div>
                            </div>
                        </div>

                        {/* Official Exam Pattern & Stages Card */}
                        <div className="card" style={{ padding: '28px', borderRadius: 'var(--radius-xl)' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '16px' }}>
                                <Scale size={20} color="var(--text-secondary)" />
                                <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                    Official Examination Stages & Pattern
                                </h2>
                            </div>

                            <div style={{ display: 'flex', flexDirection: 'column', gap: '18px' }}>
                                {examInfo.stages.map((stg) => (
                                    <div key={stg.stageNumber} style={{ border: '1px solid var(--border)', borderRadius: '14px', overflow: 'hidden' }}>
                                        <div style={{ background: 'var(--bg-secondary)', padding: '14px 18px', display: 'flex', alignItems: 'center', justifyContent: 'space-between' }}>
                                            <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                                                <span style={{ fontSize: '11px', fontWeight: 800, padding: '3px 8px', borderRadius: '6px', background: 'var(--brand-orange-dim)', color: '#FFFFFF' }}>
                                                    STAGE {stg.stageNumber}
                                                </span>
                                                <span style={{ fontSize: '15px', fontWeight: 800, color: 'var(--text-primary)' }}>
                                                    {stg.stageName}
                                                </span>
                                            </div>
                                            <span style={{ fontSize: '13px', fontWeight: 700, color: 'var(--teal-text)' }}>
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
                                                                <span style={{ fontSize: '12.5px', fontWeight: 700, color: 'var(--brand-orange-text)' }}>
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
                        <div className="card" style={{ padding: '28px', borderRadius: 'var(--radius-xl)' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '16px' }}>
                                <UserCheck size={20} color="var(--text-secondary)" />
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
                            <div className="card" style={{ padding: '28px', borderRadius: 'var(--radius-xl)' }}>
                                <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '16px', flexWrap: 'wrap', gap: '10px' }}>
                                    <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
                                        <Layers size={20} color="var(--text-secondary)" />
                                        <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                            High-Yield Syllabus Focus Areas
                                        </h2>
                                    </div>
                                    <Link 
                                        href="/graph" 
                                        style={{ display: 'inline-flex', alignItems: 'center', gap: '6px', minHeight: '44px', fontSize: '13px', fontWeight: 700, color: 'var(--teal-text)', textDecoration: 'none' }}
                                    >
                                        Explore 14-Pillar Knowledge Graph <ArrowRight size={14} />
                                    </Link>
                                </div>

                                <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit, minmax(240px, 1fr))', gap: '12px' }}>
                                    {examInfo.syllabusFocus.map((foc, fIdx) => (
                                        <div key={fIdx} style={{ background: 'var(--bg-secondary)', padding: '16px', borderRadius: '12px', border: '1px solid var(--border)' }}>
                                            <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '8px' }}>
                                                <span style={{ fontSize: '14px', fontWeight: 800, color: 'var(--text-primary)' }}>{foc.pillarName}</span>
                                                <span style={{ fontSize: '11px', fontWeight: 800, color: 'var(--brand-orange-text)', background: 'rgba(255, 107, 43, 0.1)', padding: '2px 8px', borderRadius: '6px' }}>{foc.weightage}</span>
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
                            <div className="card" style={{ padding: '28px', borderRadius: 'var(--radius-xl)' }}>
                                <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '16px' }}>
                                    <HelpCircle size={20} color="var(--text-secondary)" />
                                    <h2 style={{ fontSize: '20px', fontWeight: 800, color: 'var(--text-primary)', margin: 0 }}>
                                        Frequently Asked Questions
                                    </h2>
                                </div>

                                <div>
                                    {examInfo.faqs.map((faq, fIdx) => (
                                        <details key={fIdx} className="xd-faq">
                                            <summary>{faq.question}<ChevronRight size={18} /></summary>
                                            <p>{faq.answer}</p>
                                        </details>
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
                    <div id="xd-panel-services" role="tabpanel" aria-labelledby="xd-tab-services" style={{ display: 'flex', flexDirection: 'column', gap: '24px' }}>

                        {/* ── ALLOCATED SERVICES & CADRES DIRECTORY (IF COMPOSITE EXAM) ── */}
                        {examInfo.allocatedServices && examInfo.allocatedServices.length > 0 && (
                            <div className="card" style={{ padding: '28px', borderRadius: 'var(--radius-xl)', border: '1px solid var(--border)' }}>
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
                                                                background: isAIS ? 'var(--brand-orange-dim)' : 'var(--brand-teal-dim)',
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
                                                    <div style={{ fontSize: '12.5px', fontWeight: 600, color: 'var(--teal-text)', marginBottom: '10px' }}>
                                                        {srv.department}
                                                    </div>

                                                    <p style={{ fontSize: '13px', color: 'var(--text-secondary)', lineHeight: 1.5, marginBottom: '14px' }}>
                                                        {srv.roleDescription}
                                                    </p>
                                                </div>

                                                <div style={{ borderTop: '1px solid var(--border)', paddingTop: '10px', marginTop: 'auto', display: 'flex', flexDirection: 'column', gap: '4px' }}>
                                                    <div style={{ fontSize: '11.5px', color: 'var(--text-muted)' }}>
                                                        <strong>Entry Post:</strong> {srv.entryDesignation}
                                                    </div>
                                                    <div style={{ fontSize: '11.5px', color: 'var(--brand-orange-text)' }}>
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
                        <div className="card" style={{ padding: '28px', borderRadius: 'var(--radius-xl)' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '14px' }}>
                                <Briefcase size={20} color="var(--text-secondary)" />
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
                                    <div style={{ fontSize: '14.5px', fontWeight: 700, color: 'var(--brand-orange-text)', marginTop: '2px' }}>
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
                                        <ChevronRight size={16} color="var(--teal-text)" />
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
                        <div className="card" style={{ padding: '28px', borderRadius: 'var(--radius-xl)' }}>
                            <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '16px' }}>
                                <DollarSign size={20} color="var(--text-secondary)" />
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
                                    <div style={{ fontSize: '11px', fontWeight: 700, color: 'var(--teal-text)' }}>APPROX GROSS SALARY</div>
                                    <div style={{ fontSize: '18px', fontWeight: 900, color: 'var(--teal-text)', marginTop: '4px' }}>
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
                                        <CheckCircle2 size={13} color="var(--teal-text)" />
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
                    <div id="xd-panel-mindmap" role="tabpanel" aria-labelledby="xd-tab-mindmap">
                        <ExamMindMapVisualizer initialExamId={examId} showExamPicker={false} />
                    </div>
                )}
            </div>
        </div>
    );
}
