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
import { KEA_FAMILIES, KEA_PAPERS, keaPaperCodes, keaFamilyStats, keaPaperTime, keaSubjectNames, keaSubjectOf, type KeaPaper } from '@/lib/keaPapers';
import { getExamInfo, ExamInfo } from '@/data/examDetails';
import { TestConfig, Language, TestMode } from '@/types';
import { 
    ArrowRight, AlertTriangle, BookOpen, Zap, 
    Briefcase,
    Compass, ArrowLeft, Check, CalendarDays, Target, Shuffle
} from 'lucide-react';
import dynamic from 'next/dynamic';

// The syllabus data is large; load it only when the Syllabus map tab opens.
const ExamMindMapVisualizer = dynamic(() => import('@/components/graph/ExamMindMapVisualizer'), { ssr: false });
import './exam-detail.css';
import { AboutPanel, ServicesPanel } from './InfoPanels';

const QUESTION_COUNTS = [10, 25, 50, 100];
const yearsDown = (from: number, to: number) => Array.from({ length: from - to + 1 }, (_, i) => from - i);
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

/** Papers sat on the same day for the same post, as one sitting: "FDA (Non-HK) · 11 Jan 2026" → Paper 1, Paper 2. */
function keaSittings(papers: KeaPaper[]) {
    const groups: { key: string; date: string; post: string; papers: { paper: KeaPaper; name: string }[] }[] = [];
    for (const p of papers) {
        const [post, ...rest] = p.label.split(' · ');
        const key = `${p.date}|${post}`;
        let g = groups.find(x => x.key === key);
        if (!g) { g = { key, date: p.date, post, papers: [] }; groups.push(g); }
        g.papers.push({ paper: p, name: rest.join(' · ') || post });
    }
    // A sitting of one paper whose label has no part after the post: name it in full.
    return groups.map(g => g.papers.length === 1 && g.papers[0].name === g.post ? { ...g, post: '' } : g);
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
    // KEA covers unrelated recruitments: practise one post family (default FDA & SDA), or sit one real paper.
    const [keaFamily, setKeaFamily] = useState<string>(examId === 'kea-vao' ? 'vao' : examId === 'kea-kset' ? 'kset' : examId === 'kea' ? 'fda-sda' : 'none'); // 'none': no papers for this post yet (e.g. PDO)
    const [keaPaperSel, setKeaPaperSel] = useState('');
    const keaFamilyPapers = KEA_PAPERS.filter(p => keaFamily === 'all' || p.family === keaFamily);
    const keaVisiblePapers = keaFamilyPapers.filter(p => mode === 'yearwise' || year === 'all' || p.year === year).sort((x, y) => keaPaperTime(y) - keaPaperTime(x));
    const keaSinglePaper = mode === 'yearwise' ? (keaVisiblePapers.find(p => p.code === keaPaperSel) ?? keaVisiblePapers[0]) : undefined;
    const keaCode = mode === 'yearwise' ? (keaSinglePaper?.code ?? 'none') : keaFamily;
    // Subjects as tagged in the chosen post's papers (the exam's hand-written subject list missed ~40% of FDA & SDA).
    const [keaSubjects, setKeaSubjects] = useState<{ label: string; kn: string; count: number }[] | null>(null);
    useEffect(() => {
        if (!(examId === 'kea' || examId.startsWith('kea-'))) return;
        let live = true;
        (async () => {
            const codes = keaPaperCodes(keaFamily);
            const tally = new Map<string, { label: string; kn: string; count: number }>();
            for (let from = 0; ; from += 1000) {
                let q = supabase.from('kea_questions').select('subject');
                if (codes) q = q.in('paper_code', codes);
                const { data, error } = await q.order('id').range(from, from + 999);
                if (error || !data) break;
                for (const row of data as { subject: string | null }[]) {
                    const g = keaSubjectOf(row.subject);
                    if (!g) continue;
                    const t = tally.get(g.label) ?? { label: g.label, kn: g.kn, count: 0 };
                    t.count += 1;
                    tally.set(g.label, t);
                }
                if (data.length < 1000) break;
            }
            if (live) setKeaSubjects([...tally.values()].sort((a, b) => b.count - a.count));
        })();
        return () => { live = false; };
    }, [examId, keaFamily]);
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
                    const codes = keaPaperCodes(keaCode);
                    if (codes) query = query.in('paper_code', codes);

                    if (mode === 'subject' && subject) {
                        query = query.in('subject', keaSubjectNames(subject));
                    }
                    if (mode !== 'yearwise') {
                        if (difficulty !== 'mixed') query = query.eq('difficulty', difficulty);
                        if (year !== 'all') query = query.eq('year', year);
                    }

                    const { count: keaCount, error: keaErr } = await query;
                    if (!keaErr && keaCount !== null) {
                        qCount = keaCount;
                    } else {
                        qCount = 0;
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
    }, [examId, mode, subject, difficulty, year, paper, paperCode, month, keaCode]);

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

    // "Previous year paper" on KEA sits the whole paper, as in the exam hall.
    const keaWholePaper = (examId === 'kea' || examId.startsWith('kea-')) && mode === 'yearwise';
    const finalCount = countLoading ? 0 : keaWholePaper ? availableQs : Math.min(Number(customCount) || count, availableQs);

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
            paper_code: examId === 'kea' || examId.startsWith('kea-') ? keaCode : examId === 'ksp-pc' || examId === 'upsc-epfo' ? paperCode : undefined
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
        // CSAT starts in 2013 and GS Paper 1 data ends in 2024: drop a year the new paper doesn't have.
        if (examId === 'upsc-cse' && typeof year === 'number' && ((p === 2 && year < 2013) || (p === 1 && year > 2024))) setYear('all');
        if (examId !== 'upsc-cse' || mode !== 'subject') return;
        const isCsat = CSAT_TOPICS.includes(subject);
        if (p === 2 && !isCsat) setSubject(CSAT_TOPICS[0]);
        else if (p === 1 && isCsat) setSubject(subjectValues[0] || '');
    };
    const subjectLabels: string[] | undefined = language === 'kn' && exam.subjects_kn?.length === subjectValues.length ? exam.subjects_kn : undefined;
    let examTopics: { value: string; label: string; meta?: string }[] = subjectValues.map((v, i) => ({ value: v, label: subjectLabels ? subjectLabels[i] : v }));
    if (examId === 'kea' || examId.startsWith('kea-')) {
        examTopics = (keaSubjects ?? []).map(g => ({ value: g.label, label: language === 'kn' ? g.kn : g.label, meta: `${g.count.toLocaleString('en-IN')} ${g.count === 1 ? 'question' : 'questions'}` }));
    }
    if (examId === 'upsc-cse') {
        const csat = CSAT_TOPICS.map(v => ({ value: v, label: v }));
        if (paper === 2) examTopics = csat;
        else if (paper === 'all') examTopics = [...examTopics, ...csat];
    }

    // ── Practice-tab option model ───────────────────────────────────────
    const isKea = examId === 'kea' || examId.startsWith('kea-');
    if (isKea && mode === 'subject' && keaSubjects?.length && !keaSubjects.some(g => g.label === subject)) {
        // Render-time correction (not an effect): the subject list just changed under the selection.
        setSubject(keaSubjects[0].label);
    }
    const selectKeaFamily = (f: string) => {
        setKeaFamily(f);
        setKeaPaperSel('');
        if (year !== 'all' && !KEA_PAPERS.some(p => (f === 'all' || p.family === f) && p.year === year)) setYear('all');
    };
    const keaYears = [...new Set(keaFamilyPapers.map(p => p.year))].sort((x, y) => y - x);
    const showPaperYear = examId !== 'ksp-pc' && !(isKea && keaYears.length === 0) && (mode === 'yearwise' || ['upsc-cse', 'kpsc-kas', 'upsc-capf', 'upsc-epfo', 'ksp-psi'].includes(examId) || isKea);

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
    } else if (examId === 'kea') {
        paperOptions = [
            ...KEA_FAMILIES.map(f => {
                const st = keaFamilyStats(f.key);
                return codeOpt(f.key, f.label, `${st.papers} ${st.papers === 1 ? 'paper' : 'papers'} · ${st.qs.toLocaleString('en-IN')} Qs`, () => selectKeaFamily(f.key));
            }),
            codeOpt('all', 'All posts', `Mixed, except KSET · ${KEA_PAPERS.filter(p => p.family !== 'kset').reduce((n, p) => n + p.qs, 0).toLocaleString('en-IN')} Qs`, () => selectKeaFamily('all')),
        ].map(o => ({ ...o, selected: keaFamily === o.key }));
    } else if (isKea) {
        paperOptions = []; // VAO, KSET and PDO pages are a single post already
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
        ? keaYears
        : examId === 'upsc-capf'
            ? [2026, 2025, 2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014]
            : examId === 'upsc-epfo'
                ? [2025, 2023, 2021, 2017, 2016, 2012, 2004, 2002]
                : examId === 'kpsc-kas'
                    ? [2024, 2020, 2017, 2015, 2011]
                    : examId === 'ksp-psi'
                    ? [2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016]
                    : examId === 'upsc-cse'
                    // GS Paper 1 has full papers from 1996 (1993–95 are partial); CSAT starts in 2013.
                    ? yearsDown(paper === 2 ? 2026 : paper === 1 ? 2024 : 2026, paper === 2 ? 2013 : 1996)
                    : [2024, 2023, 2022, 2021, 2020, 2019, 2018, 2017, 2016, 2015, 2014, 2013, 2012, 2011];
    const allYearsRange = isKea ? (keaYears.length > 1 ? `${keaYears[keaYears.length - 1]}–${keaYears[0]}` : String(keaYears[0] ?? '')) : examId === 'upsc-capf' ? '2014–2026' : examId === 'upsc-epfo' ? '2002–2025' : examId === 'ksp-psi' ? '2016–2024'
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
        (c === 125 && examId === 'upsc-capf') || (c === 120 && examId === 'upsc-epfo') || (c === 100 && availableQs === 100)
            || (c === 100 && examId === 'upsc-cse' && paper === 1) ? 'Full paper'
            // Only Police Constable's two papers add up to 200; UPSC GS 1 + CSAT is 180.
            : c === 200 && examId === 'ksp-pc' ? 'Full exam' : undefined;
    const requestedCount = Number(customCount) || count;
    const secsPerQ = examId === 'upsc-epfo' ? 60 : 72;
    const marking = getMarkingScheme(examId, paper, isKea ? keaCode : paperCode);
    const durationMin = Math.round((finalCount * secsPerQ) / 60);
    const langNames: Record<string, string> = { en: 'English', hi: 'हिन्दी (Hindi)', kn: 'ಕನ್ನಡ (Kannada)' };

    const summaryRows: [string, string][] = [
        ['Mode', modes.find(m => m.id === mode)?.title || ''],
    ];
    if (examId === 'kea') summaryRows.push(['Post', paperOptions.find(o => o.selected)?.label || '—']);
    else if ((showPaperYear || examId === 'ksp-pc') && paperOptions.length > 0) summaryRows.push(['Paper', paperOptions.find(o => o.selected)?.label || '—']);
    if (keaSinglePaper) summaryRows.push(['Paper', `${keaSinglePaper.label} (${keaSinglePaper.date})`]);
    if (examId === 'ksp-psi') summaryRows.push(['Paper', 'Paper 2 · General Studies']);
    if (showPaperYear && !keaWholePaper) {
        const monthLabel = examId === 'kpsc-kas' && year === 2024 && month !== 'all' ? (month === 'august' ? ' · August' : ' · December') : '';
        summaryRows.push(['Year', year === 'all' ? `All (${allYearsRange})` : `${year}${monthLabel}`]);
    }
    if (mode === 'subject') summaryRows.push(['Subject', examTopics.find(t => t.value === subject)?.label || '—']);
    if (!keaWholePaper) summaryRows.push(['Difficulty', difficulty.charAt(0).toUpperCase() + difficulty.slice(1)]);
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
                    {examInfo && examId !== 'kea' && <span className="xd-badge">{examInfo.jobRole.cadre}</span>}
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
                                            : mode === 'yearwise' ? 'Pick the paper you want to sit.'
                                            : examId === 'kea' ? 'Choose the post you are preparing for.' : 'Optional — narrow the question pool.'}
                                    </p>

                                    {paperOptions.length > 0 && (
                                        <OptionGroup label={examId === 'ksp-pc' ? 'Cadre / region' : examId === 'kea' ? 'Post' : 'Paper'}>
                                            {paperOptions.map(o => (
                                                <Chip key={o.key} selected={o.selected} onSelect={o.onSelect} meta={o.meta}>{o.label}</Chip>
                                            ))}
                                        </OptionGroup>
                                    )}

                                    {showPaperYear && !(isKea && mode === 'yearwise') && (
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

                                    {isKea && mode === 'yearwise' && (
                                        <div className="xd-field">
                                            <span id="xd-paper-l" className="xd-label">Paper to sit<span className="xd-label-hint">{keaVisiblePapers.length} {keaVisiblePapers.length === 1 ? 'paper' : 'papers'}, newest first</span></span>
                                            <div className="xd-sittings" role="group" aria-labelledby="xd-paper-l">
                                                {keaSittings(keaVisiblePapers).map(g => (
                                                    <div key={g.key} className="xd-sitting">
                                                        <p className="xd-sitting-h">{g.date}{g.post && <span> · {g.post}</span>}</p>
                                                        {g.papers.map(({ paper: p, name }) => (
                                                            <button key={p.code} type="button" className="xd-paper" aria-pressed={keaSinglePaper?.code === p.code} onClick={() => setKeaPaperSel(p.code)}>
                                                                <span className="xd-paper-name">{name}</span>
                                                                <span className="xd-paper-meta">{p.qs} questions</span>
                                                            </button>
                                                        ))}
                                                    </div>
                                                ))}
                                            </div>
                                        </div>
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
                                    <p className="xd-section-sub">{isKea ? 'Subjects as they appear in this post’s papers, largest first.' : 'Only questions from this subject will be included.'}</p>
                                    <div className="xd-chips" role="group" aria-labelledby="xd-subject-h">
                                        {isKea && !keaSubjects && <p className="xd-section-sub">Loading this post&apos;s subjects…</p>}
                                        {examTopics.map(({ value, label, meta }) => (
                                            <Chip key={value} selected={subject === value} onSelect={() => setSubject(value)} meta={meta}>{label}</Chip>
                                        ))}
                                    </div>
                                </section>
                            )}

                            {/* Difficulty & language */}
                            <section className="xd-section" aria-label="Difficulty and language">
                                <div className="xd-two">
                                    {!keaWholePaper && <div className="xd-field">
                                        <span id="xd-diff-l" className="xd-label">Difficulty</span>
                                        <div className="xd-seg" role="group" aria-labelledby="xd-diff-l">
                                            {DIFFICULTIES.map(d => (
                                                <button key={d} type="button" aria-pressed={difficulty === d} onClick={() => setDifficulty(d)}>{d}</button>
                                            ))}
                                        </div>
                                    </div>}
                                    <OptionGroup label="Question language">
                                        {(['en', 'hi', 'kn'] as Language[]).filter(l => l === 'en' || exam.languages.includes(l)).map(l => (
                                            <Chip key={l} selected={testLang === l} onSelect={() => setTestLang(l)}>{langNames[l]}</Chip>
                                        ))}
                                    </OptionGroup>
                                </div>
                            </section>

                            {/* Question count */}
                            {!keaWholePaper && (
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
                                            selected={count === c && !customCount && (countLoading || c <= availableQs)}
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
                            )}
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
                                    {marking.negative > 0
                                        ? <><strong>−{formatMarks(marking.negative)}</strong> of {formatMarks(marking.positive)} {marking.positive === 1 ? 'mark' : 'marks'} for each wrong answer. Unanswered questions score zero.</>
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
                                <strong>{countLoading ? 'Checking pool…' : keaSinglePaper ? keaSinglePaper.label : `${finalCount} questions`}</strong>
                                {!countLoading && keaSinglePaper && `${keaSinglePaper.date} · ${finalCount} questions · ~${durationMin} min`}
                                {!countLoading && !keaSinglePaper && finalCount > 0 && `~${durationMin} min · ${availableQs.toLocaleString()} available`}
                                {!countLoading && finalCount === 0 && 'Change the filters above'}
                            </div>
                            <button type="button" className="xd-start" onClick={handleStart} disabled={finalCount === 0}>
                                {finalCount > 0 && !countLoading ? 'Start test' : startLabel} {finalCount > 0 && !countLoading && <ArrowRight size={17} />}
                            </button>
                        </div>
                    </div>
                )}

                {activeTab === 'about' && examInfo && (
                    <AboutPanel
                        info={examInfo}
                        lang={language}
                        kea={examId === 'kea' ? { family: keaFamily, onFamily: selectKeaFamily, subjects: keaSubjects } : undefined}
                        onOpenMap={hasExamMindMap(examId) ? () => selectTab('mindmap') : undefined}
                    />
                )}
                {activeTab === 'services' && examInfo && (
                    <ServicesPanel info={examInfo} lang={language} kea={examId === 'kea'} />
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
