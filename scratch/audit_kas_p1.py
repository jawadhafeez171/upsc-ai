import os
import json
import re

p1_files = [
    'kas_dec_p1_2011.json', 'kas_april_p1_2015.json', 'kas_aug_p1_2017.json',
    'kas_p1_2020.json', 'kas_aug_p1_2024.json', 'kas_dec_p1_2024.json'
]

kar_terms = [
    'cauvery', 'kaveri', 'krishna', 'sharavathi', 'tungabhadra', 'netravathi', 'bedthi',
    'jog falls', 'shivanasamudra', 'gokak', 'krs dam', 'almatti', 'western ghats', 'malnad', 'kodagu',
    'coorg', 'chikmagalur', 'hassan', 'mullayanagiri', 'kudremukh', 'bababudan', 'bandipur', 'nagarhole',
    'bhadra', 'bannerghatta', 'kolar gold', 'sandur', 'railway map', 'district of the state', 'agro-climatic'
]

general_map_terms = [
    'national park', 'wildlife sanctuary', 'biosphere reserve', 'tiger reserve', 'ramsar',
    'tributary', 'tributaries', 'river basin', 'confluence', 'mountain pass', 'glacier',
    'strait', 'gulf', 'sea bordering', 'red sea', 'black sea', 'caspian sea', 'mediterranean'
]

for f in p1_files:
    data = json.load(open(os.path.join('src/data', f), encoding='utf-8'))
    print(f"\n==================== {f} ====================")
    for q in data:
        qn = q['question_number']
        txt = (q.get('question_english') or '').lower()
        sub = (q.get('sub_topic') or '').lower()
        comb = txt + ' ' + sub
        is_map = q.get('is_mapping', False)
        
        k_matches = [t for t in kar_terms if t in comb]
        g_matches = [t for t in general_map_terms if t in comb]
        
        if k_matches or g_matches or is_map:
            print(f"Q{qn:2d} (map={is_map}) | K:{k_matches[:2]} G:{g_matches[:2]} | {q.get('sub_topic', '')[:45]}")
