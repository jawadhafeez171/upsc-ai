# -*- coding: utf-8 -*-
"""
Full mapping definitions and enrichment script for HK and NHK datasets.
"""
import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

# Load master knowledge graph
with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

# Build helper to validate node_id
def validate_node(node_id):
    if node_id not in nodes:
        raise ValueError(f"Node ID not found in KG: {node_id}")
    return nodes[node_id]

print(f"Master KG loaded successfully with {len(nodes)} nodes.")
