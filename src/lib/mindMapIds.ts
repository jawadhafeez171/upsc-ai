/** Exams that have a curated syllabus map (keep in sync with the switch in examMindMap.ts). Kept separate so pages can check this without loading the syllabus data. */
export const MIND_MAP_EXAM_IDS = ['upsc-cse', 'upsc-epfo', 'kpsc-kas', 'kea-pdo', 'ksp-psi', 'ksp-pc', 'kartet', 'karnataka-gpstr'] as const;
export function hasExamMindMap(examId: string) {
    return (MIND_MAP_EXAM_IDS as readonly string[]).includes(examId);
}
