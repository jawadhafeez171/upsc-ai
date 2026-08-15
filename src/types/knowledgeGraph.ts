export interface ExamProjections {
    upsc?: string[];
    kas?: string[];
    ssc?: string[];
    banking?: string[];
    statePsc?: string[];
}

export type KnowledgeNodeLevel = 1 | 2 | 3 | 4;

export interface KnowledgeNode {
    id: string;
    slug: string;
    name: string;
    level: KnowledgeNodeLevel;
    levelName: 'Subject' | 'Domain' | 'Topic' | 'Subtopic_Entity';
    subject: string;
    subjectId: string;
    parentId: string | null;
    childrenIds: string[];
    ancestorIds: string[];
    examTags: ExamProjections;
    rawExamTagString?: string;
    description?: string;
    entities: string[];
    keywords: string[];
}

export interface KnowledgeGraphStats {
    totalNodes: number;
    byLevel: {
        subjects: number;
        domains: number;
        topics: number;
        entities: number;
    };
    bySubject: Record<string, number>;
    byExam: {
        upsc: number;
        kas: number;
        ssc: number;
        banking: number;
    };
}

export interface KnowledgeGraphData {
    version: string;
    generatedAt: string;
    rootSubjectIds: string[];
    nodes: Record<string, KnowledgeNode>;
    stats: KnowledgeGraphStats;
}
