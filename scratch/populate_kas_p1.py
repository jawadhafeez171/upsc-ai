import json
import os

P1_FILES = [
    'kas_dec_p1_2011.json',
    'kas_april_p1_2015.json',
    'kas_aug_p1_2017.json',
    'kas_p1_2020.json',
    'kas_aug_p1_2024.json',
    'kas_dec_p1_2024.json'
]

DATA_DIR = 'src/data'

with open(os.path.join(DATA_DIR, 'knowledge_graph_civil_services.json'), 'r', encoding='utf-8') as f:
    kg = json.load(f)
valid_nodes = set(kg['nodes'].keys())

OVERRIDES = {
    # Fix invalid node_ids in 2024 Aug and 2024 Dec
    ('kas_aug_p1_2024.json', 52): {
        'node_id': 'geography_earth_systems.physical_geography_earth_systems.earthquakes.earthquake_mechanics_waves_and_seismic_zones'
    },
    ('kas_dec_p1_2024.json', 93): {
        'node_id': 'geography_earth_systems.physical_geography_earth_systems.volcanoes.volcanic_forms_intrusive_plutonic_and_extrusive'
    },

    # --- 2011 Paper 1 ---
    ('kas_dec_p1_2011.json', 11): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'National Parks, Sanctuaries & Biosphere Reserves',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
    },
    ('kas_dec_p1_2011.json', 26): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },
    ('kas_dec_p1_2011.json', 27): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },
    ('kas_dec_p1_2011.json', 60): {
        'is_mapping': True,
        'region': 'World',
        'category': 'International Borders & Boundaries',
        'spatial_skill': 'spatial_ordering',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories']
    },
    ('kas_dec_p1_2011.json', 61): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Seas, Straits & Water Bodies',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations']
    },
    ('kas_dec_p1_2011.json', 62): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Mountains, Passes & Plateaus',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.western_ghats_peaks_elevations']
    },
    ('kas_dec_p1_2011.json', 63): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Transport & Infrastructure',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.infrastructure_ports_transport_corridors']
    },
    ('kas_dec_p1_2011.json', 67): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering']
    },
    ('kas_dec_p1_2011.json', 69): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Agro-Climatic & Mineral Belts',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
    },

    # --- 2015 Paper 1 ---
    ('kas_april_p1_2015.json', 34): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Seas, Straits & Water Bodies',
        'spatial_skill': 'location_identification',
        'has_image': True,
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations']
    },
    ('kas_april_p1_2015.json', 41): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Coastal & Marine Features',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
    },
    ('kas_april_p1_2015.json', 43): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Transport & Infrastructure',
        'spatial_skill': 'location_identification',
        'has_image': True,
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
    },
    ('kas_april_p1_2015.json', 44): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Agro-Climatic & Mineral Belts',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
    },
    ('kas_april_p1_2015.json', 45): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.river_basins_waterfalls_reservoirs']
    },
    ('kas_april_p1_2015.json', 47): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Agro-Climatic & Mineral Belts',
        'spatial_skill': 'spatial_ordering',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
    },
    ('kas_april_p1_2015.json', 85): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },
    ('kas_april_p1_2015.json', 86): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },
    ('kas_april_p1_2015.json', 93): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'National Parks, Sanctuaries & Biosphere Reserves',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
    },

    # --- 2017 Paper 1 ---
    ('kas_aug_p1_2017.json', 12): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories']
    },
    ('kas_aug_p1_2017.json', 41): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Mountains, Passes & Plateaus',
        'spatial_skill': 'spatial_ordering',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.western_ghats_peaks_elevations']
    },
    ('kas_aug_p1_2017.json', 94): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'spatial_ordering',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.river_basins_waterfalls_reservoirs']
    },
    ('kas_aug_p1_2017.json', 98): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.river_basins_waterfalls_reservoirs']
    },

    # --- 2020 Paper 1 ---
    ('kas_p1_2020.json', 10): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },
    ('kas_p1_2020.json', 31): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Agro-Climatic & Mineral Belts',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
    },
    ('kas_p1_2020.json', 39): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering']
    },
    ('kas_p1_2020.json', 41): {
        'is_mapping': True,
        'region': 'India',
        'category': 'National Parks, Sanctuaries & Biosphere Reserves',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout']
    },
    ('kas_p1_2020.json', 59): {
        'is_mapping': True,
        'region': 'India',
        'category': 'National Parks, Sanctuaries & Biosphere Reserves',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout']
    },
    ('kas_p1_2020.json', 63): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering']
    },
    ('kas_p1_2020.json', 64): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Mountains, Passes & Plateaus',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
    },
    ('kas_p1_2020.json', 92): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.himalayan_mountain_ranges_passes_glaciers']
    },
    ('kas_p1_2020.json', 93): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },

    # --- 2024 August Paper 1 ---
    ('kas_aug_p1_2024.json', 40): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.river_basins_waterfalls_reservoirs']
    },
    ('kas_aug_p1_2024.json', 41): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'boundary_demarcation',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering']
    },
    ('kas_aug_p1_2024.json', 46): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },
    ('kas_aug_p1_2024.json', 47): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories']
    },
    ('kas_aug_p1_2024.json', 51): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Seas, Straits & Water Bodies',
        'spatial_skill': 'bordering_nations',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations']
    },
    ('kas_aug_p1_2024.json', 53): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Mountains, Passes & Plateaus',
        'spatial_skill': 'spatial_ordering',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.himalayan_mountain_ranges_passes_glaciers']
    },
    ('kas_aug_p1_2024.json', 55): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Agro-Climatic & Mineral Belts',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
    },
    ('kas_aug_p1_2024.json', 58): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering']
    },
    ('kas_aug_p1_2024.json', 59): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Mountains, Passes & Plateaus',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
    },
    ('kas_aug_p1_2024.json', 61): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Mountains, Passes & Plateaus',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
    },
    ('kas_aug_p1_2024.json', 67): {
        'is_mapping': True,
        'region': 'India',
        'category': 'National Parks, Sanctuaries & Biosphere Reserves',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout']
    },
    ('kas_aug_p1_2024.json', 74): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },

    # --- 2024 December Paper 1 ---
    ('kas_dec_p1_2024.json', 14): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'boundary_demarcation',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.river_basins_waterfalls_reservoirs']
    },
    ('kas_dec_p1_2024.json', 16): {
        'is_mapping': True,
        'region': 'World',
        'category': 'International Borders & Boundaries',
        'spatial_skill': 'bordering_nations',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories']
    },
    ('kas_dec_p1_2024.json', 17): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Rivers & Drainage',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories']
    },
    ('kas_dec_p1_2024.json', 32): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },
    ('kas_dec_p1_2024.json', 34): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },
    ('kas_dec_p1_2024.json', 37): {
        'is_mapping': True,
        'region': 'World',
        'category': 'International Borders & Boundaries',
        'spatial_skill': 'bordering_nations',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories']
    },
    ('kas_dec_p1_2024.json', 46): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Coastal & Marine Features',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.coastal_features_islands_maritime_channels']
    },
    ('kas_dec_p1_2024.json', 54): {
        'is_mapping': True,
        'region': 'India',
        'category': 'Mountains, Passes & Plateaus',
        'spatial_skill': 'route_traversal',
        'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
    },
    ('kas_dec_p1_2024.json', 73): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Places in News & Conflict Zones',
        'spatial_skill': 'location_identification',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
    },
    ('kas_dec_p1_2024.json', 76): {
        'is_mapping': True,
        'region': 'World',
        'category': 'Seas, Straits & Water Bodies',
        'spatial_skill': 'bordering_nations',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations']
    },
    ('kas_dec_p1_2024.json', 94): {
        'is_mapping': True,
        'region': 'Karnataka',
        'category': 'National Parks, Sanctuaries & Biosphere Reserves',
        'spatial_skill': 'spatial_ordering',
        'secondary_node_ids': ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
    },
    ('kas_dec_p1_2024.json', 96): {
        'is_mapping': True,
        'region': 'World',
        'category': 'International Borders & Boundaries',
        'spatial_skill': 'bordering_nations',
        'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories']
    }
}

def process_p1():
    total_qs = 0
    total_fixed_nodes = 0
    total_mapping = 0
    
    for fname in P1_FILES:
        fpath = os.path.join(DATA_DIR, fname)
        with open(fpath, 'r', encoding='utf-8') as f:
            data = json.load(f)
            
        file_mapping = 0
        for q in data:
            total_qs += 1
            qn = q.get('question_number')
            key = (fname, qn)
            
            # Apply overrides if specified
            if key in OVERRIDES:
                ovr = OVERRIDES[key]
                if 'node_id' in ovr:
                    q['node_id'] = ovr['node_id']
                    total_fixed_nodes += 1
                    
                if ovr.get('is_mapping'):
                    q['is_mapping'] = True
                    has_img = ovr.get('has_image', bool(q.get('image_url')))
                    q['mapping'] = {
                        'is_mapping': True,
                        'region': ovr['region'],
                        'category': ovr['category'],
                        'spatial_skill': ovr['spatial_skill'],
                        'has_image': has_img
                    }
                    q['secondary_node_ids'] = ovr['secondary_node_ids']
                    file_mapping += 1
                    total_mapping += 1
            else:
                # If question already had mapping, ensure clean schema
                if q.get('is_mapping') and isinstance(q.get('mapping'), dict):
                    m = q['mapping']
                    valid_sec = [s for s in q.get('secondary_node_ids', []) if s in valid_nodes]
                    if not valid_sec:
                        reg = m.get('region', 'India')
                        if reg == 'Karnataka':
                            valid_sec = ['geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']
                        elif reg == 'World':
                            valid_sec = ['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones']
                        else:
                            valid_sec = ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
                    q['secondary_node_ids'] = valid_sec
                    file_mapping += 1
                    total_mapping += 1

            # Validate node_id
            if q['node_id'] not in valid_nodes:
                raise ValueError(f"CRITICAL: Invalid node_id '{q['node_id']}' in {fname} Q{qn}")

            # Validate secondary_node_ids
            for sec_nid in q.get('secondary_node_ids', []):
                if sec_nid not in valid_nodes:
                    raise ValueError(f"CRITICAL: Invalid secondary_node_id '{sec_nid}' in {fname} Q{qn}")

        with open(fpath, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
            
        print(f"Processed {fname}: {len(data)} questions, {file_mapping} mapping questions tagged.")

    print(f"\nSUCCESS: All {len(P1_FILES)} KAS Paper 1 files processed!")
    print(f"Total questions: {total_qs}")
    print(f"Invalid slugs fixed: {total_fixed_nodes}")
    print(f"Total mapping questions harmonized: {total_mapping}")

if __name__ == '__main__':
    process_p1()
