import json
import sys
import difflib

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
nodes = set(kg['nodes'].keys())

targets = [
  'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.boats_streams_relative_speed',
  'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_work_wages_pipes_cisterns',
  'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_compound_interest_installments',
  'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.clocks_calendars_angles_reflex_gain_loss',
  'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.syllogism_venn_diagrams_deductive_logic',
  'history.history_of_karnataka.ancient_dynasties_of_karnataka.badami_chalukyas',
  'history.history_of_karnataka.medieval_dynasties_of_karnataka.hoysalas_of_dwarasamudra',
  'history.history_of_karnataka.bahmani_and_deccan_sultanates.bahmani_sultanate_architecture_administration',
  'history.history_of_karnataka.bahmani_and_deccan_sultanates.adil_shahis_of_vijayapura',
  'history.history_of_karnataka.armed_resistance_freedom_movement_in_karnataka.early_anti-british_armed_uprisings_in_karnataka',
  'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.wildlife_sanctuaries_national_parks_conservation_reserves',
  'indian_polity_constitution_governance.judiciary_system_of_india.supreme_court_high_courts_appointments_jurisdiction',
  'indian_polity_constitution_governance.constitutional_statutory_bodies_in_india.election_commission_of_india',
  'science_technology_defence.space_technology_astronomy.solar_system_planetary_science_astrophysics',
  'history.ancient_india.indus_valley_civilization_bronze_age.settlement_patterns_town_planning_architecture',
  'history.ancient_india.vedic_period_early_later_vedic_society.vedic_corpus_samhitas_upanishads_darshana',
  'history.ancient_india.religious_movements_buddhism_jainism_heterodox_sects.buddhism_origins_doctrine_schisms',
  'history.ancient_india.mauryan_empire_rise_administration_decline.emperor_ashoka_dhamma_edicts_inscriptions',
  'history.ancient_india.gupta_vakataka_age_classical_period.classical_sanskrit_literature_kalidasa_bhasa',
  'history.medieval_india.maratha_empire_confederacy.chhatrapati_shivaji_swarajya_administration',
  'history.indian_freedom_struggle.revolt_of_1857.outbreak_and_spread_of_rebellion',
  'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement.dandi_march_civil_disobedience_movement',
  'history.indian_freedom_struggle.quit_india_movement_ina_post-war_upsurge.quit_india_movement_1942'
]

for t in targets:
    prefix = t.split('.')[0]
    cand = [n for n in nodes if n.startswith(prefix)]
    matches = difflib.get_close_matches(t, cand, n=2, cutoff=0.3)
    print(f"Target: {t}")
    for m in matches:
        print(f"   => {m}")
