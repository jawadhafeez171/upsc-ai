-- SQL DDL Migration to add subject_kannada and sub_topic_kannada columns to kas_questions
-- Run this query in your Supabase SQL Editor (https://supabase.com/dashboard/project/oazgwzctyjowxnvbhiud/sql)

ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS subject_kannada TEXT;
ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS sub_topic_kannada TEXT;
