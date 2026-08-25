export interface ExamProjections {
    upsc?: string[];
    kas?: string[];
    ssc?: string[];
    banking?: string[];
    state_psc?: string[];
    teaching?: string[];
    kset?: string[];
    kea?: string[];
    kpsc?: string[];
    ksp?: string[];
    ugc_net?: string[];
    capf?: string[];
    cds?: string[];
    [key: string]: string[] | undefined;
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
        teaching?: number;
        karnataka_state?: number;
        police?: number;
        ssc: number;
        banking: number;
        [key: string]: number | undefined;
    };
}

export type KnowledgeGraphStream = 'civil_services' | 'teaching' | 'languages' | 'all';

export interface KnowledgeGraphData {
    version: string;
    name?: string;
    generatedAt: string;
    rootSubjectIds: string[];
    nodes: Record<string, KnowledgeNode>;
    stats: any;
}
