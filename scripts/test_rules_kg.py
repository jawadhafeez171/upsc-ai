import json
import sys
import re

sys.stdout.reconfigure(encoding='utf-8')

with open('src/data/knowledge_graph.json', 'r', encoding='utf-8') as f:
    kg = json.load(f)
nodes = kg['nodes']

# List of rules: (regex_pattern, node_id, priority)
# NOTE: Patterns check English & Kannada question text and options.
RAW_RULES = [
    # =========================================================================
    # 1. GENERAL MENTAL ABILITY & QUANTITATIVE APTITUDE
    # =========================================================================
    (
        r'\b(next\s+number|missing\s+number|replace\s+the\s+question\s+mark|number\s+series|wrong\s+term|ಮುಂದಿನ\s+ಸಂಖ್ಯೆ|ಸಂಖ್ಯಾ\s+ಸರಣಿ|ಬಿಟ್ಟಿರುವ\s+ಸಂಖ್ಯೆ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series',
        98
    ),
    (
        r'\b(letter\s+series|alphabet\s+series|ಅಕ್ಷರ\s+ಸರಣಿ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series',
        98
    ),
    (
        r'\b(coded\s+as|coding|decoding|written\s+as|code\s+language|ಸಂಕೇತ\s+ಭಾಷೆ|ಕೋಡಿಂಗ್|ಡಿಕೋಡಿಂಗ್)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution',
        98
    ),
    (
        r'\b(blood\s+relation|brother\s+of|sister\s+of|father\s+of|mother\s+of|son\s+of|daughter\s+of|maternal\s+uncle|paternal\s+uncle|ರಕ್ತ\s*ಸಂಬಂಧ|ತಂದೆಯ\s+ಸಹೋದರ|ತಾಯಿಯ\s+ಸಹೋದರ|ಮಗನ\s+ಮಗ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.blood_relations_family_trees_coded_relations',
        98
    ),
    (
        r'\b(walks\s+\d+\s*km\s+north|towards\s+south|towards\s+east|towards\s+west|turns\s+to\s+his\s+left|turns\s+to\s+his\s+right|starting\s+point|ಉತ್ತರಕ್ಕೆ\s+ನಡೆದು|ದಕ್ಷಿಣಕ್ಕೆ\s+ನಡೆದು|ಪೂರ್ವಕ್ಕೆ\s+ನಡೆದು|ಪಶ್ಚಿಮಕ್ಕೆ\s+ನಡೆದು|ಎಡಕ್ಕೆ\s+ತಿರುಗಿ|ಬಲಕ್ಕೆ\s+ತಿರುಗಿ|ಆರಂಭಿಕ\s+ಸ್ಥಾನದಿಂದ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.direction_distance_sense_shadows',
        98
    ),
    (
        r'\b(train\s+\d+\s*m|speed\s+of\s+train|crosses\s+a\s+pole|crosses\s+a\s+platform|crosses\s+a\s+bridge|ರೈಲಿನ\s+ಉದ್ದ|ರೈಲಿನ\s+ವೇಗ|ಪ್ಲಾಟ್‌ಫಾರ್ಮ್\s+ದಾಟಲು|ಸೇತುವೆ\s+ದಾಟಲು)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains',
        98
    ),
    (
        r'\b(upstream|downstream|speed\s+of\s+boat|speed\s+of\s+stream|ದೋಣಿಯ\s+ವೇಗ|ಪ್ರವಾಹದ\s+ವೇಗ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.boats_streams_relative_speed',
        98
    ),
    (
        r'\b(can\s+complete\s+a\s+work\s+in\s+\d+\s*days|working\s+together|pipes?\s+and\s+cistern|fill\s+the\s+tank|ಕೆಲಸವನ್ನು\s+\d+\s*ದಿನಗಳಲ್ಲಿ|ಒಟ್ಟಿಗೆ\s+ಕೆಲಸ|ತೊಟ್ಟಿ\s+ತುಂಬಲು|ಪೈಪ್)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_work_wages_pipes_cisterns',
        98
    ),
    (
        r'\b(cost\s+price|selling\s+price|gain\s+percent|loss\s+percent|profit\s+and\s+loss|marked\s+price|discount\s+of\s+\d+|ಖರೀದಿ\s+ಬೆಲೆ|ಮಾರಾಟದ\s+ಬೆಲೆ|ಶೇಕಡಾ\s+ಲಾಭ|ಶೇಕಡಾ\s+ನಷ್ಟ|ರಿಯಾಯಿತಿ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.profit_loss_marked_price_discounts',
        98
    ),
    (
        r'\b(simple\s+interest|compound\s+interest|principal\s+amount|rate\s+of\s+interest|ಸರಳ\s+ಬಡ್ಡಿ|ಚಕ್ರ\s+ಬಡ್ಡಿ|ಅಸಲು\s+ಮತ್ತು\s+ಬಡ್ಡಿ|ಬಡ್ಡಿದರ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_compound_interest_installments',
        98
    ),
    (
        r'\b(ratio\s+of\s+ages|present\s+age|years\s+ago.*age|years\s+hence.*age|ವಯಸ್ಸಿನ\s+ಅನುಪಾತ|ಪ್ರಸ್ತುತ\s+ವಯಸ್ಸು|ವರ್ಷಗಳ\s+ಹಿಂದೆ.*ವಯಸ್ಸು)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.problems_on_ages',
        98
    ),
    (
        r'\b(ratio\s+and\s+proportion|equivalent\s+to\s+\d+\s*:\s*\d+|proportionate|ಅನುಪಾತ\s+ಮತ್ತು\s+ಸಮಾನುಪಾತ|ಸಮಾನುಪಾತ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_variations_partnerships',
        95
    ),
    (
        r'\b(average\s+of\s+\d+|arithmetic\s+mean|average\s+weight|average\s+marks|ಸರಾಸರಿ\s+ತೂಕ|ಸರಾಸರಿ\s+ಅಂಕ|ಸಂಖ್ಯೆಗಳ\s+ಸರಾಸರಿ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation',
        95
    ),
    (
        r'\b(lcm\s+and\s+hcf|least\s+common\s+multiple|highest\s+common\s+factor|greatest\s+common\s+divisor|ಲಸಾಅ|ಮಸಾಅ|ಲ\.ಸಾ\.ಅ|ಮ\.ಸಾ\.ಅ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.lcm_hcf_factors_multiples',
        98
    ),
    (
        r'\b(divisible\s+by\s+\d+|divisibility\s+rule|remainder\s+when|ಭಾಗಿಸಿದಾಗ\s+ಉಳಿಯುವ\s+ಶೇಷ|ಭಾಗವಾಗುವ\s+ಸಂಖ್ಯೆ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules',
        95
    ),
    (
        r'\b(area\s+of\s+triangle|area\s+of\s+circle|circumference\s+of|perimeter\s+of|volume\s+of\s+cylinder|volume\s+of\s+cone|ತ್ರಿಭುಜದ\s+ವಿಸ್ತೀರ್ಣ|ವೃತ್ತದ\s+ವಿಸ್ತೀರ್ಣ|ವೃತ್ತದ\s+ಸುತ್ತಳತೆ|ಆಯತದ\s+ವಿಸ್ತೀರ್ಣ|ಘನಫಲ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons',
        98
    ),
    (
        r'\b(calendar|day\s+of\s+the\s+week|leap\s+year|angle\s+between\s+hands\s+of\s+clock|ಕ್ಯಾಲೆಂಡರ್|ವಾರದ\s+ದಿನ|ಅಧಿಕ\s+ವರ್ಷ|ಗಡಿಯಾರದ\s+ಮುಳ್ಳುಗಳ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.clocks_calendars_angles_reflex_gain_loss',
        98
    ),
    (
        r'\b(line\s+chart|line\s+graph|bar\s+chart|pie\s+chart|ರೇಖಾಚಿತ್ರ|ಸ್ತಂಭಚಿತ್ರ|ಪೈ\s+ಚಾರ್ಟ್)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.line_graphs_multiseries_trends',
        98
    ),
    (
        r'\b(venn\s+diagram|ವೆನ್\s+ಚಿತ್ರ)\b',
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.syllogism_venn_diagrams_deductive_logic',
        98
    ),

    # =========================================================================
    # 2. KARNATAKA HISTORY, ART & CULTURE
    # =========================================================================
    (
        r'\b(kadamba|banavasi|mayurasharma|halmidi\s+inscription|ಕದಂಬ|ಬನವಾಸಿ|ಮಯೂರವರ್ಮ|ಹಲ್ಮಿಡಿ\s+ಶಾಸನ)\b',
        'history.history_of_karnataka.ancient_dynasties_of_karnataka.kadambas_of_banavasi',
        98
    ),
    (
        r'\b(western\s+ganga|talakadu|chavundaraya|shravanabelagola|gommateshwara|ತಲಕಾಡಿನ\s+ಗಂಗರು|ಚಾವುಂಡರಾಯ|ಶ್ರವಣಬೆಳಗೊಳ|ಗೊಮ್ಮಟೇಶ್ವರ)\b',
        'history.history_of_karnataka.ancient_dynasties_of_karnataka.western_gangas_of_talakad',
        98
    ),
    (
        r'\b(badami\s+chalukya|pulakeshin|aihole|pattadakal|ಬಾದಾಮಿ\s+ಚಾಲುಕ್ಯ|ಇಮ್ಮಡಿ\s+ಪುಲಕೇಶಿ|ಐಹೊಳೆ|ಪಟ್ಟದಕಲ್ಲು)\b',
        'history.history_of_karnataka.ancient_dynasties_of_karnataka.badami_chalukyas',
        98
    ),
    (
        r'\b(rashtrakuta|amoghavarsha|nripatunga|kavirajamarga|dantidurga|ellora\s+kailash|ರಾಷ್ಟ್ರಕೂಟ|ಅಮೋಘವರ್ಷ\s+ನೃಪತುಂಗ|ಕವಿರಾಜಮಾರ್ಗ|ದಂತಿದುರ್ಗ)\b',
        'history.history_of_karnataka.ancient_dynasties_of_karnataka.rashtrakutas_of_manyakheta',
        98
    ),
    (
        r'\b(hoysala|belur|halebidu|vishnuvardhana|somnathpura|ಹೊಯ್ಸಳ|ಬೇಲೂರು|ಹಳೇಬೀಡು|ವಿಷ್ಣುವರ್ಧನ|ಸೋಮನಾಥಪುರ)\b',
        'history.history_of_karnataka.medieval_dynasties_of_karnataka.hoysalas_of_dwarasamudra',
        98
    ),
    (
        r'\b(vijayanagara\s+empire|hampi|krishnadevaraya|harihara\s+and\s+bukka|talikota|ವಿಜಯನಗರ\s+ಸಾಮ್ರಾಜ್ಯ|ಹಂಪಿ|ಕೃಷ್ಣದೇವರಾಯ|ಹರಿಹರ\s+ಮತ್ತು\s+ಬುಕ್ಕ|ತಾಳಿಕೋಟೆ|ರಕ್ಕಸ\s+ತಂಗಡಿ)\b',
        'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms.vijayanagara_empire',
        98
    ),
    (
        r'\b(bahmani\s+sultanate|gulbarga\s+fort|bidar\s+fort|mahmud\s+gawan|ಬಹಮನಿ\s+ಸುಲ್ತಾನರು|ಗುಲ್ಬರ್ಗಾ\s+ಕೋಟೆ|ಬೀದರ್\s+ಕೋಟೆ|ಮಹಮೂದ್\s+ಗವಾನ್)\b',
        'history.history_of_karnataka.bahmani_and_deccan_sultanates.bahmani_sultanate_architecture_administration',
        98
    ),
    (
        r'\b(bijapur\s+sultanate|adil\s+shahi|gol\s+gumbaz|ibrahim\s+roza|ವಿಜಯಪುರ|ಆದಿಲ್\s+ಶಾಹಿ|ಗೋಲ್\s+ಗುಮ್ಮಟ|ಇಬ್ರಾಹಿಂ\s+ರೋಜಾ)\b',
        'history.history_of_karnataka.bahmani_and_deccan_sultanates.adil_shahis_of_vijayapura',
        98
    ),
    (
        r'\b(hyder\s+ali|tipu\s+sultan|anglo-mysore\s+war|treaty\s+of\s+srirangapatna|ಹೈದರ್\s+ಅಲಿ|ಟಿಪ್ಪು\s+ಸುಲ್ತಾನ್|ಆಂಗ್ಲೋ-ಮೈಸೂರು\s+ಯುದ್ಧ|ಶ್ರೀರಂಗಪಟ್ಟಣ\s+ಒಪ್ಪಂದ)\b',
        'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.hyder_ali_tipu_sultan_era',
        98
    ),
    (
        r'\b(wodeyar|wadiyar|chikka\s+devaraja|nalwadi\s+krishnaraja|dewan\s+rangacharlu|sheshadri\s+iyer|visvesvaraya|ಮಿರ್ಜಾ\s+ಇಸ್ಮಾಯಿಲ್|ಒಡೆಯರ್|ನಾಲ್ವಡಿ\s+ಕೃಷ್ಣರಾಜ|ವಿಶ್ವೇಶ್ವರಯ್ಯ)\b',
        'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.princely_state_of_mysore_british_paramountcy',
        98
    ),
    (
        r'\b(kittur\s+chennamma|sangolli\s+rayanna|halagali\s+bedas|surapura\s+venkatappa|ಕಿತ್ತೂರು\s+ಚೆನ್ನಮ್ಮ|ಸಂಗೊಳ್ಳಿ\s+ರಾಯಣ್ಣ|ಹಲಗಲಿ\s+ಬೇಡರು|ಸುರಪುರದ\s+ವೆಂಕಟಪ್ಪ)\b',
        'history.history_of_karnataka.armed_resistance_freedom_movement_in_karnataka.early_anti-british_armed_uprisings_in_karnataka',
        98
    ),
    (
        r'\b(karnataka\s+unification|karnataka\s+ekikarana|aluru\s+venkata\s+rao|fazal\s+ali\s+commission|state\s+reorganisation.*karnataka|ಕರ್ನಾಟಕ\s+ಏಕೀಕರಣ|ಆಲೂರು\s+ವೆಂಕಟರಾವ್|ಫಜಲ್\s+ಅಲಿ\s+ಆಯೋಗ)\b',
        'history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation.karnataka_ekikarana_movement',
        98
    ),
    (
        r'\b(basaveshwara|anubhava\s+mantapa|vachana\s+movement|allama\s+prabhu|akramahadevi|ಬಸವೇಶ್ವರ|ಅನುಭವ\s+ಮಂಟಪ|ವಚನ\s+ಚಳವಳಿ|ಅಲ್ಲಮಪ್ರಭು|ಅಕ್ಕಮಹಾದೇವಿ|ಶರಣರು)\b',
        'art_culture_heritage.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka.vachana_movement_basaveshwara_anubhava_mantapa',
        98
    ),
    (
        r'\b(purandara\s+dasa|kanaka\s+dasa|haridasa|dasa\s+sahitya|ಪುರಂದರದಾಸ|ಕನಕದಾಸ|ಹರಿದಾಸ|ದಾಸ\s+ಸಾಹಿತ್ಯ)\b',
        'art_culture_heritage.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka.haridasa_movement_purandara_dasa_kanaka_dasa',
        98
    ),
    (
        r'\b(yakshagana|dollu\s+kunitha|veeragase|kamsale|ಯಕ್ಷಗಾನ|ಡೊಳ್ಳು\s+ಕುಣಿತ|ವೀರಗಾಸೆ|ಕಂಸಾಳೆ)\b',
        'art_culture_heritage.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka.yakshagana_theatre_tradition_coastal_malnad',
        98
    ),
    (
        r'\b(kuvempu|k\.?\s*v\.?\s*puttappa|bendre|da\.?\s*ra\.?\s*bendre|shivarama\s+karanth|masti\s+venkatesha|gokak|v\.?\s*k\.?\s*gokak|u\.?\s*r\.?\s*ananthamurthy|girish\s+karnad|chandrashekhara\s+kambar|jnanpith\s+award.*kannada|ಕುವೆಂಪು|ಬೇಂದ್ರೆ|ಶಿವರಾಮ\s+ಕಾರಂತ|ಮಾಸ್ತಿ\s+ವೆಂಕಟೇಶ|ಜ್ಞಾನಪೀಠ\s+ಪ್ರಶಸ್ತಿ|ರೈತ\s+ಗೀತೆ|ನಾಡಗೀತೆ)\b',
        'language_proficiency_grammar_communication.kannada_literature_authors_sahitya_academy_awards',
        98
    ),
    (
        r'\b(karnataka\s+ratna|ಕರ್ನಾಟಕ\s+ರತ್ನ)\b',
        'art_culture_heritage.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards.national_cultural_awards_and_honours',
        98
    ),
    (
        r'\b(gi\s+tag.*karnataka|geographical\s+indication.*karnataka|channapatna\s+toys|mysore\s+silk|mysore\s+sandal|ilkal\s+saree|ಜಿಐ\s+ಟ್ಯಾಗ್|ಚನ್ನಪಟ್ಟಣದ\s+ಆಟಿಕೆ|ಮೈಸೂರು\s+ರೇಷ್ಮೆ)\b',
        'art_culture_heritage.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage.gi_tagged_handicrafts_and_textiles_of_karnataka',
        98
    ),
    (
        r'\b(mangaluru\s+samachara|oldest\s+kannada\s+newspaper|hermann\s+mogling|ಮಂಗಳೂರು\s+ಸಮಾಚಾರ|ಕನ್ನಡದ\s+ಮೊದಲ\s+ಪತ್ರಿಕೆ)\b',
        'history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation',
        98
    ),

    # =========================================================================
    # 3. KARNATAKA GEOGRAPHY
    # =========================================================================
    (
        r'\b(cauvery\s+river|kaveri\s+river|talakaveri|shivasamudram|krs\s+dam|krishna\s+river|almatti\s+dam|tungabhadra|sharavathi|jog\s+falls|gokak\s+falls|malaprabha|ghataprabha|netravati|ಕಾವೇರಿ\s+ನದಿ|ತಲಕಾವೇರಿ|ಶಿವನಸಮುದ್ರ|ಕೆಆರ್‌ಎಸ್\s+ಅಣೆಕಟ್ಟು|ಕೃಷ್ಣಾ\s+ನದಿ|ಆಲಮಟ್ಟಿ|ತುಂಗಭದ್ರಾ|ಶರಾವತಿ|ಜೋಗ\s+ಜಲಪಾತ|ಗೋಕಾಕ್\s+ಜಲಪಾತ|ಘಟಪ್ರಭಾ|ಮಲಪ್ರಭಾ|ನೇತ್ರಾವತಿ)\b',
        'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka',
        98
    ),
    (
        r'\b(agumbe\s+ghat|shiradi\s+ghat|charmadi\s+ghat|hulikal\s+ghat|mullayanagiri|kudremukh|malnad|maidan|ಆಗುಂಬೆ\s+ಘಾಟ್|ಶಿರಾಡಿ\s+ಘಾಟ್|ಚಾರ್ಮಾಡಿ\s+ಘಾಟ್|ಹುಲಿಕಲ್\s+ಘಾಟ್|ಮುಳ್ಳಯ್ಯನಗಿರಿ|ಕುದುರೆಮುಖ|ಮಲೆನಾಡು|ಕರಾವಳಿ|ಮೈದಾನ)\b',
        'geography_earth_systems.geography_of_karnataka.physiography_relief_divisions_of_karnataka',
        98
    ),
    (
        r'\b(bandipur|nagarhole|bannerghatta|anshi\s+national\s+park|dandeli|bhadra\s+wildlife|ರಂಗನತಿಟ್ಟು|ಬಂಡೀಪುರ|ನಾಗರಹೊಳೆ|ಬನ್ನೇರುಘಟ್ಟ|ದಾಂಡೇಲಿ|ಭದ್ರಾ\s+ಅಭಯಾರಣ್ಯ)\b',
        'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.wildlife_sanctuaries_national_parks_conservation_reserves',
        98
    ),
    (
        r'\b(districts?\s+of\s+karnataka|karnataka\s+state\s+border|longest\s+highway.*karnataka|pavagada\s+solar|ಕರ್ನಾಟಕದ\s+ಜಿಲ್ಲೆಗಳು|ಕರ್ನಾಟಕದ\s+ಗಡಿ|ಕರ್ನಾಟಕದ\s+ಹೆದ್ದಾರಿ|ಪಾವಗಡ\s+ಸೌರ)\b',
        'geography_earth_systems.geography_of_karnataka',
        95
    ),

    # =========================================================================
    # 4. INDIAN POLITY & CONSTITUTION
    # =========================================================================
    (
        r'\b(fundamental\s+rights|article\s+1[2-9]\b|article\s+2[0-2]\b|article\s+32\b|writ\s+of|habeas\s+corpus|mandamus|prohibition|certiorari|quo\s+warranto|untouchability|article\s+17|right\s+to\s+equality|right\s+to\s+freedom|right\s+to\s+life|article\s+21|article\s+21a|ಮೂಲಭೂತ\s+ಹಕ್ಕುಗಳು|ವಿಧಿ\s+17|ಅಸ್ಪೃಶ್ಯತೆ|ವಿಧಿ\s+21|ಶಿಕ್ಷಣದ\s+ಹಕ್ಕು|ರಿಟ್|ಹೆಬಿಯಸ್\s+ಕಾರ್ಪಸ್|ಮ್ಯಾಂಡಮಸ್)\b',
        'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',
        98
    ),
    (
        r'\b(directive\s+principles|dpsp|article\s+3[6-9]\b|article\s+4[0-9]\b|article\s+5[01]\b|uniform\s+civil\s+code|article\s+44|ರಾಜ್ಯ\s+ನೀತಿ\s+ನಿರ್ದೇಶಕ\s+ತತ್ವಗಳು|ಸಮಾನ\s+ನಾಗರಿಕ\s+ಸಂಹಿತೆ|ವಿಧಿ\s+44)\b',
        'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.directive_principles_of_state_policy_-_part_iv_articles_36-51',
        98
    ),
    (
        r'\b(fundamental\s+duties|article\s+51a|part\s+iv-?a|swaran\s+singh\s+committee|ಮೂಲಭೂತ\s+ಕರ್ತವ್ಯಗಳು|ವಿಧಿ\s+51ಎ|ಸ್ವರಣ್\s+ಸಿಂಗ್\s+ಸಮಿತಿ)\b',
        'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_duties_-_part_iv-a_article_51a',
        98
    ),
    (
        r'\b(preamble\s+of|constituent\s+assembly|drafting\s+committee|dr\.?\s*b\.?\s*r\.?\s*ambedkar.*constitution|objective\s+resolution|ಪ್ರಸ್ತಾವನೆ|ಸಂವಿಧಾನ\s+ರಚನಾ\s+ಸಭೆ|ಕರಡು\s+ಸಮಿತಿ|ಅಂಬೇಡ್ಕರ್.*ಸಂವಿಧಾನ)\b',
        'indian_polity_constitution_governance.historical_background_making_of_the_constitution.constituent_assembly_drafting_process',
        98
    ),
    (
        r'\b(basic\s+structure\s+doctrine|kesavananda\s+bharati|minerva\s+mills|ಸಂವಿಧಾನದ\s+ಮೂಲ\s+ರಚನೆ|ಕೇಶವಾನಂದ\s+ಭಾರತಿ\s+ಪ್ರಕರಣ)\b',
        'indian_polity_constitution_governance.salient_features_amendments_basic_structure.basic_structure_doctrine',
        98
    ),
    (
        r'\b(amendment\s+act|article\s+368|42nd\s+amendment|44th\s+amendment|86th\s+amendment|101st\s+amendment|ಸಂವಿಧಾನ\s+ತಿದ್ದುಪಡಿ|ವಿಧಿ\s+368|42\s*ನೇ\s+ತಿದ್ದುಪಡಿ|44\s*ನೇ\s+ತಿದ್ದುಪಡಿ)\b',
        'indian_polity_constitution_governance.salient_features_amendments_basic_structure.major_constitutional_amendments',
        98
    ),
    (
        r'\b(anti-defection\s+law|tenth\s+schedule|10th\s+schedule|schedules?\s+of\s+constitution|ಪಕ್ಷಾಂತರ\s+ನಿಷೇಧ\s+ಕಾಯ್ದೆ|10\s*ನೇ\s+ಅನುಸೂಚಿ|ಸಂವಿಧಾನದ\s+ಅನುಸೂಚಿಗಳು)\b',
        'indian_polity_constitution_governance.salient_features_amendments_basic_structure.salient_features_of_the_indian_constitution',
        98
    ),
    (
        r'\b(president\s+of\s+india|impeachment\s+of\s+president|ordinance\s+making|article\s+52|article\s+61|article\s+72|governor\s+of\s+state|pardon\s+power|ರಾಷ್ಟ್ರಪತಿ|ರಾಷ್ಟ್ರಪತಿಯ\s+ಮಹಾಭಿಯೋಗ|ರಾಜ್ಯಪಾಲರು|ಸುಗ್ರೀವಾಜ್ಞೆ|ಕ್ಷಮಾದಾನ\s+ಅಧಿಕಾರ)\b',
        'indian_polity_constitution_governance.union_executive_state_executive.union_executive',
        98
    ),
    (
        r'\b(prime\s+minister|chief\s+minister|council\s+of\s+ministers|ಪ್ರಧಾನ\s+ಮಂತ್ರಿ|ಮುಖ್ಯಮಂತ್ರಿ|ಮಂತ್ರಿಮಂಡಲ)\b',
        'indian_polity_constitution_governance.union_executive_state_executive.union_executive',
        90
    ),
    (
        r'\b(parliament\s+of\s+india|lok\s+sabha|rajya\s+sabha|speaker\s+of\s+lok\s+sabha|money\s+bill|joint\s+sitting|vidhana\s+sabha|vidhana\s+parishad|ಸಂಸತ್ತು|ಲೋಕಸಭೆ|ರಾಜ್ಯಸಭೆ|ಸ್ಪೀಕರ್|ವಿಧೇಯಕ|ಹಣಕಾಸು\s+ಮಸೂದೆ|ವಿಧಾನಸಭೆ|ವಿಧಾನಪರಿಷತ್)\b',
        'indian_polity_constitution_governance.parliament_state_legislatures.structure_composition',
        98
    ),
    (
        r'\b(supreme\s+court|high\s+court|chief\s+justice|judicial\s+review|public\s+interest\s+litigation|\bpil\b|ಸರ್ವೋಚ್ಚ\s+ನ್ಯಾಯಾಲಯ|ಉಚ್ಚ\s+ನ್ಯಾಯಾಲಯ|ಮುಖ್ಯ\s+ನ್ಯಾಯಮೂರ್ತಿ|ನ್ಯಾಯಾಂಗ\s+ಪರಾಮರ್ಶೆ|ಸಾರ್ವಜನಿಕ\s+ಹಿತಾಸಕ್ತಿ\s+ಅರ್ಜಿ)\b',
        'indian_polity_constitution_governance.judiciary_system_of_india.supreme_court_high_courts_appointments_jurisdiction',
        98
    ),
    (
        r'\b(panchayati\s+raj|73rd\s+amendment|74th\s+amendment|gram\s+panchayat|taluk\s+panchayat|zilla\s+panchayat|balwant\s+rai\s+mehta|ashok\s+mehta|municipality|ಪಂಚಾಯತ್\s+ರಾಜ್|73\s*ನೇ\s+ತಿದ್ದುಪಡಿ|74\s*ನೇ\s+ತಿದ್ದುಪಡಿ|ಗ್ರಾಮ\s+ಪಂಚಾಯತ್|ತಾಲ್ಲೂಕು\s+ಪಂಚಾಯತ್|ಜಿಲ್ಲಾ\s+ಪಂಚಾಯತ್|ಬಲವಂತರಾಯ್\s+ಮೆಹ್ತಾ|ಪುರಸಭೆ)\b',
        'indian_polity_constitution_governance.local_governance.73rd_74th_constitutional_amendment_acts',
        98
    ),
    (
        r'\b(sarkaria\s+commission|punchhi\s+commission|centre-state\s+relations|inter-state\s+council|ಸರ್ಕಾರಿಯಾ\s+ಆಯೋಗ|ಪೂಂಛಿ\s+ಆಯೋಗ|ಕೇಂದ್ರ-ರಾಜ್ಯ\s+ಸಂಬಂಧಗಳು|ಅಂತರರಾಜ್ಯ\s+ಮಂಡಳಿ)\b',
        'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.legislative_administrative_relations',
        98
    ),
    (
        r'\b(election\s+commission|comptroller\s+and\s+auditor|cag\s+of\s+india|finance\s+commission|upsc|union\s+public\s+service|kpsc|ಚುನಾವಣಾ\s+ಆಯೋಗ|ಸಿಎಜಿ|ಲೆಕ್ಕ\s+ನಿಯಂತ್ರಕರು|ಹಣಕಾಸು\s+ಆಯೋಗ|ಕೆಪಿಎಸ್ಸಿ|ಯುಪಿಎಸ್ಸಿ)\b',
        'indian_polity_constitution_governance.constitutional_statutory_bodies_in_india.election_commission_of_india',
        98
    ),

    # =========================================================================
    # 5. GENERAL SCIENCE: PHYSICS, CHEMISTRY, BIOLOGY
    # =========================================================================
    (
        r'\b(convex\s+mirror|concave\s+mirror|convex\s+lens|concave\s+lens|refraction|reflection\s+of\s+light|speed\s+of\s+light|total\s+internal\s+reflection|optical\s+fibre|ಪೀನ\s+ದರ್ಪಣ|ನಿಮ್ನ\s+ದರ್ಪಣ|ಪೀನ\s+ಮಸೂರ|ನಿಮ್ನ\s+ಮಸೂರ|ಬೆಳಕಿನ\s+ವಕ್ರೀಭವನ|ಬೆಳಕಿನ\s+ಪ್ರತಿಫಲನ|ಸಂಪೂರ್ಣ\s+ಆಂತರಿಕ\s+ಪ್ರತಿಫಲನ)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_physics',
        98
    ),
    (
        r'\b(newton.*law|law\s+of\s+gravitation|acceleration\s+due\s+to\s+gravity|velocity|momentum|kinetic\s+energy|potential\s+energy|pascal.*law|archimedes|ನ್ಯೂಟನ್.*ನಿಯಮ|ಗುರುತ್ವಾಕರ್ಷಣೆ|ವೇಗೋತ್ಕರ್ಷ|ಚಲನಶಕ್ತಿ|ಸ್ಥಿತಿಶಕ್ತಿ|ಆರ್ಕಿಮಿಡೀಸ್)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_physics',
        98
    ),
    (
        r'\b(electric\s+current|resistance|ohm.*law|voltmeter|ammeter|transformer|semiconductor|ವಿದ್ಯುತ್\s+ಪ್ರವಾಹ|ರೋಧ|ಓಮ್‌ನ\s+ನಿಯಮ|ವಿದ್ಯುತ್ಕಾಂತ|ವಾಹಕ|ಅರ್ಧವಾಹಕ)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_physics',
        98
    ),
    (
        r'\b(acid|base|ph\s+value|litmus|hydrochloric\s+acid|sulphuric\s+acid|nitric\s+acid|sodium\s+chloride|baking\s+soda|washing\s+soda|bleaching\s+powder|ಆಮ್ಲ|ಪ್ರತ್ಯಾಮ್ಲ|ಪಿಎಚ್\s+ಮೌಲ್ಯ|ಲಿಟ್ಮಸ್|ಹೈಡ್ರೋಕ್ಲೋರಿಕ್|ಬೇಕಿಂಗ್\s+ಸೋಡಾ|ಬ್ಲೀಚಿಂಗ್\s+ಪುಡಿ)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
        98
    ),
    (
        r'\b(periodic\s+table|chemical\s+element|alloy|brass|bronze|stainless\s+steel|rusting\s+of\s+iron|galvanization|ಆವರ್ತ\s+ಕೋಷ್ಟಕ|ಹಿತ್ತಾಳೆ|ಕಂಚು|ತುಕ್ಕು\s+ಹಿಡಿಯುವುದು|ಗ್ಯಾಲ್ವನೈಸೇಶನ್)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
        98
    ),
    (
        r'\b(fermentation|conversion\s+of\s+sugar\s+into\s+alcohol|yeast|ಕಿಣ್ವನ|ಹುದುಗುವಿಕೆ|ಸಕ್ಕರೆ.*ಆಲ್ಕೋಹಾಲ್)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_chemistry',
        98
    ),
    (
        r'\b(blood\s+group|universal\s+donor|universal\s+recipient|rh\s+factor|haemoglobin|rbc|wbc|platelets|ರಕ್ತದ\s+ಗುಂಪು|ಯೂನಿವರ್ಸಲ್\s+ಡೋನರ್|ಹಿಮೋಗ್ಲೋಬಿನ್|ಕೆಂಪು\s+ರಕ್ತಕಣ|ಬಿಳಿ\s+ರಕ್ತಕಣ)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        98
    ),
    (
        r'\b(human\s+heart|chamber.*heart|circulatory\s+system|artery|vein|blood\s+pressure|ಹೃದಯ|ರಕ್ತಪರಿಚಲನೆ|ಅಪಧಮನಿ|ಅಭಿಧಮನಿ|ರಕ್ತದೊತ್ತಡ)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        98
    ),
    (
        r'\b(kidney|nephron|dialysis|excretory\s+system|pituitary\s+gland|thyroid|insulin|pancreas|kidneys|ಮೂತ್ರಪಿಂಡ|ನೆಫ್ರಾನ್|ಡಯಾಲಿಸಿಸ್|ಪಿಟ್ಯುಟರಿ\s+ಗ್ರಂಥಿ|ಥೈರಾಯ್ಡ್|ಇನ್ಸುಲಿನ್|ಮೇದೋಜೀರಕ\s+ಗ್ರಂಥಿ)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        98
    ),
    (
        r'\b(vitamins?\s+[a-k]|scurvy|rickets|beriberi|night\s+blindness|deficiency\s+of\s+vitamin|ವಿಟಮಿನ್|ಸ್ಕರ್ವಿ|ರಿಕೆಟ್ಸ್|ಬೆರಿಬೆರಿ|ಇರುಳುಗಣ್ಣು|ವಿಟಮಿನ್\s+ಕೊರತೆ)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        98
    ),
    (
        r'\b(dna|rna|chromosome|double\s+helix|watson\s+and\s+crick|gene|ಡಿಎನ್‌ಎ|ಆರ್‌ಎನ್‌ಎ|ವರ್ಣತಂತು|ವ್ಯಾಟ್ಸನ್\s+ಮತ್ತು\s+ಕ್ರಿಕ್|ಜೀನ್)\b',
        'science_technology_defence.biotechnology_health_life_sciences.genomics_genetics_gene_editing',
        98
    ),
    (
        r'\b(photosynthesis|chlorophyll|chloroplast|stomata|xylem|phloem|ದ್ಯುತಿಸಂಶ್ಲೇಷಣೆ|ಹರಿತ್ತು|ಕ್ಲೋರೊಫಿಲ್|ಕ್ಸೈಲಂ|ಫ್ಲೋಯಂ)\b',
        'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology',
        98
    ),
    (
        r'\b(cell\s+theory|mitochondria|powerhouse\s+of\s+cell|ribosome|endoplasmic|ಕೋಶ|ಮೈಟೊಕಾಂಡ್ರಿಯಾ|ಕೋಶದ\s+ಶಕ್ತಿಮನೆ|ರೈಬೋಸೋಮ್)\b',
        'science_technology_defence.biotechnology_health_life_sciences.cell_biology_reproductive_technology',
        98
    ),
    (
        r'\b(viral\s+disease|virus|bacteria|protozoa|fungi|malaria|tuberculosis|\btb\b|cholera|typhoid|rabies|dengue|covid-19|ಕೊರೊನಾ|ವೈರಸ್|ಬ್ಯಾಕ್ಟೀರಿಯಾ|ಮಲೇರಿಯಾ|ಕ್ಷಯರೋಗ|ಕಾಲರಾ|ಟೈಫಾಯಿಡ್|ರೇಬೀಸ್|ಡೆಂಗ್ಯೂ)\b',
        'science_technology_defence.biotechnology_health_life_sciences.immunology_infectious_diseases_public_health',
        98
    ),
    (
        r'\b(minamata\s+disease|itai-itai|mercury\s+poisoning|arsenic\s+contamination|ಮಿನಮಟ\s+ರೋಗ|ಪಾದರಸದ\s+ವಿಷ|ಆರ್ಸೆನಿಕ್)\b',
        'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.water_pollution_aquatic_degradation',
        98
    ),

    # =========================================================================
    # 6. IT, COMPUTERS, DEFENCE & SPACE
    # =========================================================================
    (
        r'\b(cyber\s+crime|malware|spyware|ransomware|trojan\s+horse|phishing|firewall|hacking|ಕಂಪ್ಯೂಟರ್\s+ವೈರಸ್|ಸ್ಪೈವೇರ್|ರ್ಯಾನ್ಸಮ್‌ವೇರ್|ಟ್ರೋಜನ್|ಸೈಬರ್\s+ಅಪರಾಧ|ಹ್ಯಾಕಿಂಗ್)\b',
        'science_technology_defence.information_communication_technology_ai_cyber_security.cyber_security_threats_digital_governance',
        98
    ),
    (
        r'\b(ram\b|rom\b|cpu\b|motherboard|hard\s+disk|operating\s+system|world\s+wide\s+web|\bwww\b|tim\s+berners-lee|ಬ್ರೌಸರ್|ಆಪರೇಟಿಂಗ್\s+ಸಿಸ್ಟಮ್|ಕಂಪ್ಯೂಟರ್|ವರ್ಲ್ಡ್\s+ವೈಡ್\s+ವೆಬ್)\b',
        'science_technology_defence.information_communication_technology_ai_cyber_security',
        95
    ),
    (
        r'\b(bitcoin|cryptocurrency|blockchain|ಬಿಟ್‌ಕಾಯಿನ್|ಕ್ರಿಪ್ಟೋ\s+ಕರೆನ್ಸಿ|ಬ್ಲಾಕ್‌ಚೈನ್)\b',
        'science_technology_defence.information_communication_technology_ai_cyber_security',
        95
    ),
    (
        r'\b(drdo|integrated\s+guided\s+missile|agni\s+missile|prithvi\s+missile|brahmos|tejas\s+aircraft|ins\s+vikrant|ಡಿಆರ್‌ಡಿಒ|ಅಗ್ನಿ\s+ಕ್ಷಿಪಣಿ|ಪೃಥ್ವಿ\s+ಕ್ಷಿಪಣಿ|ಬ್ರಹ್ಮೋಸ್|ತೇಜಸ್)\b',
        'science_technology_defence.defence_technology.missile_systems_artillery',
        98
    ),
    (
        r'\b(isro\b|satish\s+dhawan|chandrayaan|mangalyaan|gaganyaan|aditya-l1|pslv\b|gslv\b|shriharikota|ಇಸ್ರೋ|ಚಂದ್ರಯಾನ|ಮಂಗಳಯಾನ|ಗಗನಯಾನ|ಆದಿತ್ಯ-ಎಲ್1|ಪಿಎಸ್ಎಲ್‌ವಿ|ಜಿಎಸ್ಎಲ್‌ವಿ|ಶ್ರೀಹರಿಕೋಟಾ)\b',
        'science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions',
        98
    ),
    (
        r'\b(closest\s+planet\s+to\s+sun|largest\s+planet|jupiter|saturn|mars|red\s+planet|venus|solar\s+system|ಗ್ರಹಗಳು|ಸೂರ್ಯನಿಗೆ\s+ಹತ್ತಿರದ\s+ಗ್ರಹ|ದೊಡ್ಡ\s+ಗ್ರಹ|ಗುರು\s+ಗ್ರಹ|ಶನಿ\s+ಗ್ರಹ|ಮಂಗಳ\s+ಗ್ರಹ|ಸೌರವ್ಯೂಹ)\b',
        'science_technology_defence.space_technology_astronomy.solar_system_planetary_science_astrophysics',
        98
    ),

    # =========================================================================
    # 7. INDIAN & WORLD GEOGRAPHY
    # =========================================================================
    (
        r'\b(layers\s+of\s+atmosphere|troposphere|stratosphere|mesosphere|thermosphere|ionosphere|ozone\s+layer|ಅಟ್ಮಾಸ್ಪಿಯರ್|ವಾತಾವರಣದ\s+ಪದರಗಳು|ಟ್ರೋಪೋಸ್ಪಿಯರ್|ಸ್ಟ್ರಾಟೋಸ್ಪಿಯರ್|ಓಝೋನ್\s+ಪದರ)\b',
        'geography_earth_systems.climatology_atmospheric_dynamics.atmosphere_structure_heat_budget.atmospheric_layers_composition_lapse_rates',
        98
    ),
    (
        r'\b(cyclone|tropical\s+cyclone|typhoon|hurricane|willy-willy|ಚಂಡಮಾರುತ|ಟೈಫೂನ್|ಹರಿಕೇನ್|ವಿಲ್ಲಿ-ವಿಲ್ಲಿ)\b',
        'geography_earth_systems.climatology_atmospheric_dynamics.air_masses_fronts_cyclogenesis',
        98
    ),
    (
        r'\b(igneous\s+rock|sedimentary\s+rock|metamorphic\s+rock|granite|basalt|limestone|marble|gneiss|ಕಲ್ಲುಬಂಡೆಗಳು|ಅಗ್ನಿಶಿಲೆ|ಮೆಕ್ಕಲುಶಿಲೆ|ರೂಪಾಂತರ\s+ಶಿಲೆ|ಅಮೃತಶಿಲೆ)\b',
        'geography_earth_systems.physical_geography_earth_systems.rocks_formation_and_classification.igneous_sedimentary_metamorphic_rocks_cycle',
        98
    ),
    (
        r'\b(himalaya|great\s+himalayas|shivalik|mount\s+everest|k2\s+godwin|kanchenjunga|ಹಿಮಾಲಯ|ಶಿವಾಲಿಕ್|ಎವರೆಸ್ಟ್\s+ಶಿಖರ|ಕಾಂಚನಜುಂಗಾ)\b',
        'geography_earth_systems.indian_physical_geography_monsoon_architecture',
        95
    ),
    (
        r'\b(ganga\s+river|yamuna|brahmaputra|indus\s+river|godavari|dakshina\s+ganga|narmada|tapi|ಗಂಗಾ\s+ನದಿ|ಯಮುನಾ|ಬ್ರಹ್ಮಪುತ್ರ|ಸಿಂಧೂ\s+ನದಿ|ಗೋದಾವರಿ|ದಕ್ಷಿಣ\s+ಗಂಗಾ|ನರ್ಮದಾ|ತಾಪಿ)\b',
        'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india.peninsular_river_systems_east_and_west_flowing',
        98
    ),
    (
        r'\b(bhakra\s+nangal|hirakud\s+dam|tehri\s+dam|sardar\s+sarovar|nagarjuna\s+sagar|ಭಾಕ್ರಾ\s+ನಂಗಲ್|ಹಿರಾಕುಡ್\s+ಅಣೆಕಟ್ಟು|ತೆಹ್ರಿ\s+ಅಣೆಕಟ್ಟು|ಸರ್ದಾರ್\s+ಸರೋವರ|ನಾಗಾರ್ಜುನ\s+ಸಾಗರ)\b',
        'geography_earth_systems.indian_physical_geography_monsoon_architecture.drainage_systems_of_india',
        98
    ),
    (
        r'\b(black\s+soil|regur\s+soil|alluvial\s+soil|red\s+soil|laterite\s+soil|cotton\s+cultivation.*soil|ಕಪ್ಪು\s+ಮಣ್ಣು|ರೆಗೂರ್\s+ಮಣ್ಣು|ಮೆಕ್ಕಲು\s+ಮಣ್ಣು|ಕೆಂಪು\s+ಮಣ್ಣು|ಲ್ಯಾಟರೈಟ್\s+ಮಣ್ಣು|ಹತ್ತಿ\s+ಬೆಳೆಯಲು.*ಮಣ್ಣು)\b',
        'geography_earth_systems.indian_physical_geography_monsoon_architecture.soils_natural_vegetation_of_india',
        98
    ),
    (
        r'\b(palk\s+strait|10\s*degree\s+channel|radcliffe\s+line|durand\s+line|macmahon\s+line|ಪಾಕ್\s+ಜಲಸಂಧಿ|ರಾಡ್‌ಕ್ಲಿಫ್\s+ರೇಖೆ|ಡ್ಯೂರಾಂಡ್\s+ರೇಖೆ|ಮ್ಯಾಕ್‌ಮೋಹನ್\s+ರೇಖೆ)\b',
        'geography_earth_systems.indian_mapping_spatial_geography',
        98
    ),
    (
        r'\b(longest\s+border\s+with\s+india|bordering\s+india|ಭಾರತದೊಂದಿಗೆ\s+ಅತಿ\s+ಉದ್ದದ\s+ಗಡಿ|ಭಾರತದ\s+ನೆರೆಹೊರೆಯ\s+ದೇಶಗಳು)\b',
        'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_immediate_neighbours',
        98
    ),

    # =========================================================================
    # 8. INDIAN ECONOMY & BANKING
    # =========================================================================
    (
        r'\b(reserve\s+bank\s+of\s+india|rbi\s+headquarters|rbi\s+governor|monetary\s+policy|repo\s+rate|reverse\s+repo|cash\s+reserve\s+ratio|\bcrr\b|\bslr\b|ರಿಸರ್ವ್\s+ಬ್ಯಾಂಕ್|ಆರ್‌ಬಿಐ\s+ಗವರ್ನರ್|ರೆಪೋ\s+ದರ|ರಿವರ್ಸ್\s+ರೆಪೋ|ನಗದು\s+ಮೀಸಲು\s+ಅನುಪಾತ)\b',
        'indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations',
        98
    ),
    (
        r'\b(non-performing\s+assets|\bnpa\b|stressed\s+assets|insolvency\s+and\s+bankruptcy|\bibc\b|ನಿಷ್ಕ್ರಿಯ\s+ಆಸ್ತಿ|ಎನ್‌ಪಿಎ)\b',
        'indian_economy_development.monetary_policy_banking_architecture.banking_structure_regulatory_framework',
        98
    ),
    (
        r'\b(goods\s+and\s+services\s+tax|\bgst\b|indirect\s+tax|direct\s+tax|income\s+tax|ಸರಕು\s+ಮತ್ತು\s+ಸೇವಾ\s+ತೆರಿಗೆ|ಜಿಎಸ್‌ಟಿ|ಪರೋಕ್ಷ\s+ತೆರಿಗೆ|ನೇರ\s+ತೆರಿಗೆ|ಆದಾಯ\s+ತೆರಿಗೆ)\b',
        'indian_economy_development.fiscal_policy_public_finance_taxation.indirect_taxation_gst_architecture',
        98
    ),
    (
        r'\b(green\s+revolution|white\s+revolution|verghese\s+kurien|m\.?\s*s\.?\s*swaminathan|blue\s+revolution|black\s+revolution|ಹಸಿರು\s+ಕ್ರಾಂತಿ|ಶ್ವೇತ\s+ಕ್ರಾಂತಿ|ವರ್ಗೀಸ್\s+ಕುರಿಯನ್|ಎಂ\.ಎಸ್\.ಸ್ವಾಮಿನಾಥನ್|ನೀಲಿ\s+ಕ್ರಾಂತಿ|ಕಪ್ಪು\s+ಕ್ರಾಂತಿ)\b',
        'indian_economy_development.agriculture_food_management_subsidies.agricultural_pricing_market_reforms',
        98
    ),
    (
        r'\b(demat\s+account|stock\s+exchange|\bsebi\b|bombay\s+stock|nse\b|bse\b|ಮ್ಯೂಚುಯಲ್\s+ಫಂಡ್|ಷೇರು\s+ಮಾರುಕಟ್ಟೆ|ಡಿಮ್ಯಾಟ್\s+ಖಾತೆ|ಸೆಬಿ)\b',
        'indian_economy_development.monetary_policy_banking_architecture.non-banking_financial_institutions_capital_markets',
        98
    ),
    (
        r'\b(national\s+income|gross\s+domestic\s+product|\bgdp\b|per\s+capita\s+income|father\s+of\s+economics|adam\s+smith|ರಾಷ್ಟ್ರೀಯ\s+ಆದಾಯ|ಜಿಡಿಪಿ|ತಲಾವಾರು\s+ಆದಾಯ|ಆಡಮ್\s+ಸ್ಮಿತ್|ಅರ್ಥಶಾಸ್ತ್ರದ\s+ಪಿತಾಮಹ)\b',
        'indian_economy_development.macroeconomic_fundamentals_national_income_accounting',
        98
    ),
    (
        r'\b(mgnrega|mgnregs|national\s+rural\s+employment\s+guarantee|poverty\s+alleviation|ಮಹಾತ್ಮ\s+ಗಾಂಧಿ\s+ರಾಷ್ಟ್ರೀಯ\s+ಗ್ರಾಮೀಣ\s+ಉದ್ಯೋಗ|ನರೇಗಾ|ಬಡತನ\s+ನಿರ್ಮೂಲನೆ)\b',
        'indian_society_social_justice.poverty_inequality_developmental_challenges.poverty_concepts_measurement',
        98
    ),

    # =========================================================================
    # 9. ANCIENT, MEDIEVAL & MODERN INDIAN HISTORY
    # =========================================================================
    (
        r'\b(indus\s+valley|harappa|mohenjo-daro|lothal|kalibangan|great\s+bath|ಸಿಂಧೂ\s+ಬಯಲಿನ\s+ನಾಗರಿಕತೆ|ಹರಪ್ಪ|ಮೊಹೆಂಜೋದಾರೊ|ಲೋಥಾಲ್|ಕಾಲಿಬಂಗನ್|ಮಹಾಸ್ನಾನಗೃಹ)\b',
        'history.ancient_india.indus_valley_civilization_bronze_age.settlement_patterns_town_planning_architecture',
        98
    ),
    (
        r'\b(rig\s+veda|sama\s+veda|yajur\s+veda|atharva\s+veda|upanishad|ವೇದಗಳು|ಋಗ್ವೇದ|ಸಾಮವೇದ|ಯಜುರ್ವೇದ|ಅಥರ್ವಣವೇದ|ಉಪನಿಷತ್ತುಗಳು)\b',
        'history.ancient_india.vedic_period_early_later_vedic_society.vedic_corpus_samhitas_upanishads_darshana',
        98
    ),
    (
        r'\b(gautama\s+buddha|buddhism|four\s+noble\s+truths|eightfold\s+path|jainism|mahavira|tirthankara|ಬುದ್ಧ|ಬೌದ್ಧ\s+ಧರ್ಮ|ಜೈನ\s+ಧರ್ಮ|ಮಹಾವೀರ|ತೀರ್ಥಂಕರ)\b',
        'history.ancient_india.religious_movements_buddhism_jainism_heterodox_sects.buddhism_origins_doctrine_schisms',
        98
    ),
    (
        r'\b(maurya|chandragupta\s+maurya|kautilya|arthashastra|ashoka|kalinga\s+war|ashoka.*inscription|ಮೌರ್ಯ|ಚಂದ್ರಗುಪ್ತ\s+ಮೌರ್ಯ|ಕೌಟಿಲ್ಯ|ಅರ್ಥಶಾಸ್ತ್ರ|ಅಶೋಕ|ಕಳಿಂಗ\s+ಯುದ್ಧ|ಅಶೋಕನ\s+ಶಾಸನಗಳು)\b',
        'history.ancient_india.mauryan_empire_rise_administration_decline.emperor_ashoka_dhamma_edicts_inscriptions',
        98
    ),
    (
        r'\b(gupta\s+empire|samudragupta|chandragupta\s+ii|vikramaditya|kalidasa|fahien|ಗುಪ್ತ\s+ಸಾಮ್ರಾಜ್ಯ|ಸಮುದ್ರಗುಪ್ತ|ವಿಕ್ರಮಾದಿತ್ಯ|ಕಾಳಿದಾಸ|ಫಾಹಿಯಾನ್)\b',
        'history.ancient_india.gupta_vakataka_age_classical_period.classical_sanskrit_literature_kalidasa_bhasa',
        98
    ),
    (
        r'\b(delhi\s+sultanate|qutbuddin\s+aibak|iltutmish|razia\s+sultan|alauddin\s+khilji|muhammad\s+bin\s+tughlaq|qutub\s+minar|ದೆಹಲಿ\s+ಸುಲ್ತಾನರು|ಕುತುಬುದ್ದೀನ್\s+ಐಬಕ್|ಇಲ್ತುತ್ಮಿಶ್|ರಜಿಯಾ\s+ಸುಲ್ತಾನ|ಅಲ್ಲಾವುದ್ದೀನ್\s+ಖಿಲ್ಜಿ|ಮಹಮ್ಮದ್\s+ಬಿನ್\s+ತುಘಲಕ್|ಕುತುಬ್\s+ಮಿನಾರ್)\b',
        'history.medieval_india.delhi_sultanate.sultanate_administration_economy_culture',
        98
    ),
    (
        r'\b(mughal\s+empire|babur|battle\s+of\s+panipat|humayun|akbar|din-i-ilahi|jahangir|shah\s+jahan|taj\s+mahal|aurangzeb|ಮೊಘಲ್\s+ಸಾಮ್ರಾಜ್ಯ|ಬಾಬರ್|ಪಾಣಿಪತ್\s+ಕದನ|ಅಕ್ಬರ್|ದೀನ್-ಇ-ಇಲಾಹಿ|ಷಹಜಹಾನ್|ತಾಜ್‌ಮಹಲ್|ಔರಂಗಜೇಬ್)\b',
        'history.medieval_india.mughal_empire.mughal_administration_economy_culture',
        98
    ),
    (
        r'\b(maratha|chhatrapati\s+shivaji|peshwa|balaji\s+baji\s+rao|ಮರಾಠ|ಶಿವಾಜಿ|ಛತ್ರಪತಿ\s+ಶಿವಾಜಿ|ಪೇಶ್ವೆ)\b',
        'history.medieval_india.maratha_empire_confederacy.chhatrapati_shivaji_swarajya_administration',
        98
    ),
    (
        r'\b(battle\s+of\s+plassey|battle\s+of\s+buxar|robert\s+clive|black\s+hole\s+tragedy|ಪ್ಲಾಸಿ\s+ಕದನ|ಬಕ್ಸಾರ್\s+ಕದನ|ರಾಬರ್ಟ್\s+ಕ್ಲೈವ್|ಕಪ್ಪುಕೋಣೆ\s+ದುರಂತ)\b',
        'history.modern_india.british_conquest_consolidation_of_india.british_conquest_of_bengal',
        98
    ),
    (
        r'\b(permanent\s+settlement|zamindari\s+system|ryotwari\s+system|mahalwari\s+system|lord\s+cornwallis|ಜಮೀನ್ದಾರಿ\s+ಪದ್ಧತಿ|ರೈತವಾರಿ\s+ಪದ್ಧತಿ|ಮಹಲ್ವಾರಿ|ಲಾರ್ಡ್\s+ಕಾರ್ನ್‌ವಾಲಿಸ್)\b',
        'history.modern_india.british_conquest_consolidation_of_india.british_conquest_of_bengal',
        98
    ),
    (
        r'\b(revolt\s+of\s+1857|sepoy\s+mutiny|mangal\s+pandey|rani\s+lakshmi\s+bai|tatya\s+tope|bahadur\s+shah\s+zafar|1857\s*ರ\s+ದಂಗೆ|ಸಿಪಾಯಿ\s+ದಂಗೆ|ಮಂಗಳ\s+ಪಾಂಡೆ|ರಾಣಿ\s+ಲಕ್ಷ್ಮೀಬಾಯಿ)\b',
        'history.indian_freedom_struggle.revolt_of_1857.outbreak_and_spread_of_rebellion',
        98
    ),
    (
        r'\b(indian\s+national\s+congress|\binc\b|a\.?\s*o\.?\s*hume|w\.?\s*c\.?\s*banerjee|partition\s+of\s+bengal|swadeshi\s+movement|ಭಾರತೀಯ\s+ರಾಷ್ಟ್ರೀಯ\s+ಕಾಂಗ್ರೆಸ್|ಬಂಗಾಳದ\s+ವಿಭಜನೆ|ಸ್ವದೇಶಿ\s+ಚಳವಳಿ)\b',
        'history.indian_freedom_struggle.growth_of_modern_nationalism_early_political_associations',
        98
    ),
    (
        r'\b(non-cooperation\s+movement|khilafat\s+movement|chauri\s+chaura|ಅಸಹಕಾರ\s+ಚಳವಳಿ|ಖಿಲಾಫತ್\s+ಚಳವಳಿ|ಚೌರಿ\s+ಚೌರಾ)\b',
        'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.khilafat_agitation_non-cooperation_movement',
        98
    ),
    (
        r'\b(civil\s+disobedience|dandi\s+march|salt\s+satyagraha|round\s+table\s+conference|ಶಾಶನಭಂಗ\s+ಚಳವಳಿ|ದಂಡಿ\s+ಸತ್ಯಾಗ್ರಹ|ಉಪ್ಪಿನ\s+ಸತ್ಯಾಗ್ರಹ|ದುಂಡುಮೇಜಿನ\s+ಸಮ್ಮೇಳನ)\b',
        'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement.dandi_march_civil_disobedience_movement',
        98
    ),
    (
        r'\b(quit\s+india\s+movement|do\s+or\s+die|subhash\s+chandra\s+bose|indian\s+national\s+army|\bina\b|ಕ್ವಿಟ್\s+ಇಂಡಿಯಾ|ಮಾಡು\s+ಇಲ್ಲವೇ\s+ಮಡಿ|ಸುಭಾಷ್\s+ಚಂದ್ರ\s+ಬೋಸ್|ಐಎನ್‌ಎ|ಆಜಾದ್\s+ಹಿಂದ್\s+ಫೌಜ್)\b',
        'history.indian_freedom_struggle.quit_india_movement_ina_post-war_upsurge.quit_india_movement_1942',
        98
    ),
    (
        r'\b(sardar\s+vallabhbhai\s+patel|iron\s+man\s+of\s+india|integration\s+of\s+princely\s+states|ಸರ್ದಾರ್\s+ವಲ್ಲಭಬಾಯಿ\s+ಪಟೇಲ್|ಉಕ್ಕಿನ\s+ಮನುಷ್ಯ|ಸಂಸ್ಥಾನಗಳ\s+ವಿಲೀನ)\b',
        'history.post-independence_india.integration_of_princely_states_territorial_consolidation.accession_of_565_princely_states',
        98
    ),
    (
        r'\b(world\s+war\s+i|world\s+war\s+ii|treaty\s+of\s+versailles|league\s+of\s+nations|ಮೊದಲ\s+ವಿಶ್ವಯುದ್ಧ|ಎರಡನೇ\s+ವಿಶ್ವಯುದ್ಧ|ವರ್ಸೇಲ್ಸ್\s+ಒಪ್ಪಂದ)\b',
        'history.world_history.world_war_i_russian_revolution',
        98
    ),
    (
        r'\b(united\s+nations|\buno\b|un\s+charter|security\s+council|international\s+court\s+of\s+justice|\bicj\b|the\s+hague|ವಿಶ್ವಸಂಸ್ಥೆ|ಭದ್ರತಾ\s+ಮಂಡಳಿ|ಅಂತಾರಾಷ್ಟ್ರೀಯ\s+ನ್ಯಾಯಾಲಯ|ಹೇಗ್)\b',
        'history.world_history.united_nations_organisation_peacekeeping_global_governance.evolution_charter_architecture_specialized_agencies_un',
        98
    ),

    # =========================================================================
    # 10. POLICE & INTERNAL SECURITY
    # =========================================================================
    (
        r'\b(director\s+general\s+of\s+police|\bdgp\b|dg\s*&\s*igp|superintendent\s+of\s+police|\bsp\b|police\s+constable|ksrp\b|ksisf\b|car\/dar|police\s+flag\s+day|police\s+training\s+college|police\s+station|disha\s+police|ಪೊಲೀಸ್\s+ಮಹಾನಿರ್ದೇಶಕರು|ಪೊಲೀಸ್\s+ಅಧೀಕ್ಷಕರು|ಪೊಲೀಸ್\s+ಕಾನ್‌ಸ್ಟೇಬಲ್|ಕೆಎಸ್ಆರ್‌ಪಿ|ಕೆಎಸ್‌ಐಎಸ್‌ಎಫ್|ಸಿಎಆರ್|ಡಿಎಆರ್|ಪೊಲೀಸ್\s+ಧ್ವಜ\s+ದಿನ|ಪೊಲೀಸ್\s+ಠಾಣೆ|ದಿಶಾ\s+ಪೊಲೀಸ್)\b',
        'internal_security.security_forces_intelligence_agencies_statutory_mandates',
        98
    ),
    (
        r'\b(border\s+security\s+force|\bbsf\b|crpf\b|cisf\b|itbp\b|national\s+security\s+guard|\bnsg\b|assam\s+rifles|chief\s+of\s+defence\s+staff|\bcds\b|ಬಿಎಸ್‌ಎಫ್|ಸಿಆರ್‌ಪಿಎಫ್|ಸಿಐಎಸ್‌ಎಫ್|ಎನ್‌ಎಸ್‌ಜಿ|ಅಸ್ಸಾಂ\s+ರೈಫಲ್ಸ್|ಚೀಫ್\s+ಆಫ್\s+ಡಿಫೆನ್ಸ್\s+ಸ್ಟಾಫ್)\b',
        'internal_security.security_forces_intelligence_agencies_statutory_mandates',
        98
    ),

    # =========================================================================
    # 11. ENVIRONMENT & ECOLOGY
    # =========================================================================
    (
        r'\b(food\s+chain|trophic\s+level|primary\s+consumer|producer|autotroph|herbivore|carnivore|ಆಹಾರ\s+ಸರಪಳಿ|ಪೋಷಣಾ\s+ಸ್ತರ|ಪ್ರಾಥಮಿಕ\s+ಗ್ರಾಹಕ|ಉತ್ಪಾದಕ)\b',
        'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.energy_flow_trophic_structure',
        98
    ),
    (
        r'\b(ecological\s+footprint|carrying\s+capacity|biosphere|ಪರಿಸರ\s+ಹೆಜ್ಜೆಗುರುತು|ಜೀವಗೋಳ)\b',
        'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.ecological_interactions_principles',
        95
    ),
    (
        r'\b(world\s+environment\s+day|june\s+5|earth\s+day|ozone\s+day|ವಿಶ್ವ\s+ಪರಿಸರ\s+ದಿನ|ಜೂನ್\s+5|ಧರಿತ್ರಿ\s+ದಿನ)\b',
        'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation',
        98
    ),
    (
        r'\b(global\s+warming|greenhouse\s+effect|greenhouse\s+gas|chlorofluorocarbon|\bcfc\b|acid\s+rain|ಜಾಗತಿಕ\s+ತಾಪಮಾನ|ಹಸಿರುಮನೆ\s+ಪರಿಣಾಮ|ಸಿಎಫ್‌ಸಿ|ಆಮ್ಲ\s+ಮಳೆ)\b',
        'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation',
        98
    )
]

print(f"Checking {len(RAW_RULES)} rules against Master KG...")
valid_rules = []
invalid_rules = []

for pat, nid, prio in RAW_RULES:
    if nid not in nodes:
        invalid_rules.append((pat, nid))
    else:
        valid_rules.append((pat, nid, prio))

if invalid_rules:
    print(f"ERROR: {len(invalid_rules)} rules have invalid nodes:")
    for pat, nid in invalid_rules:
        print(f"  {nid}")
else:
    print(f"ALL {len(valid_rules)} RULES HAVE 100% VALID NODES IN KG!")
