import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    master_kg = json.load(f)

valid_nids = set(master_kg['nodes'].keys())

def get_canonical_and_mapping(fname, q):
    nid = q.get('node_id', '') or ''
    sub_topic = q.get('sub_topic', '') or ''
    q_text = (q.get('question_english', '') or q.get('text', '') or '')
    q_num = q.get('question_number', 0)
    
    # 1. Fix historical anomalies in 2022.json
    if fname == '2022.json':
        if q_num == 22:
            return {
                'node_id': 'indian_economy_development.agriculture_food_management_subsidies.cropping_patterns_agrarian_systems',
                'subject': 'Indian Economy & Development',
                'domain': 'Agriculture, Food Management & Subsidies',
                'sub_topic': 'System of Rice Intensification (SRI) - Alternate Wetting & Drying',
                'is_mapping': False
            }
        elif q_num == 24:
            return {
                'node_id': 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india.peninsular_plateau_hills_western_eastern_ghats',
                'subject': 'Geography & Earth Systems',
                'domain': 'Indian Physical Geography & Monsoon Architecture',
                'sub_topic': 'Fluvial Landforms - Gandikota Canyon & Pennar River Gorge',
                'is_mapping': True,
                'mapping': {
                    'is_mapping': True,
                    'region': 'India',
                    'category': 'Mountains, Passes & Plateaus',
                    'spatial_skill': 'location_identification',
                    'has_image': False
                },
                'secondary_node_ids': ['geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes']
            }
        elif q_num == 28:
            return {
                'node_id': 'geography_earth_systems.economic_resource_geography.global_indian_distribution_of_natural_resources.energy_resources_fossil_fuels_nuclear_renewables',
                'subject': 'Geography & Earth Systems',
                'domain': 'Economic & Resource Geography',
                'sub_topic': 'Monazite Placer Deposits, Thorium & Atomic Energy Minerals',
                'is_mapping': False
            }
        elif q_num == 81:
            return {
                'node_id': 'geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget',
                'subject': 'Geography & Earth Systems',
                'domain': 'Climatology',
                'sub_topic': 'Cloud Radiative Forcing - High Cirrus vs Low Stratocumulus Albedo',
                'is_mapping': False
            }
        elif q_num == 91:
            return {
                'node_id': 'history.ancient_india.sources_of_ancient_indian_history',
                'subject': 'History',
                'domain': 'Ancient India',
                'sub_topic': "Ashokan Major Rock Edicts - Geographical Sites (Dhauli, Jaugada, Kalsi)",
                'is_mapping': True,
                'mapping': {
                    'is_mapping': True,
                    'region': 'India',
                    'category': 'Places in News & Conflict Zones',
                    'spatial_skill': 'location_identification',
                    'has_image': False
                },
                'secondary_node_ids': ['history.ancient_india.mauryan_empire']
            }
        elif q_num == 98:
            return {
                'node_id': 'science_technology_defence.nanoscience_advanced_materials.nanotechnology_applications',
                'subject': 'Science, Technology & Defence',
                'domain': 'Nanoscience & Advanced Materials',
                'sub_topic': 'Nanoparticles in Nature, Cosmetics & Nanotoxicity',
                'is_mapping': False
            }
            
    # Fix 2019.json Q32 & Q36
    if fname == '2019.json':
        if q_num == 32:
            return {
                'node_id': 'science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions',
                'subject': 'Science, Technology & Defence',
                'domain': 'Space Technology & Astronomy',
                'sub_topic': 'Earth Observation & Remote Sensing Satellite Applications (IRS Series)',
                'is_mapping': False
            }
        if q_num == 36:
            return {
                'node_id': 'geography_earth_systems.oceanography_marine_systems.ocean_floor_relief_features.ocean_bottom_relief_shelf_slope_abyssal_plains',
                'subject': 'Geography & Earth Systems',
                'domain': 'Oceanography & Marine Systems',
                'sub_topic': 'Major Seas & Bordering Nations (Adriatic, Black, Caspian, Mediterranean, Red Sea)',
                'is_mapping': True,
                'mapping': {
                    'is_mapping': True,
                    'region': 'World',
                    'category': 'Seas, Straits & Water Bodies',
                    'spatial_skill': 'bordering_nations',
                    'has_image': False
                },
                'secondary_node_ids': ['geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations']
            }

    # 2. Indian Mapping Rivers -> Indian Physical Geography Drainage
    if 'river_systems_tributaries_spatial_ordering' in nid:
        if any(w in (sub_topic + q_text).lower() for w in ['indus', 'sutlej', 'jhelum', 'chenab', 'ravi', 'ganga', 'yamuna', 'brahmaputra', 'teesta', 'subansiri', 'lohit', 'barak', 'gandak', 'ghaghara', 'kosi', 'prayagraj']):
            new_nid = 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india.himalayan_river_systems_indus_ganga_brahmaputra'
        else:
            new_nid = 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india.peninsular_river_systems_east_and_west_flowing'
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Indian Physical Geography & Monsoon Architecture',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'India',
                'category': 'Rivers & Drainage',
                'spatial_skill': 'tributary_confluence',
                'has_image': 'image_url' in q and bool(q.get('image_url'))
            },
            'secondary_node_ids': [nid]
        }

    # 3. Himalayan Mountain Ranges, Passes & Glaciers
    if 'himalayan_mountain_ranges_passes_glaciers' in nid:
        new_nid = 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india.himalayan_mountain_system_divisions_passes'
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Indian Physical Geography & Monsoon Architecture',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'India',
                'category': 'Mountains, Passes & Plateaus',
                'spatial_skill': 'spatial_ordering',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 4. Peninsular Hills, Plateaus & Passes
    if 'peninsular_hills_plateaus_passes' in nid:
        new_nid = 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india.peninsular_plateau_hills_western_eastern_ghats'
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Indian Physical Geography & Monsoon Architecture',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'India',
                'category': 'Mountains, Passes & Plateaus',
                'spatial_skill': 'location_identification',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 5. Coastal features, islands & channels
    if 'coastal_features_islands_maritime_channels' in nid:
        new_nid = 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india.coastal_plains_and_island_territories_of_india'
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Indian Physical Geography & Monsoon Architecture',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'India',
                'category': 'Seas, Straits & Water Bodies',
                'spatial_skill': 'location_identification',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 6. Protected areas wildlife corridors
    if 'protected_areas_wildlife_corridors_spatial_layout' in nid or 'cauvery_basin_protected_areas' in nid:
        new_nid = 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.in-situ_conservation_architecture'
        return {
            'node_id': new_nid,
            'subject': 'Environment, Ecology & Disaster Management',
            'domain': 'Biodiversity & Wildlife Conservation (Protected Areas)',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'India',
                'category': 'Protected Areas & Biogeography',
                'spatial_skill': 'location_identification',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 7. Infrastructure ports transport corridors
    if 'infrastructure_ports_transport_corridors' in nid:
        new_nid = 'indian_economy_development.infrastructure_energy_investment_models.physical_infrastructure_systems'
        return {
            'node_id': new_nid,
            'subject': 'Indian Economy & Development',
            'domain': 'Infrastructure, Energy & Investment Models',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'India',
                'category': 'Minerals, Ports & Infrastructure',
                'spatial_skill': 'location_identification',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 8. World mapping - enclosed seas
    if 'enclosed_seas_bordering_nations' in nid:
        new_nid = 'geography_earth_systems.oceanography_marine_systems.ocean_floor_relief_features.ocean_bottom_relief_shelf_slope_abyssal_plains'
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Oceanography & Marine Systems',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'World',
                'category': 'Seas, Straits & Water Bodies',
                'spatial_skill': 'bordering_nations',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 9. World mapping - strategic straits
    if 'strategic_straits_chokepoints_canals' in nid:
        new_nid = 'geography_earth_systems.oceanography_marine_systems.marine_ecosystems_conservation.marine_resources_unclos_zones_blue_economy'
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Oceanography & Marine Systems',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'World',
                'category': 'Seas, Straits & Water Bodies',
                'spatial_skill': 'location_identification',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 10. World mapping - major world rivers lakes drainage
    if 'major_world_rivers_lakes_drainage' in nid:
        lower_txt = (sub_topic + q_text).lower()
        if any(w in lower_txt for w in ['mekong', 'irrawaddy', 'mahaweli', 'tonle sap']):
            new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_south_east_asia'
        elif any(w in lower_txt for w in ['russia', 'baikal', 'volga', 'siberia']):
            new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_russia_central_asia'
        elif any(w in lower_txt for w in ['south asia', 'sri lanka', 'indus']):
            new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_south_asia'
        else:
            new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica'
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Geography of the World',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'World',
                'category': 'Rivers & Drainage',
                'spatial_skill': 'location_identification',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 11. World mapping - international land borders
    if 'international_land_borders_disputed_territories' in nid:
        new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica'
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Geography of the World',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'World',
                'category': 'International Borders & Boundaries',
                'spatial_skill': 'bordering_nations',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 12. World mapping - places in news conflict zones
    if 'places_in_news_conflict_zones' in nid:
        lower_txt = (sub_topic + q_text).lower()
        if any(w in lower_txt for w in ['russia', 'central asia', 'azerbaijan', 'armenia', 'nagorno', 'karabakh']):
            new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_russia_central_asia'
        elif any(w in lower_txt for w in ['kachin', 'myanmar', 'south east asia', 'south china sea', 'taiwan']):
            new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_south_east_asia'
        elif any(w in lower_txt for w in ['south asia', 'pakistan', 'afghanistan', 'sri lanka']):
            new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_south_asia'
        else:
            new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica'
        
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Geography of the World',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'World',
                'category': 'Places in News & Conflict Zones',
                'spatial_skill': 'location_identification',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 13. World mountains
    if 'mountain_ranges_peaks_plateaus_world' in nid:
        new_nid = 'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica'
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Geography of the World',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'World',
                'category': 'Mountains, Passes & Plateaus',
                'spatial_skill': 'location_identification',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # 14. Karnataka mapping
    if 'karnataka_mapping_state_geography' in nid:
        if 'river_basins' in nid:
            new_nid = 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.cauvery_kaveri_river_basin'
            if 'sharavathi' in (sub_topic + q_text).lower():
                new_nid = 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.sharavathi_river'
            category = 'Rivers & Drainage'
        else:
            new_nid = 'geography_earth_systems.geography_of_karnataka.climate_rainfall_agro-climatic_zones_of_karnataka'
            category = 'Minerals, Ports & Infrastructure'
        
        return {
            'node_id': new_nid,
            'subject': 'Geography & Earth Systems',
            'domain': 'Geography of Karnataka',
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': 'Karnataka',
                'category': category,
                'spatial_skill': 'location_identification',
                'has_image': False
            },
            'secondary_node_ids': [nid]
        }

    # Chandrayaan Q20 in kas_dec_p2_2024
    if 'chandrayaan' in nid:
        return {
            'node_id': 'science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions',
            'subject': 'Science, Technology & Defence',
            'domain': 'Space Technology & Astronomy',
            'sub_topic': sub_topic,
            'is_mapping': False
        }

    # If it is already in a canonical topic but has mapping tags, tag it!
    tags = q.get('tags', []) or []
    if any('mapping' in str(t).lower() for t in tags) or 'map' in [str(t).lower() for t in tags]:
        reg = 'India' if ('india' in nid or 'karnataka' in nid) else 'World'
        cat = 'Rivers & Drainage' if 'drainage' in nid else 'Mountains, Passes & Plateaus'
        return {
            'node_id': nid,
            'subject': q.get('subject', ''),
            'domain': q.get('domain', ''),
            'sub_topic': sub_topic,
            'is_mapping': True,
            'mapping': {
                'is_mapping': True,
                'region': reg,
                'category': cat,
                'spatial_skill': 'location_identification',
                'has_image': False
            }
        }

    return None
