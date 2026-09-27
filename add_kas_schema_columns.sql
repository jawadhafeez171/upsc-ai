-- ==============================================================================
-- SQL DDL Migration: Add Comprehensive Knowledge Graph, Spatial Mapping, and 
-- Extended Bilingual Taxonomy Columns to kas_questions Table in Supabase
--
-- Instructions: Run this in your Supabase SQL Editor:
-- https://supabase.com/dashboard/project/oazgwzctyjowxnvbhiud/sql
-- ==============================================================================

-- 1. Knowledge Graph & Spatial Mapping Columns
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS node_id TEXT;
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS secondary_node_ids TEXT[] DEFAULT '{}';
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS is_mapping BOOLEAN DEFAULT FALSE;
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS mapping JSONB;

-- 2. Domain & Taxonomy Hierarchy Columns
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS domain TEXT;
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS domain_kannada TEXT;
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS sub_topic TEXT;
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS tags TEXT[] DEFAULT '{}';

-- 3. Reading Comprehension Passage Columns
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS passage_en TEXT;
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS passage_kn TEXT;

-- 4. High-Performance Indices for Faster Queries & Graph Navigation
CREATE INDEX IF NOT EXISTS idx_kas_questions_node_id ON kas_questions(node_id);
CREATE INDEX IF NOT EXISTS idx_kas_questions_is_mapping ON kas_questions(is_mapping) WHERE is_mapping = TRUE;
CREATE INDEX IF NOT EXISTS idx_kas_questions_year_paper ON kas_questions(year, paper);
CREATE INDEX IF NOT EXISTS idx_kas_questions_subject ON kas_questions(subject);
