-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE MIGRATION: Consolidated UPSC CSE Questions Table (EN & HI)
-- ═════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.upsc_questions (
    id TEXT PRIMARY KEY,
    exam_id TEXT NOT NULL DEFAULT 'upsc-cse',
    year INTEGER NOT NULL,
    paper INTEGER NOT NULL DEFAULT 1,
    subject TEXT NOT NULL,
    topic TEXT,
    difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
    text_en TEXT NOT NULL,
    text_hi TEXT,
    options_en TEXT[] NOT NULL,
    options_hi TEXT[],
    correct_index INTEGER NOT NULL CHECK (correct_index >= 0 AND correct_index <= 3),
    correct_option TEXT NOT NULL CHECK (correct_option IN ('a', 'b', 'c', 'd')),
    explanation_en TEXT NOT NULL,
    explanation_hi TEXT,
    image_url TEXT,
    source_table TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Row Level Security (RLS): Enable public read access
ALTER TABLE public.upsc_questions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow public read access on upsc_questions"
    ON public.upsc_questions FOR SELECT
    USING (true);

CREATE POLICY "Allow anon insert on upsc_questions"
    ON public.upsc_questions FOR INSERT
    WITH CHECK (true);

CREATE POLICY "Allow anon update on upsc_questions"
    ON public.upsc_questions FOR UPDATE
    USING (true);

-- Optimized Performance Indexes
CREATE INDEX IF NOT EXISTS idx_upsc_questions_year ON public.upsc_questions(year);
CREATE INDEX IF NOT EXISTS idx_upsc_questions_paper ON public.upsc_questions(paper);
CREATE INDEX IF NOT EXISTS idx_upsc_questions_subject ON public.upsc_questions(subject);
CREATE INDEX IF NOT EXISTS idx_upsc_questions_difficulty ON public.upsc_questions(difficulty);
CREATE INDEX IF NOT EXISTS idx_upsc_questions_exam_id ON public.upsc_questions(exam_id);
