import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

subjects = [
    'General Mental Ability, Quantitative Aptitude & Comprehension',
    'Science, Technology & Defence',
    'History',
    'Indian Economy & Development',
    'Indian Polity, Constitution & Governance',
    'Environment, Ecology & Disaster Management',
    'Geography & Earth Systems',
    'Art, Culture & Heritage',
    'International Relations & Global Institutions',
    'Language Proficiency, Grammar & Communication (general Kannada & General English)',
    'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS',
    'GENERAL_ACCOUNTING_PRINCIPLES',
    'AUDITING',
    'INSURANCE',
    'SOCIAL_SECURITY_IN_INDIA',
    'APPLIED_STATISTICS'
]

for s in subjects:
    match_nodes = [n for n in nodes.values() if (n.get('subject') or '').lower() == s.lower()]
    print(f"\n--- {s} ({len(match_nodes)} nodes) ---")
    for n in match_nodes[:8]:
        print(f"  {n.get('id')} -> {n.get('name')}")
