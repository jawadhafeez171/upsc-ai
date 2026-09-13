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

updated_count = 0

for q in questions:
    qe = q.get('question_english', '')
    qh = q.get('question_hindi', '')
    
    if ('Passage' in qe or 'Directions' in qe) and not q.get('passage_english'):
        lines_e = qe.strip().split('\n')
        idx_e = -1
        for i, l in enumerate(lines_e):
            if any(re.search(pat, l.strip(), re.I) for pat in en_patterns):
                idx_e = i
                break
        
        lines_h = qh.strip().split('\n')
        idx_h = -1
        for i, l in enumerate(lines_h):
            if any(re.search(pat, l.strip()) for pat in hi_patterns):
                idx_h = i
                break
        
        if idx_e != -1 and idx_h != -1:
            q['passage_english'] = '\n'.join(lines_e[:idx_e]).strip()
            q['question_english'] = '\n'.join(lines_e[idx_e:]).strip()
            q['passage_hindi'] = '\n'.join(lines_h[:idx_h]).strip()
            q['question_hindi'] = '\n'.join(lines_h[idx_h:]).strip()
            updated_count += 1
        else:
            q['passage_english'] = ''
            q['passage_hindi'] = ''
    else:
        if 'passage_english' not in q:
            q['passage_english'] = ''
        if 'passage_hindi' not in q:
            q['passage_hindi'] = ''

with open('src/data/upsc_pyq/csat/2020_csat.json', 'w', encoding='utf-8') as f:
    json.dump(questions, f, indent=4, ensure_ascii=False)

print(f"Updated {updated_count} CSAT questions in 2020_csat.json with passage_english and passage_hindi!")
