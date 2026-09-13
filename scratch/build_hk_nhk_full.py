# -*- coding: utf-8 -*-
"""
Builder and validator for HK and NHK full mapping scripts.
Ensures 100% of node IDs exist in knowledge_graph.json.
"""
import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

def check_id(nid):
    if nid not in nodes:
        raise ValueError(f"NODE NOT FOUND: {nid}")
    return True

print("Knowledge graph nodes ready:", len(nodes))
