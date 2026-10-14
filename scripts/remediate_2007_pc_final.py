import json
import os
import sys

sys.stdout.reconfigure(encoding='utf-8')

# Load Knowledge Graph
with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']

# Canonical Subject Kannada Translations
SUBJECT_KANNADA = {
    'History': 'ಇತಿಹಾಸ',
    'Geography & Earth Systems': 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
    'Indian Polity, Constitution & Governance': 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ',
    'Science, Technology & Defence': 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ',
    'General Mental Ability, Quantitative Aptitude & Comprehension': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ',
    'Indian Economy & Development': 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
    'Environment, Ecology & Disaster Management': 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ',
    'Art, Culture & Heritage': 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ',
    'Internal Security': 'ಆಂತರಿಕ ಭದ್ರತೆ',
    'International Relations & Global Institutions': 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು',
    'Indian Society & Social Justice': 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ',
    'Ethics, Integrity & Aptitude': 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ',
    'Language Proficiency, Grammar & Communication (general Kannada & General English)': 'ಭಾಷಾ ಪ್ರಾವೀಣ್ಯತೆ, ವ್ಯಾಕರಣ ಮತ್ತು ಸಂವಹನ (ಸಾಮಾನ್ಯ ಕನ್ನಡ ಮತ್ತು ಇಂಗ್ಲಿಷ್)',
    'Language Proficiency, Grammar & Communication': 'ಭಾಷಾ ಪ್ರಾವೀಣ್ಯತೆ, ವ್ಯಾಕರಣ ಮತ್ತು ಸಂವಹನ'
}

DOMAIN_KANNADA = {
    'Kannada Literature, Authors & Sahitya Academy Awards (ಕನ್ನಡ ಸಾಹಿತ್ಯ ಪರಿಚಯ)': 'ಕನ್ನಡ ಸಾಹಿತ್ಯ, ಲೇಖಕರು ಮತ್ತು ಸಾಹಿತ್ಯ ಅಕಾಡೆಮಿ ಪ್ರಶಸ್ತಿಗಳು',
    'Climatology': 'ವಾಯುಗುಣಶಾಸ್ತ್ರ',
    'Biotechnology, Health & Life Sciences': 'ಜೈವಿಕ ತಂತ್ರಜ್ಞಾನ, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವ ವಿಜ್ಞಾನ',
    'Indian Literature & Languages': 'ಭಾರತೀಯ ಸಾಹಿತ್ಯ ಮತ್ತು ಭಾಷೆಗಳು',
    'Monetary Policy & Banking Architecture': 'ವಿತ್ತೀಯ ನೀತಿ ಮತ್ತು ಬ್ಯಾಂಕಿಂಗ್ ರಚನೆ',
    'World History': 'ವಿಶ್ವ ಇತಿಹಾಸ',
    'Modern India': 'ಆಧುನಿಕ ಭಾರತ',
    'Medieval India': 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ',
    'History of Karnataka': 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ',
    'Art, Architecture & Cultural Heritage of Karnataka': 'ಕರ್ನಾಟಕದ ಕಲೆ, ವಾಸ್ತುಶಿಲ್ಪ ಮತ್ತು ಸಾಂಸ್ಕೃತಿಕ ಪರಂಪರೆ',
    'Indian Freedom Struggle': 'ಭಾರತೀಯ ಸ್ವಾತಂತ್ರ್ಯ ಸಂಗ್ರಾಮ',
    'Post-Independence India': 'ಸ್ವಾತಂತ್ರ್ಯೋತ್ತರ ಭಾರತ',
    'Hazard Profiles & Disaster Vulnerability in India': 'ವಿಪತ್ತುಗಳು ಮತ್ತು ನೈಸರ್ಗಿಕ ಅಪಾಯಗಳು',
    'Fundamental Ecology & Ecosystem Dynamics': 'ಮೂಲಭೂತ ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ಪರಿಸರ ವ್ಯವಸ್ಥೆ',
    'Geography of Karnataka': 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ',
    'Agriculture, Food Management & Subsidies': 'ಕೃಷಿ, ಆಹಾರ ನಿರ್ವಹಣೆ ಮತ್ತು ಸಬ್ಸಿಡಿಗಳು',
    'Physical Geography & Earth Systems (Geomorphology)': 'ಭೌತಿಕ ಭೂಗೋಳ ಮತ್ತು ಭೂರೂಪಶಾಸ್ತ್ರ',
    'Physical Geography & Earth Systems': 'ಭೌತಿಕ ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು',
    'Indian Physical Geography & Monsoon Architecture': 'ಭಾರತದ ಭೌತಿಕ ಭೂಗೋಳ ಮತ್ತು ಮಾನ್ಸೂನ್ ರಚನೆ',
    'Indian Mapping & Spatial Geography': 'ಭಾರತೀಯ ನಕ್ಷೆ ಮತ್ತು ಪ್ರಾದೇಶಿಕ ಭೂಗೋಳ',
    'Fundamental Rights, DPSP & Fundamental Duties': 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು, ಡಿಪಿಎಸ್ಪಿ ಮತ್ತು ಕರ್ತವ್ಯಗಳು',
    'Salient Features, Amendments & Basic Structure': 'ಪ್ರಮುಖ ಲಕ್ಷಣಗಳು, ತಿದ್ದುಪಡಿಗಳು ಮತ್ತು ಮೂಲ ರಚನೆ',
    'Federal Structure, Center-State Relations & Devolution': 'ಒಕ್ಕೂಟ ರಚನೆ ಮತ್ತು ಕೇಂದ್ರ-ರಾಜ್ಯ ಸಂಬಂಧಗಳು',
    'Local Governance & Decentralisation (Panchayati Raj & Urban Local Bodies)': 'ಸ್ಥಳೀಯ ಆಡಳಿತ ಮತ್ತು ಪಂಚಾಯತ್ ರಾಜ್',
    'Parliament & State Legislatures': 'ಸಂಸತ್ತು ಮತ್ತು ರಾಜ್ಯ ಶಾಸಕಾಂಗಗಳು',
    'Financial Markets & Capital Markets': 'ಹಣಕಾಸು ಮತ್ತು ಬಂಡವಾಳ ಮಾರುಕಟ್ಟೆಗಳು',
    'External Sector, Balance of Payments & Foreign Trade': 'ಬಾಹ್ಯ ವಲಯ, ವಿದೇಶಿ ವ್ಯಾಪಾರ ಮತ್ತು ಪಾವತಿ ಸಮತೋಲನ',
    'Information & Communication Technology, AI & Cyber Security': 'ಮಾಹಿತಿ ತಂತ್ರಜ್ಞಾನ, ಎಐ ಮತ್ತು ಸೈಬರ್ ಭದ್ರತೆ',
    'Environmental Pollution, Waste Management & Remediation': 'ಪರಿಸರ ಮಾಲಿನ್ಯ, ತ್ಯಾಜ್ಯ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಹಾರ',
    'Fiscal Policy, Public Finance & Taxation': 'ವಿತ್ತೀಯ ನೀತಿ, ಸಾರ್ವಜನಿಕ ಹಣಕಾಸು ಮತ್ತು ತೆರಿಗೆ',
    'Applied & Fundamental Sciences': 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು',
    'World Mapping & Geopolitical Locations': 'ವಿಶ್ವ ನಕ್ಷೆ ಮತ್ತು ಭೌಗೋಳಿಕ ರಾಜಕೀಯ ಸ್ಥಳಗಳು',
    'Economy & Development of Karnataka': 'ಕರ್ನಾಟಕದ ಆರ್ಥಿಕತೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ',
    'Global Institutions, Agreements & Treaties': 'ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು ಮತ್ತು ಅಂತಾರಾಷ್ಟ್ರೀಯ ಒಪ್ಪಂದಗಳು',
    "India's Foreign Policy & Bilateral Relations": 'ಭಾರತದ ವಿದೇಶಾಂಗ ನೀತಿ ಮತ್ತು ದ್ವಿಪಕ್ಷೀಯ ಸಂಬಂಧಗಳು',
    'Security Forces & Intelligence Agencies (Statutory Mandates)': 'ಭದ್ರತಾ ಪಡೆಗಳು ಮತ್ತು ಗುಪ್ತಚರ ಸಂಸ್ಥೆಗಳು',
    'Martial Arts, Traditional Sports & Indian Calendar Systems': 'ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಭಾರತೀಯ ಕ್ಯಾಲೆಂಡರ್',
    'Defence Technology': 'ರಕ್ಷಣಾ ತಂತ್ರಜ್ಞಾನ',
    'Quantitative Aptitude & Basic Numeracy': 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲಭೂತ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ',
    'General Mental Ability & Logical Reasoning': 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕತೆ',
    'Data Interpretation & Sufficiency': 'ದತ್ತಾಂಶ ವಿಶ್ಲೇಷಣೆ ಮತ್ತು ಸಮರ್ಪಕತೆ',
    'Ethics & Human Interface': 'ನೀತಿಶಾಸ್ತ್ರ ಮತ್ತು ಮಾನವೀಯ ಮೌಲ್ಯಗಳು',
    'Poverty, Inequality & Developmental Challenges': 'ಬಡತನ, ಅಸಮಾನತೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ ಸವಾಲುಗಳು',
    'Cultural Institutions, Numismatics & Heritage Governance': 'ಸಾಂಸ್ಕೃತಿಕ ಸಂಸ್ಥೆಗಳು ಮತ್ತು ರಾಷ್ಟ್ರೀಯ ಗೌರವಗಳು'
}

FINAL_MAPPING = {
    1: 'language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards',
    2: 'geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget.atmospheric_layers_composition_lapse_rates',
    3: 'science_technology_defence.biotechnology_health_life_sciences.immunology_infectious_diseases_public_health',
    4: 'science_technology_defence.biotechnology_health_life_sciences.immunology_infectious_diseases_public_health',
    5: 'art_culture_heritage.indian_literature_languages.classical_religious_texts.classical_sanskrit_literature_kalidasa_bhasa',
    6: 'indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations',
    7: 'history.world_history.world_war_i_russian_revolution',
    8: 'history.modern_india.british_conquest_consolidation_of_india.british_conquest_of_bengal',
    9: 'history.modern_india.british_conquest_consolidation_of_india.british_conquest_of_bengal',
    10: 'history.medieval_india.delhi_sultanate.sultanate_administration_economy_culture',
    11: 'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms.vijayanagara_empire',
    12: 'art_culture_heritage.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka',
    13: 'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.khilafat_agitation_non-cooperation_movement',
    14: 'history.post-independence_india.integration_of_princely_states_territorial_consolidation.accession_of_565_princely_states',
    15: 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india.hydrometeorological_hazards',
    16: 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.energy_flow_trophic_structure',
    17: 'geography_earth_systems.geography_of_karnataka.physiography_relief_divisions_of_karnataka',
    18: 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka',
    19: 'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.hyder_ali_tipu_sultan_era',
    20: 'indian_economy_development.agriculture_food_management_subsidies.agricultural_pricing_market_reforms',
    21: 'geography_earth_systems.physical_geography_earth_systems.rocks_formation_and_classification.igneous_sedimentary_metamorphic_rocks_cycle',
    22: 'geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget.atmospheric_layers_composition_lapse_rates',
    23: 'geography_earth_systems.geography_of_karnataka',
    24: 'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms.vijayanagara_empire',
    25: 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india.peninsular_river_systems_east_and_west_flowing',
    26: 'geography_earth_systems.indian_mapping_spatial_geography',
    27: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
    28: 'geography_earth_systems.climatology_atmospheric_dynamics.air_masses_fronts_cyclogenesis',
    29: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_duties_-_part_iv-a_article_51a',
    30: 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.salient_features_of_the_indian_constitution',
    31: 'indian_polity_constitution_governance.salient_features_amendments_basic_structure',
    32: 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution',
    33: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
    34: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
    35: 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.basic_structure_doctrine',
    36: 'indian_polity_constitution_governance.local_governance.73rd_74th_constitutional_amendment_acts',
    37: 'indian_polity_constitution_governance.parliament_state_legislatures.structure_composition',
    38: 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.legislative_administrative_relations',
    39: 'indian_economy_development.monetary_policy_banking_architecture.non-banking_financial_institutions_capital_markets',
    40: 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.balance_of_payments_architecture',
    41: 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
    42: 'indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations',
    43: 'indian_economy_development.monetary_policy_banking_architecture.banking_structure_regulatory_framework',
    44: 'science_technology_defence.information_communication_technology_ai_cyber_security.cyber_security_threats_digital_governance',
    45: 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.water_pollution_aquatic_degradation',
    46: 'indian_economy_development.fiscal_policy_public_finance_taxation.indirect_taxation_gst_architecture',
    47: 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
    48: 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
    49: 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.energy_flow_trophic_structure',
    50: 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
    51: 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation',
    52: 'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
    53: 'science_technology_defence.applied_fundamental_sciences.applied_physics',
    54: 'indian_economy_development.monetary_policy_banking_architecture',
    55: 'geography_earth_systems.world_mapping_geopolitical_locations',
    56: 'indian_economy_development.economy_development_of_karnataka.industrial_policies_manufacturing_innovation_ecosystem',
    57: 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india',
    58: 'science_technology_defence.biotechnology_health_life_sciences.immunology_infectious_diseases_public_health',
    59: 'science_technology_defence.biotechnology_health_life_sciences.immunology_infectious_diseases_public_health',
    60: 'international_relations_global_institutions.global_institutions_agreements_treaties.international_organisations_reform',
    61: 'geography_earth_systems.indian_physical_geography_monsoon_architecture',
    62: 'international_relations_global_institutions.global_institutions_agreements_treaties.international_organisations_reform',
    63: 'geography_earth_systems.indian_mapping_spatial_geography',
    64: 'science_technology_defence.information_communication_technology_ai_cyber_security',
    65: 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_major_global_powers',
    66: 'science_technology_defence.information_communication_technology_ai_cyber_security',
    67: 'internal_security.security_forces_intelligence_agencies_statutory_mandates',
    68: 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_immediate_neighbours',
    69: 'science_technology_defence.applied_fundamental_sciences',
    70: 'art_culture_heritage.martial_arts_traditional_sports_calendars.martial_arts_and_traditional_sports_of_india',
    71: 'indian_economy_development.monetary_policy_banking_architecture',
    72: 'history.world_history.world_war_i_russian_revolution',
    73: 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_immediate_neighbours',
    74: 'science_technology_defence.defence_technology.missile_systems_artillery',
    75: 'science_technology_defence.information_communication_technology_ai_cyber_security',
    76: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules',
    77: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning',
    78: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains',
    79: 'internal_security.security_forces_intelligence_agencies_statutory_mandates',
    80: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.blood_relations_family_trees_coded_relations',
    81: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series',
    82: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.line_graphs_multiseries_trends',
    83: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_variations_partnerships',
    84: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution',
    85: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.profit_loss_marked_price_discounts',
    86: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons',
    87: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation',
    88: 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series',
    89: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.algebraic_identities_linear_quadratic_equations',
    90: 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.lcm_hcf_factors_multiples',
    91: 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_immediate_neighbours',
    92: 'ethics_integrity_aptitude.ethics_human_interface.human_values_lessons_from_great_leaders_reformers',
    93: 'international_relations_global_institutions.global_institutions_agreements_treaties.international_organisations_reform',
    94: 'indian_society_social_justice.poverty_inequality_developmental_challenges.poverty_concepts_measurement',
    95: 'art_culture_heritage.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage.gi_tagged_handicrafts_and_textiles_of_karnataka',
    96: 'art_culture_heritage.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards.national_cultural_awards_and_honours',
    97: 'history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation',
    98: 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation',
    99: 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting',
    100: 'history.world_history.united_nations_organisation_peacekeeping_global_governance.evolution_charter_architecture_specialized_agencies_un'
}

def resolve_meta(nid):
    curr = nodes[nid]
    subj_id = curr.get('subjectId')
    root_node = nodes.get(subj_id, {})
    subj_en = root_node.get('name', 'General Studies')
    subj_kn = SUBJECT_KANNADA.get(subj_en, subj_en)
    
    ancestors = curr.get('ancestorIds', [])
    chain = ancestors + [nid]
    dom_id = chain[1] if len(chain) > 1 else chain[0]
    dom_node = nodes.get(dom_id, {})
    dom_en = dom_node.get('name', subj_en)
    dom_kn = DOMAIN_KANNADA.get(dom_en, dom_en)
    
    sub_t_en = curr.get('name', dom_en)
    if '(' in sub_t_en:
        sub_t_en = sub_t_en.split('(')[0].strip()
        
    return {
        'subject': subj_en,
        'subject_kannada': subj_kn,
        'domain': dom_en,
        'domain_kannada': dom_kn,
        'sub_topic': sub_t_en,
        'sub_topic_kannada': sub_t_en,
        'node_id': nid
    }

target_file = 'src/data/pc/2007_q001-100.json'
with open(target_file, 'r', encoding='utf-8') as f:
    questions = json.load(f)

for q in questions:
    qn = q.get('question_number')
    nid = FINAL_MAPPING[qn]
    meta = resolve_meta(nid)
    
    q['node_id'] = meta['node_id']
    q['subject'] = meta['subject']
    q['subject_kannada'] = meta['subject_kannada']
    q['domain'] = meta['domain']
    q['domain_kannada'] = meta['domain_kannada']
    q['sub_topic'] = meta['sub_topic']
    q['sub_topic_kannada'] = meta['sub_topic_kannada']
    
    tags = [
        "Police Constable",
        "Karnataka",
        "Paper 1",
        "Series A",
        "2007.pdf",
        meta['subject'],
        meta['domain']
    ]
    q['tags'] = tags

with open(target_file, 'w', encoding='utf-8') as f:
    json.dump(questions, f, ensure_ascii=False, indent=2)

print("Updated 2007_q001-100.json with clean Kannada translations successfully!")
