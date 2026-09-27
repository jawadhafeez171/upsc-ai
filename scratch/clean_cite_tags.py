import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

def clean_text(text):
    if not isinstance(text, str):
        return text
    # Remove cite tags and any immediate preceding space
    cleaned = re.sub(r'\s*\[cite[^\]]*\]', '', text)
    # Also in case [cite: X] was preceded by nothing and followed by a space
    cleaned = re.sub(r'\[cite[^\]]*\]\s*', '', cleaned)
    return cleaned

def clean_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
        
    removed_count = 0
    for q in data:
        for key in ['explanation_english', 'explanation_hindi']:
            if key in q and q[key]:
                orig = q[key]
                cleaned = clean_text(orig)
                matches = re.findall(r'\[cite[^\]]*\]', orig, re.IGNORECASE)
                removed_count += len(matches)
                q[key] = cleaned
                
        # Also clean in question or options if any
        for key in ['question_english', 'question_hindi', 'option_a_english', 'option_b_english', 'option_c_english', 'option_d_english', 'option_a_hindi', 'option_b_hindi', 'option_c_hindi', 'option_d_hindi']:
            if key in q and q[key]:
                q[key] = clean_text(q[key])
                
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(data, f, ensure_ascii=False, indent=2)
        
    return len(data), removed_count

for year in [2011, 2012]:
    fp = f"src/data/upsc_pyq/{year}.json"
    total_q, removed = clean_file(fp)
    print(f"Cleaned {year}.json: Removed {removed} [cite] tags across {total_q} questions.")
