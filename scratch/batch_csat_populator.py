import json
import re
import os
import sys

# Ensure UTF-8 output
sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph_civil_services.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)

nodes = kg['nodes']
valid_nids = set(nodes.keys())

CSAT_DOMAINS = {
    'reading_comprehension_interpersonal_skills': (
        'Reading Comprehension & Interpersonal Skills',
        'बोधगम्यता एवं अंतर-वैयक्तिक कौशल'
    ),
    'quantitative_aptitude_basic_numeracy': (
        'Quantitative Aptitude & Basic Numeracy',
        'मात्रात्मक अभिरुचि एवं बुनियादी संख्यात्मकता'
    ),
    'general_mental_ability_logical_reasoning': (
        'General Mental Ability & Logical Reasoning',
        'सामान्य मानसिक योग्यता एवं तार्किक क्षमता'
    )
}

SUBTOPIC_HINDI_MAP = {
    'Passage Inference & Central Idea': 'परिच्छेद निष्कर्ष एवं केंद्रीय भाव',
    'Passage Inference & Logical Corollary': 'परिच्छेद निष्कर्ष एवं तार्किक परिणाम',
    'Assumption Testing in Passage': 'परिच्छेद में निहित पूर्वधारणाएँ',
    'Central Idea & Crux of Passage': 'परिच्छेद का केंद्रीय भाव एवं मूल संदेश',
    'Strengthening & Weakening Arguments': 'तर्कों का सुदृढ़ीकरण एवं दुर्बलीकरण',
    'Administrative Decision Making & Situational Judgement': 'प्रशासनिक निर्णय निर्माण एवं समस्या समाधान',
    'Data Sufficiency Evaluation': 'आँकड़ों की पर्याप्तता',
    'Tabular Data Interpretation': 'सारणीबद्ध आँकड़ा व्याख्या',
    'Pie Charts Data Interpretation': 'पाई चार्ट आँकड़ा व्याख्या',
    'Bar Charts Data Interpretation': 'दंड आरेख (बार चार्ट) आँकड़ा व्याख्या',
    'Syllogisms & Categorical Logic': 'न्याय वाक्य एवं तार्किक निष्कर्ष',
    'Seating Arrangements & Order Puzzles': 'बैठक व्यवस्था एवं पहेलियाँ',
    'Blood Relations & Family Trees': 'रक्त संबंध एवं पारिवारिक संबंध',
    'Direction Sense & Cardinal Movements': 'दिशा ज्ञान एवं दूरी परीक्षण',
    'Clocks & Time Angle Calculations': 'घड़ी एवं समय गणना',
    'Calendar & Day Calculation': 'कैलेंडर एवं दिन गणना',
    'Coding-Decoding & Substitution Logic': 'कूटलेखन-कूटवाचन (कोडिंग-डिकोडिंग)',
    'Cubes & Dice': 'घन एवं पासा',
    'Order, Ranking & Comparative Arrangements': 'क्रम निर्धारण एवं तुलनात्मक व्यवस्था',
    'Permutations & Counting Principles': 'क्रमचय एवं गणना के सिद्धांत',
    'Probability & Random Events': 'प्रायिकता एवं यादृच्छिक घटनाएँ',
    'Time & Work, Pipes & Cisterns': 'समय और कार्य, नल और टंकी',
    'Speed, Time & Distance (Trains & Motion)': 'गति, समय और दूरी (रेलगाड़ी एवं चाल)',
    'Profit, Loss & Discounts': 'लाभ, हानि एवं छूट',
    'Simple & Compound Interest': 'साधारण एवं चक्रवृद्धि ब्याज',
    'Percentages & Percentage Change': 'प्रतिशतता एवं प्रतिशत परिवर्तन',
    'Averages & Mixtures': 'औसत एवं मिश्रण',
    'Ratio, Proportion & Partnerships': 'अनुपात, समानुपात एवं साझेदारी',
    'Number System & Divisibility Rules': 'संख्या पद्धति एवं विभाज्यता नियम',
    '2D & 3D Mensuration & Geometry': 'क्षेत्रमिति एवं ज्यामिति'
}

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

def classify_csat_question(q, year=None):
    passage = (q.get('passage_english') or '').strip()
    txt = (q.get('question_english') or '').strip()
    full_text = (passage + ' ' + txt).lower()
    
    # Check if passage is actually an analytical puzzle/scenario
    is_puzzle_passage = any(w in passage.lower() for w in [
        'five cities', 'cities p, q, r', 'team of four players', 'tennis coach',
        'six persons a, b, c', 'sitting in a row', 'circular table', 'p, q, r, s and t',
        'study the following table', 'graph represents', 'pie chart'
    ])

    # 1. Reading Comprehension (Authentic conceptual passages)
    if (passage and not is_puzzle_passage) or any(w in txt.lower() for w in [
        'author implies', 'crux of the passage', 'central focus of this passage', 'central idea of the passage',
        'most rational inference', 'logical corollary', 'assumption is made in the passage', 'author suggests'
    ]):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference'
        if any(w in txt.lower() for w in ['assumption', 'assumes', 'implicit']):
            sub = 'Assumption Testing in Passage'
        elif any(w in txt.lower() for w in ['strengthen', 'weaken']):
            nid = 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.critical_reasoning_analytical_ability.strengthening_weakening_arguments'
            sub = 'Strengthening & Weakening Arguments'
        elif any(w in txt.lower() for w in ['crux', 'central focus', 'central idea', 'essential message']):
            sub = 'Central Idea & Crux of Passage'
        else:
            sub = 'Passage Inference & Logical Corollary'
        return nid, sub, ['Reading Comprehension', sub]

    # 2. Administrative Decision Making (Pre-2015 Situational Judgement)
    if any(w in full_text for w in [
        'you are a district magistrate', 'you are a police officer', 'you are a municipal commissioner',
        'what would be your course of action', 'as a responsible officer', 'you receive a complaint',
        'you are in charge of'
    ]):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills.administrative_decision_making_crisis_management'
        return nid, 'Administrative Decision Making & Situational Judgement', ['Decision Making', 'Ethics in Administration']

    # 3. Data Sufficiency
    if any(w in full_text for w in [
        'which one of the following is correct in respect of the above question and the statements',
        'sufficient to answer the question', 'data sufficiency', 'statement-1 alone is sufficient'
    ]):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.data_sufficiency_evaluating_statements'
        return nid, 'Data Sufficiency Evaluation', ['Data Sufficiency', 'Statement Evaluation']

    # 4. Data Interpretation (Tables, Graphs, Charts)
    if any(w in full_text for w in ['study the following table', 'pie chart', 'bar chart', 'following graph represents', 'table shows']):
        if 'pie' in full_text:
            nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.pie_charts_percentage_degree_distribution'
            sub = 'Pie Charts Data Interpretation'
        elif 'bar' in full_text:
            nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.bar_charts_simple_grouped_stacked'
            sub = 'Bar Charts Data Interpretation'
        else:
            nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.tabular_di_and_missing_data_tables'
            sub = 'Tabular Data Interpretation'
        return nid, sub, ['Data Interpretation', sub]

    # 5. Syllogisms & Categorical Logic
    if any(w in full_text for w in ['all cats are', 'some dogs are', 'all men are', 'conclusions logically follow', 'which of the conclusions follow', 'syllogism', 'statements: 1.', 'statements: (i)']):
        if 'conclusion' in full_text or 'follow' in full_text:
            nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.syllogisms_venn_logical_deductions'
            return nid, 'Syllogisms & Categorical Logic', ['Logical Reasoning', 'Syllogisms']

    # 6. Seating & Linear/Circular Arrangements / Puzzle Puzzles
    if any(w in full_text for w in ['sitting around a circular table', 'sitting in a row', 'standing in a queue', 'seating arrangement', 'facing north and south', 'five cities', 'mode of transport', 'team will consist of', 'tennis coach']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.linear_circular_complex_seating_arrangements'
        return nid, 'Seating Arrangements & Order Puzzles', ['Logical Reasoning', 'Puzzles & Arrangements']

    # 7. Blood Relations
    if any(w in full_text for w in ['brother of', 'sister of', 'mother of', 'father of', 'son of', 'daughter of', 'how is a related to', 'maternal uncle', 'paternal uncle', 'family consists of']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.blood_relations_family_trees_coded_relations'
        return nid, 'Blood Relations & Family Trees', ['Logical Reasoning', 'Blood Relations']

    # 8. Direction Sense
    if any(w in full_text for w in ['walks towards north', 'turns to his right', 'turns to his left', 'facing east', 'starting point', 'direction from the starting']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.direction_distance_sense_shadows'
        return nid, 'Direction Sense & Cardinal Movements', ['Logical Reasoning', 'Direction Sense']

    # 9. Clocks & Calendars
    if any(w in full_text for w in ['hands of a clock', 'clock shows', 'minute hand and hour hand', 'faulty clock']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.clocks_angle_coincidence_faulty_clocks'
        return nid, 'Clocks & Time Angle Calculations', ['Logical Reasoning', 'Clocks']
    if any(w in full_text for w in ['calendar', 'day of the week', 'leap year', 'odd days', 'which day will fall on']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.calendar_odd_days_leap_years_repetition'
        return nid, 'Calendar & Day Calculation', ['Logical Reasoning', 'Calendars']

    # 10. Coding-Decoding & Matrix Substitution
    if any(w in full_text for w in ['is coded as', 'in a certain code language', 'written as', 'code for']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution'
        return nid, 'Coding-Decoding & Substitution Logic', ['Logical Reasoning', 'Coding-Decoding']

    # 11. Cubes & Dice
    if any(w in full_text for w in ['painted cube', 'faces of a dice', 'dots on the opposite face', 'smaller cubes']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.cubes_dice_folding_nets_painting'
        return nid, 'Cubes & Dice', ['Logical Reasoning', 'Cubes & Dice']

    # 12. Order & Ranking
    if any(w in full_text for w in ['taller than', 'heavier than', 'ranks', 'from the top', 'from the bottom', 'shortest of all']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.order_ranking_comparative_arrangements'
        return nid, 'Order, Ranking & Comparative Arrangements', ['Logical Reasoning', 'Ranking']

    # 13. Permutation & Combination / Probability / Counting
    if any(w in full_text for w in ['how many ways', 'combinations', 'permutations', 'in how many different ways', 'selection of', 'coins of different denominations']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.fundamental_counting_principle_permutations'
        return nid, 'Permutations & Counting Principles', ['Quantitative Aptitude', 'Combinatorics']
    if any(w in full_text for w in ['probability of', 'drawn at random', 'chance of winning']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.probability_events_conditional_bayes'
        return nid, 'Probability & Random Events', ['Quantitative Aptitude', 'Probability']

    # 14. Time, Work & Cisterns
    if any(w in full_text for w in ['can do a piece of work', 'can finish the work in', 'pipes a and b', 'cistern', 'leak in the tank']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_and_work_pipes_and_cisterns'
        return nid, 'Time & Work, Pipes & Cisterns', ['Quantitative Aptitude', 'Time & Work']

    # 15. Speed, Distance & Trains / Boats
    if any(w in full_text for w in ['km/h', 'kmph', 'speed of a train', 'train crosses', 'boat upstream', 'boat downstream', 'speed of stream']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains'
        return nid, 'Speed, Time & Distance (Trains & Motion)', ['Quantitative Aptitude', 'Time Speed Distance']

    # 16. Profit, Loss, Discount & Interest
    if any(w in full_text for w in ['profit of', 'loss of', 'cost price', 'selling price', 'marked price', 'discount of']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.profit_loss_marked_price_discounts'
        return nid, 'Profit, Loss & Discounts', ['Quantitative Aptitude', 'Profit & Loss']
    if any(w in full_text for w in ['simple interest', 'compound interest', 'rate of interest', 'sum of money doubles']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_interest_installments'
        return nid, 'Simple & Compound Interest', ['Quantitative Aptitude', 'Interest']

    # 17. Percentages & Averages
    if any(w in full_text for w in ['average age of', 'average weight', 'average marks', 'average of numbers', 'average of']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation'
        return nid, 'Averages & Mixtures', ['Quantitative Aptitude', 'Averages']
    if any(w in full_text for w in ['ratio of', 'proportional to', 'partners in a business', 'ratio of ages']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_variations_partnerships'
        return nid, 'Ratio, Proportion & Partnerships', ['Quantitative Aptitude', 'Ratio & Proportion']
    if any(w in full_text for w in ['percent', 'percentage of', 'increased by', 'decreased by']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.percentages_successive_change'
        return nid, 'Percentages & Percentage Change', ['Quantitative Aptitude', 'Percentages']

    # 18. Number System & Remainders
    if any(w in full_text for w in ['remainder when', 'divided by', 'unit digit', 'divisibility', 'prime number', 'divisor', 'hcf', 'lcm', 'natural numbers', 'integers']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules'
        return nid, 'Number System & Divisibility Rules', ['Quantitative Aptitude', 'Number System']

    # 19. Geometry & Mensuration
    if any(w in full_text for w in ['triangle', 'rectangle', 'square', 'circle', 'radius', 'perimeter', 'cylinder', 'sphere', 'cone', 'surface area', 'volume']):
        nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons'
        return nid, '2D & 3D Mensuration & Geometry', ['Quantitative Aptitude', 'Mensuration']

    # Fallback to closest CSAT node via token overlap
    q_tokens = set(re.findall(r'[a-z0-9]{3,}', full_text))
    best_nid = 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules'
    best_score = -1
    for candidate in csat_node_index:
        sc = len(candidate['tokens'].intersection(q_tokens))
        if sc > best_score:
            best_score = sc
            best_nid = candidate['nid']
            
    return best_nid, nodes[best_nid].get('name', 'General Mental Ability'), ['CSAT', 'Mental Ability']

def process_csat_file(filename):
    filepath = os.path.join('src/data/upsc_pyq/csat', filename)
    if not os.path.exists(filepath):
        print(f"File {filepath} not found.")
        return False
        
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
        
    year = data[0].get('year', filename.split('_')[0])
    invalid_count = 0
    updated_count = 0
    
    for q in data:
        qnum = q['question_number']
        nid, sub_title, custom_tags = classify_csat_question(q, year)
        
        if nid not in valid_nids:
            print(f"ERROR: {filename} Q{qnum} -> invalid node {nid}")
            invalid_count += 1
            continue
            
        node_data = nodes[nid]
        
        # Determine domain from 2nd segment of node_id
        parts = nid.split('.')
        dom_key = parts[1] if len(parts) > 1 else 'general_mental_ability_logical_reasoning'
        dom_eng, dom_hin = CSAT_DOMAINS.get(dom_key, ('General Mental Ability & Logical Reasoning', 'सामान्य मानसिक योग्यता एवं तार्किक क्षमता'))
        
        q['node_id'] = nid
        q['subject'] = 'General Mental Ability, Quantitative Aptitude & Comprehension'
        q['subject_hindi'] = 'सामान्य मानसिक योग्यता, मात्रात्मक अभिरुचि एवं बोधगम्यता'
        q['domain'] = dom_eng
        q['domain_hindi'] = dom_hin
        q['sub_topic'] = sub_title
        q['sub_topic_hindi'] = SUBTOPIC_HINDI_MAP.get(sub_title, '')
        
        if not q.get('difficulty'):
            q['difficulty'] = 'medium'
            
        # Enrich tags
        tags = ['PYQ', f'UPSC {year}', 'CSAT', 'Paper 2']
        for ct in custom_tags:
            if ct not in tags:
                tags.append(ct)
        q['tags'] = tags
        updated_count += 1
        
    if invalid_count > 0:
        print(f"FAILED {filename}: {invalid_count} invalid nodes.")
        return False
        
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=4)
        
    print(f"SUCCESS {filename}: {updated_count}/{len(data)} questions mapped and validated.")
    return True

if __name__ == '__main__':
    target_files = sys.argv[1:] if len(sys.argv) > 1 else [
        f for f in sorted(os.listdir('src/data/upsc_pyq/csat')) if f.endswith('.json')
    ]
    print(f"Processing CSAT files: {target_files}")
    for tf in target_files:
        process_csat_file(tf)
