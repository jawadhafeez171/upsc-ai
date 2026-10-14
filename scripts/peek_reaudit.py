import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('scripts/reaudit_ksp_pc.py', 'r', encoding='utf-8') as f:
    lines = f.readlines()

print(f"Total lines in reaudit_ksp_pc.py: {len(lines)}")
for idx, line in enumerate(lines[:80]):
    print(f"{idx+1:3d}: {line.rstrip()}")
