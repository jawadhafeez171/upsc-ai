-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE MIGRATION: DROP LEGACY FRAGMENTED UPSC TABLES
-- ═════════════════════════════════════════════════════════════════════════
-- All 3,298 questions have been safely consolidated into 'public.upsc_questions'.
-- Running this script cleans up the 11 old fragmented tables from your database.

DROP TABLE IF EXISTS public."PYQ Ancient History" CASCADE;
DROP TABLE IF EXISTS public."PYQ Medieval Hisotry" CASCADE;
DROP TABLE IF EXISTS public."PYQ Art and Culture" CASCADE;
DROP TABLE IF EXISTS public."PYQ Modern History" CASCADE;
DROP TABLE IF EXISTS public."PYQ Polity" CASCADE;
DROP TABLE IF EXISTS public."PYQ Economics" CASCADE;
DROP TABLE IF EXISTS public."PYQ Geography" CASCADE;
DROP TABLE IF EXISTS public."PYQ Environement" CASCADE;
DROP TABLE IF EXISTS public."PYQ Science&Tech" CASCADE;
DROP TABLE IF EXISTS public."PYQ IR and Current Affairs" CASCADE;
DROP TABLE IF EXISTS public."PYQ General Awareness" CASCADE;
