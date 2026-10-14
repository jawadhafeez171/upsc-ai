import json
import glob
import os
import re

kea_dir = 'src/data/kea'
kea_files = sorted(glob.glob(os.path.join(kea_dir, '*.json')))

# 1. Inspect questions where image_url is populated
image_url_samples = []
for fpath in kea_files:
    fname = os.path.basename(fpath)
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        img = q.get('image_url')
        if img:
            image_url_samples.append({
                'file': fname,
                'qnum': q.get('question_number'),
                'year': q.get('year'),
                'image_url': img,
                'question': q.get('question_english', '')[:100],
                'opt1': q.get('option_1_english'),
                'opt2': q.get('option_2_english'),
                'opt3': q.get('option_3_english'),
                'opt4': q.get('option_4_english'),
            })

print(f"Total questions with image_url populated: {len(image_url_samples)}")
print("\nSample 10 questions with image_url and their options:")
for s in image_url_samples[:10]:
    print(f"[{s['file']} Q{s['qnum']} ({s['year']})]")
    print(f"  URL: {s['image_url']}")
    print(f"  Q:   {s['question']}")
    print(f"  Opt1: '{s['opt1']}' | Opt2: '{s['opt2']}' | Opt3: '{s['opt3']}' | Opt4: '{s['opt4']}'")
    print()

# 2. Check if any questions have options referencing figures or images
fig_in_options = []
fig_words = re.compile(r'\b(figure|fig|diagram|image|pattern|shown\s+in|box\s+[a-d]|shape)\b', re.IGNORECASE)

for fpath in kea_files:
    fname = os.path.basename(fpath)
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        for opt_key in ['option_1_english', 'option_2_english', 'option_3_english', 'option_4_english']:
            opt_val = str(q.get(opt_key) or '')
            if fig_words.search(opt_val):
                fig_in_options.append((fname, q.get('question_number'), opt_key, opt_val, q.get('image_url'), q.get('question_english', '')[:70]))
                break

print(f"Questions where options mention figure/diagram/image/pattern: {len(fig_in_options)}")
for x in fig_in_options[:10]:
    print(f"  [{x[0]} Q{x[1]}] Option '{x[2]}': '{x[3]}' | image_url: {x[4]}")
    print(f"    Q: {x[5]}")

# 3. Check for questions where options are just letters or empty or symbols while question has an image
symbol_opts = []
for s in image_url_samples:
    opts = [str(s[f'opt{i}'] or '').strip() for i in range(1, 5)]
    if any(len(o) <= 3 or o.lower() in ['a', 'b', 'c', 'd', '1', '2', '3', '4', '(a)', '(b)', '(c)', '(d)', '(1)', '(2)', '(3)', '(4)'] for o in opts):
        symbol_opts.append(s)

print(f"\nQuestions with image_url where options are short/symbolic (e.g. A, B, C, D / 1, 2, 3, 4): {len(symbol_opts)}")
for x in symbol_opts[:10]:
    print(f"  [{x['file']} Q{x['qnum']}] Opts: {[x[f'opt{i}'] for i in range(1, 5)]} | URL: {x['image_url']}")
    print(f"    Q: {x['question']}")
