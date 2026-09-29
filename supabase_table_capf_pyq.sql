-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE TABLE DDL: UPSC Central Armed Police Forces (CAPF AC) PYQ Table
-- Table: public.capf_pyq
-- Total Papers: 13 Annual Papers (2014 to 2026) | 1,625 Questions Total
-- ═════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.capf_pyq (
    id TEXT PRIMARY KEY,
    question_number INTEGER NOT NULL,
    year INTEGER NOT NULL,
    month TEXT DEFAULT 'August',
    paper INTEGER NOT NULL DEFAULT 1,
    exam_id TEXT NOT NULL DEFAULT 'upsc-capf',
    node_id TEXT NOT NULL,
    subject TEXT NOT NULL,
    subject_hindi TEXT,
    domain TEXT NOT NULL,
    domain_hindi TEXT,
    sub_topic TEXT NOT NULL,
    sub_topic_hindi TEXT,
    difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
    tags TEXT[],
    passage_english TEXT,
    passage_hindi TEXT,
    question_english TEXT NOT NULL,
    question_hindi TEXT,
    option_a_english TEXT NOT NULL,
    option_b_english TEXT NOT NULL,
    option_c_english TEXT NOT NULL,
    option_d_english TEXT NOT NULL,
    option_a_hindi TEXT,
    option_b_hindi TEXT,
    option_c_hindi TEXT,
    option_d_hindi TEXT,
    key_answer TEXT NOT NULL,
    explanation_english TEXT NOT NULL,
    explanation_hindi TEXT,
    image_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE public.capf_pyq ENABLE ROW LEVEL SECURITY;

-- 1. Read Policy: Allow public read access to all users
DROP POLICY IF EXISTS "Allow public read access on capf_pyq" ON public.capf_pyq;
CREATE POLICY "Allow public read access on capf_pyq" 
    ON public.capf_pyq FOR SELECT 
    USING (true);

-- 2. Insert Policy: Allow anon and authenticated insert
DROP POLICY IF EXISTS "Allow anon insert on capf_pyq" ON public.capf_pyq;
CREATE POLICY "Allow anon insert on capf_pyq" 
    ON public.capf_pyq FOR INSERT 
    WITH CHECK (true);

-- 3. Update Policy: Allow anon and authenticated update
DROP POLICY IF EXISTS "Allow anon update on capf_pyq" ON public.capf_pyq;
CREATE POLICY "Allow anon update on capf_pyq" 
    ON public.capf_pyq FOR UPDATE 
    USING (true);

-- ═════════════════════════════════════════════════════════════════════════
-- Performance Indexes for Fast Exam Querying & Knowledge Graph Traversal
-- ═════════════════════════════════════════════════════════════════════════

CREATE INDEX IF NOT EXISTS idx_capf_pyq_year ON public.capf_pyq(year);
CREATE INDEX IF NOT EXISTS idx_capf_pyq_paper ON public.capf_pyq(paper);
CREATE INDEX IF NOT EXISTS idx_capf_pyq_exam_id ON public.capf_pyq(exam_id);
CREATE INDEX IF NOT EXISTS idx_capf_pyq_node_id ON public.capf_pyq(node_id);
CREATE INDEX IF NOT EXISTS idx_capf_pyq_subject ON public.capf_pyq(subject);
CREATE INDEX IF NOT EXISTS idx_capf_pyq_domain ON public.capf_pyq(domain);
CREATE INDEX IF NOT EXISTS idx_capf_pyq_difficulty ON public.capf_pyq(difficulty);
CREATE INDEX IF NOT EXISTS idx_capf_pyq_key_answer ON public.capf_pyq(key_answer);
CREATE INDEX IF NOT EXISTS idx_capf_pyq_composite_exam_year ON public.capf_pyq(exam_id, year, question_number);
