# -*- coding: utf-8 -*-
"""
Test classifier for all 1,060 EPFO questions.
Evaluates match rate, distributions by subject/domain, and identifies any fallbacks or unmapped questions.
"""
import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

print(f"Loaded {len(questions)} questions.")

# Let's inspect passages and directions
english_passages = [q for q in questions if q.get('passage_english') and 'English' in q.get('passage_english')]
print(f"Questions explicitly having English language directions/passages: {len(english_passages)}")
