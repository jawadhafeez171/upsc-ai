# -*- coding: utf-8 -*-
import json

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

for did in ['physical_geography_earth_systems', 'climatology_atmospheric_dynamics', 'oceanography_marine_systems']:
    full_did = f'geography_earth_systems.{did}'
    d = kg['nodes'].get(full_did)
    if d:
        print(f"Domain: {full_did} -> {d.get('name')}")
        for tid in d.get('childrenIds', []):
            t = kg['nodes'].get(tid)
            print(f"   Topic: {tid} -> {t.get('name')}")
