import json
import glob
import re
import os
from collections import Counter

DATA_DIR = 'src/data'

with open(os.path.join(DATA_DIR, 'knowledge_graph_civil_services.json'), 'r', encoding='utf-8') as f:
    kg = json.load(f)
valid_nodes = kg['nodes']
valid_keys = set(valid_nodes.keys())

P2_FILES = [
    'kas_dec_p2_2011.json',
    'kas_april_p2_2015.json',
    'kas_aug_p2_2017.json',
    'kas_p2_2020.json',
    'kas_aug_p2_2024.json',
    'kas_dec_p2_2024.json'
]

SUBJECT_PREFIX = {
    'General Mental Ability, Quantitative Aptitude & Comprehension': 'general_mental_ability_quantitative_aptitude_comprehension',
    'Science, Technology & Defence': 'science_technology_defence',
    'Environment, Ecology & Disaster Management': 'environment_ecology_disaster_management',
    'Indian Economy & Development': 'indian_economy_development',
    'Indian Society & Social Justice': 'indian_society_social_justice',
    'Art, Culture & Heritage': 'art_culture_heritage',
    'Indian Polity, Constitution & Governance': 'indian_polity_constitution_governance',
    'Geography & Earth Systems': 'geography_earth_systems',
    'Ethics, Integrity & Aptitude': 'ethics_integrity_aptitude',
    'History': 'history',
    'International Relations & Global Institutions': 'international_relations_global_institutions'
}

STOPWORDS = {
    'a', 'an', 'the', 'and', 'or', 'of', 'in', 'on', 'at', 'to', 'for', 'with', 'by', 'as', 'is', 'are', 'was', 'were',
    'be', 'been', 'which', 'what', 'who', 'whom', 'this', 'that', 'these', 'those', 'it', 'its', 'from', 'into', 'during',
    'including', 'until', 'against', 'among', 'throughout', 'despite', 'towards', 'upon', 'concerning', 'to', 'in', 'for',
    'on', 'by', 'about', 'like', 'through', 'over', 'before', 'between', 'after', 'since', 'without', 'under', 'within',
    'along', 'following', 'across', 'behind', 'beyond', 'plus', 'except', 'but', 'up', 'out', 'around', 'down', 'off',
    'above', 'near', 'correct', 'statement', 'statements', 'answer', 'choose', 'following', 'given', 'options', 'match',
    'list', 'i', 'ii', 'consider', 'reference', 'not', 'true', 'false', 'one', 'two', 'three', 'four', 'only', 'all',
    'both', 'neither', 'either', 'code', 'codes', 'option', 'karnataka', 'india', 'state', 'question', 'explanation'
}

def tokenize(text):
    text = text.lower()
    tokens = re.findall(r'[a-z0-9]+', text)
    return [t for t in tokens if len(t) > 2 and t not in STOPWORDS]

# Index node tokens
node_tokens = {}
for nid, ndata in valid_nodes.items():
    toks = set()
    toks.update(tokenize(nid.replace('.', ' ').replace('_', ' ')))
    toks.update(tokenize(ndata.get('name', '')))
    toks.update(tokenize(ndata.get('description', '')))
    for kw in ndata.get('keywords', []):
        toks.update(tokenize(kw))
    node_tokens[nid] = toks

def classify_csat(nid, comb):
    if 'reading_comprehension' in nid or 'passage' in comb:
        return 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference'
    
    # Logical Reasoning
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

    # Data Interpretation
    if 'data_interpretation' in nid or any(w in comb for w in ['bar graph', 'pie chart', 'line graph', 'data table']):
        if 'bar' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.bar_charts_simple_grouped_stacked'
        if 'pie' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.pie_charts_percentage_degree_distribution'
        if 'line' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.line_graphs_multiseries_trends'
        if 'caselet' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.caselet_di_paragraph_data'
        if 'sufficiency' in comb:
            return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.data_sufficiency_evaluating_statements'
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.tabular_di_and_missing_data_tables'

    # Quantitative Aptitude
    if any(w in comb for w in ['ages', 'age of father', 'age of son']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.problems_on_ages'
    if any(w in comb for w in ['average', 'weighted average']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation'
    if any(w in comb for w in ['ratio', 'proportion', 'partnership']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_variations_partnerships'
    if any(w in comb for w in ['percentage', 'percent']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.percentages_successive_change'
    if any(w in comb for w in ['compound interest', 'ci ']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.compound_interest_installments'
    if any(w in comb for w in ['simple interest', 'si ']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_interest_installments'
    if any(w in comb for w in ['profit', 'loss', 'discount', 'marked price', 'cost price', 'selling price']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.profit_loss_marked_price_discounts'
    if any(w in comb for w in ['boat', 'stream', 'upstream', 'downstream']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.boats_streams_races_circular_tracks'
    if any(w in comb for w in ['work', 'pipe', 'cistern', 'efficiency', 'days to complete']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_and_work_pipes_and_cisterns'
    if any(w in comb for w in ['speed', 'train', 'distance', 'km/h', 'm/s']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains'
    if any(w in comb for w in ['probability', 'dice rolled', 'cards drawn', 'coin tossed']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.probability_events_conditional_bayes'
    if any(w in comb for w in ['combination', 'selection']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.combinations_selections_geometry_combinations'
    if any(w in comb for w in ['permutation', 'arrangement of letters']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.fundamental_counting_principle_permutations'
    if any(w in comb for w in ['volume', 'cylinder', 'sphere', 'cone', 'cuboid', '3d']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.3d_mensuration_solids_surface_area_volume'
    if any(w in comb for w in ['triangle', 'circle', 'area', 'perimeter', 'square', 'rectangle', 'polygon', 'geometry']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons'
    if any(w in comb for w in ['lcm', 'hcf', 'greatest common', 'least common']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.lcm_hcf_factors_multiples'
    if any(w in comb for w in ['remainder', 'unit digit', 'last digit', 'cyclicity']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.remainders_unit_digit_factorials_cyclicity'
    if any(w in comb for w in ['progression', 'arithmetic progression', 'geometric progression', ' ap ', ' gp ']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.progressions_sequences_ap_gp'
    if any(w in comb for w in ['algebra', 'equation', 'roots', 'polynomial']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.algebraic_identities_linear_quadratic_equations'
    if any(w in comb for w in ['fraction', 'decimal', 'surd', 'indices', 'square root']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.fractions_decimals_surds_indices'
    
    return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules'

def classify_question(q):
    old_nid = q.get('node_id', '')
    if old_nid in valid_keys:
        return old_nid

    s = q.get('subject', '')
    d = q.get('domain', '')
    sub = q.get('sub_topic', '')
    qtxt = (q.get('question_english') or q.get('question') or '')
    exp = (q.get('explanation_english') or q.get('explanation') or '')
    comb = f"{old_nid} {s} {d} {sub} {qtxt} {exp}".lower()

    if s.startswith('General Mental Ability') or 'logical_and_analytical_reasoning' in old_nid or 'quantitative_aptitude' in old_nid or 'reading_comprehension' in old_nid or 'data_interpretation' in old_nid:
        return classify_csat(old_nid, comb)

    prefix = SUBJECT_PREFIX.get(s, '')
    candidates = [k for k in valid_keys if k.startswith(prefix)]
    if not candidates:
        candidates = list(valid_keys)

    # Question token bags
    primary_toks = set(tokenize(old_nid.replace('.', ' ').replace('_', ' ') + ' ' + d + ' ' + sub))
    secondary_toks = set(tokenize(qtxt + ' ' + exp))
    is_kar = 'karnataka' in (d + ' ' + sub + ' ' + qtxt).lower()

    best_score = -1000
    best_node = None

    for cand in candidates:
        c_toks = node_tokens[cand]
        cand_is_kar = 'karnataka' in cand

        score = 0
        score += len(primary_toks & c_toks) * 6
        score += len(secondary_toks & c_toks) * 1

        if is_kar and cand_is_kar:
            score += 15
        elif not is_kar and cand_is_kar:
            score -= 20

        # Prefer leaf nodes
        if len(valid_nodes[cand].get('children', [])) == 0:
            score += 3

        if score > best_score:
            best_score = score
            best_node = cand

    return best_node

def process_p2():
    total_qs = 0
    total_reassigned = 0
    
    for fname in P2_FILES:
        fpath = os.path.join(DATA_DIR, fname)
        with open(fpath, 'r', encoding='utf-8') as f:
            data = json.load(f)
            
        file_reassigned = 0
        for q in data:
            total_qs += 1
            old_nid = q.get('node_id', '')
            new_nid = classify_question(q)
            
            if new_nid not in valid_keys:
                raise ValueError(f"CRITICAL: Assigned node '{new_nid}' is not valid in KG for {fname} Q{q.get('question_number')}")
                
            if new_nid != old_nid:
                q['node_id'] = new_nid
                file_reassigned += 1
                total_reassigned += 1

        with open(fpath, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
            
        print(f"Processed {fname}: {len(data)} questions, {file_reassigned} nodes re-routed to canonical KG.")

    print(f"\nSUCCESS: All {len(P2_FILES)} KAS Paper 2 files processed!")
    print(f"Total questions: {total_qs}")
    print(f"Total nodes re-routed: {total_reassigned}")

if __name__ == '__main__':
    process_p2()
