import json
import glob
import re
from collections import Counter

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
valid_nodes = kg['nodes']

# Build subject prefix mapping
SUBJECT_PREFIX = {
    'General Mental Ability, Quantitative Aptitude & Comprehension': 'general_mental_ability_quantitative_aptitude_comprehension',
    'Science, Technology & Defence': 'science_technology_defence',
    'Environment, Ecology & Disaster Management': 'environment_ecology_disaster_management',
    'Indian Economy & Development': 'indian_economy_development',
    'Indian Society & Social Justice': 'indian_society_social_justice',
    'Art, Culture & Heritage': 'art_culture_heritage',
    'Indian Polity, Constitution & Governance': 'indian_polity_constitution_governance',
    'Geography & Earth Systems': 'geography_earth_systems',
    'Ethics, Integrity & Aptitude': 'ethics_integrity_aptitude',
    'History': 'history',
    'International Relations & Global Institutions': 'international_relations_global_institutions'
}

# Stopwords to ignore
STOPWORDS = {
    'a', 'an', 'the', 'and', 'or', 'of', 'in', 'on', 'at', 'to', 'for', 'with', 'by', 'as', 'is', 'are', 'was', 'were',
    'be', 'been', 'which', 'what', 'who', 'whom', 'this', 'that', 'these', 'those', 'it', 'its', 'from', 'into', 'during',
    'including', 'until', 'against', 'among', 'throughout', 'despite', 'towards', 'upon', 'concerning', 'to', 'in', 'for',
    'on', 'by', 'about', 'like', 'through', 'over', 'before', 'between', 'after', 'since', 'without', 'under', 'within',
    'along', 'following', 'across', 'behind', 'beyond', 'plus', 'except', 'but', 'up', 'out', 'around', 'down', 'off',
    'above', 'near', 'correct', 'statement', 'statements', 'answer', 'choose', 'following', 'given', 'options', 'match',
    'list', 'i', 'ii', 'consider', 'reference', 'not', 'true', 'false', 'one', 'two', 'three', 'four', 'only', 'all',
    'both', 'neither', 'either', 'code', 'codes', 'option', 'karnataka', 'india', 'state', 'question', 'explanation'
}

def tokenize(text):
    text = text.lower()
    # split by punctuation/spaces
    tokens = re.findall(r'[a-z0-9]+', text)
    return [t for t in tokens if len(t) > 2 and t not in STOPWORDS]

# Precompute index for nodes
node_tokens = {}
for nid, ndata in valid_nodes.items():
    toks = set()
    toks.update(tokenize(nid.replace('.', ' ').replace('_', ' ')))
    toks.update(tokenize(ndata.get('name', '')))
    toks.update(tokenize(ndata.get('description', '')))
    for kw in ndata.get('keywords', []):
        toks.update(tokenize(kw))
    node_tokens[nid] = toks

files = sorted(glob.glob('src/data/kas_*p2*.json'))
all_questions = []
for f in files:
    with open(f, 'r', encoding='utf-8') as fp:
        for q in json.load(fp):
            q['file'] = f
            all_questions.append(q)

print(f"Total questions: {len(all_questions)}")

# Specific exact mappings for high precision
from scratch.build_p2_mappings import map_node as map_csat_node

mapped_results = []
for q in all_questions:
    nid = q.get('node_id', '')
    if nid in valid_nodes:
        mapped_results.append((q, nid, 'already_valid'))
        continue

    # Try CSAT mapper first
    csat_res = map_csat_node(q)
    if csat_res and csat_res in valid_nodes:
        mapped_results.append((q, csat_res, 'csat_rule'))
        continue

    subj = q.get('subject', '')
    prefix = SUBJECT_PREFIX.get(subj, '')
    
    # Candidate nodes
    candidates = [k for k in valid_nodes.keys() if k.startswith(prefix)]
    if not candidates:
        candidates = list(valid_nodes.keys())

    # Build question token bag
    qtxt = (q.get('question_english') or q.get('question') or '')
    exp = (q.get('explanation_english') or q.get('explanation') or '')
    sub = q.get('sub_topic', '')
    dom = q.get('domain', '')
    old_nid = q.get('node_id', '')

    q_toks = set()
    # High weight tokens from domain, subtopic, old_nid
    primary_toks = set(tokenize(old_nid.replace('.', ' ').replace('_', ' ') + ' ' + dom + ' ' + sub))
    secondary_toks = set(tokenize(qtxt + ' ' + exp))

    # Special state matching: if Karnataka is prominent, prefer karnataka nodes
    is_kar = 'karnataka' in (dom + ' ' + sub + ' ' + qtxt).lower()

    best_score = -1
    best_node = None

    for cand in candidates:
        c_toks = node_tokens[cand]
        cand_is_kar = 'karnataka' in cand

        score = 0
        score += len(primary_toks & c_toks) * 5
        score += len(secondary_toks & c_toks) * 1

        if is_kar and cand_is_kar:
            score += 8
        elif not is_kar and cand_is_kar:
            score -= 10

        # Prefer leaf nodes
        if len(valid_nodes[cand].get('children', [])) == 0:
            score += 2

        if score > best_score:
            best_score = score
            best_node = cand

    mapped_results.append((q, best_node, f'scored_{best_score}'))

print(f"Total mapped: {len(mapped_results)}")
invalid = [r for r in mapped_results if r[1] not in valid_nodes]
print(f"Invalid count: {len(invalid)}")

# Sample inspection across subjects
by_subj = Counter(r[0]['subject'] for r in mapped_results)
for s, c in by_subj.items():
    print(f"\n=== Subject: {s} ({c} qs) ===")
    sample = [r for r in mapped_results if r[0]['subject'] == s][:3]
    for q, target, how in sample:
        qn = q.get('question_number')
        sub = q.get('sub_topic', '')[:35]
        print(f"  Q{qn:02d} [{how}]: {sub}")
        print(f"      -> {target}")
