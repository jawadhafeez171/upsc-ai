import json

with open('src/data/upsc_pyq/csat/2020_csat.json', encoding='utf-8') as f:
    questions = json.load(f)

def sql_escape(s):
    if s is None:
        return 'NULL'
    return "'" + str(s).replace("'", "''") + "'"

lines = [
    "-- Migration: Add passage columns to csat_pyq and update existing 2020 CSAT reading comprehension questions",
    "ALTER TABLE public.csat_pyq ADD COLUMN IF NOT EXISTS passage_english TEXT;",
    "ALTER TABLE public.csat_pyq ADD COLUMN IF NOT EXISTS passage_hindi TEXT;",
    ""
]

rc_count = 0
for q in questions:
    if q.get('passage_english'):
        rc_count += 1
        qn = q['question_number']
        pe = sql_escape(q['passage_english'])
        ph = sql_escape(q['passage_hindi'])
        qe = sql_escape(q['question_english'])
        qh = sql_escape(q['question_hindi'])
        
        sql = f"""UPDATE public.csat_pyq
SET
    passage_english = {pe},
    passage_hindi = {ph},
    question_english = {qe},
    question_hindi = {qh}
WHERE (id = 'csat-2020-q{qn}' OR (year = 2020 AND question_number = {qn}));
"""
        lines.append(sql)

with open('supabase_migration_csat_passages.sql', 'w', encoding='utf-8') as out:
    out.write('\n'.join(lines))

print(f"Generated supabase_migration_csat_passages.sql for {rc_count} RC questions.")
