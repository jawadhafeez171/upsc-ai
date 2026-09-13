-- =========================================================================
-- SUPABASE SEED 1B: CIVIL SERVICES (TOPICS PART 1) (216 NODES)
-- =========================================================================

BEGIN;

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'history.ancient_india.sources_of_ancient_indian_history', 'sources_of_ancient_indian_history', 'Sources of Ancient Indian History', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY[]::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Sources', 'Ancient', 'Indian', 'History']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.prehistoric_india', 'prehistoric_india', 'Prehistoric India', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.prehistoric_india.palaeolithic_age', 'history.ancient_india.prehistoric_india.mesolithic_age', 'history.ancient_india.prehistoric_india.neolithic_age', 'history.ancient_india.prehistoric_india.chalcolithic_cultures']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Prehistoric', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.indus_valley_civilization', 'indus_valley_civilization', 'Indus Valley Civilization', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.indus_valley_civilization.extent_geography_chronology', 'history.ancient_india.indus_valley_civilization.major_urban_centers_findings', 'history.ancient_india.indus_valley_civilization.town_planning_architecture', 'history.ancient_india.indus_valley_civilization.economy_trade_crafts', 'history.ancient_india.indus_valley_civilization.harappan_society_religion_art', 'history.ancient_india.indus_valley_civilization.decline_of_harappan_civilization']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indus', 'Valley', 'Civilization']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.vedic_age', 'vedic_age', 'Vedic Age', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.vedic_age.early_vedic_rigvedic_period', 'history.ancient_india.vedic_age.later_vedic_period']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Vedic', 'Age']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.mahajanapadas_magadhan_hegemony', 'mahajanapadas_magadhan_hegemony', 'Mahajanapadas & Magadhan Hegemony', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.mahajanapadas_magadhan_hegemony.16_mahajanapadas_state_systems', 'history.ancient_india.mahajanapadas_magadhan_hegemony.rise_of_magadha_dynasties']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Mahajanapadas', 'Magadhan', 'Hegemony']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.religious_movements_buddhism', 'religious_movements_buddhism', 'Religious Movements: Buddhism', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.religious_movements_buddhism.gautama_buddha_core_doctrine', 'history.ancient_india.religious_movements_buddhism.philosophical_tenets', 'history.ancient_india.religious_movements_buddhism.buddhist_councils', 'history.ancient_india.religious_movements_buddhism.buddhist_sects_bodhisattvas', 'history.ancient_india.religious_movements_buddhism.monastic_architecture_university_centers']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Religious', 'Movements', 'Buddhism']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.religious_movements_jainism', 'religious_movements_jainism', 'Religious Movements: Jainism', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.religious_movements_jainism.vardhamana_mahavira_tirthankaras', 'history.ancient_india.religious_movements_jainism.philosophical_doctrines', 'history.ancient_india.religious_movements_jainism.five_great_vows_mahavratas', 'history.ancient_india.religious_movements_jainism.jain_councils_schism']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Religious', 'Movements', 'Jainism']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.persian_greek_invasions', 'persian_greek_invasions', 'Persian & Greek Invasions', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.persian_greek_invasions.achaemenid_persian_invasion', 'history.ancient_india.persian_greek_invasions.macedonian_greek_invasion']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Persian', 'Greek', 'Invasions']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.mauryan_empire', 'mauryan_empire', 'Mauryan Empire', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.mauryan_empire.foundation_political_history', 'history.ancient_india.mauryan_empire.ashokas_dhamma_inscriptions', 'history.ancient_india.mauryan_empire.mauryan_administration_economy', 'history.ancient_india.mauryan_empire.mauryan_art_architecture', 'history.ancient_india.mauryan_empire.decline_of_the_mauryas']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Mauryan', 'Empire']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.post-mauryan_kingdoms', 'post-mauryan_kingdoms', 'Post-Mauryan Kingdoms', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.post-mauryan_kingdoms.indigenous_dynasties', 'history.ancient_india.post-mauryan_kingdoms.foreign_dynasties_invasions']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Post', 'Mauryan', 'Kingdoms']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.gupta_empire', 'gupta_empire', 'Gupta Empire', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.gupta_empire.foundation_imperial_expansion', 'history.ancient_india.gupta_empire.gupta_administration_society_economy', 'history.ancient_india.gupta_empire.classical_age_of_literature_science_art', 'history.ancient_india.gupta_empire.decline_of_the_guptas']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Gupta', 'Empire']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.post-gupta_period_harshavardhana', 'post-gupta_period_harshavardhana', 'Post-Gupta Period & Harshavardhana', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.post-gupta_period_harshavardhana.regional_successor_kingdoms', 'history.ancient_india.post-gupta_period_harshavardhana.harshavardhanas_reign_administration']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Post', 'Gupta', 'Period', 'Harshavardhana']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.south_indian_kingdoms', 'south_indian_kingdoms', 'South Indian Kingdoms', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.south_indian_kingdoms.sangam_age', 'history.ancient_india.south_indian_kingdoms.pallava_dynasty', 'history.ancient_india.south_indian_kingdoms.imperial_chola_empire', 'history.ancient_india.south_indian_kingdoms.chalukyas_of_badami_kalyani', 'history.ancient_india.south_indian_kingdoms.rashtrakuta_dynasty', 'history.ancient_india.south_indian_kingdoms.hoysala_dynasty']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['South', 'Indian', 'Kingdoms']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.indian_influence_in_south-east_asia', 'indian_influence_in_south-east_asia', 'Indian Influence in South-East Asia', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY['history.ancient_india.indian_influence_in_south-east_asia.indianisation_maritime_networks', 'history.ancient_india.indian_influence_in_south-east_asia.southeast_asian_kingdoms_monuments']::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Influence', 'South', 'East', 'Asia']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.archaeological_sources', 'archaeological_sources', 'Archaeological Sources (Inscriptions & Epigraphy - Ashokan Edicts, Allahabad Pillar, Junagadh Rock Inscription; Numismatics - Punch-Marked Coins, Indo-Greek Gold Coins, Gupta Coins; Monuments & Excavation Sites)', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY[]::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Archaeological', 'Sources', 'Inscriptions', 'Epigraphy', 'Ashokan', 'Edicts', 'Allahabad', 'Pillar', 'Junagadh', 'Rock', 'Inscription', 'Numismatics', 'Punch', 'Marked', 'Coins', 'Indo', 'Greek', 'Gold', 'Gupta', 'Monuments', 'Excavation', 'Sites']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.ancient_india.literary_sources', 'literary_sources', 'Literary Sources (Indigenous Religious Texts - Vedas, Upanishads, Epics, Puranas, Tripitakas, Jatakas, Jain Agamas; Secular Literature - Kautilya''s Arthashastra, Megasthenes'' Indica, Kalidasa, Banabhatta, Rajatarangini; Foreign Travelogues - Faxian, Xuanzang, Yijing, Al-Biruni)', 3,
        'Topic', 'History', 'history', 'history.ancient_india',
        ARRAY[]::text[], ARRAY['history', 'history.ancient_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Literary', 'Sources', 'Indigenous', 'Religious', 'Texts', 'Vedas', 'Upanishads', 'Epics', 'Puranas', 'Tripitakas', 'Jatakas', 'Jain', 'Agamas', 'Secular', 'Literature', 'Kautilya''s', 'Arthashastra', 'Megasthenes', 'Indica', 'Kalidasa', 'Banabhatta', 'Rajatarangini', 'Foreign', 'Travelogues', 'Faxian', 'Xuanzang', 'Yijing', 'Biruni']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.medieval_india.early_medieval_period_tripartite_struggle', 'early_medieval_period_tripartite_struggle', 'Early Medieval Period & Tripartite Struggle', 3,
        'Topic', 'History', 'history', 'history.medieval_india',
        ARRAY['history.medieval_india.early_medieval_period_tripartite_struggle.tripartite_struggle_for_kannauj', 'history.medieval_india.early_medieval_period_tripartite_struggle.early_arab_turkish_invasions']::text[], ARRAY['history', 'history.medieval_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Early', 'Medieval', 'Period', 'Tripartite', 'Struggle']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.medieval_india.delhi_sultanate', 'delhi_sultanate', 'Delhi Sultanate', 3,
        'Topic', 'History', 'history', 'history.medieval_india',
        ARRAY['history.medieval_india.delhi_sultanate.mamluk_slave_dynasty', 'history.medieval_india.delhi_sultanate.khalji_dynasty', 'history.medieval_india.delhi_sultanate.tughlaq_dynasty', 'history.medieval_india.delhi_sultanate.sayyid_lodi_dynasties', 'history.medieval_india.delhi_sultanate.sultanate_administration_economy_culture']::text[], ARRAY['history', 'history.medieval_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Delhi', 'Sultanate']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.medieval_india.vijayanagara_empire_deccan_sultanates', 'vijayanagara_empire_deccan_sultanates', 'Vijayanagara Empire & Deccan Sultanates', 3,
        'Topic', 'History', 'history', 'history.medieval_india',
        ARRAY['history.medieval_india.vijayanagara_empire_deccan_sultanates.vijayanagara_empire', 'history.medieval_india.vijayanagara_empire_deccan_sultanates.bahmani_sultanate_deccan_sultanates']::text[], ARRAY['history', 'history.medieval_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Vijayanagara', 'Empire', 'Deccan', 'Sultanates']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.medieval_india.bhakti_sufi_movements', 'bhakti_sufi_movements', 'Bhakti & Sufi Movements', 3,
        'Topic', 'History', 'history', 'history.medieval_india',
        ARRAY['history.medieval_india.bhakti_sufi_movements.bhakti_movement_in_south_north_india', 'history.medieval_india.bhakti_sufi_movements.sufism_silsilas']::text[], ARRAY['history', 'history.medieval_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Bhakti', 'Sufi', 'Movements']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.medieval_india.mughal_empire', 'mughal_empire', 'Mughal Empire', 3,
        'Topic', 'History', 'history', 'history.medieval_india',
        ARRAY['history.medieval_india.mughal_empire.early_mughals_expansion', 'history.medieval_india.mughal_empire.akbar_the_great', 'history.medieval_india.mughal_empire.jahangir_shah_jahan', 'history.medieval_india.mughal_empire.aurangzeb_mughal_decline', 'history.medieval_india.mughal_empire.mughal_administration_economy_culture']::text[], ARRAY['history', 'history.medieval_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Mughal', 'Empire']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.medieval_india.sur_empire_interregnum', 'sur_empire_interregnum', 'Sur Empire Interregnum', 3,
        'Topic', 'History', 'history', 'history.medieval_india',
        ARRAY['history.medieval_india.sur_empire_interregnum.sher_shah_suri_administrative_reforms']::text[], ARRAY['history', 'history.medieval_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Sur', 'Empire', 'Interregnum']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.medieval_india.maratha_empire_regional_states', 'maratha_empire_regional_states', 'Maratha Empire & Regional States', 3,
        'Topic', 'History', 'history', 'history.medieval_india',
        ARRAY['history.medieval_india.maratha_empire_regional_states.chhatrapati_shivaji_maharaj_early_maratha_state', 'history.medieval_india.maratha_empire_regional_states.peshwa_era_maratha_expansion', 'history.medieval_india.maratha_empire_regional_states.maratha_confederacy_anglo-maratha_wars', 'history.medieval_india.maratha_empire_regional_states.18th_century_regional_states']::text[], ARRAY['history', 'history.medieval_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Maratha', 'Empire', 'Regional', 'States']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.modern_india.advent_of_european_traders_anglo-french_rivalry', 'advent_of_european_traders_anglo-french_rivalry', 'Advent of European Traders & Anglo-French Rivalry', 3,
        'Topic', 'History', 'history', 'history.modern_india',
        ARRAY['history.modern_india.advent_of_european_traders_anglo-french_rivalry.european_trading_companies', 'history.modern_india.advent_of_european_traders_anglo-french_rivalry.anglo-french_carnatic_wars']::text[], ARRAY['history', 'history.modern_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Advent', 'European', 'Traders', 'Anglo', 'French', 'Rivalry']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.modern_india.british_conquest_consolidation_of_india', 'british_conquest_consolidation_of_india', 'British Conquest & Consolidation of India', 3,
        'Topic', 'History', 'history', 'history.modern_india',
        ARRAY['history.modern_india.british_conquest_consolidation_of_india.british_conquest_of_bengal', 'history.modern_india.british_conquest_consolidation_of_india.subjugation_of_mysore_marathas', 'history.modern_india.british_conquest_consolidation_of_india.conquest_of_sindh_punjab_frontier_regions']::text[], ARRAY['history', 'history.modern_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['British', 'Conquest', 'Consolidation', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
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
        'history.modern_india.british_expansionist_policies_administrative_machinery', 'british_expansionist_policies_administrative_machinery', 'British Expansionist Policies & Administrative Machinery', 3,
        'Topic', 'History', 'history', 'history.modern_india',
        ARRAY['history.modern_india.british_expansionist_policies_administrative_machinery.expansionist_doctrines', 'history.modern_india.british_expansionist_policies_administrative_machinery.administrative_judicial_police_systems']::text[], ARRAY['history', 'history.modern_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['British', 'Expansionist', 'Policies', 'Administrative', 'Machinery']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.modern_india.economic_impact_of_british_rule', 'economic_impact_of_british_rule', 'Economic Impact of British Rule', 3,
        'Topic', 'History', 'history', 'history.modern_india',
        ARRAY['history.modern_india.economic_impact_of_british_rule.colonial_land_revenue_systems', 'history.modern_india.economic_impact_of_british_rule.deindustrialisation_commercialisation', 'history.modern_india.economic_impact_of_british_rule.drain_of_wealth_famine_dynamics']::text[], ARRAY['history', 'history.modern_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Economic', 'Impact', 'British', 'Rule']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.modern_india.socio-religious_reform_movements', 'socio-religious_reform_movements', 'Socio-Religious Reform Movements', 3,
        'Topic', 'History', 'history', 'history.modern_india',
        ARRAY['history.modern_india.socio-religious_reform_movements.bengal_eastern_india_reforms', 'history.modern_india.socio-religious_reform_movements.western_central_india_reforms', 'history.modern_india.socio-religious_reform_movements.northern_india_reforms', 'history.modern_india.socio-religious_reform_movements.southern_india_reforms', 'history.modern_india.socio-religious_reform_movements.muslim_parsi_sikh_reform_movements']::text[], ARRAY['history', 'history.modern_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Socio', 'Religious', 'Reform', 'Movements']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.modern_india.early_peasant_tribal_civil_uprisings', 'early_peasant_tribal_civil_uprisings', 'Early Peasant, Tribal & Civil Uprisings', 3,
        'Topic', 'History', 'history', 'history.modern_india',
        ARRAY['history.modern_india.early_peasant_tribal_civil_uprisings.civil_rebellions', 'history.modern_india.early_peasant_tribal_civil_uprisings.tribal_movements_insurrections', 'history.modern_india.early_peasant_tribal_civil_uprisings.peasant_movements']::text[], ARRAY['history', 'history.modern_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Early', 'Peasant', 'Tribal', 'Civil', 'Uprisings']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.revolt_of_1857', 'revolt_of_1857', 'Revolt of 1857', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.revolt_of_1857.causes_of_the_revolt', 'history.indian_freedom_struggle.revolt_of_1857.outbreak_major_centers_leadership', 'history.indian_freedom_struggle.revolt_of_1857.british_suppression_leaders', 'history.indian_freedom_struggle.revolt_of_1857.nature_causes_of_failure_impact']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Revolt', '1857']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.growth_of_modern_nationalism_early_political_associations', 'growth_of_modern_nationalism_early_political_associations', 'Growth of Modern Nationalism & Early Political Associations', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.growth_of_modern_nationalism_early_political_associations.factors_in_rise_of_nationalism', 'history.indian_freedom_struggle.growth_of_modern_nationalism_early_political_associations.early_political_organisations']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Growth', 'Modern', 'Nationalism', 'Early', 'Political', 'Associations']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.foundation_of_inc_moderate_phase', 'foundation_of_inc_moderate_phase', 'Foundation of INC & Moderate Phase (1885–1905)', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.foundation_of_inc_moderate_phase.foundation_of_indian_national_congress', 'history.indian_freedom_struggle.foundation_of_inc_moderate_phase.moderate_leadership_ideology', 'history.indian_freedom_struggle.foundation_of_inc_moderate_phase.achievements_limitations']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Foundation', 'INC', 'Moderate', 'Phase', '1885–1905']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i', 'swadeshi_movement_extremism_revolutionary_nationalism_phase_i', 'Swadeshi Movement, Extremism & Revolutionary Nationalism Phase I (1905–1918)', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i.partition_of_bengal_swadeshi_movement', 'history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i.extremist_phase_leadership', 'history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i.revolutionary_activities_phase_i_domestic_abroad', 'history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i.constitutional_reforms_political_realignment']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Swadeshi', 'Movement', 'Extremism', 'Revolutionary', 'Nationalism', 'Phase', '1905–1918']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement', 'gandhian_era_early_satyagrahas_non-cooperation_movement', 'Gandhian Era: Early Satyagrahas & Non-Cooperation Movement (1915–1922)', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.emergence_of_mahatma_gandhi', 'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.early_indian_satyagrahas', 'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.anti-rowlatt_campaign_jallianwala_bagh', 'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.khilafat_agitation_non-cooperation_movement']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Gandhian', 'Era', 'Early', 'Satyagrahas', 'Non', 'Cooperation', 'Movement', '1915–1922']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.swarajists_revolutionary_nationalism_phase_ii_left-wing_upsurge', 'swarajists_revolutionary_nationalism_phase_ii_left-wing_upsurge', 'Swarajists, Revolutionary Nationalism Phase II & Left-Wing Upsurge (1922–1929)', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.swarajists_revolutionary_nationalism_phase_ii_left-wing_upsurge.swarajists_vs_no-changers', 'history.indian_freedom_struggle.swarajists_revolutionary_nationalism_phase_ii_left-wing_upsurge.revolutionary_nationalism_phase_ii', 'history.indian_freedom_struggle.swarajists_revolutionary_nationalism_phase_ii_left-wing_upsurge.growth_of_socialist_communist_working_class_movements']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Swarajists', 'Revolutionary', 'Nationalism', 'Phase', 'Left', 'Wing', 'Upsurge', '1922–1929']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement', 'simon_commission_nehru_report_civil_disobedience_movement', 'Simon Commission, Nehru Report & Civil Disobedience Movement (1927–1934)', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement.simon_commission_the_nehru_report', 'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement.purna_swaraj_launch_of_civil_disobedience', 'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement.spread_of_movement_regional_variations', 'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement.round_table_conferences_pacts']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Simon', 'Commission', 'Nehru', 'Report', 'Civil', 'Disobedience', 'Movement', '1927–1934']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.constitutional_impasse_1937_elections_pre-war_politics', 'constitutional_impasse_1937_elections_pre-war_politics', 'Constitutional Impasse, 1937 Elections & Pre-War Politics (1935–1939)', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.constitutional_impasse_1937_elections_pre-war_politics.government_of_india_act_1935', 'history.indian_freedom_struggle.constitutional_impasse_1937_elections_pre-war_politics.1937_provincial_elections_congress_ministries', 'history.indian_freedom_struggle.constitutional_impasse_1937_elections_pre-war_politics.haripura_tripuri_crisis_forward_bloc']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Constitutional', 'Impasse', '1937', 'Elections', 'Pre', 'War', 'Politics', '1935–1939']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.wwii_cripps_mission_quit_india_movement_ina', 'wwii_cripps_mission_quit_india_movement_ina', 'WWII, Cripps Mission, Quit India Movement & INA (1939–1945)', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.wwii_cripps_mission_quit_india_movement_ina.wartime_offers_deadlock', 'history.indian_freedom_struggle.wwii_cripps_mission_quit_india_movement_ina.quit_india_movement_august_kranti_1942', 'history.indian_freedom_struggle.wwii_cripps_mission_quit_india_movement_ina.subhash_chandra_bose_indian_national_army_ina']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['WWII', 'Cripps', 'Mission', 'Quit', 'India', 'Movement', 'INA', '1939–1945']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.indian_freedom_struggle.post-war_nationalist_upsurge_cabinet_mission_independence', 'post-war_nationalist_upsurge_cabinet_mission_independence', 'Post-War Nationalist Upsurge, Cabinet Mission & Independence (1945–1947)', 3,
        'Topic', 'History', 'history', 'history.indian_freedom_struggle',
        ARRAY['history.indian_freedom_struggle.post-war_nationalist_upsurge_cabinet_mission_independence.post-war_political_moves_trials', 'history.indian_freedom_struggle.post-war_nationalist_upsurge_cabinet_mission_independence.cabinet_mission_plan_interim_government', 'history.indian_freedom_struggle.post-war_nationalist_upsurge_cabinet_mission_independence.partition_transfer_of_power']::text[], ARRAY['history', 'history.indian_freedom_struggle']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Post', 'War', 'Nationalist', 'Upsurge', 'Cabinet', 'Mission', 'Independence', '1945–1947']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.post-independence_india.integration_of_princely_states_territorial_consolidation', 'integration_of_princely_states_territorial_consolidation', 'Integration of Princely States & Territorial Consolidation', 3,
        'Topic', 'History', 'history', 'history.post-independence_india',
        ARRAY['history.post-independence_india.integration_of_princely_states_territorial_consolidation.accession_of_565_princely_states', 'history.post-independence_india.integration_of_princely_states_territorial_consolidation.complex_accession_cases', 'history.post-independence_india.integration_of_princely_states_territorial_consolidation.territorial_consolidation_of_enclaves']::text[], ARRAY['history', 'history.post-independence_india']::text[], '{"upsc": ["Mains-GS1"], "kas": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1] [KAS: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Integration', 'Princely', 'States', 'Territorial', 'Consolidation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.post-independence_india.linguistic_reorganisation_of_states_national_consolidation', 'linguistic_reorganisation_of_states_national_consolidation', 'Linguistic Reorganisation of States & National Consolidation', 3,
        'Topic', 'History', 'history', 'history.post-independence_india',
        ARRAY['history.post-independence_india.linguistic_reorganisation_of_states_national_consolidation.linguistic_demands_commissions', 'history.post-independence_india.linguistic_reorganisation_of_states_national_consolidation.states_reorganisation_commission_implementation', 'history.post-independence_india.linguistic_reorganisation_of_states_national_consolidation.official_language_national_integration']::text[], ARRAY['history', 'history.post-independence_india']::text[], '{"upsc": ["Mains-GS1"], "kas": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1] [KAS: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Linguistic', 'Reorganisation', 'States', 'National', 'Consolidation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.post-independence_india.tribal_integration_border_policies_regional_dynamics', 'tribal_integration_border_policies_regional_dynamics', 'Tribal Integration, Border Policies & Regional Dynamics', 3,
        'Topic', 'History', 'history', 'history.post-independence_india',
        ARRAY['history.post-independence_india.tribal_integration_border_policies_regional_dynamics.nehruvian_tribal_panchsheel_integration', 'history.post-independence_india.tribal_integration_border_policies_regional_dynamics.north-east_integration_border_insurgency']::text[], ARRAY['history', 'history.post-independence_india']::text[], '{"upsc": ["Mains-GS1"], "kas": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1] [KAS: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Tribal', 'Integration', 'Border', 'Policies', 'Regional', 'Dynamics']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.post-independence_india.planned_economy_agrarian_reforms_industrial_transformation', 'planned_economy_agrarian_reforms_industrial_transformation', 'Planned Economy, Agrarian Reforms & Industrial Transformation', 3,
        'Topic', 'History', 'history', 'history.post-independence_india',
        ARRAY['history.post-independence_india.planned_economy_agrarian_reforms_industrial_transformation.planning_architecture_five_year_plans', 'history.post-independence_india.planned_economy_agrarian_reforms_industrial_transformation.agrarian_reforms_food_security']::text[], ARRAY['history', 'history.post-independence_india']::text[], '{"upsc": ["Mains-GS1"], "kas": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1] [KAS: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Planned', 'Economy', 'Agrarian', 'Reforms', 'Industrial', 'Transformation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.post-independence_india.foreign_policy_architecture_non-alignment_geopolitical_wars', 'foreign_policy_architecture_non-alignment_geopolitical_wars', 'Foreign Policy Architecture, Non-Alignment & Geopolitical Wars', 3,
        'Topic', 'History', 'history', 'history.post-independence_india',
        ARRAY['history.post-independence_india.foreign_policy_architecture_non-alignment_geopolitical_wars.foundations_of_indian_foreign_policy', 'history.post-independence_india.foreign_policy_architecture_non-alignment_geopolitical_wars.geopolitical_wars_border_conflicts', 'history.post-independence_india.foreign_policy_architecture_non-alignment_geopolitical_wars.strategic_autonomy_nuclear_programme']::text[], ARRAY['history', 'history.post-independence_india']::text[], '{"upsc": ["Mains-GS1"], "kas": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1] [KAS: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Foreign', 'Policy', 'Architecture', 'Non', 'Alignment', 'Geopolitical', 'Wars']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.post-independence_india.democratic_crises_social_movements_economic_liberalisation', 'democratic_crises_social_movements_economic_liberalisation', 'Democratic Crises, Social Movements & Economic Liberalisation (1975–1991)', 3,
        'Topic', 'History', 'history', 'history.post-independence_india',
        ARRAY['history.post-independence_india.democratic_crises_social_movements_economic_liberalisation.the_emergency_era', 'history.post-independence_india.democratic_crises_social_movements_economic_liberalisation.social_movements_political_realignments', 'history.post-independence_india.democratic_crises_social_movements_economic_liberalisation.1991_economic_crisis_lpg_reforms']::text[], ARRAY['history', 'history.post-independence_india']::text[], '{"upsc": ["Mains-GS1"], "kas": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1] [KAS: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Democratic', 'Crises', 'Social', 'Movements', 'Economic', 'Liberalisation', '1975–1991']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history.renaissance_enlightenment_scientific_revolution', 'renaissance_enlightenment_scientific_revolution', 'Renaissance, Enlightenment & Scientific Revolution', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.renaissance_enlightenment_scientific_revolution.renaissance_humanism', 'history.world_history.renaissance_enlightenment_scientific_revolution.geographical_discoveries_commercial_revolution', 'history.world_history.renaissance_enlightenment_scientific_revolution.protestant_reformation_counter-reformation', 'history.world_history.renaissance_enlightenment_scientific_revolution.scientific_revolution_the_enlightenment']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Renaissance', 'Enlightenment', 'Scientific', 'Revolution']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history.american_revolution_creation_of_us_republic', 'american_revolution_creation_of_us_republic', 'American Revolution & Creation of US Republic', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.american_revolution_creation_of_us_republic.colonial_background_causes_of_revolution', 'history.world_history.american_revolution_creation_of_us_republic.revolutionary_war_declaration_of_independence', 'history.world_history.american_revolution_creation_of_us_republic.us_constitution_global_significance']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['American', 'Revolution', 'Creation', 'Republic']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history.french_revolution_napoleonic_era', 'french_revolution_napoleonic_era', 'French Revolution & Napoleonic Era', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.french_revolution_napoleonic_era.causes_of_the_french_revolution', 'history.world_history.french_revolution_napoleonic_era.outbreak_constitutional_phase', 'history.world_history.french_revolution_napoleonic_era.radical_phase_reign_of_terror_republic', 'history.world_history.french_revolution_napoleonic_era.rise_of_napoleon_bonaparte_imperial_era', 'history.world_history.french_revolution_napoleonic_era.congress_of_vienna_1815_concert_of_europe']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['French', 'Revolution', 'Napoleonic', 'Era']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history.industrial_revolution_rise_of_capitalism_and_socialism', 'industrial_revolution_rise_of_capitalism_and_socialism', 'Industrial Revolution & Rise of Capitalism and Socialism', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.industrial_revolution_rise_of_capitalism_and_socialism.origins_technology_of_industrial_revolution', 'history.world_history.industrial_revolution_rise_of_capitalism_and_socialism.socio-economic_transformations_consequences', 'history.world_history.industrial_revolution_rise_of_capitalism_and_socialism.rise_of_economic_ideologies_capitalism_to_marxism']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Industrial', 'Revolution', 'Rise', 'Capitalism', 'Socialism']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history.19th_century_nationalism_unification_of_italy_and_germany', '19th_century_nationalism_unification_of_italy_and_germany', '19th Century Nationalism & Unification of Italy and Germany', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.19th_century_nationalism_unification_of_italy_and_germany.revolutionary_waves_in_europe', 'history.world_history.19th_century_nationalism_unification_of_italy_and_germany.unification_of_italy_risorgimento', 'history.world_history.19th_century_nationalism_unification_of_italy_and_germany.unification_of_germany']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['19th', 'Century', 'Nationalism', 'Unification', 'Italy', 'Germany']::text[],
        'civil_services', ARRAY['civil_services']::text[]
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
        'history.world_history.imperialism_colonialism_partition_of_africa_and_asia', 'imperialism_colonialism_partition_of_africa_and_asia', 'Imperialism, Colonialism & Partition of Africa and Asia', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.imperialism_colonialism_partition_of_africa_and_asia.age_of_imperialism_motives_mechanisms', 'history.world_history.imperialism_colonialism_partition_of_africa_and_asia.scramble_for_africa', 'history.world_history.imperialism_colonialism_partition_of_africa_and_asia.imperialism_in_asia_breakdown_of_traditional_empires']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Imperialism', 'Colonialism', 'Partition', 'Africa', 'Asia']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history.world_war_i_russian_revolution', 'world_war_i_russian_revolution', 'World War I & Russian Revolution', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.world_war_i_russian_revolution.causes_of_world_war_i', 'history.world_history.world_war_i_russian_revolution.course_of_the_great_war', 'history.world_history.world_war_i_russian_revolution.russian_revolutions_of_1917_soviet_state', 'history.world_history.world_war_i_russian_revolution.paris_peace_conference_treaties_of_1919']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['World', 'War', 'Russian', 'Revolution']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history.interwar_period_great_depression_rise_of_fascism_and_nazism', 'interwar_period_great_depression_rise_of_fascism_and_nazism', 'Interwar Period, Great Depression & Rise of Fascism and Nazism', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.interwar_period_great_depression_rise_of_fascism_and_nazism.the_great_depression_economic_collapse', 'history.world_history.interwar_period_great_depression_rise_of_fascism_and_nazism.rise_of_fascism_in_italy', 'history.world_history.interwar_period_great_depression_rise_of_fascism_and_nazism.rise_of_nazism_totalitarian_third_reich_in_germany', 'history.world_history.interwar_period_great_depression_rise_of_fascism_and_nazism.breakdown_of_collective_security_drift_to_war']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Interwar', 'Period', 'Great', 'Depression', 'Rise', 'Fascism', 'Nazism']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history.world_war_ii_post-war_international_order', 'world_war_ii_post-war_international_order', 'World War II & Post-War International Order', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.world_war_ii_post-war_international_order.outbreak_blitzkrieg_across_europe', 'history.world_history.world_war_ii_post-war_international_order.the_pacific_war_the_turning_points', 'history.world_history.world_war_ii_post-war_international_order.allied_counter-offensives_defeat_of_axis', 'history.world_history.world_war_ii_post-war_international_order.post-war_architecture_founding_of_the_united_nations']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['World', 'War', 'Post', 'International', 'Order']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.world_history.cold_war_era_decolonisation_disintegration_of_ussr', 'cold_war_era_decolonisation_disintegration_of_ussr', 'Cold War Era, Decolonisation & Disintegration of USSR', 3,
        'Topic', 'History', 'history', 'history.world_history',
        ARRAY['history.world_history.cold_war_era_decolonisation_disintegration_of_ussr.emergence_of_the_cold_war', 'history.world_history.cold_war_era_decolonisation_disintegration_of_ussr.cold_war_crises_nuclear_brinkmanship', 'history.world_history.cold_war_era_decolonisation_disintegration_of_ussr.global_decolonisation_movement', 'history.world_history.cold_war_era_decolonisation_disintegration_of_ussr.disintegration_of_the_soviet_union_end_of_cold_war']::text[], ARRAY['history', 'history.world_history']::text[], '{"upsc": ["Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Cold', 'War', 'Era', 'Decolonisation', 'Disintegration', 'USSR']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka.sources_prehistoric_karnataka', 'sources_prehistoric_karnataka', 'Sources & Prehistoric Karnataka', 3,
        'Topic', 'History', 'history', 'history.history_of_karnataka',
        ARRAY['history.history_of_karnataka.sources_prehistoric_karnataka.epigraphical_archaeological_sources', 'history.history_of_karnataka.sources_prehistoric_karnataka.prehistoric_sites_of_karnataka']::text[], ARRAY['history', 'history.history_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Sources', 'Prehistoric', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka.ancient_dynasties_of_karnataka', 'ancient_dynasties_of_karnataka', 'Ancient Dynasties of Karnataka', 3,
        'Topic', 'History', 'history', 'history.history_of_karnataka',
        ARRAY['history.history_of_karnataka.ancient_dynasties_of_karnataka.kadambas_of_banavasi', 'history.history_of_karnataka.ancient_dynasties_of_karnataka.western_gangas_of_talakad', 'history.history_of_karnataka.ancient_dynasties_of_karnataka.chalukyas_of_badami_early_western_chalukyas', 'history.history_of_karnataka.ancient_dynasties_of_karnataka.rashtrakutas_of_manyakheta']::text[], ARRAY['history', 'history.history_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Ancient', 'Dynasties', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka.medieval_dynasties_of_karnataka', 'medieval_dynasties_of_karnataka', 'Medieval Dynasties of Karnataka', 3,
        'Topic', 'History', 'history', 'history.history_of_karnataka',
        ARRAY['history.history_of_karnataka.medieval_dynasties_of_karnataka.western_chalukyas_of_kalyana_later_chalukyas', 'history.history_of_karnataka.medieval_dynasties_of_karnataka.kalachuris_of_kalyana_seunas', 'history.history_of_karnataka.medieval_dynasties_of_karnataka.hoysalas_of_dvarasamudra_halebidu']::text[], ARRAY['history', 'history.history_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Medieval', 'Dynasties', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms', 'vijayanagara_empire_nayaka_kingdoms', 'Vijayanagara Empire & Nayaka Kingdoms', 3,
        'Topic', 'History', 'history', 'history.history_of_karnataka',
        ARRAY['history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms.vijayanagara_empire', 'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms.post-vijayanagara_nayaka_kingdoms']::text[], ARRAY['history', 'history.history_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Vijayanagara', 'Empire', 'Nayaka', 'Kingdoms']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka.bahmanis_deccan_sultanates_in_karnataka', 'bahmanis_deccan_sultanates_in_karnataka', 'Bahmanis & Deccan Sultanates in Karnataka', 3,
        'Topic', 'History', 'history', 'history.history_of_karnataka',
        ARRAY['history.history_of_karnataka.bahmanis_deccan_sultanates_in_karnataka.bahmani_sultanate', 'history.history_of_karnataka.bahmanis_deccan_sultanates_in_karnataka.adil_shahis_of_bijapur_barid_shahis_of_bidar']::text[], ARRAY['history', 'history.history_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Bahmanis', 'Deccan', 'Sultanates', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era', 'wodeyars_of_mysore_hyder-tipu_era', 'Wodeyars of Mysore & Hyder-Tipu Era', 3,
        'Topic', 'History', 'history', 'history.history_of_karnataka',
        ARRAY['history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.early_wodeyar_dynasty_of_mysore', 'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.hyder_ali_tipu_sultan_era', 'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.princely_state_of_mysore_british_paramountcy', 'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.modernization_model_mysore_under_nalwadi_krishnaraja_wodeyar']::text[], ARRAY['history', 'history.history_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Wodeyars', 'Mysore', 'Hyder', 'Tipu', 'Era']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka.socio-religious_cultural_movements_in_karnataka', 'socio-religious_cultural_movements_in_karnataka', 'Socio-Religious & Cultural Movements in Karnataka', 3,
        'Topic', 'History', 'history', 'history.history_of_karnataka',
        ARRAY['history.history_of_karnataka.socio-religious_cultural_movements_in_karnataka.vachana_movement_veerashaiva_sharana_revolution', 'history.history_of_karnataka.socio-religious_cultural_movements_in_karnataka.haridasa_movement_dasa_sahitya']::text[], ARRAY['history', 'history.history_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Socio', 'Religious', 'Cultural', 'Movements', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka.armed_resistance_freedom_movement_in_karnataka', 'armed_resistance_freedom_movement_in_karnataka', 'Armed Resistance & Freedom Movement in Karnataka', 3,
        'Topic', 'History', 'history', 'history.history_of_karnataka',
        ARRAY['history.history_of_karnataka.armed_resistance_freedom_movement_in_karnataka.early_armed_uprisings_against_british', 'history.history_of_karnataka.armed_resistance_freedom_movement_in_karnataka.nationalist_movement_gandhian_agitations_in_karnataka']::text[], ARRAY['history', 'history.history_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Armed', 'Resistance', 'Freedom', 'Movement', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation', 'karnataka_unification_movement_post-independence_social_transformation', 'Karnataka Unification Movement (Ekikarana) & Post-Independence Social Transformation', 3,
        'Topic', 'History', 'history', 'history.history_of_karnataka',
        ARRAY['history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation.karnataka_ekikarana_movement', 'history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation.social_engineering_land_reforms_under_d_devaraj_urs']::text[], ARRAY['history', 'history.history_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Karnataka', 'Unification', 'Movement', 'Ekikarana', 'Post', 'Independence', 'Social', 'Transformation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_architecture_sculpture.harappan_architecture_town_planning', 'harappan_architecture_town_planning', 'Harappan Architecture & Town Planning (Citadel, Great Bath, Granaries, Drainage System)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture',
        ARRAY['art_culture_heritage.indian_architecture_sculpture.harappan_architecture_town_planning.harappan_citadel_lower_town_drainage_systems', 'art_culture_heritage.indian_architecture_sculpture.harappan_architecture_town_planning.harappan_sculptures_dancing_girl_priest_king']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Harappan', 'Architecture', 'Town', 'Planning', 'Citadel', 'Great', 'Bath', 'Granaries', 'Drainage', 'System']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_architecture_sculpture.mauryan_art_pillars', 'mauryan_art_pillars', 'Mauryan Art & Pillars (Ashokan Pillars, Stupas, Sanchi, Bharhut, Rock-Cut Caves - Barabar)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture',
        ARRAY['art_culture_heritage.indian_architecture_sculpture.mauryan_art_pillars.ashokan_pillars_capitals_lion_capital_sarnath', 'art_culture_heritage.indian_architecture_sculpture.mauryan_art_pillars.mauryan_rock_cut_caves_barabar_didarganj_yakshi']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Mauryan', 'Art', 'Pillars', 'Ashokan', 'Stupas', 'Sanchi', 'Bharhut', 'Rock', 'Cut', 'Caves', 'Barabar']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_architecture_sculpture.post-mauryan_caves_sculpture', 'post-mauryan_caves_sculpture', 'Post-Mauryan Caves & Sculpture (Karle, Bhaja, Kanheri, Gandhara, Mathura & Amaravati Schools of Art)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture',
        ARRAY['art_culture_heritage.indian_architecture_sculpture.post-mauryan_caves_sculpture.gandhara_mathura_amaravati_sculptural_schools', 'art_culture_heritage.indian_architecture_sculpture.post-mauryan_caves_sculpture.stupa_architecture_sanchi_chaityas_viharas']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Post', 'Mauryan', 'Caves', 'Sculpture', 'Karle', 'Bhaja', 'Kanheri', 'Gandhara', 'Mathura', 'Amaravati', 'Schools', 'Art']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_architecture_sculpture.temple_architecture_styles', 'temple_architecture_styles', 'Temple Architecture Styles (Nagara Style - Odisha, Khajuraho, Solanki; Dravida Style - Pallava, Chola, Vijayanagara; Vesara / Chalukyan Style - Badami, Pattadakal, Hoysala)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture',
        ARRAY['art_culture_heritage.indian_architecture_sculpture.temple_architecture_styles.nagara_temple_style_odisha_khajuraho_solanki', 'art_culture_heritage.indian_architecture_sculpture.temple_architecture_styles.dravida_temple_style_pallava_chola_nayaka', 'art_culture_heritage.indian_architecture_sculpture.temple_architecture_styles.vesara_hybrid_style_chalukya_rashtrakuta']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Temple', 'Architecture', 'Styles', 'Nagara', 'Style', 'Odisha', 'Khajuraho', 'Solanki', 'Dravida', 'Pallava', 'Chola', 'Vijayanagara', 'Vesara', 'Chalukyan', 'Badami', 'Pattadakal', 'Hoysala']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_architecture_sculpture.indo-islamic_architecture', 'indo-islamic_architecture', 'Indo-Islamic Architecture (Imperial / Delhi Sultanate Style, Provincial Styles, Mughal Architecture - Taj Mahal, Fatehpur Sikri, Red Fort)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture',
        ARRAY['art_culture_heritage.indian_architecture_sculpture.indo-islamic_architecture.delhi_sultanate_architecture_mamluk_to_lodi', 'art_culture_heritage.indian_architecture_sculpture.indo-islamic_architecture.mughal_architecture_humayun_to_shah_jahan']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indo', 'Islamic', 'Architecture', 'Imperial', 'Delhi', 'Sultanate', 'Style', 'Provincial', 'Styles', 'Mughal', 'Taj', 'Mahal', 'Fatehpur', 'Sikri', 'Red', 'Fort']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_architecture_sculpture.colonial_modern_architecture', 'colonial_modern_architecture', 'Colonial & Modern Architecture (Indo-Saracenic Architecture, Neo-Gothic Style, Neo-Classical Style, Lutyens'' Delhi)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture',
        ARRAY['art_culture_heritage.indian_architecture_sculpture.colonial_modern_architecture.colonial_indo_saracenic_neo_gothic_architecture', 'art_culture_heritage.indian_architecture_sculpture.colonial_modern_architecture.modern_post_independence_architecture_lutyens_corbusier']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_architecture_sculpture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Colonial', 'Modern', 'Architecture', 'Indo', 'Saracenic', 'Neo', 'Gothic', 'Style', 'Classical', 'Lutyens', 'Delhi']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_paintings_visual_arts.prehistoric_rock_art', 'prehistoric_rock_art', 'Prehistoric Rock Art (Bhimbetka, Lakhudiyar, Kupgallu)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_paintings_visual_arts',
        ARRAY['art_culture_heritage.indian_paintings_visual_arts.prehistoric_rock_art.prehistoric_rock_art_bhimbetka_lakhudiyar']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_paintings_visual_arts']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Prehistoric', 'Rock', 'Art', 'Bhimbetka', 'Lakhudiyar', 'Kupgallu']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_paintings_visual_arts.ancient_medieval_murals', 'ancient_medieval_murals', 'Ancient & Medieval Murals (Ajanta Caves, Ellora, Bagh Caves, Sittanavasal, Lepakshi)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_paintings_visual_arts',
        ARRAY['art_culture_heritage.indian_paintings_visual_arts.ancient_medieval_murals.classical_murals_ajanta_ellora_bagh_sittanavasal']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_paintings_visual_arts']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Ancient', 'Medieval', 'Murals', 'Ajanta', 'Caves', 'Ellora', 'Bagh', 'Sittanavasal', 'Lepakshi']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_paintings_visual_arts.miniature_painting_traditions', 'miniature_painting_traditions', 'Miniature Painting Traditions (Pala & Jain Manuscript Paintings, Mughal School, Rajasthani Schools - Mewar, Marwar, Kishangarh Bani Thani, Pahari Schools - Basohli, Kangra)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_paintings_visual_arts',
        ARRAY['art_culture_heritage.indian_paintings_visual_arts.miniature_painting_traditions.mughal_miniature_painting_traditions', 'art_culture_heritage.indian_paintings_visual_arts.miniature_painting_traditions.rajasthani_miniatures_mewar_kishangarh_bundi', 'art_culture_heritage.indian_paintings_visual_arts.miniature_painting_traditions.pahari_and_deccani_miniature_schools']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_paintings_visual_arts']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Miniature', 'Painting', 'Traditions', 'Pala', 'Jain', 'Manuscript', 'Paintings', 'Mughal', 'School', 'Rajasthani', 'Schools', 'Mewar', 'Marwar', 'Kishangarh', 'Bani', 'Thani', 'Pahari', 'Basohli', 'Kangra']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_paintings_visual_arts.folk_regional_painting_styles', 'folk_regional_painting_styles', 'Folk & Regional Painting Styles (Madhubani / Mithila, Kalamkari, Pattachitra, Warli, Tanjore Paintings, Phad, Gond, Cheriyal)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_paintings_visual_arts',
        ARRAY['art_culture_heritage.indian_paintings_visual_arts.folk_regional_painting_styles.madhubani_pattachitra_kalamkari_folk_paintings', 'art_culture_heritage.indian_paintings_visual_arts.folk_regional_painting_styles.tribal_and_ritual_paintings_warli_gond_pithora']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_paintings_visual_arts']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Folk', 'Regional', 'Painting', 'Styles', 'Madhubani', 'Mithila', 'Kalamkari', 'Pattachitra', 'Warli', 'Tanjore', 'Paintings', 'Phad', 'Gond', 'Cheriyal']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.performing_arts.classical_dance_traditions', 'classical_dance_traditions', 'Classical Dance Traditions (Bharatanatyam, Kathak, Kathakali, Kuchipudi, Manipuri, Mohiniyattam, Odissi, Sattriya)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.performing_arts',
        ARRAY['art_culture_heritage.performing_arts.classical_dance_traditions.classical_dances_bharatanatyam_odissi_kuchipudi', 'art_culture_heritage.performing_arts.classical_dance_traditions.classical_dances_kathak_kathakali_mohiniyattam', 'art_culture_heritage.performing_arts.classical_dance_traditions.classical_dances_manipuri_sattriya_chhau']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.performing_arts']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Classical', 'Dance', 'Traditions', 'Bharatanatyam', 'Kathak', 'Kathakali', 'Kuchipudi', 'Manipuri', 'Mohiniyattam', 'Odissi', 'Sattriya']::text[],
        'civil_services', ARRAY['civil_services']::text[]
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
        'art_culture_heritage.performing_arts.folk_dances_of_india', 'folk_dances_of_india', 'Folk Dances of India (Bhangra, Ghoomar, Chhau, Garba, Lavani, Yakshagana, Bihu, Rouf, Koodiyattam)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.performing_arts',
        ARRAY['art_culture_heritage.performing_arts.folk_dances_of_india.major_regional_folk_dances_north_south_west_east']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.performing_arts']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Folk', 'Dances', 'India', 'Bhangra', 'Ghoomar', 'Chhau', 'Garba', 'Lavani', 'Yakshagana', 'Bihu', 'Rouf', 'Koodiyattam']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.performing_arts.indian_classical_music_systems', 'indian_classical_music_systems', 'Indian Classical Music Systems (Hindustani Music - Dhrupad, Khayal, Thumri, Tappa; Carnatic Music - Kriti, Varnam, Ragam Tanam Pallavi)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.performing_arts',
        ARRAY['art_culture_heritage.performing_arts.indian_classical_music_systems.hindustani_classical_music_thaats_gharanas_forms', 'art_culture_heritage.performing_arts.indian_classical_music_systems.carnatic_classical_music_melakarta_trinity_forms']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.performing_arts']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Classical', 'Music', 'Systems', 'Hindustani', 'Dhrupad', 'Khayal', 'Thumri', 'Tappa', 'Carnatic', 'Kriti', 'Varnam', 'Ragam', 'Tanam', 'Pallavi']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.performing_arts.musical_instruments_folk_music', 'musical_instruments_folk_music', 'Musical Instruments & Folk Music (Stringed / Tat, Wind / Sushira, Percussion / Avanaddha, Solid / Ghana; Baul, Bihu, Pandavani, Bhatiali)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.performing_arts',
        ARRAY['art_culture_heritage.performing_arts.musical_instruments_folk_music.fourfold_classification_of_indian_musical_instruments']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.performing_arts']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Musical', 'Instruments', 'Folk', 'Music', 'Stringed', 'Tat', 'Wind', 'Sushira', 'Percussion', 'Avanaddha', 'Solid', 'Ghana', 'Baul', 'Bihu', 'Pandavani', 'Bhatiali']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.performing_arts.traditional_theatre_forms_puppetry', 'traditional_theatre_forms_puppetry', 'Traditional Theatre Forms & Puppetry (Yakshagana, Nautanki, Jatra, Bhavai, Tamasha, Dashavatar, Bhand Pather; String, Glove, Rod & Shadow Puppetry)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.performing_arts',
        ARRAY['art_culture_heritage.performing_arts.traditional_theatre_forms_puppetry.traditional_theatre_and_puppetry_forms_of_india']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.performing_arts']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Traditional', 'Theatre', 'Forms', 'Puppetry', 'Yakshagana', 'Nautanki', 'Jatra', 'Bhavai', 'Tamasha', 'Dashavatar', 'Bhand', 'Pather', 'String', 'Glove', 'Rod', 'Shadow']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_literature_languages.vedic_epic_puranic_literature', 'vedic_epic_puranic_literature', 'Vedic, Epic & Puranic Literature (Rigveda, Samaveda, Yajurveda, Atharvaveda, Upanishads, Mahabharata, Ramayana, Puranas)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_literature_languages',
        ARRAY['art_culture_heritage.indian_literature_languages.vedic_epic_puranic_literature.vedic_corpus_samhitas_upanishads_darshana']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_literature_languages']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Vedic', 'Epic', 'Puranic', 'Literature', 'Rigveda', 'Samaveda', 'Yajurveda', 'Atharvaveda', 'Upanishads', 'Mahabharata', 'Ramayana', 'Puranas']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_literature_languages.classical_religious_texts', 'classical_religious_texts', 'Classical & Religious Texts (Buddhist Canon - Tripitakas, Jatakas; Jain Canon - Agamas; Sangam Literature - Ettuthokai, Pattupattu, Silappatikaram, Manimekalai)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_literature_languages',
        ARRAY['art_culture_heritage.indian_literature_languages.classical_religious_texts.classical_sanskrit_literature_kalidasa_bhasa', 'art_culture_heritage.indian_literature_languages.classical_religious_texts.sangam_literature_corpus_tamil_classics']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_literature_languages']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Classical', 'Religious', 'Texts', 'Buddhist', 'Canon', 'Tripitakas', 'Jatakas', 'Jain', 'Agamas', 'Sangam', 'Literature', 'Ettuthokai', 'Pattupattu', 'Silappatikaram', 'Manimekalai']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_literature_languages.medieval_bhakti-sufi_literature', 'medieval_bhakti-sufi_literature', 'Medieval & Bhakti-Sufi Literature (Kabir, Tulsidas, Surdas, Guru Nanak, Amir Khusrau, Alvars & Nayanars Compositions)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_literature_languages',
        ARRAY['art_culture_heritage.indian_literature_languages.medieval_bhakti-sufi_literature.bhakti_and_sufi_literary_traditions_vernacular']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_literature_languages']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Medieval', 'Bhakti', 'Sufi', 'Literature', 'Kabir', 'Tulsidas', 'Surdas', 'Guru', 'Nanak', 'Amir', 'Khusrau', 'Alvars', 'Nayanars', 'Compositions']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_literature_languages.scientific_astronomical_legal_treatises', 'scientific_astronomical_legal_treatises', 'Scientific, Astronomical & Legal Treatises (Aryabhatiya, Sushruta Samhita, Charaka Samhita, Arthashastra, Manusmriti, Mitakshara, Dayabhaga)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_literature_languages',
        ARRAY[]::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_literature_languages']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Scientific', 'Astronomical', 'Legal', 'Treatises', 'Aryabhatiya', 'Sushruta', 'Samhita', 'Charaka', 'Arthashastra', 'Manusmriti', 'Mitakshara', 'Dayabhaga']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.schools_of_indian_philosophy.orthodox_astika_systems', 'orthodox_astika_systems', 'Orthodox / Astika Systems (Samkhya - Kapila, Yoga - Patanjali, Nyaya - Gautama, Vaisheshika - Kanada, Mimamsa - Jaimini, Vedanta - Shankara, Ramanuja, Madhva)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.schools_of_indian_philosophy',
        ARRAY['art_culture_heritage.schools_of_indian_philosophy.orthodox_astika_systems.six_orthodox_schools_shad_darshana_philosophy']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.schools_of_indian_philosophy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Orthodox', 'Astika', 'Systems', 'Samkhya', 'Kapila', 'Yoga', 'Patanjali', 'Nyaya', 'Gautama', 'Vaisheshika', 'Kanada', 'Mimamsa', 'Jaimini', 'Vedanta', 'Shankara', 'Ramanuja', 'Madhva']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.schools_of_indian_philosophy.heterodox_nastika_systems', 'heterodox_nastika_systems', 'Heterodox / Nastika Systems (Carvaka / Lokayata Materialism, Ajivika Determinism, Jain Philosophy - Anekantavada, Syadvada, Buddhist Philosophy - Pratityasamutpada, Anatta, Shunyata)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.schools_of_indian_philosophy',
        ARRAY['art_culture_heritage.schools_of_indian_philosophy.heterodox_nastika_systems.heterodox_traditions_buddhism_jainism_charvaka_ajivika']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.schools_of_indian_philosophy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Heterodox', 'Nastika', 'Systems', 'Carvaka', 'Lokayata', 'Materialism', 'Ajivika', 'Determinism', 'Jain', 'Philosophy', 'Anekantavada', 'Syadvada', 'Buddhist', 'Pratityasamutpada', 'Anatta', 'Shunyata']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.fairs_festivals_crafts_unesco_heritage.traditional_handicrafts_textiles', 'traditional_handicrafts_textiles', 'Traditional Handicrafts & Textiles (Kanjeevaram, Banarasi, Ikat, Chanderi, Pashmina, Chikankari, Zardozi, Terracotta, Bidriware)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage',
        ARRAY['art_culture_heritage.fairs_festivals_crafts_unesco_heritage.traditional_handicrafts_textiles.traditional_indian_textiles_embroidery_gi_tags', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage.traditional_handicrafts_textiles.traditional_metal_clay_stone_wood_crafts']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Traditional', 'Handicrafts', 'Textiles', 'Kanjeevaram', 'Banarasi', 'Ikat', 'Chanderi', 'Pashmina', 'Chikankari', 'Zardozi', 'Terracotta', 'Bidriware']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.fairs_festivals_crafts_unesco_heritage.unesco_world_heritage_sites_intangible_cultural_heritage', 'unesco_world_heritage_sites_intangible_cultural_heritage', 'UNESCO World Heritage Sites & Intangible Cultural Heritage (Kumbh Mela, Yoga, Vedic Chanting, Ramlila, Chhau Dance, Mudiyettu, Durga Puja, Garba)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage',
        ARRAY['art_culture_heritage.fairs_festivals_crafts_unesco_heritage.unesco_world_heritage_sites_intangible_cultural_heritage.unesco_cultural_world_heritage_sites_india', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage.unesco_world_heritage_sites_intangible_cultural_heritage.unesco_intangible_cultural_heritage_ich_india']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['UNESCO', 'World', 'Heritage', 'Sites', 'Intangible', 'Cultural', 'Kumbh', 'Mela', 'Yoga', 'Vedic', 'Chanting', 'Ramlila', 'Chhau', 'Dance', 'Mudiyettu', 'Durga', 'Puja', 'Garba']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.physical_geography_earth_systems.earths_origin_internal_structure', 'earths_origin_internal_structure', 'Earth''s Origin & Internal Structure (Crust, Mantle, Core, Discontinuities - Mohorovicic, Gutenberg, Seismic Waves P & S)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems',
        ARRAY['geography_earth_systems.physical_geography_earth_systems.earths_origin_internal_structure.earths_internal_layers_crust_mantle_core', 'geography_earth_systems.physical_geography_earth_systems.earths_origin_internal_structure.seismic_discontinuities_wave_shadow_zones', 'geography_earth_systems.physical_geography_earth_systems.earths_origin_internal_structure.geological_time_scale_and_stratigraphy']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Earth''s', 'Origin', 'Internal', 'Structure', 'Crust', 'Mantle', 'Core', 'Discontinuities', 'Mohorovicic', 'Gutenberg', 'Seismic', 'Waves']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics', 'continental_drift_plate_tectonics', 'Continental Drift & Plate Tectonics (Pangaea, Plate Boundaries - Divergent, Convergent, Transform, Sea Floor Spreading, Ring of Fire)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems',
        ARRAY['geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics.continental_drift_theory_and_paleomagnetism', 'geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics.seafloor_spreading_and_magnetic_striping', 'geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics.plate_tectonics_boundary_types_and_ring_of_fire']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Continental', 'Drift', 'Plate', 'Tectonics', 'Pangaea', 'Boundaries', 'Divergent', 'Convergent', 'Transform', 'Sea', 'Floor', 'Spreading', 'Ring', 'Fire']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_landform_evolution', 'geomorphic_processes_landform_evolution', 'Geomorphic Processes & Landform Evolution (Weathering - Physical, Chemical, Biological; Mass Wasting; Fluvial, Glacial, Aeolian, Karst & Coastal Landforms)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems',
        ARRAY['geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_landform_evolution.weathering_processes_and_mass_wasting', 'geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_landform_evolution.fluvial_cycle_erosional_depositional_landforms', 'geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_landform_evolution.glacial_erosional_and_depositional_landforms', 'geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_landform_evolution.aeolian_arid_erosional_depositional_landforms', 'geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_landform_evolution.karst_topography_limestone_caves_speleothems', 'geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_landform_evolution.coastal_erosional_and_depositional_landforms']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Geomorphic', 'Processes', 'Landform', 'Evolution', 'Weathering', 'Physical', 'Chemical', 'Biological', 'Mass', 'Wasting', 'Fluvial', 'Glacial', 'Aeolian', 'Karst', 'Coastal', 'Landforms']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget', 'atmosphere_structure_heat_budget', 'Atmosphere Structure & Heat Budget (Troposphere, Stratosphere, Mesosphere, Thermosphere; Insolation, Terrestrial Radiation, Atmospheric Heat Budget)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics',
        ARRAY['geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget.atmospheric_layers_composition_lapse_rates', 'geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget.solar_insolation_heat_budget_albedo', 'geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget.temperature_inversion_phenomena_and_types']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Atmosphere', 'Structure', 'Heat', 'Budget', 'Troposphere', 'Stratosphere', 'Mesosphere', 'Thermosphere', 'Insolation', 'Terrestrial', 'Radiation', 'Atmospheric']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts', 'atmospheric_pressure_global_wind_belts', 'Atmospheric Pressure & Global Wind Belts (Pressure Belts - Equatorial Low, Subtropical High, Subpolar Low; Planetary Winds - Trade Winds, Westerlies, Polar Easterlies; Jet Streams)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics',
        ARRAY['geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts.pressure_belts_tricellular_circulation_hadley', 'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts.coriolis_force_geostrophic_winds_jet_streams', 'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_pressure_global_wind_belts.planetary_winds_and_local_regional_winds']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Atmospheric', 'Pressure', 'Global', 'Wind', 'Belts', 'Equatorial', 'Low', 'Subtropical', 'High', 'Subpolar', 'Planetary', 'Winds', 'Trade', 'Westerlies', 'Polar', 'Easterlies', 'Jet', 'Streams']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.climatology_atmospheric_dynamics.air_masses_fronts_cyclogenesis', 'air_masses_fronts_cyclogenesis', 'Air Masses, Fronts & Cyclogenesis (Air Mass Types, Fronts - Warm, Cold, Occluded; Tropical Cyclones vs Temperate / Extra-Tropical Cyclones, Eye of Cyclone)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics',
        ARRAY['geography_earth_systems.climatology_atmospheric_dynamics.air_masses_fronts_cyclogenesis.air_masses_and_frontal_frontogenesis_types', 'geography_earth_systems.climatology_atmospheric_dynamics.air_masses_fronts_cyclogenesis.temperate_wave_cyclones_vs_tropical_cyclones']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Air', 'Masses', 'Fronts', 'Cyclogenesis', 'Mass', 'Types', 'Warm', 'Cold', 'Occluded', 'Tropical', 'Cyclones', 'Temperate', 'Extra', 'Eye', 'Cyclone']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.climatology_atmospheric_dynamics.world_climate_regions', 'world_climate_regions', 'World Climate Regions (Equatorial, Tropical Monsoon, Savanna, Mediterranean, Steppe, Taiga, Tundra, Desert Climates)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics',
        ARRAY['geography_earth_systems.climatology_atmospheric_dynamics.world_climate_regions.koppen_climate_classification_and_biomes']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['World', 'Climate', 'Regions', 'Equatorial', 'Tropical', 'Monsoon', 'Savanna', 'Mediterranean', 'Steppe', 'Taiga', 'Tundra', 'Desert', 'Climates']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.oceanography_marine_systems.ocean_floor_relief_features', 'ocean_floor_relief_features', 'Ocean Floor Relief & Features (Continental Shelf, Slope, Abyssal Plains, Oceanic Trenches, Mid-Oceanic Ridges)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.oceanography_marine_systems',
        ARRAY['geography_earth_systems.oceanography_marine_systems.ocean_floor_relief_features.ocean_bottom_relief_shelf_slope_abyssal_plains', 'geography_earth_systems.oceanography_marine_systems.ocean_floor_relief_features.submarine_canyons_trenches_mid_oceanic_ridges']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.oceanography_marine_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Ocean', 'Floor', 'Relief', 'Features', 'Continental', 'Shelf', 'Slope', 'Abyssal', 'Plains', 'Oceanic', 'Trenches', 'Mid', 'Ridges']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics', 'ocean_water_dynamics', 'Ocean Water Dynamics (Temperature & Salinity Distribution, Ocean Currents - Warm & Cold Currents, Thermohaline Circulation, Tides - Spring & Neap Tides)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.oceanography_marine_systems',
        ARRAY['geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics.ocean_temperature_salinity_density_stratification', 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics.ocean_waves_mechanics_and_wave_energy', 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics.tides_mechanics_types_and_amphidromic_systems', 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics.ocean_currents_gyres_and_thermohaline_circulation', 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics.enso_dynamics_and_indian_ocean_dipole']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.oceanography_marine_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Ocean', 'Water', 'Dynamics', 'Temperature', 'Salinity', 'Distribution', 'Currents', 'Warm', 'Cold', 'Thermohaline', 'Circulation', 'Tides', 'Spring', 'Neap']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.oceanography_marine_systems.marine_ecosystems_conservation', 'marine_ecosystems_conservation', 'Marine Ecosystems & Conservation (Coral Reefs - Fringing, Barrier, Atoll; Coral Bleaching, Blue Carbon, Ocean Acidification, EEZ, Marine Protected Areas)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.oceanography_marine_systems',
        ARRAY['geography_earth_systems.oceanography_marine_systems.marine_ecosystems_conservation.coral_reefs_ecosystems_darwin_subsidence_bleaching', 'geography_earth_systems.oceanography_marine_systems.marine_ecosystems_conservation.marine_resources_unclos_zones_blue_economy']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.oceanography_marine_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Marine', 'Ecosystems', 'Conservation', 'Coral', 'Reefs', 'Fringing', 'Barrier', 'Atoll', 'Bleaching', 'Blue', 'Carbon', 'Ocean', 'Acidification', 'EEZ', 'Protected', 'Areas']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india', 'physiographic_divisions_of_india', 'Physiographic Divisions of India (Himalayan Mountain System, Northern Great Plains, Peninsular Plateau, Coastal Plains, Lakshadweep & Andaman Nicobar Islands)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_physical_geography_monsoon_architecture',
        ARRAY['geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india.himalayan_mountain_system_divisions_passes', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india.northern_great_plains_morphology', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india.peninsular_plateau_hills_western_eastern_ghats', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.physiographic_divisions_of_india.coastal_plains_and_island_territories_of_india']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_physical_geography_monsoon_architecture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Physiographic', 'Divisions', 'India', 'Himalayan', 'Mountain', 'System', 'Northern', 'Great', 'Plains', 'Peninsular', 'Plateau', 'Coastal', 'Lakshadweep', 'Andaman', 'Nicobar', 'Islands']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india', 'drainage_systems_of_india', 'Drainage Systems of India (Himalayan Rivers - Indus, Ganga, Brahmaputra; Peninsular Rivers - Narmada, Tapi, Godavari, Krishna, Kaveri, Mahanadi; River Interlinking)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_physical_geography_monsoon_architecture',
        ARRAY['geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india.himalayan_river_systems_indus_ganga_brahmaputra', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india.peninsular_river_systems_east_and_west_flowing', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india.river_interlinking_water_disputes_watershed']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_physical_geography_monsoon_architecture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Drainage', 'Systems', 'India', 'Himalayan', 'Rivers', 'Indus', 'Ganga', 'Brahmaputra', 'Peninsular', 'Narmada', 'Tapi', 'Godavari', 'Krishna', 'Kaveri', 'Mahanadi', 'River', 'Interlinking']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_physical_geography_monsoon_architecture.indian_monsoon_climate_dynamics', 'indian_monsoon_climate_dynamics', 'Indian Monsoon & Climate Dynamics (South-West & North-East Monsoons, Mechanism of Monsoon - ITCZ Shift, Jet Streams, El Niño, La Niña, Indian Ocean Dipole / IOD, Western Disturbances)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_physical_geography_monsoon_architecture',
        ARRAY['geography_earth_systems.indian_physical_geography_monsoon_architecture.indian_monsoon_climate_dynamics.southwest_and_northeast_monsoon_progression', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.indian_monsoon_climate_dynamics.upper_air_jet_streams_and_teleconnections_monsoon', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.indian_monsoon_climate_dynamics.western_disturbances_and_extreme_weather_events']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_physical_geography_monsoon_architecture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Monsoon', 'Climate', 'Dynamics', 'South', 'West', 'North', 'East', 'Monsoons', 'Mechanism', 'ITCZ', 'Shift', 'Jet', 'Streams', 'Niño', 'Niña', 'Ocean', 'Dipole', 'IOD', 'Western', 'Disturbances']::text[],
        'civil_services', ARRAY['civil_services']::text[]
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
        'geography_earth_systems.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india', 'soils_natural_vegetation_of_india', 'Soils & Natural Vegetation of India (Soil Types - Alluvial, Black / Regur, Red, Laterite, Arid, Saline; Forest Types - Tropical Evergreen, Deciduous, Thorn, Montane, Mangroves)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_physical_geography_monsoon_architecture',
        ARRAY['geography_earth_systems.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india.major_soil_types_of_india_and_land_degradation', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india.natural_vegetation_and_forest_types_of_india', 'geography_earth_systems.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india.india_state_of_forest_report_isfr_and_conservation']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_physical_geography_monsoon_architecture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Soils', 'Natural', 'Vegetation', 'India', 'Soil', 'Types', 'Alluvial', 'Black', 'Regur', 'Red', 'Laterite', 'Arid', 'Saline', 'Forest', 'Tropical', 'Evergreen', 'Deciduous', 'Thorn', 'Montane', 'Mangroves']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.economic_resource_geography.global_indian_distribution_of_natural_resources', 'global_indian_distribution_of_natural_resources', 'Global & Indian Distribution of Natural Resources (Mineral Resources - Iron Ore, Bauxite, Copper, Coal, Petroleum, Natural Gas, Uranium; Water Resources, Land & Soil Resources)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.economic_resource_geography',
        ARRAY['geography_earth_systems.economic_resource_geography.global_indian_distribution_of_natural_resources.metallic_and_non_metallic_mineral_belts', 'geography_earth_systems.economic_resource_geography.global_indian_distribution_of_natural_resources.energy_resources_fossil_fuels_nuclear_renewables', 'geography_earth_systems.economic_resource_geography.global_indian_distribution_of_natural_resources.water_resources_multipurpose_dams_and_irrigation']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.economic_resource_geography']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Global', 'Indian', 'Distribution', 'Natural', 'Resources', 'Mineral', 'Iron', 'Ore', 'Bauxite', 'Copper', 'Coal', 'Petroleum', 'Gas', 'Uranium', 'Water', 'Land', 'Soil']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries', 'location_factors_of_primary_secondary_tertiary_industries', 'Location Factors of Primary, Secondary & Tertiary Industries (Raw Material, Power, Labour, Market, Transport; Iron & Steel, Cotton Textile, Petrochemical, Pharmaceutical, IT Industries)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.economic_resource_geography',
        ARRAY['geography_earth_systems.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries.industrial_location_theories_and_weberian_model', 'geography_earth_systems.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries.heavy_metallurgical_and_engineering_industries', 'geography_earth_systems.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries.textile_chemical_and_agro_processing_industries', 'geography_earth_systems.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries.knowledge_based_high_tech_and_footloose_industries']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.economic_resource_geography']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Location', 'Factors', 'Primary', 'Secondary', 'Tertiary', 'Industries', 'Raw', 'Material', 'Power', 'Labour', 'Market', 'Transport', 'Iron', 'Steel', 'Cotton', 'Textile', 'Petrochemical', 'Pharmaceutical']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.human_geography_population_settlements.global_indian_demographic_trends', 'global_indian_demographic_trends', 'Global & Indian Demographic Trends (Population Distribution, Density, Growth Models - Demographic Transition Theory, Migration Types & Push-Pull Factors)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.human_geography_population_settlements',
        ARRAY['geography_earth_systems.human_geography_population_settlements.global_indian_demographic_trends.demographic_attributes_and_population_dynamics', 'geography_earth_systems.human_geography_population_settlements.global_indian_demographic_trends.theories_of_population_and_demographic_transition', 'geography_earth_systems.human_geography_population_settlements.global_indian_demographic_trends.migration_patterns_determinants_and_consequences']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.human_geography_population_settlements']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Global', 'Indian', 'Demographic', 'Trends', 'Population', 'Distribution', 'Density', 'Growth', 'Models', 'Transition', 'Theory', 'Migration', 'Types', 'Push', 'Pull', 'Factors']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.human_geography_population_settlements.human_settlements_urban_systems', 'human_settlements_urban_systems', 'Human Settlements & Urban Systems (Rural Settlement Types - Clustered, Dispersed; Urban Classification, Conurbations, Megalopolis, Functional Classification of Towns)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.human_geography_population_settlements',
        ARRAY['geography_earth_systems.human_geography_population_settlements.human_settlements_urban_systems.rural_settlement_morphology_and_classification', 'geography_earth_systems.human_geography_population_settlements.human_settlements_urban_systems.urbanization_processes_hierarchy_and_functional_towns', 'geography_earth_systems.human_geography_population_settlements.human_settlements_urban_systems.urban_morphology_land_use_models_and_challenges']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.human_geography_population_settlements']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Human', 'Settlements', 'Urban', 'Systems', 'Rural', 'Settlement', 'Types', 'Clustered', 'Dispersed', 'Classification', 'Conurbations', 'Megalopolis', 'Functional', 'Towns']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.physiography_relief_divisions_of_karnataka', 'physiography_relief_divisions_of_karnataka', 'Physiography & Relief Divisions of Karnataka', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY['geography_earth_systems.geography_of_karnataka.physiography_relief_divisions_of_karnataka.karavali_coastal_plains', 'geography_earth_systems.geography_of_karnataka.physiography_relief_divisions_of_karnataka.malnad_western_ghats_sahyadri_range', 'geography_earth_systems.geography_of_karnataka.physiography_relief_divisions_of_karnataka.northern_maidan_bayaluseeme', 'geography_earth_systems.geography_of_karnataka.physiography_relief_divisions_of_karnataka.southern_maidan_mysore_plateau']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Physiography', 'Relief', 'Divisions', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka', 'drainage_systems_river_basins_of_karnataka', 'Drainage Systems & River Basins of Karnataka', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY['geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.east-flowing_river_systems', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.krishna_river_basin', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.cauvery_kaveri_river_basin', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.pennar_palar_river_basins', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.west-flowing_river_systems', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.sharavathi_river', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.kali_river', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.netravati_gurupura_rivers', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.other_west-flowing_rivers_aghanashini_river_unchalli_falls_lushington_falls_pristine_estuary_ramsar_site_gangavali_bedthi_river_magod_falls_varahi_river_kunchikal_falls_underground_hydroelectric_station_mahadayi_mandovi_river_origin_at_khanapur_in_belagavi_kalasa-banduri_nala_drinking_water_project_dispute_with_goa']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Drainage', 'Systems', 'River', 'Basins', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.climate_rainfall_agro-climatic_zones_of_karnataka', 'climate_rainfall_agro-climatic_zones_of_karnataka', 'Climate, Rainfall & Agro-Climatic Zones of Karnataka', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY['geography_earth_systems.geography_of_karnataka.climate_rainfall_agro-climatic_zones_of_karnataka.climate_monsoon_dynamics', 'geography_earth_systems.geography_of_karnataka.climate_rainfall_agro-climatic_zones_of_karnataka.rainfall_distribution_spatial_variation', 'geography_earth_systems.geography_of_karnataka.climate_rainfall_agro-climatic_zones_of_karnataka.10_agro-climatic_zones_of_karnataka']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Climate', 'Rainfall', 'Agro', 'Climatic', 'Zones', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka', 'soils_natural_vegetation_of_karnataka', 'Soils & Natural Vegetation of Karnataka', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY['geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.major_soil_types_of_karnataka', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.red_soils_alfisols_inceptisols', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.black_cotton_soils_regur_vertisols', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.laterite_soils_ultisols_oxisols', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.alluvial_coastal_soils_entisols', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.forest_cover_natural_vegetation_types', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.forest_area', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.tropical_wet_evergreen_semi-evergreen_forests', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.tropical_moist_deciduous_forests', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.tropical_dry_deciduous_forests', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.tropical_thorn_scrub_forests', 'geography_earth_systems.geography_of_karnataka.soils_natural_vegetation_of_karnataka.coastal_mangroves']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Soils', 'Natural', 'Vegetation', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka', 'biodiversity_protected_areas_conservation_in_karnataka', 'Biodiversity, Protected Areas & Conservation in Karnataka', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY['geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.national_parks_of_karnataka', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.bandipur_national_park', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.nagarahole_rajiv_gandhi_national_park', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.kudremukh_national_park', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.bannerghatta_national_park', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.anshi_national_park_kali_tiger_reserve', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.tiger_reserves_biosphere_reserves', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.5_tiger_reserves_of_karnataka', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.nilgiri_biosphere_reserve', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.wildlife_bird_sanctuaries_of_prominence', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.bhadra_wildlife_sanctuary_muthodi', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.dandeli_wildlife_sanctuary_hornbill_conservation_reserve', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.daroji_sloth_bear_sanctuary', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.ramadevara_betta_vulture_sanctuary', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.ranganathittu_bird_sanctuary', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.magadi_kere_bird_sanctuary', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.ankasamudra_bird_conservation_reserve', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.aghanashini_estuary', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.kokkare_bellur_pelicanry', 'geography_earth_systems.geography_of_karnataka.biodiversity_protected_areas_conservation_in_karnataka.unesco_world_heritage_sites']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Biodiversity', 'Protected', 'Areas', 'Conservation', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka', 'mineral_power_economic_resources_of_karnataka', 'Mineral, Power & Economic Resources of Karnataka', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY['geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.mineral_resources_of_karnataka', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.metallic_minerals', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.iron_ore', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.gold', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.manganese', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.copper', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.bauxite', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.chromite', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.non-metallic_industrial_minerals', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.limestone_dolomite', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.granite_dimensional_stones', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.silica_sand_quartz', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.energy_power_infrastructure_industrial_corridors_of_karnataka', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.hydroelectric_power', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.thermal_power_stations', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.nuclear_energy', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.renewable_energy_leadership', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.solar_energy_pavagada_solar_park_shakti_sthala_in_tumakuru_district_2050_mw_capacity_one_of_the_largest_ultra-mega_solar_parks_in_the_world_pm-kusum_decentralized_solarisation', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.wind_energy_wind_power_farms_in_kappatagudda_gadag_jogimatti_chitradurga_harapanahalli_belagavi_chikkaballapur', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.major_industrial_economic_hubs', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.it_biotechnology_hub', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.heavy_engineering_aerospace_defence_corridor', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.textile_garment_clusters', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka.automobile_machinery_corridors']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS1]', '', ARRAY[]::text[], ARRAY['Mineral', 'Power', 'Economic', 'Resources', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.1_north-eastern_transition_zone', '1_north-eastern_transition_zone', '1. North-Eastern Transition Zone (Bidar, Kalaburagi / Pulses, Black Soil, Moderate Rainfall)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['North', 'Eastern', 'Transition', 'Zone', 'Bidar', 'Kalaburagi', 'Pulses', 'Black', 'Soil', 'Moderate', 'Rainfall']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.2_north-eastern_dry_zone', '2_north-eastern_dry_zone', '2. North-Eastern Dry Zone (Raichur, Yadgir, Kalaburagi / Cotton, Jowar, Deep Black Soils)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['North', 'Eastern', 'Dry', 'Zone', 'Raichur', 'Yadgir', 'Kalaburagi', 'Cotton', 'Jowar', 'Deep', 'Black', 'Soils']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.3_northern_dry_zone', '3_northern_dry_zone', '3. Northern Dry Zone (Vijayapura, Bagalkote, Gadag, Belagavi, Koppal, Ballari / Largest Zone, Low Rainfall, Bajra, Sunflower, Jowar)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Northern', 'Dry', 'Zone', 'Vijayapura', 'Bagalkote', 'Gadag', 'Belagavi', 'Koppal', 'Ballari', 'Largest', 'Low', 'Rainfall', 'Bajra', 'Sunflower', 'Jowar']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.4_central_dry_zone', '4_central_dry_zone', '4. Central Dry Zone (Chitradurga, Davanagere, Tumakuru / Millets, Groundnut, Maize)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Central', 'Dry', 'Zone', 'Chitradurga', 'Davanagere', 'Tumakuru', 'Millets', 'Groundnut', 'Maize']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.5_eastern_dry_zone', '5_eastern_dry_zone', '5. Eastern Dry Zone (Bengaluru Urban & Rural, Kolar, Chikkaballapur, Ramanagara / Ragi, Mulberry / Sericulture, Vegetables)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Eastern', 'Dry', 'Zone', 'Bengaluru', 'Urban', 'Rural', 'Kolar', 'Chikkaballapur', 'Ramanagara', 'Ragi', 'Mulberry', 'Sericulture', 'Vegetables']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.6_southern_dry_zone', '6_southern_dry_zone', '6. Southern Dry Zone (Mysuru, Mandya, Chamarajanagar / Paddy, Sugarcane, Ragi, Cauvery Canal Irrigation)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Southern', 'Dry', 'Zone', 'Mysuru', 'Mandya', 'Chamarajanagar', 'Paddy', 'Sugarcane', 'Ragi', 'Cauvery', 'Canal', 'Irrigation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.7_southern_transition_zone', '7_southern_transition_zone', '7. Southern Transition Zone (Hassan, Mysuru, Shivamogga / Transitional Cropping, Ragi, Tobacco, Potato)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Southern', 'Transition', 'Zone', 'Hassan', 'Mysuru', 'Shivamogga', 'Transitional', 'Cropping', 'Ragi', 'Tobacco', 'Potato']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.8_northern_transition_zone', '8_northern_transition_zone', '8. Northern Transition Zone (Dharwad, Belagavi, Haveri / High Agricultural Productivity, Cotton, Soybean, Wheat, Chilli)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Northern', 'Transition', 'Zone', 'Dharwad', 'Belagavi', 'Haveri', 'High', 'Agricultural', 'Productivity', 'Cotton', 'Soybean', 'Wheat', 'Chilli']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.9_hilly_malnad_zone', '9_hilly_malnad_zone', '9. Hilly / Malnad Zone (Uttara Kannada, Shivamogga, Chikmagalur, Hassan, Kodagu / Plantation Crops: Coffee, Arecanut, Pepper, Cardamom, Tea, Paddy)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Hilly', 'Malnad', 'Zone', 'Uttara', 'Kannada', 'Shivamogga', 'Chikmagalur', 'Hassan', 'Kodagu', 'Plantation', 'Crops', 'Coffee', 'Arecanut', 'Pepper', 'Cardamom', 'Tea', 'Paddy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_karnataka.10_coastal_zone', '10_coastal_zone', '10. Coastal Zone (Dakshina Kannada, Udupi, Uttara Kannada coastal strip / Coconut, Arecanut, Paddy, Cashew, Fisheries)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_karnataka',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['10.', 'Coastal', 'Zone', 'Dakshina', 'Kannada', 'Udupi', 'Uttara', 'coastal', 'strip', 'Coconut', 'Arecanut', 'Paddy', 'Cashew', 'Fisheries']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.salient_features_of_indian_society_diversity.pluralism_cultural_diversity', 'pluralism_cultural_diversity', 'Pluralism & Cultural Diversity (Linguistic, Religious, Ethnic, Regional Diversity)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.salient_features_of_indian_society_diversity',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.salient_features_of_indian_society_diversity']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Pluralism', 'Cultural', 'Diversity', 'Linguistic', 'Religious', 'Ethnic', 'Regional']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.salient_features_of_indian_society_diversity.unity_in_diversity', 'unity_in_diversity', 'Unity in Diversity (Integrating Factors, Composite Culture / Ganga-Jamuni Tehzeeb, Constitutional Values)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.salient_features_of_indian_society_diversity',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.salient_features_of_indian_society_diversity']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Unity', 'Diversity', 'Integrating', 'Factors', 'Composite', 'Culture', 'Ganga', 'Jamuni', 'Tehzeeb', 'Constitutional', 'Values']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_institutions.kinship_family_systems', 'kinship_family_systems', 'Kinship & Family Systems (Joint Family vs Nuclear Family, Matrilineal vs Patrilineal Systems, Changing Family Structures)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_institutions',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_institutions']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Kinship', 'Family', 'Systems', 'Joint', 'Nuclear', 'Matrilineal', 'Patrilineal', 'Changing', 'Structures']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_institutions.marriage_institutions', 'marriage_institutions', 'Marriage Institutions (Traditional Patterns, Inter-caste & Inter-religious Marriages, Modern Legislative Reforms)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_institutions',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_institutions']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Marriage', 'Institutions', 'Traditional', 'Patterns', 'Inter', 'caste', 'religious', 'Marriages', 'Modern', 'Legislative', 'Reforms']::text[],
        'civil_services', ARRAY['civil_services']::text[]
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
        'indian_society_social_justice.social_institutions.caste_system_varna', 'caste_system_varna', 'Caste System & Varna (Origins, Jati Hierarchy, Caste Mobility, Sanskritisation, Caste in Modern Politics, Affirmative Action)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_institutions',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_institutions']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Caste', 'System', 'Varna', 'Origins', 'Jati', 'Hierarchy', 'Mobility', 'Sanskritisation', 'Modern', 'Politics', 'Affirmative', 'Action']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_institutions.tribal_communities_particularly_vulnerable_tribal_groups_-_pvtgs', 'tribal_communities_particularly_vulnerable_tribal_groups_-_pvtgs', 'Tribal Communities / Particularly Vulnerable Tribal Groups - PVTGs (Tribal Distribution, Fifth & Sixth Schedules, Forest Rights Act, Tribal Integration Policies)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_institutions',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_institutions']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Tribal', 'Communities', 'Particularly', 'Vulnerable', 'Groups', 'PVTGs', 'Distribution', 'Fifth', 'Sixth', 'Schedules', 'Forest', 'Rights', 'Act', 'Integration', 'Policies']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.role_of_women_womens_movements.status_of_women_in_india', 'status_of_women_in_india', 'Status of Women in India (Gender Inequality, Patriarchal Structures, Sex Ratio, Female Labour Force Participation Rate / FLFPR)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.role_of_women_womens_movements',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.role_of_women_womens_movements']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Status', 'Women', 'India', 'Gender', 'Inequality', 'Patriarchal', 'Structures', 'Sex', 'Ratio', 'Female', 'Labour', 'Force', 'Participation', 'Rate', 'FLFPR']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.role_of_women_womens_movements.women_organisations_movements', 'women_organisations_movements', 'Women Organisations & Movements (Historical Reformers, Pre-Independence Movement, Post-Independence Feminist Waves, Self-Help Groups / SHGs)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.role_of_women_womens_movements',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.role_of_women_womens_movements']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Women', 'Organisations', 'Movements', 'Historical', 'Reformers', 'Pre', 'Independence', 'Movement', 'Post', 'Feminist', 'Waves', 'Self', 'Help', 'Groups', 'SHGs']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.role_of_women_womens_movements.legislative_social_safeguards', 'legislative_social_safeguards', 'Legislative & Social Safeguards (POSH Act, Domestic Violence Act, Maternity Benefit Act, Reservation for Women in Panchayats & Parliament)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.role_of_women_womens_movements',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.role_of_women_womens_movements']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Legislative', 'Social', 'Safeguards', 'POSH', 'Act', 'Domestic', 'Violence', 'Maternity', 'Benefit', 'Reservation', 'Women', 'Panchayats', 'Parliament']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.population_dynamics_demographic_issues.demographic_profile_of_india', 'demographic_profile_of_india', 'Demographic Profile of India (Census Trends, Population Growth Rate, Total Fertility Rate / TFR, Replacement Level Fertility)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.population_dynamics_demographic_issues',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.population_dynamics_demographic_issues']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Demographic', 'Profile', 'India', 'Census', 'Trends', 'Population', 'Growth', 'Rate', 'Total', 'Fertility', 'TFR', 'Replacement', 'Level']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.population_dynamics_demographic_issues.demographic_dividend_ageing', 'demographic_dividend_ageing', 'Demographic Dividend & Ageing (Young Population Opportunities, Skill Development, Ageing Population & Geriatric Care)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.population_dynamics_demographic_issues',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.population_dynamics_demographic_issues']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Demographic', 'Dividend', 'Ageing', 'Young', 'Population', 'Opportunities', 'Skill', 'Development', 'Geriatric', 'Care']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.population_dynamics_demographic_issues.migration_patterns', 'migration_patterns', 'Migration Patterns (Internal Migration - Rural to Urban, Rural to Rural; International Emigration, Remittances, Brain Drain)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.population_dynamics_demographic_issues',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.population_dynamics_demographic_issues']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Migration', 'Patterns', 'Internal', 'Rural', 'Urban', 'International', 'Emigration', 'Remittances', 'Brain', 'Drain']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.poverty_inequality_developmental_challenges.poverty_concepts_measurement', 'poverty_concepts_measurement', 'Poverty Concepts & Measurement (Absolute vs Relative Poverty, Poverty Line Committees - Tendulkar, Rangarajan, Multidimensional Poverty Index / MPI)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.poverty_inequality_developmental_challenges',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.poverty_inequality_developmental_challenges']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Poverty', 'Concepts', 'Measurement', 'Absolute', 'Relative', 'Line', 'Committees', 'Tendulkar', 'Rangarajan', 'Multidimensional', 'Index', 'MPI']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.poverty_inequality_developmental_challenges.social_exclusion_vulnerability', 'social_exclusion_vulnerability', 'Social Exclusion & Vulnerability (Hunger, Malnutrition, Stunting, Wasting, Food Security - NFSA, Public Distribution System / PDS)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.poverty_inequality_developmental_challenges',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.poverty_inequality_developmental_challenges']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Social', 'Exclusion', 'Vulnerability', 'Hunger', 'Malnutrition', 'Stunting', 'Wasting', 'Food', 'Security', 'NFSA', 'Public', 'Distribution', 'System', 'PDS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.urbanisation_urban_social_issues.urbanisation_trends_sprawl', 'urbanisation_trends_sprawl', 'Urbanisation Trends & Sprawl (Growth of Megacities, Census Towns, Slumification, Urban Infrastructure Deficit)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.urbanisation_urban_social_issues',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.urbanisation_urban_social_issues']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Urbanisation', 'Trends', 'Sprawl', 'Growth', 'Megacities', 'Census', 'Towns', 'Slumification', 'Urban', 'Infrastructure', 'Deficit']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.urbanisation_urban_social_issues.urban_social_problems', 'urban_social_problems', 'Urban Social Problems (Urban Poverty, Crime, Housing Shortages, Environmental Degradation, Water Scarcity, Traffic Congestion)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.urbanisation_urban_social_issues',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.urbanisation_urban_social_issues']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Urban', 'Social', 'Problems', 'Poverty', 'Crime', 'Housing', 'Shortages', 'Environmental', 'Degradation', 'Water', 'Scarcity', 'Traffic', 'Congestion']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism.social_empowerment', 'social_empowerment', 'Social Empowerment (Empowerment of Marginalised Groups - Scheduled Castes, Scheduled Tribes, OBCs, LGBTQ+, Persons with Disabilities / Divyangjan, Elderly)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Social', 'Empowerment', 'Marginalised', 'Groups', 'Scheduled', 'Castes', 'Tribes', 'OBCs', 'LGBTQ+', 'Persons', 'Disabilities', 'Divyangjan', 'Elderly']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism.communalism', 'communalism', 'Communalism (Historical Roots, Major Causes, Majoritarianism vs Minority Anxiety, Communal Violence, Constitutional Solutions)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Communalism', 'Historical', 'Roots', 'Major', 'Causes', 'Majoritarianism', 'Minority', 'Anxiety', 'Communal', 'Violence', 'Constitutional', 'Solutions']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism.regionalism_sub-nationalism', 'regionalism_sub-nationalism', 'Regionalism & Sub-Nationalism (Sons of the Soil Doctrine, Demand for New States, Regional Disparities, Inter-State Water Disputes)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Regionalism', 'Sub', 'Nationalism', 'Sons', 'Soil', 'Doctrine', 'Demand', 'New', 'States', 'Regional', 'Disparities', 'Inter', 'State', 'Water', 'Disputes']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism.indian_vs_western_secularism', 'indian_vs_western_secularism', 'Indian vs Western Secularism (Equal Respect for All Religions / Sarva Dharma Sambhava, State Neutrality, Principled Distance Model)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_empowerment_communalism_regionalism_secularism']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Indian', 'Western', 'Secularism', 'Equal', 'Respect', 'Religions', 'Sarva', 'Dharma', 'Sambhava', 'State', 'Neutrality', 'Principled', 'Distance', 'Model']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups', 'protection_of_marginalised_groups', 'Protection of Marginalised Groups (Schemes & Acts for SC/ST, Women, Children, Elderly, Disabled / Divyangjan, Transgenders, Minorities)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Protection', 'Marginalised', 'Groups', 'Schemes', 'Acts', 'SC/ST', 'Women', 'Children', 'Elderly', 'Disabled', 'Divyangjan', 'Transgenders', 'Minorities']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.institutional_safeguards', 'institutional_safeguards', 'Institutional Safeguards (National Commissions, Social Welfare Boards, Rights-based Approach to Welfare)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Institutional', 'Safeguards', 'National', 'Commissions', 'Social', 'Welfare', 'Boards', 'Rights', 'based', 'Approach']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_sector_development.health_sector_reforms', 'health_sector_reforms', 'Health Sector Reforms (National Health Policy, Ayushman Bharat / PM-JAY, Health Infrastructure Deficit, Universal Health Coverage)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_sector_development',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_sector_development']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Health', 'Sector', 'Reforms', 'National', 'Policy', 'Ayushman', 'Bharat', 'JAY', 'Infrastructure', 'Deficit', 'Universal', 'Coverage']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.social_sector_development.education_sector_reforms', 'education_sector_reforms', 'Education Sector Reforms (National Education Policy / NEP 2020, Right to Education / RTE Act, Higher Education Governance, Digital Education Initiatives)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.social_sector_development',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.social_sector_development']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Education', 'Sector', 'Reforms', 'National', 'Policy', 'NEP', '2020', 'Right', 'RTE', 'Act', 'Higher', 'Governance', 'Digital', 'Initiatives']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_society_social_justice.issues_relating_to_poverty_hunger.hunger_malnutrition_architecture', 'hunger_malnutrition_architecture', 'Hunger & Malnutrition Architecture (Global Hunger Index, POSHAN Abhiyaan, Food Security Act, Malnutrition-Poverty Cycle)', 3,
        'Topic', 'Indian Society & Social Justice', 'indian_society_social_justice', 'indian_society_social_justice.issues_relating_to_poverty_hunger',
        ARRAY[]::text[], ARRAY['indian_society_social_justice', 'indian_society_social_justice.issues_relating_to_poverty_hunger']::text[], '{"upsc": ["Mains-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS1"]}'::jsonb,
        '[UPSC: Mains-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Hunger', 'Malnutrition', 'Architecture', 'Global', 'Index', 'POSHAN', 'Abhiyaan', 'Food', 'Security', 'Act', 'Poverty', 'Cycle']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.historical_background_making_of_the_constitution.regulating_charter_acts', 'regulating_charter_acts', 'Regulating & Charter Acts (Regulating Act 1773, Pitt''s India Act 1784, Charter Acts 1813, 1833, 1853)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Regulating', 'Charter', 'Acts', 'Act', '1773', 'Pitt''s', 'India', '1784', '1813', '1833', '1853']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.historical_background_making_of_the_constitution.government_of_india_acts', 'government_of_india_acts', 'Government of India Acts (1858, 1892, Indian Councils Act 1909 / Morley-Minto, GOI Act 1919 / Montagu-Chelmsford, GOI Act 1935, Indian Independence Act 1947)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Government', 'India', 'Acts', '1858', '1892', 'Indian', 'Councils', 'Act', '1909', 'Morley', 'Minto', 'GOI', '1919', 'Montagu', 'Chelmsford', '1935', 'Independence', '1947']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.historical_background_making_of_the_constitution.constituent_assembly_drafting_process', 'constituent_assembly_drafting_process', 'Constituent Assembly & Drafting Process (Objectives Resolution, Committees, Debates, Enactment & Adoption)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Constituent', 'Assembly', 'Drafting', 'Process', 'Objectives', 'Resolution', 'Committees', 'Debates', 'Enactment', 'Adoption']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.salient_features_amendments_basic_structure.salient_features_of_the_indian_constitution', 'salient_features_of_the_indian_constitution', 'Salient Features of the Indian Constitution (Written, Rigid vs Flexible, Federal with Unitary Bias, Parliamentary Form, Integrated Judiciary)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Salient', 'Features', 'Indian', 'Constitution', 'Written', 'Rigid', 'Flexible', 'Federal', 'Unitary', 'Bias', 'Parliamentary', 'Form', 'Integrated', 'Judiciary']::text[],
        'civil_services', ARRAY['civil_services']::text[]
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
        'indian_polity_constitution_governance.salient_features_amendments_basic_structure.preamble', 'preamble', 'Preamble (Sovereign, Socialist, Secular, Democratic, Republic, Justice, Liberty, Equality, Fraternity)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Preamble', 'Sovereign', 'Socialist', 'Secular', 'Democratic', 'Republic', 'Justice', 'Liberty', 'Equality', 'Fraternity']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.salient_features_amendments_basic_structure.major_constitutional_amendments', 'major_constitutional_amendments', 'Major Constitutional Amendments (42nd, 44th, 73rd, 74th, 86th, 101st GST, 103rd EWS, 104th, 105th, 106th Nari Shakti Vandan)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Major', 'Constitutional', 'Amendments', '42nd', '44th', '73rd', '74th', '86th', '101st', 'GST', '103rd', 'EWS', '104th', '105th', '106th', 'Nari', 'Shakti', 'Vandan']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.salient_features_amendments_basic_structure.basic_structure_doctrine', 'basic_structure_doctrine', 'Basic Structure Doctrine (Kesavananda Bharati Case 1973, Minerva Mills Case, Evolution & Core Principles)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Basic', 'Structure', 'Doctrine', 'Kesavananda', 'Bharati', 'Case', '1973', 'Minerva', 'Mills', 'Evolution', 'Core', 'Principles']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35', 'fundamental_rights_-_part_iii_articles_12-35', 'Fundamental Rights - Part III / Articles 12-35 (Right to Equality 14-18, Right to Freedom 19-22, Against Exploitation 23-24, Freedom of Religion 25-28, Cultural & Educational 29-30, Constitutional Remedies 32; Judicial Review & Writs - Habeas Corpus, Mandamus, Prohibition, Certiorari, Quo-Warranto)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Fundamental', 'Rights', 'Part', 'III', 'Articles', 'Right', 'Equality', 'Freedom', 'Against', 'Exploitation', 'Religion', 'Cultural', 'Educational', 'Constitutional', 'Remedies', 'Judicial', 'Review', 'Writs', 'Habeas', 'Corpus', 'Mandamus', 'Prohibition', 'Certiorari', 'Quo', 'Warranto']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.directive_principles_of_state_policy_-_part_iv_articles_36-51', 'directive_principles_of_state_policy_-_part_iv_articles_36-51', 'Directive Principles of State Policy - Part IV / Articles 36-51 (Socialistic, Gandhian, Liberal-Intellectual Principles; Fundamental Rights vs DPSP Conflict & Harmony)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Directive', 'Principles', 'State', 'Policy', 'Part', 'Articles', 'Socialistic', 'Gandhian', 'Liberal', 'Intellectual', 'Fundamental', 'Rights', 'DPSP', 'Conflict', 'Harmony']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_duties_-_part_iv-a_article_51a', 'fundamental_duties_-_part_iv-a_article_51a', 'Fundamental Duties - Part IV-A / Article 51A (Swaran Singh Committee, 42nd & 86th Amendments, Enforceability & Moral Obligation)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Fundamental', 'Duties', 'Part', 'Article', '51A', 'Swaran', 'Singh', 'Committee', '42nd', '86th', 'Amendments', 'Enforceability', 'Moral', 'Obligation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.union_executive_state_executive.union_executive', 'union_executive', 'Union Executive (President - Election, Impeachment, Powers - Executive, Legislative, Financial, Judicial, Veto, Ordinance, Pardoning 72; Vice-President; Prime Minister & Council of Ministers - Collective Responsibility, Cabinet Committees)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.union_executive_state_executive',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.union_executive_state_executive']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Union', 'Executive', 'President', 'Election', 'Impeachment', 'Powers', 'Legislative', 'Financial', 'Judicial', 'Veto', 'Ordinance', 'Pardoning', 'Vice', 'Prime', 'Minister', 'Council', 'Ministers', 'Collective', 'Responsibility', 'Cabinet', 'Committees']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.union_executive_state_executive.state_executive', 'state_executive', 'State Executive (Governor - Appointment, Constitutional Role, Discretionary Powers, Ordinance Power 213; Chief Minister & State Council of Ministers)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.union_executive_state_executive',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.union_executive_state_executive']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['State', 'Executive', 'Governor', 'Appointment', 'Constitutional', 'Role', 'Discretionary', 'Powers', 'Ordinance', 'Power', '213', 'Chief', 'Minister', 'Council', 'Ministers']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.parliament_state_legislatures.structure_composition', 'structure_composition', 'Structure & Composition (Lok Sabha, Rajya Sabha, Vidhan Sabha, Vidhan Parishad; Qualification & Disqualification - Article 102, Representation of the People Act 1951, Anti-Defection Law / 10th Schedule)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.parliament_state_legislatures',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.parliament_state_legislatures']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Structure', 'Composition', 'Lok', 'Sabha', 'Rajya', 'Vidhan', 'Parishad', 'Qualification', 'Disqualification', 'Article', '102', 'Representation', 'People', 'Act', '1951', 'Anti', 'Defection', 'Law', '10th', 'Schedule']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.parliament_state_legislatures.legislative_procedure_bills', 'legislative_procedure_bills', 'Legislative Procedure & Bills (Ordinary Bills, Money Bills Article 110, Financial Bills, Constitutional Amendment Bills, Joint Sitting Article 108)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.parliament_state_legislatures',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.parliament_state_legislatures']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Legislative', 'Procedure', 'Bills', 'Ordinary', 'Money', 'Article', '110', 'Financial', 'Constitutional', 'Amendment', 'Joint', 'Sitting', '108']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.parliament_state_legislatures.parliamentary_committees_control', 'parliamentary_committees_control', 'Parliamentary Committees & Control (Public Accounts Committee, Estimates Committee, COPU, Departmentally Related Standing Committees; Parliamentary Privileges Article 105)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.parliament_state_legislatures',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.parliament_state_legislatures']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Parliamentary', 'Committees', 'Control', 'Public', 'Accounts', 'Committee', 'Estimates', 'COPU', 'Departmentally', 'Related', 'Standing', 'Privileges', 'Article', '105']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.indian_judiciary_judicial_system.supreme_court_of_india', 'supreme_court_of_india', 'Supreme Court of India (Original, Appellate, Advisory Article 143, Writ Jurisdiction Article 32, Court of Record Article 129, Collegium System vs NJAC)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.indian_judiciary_judicial_system',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.indian_judiciary_judicial_system']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Supreme', 'Court', 'India', 'Original', 'Appellate', 'Advisory', 'Article', '143', 'Writ', 'Jurisdiction', 'Record', '129', 'Collegium', 'System', 'NJAC']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.indian_judiciary_judicial_system.high_courts_subordinate_judiciary', 'high_courts_subordinate_judiciary', 'High Courts & Subordinate Judiciary (High Court Jurisdiction Article 226, Judicial Review, Judicial Activism vs Judicial Overreach, Public Interest Litigation / PIL)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.indian_judiciary_judicial_system',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.indian_judiciary_judicial_system']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['High', 'Courts', 'Subordinate', 'Judiciary', 'Court', 'Jurisdiction', 'Article', '226', 'Judicial', 'Review', 'Activism', 'Overreach', 'Public', 'Interest', 'Litigation', 'PIL']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.indian_judiciary_judicial_system.judicial_reforms_alternative_dispute_resolution', 'judicial_reforms_alternative_dispute_resolution', 'Judicial Reforms & Alternative Dispute Resolution (Pending Cases, E-Courts, Lok Adalats, Gram Nyayalayas, Arbitration & Conciliation)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.indian_judiciary_judicial_system',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.indian_judiciary_judicial_system']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Judicial', 'Reforms', 'Alternative', 'Dispute', 'Resolution', 'Pending', 'Cases', 'Courts', 'Lok', 'Adalats', 'Gram', 'Nyayalayas', 'Arbitration', 'Conciliation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.legislative_administrative_relations', 'legislative_administrative_relations', 'Legislative & Administrative Relations (Seventh Schedule - Union, State, Concurrent Lists; Residuary Powers; Emergency Provisions Articles 352, 356, 360)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Legislative', 'Administrative', 'Relations', 'Seventh', 'Schedule', 'Union', 'State', 'Concurrent', 'Lists', 'Residuary', 'Powers', 'Emergency', 'Provisions', 'Articles', '352', '356', '360']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.financial_relations_tax_devolution', 'financial_relations_tax_devolution', 'Financial Relations & Tax Devolution (Distribution of Revenues, Goods & Services Tax / GST Council Article 279A, Finance Commission Article 280, Grants-in-Aid)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Financial', 'Relations', 'Tax', 'Devolution', 'Distribution', 'Revenues', 'Goods', 'Services', 'GST', 'Council', 'Article', '279A', 'Finance', 'Commission', '280', 'Grants', 'Aid']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.federal_dynamics_dispute_resolution', 'federal_dynamics_dispute_resolution', 'Federal Dynamics & Dispute Resolution (Cooperative & Competitive Federalism, Inter-State Councils Article 263, Zonal Councils, Inter-State River Water Disputes Article 262)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Federal', 'Dynamics', 'Dispute', 'Resolution', 'Cooperative', 'Competitive', 'Federalism', 'Inter', 'State', 'Councils', 'Article', '263', 'Zonal', 'River', 'Water', 'Disputes', '262']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.local_governance.73rd_74th_constitutional_amendment_acts', '73rd_74th_constitutional_amendment_acts', '73rd & 74th Constitutional Amendment Acts (Three-Tier Panchayati Raj System, Gram Sabha, Urban Local Bodies - Municipal Corporations, Councils, Nagar Panchayats)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.local_governance',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.local_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['73rd', '74th', 'Constitutional', 'Amendment', 'Acts', 'Three', 'Tier', 'Panchayati', 'Raj', 'System', 'Gram', 'Sabha', 'Urban', 'Local', 'Bodies', 'Municipal', 'Corporations', 'Councils', 'Nagar', 'Panchayats']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.local_governance.devolution_decentralisation_issues', 'devolution_decentralisation_issues', 'Devolution & Decentralisation Issues (3 Fs - Funds, Functions, Functionaries; PESA Act 1996 - Extension to Scheduled Areas, State Finance Commissions)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.local_governance',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.local_governance']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Devolution', 'Decentralisation', 'Issues', 'Funds', 'Functions', 'Functionaries', 'PESA', 'Act', '1996', 'Extension', 'Scheduled', 'Areas', 'State', 'Finance', 'Commissions']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies.constitutional_bodies', 'constitutional_bodies', 'Constitutional Bodies (Election Commission Article 324, Union & State Public Service Commissions, CAG Article 148, Finance Commission, National Commissions for SC/ST/NCBC)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Constitutional', 'Bodies', 'Election', 'Commission', 'Article', '324', 'Union', 'State', 'Public', 'Service', 'Commissions', 'CAG', '148', 'Finance', 'National', 'SC/ST/NCBC']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies.statutory_regulatory_bodies', 'statutory_regulatory_bodies', 'Statutory & Regulatory Bodies (NITI Aayog, NHRC, CIC, CVC, CBI, Enforcement Directorate / ED, Competition Commission of India / CCI, National Green Tribunal / NGT, SEBI, RBI, IRDAI)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Statutory', 'Regulatory', 'Bodies', 'NITI', 'Aayog', 'NHRC', 'CIC', 'CVC', 'CBI', 'Enforcement', 'Directorate', 'Competition', 'Commission', 'India', 'CCI', 'National', 'Green', 'Tribunal', 'NGT', 'SEBI', 'RBI', 'IRDAI']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.good_governance_administrative_reforms.good_governance_principles', 'good_governance_principles', 'Good Governance Principles (Participation, Rule of Law, Transparency, Responsiveness, Consensus Oriented, Equity & Inclusiveness, Effectiveness & Accountability)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.good_governance_administrative_reforms',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.good_governance_administrative_reforms']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Good', 'Governance', 'Principles', 'Participation', 'Rule', 'Law', 'Transparency', 'Responsiveness', 'Consensus', 'Oriented', 'Equity', 'Inclusiveness', 'Effectiveness', 'Accountability']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.good_governance_administrative_reforms.civil_services_reforms', 'civil_services_reforms', 'Civil Services Reforms (Recruitment Reforms, Lateral Entry, Capacity Building - Mission Karmayogi, Performance Appraisal, Civil Service Neutrality vs Commitment)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.good_governance_administrative_reforms',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.good_governance_administrative_reforms']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Civil', 'Services', 'Reforms', 'Recruitment', 'Lateral', 'Entry', 'Capacity', 'Building', 'Mission', 'Karmayogi', 'Performance', 'Appraisal', 'Service', 'Neutrality', 'Commitment']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.transparency_accountability_citizen_charters.right_to_information_act_2005', 'right_to_information_act_2005', 'Right to Information Act 2005 (RTI Architecture, Exemptions Section 8, Information Commissions, Judicial & Legislative Accountability)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.transparency_accountability_citizen_charters',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.transparency_accountability_citizen_charters']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Right', 'Information', 'Act', '2005', 'RTI', 'Architecture', 'Exemptions', 'Section', 'Commissions', 'Judicial', 'Legislative', 'Accountability']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.transparency_accountability_citizen_charters.accountability_tools_social_audit', 'accountability_tools_social_audit', 'Accountability Tools & Social Audit (Citizen''s Charters, Social Audit Mechanisms, Whistleblower Protection, Lokpal & Lokayuktas Act 2013)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.transparency_accountability_citizen_charters',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.transparency_accountability_citizen_charters']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Accountability', 'Tools', 'Social', 'Audit', 'Citizen''s', 'Charters', 'Mechanisms', 'Whistleblower', 'Protection', 'Lokpal', 'Lokayuktas', 'Act', '2013']::text[],
        'civil_services', ARRAY['civil_services']::text[]
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
        'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure.digital_india_public_infrastructure', 'digital_india_public_infrastructure', 'Digital India & Public Infrastructure (Aadhaar / India Stack, UPI, DigiLocker, COWIN, e-RUPI, Open Network for Digital Commerce / ONDC)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Digital', 'India', 'Public', 'Infrastructure', 'Aadhaar', 'Stack', 'UPI', 'DigiLocker', 'COWIN', 'RUPI', 'Open', 'Network', 'Commerce', 'ONDC']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure.e-governance_applications', 'e-governance_applications', 'E-Governance Applications (e-Seva, UMANG, PRAGATI Platform, Direct Benefit Transfer / DBT, Open Government Data)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Governance', 'Applications', 'Seva', 'UMANG', 'PRAGATI', 'Platform', 'Direct', 'Benefit', 'Transfer', 'DBT', 'Open', 'Government', 'Data']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.role_of_civil_services_in_a_democracy.civil_services_dynamics', 'civil_services_dynamics', 'Civil Services Dynamics (Bureaucracy & Development, Politicization of Civil Services, Specialist vs Generalist Debate, Administrative Ethics)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.role_of_civil_services_in_a_democracy',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.role_of_civil_services_in_a_democracy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Civil', 'Services', 'Dynamics', 'Bureaucracy', 'Development', 'Politicization', 'Specialist', 'Generalist', 'Debate', 'Administrative', 'Ethics']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.constitutional_administrative_structure_of_karnataka', 'constitutional_administrative_structure_of_karnataka', 'Constitutional & Administrative Structure of Karnataka', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka',
        ARRAY['indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.constitutional_administrative_structure_of_karnataka.state_executive_secretariat_hierarchy', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.constitutional_administrative_structure_of_karnataka.state_legislature_special_constitutional_status']::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS2"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]', '', ARRAY[]::text[], ARRAY['Constitutional', 'Administrative', 'Structure', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.local_self-government_decentralisation', 'local_self-government_decentralisation', 'Local Self-Government & Decentralisation (Panchayati Raj & ULBs)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka',
        ARRAY['indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.local_self-government_decentralisation.panchayati_raj_system_in_karnataka', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.local_self-government_decentralisation.urban_local_governance_metropolitan_administration']::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS2"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]', '', ARRAY[]::text[], ARRAY['Local', 'Self', 'Government', 'Decentralisation', 'Panchayati', 'Raj', 'ULBs']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.state_statutory_regulatory_oversight_bodies', 'state_statutory_regulatory_oversight_bodies', 'State Statutory, Regulatory & Oversight Bodies', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka',
        ARRAY['indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.state_statutory_regulatory_oversight_bodies.karnataka_public_service_commission_kpsc', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.state_statutory_regulatory_oversight_bodies.karnataka_lokayukta', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.state_statutory_regulatory_oversight_bodies.state_commissions_regulatory_authorities']::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS2"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]', '', ARRAY[]::text[], ARRAY['State', 'Statutory', 'Regulatory', 'Oversight', 'Bodies']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.good_governance_administrative_reforms_citizen_service_delivery', 'good_governance_administrative_reforms_citizen_service_delivery', 'Good Governance, Administrative Reforms & Citizen Service Delivery', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS2"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]', '', ARRAY[]::text[], ARRAY['Good', 'Governance', 'Administrative', 'Reforms', 'Citizen', 'Service', 'Delivery']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.e-governance_innovations_digital_public_infrastructure_in_karnataka', 'e-governance_innovations_digital_public_infrastructure_in_karnataka', 'E-Governance Innovations & Digital Public Infrastructure in Karnataka', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka',
        ARRAY['indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.e-governance_innovations_digital_public_infrastructure_in_karnataka.pioneer_land_financial_e-governance_platforms', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka.e-governance_innovations_digital_public_infrastructure_in_karnataka.unified_beneficiary_service_delivery_platforms']::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.governance_administration_public_policy_in_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS2"], "upsc": ["Mains-GS2"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS2] [UPSC: Mains-GS2]', '', ARRAY[]::text[], ARRAY['Governance', 'Innovations', 'Digital', 'Public', 'Infrastructure', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.good_governance_administrative_reforms.administrative_reforms_commissions_of_karnataka', 'administrative_reforms_commissions_of_karnataka', 'Administrative Reforms Commissions of Karnataka (KARC-I under Harnahalli Ramaswamy; KARC-II under T.M. Vijay Bhaskar - 100+ Transformative Recommendations: Rationalisation of Departmental Directorates, Digital File Movement via e-Office, Cadre Management, Outsourcing Non-Core Activities, Performance Appraisal & Citizen-Centric Restructuring)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.good_governance_administrative_reforms',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.good_governance_administrative_reforms']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Administrative', 'Reforms', 'Commissions', 'Karnataka', 'KARC', 'Harnahalli', 'Ramaswamy', 'T.M.', 'Vijay', 'Bhaskar', '100+', 'Transformative', 'Recommendations', 'Rationalisation', 'Departmental', 'Directorates', 'Digital', 'File', 'Movement', 'via', 'Office', 'Cadre', 'Management', 'Outsourcing', 'Non', 'Core', 'Activities', 'Performance', 'Appraisal', 'Citizen', 'Centric', 'Restructuring']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_polity_constitution_governance.good_governance_administrative_reforms.citizen_service_guarantees_redressal_platforms', 'citizen_service_guarantees_redressal_platforms', 'Citizen Service Guarantees & Redressal Platforms (Karnataka Guarantee of Services to Citizens Act 2011 / ''Sakala Act'' / Mission Sakala - Statutory Guarantee of Time-Bound Delivery of 1,000+ Government Services, Mandatory Delay Compensations, Sakala Mission Directorate; Janaspandana / Integrated Public Grievance Redressal System / IPGRS; Bapuji Seva Kendra / BSK at Grama Panchayat level; Grama One / Karnataka One / Bangalore One Integrated Citizen Service Centers)', 3,
        'Topic', 'Indian Polity, Constitution & Governance', 'indian_polity_constitution_governance', 'indian_polity_constitution_governance.good_governance_administrative_reforms',
        ARRAY[]::text[], ARRAY['indian_polity_constitution_governance', 'indian_polity_constitution_governance.good_governance_administrative_reforms']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Citizen', 'Service', 'Guarantees', 'Redressal', 'Platforms', 'Karnataka', 'Guarantee', 'Services', 'Citizens', 'Act', '2011', 'Sakala', 'Act', 'Mission', 'Sakala', 'Statutory', 'Time', 'Bound', 'Delivery', '000+', 'Government', 'Mandatory', 'Delay', 'Compensations', 'Directorate', 'Janaspandana', 'Integrated', 'Public', 'Grievance', 'System', 'IPGRS', 'Bapuji', 'Seva', 'Kendra', 'BSK', 'Grama', 'Panchayat', 'level', 'One', 'Bangalore', 'Centers']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.guiding_principles_of_foreign_policy', 'guiding_principles_of_foreign_policy', 'Guiding Principles of Foreign Policy (Panchsheel, Non-Aligned Movement / NAM, Strategic Autonomy, Neighbourhood First Policy, Act East Policy, Think West Policy)', 3,
        'Topic', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations',
        ARRAY[]::text[], ARRAY['international_relations_global_institutions', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Guiding', 'Principles', 'Foreign', 'Policy', 'Panchsheel', 'Non', 'Aligned', 'Movement', 'NAM', 'Strategic', 'Autonomy', 'Neighbourhood', 'First', 'Act', 'East', 'Think', 'West']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_immediate_neighbours', 'relations_with_immediate_neighbours', 'Relations with Immediate Neighbours (Pakistan, Bangladesh, Nepal, Bhutan, Sri Lanka, Maldives, Myanmar, Afghanistan)', 3,
        'Topic', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations',
        ARRAY[]::text[], ARRAY['international_relations_global_institutions', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Relations', 'Immediate', 'Neighbours', 'Pakistan', 'Bangladesh', 'Nepal', 'Bhutan', 'Sri', 'Lanka', 'Maldives', 'Myanmar', 'Afghanistan']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_major_global_powers', 'relations_with_major_global_powers', 'Relations with Major Global Powers (United States, Russia, China, European Union, Japan, Australia)', 3,
        'Topic', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations',
        ARRAY[]::text[], ARRAY['international_relations_global_institutions', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Relations', 'Major', 'Global', 'Powers', 'United', 'States', 'Russia', 'China', 'European', 'Union', 'Japan', 'Australia']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.regional_multilateral_groupings.indo-pacific_trans-regional_alliances', 'indo-pacific_trans-regional_alliances', 'Indo-Pacific & Trans-Regional Alliances (QUAD, I2U2, BRICS, Shanghai Cooperation Organisation / SCO, G20, Global South Alliances)', 3,
        'Topic', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions.regional_multilateral_groupings',
        ARRAY[]::text[], ARRAY['international_relations_global_institutions', 'international_relations_global_institutions.regional_multilateral_groupings']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Indo', 'Pacific', 'Trans', 'Regional', 'Alliances', 'QUAD', 'I2U2', 'BRICS', 'Shanghai', 'Cooperation', 'Organisation', 'SCO', 'G20', 'Global', 'South']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.regional_multilateral_groupings.regional_organisations', 'regional_organisations', 'Regional Organisations (ASEAN, SAARC, BIMSTEC, G7, IORA, Indian Ocean Rim Association)', 3,
        'Topic', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions.regional_multilateral_groupings',
        ARRAY[]::text[], ARRAY['international_relations_global_institutions', 'international_relations_global_institutions.regional_multilateral_groupings']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Regional', 'Organisations', 'ASEAN', 'SAARC', 'BIMSTEC', 'IORA', 'Indian', 'Ocean', 'Rim', 'Association']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.global_institutions_agreements_treaties.international_organisations_reform', 'international_organisations_reform', 'International Organisations & Reform (United Nations Security Council / UNSC Reforms, World Trade Organization / WTO & Dispute Settlement, International Monetary Fund / IMF, World Bank, World Health Organization / WHO)', 3,
        'Topic', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions.global_institutions_agreements_treaties',
        ARRAY[]::text[], ARRAY['international_relations_global_institutions', 'international_relations_global_institutions.global_institutions_agreements_treaties']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['International', 'Organisations', 'Reform', 'United', 'Nations', 'Security', 'Council', 'UNSC', 'Reforms', 'World', 'Trade', 'Organization', 'WTO', 'Dispute', 'Settlement', 'Monetary', 'Fund', 'IMF', 'Bank', 'Health', 'WHO']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.global_institutions_agreements_treaties.global_climate_maritime_frameworks', 'global_climate_maritime_frameworks', 'Global Climate & Maritime Frameworks (UNFCCC Climate Architecture, UNCLOS Maritime Law, Global Tax Regimes)', 3,
        'Topic', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions.global_institutions_agreements_treaties',
        ARRAY[]::text[], ARRAY['international_relations_global_institutions', 'international_relations_global_institutions.global_institutions_agreements_treaties']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Global', 'Climate', 'Maritime', 'Frameworks', 'UNFCCC', 'Architecture', 'UNCLOS', 'Law', 'Tax', 'Regimes']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'international_relations_global_institutions.indian_diaspora.diaspora_dynamics', 'diaspora_dynamics', 'Diaspora Dynamics (Non-Resident Indians / NRIs, Overseas Citizens of India / OCI, Remittances, Geopolitical Soft Power, Pravasi Bharatiya Divas)', 3,
        'Topic', 'International Relations & Global Institutions', 'international_relations_global_institutions', 'international_relations_global_institutions.indian_diaspora',
        ARRAY[]::text[], ARRAY['international_relations_global_institutions', 'international_relations_global_institutions.indian_diaspora']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1", "Mains-GS2"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1, Mains-GS2]', '', ARRAY[]::text[], ARRAY['Diaspora', 'Dynamics', 'Non', 'Resident', 'Indians', 'NRIs', 'Overseas', 'Citizens', 'India', 'OCI', 'Remittances', 'Geopolitical', 'Soft', 'Power', 'Pravasi', 'Bharatiya', 'Divas']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.national_income_aggregates', 'national_income_aggregates', 'National Income Aggregates (Gross Domestic Product / GDP - Constant vs Current Prices, Gross National Product / GNP, Net National Product / NNP at Factor Cost vs Market Price, Gross Value Added / GVA)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['National', 'Income', 'Aggregates', 'Gross', 'Domestic', 'Product', 'GDP', 'Constant', 'Current', 'Prices', 'GNP', 'Net', 'NNP', 'Factor', 'Cost', 'Market', 'Price', 'Value', 'Added', 'GVA']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.methodologies_deflators', 'methodologies_deflators', 'Methodologies & Deflators (Output / Production Method, Income Method, Expenditure Method / Consumption + Investment + Government + Net Exports, GDP Deflator vs Consumer Price Index / CPI & Wholesale Price Index / WPI)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Methodologies', 'Deflators', 'Output', 'Production', 'Method', 'Income', 'Expenditure', 'Consumption', 'Investment', 'Government', 'Net', 'Exports', 'GDP', 'Deflator', 'Consumer', 'Price', 'Index', 'CPI', 'Wholesale', 'WPI']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.growth_development_dynamics', 'growth_development_dynamics', 'Growth & Development Dynamics (Economic Growth vs Economic Development, Potential GDP & Output Gap, Business Cycles - Recession, Depression, Stagflation, Reflation, Middle-Income Trap)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Growth', 'Development', 'Dynamics', 'Economic', 'Potential', 'GDP', 'Output', 'Gap', 'Business', 'Cycles', 'Recession', 'Depression', 'Stagflation', 'Reflation', 'Middle', 'Income', 'Trap']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.inflation_metrics_control', 'inflation_metrics_control', 'Inflation Metrics & Control (Headline vs Core Inflation, Demand-Pull vs Cost-Push Inflation, CPI-Combined, CPI-IW, CPI-AL, WPI Indices, Base Effect, Producer Price Index / PPI)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Inflation', 'Metrics', 'Control', 'Headline', 'Core', 'Demand', 'Pull', 'Cost', 'Push', 'CPI', 'Combined', 'WPI', 'Indices', 'Base', 'Effect', 'Producer', 'Price', 'Index', 'PPI']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.evolution_of_planning_in_india', 'evolution_of_planning_in_india', 'Evolution of Planning in India (Harrod-Domar & Mahalanobis Strategies, Indicative Planning, Five-Year Plans 1st to 12th, Structural Weaknesses of Planning Commission)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Evolution', 'Planning', 'India', 'Harrod', 'Domar', 'Mahalanobis', 'Strategies', 'Indicative', 'Five', 'Year', 'Plans', '1st', '12th', 'Structural', 'Weaknesses', 'Commission']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.niti_aayog_transformational_governance', 'niti_aayog_transformational_governance', 'NITI Aayog & Transformational Governance (Think Tank Mandate, Cooperative & Competitive Federalism, Governing Council, Aspirational Districts Programme / ADP, Aspirational Blocks Programme, Composite Water Management Index, SDG India Index, Export Preparedness Index)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['NITI', 'Aayog', 'Transformational', 'Governance', 'Think', 'Tank', 'Mandate', 'Cooperative', 'Competitive', 'Federalism', 'Governing', 'Council', 'Aspirational', 'Districts', 'Programme', 'ADP', 'Blocks', 'Composite', 'Water', 'Management', 'Index', 'SDG', 'India', 'Export', 'Preparedness']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.mobilisation_of_resources_capital_formation', 'mobilisation_of_resources_capital_formation', 'Mobilisation of Resources & Capital Formation (Domestic Resource Mobilisation - Savings Rate, Gross Fixed Capital Formation / GFCF, Financial vs Physical Savings, Foreign Capital Inflows)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Mobilisation', 'Resources', 'Capital', 'Formation', 'Domestic', 'Resource', 'Savings', 'Rate', 'Gross', 'Fixed', 'GFCF', 'Financial', 'Physical', 'Foreign', 'Inflows']::text[],
        'civil_services', ARRAY['civil_services']::text[]
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
        'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.inclusive_growth_inequality_dynamics', 'inclusive_growth_inequality_dynamics', 'Inclusive Growth & Inequality Dynamics (Multidimensional Poverty Index / NITI Aayog MPI, Gini Coefficient & Lorenz Curve, Jobless Growth, Female Labour Force Participation Rate / FLFPR, Formalisation of Informal Economy, Financial Inclusion - PM Jan Dhan Yojana / PMJDY, JAM Trinity)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Inclusive', 'Growth', 'Inequality', 'Dynamics', 'Multidimensional', 'Poverty', 'Index', 'NITI', 'Aayog', 'MPI', 'Gini', 'Coefficient', 'Lorenz', 'Curve', 'Jobless', 'Female', 'Labour', 'Force', 'Participation', 'Rate', 'FLFPR', 'Formalisation', 'Informal', 'Economy', 'Financial', 'Inclusion', 'Jan', 'Dhan', 'Yojana', 'PMJDY', 'JAM', 'Trinity']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations', 'monetary_policy_framework_rbi_operations', 'Monetary Policy Framework & RBI Operations (Flexible Inflation Targeting Framework / 4% +/- 2%, Monetary Policy Committee / MPC - Composition & Voting, Policy Rates - Repo Rate, Standing Deposit Facility / SDF, Marginal Standing Facility / MSF, Reverse Repo; Reserve Ratios - Cash Reserve Ratio / CRR, Statutory Liquidity Ratio / SLR; Quantitative Tools - Open Market Operations / OMO, Operation Twist, Long-Term Repo Operations / LTRO; Qualitative Tools - Margin Requirements, Moral Suasion)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Monetary', 'Policy', 'Framework', 'RBI', 'Operations', 'Flexible', 'Inflation', 'Targeting', 'Committee', 'MPC', 'Composition', 'Voting', 'Rates', 'Repo', 'Rate', 'Standing', 'Deposit', 'Facility', 'SDF', 'Marginal', 'MSF', 'Reverse', 'Reserve', 'Ratios', 'Cash', 'Ratio', 'CRR', 'Statutory', 'Liquidity', 'SLR', 'Quantitative', 'Tools', 'Open', 'Market', 'OMO', 'Operation', 'Twist', 'Long', 'Term', 'LTRO', 'Qualitative', 'Margin', 'Requirements', 'Moral', 'Suasion']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.monetary_policy_banking_architecture.money_supply_liquidity', 'money_supply_liquidity', 'Money Supply & Liquidity (Monetary Aggregates - Reserve Money / M0, Narrow Money / M1, Intermediate Money / M2, Broad Money / M3; Money Multiplier Effect, Velocity of Money)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Money', 'Supply', 'Liquidity', 'Monetary', 'Aggregates', 'Reserve', 'Narrow', 'Intermediate', 'Broad', 'Multiplier', 'Effect', 'Velocity']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.monetary_policy_banking_architecture.banking_structure_regulatory_framework', 'banking_structure_regulatory_framework', 'Banking Structure & Regulatory Framework (Scheduled Commercial Banks - Public Sector Banks, Private Banks, Foreign Banks; Differentiated Banks - Small Finance Banks / SFBs, Payments Banks; Regional Rural Banks / RRBs, Cooperative Banks - Primary Agricultural Credit Societies / PACS, Urban Cooperative Banks / UCBs regulated under Dual Control & Banking Regulation Amendment Act 2020)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Banking', 'Structure', 'Regulatory', 'Framework', 'Scheduled', 'Commercial', 'Banks', 'Public', 'Sector', 'Private', 'Foreign', 'Differentiated', 'Small', 'Finance', 'SFBs', 'Payments', 'Regional', 'Rural', 'RRBs', 'Cooperative', 'Primary', 'Agricultural', 'Credit', 'Societies', 'PACS', 'Urban', 'UCBs', 'regulated', 'Dual', 'Control', 'Regulation', 'Amendment', 'Act', '2020']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.monetary_policy_banking_architecture.non-performing_assets_resolution_architecture', 'non-performing_assets_resolution_architecture', 'Non-Performing Assets & Resolution Architecture (Gross vs Net NPAs, Special Mention Accounts / SMA-0, 1, 2, Stressed Assets; Twin Balance Sheet Syndrome; Insolvency and Bankruptcy Code / IBC 2016 - National Company Law Tribunal / NCLT, Insolvency and Bankruptcy Board of India / IBBI, Committee of Creditors; Bad Bank - National Asset Reconstruction Company Limited / NARCL & India Debt Resolution Company Limited / IDRCL; Prompt Corrective Action / PCA Framework, BASEL III Norms - Capital Adequacy Ratio / CRAR, Tier 1 & Tier 2 Capital)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Non', 'Performing', 'Assets', 'Resolution', 'Architecture', 'Gross', 'Net', 'NPAs', 'Special', 'Mention', 'Accounts', 'SMA', 'Stressed', 'Twin', 'Balance', 'Sheet', 'Syndrome', 'Insolvency', 'Bankruptcy', 'Code', 'IBC', '2016', 'National', 'Company', 'Law', 'Tribunal', 'NCLT', 'Board', 'India', 'IBBI', 'Committee', 'Creditors', 'Bad', 'Bank', 'Asset', 'Reconstruction', 'Limited', 'NARCL', 'Debt', 'IDRCL', 'Prompt', 'Corrective', 'Action', 'PCA', 'Framework', 'BASEL', 'III', 'Norms', 'Capital', 'Adequacy', 'Ratio', 'CRAR', 'Tier']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.monetary_policy_banking_architecture.non-banking_financial_institutions_capital_markets', 'non-banking_financial_institutions_capital_markets', 'Non-Banking Financial Institutions & Capital Markets (Non-Banking Financial Companies / NBFCs - Systemically Important NBFCs, Scale-Based Regulatory Framework; Primary vs Secondary Markets, Initial Public Offerings / IPOs, SEBI Regulatory Framework, Stock Exchanges - BSE, NSE, Algorithmic & High-Frequency Trading, Mutual Funds & Systematic Investment Plans / SIPs, Credit Rating Agencies / CRAs)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.monetary_policy_banking_architecture']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Non', 'Banking', 'Financial', 'Institutions', 'Capital', 'Markets', 'Companies', 'NBFCs', 'Systemically', 'Important', 'Scale', 'Based', 'Regulatory', 'Framework', 'Primary', 'Secondary', 'Initial', 'Public', 'Offerings', 'IPOs', 'SEBI', 'Stock', 'Exchanges', 'BSE', 'NSE', 'Algorithmic', 'High', 'Frequency', 'Trading', 'Mutual', 'Funds', 'Systematic', 'Investment', 'Plans', 'SIPs', 'Credit', 'Rating', 'Agencies', 'CRAs']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.fiscal_policy_public_finance_taxation.union_budget_public_finance_architecture_contingency_fund_article_267_public_account_article_266_revenue_receipts_vs_capital_receipts_revenue_expenditure_vs_capital_expenditure_capex_multiplier_effect', 'union_budget_public_finance_architecture_contingency_fund_article_267_public_account_article_266_revenue_receipts_vs_capital_receipts_revenue_expenditure_vs_capital_expenditure_capex_multiplier_effect', 'Union Budget & Public Finance Architecture (Constitutional Provisions - Article 112 / Annual Financial Statement; Budget Structure - Consolidated Fund of India Article 266(1), Contingency Fund Article 267, Public Account Article 266(2); Revenue Receipts vs Capital Receipts, Revenue Expenditure vs Capital Expenditure / Capex Multiplier Effect)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Union', 'Budget', 'Public', 'Finance', 'Architecture', 'Constitutional', 'Provisions', 'Article', '112', 'Annual', 'Financial', 'Statement', 'Structure', 'Consolidated', 'Fund', 'India', '266', 'Contingency', '267', 'Account', 'Revenue', 'Receipts', 'Capital', 'Expenditure', 'Capex', 'Multiplier', 'Effect']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.fiscal_policy_public_finance_taxation.deficit_concepts_fiscal_discipline', 'deficit_concepts_fiscal_discipline', 'Deficit Concepts & Fiscal Discipline (Revenue Deficit / Effective Revenue Deficit, Fiscal Deficit - Borrowing Requirement of Government, Primary Deficit; Fiscal Responsibility and Budget Management / FRBM Act 2003 - N.K. Singh Committee Recommendations, Debt-to-GDP Ratio Targets, Escape Clauses)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Deficit', 'Concepts', 'Fiscal', 'Discipline', 'Revenue', 'Effective', 'Borrowing', 'Requirement', 'Government', 'Primary', 'Responsibility', 'Budget', 'Management', 'FRBM', 'Act', '2003', 'N.K.', 'Singh', 'Committee', 'Recommendations', 'Debt', 'GDP', 'Ratio', 'Targets', 'Escape', 'Clauses']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.fiscal_policy_public_finance_taxation.direct_taxation_reforms', 'direct_taxation_reforms', 'Direct Taxation & Reforms (Income Tax Slabs & New Tax Regime, Corporate Tax Reforms - Reduction to 22% / 15% for new manufacturing units, Minimum Alternate Tax / MAT, Equalisation Levy / Google Tax, Faceless Assessment & Taxpayer''s Charter, Base Erosion and Profit Shifting / BEPS, Double Tax Avoidance Agreements / DTAA, General Anti-Avoidance Rules / GAAR)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Direct', 'Taxation', 'Reforms', 'Income', 'Tax', 'Slabs', 'New', 'Regime', 'Corporate', 'Reduction', '22%', '15%', 'new', 'manufacturing', 'units', 'Minimum', 'Alternate', 'MAT', 'Equalisation', 'Levy', 'Google', 'Faceless', 'Assessment', 'Taxpayer''s', 'Charter', 'Base', 'Erosion', 'Profit', 'Shifting', 'BEPS', 'Double', 'Avoidance', 'Agreements', 'DTAA', 'General', 'Anti', 'Rules', 'GAAR']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.fiscal_policy_public_finance_taxation.indirect_taxation_gst_architecture', 'indirect_taxation_gst_architecture', 'Indirect Taxation & GST Architecture (Goods and Services Tax / GST - 101st Constitutional Amendment Act, Destination-based Consumption Tax, Subsumed Taxes; Dual GST Model - CGST, SGST, IGST; GST Council Article 279A - Composition & Decision Mechanism; Inverted Duty Structure, Input Tax Credit / ITC Fraud, E-Way Bill, GST Compensation Cess Mechanism)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indirect', 'Taxation', 'GST', 'Architecture', 'Goods', 'Services', 'Tax', '101st', 'Constitutional', 'Amendment', 'Act', 'Destination', 'based', 'Consumption', 'Subsumed', 'Taxes', 'Dual', 'Model', 'CGST', 'SGST', 'IGST', 'Council', 'Article', '279A', 'Composition', 'Decision', 'Mechanism', 'Inverted', 'Duty', 'Structure', 'Input', 'Credit', 'ITC', 'Fraud', 'Way', 'Bill', 'Compensation', 'Cess']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.fiscal_policy_public_finance_taxation.public_debt_fiscal_federalism', 'public_debt_fiscal_federalism', 'Public Debt & Fiscal Federalism (Internal vs External Public Debt, Sovereign Green Bonds, Ways and Means Advances / WMA; Finance Commission Article 280 - Terms of Reference, Vertical vs Horizontal Devolution Criteria, Post-Devolution Revenue Deficit Grants, Performance-linked Incentives)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.fiscal_policy_public_finance_taxation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Public', 'Debt', 'Fiscal', 'Federalism', 'Internal', 'External', 'Sovereign', 'Green', 'Bonds', 'Ways', 'Means', 'Advances', 'WMA', 'Finance', 'Commission', 'Article', '280', 'Terms', 'Reference', 'Vertical', 'Horizontal', 'Devolution', 'Criteria', 'Post', 'Revenue', 'Deficit', 'Grants', 'Performance', 'linked', 'Incentives']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.agriculture_food_management_subsidies.cropping_patterns_agrarian_systems', 'cropping_patterns_agrarian_systems', 'Cropping Patterns & Agrarian Systems (Kharif, Rabi & Zaid Seasons; Crop Diversity - Cereals, Pulses, Oilseeds, Commercial Crops; Millets / Shree Anna - Climate Resilient Crops, International Year of Millets 2023; Precision Farming & Zero Budget Natural Farming / ZBNF)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Cropping', 'Patterns', 'Agrarian', 'Systems', 'Kharif', 'Rabi', 'Zaid', 'Seasons', 'Crop', 'Diversity', 'Cereals', 'Pulses', 'Oilseeds', 'Commercial', 'Crops', 'Millets', 'Shree', 'Anna', 'Climate', 'Resilient', 'International', 'Year', '2023', 'Precision', 'Farming', 'Zero', 'Budget', 'Natural', 'ZBNF']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.agriculture_food_management_subsidies.irrigation_infrastructure_water_productivity', 'irrigation_infrastructure_water_productivity', 'Irrigation Infrastructure & Water Productivity (Types - Surface, Groundwater, Canal Irrigation; Micro-Irrigation - Drip & Sprinkler Systems; Pradhan Mantri Krishi Sinchayee Yojana / PMKSY - Per Drop More Crop, Har Khet Ko Pani; Command Area Development; Groundwater Overexploitation & Atal Bhujal Yojana)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Irrigation', 'Infrastructure', 'Water', 'Productivity', 'Types', 'Surface', 'Groundwater', 'Canal', 'Micro', 'Drip', 'Sprinkler', 'Systems', 'Pradhan', 'Mantri', 'Krishi', 'Sinchayee', 'Yojana', 'PMKSY', 'Per', 'Drop', 'Crop', 'Har', 'Khet', 'Pani', 'Command', 'Area', 'Development', 'Overexploitation', 'Atal', 'Bhujal']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.agriculture_food_management_subsidies.farm_inputs_credit_crop_insurance', 'farm_inputs_credit_crop_insurance', 'Farm Inputs, Credit & Crop Insurance (Fertilizer Architecture - Urea, DAP, MOP; Nutrient Based Subsidy / NBS Scheme, Nano Urea & Nano DAP, Direct Benefit Transfer / DBT in Fertilizers; Institutional Credit - Priority Sector Lending / PSL Norms, Kisan Credit Card / KCC, Interest Subvention Scheme; Pradhan Mantri Fasal Bima Yojana / PMFBY - Yield Index vs Weather Index, PM KISAN / Income Support Scheme)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Farm', 'Inputs', 'Credit', 'Crop', 'Insurance', 'Fertilizer', 'Architecture', 'Urea', 'DAP', 'MOP', 'Nutrient', 'Based', 'Subsidy', 'NBS', 'Scheme', 'Nano', 'Direct', 'Benefit', 'Transfer', 'DBT', 'Fertilizers', 'Institutional', 'Priority', 'Sector', 'Lending', 'PSL', 'Norms', 'Kisan', 'Card', 'KCC', 'Interest', 'Subvention', 'Pradhan', 'Mantri', 'Fasal', 'Bima', 'Yojana', 'PMFBY', 'Yield', 'Index', 'Weather', 'KISAN', 'Income', 'Support']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.agriculture_food_management_subsidies.agricultural_pricing_market_reforms', 'agricultural_pricing_market_reforms', 'Agricultural Pricing & Market Reforms (Minimum Support Price / MSP - Comprehensive Cost C2 + 50% vs A2+FL; Commission for Agricultural Costs and Prices / CACP; PM-AASHA Scheme; Market Architecture - Agricultural Produce Market Committees / APMC, Model APMC Act, Electronic National Agriculture Market / e-NAM, Farmer Producer Organisations / FPOs, Contract Farming Regulations)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Agricultural', 'Pricing', 'Market', 'Reforms', 'Minimum', 'Support', 'Price', 'MSP', 'Comprehensive', 'Cost', '50%', 'A2+FL', 'Commission', 'Costs', 'Prices', 'CACP', 'AASHA', 'Scheme', 'Architecture', 'Produce', 'Committees', 'APMC', 'Model', 'Act', 'Electronic', 'National', 'Agriculture', 'NAM', 'Farmer', 'Producer', 'Organisations', 'FPOs', 'Contract', 'Farming', 'Regulations']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.agriculture_food_management_subsidies.food_processing_supply_chain_logistics', 'food_processing_supply_chain_logistics', 'Food Processing & Supply Chain Logistics (Mega Food Parks Scheme, PM Formalisation of Micro food processing Enterprises / PMFME, Operation Greens / TOP to TOTAL, Pradhan Mantri Kisan SAMPADA Yojana; Cold Chain Infrastructure, Post-Harvest Losses, Food Quality Standards / FSSAI)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Food', 'Processing', 'Supply', 'Chain', 'Logistics', 'Mega', 'Parks', 'Scheme', 'Formalisation', 'Micro', 'food', 'processing', 'Enterprises', 'PMFME', 'Operation', 'Greens', 'TOP', 'TOTAL', 'Pradhan', 'Mantri', 'Kisan', 'SAMPADA', 'Yojana', 'Cold', 'Infrastructure', 'Post', 'Harvest', 'Losses', 'Quality', 'Standards', 'FSSAI']::text[],
        'civil_services', ARRAY['civil_services']::text[]
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
