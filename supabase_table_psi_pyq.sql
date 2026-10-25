-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE TABLE DDL: Karnataka State Police (KSP) / KEA Police Sub-Inspector (PSI) PYQ Table
-- Table: public.psi_pyq
-- Total Papers: 38 Examination Papers (2016 to 2024) | 2,492 Questions Total
-- Cadres: Civil PSI, Reserve SI (CAR/DAR), Wireless PSI, KSRP Special Reserve,
--         KSISF SI, State Intelligence PSI, Detective SI, Fingerprint Bureau PSI
-- ═════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.psi_pyq (
    id TEXT PRIMARY KEY,
    question_number INTEGER NOT NULL,
    year INTEGER NOT NULL,
    month TEXT,
    paper INTEGER NOT NULL DEFAULT 2,
    cadre TEXT,
    exam_id TEXT NOT NULL DEFAULT 'ksp-psi',
    exam_name TEXT,
    file_source TEXT,
    node_id TEXT NOT NULL,
    subject TEXT NOT NULL,
    subject_kannada TEXT,
    domain TEXT NOT NULL,
    domain_kannada TEXT,
    sub_topic TEXT NOT NULL,
    sub_topic_kannada TEXT,
    difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
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
    key_answer TEXT,
    explanation_english TEXT,
    explanation_kannada TEXT,
    image_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE public.psi_pyq ENABLE ROW LEVEL SECURITY;

-- 1. Read Policy: Allow public read access to all users
DROP POLICY IF EXISTS "Allow public read access on psi_pyq" ON public.psi_pyq;
CREATE POLICY "Allow public read access on psi_pyq" 
    ON public.psi_pyq FOR SELECT 
    USING (true);

-- 2. Insert Policy: Allow anon and authenticated insert
DROP POLICY IF EXISTS "Allow anon insert on psi_pyq" ON public.psi_pyq;
CREATE POLICY "Allow anon insert on psi_pyq" 
    ON public.psi_pyq FOR INSERT 
    WITH CHECK (true);

-- 3. Update Policy: Allow anon and authenticated update
DROP POLICY IF EXISTS "Allow anon update on psi_pyq" ON public.psi_pyq;
CREATE POLICY "Allow anon update on psi_pyq" 
    ON public.psi_pyq FOR UPDATE 
    USING (true);

-- ═════════════════════════════════════════════════════════════════════════
-- Performance Indexes for Fast Exam Querying & Knowledge Graph Traversal
-- ═════════════════════════════════════════════════════════════════════════

CREATE INDEX IF NOT EXISTS idx_psi_pyq_year ON public.psi_pyq(year);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_paper ON public.psi_pyq(paper);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_cadre ON public.psi_pyq(cadre);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_exam_id ON public.psi_pyq(exam_id);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_node_id ON public.psi_pyq(node_id);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_subject ON public.psi_pyq(subject);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_domain ON public.psi_pyq(domain);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_sub_topic ON public.psi_pyq(sub_topic);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_difficulty ON public.psi_pyq(difficulty);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_key_answer ON public.psi_pyq(key_answer);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_composite_exam_year ON public.psi_pyq(exam_id, year, paper, question_number);
CREATE INDEX IF NOT EXISTS idx_psi_pyq_tags ON public.psi_pyq USING GIN (tags);
