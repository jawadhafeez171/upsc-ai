'use client';
import { useMemo } from 'react';
import Link from 'next/link';
import { useAppStore } from '@/lib/store';
import { examSyllabusTree, practiceLinkFor } from '@/lib/syllabus';
import SyllabusTree from './SyllabusTree';

/**
 * Curated syllabus map for one exam (used on the exam page's "Syllabus map" tab).
 * Shows an honest note when the exam has no curated map — never another exam's syllabus.
 */
export default function ExamMindMapVisualizer({ initialExamId }: { initialExamId: string; showExamPicker?: boolean }) {
    const { language } = useAppStore();
    const lang = language === 'kn' ? 'kn' : 'en';
    const roots = useMemo(() => examSyllabusTree(initialExamId, lang), [initialExamId, lang]);

    if (!roots) {
        return (
            <div className="card card-static" style={{ padding: '24px', borderRadius: 'var(--radius-xl)', color: 'var(--text-secondary)', fontSize: '15px', lineHeight: 1.6 }}>
                A syllabus map for this exam isn’t available yet. The <Link href={`/exams/${initialExamId}?tab=about`} style={{ color: 'var(--link-text)', fontWeight: 700 }}>Exam pattern</Link> tab lists its papers and subjects.
            </div>
        );
    }
    return <SyllabusTree roots={roots} lang={lang} practiceFor={(n, path) => practiceLinkFor(initialExamId, n, path)} initiallyExpandedDepth={2} />;
}
