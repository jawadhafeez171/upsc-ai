# -*- coding: utf-8 -*-
import json
import re
import sys

sys.stdout.reconfigure(encoding='utf-8')

# Fix in scripts/enrich_pc_pyq.py
with open('scripts/enrich_pc_pyq.py', 'r', encoding='utf-8') as f:
    code = f.read()

fixed_code = code.replace('ಅಂತಾರಾಷ್ಟ್ರೀಯ संबंधಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು')
with open('scripts/enrich_pc_pyq.py', 'w', encoding='utf-8') as f:
    f.write(fixed_code)

print("Fixed scripts/enrich_pc_pyq.py.")

# Fix in src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json
with open('src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json', 'r', encoding='utf-8') as f:
    nhk_text = f.read()

fixed_nhk = nhk_text.replace('ಅಂತಾರಾಷ್ಟ್ರೀಯ संबंधಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು')
with open('src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json', 'w', encoding='utf-8') as f:
    f.write(fixed_nhk)

print("Fixed src/data/upsc_pyq/pc/nhk_dar_pc_2026_sept.json.")
