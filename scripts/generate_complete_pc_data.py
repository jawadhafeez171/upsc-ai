# -*- coding: utf-8 -*-
"""
Enrich both HK and NHK Police Constable (CAR/DAR) 2026 JSON datasets:
- src/data/upsc_pyq/pc/hk_dar_pc_2026_sept.json
- src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json

Maps every single question to canonical Knowledge Graph taxonomy:
- Canonical Subject and Subject Kannada
- Canonical Domain and Domain Kannada
- Sub Topic and Sub Topic Kannada
- Exact Node ID from src/data/knowledge_graph.json
- Subject Tag added to tags array
"""

import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

# 1. Load Master Knowledge Graph
with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
print(f"Loaded Master Knowledge Graph: {len(nodes)} nodes.")

# Helper to validate node_id
def validate(nid):
    if nid not in nodes:
        raise ValueError(f"CRITICAL ERROR: Node ID '{nid}' does not exist in knowledge_graph.json!")
    return nid
