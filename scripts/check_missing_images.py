import json
import glob
import os
import re

kea_dir = 'src/data/kea'
kea_files = sorted(glob.glob(os.path.join(kea_dir, '*.json')))

missing_images = []
fig_words = re.compile(r'\b(figure\s+(given|shown|below)|diagram\s+(given|shown|below)|shown\s+in\s+the\s+figure|refer\s+to\s+the\s+figure|venn\s+diagram|mirror\s+image|answer\s+figure)\b', re.IGNORECASE)

for fpath in kea_files:
    fname = os.path.basename(fpath)
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
    for q in data:
        qn = q.get('question_number')
        yr = q.get('year')
        img = q.get('image_url')
        
        q_text = q.get('question_english', '')
        opts_text = " ".join([str(q.get(f'option_{i}_english') or '') for i in range(1, 5)])
        
        # If question or options refer to a figure/diagram, but image_url is missing
        if not img:
            if fig_words.search(q_text) or any(re.search(r'^(figure\s+[a-d1-4]|diagram\s+[a-d1-4])', str(q.get(f'option_{i}_english') or ''), re.IGNORECASE) for i in range(1, 5)):
                missing_images.append((fname, yr, qn, q_text[:90], [q.get(f'option_{i}_english') for i in range(1, 5)]))

print(f"Questions referencing a figure/diagram/image where image_url is NULL: {len(missing_images)}")
if missing_images:
    print("\nSample questions where image_url is NULL but question/options refer to figures:")
    for x in missing_images[:10]:
        print(f"  [{x[0]} Q{x[2]} ({x[1]})]")
        print(f"    Q: {x[3]}")
        print(f"    Opts: {x[4]}")
