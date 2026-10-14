import json
import glob
import os
import re

kea_dir = 'src/data/kea'
kea_files = sorted(glob.glob(os.path.join(kea_dir, '*.json')))

print(f"Scanning {len(kea_files)} KEA files for images in options...\n")

option_keys = [
    'option_1_english', 'option_2_english', 'option_3_english', 'option_4_english',
    'option_1_kannada', 'option_2_kannada', 'option_3_kannada', 'option_4_kannada'
]

img_patterns = re.compile(r'(\.png|\.jpg|\.jpeg|\.gif|\.svg|<img|data:image|http.*?\.(png|jpg|jpeg)|\[image|\bimg\b)', re.IGNORECASE)

questions_with_option_images = []
questions_with_q_image = []
all_keys_with_image = set()

for fpath in kea_files:
    fname = os.path.basename(fpath)
    with open(fpath, 'r', encoding='utf-8') as f:
        data = json.load(f)
        
    for q in data:
        qn = q.get('question_number')
        yr = q.get('year')
        
        # Check all keys in q for any mention of image
        for k, v in q.items():
            if 'image' in k.lower():
                all_keys_with_image.add(k)
                if v:
                    questions_with_q_image.append((fname, yr, qn, k, str(v)[:80]))
                    
        # Check option texts
        found_in_options = []
        for opt_key in option_keys:
            val = q.get(opt_key)
            if val and isinstance(val, str) and img_patterns.search(val):
                found_in_options.append((opt_key, val[:100]))
                
        if found_in_options:
            questions_with_option_images.append((fname, yr, qn, found_in_options, q.get('question_english', '')[:80]))

print(f"Keys mentioning 'image' across all KEA questions: {all_keys_with_image}")
print(f"Questions with 'image_url' (or other image field) populated: {len(questions_with_q_image)}")
if questions_with_q_image:
    print("\nSample populated image fields:")
    for x in questions_with_q_image[:5]:
        print(f"  [{x[0]} Q{x[2]} ({x[1]})] Key: '{x[3]}' -> {x[4]}")

print(f"\nQuestions with image patterns detected in options: {len(questions_with_option_images)}")
if questions_with_option_images:
    print("\nDetailed list of questions with images in options:")
    for x in questions_with_option_images[:20]:
        print(f"  [{x[0]} Q{x[2]} ({x[1]})]:")
        print(f"    Q: {x[4]}")
        for opt_k, opt_v in x[3]:
            print(f"    {opt_k}: {opt_v}")
