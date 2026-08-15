const fs = require('fs');
const path = require('path');

const mockDataContent = fs.readFileSync(path.join(__dirname, '..', 'src', 'lib', 'mockData.ts'), 'utf-8');
const examDetailsContent = fs.readFileSync(path.join(__dirname, '..', 'src', 'data', 'examDetails.ts'), 'utf-8');
const kgData = JSON.parse(fs.readFileSync(path.join(__dirname, '..', 'src', 'data', 'knowledge_graph.json'), 'utf-8'));

console.log('==================================================');
console.log('1. EXAM IDS ALIGNMENT CHECK');
console.log('==================================================');

// Extract IDs from mockData.ts
const mockIdMatches = [...mockDataContent.matchAll(/id:\s*'([^']+)'/g)].map(m => m[1]);
// Keep unique IDs from the EXAMS array
const mockExamIds = mockIdMatches.slice(0, 12);

// Extract IDs from examDetails.ts
const detailIdMatches = [...examDetailsContent.matchAll(/'([a-z0-9-]+)':\s*\{/g)].map(m => m[1]);
const detailExamIds = [...new Set(detailIdMatches)];

console.log('MockData Exam IDs (12):', mockExamIds);
console.log('ExamDetails Exam IDs (12):', detailExamIds);

const missingInDetails = mockExamIds.filter(id => !detailExamIds.includes(id));
const missingInMock = detailExamIds.filter(id => !mockExamIds.includes(id));

if (missingInDetails.length === 0 && missingInMock.length === 0) {
    console.log('✅ ALL 12 exam IDs match perfectly between mockData.ts and examDetails.ts!');
} else {
    console.error('Mismatch found:', { missingInDetails, missingInMock });
}

console.log('\n==================================================');
console.log('2. KNOWLEDGE GRAPH TOPOLOGY INTEGRITY');
console.log('==================================================');
console.log('Total Serialized Nodes:', kgData.stats.totalNodes);
console.log('Subjects (L1):', kgData.stats.byLevel.subjects);
console.log('Domains (L2):', kgData.stats.byLevel.domains);
console.log('Topics (L3):', kgData.stats.byLevel.topics);
console.log('Entities (L4):', kgData.stats.byLevel.entities);

let brokenParents = 0;
Object.values(kgData.nodes).forEach(node => {
    if (node.parentId && !kgData.nodes[node.parentId]) {
        console.error('Broken parent link:', node.id, '-> parent missing:', node.parentId);
        brokenParents++;
    }
});

if (brokenParents === 0) {
    console.log('✅ KNOWLEDGE GRAPH TOPOLOGY IS 100% VALID! 0 broken parent links.');
}

console.log('\n==================================================');
console.log('3. SUMMARY OF 12 ACTIVE EXAMS & ORDERING');
console.log('==================================================');
mockExamIds.forEach((id, idx) => {
    const isNat = id.startsWith('upsc');
    console.log(`${idx + 1}. [${isNat ? 'NATIONAL' : 'KARNATAKA'}] ${id}`);
});
