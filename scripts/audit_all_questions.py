import json
import glob
import sys
import re

sys.stdout.reconfigure(encoding='utf-8')

# Load Knowledge Graph
with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)
kg_nodes = kg.get('nodes', {})

capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))

# Track audits
gma_audit = []
gs_in_gma = []

for fpath in capf_files:
    fname = fpath.split('\\')[-1].split('/')[-1]
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        q['__file__'] = fname
        subj = q.get('subject', '')
        qtext = q.get('question_english', '')
        
        # Check if classified as GMA
        if subj == "General Mental Ability, Quantitative Aptitude & Comprehension":
            gma_audit.append(q)

print(f"Total questions in GMA currently: {len(gma_audit)}")

# Let's inspect each GMA question
# True GMA questions typically involve:
# math expressions, arithmetic, numbers, code, logic, puzzle, sequence, calendar, clock, speed, ratio, etc.
# But let's print any question that looks like GS:
for q in gma_audit:
    qtext = q.get('question_english', '')
    exp = q.get('explanation_english', '')
    combined = (qtext + ' ' + exp).lower()
    
    # Common GS terms that almost NEVER belong in pure GMA:
    gs_indicators = [
        'treaty', 'dynasty', 'governor general', 'viceroy', 'sultan', 'mughal', 'chola', 'ashoka', 
        'buddha', 'jainism', 'upanishad', 'vedic', 'brahmi', 'kharosthi', 'harappa', 'amendment', 
        'fundamental right', 'directive principle', 'article of the constitution', 'lok sabha', 
        'rajya sabha', 'supreme court', 'high court', 'writ of', 'monsoon', 'river basin', 
        'western ghats', 'plateau', 'volcano', 'biodiversity', 'wildlife sanctuary', 'national park', 
        'biosphere reserve', 'photosynthesis', 'mitochondria', 'chromosome', 'prokaryote', 
        'eukaryote', 'inflation', 'fiscal deficit', 'monetary policy', 'reserve bank of india', 
        'balance of payments', 'world trade organization', 'united nations', 'security council', 
        'code on wages', 'administrative reforms commission', 'reforms commission', 'globalization',
        'permanent settlement', 'vasudeo balwant phadke', 'raster data', 'genetically modify'
    ]
    
    matched_gs = [ind for ind in gs_indicators if ind in combined]
    if matched_gs:
        gs_in_gma.append((q['__file__'], q.get('year'), q.get('question_number'), matched_gs, qtext))

print(f"\nFound {len(gs_in_gma)} suspicious GS questions misclassified into GMA:")
for f, y, qn, inds, txt in gs_in_gma:
    print(f"  [{f} {y} Q{qn}] Indicators {inds}: {txt[:100]}...")
