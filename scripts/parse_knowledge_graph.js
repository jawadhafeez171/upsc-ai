const fs = require('fs');
const path = require('path');

const mdPath = path.join(__dirname, '..', 'knowledge_graph.md');
const outJsonPath = path.join(__dirname, '..', 'src', 'data', 'knowledge_graph.json');

const rawMd = fs.readFileSync(mdPath, 'utf-8');

function cleanSlug(str) {
    return str
        .toLowerCase()
        .replace(/\[.*?\]/g, '')
        .replace(/\(.*?\)/g, '')
        .replace(/[^a-z0-9\s_-]/g, '')
        .trim()
        .replace(/\s+/g, '_')
        .replace(/_+/g, '_');
}

function parseExamTags(str) {
    const tags = {};
    if (!str) return tags;

    const matches = str.matchAll(/\[(UPSC|KAS|SSC|Banking|State-PSC):\s*([^\]]+)\]/gi);
    for (const match of matches) {
        const type = match[1].toLowerCase().replace('-', '_');
        const values = match[2].split(/[,/]/).map(s => s.trim()).filter(Boolean);
        if (!tags[type]) tags[type] = [];
        tags[type].push(...values);
    }
    return tags;
}

function extractKeywords(name, description, entities) {
    const text = `${name} ${description || ''} ${(entities || []).join(' ')}`;
    const terms = text
        .replace(/[[\](),;:-]/g, ' ')
        .split(/\s+/)
        .map(t => t.trim())
        .filter(t => t.length > 2 && !/^(and|the|for|with|from|this|that|into|over|under|etc|all|more|less)$/i.test(t));
    return [...new Set(terms)];
}

const nodes = {};
const rootSubjectIds = [];

// Split by sections
const sections = rawMd.split(/={40,}\s*\n/);

console.log(`Found ${sections.length} raw sections in markdown.`);

for (let sIdx = 1; sIdx < sections.length; sIdx += 2) {
    const rawHeaderLine = sections[sIdx].trim();
    const content = sections[sIdx + 1] || '';

    const headerLine = rawHeaderLine.replace(/`/g, '');
    const headerMatch = headerLine.match(/^\d+\.\s+([^[\]\n]+?)(\s*\[.*\])?$/);
    if (!headerMatch) {
        console.log(`Failed to match header: "${headerLine}"`);
        continue;
    }

    const subjectRawName = headerMatch[1].trim();
    const subjectTagStr = (headerMatch[2] || '').trim();
    const subjectSlug = cleanSlug(subjectRawName);
    const subjectId = subjectSlug;

    const subjectTags = parseExamTags(subjectTagStr);

    const subjectNode = {
        id: subjectId,
        slug: subjectSlug,
        name: subjectRawName.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1).toLowerCase()).join(' '),
        level: 1,
        levelName: 'Subject',
        subject: subjectRawName,
        subjectId: subjectId,
        parentId: null,
        childrenIds: [],
        ancestorIds: [],
        examTags: subjectTags,
        rawExamTagString: subjectTagStr,
        entities: [],
        keywords: extractKeywords(subjectRawName)
    };

    nodes[subjectId] = subjectNode;
    rootSubjectIds.push(subjectId);

    const contentLines = content.split('\n');
    const blocks = [];
    let currentBlock = null;

    for (let i = 0; i < contentLines.length; i++) {
        const rawLine = contentLines[i].trim();
        if (!rawLine || rawLine.startsWith('==') || rawLine.startsWith('--')) continue;

        const line = rawLine.replace(/`/g, '');

        if (!line.startsWith('-') && !line.startsWith('*')) {
            if (currentBlock) {
                blocks.push(currentBlock);
            }
            const tagMatch = line.match(/^(.*?)((\[[^\]]+\]\s*)+)$/);
            let name = line;
            let tagStr = '';
            if (tagMatch) {
                name = tagMatch[1].trim();
                tagStr = tagMatch[2].trim();
            }
            currentBlock = {
                title: name,
                rawTagStr: tagStr,
                tags: parseExamTags(tagStr),
                items: []
            };
        } else if (currentBlock) {
            const itemText = line.replace(/^[-*]\s*/, '').trim();
            currentBlock.items.push(itemText);
        }
    }
    if (currentBlock) {
        blocks.push(currentBlock);
    }

    const domainMap = new Map();

    blocks.forEach((block, bIdx) => {
        const blockName = block.title;
        const blockSlug = cleanSlug(blockName);

        if (cleanSlug(blockName) === subjectSlug || bIdx === 0) {
            block.items.forEach(item => {
                const tagMatch = item.match(/^(.*?)((\[[^\]]+\]\s*)+)$/);
                let domName = item;
                let domTagStr = '';
                if (tagMatch) {
                    domName = tagMatch[1].trim();
                    domTagStr = tagMatch[2].trim();
                }
                const domSlug = cleanSlug(domName);
                const domId = `${subjectId}.${domSlug}`;
                const domTags = Object.keys(parseExamTags(domTagStr)).length > 0 ? parseExamTags(domTagStr) : subjectTags;

                if (!nodes[domId]) {
                    const domNode = {
                        id: domId,
                        slug: domSlug,
                        name: domName,
                        level: 2,
                        levelName: 'Domain',
                        subject: subjectNode.name,
                        subjectId: subjectId,
                        parentId: subjectId,
                        childrenIds: [],
                        ancestorIds: [subjectId],
                        examTags: domTags,
                        rawExamTagString: domTagStr || subjectTagStr,
                        entities: [],
                        keywords: extractKeywords(domName)
                    };
                    nodes[domId] = domNode;
                    if (!subjectNode.childrenIds.includes(domId)) {
                        subjectNode.childrenIds.push(domId);
                    }
                    domainMap.set(domSlug, domId);
                }
            });
            return;
        }

        let parentDomId = null;
        for (const [dSlug, dId] of domainMap.entries()) {
            if (blockSlug === dSlug || blockSlug.includes(dSlug) || dSlug.includes(blockSlug)) {
                parentDomId = dId;
                break;
            }
        }

        if (parentDomId && nodes[parentDomId]) {
            const parentDomainNode = nodes[parentDomId];
            block.items.forEach(topicItem => {
                const tagMatch = topicItem.match(/^(.*?)((\[[^\]]+\]\s*)+)$/);
                let topicName = topicItem;
                let topicTagStr = '';
                if (tagMatch) {
                    topicName = tagMatch[1].trim();
                    topicTagStr = tagMatch[2].trim();
                }
                const topicSlug = cleanSlug(topicName);
                const topicId = `${parentDomId}.${topicSlug}`;
                const topicTags = Object.keys(parseExamTags(topicTagStr)).length > 0 ? parseExamTags(topicTagStr) : parentDomainNode.examTags;

                if (!nodes[topicId]) {
                    const topicNode = {
                        id: topicId,
                        slug: topicSlug,
                        name: topicName,
                        level: 3,
                        levelName: 'Topic',
                        subject: subjectNode.name,
                        subjectId: subjectId,
                        parentId: parentDomId,
                        childrenIds: [],
                        ancestorIds: [subjectId, parentDomId],
                        examTags: topicTags,
                        rawExamTagString: topicTagStr || parentDomainNode.rawExamTagString,
                        entities: [],
                        keywords: extractKeywords(topicName)
                    };
                    nodes[topicId] = topicNode;
                    if (!parentDomainNode.childrenIds.includes(topicId)) {
                        parentDomainNode.childrenIds.push(topicId);
                    }
                }
            });
        } else {
            let matchedTopicNode = null;
            for (const [nId, n] of Object.entries(nodes)) {
                if (n.level === 3 && (cleanSlug(n.name) === blockSlug || blockSlug.includes(cleanSlug(n.name)))) {
                    matchedTopicNode = n;
                    break;
                }
            }

            if (!matchedTopicNode) {
                const lastDomainId = subjectNode.childrenIds[subjectNode.childrenIds.length - 1] || subjectId;
                const topicSlug = cleanSlug(blockName);
                const topicId = `${lastDomainId}.${topicSlug}`;
                matchedTopicNode = {
                    id: topicId,
                    slug: topicSlug,
                    name: blockName,
                    level: 3,
                    levelName: 'Topic',
                    subject: subjectNode.name,
                    subjectId: subjectId,
                    parentId: lastDomainId,
                    childrenIds: [],
                    ancestorIds: [subjectId, lastDomainId],
                    examTags: Object.keys(block.tags).length > 0 ? block.tags : subjectNode.examTags,
                    rawExamTagString: block.rawTagStr || subjectTagStr,
                    entities: [],
                    keywords: extractKeywords(blockName)
                };
                nodes[topicId] = matchedTopicNode;
                if (nodes[lastDomainId] && !nodes[lastDomainId].childrenIds.includes(topicId)) {
                    nodes[lastDomainId].childrenIds.push(topicId);
                }
            }

            block.items.forEach(entityItem => {
                const entityMatch = entityItem.match(/^([^(]+)(?:\((.*)\))?$/);
                let entityName = entityItem;
                let details = '';
                if (entityMatch) {
                    entityName = entityMatch[1].trim();
                    details = (entityMatch[2] || '').trim();
                }

                const entitySlug = cleanSlug(entityName);
                const entityId = `${matchedTopicNode.id}.${entitySlug}`;
                const entityList = details.split(/;|\//).map(d => d.trim()).filter(Boolean);

                const entityNode = {
                    id: entityId,
                    slug: entitySlug,
                    name: entityName,
                    level: 4,
                    levelName: 'Subtopic_Entity',
                    subject: subjectNode.name,
                    subjectId: subjectId,
                    parentId: matchedTopicNode.id,
                    childrenIds: [],
                    ancestorIds: [...matchedTopicNode.ancestorIds, matchedTopicNode.id],
                    examTags: matchedTopicNode.examTags,
                    rawExamTagString: matchedTopicNode.rawExamTagString,
                    description: details,
                    entities: entityList,
                    keywords: extractKeywords(entityName, details, entityList)
                };

                nodes[entityId] = entityNode;
                if (!matchedTopicNode.childrenIds.includes(entityId)) {
                    matchedTopicNode.childrenIds.push(entityId);
                }
            });
        }
    });
}

// Compute statistics
const stats = {
    totalNodes: Object.keys(nodes).length,
    byLevel: {
        subjects: Object.values(nodes).filter(n => n.level === 1).length,
        domains: Object.values(nodes).filter(n => n.level === 2).length,
        topics: Object.values(nodes).filter(n => n.level === 3).length,
        entities: Object.values(nodes).filter(n => n.level === 4).length,
    },
    bySubject: {},
    byExam: {
        upsc: Object.values(nodes).filter(n => n.examTags.upsc && n.examTags.upsc.length > 0).length,
        kas: Object.values(nodes).filter(n => n.examTags.kas && n.examTags.kas.length > 0).length,
        ssc: Object.values(nodes).filter(n => n.examTags.ssc && n.examTags.ssc.length > 0).length,
        banking: Object.values(nodes).filter(n => n.examTags.banking && n.examTags.banking.length > 0).length,
    }
};

rootSubjectIds.forEach(sId => {
    const sNode = nodes[sId];
    const count = Object.values(nodes).filter(n => n.subjectId === sId).length;
    stats.bySubject[sNode.name] = count;
});

const graphData = {
    version: '2.0.0',
    generatedAt: new Date().toISOString(),
    rootSubjectIds,
    nodes,
    stats
};

fs.writeFileSync(outJsonPath, JSON.stringify(graphData, null, 2), 'utf-8');

console.log('Successfully serialized Knowledge Graph to JSON:');
console.log(JSON.stringify(stats, null, 2));
console.log(`Saved to ${outJsonPath}`);
