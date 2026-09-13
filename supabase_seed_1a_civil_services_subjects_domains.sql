-- =========================================================================
-- SUPABASE SEED 1A: CIVIL SERVICES (SUBJECTS & DOMAINS) (123 NODES)
-- =========================================================================

BEGIN;

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'history', 'history', 'History', 1,
        'Subject', 'HISTORY', 'history', NULL,
        ARRAY['history.ancient_india', 'history.medieval_india', 'history.modern_india', 'history.indian_freedom_struggle', 'history.post-independence_india', 'history.world_history', 'history.history_of_karnataka']::text[], ARRAY[]::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['HISTORY']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india', 'ancient_india', 'Ancient India', 2,
        'Domain', 'History', 'history', 'history',
        ARRAY['history.ancient_india.sources_of_ancient_indian_history', 'history.ancient_india.prehistoric_india', 'history.ancient_india.indus_valley_civilization', 'history.ancient_india.vedic_age', 'history.ancient_india.mahajanapadas_magadhan_hegemony', 'history.ancient_india.religious_movements_buddhism', 'history.ancient_india.religious_movements_jainism', 'history.ancient_india.persian_greek_invasions', 'history.ancient_india.mauryan_empire', 'history.ancient_india.post-mauryan_kingdoms', 'history.ancient_india.gupta_empire', 'history.ancient_india.post-gupta_period_harshavardhana', 'history.ancient_india.south_indian_kingdoms', 'history.ancient_india.indian_influence_in_south-east_asia', 'history.ancient_india.archaeological_sources', 'history.ancient_india.literary_sources']::text[], ARRAY['history']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Ancient', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.medieval_india', 'medieval_india', 'Medieval India', 2,
        'Domain', 'History', 'history', 'history',
        ARRAY['history.medieval_india.early_medieval_period_tripartite_struggle', 'history.medieval_india.delhi_sultanate', 'history.medieval_india.vijayanagara_empire_deccan_sultanates', 'history.medieval_india.bhakti_sufi_movements', 'history.medieval_india.mughal_empire', 'history.medieval_india.sur_empire_interregnum', 'history.medieval_india.maratha_empire_regional_states']::text[], ARRAY['history']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Medieval', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.modern_india', 'modern_india', 'Modern India', 2,
        'Domain', 'History', 'history', 'history',
        ARRAY['history.modern_india.advent_of_european_traders_anglo-french_rivalry', 'history.modern_india.british_conquest_consolidation_of_india', 'history.modern_india.british_expansionist_policies_administrative_machinery', 'history.modern_india.economic_impact_of_british_rule', 'history.modern_india.socio-religious_reform_movements', 'history.modern_india.early_peasant_tribal_civil_uprisings']::text[], ARRAY['history']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Modern', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle', 'indian_freedom_struggle', 'Indian Freedom Struggle', 2,
        'Domain', 'History', 'history', 'history',
        ARRAY['history.indian_freedom_struggle.revolt_of_1857', 'history.indian_freedom_struggle.growth_of_modern_nationalism_early_political_associations', 'history.indian_freedom_struggle.foundation_of_inc_moderate_phase', 'history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i', 'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement', 'history.indian_freedom_struggle.swarajists_revolutionary_nationalism_phase_ii_left-wing_upsurge', 'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement', 'history.indian_freedom_struggle.constitutional_impasse_1937_elections_pre-war_politics', 'history.indian_freedom_struggle.wwii_cripps_mission_quit_india_movement_ina', 'history.indian_freedom_struggle.post-war_nationalist_upsurge_cabinet_mission_independence']::text[], ARRAY['history']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Freedom', 'Struggle']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.post-independence_india', 'post-independence_india', 'Post-Independence India', 2,
        'Domain', 'History', 'history', 'history',
        ARRAY['history.post-independence_india.integration_of_princely_states_territorial_consolidation', 'history.post-independence_india.linguistic_reorganisation_of_states_national_consolidation', 'history.post-independence_india.tribal_integration_border_policies_regional_dynamics', 'history.post-independence_india.planned_economy_agrarian_reforms_industrial_transformation', 'history.post-independence_india.foreign_policy_architecture_non-alignment_geopolitical_wars', 'history.post-independence_india.democratic_crises_social_movements_economic_liberalisation']::text[], ARRAY['history']::text[], '{"upsc": ["Mains-GS1"], "kas": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1] [KAS: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Post', 'Independence', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history', 'world_history', 'World History', 2,
        'Domain', 'History', 'history', 'history',
        ARRAY['history.world_history.renaissance_enlightenment_scientific_revolution', 'history.world_history.american_revolution_creation_of_us_republic', 'history.world_history.french_revolution_napoleonic_era', 'history.world_history.industrial_revolution_rise_of_capitalism_and_socialism', 'history.world_history.19th_century_nationalism_unification_of_italy_and_germany', 'history.world_history.imperialism_colonialism_partition_of_africa_and_asia', 'history.world_history.world_war_i_russian_revolution', 'history.world_history.interwar_period_great_depression_rise_of_fascism_and_nazism', 'history.world_history.world_war_ii_post-war_international_order', 'history.world_history.cold_war_era_decolonisation_disintegration_of_ussr']::text[], ARRAY['history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['World', 'History']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka', 'history_of_karnataka', 'History of Karnataka', 2,
        'Domain', 'History', 'history', 'history',
        ARRAY['history.history_of_karnataka.sources_prehistoric_karnataka', 'history.history_of_karnataka.ancient_dynasties_of_karnataka', 'history.history_of_karnataka.medieval_dynasties_of_karnataka', 'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms', 'history.history_of_karnataka.bahmanis_deccan_sultanates_in_karnataka', 'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era', 'history.history_of_karnataka.socio-religious_cultural_movements_in_karnataka', 'history.history_of_karnataka.armed_resistance_freedom_movement_in_karnataka', 'history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation']::text[], ARRAY['history']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['History', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage', 'art_culture_heritage', 'Art, Culture & Heritage', 1,
        'Subject', 'ART, CULTURE & HERITAGE', 'art_culture_heritage', NULL,
        ARRAY['art_culture_heritage.indian_architecture_sculpture', 'art_culture_heritage.indian_paintings_visual_arts', 'art_culture_heritage.performing_arts', 'art_culture_heritage.indian_literature_languages', 'art_culture_heritage.schools_of_indian_philosophy', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage', 'art_culture_heritage.art_culture_of_karnataka', 'art_culture_heritage.martial_arts_traditional_sports_calendars', 'art_culture_heritage.cultural_institutions_numismatics_initiatives']::text[], ARRAY[]::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['ART', 'CULTURE', 'HERITAGE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_architecture_sculpture', 'indian_architecture_sculpture', 'Indian Architecture & Sculpture', 2,
        'Domain', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage',
        ARRAY['art_culture_heritage.indian_architecture_sculpture.harappan_architecture_town_planning', 'art_culture_heritage.indian_architecture_sculpture.mauryan_art_pillars', 'art_culture_heritage.indian_architecture_sculpture.post-mauryan_caves_sculpture', 'art_culture_heritage.indian_architecture_sculpture.temple_architecture_styles', 'art_culture_heritage.indian_architecture_sculpture.indo-islamic_architecture', 'art_culture_heritage.indian_architecture_sculpture.colonial_modern_architecture']::text[], ARRAY['art_culture_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Architecture', 'Sculpture']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_paintings_visual_arts', 'indian_paintings_visual_arts', 'Indian Paintings & Visual Arts', 2,
        'Domain', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage',
        ARRAY['art_culture_heritage.indian_paintings_visual_arts.prehistoric_rock_art', 'art_culture_heritage.indian_paintings_visual_arts.ancient_medieval_murals', 'art_culture_heritage.indian_paintings_visual_arts.miniature_painting_traditions', 'art_culture_heritage.indian_paintings_visual_arts.folk_regional_painting_styles']::text[], ARRAY['art_culture_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Paintings', 'Visual', 'Arts']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.performing_arts', 'performing_arts', 'Performing Arts (Dance, Music, Theatre & Puppetry)', 2,
        'Domain', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage',
        ARRAY['art_culture_heritage.performing_arts.classical_dance_traditions', 'art_culture_heritage.performing_arts.folk_dances_of_india', 'art_culture_heritage.performing_arts.indian_classical_music_systems', 'art_culture_heritage.performing_arts.musical_instruments_folk_music', 'art_culture_heritage.performing_arts.traditional_theatre_forms_puppetry']::text[], ARRAY['art_culture_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Performing', 'Arts', 'Dance', 'Music', 'Theatre', 'Puppetry']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_literature_languages', 'indian_literature_languages', 'Indian Literature & Languages', 2,
        'Domain', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage',
        ARRAY['art_culture_heritage.indian_literature_languages.vedic_epic_puranic_literature', 'art_culture_heritage.indian_literature_languages.classical_religious_texts', 'art_culture_heritage.indian_literature_languages.medieval_bhakti-sufi_literature', 'art_culture_heritage.indian_literature_languages.scientific_astronomical_legal_treatises', 'art_culture_heritage.indian_literature_languages.classical_languages_of_india_scripts']::text[], ARRAY['art_culture_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Literature', 'Languages']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.schools_of_indian_philosophy', 'schools_of_indian_philosophy', 'Schools of Indian Philosophy', 2,
        'Domain', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage',
        ARRAY['art_culture_heritage.schools_of_indian_philosophy.orthodox_astika_systems', 'art_culture_heritage.schools_of_indian_philosophy.heterodox_nastika_systems']::text[], ARRAY['art_culture_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Schools', 'Indian', 'Philosophy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.fairs_festivals_crafts_unesco_heritage', 'fairs_festivals_crafts_unesco_heritage', 'Fairs, Festivals, Crafts & UNESCO Heritage', 2,
        'Domain', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage',
        ARRAY['art_culture_heritage.fairs_festivals_crafts_unesco_heritage.traditional_handicrafts_textiles', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage.unesco_world_heritage_sites_intangible_cultural_heritage', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage.major_fairs_religious_cultural_festivals']::text[], ARRAY['art_culture_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Fairs', 'Festivals', 'Crafts', 'UNESCO', 'Heritage']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems', 'geography_earth_systems', 'Geography & Earth Systems', 1,
        'Subject', 'GEOGRAPHY & EARTH SYSTEMS', 'geography_earth_systems', NULL,
        ARRAY['geography_earth_systems.physical_geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics', 'geography_earth_systems.oceanography_marine_systems', 'geography_earth_systems.indian_physical_geography_monsoon_architecture', 'geography_earth_systems.human_geography_population_settlements', 'geography_earth_systems.economic_resource_geography', 'geography_earth_systems.geography_of_the_world', 'geography_earth_systems.world_mapping_geopolitical_locations', 'geography_earth_systems.indian_mapping_spatial_geography', 'geography_earth_systems.geography_of_karnataka', 'geography_earth_systems.karnataka_mapping_state_geography']::text[], ARRAY[]::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['GEOGRAPHY', 'EARTH', 'SYSTEMS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.physical_geography_earth_systems', 'physical_geography_earth_systems', 'Physical Geography & Earth Systems (Geomorphology)', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.physical_geography_earth_systems.earth_and_the_solar_system', 'geography_earth_systems.physical_geography_earth_systems.earths_origin_internal_structure', 'geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics', 'geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_landform_evolution', 'geography_earth_systems.physical_geography_earth_systems.rocks_formation_and_classification', 'geography_earth_systems.physical_geography_earth_systems.earthquakes', 'geography_earth_systems.physical_geography_earth_systems.volcanoes', 'geography_earth_systems.physical_geography_earth_systems.tsunamis']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Physical', 'Geography', 'Earth', 'Systems', 'Geomorphology']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.climatology_atmospheric_dynamics', 'climatology_atmospheric_dynamics', 'Climatology', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget', 'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts', 'geography_earth_systems.climatology_atmospheric_dynamics.air_masses_fronts_cyclogenesis', 'geography_earth_systems.climatology_atmospheric_dynamics.world_climate_regions', 'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_moisture_condensation_precipitation', 'geography_earth_systems.climatology_atmospheric_dynamics.hydrological_cycle_and_water_balance', 'geography_earth_systems.climatology_atmospheric_dynamics.groundwater_hydrology_and_aquifers']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Climatology', 'Atmospheric', 'Dynamics']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.oceanography_marine_systems', 'oceanography_marine_systems', 'Oceanography & Marine Systems', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.oceanography_marine_systems.ocean_floor_relief_features', 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics', 'geography_earth_systems.oceanography_marine_systems.marine_ecosystems_conservation']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Oceanography', 'Marine', 'Systems']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_physical_geography_monsoon_architecture', 'indian_physical_geography_monsoon_architecture', 'Indian Physical Geography & Monsoon Architecture', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.indian_monsoon_climate_dynamics', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Physical', 'Geography', 'Monsoon', 'Architecture']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.economic_resource_geography', 'economic_resource_geography', 'Economic & Resource Geography', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.economic_resource_geography.global_indian_distribution_of_natural_resources', 'geography_earth_systems.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries', 'geography_earth_systems.economic_resource_geography.agricultural_geography_and_food_security']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Economic', 'Resource', 'Geography']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.human_geography_population_settlements', 'human_geography_population_settlements', 'Human Geography & Population Settlements', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.human_geography_population_settlements.global_indian_demographic_trends', 'geography_earth_systems.human_geography_population_settlements.human_settlements_urban_systems', 'geography_earth_systems.human_geography_population_settlements.tribal_demographics_and_cultural_anthropology']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Human', 'Geography', 'Population', 'Settlements']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka', 'geography_of_karnataka', 'Geography of Karnataka', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.geography_of_karnataka.physiography_relief_divisions_of_karnataka', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka', 'geography_earth_systems.geography_of_karnataka.climate_rainfall_agro-climatic_zones_of_karnataka', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka', 'geography_earth_systems.geography_of_karnataka.1_north-eastern_transition_zone', 'geography_earth_systems.geography_of_karnataka.2_north-eastern_dry_zone', 'geography_earth_systems.geography_of_karnataka.3_northern_dry_zone', 'geography_earth_systems.geography_of_karnataka.4_central_dry_zone', 'geography_earth_systems.geography_of_karnataka.5_eastern_dry_zone', 'geography_earth_systems.geography_of_karnataka.6_southern_dry_zone', 'geography_earth_systems.geography_of_karnataka.7_southern_transition_zone', 'geography_earth_systems.geography_of_karnataka.8_northern_transition_zone', 'geography_earth_systems.geography_of_karnataka.9_hilly_malnad_zone', 'geography_earth_systems.geography_of_karnataka.10_coastal_zone']::text[], ARRAY['geography_earth_systems']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Geography', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice', 'indian_society_social_justice', 'Indian Society & Social Justice', 1,
        'Subject', 'INDIAN SOCIETY & SOCIAL JUSTICE', 'indian_society_social_justice', NULL,
        ARRAY['indian_society_social_justice.salient_features_of_indian_society_diversity', 'indian_society_social_justice.social_institutions', 'indian_society_social_justice.role_of_women_womens_movements', 'indian_society_social_justice.population_dynamics_demographic_issues', 'indian_society_social_justice.poverty_inequality_developmental_challenges', 'indian_society_social_justice.urbanisation_urban_social_issues', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections', 'indian_society_social_justice.social_sector_development', 'indian_society_social_justice.issues_relating_to_poverty_hunger']::text[], ARRAY[]::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['INDIAN', 'SOCIETY', 'SOCIAL', 'JUSTICE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.salient_features_of_indian_society_diversity', 'salient_features_of_indian_society_diversity', 'Salient Features of Indian Society & Diversity', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.salient_features_of_indian_society_diversity.pluralism_cultural_diversity', 'indian_society_social_justice.salient_features_of_indian_society_diversity.unity_in_diversity']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Salient', 'Features', 'Indian', 'Society', 'Diversity']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    )
ON CONFLICT (id) DO UPDATE SET
    slug = EXCLUDED.slug,
    name = EXCLUDED.name,
    level = EXCLUDED.level,
    level_name = EXCLUDED.level_name,
    subject = EXCLUDED.subject,
    subject_id = EXCLUDED.subject_id,
    parent_id = EXCLUDED.parent_id,
    children_ids = EXCLUDED.children_ids,
    ancestor_ids = EXCLUDED.ancestor_ids,
    exam_tags = EXCLUDED.exam_tags,
    raw_exam_tag_string = EXCLUDED.raw_exam_tag_string,
    description = EXCLUDED.description,
    entities = EXCLUDED.entities,
    keywords = EXCLUDED.keywords,
    stream = EXCLUDED.stream,
    streams = EXCLUDED.streams,
    updated_at = NOW();

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'indian_society_social_justice.social_institutions', 'social_institutions', 'Social Institutions (Family, Marriage, Caste & Tribe)', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.social_institutions.kinship_family_systems', 'indian_society_social_justice.social_institutions.marriage_institutions', 'indian_society_social_justice.social_institutions.caste_system_varna', 'indian_society_social_justice.social_institutions.tribal_communities_particularly_vulnerable_tribal_groups_-_pvtgs']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Social', 'Institutions', 'Family', 'Marriage', 'Caste', 'Tribe']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.role_of_women_womens_movements', 'role_of_women_womens_movements', 'Role of Women & Women''s Movements', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.role_of_women_womens_movements.status_of_women_in_india', 'indian_society_social_justice.role_of_women_womens_movements.women_organisations_movements', 'indian_society_social_justice.role_of_women_womens_movements.legislative_social_safeguards']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Role', 'Women', 'Women''s', 'Movements']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.population_dynamics_demographic_issues', 'population_dynamics_demographic_issues', 'Population Dynamics & Demographic Issues', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.population_dynamics_demographic_issues.demographic_profile_of_india', 'indian_society_social_justice.population_dynamics_demographic_issues.demographic_dividend_ageing', 'indian_society_social_justice.population_dynamics_demographic_issues.migration_patterns']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Population', 'Dynamics', 'Demographic', 'Issues']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.poverty_inequality_developmental_challenges', 'poverty_inequality_developmental_challenges', 'Poverty, Inequality & Developmental Challenges', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.poverty_inequality_developmental_challenges.poverty_concepts_measurement', 'indian_society_social_justice.poverty_inequality_developmental_challenges.social_exclusion_vulnerability']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Poverty', 'Inequality', 'Developmental', 'Challenges']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.urbanisation_urban_social_issues', 'urbanisation_urban_social_issues', 'Urbanisation & Urban Social Issues', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.urbanisation_urban_social_issues.urbanisation_trends_sprawl', 'indian_society_social_justice.urbanisation_urban_social_issues.urban_social_problems']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Urbanisation', 'Urban', 'Social', 'Issues']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism', 'social_empowerment_communalism_regionalism_secularism', 'Social Empowerment, Communalism, Regionalism & Secularism', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.social_empowerment_communalism_regionalism_secularism.social_empowerment', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism.communalism', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism.regionalism_sub-nationalism', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism.indian_vs_western_secularism']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Social', 'Empowerment', 'Communalism', 'Regionalism', 'Secularism']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.welfare_schemes_for_vulnerable_sections', 'welfare_schemes_for_vulnerable_sections', 'Welfare Schemes for Vulnerable Sections', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.institutional_safeguards']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Welfare', 'Schemes', 'Vulnerable', 'Sections']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_sector_development', 'social_sector_development', 'Social Sector Development (Health & Education)', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.social_sector_development.health_sector_reforms', 'indian_society_social_justice.social_sector_development.education_sector_reforms']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Social', 'Sector', 'Development', 'Health', 'Education']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.issues_relating_to_poverty_hunger', 'issues_relating_to_poverty_hunger', 'Issues Relating to Poverty & Hunger', 2,
        'Domain', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice',
        ARRAY['indian_society_social_justice.issues_relating_to_poverty_hunger.hunger_malnutrition_architecture']::text[], ARRAY['indian_society_social_justice']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Issues', 'Relating', 'Poverty', 'Hunger']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance', 'indian_polity_constitution_governance', 'Indian Polity, Constitution & Governance', 1,
        'Subject', 'INDIAN POLITY, CONSTITUTION & GOVERNANCE', 'indian_polity_constitution_governance', NULL,
        ARRAY['indian_polity_constitution_governance.historical_background_making_of_the_constitution', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties', 'indian_polity_constitution_governance.union_executive_state_executive', 'indian_polity_constitution_governance.parliament_state_legislatures', 'indian_polity_constitution_governance.indian_judiciary_judicial_system', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution', 'indian_polity_constitution_governance.local_governance', 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies', 'indian_polity_constitution_governance.good_governance_administrative_reforms', 'indian_polity_constitution_governance.transparency_accountability_citizen_charters', 'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure', 'indian_polity_constitution_governance.role_of_civil_services_in_a_democracy', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka', 'indian_polity_constitution_governance.karnataka_gram_swaraj_panchayat_raj_system']::text[], ARRAY[]::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['INDIAN', 'POLITY', 'CONSTITUTION', 'GOVERNANCE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.historical_background_making_of_the_constitution', 'historical_background_making_of_the_constitution', 'Historical Background & Making of the Constitution', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.historical_background_making_of_the_constitution.regulating_charter_acts', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution.government_of_india_acts', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution.constituent_assembly_drafting_process']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Historical', 'Background', 'Making', 'Constitution']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.salient_features_amendments_basic_structure', 'salient_features_amendments_basic_structure', 'Salient Features, Amendments & Basic Structure', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.salient_features_amendments_basic_structure.salient_features_of_the_indian_constitution', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.preamble', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.major_constitutional_amendments', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.basic_structure_doctrine']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Salient', 'Features', 'Amendments', 'Basic', 'Structure']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties', 'fundamental_rights_dpsp_fundamental_duties', 'Fundamental Rights, DPSP & Fundamental Duties', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.directive_principles_of_state_policy_-_part_iv_articles_36-51', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_duties_-_part_iv-a_article_51a']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Fundamental', 'Rights', 'DPSP', 'Duties']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.union_executive_state_executive', 'union_executive_state_executive', 'Union Executive & State Executive', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.union_executive_state_executive.union_executive', 'indian_polity_constitution_governance.union_executive_state_executive.state_executive']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Union', 'Executive', 'State']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.parliament_state_legislatures', 'parliament_state_legislatures', 'Parliament & State Legislatures', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.parliament_state_legislatures.structure_composition', 'indian_polity_constitution_governance.parliament_state_legislatures.legislative_procedure_bills', 'indian_polity_constitution_governance.parliament_state_legislatures.parliamentary_committees_control']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Parliament', 'State', 'Legislatures']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.indian_judiciary_judicial_system', 'indian_judiciary_judicial_system', 'Indian Judiciary & Judicial System', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.indian_judiciary_judicial_system.supreme_court_of_india', 'indian_polity_constitution_governance.indian_judiciary_judicial_system.high_courts_subordinate_judiciary', 'indian_polity_constitution_governance.indian_judiciary_judicial_system.judicial_reforms_alternative_dispute_resolution']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Judiciary', 'Judicial', 'System']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution', 'federal_structure_center-state_relations_devolution', 'Federal Structure, Center-State Relations & Devolution', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.legislative_administrative_relations', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.financial_relations_tax_devolution', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.federal_dynamics_dispute_resolution']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Federal', 'Structure', 'Center', 'State', 'Relations', 'Devolution']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.local_governance', 'local_governance', 'Local Governance (Panchayati Raj & Municipalities)', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.local_governance.73rd_74th_constitutional_amendment_acts', 'indian_polity_constitution_governance.local_governance.devolution_decentralisation_issues']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Local', 'Governance', 'Panchayati', 'Raj', 'Municipalities']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies', 'statutory_regulatory_quasi-judicial_bodies', 'Statutory, Regulatory & Quasi-Judicial Bodies', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies.constitutional_bodies', 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies.statutory_regulatory_bodies']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Statutory', 'Regulatory', 'Quasi', 'Judicial', 'Bodies']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.good_governance_administrative_reforms', 'good_governance_administrative_reforms', 'Good Governance & Administrative Reforms', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.good_governance_administrative_reforms.good_governance_principles', 'indian_polity_constitution_governance.good_governance_administrative_reforms.civil_services_reforms', 'indian_polity_constitution_governance.good_governance_administrative_reforms.administrative_reforms_commissions_of_karnataka', 'indian_polity_constitution_governance.good_governance_administrative_reforms.citizen_service_guarantees_redressal_platforms']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Good', 'Governance', 'Administrative', 'Reforms']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.transparency_accountability_citizen_charters', 'transparency_accountability_citizen_charters', 'Transparency, Accountability & Citizen Charters', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.transparency_accountability_citizen_charters.right_to_information_act_2005', 'indian_polity_constitution_governance.transparency_accountability_citizen_charters.accountability_tools_social_audit']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Transparency', 'Accountability', 'Citizen', 'Charters']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure', 'e-governance_models_digital_public_infrastructure', 'E-Governance Models & Digital Public Infrastructure', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure.digital_india_public_infrastructure', 'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure.e-governance_applications']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Governance', 'Models', 'Digital', 'Public', 'Infrastructure']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.role_of_civil_services_in_a_democracy', 'role_of_civil_services_in_a_democracy', 'Role of Civil Services in a Democracy', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.role_of_civil_services_in_a_democracy.civil_services_dynamics']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Role', 'Civil', 'Services', 'Democracy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka', 'governance_administration_public_policy_in_karnataka', 'Governance, Administration & Public Policy in Karnataka', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY['indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.constitutional_administrative_structure_of_karnataka', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.local_self-government_decentralisation', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.state_statutory_regulatory_oversight_bodies', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.good_governance_administrative_reforms_citizen_service_delivery', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.e-governance_innovations_digital_public_infrastructure_in_karnataka']::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS2"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]', '', ARRAY[]::text[], ARRAY['Governance', 'Administration', 'Public', 'Policy', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.karnataka_gram_swaraj_panchayat_raj_system', 'karnataka_gram_swaraj_panchayat_raj_system', 'Karnataka Gram Swaraj & Panchayat Raj System', 2,
        'Domain', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "kea": ["PDO", "VAO"], "state_psc": ["General Studies"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [KEA: PDO, VAO] [State-PSC: General Studies]', '', ARRAY[]::text[], ARRAY['Karnataka', 'Gram', 'Swaraj', 'Panchayat', 'Raj', 'System']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    )
ON CONFLICT (id) DO UPDATE SET
    slug = EXCLUDED.slug,
    name = EXCLUDED.name,
    level = EXCLUDED.level,
    level_name = EXCLUDED.level_name,
    subject = EXCLUDED.subject,
    subject_id = EXCLUDED.subject_id,
    parent_id = EXCLUDED.parent_id,
    children_ids = EXCLUDED.children_ids,
    ancestor_ids = EXCLUDED.ancestor_ids,
    exam_tags = EXCLUDED.exam_tags,
    raw_exam_tag_string = EXCLUDED.raw_exam_tag_string,
    description = EXCLUDED.description,
    entities = EXCLUDED.entities,
    keywords = EXCLUDED.keywords,
    stream = EXCLUDED.stream,
    streams = EXCLUDED.streams,
    updated_at = NOW();

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'international_relations_global_institutions', 'international_relations_global_institutions', 'International Relations & Global Institutions', 1,
        'Subject', 'INTERNATIONAL RELATIONS & GLOBAL INSTITUTIONS', 'international_relations_global_institutions', NULL,
        ARRAY['international_relations_global_institutions.indias_foreign_policy_bilateral_relations', 'international_relations_global_institutions.regional_multilateral_groupings', 'international_relations_global_institutions.global_institutions_agreements_treaties', 'international_relations_global_institutions.indian_diaspora']::text[], ARRAY[]::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['INTERNATIONAL', 'RELATIONS', 'GLOBAL', 'INSTITUTIONS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.indias_foreign_policy_bilateral_relations', 'indias_foreign_policy_bilateral_relations', 'India''s Foreign Policy & Bilateral Relations', 2,
        'Domain', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions',
        ARRAY['international_relations_global_institutions.indias_foreign_policy_bilateral_relations.guiding_principles_of_foreign_policy', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_immediate_neighbours', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_major_global_powers']::text[], ARRAY['international_relations_global_institutions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['India''s', 'Foreign', 'Policy', 'Bilateral', 'Relations']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.regional_multilateral_groupings', 'regional_multilateral_groupings', 'Regional & Multilateral Groupings', 2,
        'Domain', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions',
        ARRAY['international_relations_global_institutions.regional_multilateral_groupings.indo-pacific_trans-regional_alliances', 'international_relations_global_institutions.regional_multilateral_groupings.regional_organisations']::text[], ARRAY['international_relations_global_institutions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Regional', 'Multilateral', 'Groupings']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.global_institutions_agreements_treaties', 'global_institutions_agreements_treaties', 'Global Institutions, Agreements & Treaties', 2,
        'Domain', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions',
        ARRAY['international_relations_global_institutions.global_institutions_agreements_treaties.international_organisations_reform', 'international_relations_global_institutions.global_institutions_agreements_treaties.global_climate_maritime_frameworks']::text[], ARRAY['international_relations_global_institutions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Global', 'Institutions', 'Agreements', 'Treaties']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.indian_diaspora', 'indian_diaspora', 'Indian Diaspora', 2,
        'Domain', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions',
        ARRAY['international_relations_global_institutions.indian_diaspora.diaspora_dynamics']::text[], ARRAY['international_relations_global_institutions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Indian', 'Diaspora']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development', 'indian_economy_development', 'Indian Economy & Development', 1,
        'Subject', 'INDIAN ECONOMY & DEVELOPMENT', 'indian_economy_development', NULL,
        ARRAY['indian_economy_development.macroeconomic_fundamentals_national_income_accounting', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth', 'indian_economy_development.monetary_policy_banking_architecture', 'indian_economy_development.fiscal_policy_public_finance_taxation', 'indian_economy_development.agriculture_food_management_subsidies', 'indian_economy_development.industrial_policy_manufacturing_services', 'indian_economy_development.infrastructure_energy_investment_models', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade', 'indian_economy_development.economy_development_of_karnataka']::text[], ARRAY[]::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['INDIAN', 'ECONOMY', 'DEVELOPMENT']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.macroeconomic_fundamentals_national_income_accounting', 'macroeconomic_fundamentals_national_income_accounting', 'Macroeconomic Fundamentals & National Income Accounting', 2,
        'Domain', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development',
        ARRAY['indian_economy_development.macroeconomic_fundamentals_national_income_accounting.national_income_aggregates', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.methodologies_deflators', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.growth_development_dynamics', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.inflation_metrics_control']::text[], ARRAY['indian_economy_development']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Macroeconomic', 'Fundamentals', 'National', 'Income', 'Accounting']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth', 'planning_mobilisation_of_resources_inclusive_growth', 'Planning, Mobilisation of Resources & Inclusive Growth', 2,
        'Domain', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development',
        ARRAY['indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.evolution_of_planning_in_india', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.niti_aayog_transformational_governance', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.mobilisation_of_resources_capital_formation', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.inclusive_growth_inequality_dynamics']::text[], ARRAY['indian_economy_development']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Planning', 'Mobilisation', 'Resources', 'Inclusive', 'Growth']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.monetary_policy_banking_architecture', 'monetary_policy_banking_architecture', 'Monetary Policy & Banking Architecture', 2,
        'Domain', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development',
        ARRAY['indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations', 'indian_economy_development.monetary_policy_banking_architecture.money_supply_liquidity', 'indian_economy_development.monetary_policy_banking_architecture.banking_structure_regulatory_framework', 'indian_economy_development.monetary_policy_banking_architecture.non-performing_assets_resolution_architecture', 'indian_economy_development.monetary_policy_banking_architecture.non-banking_financial_institutions_capital_markets']::text[], ARRAY['indian_economy_development']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Monetary', 'Policy', 'Banking', 'Architecture']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.fiscal_policy_public_finance_taxation', 'fiscal_policy_public_finance_taxation', 'Fiscal Policy, Public Finance & Taxation', 2,
        'Domain', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development',
        ARRAY['indian_economy_development.fiscal_policy_public_finance_taxation.union_budget_public_finance_architecture_contingency_fund_article_267_public_account_article_266_revenue_receipts_vs_capital_receipts_revenue_expenditure_vs_capital_expenditure_capex_multiplier_effect', 'indian_economy_development.fiscal_policy_public_finance_taxation.deficit_concepts_fiscal_discipline', 'indian_economy_development.fiscal_policy_public_finance_taxation.direct_taxation_reforms', 'indian_economy_development.fiscal_policy_public_finance_taxation.indirect_taxation_gst_architecture', 'indian_economy_development.fiscal_policy_public_finance_taxation.public_debt_fiscal_federalism']::text[], ARRAY['indian_economy_development']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Fiscal', 'Policy', 'Public', 'Finance', 'Taxation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.agriculture_food_management_subsidies', 'agriculture_food_management_subsidies', 'Agriculture, Food Management & Subsidies', 2,
        'Domain', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development',
        ARRAY['indian_economy_development.agriculture_food_management_subsidies.cropping_patterns_agrarian_systems', 'indian_economy_development.agriculture_food_management_subsidies.irrigation_infrastructure_water_productivity', 'indian_economy_development.agriculture_food_management_subsidies.farm_inputs_credit_crop_insurance', 'indian_economy_development.agriculture_food_management_subsidies.agricultural_pricing_market_reforms', 'indian_economy_development.agriculture_food_management_subsidies.food_processing_supply_chain_logistics', 'indian_economy_development.agriculture_food_management_subsidies.buffer_stocking_public_distribution_system']::text[], ARRAY['indian_economy_development']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Agriculture', 'Food', 'Management', 'Subsidies']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.industrial_policy_manufacturing_services', 'industrial_policy_manufacturing_services', 'Industrial Policy, Manufacturing & Services', 2,
        'Domain', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development',
        ARRAY['indian_economy_development.industrial_policy_manufacturing_services.industrial_policy_structural_evolution', 'indian_economy_development.industrial_policy_manufacturing_services.manufacturing_initiatives_make_in_india', 'indian_economy_development.industrial_policy_manufacturing_services.msme_sector_architecture', 'indian_economy_development.industrial_policy_manufacturing_services.public_sector_enterprises_disinvestment', 'indian_economy_development.industrial_policy_manufacturing_services.services_sector_logistics_transformation']::text[], ARRAY['indian_economy_development']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Industrial', 'Policy', 'Manufacturing', 'Services']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.infrastructure_energy_investment_models', 'infrastructure_energy_investment_models', 'Infrastructure, Energy & Investment Models', 2,
        'Domain', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development',
        ARRAY['indian_economy_development.infrastructure_energy_investment_models.physical_infrastructure_systems', 'indian_economy_development.infrastructure_energy_investment_models.energy_transition_power_sector_architecture', 'indian_economy_development.infrastructure_energy_investment_models.investment_models_project_financing']::text[], ARRAY['indian_economy_development']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Infrastructure', 'Energy', 'Investment', 'Models']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.external_sector_balance_of_payments_foreign_trade', 'external_sector_balance_of_payments_foreign_trade', 'External Sector, Balance of Payments & Foreign Trade', 2,
        'Domain', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development',
        ARRAY['indian_economy_development.external_sector_balance_of_payments_foreign_trade.balance_of_payments_architecture', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.foreign_exchange_currency_dynamics', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.foreign_trade_policy_international_agreements']::text[], ARRAY['indian_economy_development']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['External', 'Sector', 'Balance', 'Payments', 'Foreign', 'Trade']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka', 'economy_development_of_karnataka', 'Economy & Development of Karnataka', 2,
        'Domain', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development',
        ARRAY['indian_economy_development.economy_development_of_karnataka.macroeconomic_profile_state_finances_of_karnataka', 'indian_economy_development.economy_development_of_karnataka.agriculture_allied_sectors_rural_transformation_in_karnataka', 'indian_economy_development.economy_development_of_karnataka.industrial_policies_manufacturing_innovation_ecosystem', 'indian_economy_development.economy_development_of_karnataka.flagship_welfare_guarantee_schemes_of_karnataka', 'indian_economy_development.economy_development_of_karnataka.regional_imbalances_nanjundappa_committee_kalyana_karnataka_development', 'indian_economy_development.economy_development_of_karnataka.1_gruha_lakshmi_scheme', 'indian_economy_development.economy_development_of_karnataka.2_gruha_jyothi_scheme', 'indian_economy_development.economy_development_of_karnataka.3_yuva_nidhi_scheme', 'indian_economy_development.economy_development_of_karnataka.4_shakti_scheme', 'indian_economy_development.economy_development_of_karnataka.5_anna_bhagya_scheme']::text[], ARRAY['indian_economy_development']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS3"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS3]', '', ARRAY[]::text[], ARRAY['Economy', 'Development', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management', 'environment_ecology_disaster_management', 'Environment, Ecology & Disaster Management', 1,
        'Subject', 'ENVIRONMENT, ECOLOGY & DISASTER MANAGEMENT', 'environment_ecology_disaster_management', NULL,
        ARRAY['environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india', 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india', 'environment_ecology_disaster_management.institutional_legal_operational_framework', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions']::text[], ARRAY[]::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['ENVIRONMENT', 'ECOLOGY', 'DISASTER', 'MANAGEMENT']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics', 'fundamental_ecology_ecosystem_dynamics', 'Fundamental Ecology & Ecosystem Dynamics', 2,
        'Domain', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management',
        ARRAY['environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.ecosystem_hierarchy_dynamics', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.energy_flow_trophic_structure', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.biogeochemical_cycles', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.ecological_interactions_principles']::text[], ARRAY['environment_ecology_disaster_management']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Fundamental', 'Ecology', 'Ecosystem', 'Dynamics']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas', 'biodiversity_wildlife_conservation_protected_areas', 'Biodiversity, Wildlife Conservation & Protected Areas', 2,
        'Domain', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management',
        ARRAY['environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.biodiversity_fundamentals_patterns', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.in-situ_conservation_architecture', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.ex-situ_conservation_botanical_science', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.species_profiling_conservation_status', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.aquatic_ecosystems_coastal_conservation']::text[], ARRAY['environment_ecology_disaster_management']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Biodiversity', 'Wildlife', 'Conservation', 'Protected', 'Areas']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation', 'environmental_pollution_waste_management_remediation', 'Environmental Pollution, Waste Management & Remediation', 2,
        'Domain', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management',
        ARRAY['environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.water_pollution_aquatic_degradation', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.land_degradation_soil_pollution_desertification', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.waste_management_architecture', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.environmental_remediation_technologies']::text[], ARRAY['environment_ecology_disaster_management']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Environmental', 'Pollution', 'Waste', 'Management', 'Remediation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions', 'climate_change_science_carbon_markets_global_conventions', 'Climate Change Science, Carbon Markets & Global Conventions', 2,
        'Domain', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management',
        ARRAY['environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.climate_change_science_global_warming', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.international_climate_architecture_treaties', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.carbon_markets_economic_instruments', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.multilateral_environmental_agreements_meas']::text[], ARRAY['environment_ecology_disaster_management']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Climate', 'Change', 'Science', 'Carbon', 'Markets', 'Global', 'Conventions']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india', 'environmental_legislation_institutions_eia_in_india', 'Environmental Legislation, Institutions & EIA in India', 2,
        'Domain', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management',
        ARRAY['environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.core_environmental_legislation', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.environmental_impact_assessment_regulatory_processes', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.environmental_institutions_statutory_bodies']::text[], ARRAY['environment_ecology_disaster_management']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Environmental', 'Legislation', 'Institutions', 'EIA', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india', 'hazard_profiles_disaster_vulnerability_in_india', 'Hazard Profiles & Disaster Vulnerability in India', 2,
        'Domain', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management',
        ARRAY['environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india.geophysical_hazards', 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india.hydrometeorological_hazards', 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india.anthropogenic_technological_hazards']::text[], ARRAY['environment_ecology_disaster_management']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Hazard', 'Profiles', 'Disaster', 'Vulnerability', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.institutional_legal_operational_framework', 'institutional_legal_operational_framework', 'Institutional, Legal & Operational Framework', 2,
        'Domain', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management',
        ARRAY['environment_ecology_disaster_management.institutional_legal_operational_framework.disaster_management_act_2005', 'environment_ecology_disaster_management.institutional_legal_operational_framework.three-tier_institutional_architecture', 'environment_ecology_disaster_management.institutional_legal_operational_framework.operational_capacity_building_agencies', 'environment_ecology_disaster_management.institutional_legal_operational_framework.early_warning_infrastructure_forecasting']::text[], ARRAY['environment_ecology_disaster_management']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Institutional', 'Legal', 'Operational', 'Framework']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions', 'risk_reduction_resilience_global_conventions', 'Risk Reduction, Resilience & Global Conventions', 2,
        'Domain', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management',
        ARRAY['environment_ecology_disaster_management.risk_reduction_resilience_global_conventions.global_frameworks_protocols', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions.prime_ministers_10-point_agenda_on_drr', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions.disaster_resilient_infrastructure_global_alliances', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions.financial_architecture_for_disaster_management']::text[], ARRAY['environment_ecology_disaster_management']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Risk', 'Reduction', 'Resilience', 'Global', 'Conventions']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence', 'science_technology_defence', 'Science, Technology & Defence', 1,
        'Subject', 'SCIENCE, TECHNOLOGY & DEFENCE', 'science_technology_defence', NULL,
        ARRAY['science_technology_defence.space_technology_astronomy', 'science_technology_defence.biotechnology_health_life_sciences', 'science_technology_defence.information_communication_technology_ai_cyber_security', 'science_technology_defence.defence_technology', 'science_technology_defence.nuclear_technology_energy', 'science_technology_defence.nanoscience_advanced_materials', 'science_technology_defence.applied_fundamental_sciences']::text[], ARRAY[]::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['SCIENCE', 'TECHNOLOGY', 'DEFENCE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    )
ON CONFLICT (id) DO UPDATE SET
    slug = EXCLUDED.slug,
    name = EXCLUDED.name,
    level = EXCLUDED.level,
    level_name = EXCLUDED.level_name,
    subject = EXCLUDED.subject,
    subject_id = EXCLUDED.subject_id,
    parent_id = EXCLUDED.parent_id,
    children_ids = EXCLUDED.children_ids,
    ancestor_ids = EXCLUDED.ancestor_ids,
    exam_tags = EXCLUDED.exam_tags,
    raw_exam_tag_string = EXCLUDED.raw_exam_tag_string,
    description = EXCLUDED.description,
    entities = EXCLUDED.entities,
    keywords = EXCLUDED.keywords,
    stream = EXCLUDED.stream,
    streams = EXCLUDED.streams,
    updated_at = NOW();

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'science_technology_defence.space_technology_astronomy', 'space_technology_astronomy', 'Space Technology & Astronomy', 2,
        'Domain', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence',
        ARRAY['science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions', 'science_technology_defence.space_technology_astronomy.launch_vehicles_propulsion_systems', 'science_technology_defence.space_technology_astronomy.orbits_satellite_navigation_applications', 'science_technology_defence.space_technology_astronomy.deep_space_observatories_cosmology_astrophysics', 'science_technology_defence.space_technology_astronomy.space_governance_commercialization_space_environment']::text[], ARRAY['science_technology_defence']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Space', 'Technology', 'Astronomy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.biotechnology_health_life_sciences', 'biotechnology_health_life_sciences', 'Biotechnology, Health & Life Sciences', 2,
        'Domain', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence',
        ARRAY['science_technology_defence.biotechnology_health_life_sciences.genomics_genetics_gene_editing', 'science_technology_defence.biotechnology_health_life_sciences.cell_biology_reproductive_technology', 'science_technology_defence.biotechnology_health_life_sciences.immunology_infectious_diseases_public_health', 'science_technology_defence.biotechnology_health_life_sciences.vaccine_platforms_advanced_therapeutics', 'science_technology_defence.biotechnology_health_life_sciences.agricultural_biotechnology_bio-economy']::text[], ARRAY['science_technology_defence']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Biotechnology', 'Health', 'Life', 'Sciences']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.information_communication_technology_ai_cyber_security', 'information_communication_technology_ai_cyber_security', 'Information & Communication Technology (ICT), AI & Cyber Security', 2,
        'Domain', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence',
        ARRAY['science_technology_defence.information_communication_technology_ai_cyber_security.artificial_intelligence_robotics', 'science_technology_defence.information_communication_technology_ai_cyber_security.telecommunications_wireless_infrastructure', 'science_technology_defence.information_communication_technology_ai_cyber_security.high-performance_quantum_computing', 'science_technology_defence.information_communication_technology_ai_cyber_security.emerging_web_frameworks_distributed_ledger_technology', 'science_technology_defence.information_communication_technology_ai_cyber_security.cyber_security_threats_digital_governance']::text[], ARRAY['science_technology_defence']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Information', 'Communication', 'Technology', 'ICT', 'Cyber', 'Security']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.defence_technology', 'defence_technology', 'Defence Technology', 2,
        'Domain', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence',
        ARRAY['science_technology_defence.defence_technology.missile_systems_artillery', 'science_technology_defence.defence_technology.naval_warfare_submarines', 'science_technology_defence.defence_technology.military_aviation_unmanned_aerial_systems']::text[], ARRAY['science_technology_defence']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Defence', 'Technology']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.nuclear_technology_energy', 'nuclear_technology_energy', 'Nuclear Technology & Energy', 2,
        'Domain', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence',
        ARRAY['science_technology_defence.nuclear_technology_energy.nuclear_energy_programme_reactors', 'science_technology_defence.nuclear_technology_energy.fundamental_particle_physics_research_facilities', 'science_technology_defence.nuclear_technology_energy.international_nuclear_governance_treaties']::text[], ARRAY['science_technology_defence']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Nuclear', 'Technology', 'Energy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.nanoscience_advanced_materials', 'nanoscience_advanced_materials', 'Nanoscience & Advanced Materials', 2,
        'Domain', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence',
        ARRAY['science_technology_defence.nanoscience_advanced_materials.nanotechnology_applications', 'science_technology_defence.nanoscience_advanced_materials.advanced_critical_materials']::text[], ARRAY['science_technology_defence']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Nanoscience', 'Advanced', 'Materials']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.applied_fundamental_sciences', 'applied_fundamental_sciences', 'Applied & Fundamental Sciences', 2,
        'Domain', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence',
        ARRAY['science_technology_defence.applied_fundamental_sciences.applied_physics', 'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology']::text[], ARRAY['science_technology_defence']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Applied', 'Fundamental', 'Sciences']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security', 'internal_security', 'Internal Security', 1,
        'Subject', 'INTERNAL SECURITY', 'internal_security', NULL,
        ARRAY['internal_security.linkages_between_development_extremism', 'internal_security.terrorism_insurgencies_cross-border_security', 'internal_security.border_management_coastal_security', 'internal_security.transnational_organised_crime_illicit_financial_flows', 'internal_security.cyber_warfare_critical_infrastructure_digital_security', 'internal_security.security_forces_intelligence_agencies_statutory_mandates']::text[], ARRAY[]::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['INTERNAL', 'SECURITY']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.linkages_between_development_extremism', 'linkages_between_development_extremism', 'Linkages between Development & Extremism (LWE)', 2,
        'Domain', 'Internal Security', 'internal_security', 'internal_security',
        ARRAY['internal_security.linkages_between_development_extremism.genesis_ideology_of_left-wing_extremism', 'internal_security.linkages_between_development_extremism.root_causes_of_left-wing_extremism', 'internal_security.linkages_between_development_extremism.multi-pronged_government_counter-lwe_strategy']::text[], ARRAY['internal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Linkages', 'between', 'Development', 'Extremism', 'LWE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.terrorism_insurgencies_cross-border_security', 'terrorism_insurgencies_cross-border_security', 'Terrorism, Insurgencies & Cross-Border Security', 2,
        'Domain', 'Internal Security', 'internal_security', 'internal_security',
        ARRAY['internal_security.terrorism_insurgencies_cross-border_security.cross-border_terrorism_proxy_warfare_in_jammu_kashmir', 'internal_security.terrorism_insurgencies_cross-border_security.insurgency_in_north-east_india', 'internal_security.terrorism_insurgencies_cross-border_security.religious_political_radicalisation']::text[], ARRAY['internal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Terrorism', 'Insurgencies', 'Cross', 'Border', 'Security']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.border_management_coastal_security', 'border_management_coastal_security', 'Border Management & Coastal Security', 2,
        'Domain', 'Internal Security', 'internal_security', 'internal_security',
        ARRAY['internal_security.border_management_coastal_security.land_border_security_architecture', 'internal_security.border_management_coastal_security.smart_border_management_technologies', 'internal_security.border_management_coastal_security.coastal_maritime_security_architecture', 'internal_security.border_management_coastal_security.island_security_maritime_chokepoints']::text[], ARRAY['internal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Border', 'Management', 'Coastal', 'Security']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.transnational_organised_crime_illicit_financial_flows', 'transnational_organised_crime_illicit_financial_flows', 'Transnational Organised Crime & Illicit Financial Flows', 2,
        'Domain', 'Internal Security', 'internal_security', 'internal_security',
        ARRAY['internal_security.transnational_organised_crime_illicit_financial_flows.nexus_between_organised_crime_terrorism', 'internal_security.transnational_organised_crime_illicit_financial_flows.drug_trafficking_narco-terrorism', 'internal_security.transnational_organised_crime_illicit_financial_flows.money_laundering_hawala_terror_financing', 'internal_security.transnational_organised_crime_illicit_financial_flows.international_regimes_against_illicit_financing']::text[], ARRAY['internal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Transnational', 'Organised', 'Crime', 'Illicit', 'Financial', 'Flows']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.cyber_warfare_critical_infrastructure_digital_security', 'cyber_warfare_critical_infrastructure_digital_security', 'Cyber Warfare, Critical Infrastructure & Digital Security', 2,
        'Domain', 'Internal Security', 'internal_security', 'internal_security',
        ARRAY['internal_security.cyber_warfare_critical_infrastructure_digital_security.vector_threats_digital_warfare', 'internal_security.cyber_warfare_critical_infrastructure_digital_security.critical_information_infrastructure_cii_protection', 'internal_security.cyber_warfare_critical_infrastructure_digital_security.national_cyber_governance_framework']::text[], ARRAY['internal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Cyber', 'Warfare', 'Critical', 'Infrastructure', 'Digital', 'Security']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.security_forces_intelligence_agencies_statutory_mandates', 'security_forces_intelligence_agencies_statutory_mandates', 'Security Forces, Intelligence Agencies & Statutory Mandates', 2,
        'Domain', 'Internal Security', 'internal_security', 'internal_security',
        ARRAY['internal_security.security_forces_intelligence_agencies_statutory_mandates.central_armed_police_forces_capfs', 'internal_security.security_forces_intelligence_agencies_statutory_mandates.intelligence_investigation_architecture', 'internal_security.security_forces_intelligence_agencies_statutory_mandates.armed_forces_special_powers_act_afspa_act_1958_-_declaration_of_disturbed_area_under_section_3_special_powers_to_armed_forces_arrest_without_warrant_fire_upon_suspects_search_premises_legal_safeguards_-_section_6_prior_central_sanction_for_prosecution_supreme_court_1997_guidelines_naga_peoples_movement_for_human_rights_case_justice_jeevan_reddy_committee_2005_recommendations_progressive_phased_revocation_of_afspa_in_assam_nagaland_manipur']::text[], ARRAY['internal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Security', 'Forces', 'Intelligence', 'Agencies', 'Statutory', 'Mandates']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude', 'ethics_integrity_aptitude', 'Ethics, Integrity & Aptitude', 1,
        'Subject', 'ETHICS, INTEGRITY & APTITUDE', 'ethics_integrity_aptitude', NULL,
        ARRAY['ethics_integrity_aptitude.ethics_human_interface', 'ethics_integrity_aptitude.attitude_aptitude', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers', 'ethics_integrity_aptitude.probity_in_governance_public_service_values', 'ethics_integrity_aptitude.case_studies']::text[], ARRAY[]::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['ETHICS', 'INTEGRITY', 'APTITUDE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.ethics_human_interface', 'ethics_human_interface', 'Ethics & Human Interface (Essence, determinants and consequences of Ethics in human actions; Dimensions of ethics; Ethics in private and public relationships; Human Values – lessons from the lives and teachings of great leaders, reformers and administrators; Role of family, society and educational institutions in inculcating values)', 2,
        'Domain', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude',
        ARRAY['ethics_integrity_aptitude.ethics_human_interface.essence_determinants_consequences_of_ethics', 'ethics_integrity_aptitude.ethics_human_interface.dimensions_of_ethics', 'ethics_integrity_aptitude.ethics_human_interface.human_values_lessons_from_great_leaders_reformers', 'ethics_integrity_aptitude.ethics_human_interface.role_of_family_society_educational_institutions']::text[], ARRAY['ethics_integrity_aptitude']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Ethics', 'Human', 'Interface', 'Essence', 'determinants', 'consequences', 'human', 'actions', 'Dimensions', 'ethics', 'private', 'public', 'relationships', 'Values', 'lessons', 'lives', 'teachings', 'great', 'leaders', 'reformers', 'administrators', 'Role', 'family', 'society', 'educational', 'institutions', 'inculcating', 'values']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.attitude_aptitude', 'attitude_aptitude', 'Attitude & Aptitude', 2,
        'Domain', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude',
        ARRAY['ethics_integrity_aptitude.attitude_aptitude.content_structure_functions_of_attitude', 'ethics_integrity_aptitude.attitude_aptitude.moral_political_attitudes', 'ethics_integrity_aptitude.attitude_aptitude.social_influence_persuasion', 'ethics_integrity_aptitude.attitude_aptitude.foundational_values_for_civil_services']::text[], ARRAY['ethics_integrity_aptitude']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Attitude', 'Aptitude']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers', 'emotional_intelligence_moral_thinkers', 'Emotional Intelligence & Moral Thinkers', 2,
        'Domain', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude',
        ARRAY['ethics_integrity_aptitude.emotional_intelligence_moral_thinkers.concepts_components_of_emotional_intelligence', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers.utilities_of_emotional_intelligence_in_governance', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers.contributions_of_moral_thinkers_philosophers']::text[], ARRAY['ethics_integrity_aptitude']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Emotional', 'Intelligence', 'Moral', 'Thinkers']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.probity_in_governance_public_service_values', 'probity_in_governance_public_service_values', 'Probity in Governance & Public Service Values', 2,
        'Domain', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude',
        ARRAY['ethics_integrity_aptitude.probity_in_governance_public_service_values.concept_of_public_service_philosophical_basis_of_governance', 'ethics_integrity_aptitude.probity_in_governance_public_service_values.transparency_rti_information_sharing', 'ethics_integrity_aptitude.probity_in_governance_public_service_values.codes_of_ethics_codes_of_conduct', 'ethics_integrity_aptitude.probity_in_governance_public_service_values.citizens_charters_work_culture_quality_of_service_delivery', 'ethics_integrity_aptitude.probity_in_governance_public_service_values.challenges_of_corruption']::text[], ARRAY['ethics_integrity_aptitude']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Probity', 'Governance', 'Public', 'Service', 'Values']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.case_studies', 'case_studies', 'Case Studies', 2,
        'Domain', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude',
        ARRAY['ethics_integrity_aptitude.case_studies.ethical_dilemmas_in_administration_public_life', 'ethics_integrity_aptitude.case_studies.conflict_of_interest_decision_making_under_pressure', 'ethics_integrity_aptitude.case_studies.crisis_management_public_resource_allocation']::text[], ARRAY['ethics_integrity_aptitude']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Case', 'Studies']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'General Mental Ability, Quantitative Aptitude & Comprehension', 1,
        'Subject', 'GENERAL MENTAL ABILITY, QUANTITATIVE APTITUDE & COMPREHENSION', 'general_mental_ability_quantitative_aptitude_comprehension', NULL,
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning']::text[], ARRAY[]::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['GENERAL', 'MENTAL', 'ABILITY', 'QUANTITATIVE', 'APTITUDE', 'COMPREHENSION']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills', 'reading_comprehension_interpersonal_skills', 'Reading Comprehension & Interpersonal Skills', 2,
        'Domain', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.critical_reasoning_analytical_ability', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Reading', 'Comprehension', 'Interpersonal', 'Skills']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy', 'quantitative_aptitude_basic_numeracy', 'Quantitative Aptitude & Basic Numeracy', 2,
        'Domain', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Quantitative', 'Aptitude', 'Basic', 'Numeracy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning', 'general_mental_ability_logical_reasoning', 'General Mental Ability & Logical Reasoning', 2,
        'Domain', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['General', 'Mental', 'Ability', 'Logical', 'Reasoning']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.world_mapping_geopolitical_locations', 'world_mapping_geopolitical_locations', 'World Mapping & Geopolitical Locations', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations', 'geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals', 'geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones', 'geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', 'Spatial mapping of global strategic chokepoints, enclosed & marginal seas, international boundary lines, disputed zones, and places in geopolitical news.', ARRAY['World Map', 'Geopolitics', 'Strategic Locations', 'Places in News']::text[], ARRAY['World', 'Mapping', 'Geopolitical', 'Locations', 'Seas', 'Straits', 'Conflict Zones', 'Rivers', 'Mountains']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    )
ON CONFLICT (id) DO UPDATE SET
    slug = EXCLUDED.slug,
    name = EXCLUDED.name,
    level = EXCLUDED.level,
    level_name = EXCLUDED.level_name,
    subject = EXCLUDED.subject,
    subject_id = EXCLUDED.subject_id,
    parent_id = EXCLUDED.parent_id,
    children_ids = EXCLUDED.children_ids,
    ancestor_ids = EXCLUDED.ancestor_ids,
    exam_tags = EXCLUDED.exam_tags,
    raw_exam_tag_string = EXCLUDED.raw_exam_tag_string,
    description = EXCLUDED.description,
    entities = EXCLUDED.entities,
    keywords = EXCLUDED.keywords,
    stream = EXCLUDED.stream,
    streams = EXCLUDED.streams,
    updated_at = NOW();

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'geography_earth_systems.indian_mapping_spatial_geography', 'indian_mapping_spatial_geography', 'Indian Mapping & Spatial Geography', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering', 'geography_earth_systems.indian_mapping_spatial_geography.himalayan_mountain_ranges_passes_glaciers', 'geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout', 'geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes', 'geography_earth_systems.indian_mapping_spatial_geography.coastal_features_islands_maritime_channels', 'geography_earth_systems.indian_mapping_spatial_geography.infrastructure_ports_transport_corridors']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY['India Map', 'Indian Rivers', 'Himalayas', 'Western Ghats', 'National Parks India', 'Indian Passes']::text[], ARRAY['India', 'Mapping', 'Rivers', 'Tributaries', 'Passes', 'National Parks', 'Hills', 'Ports', 'Channels']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.karnataka_mapping_state_geography', 'karnataka_mapping_state_geography', 'Karnataka Mapping & Spatial Geography', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.karnataka_mapping_state_geography.river_basins_waterfalls_reservoirs', 'geography_earth_systems.karnataka_mapping_state_geography.western_ghats_peaks_elevations', 'geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY['Karnataka Map', 'Krishna Basin Karnataka', 'Cauvery Basin', 'Western Ghats Karnataka', 'Mullayanagiri']::text[], ARRAY['Karnataka', 'Mapping', 'Rivers', 'Waterfalls', 'Peaks', 'Mullayanagiri', 'Agro-Climatic Zones', 'Districts']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.art_culture_of_karnataka', 'art_culture_of_karnataka', 'Art, Architecture & Cultural Heritage of Karnataka', 2,
        'Domain', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage',
        ARRAY['art_culture_heritage.art_culture_of_karnataka.karnataka_temple_architecture_sculpture', 'art_culture_heritage.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka', 'art_culture_heritage.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage', 'art_culture_heritage.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka']::text[], ARRAY['art_culture_heritage']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Art', 'Architecture', 'Cultural', 'Heritage', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.martial_arts_traditional_sports_calendars', 'martial_arts_traditional_sports_calendars', 'Martial Arts, Traditional Sports & Indian Calendar Systems', 2,
        'Domain', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage',
        ARRAY['art_culture_heritage.martial_arts_traditional_sports_calendars.martial_arts_and_traditional_sports_of_india', 'art_culture_heritage.martial_arts_traditional_sports_calendars.indian_calendar_systems_eras_national_symbols']::text[], ARRAY['art_culture_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Martial', 'Arts', 'Traditional', 'Sports', 'Indian', 'Calendar', 'Systems']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.cultural_institutions_numismatics_initiatives', 'cultural_institutions_numismatics_initiatives', 'Cultural Institutions, Numismatics & Heritage Governance', 2,
        'Domain', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage',
        ARRAY['art_culture_heritage.cultural_institutions_numismatics_initiatives.national_cultural_institutions_and_bodies', 'art_culture_heritage.cultural_institutions_numismatics_initiatives.ancient_and_medieval_indian_coinage_numismatics', 'art_culture_heritage.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards']::text[], ARRAY['art_culture_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Cultural', 'Institutions', 'Numismatics', 'Heritage', 'Governance']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world', 'geography_of_the_world', 'Geography of the World', 2,
        'Domain', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_united_states', 'geography_earth_systems.geography_of_the_world.regional_geography_canada', 'geography_earth_systems.geography_of_the_world.regional_geography_russia_central_asia', 'geography_earth_systems.geography_of_the_world.regional_geography_china_east_asia', 'geography_earth_systems.geography_of_the_world.regional_geography_japan', 'geography_earth_systems.geography_of_the_world.regional_geography_south_asia', 'geography_earth_systems.geography_of_the_world.regional_geography_south_east_asia', 'geography_earth_systems.geography_of_the_world.regional_geography_new_zealand', 'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica']::text[], ARRAY['geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Comprehensive regional, physical, continental, and economic geography of the world, structured by continents with dedicated standalone sections for United States, Canada, Russia & Central Asia, China & East Asia, Japan, South Asia, South-East Asia, New Zealand, Europe, Africa, South America, Australia/Oceania, and Antarctica.', ARRAY['Regional Geography of United States', 'Regional Geography of Canada', 'Regional Geography of Russia & Central Asia', 'Regional Geography of China & East Asia', 'Regional Geography of Japan', 'Regional Geography of South Asia', 'Regional Geography of South-East Asia', 'Regional Geography of New Zealand', 'Continental Geography of Europe, Africa, Americas & Oceania']::text[], ARRAY['Geography', 'World', 'Comprehensive', 'regional', 'physical', 'continental', 'economic', 'geography', 'US', 'Canada', 'Russia', 'China', 'Japan', 'South', 'Asia', 'Southeast', 'New', 'Zealand', 'Continents']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders', 'learning_disabilities_and_neurodevelopmental_disorders', 'Specific Learning Disabilities & Neurodevelopmental Needs', 2,
        'Domain', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs',
        ARRAY['inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders.dyslexia_dyscalculia_dysgraphia_dyspraxia_identification', 'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders.adhd_attention_deficit_hyperactivity_disorder_classroom_interventions', 'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders.autism_spectrum_disorder_asd_sensory_communication_needs']::text[], ARRAY['inclusive_education_diverse_learners_special_needs']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['SPECIFIC LEARNING DISABILITIES & NEURODEVELOPMENTAL NEEDS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged', 'diverse_learners_gifted_socio-economically_disadvantaged', 'Gifted, Creative & Disadvantaged Learners', 2,
        'Domain', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs',
        ARRAY['inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged.gifted_and_talented_children_enrichment_acceleration_programmes', 'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged.first_generation_learners_sedg_socio-economically_disadvantaged_groups', 'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged.gender_sensitization_gender_bias_stereotypes_in_textbooks_classrooms']::text[], ARRAY['inclusive_education_diverse_learners_special_needs']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['GIFTED, CREATIVE & DISADVANTAGED LEARNERS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks', 'assistive_technologies_and_rights_frameworks', 'Assistive Technologies & Legal Frameworks for CWSN', 2,
        'Domain', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs',
        ARRAY['inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks.rights_of_persons_with_disabilities_act_rpwd_2016_21_disabilities', 'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks.individualized_education_plan_iep_universal_design_for_learning_udl', 'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks.assistive_devices_braille_screen_readers_hearing_aids_in_inclusive_schools']::text[], ARRAY['inclusive_education_diverse_learners_special_needs']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ASSISTIVE TECHNOLOGIES & LEGAL FRAMEWORKS FOR CWSN']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs', 'Inclusive Education, Diverse Learners & Special Needs (CWSN)', 1,
        'Subject', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', NULL,
        ARRAY['inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders', 'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged', 'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks']::text[], ARRAY[]::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['INCLUSIVE EDUCATION, DIVERSE LEARNERS & SPECIAL NEEDS (CWSN)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials', 'instructional_methods_and_teaching-learning_materials', 'Instructional Methods & Teaching-Learning Materials (TLM)', 2,
        'Domain', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment',
        ARRAY['pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials.child-centered_vs_teacher-centered_pedagogy_inquiry-based_learning', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials.cooperative_and_collaborative_learning_jigsaw_peer_tutoring', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials.ict_integration_in_education_digital_tools_diksha_swayam_moocs', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials.bloom_taxonomy_revised_anderson_krathwohl_cognitive_affective_psychomotor']::text[], ARRAY['pedagogical_strategies_curriculum_assessment']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['INSTRUCTIONAL METHODS & TEACHING-LEARNING MATERIALS (TLM)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction', 'assessment_evaluation_cce_and_test_construction', 'Assessment, Evaluation & Measurement', 2,
        'Domain', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment',
        ARRAY['pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.assessment_for_learning_of_learning_as_learning_formative_summative', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.continuous_and_comprehensive_evaluation_cce_scholastic_co-scholastic', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.tools_and_techniques_rubrics_portfolios_anecdotal_records_rating_scales', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.characteristics_of_a_good_test_validity_reliability_usability_objectivity', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.diagnostic_testing_and_remedial_teaching_strategies']::text[], ARRAY['pedagogical_strategies_curriculum_assessment']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ASSESSMENT, EVALUATION & MEASUREMENT']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management', 'action_research_and_classroom_management', 'Action Research & Classroom Management', 2,
        'Domain', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment',
        ARRAY['pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management.action_research_steps_problem_hypothesis_data_action_reflection', 'pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management.classroom_management_strategies_positive_discipline_behavioral_support']::text[], ARRAY['pedagogical_strategies_curriculum_assessment']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ACTION RESEARCH & CLASSROOM MANAGEMENT']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment', 'Pedagogical Strategies, Curriculum & Assessment', 1,
        'Subject', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', NULL,
        ARRAY['pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction', 'pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management']::text[], ARRAY[]::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['PEDAGOGICAL STRATEGIES, CURRICULUM & ASSESSMENT']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_mathematics', 'pedagogy_of_mathematics', 'Pedagogy of Mathematics', 2,
        'Domain', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies',
        ARRAY['subject_specific_pedagogies.pedagogy_of_mathematics.nature_scope_values_of_mathematics_inductive_deductive_methods', 'subject_specific_pedagogies.pedagogy_of_mathematics.mathematical_concepts_formation_van_hiele_geometric_thinking_levels', 'subject_specific_pedagogies.pedagogy_of_mathematics.remedial_strategies_for_dyscalculia_and_math_anxiety']::text[], ARRAY['subject_specific_pedagogies']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['PEDAGOGY OF MATHEMATICS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies', 'pedagogy_of_science_and_environmental_studies', 'Pedagogy of Science & Environmental Studies (EVS)', 2,
        'Domain', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies',
        ARRAY['subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies.scientific_inquiry_process_skills_observation_experimentation_inference', 'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies.evs_themes_ncert_family_food_shelter_water_travel_things_we_make', 'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies.laboratory_activities_science_kits_exhibitions_field_trips']::text[], ARRAY['subject_specific_pedagogies']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['PEDAGOGY OF SCIENCE & ENVIRONMENTAL STUDIES (EVS)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_social_sciences', 'pedagogy_of_social_sciences', 'Pedagogy of Social Sciences', 2,
        'Domain', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies',
        ARRAY['subject_specific_pedagogies.pedagogy_of_social_sciences.nature_of_social_sciences_critical_thinking_source_method_role_play', 'subject_specific_pedagogies.pedagogy_of_social_sciences.utilizing_primary_sources_maps_historical_evidence_in_classrooms']::text[], ARRAY['subject_specific_pedagogies']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['PEDAGOGY OF SOCIAL SCIENCES']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_languages_kannada_english', 'pedagogy_of_languages_kannada_english', 'Pedagogy of Language Development (LSRW)', 2,
        'Domain', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies',
        ARRAY['subject_specific_pedagogies.pedagogy_of_languages_kannada_english.four_language_skills_lsrw_listening_speaking_reading_writing', 'subject_specific_pedagogies.pedagogy_of_languages_kannada_english.chomsky_language_acquisition_device_lad_universal_grammar', 'subject_specific_pedagogies.pedagogy_of_languages_kannada_english.approaches_to_language_teaching_communicative_structural_bilingual']::text[], ARRAY['subject_specific_pedagogies']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['PEDAGOGY OF LANGUAGE DEVELOPMENT (LSRW)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies', 'subject_specific_pedagogies', 'Subject-Specific Pedagogies (Science, Math, Social Science, Languages)', 1,
        'Subject', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', NULL,
        ARRAY['subject_specific_pedagogies.pedagogy_of_mathematics', 'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies', 'subject_specific_pedagogies.pedagogy_of_social_sciences', 'subject_specific_pedagogies.pedagogy_of_languages_kannada_english']::text[], ARRAY[]::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['SUBJECT-SPECIFIC PEDAGOGIES (SCIENCE, MATH, SOCIAL SCIENCE, LANGUAGES)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts', 'national_educational_policies_and_acts', 'National Educational Policies & Acts', 2,
        'Domain', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude',
        ARRAY['national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts.national_education_policy_nep_2020_school_higher_education_5_3_3_4', 'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts.right_to_education_act_rte_2009_provisions_pupil_teacher_ratio_smc', 'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts.national_curriculum_frameworks_ncf_2005_ncf-se_2023_foundational_stage']::text[], ARRAY['national_policies_and_higher_education_research_aptitude']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['NATIONAL EDUCATIONAL POLICIES & ACTS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1', 'research_methodology_kset_ugc_net_paper1', 'Research Aptitude & Methodology (KSET & UGC-NET Paper 1)', 2,
        'Domain', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude',
        ARRAY['national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.research_types_fundamental_applied_action_qualitative_quantitative', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.research_process_problem_formulation_hypothesis_sampling_methods', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.data_collection_tools_questionnaires_interviews_observations_scales', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.research_ethics_plagiarism_citation_styles_apa_mla_chicago', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.thesis_and_article_writing_format_style_peer_review']::text[], ARRAY['national_policies_and_higher_education_research_aptitude']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['RESEARCH APTITUDE & METHODOLOGY (KSET & UGC-NET PAPER 1)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance', 'higher_education_system_and_governance', 'Higher Education System, Governance & Quality Assurance', 2,
        'Domain', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude',
        ARRAY['national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance.higher_education_regulatory_bodies_ugc_aicte_ncte_naac_nirf', 'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance.evolution_of_higher_learning_in_ancient_india_takshashila_nalanda_valabhi', 'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance.value_education_environmental_education_in_higher_institutions']::text[], ARRAY['national_policies_and_higher_education_research_aptitude']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['HIGHER EDUCATION SYSTEM, GOVERNANCE & QUALITY ASSURANCE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude', 'National Education Policies & Research Aptitude (TET, KSET & UGC-NET)', 1,
        'Subject', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', NULL,
        ARRAY['national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1', 'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance']::text[], ARRAY[]::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['NATIONAL EDUCATION POLICIES & RESEARCH APTITUDE (TET, KSET & UGC-NET)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    )
ON CONFLICT (id) DO UPDATE SET
    slug = EXCLUDED.slug,
    name = EXCLUDED.name,
    level = EXCLUDED.level,
    level_name = EXCLUDED.level_name,
    subject = EXCLUDED.subject,
    subject_id = EXCLUDED.subject_id,
    parent_id = EXCLUDED.parent_id,
    children_ids = EXCLUDED.children_ids,
    ancestor_ids = EXCLUDED.ancestor_ids,
    exam_tags = EXCLUDED.exam_tags,
    raw_exam_tag_string = EXCLUDED.raw_exam_tag_string,
    description = EXCLUDED.description,
    entities = EXCLUDED.entities,
    keywords = EXCLUDED.keywords,
    stream = EXCLUDED.stream,
    streams = EXCLUDED.streams,
    updated_at = NOW();

COMMIT;
