# -*- coding: utf-8 -*-
"""
Deep Re-audit & Reclassification Engine for all 1,060 UPSC EPFO Questions.
Applies domain-specific semantic rules, section-aware heuristics, and strict KG validation.
"""

import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)
kg_nodes = master_kg['nodes']

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

print(f"Loaded {len(questions)} questions. Master KG has {len(kg_nodes)} nodes.")

# Let's inspect distribution of questions by question_number across papers
print("\nSample question check across different papers...")
