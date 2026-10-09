import json
import difflib

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg_nodes = json.load(f)['nodes']

all_node_ids = list(kg_nodes.keys())

invalid_ids = [
   'art_culture_heritage.indian_music_dance_theatre',
   'art_culture_heritage.indian_music_dance_theatre.classical_dance_traditions.classical_dance_traditions_eight_recognized_forms',
   'environment_ecology_disaster_management.climate_change_global_warming_conventions',
   'environment_ecology_disaster_management.environmental_pollution_degradation_control',
   'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.cubes_dice_mirror_water_images',
   'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.seating_arrangements_linear_circular',
   'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.syllogisms_deductive_logic',
   'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.symbolic_logic_coded_relations',
   'geography_earth_systems.climatology_atmospheric_dynamics.pressure_belts_planetary_winds',
   'geography_earth_systems.drainage_systems_water_resources.himalayan_peninsular_river_systems',
   'geography_earth_systems.economic_human_geography_india.cropping_patterns_major_crops_kharif_rabi_zaid',
   'geography_earth_systems.economic_human_geography_india.energy_resources_conventional_non-conventional',
   'geography_earth_systems.economic_human_geography_india.mineral_resources_metallic_non-metallic_belts',
   'geography_earth_systems.economic_human_geography_india.multipurpose_river_valley_projects_major_dams',
   'geography_earth_systems.economic_human_geography_india.soils_of_india_classification_degradation_conservation',
   'geography_earth_systems.physical_geography_earth_systems.geomorphology_earth_origin_structure_plate_tectonics',
   'history.ancient_india.indus_valley_civilization_features_sites',
   'history.ancient_india.rise_of_jainism_and_buddhism',
   'history.ancient_india.vedic_period_literature_society',
   'history.indian_freedom_struggle.civil_disobedience_round_table',
   'history.indian_freedom_struggle.colonial_economy_drain_of_wealth',
   'history.indian_freedom_struggle.gandhian_era_early_experiments',
   'history.indian_freedom_struggle.non_cooperation_khilafat_movement',
   'history.indian_freedom_struggle.socio_religious_reform_movements',
   'history.medieval_india.mughal_empire_administration_mansabdari',
   'history.medieval_india.vijayanagara_bahmani_kingdoms',
   'indian_economy_development.agriculture_food_security_supply_chain',
   'indian_economy_development.external_sector_balance_of_payments_trade',
   'indian_economy_development.industrial_growth_infrastructure_services',
   'indian_economy_development.monetary_policy_banking_system.rbi_framework',
   'indian_polity_constitution_governance.constitutional_non-constitutional_bodies',
   'indian_polity_constitution_governance.constitutional_non-constitutional_bodies.cag_duties_powers_article_148-151',
   'indian_polity_constitution_governance.constitutional_non-constitutional_bodies.election_commission_powers_article_324-329',
   'indian_polity_constitution_governance.directive_principles_fundamental_duties.directive_principles_socialistic_gandhian_liberal-intellectual',
   'indian_polity_constitution_governance.judiciary_system.supreme_court_composition_jurisdiction_independence_article_124-147_high_courts_article_214-231_subordinate_courts_judicial_review_article_13_public_interest_litigation_pil',
   'indian_polity_constitution_governance.union_state_executive.cabinet_secretariat_pm_office_all_india_services',
   'indian_polity_constitution_governance.union_state_executive.presidential_election_process_article_54_55',
   'indian_polity_constitution_governance.union_state_executive.prime_minister_council_of_ministers_collective_responsibility_article_74_75',
   'science_technology_defence.applied_fundamental_sciences.biological_sciences_biochemistry',
   'science_technology_defence.defence_technology_security_systems.military_platforms_weapons',
   'science_technology_defence.nuclear_space_technology.indias_nuclear_energy_programme_three-stage'
]

print("Mapping suggestions:")
for inv in invalid_ids:
    # find best matches in all_node_ids
    matches = difflib.get_close_matches(inv, all_node_ids, n=3, cutoff=0.4)
    print(f"\n{inv}:")
    for m in matches:
        print(f"   -> {m} ({kg_nodes[m]['name']})")
