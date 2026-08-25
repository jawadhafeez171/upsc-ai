-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE MIGRATION: Unified UPSC Knowledge Graph Schema & Taxonomy
-- ═════════════════════════════════════════════════════════════════════════

-- 1. Create Knowledge Nodes Table
CREATE TABLE IF NOT EXISTS public.knowledge_nodes (
    id TEXT PRIMARY KEY,
    slug TEXT NOT NULL,
    name TEXT NOT NULL,
    level INTEGER NOT NULL CHECK (level >= 1 AND level <= 4),
    level_name TEXT NOT NULL CHECK (level_name IN ('Subject', 'Domain', 'Topic', 'Subtopic_Entity')),
    subject TEXT NOT NULL,
    subject_id TEXT NOT NULL,
    parent_id TEXT REFERENCES public.knowledge_nodes(id) ON DELETE CASCADE,
    children_ids TEXT[] NOT NULL DEFAULT '{}',
    ancestor_ids TEXT[] NOT NULL DEFAULT '{}',
    exam_tags JSONB NOT NULL DEFAULT '{}'::jsonb,
    raw_exam_tag_string TEXT,
    description TEXT,
    entities TEXT[] NOT NULL DEFAULT '{}',
    keywords TEXT[] NOT NULL DEFAULT '{}',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Create Knowledge Graph Metadata / Global Stats Table
CREATE TABLE IF NOT EXISTS public.knowledge_graph_meta (
    id TEXT PRIMARY KEY DEFAULT 'current',
    version TEXT NOT NULL,
    generated_at TIMESTAMPTZ,
    root_subject_ids TEXT[] NOT NULL DEFAULT '{}',
    stats JSONB NOT NULL DEFAULT '{}'::jsonb,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Row Level Security (RLS): Enable public read access and anon write/update for sync scripts
ALTER TABLE public.knowledge_nodes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.knowledge_graph_meta ENABLE ROW LEVEL SECURITY;

-- Policies for knowledge_nodes
CREATE POLICY "Allow public read access on knowledge_nodes"
    ON public.knowledge_nodes FOR SELECT
    USING (true);

CREATE POLICY "Allow anon insert on knowledge_nodes"
    ON public.knowledge_nodes FOR INSERT
    WITH CHECK (true);

CREATE POLICY "Allow anon update on knowledge_nodes"
    ON public.knowledge_nodes FOR UPDATE
    USING (true);

CREATE POLICY "Allow anon delete on knowledge_nodes"
    ON public.knowledge_nodes FOR DELETE
    USING (true);

-- Policies for knowledge_graph_meta
CREATE POLICY "Allow public read access on knowledge_graph_meta"
    ON public.knowledge_graph_meta FOR SELECT
    USING (true);

CREATE POLICY "Allow anon insert on knowledge_graph_meta"
    ON public.knowledge_graph_meta FOR INSERT
    WITH CHECK (true);

CREATE POLICY "Allow anon update on knowledge_graph_meta"
    ON public.knowledge_graph_meta FOR UPDATE
    USING (true);

-- 4. High-Performance Search & Navigation Indexes
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_level ON public.knowledge_nodes(level);
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_level_name ON public.knowledge_nodes(level_name);
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_subject_id ON public.knowledge_nodes(subject_id);
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_parent_id ON public.knowledge_nodes(parent_id);
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_slug ON public.knowledge_nodes(slug);
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_exam_tags ON public.knowledge_nodes USING gin (exam_tags);
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_keywords ON public.knowledge_nodes USING gin (keywords);
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_entities ON public.knowledge_nodes USING gin (entities);
