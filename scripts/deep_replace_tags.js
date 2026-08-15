const fs = require('fs');
const path = require('path');

const mdPath = path.join(__dirname, '..', 'knowledge_graph.md');
let md = fs.readFileSync(mdPath, 'utf-8');

// Section by section context-aware tag replacements

// 1. History & Art Culture (Paper 2 in old KAS was Mains GS-1)
md = md.replace(/\[UPSC: Prelims, GS-1\]\s*\[KAS: Paper-2\]/g, '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1]');
md = md.replace(/\[UPSC: Prelims, GS-1\]/g, '[UPSC: Prelims-GS1, Mains-GS1]');
md = md.replace(/\[UPSC: GS-1\]\s*\[KAS: Paper-2\]/g, '[UPSC: Mains-GS1] [KAS: Prelims-P1, Mains-GS1]');
md = md.replace(/\[UPSC: GS-1\]/g, '[UPSC: Mains-GS1]');
md = md.replace(/\[KAS: Paper-2\]/g, '[KAS: Prelims-P1, Mains-GS1]');

// 2. Society & Social Justice
md = md.replace(/\[UPSC: GS-1,\s*GS-2\]\s*\[KAS: Paper-2,\s*Paper-3\]/g, '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]');
md = md.replace(/\[UPSC: GS-1,\s*GS-2\]/g, '[UPSC: Mains-GS1, Mains-GS2]');

// 3. Polity & Governance & IR (Paper 3 in old KAS was Mains GS-2)
md = md.replace(/\[UPSC: Prelims, GS-2\]\s*\[KAS: Paper-3\]/g, '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]');
md = md.replace(/\[UPSC: Prelims, GS-2\]/g, '[UPSC: Prelims-GS1, Mains-GS2]');
md = md.replace(/\[UPSC: GS-2\]\s*\[KAS: Paper-3\]/g, '[UPSC: Mains-GS2] [KAS: Prelims-P1, Mains-GS2]');
md = md.replace(/\[UPSC: GS-2\]/g, '[UPSC: Mains-GS2]');
md = md.replace(/\[KAS: Paper-3\]/g, '[KAS: Prelims-P1, Mains-GS2]');

// 4. Economy (Paper 4 in old KAS was Mains GS-1 / Paper 4)
// S&T, Environment, Internal Security (Paper 4 in old KAS was Mains GS-3)
md = md.replace(/\[UPSC: Prelims, GS-3\]\s*\[KAS: Paper-4\]/g, '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3]');
md = md.replace(/\[UPSC: Prelims, GS-3\]/g, '[UPSC: Prelims-GS1, Mains-GS3]');
md = md.replace(/\[UPSC: GS-3\]\s*\[KAS: Paper-4\]/g, '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]');
md = md.replace(/\[UPSC: GS-3\]/g, '[UPSC: Mains-GS3]');
md = md.replace(/\[KAS: Paper-4\]/g, '[KAS: Prelims-P2, Mains-GS3]');

// 5. Ethics
md = md.replace(/\[UPSC: GS-4\]\s*\[KAS: Paper-4\]/g, '[UPSC: Mains-GS4] [KAS: Mains-GS4]');
md = md.replace(/\[UPSC: GS-4\]/g, '[UPSC: Mains-GS4]');
md = md.replace(/\[UPSC: Prelims,\s*GS-1,\s*GS-4\]/g, '[UPSC: Prelims-GS1, Mains-GS1, Mains-GS4]');

// 6. Section 7 Economy specific fix (KAS Economy is Prelims-P1, Mains-GS1)
// Let's ensure Indian Economy Section header and topics have Prelims-P1, Mains-GS1
md = md.replace(/7\.\s+\*\*Indian Economy & Development\*\*\s+`\[UPSC: Prelims-GS1, Mains-GS3\] \[KAS: Prelims-P2, Mains-GS3\]/g, '7. **Indian Economy & Development** `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1]');
md = md.replace(/7\.\s+INDIAN ECONOMY & DEVELOPMENT\s+`\[UPSC: Prelims-GS1, Mains-GS3\] \[KAS: Prelims-P2, Mains-GS3\]/g, '7. INDIAN ECONOMY & DEVELOPMENT `[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1]');

// 7. General Mental Ability
md = md.replace(/\[UPSC: CSAT\]/g, '[UPSC: Prelims-CSAT]');
md = md.replace(/\[KAS: Paper-1\]/g, '[KAS: Prelims-P2, Mains-GS1]');

// 8. Overview top tags
md = md.replace(/\[UPSC: Prelims, GS-1 \/ GS-2 \/ GS-3 \/ GS-4 \/ CSAT\]/g, '[UPSC: Prelims-GS1 / Prelims-CSAT / Mains-GS1..4]');
md = md.replace(/\[KAS: Paper-1 \/ Paper-2 \/ Paper-3 \/ Paper-4\]/g, '[KAS: Prelims-P1 / Prelims-P2 / Mains-GS1..4]');

fs.writeFileSync(mdPath, md, 'utf-8');
console.log('Finished deep replacement of legacy tags in knowledge_graph.md');
