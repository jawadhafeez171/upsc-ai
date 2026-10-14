import sys
sys.stdout.reconfigure(encoding='utf-8')

with open('scripts/classify_ksp_pc.py', encoding='utf-8') as f:
    lines = f.readlines()

for idx, line in enumerate(lines):
    if any(k in line for k in ['indian_space_programme_isro_missions', 'ಗುರು', 'ಗ್ರಹ', 'ಮಂಗಳ', 'ರಾ']):
        print(f"Line {idx+1}: {line.strip()[:100]}")
