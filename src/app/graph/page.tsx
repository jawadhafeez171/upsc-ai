'use client';
import { Suspense, useMemo } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { useAppStore } from '@/lib/store';
import { EXAMS } from '@/lib/mockData';
import { MIND_MAP_EXAM_IDS } from '@/lib/examMindMap';
import { examSyllabusTree, topicGraphTree, streamForExam, practiceLinkFor } from '@/lib/syllabus';
import SyllabusTree, { type SyllabusNode } from '@/components/graph/SyllabusTree';

type View = 'syllabus' | 'topics';
const STREAM_NAME = { civil_services: 'general studies', teaching: 'teaching and pedagogy', epfo: 'EPFO', languages: 'language', all: 'combined' } as const;

const examName = (id: string) => EXAMS.find((e) => e.id === id)?.name ?? id;

function countNodes(nodes: SyllabusNode[], view: View): { total: number; areas: number } {
    let total = 0, areas = 0;
    const walk = (n: SyllabusNode) => {
        total += 1;
        if (n.kind === 'Subject area' || n.kind === 'ವಿಷಯ ಕ್ಷೇತ್ರ') areas += 1;
        n.children?.forEach(walk);
    };
    nodes.forEach(walk);
    return { total, areas: view === 'topics' ? nodes.length : areas };
}

function SyllabusMap() {
    const router = useRouter();
    const params = useSearchParams();
    const { language } = useAppStore();
    const lang = language === 'kn' ? 'kn' : 'en';

    const paramExam = params.get('exam') ?? '';
    const exam = (MIND_MAP_EXAM_IDS as readonly string[]).includes(paramExam) ? paramExam : 'upsc-cse';
    const view: View = params.get('view') === 'topics' ? 'topics' : 'syllabus';
    const stream = streamForExam(exam);

    const roots = useMemo(
        () => (view === 'topics' ? topicGraphTree(stream) : examSyllabusTree(exam, lang) ?? []),
        [view, stream, exam, lang],
    );
    const { total, areas } = useMemo(() => countNodes(roots, view), [roots, view]);

    const go = (next: { exam?: string; view?: View }) => {
        const e = next.exam ?? exam, v = next.view ?? view;
        router.replace(`/graph?exam=${e}${v === 'topics' ? '&view=topics' : ''}`, { scroll: false });
    };

    return (
        <div style={{ background: 'var(--bg-primary)', minHeight: '100vh', padding: '32px 0 80px' }}>
            <div style={{ maxWidth: '1200px', margin: '0 auto', padding: '0 clamp(16px, 3vw, 24px)' }}>
                <header style={{ marginBottom: '20px' }}>
                    <h1 style={{ fontSize: '2rem', lineHeight: 1.15, fontWeight: 800, letterSpacing: '-0.02em', margin: '0 0 6px', color: 'var(--text-primary)' }}>
                        Syllabus map
                    </h1>
                    <p style={{ margin: 0, fontSize: '16px', lineHeight: 1.6, color: 'var(--text-secondary)', maxWidth: '68ch' }}>
                        {view === 'syllabus'
                            ? <>The {examName(exam)} syllabus, stage by stage and paper by paper. Select any part to read it in full and practise it where questions are available.</>
                            : <>Every topic in the {STREAM_NAME[stream]} topic library: {areas} subjects and {(total - areas).toLocaleString('en-IN')} topics beneath them, including subtopics beyond the official syllabus wording.</>}
                    </p>
                </header>

                <div style={{ display: 'flex', flexWrap: 'wrap', alignItems: 'flex-end', gap: '12px 20px', marginBottom: '20px' }}>
                    <label style={{ display: 'grid', gap: '6px', fontSize: '14px', fontWeight: 600, color: 'var(--text-primary)', flex: '1 1 280px', maxWidth: '420px' }}>
                        Exam
                        <select
                            value={exam}
                            onChange={(e) => go({ exam: e.target.value })}
                            style={{ minHeight: '44px', padding: '8px 12px', borderRadius: 'var(--radius)', border: '1px solid var(--border)', background: 'var(--bg-card)', color: 'var(--text-primary)', font: 'inherit', fontSize: '15px', fontWeight: 600 }}
                        >
                            {MIND_MAP_EXAM_IDS.map((id) => <option key={id} value={id}>{examName(id)}</option>)}
                        </select>
                    </label>
                    <div role="group" aria-label="What to show" style={{ display: 'inline-flex', padding: '3px', gap: '2px', borderRadius: 'var(--radius)', background: 'var(--bg-tertiary)', border: '1px solid var(--border)' }}>
                        {([['syllabus', 'Exam syllabus'], ['topics', 'All topics']] as [View, string][]).map(([v, label]) => (
                            <button
                                key={v}
                                type="button"
                                aria-pressed={view === v}
                                onClick={() => go({ view: v })}
                                style={{
                                    minHeight: '40px', padding: '6px 14px', border: 'none', borderRadius: '6px', cursor: 'pointer', font: 'inherit', fontSize: '14px', fontWeight: 600,
                                    background: view === v ? 'var(--bg-card)' : 'transparent',
                                    color: view === v ? 'var(--text-primary)' : 'var(--text-secondary)',
                                    boxShadow: view === v ? '0 1px 2px rgba(15, 23, 42, 0.12)' : 'none',
                                }}
                            >
                                {label}
                            </button>
                        ))}
                    </div>
                </div>

                <h2 className="sr-only">{view === 'syllabus' ? `${examName(exam)} syllabus` : 'All topics'}</h2>
                <SyllabusTree
                    roots={roots}
                    lang={view === 'syllabus' ? lang : 'en'}
                    practiceFor={(n, path) => practiceLinkFor(exam, n, path)}
                    initiallyExpandedDepth={view === 'syllabus' ? 2 : 0}
                    emptyNote="A syllabus map for this exam isn’t available yet."
                />
            </div>
        </div>
    );
}

export default function KnowledgeGraphPage() {
    return (
        <Suspense fallback={null}>
            <SyllabusMap />
        </Suspense>
    );
}
