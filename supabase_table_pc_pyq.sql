-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE TABLE DDL: Police Constable (PC) CAR/DAR PYQ Table
-- ═════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.pc_pyq (
    id TEXT PRIMARY KEY,
    question_number INTEGER NOT NULL,
    year INTEGER NOT NULL DEFAULT 2026,
    month TEXT NOT NULL DEFAULT 'September',
    paper INTEGER NOT NULL DEFAULT 1,
    paper_code TEXT NOT NULL CHECK (paper_code IN ('hk', 'nhk')),
    exam_id TEXT NOT NULL DEFAULT 'ksp-pc',
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
    question_kannada TEXT NOT NULL,
    option_1_english TEXT NOT NULL,
    option_2_english TEXT NOT NULL,
    option_3_english TEXT NOT NULL,
    option_4_english TEXT NOT NULL,
    option_1_kannada TEXT NOT NULL,
    option_2_kannada TEXT NOT NULL,
    option_3_kannada TEXT NOT NULL,
    option_4_kannada TEXT NOT NULL,
    key_answer TEXT NOT NULL,
    explanation_english TEXT NOT NULL,
    explanation_kannada TEXT NOT NULL,
    image_url TEXT,
    table_data JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Row Level Security (RLS)
ALTER TABLE public.pc_pyq ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow public read access on pc_pyq" ON public.pc_pyq;
CREATE POLICY "Allow public read access on pc_pyq" 
    ON public.pc_pyq FOR SELECT 
    USING (true);

DROP POLICY IF EXISTS "Allow anon insert on pc_pyq" ON public.pc_pyq;
CREATE POLICY "Allow anon insert on pc_pyq" 
    ON public.pc_pyq FOR INSERT 
    WITH CHECK (true);

DROP POLICY IF EXISTS "Allow anon update on pc_pyq" ON public.pc_pyq;
CREATE POLICY "Allow anon update on pc_pyq" 
    ON public.pc_pyq FOR UPDATE 
    USING (true);

-- Performance Indexes
CREATE INDEX IF NOT EXISTS idx_pc_pyq_year ON public.pc_pyq(year);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_paper ON public.pc_pyq(paper);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_paper_code ON public.pc_pyq(paper_code);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_node_id ON public.pc_pyq(node_id);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_subject ON public.pc_pyq(subject);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_domain ON public.pc_pyq(domain);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_difficulty ON public.pc_pyq(difficulty);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_exam_id ON public.pc_pyq(exam_id);
