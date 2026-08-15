import knowledgeGraphRaw from '@/data/knowledge_graph.json';
import { KnowledgeGraphData, KnowledgeNode, KnowledgeNodeLevel } from '@/types/knowledgeGraph';

const graphData = knowledgeGraphRaw as unknown as KnowledgeGraphData;

/**
 * Returns the entire knowledge graph dataset and stats.
 */
export function getKnowledgeGraph(): KnowledgeGraphData {
    return graphData;
}

/**
 * Get all 12 Root Subjects (Level 1)
 */
export function getRootSubjects(): KnowledgeNode[] {
    return graphData.rootSubjectIds.map(id => graphData.nodes[id]).filter(Boolean);
}

/**
 * Retrieve a specific node by its unique ID
 */
export function getNodeById(id: string): KnowledgeNode | undefined {
    return graphData.nodes[id];
}

/**
 * Retrieve all immediate child nodes for a given parent node
 */
export function getNodeChildren(parentId: string): KnowledgeNode[] {
    const parent = graphData.nodes[parentId];
    if (!parent || !parent.childrenIds) return [];
    return parent.childrenIds.map(childId => graphData.nodes[childId]).filter(Boolean);
}

/**
 * Retrieve all ancestor nodes (from root subject down to direct parent)
 */
export function getNodeAncestors(nodeId: string): KnowledgeNode[] {
    const node = graphData.nodes[nodeId];
    if (!node || !node.ancestorIds) return [];
    return node.ancestorIds.map(aId => graphData.nodes[aId]).filter(Boolean);
}

/**
 * Retrieve the full subtree under a given node
 */
export function getNodeSubtree(rootNodeId: string): KnowledgeNode[] {
    const results: KnowledgeNode[] = [];
    const queue: string[] = [rootNodeId];

    while (queue.length > 0) {
        const currentId = queue.shift()!;
        const node = graphData.nodes[currentId];
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
 * Filter nodes by exam projection (e.g. 'upsc', 'kas', 'ssc', 'banking')
 */
export function filterNodesByExam(exam: 'upsc' | 'kas' | 'ssc' | 'banking'): KnowledgeNode[] {
    return Object.values(graphData.nodes).filter(node => {
        const tags = node.examTags[exam];
        return tags && tags.length > 0;
    });
}

/**
 * Search nodes by name, entity, or keyword query with optional exam filter
 */
export function searchKnowledgeNodes(
    query: string,
    options?: {
        exam?: 'upsc' | 'kas' | 'ssc' | 'banking';
        level?: KnowledgeNodeLevel;
        subjectId?: string;
        limit?: number;
    }
): KnowledgeNode[] {
    if (!query || query.trim().length === 0) return [];
    const cleanQuery = query.toLowerCase().trim();
    const limit = options?.limit || 20;

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
