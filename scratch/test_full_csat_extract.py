import json
import re

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    questions = json.load(f)

en_patterns = [
    r'With reference to the above passage',
    r'Based on the above passage',
    r'On the basis of the above passage',
    r'Which one of the following',
    r'Which of the following',
    r'In the context of the above passage',
    r'In the context of India',
    r'According to the above passage',
    r'According to the passage',
    r'The author\'s central focus',
    r'What is the most logical'
]

hi_patterns = [
    r'उपर्युक्त (?:परिच्छेद|गद्यांश)',
    r'इस (?:परिच्छेद|गद्यांश) से',
    r'निम्नलिखित में से कौन-सा|निम्नलिखित में से कौन सा|निम्नलिखित में से कौन से',
    r'निम्न कथनों में से',
    r'उपर्युक्त में से कौन-सा|उपर्युक्त में से कौन सा|उपर्युक्त में से कौन से',
    r'भारत के संदर्भ में',
    r'लेखक के अनुसार',
    r'इस परिच्छेद का मुख्य',
    r'परिच्छेद द्वारा संप्रेषित'
]

rc_count = 0
results = []

for q in questions:
    qe = q.get('question_english', '')
    qh = q.get('question_hindi', '')
    qn = q['question_number']

    if 'Passage' in qe or 'Directions' in qe:
        rc_count += 1
        
        # English split
        lines_e = qe.strip().split('\n')
        split_e_idx = -1
        for i, l in enumerate(lines_e):
            l_clean = l.strip()
            for pat in en_patterns:
                if re.search(pat, l_clean, re.IGNORECASE):
                    split_e_idx = i
                    break
            if split_e_idx != -1:
                break
        
        # Hindi split
        lines_h = qh.strip().split('\n')
        split_h_idx = -1
        for i, l in enumerate(lines_h):
            l_clean = l.strip()
            for pat in hi_patterns:
                if re.search(pat, l_clean):
                    split_h_idx = i
                    break
            if split_h_idx != -1:
                break
        
        if split_e_idx == -1 or split_h_idx == -1:
            print(f"FAILED on Q{qn}: split_e={split_e_idx}, split_h={split_h_idx}")
        else:
            pass_e = '\n'.join(lines_e[:split_e_idx]).strip()
            q_stmt_e = '\n'.join(lines_e[split_e_idx:]).strip()
            pass_h = '\n'.join(lines_h[:split_h_idx]).strip()
            q_stmt_h = '\n'.join(lines_h[split_h_idx:]).strip()
            results.append((qn, pass_e, q_stmt_e, pass_h, q_stmt_h))

print(f"Total RC questions processed: {len(results)} / {rc_count}")
