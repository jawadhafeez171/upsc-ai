# -*- coding: utf-8 -*-
import json

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
targets = [
    'indian_physical_geography_monsoon_architecture',
    'human_geography_population_settlements',
    'economic_resource_geography',
    'world_mapping_geopolitical_locations'
]

for did in targets:
    full_did = f"geography_earth_systems.{did}"
    d = nodes.get(full_did)
    if d:
        print(f"\nDOMAIN: {full_did} -> {d['name']} (Level {d['level']})")
        for tid in d.get('childrenIds', []):
            t = nodes.get(tid)
            if t:
                subs = t.get('childrenIds', [])
                print(f"   TOPIC: {tid} -> {t['name']} ({len(subs)} subtopics)")
                for sid in subs:
                    sub = nodes.get(sid)
                    if sub:
                        print(f"      L4: {sid} -> {sub['name']}")
            else:
                print(f"   TOPIC NOT FOUND: {tid}")
    else:
        print(f"DOMAIN NOT FOUND: {full_did}")
