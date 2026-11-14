/**
 * Marks per question and the deduction for a wrong answer, per exam/paper.
 * Single source of truth for the test screen, the exam setup page and the homepage.
 * (Exam.negative_marking is the *fraction* deducted, e.g. 0.33 = one third of the marks.)
 */
export function getMarkingScheme(examId?: string, paper?: number | string | 'all', paperCode?: string) {
    // KSET follows the UGC-NET pattern: 2 marks a question, no negative marking.
    if (examId === 'kea-kset' || paperCode === 'kset' || /kset/i.test(paperCode ?? '')) return { positive: 2, negative: 0 };
    // KEA recruitment papers: 1 mark a question, a quarter mark off for a wrong answer.
    if (examId === 'kea' || examId?.startsWith('kea-')) return { positive: 1, negative: 0.25 };
    if (examId === 'upsc-epfo') return { positive: 2.5, negative: 0.83 };
    if (examId === 'upsc-cse' && (paper === 2 || paper === '2')) return { positive: 2.5, negative: 0.83 };
    if (examId === 'upsc-cse' || examId === 'upsc-capf') return { positive: 2, negative: 0.66 };
    if (examId?.startsWith('kpsc')) return { positive: 2, negative: 0.5 };
    if (examId?.startsWith('ksp')) return { positive: 1, negative: 0.25 };
    return { positive: 2, negative: 0.66 };
}

/** "−0.66" style label, trimming trailing zeros. */
export function formatMarks(n: number) {
    return String(Number(n.toFixed(2)));
}

/**
 * Time allowed for a test, in seconds. A whole KEA paper is 120 minutes, as in the exam hall;
 * everything else runs at the exam's pace (UPSC/KEA 120 minutes per 100 questions, EPFO 60 s a question).
 */
export function testDurationSeconds(cfg: { exam_id?: string; mode?: string; paper_code?: string } | undefined, questionCount: number) {
    const kea = cfg?.exam_id === 'kea' || cfg?.exam_id?.startsWith('kea-');
    if (kea && cfg?.mode === 'yearwise' && cfg.paper_code && cfg.paper_code.includes('__')) return 120 * 60;
    return questionCount * (cfg?.exam_id === 'upsc-epfo' ? 60 : 72);
}
