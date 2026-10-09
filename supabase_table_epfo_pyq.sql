-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE TABLE DDL: UPSC EPFO (EO/AO & APFC) PYQ Table
-- Table: public.epfo_pyq
-- Total Papers: 9 Papers (2002 to 2025) | 1,060 Questions Total
-- ═════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.epfo_pyq (
    id TEXT PRIMARY KEY,
    question_number INTEGER NOT NULL,
    year INTEGER NOT NULL,
    month TEXT,
    paper INTEGER NOT NULL DEFAULT 1,
    paper_code TEXT NOT NULL,
    exam_name TEXT NOT NULL,
    exam_id TEXT NOT NULL DEFAULT 'upsc-epfo',
    node_id TEXT NOT NULL,
    subject TEXT NOT NULL,
    subject_hindi TEXT,
    domain TEXT NOT NULL,
    domain_hindi TEXT,
    sub_topic TEXT NOT NULL,
    sub_topic_hindi TEXT,
    difficulty TEXT NOT NULL DEFAULT 'medium' CHECK (difficulty IN ('easy', 'medium', 'hard')),
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
ALTER TABLE public.epfo_pyq ENABLE ROW LEVEL SECURITY;

-- 1. Read Policy: Allow public read access to all users
DROP POLICY IF EXISTS "Allow public read access on epfo_pyq" ON public.epfo_pyq;
CREATE POLICY "Allow public read access on epfo_pyq" 
    ON public.epfo_pyq FOR SELECT 
    USING (true);

-- 2. Insert Policy: Allow anon and authenticated insert
DROP POLICY IF EXISTS "Allow anon insert on epfo_pyq" ON public.epfo_pyq;
CREATE POLICY "Allow anon insert on epfo_pyq" 
    ON public.epfo_pyq FOR INSERT 
    WITH CHECK (true);

-- 3. Update Policy: Allow anon and authenticated update
DROP POLICY IF EXISTS "Allow anon update on epfo_pyq" ON public.epfo_pyq;
CREATE POLICY "Allow anon update on epfo_pyq" 
    ON public.epfo_pyq FOR UPDATE 
    USING (true);

-- ═════════════════════════════════════════════════════════════════════════
-- Performance Indexes for Fast Exam Querying & Knowledge Graph Traversal
-- ═════════════════════════════════════════════════════════════════════════

CREATE INDEX IF NOT EXISTS idx_epfo_pyq_year ON public.epfo_pyq(year);
CREATE INDEX IF NOT EXISTS idx_epfo_pyq_paper ON public.epfo_pyq(paper);
CREATE INDEX IF NOT EXISTS idx_epfo_pyq_paper_code ON public.epfo_pyq(paper_code);
CREATE INDEX IF NOT EXISTS idx_epfo_pyq_exam_id ON public.epfo_pyq(exam_id);
CREATE INDEX IF NOT EXISTS idx_epfo_pyq_node_id ON public.epfo_pyq(node_id);
CREATE INDEX IF NOT EXISTS idx_epfo_pyq_subject ON public.epfo_pyq(subject);
CREATE INDEX IF NOT EXISTS idx_epfo_pyq_domain ON public.epfo_pyq(domain);
CREATE INDEX IF NOT EXISTS idx_epfo_pyq_difficulty ON public.epfo_pyq(difficulty);
CREATE INDEX IF NOT EXISTS idx_epfo_pyq_key_answer ON public.epfo_pyq(key_answer);
CREATE INDEX IF NOT EXISTS idx_epfo_pyq_composite_exam_year ON public.epfo_pyq(exam_id, year, question_number);
