-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE TABLE DDL: Karnataka Examination Authority (KEA) Questions Table
-- Table: public.kea_questions
-- Total Papers: 64 Examination Papers (2023 to 2026) | 6,364 Questions Total
-- ═════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.kea_questions (
    id TEXT PRIMARY KEY,
    question_number INTEGER NOT NULL,
    year INTEGER NOT NULL DEFAULT 2024,
    month TEXT,
    paper INTEGER DEFAULT 1,
    paper_code TEXT NOT NULL,
    exam_id TEXT NOT NULL DEFAULT 'kea',
    exam_name TEXT,
    node_id TEXT,
    subject TEXT,
    subject_kannada TEXT,
    domain TEXT,
    domain_kannada TEXT,
    sub_topic TEXT,
    sub_topic_kannada TEXT,
    difficulty TEXT DEFAULT 'medium',
    tags TEXT[],
    passage_english TEXT,
    passage_kannada TEXT,
    question_english TEXT NOT NULL,
    question_kannada TEXT,
    option_1_english TEXT,
    option_2_english TEXT,
    option_3_english TEXT,
    option_4_english TEXT,
    option_1_kannada TEXT,
    option_2_kannada TEXT,
    option_3_kannada TEXT,
    option_4_kannada TEXT,
    key_answer TEXT NOT NULL,
    explanation_english TEXT,
    explanation_kannada TEXT,
    image_url TEXT,
    table_data JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE public.kea_questions ENABLE ROW LEVEL SECURITY;

-- 1. Read Policy: Allow public read access to all users
DROP POLICY IF EXISTS "Allow public read access on kea_questions" ON public.kea_questions;
CREATE POLICY "Allow public read access on kea_questions" 
    ON public.kea_questions FOR SELECT 
    USING (true);

-- 2. Insert Policy: Allow anon and authenticated insert
DROP POLICY IF EXISTS "Allow anon insert on kea_questions" ON public.kea_questions;
CREATE POLICY "Allow anon insert on kea_questions" 
    ON public.kea_questions FOR INSERT 
    WITH CHECK (true);

-- 3. Update Policy: Allow anon and authenticated update
DROP POLICY IF EXISTS "Allow anon update on kea_questions" ON public.kea_questions;
CREATE POLICY "Allow anon update on kea_questions" 
    ON public.kea_questions FOR UPDATE 
    USING (true);

-- 4. Delete Policy: Allow anon and authenticated delete
DROP POLICY IF EXISTS "Allow anon delete on kea_questions" ON public.kea_questions;
CREATE POLICY "Allow anon delete on kea_questions" 
    ON public.kea_questions FOR DELETE 
    USING (true);

-- ═════════════════════════════════════════════════════════════════════════
-- Performance Indexes for Querying by Knowledge Graph & Exam Facets
-- ═════════════════════════════════════════════════════════════════════════

CREATE INDEX IF NOT EXISTS idx_kea_questions_node_id 
    ON public.kea_questions(node_id);

CREATE INDEX IF NOT EXISTS idx_kea_questions_subject 
    ON public.kea_questions(subject);

CREATE INDEX IF NOT EXISTS idx_kea_questions_year_paper 
    ON public.kea_questions(year, paper);

CREATE INDEX IF NOT EXISTS idx_kea_questions_paper_code 
    ON public.kea_questions(paper_code);

CREATE INDEX IF NOT EXISTS idx_kea_questions_exam_id 
    ON public.kea_questions(exam_id);
