# -*- coding: utf-8 -*-
with open('supabase_migration_pc_pyq.sql', 'r', encoding='utf-8') as f:
    text = f.read()

print("Checking for \\' in SQL:", "\\'" in text)
print("Checking for \\\" in SQL:", '\\"' in text)
print("Count of \\':", text.count("\\'"))
print("Count of \\\":", text.count('\\"'))

lines = text.split('\n')
for idx, line in enumerate(lines, 1):
    if "\\'" in line:
        print(f"Line {idx} has \\': {line[:100]}...")
