# -*- coding: utf-8 -*-
"""
Deep Re-audit implementation test script for all 1,060 EPFO questions.
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

print(f"Master KG has {len(kg_nodes)} nodes. Total questions: {len(questions)}.")
