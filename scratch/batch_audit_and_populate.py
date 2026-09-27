import json
import re
import os
import sys

from build_year_mapper import find_best_node, detect_mapping_facet, nodes, valid_nids

# Year-specific manual overrides for precision matching
MANUAL_OVERRIDES = {
    # 2012 specific overrides if needed
    2012: {
        3: {
            # National Biodiversity Authority (NBA)
            'node_id': 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.core_environmental_legislation'
        },
        4: {
            # National Green Tribunal Act 2010
            'node_id': 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.core_environmental_legislation'
        },
        5: {
            # National Water Mission (Water Resources)
            'node_id': 'geography_earth_systems.economic_resource_geography.global_indian_distribution_of_natural_resources.water_resources_multipurpose_dams_and_irrigation'
        },
        48: {
            # Himalayas (youthful fold mountains)
            'node_id': 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india.himalayan_mountain_system_divisions_passes',
            'is_mapping': True,
            'mapping': {'region': 'India', 'category': 'Physical', 'spatial_skill': 'Relative Position / Ordering'},
            'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.himalayan_mountain_ranges_passes_glaciers']
        },
        88: {
            # Monsoon progression & rainfall gradient
            'node_id': 'geography_earth_systems.indian_physical_geography_monsoon_architecture.indian_monsoon_climate_dynamics.southwest_and_northeast_monsoon_progression',
            'is_mapping': True,
            'mapping': {'region': 'India', 'category': 'Physical', 'spatial_skill': 'Location Identification'},
            'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
        },
        97: {
            # Indian wildlife / biogeography
            'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.biodiversity_fundamentals_patterns',
            'is_mapping': True,
            'mapping': {'region': 'India', 'category': 'Environmental', 'spatial_skill': 'Location Identification'},
            'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout']
        }
    },
    2013: {
        45: {
            # Indus Civilization
            'node_id': 'history.ancient_india.indus_valley_civilization.harappan_society_religion_art',
            'is_mapping': False
        }
    }
}

def process_year(year):
    file_path = f'src/data/upsc_pyq/{year}.json'
    if not os.path.exists(file_path):
        print(f"Skipping {year}: file not found.")
        return False

    with open(file_path, 'r', encoding='utf-8') as f:
        pyqs = json.load(f)

    year_overrides = MANUAL_OVERRIDES.get(year, {})
    invalid_qs = []
    mapping_count = 0

    for q in pyqs:
        qnum = q['question_number']
        q_text = q.get('question_english', '')
        tags = q.get('tags', [])
        
        # Check override first
        if qnum in year_overrides:
            override = year_overrides[qnum]
            best_nid = override['node_id']
            is_map = override.get('is_mapping', False)
            map_facet = override.get('mapping')
            sec_ids = override.get('secondary_node_ids', [])
        else:
            best_nid = find_best_node(
                q_text=q_text,
                tags=tags,
                existing_nid=q.get('node_id', ''),
                subj_hint=q.get('subject'),
                domain_hint=q.get('domain')
            )
            
            map_det = detect_mapping_facet(q_text, tags)
            if map_det or q.get('is_mapping'):
                is_map = True
                map_facet = map_det if map_det else q.get('mapping', {})
                sec_ids = map_det.get('secondary_node_ids', []) if map_det else q.get('secondary_node_ids', [])
            else:
                is_map = False
                map_facet = None
                sec_ids = []

        if not best_nid or best_nid not in valid_nids:
            invalid_qs.append((qnum, best_nid))
            continue

        node_data = nodes[best_nid]
        q['node_id'] = best_nid
        q['subject'] = node_data.get('subject', q.get('subject', ''))
        q['subject_hindi'] = node_data.get('subject_hindi', q.get('subject_hindi', ''))
        q['domain'] = node_data.get('domain', q.get('domain', ''))
        q['domain_hindi'] = node_data.get('domain_hindi', q.get('domain_hindi', ''))
        q['sub_topic'] = node_data.get('name', q.get('sub_topic', ''))
        q['sub_topic_hindi'] = node_data.get('name_hindi', q.get('sub_topic_hindi', ''))
        
        if not q.get('difficulty'):
            q['difficulty'] = 'Medium'
            
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

    if invalid_qs:
        print(f"FAILED {year}: {len(invalid_qs)} invalid questions:")
        for qn, nid in invalid_qs[:10]:
            print(f"  Q{qn}: {nid}")
        return False

    with open(file_path, 'w', encoding='utf-8') as f:
        json.dump(pyqs, f, ensure_ascii=False, indent=2)

    print(f"SUCCESS {year}: 100/100 questions mapped | {mapping_count} mapping questions identified.")
    return True

if __name__ == '__main__':
    years = [int(arg) for arg in sys.argv[1:]] if len(sys.argv) > 1 else list(range(2012, 2025))
    print(f"Starting batch audit & populate for years: {years}")
    for y in years:
        res = process_year(y)
        if not res:
            print(f"Stopping batch at {y} due to error.")
            break
