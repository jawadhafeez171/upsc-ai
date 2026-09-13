# -*- coding: utf-8 -*-
import json

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = {k: v for k, v in kg['nodes'].items() if k.startswith('geography_earth_systems')}
print(f"Total geography_earth_systems nodes: {len(nodes)}")

levels = {}
for k, v in nodes.items():
    lvl = v.get('levelName') or f"Level {v.get('level')}"
    levels[lvl] = levels.get(lvl, 0) + 1
print(f"Levels breakdown: {levels}")

for k, v in sorted(nodes.items(), key=lambda x: (x[1].get('level', 1), x[0])):
    if v.get('level') in [1, 2, 3]:
        indent = '  ' * (v.get('level', 1) - 1)
        print(f"{indent}{v.get('level')}. [{v.get('levelName')}] {k} -> {v.get('name')}")
