# -*- coding: utf-8 -*-
"""
Helper script to compile and write the complete scripts/enrich_pc_pyq.py.
"""
import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

# Verify KG loaded
with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
print("KG nodes count:", len(nodes))
