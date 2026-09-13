# -*- coding: utf-8 -*-
import sqlglot

with open('supabase_migration_pc_pyq.sql', 'r', encoding='utf-8') as f:
    sql = f.read()

print("Parsing supabase_migration_pc_pyq.sql with sqlglot (postgres dialect)...")
try:
    parsed = sqlglot.parse(sql, read='postgres')
    print(f"Successfully parsed {len(parsed)} expressions!")
    for idx, expr in enumerate(parsed, 1):
        if expr is None:
            print(f"Expression {idx} is None!")
except Exception as e:
    print("Parsing error:", e)
