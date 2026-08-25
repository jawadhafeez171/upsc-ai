import civilServicesGraphRaw from '@/data/knowledge_graph_civil_services.json';
import teachingGraphRaw from '@/data/knowledge_graph_teaching.json';
import languagesGraphRaw from '@/data/knowledge_graph_languages.json';
import masterGraphRaw from '@/data/knowledge_graph.json';
import { KnowledgeGraphData, KnowledgeGraphStream, KnowledgeNode, KnowledgeNodeLevel } from '@/types/knowledgeGraph';

const GRAPHS: Record<KnowledgeGraphStream, KnowledgeGraphData> = {
    civil_services: civilServicesGraphRaw as unknown as KnowledgeGraphData,
    teaching: teachingGraphRaw as unknown as KnowledgeGraphData,
    languages: languagesGraphRaw as unknown as KnowledgeGraphData,
    all: masterGraphRaw as unknown as KnowledgeGraphData
};

/**
 * Returns the knowledge graph dataset for a specific stream (defaults to 'civil_services').
 */
export function getKnowledgeGraph(stream: KnowledgeGraphStream = 'civil_services'): KnowledgeGraphData {
    return GRAPHS[stream] || GRAPHS.civil_services;
}

/**
 * Get all Root Subjects (Level 1) for a specific stream.
 */
export function getRootSubjects(stream: KnowledgeGraphStream = 'civil_services'): KnowledgeNode[] {
    const graphData = getKnowledgeGraph(stream);
    return graphData.rootSubjectIds.map(id => graphData.nodes[id]).filter(Boolean);
}

/**
 * Retrieve a specific node by its unique ID across a stream or all graphs.
 */
export function getNodeById(id: string, stream: KnowledgeGraphStream = 'all'): KnowledgeNode | undefined {
    const graphData = getKnowledgeGraph(stream);
    if (graphData.nodes[id]) return graphData.nodes[id];
    
    // Fallback search across all graphs if not found in current stream
    for (const g of Object.values(GRAPHS)) {
        if (g.nodes[id]) return g.nodes[id];
    }
    return undefined;
}

/**
 * Retrieve all immediate child nodes for a given parent node.
 */
export function getNodeChildren(parentId: string, stream: KnowledgeGraphStream = 'civil_services'): KnowledgeNode[] {
    const graphData = getKnowledgeGraph(stream);
    const parent = graphData.nodes[parentId] || getNodeById(parentId, 'all');
    if (!parent || !parent.childrenIds) return [];
    return parent.childrenIds.map(childId => graphData.nodes[childId] || getNodeById(childId, 'all')).filter(Boolean) as KnowledgeNode[];
}

/**
 * Retrieve all ancestor nodes (from root subject down to direct parent).
 */
export function getNodeAncestors(nodeId: string, stream: KnowledgeGraphStream = 'civil_services'): KnowledgeNode[] {
    const node = getNodeById(nodeId, stream);
    if (!node || !node.ancestorIds) return [];
    const graphData = getKnowledgeGraph(stream);
    return node.ancestorIds.map(aId => graphData.nodes[aId] || getNodeById(aId, 'all')).filter(Boolean) as KnowledgeNode[];
}

/**
 * Retrieve the full subtree under a given node.
 */
export function getNodeSubtree(rootNodeId: string, stream: KnowledgeGraphStream = 'civil_services'): KnowledgeNode[] {
    const results: KnowledgeNode[] = [];
    const queue: string[] = [rootNodeId];
    const graphData = getKnowledgeGraph(stream);

    while (queue.length > 0) {
        const currentId = queue.shift()!;
        const node = graphData.nodes[currentId] || getNodeById(currentId, 'all');
        if (node) {
            results.push(node);
            if (node.childrenIds && node.childrenIds.length > 0) {
                queue.push(...node.childrenIds);
            }
        }
    }

    return results;
}

/**
 * Filter nodes by exam projection (e.g. 'upsc', 'kas', 'teaching', 'kset', 'ugc_net', 'ssc', 'banking')
 */
export function filterNodesByExam(exam: string, stream: KnowledgeGraphStream = 'civil_services'): KnowledgeNode[] {
    const graphData = getKnowledgeGraph(stream);
    return Object.values(graphData.nodes).filter(node => {
        const tags = node.examTags[exam];
        return tags && tags.length > 0;
    });
}

/**
 * Search nodes by name, entity, or keyword query with optional exam & stream filters.
 */
export function searchKnowledgeNodes(
    query: string,
    options?: {
        stream?: KnowledgeGraphStream;
        exam?: string;
        level?: KnowledgeNodeLevel;
        subjectId?: string;
        limit?: number;
    }
): KnowledgeNode[] {
    if (!query || query.trim().length === 0) return [];
    const cleanQuery = query.toLowerCase().trim();
    const limit = options?.limit || 20;
    const stream = options?.stream || 'civil_services';
    const graphData = getKnowledgeGraph(stream);

    const matched = Object.values(graphData.nodes).filter(node => {
        if (options?.level && node.level !== options.level) return false;
        if (options?.subjectId && node.subjectId !== options.subjectId) return false;
        if (options?.exam) {
            const tags = node.examTags[options.exam];
            if (!tags || tags.length === 0) return false;
        }

        if (node.name.toLowerCase().includes(cleanQuery)) return true;
        if (node.description && node.description.toLowerCase().includes(cleanQuery)) return true;
        if (node.entities && node.entities.some(e => e.toLowerCase().includes(cleanQuery))) return true;
        if (node.keywords && node.keywords.some(k => k.toLowerCase().includes(cleanQuery))) return true;

        return false;
    });

    return matched.sort((a, b) => {
        const aExact = a.name.toLowerCase() === cleanQuery ? 2 : (a.name.toLowerCase().startsWith(cleanQuery) ? 1 : 0);
        const bExact = b.name.toLowerCase() === cleanQuery ? 2 : (b.name.toLowerCase().startsWith(cleanQuery) ? 1 : 0);
        return bExact - aExact;
    }).slice(0, limit);
}
