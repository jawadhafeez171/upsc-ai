import json
import re
import sys

# Ensure UTF-8 output encoding for Windows terminal
sys.stdout.reconfigure(encoding='utf-8')

def audit_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        data = json.load(f)
        
    stats = {
        'total_questions': len(data),
        'questions_with_cite': set(),
        'field_counts': {},
        'tag_samples': set(),
        'by_question': {}
    }
    
    for q in data:
        qnum = q.get('question_number')
        for field, val in q.items():
            if isinstance(val, str) and '[cite' in val.lower():
                matches = re.findall(r'\[cite[^\]]*\]', val, re.IGNORECASE)
                if matches:
                    stats['questions_with_cite'].add(qnum)
                    stats['field_counts'][field] = stats['field_counts'].get(field, 0) + len(matches)
                    for m in matches:
                        stats['tag_samples'].add(m)
                    if qnum not in stats['by_question']:
                        stats['by_question'][qnum] = {}
                    stats['by_question'][qnum][field] = len(matches)
            elif isinstance(val, list):
                for idx, item in enumerate(val):
                    if isinstance(item, str) and '[cite' in item.lower():
                        matches = re.findall(r'\[cite[^\]]*\]', item, re.IGNORECASE)
                        if matches:
                            stats['questions_with_cite'].add(qnum)
                            key = f"{field}[{idx}]"
                            stats['field_counts'][key] = stats['field_counts'].get(key, 0) + len(matches)
                            for m in matches:
                                stats['tag_samples'].add(m)
                            if qnum not in stats['by_question']:
                                stats['by_question'][qnum] = {}
                            stats['by_question'][qnum][key] = len(matches)
                            
    return stats

for year in [2011, 2012]:
    fp = f"src/data/upsc_pyq/{year}.json"
    stats = audit_file(fp)
    print(f"\n=======================================================")
    print(f"File: {year}.json")
    print(f"Total Questions affected: {len(stats['questions_with_cite'])} / {stats['total_questions']}")
    print(f"Total [cite] tag occurrences across fields: {sum(stats['field_counts'].values())}")
    print(f"Breakdown by field:")
    for fld, cnt in sorted(stats['field_counts'].items()):
        print(f"   - {fld}: {cnt} tags")
    print(f"Sample cite tags found: {sorted(list(stats['tag_samples']))[:15]}")
    q_list = sorted(list(stats['questions_with_cite']))
    print(f"Affected Questions: Q{q_list[0]} to Q{q_list[-1]} (Total: {len(q_list)} questions)")
