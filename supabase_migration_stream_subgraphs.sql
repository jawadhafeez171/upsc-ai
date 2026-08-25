-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE MIGRATION: Multi-Stream Subgraph Support for Knowledge Graph
-- ═════════════════════════════════════════════════════════════════════════

-- 1. Ensure stream column exists on knowledge_nodes table
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'knowledge_nodes' 
        AND column_name = 'stream'
    ) THEN
        ALTER TABLE public.knowledge_nodes ADD COLUMN stream TEXT DEFAULT 'civil_services';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'knowledge_nodes' 
        AND column_name = 'streams'
    ) THEN
        ALTER TABLE public.knowledge_nodes ADD COLUMN streams TEXT[] DEFAULT ARRAY['civil_services'];
    END IF;
END $$;

-- 2. Create index on stream and streams for fast stream filtering
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_stream ON public.knowledge_nodes(stream);
CREATE INDEX IF NOT EXISTS idx_knowledge_nodes_streams ON public.knowledge_nodes USING gin (streams);

-- 3. Upsert Metadata rows for each stream
INSERT INTO public.knowledge_graph_meta (id, version, root_subject_ids, stats, updated_at)
VALUES 
    ('civil_services', '2.0.0', ARRAY['history', 'art_culture_heritage', 'geography_earth_systems', 'indian_society_social_justice', 'indian_polity_constitution_governance', 'international_relations_global_institutions', 'indian_economy_development', 'environment_ecology_disaster_management', 'science_technology_defence', 'internal_security', 'ethics_integrity_aptitude', 'general_mental_ability_quantitative_aptitude_comprehension'], '{"totalNodes": 760, "stream": "civil_services"}'::jsonb, NOW()),
    ('teaching', '2.0.0', ARRAY['child_development_educational_psychology', 'theories_of_learning_motivation_cognition', 'inclusive_education_diverse_learners_special_needs', 'pedagogical_strategies_curriculum_assessment', 'subject_specific_pedagogies', 'national_policies_and_higher_education_research_aptitude'], '{"totalNodes": 90, "stream": "teaching"}'::jsonb, NOW()),
    ('languages', '2.0.0', ARRAY['language_proficiency_grammar_communication'], '{"totalNodes": 29, "stream": "languages"}'::jsonb, NOW()),
    ('current', '2.0.0', ARRAY['history', 'art_culture_heritage', 'geography_earth_systems', 'indian_society_social_justice', 'indian_polity_constitution_governance', 'international_relations_global_institutions', 'indian_economy_development', 'environment_ecology_disaster_management', 'science_technology_defence', 'internal_security', 'ethics_integrity_aptitude', 'general_mental_ability_quantitative_aptitude_comprehension', 'child_development_educational_psychology', 'theories_of_learning_motivation_cognition', 'inclusive_education_diverse_learners_special_needs', 'pedagogical_strategies_curriculum_assessment', 'subject_specific_pedagogies', 'national_policies_and_higher_education_research_aptitude', 'language_proficiency_grammar_communication'], '{"totalNodes": 815, "stream": "unified"}'::jsonb, NOW())
ON CONFLICT (id) DO UPDATE 
SET version = EXCLUDED.version,
    root_subject_ids = EXCLUDED.root_subject_ids,
    stats = EXCLUDED.stats,
    updated_at = NOW();
