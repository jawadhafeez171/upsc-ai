import json
import glob
import re

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
valid_nodes = set(kg['nodes'].keys())

files = sorted(glob.glob('src/data/kas_*p2*.json'))

# Collect all 600 questions with their context
all_questions = []
for f in files:
    with open(f, 'r', encoding='utf-8') as fp:
        for q in json.load(fp):
            all_questions.append({
                'file': f,
                'qn': q.get('question_number'),
                'subject': q.get('subject', ''),
                'domain': q.get('domain', ''),
                'sub_topic': q.get('sub_topic', ''),
                'node_id': q.get('node_id', ''),
                'qtxt': (q.get('question_english') or q.get('question') or ''),
                'exp': (q.get('explanation_english') or q.get('explanation') or '')
            })

print(f"Total questions loaded: {len(all_questions)}")

# Let's inspect unique node_ids
unique_nodes = {}
for q in all_questions:
    nid = q['node_id']
    if nid not in unique_nodes:
        unique_nodes[nid] = q

print(f"Total unique node_ids: {len(unique_nodes)}")

# Function to map adhoc node to canonical
def map_node(q):
    nid = q['node_id']
    if nid in valid_nodes:
        return nid
    
    s = q['subject']
    d = q['domain']
    sub = q['sub_topic']
    comb = f"{nid} {s} {d} {sub} {q['qtxt']} {q['exp']}".lower()

    # CSAT / Mental Ability
    if 'reading_comprehension' in nid:
        return 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference'
    
    if 'logical_and_analytical_reasoning' in nid or 'problem_solving' in nid or s.startswith('General Mental Ability'):
        if any(w in comb for w in ['blood_relation', 'family tree', 'maternal', 'paternal', 'sister', 'brother', 'uncle', 'nephew', 'niece']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.blood_relations_family_trees_coded_relations'
        if any(w in comb for w in ['seating', 'circular', 'table', 'facing north', 'facing center', 'row of people']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.linear_circular_complex_seating_arrangements'
        if any(w in comb for w in ['syllogism', 'deductive', 'statements and conclusions', 'some cats', 'all dogs', 'conclusions i and ii']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.syllogisms_venn_logical_deductions'
        if any(w in comb for w in ['direction', 'distance', 'walks north', 'turns left', 'turns right', 'shadow']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.direction_distance_sense_shadows'
        if any(w in comb for w in ['clock', 'minute hand', 'hour hand', 'angle between']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.clocks_angle_coincidence_faulty_clocks'
        if any(w in comb for w in ['calendar', 'leap year', 'odd days', 'day of the week']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.calendar_odd_days_leap_years_repetition'
        if any(w in comb for w in ['coding', 'decoding', 'cipher', 'substitution']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution'
        if any(w in comb for w in ['number_and_letter', 'series', 'missing number', 'alphanumeric']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series'
        if any(w in comb for w in ['ranking', 'order', 'tournament', 'tallest', 'heaviest', 'seeding', 'bracket']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.order_ranking_comparative_arrangements'
        if any(w in comb for w in ['cube', 'dice', 'painted', 'folding']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.cubes_dice_folding_nets_painting'
        if any(w in comb for w in ['mirror', 'water image', 'figure completion', 'pattern', 'paper folding', 'non_verbal']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.non_verbal_reasoning_mirror_water_figure_completion'
        if any(w in comb for w in ['mathematical_operators', 'interchange', 'symbols']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.mathematical_operators_symbolic_logic'
        if any(w in comb for w in ['venn', 'intersection', 'set']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.venn_diagram_based_di_and_set_caselets'
        if any(w in comb for w in ['legal', 'situational', 'decision', 'crisis']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills.administrative_decision_making_crisis_management'

    if 'data_interpretation' in nid:
        if 'bar' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.bar_charts_simple_grouped_stacked'
        if 'pie' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.pie_charts_percentage_degree_distribution'
        if 'line' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.line_graphs_multiseries_trends'
        if 'caselet' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.caselet_di_paragraph_data'
        if 'table' in comb or 'tabular' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.tabular_di_and_missing_data_tables'
        if 'sufficiency' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.data_sufficiency_evaluating_statements'
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.tabular_di_and_missing_data_tables'

    if 'quantitative_aptitude' in nid:
        if any(w in comb for w in ['percentage', 'ratio', 'proportion', 'partnership', 'average', 'ages']):
            if 'ages' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.problems_on_ages'
            if 'average' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation'
            if 'ratio' in comb or 'proportion' in comb or 'partnership' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_variations_partnerships'
            return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.percentages_successive_change'
        if any(w in comb for w in ['profit', 'loss', 'discount', 'marked price', 'interest', 'compound interest', 'simple interest']):
            if 'compound' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.compound_interest_installments'
            if 'simple interest' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_interest_installments'
            return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.profit_loss_marked_price_discounts'
        if any(w in comb for w in ['speed', 'train', 'distance', 'boat', 'stream', 'work', 'pipe', 'cistern']):
            if 'boat' in comb or 'stream' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.boats_streams_races_circular_tracks'
            if 'work' in comb or 'pipe' in comb or 'cistern' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_and_work_pipes_and_cisterns'
            return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains'
        if any(w in comb for w in ['permutation', 'combination', 'probability']):
            if 'probability' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.probability_events_conditional_bayes'
            if 'combination' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.combinations_selections_geometry_combinations'
            return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.fundamental_counting_principle_permutations'
        if any(w in comb for w in ['triangle', 'circle', 'area', 'volume', 'cylinder', 'sphere', 'mensuration', 'geometry', 'square', 'rectangle']):
            if any(w in comb for w in ['volume', 'cylinder', 'sphere', 'cone', '3d']):
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.3d_mensuration_solids_surface_area_volume'
            return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons'
        if any(w in comb for w in ['divisib', 'prime', 'hcf', 'lcm', 'factor', 'remainder', 'unit digit', 'fraction', 'algebra', 'equation', 'progression', 'arithmetic progression']):
            if 'lcm' in comb or 'hcf' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.lcm_hcf_factors_multiples'
            if 'remainder' in comb or 'unit digit' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.remainders_unit_digit_factorials_cyclicity'
            if 'progression' in comb or ' ap ' in comb or ' gp ' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.progressions_sequences_ap_gp'
            if 'algebra' in comb or 'equation' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.algebraic_identities_linear_quadratic_equations'
            if 'fraction' in comb or 'decimal' in comb:
                return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.fractions_decimals_surds_indices'
            return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules'
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules'

    return None

mapped = 0
unmapped = []
for q in all_questions:
    res = map_node(q)
    if res and res in valid_nodes:
        mapped += 1
    else:
        unmapped.append(q)

print(f"Initially mapped: {mapped}/{len(all_questions)}")
print(f"Unmapped remaining: {len(unmapped)}")
