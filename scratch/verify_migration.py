# -*- coding: utf-8 -*-
with open('supabase_migration_pc_pyq.sql', 'r', encoding='utf-8') as f:
    text = f.read()

hk_c = text.count("'pc-hk-2026-q")
nhk_c = text.count("'pc-nhk-2026-q")
print(f"HK questions in SQL: {hk_c}")
print(f"NHK questions in SQL: {nhk_c}")
print(f"Total questions in SQL: {hk_c + nhk_c}")
print(f"Has CREATE TABLE: {'CREATE TABLE IF NOT EXISTS public.pc_pyq' in text}")
print(f"Has RLS: {'ALTER TABLE public.pc_pyq ENABLE ROW LEVEL SECURITY;' in text}")
print(f"Has INDEXES: {'CREATE INDEX IF NOT EXISTS idx_pc_pyq_year' in text}")
print(f"File size: {len(text)} bytes")
