import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

# 1. Fix 2020 Q68
with open('src/data/upsc_pyq/2020.json', 'r', encoding='utf-8') as f:
    data_2020 = json.load(f)

for q in data_2020:
    if q.get('question_number') == 68:
        q['is_mapping'] = True
        q['mapping'] = {
            'is_mapping': True,
            'region': 'World',
            'category': 'Rivers & Drainage',
            'spatial_skill': 'location_identification',
            'has_image': False
        }
        q['secondary_node_ids'] = ['geography_earth_systems.world_mapping_geopolitical_locations.major_world_rivers_lakes_drainage']
        if 'Mapping' not in q.get('tags', []):
            q['tags'].append('Mapping')
        print("Updated 2020 Q68 with mapping facet.")

with open('src/data/upsc_pyq/2020.json', 'w', encoding='utf-8') as f:
    json.dump(data_2020, f, indent=4, ensure_ascii=False)

# 2. Fix 2022 Q26
with open('src/data/upsc_pyq/2022.json', 'r', encoding='utf-8') as f:
    data_2022 = json.load(f)

for q in data_2022:
    if q.get('question_number') == 26:
        q['is_mapping'] = True
        q['mapping'] = {
            'is_mapping': True,
            'region': 'World',
            'category': 'Places in News & Conflict Zones',
            'spatial_skill': 'location_identification',
            'has_image': False
        }
        q['secondary_node_ids'] = ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
        if 'Mapping' not in q.get('tags', []):
            q['tags'].append('Mapping')
        print("Updated 2022 Q26 with mapping facet.")

with open('src/data/upsc_pyq/2022.json', 'w', encoding='utf-8') as f:
    json.dump(data_2022, f, indent=4, ensure_ascii=False)

# 3. Fix 2024 Q16
with open('src/data/upsc_pyq/2024.json', 'r', encoding='utf-8') as f:
    data_2024 = json.load(f)

for q in data_2024:
    if q.get('question_number') == 16:
        q['is_mapping'] = True
        q['mapping'] = {
            'is_mapping': True,
            'region': 'World',
            'category': 'Rivers & Drainage',
            'spatial_skill': 'location_identification',
            'has_image': False
        }
        q['secondary_node_ids'] = ['geography_earth_systems.world_mapping_geopolitical_locations.major_world_rivers_lakes_drainage']
        if 'Mapping' not in q.get('tags', []):
            q['tags'].append('Mapping')
        print("Updated 2024 Q16 with mapping facet.")

with open('src/data/upsc_pyq/2024.json', 'w', encoding='utf-8') as f:
    json.dump(data_2024, f, indent=4, ensure_ascii=False)

print("2019-2025 targeted mapping fixes applied successfully.")
