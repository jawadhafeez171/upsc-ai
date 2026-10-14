import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg.get('nodes', {})

# Precise mapping for 2007 PC paper (1 to 100)
MAPPING = {
    1: 'language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards',
    2: 'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_composition_vertical_structure.homosphere_heterosphere_atmospheric_layers_composition',
    3: 'science_technology_defence.biotechnology_health_life_sciences.public_health_disease_epidemiology_national_missions',
    4: 'science_technology_defence.biotechnology_health_life_sciences.public_health_disease_epidemiology_national_missions',
    5: 'art_culture_heritage.indian_literature_languages.classical_religious_texts.classical_sanskrit_literature_kalidasa_bhasa',
    6: 'indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations',
    7: 'history.world_history.major_world_wars_geopolitical_conflicts',
    8: 'history.modern_india.british_expansion_consolidation_policies',
    9: 'history.modern_india.land_revenue_systems_commercialisation_famines.zamindari_system_permanent_settlement_1793_bengal',
    10: 'history.medieval_india.delhi_sultanate_administration_socio-economic_conditions.market_reforms_military_reforms_of_alauddin_khilji',
    11: 'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms.vijayanagara_empire',
    12: 'art_culture_heritage.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka',
    13: 'history.indian_freedom_struggle.gandhian_era_mass_movements.non-cooperation_movement_khilafat_agitation_1920-1922',
    14: 'history.post-independence_india.integration_of_princely_states_sardar_patel',
    15: 'environment_ecology_disaster_management.disaster_management_mitigation.hydro-meteorological_disasters',
    16: 'environment_ecology_disaster_management.ecology_ecosystems_functioning.biogeochemical_cycles_energy_flow_productivity',
    17: 'geography_earth_systems.geography_of_karnataka.physiography_western_ghats_malnad_maidan_of_karnataka',
    18: 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka',
    19: 'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.hyder_ali_tipu_sultan_era',
    20: 'indian_economy_development.indian_agriculture_allied_sectors.agricultural_production_cropping_patterns',
    21: 'geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_endogenic_exogenic_forces.rock_types_igneous_sedimentary_metamorphic_rock_cycle',
    22: 'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_composition_vertical_structure.troposphere_stratosphere_mesosphere_thermosphere',
    23: 'geography_earth_systems.geography_of_karnataka',
    24: 'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms.vijayanagara_empire',
    25: 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india.peninsular_drainage_system_godavari_krishna_cauvery',
    26: 'geography_earth_systems.indian_mapping_spatial_geography',
    27: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
    28: 'geography_earth_systems.climatology_atmospheric_dynamics.tropical_cyclones_origin_structure_tracks',
    29: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_duties_-_part_iv-a_article_51a',
    30: 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.schedules_and_parts_of_the_constitution',
    31: 'indian_polity_constitution_governance.salient_features_amendments_basic_structure',
    32: 'indian_polity_constitution_governance.federal_structure_centre_state_relations',
    33: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
    34: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.constitutional_remedies_article_32_and_writs',
    35: 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.basic_structure_doctrine_evolution_scope',
    36: 'indian_polity_constitution_governance.local_government_panchayati_raj_municipalities.73rd_and_74th_constitutional_amendment_acts',
    37: 'indian_polity_constitution_governance.union_legislature_state_legislature.parliament_of_india_structure_composition',
    38: 'indian_polity_constitution_governance.federal_structure_centre_state_relations.centre-state_relations_legislative_administrative_financial',
    39: 'indian_economy_development.financial_markets_capital_money_markets',
    40: 'indian_economy_development.external_sector_balance_of_payments.foreign_capital_flows_fdi_fpi_ecb',
    41: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
    42: 'indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations',
    43: 'indian_economy_development.monetary_policy_banking_architecture.banking_sector_reforms_npa_resolution_ibc',
    44: 'science_technology_defence.information_communication_technology_ai_cyber_security.cyber_security_threats_data_protection',
    45: 'environment_ecology_disaster_management.environmental_pollution_degradation.water_pollution_aquatic_ecosystems',
    46: 'indian_economy_development.fiscal_policy_public_finance_taxation.tax_structure_reforms_gst_architecture',
    47: 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
    48: 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
    49: 'environment_ecology_disaster_management.ecology_ecosystems_functioning.biogeochemical_cycles_energy_flow_productivity',
    50: 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
    51: 'environment_ecology_disaster_management.environmental_pollution_degradation',
    52: 'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
    53: 'science_technology_defence.applied_fundamental_sciences.applied_physics',
    54: 'indian_economy_development.monetary_policy_banking_architecture.digital_payments_fintech_architecture',
    55: 'geography_earth_systems.world_mapping_geopolitical_locations',
    56: 'indian_economy_development.economy_development_of_karnataka.industrial_policies_manufacturing_innovation_ecosystem',
    57: 'geography_earth_systems.indian_physical_geography_monsoon_architecture.multipurpose_river_valley_projects_dams',
    58: 'science_technology_defence.biotechnology_health_life_sciences.public_health_disease_epidemiology_national_missions',
    59: 'science_technology_defence.biotechnology_health_life_sciences.infectious_communicable_diseases_epidemiology',
    60: 'international_relations_global_institutions.global_institutions_agreements_treaties.g7_g20_brics_minilateral_plurilateral_groupings',
    61: 'geography_earth_systems.indian_physical_geography_monsoon_architecture.himalayas_structure_orogeny_glaciers',
    62: 'international_relations_global_institutions.global_institutions_agreements_treaties.bretton_woods_institutions_imf_world_bank',
    63: 'geography_earth_systems.indian_mapping_spatial_geography',
    64: 'science_technology_defence.information_communication_technology_ai_cyber_security',
    65: 'international_relations_global_institutions.bilateral_relations_major_powers.india-us_relations_strategic_partnership',
    66: 'science_technology_defence.information_communication_technology_ai_cyber_security.blockchain_cryptocurrency_web3',
    67: 'internal_security.security_forces_intelligence_agencies_statutory_mandates',
    68: 'international_relations_global_institutions.india_and_its_neighbourhood.india-myanmar_relations_act_east_policy',
    69: 'science_technology_defence.applied_fundamental_sciences',
    70: 'art_culture_heritage.martial_arts_traditional_sports_calendars.martial_arts_and_traditional_sports_of_india',
    71: 'indian_economy_development.monetary_policy_banking_architecture.digital_payments_fintech_architecture',
    72: 'history.world_history.major_world_wars_geopolitical_conflicts',
    73: 'international_relations_global_institutions.india_and_its_neighbourhood.india-china_relations_border_disputes',
    74: 'science_technology_defence.defence_technology.missile_systems_artillery',
    75: 'science_technology_defence.information_communication_technology_ai_cyber_security',
    76: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.divisibility_rules_remainders_unit_digit',
    77: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.verbal_analogy_classification_odd_one_out',
    78: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains',
    79: 'internal_security.security_forces_intelligence_agencies_statutory_mandates',
    80: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.blood_relations_family_trees_coded_relations',
    81: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series',
    82: 'general_mental_ability_quantitative_aptitude_comprehension.data_interpretation_sufficiency.data_interpretation_charts_graphs_tables.line_graphs_xy_plots_trend_analysis',
    83: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_direct_inverse_variation',
    84: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution',
    85: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.profit_loss_marked_price_discounts',
    86: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons',
    87: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation',
    88: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series',
    89: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.surds_indices_algebraic_identities',
    90: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.lcm_hcf_factors_multiples',
    91: 'international_relations_global_institutions.india_and_its_neighbourhood.india-china_relations_border_disputes',
    92: 'ethics_integrity_aptitude.ethics_human_interface.human_values_lessons_from_great_leaders_reformers',
    93: 'international_relations_global_institutions.global_institutions_agreements_treaties.regional_groupings_eu_asean_saarc_sco',
    94: 'indian_economy_development.poverty_inequality_employment_social_sector.poverty_estimation_alleviation_programmes',
    95: 'art_culture_heritage.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage.gi_tagged_handicrafts_and_textiles_of_karnataka',
    96: 'art_culture_heritage.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards.national_cultural_awards_and_honours',
    97: 'history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation',
    98: 'environment_ecology_disaster_management.environmental_pollution_degradation',
    99: 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting',
    100: 'history.world_history.united_nations_organisation_peacekeeping_global_governance.evolution_charter_architecture_specialized_agencies_un'
}

print(f"Total mappings: {len(MAPPING)}")
missing = []
for qn, nid in sorted(MAPPING.items()):
    if nid not in nodes:
        missing.append((qn, nid))

if missing:
    print(f"ERROR: {len(missing)} nodes not in KG:")
    for qn, nid in missing:
        print(f"  Q{qn}: {nid}")
else:
    print("ALL 100 NODES VERIFIED IN MASTER KNOWLEDGE GRAPH!")
