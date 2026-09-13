import json
import re

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    data = json.load(f)

def parse_csat_question(qe):
    # Check if there is a passage pattern
    # Usually:
    # Directions...
    # Passage-X
    # <passage body>
    # <question statement> (e.g. Which one of the following..., With reference to..., Based on the...)
    if not ('Passage' in qe or 'Directions' in qe):
        return None, qe

    lines = qe.strip().split('\n')
    
    # Let's find where the passage starts and where the actual question starts
    # Common question starters:
    # "Which of the following", "Which one of the following", "With reference to the above passage",
    # "Based on the above passage", "On the basis of the above passage", "In the context of",
    # "According to the passage", "The author of the passage", "What is the most logical"
    question_patterns = [
        r'^(With reference to the above passage)',
        r'^(Based on the above passage)',
        r'^(On the basis of the above passage)',
        r'^(Which one of the following)',
        r'^(Which of the following)',
        r'^(In the context of the above passage)',
        r'^(According to the above passage)',
        r'^(According to the passage)',
        r'^(The author\'s central focus)',
        r'^(What is the most logical)'
    ]

    # Let's inspect where the split happens
    q_start_idx = -1
    for i, line in enumerate(lines):
        line_clean = line.strip()
        for pat in question_patterns:
            if re.search(pat, line_clean, re.IGNORECASE):
                q_start_idx = i
                break
        if q_start_idx != -1:
            break

    if q_start_idx != -1:
        passage_part = '\n'.join(lines[:q_start_idx]).strip()
        question_part = '\n'.join(lines[q_start_idx:]).strip()
        return passage_part, question_part
    return None, qe

for q in data:
    qe = q.get('question_english', '')
    if 'Passage' in qe or 'Directions' in qe:
        qn = q['question_number']
        passage, question_stmt = parse_csat_question(qe)
        if passage:
            first_p_line = [l for l in passage.split('\n') if l.strip()][:2]
            first_q_line = [l for l in question_stmt.split('\n') if l.strip()][:1]
            print(f"Q{qn}: [PASSAGE LEN={len(passage)}] -> {first_p_line} | [Q_STMT] -> {first_q_line}")
        else:
            print(f"Q{qn}: FAILED TO SPLIT")
