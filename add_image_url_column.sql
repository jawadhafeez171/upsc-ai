-- SQL DDL Migration to add image_url column to kas_questions
-- Run this query in your Supabase SQL Editor (https://supabase.com/dashboard/project/oazgwzctyjowxnvbhiud/sql)

ALTER TABLE kas_questions ADD COLUMN IF NOT EXISTS image_url TEXT;
