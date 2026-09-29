import json
import glob
import sys
import re

sys.stdout.reconfigure(encoding='utf-8')

capf_files = sorted(glob.glob('src/data/upsc_capf/*.json'))

gma_list = []
for fpath in capf_files:
    fname = fpath.split('\\')[-1].split('/')[-1]
    with open(fpath, encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        if q.get('subject') == "General Mental Ability, Quantitative Aptitude & Comprehension":
            gma_list.append((fname, q.get('year'), q.get('question_number'), q.get('question_english'), q))

print(f"Total GMA questions to inspect: {len(gma_list)}")

# Let's write an inspection script to print questions that DO NOT contain standard math/reasoning signs:
# Standard signs: numbers, digits, ?, math operators, code, ratio, percentage, speed, age, clock, etc.
math_reasoning_regex = re.compile(
    r'(\d+|%|\+|\-|\*|\/|=|\$|<|>|ratio|average|mean|median|mode|prime|triangle|rectangle|circle|cylinder|sphere|'
    r'cube|dice|speed|distance|km\/h|meter|train|work|days|fraction|numerator|denominator|perimeter|area|volume|'
    r'series|sequence|pattern|coded|code|coding|odd\s+one|analogy|puzzle|seating|ranking|tallest|heaviest|'
    r'brother|sister|father|mother|uncle|aunt|blood|venn|diagram|chart|graph|table|figure|matrix|direction|'
    r'north|south|east|west|degree|angle|clock|calendar|leap\s+year|syllogism|conclusion|premise)',
    re.IGNORECASE
)

potential_false_gma = []
for fname, y, qn, txt, q in gma_list:
    # Check if text or options look like GS
    # Let's inspect options and question
    full_text = (txt + ' ' + q.get('option_a_english', '') + ' ' + q.get('option_b_english', '')).lower()
    
    # Check for GS subject indicators:
    gs_match = []
    if any(k in full_text for k in ['act', 'amendment', 'article', 'constitution', 'commission', 'parliament', 'rajya sabha', 'lok sabha', 'fundamental right', 'writ']):
        gs_match.append('Polity')
    if any(k in full_text for k in ['buddha', 'jain', 'maurya', 'ashoka', 'mughal', 'sultan', 'british', 'chola', 'harappa', 'prinsep', 'phadke', 'permanent settlement', 'vedic']):
        gs_match.append('History')
    if any(k in full_text for k in ['river', 'basin', 'plateau', 'volcano', 'himalaya', 'ocean', 'trench', 'monsoon', 'strait', 'gulf', 'climate', 'soil']):
        gs_match.append('Geography')
    if any(k in full_text for k in ['dna', 'rna', 'gene', 'protein', 'enzyme', 'organism', 'cell', 'bacteria', 'virus', 'prokaryote', 'eukaryote', 'raster data', 'chlorophyll']):
        gs_match.append('Science')
    if any(k in full_text for k in ['gdp', 'inflation', 'repo rate', 'rbi', 'fiscal', 'monetary', 'wages', 'globalization', 'trade organization', 'wto', 'imf']):
        gs_match.append('Economy')
    if any(k in full_text for k in ['treaty', 'president in 2017', 'strategic partnership', 'poland', 'bilateral', 'ambassador']):
        gs_match.append('IR')

    if gs_match:
        potential_false_gma.append((fname, y, qn, gs_match, txt))

print(f"\nPotential False GMA questions detected: {len(potential_false_gma)}")
for fname, y, qn, gs, txt in potential_false_gma:
    print(f"[{fname} {y} Q{qn}] {gs}: {txt[:100]}...")
