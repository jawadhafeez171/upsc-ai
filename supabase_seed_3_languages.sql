-- =========================================================================
-- SUPABASE SEED 3: STATE LANGUAGES SUBGRAPH (29 NODES)
-- =========================================================================

BEGIN;

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 1,
        'Subject', 'LANGUAGE PROFICIENCY, GRAMMAR & COMMUNICATION (GENERAL KANNADA & GENERAL ENGLISH)', 'language_proficiency_grammar_communication', NULL,
        ARRAY['language_proficiency_grammar_communication.general_kannada_grammar_structure', 'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms', 'language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards', 'language_proficiency_grammar_communication.translation_precis_writing', 'language_proficiency_grammar_communication.general_english_grammar_syntax', 'language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs', 'language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability']::text[], ARRAY[]::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['LANGUAGE', 'PROFICIENCY', 'GRAMMAR', 'COMMUNICATION', 'GENERAL', 'KANNADA', 'ENGLISH']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_kannada_grammar_structure', 'general_kannada_grammar_structure', 'General Kannada Grammar & Structure (ಕನ್ನಡ ವ್ಯಾಕರಣ)', 2,
        'Domain', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication',
        ARRAY['language_proficiency_grammar_communication.general_kannada_grammar_structure.', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.-']::text[], ARRAY['language_proficiency_grammar_communication']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['General', 'Kannada', 'Grammar', 'Structure', 'ಕನ್ನಡ', 'ವ್ಯಾಕರಣ']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms', 'kannada_vocabulary_usage_idioms', 'Kannada Vocabulary, Usage & Idioms (ಶಬ್ದ ಸಂಪತ್ತು ಮತ್ತು ನುಡಿಗಟ್ಟುಗಳು)', 2,
        'Domain', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication',
        ARRAY['language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms.-', 'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms.']::text[], ARRAY['language_proficiency_grammar_communication']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Kannada', 'Vocabulary', 'Usage', 'Idioms', 'ಶಬ್ದ', 'ಸಂಪತ್ತು', 'ಮತ್ತು', 'ನುಡಿಗಟ್ಟುಗಳು']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards', 'kannada_literature_authors_sahitya_academy_awards', 'Kannada Literature, Authors & Sahitya Academy Awards (ಕನ್ನಡ ಸಾಹಿತ್ಯ ಪರಿಚಯ)', 2,
        'Domain', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication',
        ARRAY['language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards.']::text[], ARRAY['language_proficiency_grammar_communication']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Kannada', 'Literature', 'Authors', 'Sahitya', 'Academy', 'Awards', 'ಕನ್ನಡ', 'ಸಾಹಿತ್ಯ', 'ಪರಿಚಯ']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.translation_precis_writing', 'translation_precis_writing', 'Translation & Precis Writing (ಭಾಷಾಂತರ ಮತ್ತು ಸಂಕ್ಷೇಪಣ)', 2,
        'Domain', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication',
        ARRAY['language_proficiency_grammar_communication.translation_precis_writing.english_to_kannada_translation_principles', 'language_proficiency_grammar_communication.translation_precis_writing.kannada_to_english_translation_principles', 'language_proficiency_grammar_communication.translation_precis_writing.precis_writing_comprehension']::text[], ARRAY['language_proficiency_grammar_communication']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Translation', 'Precis', 'Writing', 'ಭಾಷಾಂತರ', 'ಮತ್ತು', 'ಸಂಕ್ಷೇಪಣ']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_english_grammar_syntax', 'general_english_grammar_syntax', 'General English Grammar & Syntax', 2,
        'Domain', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication',
        ARRAY['language_proficiency_grammar_communication.general_english_grammar_syntax.parts_of_speech_sentence_architecture', 'language_proficiency_grammar_communication.general_english_grammar_syntax.tenses_verb_forms_subject-verb_agreement', 'language_proficiency_grammar_communication.general_english_grammar_syntax.voice_narration_sentence_transformation']::text[], ARRAY['language_proficiency_grammar_communication']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['General', 'English', 'Grammar', 'Syntax']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs', 'english_vocabulary_idioms_phrasal_verbs', 'English Vocabulary, Idioms & Phrasal Verbs', 2,
        'Domain', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication',
        ARRAY['language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs.lexical_building_blocks', 'language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs.idioms_phrases_phrasal_verbs']::text[], ARRAY['language_proficiency_grammar_communication']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['English', 'Vocabulary', 'Idioms', 'Phrasal', 'Verbs']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability', 'reading_comprehension_sentence_correction_verbal_ability', 'Reading Comprehension, Sentence Correction & Verbal Ability', 2,
        'Domain', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication',
        ARRAY['language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability.sentence_correction_spotting_errors', 'language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability.verbal_ability_sentence_rearrangement']::text[], ARRAY['language_proficiency_grammar_communication']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Reading', 'Comprehension', 'Sentence', 'Correction', 'Verbal', 'Ability']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_kannada_grammar_structure.', '', 'ವರ್ಣಮಾಲೆ ಮತ್ತು ಧ್ವನಿ ರಚನೆ (ಕನ್ನಡ ಅಕ್ಷರಮಾಲೆ - 49 ಅಕ್ಷರಗಳು: ಸ್ವರಗಳು 13, ಯೋಗವಾಹಗಳು 2, ವ್ಯಂಜನಗಳು 34; ವರ್ಗೀಯ ವ್ಯಂಜನಗಳು 25: ಅಲ್ಪಪ್ರಾಣ, ಮಹಾಪ್ರಾಣ, ಅನುನಾಸಿಕ; ಅವರ್ಗೀಯ ವ್ಯಂಜನಗಳು 9; ಹ್ರಸ್ವ ಸ್ವರ, ದೀರ್ಘ ಸ್ವರ, ಪ್ಲುತ ಸ್ವರ; ಸಂಧ್ಯಕ್ಷರಗಳು: ಐ, ಔ; ಗುಣಿತಾಕ್ಷರಗಳು ಮತ್ತು ಸಂಯುಕ್ತಾಕ್ಷರಗಳು / ಒತ್ತಕ್ಷರಗಳು: ಸಜಾತೀಯ, ವಿಜಾತೀಯ)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure',
        ARRAY['language_proficiency_grammar_communication.general_kannada_grammar_structure..history_regional_history_karnataka_history', 'language_proficiency_grammar_communication.general_kannada_grammar_structure..geography_regional_geography_karnataka_geography', 'language_proficiency_grammar_communication.general_kannada_grammar_structure..indian_economy_regional_economy_karnataka_state_economy', 'language_proficiency_grammar_communication.general_kannada_grammar_structure..pyq_linked_to_with_exam_tag', 'language_proficiency_grammar_communication.general_kannada_grammar_structure..current_affair_article_linked_to_with_temporal_stamp_and_context_summary', 'language_proficiency_grammar_communication.general_kannada_grammar_structure..mind_map_flashcard_generated_automatically_from_node_hierarchy_and_relationship_edges']::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['ವರ್ಣಮಾಲೆ', 'ಮತ್ತು', 'ಧ್ವನಿ', 'ರಚನೆ', 'ಕನ್ನಡ', 'ಅಕ್ಷರಮಾಲೆ', 'ಅಕ್ಷರಗಳು', 'ಸ್ವರಗಳು', 'ಯೋಗವಾಹಗಳು', 'ವ್ಯಂಜನಗಳು', 'ವರ್ಗೀಯ', 'ಅಲ್ಪಪ್ರಾಣ', 'ಮಹಾಪ್ರಾಣ', 'ಅನುನಾಸಿಕ', 'ಅವರ್ಗೀಯ', 'ಹ್ರಸ್ವ', 'ಸ್ವರ', 'ದೀರ್ಘ', 'ಪ್ಲುತ', 'ಸಂಧ್ಯಕ್ಷರಗಳು', 'ಗುಣಿತಾಕ್ಷರಗಳು', 'ಸಂಯುಕ್ತಾಕ್ಷರಗಳು', 'ಒತ್ತಕ್ಷರಗಳು', 'ಸಜಾತೀಯ', 'ವಿಜಾತೀಯ']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_kannada_grammar_structure.-', '-', 'ವಾಕ್ಯ ರಚನೆ ಮತ್ತು ಕರ್ತರಿ-ಕರ್ಮಣಿ ಪ್ರಯೋಗ (ಕ್ರಿಯಾಪದಗಳ ರಚನೆ - ಧಾತು, ಕಾಲಸೂಚಕ ಪ್ರತ್ಯಯ, ಆಖ್ಯಾತ ಪ್ರತ್ಯಯ; ಭೂತಕಾಲ, ವರ್ತಮಾನಕಾಲ, ಭವಿಷ್ಯತ್ಕಾಲ; ಪ್ರೇರಣಾರ್ಥಕ, ಸಂಭಾವನಾರ್ಥಕ, ನಿಷೇಧಾರ್ಥಕ ಕ್ರಿಯಾರೂಪಗಳು; ಕರ್ತರಿ ಪ್ರಯೋಗ ಮತ್ತು ಕರ್ಮಣಿ ಪ್ರಯೋಗ / ''ಅಲ್ಪಡು'' ಧಾತು ಬಳಕೆ; ವಾಕ್ಯಗಳ ವಿಧಗಳು: ಸಾಮಾನ್ಯ ವಾಕ್ಯ, ಸಂಯೋಜಿತ ವಾಕ್ಯ, ಮಿಶ್ರ ವಾಕ್ಯ)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['ವಾಕ್ಯ', 'ರಚನೆ', 'ಮತ್ತು', 'ಕರ್ತರಿ', 'ಕರ್ಮಣಿ', 'ಪ್ರಯೋಗ', 'ಕ್ರಿಯಾಪದಗಳ', 'ಧಾತು', 'ಕಾಲಸೂಚಕ', 'ಪ್ರತ್ಯಯ', 'ಆಖ್ಯಾತ', 'ಭೂತಕಾಲ', 'ವರ್ತಮಾನಕಾಲ', 'ಭವಿಷ್ಯತ್ಕಾಲ', 'ಪ್ರೇರಣಾರ್ಥಕ', 'ಸಂಭಾವನಾರ್ಥಕ', 'ನಿಷೇಧಾರ್ಥಕ', 'ಕ್ರಿಯಾರೂಪಗಳು', 'ಅಲ್ಪಡು', 'ಬಳಕೆ', 'ವಾಕ್ಯಗಳ', 'ವಿಧಗಳು', 'ಸಾಮಾನ್ಯ', 'ಸಂಯೋಜಿತ', 'ಮಿಶ್ರ']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms.-', '-', 'ತತ್ಸಮ-ತದ್ಭವ ಮತ್ತು ಶಬ್ದ ಮೂಲಗಳು (ಸಂಸ್ಕೃತ ಮೂಲ ತತ್ಸಮಗಳು ಮತ್ತು ಕನ್ನಡಕ್ಕೆ ಹೊಂದಿಕೊಂಡ ತದ್ಭವ ರೂಪಗಳು; ಅನ್ಯದೇಶ್ಯ ಶಬ್ದಗಳು: ಪರ್ಷಿಯನ್, ಅರೇಬಿಕ್, ಪೋರ್ಚುಗೀಸ್, ಇಂಗ್ಲಿಷ್ ಶಬ್ದಗಳು; ದೇಶ್ಯ ಶಬ್ದಗಳು)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['ತತ್ಸಮ', 'ತದ್ಭವ', 'ಮತ್ತು', 'ಶಬ್ದ', 'ಮೂಲಗಳು', 'ಸಂಸ್ಕೃತ', 'ಮೂಲ', 'ತತ್ಸಮಗಳು', 'ಕನ್ನಡಕ್ಕೆ', 'ಹೊಂದಿಕೊಂಡ', 'ರೂಪಗಳು', 'ಅನ್ಯದೇಶ್ಯ', 'ಶಬ್ದಗಳು', 'ಪರ್ಷಿಯನ್', 'ಅರೇಬಿಕ್', 'ಪೋರ್ಚುಗೀಸ್', 'ಇಂಗ್ಲಿಷ್', 'ದೇಶ್ಯ']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms.', '', 'ಸಮಾನಾರ್ಥಕ, ನಾನಾರ್ಥಕ ಮತ್ತು ವಿರುದ್ಧ ಪದಗಳು (ಪರ್ಯಾಯ ಪದಕೋಶ, ನಾನಾರ್ಥ ಕೊಡುವ ಶಬ್ದಗಳು, ವಿರೋಧಾರ್ಥಕ ಶಬ್ದಗಳು, ಜೋಡುನುಡಿಗಳು / ಜೋಡುಪದಗಳು, ದ್ವಿರುಕ್ತಿಗಳು, ಅನುಕರಣಾವ್ಯಯಗಳು)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.kannada_vocabulary_usage_idioms']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['ಸಮಾನಾರ್ಥಕ', 'ನಾನಾರ್ಥಕ', 'ಮತ್ತು', 'ವಿರುದ್ಧ', 'ಪದಗಳು', 'ಪರ್ಯಾಯ', 'ಪದಕೋಶ', 'ನಾನಾರ್ಥ', 'ಕೊಡುವ', 'ಶಬ್ದಗಳು', 'ವಿರೋಧಾರ್ಥಕ', 'ಜೋಡುನುಡಿಗಳು', 'ಜೋಡುಪದಗಳು', 'ದ್ವಿರುಕ್ತಿಗಳು', 'ಅನುಕರಣಾವ್ಯಯಗಳು']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards.', '', 'ಕನ್ನಡ ಸಾಹಿತ್ಯ ಚರಿತ್ರೆ ಮತ್ತು ಯುಗಗಳು (ಪೂರ್ವ ಹಳಗನ್ನಡ / ಕವಿರಾಜಮಾರ್ಗ, ಪಂಪ ಪೂರ್ವ ಯುಗ; ಹಳಗನ್ನಡ ಯುಗ / ಪಂಪ, ರನ್ನ, ಪೊನ್ನ, ಜನ್ನ, ನಾಗವರ್ಮ; ನಡುಗನ್ನಡ ಯುಗ / ವಚನ ಸಾಹಿತ್ಯ: ಬಸವೇಶ್ವರ, ಅಲ್ಲಮಪ್ರಭು, ಅಕ್ಕಮಹಾದೇವಿ, ಚನ್ನಬಸವಣ್ಣ; ಹರಿದಾಸ ಸಾಹಿತ್ಯ: ಪುರಂದರದಾಸರು, ಕನಕದಾಸರು, ವಿಜಯದಾಸರು; ರಗಳೆ & ಷಟ್ಪದಿ ಕವಿಗಳು: ಹರಿಹರ, ರಾಘವಾಂಕ, ಕುಮಾರವ್ಯಾಸ, ಚಾಮರಸ, ಲಕ್ಷ್ಮೀಶ; ಹೊಸಗನ್ನಡ ನವೋದಯ, ಪ್ರಗತಿಶೀಲ, ನವ್ಯ, ಬಂಡಾಯ ಮತ್ತು ದಲಿತ ಸಾಹಿತ್ಯ ಚಳವಳಿಗಳು)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['ಕನ್ನಡ', 'ಸಾಹಿತ್ಯ', 'ಚರಿತ್ರೆ', 'ಮತ್ತು', 'ಯುಗಗಳು', 'ಪೂರ್ವ', 'ಹಳಗನ್ನಡ', 'ಕವಿರಾಜಮಾರ್ಗ', 'ಪಂಪ', 'ಯುಗ', 'ರನ್ನ', 'ಪೊನ್ನ', 'ಜನ್ನ', 'ನಾಗವರ್ಮ', 'ನಡುಗನ್ನಡ', 'ವಚನ', 'ಬಸವೇಶ್ವರ', 'ಅಲ್ಲಮಪ್ರಭು', 'ಅಕ್ಕಮಹಾದೇವಿ', 'ಚನ್ನಬಸವಣ್ಣ', 'ಹರಿದಾಸ', 'ಪುರಂದರದಾಸರು', 'ಕನಕದಾಸರು', 'ವಿಜಯದಾಸರು', 'ರಗಳೆ', 'ಷಟ್ಪದಿ', 'ಕವಿಗಳು', 'ಹರಿಹರ', 'ರಾಘವಾಂಕ', 'ಕುಮಾರವ್ಯಾಸ', 'ಚಾಮರಸ', 'ಲಕ್ಷ್ಮೀಶ', 'ಹೊಸಗನ್ನಡ', 'ನವೋದಯ', 'ಪ್ರಗತಿಶೀಲ', 'ನವ್ಯ', 'ಬಂಡಾಯ', 'ದಲಿತ', 'ಚಳವಳಿಗಳು']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.translation_precis_writing.english_to_kannada_translation_principles', 'english_to_kannada_translation_principles', 'English to Kannada Translation Principles (Contextual Translation vs Literal Translation, Technical & Administrative Terminology, Sentence Restructuring / SVO in English to SOV in Kannada, Translating Legal & Governance Idioms)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.translation_precis_writing',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.translation_precis_writing']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['English', 'Kannada', 'Translation', 'Principles', 'Contextual', 'Literal', 'Technical', 'Administrative', 'Terminology', 'Sentence', 'Restructuring', 'SVO', 'SOV', 'Translating', 'Legal', 'Governance', 'Idioms']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.translation_precis_writing.kannada_to_english_translation_principles', 'kannada_to_english_translation_principles', 'Kannada to English Translation Principles (Grammatical Equivalence, Active Voice preference, Precision of Vocabulary, Paragraph Flow & Cohesion)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.translation_precis_writing',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.translation_precis_writing']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Kannada', 'English', 'Translation', 'Principles', 'Grammatical', 'Equivalence', 'Active', 'Voice', 'preference', 'Precision', 'Vocabulary', 'Paragraph', 'Flow', 'Cohesion']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.translation_precis_writing.precis_writing_comprehension', 'precis_writing_comprehension', 'Precis Writing & Comprehension (Summarization Methodology - 1/3rd Rule, Retaining Central Thesis, Elimination of Examples & Superfluous Details, Assigning Title; Passage Analysis & Direct Answer Framing)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.translation_precis_writing',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.translation_precis_writing']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Precis', 'Writing', 'Comprehension', 'Summarization', 'Methodology', '1/3rd', 'Rule', 'Retaining', 'Central', 'Thesis', 'Elimination', 'Examples', 'Superfluous', 'Details', 'Assigning', 'Title', 'Passage', 'Analysis', 'Direct', 'Answer', 'Framing']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_english_grammar_syntax.parts_of_speech_sentence_architecture', 'parts_of_speech_sentence_architecture', 'Parts of Speech & Sentence Architecture (Nouns: Types, Countable/Uncountable, Plural Rules; Pronouns: Personal, Relative, Reflexive, Demonstrative; Adjectives & Degrees of Comparison; Adverbs: Time, Place, Manner, Frequency; Prepositions: Spatial, Temporal, Complex Prepositions; Conjunctions: Coordinating, Subordinating, Correlative; Interjections)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_english_grammar_syntax',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_english_grammar_syntax']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Parts', 'Speech', 'Sentence', 'Architecture', 'Nouns', 'Types', 'Countable/Uncountable', 'Plural', 'Rules', 'Pronouns', 'Personal', 'Relative', 'Reflexive', 'Demonstrative', 'Adjectives', 'Degrees', 'Comparison', 'Adverbs', 'Time', 'Place', 'Manner', 'Frequency', 'Prepositions', 'Spatial', 'Temporal', 'Complex', 'Conjunctions', 'Coordinating', 'Subordinating', 'Correlative', 'Interjections']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_english_grammar_syntax.tenses_verb_forms_subject-verb_agreement', 'tenses_verb_forms_subject-verb_agreement', 'Tenses, Verb Forms & Subject-Verb Agreement (Present, Past, Future Tense Sub-types - Simple, Continuous, Perfect, Perfect Continuous; Modal Auxiliaries - Can, Could, May, Might, Shall, Should, Will, Would, Must, Ought to; Subject-Verb Agreement Rules - Proximity, Collective Nouns, Indefinite Pronouns, Compound Subjects)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_english_grammar_syntax',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_english_grammar_syntax']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Tenses', 'Verb', 'Forms', 'Subject', 'Agreement', 'Present', 'Past', 'Future', 'Tense', 'Sub', 'types', 'Simple', 'Continuous', 'Perfect', 'Modal', 'Auxiliaries', 'Can', 'Could', 'May', 'Might', 'Shall', 'Should', 'Will', 'Would', 'Must', 'Ought', 'Rules', 'Proximity', 'Collective', 'Nouns', 'Indefinite', 'Pronouns', 'Compound', 'Subjects']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_english_grammar_syntax.voice_narration_sentence_transformation', 'voice_narration_sentence_transformation', 'Voice, Narration & Sentence Transformation (Active vs Passive Voice Conversion Rules across all tenses, Modals & Imperative sentences; Direct vs Indirect Speech / Narration - Tense backshifting, Reporting verbs, Pronoun & Time/Place adverbial shifts, Interrogative & Exclamatory conversions; Simple, Compound & Complex Sentence Transformations)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_english_grammar_syntax',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_english_grammar_syntax']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Voice', 'Narration', 'Sentence', 'Transformation', 'Active', 'Passive', 'Conversion', 'Rules', 'across', 'tenses', 'Modals', 'Imperative', 'sentences', 'Direct', 'Indirect', 'Speech', 'Tense', 'backshifting', 'Reporting', 'verbs', 'Pronoun', 'Time/Place', 'adverbial', 'shifts', 'Interrogative', 'Exclamatory', 'conversions', 'Simple', 'Compound', 'Complex', 'Transformations']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs.lexical_building_blocks', 'lexical_building_blocks', 'Lexical Building Blocks (Root Words: Greek & Latin roots; Prefixes & Suffixes; Synonyms & Antonyms; Homonyms, Homophones & Commonly Confused Words; One-Word Substitutions)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Lexical', 'Building', 'Blocks', 'Root', 'Words', 'Greek', 'Latin', 'roots', 'Prefixes', 'Suffixes', 'Synonyms', 'Antonyms', 'Homonyms', 'Homophones', 'Commonly', 'Confused', 'One', 'Word', 'Substitutions']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs.idioms_phrases_phrasal_verbs', 'idioms_phrases_phrasal_verbs', 'Idioms, Phrases & Phrasal Verbs (Popular Idiomatic Expressions with contextual meanings; Common Phrasal Verbs - Prepositional Verbs: Break down, Bring up, Call off, Carry out, Look into, Put up with, Turn down; Collocations in Business & Administrative English)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.english_vocabulary_idioms_phrasal_verbs']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Idioms', 'Phrases', 'Phrasal', 'Verbs', 'Popular', 'Idiomatic', 'Expressions', 'contextual', 'meanings', 'Common', 'Prepositional', 'Break', 'down', 'Bring', 'Call', 'off', 'Carry', 'out', 'Look', 'Put', 'Turn', 'Collocations', 'Business', 'Administrative', 'English']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability.sentence_correction_spotting_errors', 'sentence_correction_spotting_errors', 'Sentence Correction & Spotting Errors (Common Grammatical Errors - Dangling Modifiers, Redundancies, Misplaced Prepositions, Faulty Parallelism, Tense Inconsistencies, Double Negatives)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Sentence', 'Correction', 'Spotting', 'Errors', 'Common', 'Grammatical', 'Dangling', 'Modifiers', 'Redundancies', 'Misplaced', 'Prepositions', 'Faulty', 'Parallelism', 'Tense', 'Inconsistencies', 'Double', 'Negatives']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability.verbal_ability_sentence_rearrangement', 'verbal_ability_sentence_rearrangement', 'Verbal Ability & Sentence Rearrangement (Para Jumbles / Sentence Reordering - Identifying Opening Sentences, Connecting Links, Pronoun References, Concluding Sentences; Cloze Test - Contextual Word Fillers; Sentence Completion & Double Fillers)', 3,
        'Topic', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.reading_comprehension_sentence_correction_verbal_ability']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Verbal', 'Ability', 'Sentence', 'Rearrangement', 'Para', 'Jumbles', 'Reordering', 'Identifying', 'Opening', 'Sentences', 'Connecting', 'Links', 'Pronoun', 'References', 'Concluding', 'Cloze', 'Test', 'Contextual', 'Word', 'Fillers', 'Completion', 'Double']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_kannada_grammar_structure..history_regional_history_karnataka_history', 'history_regional_history_karnataka_history', 'History → Regional History → Karnataka History [KAS: Prelims-P1, Mains-GS1]', 4,
        'Subtopic_Entity', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', 'Kadambas, Gangas, Chalukyas of Badami, Rashtrakutas, Hoysalas, Vijayanagara, Wodeyars of Mysore, Hyder Ali & Tipu Sultan, Unification of Karnataka Movement', ARRAY['Kadambas, Gangas, Chalukyas of Badami, Rashtrakutas, Hoysalas, Vijayanagara, Wodeyars of Mysore, Hyder Ali & Tipu Sultan, Unification of Karnataka Movement']::text[], ARRAY['History', 'Regional', 'Karnataka', 'KAS', 'Prelims', 'Mains', 'GS1', 'Kadambas', 'Gangas', 'Chalukyas', 'Badami', 'Rashtrakutas', 'Hoysalas', 'Vijayanagara', 'Wodeyars', 'Mysore', 'Hyder', 'Ali', 'Tipu', 'Sultan', 'Unification', 'Movement']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_kannada_grammar_structure..geography_regional_geography_karnataka_geography', 'geography_regional_geography_karnataka_geography', 'Geography → Regional Geography → Karnataka Geography [KAS: Prelims-P1, Mains-GS1]', 4,
        'Subtopic_Entity', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', 'Physiography: Coastal Plains, Malnad, Maidan; River Basins: Krishna, Kaveri, Tungabhadra; Soils & Forests; Mineral Resources', ARRAY['Physiography: Coastal Plains, Malnad, Maidan', 'River Basins: Krishna, Kaveri, Tungabhadra', 'Soils & Forests', 'Mineral Resources']::text[], ARRAY['Geography', 'Regional', 'Karnataka', 'KAS', 'Prelims', 'Mains', 'GS1', 'Physiography', 'Coastal', 'Plains', 'Malnad', 'Maidan', 'River', 'Basins', 'Krishna', 'Kaveri', 'Tungabhadra', 'Soils', 'Forests', 'Mineral', 'Resources']::text[],
        'languages', ARRAY['languages']::text[]
    )
ON CONFLICT (id) DO UPDATE SET
    slug = EXCLUDED.slug,
    name = EXCLUDED.name,
    level = EXCLUDED.level,
    level_name = EXCLUDED.level_name,
    subject = EXCLUDED.subject,
    subject_id = EXCLUDED.subject_id,
    parent_id = EXCLUDED.parent_id,
    children_ids = EXCLUDED.children_ids,
    ancestor_ids = EXCLUDED.ancestor_ids,
    exam_tags = EXCLUDED.exam_tags,
    raw_exam_tag_string = EXCLUDED.raw_exam_tag_string,
    description = EXCLUDED.description,
    entities = EXCLUDED.entities,
    keywords = EXCLUDED.keywords,
    stream = EXCLUDED.stream,
    streams = EXCLUDED.streams,
    updated_at = NOW();

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'language_proficiency_grammar_communication.general_kannada_grammar_structure..indian_economy_regional_economy_karnataka_state_economy', 'indian_economy_regional_economy_karnataka_state_economy', 'Indian Economy → Regional Economy → Karnataka State Economy [KAS: Prelims-P2, Mains-GS3]', 4,
        'Subtopic_Entity', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', 'State Budget, GSDP Trends, IT/Biotech Corridor, Irrigation & Drought Management, State Welfare Schemes - Gruha Lakshmi, Yuva Nidhi, Anna Bhagya', ARRAY['State Budget, GSDP Trends, IT', 'Biotech Corridor, Irrigation & Drought Management, State Welfare Schemes - Gruha Lakshmi, Yuva Nidhi, Anna Bhagya']::text[], ARRAY['Indian', 'Economy', 'Regional', 'Karnataka', 'State', 'KAS', 'Prelims', 'Mains', 'GS3', 'Budget', 'GSDP', 'Trends', 'IT/Biotech', 'Corridor', 'Irrigation', 'Drought', 'Management', 'Welfare', 'Schemes', 'Gruha', 'Lakshmi', 'Yuva', 'Nidhi', 'Anna', 'Bhagya', 'Biotech']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_kannada_grammar_structure..pyq_linked_to_with_exam_tag', 'pyq_linked_to_with_exam_tag', 'PYQ ➔ linked to [Node_ID] with exam tag', 4,
        'Subtopic_Entity', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', 'year, exam: UPSC_CSE_2023, question_type: Prelims_MCQ / Mains_10M', ARRAY['year, exam: UPSC_CSE_2023, question_type: Prelims_MCQ', 'Mains_10M']::text[], ARRAY['PYQ', 'linked', 'Node_ID', 'exam', 'tag', 'year', 'UPSC_CSE_2023', 'question_type', 'Prelims_MCQ', 'Mains_10M']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_kannada_grammar_structure..current_affair_article_linked_to_with_temporal_stamp_and_context_summary', 'current_affair_article_linked_to_with_temporal_stamp_and_context_summary', 'Current_Affair_Article ➔ linked to [Node_ID] with temporal stamp and context summary.', 4,
        'Subtopic_Entity', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Current_Affair_Article', 'linked', 'Node_ID', 'temporal', 'stamp', 'context', 'summary.']::text[],
        'languages', ARRAY['languages']::text[]
    ),
    (
        'language_proficiency_grammar_communication.general_kannada_grammar_structure..mind_map_flashcard_generated_automatically_from_node_hierarchy_and_relationship_edges', 'mind_map_flashcard_generated_automatically_from_node_hierarchy_and_relationship_edges', 'Mind_Map / Flashcard ➔ generated automatically from node hierarchy and relationship edges.', 4,
        'Subtopic_Entity', 'Language Proficiency, Grammar & Communication (general Kannada & General English)', 'language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.',
        ARRAY[]::text[], ARRAY['language_proficiency_grammar_communication', 'language_proficiency_grammar_communication.general_kannada_grammar_structure', 'language_proficiency_grammar_communication.general_kannada_grammar_structure.']::text[], '{"kpsc": ["CTI", "FDA", "SDA"], "kea": ["VAO"], "ksp": ["PSI-Paper1"], "kas": ["Compulsory-Lang"], "ssc": ["English"]}'::jsonb,
        '[KPSC: CTI, FDA, SDA] [KEA: VAO] [KSP: PSI-Paper1] [KAS: Compulsory-Lang] [SSC: English]', '', ARRAY[]::text[], ARRAY['Mind_Map', 'Flashcard', 'generated', 'automatically', 'node', 'hierarchy', 'relationship', 'edges.']::text[],
        'languages', ARRAY['languages']::text[]
    )
ON CONFLICT (id) DO UPDATE SET
    slug = EXCLUDED.slug,
    name = EXCLUDED.name,
    level = EXCLUDED.level,
    level_name = EXCLUDED.level_name,
    subject = EXCLUDED.subject,
    subject_id = EXCLUDED.subject_id,
    parent_id = EXCLUDED.parent_id,
    children_ids = EXCLUDED.children_ids,
    ancestor_ids = EXCLUDED.ancestor_ids,
    exam_tags = EXCLUDED.exam_tags,
    raw_exam_tag_string = EXCLUDED.raw_exam_tag_string,
    description = EXCLUDED.description,
    entities = EXCLUDED.entities,
    keywords = EXCLUDED.keywords,
    stream = EXCLUDED.stream,
    streams = EXCLUDED.streams,
    updated_at = NOW();

COMMIT;
