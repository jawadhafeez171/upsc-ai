# -*- coding: utf-8 -*-
import sys

with open('supabase_migration_pc_pyq.sql', 'r', encoding='utf-8') as f:
    sql = f.read()

# Let's check for unescaped quotes or syntax issues
# In PostgreSQL, string literals start with ' and end with ' (unless dollar-quoted).
# If a string has an unescaped single quote, the quote closes early, and the next word is treated as an identifier.
# If that word is "the" or has quotes like "the", Postgres says: relation "the" does not exist!

print("Scanning for 'the' as an identifier outside of quotes...")
# Let's tokenize or find every occurrence of the word 'the' and see if it's inside or outside string literal.

in_string = False
escape = False
i = 0
n = len(sql)
tokens = []
curr = []
line = 1
col = 1

while i < n:
    ch = sql[i]
    if ch == '\n':
        line += 1
        col = 1
    else:
        col += 1

    if in_string:
        if ch == "'":
            # Check for double single quote ''
            if i + 1 < n and sql[i + 1] == "'":
                i += 2
                col += 1
                continue
            else:
                in_string = False
                i += 1
                continue
        i += 1
    else:
        # Check comment
        if ch == '-' and i + 1 < n and sql[i + 1] == '-':
            # line comment
            end_nl = sql.find('\n', i)
            if end_nl == -1:
                break
            line += 1
            col = 1
            i = end_nl + 1
            continue
        if ch == "'":
            in_string = True
            i += 1
            continue
        
        # We are OUTSIDE string literal!
        # Let's check what words appear here
        if ch.isalpha() or ch == '"':
            start_i = i
            start_line = line
            start_col = col
            while i < n and (sql[i].isalnum() or sql[i] in '_"'):
                i += 1
                col += 1
            word = sql[start_i:i]
            if word.lower() in ['the', '"the"']:
                print(f"FOUND 'the' OUTSIDE STRING LITERAL at line {start_line}, col {start_col}!")
                print(f"Context: {sql[max(0, start_i - 100):min(n, start_i + 100)]}")
            continue
        i += 1

print("Scan complete.")
