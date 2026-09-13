# -*- coding: utf-8 -*-
import sys

with open('supabase_migration_pc_pyq.sql', 'r', encoding='utf-8') as f:
    text = f.read()

# Let's check statements
statements = []
current = []
in_str = False
i = 0
n = len(text)

while i < n:
    ch = text[i]
    if in_str:
        if ch == "'":
            if i + 1 < n and text[i + 1] == "'":
                current.append("''")
                i += 2
                continue
            else:
                in_str = False
                current.append("'")
                i += 1
                continue
        current.append(ch)
        i += 1
    else:
        # check comments
        if ch == '-' and i + 1 < n and text[i + 1] == '-':
            end_nl = text.find('\n', i)
            if end_nl == -1:
                break
            i = end_nl + 1
            continue
        # check dollar quotes
        if ch == '$' and i + 1 < n and text[i + 1] == '$':
            # find next $$
            end_dollar = text.find('$$', i + 2)
            if end_dollar != -1:
                current.append(text[i:end_dollar + 2])
                i = end_dollar + 2
                continue
        if ch == "'":
            in_str = True
            current.append("'")
            i += 1
            continue
        if ch == ';':
            stmt = ''.join(current).strip()
            if stmt:
                statements.append(stmt)
            current = []
            i += 1
            continue
        current.append(ch)
        i += 1

stmt = ''.join(current).strip()
if stmt:
    statements.append(stmt)

print(f"Parsed {len(statements)} top-level statements.")
for idx, s in enumerate(statements, 1):
    first_words = s[:60].replace('\n', ' ')
    print(f"Stmt {idx}: length {len(s)}: {first_words}...")
