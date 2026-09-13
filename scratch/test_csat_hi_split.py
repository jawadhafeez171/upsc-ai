import json
import re

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    data = json.load(f)

# In Hindi, questions usually end the passage and start with:
# निम्नलिखित गद्यांश को पढ़िए...
# परिच्छेद-X ...
# Question starters:
# उपर्युक्त परिच्छेद/गद्यांश, निम्नलिखित कथनों, लेखक का मुख्य, इस परिच्छेद से कौन सा, भारत के संदर्भ में, आदि
hi_question_patterns = [
    r'(उपर्युक्त (?:परिच्छेद|गद्यांश))',
    r'(इस (?:परिच्छेद|गद्यांश) से)',
    r'(निम्नलिखित में से कौन-सा|निम्नलिखित में से कौन सा|निम्नलिखित में से कौन से)',
    r'(उपर्युक्त में से कौन-सा|उपर्युक्त में से कौन सा|उपर्युक्त में से कौन से)',
    r'(भारत के संदर्भ में)',
    r'(लेखक के अनुसार)',
    r'(इस परिच्छेद का मुख्य)'
]

for q in data:
    qh = q.get('question_hindi', '')
    if 'परिच्छेद' in qh or 'गद्यांश' in qh or 'निर्देश' in qh:
        qn = q['question_number']
        lines = qh.strip().split('\n')
        q_idx = -1
        for i, l in enumerate(lines):
            for pat in hi_question_patterns:
                if re.search(pat, l.strip()):
                    q_idx = i
                    break
            if q_idx != -1:
                break
        if q_idx != -1:
            pass_lines = [line.strip() for line in lines[:q_idx] if line.strip()]
            q_lines = [line.strip() for line in lines[q_idx:] if line.strip()]
            print(f"Q{qn}: [HI PASSAGE LEN={len(''.join(pass_lines))}] [HI Q_STMT LEN={len(''.join(q_lines))}]")
        else:
            print(f"Q{qn}: FAILED TO SPLIT HI")
