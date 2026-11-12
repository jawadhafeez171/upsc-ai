import { getExamMindMap, type MindMapNode } from './examMindMap';
import { getRootSubjects, getNodeChildren } from './knowledgeGraph';
import { EXAMS } from './mockData';
import type { KnowledgeGraphStream } from '@/types/knowledgeGraph';
import type { SyllabusNode, PracticeLink } from '@/components/graph/SyllabusTree';

const KIND: Record<MindMapNode['category'], { en: string; kn: string }> = {
    exam: { en: 'Exam', kn: 'ಪರೀಕ್ಷೆ' },
    stage: { en: 'Stage', kn: 'ಹಂತ' },
    paper: { en: 'Paper', kn: 'ಪತ್ರಿಕೆ' },
    domain: { en: 'Subject area', kn: 'ವಿಷಯ ಕ್ಷೇತ್ರ' },
    topic: { en: 'Topic', kn: 'ವಿಷಯಾಂಶ' },
    entity: { en: 'Subtopic', kn: 'ಉಪವಿಷಯ' },
};

/** Curated exam syllabus (papers → subject areas → topics). Null when the exam has no map. */
export function examSyllabusTree(examId: string, lang: 'en' | 'kn'): SyllabusNode[] | null {
    const root = getExamMindMap(examId);
    if (!root) return null;
    const conv = (n: MindMapNode): SyllabusNode => ({
        id: n.id,
        label: lang === 'kn' && n.label_kn ? n.label_kn : n.label,
        matchLabel: n.label,
        kind: KIND[n.category]?.[lang] ?? n.category,
        badge: n.badge,
        description: n.description,
        items: n.entities,
        children: n.children?.map(conv),
    });
    return [conv(root)];
}

/** Which full topic graph an exam draws on. */
export function streamForExam(examId: string): KnowledgeGraphStream {
    if (examId === 'upsc-epfo') return 'epfo';
    if (examId === 'kartet' || examId === 'karnataka-gpstr' || examId === 'kea-kset') return 'teaching';
    return 'civil_services';
}

const LEVEL_KIND = ['Subject', 'Subject area', 'Topic', 'Subtopic'];
/** Full topic graph for the exam's stream (subject → area → topic → subtopic). */
export function topicGraphTree(stream: KnowledgeGraphStream): SyllabusNode[] {
    const build = (id: string, depth: number): SyllabusNode[] =>
        getNodeChildren(id, stream).map((c) => ({
            id: c.id,
            label: c.name,
            kind: LEVEL_KIND[Math.min(depth, 3)],
            description: c.description,
            items: c.entities?.length ? c.entities : undefined,
            children: depth < 3 ? build(c.id, depth + 1) : undefined,
        })).map((n) => (n.children && n.children.length === 0 ? { ...n, children: undefined } : n));
    return getRootSubjects(stream).map((s) => ({
        id: s.id,
        label: s.name,
        kind: 'Subject',
        description: s.description,
        items: s.entities?.length ? s.entities : undefined,
        children: build(s.id, 1),
    }));
}

/* ── Linking a syllabus topic to the exam's subject drill ── */
const STOP = new Set(['indian', 'india', 'and', 'the', 'of', 'general', 'studies', 'paper', 'including', 'with', 'for', 'part', 'basic', 'elements']);
const stems = (text: string) => text.split(/[^A-Za-z]+/).filter((w) => w.length > 3 && !STOP.has(w.toLowerCase())).map((w) => w.toLowerCase().slice(0, 6));

/** Best matching practice subject for a topic, looking at the topic and then its ancestors. */
export function matchSubject(labels: string[], subjects: string[]): string | null {
    const subjStems = subjects.map((s) => ({ s, st: new Set(stems(s)) }));
    for (const label of labels) {
        const ls = stems(label);
        if (!ls.length) continue;
        let best: { s: string; score: number } | null = null;
        for (const { s, st } of subjStems) {
            const score = ls.filter((x) => st.has(x)).length;
            if (score > 0 && (!best || score > best.score)) best = { s, score };
        }
        if (best) return best.s;
    }
    return null;
}

/** Exams whose question bank is still empty — no practice link, an honest note instead. */
const NO_QUESTION_BANK = new Set(['kartet', 'karnataka-gpstr', 'kpsc-group-c', 'upsc-cds']);
const CSAT_SUBJECTS = ['Reading Comprehension & Interpersonal Skills', 'Quantitative Aptitude & Basic Numeracy', 'General Mental Ability & Logical Reasoning'];

export function practiceLinkFor(examId: string, node: SyllabusNode, path: SyllabusNode[]): PracticeLink {
    const exam = EXAMS.find((e) => e.id === examId);
    if (!exam) return null;
    if (NO_QUESTION_BANK.has(examId)) return { note: `Practice questions for ${exam.name} aren’t available yet.` };
    // Deepest first: the topic itself, then the areas it sits in.
    const labels = [node, ...[...path].reverse()].map((n) => n.matchLabel ?? n.label);
    const subjects = examId === 'upsc-cse' ? [...exam.subjects, ...CSAT_SUBJECTS] : exam.subjects;
    const subject = matchSubject(labels, subjects);
    if (subject) {
        const paper = examId === 'upsc-cse' ? (CSAT_SUBJECTS.includes(subject) ? '&paper=2' : '&paper=1') : '';
        return {
            href: `/exams/${examId}?mode=subject&subject=${encodeURIComponent(subject)}${paper}`,
            label: `Practise ${subject} questions`,
            note: `Opens a ${exam.name} subject drill for ${subject}. Questions are drawn from the whole subject, not only this topic.`,
        };
    }
    return { href: `/exams/${examId}`, label: `Set up a ${exam.name} test` };
}
