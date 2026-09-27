import json
import re

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
valid_nids = set(nodes.keys())

# Build token index for CSAT nodes
csat_node_index = []
for nid, data in nodes.items():
    if not nid.startswith('general_mental_ability'):
        continue
    lvl = data.get('level', 1)
    if lvl < 3:
        continue
    name = data.get('name', '')
    desc = data.get('description', '')
    keywords = data.get('keywords', [])
    text = f"{nid.replace('.', ' ').replace('_', ' ')} {name} {desc} {' '.join(keywords)}".lower()
    tokens = set(re.findall(r'[a-z0-9]{3,}', text))
    csat_node_index.append({
        'nid': nid,
        'data': data,
        'tokens': tokens,
        'level': lvl,
        'name': name
    })

def classify_csat_question(q):
    passage = (q.get('passage_english') or '').strip()
    txt = (q.get('question_english') or '').strip()
    text = (passage + ' ' + txt).lower()
    
    # 1. Reading Comprehension
    if passage or any(w in txt.lower() for w in ['passage', 'author implies', 'crux of the passage', 'central idea', 'most rational inference', 'logical corollary', 'assumption is made']):
        # Specific sub-skills:
        if any(w in txt.lower() for w in ['assumption', 'assumes', 'implicit']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'Assumption Testing in Passage'
        elif any(w in txt.lower() for w in ['strengthen', 'weaken']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.critical_reasoning_analytical_ability.strengthening_weakening_arguments', 'Strengthening & Weakening Arguments'
        elif any(w in txt.lower() for w in ['crux', 'central', 'main idea', 'essential message']):
            return 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'Central Idea & Crux of Passage'
        else:
            return 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'Passage Inference & Logical Corollary'
            
    # 2. Administrative Decision Making (Situational Judgement)
    if any(w in text for w in ['you are a district magistrate', 'you are a police officer', 'you are a municipal', 'what would be your course of action', 'as a responsible officer', 'you receive a complaint']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills.administrative_decision_making_crisis_management', 'Administrative Decision Making & Situational Judgement'
        
    # 3. Data Sufficiency
    if any(w in text for w in ['which one of the following is correct in respect of the above question and the statements', 'sufficient to answer', 'data sufficiency']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.data_sufficiency_evaluating_statements', 'Data Sufficiency'

    # 4. Syllogisms & Categorical Logic
    if any(w in text for w in ['all cats are', 'some dogs are', 'all men are', 'conclusions logically follow', 'which of the conclusions follow', 'syllogism']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.syllogisms_venn_logical_deductions', 'Syllogisms & Categorical Propositions'

    # 5. Seating & Linear/Circular Arrangements
    if any(w in text for w in ['sitting around a circular table', 'sitting in a row', 'standing in a queue', 'seating arrangement', 'facing north and south']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.linear_circular_complex_seating_arrangements', 'Linear & Circular Seating Arrangements'

    # 6. Blood Relations
    if any(w in text for w in ['brother of', 'sister of', 'mother of', 'father of', 'son of', 'daughter of', 'how is a related to b', 'maternal uncle', 'paternal uncle']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.blood_relations_family_trees_coded_relations', 'Blood Relations & Family Trees'

    # 7. Direction Sense
    if any(w in text for w in ['walks towards north', 'turns to his right', 'turns to his left', 'facing east', 'starting point', 'direction of']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.direction_distance_sense_shadows', 'Direction Sense & Cardinal Movements'

    # 8. Clocks & Calendars
    if any(w in text for w in ['hands of a clock', 'clock shows', 'minute hand and hour hand', 'faulty clock']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.clocks_angle_coincidence_faulty_clocks', 'Clocks & Time Angle Calculations'
    if any(w in text for w in ['calendar', 'day of the week', 'leap year', 'odd days', 'which day will fall on']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.calendar_odd_days_leap_years_repetition', 'Calendar & Day Calculation'

    # 9. Coding-Decoding & Matrix Substitution
    if any(w in text for w in ['is coded as', 'in a certain code language', 'written as', 'code for']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution', 'Coding-Decoding & Substitution Logic'

    # 10. Cubes & Dice
    if any(w in text for w in ['painted cube', 'faces of a dice', 'dots on the opposite face', 'smaller cubes']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.cubes_dice_folding_nets_painting', 'Cubes & Dice'

    # 11. Order & Ranking
    if any(w in text for w in ['taller than', 'heavier than', 'ranks', 'from the top', 'from the bottom', 'shortest of all']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.order_ranking_comparative_arrangements', 'Order, Ranking & Comparative Arrangements'

    # 12. Permutation & Combination / Probability
    if any(w in text for w in ['how many ways', 'combinations', 'permutations', 'in how many different ways', 'selection of']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.fundamental_counting_principle_permutations', 'Permutations & Counting Principles'
    if any(w in text for w in ['probability of', 'drawn at random', 'chance of winning']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.probability_events_conditional_bayes', 'Probability & Random Events'

    # 13. Time, Work & Cisterns
    if any(w in text for w in ['can do a piece of work', 'can finish the work in', 'pipes a and b', 'cistern', 'leak in the tank']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_and_work_pipes_and_cisterns', 'Time & Work, Pipes & Cisterns'

    # 14. Speed, Distance & Trains / Boats
    if any(w in text for w in ['km/h', 'kmph', 'speed of a train', 'train crosses', 'boat upstream', 'boat downstream', 'speed of stream']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains', 'Speed, Time & Distance (Trains & Motion)'

    # 15. Profit, Loss, Discount & Interest
    if any(w in text for w in ['profit of', 'loss of', 'cost price', 'selling price', 'marked price', 'discount of']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.profit_loss_marked_price_discounts', 'Profit, Loss & Discounts'
    if any(w in text for w in ['simple interest', 'compound interest', 'rate of interest', 'sum of money doubles']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_interest_installments', 'Simple & Compound Interest'

    # 16. Percentages & Averages
    if any(w in text for w in ['average age of', 'average weight', 'average marks', 'average of numbers']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation', 'Averages & Weighted Averages'
    if any(w in text for w in ['ratio of', 'proportional to', 'partners in a business', 'ratio of ages']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_variations_partnerships', 'Ratio, Proportion & Partnerships'
    if any(w in text for w in ['percent', 'percentage of', 'increased by', 'decreased by']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.percentages_successive_change', 'Percentages & Percentage Change'

    # 17. Number System & Remainders
    if any(w in text for w in ['remainder when', 'divided by', 'unit digit', 'divisibility', 'prime number', 'divisor', 'hcf', 'lcm', 'natural numbers', 'integers']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules', 'Number System & Divisibility Rules'

    # 18. Geometry & Mensuration
    if any(w in text for w in ['triangle', 'rectangle', 'square', 'circle', 'radius', 'perimeter', 'cylinder', 'sphere', 'cone', 'surface area', 'volume']):
        return 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons', '2D & 3D Mensuration & Geometry'

    # Fallback to closest CSAT node via token overlap
    q_tokens = set(re.findall(r'[a-z0-9]{3,}', text))
    best_nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules'
    best_score = -1
    for candidate in csat_node_index:
        sc = len(candidate['tokens'].intersection(q_tokens))
        if sc > best_score:
            best_score = sc
            best_nid = candidate['nid']
            
    return best_nid, nodes[best_nid].get('name', 'General Mental Ability')

if __name__ == '__main__':
    with open('src/data/upsc_pyq/csat/2013_csat.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
        
    print(f"Testing on 2013_csat.json ({len(data)} questions):")
    for q in data[:15]:
        nid, sub_name = classify_csat_question(q)
        qn = q['question_number']
        is_pass = bool(q.get('passage_english'))
        txt = q['question_english'][:60].replace('\n', ' ')
        print(f"Q{qn:2d} (pass={is_pass}): {txt}")
        print(f"   -> {nid}")
        print(f"   -> Sub: {sub_name}\n")
