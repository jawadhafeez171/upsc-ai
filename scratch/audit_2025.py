import json
import re
from build_year_mapper import find_best_node, detect_mapping_facet, nodes, valid_nids

YEAR = 2025
file_path = f'src/data/upsc_pyq/{YEAR}.json'

with open(file_path, 'r', encoding='utf-8') as f:
    pyqs = json.load(f)

# Specific corrections for tricky 2025 questions based on exact context:
MANUAL_OVERRIDE_2025 = {
    52: {
        'node_id': 'history.post-independence_india.linguistic_reorganisation_of_states_national_consolidation.states_reorganisation_commission_implementation',
        'is_mapping': True,
        'mapping': {
            'region': 'India',
            'category': 'Political',
            'spatial_skill': 'Feature-State/Country Matching'
        },
        'secondary_node_ids': [
            'geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout'
        ]
    },
    62: {
        # INSTC Corridor
        'node_id': 'international_relations_global_institutions.regional_multilateral_groupings.indo-pacific_trans-regional_alliances',
        'is_mapping': True,
        'mapping': {
            'region': 'World',
            'category': 'Economic',
            'spatial_skill': 'Location Identification'
        },
        'secondary_node_ids': [
            'geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals',
            'geography_earth_systems.indian_mapping_spatial_geography.infrastructure_ports_transport_corridors'
        ]
    },
    77: {
        # Anadyr (Siberia) and Nome (Alaska) - International Date Line
        'node_id': 'geography_earth_systems.physical_geography_earth_systems.earth_and_the_solar_system.earths_shape_dimensions_geoid',
        'is_mapping': True,
        'mapping': {
            'region': 'World',
            'category': 'Physical',
            'spatial_skill': 'Relative Position / Ordering'
        },
        'secondary_node_ids': [
            'geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals'
        ]
    },
    79: {
        # Botswana (Diamond), Chile (Lithium), Indonesia (Nickel)
        'node_id': 'geography_earth_systems.economic_resource_geography.global_indian_distribution_of_natural_resources.metallic_and_non_metallic_mineral_belts',
        'is_mapping': True,
        'mapping': {
            'region': 'World',
            'category': 'Economic',
            'spatial_skill': 'Feature-State/Country Matching'
        },
        'secondary_node_ids': [
            'geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones'
        ]
    },
    80: {
        # Mallorca (Spain), Normandy (France), Sardinia (Italy)
        'node_id': 'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica',
        'is_mapping': True,
        'mapping': {
            'region': 'World',
            'category': 'Political',
            'spatial_skill': 'Feature-State/Country Matching'
        },
        'secondary_node_ids': [
            'geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones'
        ]
    }
}

updated_count = 0
mapping_count = 0
invalid_count = 0

for q in pyqs:
    qnum = q['question_number']
    
    if qnum in MANUAL_OVERRIDE_2025:
        override = MANUAL_OVERRIDE_2025[qnum]
        best_nid = override['node_id']
        map_facet = override.get('mapping')
        is_map = override.get('is_mapping', True)
        sec_ids = override.get('secondary_node_ids', [])
    else:
        # Determine best node
        best_nid = find_best_node(
            q_text=q.get('question_english', ''),
            tags=q.get('tags', []),
            existing_nid=q.get('node_id', ''),
            subj_hint=q.get('subject'),
            domain_hint=q.get('domain')
        )
        
        # Check mapping
        map_det = detect_mapping_facet(q.get('question_english', ''), q.get('tags', []))
        if map_det or q.get('is_mapping'):
            is_map = True
            map_facet = map_det if map_det else q.get('mapping', {})
            sec_ids = map_det.get('secondary_node_ids', []) if map_det else q.get('secondary_node_ids', [])
        else:
            is_map = False
            map_facet = None
            sec_ids = []
            
    if best_nid not in valid_nids:
        print(f"ERROR: Q{qnum} generated invalid node ID: {best_nid}")
        invalid_count += 1
        continue
        
    node_data = nodes[best_nid]
    q['node_id'] = best_nid
    q['subject'] = node_data.get('subject', q.get('subject', ''))
    q['subject_hindi'] = node_data.get('subject_hindi', q.get('subject_hindi', ''))
    q['domain'] = node_data.get('domain', q.get('domain', ''))
    q['domain_hindi'] = node_data.get('domain_hindi', q.get('domain_hindi', ''))
    q['sub_topic'] = node_data.get('name', q.get('sub_topic', ''))
    q['sub_topic_hindi'] = node_data.get('name_hindi', q.get('sub_topic_hindi', ''))
    
    q['is_mapping'] = is_map
    if is_map:
        q['mapping'] = {
            'region': map_facet.get('region', 'India') if map_facet else 'India',
            'category': map_facet.get('category', 'Physical') if map_facet else 'Physical',
            'spatial_skill': map_facet.get('spatial_skill', 'Location Identification') if map_facet else 'Location Identification'
        }
        q['secondary_node_ids'] = sec_ids
        mapping_count += 1
    else:
        q.pop('mapping', None)
        q.pop('secondary_node_ids', None)
        
    updated_count += 1

print(f"2025 Audit: {updated_count}/100 updated, {mapping_count} mapping questions, {invalid_count} invalid.")

if invalid_count == 0:
    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(pyqs, f, ensure_ascii=False, indent=2)
    print("SUCCESS: 2025.json updated cleanly with 100% valid node IDs!")
else:
    print("FAILED: Fix invalid node IDs before updating.")
