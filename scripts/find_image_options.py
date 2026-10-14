import json
import glob
import os
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

kea_dir = 'src/data/kea'
kea_files = sorted(glob.glob(os.path.join(kea_dir, '*.json')))

image_options_questions = []

for fpath in kea_files:
    fname = os.path.basename(fpath)
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        qn = q.get('question_number')
        yr = q.get('year')
        img = q.get('image_url')
        
        opts = [str(q.get(f'option_{i}_english') or '').strip() for i in range(1, 5)]
        opts_kn = [str(q.get(f'option_{i}_kannada') or '').strip() for i in range(1, 5)]
        
        # Check patterns where options refer to figure/image/box/option A/B/C/D
        is_fig_option = False
        reasons = []
        for i, opt in enumerate(opts):
            # E.g. "Figure (1)", "(a)", "Fig. 1", "Option A", "Image 1", etc.
            if re.search(r'^(figure|\(?[a-d1-4]\)?|fig\.?|image|box\s+[a-d1-4]|pattern\s+[a-d1-4])', opt, re.IGNORECASE):
                reasons.append(f"Opt{i+1}: '{opt}'")
                is_fig_option = True
            elif opt.lower() in ['(1)', '(2)', '(3)', '(4)', '(a)', '(b)', '(c)', '(d)', 'a', 'b', 'c', 'd', '1', '2', '3', '4', '']:
                reasons.append(f"Opt{i+1} short/symbolic: '{opt}'")
                is_fig_option = True
                
        # Also check if image_url is present AND question mentions options in figure
        q_text = (q.get('question_english', '') + ' ' + q.get('question_kannada', '')).lower()
        if img and any(w in q_text for w in ['from the options', 'which of the following figure', 'select the figure', 'answer figure', 'options (refer', 'options:']):
            is_fig_option = True
            reasons.append("Question mentions options in figure/image")
            
        if is_fig_option and img:
            image_options_questions.append({
                'file': fname,
                'qnum': qn,
                'year': yr,
                'image_url': img,
                'question': q.get('question_english', '')[:90],
                'opts': opts,
                'opts_kn': opts_kn,
                'reasons': reasons[:3]
            })

print(f"Total Questions where options are embedded in the image / refer to figures: {len(image_options_questions)}")
print("=" * 80)
for idx, item in enumerate(image_options_questions):
    print(f"[{idx+1}] File: {item['file']} | Year: {item['year']} | Q{item['qnum']}")
    print(f"  Image URL: {item['image_url']}")
    print(f"  Question:  {item['question']}")
    print(f"  En Opts:   {item['opts']}")
    print(f"  Kn Opts:   {item['opts_kn']}")
    print(f"  Reasons:   {item['reasons']}")
    print("-" * 80)
