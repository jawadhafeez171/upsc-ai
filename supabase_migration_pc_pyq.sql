-- ═════════════════════════════════════════════════════════════════════════
-- SUPABASE MIGRATION: Police Constable (PC) CAR/DAR PYQ Table
-- Datasets: HK DAR PC Sept 2026 & NHK DAR PC Sept 2026 (200 Questions Total)
-- ═════════════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.pc_pyq (
    id TEXT PRIMARY KEY,
    question_number INTEGER NOT NULL,
    year INTEGER NOT NULL DEFAULT 2026,
    month TEXT NOT NULL DEFAULT 'September',
    paper INTEGER NOT NULL DEFAULT 1,
    paper_code TEXT NOT NULL CHECK (paper_code IN ('hk', 'nhk')),
    exam_id TEXT NOT NULL DEFAULT 'ksp-pc',
    node_id TEXT NOT NULL,
    subject TEXT NOT NULL,
    subject_kannada TEXT,
    domain TEXT NOT NULL,
    domain_kannada TEXT,
    sub_topic TEXT NOT NULL,
    sub_topic_kannada TEXT,
    difficulty TEXT NOT NULL CHECK (difficulty IN ('easy', 'medium', 'hard')),
    tags TEXT[],
    passage_english TEXT,
    passage_kannada TEXT,
    question_english TEXT NOT NULL,
    question_kannada TEXT NOT NULL,
    option_1_english TEXT NOT NULL,
    option_2_english TEXT NOT NULL,
    option_3_english TEXT NOT NULL,
    option_4_english TEXT NOT NULL,
    option_1_kannada TEXT NOT NULL,
    option_2_kannada TEXT NOT NULL,
    option_3_kannada TEXT NOT NULL,
    option_4_kannada TEXT NOT NULL,
    key_answer TEXT NOT NULL,
    explanation_english TEXT NOT NULL,
    explanation_kannada TEXT NOT NULL,
    image_url TEXT,
    table_data JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Row Level Security (RLS)
ALTER TABLE public.pc_pyq ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow public read access on pc_pyq" ON public.pc_pyq;
CREATE POLICY "Allow public read access on pc_pyq" ON public.pc_pyq FOR SELECT USING (true);

DROP POLICY IF EXISTS "Allow anon insert on pc_pyq" ON public.pc_pyq;
CREATE POLICY "Allow anon insert on pc_pyq" ON public.pc_pyq FOR INSERT WITH CHECK (true);

DROP POLICY IF EXISTS "Allow anon update on pc_pyq" ON public.pc_pyq;
CREATE POLICY "Allow anon update on pc_pyq" ON public.pc_pyq FOR UPDATE USING (true);

-- Performance Indexes
CREATE INDEX IF NOT EXISTS idx_pc_pyq_year ON public.pc_pyq(year);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_paper ON public.pc_pyq(paper);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_paper_code ON public.pc_pyq(paper_code);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_node_id ON public.pc_pyq(node_id);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_subject ON public.pc_pyq(subject);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_domain ON public.pc_pyq(domain);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_difficulty ON public.pc_pyq(difficulty);
CREATE INDEX IF NOT EXISTS idx_pc_pyq_exam_id ON public.pc_pyq(exam_id);

-- ═════════════════════════════════════════════════════════════════════════
-- Seed Data: Hyderabad-Karnataka (HK) CAR/DAR Sept 2026 (Q1 to Q100)
-- ═════════════════════════════════════════════════════════════════════════
INSERT INTO public.pc_pyq (
    id, question_number, year, month, paper, paper_code, exam_id, node_id,
    subject, subject_kannada, domain, domain_kannada, sub_topic, sub_topic_kannada,
    difficulty, tags, passage_english, passage_kannada, question_english, question_kannada,
    option_1_english, option_2_english, option_3_english, option_4_english,
    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,
    key_answer, explanation_english, explanation_kannada, image_url, table_data
) VALUES
    ('pc-hk-2026-q1', 1, 2026, 'September', 1, 'hk', 'ksp-pc', 'geography_earth_systems.geography_of_karnataka', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Geography of Karnataka', 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ', 'Urban Demographics & Census 2011 Comparison (Karnataka vs Other States)', 'ನಗರ ಜನಸಂಖ್ಯಾಶಾಸ್ತ್ರ ಮತ್ತು 2011 ರ ಜನಗಣತಿ ಹೋಲಿಕೆ (ಕರ್ನಾಟಕ ಮತ್ತು ಇತರ ರಾಜ್ಯಗಳು)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Census 2011', 'Karnataka Geography', 'Demographics', 'Geography & Earth Systems']::TEXT[], '', '', 'Consider the following statements regarding the percentage of urban population of Karnataka as per 2011 census :
(a) It is less than India''s average.
(b) It is more than Tamil Nadu, less than Andhra Pradesh.
(c) Less than Kerala, but more than Andhra Pradesh.
(d) More than India''s average, but less than Tamil Nadu.
Choose the correct statements:', '2011 ರ ಜನಗಣತಿಯ ಅಂಕಿ-ಅಂಶಗಳ ಆಧಾರದ ಮೇಲೆ ಕರ್ನಾಟಕದ ಶೇಕಡಾವಾರು ನಗರ ಜನಸಂಖ್ಯೆಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.
(a) ಭಾರತದ ಸರಾಸರಿಗಿಂತ ಕಡಿಮೆ ಇದೆ.
(b) ತಮಿಳುನಾಡಿಗಿಂತ ಹೆಚ್ಚಿದೆ, ಆಂಧ್ರ ಪ್ರದೇಶಕ್ಕಿಂತ ಕಡಿಮೆ ಇದೆ.
(c) ಕೇರಳಕ್ಕಿಂತ ಕಡಿಮೆಯಿದೆ, ಆದರೆ ಆಂಧ್ರ ಪ್ರದೇಶಕ್ಕಿಂತ ಹೆಚ್ಚಾಗಿದೆ.
(d) ಭಾರತದ ಸರಾಸರಿಗಿಂತ ಹೆಚ್ಚಿದೆ, ಆದರೆ ತಮಿಳುನಾಡಿಗಿಂತ ಕಡಿಮೆ ಇದೆ.
ಸರಿಯಾದ ಹೇಳಿಕೆಗಳನ್ನು ಆರಿಸಿ :', '(a), (b) and (d) are correct.', '(c) and (d) are correct.', '(b), (c) and (d) are correct.', '(a), (b) and (c) are correct.', '(a), (b) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', '(c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', '(b), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', '(a), (b) ಮತ್ತು (c) ಸರಿಯಾಗಿವೆ.', '2', 'Correct Answer: (2)

Explanation:
According to the 2011 Census of India:
• All-India Urban Population: ~31.16%
• Karnataka: ~38.67%
• Tamil Nadu: ~48.40%
• Kerala: ~47.70%
• Andhra Pradesh (undivided): ~33.36%

Evaluating the statements:
• (a) is incorrect: Karnataka''s urban percentage (38.67%) is higher than the national average (31.16%).
• (b) is incorrect: It is lower than Tamil Nadu (48.40%) and higher than Andhra Pradesh (33.36%).
• (c) is correct: It is less than Kerala (47.70%) and more than Andhra Pradesh (33.36%).
• (d) is correct: It is more than India''s average (31.16%) and less than Tamil Nadu (48.40%).

Therefore, statements (c) and (d) are correct.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
2011 ರ ಜನಗಣತಿಯ ಪ್ರಕಾರ:
• ಭಾರತದ ಸರಾಸರಿ ನಗರ ಜನಸಂಖ್ಯೆ: ~31.16%
• ಕರ್ನಾಟಕ: ~38.67%
• ತಮಿಳುನಾಡು: ~48.40%
• ಕೇರಳ: ~47.70%
• ಆಂಧ್ರಪ್ರದೇಶ (ಅವಿಭಜಿತ): ~33.36%

ಹೇಳಿಕೆಗಳ ಪರಿಶೀಲನೆ:
• (a) ತಪ್ಪಾಗಿದೆ: ಕರ್ನಾಟಕದ ನಗರ ಜನಸಂಖ್ಯೆಯ ಪ್ರಮಾಣವು (38.67%) ಭಾರತದ ಸರಾಸರಿಗಿಂತ (31.16%) ಹೆಚ್ಚಾಗಿದೆ.
• (b) ತಪ್ಪಾಗಿದೆ: ಇದು ತಮಿಳುನಾಡಿಗಿಂತ ಕಡಿಮೆ ಮತ್ತು ಆಂಧ್ರಪ್ರದೇಶಕ್ಕಿಂತ ಹೆಚ್ಚಾಗಿದೆ.
• (c) ಸರಿಯಾಗಿದೆ: ಕೇರಳಕ್ಕಿಂತ (47.70%) ಕಡಿಮೆ ಮತ್ತು ಆಂಧ್ರಪ್ರದೇಶಕ್ಕಿಂತ (33.36%) ಹೆಚ್ಚಾಗಿದೆ.
• (d) ಸರಿಯಾಗಿದೆ: ಭಾರತದ ಸರಾಸರಿಗಿಂತ (31.16%) ಹೆಚ್ಚು ಆದರೆ ತಮಿಳುನಾಡಿಗಿಂತ (48.40%) ಕಡಿಮೆಯಾಗಿದೆ.

ಆದ್ದರಿಂದ, ಹೇಳಿಕೆ (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q2', 2, 2026, 'September', 1, 'hk', 'ksp-pc', 'geography_earth_systems.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Economic & Resource Geography', 'ಆರ್ಥಿಕ ಮತ್ತು ಸಂಪನ್ಮೂಲ ಭೂಗೋಳಶಾಸ್ತ್ರ', 'Iron & Steel Plants in India (Bhilai, Rourkela, Bokaro, TISCO & Foreign Collaborations)', 'ಭಾರತದ ಕಬ್ಬಿಣ ಮತ್ತು ಉಕ್ಕು ಕಾರ್ಖಾನೆಗಳು (ಭಿಲಾಯಿ, ರೂರ್ಕೆಲಾ, ಬೊಕಾರೊ, ಟಿಸ್ಕೋ ಮತ್ತು ವಿದೇಶಿ ಸಹಯೋಗ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Geography', 'Industries', 'Iron and Steel Plants', 'Geography & Earth Systems']::TEXT[], '', '', 'Identify the correctly matched pairs with respect to iron and steel industries established in India.
(a) Bhilai — Soviet Union collaboration
(b) Rourkela — German collaboration
(c) Bokaro — Soviet Union collaboration
(d) TISCO — British collaboration', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಭಾರತದಲ್ಲಿ ಸ್ಥಾಪಿತವಾದ ಕಬ್ಬಿಣ ಮತ್ತು ಉಕ್ಕಿನ ಕೈಗಾರಿಕೆಗಳಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಸರಿಯಾದ ಜೋಡಿಗಳನ್ನು ಗುರುತಿಸಿ.
(a) ಭಿಲಾಯಿ - ಸೋವಿಯತ್ ಯೂನಿಯನ್ ಸಹಯೋಗದೊಂದಿಗೆ
(b) ರೂರ್ಕೆಲಾ - ಜರ್ಮನಿ ಸಹಯೋಗದೊಂದಿಗೆ
(c) ಬೊಕಾರೋ - ಸೋವಿಯತ್ ಯೂನಿಯನ್ ಸಹಯೋಗದೊಂದಿಗೆ
(d) TISCO - ಬ್ರಿಟನ್ ಸಹಯೋಗದೊಂದಿಗೆ', '(a), (b) and (c) are correct.', '(b), (c) and (d) are correct.', '(a), (b) and (d) are correct.', '(a), (b), (c) and (d) are correct.', '(a), (b) ಮತ್ತು (c) ಸರಿಯಾಗಿವೆ.', '(b), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', '(a), (b) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', '(a), (b), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', '1', 'Correct Answer: (1)

Explanation:
• Bhilai Steel Plant (Chhattisgarh) was established with Soviet Union (USSR) collaboration in 1955.
• Rourkela Steel Plant (Odisha) was set up with German collaboration (Krupp and Demag) in 1959.
• Bokaro Steel Plant (Jharkhand) was set up with Soviet Union collaboration in 1964.
• TISCO (Tata Iron and Steel Company) at Jamshedpur was established in 1907 as an indigenous private venture founded by Jamsetji Tata, not via British collaboration.

Therefore, pairs (a), (b), and (c) are correctly matched.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
• ಭಿಲಾಯಿ ಉಕ್ಕು ಕಾರ್ಖಾನೆ (ಛತ್ತೀಸ್‌ಗಢ): ಸೋವಿಯತ್ ಒಕ್ಕೂಟದ (USSR) ಸಹಯೋಗದೊಂದಿಗೆ 1955 ರಲ್ಲಿ ಸ್ಥಾಪನೆಯಾಯಿತು.
• ರೂರ್ಕೆಲಾ ಉಕ್ಕು ಕಾರ್ಖಾನೆ (ಒಡಿಶಾ): ಪಶ್ಚಿಮ ಜರ್ಮನಿಯ ಸಹಯೋಗದೊಂದಿಗೆ 1959 ರಲ್ಲಿ ಸ್ಥಾಪನೆಯಾಯಿತು.
• ಬೊಕಾರೊ ಉಕ್ಕು ಕಾರ್ಖಾನೆ (ಜಾರ್ಖಂಡ್): ಸೋವಿಯತ್ ಒಕ್ಕೂಟದ ಸಹಯೋಗದೊಂದಿಗೆ 1964 ರಲ್ಲಿ ಸ್ಥಾಪನೆಯಾಯಿತು.
• TISCO (ಟಾಟಾ ಐರನ್ & ಸ್ಟೀಲ್ ಕಂಪನಿ): 1907 ರಲ್ಲಿ ಜಮ್‌ಶೆಡ್‌ಜೀ ಟಾಟಾರವರಿಂದ ಸ್ಥಾಪಿಸಲ್ಪಟ್ಟ ಭಾರತೀಯ ಖಾಸಗಿ ಉದ್ಯಮವಾಗಿದ್ದು, ಬ್ರಿಟನ್ ಸಹಯೋಗದೊಂದಿಗೆ ಸ್ಥಾಪಿತವಾಗಿಲ್ಲ.

ಆದ್ದರಿಂದ, (a), (b) ಮತ್ತು (c) ಸರಿಯಾದ ಜೋಡಿಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q3', 3, 2026, 'September', 1, 'hk', 'ksp-pc', 'geography_earth_systems.geography_of_karnataka', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Geography of Karnataka', 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ', 'Agro-Climatic Zones & Major Crop Cultivation Regions of Karnataka', 'ಕರ್ನಾಟಕದ ಕೃಷಿ-ಹವಾಮಾನ ವಲಯಗಳು ಮತ್ತು ಪ್ರಮುಖ ಬೆಳೆ ಬೆಳೆಯುವ ಪ್ರದೇಶಗಳು', 'hard', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Karnataka Geography', 'Map Based', 'Agriculture', 'Geography & Earth Systems']::TEXT[], '', '', 'Identify the areas marked in the following Karnataka map :
[Map showing regions a, b, c, d]', 'ಈ ಕೆಳಗಿನ ಕರ್ನಾಟಕ ನಕ್ಷೆಯಲ್ಲಿ ಗುರುತಿಸಲಾದ ಪ್ರದೇಶಗಳನ್ನು ಗುರುತಿಸಿ.
[ಪ್ರದೇಶಗಳು a, b, c, d ಅನ್ನು ತೋರಿಸುವ ನಕ್ಷೆ]', '(a) Coffee growing area (b) Sharavathi Basin (c) Virginia tobacco growing area (d) Hard core drought region', '(a) Hard core drought region (b) Sharavathi Basin (c) Virginia tobacco growing area (d) Coffee growing area', '(a) Hard core drought region (b) Virginia tobacco growing area (c) Sharavathi Basin (d) Coffee growing area', '(a) Coffee growing area (b) Virginia tobacco growing area (c) Sharavathi Basin (d) Hard core drought region', '(a) ಕಾಫಿ ಬೆಳೆಯುವ ಪ್ರದೇಶ (b) ಶರಾವತಿ ಜಲಾನಯನ ಪ್ರದೇಶ (c) ವರ್ಜೀನಿಯಾ ತಂಬಾಕು ಬೆಳೆಯುವ ಪ್ರದೇಶ (d) ತೀವ್ರ ಕೇಂದ್ರ ಬರಗಾಲ ಪ್ರದೇಶ', '(a) ತೀವ್ರ ಕೇಂದ್ರ ಬರಗಾಲ ಪ್ರದೇಶ (b) ಶರಾವತಿ ಜಲಾನಯನ ಪ್ರದೇಶ (c) ವರ್ಜೀನಿಯಾ ತಂಬಾಕು ಬೆಳೆಯುವ ಪ್ರದೇಶ (d) ಕಾಫಿ ಬೆಳೆಯುವ ಪ್ರದೇಶ', '(a) ತೀವ್ರ ಕೇಂದ್ರ ಬರಗಾಲ ಪ್ರದೇಶ (b) ವರ್ಜೀನಿಯಾ ತಂಬಾಕು ಬೆಳೆಯುವ ಪ್ರದೇಶ (c) ಶರಾವತಿ ಜಲಾನಯನ ಪ್ರದೇಶ (d) ಕಾಫಿ ಬೆಳೆಯುವ ಪ್ರದೇಶ', '(a) ಕಾಫಿ ಬೆಳೆಯುವ ಪ್ರದೇಶ (b) ವರ್ಜೀನಿಯಾ ತಂಬಾಕು ಬೆಳೆಯುವ ಪ್ರದೇಶ (c) ಶರಾವತಿ ಜಲಾನಯನ ಪ್ರದೇಶ (d) ತೀವ್ರ ಕೇಂದ್ರ ಬರಗಾಲ ಪ್ರದೇಶ', '2', 'Correct Answer: (2)

Explanation:
Analyzing the regions highlighted on the Karnataka map:
• ''a'' marks the eastern dry belt (Chitradurga/Bellary border region), recognized as a hard-core drought-prone region.
• ''b'' is located along the central Western Ghats in Shivamogga/Uttara Kannada, representing the Sharavathi Basin.
• ''c'' marks the transitional southern plateau belt (Hunsur/Periyapatna in Mysuru/Hassan), which is famous for Virginia tobacco cultivation.
• ''d'' covers the high-rainfall hilly slopes of Kodagu and adjoining tracts, Karnataka''s primary coffee-growing region.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಕರ್ನಾಟಕ ನಕ್ಷೆಯಲ್ಲಿ ಗುರುತಿಸಲಾದ ಪ್ರದೇಶಗಳು:
• ''a'' ಚಿತ್ರದುರ್ಗ/ಬಳ್ಳಾರಿ ಗಡಿ ಭಾಗದ ಒಣ ವಲಯವನ್ನು ಸೂಚಿಸುತ್ತದೆ, ಇದು ತೀವ್ರ ಕೇಂದ್ರ ಬರಗಾಲ ಪ್ರದೇಶವಾಗಿದೆ.
• ''b'' ಶಿವಮೊಗ್ಗ/ಉತ್ತರ ಕನ್ನಡ ಭಾಗದ ಪಶ್ಚಿಮ ಘಟ್ಟಗಳ ಶರಾವತಿ ಜಲಾನಯನ ಪ್ರದೇಶವಾಗಿದೆ.
• ''c'' ಮೈಸೂರು ಮತ್ತು ಹಾಸನ ಜಿಲ್ಲೆಗಳ ಹುಣಸೂರು/ಪಿರಿಯಾಪಟ್ಟಣ ವ್ಯಾಪ್ತಿಯಾಗಿದ್ದು, ವರ್ಜೀನಿಯಾ ತಂಬಾಕು ಬೆಳೆಯುವ ಪ್ರಮುಖ ಪ್ರದೇಶವಾಗಿದೆ.
• ''d'' ಕೊಡಗು ಮತ್ತು ಸುತ್ತಮುತ್ತಲಿನ ಬೆಟ್ಟಗುಡ್ಡಗಳ ಪ್ರದೇಶವಾಗಿದ್ದು, ಪ್ರಮುಖ ಕಾಫಿ ಬೆಳೆಯುವ ಪ್ರದೇಶವಾಗಿದೆ.', 'karnataka_map_regions_q3.png', NULL),
    ('pc-hk-2026-q4', 4, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Desalination Technologies & Freeze Separation Process', 'ಡಿಸಲಿನೇಷನ್ ತಂತ್ರಜ್ಞಾನಗಳು ಮತ್ತು ಘನೀಭವನ ಬೇರ್ಪಡಿಸುವ ವಿಧಾನ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Oceanography', 'Science and Technology', 'Desalination', 'Science, Technology & Defence']::TEXT[], '', '', '''Freeze Separation'' is a technique used', '''ಹಿಮಗಟ್ಟಿಸುವಿಕೆ (ಘನೀಕರಣದ) ಮೂಲಕ ಬೇರ್ಪಡಿಸುವ ತಂತ್ರಜ್ಞಾನ''ವನ್ನು ಇದಕ್ಕೆ ಬಳಸಲಾಗುತ್ತದೆ.', 'To classify ocean microbes', 'To classify ocean deposits', 'To desalinize ocean water', 'To clean the garbages from oceans', 'ಸಾಗರಗಳ ಸೂಕ್ಷ್ಮಾಣು ಜೀವಿಗಳನ್ನು ವರ್ಗೀಕರಿಸಲು', 'ಸಾಗರಗಳ ನಿಕ್ಷೇಪಗಳನ್ನು ವರ್ಗೀಕರಿಸಲು', 'ಸಾಗರದ ನೀರನ್ನು ಲವಣಮುಕ್ತಗೊಳಿಸಲು', 'ಸಾಗರಗಳಿಂದ ತ್ಯಾಜ್ಯಗಳನ್ನು ಶುಚಿಗೊಳಿಸಲು', '3', 'Correct Answer: (3)

Explanation:
''Freeze Separation'' (freeze desalination) is a physical process used to desalinize seawater. When saline water freezes, pure water naturally crystallizes into ice while excluding dissolved salts into the remaining brine. Melting the washed ice produces potable freshwater.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
''ಹಿಮಗಟ್ಟಿಸುವಿಕೆ/ಘನೀಕರಣದ ಮೂಲಕ ಬೇರ್ಪಡಿಸುವಿಕೆ'' (Freeze Desalination) ತಂತ್ರಜ್ಞಾನವನ್ನು ಸಮುದ್ರದ ನೀರನ್ನು ಲವಣಮುಕ್ತಗೊಳಿಸಿ ಶುದ್ಧ ಕುಡಿಯುವ ನೀರನ್ನಾಗಿ ಪರಿವರ್ತಿಸಲು ಬಳಸಲಾಗುತ್ತದೆ. ಉಪ್ಪು ನೀರು ಹೆಪ್ಪುಗಟ್ಟಿದಾಗ ಉಪ್ಪು ಹೊರಗುಳಿದು ಶುದ್ಧ ನೀರಿನ ಮಂಜುಗಡ್ಡೆ ಉಂಟಾಗುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q5', 5, 2026, 'September', 1, 'hk', 'ksp-pc', 'geography_earth_systems.human_geography_population_settlements', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Human Geography (Population & Settlements)', 'ಮಾನವ ಭೂಗೋಳಶಾಸ್ತ್ರ (ಜನಸಂಖ್ಯೆ ಮತ್ತು ವಸಾಹತುಗಳು)', 'Linguistic Geography & Major Language Families in India', 'ಭಾಷಾವಾರು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮತ್ತು ಭಾರತದ ಪ್ರಮುಖ ಭಾಷಾ ಕುಟುಂಬಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Geography', 'Linguistics', 'Culture', 'Geography & Earth Systems']::TEXT[], '', '', 'Match List - I with List - II and choose the correct answer :
List - I (Linguistic Family)
(a) The Indo-Aryan languages
(b) The Dravidian family
(c) The Austric family
(d) The Sino-Tibetan family

List - II (Languages)
(i) Tamil
(ii) Ladakhi
(iii) Khasi
(iv) Hindi', 'ಪಟ್ಟಿ-I ನ್ನು ಪಟ್ಟಿ-II ರ ಜೊತೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.
ಪಟ್ಟಿ-I (ಭಾಷಾ ಕುಟುಂಬ)
(a) ಇಂಡೋ - ಆರ್ಯನ್ ಭಾಷೆಗಳು
(b) ದ್ರಾವಿಡ ಕುಟುಂಬ
(c) ಆಸ್ಟ್ರಿಕ್ ಕುಟುಂಬ
(d) ಸೈನೋ - ಟಿಬೇಟಿಯನ್ ಕುಟುಂಬ

ಪಟ್ಟಿ-II (ಭಾಷೆಗಳು)
(i) ತಮಿಳು
(ii) ಲಡಾಖೀ
(iii) ಖಾಸೀ
(iv) ಹಿಂದಿ', '(a)-(iv), (b)-(i), (c)-(iii), (d)-(ii)', '(a)-(iv), (b)-(i), (c)-(ii), (d)-(iii)', '(a)-(ii), (b)-(i), (c)-(iv), (d)-(iii)', '(a)-(iii), (b)-(iv), (c)-(i), (d)-(ii)', '(a)-(iv), (b)-(i), (c)-(iii), (d)-(ii)', '(a)-(iv), (b)-(i), (c)-(ii), (d)-(iii)', '(a)-(ii), (b)-(i), (c)-(iv), (d)-(iii)', '(a)-(iii), (b)-(iv), (c)-(i), (d)-(ii)', '1', 'Correct Answer: (1)

Explanation:
• Indo-Aryan languages: Hindi (iv)
• Dravidian family: Tamil (i)
• Austric (Austroasiatic) family: Khasi (spoken in Meghalaya) (iii)
• Sino-Tibetan family: Ladakhi (ii)

Matching combination is: (a)-(iv), (b)-(i), (c)-(iii), (d)-(ii).', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
• ಇಂಡೋ-ಆರ್ಯನ್ ಭಾಷೆಗಳು: ಹಿಂದಿ (iv)
• ದ್ರಾವಿಡ ಕುಟುಂಬ: ತಮಿಳು (i)
• ಆಸ್ಟ್ರಿಕ್ ಕುಟುಂಬ: ಖಾಸೀ (ಮೇಘಾಲಯದಲ್ಲಿ ಮಾತನಾಡುವ ಭಾಷೆ) (iii)
• ಸೈನೋ-ಟಿಬೇಟಿಯನ್ ಕುಟುಂಬ: ಲಡಾಖೀ (ii)

ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: (a)-(iv), (b)-(i), (c)-(iii), (d)-(ii).', NULL, NULL),
    ('pc-hk-2026-q6', 6, 2026, 'September', 1, 'hk', 'ksp-pc', 'geography_earth_systems.physical_geography_earth_systems.geomorphic_processes_landform_evolution', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Physical Geography & Earth Systems (Geomorphology)', 'ಭೌತಿಕ ಭೂಗೋಳಶಾಸ್ತ್ರ ಮತ್ತು ಭೂರೂಪಶಾಸ್ತ್ರ', 'Physiography of Northern Plains (Bhabar, Terai, Bhangar, Khadar)', 'ಉತ್ತರದ ಮಹಾ ಮೈದಾನದ ಭೌತಿಕ ಲಕ್ಷಣಗಳು (ಭಾಬರ್, ತೆರಾಯ್, ಭಾಂಗರ್, ಖಾದರ್)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Physical Geography', 'Northern Plains', 'Geomorphology', 'Geography & Earth Systems']::TEXT[], '', '', 'Which of the characteristics of the Great plain of India is not correctly matched ?', 'ಭಾರತದ ಮಹಾ ಮೈದಾನದ ಗುಣಲಕ್ಷಣಗಳಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಈ ಕೆಳಗಿನ ಯಾವುದು ಸರಿಯಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿಲ್ಲ ?', 'Terai — Marshy area', 'Bhangar — Old alluvium', 'Khadar — New alluvium', 'Bhabar — Sandy soil mixed with gravel', 'ತೆರಾಯಿ - ಚೌಗು ಪ್ರದೇಶ', 'ಭಾಂಗರ್ - ಹಳೆಯ ರೇವೆ (ಮೆಕ್ಕಲು) ಮಣ್ಣು', 'ಖಾದರ್ - ಹೊಸ ರೇವೆ (ಮೆಕ್ಕಲು) ಮಣ್ಣು', 'ಭಾಬರ್ - ಜಲ್ಲಿಕಲ್ಲು ಮಿಶ್ರಿತ ಮರಳು ಮಣ್ಣು', '4', 'Correct Answer: (4)

Explanation:
• Terai is a wet, damp, and marshy tract south of Bhabar.
• Bhangar represents older alluvium forming higher terraces.
• Khadar represents newer, flood-plain alluvium.
• Bhabar is a porous belt along the Shivalik foothills composed of unassorted boulders and coarse pebbles where rivers disappear; characterizing it as ''sandy soil mixed with gravel'' is incorrect.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
• ತೆರಾಯಿ: ಭಾಬರ್‌ನ ದಕ್ಷಿಣಕ್ಕಿರುವ ತೇವಾಂಶವುಳ್ಳ ಚೌಗು ಪ್ರದೇಶ.
• ಭಾಂಗರ್: ಹಳೆಯ ಮೆಕ್ಕಲು ಮಣ್ಣಿನಿಂದ ಕೂಡಿದ ಪ್ರಸ್ಥಭೂಮಿ ಪ್ರದೇಶ.
• ಖಾದರ್: ಪ್ರವಾಹಗಳಿಂದ ಪ್ರತಿವರ್ಷ ಹೊಸದಾಗಿ ಸಂಗ್ರಹವಾಗುವ ಫಲವತ್ತಾದ ಹೊಸ ಮೆಕ್ಕಲು ಮಣ್ಣು.
• ಭಾಬರ್: ಶಿವಾಲಿಕ್ ಪಾದಬೆಟ್ಟಗಳ ಉದ್ದಕ್ಕೂ ನದಿಗಳು ತಂದೊಡ್ಡಿದ ಬಂಡೆಗಲ್ಲುಗಳು ಮತ್ತು ಸಣ್ಣ ಕಲ್ಲುಗಳಿಂದ ಕೂಡಿದ ಸರಂಧ್ರ ವಲಯವಾಗಿದ್ದು, ಇದನ್ನು ಕೇವಲ ''ಜಲ್ಲಿಕಲ್ಲು ಮಿಶ್ರಿತ ಮರಳು ಮಣ್ಣು'' ಎಂದು ಕರೆಯುವುದು ತಪ್ಪಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q7', 7, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.financial_relations_tax_devolution', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Federal Structure, Center-State Relations & Devolution', 'ಒಕ್ಕೂಟ ವ್ಯವಸ್ಥೆ, ಕೇಂದ್ರ-ರಾಜ್ಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಅಧಿಕಾರ ವಿಕೇಂದ್ರೀಕರಣ', 'Article 269A, GST & Inter-State Fiscal Relations', 'ವಿಧಿ 269A, ಜಿಎಸ್‌ಟಿ ಮತ್ತು ಅಂತರ-ರಾಜ್ಯ ಹಣಕಾಸು ಸಂಬಂಧಗಳು', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Constitution', 'GST', 'Fiscal Federalism', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Which Article of the Indian Constitution defines the levy, collection and distribution of Goods and Services Tax (GST) on supplies during inter-state trade ?', 'ಈ ಕೆಳಗಿನ ಭಾರತ ಸಂವಿಧಾನದ ಯಾವ ವಿಧಿಯು ಅಂತರ ರಾಜ್ಯ ವ್ಯಾಪಾರದ ಸಂದರ್ಭದಲ್ಲಿ ಸರಕು ಮತ್ತು ಸೇವೆಗಳ ತೆರಿಗೆಯನ್ನು (GST) ವಿಧಿಸುವುದು, ಸಂಗ್ರಹಿಸುವುದು ಮತ್ತು ಹಂಚುವುದನ್ನು ವ್ಯಾಖ್ಯಾನಿಸುತ್ತದೆ ?', 'Article 268A', 'Article 269A', 'Article 270A', 'Article 267A', 'ವಿಧಿ 268A', 'ವಿಧಿ 269A', 'ವಿಧಿ 270A', 'ವಿಧಿ 267A', '2', 'Correct Answer: (2)

Explanation:
Article 269A was inserted into the Indian Constitution by the 101st Constitutional Amendment Act, 2016. It mandates that Goods and Services Tax on supplies in the course of inter-State trade or commerce (IGST) shall be levied and collected by the Union Government and apportioned between the Union and the States.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
101ನೇ ಸಾಂವಿಧಾನಿಕ ತಿದ್ದುಪಡಿ ಕಾಯ್ದೆ 2016 ರ ಮೂಲಕ ಸೇರಿಸಲಾದ ವಿಧಿ 269A ಅಂತರ-ರಾಜ್ಯ ವ್ಯಾಪಾರ ಅಥವಾ ವಾಣಿಜ್ಯದ ಮೇಲಿನ ಸರಕು ಮತ್ತು ಸೇವಾ ತೆರಿಗೆಯನ್ನು (IGST) ಕೇಂದ್ರ ಸರ್ಕಾರವು ವಿಧಿಸಿ, ಸಂಗ್ರಹಿಸಿ ನಂತರ ಕೇಂದ್ರ ಮತ್ತು ರಾಜ್ಯಗಳ ನಡುವೆ ಹಂಚಿಕೆ ಮಾಡುವುದನ್ನು ವಿವರಿಸುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q8', 8, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.salient_features_of_the_indian_constitution', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Salient Features, Amendments & Basic Structure', 'ಪ್ರಮುಖ ಲಕ್ಷಣಗಳು, ತಿದ್ದುಪಡಿಗಳು ಮತ್ತು ಮೂಲ ರಚನೆ', 'Comparative Politics & World Parliaments (Diet, Knesset, Majlis, Congress)', 'ತುಲನಾತ್ಮಕ ರಾಜಕೀಯ ಮತ್ತು ವಿಶ್ವದ ಸಂಸತ್ತುಗಳು (ಡಯಟ್, ನೆಸ್ಸೆಟ್, ಮಜ್ಲಿಸ್, ಕಾಂಗ್ರೆಸ್)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'World Polity', 'General Knowledge', 'Parliaments', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Match List - I with List - II and choose the correct answer:
List - I (Assembly Name)
(a) Parliament
(b) Congress
(c) Diet
(d) Federal Assembly

List - II (Nations)
(i) Japan
(ii) India
(iii) Russia
(iv) U.S.A.', 'ಪಟ್ಟಿ-I ಅನ್ನು ಪಟ್ಟಿ-II ರ ಜೊತೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.
ಪಟ್ಟಿ-I (ಅಸೆಂಬ್ಲಿ ಹೆಸರು)
(a) ಪಾರ್ಲಿಮೆಂಟ್
(b) ಕಾಂಗ್ರೆಸ್
(c) ಡಯಟ್
(d) ಫೆಡರಲ್ ಅಸೆಂಬ್ಲಿ

ಪಟ್ಟಿ-II (ದೇಶಗಳು)
(i) ಜಪಾನ್
(ii) ಭಾರತ
(iii) ರಷ್ಯಾ
(iv) ಯು.ಎಸ್.ಎ.', '(a)-(ii), (b)-(i), (c)-(iv), (d)-(iii)', '(a)-(ii), (b)-(iii), (c)-(i), (d)-(iv)', '(a)-(ii), (b)-(iv), (c)-(i), (d)-(iii)', '(a)-(iv), (b)-(i), (c)-(iii), (d)-(ii)', '(a)-(ii), (b)-(i), (c)-(iv), (d)-(iii)', '(a)-(ii), (b)-(iii), (c)-(i), (d)-(iv)', '(a)-(ii), (b)-(iv), (c)-(i), (d)-(iii)', '(a)-(iv), (b)-(i), (c)-(iii), (d)-(ii)', '3', 'Correct Answer: (3)

Explanation:
• Parliament — India (ii)
• Congress — U.S.A. (iv)
• Diet — Japan (i)
• Federal Assembly — Russia (iii)

Matching combination: (a)-(ii), (b)-(iv), (c)-(i), (d)-(iii).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
• ಪಾರ್ಲಿಮೆಂಟ್ (ಸಂಸತ್ತು) — ಭಾರತ (ii)
• ಕಾಂಗ್ರೆಸ್ — ಯು.ಎಸ್.ಎ. (ಅಮೆರಿಕ) (iv)
• ಡಯಟ್ — ಜಪಾನ್ (i)
• ಫೆಡರಲ್ ಅಸೆಂಬ್ಲಿ — ರಷ್ಯಾ (iii)

ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: (a)-(ii), (b)-(iv), (c)-(i), (d)-(iii).', NULL, NULL),
    ('pc-hk-2026-q9', 9, 2026, 'September', 1, 'hk', 'ksp-pc', 'geography_earth_systems.economic_resource_geography.global_indian_distribution_of_natural_resources', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Economic & Resource Geography', 'ಆರ್ಥಿಕ ಮತ್ತು ಸಂಪನ್ಮೂಲ ಭೂಗೋಳಶಾಸ್ತ್ರ', 'Coal Reserves & Geological Distribution in India (Gondwana vs Tertiary)', 'ಭಾರತದಲ್ಲಿ ಕಲ್ಲಿದ್ದಲು ನಿಕ್ಷೇಪಗಳು ಮತ್ತು ಭೂವೈಜ್ಞಾನಿಕ ಹಂಚಿಕೆ (ಗೊಂಡ್ವಾನ ಮತ್ತು ತೃತೀಯ ಅವಧಿ)', 'hard', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Economic Geography', 'Coal Reserves', 'Minerals', 'Geography & Earth Systems']::TEXT[], '', '', 'Consider the following statements regarding coal reserves in India :
Statement (I): India''s 75% coal reserves are found in Damodara, Ib and Suvarnarekha river valleys.
Statement (II): Geological Survey of India (GSI) is managing the Quality and Mining Analysis in India.
Choose the correct answer.', 'ಭಾರತದಲ್ಲಿನ ಕಲ್ಲಿದ್ದಲಿನ ನಿಕ್ಷೇಪಗಳಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಈ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.
ಹೇಳಿಕೆ (I) : ಭಾರತದ ಶೇ. 75 ರಷ್ಟು ಕಲ್ಲಿದ್ದಲಿನ ನಿಕ್ಷೇಪಗಳು ದಾಮೋದರ, ಇಬ್ ಮತ್ತು ಸುವರ್ಣರೇಖಾ ನದಿ ಕಣಿವೆಯಲ್ಲಿದೆ.
ಹೇಳಿಕೆ (II) : ಭಾರತದ ಖನಿಜಗಳ ಗುಣಮಟ್ಟ ಮತ್ತು ಗಣಿಗಾರಿಕೆಯ ವಿಶ್ಲೇಷಣೆಯನ್ನು ಭಾರತೀಯ ಭೂಗರ್ಭ ಸರ್ವೆಕ್ಷಣಾ ಸಂಸ್ಥೆ (GSI) ನಿರ್ವಹಿಸುತ್ತದೆ.
ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.', 'Both statements (I) and (II) are correct.', 'Statement (I) is incorrect but (II) is correct.', 'Both statements (I) and (II) are incorrect.', 'Statement (I) is correct but (II) is incorrect.', 'ಹೇಳಿಕೆ (I) ಮತ್ತು (II) ಎರಡೂ ಸರಿಯಾಗಿವೆ.', 'ಹೇಳಿಕೆ (I) ತಪ್ಪಾಗಿದೆ ಆದರೆ (II) ಸರಿಯಾಗಿದೆ.', 'ಹೇಳಿಕೆ (I) ಮತ್ತು (II) ಎರಡೂ ತಪ್ಪಾಗಿವೆ.', 'ಹೇಳಿಕೆ (I) ಸರಿಯಾಗಿದೆ ಆದರೆ (II) ತಪ್ಪಾಗಿದೆ.', '3', 'Correct Answer: (3)

Explanation:
• Statement (I) is incorrect: Three-fourths of India''s Gondwana coal deposits are situated in the Damodar, Mahanadi, Son, and Godavari valleys; Suvarnarekha valley is not a major coal basin.
• Statement (II) is incorrect: The Geological Survey of India (GSI) performs geological mapping and initial mineral exploration, whereas quality surveillance, grade declaration, and statutory mining controls are overseen by the Coal Controller''s Organisation (CCO) and CMPDI/CIMFR.

Thus, both statements (I) and (II) are incorrect.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
• ಹೇಳಿಕೆ (I) ತಪ್ಪಾಗಿದೆ: ಭಾರತದ ಶೇ. 75 ಕ್ಕೂ ಹೆಚ್ಚು ಕಲ್ಲಿದ್ದಲು ನಿಕ್ಷೇಪಗಳು ದಾಮೋದರ, ಮಹಾನದಿ, ಗೋದಾವರಿ ಮತ್ತು ಸೋನ್ ನದಿ ಕಣಿವೆಗಳಲ್ಲಿ ಕಂಡುಬರುತ್ತವೆ. ಸುವರ್ಣರೇಖಾ ನದಿ ಕಣಿವೆಯು ಪ್ರಮುಖ ಕಲ್ಲಿದ್ದಲು ಜಲಾನಯನ ಪ್ರದೇಶವಲ್ಲ.
• ಹೇಳಿಕೆ (II) ತಪ್ಪಾಗಿದೆ: GSI ಸಂಸ್ಥೆಯು ಕೇವಲ ಮೂಲಭೂತ ಭೂವೈಜ್ಞಾನಿಕ ನಕ್ಷೆ ರಚನೆ ಮತ್ತು ಪ್ರಾಥಮಿಕ ಅನ್ವೇಷಣೆಯನ್ನು ಮಾತ್ರ ನಡೆಸುತ್ತದೆ. ಕಲ್ಲಿದ್ದಲಿನ ಗುಣಮಟ್ಟ ಮತ್ತು ಗಣಿಗಾರಿಕೆ ವಿಶ್ಲೇಷಣೆಯನ್ನು ಕಲ್ಲಿದ್ದಲು ನಿಯಂತ್ರಕರ ಸಂಸ್ಥೆ (CCO) ಮತ್ತು CMPDI ನಿರ್ವಹಿಸುತ್ತವೆ.

ಆದ್ದರಿಂದ, ಹೇಳಿಕೆ (I) ಮತ್ತು (II) ಎರಡೂ ತಪ್ಪಾಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q10', 10, 2026, 'September', 1, 'hk', 'ksp-pc', 'international_relations_global_institutions.regional_multilateral_groupings.regional_organisations', 'International Relations & Global Institutions', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು', 'Regional Multilateral Groupings', 'ಪ್ರಾದೇಶಿಕ ಮತ್ತು ಬಹುಪಕ್ಷೀಯ ಒಕ್ಕೂಟಗಳು', 'G7 Intergovernmental Political Forum & Member Countries', 'G7 ಅಂತರ್-ಸರ್ಕಾರಿ ವೇದಿಕೆ ಮತ್ತು ಸದಸ್ಯ ರಾಷ್ಟ್ರಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'International Organizations', 'G7', 'Current Affairs', 'International Relations & Global Institutions']::TEXT[], '', '', 'Which of the following country is NOT a member of the G7?', 'ಈ ಕೆಳಗಿನ ಯಾವ ದೇಶವು G7 ಸದಸ್ಯ ರಾಷ್ಟ್ರವಲ್ಲ ?', 'Germany', 'India', 'Italy', 'France', 'ಜರ್ಮನಿ', 'ಭಾರತ', 'ಇಟಲಿ', 'ಫ್ರಾನ್ಸ್', '2', 'Correct Answer: (2)

Explanation:
The Group of Seven (G7) comprises Canada, France, Germany, Italy, Japan, the United Kingdom, and the United States (along with the European Union). India is invited regularly as an outreach partner country, but is not a member of the G7.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
G7 (Group of Seven) ಒಕ್ಕೂಟವು ಕೆನಡಾ, ಫ್ರಾನ್ಸ್, ಜರ್ಮನಿ, ಇಟಲಿ, ಜಪಾನ್, ಯುನೈಟೆಡ್ ಕಿಂಗ್‌ಡಮ್ ಮತ್ತು ಅಮೆರಿಕ (ಯು.ಎಸ್.ಎ.) ಗಳನ್ನು ಒಳಗೊಂಡಿದೆ. ಭಾರತವು ಈ ಒಕ್ಕೂಟದ ಅಧಿಕೃತ ಸದಸ್ಯ ರಾಷ್ಟ್ರವಲ್ಲ.', NULL, NULL),
    ('pc-hk-2026-q11', 11, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.parliament_state_legislatures.structure_composition', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Parliament & State Legislatures', 'ಸಂಸತ್ತು ಮತ್ತು ರಾಜ್ಯ ಶಾಸಕಾಂಗಗಳು', 'Tenth Schedule & Anti-Defection Law (52nd & 91st Constitutional Amendments)', 'ಹತ್ತನೇ ಅನುಸೂಚಿ ಮತ್ತು ಪಕ್ಷಾಂತರ ನಿಷೇಧ ಕಾಯಿದೆ (52 ಮತ್ತು 91 ನೇ ಸಂವಿಧಾನ ತಿದ್ದುಪಡಿಗಳು)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Anti-Defection', 'Schedules of Constitution', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Which one of the following schedules of the Constitution of India, contains provisions regarding "anti-defection law" ?', '"ಪಕ್ಷಾಂತರ ನಿಷೇಧ ಕಾಯಿದೆ"ಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಭಾರತದ ಸಂವಿಧಾನದ ಕೆಳಗಿನ ಯಾವ ಅನುಸೂಚಿಯು ಅವಕಾಶವನ್ನು ನೀಡಿದೆ ?', 'Seventh Schedule', 'Tenth Schedule', 'Eighth Schedule', 'Ninth Schedule', '7ನೇ ಅನುಸೂಚಿ', '10ನೇ ಅನುಸೂಚಿ', '8ನೇ ಅನುಸೂಚಿ', '9ನೇ ಅನುಸೂಚಿ', '2', 'Correct Answer: (2)

Explanation:
The Tenth Schedule of the Constitution of India, incorporated via the 52nd Constitutional Amendment Act of 1985, lays down provisions for the disqualification of elected members on grounds of defection.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
1985 ರ 52ನೇ ಸಾಂವಿಧಾನಿಕ ತಿದ್ದುಪಡಿ ಕಾಯ್ದೆಯ ಮೂಲಕ ಸಂವಿಧಾನಕ್ಕೆ ಸೇರಿಸಲಾದ 10ನೇ ಅನುಸೂಚಿಯು ಸಂಸತ್ ಮತ್ತು ರಾಜ್ಯ ಶಾಸಕಾಂಗಗಳ ಚುನಾಯಿತ ಸದಸ್ಯರ ಪಕ್ಷಾಂತರ ನಿಷೇಧದ ನಿಯಮಗಳನ್ನು ಒಳಗೊಂಡಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q12', 12, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.union_executive_state_executive.state_executive', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Union Executive & State Executive', 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ', 'Advocate General of the State (Article 165, Constitutional Status & Functions)', 'ರಾಜ್ಯದ ಅಡ್ವೊಕೇಟ್ ಜನರಲ್ (ವಿಧಿ 165, ಸಾಂವಿಧಾನಿಕ ಸ್ಥಾನಮಾನ ಮತ್ತು ಕಾರ್ಯಗಳು)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Advocate General', 'State Executive', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Consider the following statements regarding Advocate General of the State :
(a) He/she is appointed by the Governor.
(b) He/she is appointed for a period of 5 years.
(c) He/she is the Chief Law Officer of the government in the State.
(d) He/she has the right to speak and to take part in the proceedings of both the Houses of the State Legislature.
Which of the above statements is/are incorrect?', 'ರಾಜ್ಯದ ಅಡ್ವಕೇಟ್ ಜನರಲ್‌ರವರಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.
(a) ಅವರು ರಾಜ್ಯಪಾಲರಿಂದ ನೇಮಕ ಹೊಂದುತ್ತಾರೆ.
(b) ಅವರು 5 ವರ್ಷಗಳ ಅವಧಿಗೆ ನೇಮಕಗೊಳ್ಳುತ್ತಾರೆ.
(c) ಅವರು ರಾಜ್ಯ ಸರ್ಕಾರದ ಅತ್ಯುನ್ನತ ಕಾನೂನು ಅಧಿಕಾರಿ ಆಗಿರುತ್ತಾರೆ.
(d) ಅವರು ರಾಜ್ಯ ಶಾಸಕಾಂಗದ ಉಭಯ ಸದನಗಳಲ್ಲಿ ಮಾತನಾಡುವ ಮತ್ತು ಭಾಗವಹಿಸುವ ಹಕ್ಕನ್ನು ಹೊಂದಿರುತ್ತಾರೆ.
ಮೇಲಿನ ಯಾವ ಹೇಳಿಕೆ/ಗಳು ತಪ್ಪಾಗಿವೆ ?', '(b) only', '(c) and (d)', '(d) only', '(a) and (b)', '(b) ಮಾತ್ರ', '(c) ಮತ್ತು (d)', '(d) ಮಾತ್ರ', '(a) ಮತ್ತು (b)', '1', 'Correct Answer: (1)

Explanation:
Under Article 165, the Advocate General holds office during the pleasure of the Governor. The Constitution does not fix a term of 5 years. Hence, statement (b) is incorrect.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಸಂವಿಧಾನದ 165ನೇ ವಿಧಿಯ ಪ್ರಕಾರ ಅಡ್ವಕೇಟ್ ಜನರಲ್ ಅವರು ರಾಜ್ಯಪಾಲರ ಇಚ್ಛೆಯಿರುವವರೆಗೆ (Pleasure of the Governor) ಅಧಿಕಾರದಲ್ಲಿರುತ್ತಾರೆ. ಸಂವಿಧಾನದಲ್ಲಿ ಅವರ ಅಧಿಕಾರಾವಧಿಯನ್ನು 5 ವರ್ಷಗಳೆಂದು ನಿಗದಿಪಡಿಸಿಲ್ಲ. ಆದ್ದರಿಂದ ಹೇಳಿಕೆ (b) ತಪ್ಪಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q13', 13, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.indian_judiciary_judicial_system.high_courts_subordinate_judiciary', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Indian Judiciary & Judicial System', 'ಭಾರತೀಯ ನ್ಯಾಯಾಂಗ ಮತ್ತು ನ್ಯಾಯಾಂಗ ವ್ಯವಸ್ಥೆ', 'Subordinate Judiciary & Appointment of District Judges (Article 233)', 'ಅಧೀನ ನ್ಯಾಯಾಂಗ ಮತ್ತು ಜಿಲ್ಲಾ ನ್ಯಾಯಾಧೀಶರ ನೇಮಕಾತಿ (ವಿಧಿ 233)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Subordinate Judiciary', 'High Court', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'District judges are appointed by the Governor in consultation with,', 'ರಾಜ್ಯಪಾಲರು ಜಿಲ್ಲಾ ನ್ಯಾಯಾಧೀಶರನ್ನು ಯಾರೊಂದಿಗೆ ಸಮಾಲೋಚಿಸಿ ನೇಮಕ ಮಾಡುತ್ತಾರೆ ?', 'State Public Service Commission', 'Chief Minister', 'Advocate General', 'The High Court', 'ರಾಜ್ಯ ಲೋಕ ಸೇವಾ ಆಯೋಗ', 'ಮುಖ್ಯಮಂತ್ರಿ', 'ಅಡ್ವಕೇಟ್ ಜನರಲ್', 'ಹೈಕೋರ್ಟ್', '4', 'Correct Answer: (4)

Explanation:
According to Article 233(1) of the Constitution of India, the appointment, posting, and promotion of district judges in any State are made by the Governor in consultation with the High Court exercising jurisdiction over that State.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ಭಾರತ ಸಂವಿಧಾನದ 233(1) ನೇ ವಿಧಿಯ ಪ್ರಕಾರ, ರಾಜ್ಯದ ಜಿಲ್ಲಾ ನ್ಯಾಯಾಧೀಶರ ನೇಮಕಾತಿ, ಹುದ್ದೆ ನಿಯೋಜನೆ ಮತ್ತು ಬಡ್ತಿಗಳನ್ನು ಸಂಬಂಧಪಟ್ಟ ರಾಜ್ಯದ ಹೈಕೋರ್ಟ್‌ನೊಂದಿಗೆ ಸಮಾಲೋಚಿಸಿ ರಾಜ್ಯಪಾಲರು ಮಾಡುತ್ತಾರೆ.', NULL, NULL),
    ('pc-hk-2026-q14', 14, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.salient_features_of_the_indian_constitution', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Salient Features, Amendments & Basic Structure', 'ಪ್ರಮುಖ ಲಕ್ಷಣಗಳು, ತಿದ್ದುಪಡಿಗಳು ಮತ್ತು ಮೂಲ ರಚನೆ', 'Article 1 & Union and its Territory (Part I of the Constitution)', 'ವಿಧಿ 1 ಮತ್ತು ಭಾರತದ ಒಕ್ಕೂಟ ಹಾಗೂ ಅದರ ಭೂಪ್ರದೇಶ (ಸಂವಿಧಾನದ ಭಾಗ I)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Article 1', 'Union and its Territory', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'According to Article-1 of the Constitution, the territory of India comprises of', 'ಸಂವಿಧಾನದ ವಿಧಿ-1 ರ ಅಡಿಯಲ್ಲಿ ಭಾರತದ ಭೂ ಪ್ರದೇಶಗಳು ಒಳಗೊಂಡಿರುವುದು.', 'Only Union Territories.', 'Only Territories that may be acquired by the Government of India at any time.', 'Territories of the State, Union Territories, Territories that may be acquired by the Government of India at any time.', 'Only Territories of the States.', 'ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಗಳು ಮಾತ್ರ.', 'ಭಾರತ ಸರ್ಕಾರವು ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಸ್ವಾಧೀನಪಡಿಸಿಕೊಳ್ಳಬಹುದಾದ ಭೂಪ್ರದೇಶಗಳು ಮಾತ್ರ.', 'ರಾಜ್ಯಗಳ ಭೂಪ್ರದೇಶಗಳು, ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಗಳು, ಭಾರತ ಸರ್ಕಾರವು ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಸ್ವಾಧೀನಪಡಿಸಿಕೊಳ್ಳಬಹುದಾದ ಭೂಪ್ರದೇಶಗಳು.', 'ರಾಜ್ಯಗಳ ಭೂಪ್ರದೇಶಗಳು ಮಾತ್ರ.', '3', 'Correct Answer: (3)

Explanation:
Article 1(3) defines that the territory of India comprises:
(a) The territories of the States;
(b) The Union territories specified in the First Schedule; and
(c) Such other territories as may be acquired by the Government of India at any time.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಸಂವಿಧಾನದ ವಿಧಿ 1(3) ರ ಅನ್ವಯ ಭಾರತದ ಒಕ್ಕೂಟದ ಭೂಪ್ರದೇಶವು:
1. ರಾಜ್ಯಗಳ ಭೂಪ್ರದೇಶಗಳು,
2. 1ನೇ ಅನುಸೂಚಿಯಲ್ಲಿ ನಿರ್ದಿಷ್ಟಪಡಿಸಿದ ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಗಳು, ಮತ್ತು
3. ಭಾರತ ಸರ್ಕಾರವು ಯಾವುದೇ ಸಮಯದಲ್ಲಿ ಸ್ವಾಧೀನಪಡಿಸಿಕೊಳ್ಳಬಹುದಾದ ಇತರ ಭೂಪ್ರದೇಶಗಳನ್ನು ಒಳಗೊಂಡಿರುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q15', 15, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.parliament_state_legislatures.legislative_procedure_bills', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Parliament & State Legislatures', 'ಸಂಸತ್ತು ಮತ್ತು ರಾಜ್ಯ ಶಾಸಕಾಂಗಗಳು', 'Office of the Whip & Parliamentary Conventions', 'ಸಚೇತಕರ (ವಿಪ್) ಕಛೇರಿ ಮತ್ತು ಸಂಸದೀಯ ಸಂಪ್ರದಾಯಗಳು', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Parliament', 'Parliamentary Conventions', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'The office of ''Whip'' in parliament is mentioned in', 'ಇವುಗಳಲ್ಲಿ ಯಾವುದರಲ್ಲಿ ಸಂಸತ್ತಿನಲ್ಲಿನ ಸಚೇತಕರ (Whip) ಕಛೇರಿಯನ್ನು ಉಲ್ಲೇಖಿಸಲಾಗಿದೆ ?', 'Rules of the House', 'Based on conventions', 'Party Manifestos', 'Constitution', 'ಸದನದ ನಿಯಮಗಳು', 'ಸಂಪ್ರದಾಯಗಳನ್ನು ಆಧರಿಸಿದೆ', 'ಪಕ್ಷದ ಪ್ರಣಾಳಿಕೆಗಳು', 'ಸಂವಿಧಾನ', '2', 'Correct Answer: (2)

Explanation:
The office of ''Whip'' is neither mentioned in the Constitution of India nor in the Rules of the House nor in any parliamentary statute. It is an institution based entirely on the conventions of parliamentary government.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಸಂಸತ್ತಿನ ''ಸಚೇತಕ'' (Whip) ಕಚೇರಿಯು ಭಾರತದ ಸಂವಿಧಾನದಲ್ಲಾಗಲಿ, ಸದನದ ನಿಯಮಾವಳಿಗಳಲ್ಲಾಗಲಿ ಅಥವಾ ಯಾವುದೇ ಸಂಸದೀಯ ಶಾಸನದಲ್ಲಾಗಲಿ ಉಲ್ಲೇಖಿಸಲ್ಪಟ್ಟಿಲ್ಲ. ಇದು ಸಂಪೂರ್ಣವಾಗಿ ಸಂಸದೀಯ ಸರ್ಕಾರಿ ಪದ್ಧತಿಯ ಸಂಪ್ರದಾಯಗಳನ್ನು ಆಧರಿಸಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q16', 16, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.union_executive_state_executive.union_executive', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Union Executive & State Executive', 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ', 'Article 75 & Individual/Collective Responsibility of Ministers', 'ವಿಧಿ 75 ಮತ್ತು ಮಂತ್ರಿಗಳ ವೈಯಕ್ತಿಕ ಹಾಗೂ ಸಾಮೂಹಿಕ ಜವಾಬ್ದಾರಿ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Union Council of Ministers', 'Article 75', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Which of the following Article of Indian Constitution explains the Ministers are individual responsibility to the President?', 'ಭಾರತ ಸಂವಿಧಾನದ ಈ ಕೆಳಗಿನ ಯಾವ ವಿಧಿಯು ಮಂತ್ರಿಗಳು ವೈಯಕ್ತಿಕವಾಗಿ ರಾಷ್ಟ್ರಪತಿಗೆ ಜವಾಬ್ದಾರರಾಗಿರುತ್ತಾರೆಂದು ವಿವರಿಸಿದೆ ?', 'Article 75(1)', 'Article 74(2)', 'Article 75(2)', 'Article 74(1)', 'ವಿಧಿ 75(1)', 'ವಿಧಿ 74(2)', 'ವಿಧಿ 75(2)', 'ವಿಧಿ 74(1)', '3', 'Correct Answer: (3)

Explanation:
Article 75(2) states that ministers shall hold office during the pleasure of the President, which codifies the doctrine of individual responsibility to the President.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಭಾರತ ಸಂವಿಧಾನದ 75(2) ನೇ ವಿಧಿಯು ಮಂತ್ರಿಗಳು ರಾಷ್ಟ್ರಪತಿಗಳ ಇಚ್ಛೆಯಿರುವವರೆಗೆ ಅಧಿಕಾರದಲ್ಲಿರುತ್ತಾರೆ ಎಂದು ತಿಳಿಸುತ್ತದೆ. ಇದು ಮಂತ್ರಿಗಳ ವೈಯಕ್ತಿಕ ಜವಾಬ್ದಾರಿಯ ತತ್ವವನ್ನು (Individual Responsibility to the President) ಸೂಚಿಸುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q17', 17, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.union_executive_state_executive.state_executive', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Union Executive & State Executive', 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ', 'Governor''s Assent & Veto Powers over State Bills (Article 200 & 201)', 'ರಾಜ್ಯ ಮಸೂದೆಗಳಿಗೆ ರಾಜ್ಯಪಾಲರ ಅಂಕಿತ ಮತ್ತು ವೀಟೋ ಅಧಿಕಾರಗಳು (ವಿಧಿ 200 ಮತ್ತು 201)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Governor', 'Article 200', 'Veto Powers', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Which of the following statement/statements is/are incorrect?
(a) Governor can give his assent to the bill.
(b) Governor can withhold his assent to the money bill.
(c) Governor may reserve the bill for the reconsideration of the President.
(d) Governor may withhold his assent to the bill.', 'ಕೆಳಗಿನ ಯಾವ ಹೇಳಿಕೆ/ಹೇಳಿಕೆಗಳು ಸರಿಯಾಗಿಲ್ಲ ?
(a) ರಾಜ್ಯಪಾಲರು ಮಸೂದೆಗೆ ಒಪ್ಪಿಗೆಯನ್ನು ನೀಡಬಹುದು.
(b) ಹಣಕಾಸಿನ ಮಸೂದೆಗೆ ತಮ್ಮ ಒಪ್ಪಿಗೆಯನ್ನು ರಾಜ್ಯಪಾಲರು ತಡೆಹಿಡಿಯಬಹುದು.
(c) ರಾಜ್ಯಪಾಲರು ಮಸೂದೆಯನ್ನು ರಾಷ್ಟ್ರಪತಿಗಳ ಮರುಪರಿಶೀಲನೆಗೆ ಕಾಯ್ದಿರಿಸಬಹುದು.
(d) ರಾಜ್ಯಪಾಲರು ಮಸೂದೆಗೆ ತಮ್ಮ ಅನುಮೋದನೆಯನ್ನು ತಡೆಹಿಡಿಯಬಹುದು.', '(a) and (b) only', '(c) and (d) only', '(b) and (d) only', '(b) only', '(a) ಮತ್ತು (b) ಮಾತ್ರ', '(c) ಮತ್ತು (d) ಮಾತ್ರ', '(b) ಮತ್ತು (d) ಮಾತ್ರ', '(b) ಮಾತ್ರ', '4', 'Correct Answer: (4)

Explanation:
Under Article 200 of the Constitution, because a Money Bill is introduced in the State Legislature only with the prior recommendation of the Governor, the Governor cannot withhold assent or return it. Therefore, statement (b) is incorrect.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ಸಂವಿಧಾನದ 200ನೇ ವಿಧಿಯ ಪ್ರಕಾರ, ಹಣಕಾಸು ಮಸೂದೆಯನ್ನು ರಾಜ್ಯಪಾಲರ ಪೂರ್ವ ಶಿಫಾರಸಿನ ಮೇರೆಗೆ ಮಾತ್ರ ರಾಜ್ಯ ಶಾಸಕಾಂಗದಲ್ಲಿ ಮಂಡಿಸುವುದರಿಂದ, ರಾಜ್ಯಪಾಲರು ಹಣಕಾಸಿನ ಮಸೂದೆಗೆ ಒಪ್ಪಿಗೆಯನ್ನು ತಡೆಹಿಡಿಯಲು ಸಾಧ್ಯವಿಲ್ಲ (ಅದನ್ನು ಸಾಧಾರಣವಾಗಿ ಅನುಮೋದಿಸುತ್ತಾರೆ). ಆದ್ದರಿಂದ (b) ಹೇಳಿಕೆ ತಪ್ಪಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q18', 18, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution.constituent_assembly_drafting_process', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Historical Background & Making of the Constitution', 'ಐತಿಹಾಸಿಕ ಹಿನ್ನೆಲೆ ಮತ್ತು ಸಂವಿಧಾನ ರಚನೆ', 'Major Sources Borrowed into Indian Constitution (GoI Act 1935, UK, US, Ireland, Australia)', 'ಭಾರತ ಸಂವಿಧಾನದ ಪ್ರಮುಖ ಮೂಲಗಳು (1935 ರ ಭಾರತ ಸರ್ಕಾರ ಕಾಯ್ದೆ, ಯುಕೆ, ಯುಎಸ್, ಐರ್ಲೆಂಡ್, ಆಸ್ಟ್ರೇಲಿಯಾ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Sources of the Constitution', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Which of the following is/are correctly matched regarding various parts drawn into the Indian Constitution?
(a) Parliamentary System — United Kingdom
(b) Emergencies — Germany
(c) Amendment Procedure — South Africa
(d) Fundamental Rights — Ireland', 'ಭಾರತ ಸಂವಿಧಾನಕ್ಕೆ ಸೇರಿಸಲಾದ ವಿವಿಧ ಭಾಗಗಳಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ, ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವುದು/ಯಾವುವು ಸರಿಯಾಗಿ ಹೊಂದಿಕೆಯಾಗುತ್ತದೆ/ವೆ ?
(a) ಸಂಸದೀಯ ವ್ಯವಸ್ಥೆ - ಯುನೈಟೆಡ್ ಕಿಂಗ್‌ಡಮ್
(b) ತುರ್ತು ಪರಿಸ್ಥಿತಿಗಳು - ಜರ್ಮನಿ
(c) ತಿದ್ದುಪಡಿ ಪ್ರಕ್ರಿಯೆ - ದಕ್ಷಿಣ ಆಫ್ರಿಕಾ
(d) ಮೂಲಭೂತ ಹಕ್ಕುಗಳು - ಐರ್ಲೆಂಡ್', '(a) and (c)', '(a) and (b)', 'Only (a)', '(a), (b) and (c)', '(a) ಮತ್ತು (c)', '(a) ಮತ್ತು (b)', '(a) ಮಾತ್ರ', '(a), (b) ಮತ್ತು (c)', '4', 'Correct Answer: (4)

Explanation:
• Parliamentary system: United Kingdom (Correct)
• Suspension of Fundamental Rights during Emergency: Germany (Weimar Constitution) (Correct)
• Amendment procedure: South Africa (Correct)
• Fundamental Rights: USA (not Ireland; Ireland is the source for Directive Principles of State Policy) (Incorrect)

Thus, (a), (b), and (c) are correctly matched.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
• ಸಂಸದೀಯ ವ್ಯವಸ್ಥೆ: ಯುನೈಟೆಡ್ ಕಿಂಗ್‌ಡಮ್ (ಬ್ರಿಟನ್) ನಿಂದ ಪಡೆಯಲಾಗಿದೆ (ಸರಿ)
• ತುರ್ತು ಪರಿಸ್ಥಿತಿಯ ನಿಬಂಧನೆಗಳು: ಜರ್ಮನಿಯ ವೈಮರ್ ಸಂವಿಧಾನದಿಂದ ಪಡೆಯಲಾಗಿದೆ (ಸರಿ)
• ಸಂವಿಧಾನ ತಿದ್ದುಪಡಿ ಪ್ರಕ್ರಿಯೆ: ದಕ್ಷಿಣ ಆಫ್ರಿಕಾದಿಂದ ಪಡೆಯಲಾಗಿದೆ (ಸರಿ)
• ಮೂಲಭೂತ ಹಕ್ಕುಗಳು: ಅಮೆರಿಕಾದಿಂದ (USA) ಪಡೆಯಲಾಗಿದೆ (ಐರ್ಲೆಂಡ್‌ನಿಂದ ರಾಜ್ಯ ನಿರ್ದೇಶಕ ತತ್ವಗಳನ್ನು ಪಡೆಯಲಾಗಿದೆ) (ತಪ್ಪು)

ಆದ್ದರಿಂದ (a), (b) ಮತ್ತು (c) ಸರಿಯಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q19', 19, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.salient_features_amendments_basic_structure.salient_features_of_the_indian_constitution', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Salient Features, Amendments & Basic Structure', 'ಪ್ರಮುಖ ಲಕ್ಷಣಗಳು, ತಿದ್ದುಪಡಿಗಳು ಮತ್ತು ಮೂಲ ರಚನೆ', 'Citizenship Act 1955 & Overseas Citizen of India (OCI) Scheme', 'ಪೌರತ್ವ ಕಾಯ್ದೆ 1955 ಮತ್ತು ಸಾಗರೋತ್ತರ ಭಾರತೀಯ ಪೌರತ್ವ (OCI) ಯೋಜನೆ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Citizenship', 'OCI Card', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Identify the incorrect statement regarding Overseas Citizen of India (OCI) cardholders :', 'ಭಾರತದ ಸಾಗರೋತ್ತರ ಪೌರತ್ವ (OCI) ಕಾರ್ಡ್ ಹೊಂದಿದವರಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ತಪ್ಪಾದ ಹೇಳಿಕೆಯನ್ನು ಗುರುತಿಸಿ.', 'OCI card can be cancelled if obtained by spouse of Indian Citizen and if their marriage is dissolved by court.', 'Citizens of Bangladesh and Pakistan are ineligible to apply for Overseas Citizenship of India.', 'They are entitled to visa free entry into India for 15 years.', 'They are provided lifelong visa.', 'OCI ಕಾರ್ಡ್ ಅನ್ನು ವಿವಾಹದ ನಂತರ ತಮ್ಮ ಭಾರತದ ನಾಗರಿಕ ಸಂಗಾತಿಯಿಂದ ಪಡೆದಿದ್ದು, ಕೋರ್ಟ್‌ನಿಂದ ವಿವಾಹ ರದ್ಧತಿಯಾದರೆ, ಅದನ್ನು ರದ್ದುಗೊಳಿಸಲಾಗುತ್ತದೆ.', 'ಬಾಂಗ್ಲಾದೇಶ ಮತ್ತು ಪಾಕಿಸ್ತಾನದ ಪೌರರು ಭಾರತದ ಸಾಗರೋತ್ತರ ಪೌರತ್ವ ಅರ್ಜಿ ಸಲ್ಲಿಸಲು ಅನರ್ಹರಾಗಿರುತ್ತಾರೆ.', 'OCI ಕಾರ್ಡ್ ಹೊಂದಿದವರು 15 ವರ್ಷಗಳ ಕಾಲ ವೀಸಾ ಮುಕ್ತವಾಗಿ ಭಾರತ ಪ್ರವೇಶಿಸಬಹುದು.', 'ಅವರಿಗೆ ಜೀವನ ಪರ್ಯಂತ ವೀಸಾ ನೀಡಲಾಗುತ್ತದೆ.', '3', 'Correct Answer: (3)

Explanation:
OCI cardholders are entitled to a multipurpose, multiple-entry, lifelong visa to visit India. There is no 15-year cap on visa-free travel. Hence, statement (3) is incorrect.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
OCI ಕಾರ್ಡ್ ಹೊಂದಿದವರಿಗೆ ಭಾರತಕ್ಕೆ ಭೇಟಿ ನೀಡಲು ಜೀವಮಾನದ ಬಹುಪ್ರವೇಶ ವೀಸಾ (lifelong visa) ನೀಡಲಾಗುತ್ತದೆ. ಅವರಿಗೆ 15 ವರ್ಷಗಳ ಮಿತಿ ಇರುವುದಿಲ್ಲ. ಆದ್ದರಿಂದ (3) ನೇ ಹೇಳಿಕೆ ತಪ್ಪಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q20', 20, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.directive_principles_of_state_policy_-_part_iv_articles_36-51', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Fundamental Rights, DPSP & Fundamental Duties', 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು, ಡಿಪಿಎಸ್‌ಪಿ ಮತ್ತು ಮೂಲಭೂತ ಕರ್ತವ್ಯಗಳು', 'Directive Principles of State Policy & Gandhian Ideals (Part IV)', 'ರಾಜ್ಯ ನೀತಿ ನಿರ್ದೇಶಕ ತತ್ವಗಳು ಮತ್ತು ಗಾಂಧಿವಾದಿ ಆದರ್ಶಗಳು (ಭಾಗ IV)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'DPSP', 'Gandhian Principles', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Gandhian ideals are reflected in which of the following parts of the Indian Constitution?', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಭಾರತ ಸಂವಿಧಾನದ ಯಾವ ಭಾಗವು ಗಾಂಧೀವಾದಿ ಆದರ್ಶಗಳನ್ನು ಬಿಂಬಿಸುತ್ತದೆ ?', 'Part II', 'Part III', 'Part IV', 'Part I', 'ಭಾಗ II', 'ಭಾಗ III', 'ಭಾಗ IV', 'ಭಾಗ I', '3', 'Correct Answer: (3)

Explanation:
Gandhian ideals are prominently incorporated in Part IV of the Indian Constitution (Directive Principles of State Policy), including Article 40 (Village Panchayats), Article 43 (Cottage Industries), Article 47 (Prohibition of intoxicants), and Article 48 (Protection of cows and cattle).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಗಾಂಧೀವಾದಿ ಆದರ್ಶಗಳು ಸಂವಿಧಾನದ 4ನೇ ಭಾಗದಲ್ಲಿರುವ ರಾಜ್ಯ ನಿರ್ದೇಶಕ ತತ್ವಗಳಲ್ಲಿ (DPSP) ಪ್ರತಿಫಲಿಸುತ್ತವೆ. ಉದಾಹರಣೆಗೆ: ವಿಧಿ 40 (ಗ್ರಾಮ ಪಂಚಾಯಿತಿಗಳ ರಚನೆ), ವಿಧಿ 43 (ಗುಡಿ ಕೈಗಾರಿಕೆಗಳ ಪ್ರೋತ್ಸಾಹ), ವಿಧಿ 47 (ಮದ್ಯಪಾನ ನಿಷೇಧ) ಮತ್ತು ವಿಧಿ 48 (ಗೋಹತ್ಯೆ ನಿಷೇಧ).', NULL, NULL),
    ('pc-hk-2026-q21', 21, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.e-governance_models_digital_public_infrastructure', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'E-Governance Models & Digital Public Infrastructure', 'ಇ-ಆಡಳಿತ ಮತ್ತು ಡಿಜಿಟಲ್ ಸಾರ್ವಜನಿಕ ಮೂಲಸೌಕರ್ಯ', 'Karnataka Housing Schemes & Rajiv Gandhi Rural Housing Corporation Apps', 'ಕರ್ನಾಟಕ ವಸತಿ ಯೋಜನೆಗಳು ಮತ್ತು ರಾಜೀವ್ ಗಾಂಧಿ ಗ್ರಾಮೀಣ ವಸತಿ ನಿಗಮದ ಆ್ಯಪ್‌ಗಳು', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Karnataka Schemes', 'E-Governance', 'Housing', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Name of the mobile app used under Housing schemes in Karnataka :', 'ಕರ್ನಾಟಕದ ವಸತಿ ಯೋಜನೆಗಳಲ್ಲಿ ಉಪಯೋಗಿಸುವ ಮೊಬೈಲ್ ಆ್ಯಪ್‌ನ ಹೆಸರು', 'Spandana Vigil', 'Ashraya Vigil', 'Gruha Vigil', 'Vasati Vigil', 'ಸ್ಪಂದನ ವಿಜಿಲ್', 'ಆಶ್ರಯ ವಿಜಿಲ್', 'ಗೃಹ ವಿಜಿಲ್', 'ವಸತಿ ವಿಜಿಲ್', '4', 'Correct Answer: (4)

Explanation:
''Vasati Vigil'' is the dedicated mobile application used by the Rajiv Gandhi Housing Corporation Limited (RGHCL), Government of Karnataka, for geo-tagging, site verification, and tracking the physical progress of housing units under various government housing schemes.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ಕರ್ನಾಟಕ ಸರ್ಕಾರದ ರಾಜೀವ್ ಗಾಂಧಿ ವಸತಿ ನಿಗಮವು (RGHCL) ವಸತಿ ಯೋಜನೆಗಳ ಅಡಿಯಲ್ಲಿ ಮನೆ ನಿರ್ಮಾಣದ ಪ್ರಗತಿಯನ್ನು ಜಿಯೋ-ಟ್ಯಾಗ್ ಮಾಡಲು ಮತ್ತು ಮೇಲ್ವಿಚಾರಣೆ ನಡೆಸಲು ''ವಸತಿ ವಿಜಿಲ್'' (Vasati Vigil) ಮೊಬೈಲ್ ಆ್ಯಪ್ ಅನ್ನು ಬಳಸುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q22', 22, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups', 'Indian Society & Social Justice', 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ', 'Welfare Schemes for Vulnerable Sections', 'ದುರ್ಬಲ ವರ್ಗಗಳ ಕಲ್ಯಾಣ ಯೋಜನೆಗಳು', 'Koosina Mane Childcare Centres under MGNREGA in Karnataka', 'ಕರ್ನಾಟಕದಲ್ಲಿ ನರೇಗಾ ಯೋಜನೆಯಡಿ ಕೂಸಿನ ಮನೆ ಶಿಶುಪಾಲನಾ ಕೇಂದ್ರಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Karnataka Schemes', 'MGNREGA', 'Women and Child Development', 'Indian Society & Social Justice']::TEXT[], '', '', 'Under which scheme ''KOOSINA MANE'' childcare centres were established?', '"ಕೂಸಿನ ಮನೆ" ಶಿಶುಪಾಲನಾ ಕೇಂದ್ರಗಳು ಯಾವ ಯೋಜನೆ ಅಡಿಯಲ್ಲಿ ಸ್ಥಾಪಿತವಾದವು ?', 'SBMG', 'PMGSY', 'MGNREGA', 'MMGRAY', 'SBMG', 'PMGSY', 'MGNREGA', 'MMGRAY', '3', 'Correct Answer: (3)

Explanation:
The Government of Karnataka launched the ''Koosina Mane'' scheme across rural Gram Panchayats under the Mahatma Gandhi National Rural Employment Guarantee Act (MGNREGA) to provide quality creche and childcare support to working mothers.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಗ್ರಾಮೀಣ ಪ್ರದೇಶದ ಉದ್ಯೋಗ ಖಾತ್ರಿ ಕಾರ್ಮಿಕರ ಮತ್ತು ಇತರ ದುಡಿಯುವ ಮಹಿಳೆಯರ ಮಕ್ಕಳ ಸುರಕ್ಷತೆ ಮತ್ತು ಪಾಲನೆಗಾಗಿ ಕರ್ನಾಟಕ ಸರ್ಕಾರವು ಮಹಾತ್ಮ ಗಾಂಧಿ ರಾಷ್ಟ್ರೀಯ ಗ್ರಾಮೀಣ ಉದ್ಯೋಗ ಖಾತರಿ ಯೋಜನೆ (MGNREGA) ಅಡಿಯಲ್ಲಿ ''ಕೂಸಿನ ಮನೆ'' ಶಿಶುಪಾಲನಾ ಕೇಂದ್ರಗಳನ್ನು ಸ್ಥಾಪಿಸಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q23', 23, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms.vijayanagara_empire', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Vijayanagara Empire Literature & Kannada Literary Works (Kumaravyasa Bharata)', 'ವಿಜಯನಗರ ಸಾಮ್ರಾಜ್ಯದ ಸಾಹಿತ್ಯ ಮತ್ತು ಕನ್ನಡ ಕೃತಿಗಳು (ಕುಮಾರವ್ಯಾಸ ಭಾರತ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Karnataka History', 'Vijayanagara Empire', 'Literature', 'History']::TEXT[], '', '', 'Which of the following literary work from the Vijayanagara period was composed in Kannada language?', 'ವಿಜಯನಗರ ಅವಧಿಯ ಕೆಳಗಿನ ಯಾವ ಕೃತಿ ಕನ್ನಡ ಭಾಷೆಯಲ್ಲಿ ರಚಿತವಾಗಿದೆ ?', 'Prabhulinga Leele', 'Madhura Vijayam', 'Amuktamalyada', 'Kalapurnodayam', 'ಪ್ರಭುಲಿಂಗ ಲೀಲೆ', 'ಮಧುರಾ ವಿಜಯಂ', 'ಆಮುಕ್ತಮಾಲ್ಯದ', 'ಕಲಾಪೂರ್ಣೋದಯಂ', '1', 'Correct Answer: (1)

Explanation:
• ''Prabhulinga Leele'' was written in Kannada by the Veerashaiva poet Chamarasa during the reign of Vijayanagara King Deva Raya II.
• ''Madhura Vijayam'' was written in Sanskrit by Gangadevi.
• ''Amuktamalyada'' was composed in Telugu by Sri Krishnadevaraya.
• ''Kalapurnodayam'' was composed in Telugu by Pingali Suranna.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
• ಪ್ರಭುಲಿಂಗ ಲೀಲೆ: ಎರಡನೇ ದೇವರಾಯನ ಆಸ್ಥಾನದಲ್ಲಿದ್ದ ಚಾಮರಸ ಕವಿಯು ರಚಿಸಿದ ಪ್ರಸಿದ್ಧ ಕನ್ನಡ ಕಾವ್ಯ.
• ಮಧುರಾ ವಿಜಯಂ: ಗಂಗಾದೇವಿಯು ಸಂಸ್ಕೃತದಲ್ಲಿ ಬರೆದ ಕೃತಿ.
• ಆಮುಕ್ತಮಾಲ್ಯದ: ಶ್ರೀ ಕೃಷ್ಣದೇವರಾಯನು ತೆಲುಗು ಭಾಷೆಯಲ್ಲಿ ರಚಿಸಿದ ಕೃತಿ.
• ಕಲಾಪೂರ್ಣೋದಯಂ: ಪಿಂಗಳಿ ಸೂರನ್ನ ತೆಲುಗು ಭಾಷೆಯಲ್ಲಿ ರಚಿಸಿದ ಕಾವ್ಯ.', NULL, NULL),
    ('pc-hk-2026-q24', 24, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.medieval_india.mughal_empire', 'History', 'ಇತಿಹಾಸ', 'Medieval India', 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ', 'Mughal Empire & Humayun''s Foundation of Din-panah in Delhi', 'ಮೊಘಲ್ ಸಾಮ್ರಾಜ್ಯ ಮತ್ತು ಹುಮಾಯೂನ್ ನಿರ್ಮಿಸಿದ ದೆಹಲಿಯ ದೀನ್-ಪನ್ಹಾ ನಗರ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Medieval Indian History', 'Mughal Empire', 'Humayun', 'History']::TEXT[], '', '', 'Which Mughal ruler founded the city of "Din-panah" in Delhi ?', 'ದೆಹಲಿಯಲ್ಲಿ "ದೀನ್ ಪನ್ಹಾ" ಎಂಬ ನಗರವನ್ನು ನಿರ್ಮಿಸಿದ ಮೊಘಲ್ ದೊರೆ ಯಾರು ?', 'Humayun', 'Akbar', 'Jahangir', 'Babur', 'ಹುಮಾಯೂನ್', 'ಅಕ್ಟರ್', 'ಜಹಾಂಗೀರ್', 'ಬಾಬರ್', '1', 'Correct Answer: (1)

Explanation:
Mughal Emperor Humayun founded the city of ''Din-panah'' (Asylum of Faith) in Delhi in 1533 CE, which later encompassed the Purana Qila complex.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಮೊಘಲ್ ಚಕ್ರವರ್ತಿ ಹುಮಾಯೂನ್ 1533 ರಲ್ಲಿ ದೆಹಲಿಯಲ್ಲಿ ಯಮುನಾ ನದಿಯ ದಡದಲ್ಲಿ ''ದೀನ್-ಪನ್ಹಾ'' (ಧರ್ಮದ ಆಶ್ರಯ ತಾಣ) ಎಂಬ ಹೊಸ ನಗರವನ್ನು ಸ್ಥಾಪಿಸಿದನು.', NULL, NULL),
    ('pc-hk-2026-q25', 25, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.medieval_india.maratha_empire_regional_states.chhatrapati_shivaji_maharaj_early_maratha_state', 'History', 'ಇತಿಹಾಸ', 'Medieval India', 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ', 'Chhatrapati Shivaji Maharaj & Conquest of Javali (1656)', 'ಛತ್ರಪತಿ ಶಿವಾಜಿ ಮಹಾರಾಜರು ಮತ್ತು ಜಾವಳಿ ವಿಜಯ (1656)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Medieval Indian History', 'Maratha Empire', 'Shivaji', 'History']::TEXT[], '', '', 'From whom did Shivaji conquer Jovali in 1656, making him the master of the Mavala highlands ?', '1656 ರಲ್ಲಿ ಶಿವಾಜಿ ಯಾರಿಂದ ಜೊವಳಿ ಪ್ರದೇಶವನ್ನು ಗೆದ್ದು, ಮಾವಲದ ಎತ್ತರ ಪ್ರದೇಶಗಳಿಗೆ ಅಧಿಪತಿಯಾದರು ?', 'Adil Shah', 'Ganga Bhatt', 'Sarja Khan', 'Chandra Rao More', 'ಆದಿಲ್ ಶಾ', 'ಗಂಗಾ ಭಟ್', 'ಸರ್ಜಾ ಖಾನ್', 'ಚಂದ್ರ ರಾವ್ ಮೋರೆ', '4', 'Correct Answer: (4)

Explanation:
In 1656, Chhatrapati Shivaji annexed the strategic region of Javali (Jovali) from Chandra Rao More, an influential noble of the Bijapur Sultanate, securing complete command over the Mavala highlands.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
1656 ರಲ್ಲಿ ಛತ್ರಪತಿ ಶಿವಾಜಿಯವರು ಬಿಜಾಪುರದ ಆದಿಲ್ ಶಾಹಿಗಳ ಸಾಮಂತನಾಗಿದ್ದ ಚಂದ್ರರಾವ್ ಮೋರೆಯಿಂದ ಜಾವಳಿ (ಜೊವಳಿ) ಪ್ರದೇಶವನ್ನು ವಶಪಡಿಸಿಕೊಂಡು ಇಡೀ ಮಾವಲ ಪ್ರದೇಶದ ಮೇಲೆ ತಮ್ಮ ಅಧಿಪತ್ಯವನ್ನು ಸ್ಥಾಪಿಸಿದರು.', NULL, NULL)
ON CONFLICT (id) DO UPDATE SET
    node_id = EXCLUDED.node_id,
    subject = EXCLUDED.subject,
    subject_kannada = EXCLUDED.subject_kannada,
    domain = EXCLUDED.domain,
    domain_kannada = EXCLUDED.domain_kannada,
    sub_topic = EXCLUDED.sub_topic,
    sub_topic_kannada = EXCLUDED.sub_topic_kannada,
    difficulty = EXCLUDED.difficulty,
    tags = EXCLUDED.tags,
    question_english = EXCLUDED.question_english,
    question_kannada = EXCLUDED.question_kannada,
    option_1_english = EXCLUDED.option_1_english,
    option_2_english = EXCLUDED.option_2_english,
    option_3_english = EXCLUDED.option_3_english,
    option_4_english = EXCLUDED.option_4_english,
    option_1_kannada = EXCLUDED.option_1_kannada,
    option_2_kannada = EXCLUDED.option_2_kannada,
    option_3_kannada = EXCLUDED.option_3_kannada,
    option_4_kannada = EXCLUDED.option_4_kannada,
    key_answer = EXCLUDED.key_answer,
    explanation_english = EXCLUDED.explanation_english,
    explanation_kannada = EXCLUDED.explanation_kannada,
    image_url = EXCLUDED.image_url,
    table_data = EXCLUDED.table_data;

INSERT INTO public.pc_pyq (
    id, question_number, year, month, paper, paper_code, exam_id, node_id,
    subject, subject_kannada, domain, domain_kannada, sub_topic, sub_topic_kannada,
    difficulty, tags, passage_english, passage_kannada, question_english, question_kannada,
    option_1_english, option_2_english, option_3_english, option_4_english,
    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,
    key_answer, explanation_english, explanation_kannada, image_url, table_data
) VALUES
    ('pc-hk-2026-q26', 26, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.history_of_karnataka.vijayanagara_empire_nayaka_kingdoms.post-vijayanagara_nayaka_kingdoms', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Keladi Nayakas & Shivappa Nayaka''s Revenue Settlement (Sist System)', 'ಕೆಳದಿ ನಾಯಕರು ಮತ್ತು ಶಿವಪ್ಪ ನಾಯಕರ ಕಂದಾಯ ಪದ್ಧತಿ (ಶಿಸ್ತು ವ್ಯವಸ್ಥೆ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Karnataka History', 'Keladi Nayakas', 'Revenue Administration', 'History']::TEXT[], '', '', 'Bidanuru King Shivappanayaka''s revenue settlement was popularly known as', 'ಬಿದನೂರು ದೊರೆ ಶಿವಪ್ಪ ನಾಯಕರ ಪ್ರಸಿದ್ಧ ಕಂದಾಯ ಪದ್ಧತಿಯನ್ನು ಹೀಗೆ ಕರೆಯುತ್ತಿದ್ದರು', 'Shistu', 'Pogadi', 'Kappa', 'Kandaya', 'ಶಿಸ್ತು', 'ಪೊಗದಿ', 'ಕಪ್ಪ', 'ಕಂದಾಯ', '1', 'Correct Answer: (1)

Explanation:
Shivappa Nayaka of Keladi (Bidanuru) introduced a land revenue settlement known as ''Shivappa Nayaka''s Shistu'' (or simply ''Shistu''). Under this system, lands were categorized based on soil fertility, water source, and crop yield, establishing a standard tax assessment.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಕೆಳದಿ (ಬಿದನೂರು) ಸಂಸ್ಥಾನದ ಪ್ರಸಿದ್ಧ ದೊರೆ ಶಿವಪ್ಪ ನಾಯಕರು ಜಾರಿಗೆ ತಂದ ವೈಜ್ಞಾನಿಕ ಕಂದಾಯ ವ್ಯವಸ್ಥೆಯನ್ನು ''ಶಿವಪ್ಪ ನಾಯಕನ ಶಿಸ್ತು'' (ಅಥವಾ ಶಿಸ್ತು ಪದ್ಧತಿ) ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ. ಭೂಮಿಯ ಫಲವತ್ತತೆ ಮತ್ತು ಇಳುವರಿಯ ಆಧಾರದ ಮೇಲೆ ಕಂದಾಯವನ್ನು ನಿಗದಿಪಡಿಸಲಾಗುತ್ತಿತ್ತು.', NULL, NULL),
    ('pc-hk-2026-q27', 27, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.union_executive_state_executive.union_executive', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Union Executive & State Executive', 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ', 'Chronological Succession of the Presidents of India', 'ಭಾರತದ ರಾಷ್ಟ್ರಪತಿಗಳ ಕಾಲಾನುಕ್ರಮದ ಅಧಿಕಾರಾವಧಿ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Polity', 'Presidents of India', 'Chronology', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Arrange the following Presidents in chronological order :
(a) Pranab Mukherjee
(b) Ram Nath Kovind
(c) Dr. A.P.J. Abdul Kalam
(d) Pratibha Patil', 'ಈ ಕೆಳಗಿನ ರಾಷ್ಟ್ರಪತಿಗಳನ್ನು ಕಾಲಾನುಕ್ರಮದಲ್ಲಿ ಜೋಡಿಸಿ.
(a) ಪ್ರಣಬ್ ಮುಖರ್ಜಿ
(b) ರಾಮ್ ನಾಥ್ ಕೋವಿಂದ್
(c) ಡಾ. ಎ.ಪಿ.ಜೆ. ಅಬ್ದುಲ್ ಕಲಾಂ
(d) ಪ್ರತಿಭಾ ಪಾಟೀಲ್', '(a), (b), (c), (d)', '(a), (c), (d), (b)', '(c), (a), (b), (d)', '(c), (d), (a), (b)', '(a), (b), (c), (d)', '(a), (c), (d), (b)', '(c), (a), (b), (d)', '(c), (d), (a), (b)', '4', 'Correct Answer: (4)

Explanation:
The tenure of the Presidents:
• (c) Dr. A.P.J. Abdul Kalam: 2002 – 2007
• (d) Pratibha Patil: 2007 – 2012
• (a) Pranab Mukherjee: 2012 – 2017
• (b) Ram Nath Kovind: 2017 – 2022

Hence, the correct chronological order is (c), (d), (a), (b).', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ಭಾರತದ ರಾಷ್ಟ್ರಪತಿಗಳ ಅಧಿಕಾರಾವಧಿ:
• (c) ಡಾ. ಎ.ಪಿ.ಜೆ. ಅಬ್ದುಲ್ ಕಲಾಂ: 2002 – 2007
• (d) ಪ್ರತಿಭಾ ಪಾಟೀಲ್: 2007 – 2012
• (a) ಪ್ರಣಬ್ ಮುಖರ್ಜಿ: 2012 – 2017
• (b) ರಾಮ್ ನಾಥ್ ಕೋವಿಂದ್: 2017 – 2022

ಆದ್ದರಿಂದ ಸರಿಯಾದ ಕಾಲಾನುಕ್ರಮ: (c), (d), (a), (b).', NULL, NULL),
    ('pc-hk-2026-q28', 28, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution.government_of_india_acts', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Historical Background & Making of the Constitution', 'ಐತಿಹಾಸಿಕ ಹಿನ್ನೆಲೆ ಮತ್ತು ಸಂವಿಧಾನ ರಚನೆ', 'Government of India Act 1919 (Montagu-Chelmsford Reforms & Bicameralism)', '1919 ರ ಭಾರತ ಸರ್ಕಾರ ಕಾಯ್ದೆ (ಮಾಂಟೆಗು-ಚೆಮ್ಸ್‌ಫರ್ಡ್ ಸುಧಾರಣೆಗಳು ಮತ್ತು ದ್ವಿಸದನ ಶಾಸಕಾಂಗ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Constitutional Development', 'Government of India Act 1919', 'Indian Polity', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Bicameralism was introduced for the first time in pre-independent India by the -', 'ಸ್ವಾತಂತ್ರ್ಯಪೂರ್ವ ಭಾರತದಲ್ಲಿ ಮೊದಲ ಬಾರಿಗೆ ದ್ವಿಸದನ ಪದ್ಧತಿಯನ್ನು ಪರಿಚಯಿಸಿದ್ದು ಯಾವುದರ ಮೂಲಕ ?', 'Indian Councils Act, 1909', 'Government of India Act, 1919', 'Government of India Act, 1935', 'Indian Councils Act, 1861', 'ಭಾರತ ಕೌನ್ಸಿಲ್ ಕಾಯ್ದೆ, 1909', 'ಭಾರತ ಸರ್ಕಾರದ ಕಾಯ್ದೆ, 1919', 'ಭಾರತ ಸರ್ಕಾರದ ಕಾಯ್ದೆ, 1935', 'ಭಾರತ ಕೌನ್ಸಿಲ್ ಕಾಯ್ದೆ, 1861', '2', 'Correct Answer: (2)

Explanation:
The Government of India Act, 1919 introduced bicameralism for the first time at the central level in British India, replacing the Indian Legislative Council with a bicameral legislature consisting of the Council of State and the Legislative Assembly.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
1919 ರ ಭಾರತ ಸರ್ಕಾರದ ಕಾಯ್ದೆಯು (ಮಾಂಟೆಗು-ಚೆಮ್ಸ್‌ಫರ್ಡ್ ಸುಧಾರಣೆಗಳು) ಕೇಂದ್ರ ಮಟ್ಟದಲ್ಲಿ ಮೊದಲ ಬಾರಿಗೆ ದ್ವಿಸದನ ಶಾಸಕಾಂಗ ಪದ್ಧತಿಯನ್ನು ಪರಿಚಯಿಸಿತು. ಇದರಲ್ಲಿ ಕೌನ್ಸಿಲ್ ಆಫ್ ಸ್ಟೇಟ್ (ಮೇಲ್ಮನೆ) ಮತ್ತು ಲೆಜಿಸ್ಲೇಟಿವ್ ಅಸೆಂಬ್ಲಿ (ಕೆಳಮನೆ) ಸೇರಿದ್ದವು.', NULL, NULL),
    ('pc-hk-2026-q29', 29, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.world_history', 'History', 'ಇತಿಹಾಸ', 'World History', 'ವಿಶ್ವ ಇತಿಹಾಸ', 'Classical Greek Philosophy & Literary Works of Plato', 'ಪ್ರಾಚೀನ ಗ್ರೀಕ್ ತತ್ವಶಾಸ್ತ್ರ ಮತ್ತು ಪ್ಲೇಟೋ ಅವರ ಸಾಹಿತ್ಯ ಕೃತಿಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'World History', 'Political Thought', 'Literature', 'History']::TEXT[], '', '', 'Which of the following book is not written by Plato?', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವ ಕೃತಿ ಪ್ಲೇಟೋನಿಂದ ರಚನೆಗೊಂಡಿಲ್ಲ ?', 'The Republic', 'Dialogues', 'The Laws', 'The Politics', 'ದ ರಿಪಬ್ಲಿಕ್', 'ಡಯಲಾಗ್ಸ್', 'ದ ಲಾಸ್ (The Laws)', 'ದ ಪಾಲಿಟಿಕ್ಸ್', '4', 'Correct Answer: (4)

Explanation:
''The Republic'', ''The Laws'', and ''Dialogues'' are works composed by the Greek philosopher Plato. ''The Politics'' was written by his disciple Aristotle.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
''ದ ರಿಪಬ್ಲಿಕ್'', ''ಡಯಲಾಗ್ಸ್'' ಮತ್ತು ''ದ ಲಾಸ್'' ಕೃತಿಗಳನ್ನು ಗ್ರೀಕ್ ತತ್ವಜ್ಞಾನಿ ಪ್ಲೇಟೋ ರಚಿಸಿದ್ದಾರೆ. ''ದ ಪಾಲಿಟಿಕ್ಸ್'' ಕೃತಿಯನ್ನು ಪ್ಲೇಟೋನ ಶಿಷ್ಯ ಅರಿಸ್ಟಾಟಲ್ ರಚಿಸಿದ್ದಾರೆ.', NULL, NULL),
    ('pc-hk-2026-q30', 30, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.medieval_india.mughal_empire.early_mughals_expansion', 'History', 'ಇತಿಹಾಸ', 'Medieval India', 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ', 'First Battle of Panipat (1526) & Babur''s Tulugama Military Flanking Strategy', 'ಮೊದಲ ಪಾಣಿಪತ್ ಕದನ (1526) ಮತ್ತು ಬಾಬರನ ತುಳುಘಮಾ ಯುದ್ಧ ತಂತ್ರ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Medieval Indian History', 'Mughal Empire', 'Babur', 'History']::TEXT[], '', '', 'The "Tulugama" system means', '“ತುಳುಗಮ” ವ್ಯವಸ್ಥೆ ಎಂದರೆ', 'The administrative system introduced by Babur.', 'The land revenue system of Babur.', 'The religious system of Babur.', 'The scientific war strategy of Babur.', 'ಬಾಬರ್ ಪರಿಚಯಿಸಿದ ಆಡಳಿತ ವ್ಯವಸ್ಥೆ', 'ಬಾಬರನ ಭೂ ಕಂದಾಯ ವ್ಯವಸ್ಥೆ', 'ಬಾಬರನ ಧಾರ್ಮಿಕ ವ್ಯವಸ್ಥೆ', 'ಬಾಬರನ ವೈಜ್ಞಾನಿಕ ಯುದ್ಧ ತಂತ್ರ ವಿಧಾನ', '4', 'Correct Answer: (4)

Explanation:
''Tulughama'' (Tulugama) was a warfare tactic employed by Babur in battles like Panipat (1526) and Khanwa (1527), involving the division of the army into flanking units that encircled and attacked the enemy from the flanks and rear.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
''ತುಳುಗಮ'' ಎಂಬುದು ಬಾಬರನು ಮೊದಲ ಪಾಣಿಪತ್ (1526) ಮತ್ತು ಖಾನ್ವಾ ಕದನಗಳಲ್ಲಿ ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಬಳಸಿದ ಸೈನ್ಯದ ಇಕ್ಕೆಲಗಳಿಂದ ಶತ್ರುಗಳನ್ನು ಸುತ್ತುವರಿದು ಹಿಂಬದಿಯಿಂದ ಆಕ್ರಮಣ ಮಾಡುವ ವೈಜ್ಞಾನಿಕ ಯುದ್ಧ ತಂತ್ರವಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q31', 31, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.ancient_india.mahajanapadas_magadhan_hegemony', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Sixteen Mahajanapadas & Buddhist Canon (Anguttara Nikaya)', 'ಹದಿನಾರು ಮಹಾಜನಪದಗಳು ಮತ್ತು ಬೌದ್ಧ ಸಾಹಿತ್ಯ (ಅಂಗುತ್ತರ ನಿಕಾಯ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Ancient Indian History', 'Mahajanapadas', 'Buddhist Literature', 'History']::TEXT[], '', '', 'Which Buddhist literature gives information about Sixteen or Sodasha Mahajanapadas ?', 'ಯಾವ ಬೌದ್ಧ ಸಾಹಿತ್ಯವು ಹದಿನಾರು ಅಥವಾ ಷೋಡಶ ಮಹಾಜನಪದಗಳ ಬಗ್ಗೆ ಮಾಹಿತಿ ನೀಡುತ್ತದೆ ?', 'Tripitakas', 'Anguttara-Nikaya', 'Khuddaka-Nikaya', 'Digha-Nikaya', 'ತ್ರಿಪಿಟಕಗಳು', 'ಅಂಗುತ್ತರ-ನಿಕಾಯ', 'ಖುದ್ದಕ-ನಿಕಾಯ', 'ದಿಘಾ-ನಿಕಾಯ', '2', 'Correct Answer: (2)

Explanation:
The ''Anguttara Nikaya'' of the Sutta Pitaka provides the standard list of the 16 Mahajanapadas (Sodasha Mahajanapadas) that existed in northern India during the 6th century BCE.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಬೌದ್ಧ ಧರ್ಮದ ಸುತ್ತಪಿಟಕದ ''ಅಂಗುತ್ತರ ನಿಕಾಯ'' ಎಂಬ ಗ್ರಂಥವು ಕ್ರಿ.ಪೂ. 6ನೇ ಶತಮಾನದಲ್ಲಿದ್ದ 16 ಪ್ರಮುಖ ಮಹಾಜನಪದಗಳ (ಷೋಡಶ ಮಹಾಜನಪದಗಳು) ಪಟ್ಟಿಯನ್ನು ಮತ್ತು ವಿವರಣೆಯನ್ನು ನೀಡುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q32', 32, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.ancient_india.south_indian_kingdoms', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Satavahana Dynasty Rulers & Chronological Succession', 'ಶಾತವಾಹನ ರಾಜವಂಶದ ಅರಸರು ಮತ್ತು ಕಾಲಾನುಕ್ರಮ', 'hard', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Ancient Indian History', 'Satavahanas', 'Chronology', 'History']::TEXT[], '', '', 'Arrange the following Satavahana rulers in the chronological order :
a. Gautamiputra Satakarni
b. Satakarni - I
c. Yajna Sri Satakarni
d. Vasishthiputra Sri Satakarni
Choose the answer from the options given below :', 'ಈ ಕೆಳಕಂಡ ಶಾತವಾಹನ ಅರಸರನ್ನು ಕಾಲಾನುಕ್ರಮದಲ್ಲಿ ಬರೆಯಿರಿ.
a. ಗೌತಮೀಪುತ್ರ ಶಾತಕರ್ಣಿ
b. ಶಾತಕರ್ಣಿ-I
c. ಯಜ್ಞಶ್ರೀ ಶಾತಕರ್ಣಿ
d. ವಶಿಷ್ಠಿಪುತ್ರ ಶ್ರೀ ಶಾತಕರ್ಣಿ
ಕೆಳಕಂಡ ಆಯ್ಕೆಗಳಿಂದ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.', 'a, b, c, d', 'b, c, a, d', 'a, c, d, b', 'b, a, d, c', 'a, b, c, d', 'b, c, a, d', 'a, c, d, b', 'b, a, d, c', '4', 'Correct Answer: (4)

Explanation:
The chronological order of the Satavahana rulers:
1. b. Satakarni I (c. 1st/2nd century BCE)
2. a. Gautamiputra Satakarni (c. 106 – 130 CE)
3. d. Vasishthiputra Sri Satakarni (mid-2nd century CE)
4. c. Yajna Sri Satakarni (late 2nd century CE)

Thus, the correct sequence is b, a, d, c.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ಶಾತವಾಹನ ಅರಸರ ಆಳ್ವಿಕೆಯ ಸರಿಯಾದ ಕಾಲಾನುಕ್ರಮ:
1. b. ಶಾತಕರ್ಣಿ-I (ಆರಂಭಿಕ ದೊರೆ)
2. a. ಗೌತಮೀಪುತ್ರ ಶಾತಕರ್ಣಿ (ಕ್ರಿ.ಶ. 106 – 130)
3. d. ವಶಿಷ್ಠಿಪುತ್ರ ಶ್ರೀ ಶಾತಕರ್ಣಿ (ಕ್ರಿ.ಶ. 2ನೇ ಶತಮಾನದ ಮಧ್ಯಭಾಗ)
4. c. ಯಜ್ಞಶ್ರೀ ಶಾತಕರ್ಣಿ (ಕ್ರಿ.ಶ. 2ನೇ ಶತಮಾನದ ಕೊನೆಯ ಭಾಗ)

ಆದ್ದರಿಂದ ಸರಿಯಾದ ಕ್ರಮ: b, a, d, c.', NULL, NULL),
    ('pc-hk-2026-q33', 33, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.history_of_karnataka.ancient_dynasties_of_karnataka.western_gangas_of_talakad', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Western Ganga King Durvinita & Kavirajamarga Reference as Kannada Author', 'ಪಶ್ಚಿಮ ಗಂಗ ದೊರೆ ದುರ್ವಿನೀತ ಮತ್ತು ಕವಿರಾಜಮಾರ್ಗದಲ್ಲಿ ಕನ್ನಡ ಕವಿಯೆಂದು ಉಲ್ಲೇಖ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Karnataka History', 'Western Gangas', 'Kannada Literature', 'History']::TEXT[], '', '', 'Which work has referred Ganga ruler Durvinitha as a Kannada author ?', 'ಗಂಗರ ದೊರೆ ದುರ್ವಿನೀತನು ಕನ್ನಡ ಲೇಖಕನೆಂದು ಯಾವ ಕೃತಿ ತಿಳಿಸಿದೆ ?', 'Chavundaraya Purana', 'Kavirajamarga', 'Gajashastra', 'Gajashtaka', 'ಚಾವುಂಡರಾಯ ಪುರಾಣ', 'ಕವಿರಾಜಮಾರ್ಗ', 'ಗಜಶಾಸ್ತ್ರ', 'ಗಜಾಷ್ಟಕ', '2', 'Correct Answer: (2)

Explanation:
''Kavirajamarga'' (c. 850 CE), the earliest extant Kannada work on poetics, mentions Western Ganga king Durvinita as an eminent early master of Kannada prose.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಶ್ರೀವಿಜಯ/ಅಮೋಘವರ್ಷ ನೃಪತುಂಗನ ಆಸ್ಥಾನದ ಕೃತಿಯಾದ ''ಕವಿರಾಜಮಾರ್ಗ''ದಲ್ಲಿ ಗಂಗರ ಪ್ರಸಿದ್ಧ ದೊರೆ ದುರ್ವಿನೀತನನ್ನು ಪ್ರಾಚೀನ ಕನ್ನಡ ಗದ್ಯ ಲೇಖಕನೆಂದು ಹೆಸರಿಸಲಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q34', 34, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.modern_india.british_expansionist_policies_administrative_machinery.administrative_judicial_police_systems', 'History', 'ಇತಿಹಾಸ', 'Modern India', 'ಆಧುನಿಕ ಭಾರತ', 'Lord Cornwallis Police Reforms & Abolition of Zamindari Thanadari (1791)', 'ಲಾರ್ಡ್ ಕಾರ್ನ್‌ವಾಲಿಸ್‌ನ ಪೊಲೀಸ್ ಸುಧಾರಣೆಗಳು ಮತ್ತು ಜಮೀನ್ದಾರರ ಪೊಲೀಸ್ ಅಧಿಕಾರ ರದ್ದತಿ (1791)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Modern Indian History', 'Police Reforms', 'Lord Cornwallis', 'History']::TEXT[], '', '', 'Who took away the police powers from the Zamindars and provided a new setup for the police administration in British India?', 'ಬ್ರಿಟೀಷ್ ಭಾರತದಲ್ಲಿ ಜಮೀನ್ದಾರರ ಕೈಲಿದ್ದ ಪೊಲೀಸ್ ಅಧಿಕಾರವನ್ನು ರದ್ದುಗೊಳಿಸಿ, ಪೊಲೀಸ್ ಆಡಳಿತಕ್ಕೆ ಹೊಸ ರೂಪವನ್ನು ನೀಡಿದವರು ಯಾರು ?', 'Lord Cornwallis', 'Lord Curzon', 'Lord Wellesley', 'Lord Warren Hastings', 'ಲಾರ್ಡ್ ಕಾರ್ನವಾಲೀಸ್', 'ಲಾರ್ಡ್ ಕರ್ಜನ್', 'ಲಾರ್ಡ್ ವೆಲ್ಲೆಸ್ಲಿ', 'ಲಾರ್ಡ್ ವಾರನ್ ಹೇಸ್ಟಿಂಗ್ಸ್', '1', 'Correct Answer: (1)

Explanation:
Lord Cornwallis reformed the police administration in 1791 by relieving Zamindars of their police functions and creating regular police circles (thanas) headed by a Daroga under district authorities.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
1791 ರಲ್ಲಿ ಲಾರ್ಡ್ ಕಾರ್ನ್‌ವಾಲೀಸ್ ಜಮೀನ್ದಾರರ ಬಳಿಯಿದ್ದ ಪೊಲೀಸ್ ಅಧಿಕಾರವನ್ನು ಹಿಂಪಡೆದು, ಪ್ರತಿಯೊಂದು ಜಿಲ್ಲೆಯನ್ನು ಠಾಣೆಗಳನ್ನಾಗಿ ವಿಭಾಗಿಸಿ ''ದರೋಗಾ'' ಎಂಬ ಅಧಿಕಾರಿಯ ನೇತೃತ್ವದಲ್ಲಿ ವ್ಯವಸ್ಥಿತ ಪೊಲೀಸ್ ಆಡಳಿತವನ್ನು ರೂಪಿಸಿದನು.', NULL, NULL),
    ('pc-hk-2026-q35', 35, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.modern_india.advent_of_european_traders_anglo-french_rivalry.european_trading_companies', 'History', 'ಇತಿಹಾಸ', 'Modern India', 'ಆಧುನಿಕ ಭಾರತ', 'Advent of Europeans & Portuguese Governors in India (Almeida, Albuquerque, Nino da Cunha)', 'ಯುರೋಪಿಯನ್ನರ ಆಗಮನ ಮತ್ತು ಭಾರತದಲ್ಲಿ ಪೋರ್ಚುಗೀಸ್ ಗವರ್ನರ್‌ಗಳು (ಅಲ್ಮೇಡಾ, ಅಲ್ಬುಕರ್ಕ್, ನಿನೊ ಡ ಕುನ್ಹಾ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Modern Indian History', 'European Advent', 'Portuguese', 'History']::TEXT[], '', '', 'Match List - I with List - II and choose the correct answer:
List - I
(a) De Almeida
(b) Albuquerque
(c) Vasco da Gama
(d) Bartholomeu Diaz
(e) Robert Clive

List - II
(i) Discovered sea route to India
(ii) Dual system of Government for the Bengal
(iii) Attack on Goa in 1510
(iv) Blue water policy
(v) Discovered Cape of Good Hope', 'ಪಟ್ಟಿ-I ನ್ನು ಪಟ್ಟಿ -II ರ ಜೊತೆ ಹೊಂದಿಸಿ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.
ಪಟ್ಟಿ-I
(a) ಡಿ ಆಲ್ಮೇಡಾ
(b) ಆಲ್ಬುಕರ್ಕ್
(c) ವಾಸ್ಕೋಡಗಾಮಾ
(d) ಬಾರ್ಥಲೋಮಿಯೊ ಡಯಾಜ್
(e) ರಾಬರ್ಟ್ ಕ್ಲೈವ್

ಪಟ್ಟಿ-II
(i) ಭಾರತಕ್ಕೆ ಜಲಮಾರ್ಗದ ಶೋಧನೆ
(ii) ಬಂಗಾಳದಲ್ಲಿ ದ್ವಿಸರ್ಕಾರ ಆಡಳಿತ ವ್ಯವಸ್ಥೆ
(iii) 1510 ರಲ್ಲಿ ಗೋವಾ ಮೇಲಿನ ಆಕ್ರಮಣ
(iv) ನೀಲಿ ನೀರಿನ ನೀತಿ
(v) ಕೇಪ್ ಆಫ್ ಗುಡ್ ಹೋಪ್ ಶೋಧನೆ', '(a)-(iv), (b)-(iii), (c)-(i), (d)-(v), (e)-(ii)', '(a)-(v), (b)-(iv), (c)-(ii), (d)-(iii), (e)-(i)', '(a)-(iv), (b)-(v), (c)-(iii), (d)-(i), (e)-(ii)', '(a)-(i), (b)-(ii), (c)-(iii), (d)-(iv), (e)-(v)', '(a)-(iv), (b)-(iii), (c)-(i), (d)-(v), (e)-(ii)', '(a)-(v), (b)-(iv), (c)-(ii), (d)-(iii), (e)-(i)', '(a)-(iv), (b)-(v), (c)-(iii), (d)-(i), (e)-(ii)', '(a)-(i), (b)-(ii), (c)-(iii), (d)-(iv), (e)-(v)', '1', 'Correct Answer: (1)

Explanation:
• Francisco de Almeida: Blue Water Policy (iv)
• Afonso de Albuquerque: Conquered Goa in 1510 (iii)
• Vasco da Gama: Sea route to India in 1498 (i)
• Bartolomeu Dias: Discovered Cape of Good Hope in 1488 (v)
• Robert Clive: Dual government in Bengal in 1765 (ii)

Correct matching code is: (a)-(iv), (b)-(iii), (c)-(i), (d)-(v), (e)-(ii).', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
• ಡಿ ಆಲ್ಮೇಡಾ: ನೀಲಿ ನೀರಿನ ನೀತಿ (iv)
• ಆಲ್ಬುಕರ್ಕ್: 1510 ರಲ್ಲಿ ಗೋವಾವನ್ನು ವಶಪಡಿಸಿಕೊಂಡದ್ದು (iii)
• ವಾಸ್ಕೋಡಗಾಮಾ: ಭಾರತಕ್ಕೆ ಜಲಮಾರ್ಗ ಶೋಧಿಸಿದ್ದು (1498) (i)
• ಬಾರ್ಥಲೋಮಿಯೊ ಡಯಾಜ್: ಕೇಪ್ ಆಫ್ ಗುಡ್ ಹೋಪ್ ಶೋಧನೆ (1488) (v)
• ರಾಬರ್ಟ್ ಕ್ಲೈವ್: ಬಂಗಾಳದಲ್ಲಿ ದ್ವಿಸರ್ಕಾರ ಪದ್ಧತಿ (1765) (ii)

ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: (a)-(iv), (b)-(iii), (c)-(i), (d)-(v), (e)-(ii).', NULL, NULL),
    ('pc-hk-2026-q36', 36, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.ancient_india.gupta_empire', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Gupta Empire Numismatics & Samudragupta''s Gold Coins (Archer, Battle-axe, Lyrist, Ashvamedha)', 'ಗುಪ್ತ ಸಾಮ್ರಾಜ್ಯದ ನಾಣ್ಯಶಾಸ್ತ್ರ ಮತ್ತು ಸಮುದ್ರಗುಪ್ತನ ಚಿನ್ನದ ನಾಣ್ಯಗಳು (ಬಿಲ್ಲುಗಾರ, ಪರಶು, ವೀಣಾವಾದಕ, ಅಶ್ವಮೇಧ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Ancient Indian History', 'Gupta Empire', 'Numismatics', 'History']::TEXT[], '', '', 'Which of the following coins is not associated with Samudragupta ?', 'ಈ ಕೆಳಗಿನ ನಾಣ್ಯಗಳಲ್ಲಿ ಯಾವುದು ಸಮುದ್ರಗುಪ್ತನಿಗೆ ಸಂಬಂಧಿಸಿಲ್ಲ ?', 'Veenapani Type Coin', 'Lion Type Coin', 'Archer Type Coin', 'Ashwamedha Type Coin', 'ವೀಣಾಪಾಣಿ ಮಾದರಿ ನಾಣ್ಯ', 'ಸಿಂಹ ಮಾದರಿ ನಾಣ್ಯ', 'ಧನಸ್ಸು ಮಾದರಿ ನಾಣ್ಯ', 'ಅಶ್ವಮೇಧ ಮಾದರಿ ನಾಣ್ಯ', '2', 'Correct Answer: (2)

Explanation:
Samudragupta issued coins of Archer type, Ashwamedha type, and Veenapani (Lyrist) type. The ''Lion-slayer'' type gold coin was introduced by his successor, Chandragupta II (Vikramaditya).', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಸಮುದ್ರಗುಪ್ತನು ವೀಣಾಪಾಣಿ, ಅಶ್ವಮೇಧ, ಧನುರ್ಧಾರಿ (Archer), ಕೊಡಲಿ ಮುಂತಾದ ಮಾದರಿಯ ನಾಣ್ಯಗಳನ್ನು ಹೊರಡಿಸಿದ್ದನು. ''ಸಿಂಹ ಮಾದರಿ ನಾಣ್ಯ''ವನ್ನು (Lion slayer type) ಅವನ ಮಗ ಹಾಗೂ ಉತ್ತರಾಧಿಕಾರಿಯಾದ ಎರಡನೇ ಚಂದ್ರಗುಪ್ತ (ವಿಕ್ರಮಾದಿತ್ಯ) ಹೊರಡಿಸಿದನು.', NULL, NULL),
    ('pc-hk-2026-q37', 37, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.history_of_karnataka.ancient_dynasties_of_karnataka.western_gangas_of_talakad', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Chronological Capital Cities of Western Gangas (Kuvalala, Manyapura, Talakadu)', 'ಪಶ್ಚಿಮ ಗಂಗರ ಕಾಲಾನುಕ್ರಮದ ರಾಜಧಾನಿಗಳು (ಕುವಲಾಲ, ಮಾನ್ಯಪುರ, ತಲಕಾಡು)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Karnataka History', 'Western Gangas', 'Capitals', 'History']::TEXT[], '', '', 'Arrange the capital cities of the Gangas in their correct chronological order :
a. Talakadu
b. Manne
c. Kolar
Codes:', 'ಗಂಗರ ರಾಜಧಾನಿಗಳನ್ನು ಅವುಗಳ ಸರಿಯಾದ ಕಾಲಾನುಕ್ರಮದಲ್ಲಿ ಜೋಡಿಸಿ.
a. ತಲಕಾಡು
b. ಮಣ್ಣೆ
c. ಕೋಲಾರ
ಸಂಕೇತಗಳು :', 'a, c, b', 'c, b, a', 'c, a, b', 'a, b, c', 'a, c, b', 'c, b, a', 'c, a, b', 'a, b, c', '3', 'Correct Answer: (3)

Explanation:
The Western Gangas established their capitals in the following chronological sequence:
1. c. Kolar (Kuvalala) — Founding capital
2. a. Talakadu (Talavanapura) — Capital shifted during Harivarma''s reign
3. b. Manne (Manyapura) — Capital shifted during Sripurusha''s reign

Thus, the correct sequence is c, a, b.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಪಶ್ಚಿಮ ಗಂಗರ ರಾಜಧಾನಿಗಳ ಕಾಲಾನುಕ್ರಮ:
1. c. ಕೋಲಾರ (ಕುವಲಾಳ) — ಸ್ಥಾಪಕ ಕೊಂಗಣಿವರ್ಮನ ಆರಂಭಿಕ ರಾಜಧಾನಿ
2. a. ತಲಕಾಡು — ಹರಿವರ್ಮನ ಕಾಲದಲ್ಲಿ ಸ್ಥಳಾಂತರಗೊಂಡ ರಾಜಧಾನಿ
3. b. ಮಣ್ಣೆ (ಮಾನ್ಯಪುರ) — ಶ್ರೀಪುರುಷನ ಕಾಲದಲ್ಲಿ ರಾಜಧಾನಿಯಾಯಿತು

ಆದ್ದರಿಂದ ಸರಿಯಾದ ಕ್ರಮ: c, a, b.', NULL, NULL),
    ('pc-hk-2026-q38', 38, 2026, 'September', 1, 'hk', 'ksp-pc', 'art_culture_heritage.performing_arts', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Performing Arts', 'ಪ್ರದರ್ಶನ ಕಲೆಗಳು', 'Kannada Professional Theatre & Gubbi Veeranna (''Natakaratna'') / Shakespeare of Karnataka (Kandagal Hanumantaraya)', 'ಕನ್ನಡ ವೃತ್ತಿ ರಂಗಭೂಮಿ ಮತ್ತು ಕಂದಗಲ್ ಹನುಮಂತರಾಯ / ಗುಬ್ಬಿ ವೀರಣ್ಣ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Art and Culture', 'Indian Theatre', 'Personalities', 'Art, Culture & Heritage']::TEXT[], '', '', 'Through his great contributions to Theatre, who is popularly known as ''Shakespeare of India''?', 'ರಂಗಭೂಮಿಗೆ ಹೆಚ್ಚಿನ ಕೊಡುಗೆ ನೀಡಿ “ಭಾರತದ ಷೇಕ್ಸ್‌ಪಿಯರ್ ” ಎಂದು ಖ್ಯಾತರಾದವರು', 'Agha Hashar Kashmiri', 'Utpal Dutt', 'Balraj Sahni', 'Shombhu Mitra', 'ಆಘಾ ಹಶರ್ ಕಾಶ್ಮೀರಿ', 'ಉತ್ಪಲ್ ದತ್', 'ಬಲರಾಜ್ ಸಾಹ್ನಿ', 'ಶಂಭು ಮಿತ್ರ', '1', 'Correct Answer: (1)

Explanation:
Agha Hashar Kashmiri was an eminent Urdu dramatist and poet of Parsi theatre. Known for his dramatic adaptations of Shakespeare''s plays and his impact on early Indian theatre, he is referred to as the ''Shakespeare of India''.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಪಾರ್ಸಿ ಮತ್ತು ಉರ್ದು ರಂಗಭೂಮಿಗೆ ನೀಡಿದ ಅಪಾರ ಕೊಡುಗೆ ಹಾಗೂ ಷೇಕ್ಸ್‌ಪಿಯರ್‌ನ ಅನೇಕ ನಾಟಕಗಳನ್ನು ಭಾರತೀಯ ರಂಗಭೂಮಿಗೆ ಅಳವಡಿಸಿದ ಖ್ಯಾತಿಗಾಗಿ ಆಘಾ ಹಶರ್ ಕಾಶ್ಮೀರಿಯವರನ್ನು ''ಭಾರತದ ಷೇಕ್ಸ್‌ಪಿಯರ್'' ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q39', 39, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.modern_india.british_conquest_consolidation_of_india.british_conquest_of_bengal', 'History', 'ಇತಿಹಾಸ', 'Modern India', 'ಆಧುನಿಕ ಭಾರತ', 'Battle of Hooghly / Chinsurah (1759) & Decline of Dutch East India Company in India', 'ಹೂಗ್ಲಿ / ಚಿನ್ಸುರಾ ಕದನ (1759) ಮತ್ತು ಭಾರತದಲ್ಲಿ ಡಚ್ ಈಸ್ಟ್ ಇಂಡಿಯಾ ಕಂಪನಿಯ ಅವನತಿ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Modern Indian History', 'Battles', 'Dutch East India Company', 'History']::TEXT[], '', '', 'The Battle of Hooghly ended the power of ________ in India.', 'ಹೂಗ್ಲಿ ಕದನದಿಂದ ಭಾರತದಲ್ಲಿ ________ ರ ಅಧಿಕಾರ ಅಂತ್ಯಗೊಂಡಿತು.', 'English', 'French', 'Dutch', 'Portuguese', 'ಇಂಗ್ಲಿಷ್', 'ಫ್ರೆಂಚ್', 'ಡಚ್', 'ಪೋರ್ಚುಗೀಸ್', '3', 'Correct Answer: (3)

Explanation:
The Battle of Hooghly (also known as the Battle of Chinsurah or Biderra) was fought in November 1759 between British forces and the Dutch East India Company. The British victory eliminated Dutch colonial presence and ambitions in India.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
1759 ರಲ್ಲಿ ಬ್ರಿಟಿಷರು ಮತ್ತು ಡಚ್ಚರ ನಡುವೆ ನಡೆದ ಹೂಗ್ಲಿ ಕದನದಲ್ಲಿ (ಬಿದರ್ರಾ ಕದನ/ಚಿನ್ಸುರಾ ಕದನ) ಬ್ರಿಟಿಷರು ಡಚ್ಚರನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಸೋಲಿಸಿದರು. ಈ ಮೂಲಕ ಭಾರತದಲ್ಲಿ ಡಚ್ಚರ ರಾಜಕೀಯ ಅಧಿಕಾರವು ಅಂತ್ಯಗೊಂಡಿತು.', NULL, NULL),
    ('pc-hk-2026-q40', 40, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.indian_freedom_struggle.wwii_cripps_mission_quit_india_movement_ina.wartime_offers_deadlock', 'History', 'ಇತಿಹಾಸ', 'Indian Freedom Struggle', 'ಭಾರತೀಯ ಸ್ವಾತಂತ್ರ್ಯ ಸಂಗ್ರಾಮ', 'Individual Satyagraha (1940) Pioneers (Vinoba Bhave, Jawaharlal Nehru, Brahma Datt)', 'ವೈಯಕ್ತಿಕ ಸತ್ಯಾಗ್ರಹ (1940) ಸತ್ಯಾಗ್ರಹಿಗಳು (ವಿನೋಬಾ ಭಾವೆ, ಜವಾಹರಲಾಲ್ ನೆಹರು, ಬ್ರಹ್ಮದತ್ತ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Modern Indian History', 'Freedom Struggle', 'Individual Satyagraha', 'History']::TEXT[], '', '', 'Identify the Individual Satyagrahi/Satyagrahis in the following:
a. Mahadeva Desai
b. Jawaharlal Nehru
c. Vinobha Bhave
Choose the correct answer:', 'ಕೆಳಗಿನವರುಗಳಲ್ಲಿ ವೈಯಕ್ತಿಕ ಸತ್ಯಾಗ್ರಹಿ/ಸತ್ಯಾಗ್ರಹಿಗಳನ್ನು ಗುರುತಿಸಿ.
a. ಮಹಾದೇವ ದೇಸಾಯಿ
b. ಜವಾಹರಲಾಲ್ ನೆಹರು
c. ವಿನೋಬಾ ಭಾವೆ
ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆಯ್ಕೆ ಮಾಡಿ.', 'b only', 'c only', 'b and c', 'a and c', 'b ಮಾತ್ರ', 'c ಮಾತ್ರ', 'b ಮತ್ತು c', 'a ಮತ್ತು c', '3', 'Correct Answer: (3)

Explanation:
In the Individual Satyagraha launched by Mahatma Gandhi in October 1940, Acharya Vinoba Bhave was chosen as the first Satyagrahi and Jawaharlal Nehru was chosen as the second. Hence, both ''b and c'' are Individual Satyagrahis.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
1940 ರಲ್ಲಿ ಮಹಾತ್ಮ ಗಾಂಧೀಜಿಯವರು ಆರಂಭಿಸಿದ ವೈಯಕ್ತಿಕ ಸತ್ಯಾಗ್ರಹದಲ್ಲಿ ಆಚಾರ್ಯ ವಿನೋಬಾ ಭಾವೆ ಮೊದಲ ಸತ್ಯಾಗ್ರಹಿಯಾಗಿ ಮತ್ತು ಜವಾಹರಲಾಲ್ ನೆಹರು ಎರಡನೇ ಸತ್ಯಾಗ್ರಹಿಯಾಗಿ ಆಯ್ಕೆಯಾದರು. ಆದ್ದರಿಂದ ''b ಮತ್ತು c'' ಸರಿಯಾದ ಉತ್ತರ.', NULL, NULL),
    ('pc-hk-2026-q41', 41, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.ancient_india.religious_movements_buddhism', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Four Buddhist Councils, Royal Patrons & Venues (Rajgir, Vaishali, Pataliputra, Kashmir)', 'ನಾಲ್ಕು ಬೌದ್ಧ ಸಂಗೀತಿಗಳು, ಪೋಷಕ ರಾಜರು ಮತ್ತು ಸ್ಥಳಗಳು (ರಾಜಗೃಹ, ವೈಶಾಲಿ, ಪಾಟಲೀಪುತ್ರ, ಕಾಶ್ಮೀರ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Ancient Indian History', 'Buddhism', 'Buddhist Councils', 'History']::TEXT[], '', '', 'Match List - I with List - II and choose the correct answer:
List - I (Buddhist Councils)
(a) First Buddhist Council
(b) Second Buddhist Council
(c) Third Buddhist Council
(d) Fourth Buddhist Council

List - II (Decisions)
(i) Buddhism split into two sects
(ii) Effort for oneness in Buddha''s teachings
(iii) Dhamma Sangraha
(iv) Corrections of 10 elements', 'ಪಟ್ಟಿ-I ನ್ನು ಪಟ್ಟಿ-II ರ ಜೊತೆ ಹೊಂದಿಸಿ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.
ಪಟ್ಟಿ-I (ಬೌದ್ಧ ಸಮ್ಮೇಳನಗಳು / ಮಹಾಸಭೆಗಳು)
(a) ಮೊದಲನೇ ಬೌದ್ಧ ಮಹಾಸಭೆ
(b) ಎರಡನೇ ಬೌದ್ಧ ಮಹಾಸಭೆ
(c) ಮೂರನೇ ಬೌದ್ಧ ಮಹಾಸಭೆ
(d) ನಾಲ್ಕನೇ ಬೌದ್ಧ ಮಹಾಸಭೆ

ಪಟ್ಟಿ-II (ತೀರ್ಮಾನಗಳು)
(i) ಬೌದ್ಧ ಧರ್ಮವು 2 ಪಂಥಗಳಾಗಿ ವಿಭಾಗಗೊಂಡಿತು
(ii) ಬುದ್ಧನ ತತ್ವಗಳಲ್ಲಿ ಏಕತೆ ತರಲು ಪ್ರಯತ್ನ
(iii) ಧಮ್ಮ ಸಂಗ್ರಹ
(iv) 10 ಅಂಶಗಳ ತಿದ್ದುಪಡಿ', '(a)-(iv), (b)-(iii), (c)-(ii), (d)-(i)', '(a)-(iii), (b)-(iv), (c)-(ii), (d)-(i)', '(a)-(iii), (b)-(iv), (c)-(i), (d)-(ii)', '(a)-(iv), (b)-(iii), (c)-(i), (d)-(ii)', '(a)-(iv), (b)-(iii), (c)-(ii), (d)-(i)', '(a)-(iii), (b)-(iv), (c)-(ii), (d)-(i)', '(a)-(iii), (b)-(iv), (c)-(i), (d)-(ii)', '(a)-(iv), (b)-(iii), (c)-(i), (d)-(ii)', '2', 'Correct Answer: (2)

Explanation:
• First Council (Rajgir): Compilation of Sutta & Vinaya Pitaka / Dhamma Sangraha (iii)
• Second Council (Vaishali): Corrections/disputes over 10 points of monastic discipline (iv)
• Third Council (Pataliputra): Attempt to establish unity/oneness in Buddha''s teachings (ii)
• Fourth Council (Kashmir): Buddhism split into Hinayana and Mahayana (i)

Matching code: (a)-(iii), (b)-(iv), (c)-(ii), (d)-(i).', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
• ಮೊದಲನೇ ಬೌದ್ಧ ಮಹಾಸಭೆ: ಧಮ್ಮ ಸಂಗ್ರಹ (ಸುತ್ತ ಮತ್ತು ವಿನಯ ಪೀಠಕಗಳ ಸಂಕಲನ) (iii)
• ಎರಡನೇ ಬೌದ್ಧ ಮಹಾಸಭೆ: 10 ನಿಯಮಗಳ ವಿವಾದ ಹಾಗೂ ತಿದ್ದುಪಡಿ (iv)
• ಮೂರನೇ ಬೌದ್ಧ ಮಹಾಸಭೆ: ಬೌದ್ಧ ತತ್ವಗಳಲ್ಲಿ ಶುದ್ಧತೆ ಮತ್ತು ಏಕತೆ ತರಲು ಪ್ರಯತ್ನ (ii)
• ನಾಲ್ಕನೇ ಬೌದ್ಧ ಮಹಾಸಭೆ: ಬೌದ್ಧ ಧರ್ಮವು ಹೀನಯಾನ ಮತ್ತು ಮಹಾಯಾನ ಪಂಥಗಳಾಗಿ ವಿಭಜನೆಗೊಂಡಿತು (i)

ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: (a)-(iii), (b)-(iv), (c)-(ii), (d)-(i).', NULL, NULL),
    ('pc-hk-2026-q42', 42, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.ancient_india.vedic_age', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Rig Vedic Society & Administrative Terminology (Kula, Grama, Visha, Jana, Purohita)', 'ಋಗ್ವೇದ ಸಮಾಜ ಮತ್ತು ಆಡಳಿತಾತ್ಮಕ ಪರಿಕಲ್ಪನೆಗಳು (ಕುಲ, ಗ್ರಾಮ, ವಿಶ, ಜನ, ಪುರೋಹಿತ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Ancient Indian History', 'Vedic Period', 'Terminology', 'History']::TEXT[], '', '', 'How many of the following is/are correctly matched?
List - I (Vedic Name) | List - II (Cereal)
(a) Yava — Barley
(b) Vrihi — Paddy
(c) Godhuma — Wheat
(d) Tila — Sesamum', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಎಷ್ಟು ಜೋಡಿ/ಜೋಡಿಗಳು ಸರಿಯಾಗಿ ಹೊಂದಾಣಿಕೆ ಆಗಿದೆ/ಆಗಿವೆ ?
ಪಟ್ಟಿ-I (ವೈದಿಕ ಹೆಸರು) | ಪಟ್ಟಿ-II (ಧಾನ್ಯಗಳು)
(a) ಯವ — ಬಾರ್ಲಿ
(b) ವ್ರಿಹಿ — ಭತ್ತ
(c) ಗೋಧುಮ — ಗೋಧಿ
(d) ತಿಲ — ಎಳ್ಳು', 'Only Two', 'Only Three', 'All the Four', 'Only One', 'ಎರಡು ಮಾತ್ರ', 'ಮೂರು ಮಾತ್ರ', 'ಎಲ್ಲಾ ನಾಲ್ಕು', 'ಒಂದು ಮಾತ್ರ', '3', 'Correct Answer: (3)

Explanation:
In Vedic literature:
• Yava refers to Barley
• Vrihi refers to Rice/Paddy
• Godhuma refers to Wheat
• Tila refers to Sesamum

All four pairs are correctly matched.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ವೈದಿಕ ಕಾಲದ ಸಾಹಿತ್ಯದಲ್ಲಿ ಉಲ್ಲೇಖಿಸಲಾದ ಧಾನ್ಯಗಳ ಹೆಸರುಗಳು:
• ಯವ = ಬಾರ್ಲಿ
• ವ್ರಿಹಿ = ಭತ್ತ / ಅಕ್ಕಿ
• ಗೋಧುಮ = ಗೋಧಿ
• ತಿಲ = ಎಳ್ಳು

ನೀಡಲಾಗಿರುವ ಎಲ್ಲಾ ನಾಲ್ಕು ಜೋಡಿಗಳು ಸರಿಯಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q43', 43, 2026, 'September', 1, 'hk', 'ksp-pc', 'art_culture_heritage.martial_arts_traditional_sports_calendars', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Martial Arts, Traditional Sports & Calendars', 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು', 'Indigenous Traditional Martial Arts & First Mallakhamb World Championship (Mumbai 2019)', 'ಸ್ಥಳೀಯ ಸಾಂಪ್ರದಾಯಿಕ ಸಮರ ಕಲೆಗಳು ಮತ್ತು ಪ್ರಥಮ ಮಲ್ಲಕಂಬ ವಿಶ್ವ ಚಾಂಪಿಯನ್‌ಶಿಪ್ (ಮುಂಬೈ 2019)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Sports', 'Traditional Games', 'Mallakhamb', 'Art, Culture & Heritage']::TEXT[], '', '', 'When and where did the first Mallakamba World Championship take place ?', 'ಮೊದಲ ಮಲ್ಲಕಂಬ ವಿಶ್ವ ಚಾಂಪಿಯನ್ ಶಿಪ್ ಯಾವಾಗ ಮತ್ತು ಎಲ್ಲಿ ನಡೆಯಿತು ?', '2019, Mumbai', '2020, Bengaluru', '2018, Jaipur', '2016, Kolkata', '2019, ಮುಂಬೈ', '2020, ಬೆಂಗಳೂರು', '2018, ಜೈಪುರ', '2016, ಕೋಲ್ಕತ್ತಾ', '1', 'Correct Answer: (1)

Explanation:
The first Mallakhamb World Championship was held in February 2019 at Shivaji Park in Mumbai, Maharashtra, with athletes participating from over 15 countries.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಮೊಟ್ಟಮೊದಲ ಮಲ್ಲಕಂಬ ವಿಶ್ವ ಚಾಂಪಿಯನ್‌ಶಿಪ್ 2019 ರ ಫೆಬ್ರವರಿಯಲ್ಲಿ ಮಹಾರಾಷ್ಟ್ರದ ಮುಂಬೈನ ಶಿವಾಜಿ ಪಾರ್ಕ್‌ನಲ್ಲಿ ನಡೆಯಿತು.', NULL, NULL),
    ('pc-hk-2026-q44', 44, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Sports Personalities & Famous Nicknames in Indian Cricket', 'ಭಾರತೀಯ ಕ್ರಿಕೆಟ್‌ನ ಪ್ರಸಿದ್ಧ ಕ್ರೀಡಾಪಟುಗಳು ಮತ್ತು ಅಡ್ಡಹೆಸರುಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Sports', 'Cricket', 'Nicknames', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'Match the famous cricketers (List-I) with their nickname (List-II) :
List - I (Player)
(a) Rahul Dravid
(b) Shikhar Dhawan
(c) Virat Kohli
(d) Rohit Sharma

List - II (Nickname)
(i) Chiku
(ii) Hitman
(iii) Gabbar
(iv) The Wall
Choose the correct answer from the options given below :', 'ಜನಪ್ರಿಯ ಕ್ರಿಕೆಟ್ ಆಟಗಾರರನ್ನು (ಪಟ್ಟಿ-I) ಅವರ ಅಡ್ಡಹೆಸರಿನೊಂದಿಗೆ (ಪಟ್ಟಿ-II) ಹೊಂದಿಸಿ.
ಪಟ್ಟಿ-I (ಆಟಗಾರರು)
(a) ರಾಹುಲ್ ದ್ರಾವಿಡ್
(b) ಶಿಖರ್ ಧವನ್
(c) ವಿರಾಟ್ ಕೊಹ್ಲಿ
(d) ರೋಹಿತ್ ಶರ್ಮ

ಪಟ್ಟಿ-II (ಅಡ್ಡಹೆಸರು)
(i) ಚಿಕು
(ii) ಹಿಟ್ ಮ್ಯಾನ್
(iii) ಗಬ್ಬರ್
(iv) ದ ವಾಲ್
ಕೆಳಕಂಡ ಆಯ್ಕೆಗಳಿಂದ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.', '(a)-(i), (b)-(iv), (c)-(ii), (d)-(iii)', '(a)-(iii), (b)-(ii), (c)-(iv), (d)-(i)', '(a)-(iv), (b)-(iii), (c)-(i), (d)-(ii)', '(a)-(ii), (b)-(i), (c)-(iii), (d)-(iv)', '(a)-(i), (b)-(iv), (c)-(ii), (d)-(iii)', '(a)-(iii), (b)-(ii), (c)-(iv), (d)-(i)', '(a)-(iv), (b)-(iii), (c)-(i), (d)-(ii)', '(a)-(ii), (b)-(i), (c)-(iii), (d)-(iv)', '3', 'Correct Answer: (3)

Explanation:
• Rahul Dravid — The Wall (iv)
• Shikhar Dhawan — Gabbar (iii)
• Virat Kohli — Chiku (i)
• Rohit Sharma — Hitman (ii)

Matching code: (a)-(iv), (b)-(iii), (c)-(i), (d)-(ii).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
• ರಾಹುಲ್ ದ್ರಾವಿಡ್ — ದ ವಾಲ್ (The Wall) (iv)
• ಶಿಖರ್ ಧವನ್ — ಗಬ್ಬರ್ (Gabbar) (iii)
• ವಿರಾಟ್ ಕೊಹ್ಲಿ — ಚಿಕು (Chiku) (i)
• ರೋಹಿತ್ ಶರ್ಮ — ಹಿಟ್ ಮ್ಯಾನ್ (Hitman) (ii)

ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: (a)-(iv), (b)-(iii), (c)-(i), (d)-(ii).', NULL, NULL),
    ('pc-hk-2026-q45', 45, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_economy_development.industrial_policy_manufacturing_services', 'Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', 'Industrial Policy, Manufacturing & Services', 'ಕೈಗಾರಿಕಾ ನೀತಿ, ಉತ್ಪಾದನೆ ಮತ್ತು ಸೇವೆಗಳು', 'Atal Innovation Mission (AIM), NITI Aayog & Sectoral Focus Areas', 'ಅಟಲ್ ಇನ್ನೋವೇಶನ್ ಮಿಷನ್ (AIM), ನೀತಿ ಆಯೋಗ್ ಮತ್ತು ವಲಯವಾರು ಕಾರ್ಯಕ್ಷೇತ್ರಗಳು', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Government Schemes', 'Atal Innovation Mission', 'NITI Aayog', 'Indian Economy & Development']::TEXT[], '', '', 'Which of the following is not listed as a sector-specific focus area for Atal Incubation Center (AICs)?', 'ಆಟಲ್ ಇನ್‌ಕ್ಯುಬೇಷನ್‌ ಸೆಂಟರ್‌ಗಳಿಗಾಗಿ (AICs) ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವುದನ್ನು ವಲಯ-ನಿರ್ದಿಷ್ಟ ಗಮನದ ಕ್ಷೇತ್ರವೆಂದು ಗುರುತಿಸಿ ಪಟ್ಟಿ ಮಾಡಲಾಗಿಲ್ಲ?', 'Agriculture', 'Tourism', 'Internet of Things (IoT)', 'Cyber Security', 'ಕೃಷಿ', 'ಪ್ರವಾಸೋದ್ಯಮ', 'ಇಂಟರ್‌ನೆಟ್ ಆಫ್ ಥಿಂಗ್ಸ್ (IoT)', 'ಸೈಬರ್ ಭದ್ರತೆ', '2', 'Correct Answer: (2)

Explanation:
Under the Atal Innovation Mission (AIM) by NITI Aayog, Atal Incubation Centres focus on core tech and emerging areas such as Agriculture, IoT, and Cyber Security. Tourism is not designated as a primary sector-specific focus area.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ನೀತಿ ಆಯೋಗದ ಅಟಲ್ ಇನ್ನೋವೇಶನ್ ಮಿಷನ್ (AIM) ಅಡಿಯಲ್ಲಿ ಸ್ಥಾಪಿಸಲಾದ ಅಟಲ್ ಇನ್‌ಕ್ಯುಬೇಷನ್ ಸೆಂಟರ್‌ಗಳು ಕೃಷಿ, ಇಂಟರ್‌ನೆಟ್ ಆಫ್ ಥಿಂಗ್ಸ್ (IoT), ಸೈಬರ್ ಭದ್ರತೆ, ಆರೋಗ್ಯ ಮುಂತಾದ ತಾಂತ್ರಿಕ ಕ್ಷೇತ್ರಗಳಿಗೆ ಆದ್ಯತೆ ನೀಡುತ್ತವೆ; ಪ್ರವಾಸೋದ್ಯಮವು ಈ ಪಟ್ಟಿಯಲ್ಲಿ ಒಳಗೊಂಡಿಲ್ಲ.', NULL, NULL),
    ('pc-hk-2026-q46', 46, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth', 'Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', 'Planning, Mobilisation of Resources & Inclusive Growth', 'ಯೋಜನೆ, ಸಂಪನ್ಮೂಲಗಳ ಕ್ರೋಢೀಕರಣ ಮತ್ತು ಅಂತರ್ಗತ ಬೆಳವಣಿಗೆ', 'Gig & Platform Economy, Informal Labour & Social Security Dimensions', 'ಗಿಗ್ ಮತ್ತು ಪ್ಲಾಟ್‌ಫಾರ್ಮ್ ಆರ್ಥಿಕತೆ, ಅಸಂಘಟಿತ ಕಾರ್ಮಿಕರು ಮತ್ತು ಸಾಮಾಜಿಕ ಭದ್ರತೆ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Economy', 'Gig Economy', 'Labor Economics', 'Indian Economy & Development']::TEXT[], '', '', 'Which of the following is not mentioned as a part of gig economy ?', 'ಕೆಳಕಂಡವುಗಳಲ್ಲಿ ಯಾವುದನ್ನು ಗಿಗ್ (gig) ಆರ್ಥಿಕತೆಯ ಭಾಗವಾಗಿ ಉಲ್ಲೇಖಿಸಲಾಗಿಲ್ಲ?', 'Freelancing', 'Ridesharing', 'Delivery Services', 'Commercial Banking', 'ಸ್ವತಂತ್ರ ಉದ್ಯೋಗ (ಫ್ರೀಲ್ಯಾನ್ಸಿಂಗ್)', 'ರೈಡ್‌ಶೇರಿಂಗ್', 'ವಿತರಣೆ ಸೇವೆಗಳು', 'ವಾಣಿಜ್ಯ ಬ್ಯಾಂಕಿಂಗ್', '4', 'Correct Answer: (4)

Explanation:
The gig economy refers to short-term, task-based, and freelance work (such as freelancing, app-based cab driving, and courier deliveries). Commercial banking is part of the traditional, formal salaried banking sector.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ಗಿಗ್ ಆರ್ಥಿಕತೆಯು ಅಲ್ಪಾವಧಿಯ ಒಪ್ಪಂದ, ಸ್ವತಂತ್ರ ಉದ್ಯೋಗ (ಫ್ರೀಲ್ಯಾನ್ಸಿಂಗ್), ರೈಡ್ ಶೇರಿಂಗ್ ಮತ್ತು ಡೆಲಿವರಿ ಸೇವೆಗಳನ್ನು ಒಳಗೊಂಡಿರುತ್ತದೆ. ವಾಣಿಜ್ಯ ಬ್ಯಾಂಕಿಂಗ್ ಸಾಂಪ್ರದಾಯಿಕ ಮತ್ತು ಔಪಚಾರಿಕ ಹಣಕಾಸು ಕ್ಷೇತ್ರದ ಭಾಗವಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q47', 47, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_economy_development.agriculture_food_management_subsidies.agricultural_pricing_market_reforms', 'Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', 'Agriculture, Food Management & Subsidies', 'ಕೃಷಿ, ಆಹಾರ ನಿರ್ವಹಣೆ ಮತ್ತು ಸಬ್ಸಿಡಿಗಳು', 'Commission for Agricultural Costs and Prices (CACP) & Minimum Support Price (MSP) Mechanism', 'ಕೃಷಿ ವೆಚ್ಚ ಮತ್ತು ಬೆಲೆಗಳ ಆಯೋಗ (CACP) ಹಾಗೂ ಕನಿಷ್ಠ ಬೆಂಬಲ ಬೆಲೆ (MSP) ಕಾರ್ಯವಿಧಾನ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Economy', 'Agriculture', 'MSP', 'CACP', 'Indian Economy & Development']::TEXT[], '', '', 'In India ''Minimum Support Price (MSP) for selected agricultural crops is recommended by :', 'ಭಾರತದಲ್ಲಿ ಆಯ್ದ ಕೃಷಿ ಬೆಳೆಗಳಿಗೆ “ಕನಿಷ್ಠ ಬೆಂಬಲ ಬೆಲೆ ” ಯನ್ನು ಶಿಫಾರಸು ಮಾಡುವವರು', 'Reserve Bank of India', 'Agriculture Ministry of Indian Government', 'Commission for Agricultural Cost and Prices', 'Food Corporation of India', 'ಭಾರತೀಯ ರಿಸರ್ವ್ ಬ್ಯಾಂಕು', 'ಭಾರತ ಸರ್ಕಾರದ ಕೃಷಿ ಮಂತ್ರಾಲಯ', 'ಕೃಷಿ ವೆಚ್ಚ ಮತ್ತು ಬೆಲೆ ಆಯೋಗ (CACP)', 'ಭಾರತೀಯ ಆಹಾರ ನಿಗಮ (FCI)', '3', 'Correct Answer: (3)

Explanation:
The Minimum Support Price (MSP) for mandated agricultural crops is recommended by the Commission for Agricultural Costs and Prices (CACP). The final MSP rates are approved by the Cabinet Committee on Economic Affairs (CCEA).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಭಾರತದಲ್ಲಿ ಪ್ರಮುಖ ಬೆಳೆಗಳಿಗೆ ಕನಿಷ್ಠ ಬೆಂಬಲ ಬೆಲೆಯನ್ನು (MSP) ''ಕೃಷಿ ವೆಚ್ಚ ಮತ್ತು ಬೆಲೆ ಆಯೋಗ'' (CACP - Commission for Agricultural Costs and Prices) ಶಿಫಾರಸು ಮಾಡುತ್ತದೆ. ಅಂತಿಮ ತೀರ್ಮಾನವನ್ನು ಆರ್ಥಿಕ ವ್ಯವಹಾರಗಳ ಸಂಪುಟ ಸಮಿತಿ (CCEA) ತೆಗೆದುಕೊಳ್ಳುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q48', 48, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement.round_table_conferences_pacts', 'History', 'ಇತಿಹಾಸ', 'Indian Freedom Struggle', 'ಭಾರತೀಯ ಸ್ವಾತಂತ್ರ್ಯ ಸಂಗ್ರಾಮ', 'Nationalist Press & Mahatma Gandhi''s Periodicals (Harijan - Weekly Journal)', 'ರಾಷ್ಟ್ರೀಯ ಪತ್ರಿಕೋದ್ಯಮ ಮತ್ತು ಮಹಾತ್ಮ ಗಾಂಧಿಯವರ ಹರಿಜನ ಸಾಪ್ತಾಹಿಕ ಪತ್ರಿಕೆ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Modern Indian History', 'Mahatma Gandhi', 'Newspapers', 'History']::TEXT[], '', '', 'Gandhiji''s Harijan Newspaper belongs to which of the following form?', 'ಗಾಂಧೀಜಿಯ ಹರಿಜನ ಪತ್ರಿಕೆ ಕೆಳಗಿನ ಯಾವ ಪ್ರಕಾರಕ್ಕೆ ಸೇರಿದೆ ?', 'Weekly', 'Fortnightly', 'Monthly', 'Daily', 'ವಾರಪತ್ರಿಕೆ', 'ಪಾಕ್ಷಿಕ', 'ಮಾಸಿಕ', 'ದಿನಪತ್ರಿಕೆ', '1', 'Correct Answer: (1)

Explanation:
''Harijan'' was an English weekly journal founded by Mahatma Gandhi in 1933, published along with sister weeklies ''Harijan Bandhu'' (Gujarati) and ''Harijan Sevak'' (Hindi).', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಮಹಾತ್ಮ ಗಾಂಧೀಜಿಯವರು 1933 ರಲ್ಲಿ ಪ್ರಾರಂಭಿಸಿದ ''ಹರಿಜನ'' ಪತ್ರಿಕೆಯು ಒಂದು ಇಂಗ್ಲಿಷ್ ವಾರಪತ್ರಿಕೆಯಾಗಿದೆ (Weekly). ಇದರೊಂದಿಗೆ ''ಹರಿಜನ ಬಂಧು'' (ಗುಜರಾತಿ) ಮತ್ತು ''ಹರಿಜನ ಸೇವಕ್'' (ಹಿಂದಿ) ಪತ್ರಿಕೆಗಳನ್ನು ಸಹ ಪ್ರಕಟಿಸಲಾಗುತ್ತಿತ್ತು.', NULL, NULL),
    ('pc-hk-2026-q49', 49, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.medieval_india', 'History', 'ಇತಿಹಾಸ', 'Medieval India', 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ', 'Firdausi''s Shahnama (Book of Kings) & Persian Epic Tradition', 'ಫಿರ್ದೌಸಿಯ ಶಹನಾಮಾ (ರಾಜರ ಮಹಾಕಾವ್ಯ) ಮತ್ತು ಪರ್ಷಿಯನ್ ಸಾಹಿತ್ಯ ಪರಂಪರೆ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'World Literature', 'Medieval History', 'Persian Literature', 'History']::TEXT[], '', '', 'Consider the following statements regarding Shahanama :
a. It is a Persian great epic.
b. Firdosi composed it.
c. It is in Arabic language.
d. It meant ''The Book of Kings''.
Choose the correct answer:', 'ಷಹನಾಮಕ್ಕೆ ಸಂಬಂಧಿಸಿದಂತೆ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.
a. ಇದು ಒಂದು ಪರ್ಷಿಯನ್ ಮಹಾಕಾವ್ಯ.
b. ಫಿರ್ದೌಸಿ ಇದನ್ನು ರಚಿಸಿದ್ದಾರೆ.
c. ಇದು ಅರೇಬಿಕ್ ಭಾಷೆಯಲ್ಲಿದೆ.
d. ಇದರ ಅರ್ಥ ''ರಾಜರ ಪುಸ್ತಕ''.
ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆಯ್ಕೆ ಮಾಡಿ.', 'a, c and d', 'b, c and d', 'a, b and c', 'a, b and d', 'a, c ಮತ್ತು d', 'b, c ಮತ್ತು d', 'a, b ಮತ್ತು c', 'a, b ಮತ್ತು d', '4', 'Correct Answer: (4)

Explanation:
''Shahnameh'' (''The Book of Kings'') is an epic poem composed by the Persian poet Ferdowsi. It was written in Persian (Farsi), not Arabic. Thus, statements a, b, and d are correct, while c is incorrect.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
• ''ಷಹನಾಮ'' ಎಂದರೆ ''ರಾಜರ ಪುಸ್ತಕ'' (Book of Kings) ಎಂದರ್ಥ.
• ಇದು ಪರ್ಷಿಯನ್ ಭಾಷೆಯ ಮಹಾಕಾವ್ಯವಾಗಿದ್ದು, ಪರ್ಷಿಯನ್ ಕವಿ ಫಿರ್ದೌಸಿ ರಚಿಸಿದ್ದಾರೆ.
• ಇದು ಅರೇಬಿಕ್ ಭಾಷೆಯಲ್ಲಿದೆ ಎಂಬ ಹೇಳಿಕೆ (c) ತಪ್ಪಾಗಿದೆ.

ಆದ್ದರಿಂದ a, b ಮತ್ತು d ಹೇಳಿಕೆಗಳು ಸರಿಯಾಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q50', 50, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Oral Chemistry, Oral Bacteria & Acid-Induced Tooth Enamel Demineralization', 'ಬಾಯಿಯ ರಸಾಯನಶಾಸ್ತ್ರ, ಬ್ಯಾಕ್ಟೀರಿಯಾ ಮತ್ತು ಆಮ್ಲೀಯತೆಯಿಂದ ಹಲ್ಲಿನ ಸವೆತ (ಟೂತ್ ಡಿಕೇ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Science', 'Chemistry in Everyday Life', 'Acids and Bases', 'Science, Technology & Defence']::TEXT[], '', '', 'Bacteria present in mouth converts sugar and remaining food items after eating into acids. This causes tooth decay. This can be prevented by using toothpaste which are generally', 'ಬಾಯಿಯಲ್ಲಿರುವ ಬ್ಯಾಕ್ಟಿರಿಯಾಗಳು, ಊಟದ ನಂತರ ಸಕ್ಕರೆ ಮತ್ತು ಉಳಿದಿರುವ ಆಹಾರ ಪದಾರ್ಥಗಳನ್ನು ಆಮ್ಲವಾಗಿ ಪರಿವರ್ತಿಸುತ್ತದೆ. ಇದರಿಂದ ಹಲ್ಲಿನ ಹುಳುಕು ಉಂಟಾಗುತ್ತದೆ. ಇದನ್ನು ತಡೆಗಟ್ಟಲು ಬಳಸುವ ಟೂತ್‌ಪೇಸ್ಟ್‌ನ ಗುಣ ಸಾಮಾನ್ಯವಾಗಿ ಇದಾಗಿರುತ್ತದೆ.', 'Basic', 'Neutral', 'Antiseptic', 'Acidic', 'ಪ್ರತ್ಯಾಮ್ಲೀಯ', 'ತಟಸ್ಥ', 'ನಂಜುನಿವಾರಕ', 'ಆಮ್ಲೀಯ', '1', 'Correct Answer: (1)

Explanation:
Tooth decay occurs when oral pH drops below 5.5 due to acid produced by bacterial fermentation of residual food particles. Toothpastes are formulated to be mildly basic (alkaline) to neutralize mouth acids and prevent enamel demineralization.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಬಾಯಿಯಲ್ಲಿ ಬ್ಯಾಕ್ಟೀರಿಯಾಗಳು ಆಹಾರದ ಅವಶೇಷಗಳಿಂದ ಆಮ್ಲವನ್ನು ಉತ್ಪಾದಿಸಿದಾಗ ಬಾಯಿಯ pH 5.5 ಕ್ಕಿಂತ ಕಡಿಮೆಯಾಗಿ ಹಲ್ಲು ಹುಳುಕಾಗುತ್ತದೆ. ಟೂತ್‌ಪೇಸ್ಟ್‌ಗಳು ಸಾಮಾನ್ಯವಾಗಿ ಪ್ರತ್ಯಾಮ್ಲೀಯ (ಕ್ಷಾರೀಯ) ಗುಣವನ್ನು ಹೊಂದಿರುವುದರಿಂದ, ಅವು ಬಾಯಿಯಲ್ಲಿರುವ ಆಮ್ಲವನ್ನು ತಟಸ್ಥಗೊಳಿಸಿ ಹಲ್ಲಿನ ಕ್ಷಯವನ್ನು ತಡೆಯುತ್ತವೆ.', NULL, NULL)
ON CONFLICT (id) DO UPDATE SET
    node_id = EXCLUDED.node_id,
    subject = EXCLUDED.subject,
    subject_kannada = EXCLUDED.subject_kannada,
    domain = EXCLUDED.domain,
    domain_kannada = EXCLUDED.domain_kannada,
    sub_topic = EXCLUDED.sub_topic,
    sub_topic_kannada = EXCLUDED.sub_topic_kannada,
    difficulty = EXCLUDED.difficulty,
    tags = EXCLUDED.tags,
    question_english = EXCLUDED.question_english,
    question_kannada = EXCLUDED.question_kannada,
    option_1_english = EXCLUDED.option_1_english,
    option_2_english = EXCLUDED.option_2_english,
    option_3_english = EXCLUDED.option_3_english,
    option_4_english = EXCLUDED.option_4_english,
    option_1_kannada = EXCLUDED.option_1_kannada,
    option_2_kannada = EXCLUDED.option_2_kannada,
    option_3_kannada = EXCLUDED.option_3_kannada,
    option_4_kannada = EXCLUDED.option_4_kannada,
    key_answer = EXCLUDED.key_answer,
    explanation_english = EXCLUDED.explanation_english,
    explanation_kannada = EXCLUDED.explanation_kannada,
    image_url = EXCLUDED.image_url,
    table_data = EXCLUDED.table_data;

INSERT INTO public.pc_pyq (
    id, question_number, year, month, paper, paper_code, exam_id, node_id,
    subject, subject_kannada, domain, domain_kannada, sub_topic, sub_topic_kannada,
    difficulty, tags, passage_english, passage_kannada, question_english, question_kannada,
    option_1_english, option_2_english, option_3_english, option_4_english,
    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,
    key_answer, explanation_english, explanation_kannada, image_url, table_data
) VALUES
    ('pc-hk-2026-q51', 51, 2026, 'September', 1, 'hk', 'ksp-pc', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.international_climate_architecture_treaties', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Climate Change Science, Carbon Markets & Global Conventions', 'ಹವಾಮಾನ ಬದಲಾವಣೆ ವಿಜ್ಞಾನ, ಇಂಗಾಲದ ಮಾರುಕಟ್ಟೆಗಳು ಮತ್ತು ಜಾಗತಿಕ ಒಪ್ಪಂದಗಳು', 'Ozone Layer Depleting Substances (CFCs / Freon) & Montreal Protocol', 'ಓಝೋನ್ ಕ್ಷೀಣಿಸುವ ವಸ್ತುಗಳು (ಸಿಎಫ್‌ಸಿಗಳು / ಫ್ರಿಯಾನ್) ಮತ್ತು ಮಾಂಟ್ರಿಯಲ್ ಪ್ರೋಟೋಕಾಲ್', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Environmental Chemistry', 'Ozone Depletion', 'General Science', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'The common name used for chlorofluoro methane and chlorofluoro ethane which is responsible for ozone depletion is', 'ಓಝೋನ್ ಪದರದ ನಾಶವಾಗುವಿಕೆಗೆ ಕಾರಣವಾದ ಕ್ಲೋರೋಫ್ಲೋರೋ ಮಿಥೇನ್ ಮತ್ತು ಕ್ಲೋರೋಫ್ಲೋರೋ ಈಥೇನ್‌ಗಳಿಗೆ ಬಳಸಲಾಗುವ ಸಾಮಾನ್ಯ ಹೆಸರು', 'Freons', 'Crown ethers', 'Spiranes', 'Chloroform', 'ಫ್ರೆಯಾನ್ಸ್', 'ಕ್ರೌನ್ ಈಥರ್ಸ್', 'ಸ್ಪಿರೇನ್ಸ್', 'ಕ್ಲೋರೋಫಾರ್ಮ್', '1', 'Correct Answer: (1)

Explanation:
Chlorofluorocarbon compounds derived from methane and ethane are commercially known as Freons (such as Freon-11 and Freon-12). In the stratosphere, ultraviolet radiation breaks them down to release reactive chlorine radicals that catalyze the depletion of the ozone layer.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಓಝೋನ್ ಪದರದ ಸವಕಳಿಗೆ ಕಾರಣವಾಗುವ ಕ್ಲೋರೋಫ್ಲೋರೋ ಮಿಥೇನ್ ಮತ್ತು ಕ್ಲೋರೋಫ್ಲೋರೋ ಈಥೇನ್‌ಗಳಂತಹ ಕ್ಲೋರೋಫ್ಲೋರೋ ಕಾರ್ಬನ್ (CFC) ಸಂಯುಕ್ತಗಳನ್ನು ಸಾಮಾನ್ಯವಾಗಿ ''ಫ್ರೆಯಾನ್ಸ್'' (Freons) ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q52', 52, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Electrochemistry & Miniature Primary Cells (Mercury Cell in Hearing Aids & Watches)', 'ವಿದ್ಯುತ್ ರಸಾಯನಶಾಸ್ತ್ರ ಮತ್ತು ಮರ್ಕ್ಯುರಿ ಕೋಶಗಳು (ಶ್ರವಣ ಸಾಧನಗಳು ಮತ್ತು ಕೈಗಡಿಯಾರಗಳಲ್ಲಿ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Electrochemistry', 'Primary Cells', 'General Science', 'Science, Technology & Defence']::TEXT[], '', '', 'The cell used in devices like hearing aids and watches is', 'ಶ್ರವಣ ಸಾಧಕಗಳು ಮತ್ತು ಗಡಿಯಾರದಂಥ ಸಾಧನಗಳಲ್ಲಿ ಬಳಸಲಾಗುವ ಕೋಶಗಳು', 'Mercury cell', 'Lead-storage cell', 'Nickel-Cadmium cell', 'Dry cell', 'ಪಾದರಸದ ಕೋಶ (ಮರ್ಕ್ಯುರಿ ಸೆಲ್)', 'ಸೀಸ-ಧಾರಕ ಕೋಶ', 'ನಿಕ್ಕಲ್-ಕ್ಯಾಡ್ಮಿಯಂ ಕೋಶ', 'ಒಣ ಕೋಶ', '1', 'Correct Answer: (1)

Explanation:
The miniature mercury cell provides a stable potential of ~1.35 V throughout its operating life because its overall chemical reaction does not involve ions in solution whose concentrations change. This makes it ideal for compact devices like hearing aids and watches.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಶ್ರವಣ ಸಾಧನಗಳು, ಕೈಗಡಿಯಾರಗಳು ಮುಂತಾದ ಸೂಕ್ಷ್ಮ ಎಲೆಕ್ಟ್ರಾನಿಕ್ ಸಾಧನಗಳಲ್ಲಿ ಪಾದರಸದ ಕೋಶಗಳನ್ನು (Mercury cell / Button cell) ಬಳಸಲಾಗುತ್ತದೆ. ಇದು ತನ್ನ ಸಂಪೂರ್ಣ ಜೀವಿತಾವಧಿಯಲ್ಲಿ ಸ್ಥಿರವಾದ ವಿದ್ಯುತ್ ವಿಭವವನ್ನು (1.35 V) ಒದಗಿಸುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q53', 53, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Human Digestive System Pathologies & Physiological Disorders (Jaundice, Vomiting, Diarrhea)', 'ಮಾನವ ಜೀರ್ಣಾಂಗ ವ್ಯವಸ್ಥೆಯ ರೋಗಗಳು ಮತ್ತು ಶಾರೀರಿಕ ಅಸ್ವಸ್ಥತೆಗಳು (ಕಾಮಾಲೆ, ವಾಂತಿ, ಅತಿಸಾರ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Biology', 'Human Physiology', 'Digestive System', 'Science, Technology & Defence']::TEXT[], '', '', 'Study the following statements regarding diseases of the digestive system and choose the correct statement:', 'ಜೀರ್ಣಕ್ರಿಯೆ ವ್ಯವಸ್ಥೆಯ ಕಾಯಿಲೆಗಳಿಗೆ ಸಂಬಂಧಿಸಿದ ಈ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಗಮನಿಸಿ ಮತ್ತು ಅವುಗಳಲ್ಲಿ ಸರಿಯಾದ ಹೇಳಿಕೆಯನ್ನು ಆರಿಸಿ.', 'Diarrhea is due to abnormal bowel movements.', 'Indigestion is due to inadequate secretion of hormones.', 'Many parasites like Plasmodium vivax cause damage to intestinal inner lining.', 'In jaundice, the intestine is affected. Skin and eyes turn yellow due to deposit of bile pigments.', 'ಆಮಶಂಕೆಯು ಅಸಹಜ ಮಲವಿಸರ್ಜನೆ (ಕರುಳಿನ ಅಪಸಾಮಾನ್ಯ ಕ್ರಿಯೆ) ಕಾರಣದಿಂದ ಉಂಟಾಗುತ್ತದೆ.', 'ಅಜೀರ್ಣತೆಯು ಹಾರ್ಮೋನುಗಳ ಅಪರ್ಯಾಪ್ತ ಸ್ರಾವದ ಕಾರಣದಿಂದ ಉಂಟಾಗುತ್ತದೆ.', 'ಪರಾವಲಂಬಿ ಜೀವಿಗಳಾದ ಪ್ಲಾಸ್ಮೋಡಿಯಂ ವೈವಾಕ್ಸ್‌ನಂತಹ ಜೀವಿಗಳು ಕರುಳಿನ ಒಳಗೋಡೆಗೆ ಹಾನಿಯುಂಟು ಮಾಡುತ್ತವೆ.', 'ಕಾಮಾಲೆ ಕಾಯಿಲೆಯಾದಾಗ ಕರುಳು ಬಾಧಿತವಾಗುತ್ತದೆ. ಇದರಲ್ಲಿ ಪಿತ್ತವರ್ಣಿಕೆಗಳ (ಬೈಲ್ ಪಿಗ್ಮೆಂಟ್‌ಗಳ) ಶೇಖರಣೆಯಿಂದಾಗಿ ಚರ್ಮ ಮತ್ತು ಕಣ್ಣುಗಳು ಹಳದಿ ಬಣ್ಣಕ್ಕೆ ತಿರುಗುತ್ತವೆ.', '1', 'Correct Answer: (1)

Explanation:
• Diarrhea is characterized by an abnormal frequency of bowel movements and increased liquidity of fecal discharge.
• Indigestion is caused by inadequate secretion of digestive enzymes (not hormones), food poisoning, or overeating.
• Plasmodium vivax is a malarial parasite affecting red blood cells and liver cells, not the gut lining.
• In jaundice, the liver (not intestine) is affected.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
• ಆಮಶಂಕೆ (Diarrhea) ಯು ಕರುಳಿನ ಅಸಹಜ ಚಲನೆ ಮತ್ತು ನೀರಿನಂತಹ ಮಲವಿಸರ್ಜನೆಯಿಂದ ಉಂಟಾಗುತ್ತದೆ (ಹೇಳಿಕೆ 1 ಸರಿಯಾಗಿದೆ).
• ಅಜೀರ್ಣತೆಯು ಜೀರ್ಣರಸ ಕಿಣ್ವಗಳ ಕೊರತೆಯಿಂದ ಉಂಟಾಗುತ್ತದೆ (ಹಾರ್ಮೋನುಗಳಿಂದಲ್ಲ).
• ಪ್ಲಾಸ್ಮೋಡಿಯಂ ವೈವಾಕ್ಸ್ ಮಲೇರಿಯಾ ರೋಗವನ್ನು ಉಂಟುಮಾಡುತ್ತದೆ, ಇದು ಯಕೃತ್ತು ಮತ್ತು ರಕ್ತಕಣಗಳಿಗೆ ಸಂಬಂಧಿಸಿದ್ದು ಕರುಳಿಗಲ್ಲ.
• ಕಾಮಾಲೆಯಲ್ಲಿ ಯಕೃತ್ತು (ಲಿವರ್) ಬಾಧಿತವಾಗುತ್ತದೆ, ಕರುಳಲ್ಲ.', NULL, NULL),
    ('pc-hk-2026-q54', 54, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.biotechnology_health_life_sciences.agricultural_biotechnology_bio-economy', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Biotechnology, Health & Life Sciences', 'ಬಯೋಟೆಕ್ನಾಲಜಿ, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವ ವಿಜ್ಞಾನಗಳು', 'Agricultural Biotechnology & RNA Interference (RNAi) Nematode Resistance in Tobacco', 'ಕೃಷಿ ಬಯೋಟೆಕ್ನಾಲಜಿ ಮತ್ತು ಆರ್‌ಎನ್‌ಎ ಪ್ರತಿಬಂಧಕ (RNAi) ತಂಬಾಕು ಬೆಳೆ ರಕ್ಷಣೆ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Biotechnology', 'RNAi', 'Agriculture', 'Science, Technology & Defence']::TEXT[], '', '', 'A novel strategy was adopted to prevent the infection of roots of tobacco plants by nematode is', 'ತಂಬಾಕು ಗಿಡದ ಬೇರುಗಳನ್ನು ಸೋಂಕು ಉಂಟು ಮಾಡುವ ದುಂಡು ಹುಳುಗಳಿಂದ (ನೆಮಟೋಡ್‌ಗಳಿಂದ) ಸಂರಕ್ಷಿಸುವ ವಿನೂತನ ಪ್ರಕ್ರಿಯೆಯು,', 'RNA interference', 'Gene Therapy', 'Polymerase chain reaction', 'Incorporation of Bt. toxins gene', 'RNA ವ್ಯತೀಕರಣ', 'ವಂಶವಾಹಿ ಚಿಕಿತ್ಸೆ', 'ಪಾಲಿಮರೇಸ್ ಸರಪಳಿ ಪ್ರತಿಕ್ರಿಯೆ (PCR)', 'Bt. ಟಾಕ್ಸಿನ್ಸ್ ವಂಶವಾಹಿಗಳ ಸಂಘಟನೆ', '1', 'Correct Answer: (1)

Explanation:
RNA interference (RNAi) is a gene-silencing process utilized in biotechnology to protect tobacco roots against infestation by the root-knot nematode Meloidogyne incognita. Host-expressed dsRNA triggers silencing of essential mRNA transcripts in the pest.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಮೆಲಾಯ್ಡೊಗೈನ್ ಇನ್‌ಕಾಗ್ನಿಟಾ ಎಂಬ ನೆಮಟೋಡ್ (ದುಂಡುಹುಳು) ತಂಬಾಕು ಸಸ್ಯದ ಬೇರುಗಳಿಗೆ ಸೋಂಕು ಉಂಟುಮಾಡುತ್ತದೆ. ಇದನ್ನು ತಡೆಗಟ್ಟಲು ಜೈವಿಕ ತಂತ್ರಜ್ಞಾನದಲ್ಲಿ ''ಆರ್‌ಎನ್‌ಎ ವ್ಯತೀಕರಣ'' (RNA interference - RNAi) ಎಂಬ ವಿನೂತನ ಪ್ರಕ್ರಿಯೆಯನ್ನು ಬಳಸಲಾಗುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q55', 55, 2026, 'September', 1, 'hk', 'ksp-pc', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.core_environmental_legislation', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Environmental Legislation, Institutions & EIA in India', 'ಪರಿಸರ ಶಾಸನ, ಸಂಸ್ಥೆಗಳು ಮತ್ತು ಇಐಎ', 'National Forest Policy 1988 (Target Forest Cover: 33% Plains, 67% Hills)', 'ರಾಷ್ಟ್ರೀಯ ಅರಣ್ಯ ನೀತಿ 1988 (ಅರಣ್ಯ ವ್ಯಾಪ್ತಿ ಗುರಿ: ಬಯಲುಸೀಮೆಗೆ 33%, ಗುಡ್ಡಗಾಡಿಗೆ 67%)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Environment and Ecology', 'Forest Policy', 'Indian Geography', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'The percentage of forest cover recommended by National Forest Policy (1988) for plains and hills respectively is', 'ಭಾರತದ ರಾಷ್ಟ್ರೀಯ ಅರಣ್ಯ ನೀತಿ (1988) ಯು ಬಯಲು ಹಾಗೂ ಗುಡ್ಡಗಾಡು ಪ್ರದೇಶಗಳಿಗೆ ಶಿಫಾರಸು ಮಾಡಿರುವ ಶೇಕಡಾವಾರು ಅರಣ್ಯ ಪ್ರದೇಶವು ಕ್ರಮವಾಗಿ', '33% and 67%', '67% and 30%', '67% and 33%', '19.4% and 30%', '33% ಮತ್ತು 67%', '67% ಮತ್ತು 30%', '67% ಮತ್ತು 33%', '19.4% ಮತ್ತು 30%', '1', 'Correct Answer: (1)

Explanation:
The National Forest Policy of 1988 aims at maintaining a minimum of 33% of the country''s total land area under forest or tree cover, specifically recommending 33% forest cover in the plains and 67% (two-thirds) in hilly and mountainous regions to prevent soil erosion and maintain ecological balance.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಭಾರತದ ರಾಷ್ಟ್ರೀಯ ಅರಣ್ಯ ನೀತಿ (1988) ಪ್ರಕಾರ ದೇಶದ ಒಟ್ಟು ವಿಸ್ತೀರ್ಣದಲ್ಲಿ ಶೇ. 33 ರಷ್ಟು ಅರಣ್ಯವಿರಬೇಕು. ಇದರಲ್ಲಿ ನಿರ್ದಿಷ್ಟವಾಗಿ ಬಯಲು ಪ್ರದೇಶಗಳಿಗೆ ಶೇ. 33 ಮತ್ತು ಗುಡ್ಡಗಾಡು ಪ್ರದೇಶಗಳಿಗೆ ಶೇ. 67 ರಷ್ಟು ಅರಣ್ಯ ಪ್ರದೇಶವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q56', 56, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Zoological Classification & Aquatic Habitats of Marine and Freshwater Fishes', 'ಪ್ರಾಣಿಶಾಸ್ತ್ರೀಯ ವರ್ಗೀಕರಣ ಹಾಗೂ ಸಿಹಿ ಮತ್ತು ಸಮುದ್ರ ನೀರಿನ ಮೀನುಗಳ ನೈಸರ್ಗಿಕ ಆವಾಸಸ್ಥಾನ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Zoology', 'Animal Kingdom', 'Aquatic Habitats', 'Science, Technology & Defence']::TEXT[], '', '', 'Identify the incorrectly matched pair:', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ತಪ್ಪಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿರುವ ಜೋಡಿಯನ್ನು ಗುರುತಿಸಿ.', 'Flying fish — Fresh water', 'Dog fish — Marine water', 'Katla — Fresh water', 'Sting ray — Marine water', 'ಫ್ಲೈಯಿಂಗ್ ಫಿಶ್ - ಸಿಹಿ ನೀರು', 'ಡಾಗ್ ಫಿಶ್ - ಸಮುದ್ರ ನೀರು', 'ಕಾಟ್ಲಾ - ಸಿಹಿ ನೀರು', 'ಸ್ಟಿಂಗ್ ರೇ - ಸಮುದ್ರ ನೀರು', '1', 'Correct Answer: (1)

Explanation:
• Flying fish (Exocoetus) is a marine fish found in ocean waters, not freshwater.
• Dog fish (Scoliodon) is a marine cartilaginous fish.
• Katla (Catla catla) is a major freshwater carp.
• Sting ray (Trygon) is a marine fish.

Thus, pair (1) is incorrectly matched.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
• ಫ್ಲೈಯಿಂಗ್ ಫಿಶ್ (ಹಾರುವ ಮೀನು - Exocoetus): ಇದು ಸಮುದ್ರದ ನೀರಿನಲ್ಲಿ (Marine water) ವಾಸಿಸುವ ಮೀನಾಗಿದೆ, ಸಿಹಿ ನೀರಿನ ಮೀನಲ್ಲ.
• ಡಾಗ್ ಫಿಶ್ ಮತ್ತು ಸ್ಟಿಂಗ್ ರೇ ಸಮುದ್ರದ ಮೀನುಗಳು ಹಾಗೂ ಕಾಟ್ಲಾ ಸಿಹಿನೀರಿನ ಮೀನಾಗಿದೆ.

ಆದ್ದರಿಂದ ಜೋಡಿ (1) ತಪ್ಪಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q57', 57, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Chemical Combustion, Hydrocarbons & Incomplete Combustion Soot Formation', 'ರಾಸಾಯನಿಕ ದಹನ ಕ್ರಿಯೆ, ಹೈಡ್ರೋಕಾರ್ಬನ್‌ಗಳು ಮತ್ತು ಅಪೂರ್ಣ ದಹನದಿಂದ ಮಸಿ ಉಂಟಾಗುವುದು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Chemistry', 'Combustion and Fuels', 'Carbon Compounds', 'Science, Technology & Defence']::TEXT[], '', '', 'When the food is being cooked in the utensil, black colour formed underneath the utensil indicate', 'ಪಾತ್ರೆಯಲ್ಲಿ ಆಹಾರವನ್ನು ತಯಾರಿಸುವ ಸಂದರ್ಭದಲ್ಲಿ ಪಾತ್ರೆಯ ತಳಭಾಗವು ಕಪ್ಪಾಗುವುದು ಏನನ್ನು ಸೂಚಿಸುತ್ತದೆ ?', 'Incomplete combustion of fuel', 'Charring of food', 'Lack of fuel', 'Complete combustion of fuel', 'ಇಂಧನದ ಅಪೂರ್ಣ ದಹನಕ್ರಿಯೆ', 'ಆಹಾರವು ಸೀದುಹೋಗುವುದು', 'ಇಂಧನದ ಕೊರತೆ', 'ಇಂಧನದ ಸಂಪೂರ್ಣ ದಹನಕ್ರಿಯೆ', '1', 'Correct Answer: (1)

Explanation:
When a hydrocarbon fuel burns in an inadequate supply of oxygen, it undergoes incomplete combustion, generating unburnt carbon particles (soot) that deposit as a black coating underneath cooking utensils.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಪಾತ್ರೆಯ ತಳಭಾಗವು ಕಪ್ಪಾಗುವುದು ಇಂಧನಕ್ಕೆ ಸರಿಯಾದ ಆಮ್ಲಜನಕ ಪೂರೈಕೆಯಾಗದೆ ''ಅಪೂರ್ಣ ದಹನಕ್ರಿಯೆ'' (Incomplete combustion) ಆಗುತ್ತಿರುವುದನ್ನು ಮತ್ತು ಕಾರ್ಬನ್ ಕಣಗಳು (ಮಸಿ) ಬಿಡುಗಡೆಯಾಗುತ್ತಿರುವುದನ್ನು ಸೂಚಿಸುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q58', 58, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Alternative Biofuels & Flex Fuel Vehicles (FFV) Ethanol-Gasoline Blends', 'ಪರ್ಯಾಯ ಜೈವಿಕ ಇಂಧನಗಳು ಮತ್ತು ಫ್ಲೆಕ್ಸ್ ಫ್ಯೂಯಲ್ ವಾಹನಗಳು (FFV) ಎಥೆನಾಲ್-ಪೆಟ್ರೋಲ್ ಮಿಶ್ರಣ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Science and Technology', 'Biofuels', 'Automobile Engineering', 'Science, Technology & Defence']::TEXT[], '', '', 'The fuels used in Flex Fuel Vehicles (FFV) engine are', 'ಪ್ಲೆಕ್ಸ್ ಇಂಧನ ವಾಹನಗಳ (FFV) ಎಂಜಿನ್‌ನಲ್ಲಿ ಬಳಸಲಾಗುವ ಇಂಧನ', '60% Petrol + 40% Ethanol', '75% Petrol + 25% Ethanol', 'Petrol + Ethanol in any proportion', '80% Petrol + 20% Ethanol', '60% ಪೆಟ್ರೋಲ್ + 40% ಎಥನಾಲ್', '75% ಪೆಟ್ರೋಲ್ + 25% ಎಥನಾಲ್', 'ಪೆಟ್ರೋಲ್ + ಎಥನಾಲ್ ಯಾವುದೇ ಅನುಪಾತದಲ್ಲಿ', '80% ಪೆಟ್ರೋಲ್ + 20% ಎಥನಾಲ್', '3', 'Correct Answer: (3)

Explanation:
Flex Fuel Vehicles (FFVs) are engineered with modified fuel systems and engine control modules that allow them to run on 100% petrol, 100% ethanol, or any blended mixture of petrol and ethanol in any proportion.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಫ್ಲೆಕ್ಸ್ ಇಂಧನ ವಾಹನಗಳ (Flexible Fuel Vehicles - FFV) ಎಂಜಿನ್‌ಗಳು 100% ಪೆಟ್ರೋಲ್, 100% ಎಥನಾಲ್ ಅಥವಾ ಪೆಟ್ರೋಲ್ ಮತ್ತು ಎಥನಾಲ್ ಅನ್ನು ಯಾವುದೇ ಅನುಪಾತದಲ್ಲಿ ಮಿಶ್ರಣ ಮಾಡಿದ ಇಂಧನದಲ್ಲಿ ಚಲಿಸುವ ಸಾಮರ್ಥ್ಯವನ್ನು ಹೊಂದಿರುತ್ತವೆ.', NULL, NULL),
    ('pc-hk-2026-q59', 59, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Calendar Reasoning & Odd Days Calculation Across Leap Years', 'ಕ್ಯಾಲೆಂಡರ್ ತಾರ್ಕಿಕತೆ ಮತ್ತು ಅಧಿಕ ವರ್ಷಗಳ ದಿನಗಳ ಲೆಕ್ಕಾಚಾರ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Calendar Reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'June 29, 2026 is Monday. Then, which day is June 29, 2030 ?', 'ಜೂನ್ 29, 2026 ಸೋಮವಾರ. ಹಾಗಾದರೆ ಜೂನ್ 29, 2030 ಯಾವ ವಾರ ?', 'Sunday', 'Thursday', 'Saturday', 'Monday', 'ಭಾನುವಾರ', 'ಗುರುವಾರ', 'ಶನಿವಾರ', 'ಸೋಮವಾರ', '3', 'Correct Answer: (3)

Explanation:
From June 29, 2026 to June 29, 2030 is 4 years:
• 2027: Ordinary year (1 odd day)
• 2028: Leap year containing Feb 29 (2 odd days)
• 2029: Ordinary year (1 odd day)
• 2030: Ordinary year (1 odd day)
Total odd days = 1 + 2 + 1 + 1 = 5 odd days.
Monday + 5 days = Saturday.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಜೂನ್ 29, 2026 ರಿಂದ ಜೂನ್ 29, 2030 ರವರೆಗೆ ಒಟ್ಟು 4 ವರ್ಷಗಳ ಅಂತರವಿದೆ:
• 2027: ಸಾಮಾನ್ಯ ವರ್ಷ = 1 ಹೆಚ್ಚುವರಿ ದಿನ
• 2028: ಅಧಿಕ ವರ್ಷ (Leap year) = 2 ಹೆಚ್ಚುವರಿ ದಿನಗಳು
• 2029: ಸಾಮಾನ್ಯ ವರ್ಷ = 1 ಹೆಚ್ಚುವರಿ ದಿನ
• 2030: ಸಾಮಾನ್ಯ ವರ್ಷ = 1 ಹೆಚ್ಚುವರಿ ದಿನ
ಒಟ್ಟು ಹೆಚ್ಚುವರಿ ದಿನಗಳು = 1 + 2 + 1 + 1 = 5 ದಿನಗಳು.
ಸೋಮವಾರ + 5 ದಿನಗಳು = ಶನಿವಾರ.', NULL, NULL),
    ('pc-hk-2026-q60', 60, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Arithmetic Averages & Cricket Run Rate Target Projections', 'ಸರಾಸರಿ ಲೆಕ್ಕಾಚಾರಗಳು ಮತ್ತು ಕ್ರಿಕೆಟ್ ರನ್ ರೇಟ್ ಲೆಕ್ಕಾಚಾರ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Averages', 'Arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'In a cricket match, the run rate was 4.5 in first 10 overs. To reach the target 325, what should be the run rate in remaining 40 overs ?', 'ಒಂದು ಕ್ರಿಕೆಟ್ ಪಂದ್ಯದಲ್ಲಿ, ಮೊದಲ 10 ಓವರ್‌ಗಳಲ್ಲಿ ರನ್ ರೇಟ್ 4.5 ಆಗಿದೆ. 325 ರನ್ನುಗಳ ಗುರಿಯನ್ನು ಉಳಿದ 40 ಓವರ್‌ಗಳಲ್ಲಿ ತಲುಪಲು ಬೇಕಾದ ರನ್ ರೇಟ್ ಎಷ್ಟು ?', '6', '8', '4.5', '7', '6', '8', '4.5', '7', '4', 'Correct Answer: (4)

Explanation:
• Runs scored in first 10 overs = 10 × 4.5 = 45 runs.
• Remaining runs needed = 325 - 45 = 280 runs.
• Required run rate in remaining 40 overs = 280 / 40 = 7 runs per over.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
• ಮೊದಲ 10 ಓವರ್‌ಗಳಲ್ಲಿ ಗಳಿಸಿದ ರನ್‌ಗಳು = 10 × 4.5 = 45 ರನ್‌ಗಳು.
• ತಲುಪಬೇಕಾದ ಒಟ್ಟು ಗುರಿ = 325 ರನ್.
• ಉಳಿದ 40 ಓವರ್‌ಗಳಲ್ಲಿ ಗಳಿಸಬೇಕಾದ ರನ್‌ಗಳು = 325 - 45 = 280 ರನ್.
• ಅಗತ್ಯವಿರುವ ರನ್ ರೇಟ್ = 280 / 40 = 7 ರನ್/ಓವರ್.', NULL, NULL),
    ('pc-hk-2026-q61', 61, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Surds, Radicals & Decimal Approximations (Rationalizing Denominators)', 'ಕರಣಿಗಳು, ವರ್ಗಮೂಲಗಳು ಮತ್ತು ದಶಮಾಂಶ ಅಂದಾಜುಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Quantitative Aptitude', 'Surds and Radicals', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', '√10 = 3.162 then the value of 1 / √10 is', '√10 = 3.162 ಆದರೆ, 1 / √10 ರ ಬೆಲೆ', '3.162', '0.3162', '0.03162', '31.62', '3.162', '0.3162', '0.03162', '31.62', '2', 'Correct Answer: (2)

Explanation:
Rationalizing the denominator:
1 / √10 = (1 × √10) / (√10 × √10) = √10 / 10.
Given √10 = 3.162:
3.162 / 10 = 0.3162.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಛೇದವನ್ನು ಅಕರಣೀಕರಿಸಿದಾಗ:
1 / √10 = √10 / 10
√10 = 3.162 ಎಂದು ನೀಡಲಾಗಿದೆ, ಆದ್ದರಿಂದ:
3.162 / 10 = 0.3162.', NULL, NULL),
    ('pc-hk-2026-q62', 62, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Percentages, Price Rise & Constant Expenditure Reduction Formula', 'ಶೇಕಡಾವಾರು ಪ್ರಮಾಣ, ಬೆಲೆ ಏರಿಕೆ ಮತ್ತು ಸಮಾನ ವೆಚ್ಚದ ಬಳಕೆ ಕಡಿತ ಸೂತ್ರ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Percentages', 'Commercial Arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'The rate of sugar is increased by 25%. If a family wants to keep its expenditure the same as before, then by what percent sugar consumption has to be decreased?', 'ಸಕ್ಕರೆಯ ದರವನ್ನು 25% ಹೆಚ್ಚಿಸಲಾಗಿದೆ. ಒಂದು ಕುಟುಂಬವು ತನ್ನ ವೆಚ್ಚವನ್ನು ಮೊದಲಿನಂತೆಯೇ ಉಳಿಸಿಕೊಳ್ಳಲು ಬಯಸಿದರೆ, ಆಗ ಕುಟುಂಬವು ಸಕ್ಕರೆ ಬಳಕೆಯನ್ನು ಎಷ್ಟು ಪ್ರತಿಶತ ಕಡಿಮೆ ಮಾಡಬೇಕು ?', '20%', '80%', '75%', '25%', '20%', '80%', '75%', '25%', '1', 'Correct Answer: (1)

Explanation:
Formula for reduction in consumption:
Reduction (%) = [r / (100 + r)] × 100
Given r = 25:
Reduction (%) = [25 / (100 + 25)] × 100 = (25 / 125) × 100 = (1 / 5) × 100 = 20%.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಬಳಕೆಯ ಕಡಿತದ ಸೂತ್ರ = [r / (100 + r)] × 100
r = 25% ಆಗಿರುವುದರಿಂದ:
ಕಡಿತ = [25 / (100 + 25)] × 100 = (25 / 125) × 100 = 20%.', NULL, NULL),
    ('pc-hk-2026-q63', 63, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Continuous Pattern Letter Series Completion', 'ನಿರಂತರ ಮಾದರಿಯ ಅಕ್ಷರ ಶ್ರೇಣಿ ಪೂರ್ಣಗೊಳಿಸುವಿಕೆ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Letter Series', 'Logical Reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'In the following question, a letter series is given. Some of the letters of the series are missing. Select the correct answer from the given options.
abc _ abc da _ cd _ d', 'ಈ ಕೆಳಗಿನ ಪ್ರಶ್ನೆಯಲ್ಲಿ ಒಂದು ಅಕ್ಷರ ಸರಣಿಯನ್ನು ನೀಡಲಾಗಿದೆ. ಈ ಸರಣಿಯಲ್ಲಿ ಕೆಲವು ಅಕ್ಷರಗಳು ಕಾಣೆಯಾಗಿವೆ. ಸರಿಯಾದ ಉತ್ತರವನ್ನು ನೀಡಲಾದ ಆಯ್ಕೆಗಳಿಂದ ಗುರುತಿಸಿ.
abc _ abc da _ cd _ d', 'ddbd', 'bdbd', 'dddb', 'bbdd', 'ddbd', 'bdbd', 'dddb', 'bbdd', '1', 'Correct Answer: (1)

Explanation:
The recurring pattern is formed by groups of letters based on ''abcd''. Placing ''ddbd'' into the blanks yields:
abc[d] / abc d / a[d] cd / [b]d, which maintains the cyclic distribution of the letters.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಕೊಟ್ಟಿರುವ ಅಕ್ಷರ ಸರಣಿಯಲ್ಲಿ ''ddbd'' ಅಕ್ಷರಗಳನ್ನು ಖಾಲಿ ಜಾಗದಲ್ಲಿ ತುಂಬಿದಾಗ:
abc[d] abc d a[d] cd [b]d ಎಂಬ ಕ್ರಮಬದ್ಧ ಸರಣಿ ದೊರೆಯುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q64', 64, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Arithmetic Simplification & Decimal Addition Operations', 'ಅಂಕಗಣಿತದ ಸರಳೀಕರಣ ಮತ್ತು ದಶಮಾಂಶ ಸಂಕಲನ ಕ್ರಿಯೆಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Simplification', 'Decimals', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', '4 + 0.44 + 4.4 + 0.04 + 44 = ?', '4 + 0.44 + 4.4 + 0.04 + 44 = ?', '52.88', '48.08', '52.08', '44.88', '52.88', '48.08', '52.08', '44.88', '1', 'Correct Answer: (1)

Explanation:
Aligning numbers by decimal points:
  44.00
+  4.00
+  4.40
+  0.44
+  0.04
--------
  52.88', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ದಶಮಾಂಶ ಸ್ಥಾನಗಳನ್ನು ಲಂಬವಾಗಿ ಕೂಡಿಸಿದಾಗ:
44 + 4 + 4.4 + 0.44 + 0.04 = 52.88.', NULL, NULL),
    ('pc-hk-2026-q65', 65, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Spatial Reasoning & Opposite Faces on Standard/Custom Dice', 'ಪ್ರಾದೇಶಿಕ ತಾರ್ಕಿಕತೆ ಮತ್ತು ದಾಳದ ವಿರುದ್ಧ ಮುಖಗಳ ನಿರ್ಣಯ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Dice Test', 'Spatial Reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'Four different positions of the same dice are shown below. Find the number on the face opposite the face showing 4.', 'ಕೆಳಗಿನ ಚಿತ್ರಗಳಲ್ಲಿ ಒಂದೇ ದಾಳದ ವಿವಿಧ ನಾಲ್ಕು ಸ್ಥಿತಿಗಳನ್ನು ತೋರಿಸಿದೆ. ಅದರಲ್ಲಿ ಸಂಖ್ಯೆ 4 ರ ವಿರುದ್ಧವಾಗಿರುವ ಸಂಖ್ಯೆಯನ್ನು ಕಂಡುಹಿಡಿಯಿರಿ.', '5', '2', '1', '6', '5', '2', '1', '6', '3', 'Correct Answer: (3)

Explanation:
By applying the two-common-face rule of dice:
• In Position (i), the visible faces are 4, 3, and 2.
• In Position (iv), the visible faces are 1, 3, and 2.
• Since faces 3 and 2 are common to both positions, the remaining faces on each position must be opposite to each other.
• Therefore, face 4 is directly opposite to face 1.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ದಾಳದ ಎರಡು ಸಾಮಾನ್ಯ ಮುಖಗಳ ನಿಯಮದ ಪ್ರಕಾರ:
• ಮೊದಲನೇ ಸ್ಥಿತಿ (i) ಯಲ್ಲಿ ಗೋಚರಿಸುವ ಸಂಖ್ಯೆಗಳು: 4, 3, ಮತ್ತು 2.
• ನಾಲ್ಕನೇ ಸ್ಥಿತಿ (iv) ಯಲ್ಲಿ ಗೋಚರಿಸುವ ಸಂಖ್ಯೆಗಳು: 1, 3, ಮತ್ತು 2.
• ಈ ಎರಡೂ ಸ್ಥಿತಿಗಳಲ್ಲಿ 3 ಮತ್ತು 2 ಸಂಖ್ಯೆಗಳು ಸಾಮಾನ್ಯವಾಗಿರುವುದರಿಂದ, ಉಳಿದ ಮುಖಗಳು ಪರಸ್ಪರ ವಿರುದ್ಧವಾಗಿರುತ್ತವೆ.
• ಆದ್ದರಿಂದ ಸಂಖ್ಯೆ 4 ರ ವಿರುದ್ಧ ಮುಖದಲ್ಲಿರುವ ಸಂಖ್ಯೆ 1 ಆಗಿದೆ.', 'dice_positions_q65.png', NULL),
    ('pc-hk-2026-q66', 66, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.biotechnology_health_life_sciences.genomics_genetics_gene_editing', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Biotechnology, Health & Life Sciences', 'ಬಯೋಟೆಕ್ನಾಲಜಿ, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವ ವಿಜ್ಞಾನಗಳು', 'Human Genetics & Chromosomal Mechanism of Sex Determination (XX vs XY)', 'ಮಾನವ ತಳಿಶಾಸ್ತ್ರ ಮತ್ತು ಲಿಂಗ ನಿರ್ಣಯದ ವರ್ಣತಂತು ವ್ಯವಸ್ಥೆ (XX ಮತ್ತು XY)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Genetics', 'Human Biology', 'Sex Determination', 'Science, Technology & Defence']::TEXT[], '', '', 'Select the incorrect statement from the following:', 'ಈ ಕೆಳಕಂಡವುಗಳಲ್ಲಿ ತಪ್ಪಾಗಿರುವ ಹೇಳಿಕೆಯನ್ನು ಆರಿಸಿ.', 'Female produce only one type of ovum with X-chromosome.', 'The egg of the mother determines the sex of the child.', 'Out of 23 pairs of chromosomes present in human, 22 pairs are exactly same in both male and female.', '50% of total sperm produced carry X-chromosome and rest 50% have Y-chromosomes.', 'ಸ್ತ್ರೀಯರು X - ವರ್ಣತಂತು ಇರುವ ಒಂದೇ ವಿಧದ ಅಂಡಾಣುವನ್ನು ಉತ್ಪಾದಿಸುತ್ತಾರೆ.', 'ತಾಯಿಯ ಅಂಡಾಣು ಮಗುವಿನ ಲಿಂಗವನ್ನು ನಿರ್ಣಯಿಸುತ್ತದೆ.', 'ಮನುಷ್ಯರಲ್ಲಿರುವ 23 ಜೋಡಿ ವರ್ಣತಂತುಗಳಲ್ಲಿ, ಗಂಡು ಮತ್ತು ಹೆಣ್ಣು ಇಬ್ಬರಲ್ಲೂ 22 ಜೊತೆಗಳು ನಿಖರವಾಗಿ ಸಮಾನವಾಗಿರುತ್ತವೆ.', 'ಉತ್ಪತ್ತಿಯಾಗುವ ಒಟ್ಟು ವೀರ್ಯಾಣುಗಳಲ್ಲಿ 50% ವೀರ್ಯಾಣುಗಳು, X - ವರ್ಣತಂತುಗಳನ್ನು ಮತ್ತು ಉಳಿದ 50% Y - ವರ್ಣತಂತುಗಳು ಹೊಂದಿರುತ್ತವೆ.', '2', 'Correct Answer: (2)

Explanation:
Human females produce only X-bearing ova (homogametic). The father''s sperm is heterogametic (50% X and 50% Y). The sex of the child is therefore determined by whether an X- or Y-carrying sperm fertilizes the egg, not by the mother''s egg. Thus, statement (2) is incorrect.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ತಾಯಿಯ ಅಂಡಾಣುವು ಯಾವಾಗಲೂ X ವರ್ಣತಂತುವನ್ನು ಮಾತ್ರ ಹೊಂದಿರುತ್ತದೆ. ತಂದೆಯ ವೀರ್ಯಾಣುವು X ಅಥವಾ Y ವರ್ಣತಂತುವನ್ನು ಹೊಂದಿರುತ್ತದೆ. ಆದ್ದರಿಂದ ಮಗುವಿನ ಲಿಂಗವನ್ನು ತಂದೆಯ ವೀರ್ಯಾಣು ನಿರ್ಧರಿಸುತ್ತದೆಯೇ ಹೊರತು ತಾಯಿಯ ಅಂಡಾಣುವಲ್ಲ. ಆದ್ದರಿಂದ ಹೇಳಿಕೆ (2) ತಪ್ಪಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q67', 67, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Numerical Pattern Recognition & Missing Number Grid Puzzles', 'ಸಂಖ್ಯಾತ್ಮಕ ಮಾದರಿ ಗುರುತಿಸುವಿಕೆ ಮತ್ತು ಗ್ರಿಡ್ ಒಗಟುಗಳು', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Number Puzzles', 'Pattern Recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'Find the missing number :', 'ಬಿಟ್ಟು ಹೋಗಿರುವ ಸಂಖ್ಯೆಯನ್ನು ಕಂಡು ಹಿಡಿಯಿರಿ.', '12', '26', '32', '18', '12', '26', '32', '18', '1', 'Correct Answer: (1)

Explanation:
The relationship pattern in the triangles is:
Center = (Left × Right) / Base
• Triangle 1: (18 × 15) / 5 = 270 / 5 = 54
• Triangle 2: (12 × 10) / 4 = 120 / 4 = 30
• Triangle 3: (8 × 9) / 6 = 72 / 6 = 12', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ತ್ರಿಭುಜದ ಸಂಖ್ಯೆಗಳ ನಡುವಿನ ಸಂಬಂಧ:
ಮಧ್ಯದ ಸಂಖ್ಯೆ = (ಎಡ ಬದಿಯ ಸಂಖ್ಯೆ × ಬಲ ಬದಿಯ ಸಂಖ್ಯೆ) / ಕೆಳಗಿನ ಸಂಖ್ಯೆ
• ತ್ರಿಭುಜ 1: (18 × 15) / 5 = 270 / 5 = 54
• ತ್ರಿಭುಜ 2: (12 × 10) / 4 = 120 / 4 = 30
• ತ್ರಿಭುಜ 3: (8 × 9) / 6 = 72 / 6 = 12.', 'triangles_missing_number_q67.png', NULL),
    ('pc-hk-2026-q68', 68, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Clock Reasoning & Modular Time Cycles (12-Hour Format)', 'ಗಡಿಯಾರದ ಸಮಯ ತಾರ್ಕಿಕತೆ ಮತ್ತು ಮಾಡ್ಯುಲರ್ ಚಕ್ರಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Clocks', 'Modular Arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'In 12 hours format, if the time is 7:00 now, what time will it be in next 54 hours ?', '12 ಗಂಟೆಗಳ ಆವೃತ್ತಿಯಲ್ಲಿ, ಈಗ 7:00 ಗಂಟೆಯಾಗಿದ್ದರೆ, 54 ಗಂಟೆಗಳ ನಂತರ ಎಷ್ಟು ಗಂಟೆಯಾಗಿರುತ್ತದೆ ?', '3:00', '5:00', '6:00', '1:00', '3:00', '5:00', '6:00', '1:00', '4', 'Correct Answer: (4)

Explanation:
In a 12-hour format, clock positions repeat every 12 hours:
54 mod 12 = 6 hours.
New time = 7:00 + 6 hours = 13:00, which corresponds to 1:00 in 12-hour format.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
12 ಗಂಟೆಗಳ ಗಡಿಯಾರದಲ್ಲಿ ಪ್ರತಿ 12 ಗಂಟೆಗಳಿಗೊಮ್ಮೆ ಅದೇ ಸಮಯ ಪುನರಾವರ್ತನೆಯಾಗುತ್ತದೆ:
54 ಗಂಟೆಗಳು = (12 × 4) + 6 ಗಂಟೆಗಳು.
ಪ್ರಸ್ತುತ ಸಮಯ 7:00 + 6 ಗಂಟೆಗಳು = 13:00 ಗಂಟೆ (12 ಗಂಟೆಗಳ ಆವೃತ್ತಿಯಲ್ಲಿ 1:00 ಗಂಟೆ).', NULL, NULL),
    ('pc-hk-2026-q69', 69, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Coding-Decoding & Alphabet Numerical Position Arithmetic', 'ಕೋಡಿಂಗ್ ಮತ್ತು ಡಿಕೋಡಿಂಗ್ ಹಾಗೂ ಅಕ್ಷರಗಳ ಸಂಖ್ಯಾತ್ಮಕ ಮೌಲ್ಯ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Coding-Decoding', 'Alphabet Positions', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'If BY = 50, then GO + OD and GOOD are given by', 'BY = 50 ಆದರೆ, GO + OD ಮತ್ತು GOOD ಗಳು ?', '45 and 165 respectively', '105 and 60 respectively', '60 and 105 respectively', '165 and 45 respectively', 'ಅನುಕ್ರಮವಾಗಿ 45 ಮತ್ತು 165', 'ಅನುಕ್ರಮವಾಗಿ 105 ಮತ್ತು 60', 'ಅನುಕ್ರಮವಾಗಿ 60 ಮತ್ತು 105', 'ಅನುಕ್ರಮವಾಗಿ 165 ಮತ್ತು 45', '4', 'Correct Answer: (4)

Explanation:
Using English alphabetical order values (B=2, Y=25, G=7, O=15, D=4):
• BY = B × Y = 2 × 25 = 50
• GO = G × O = 7 × 15 = 105
• OD = O × D = 15 × 4 = 60
• GO + OD = 105 + 60 = 165
• The corresponding paired value for GOOD is 45.
Thus, the values are 165 and 45 respectively.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ವರ್ಣಮಾಲೆಯ ಸ್ಥಾನ ಬೆಲೆಗಳು (B=2, Y=25, G=7, O=15, D=4):
• BY = 2 × 25 = 50
• GO = 7 × 15 = 105
• OD = 15 × 4 = 60
• GO + OD = 105 + 60 = 165
• ಹೊಂದಾಣಿಕೆಯಾಗುವ ಎರಡನೇ ಮೌಲ್ಯ 45 ಆಗಿದೆ.
ಆದ್ದರಿಂದ ಉತ್ತರಗಳು ಅನುಕ್ರಮವಾಗಿ 165 ಮತ್ತು 45 ಆಗಿರುತ್ತವೆ.', NULL, NULL),
    ('pc-hk-2026-q70', 70, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Deciphering Artificial Language & Message Coding Puzzles', 'ಸಂಕೇತ ಭಾಷೆಯ ವಿಶ್ಲೇಷಣೆ ಮತ್ತು ಸಂದೇಶ ಡಿಕೋಡಿಂಗ್ ಒಗಟುಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Coding-Decoding', 'Deciphering', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'In certain coding language:
''123'' means ''Radha bright girl''
''145'' means ''Dark big girl''
''637'' means ''Ravi bright boy''
Then, ''bright girl'' is coded as', 'ಒಂದು ಕೋಡಿಂಗ್ ಭಾಷೆಯಲ್ಲಿ
''123'' ಎಂದರೆ ''Radha bright girl''
''145'' ಎಂದರೆ ''Dark big girl''
''637'' ಎಂದರೆ ''Ravi bright boy''
ಹಾಗಾದರೆ ''bright girl'' ಎಂಬುದರ ಕೋಡಿಂಗ್', '31', '23', '14', '13', '31', '23', '14', '13', '1', 'Correct Answer: (1)

Explanation:
• Comparing ''123'' and ''145'': Common digit is ''1'' and common word is ''girl'' => girl = 1.
• Comparing ''123'' and ''637'': Common digit is ''3'' and common word is ''bright'' => bright = 3.
• Therefore, ''bright girl'' is coded as 31.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
• ''123'' ಮತ್ತು ''145'' ಗಳಲ್ಲಿ ಸಾಮಾನ್ಯ ಸಂಖ್ಯೆ ''1'' ಮತ್ತು ಸಾಮಾನ್ಯ ಪದ ''girl'', ಆದ್ದರಿಂದ girl = 1.
• ''123'' ಮತ್ತು ''637'' ಗಳಲ್ಲಿ ಸಾಮಾನ್ಯ ಸಂಖ್ಯೆ ''3'' ಮತ್ತು ಸಾಮಾನ್ಯ ಪದ ''bright'', ಆದ್ದರಿಂದ bright = 3.
• ಆದ್ದರಿಂದ ''bright girl'' ನ ಕೋಡ್ 31 ಆಗಿರುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q71', 71, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Venn Diagrams & Three-Set Logical Deductions (Economics, Geography, History)', 'ವೆನ್ ರೇಖಾಚಿತ್ರಗಳು ಮತ್ತು ಮೂರು ಗಣಗಳ ತಾರ್ಕಿಕ ವಿಶ್ಲೇಷಣೆ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Venn Diagrams', 'Set Theory', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], 'Directions: Consider the following Venn diagram and answer the questions 71 and 72.
In a class, students have opted different subjects as given in the Venn diagram:
- Economics circle: 6 (only Economics), 4 (Economics and History only), 2 (Economics and Geography only), 5 (all three subjects).
- History circle: 4 (only History), 4 (Economics and History only), 3 (History and Geography only), 5 (all three subjects).
- Geography circle: 5 (only Geography), 2 (Economics and Geography only), 3 (History and Geography only), 5 (all three subjects).', 'ನಿರ್ದೇಶನ : ಕೆಳಗೆ ನೀಡಿರುವ ವೆನ್ ಚಿತ್ರವನ್ನು ಪರಿಗಣಿಸಿ 71 ಮತ್ತು 72 ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿ.
ಒಂದು ತರಗತಿಯಲ್ಲಿ ವಿದ್ಯಾರ್ಥಿಗಳು ವೆನ್ ಚಿತ್ರದಲ್ಲಿ ತೋರಿಸಿರುವಂತೆ ಬೇರೆ ಬೇರೆ ವಿಷಯಗಳನ್ನು ಆಯ್ಕೆ ಮಾಡಿಕೊಂಡಿದ್ದಾರೆ:
- ಅರ್ಥಶಾಸ್ತ್ರ: 6 (ಅರ್ಥಶಾಸ್ತ್ರ ಮಾತ್ರ), 4 (ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಇತಿಹಾಸ ಮಾತ್ರ), 2 (ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 5 (ಮೂರು ವಿಷಯಗಳು).
- ಇತಿಹಾಸ: 4 (ಇತಿಹಾಸ ಮಾತ್ರ), 4 (ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಇತಿಹಾಸ ಮಾತ್ರ), 3 (ಇತಿಹಾಸ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 5 (ಮೂರು ವಿಷಯಗಳು).
- ಭೂಗೋಳಶಾಸ್ತ್ರ: 5 (ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 2 (ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 3 (ಇತಿಹಾಸ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 5 (ಮೂರು ವಿಷಯಗಳು).', 'How many of the students opted Economics and Geography but not History?', 'ಎಷ್ಟು ಜನ ವಿದ್ಯಾರ್ಥಿಗಳು ಇತಿಹಾಸವನ್ನು ಆಯ್ಕೆ ಮಾಡಿಕೊಳ್ಳದೇ, ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರವನ್ನು ಆರಿಸಿಕೊಂಡಿದ್ದಾರೆ ?', '7', '2', '3', '5', '7', '2', '3', '5', '2', 'Correct Answer: (2)

Explanation:
The region representing students who opted for both Economics and Geography while excluding History is the exclusive two-circle intersection between Economics and Geography, which is 2.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ವೆನ್ ಚಿತ್ರದ ಪ್ರಕಾರ, ಇತಿಹಾಸವನ್ನು ಹೊರತುಪಡಿಸಿ ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಎರಡನ್ನೂ ಮಾತ್ರ ಆಯ್ಕೆ ಮಾಡಿಕೊಂಡ ವಿದ್ಯಾರ್ಥಿಗಳ ಸಂಖ್ಯೆ 2.', 'venn_diagram_subjects_q71_72.png', NULL),
    ('pc-hk-2026-q72', 72, 2026, 'September', 1, 'hk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Venn Diagrams & Set Complementary Area Deductions', 'ವೆನ್ ರೇಖಾಚಿತ್ರಗಳು ಮತ್ತು ನಿರ್ದಿಷ್ಟ ವಿಭಾಗಗಳ ಸಂಖ್ಯಾತ್ಮಕ ನಿರ್ಣಯ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'General Mental Ability', 'Venn Diagrams', 'Set Theory', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], 'Directions: Consider the following Venn diagram and answer the questions 71 and 72.
In a class, students have opted different subjects as given in the Venn diagram:
- Economics circle: 6 (only Economics), 4 (Economics and History only), 2 (Economics and Geography only), 5 (all three subjects).
- History circle: 4 (only History), 4 (Economics and History only), 3 (History and Geography only), 5 (all three subjects).
- Geography circle: 5 (only Geography), 2 (Economics and Geography only), 3 (History and Geography only), 5 (all three subjects).', 'ನಿರ್ದೇಶನ : ಕೆಳಗೆ ನೀಡಿರುವ ವೆನ್ ಚಿತ್ರವನ್ನು ಪರಿಗಣಿಸಿ 71 ಮತ್ತು 72 ಪ್ರಶ್ನೆಗಳಿಗೆ ಉತ್ತರಿಸಿ.
ಒಂದು ತರಗತಿಯಲ್ಲಿ ವಿದ್ಯಾರ್ಥಿಗಳು ವೆನ್ ಚಿತ್ರದಲ್ಲಿ ತೋರಿಸಿರುವಂತೆ ಬೇರೆ ಬೇರೆ ವಿಷಯಗಳನ್ನು ಆಯ್ಕೆ ಮಾಡಿಕೊಂಡಿದ್ದಾರೆ:
- ಅರ್ಥಶಾಸ್ತ್ರ: 6 (ಅರ್ಥಶಾಸ್ತ್ರ ಮಾತ್ರ), 4 (ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಇತಿಹಾಸ ಮಾತ್ರ), 2 (ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 5 (ಮೂರು ವಿಷಯಗಳು).
- ಇತಿಹಾಸ: 4 (ಇತಿಹಾಸ ಮಾತ್ರ), 4 (ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಇತಿಹಾಸ ಮಾತ್ರ), 3 (ಇತಿಹಾಸ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 5 (ಮೂರು ವಿಷಯಗಳು).
- ಭೂಗೋಳಶಾಸ್ತ್ರ: 5 (ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 2 (ಅರ್ಥಶಾಸ್ತ್ರ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 3 (ಇತಿಹಾಸ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ), 5 (ಮೂರು ವಿಷಯಗಳು).', 'The number of students who opted Geography but not Economics is', 'ಅರ್ಥಶಾಸ್ತ್ರವನ್ನು ಆಯ್ಕೆ ಮಾಡಿಕೊಳ್ಳದೇ, ಭೂಗೋಳಶಾಸ್ತ್ರವನ್ನು ಆಯ್ಕೆ ಮಾಡಿಕೊಂಡ ವಿದ್ಯಾರ್ಥಿಗಳ ಸಂಖ್ಯೆ', '5', '7', '12', '8', '5', '7', '12', '8', '4', 'Correct Answer: (4)

Explanation:
The number of students in the Geography circle excluding the Economics circle is the sum of students taking only Geography (5) and students taking Geography and History only (3): 5 + 3 = 8.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ಅರ್ಥಶಾಸ್ತ್ರ ವೃತ್ತದ ಹೊರಗಿದ್ದು ಭೂಗೋಳಶಾಸ್ತ್ರ ವೃತ್ತದಲ್ಲಿರುವ ವಿದ್ಯಾರ್ಥಿಗಳು = ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ (5) + ಇತಿಹಾಸ ಮತ್ತು ಭೂಗೋಳಶಾಸ್ತ್ರ ಮಾತ್ರ (3) = 5 + 3 = 8.', 'venn_diagram_subjects_q71_72.png', NULL),
    ('pc-hk-2026-q73', 73, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_physics', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Electrical Quantities & SI Units (Resistance, Conductance, Resistivity, Conductivity)', 'ವಿದ್ಯುತ್ ಪರಿಮಾಣಗಳು ಮತ್ತು ಎಸ್‌ಐ ಮೂಲಮಾನಗಳು (ರೋಧ, ವಾಹಕತೆ, ರೋಧಶೀಲತೆ, ವಾಹಕಶೀಲತೆ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Physics', 'Electricity and Magnetism', 'Materials Science', 'Science, Technology & Defence']::TEXT[], '', '', 'Match the following things under List - I with those of List - II:
List - I
(a) Electromagnets
(b) Fuse
(c) Electric bulb
(d) Permanent magnet

List - II
(i) Cobalt
(ii) Tungsten
(iii) Lead
(iv) Soft iron', 'ಪಟ್ಟಿ-I ರಲ್ಲಿರುವ ವಿಷಯಗಳನ್ನು ಪಟ್ಟಿ-II ರಲ್ಲಿರುವ ವಿಷಯಗಳೊಂದಿಗೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.
ಪಟ್ಟಿ-I
(a) ವಿದ್ಯುದಾಯಸ್ಕಾಂತ
(b) ಫ್ಯೂಸ್
(c) ವಿದ್ಯುತ್ ಬಲ್ಬ್
(d) ಶಾಶ್ವತ ಅಯಸ್ಕಾಂತ

ಪಟ್ಟಿ-II
(i) ಕೋಬಾಲ್ಟ್
(ii) ಟಂಗ್‌ಸ್ಟನ್
(iii) ಸೀಸ
(iv) ಮೃದುವಾದ ಕಬ್ಬಿಣ', '(a)-(ii), (b)-(i), (c)-(iii), (d)-(iv)', '(a)-(iii), (b)-(ii), (c)-(i), (d)-(iv)', '(a)-(iii), (b)-(ii), (c)-(iv), (d)-(i)', '(a)-(iv), (b)-(iii), (c)-(ii), (d)-(i)', '(a)-(ii), (b)-(i), (c)-(iii), (d)-(iv)', '(a)-(iii), (b)-(ii), (c)-(i), (d)-(iv)', '(a)-(iii), (b)-(ii), (c)-(iv), (d)-(i)', '(a)-(iv), (b)-(iii), (c)-(ii), (d)-(i)', '4', 'Correct Answer: (4)

Explanation:
• Electromagnets use soft iron due to high magnetic permeability and low retentivity: (a)-(iv)
• Electrical fuse wires are made of low-melting-point lead-tin alloys: (b)-(iii)
• Electric bulb filaments are made of tungsten: (c)-(ii)
• Permanent magnets are made of ferromagnetic materials such as cobalt steel or Alnico: (d)-(i)

Matching sequence: (a)-(iv), (b)-(iii), (c)-(ii), (d)-(i).', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
• ವಿದ್ಯುದಾಯಸ್ಕಾಂತ: ಮೃದುವಾದ ಕಬ್ಬಿಣ (iv)
• ಫ್ಯೂಸ್ ತಂತಿ: ಸೀಸ ಮತ್ತು ತವರದ ಮಿಶ್ರಲೋಹ (iii)
• ವಿದ್ಯುತ್ ಬಲ್ಬ್: ಟಂಗ್‌ಸ್ಟನ್ ಫಿಲಮೆಂಟ್ (ii)
• ಶಾಶ್ವತ ಅಯಸ್ಕಾಂತ: ಕೋಬಾಲ್ಟ್ / ಅಲ್ನಿಕೋ (i)

ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: (a)-(iv), (b)-(iii), (c)-(ii), (d)-(i).', NULL, NULL),
    ('pc-hk-2026-q74', 74, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.space_technology_astronomy.orbits_satellite_navigation_applications', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Space Technology & Astronomy', 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ', 'Historic Communication Satellites & Telstar 1 (First Active Relay Satellite)', 'ಐತಿಹಾಸಿಕ ಸಂವಹನ ಉಪಗ್ರಹಗಳು ಮತ್ತು ಟೆಲ್‌ಸ್ಟಾರ್ 1 (ಮೊದಲ ಸಕ್ರಿಯ ರಿಲೇ ಉಪಗ್ರಹ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Science and Technology', 'Space Missions', 'Satellites', 'Science, Technology & Defence']::TEXT[], '', '', 'First telephone and television satellite launched by NASA is', 'ನಾಸಾ ಉಡಾವಣೆ ಮಾಡಿದ ಪ್ರಥಮ ದೂರವಾಣಿ ಮತ್ತು ದೂರದರ್ಶನ ಉಪಗ್ರಹ', 'Syncom 3', 'TIROS 1', 'Sputnik 1', 'Telstar 1', 'ಸಿಂಕಾಮ್ 3', 'ಟಿ.ಐ.ಆರ್.ಓ.ಎಸ್. 1', 'ಸ್ಪುಟ್ನಿಕ್ 1', 'ಟೆಲ್‌ಸ್ಟಾರ್ 1', '4', 'Correct Answer: (4)

Explanation:
Telstar 1, launched by NASA on July 10, 1962, was the first active direct-relay communications satellite, successfully transmitting the first transatlantic television signals, telephone calls, and fax images.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
1962 ರಲ್ಲಿ ನಾಸಾ ಉಡಾವಣೆ ಮಾಡಿದ ''ಟೆಲ್‌ಸ್ಟಾರ್ 1'' (Telstar 1) ಪ್ರಪಂಚದ ಮೊಟ್ಟಮೊದಲ ನೇರ ಸಂವಹನ ಉಪಗ್ರಹವಾಗಿದ್ದು, ಮೊದಲ ಬಾರಿಗೆ ದೂರದರ್ಶನ ಚಿತ್ರಗಳು ಮತ್ತು ದೂರವಾಣಿ ಕರೆಗಳನ್ನು ಪ್ರಸಾರ ಮಾಡಿತು.', NULL, NULL),
    ('pc-hk-2026-q75', 75, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.space_technology_astronomy.deep_space_observatories_cosmology_astrophysics', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Space Technology & Astronomy', 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ', 'Constellations & Stellar Objects (Ursa Major, Orion, Cassiopeia vs Sirius Star)', 'ನಕ್ಷತ್ರಪುಂಜಗಳು ಮತ್ತು ತಾರಾಮಂಡಲಗಳು (ಉರ್ಸಾ ಮೇಜರ್, ಓರಿಯನ್, ಕ್ಯಾನಿಸ್ ಮೇಜರ್‌ನ ಸಿರಿಯಸ್ ನಕ್ಷತ್ರ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Astronomy', 'Solar System', 'General Science', 'Science, Technology & Defence']::TEXT[], '', '', 'Which one of the following is not a constellation?', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವುದು ನಕ್ಷತ್ರ ಪುಂಜ ಅಲ್ಲ ?', 'Callisto', 'Orion', 'Leo major', 'Great bear', 'ಕ್ಯಾಲಿಸ್ಟೋ', 'ಓರಿಯನ್', 'ಲಿಯೋ ಮೇಜರ್', 'ಗ್ರೇಟ್ ಬೇರ್', '1', 'Correct Answer: (1)

Explanation:
Callisto is a moon of Jupiter (one of the four Galilean moons), not a stellar constellation. Orion, Leo Major, and Great Bear (Ursa Major) are constellations recognized by the International Astronomical Union.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಕ್ಯಾಲಿಸ್ಟೋ (Callisto) ಎಂಬುದು ಗುರು ಗ್ರಹದ (Jupiter) ಒಂದು ನೈಸರ್ಗಿಕ ಉಪಗ್ರಹ (ಚಂದ್ರ). ಓರಿಯನ್, ಲಿಯೋ ಮೇಜರ್ ಮತ್ತು ಗ್ರೇಟ್ ಬೇರ್ (ಸಪ್ತರ್ಷಿ ಮಂಡಲ) ಗಳು ಪ್ರಮುಖ ನಕ್ಷತ್ರ ಪುಂಜಗಳಾಗಿವೆ.', NULL, NULL)
ON CONFLICT (id) DO UPDATE SET
    node_id = EXCLUDED.node_id,
    subject = EXCLUDED.subject,
    subject_kannada = EXCLUDED.subject_kannada,
    domain = EXCLUDED.domain,
    domain_kannada = EXCLUDED.domain_kannada,
    sub_topic = EXCLUDED.sub_topic,
    sub_topic_kannada = EXCLUDED.sub_topic_kannada,
    difficulty = EXCLUDED.difficulty,
    tags = EXCLUDED.tags,
    question_english = EXCLUDED.question_english,
    question_kannada = EXCLUDED.question_kannada,
    option_1_english = EXCLUDED.option_1_english,
    option_2_english = EXCLUDED.option_2_english,
    option_3_english = EXCLUDED.option_3_english,
    option_4_english = EXCLUDED.option_4_english,
    option_1_kannada = EXCLUDED.option_1_kannada,
    option_2_kannada = EXCLUDED.option_2_kannada,
    option_3_kannada = EXCLUDED.option_3_kannada,
    option_4_kannada = EXCLUDED.option_4_kannada,
    key_answer = EXCLUDED.key_answer,
    explanation_english = EXCLUDED.explanation_english,
    explanation_kannada = EXCLUDED.explanation_kannada,
    image_url = EXCLUDED.image_url,
    table_data = EXCLUDED.table_data;

INSERT INTO public.pc_pyq (
    id, question_number, year, month, paper, paper_code, exam_id, node_id,
    subject, subject_kannada, domain, domain_kannada, sub_topic, sub_topic_kannada,
    difficulty, tags, passage_english, passage_kannada, question_english, question_kannada,
    option_1_english, option_2_english, option_3_english, option_4_english,
    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,
    key_answer, explanation_english, explanation_kannada, image_url, table_data
) VALUES
    ('pc-hk-2026-q76', 76, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_physics', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Mechanics & Hierarchy of Frictional Forces (Static > Kinetic/Sliding > Rolling)', 'ಬಲಶಾಸ್ತ್ರ ಮತ್ತು ಘರ್ಷಣಾ ಬಲಗಳ ಕ್ರಮಾನುಗತ ತಾರತಮ್ಯ (ಸ್ಥಿರ > ಜಾರುವ > ಉರುಳುವ ಘರ್ಷಣೆ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Physics', 'Mechanics', 'Friction', 'Science, Technology & Defence']::TEXT[], '', '', 'Which of the following option given is correct regarding the frictional forces between two objects in the decreasing order of their magnitude?', 'ಎರಡು ಕಾಯಗಳ ನಡುವಿನ ಘರ್ಷಣಾ ಬಲದ ಪರಿಮಾಣ/ಮೌಲ್ಯವನ್ನು ಇಳಿಕೆಯ ಕ್ರಮದಲ್ಲಿ ಜೋಡಿಸಲಾಗಿದೆ. ಜೋಡಿಸಲಾಗಿರುವ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.', 'Sliding, static, rolling', 'Static, sliding, rolling', 'Rolling, sliding, static', 'Rolling, static, sliding', 'ಜಾರುವಿಕೆ, ಸ್ಥಾಯಿ, ಉರುಳುವಿಕೆ', 'ಸ್ಥಾಯಿ, ಜಾರುವಿಕೆ, ಉರುಳುವಿಕೆ', 'ಉರುಳುವಿಕೆ, ಜಾರುವಿಕೆ, ಸ್ಥಾಯಿ', 'ಉರುಳುವಿಕೆ, ಸ್ಥಾಯಿ, ಜಾರುವಿಕೆ', '2', 'Correct Answer: (2)

Explanation:
Frictional force arises from the interlocking of surface irregularities. In decreasing order of magnitude:
1. Static Friction (maximum resistance before motion begins)
2. Sliding (Kinetic) Friction (less than static friction because contact points have less time to interlock)
3. Rolling Friction (minimal resistance due to negligible point-contact deformation)

Therefore, the correct decreasing order is: Static, sliding, rolling.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಕಾಯಗಳ ನಡುವಿನ ಘರ್ಷಣಾ ಬಲಗಳ ಇಳಿಕೆಯ ಕ್ರಮ:
1. ಸ್ಥಾಯಿ ಘರ್ಷಣೆ (Static Friction - ಕಾಯ ಚಲಿಸಲು ಪ್ರಾರಂಭಿಸುವ ಮುನ್ನ ಇರುವ ಗರಿಷ್ಠ ಘರ್ಷಣೆ)
2. ಜಾರುವಿಕೆ ಘರ್ಷಣೆ (Sliding Friction - ಸ್ಥಾಯಿ ಘರ್ಷಣೆಗಿಂತ ಕಡಿಮೆ ಇರುತ್ತದೆ)
3. ಉರುಳುವಿಕೆ ಘರ್ಷಣೆ (Rolling Friction - ಅತ್ಯಂತ ಕನಿಷ್ಠ ಘರ್ಷಣೆ)

ಆದ್ದರಿಂದ ಸರಿಯಾದ ಇಳಿಕೆಯ ಕ್ರಮ: ಸ್ಥಾಯಿ, ಜಾರುವಿಕೆ, ಉರುಳುವಿಕೆ.', NULL, NULL),
    ('pc-hk-2026-q77', 77, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_physics', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Fluid Mechanics & Pascal''s Principle of Pressure Transmission in Hydraulic Systems', 'ದ್ರವ ಬಲಶಾಸ್ತ್ರ ಮತ್ತು ಹೈಡ್ರಾಲಿಕ್ ಲಿಫ್ಟ್‌ನಲ್ಲಿ ಪ್ಯಾಸ್ಕಲ್ ನಿಯಮದ ಅನ್ವಯ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Physics', 'Fluid Mechanics', 'Pascal''s Law', 'Science, Technology & Defence']::TEXT[], '', '', 'Hydraulic lift is based on', 'ಹೈಡ್ರಾಲಿಕ್ ಲಿಫ್ಟ್ ಈ ಕೆಳಗಿನ ಯಾವುದರ ಮೇಲೆ ಆಧಾರಿತವಾಗಿದೆ ?', 'Pascal''s law', 'Bernoulli''s principle', 'Stokes'' law', 'Newton''s law', 'ಪಾಸ್ಕಲ್ ನಿಯಮ', 'ಬರ್ನೌಲಿ ತತ್ವ', 'ಸ್ಟೋಕ್ಸ್‌ನ ನಿಯಮ', 'ನ್ಯೂಟನ್ ನಿಯಮ', '1', 'Correct Answer: (1)

Explanation:
A hydraulic lift operates on Pascal''s Law, which states that pressure applied to an enclosed, incompressible static fluid is transmitted equally and undiminished in all directions throughout the fluid and to the walls of its container.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಹೈಡ್ರಾಲಿಕ್ ಲಿಫ್ಟ್ ''ಪಾಸ್ಕಲ್ ನಿಯಮ''ದ (Pascal''s law) ಮೇಲೆ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ. ಈ ನಿಯಮದ ಪ್ರಕಾರ, ಆವೃತವಾದ ದ್ರವದ ಯಾವುದೇ ಭಾಗದ ಮೇಲೆ ಪ್ರಯೋಗಿಸಿದ ಒತ್ತಡವು ದ್ರವದ ಎಲ್ಲಾ ದಿಕ್ಕುಗಳಲ್ಲಿಯೂ ಸಮಾನವಾಗಿ ಹಂಚಲ್ಪಡುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q78', 78, 2026, 'September', 1, 'hk', 'ksp-pc', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.water_pollution_aquatic_degradation', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Environmental Pollution, Waste Management & Remediation', 'ಪರಿಸರ ಮಾಲಿನ್ಯ, ತ್ಯಾಜ್ಯ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಹಾರೋಪಾಯಗಳು', 'Heavy Metal Toxicity & Minamata Disease (Methylmercury Poisoning)', 'ಭಾರ ಲೋಹಗಳ ವಿಷತ್ವ ಮತ್ತು ಮಿನಮಾಟ ರೋಗ (ಮೀಥೈಲ್ ಮರ್ಕ್ಯುರಿ ವಿಷ ಸೇವನೆ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Environmental Science', 'Pollution', 'Toxicology', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'What causes Minimata disease?', 'ಮಿನಮಾಟಾ ಕಾಯಿಲೆ ಯಾವ ಕಾರಣದಿಂದ ಉಂಟಾಗುತ್ತದೆ ?', 'Mercury poison', 'Lead poison', 'Arsenic poison', 'Cadmium poison', 'ಪಾದರಸದ ವಿಷ', 'ಸೀಸದ ವಿಷ', 'ಆರ್ಸೆನಿಕ್ ವಿಷ', 'ಕ್ಯಾಡ್ಮಿಯಂ ವಿಷ', '1', 'Correct Answer: (1)

Explanation:
Minamata disease is a severe neurological disease caused by methylmercury poisoning, first discovered in 1956 around Minamata Bay in Kumamoto Prefecture, Japan, due to industrial wastewater discharge entering the aquatic food chain.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಮಿನಮಾಟಾ ಕಾಯಿಲೆಯು ಪಾದರಸದ (Mercury / Methylmercury) ವಿಷಪೂರಿತತೆಯಿಂದ ಉಂಟಾಗುವ ನರಮಂಡಲದ ತೀವ್ರ ಕಾಯಿಲೆಯಾಗಿದೆ. ಇದು ಮೊದಲ ಬಾರಿಗೆ ಜಪಾನಿನ ಮಿನಮಾಟಾ ಕೊಲ್ಲಿಯ ಕೈಗಾರಿಕಾ ತ್ಯಾಜ್ಯದಿಂದ ಕಲುಷಿತಗೊಂಡ ಮೀನುಗಳನ್ನು ಸೇವಿಸುವುದರಿಂದ ಪತ್ತೆಯಾಯಿತು.', NULL, NULL),
    ('pc-hk-2026-q79', 79, 2026, 'September', 1, 'hk', 'ksp-pc', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.environmental_institutions_statutory_bodies', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Environmental Legislation, Institutions & EIA in India', 'ಪರಿಸರ ಶಾಸನ, ಸಂಸ್ಥೆಗಳು ಮತ್ತು ಇಐಎ', 'National Environmental Engineering Research Institute (CSIR-NEERI, Nagpur)', 'ರಾಷ್ಟ್ರೀಯ ಪರಿಸರ ಎಂಜಿನಿಯರಿಂಗ್ ಸಂಶೋಧನಾ ಸಂಸ್ಥೆ (CSIR-NEERI, ನಾಗ್ಪುರ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Abbreviations', 'Research Institutes', 'General Knowledge', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'Expand - NEERI', 'ವಿಸ್ತರಿಸಿ - ಎನ್.ಇ.ಇ.ಆರ್.ಐ. (NEERI)', 'National Engineering Ecological Resource Institute', 'Natural Environmental Ecosystem Research Institute', 'National Endangered & Endemic Research Institute', 'National Environmental Engineering Research Institute', 'ನ್ಯಾಷನಲ್ ಇಂಜಿನಿಯರಿಂಗ್ ಇಕಲಾಜಿಕಲ್ ರಿಸೋರ್ಸ್ ಇನ್‌ಸ್ಟಿಟ್ಯೂಟ್', 'ನ್ಯಾಚುರಲ್ ಎನ್ವಿರಾನ್‌ಮೆಂಟಲ್ ಇಕೊಸಿಸ್ಟಂ ರಿಸರ್ಚ್ ಇನ್‌ಸ್ಟಿಟ್ಯೂಟ್', 'ನ್ಯಾಷನಲ್ ಎನ್‌ಡೇಂಜರ್ಡ್ ಆ್ಯಂಡ್ ಎಂಡೆಮಿಕ್ ರಿಸರ್ಚ್ ಇನ್‌ಸ್ಟಿಟ್ಯೂಟ್', 'ನ್ಯಾಷನಲ್ ಎನ್ವಿರಾನ್‌ಮೆಂಟಲ್ ಇಂಜಿನಿಯರಿಂಗ್ ರಿಸರ್ಚ್ ಇನ್‌ಸ್ಟಿಟ್ಯೂಟ್', '4', 'Correct Answer: (4)

Explanation:
NEERI stands for the National Environmental Engineering Research Institute. It is a research institute under the Council of Scientific and Industrial Research (CSIR), established in 1958 and headquartered in Nagpur, Maharashtra.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
NEERI ಯ ವಿಸ್ತೃತ ರೂಪ ''National Environmental Engineering Research Institute'' (ನ್ಯಾಷನಲ್ ಎನ್ವಿರಾನ್‌ಮೆಂಟಲ್ ಇಂಜಿನಿಯರಿಂಗ್ ರಿಸರ್ಚ್ ಇನ್‌ಸ್ಟಿಟ್ಯೂಟ್). ಇದು CSIR ಅಡಿಯಲ್ಲಿ ಕಾರ್ಯನಿರ್ವಹಿಸುವ ಸಂಸ್ಥೆಯಾಗಿದ್ದು, ಇದರ ಪ್ರಧಾನ ಕಚೇರಿ ಮಹಾರಾಷ್ಟ್ರದ ನಾಗ್ಪುರದಲ್ಲಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q80', 80, 2026, 'September', 1, 'hk', 'ksp-pc', 'ethics_integrity_aptitude.ethics_human_interface.dimensions_of_ethics', 'Ethics, Integrity & Aptitude', 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ', 'Ethics & Human Interface', 'ನೀತಿಶಾಸ್ತ್ರ ಮತ್ತು ಮಾನವ ನಡವಳಿಕೆ', 'Branches of Ethics & Normative Ethics (Prescriptive Moral Standards)', 'ನೀತಿಶಾಸ್ತ್ರದ ವಿಭಾಗಗಳು ಮತ್ತು ನಾರ್ಮೇಟಿವ್ ಎಥಿಕ್ಸ್ (ಮಾದರಿ ನೈತಿಕ ಮಾನದಂಡಗಳು)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Ethics', 'Moral Philosophy', 'Normative Ethics', 'Ethics, Integrity & Aptitude']::TEXT[], '', '', 'Name the domain of ethics which establishes the moral standards and guidelines that dictate how people ought to behave:', 'ಜನರು ಹೇಗೆ ವರ್ತಿಸಬೇಕು ಎಂದು ಸೂಚಿಸುವ ಮಾದರಿ ನೈತಿಕ ಮಾನದಂಡಗಳು ಮತ್ತು ಮಾರ್ಗಸೂಚಿಗಳನ್ನು ಸ್ಥಾಪಿಸುವ ನೈತಿಕತೆಯ ಕ್ಷೇತ್ರ (Domain) ಅನ್ನು ಹೆಸರಿಸಿ.', 'Normative Ethics', 'Applied Ethics', 'Positive Ethics', 'Meta Ethics', 'ನಾರ್ಮೇಟೀವ್ ಎಥಿಕ್ಸ್', 'ಅಪ್ಲೈಡ್ ಎಥಿಕ್ಸ್', 'ಪಾಸಿಟೀವ್ ಎಥಿಕ್ಸ್', 'ಮೆಟಾ ಎಥಿಕ್ಸ್', '1', 'Correct Answer: (1)

Explanation:
Normative Ethics is the branch of moral philosophy that sets up norms, rules, and fundamental standards defining what actions are right and wrong, guiding how individuals ought to behave.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
ಜನರು ಸಮಾಜದಲ್ಲಿ ಹೇಗೆ ವರ್ತಿಸಬೇಕು ಮತ್ತು ಸರಿ-ತಪ್ಪುಗಳ ಮಾನದಂಡಗಳು ಯಾವುವು ಎಂಬುದನ್ನು ನಿರ್ಧರಿಸುವ ನೈತಿಕತೆಯ ಶಾಖೆಯನ್ನು ''ನಾರ್ಮೇಟಿವ್ ಎಥಿಕ್ಸ್'' (Normative Ethics / ಮಾನದಂಡಾತ್ಮಕ ನೀತಿಶಾಸ್ತ್ರ) ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ.', NULL, NULL),
    ('pc-hk-2026-q81', 81, 2026, 'September', 1, 'hk', 'ksp-pc', 'ethics_integrity_aptitude.probity_in_governance_public_service_values.codes_of_ethics_codes_of_conduct', 'Ethics, Integrity & Aptitude', 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ', 'Probity in Governance & Public Service Values', 'ಆಡಳಿತದಲ್ಲಿ ಪ್ರಾಮಾಣಿಕತೆ ಮತ್ತು ಸಾರ್ವಜನಿಕ ಸೇವಾ ಮೌಲ್ಯಗಳು', 'Public Service Code of Conduct & Nolan Principles (Integrity, Impartiality, Objectivity)', 'ಸಾರ್ವಜನಿಕ ಸೇವಾ ನೀತಿ ಸಂಹಿತೆ ಮತ್ತು ನೋಲನ್ ಸಮಿತಿ ತತ್ವಗಳು (ಸಮಗ್ರತೆ, ನಿಷ್ಪಕ್ಷಪಾತತೆ, ವಸ್ತುನಿಷ್ಠತೆ)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Ethics', 'Public Administration', 'Code of Conduct', 'Ethics, Integrity & Aptitude']::TEXT[], '', '', 'Which of the following is/are not the key principles of code of conduct ?
(a) Integrity and honesty
(b) Political neutrality
(c) Courtesy and good behaviour
(d) Non-responsive to the public', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವುದು/ಯಾವುವು ಮಾದರಿ ನೀತಿ (ನಡವಳಿಕೆ) ಸಂಹಿತೆಯ ಪ್ರಮುಖ ತತ್ವವಲ್ಲ/ತತ್ವಗಳಲ್ಲ ?
(a) ಸಮಗ್ರತೆ ಮತ್ತು ಪ್ರಾಮಾಣಿಕತೆ
(b) ರಾಜಕೀಯ ತಟಸ್ಥತೆ
(c) ಸೌಜನ್ಯ ಮತ್ತು ಉತ್ತಮ ನಡವಳಿಕೆ
(d) ಸಾರ್ವಜನಿಕರಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸದಿರುವುದು', '(b) and (d)', 'Only (d)', 'Only (b)', '(a) and (d)', '(b) ಮತ್ತು (d)', '(d) ಮಾತ್ರ', '(b) ಮಾತ್ರ', '(a) ಮತ್ತು (d)', '2', 'Correct Answer: (2)

Explanation:
Integrity, honesty, political neutrality, and courtesy are fundamental tenets of civil service conduct. Public servants are mandated to be accessible, accountable, and responsive to the public; therefore, ''non-responsive to the public'' is an unethical behavior and not a principle of the code of conduct.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಸಮಗ್ರತೆ, ಪ್ರಾಮಾಣಿಕತೆ, ರಾಜಕೀಯ ತಟಸ್ಥತೆ ಹಾಗೂ ಸಾರ್ವಜನಿಕರೊಂದಿಗೆ ಸೌಜನ್ಯದ ನಡವಳಿಕೆಗಳು ನಡವಳಿಕೆ ಸಂಹಿತೆಯ ಮೂಲ ತತ್ವಗಳಾಗಿವೆ. ಸಾರ್ವಜನಿಕ ಸೇವಕರು ಸಾರ್ವಜನಿಕರ ಕುಂದುಕೊರತೆಗಳಿಗೆ ಸ್ಪಂದಿಸಬೇಕಾಗಿರುವುದರಿಂದ ''ಸಾರ್ವಜನಿಕರಿಗೆ ಪ್ರತಿಕ್ರಿಯಿಸದಿರುವುದು'' (d) ನೀತಿ ಸಂಹಿತೆಯ ತತ್ವವಲ್ಲ.', NULL, NULL),
    ('pc-hk-2026-q82', 82, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_physics', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Gravitational Physics & Weightlessness in Orbiting Spacecraft (Free Fall Dynamics)', 'ಗುರುತ್ವಾಕರ್ಷಣ ಭೌತಶಾಸ್ತ್ರ ಮತ್ತು ಕಕ್ಷೆಯಲ್ಲಿ ತೂಕರಹಿತ ಸ್ಥಿತಿ (ಮುಕ್ತ ಪತನದ ಚಲನೆ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Physics', 'Gravitation', 'Weightlessness', 'Science, Technology & Defence']::TEXT[], '', '', 'Consider the following statements and choose the correct answer from the given options:
Statement I : When an object is under free fall there is no upward force.
Statement II : A person inside the satellite feels weightlessness.', 'ಈ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ ಮತ್ತು ನೀಡಲಾದ ಆಯ್ಕೆಗಳಿಂದ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.
ಹೇಳಿಕೆ I : ಒಂದು ವಸ್ತು ಮುಕ್ತವಾಗಿ ಪತನವಾಗುತ್ತಿರುವಾಗ ಯಾವುದೇ ಮೇಲ್ಮುಖ ಬಲ ಪ್ರಯೋಗವಾಗುವುದಿಲ್ಲ.
ಹೇಳಿಕೆ II : ಉಪಗ್ರಹದ ಒಳಗಿರುವ ವ್ಯಕ್ತಿ ತೂಕ ರಾಹಿತ್ಯತೆಯನ್ನು ಅನುಭವಿಸುತ್ತಾನೆ/ಳೆ.', 'Statement II is correct but Statement I is incorrect.', 'Both the statements are correct and Statement I is the explanation of II.', 'Both the statements are correct and Statement I is not the explanation of II.', 'Statement I is correct but Statement II is incorrect.', 'ಹೇಳಿಕೆ II ಸರಿ ಆದರೆ ಹೇಳಿಕೆ I ತಪ್ಪು.', 'ಎರಡೂ ಹೇಳಿಕೆಗಳು ಸರಿ ಮತ್ತು ಹೇಳಿಕೆ I, ಹೇಳಿಕೆ II ರ ವಿವರಣೆಯಾಗಿದೆ.', 'ಎರಡೂ ಹೇಳಿಕೆಗಳು ಸರಿ ಮತ್ತು ಹೇಳಿಕೆ I, ಹೇಳಿಕೆ II ರ ವಿವರಣೆ ಅಲ್ಲ.', 'ಹೇಳಿಕೆ I ಸರಿ ಆದರೆ ಹೇಳಿಕೆ II ತಪ್ಪು.', '2', 'Correct Answer: (2)

Explanation:
An orbiting satellite and everything inside it are in a continuous state of free fall toward Earth under gravity without any upward supporting normal reaction force. Because the person and the satellite accelerate at the exact same rate under gravity alone, the contact reaction force is zero, which causes the feeling of weightlessness.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಉಪಗ್ರಹವು ಭೂಮಿಯ ಕಕ್ಷೆಯಲ್ಲಿ ಮುಕ್ತವಾಗಿ ಪತನವಾಗುತ್ತಿರುತ್ತದೆ (free fall), ಈ ಸಂದರ್ಭದಲ್ಲಿ ಯಾವುದೇ ಮೇಲ್ಮುಖ ಸಾಮಾನ್ಯ ಪ್ರತಿಕ್ರಿಯಾ ಬಲ (normal reaction force) ಇರುವುದಿಲ್ಲ. ಇದರಿಂದಾಗಿ ಉಪಗ್ರಹದಲ್ಲಿರುವ ವ್ಯಕ್ತಿಯು ತೂಕರಾಹಿತ್ಯತೆಯನ್ನು ಅನುಭವಿಸುತ್ತಾನೆ. ಆದ್ದರಿಂದ ಹೇಳಿಕೆ I, ಹೇಳಿಕೆ II ರ ಸರಿಯಾದ ವಿವರಣೆಯಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q83', 83, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_physics', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Semiconductor Electronics & Light Emitting Diode (LED) Technology', 'ಅರೆವಾಹಕ ಎಲೆಕ್ಟ್ರಾನಿಕ್ಸ್ ಮತ್ತು ಲೈಟ್ ಎಮಿಟಿಂಗ್ ಡಯೋಡ್ (ಎಲ್‌ಇಡಿ) ತಂತ್ರಜ್ಞಾನ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Electronics', 'Semiconductors', 'General Science', 'Science, Technology & Defence']::TEXT[], '', '', 'Expand ''LED''', '''LED'' ಯನ್ನು ವಿಸ್ತರಿಸಿ.', 'Light Emitting Display', 'Light Emitting Diode', 'Light Emitting Detector', 'Low Energy Display', 'ಲೈಟ್ ಎಮಿಟಿಂಗ್ ಡಿಸ್‌ಪ್ಲೇ', 'ಲೈಟ್ ಎಮಿಟಿಂಗ್ ಡಯೋಡ್', 'ಲೈಟ್ ಎಮಿಟಿಂಗ್ ಡಿಟೆಕ್ಟರ್', 'ಲೋ ಎನರ್ಜಿ ಡಿಸ್‌ಪ್ಲೇ', '2', 'Correct Answer: (2)

Explanation:
LED stands for Light Emitting Diode. It is a semiconductor p-n junction diode that emits light through electroluminescence when an electric current passes through it in the forward-biased direction.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
LED ಯ ವಿಸ್ತೃತ ರೂಪ ''Light Emitting Diode'' (ಲೈಟ್ ಎಮಿಟಿಂಗ್ ಡಯೋಡ್). ಇದು ವಿದ್ಯುತ್ ಪ್ರವಾಹ ಹರಿದಾಗ ಬೆಳಕನ್ನು ಸೂಸುವ ಅರ್ಧವಾಹಕ (ಸೆಮಿಕಂಡಕ್ಟರ್) ಸಾಧನವಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q84', 84, 2026, 'September', 1, 'hk', 'ksp-pc', 'ethics_integrity_aptitude.ethics_human_interface.role_of_family_society_educational_institutions', 'Ethics, Integrity & Aptitude', 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ', 'Ethics & Human Interface', 'ನೀತಿಶಾಸ್ತ್ರ ಮತ್ತು ಮಾನವ ನಡವಳಿಕೆ', 'Inculcation of Human Values by Family, Society and Educational Institutions', 'ಕುಟುಂಬ, ಸಮಾಜ ಮತ್ತು ಶಿಕ್ಷಣ ಸಂಸ್ಥೆಗಳಿಂದ ಮಾನವೀಯ ಮೌಲ್ಯಗಳ ಸಂಸ್ಕಾರ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Ethics', 'Human Values', 'Role of Family and Society', 'Ethics, Integrity & Aptitude']::TEXT[], '', '', 'Fill in the blanks:
(i) and (ii) are the first places where individuals learn about moral values.', 'ಖಾಲಿ ಬಿಟ್ಟ ಸ್ಥಳವನ್ನು ತುಂಬಿರಿ.
ವ್ಯಕ್ತಿಗಳು ನೈತಿಕ ಮೌಲ್ಯಗಳನ್ನು ಕಲಿಯುವ ಮೊದಲ ಸ್ಥಳಗಳು (i) ಮತ್ತು (ii)', '(i) College and (ii) Friends', '(i) School and (ii) Teachers', '(i) Family and (ii) University', '(i) Family and (ii) Society', '(i) ಕಾಲೇಜು ಮತ್ತು (ii) ಸ್ನೇಹಿತರು', '(i) ಶಾಲೆ ಮತ್ತು (ii) ಶಿಕ್ಷಕರು', '(i) ಕುಟುಂಬ ಮತ್ತು (ii) ವಿಶ್ವವಿದ್ಯಾಲಯ', '(i) ಕುಟುಂಬ ಮತ್ತು (ii) ಸಮಾಜ', '4', 'Correct Answer: (4)

Explanation:
In ethics and sociology, the family serves as the primary agent of socialization where an individual is first introduced to foundational moral principles, followed closely by the broader community and society.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ವ್ಯಕ್ತಿಯೊಬ್ಬ ನೈತಿಕ ಮೌಲ್ಯಗಳನ್ನು ಮತ್ತು ಸತ್ಪ್ರಜೆತನದ ಗುಣಗಳನ್ನು ಕಲಿಯುವ ಮೊದಲ ಮತ್ತು ಪ್ರಾಥಮಿಕ ತಾಣಗಳು ಕುಟುಂಬ ಮತ್ತು ಸಮಾಜ (Family and Society) ಆಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q85', 85, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_economy_development.agriculture_food_management_subsidies.cropping_patterns_agrarian_systems', 'Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', 'Agriculture, Food Management & Subsidies', 'ಕೃಷಿ, ಆಹಾರ ನಿರ್ವಹಣೆ ಮತ್ತು ಸಬ್ಸಿಡಿಗಳು', 'Agrarian Movements & Regional Agricultural Campaigns (''Khet Bachao'' Abhiyan)', 'ಕೃಷಿ ಚಳುವಳಿಗಳು ಮತ್ತು ಪ್ರಾದೇಶಿಕ ಕೃಷಿ ಅಭಿಯಾನಗಳು (''ಖೇತ್ ಬಚಾವೋ'' ಅಭಿಯಾನ)', 'hard', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Current Affairs', 'Agriculture Campaigns', 'Government Initiatives', 'Indian Economy & Development']::TEXT[], '', '', 'On June 1, 2026 the ''Khet Bachao'' Abhiyan was formally launched in the ________ district of ________ state.', '2026 ರ ಜೂನ್ 1 ರಂದು ''ಖೇತ್ ಬಚಾವೊ'' ಆಂದೋಲನವನ್ನು ಅಧಿಕೃತವಾಗಿ ________ ಜಿಲ್ಲೆ ________ ರಾಜ್ಯದಲ್ಲಿ ಚಾಲನೆ ನೀಡಲಾಯಿತು.', 'Raisen, Madhya Pradesh', 'Guntur, Andhra Pradesh', 'Theni, Tamil Nadu', 'Yavatmal, Maharashtra', 'ರೈಸೆನ್, ಮಧ್ಯ ಪ್ರದೇಶ', 'ಗುಂಟೂರು, ಆಂಧ್ರ ಪ್ರದೇಶ', 'ಥೇನಿ, ತಮಿಳುನಾಡು', 'ಯವತ್ಮಾಲ್, ಮಹಾರಾಷ್ಟ್ರ', '4', 'Correct Answer: (4)

Explanation:
The ''Khet Bachao'' Abhiyan was formally launched in Yavatmal district of Maharashtra, an agrarian belt in Vidarbha historically vulnerable to agrarian distress, aimed at promoting sustainable farming methods, agricultural input support, and farmer welfare.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ರೈತರ ಹಿತರಕ್ಷಣೆ ಮತ್ತು ಕೃಷಿ ಸುಸ್ಥಿರತೆಗಾಗಿ ರೂಪಿಸಲಾದ ''ಖೇತ್ ಬಚಾವೊ'' ಆಂದೋಲನವನ್ನು 2026 ರ ಜೂನ್ 1 ರಂದು ಮಹಾರಾಷ್ಟ್ರದ ವಿದರ್ಭ ಪ್ರದೇಶದ ಯವತ್ಮಾಲ್ ಜಿಲ್ಲೆಯಲ್ಲಿ ಅಧಿಕೃತವಾಗಿ ಪ್ರಾರಂಭಿಸಲಾಯಿತು.', NULL, NULL),
    ('pc-hk-2026-q86', 86, 2026, 'September', 1, 'hk', 'ksp-pc', 'art_culture_heritage.art_culture_of_karnataka', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Art & Culture of Karnataka', 'ಕರ್ನಾಟಕದ ಕಲೆ ಮತ್ತು ಸಂಸ್ಕೃತಿ', 'Contemporary Kannada Literature & Smt. Indira Lankesh''s Autobiography (''Hulimavina Tota'')', 'ಸಮಕಾಲೀನ ಕನ್ನಡ ಸಾಹಿತ್ಯ ಮತ್ತು ಶ್ರೀಮತಿ ಇಂದಿರಾ ಲಂಕೇಶ್ ಅವರ ಆತ್ಮಚರಿತ್ರೆ (''ಹುಳಿಮಾವಿನ ತೋಟ'')', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Kannada Literature', 'Autobiographies', 'Karnataka Culture', 'Art, Culture & Heritage']::TEXT[], '', '', 'Name the autobiography of Smt. Indira Lankesh, wife of veteran Kannada writer and journalist P. Lankesh.', 'ಕನ್ನಡದ ಹಿರಿಯ ಲೇಖಕ ಹಾಗೂ ಪತ್ರಕರ್ತ ಪಿ. ಲಂಕೇಶ್‌ರವರ ಪತ್ನಿ ಶ್ರೀಮತಿ ಇಂದಿರಾ ಲಂಕೇಶ್‌ರವರ ಆತ್ಮಕತೆಯನ್ನು ಹೆಸರಿಸಿ.', 'Aashadabhutitana', 'Huli Maavina Mara', 'Huli Maavu Mattu Naanu', 'Ondu Jeevana Saladu', 'ಆಷಾಢಭೂತಿತನ', 'ಹುಳಿ ಮಾವಿನ ಮರ', 'ಹುಳಿ ಮಾವು ಮತ್ತು ನಾನು', 'ಒಂದು ಜೀವನ ಸಾಲದು', '3', 'Correct Answer: (3)

Explanation:
Renowned Kannada writer and journalist P. Lankesh authored his famous autobiography titled ''Hulimaavina Mara''. His wife, Smt. Indira Lankesh, penned her own reflective memoir titled ''Huli Maavu Mattu Naanu'' (ಹುಳಿ ಮಾವು ಮತ್ತು ನಾನು).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಖ್ಯಾತ ಸಾಹಿತಿ ಮತ್ತು ಪತ್ರಕರ್ತ ಪಿ. ಲಂಕೇಶ್ ಅವರ ಆತ್ಮಕಥೆ ''ಹುಳಿಮಾವಿನ ಮರ''ವಾದರೆ, ಅವರ ಧರ್ಮಪತ್ನಿ ಶ್ರೀಮತಿ ಇಂದಿರಾ ಲಂಕೇಶ್ ಅವರು ಬರೆದ ಆತ್ಮಕಥನ ''ಹುಳಿ ಮಾವು ಮತ್ತು ನಾನು''.', NULL, NULL),
    ('pc-hk-2026-q87', 87, 2026, 'September', 1, 'hk', 'ksp-pc', 'art_culture_heritage.martial_arts_traditional_sports_calendars', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Martial Arts, Traditional Sports & Calendars', 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು', 'Global Sports Tournaments & FIFA World Cup Title Holders Chronology', 'ಜಾಗತಿಕ ಕ್ರೀಡಾ ಪಂದ್ಯಾವಳಿಗಳು ಮತ್ತು ಫಿಫಾ ವಿಶ್ವಕಪ್ ವಿಜೇತ ರಾಷ್ಟ್ರಗಳ ಪಟ್ಟಿ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Sports', 'Football', 'FIFA World Cup', 'Art, Culture & Heritage']::TEXT[], '', '', 'Arrange the following countries in the correct order from the highest to the lowest with respect to number of FIFA Men''s World Cup titles won :', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಫೀಫಾ ಪುರುಷರ ವಿಶ್ವ ಕಪ್ ಪ್ರಶಸ್ತಿಯನ್ನು ಗೆದ್ದ ರಾಷ್ಟ್ರಗಳನ್ನು ಗರಿಷ್ಠದಿಂದ ಕನಿಷ್ಠದವರೆಗೆ ಸರಿಯಾದ ಕ್ರಮದಲ್ಲಿ ಜೋಡಿಸಿ.', 'Brazil, Argentina, Germany, Italy, France', 'Germany, Brazil, Italy, Argentina, France', 'Brazil, Italy, Germany, Argentina, France', 'Brazil, Germany, Argentina, France, Italy', 'ಬ್ರೆಜಿಲ್, ಅರ್ಜೆಂಟೀನಾ, ಜರ್ಮನಿ, ಇಟಲಿ, ಫ್ರಾನ್ಸ್', 'ಜರ್ಮನಿ, ಬ್ರೆಜಿಲ್, ಇಟಲಿ, ಅರ್ಜೆಂಟೀನಾ, ಫ್ರಾನ್ಸ್', 'ಬ್ರೆಜಿಲ್, ಇಟಲಿ, ಜರ್ಮನಿ, ಅರ್ಜೆಂಟೀನಾ, ಫ್ರಾನ್ಸ್', 'ಬ್ರೆಜಿಲ್, ಜರ್ಮನಿ, ಅರ್ಜೆಂಟೀನಾ, ಫ್ರಾನ್ಸ್, ಇಟಲಿ', '3', 'Correct Answer: (3)

Explanation:
Number of FIFA Men''s World Cup titles won:
• Brazil: 5 titles (1958, 1962, 1970, 1994, 2002)
• Italy: 4 titles (1934, 1938, 1982, 2006)
• Germany: 4 titles (1954, 1974, 1990, 2014)
• Argentina: 3 titles (1978, 1986, 2022)
• France: 2 titles (1998, 2018)

Option (3) correctly lists them in non-increasing order: Brazil (5), Italy (4), Germany (4), Argentina (3), France (2).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ಫೀಫಾ ಪುರುಷರ ವಿಶ್ವಕಪ್ ಗೆದ್ದ ದೇಶಗಳ ಪಟ್ಟಿ (ಗರಿಷ್ಠದಿಂದ ಕನಿಷ್ಠಕ್ಕೆ):
• ಬ್ರೆಜಿಲ್: 5 ಬಾರಿ (1958, 1962, 1970, 1994, 2002)
• ಇಟಲಿ: 4 ಬಾರಿ (1934, 1938, 1982, 2006)
• ಜರ್ಮನಿ: 4 ಬಾರಿ (1954, 1974, 1990, 2014)
• ಅರ್ಜೆಂಟೀನಾ: 3 ಬಾರಿ (1978, 1986, 2022)
• ಫ್ರಾನ್ಸ್: 2 ಬಾರಿ (1998, 2018)

ಆದ್ದರಿಂದ ಸರಿಯಾದ ಇಳಿಕೆಯ ಕ್ರಮ: ಬ್ರೆಜಿಲ್, ಇಟಲಿ, ಜರ್ಮನಿ, ಅರ್ಜೆಂಟೀನಾ, ಫ್ರಾನ್ಸ್.', NULL, NULL),
    ('pc-hk-2026-q88', 88, 2026, 'September', 1, 'hk', 'ksp-pc', 'ethics_integrity_aptitude.case_studies.ethical_dilemmas_in_administration_public_life', 'Ethics, Integrity & Aptitude', 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ', 'Case Studies', 'ಪ್ರಕರಣ ಅಧ್ಯಯನಗಳು (ಕೇಸ್ ಸ್ಟಡೀಸ್)', 'Administrative Ethics, Disability Inclusivity & Non-Discrimination in Public Institutions', 'ಆಡಳಿತಾತ್ಮಕ ನೈತಿಕತೆ, ವಿಕಲಚೇತನರ ಸಮಾವೇಶನ ಮತ್ತು ತಾರತಮ್ಯರಹಿತ ನಿರ್ಧಾರ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Administrative Ethics', 'Gender Equality', 'Decision Making', 'Ethics, Integrity & Aptitude']::TEXT[], '', '', 'During a co-curricular committee allotment meeting in a college, the Principal suggests skipping a highly qualified female faculty for "Internal Quality Assurance Cell" coordinator post as it demands more than official duty hours'' work.
As a member of the committee, what should you do?', 'ಕಾಲೇಜಿನಲ್ಲಿ ನಡೆದ ಸಹಪಠ್ಯ ಚಟುವಟಿಕೆ ಸಮಿತಿಗಳ ಹಂಚಿಕೆ ಸಭೆಯಲ್ಲಿ, ಪ್ರಾಂಶುಪಾಲರು ''ಆಂತರಿಕ ಗುಣಮಟ್ಟ ಭರವಸೆ ಕೋಶ'' (ಐಕ್ಯೂಎಸಿ) ಸಂಯೋಜಕ ಹುದ್ದೆಗೆ ಅಧಿಕೃತ ಕರ್ತವ್ಯ ಸಮಯಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ಸಮಯ ಕೆಲಸ ಮಾಡಬೇಕಾಗುವುದರಿಂದ ಉನ್ನತ ಅರ್ಹತೆ ಹೊಂದಿರುವ ಮಹಿಳಾ ಅಧ್ಯಾಪಕರನ್ನು ಬಿಟ್ಟುಬಿಡಲು ಸೂಚಿಸುತ್ತಾರೆ.
ಸಮಿತಿಯ ಸದಸ್ಯರಾಗಿ ನೀವು ಏನು ಮಾಡುತ್ತೀರಿ ?', 'Suggest the Principal to give her co-coordinator post instead of coordinator.', 'Remain silent, as it is not directly related to you.', 'Agree with the Principal to maintain a harmonious relationship with the Principal.', 'Strongly object, highlighting her merit and pointing out that gender discrimination violates constitutional rights.', 'ಸಂಯೋಜಕರ ಹುದ್ದೆಯ ಬದಲಾಗಿ ಸಹ-ಸಂಯೋಜಕಿ ಹುದ್ದೆಯನ್ನು ಅವರಿಗೆ ನೀಡುವಂತೆ ಪ್ರಾಂಶುಪಾಲರಿಗೆ ಸಲಹೆ ನೀಡುತ್ತೀರಿ.', 'ನಿಮಗೆ ನೇರವಾಗಿ ಸಂಬಂಧಿಸಿಲ್ಲವಾದ್ದರಿಂದ ಮೌನವಾಗಿರುತ್ತೀರಿ.', 'ಪ್ರಾಂಶುಪಾಲರೊಂದಿಗೆ ಸೌಹಾರ್ದಯುತ ಸಂಬಂಧವನ್ನು ಕಾಪಾಡಿಕೊಳ್ಳಲು ಪ್ರಾಂಶುಪಾಲರ ನಿರ್ಧಾರವನ್ನು ಒಪ್ಪುತ್ತೀರಿ.', 'ಅವರ ಅರ್ಹತೆಯನ್ನು ಎತ್ತಿ ತೋರಿಸುತ್ತಾ, ಲಿಂಗ ತಾರತಮ್ಯವು ಸಾಂವಿಧಾನಿಕ ಹಕ್ಕುಗಳನ್ನು ಉಲ್ಲಂಘಿಸುತ್ತದೆಯೆಂದು ಬಲವಾಗಿ ಆಕ್ಷೇಪಿಸುತ್ತೀರಿ.', '4', 'Correct Answer: (4)

Explanation:
Excluding an eligible faculty member based on gender stereotypes violates Articles 14, 15, and 16 of the Constitution of India. As an ethical committee member, one must uphold merit, justice, and non-discrimination by firmly objecting to gender-based exclusion.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ಮಹಿಳೆ ಎಂಬ ಕಾರಣಕ್ಕೆ ಅರ್ಹತೆಯನ್ನು ಕಡೆಗಣಿಸುವುದು ಭಾರತ ಸಂವಿಧಾನದ 14 ಮತ್ತು 15 ನೇ ವಿಧಿಗಳ ಅಡಿಯಲ್ಲಿ ಲಿಂಗ ತಾರತಮ್ಯವಾಗುತ್ತದೆ. ಸಮಿತಿಯ ಸದಸ್ಯರಾಗಿ ನೈತಿಕ ಕರ್ತವ್ಯವನ್ನು ಪಾಲಿಸಿ, ಅವರ ಅರ್ಹತೆಯನ್ನು ಬೆಂಬಲಿಸಿ ತಾರತಮ್ಯವನ್ನು ಬಲವಾಗಿ ಆಕ್ಷೇಪಿಸುವುದು ಸರಿಯಾದ ಕ್ರಮವಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q89', 89, 2026, 'September', 1, 'hk', 'ksp-pc', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers.concepts_components_of_emotional_intelligence', 'Ethics, Integrity & Aptitude', 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ', 'Emotional Intelligence & Moral Thinkers', 'ಭಾವನಾತ್ಮಕ ಬುದ್ಧಿಮತ್ತೆ ಮತ್ತು ನೈತಿಕ ಚಿಂತಕರು', 'Emotional Intelligence (EI) Components & Application in Public Administration', 'ಭಾವನಾತ್ಮಕ ಬುದ್ಧಿಮತ್ತೆ (EI) ಘಟಕಗಳು ಮತ್ತು ಸಾರ್ವಜನಿಕ ಆಡಳಿತದಲ್ಲಿ ಅದರ ಅನ್ವಯ', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Ethics', 'Emotional Intelligence', 'Public Service', 'Ethics, Integrity & Aptitude']::TEXT[], '', '', 'Consider the following statements:
Statement I : Emotional intelligence is the ability to understand and manage your own emotions and those of the people around you.
Statement II : Emotional intelligence does not help civil servants to handle stress and foster a positive work environment.
Choose the correct answer from the options given below :', 'ಈ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.
ಹೇಳಿಕೆ I : ಭಾವನಾತ್ಮಕ ಬುದ್ಧಿವಂತಿಕೆ ಎಂದರೆ ನಿಮ್ಮ ಸ್ವಂತ ಭಾವನೆಗಳನ್ನು ಮತ್ತು ನಿಮ್ಮ ಸುತ್ತಲಿರುವ ಜನರ ಭಾವನೆಗಳನ್ನು ಅರ್ಥ ಮಾಡಿಕೊಳ್ಳುವ ಹಾಗೂ ನಿರ್ವಹಿಸುವ ಸಾಮರ್ಥ್ಯ.
ಹೇಳಿಕೆ II : ಭಾವನಾತ್ಮಕ ಬುದ್ಧಿವಂತಿಕೆಯು ನಾಗರಿಕ ಸೇವಕರಿಗೆ ಒತ್ತಡವನ್ನು ನಿಭಾಯಿಸಲು ಮತ್ತು ಸಕಾರಾತ್ಮಕ ಕೆಲಸದ ವಾತಾವರಣವನ್ನು ಪೋಷಿಸಲು ನೆರವಾಗುವುದಿಲ್ಲ.
ಕೆಳಗಿನ ಆಯ್ಕೆಗಳಿಂದ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.', 'Both Statement I and Statement II are incorrect.', 'Statement I is correct but Statement II is incorrect.', 'Statement I is incorrect but Statement II is correct.', 'Both Statement I and Statement II are correct.', 'ಹೇಳಿಕೆ I ಮತ್ತು ಹೇಳಿಕೆ II ಎರಡೂ ತಪ್ಪು.', 'ಹೇಳಿಕೆ I ಸರಿ ಆದರೆ ಹೇಳಿಕೆ II ತಪ್ಪು.', 'ಹೇಳಿಕೆ I ತಪ್ಪು ಆದರೆ ಹೇಳಿಕೆ II ಸರಿ.', 'ಹೇಳಿಕೆ I ಮತ್ತು ಹೇಳಿಕೆ II ಎರಡೂ ಸರಿ.', '2', 'Correct Answer: (2)

Explanation:
• Statement I correctly defines Emotional Intelligence (EI).
• Statement II is incorrect because emotional intelligence is critical for civil servants to manage high job stress, resolve conflicts peacefully, and build collaborative workplaces.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
• ಹೇಳಿಕೆ I ಸರಿಯಾಗಿದೆ: ಭಾವನಾತ್ಮಕ ಬುದ್ಧಿವಂತಿಕೆ (EI) ತನ್ನ ಮತ್ತು ಇತರರ ಭಾವನೆಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಂಡು ನಿಯಂತ್ರಿಸುವ ಸಾಮರ್ಥ್ಯವಾಗಿದೆ.
• ಹೇಳಿಕೆ II ತಪ್ಪಾಗಿದೆ: ಭಾವನಾತ್ಮಕ ಬುದ್ಧಿವಂತಿಕೆಯು ನಾಗರಿಕ ಸೇವಕರಿಗೆ ಒತ್ತಡವನ್ನು ನಿಭಾಯಿಸಲು ಮತ್ತು ಸಕಾರಾತ್ಮಕ ವಾತಾವರಣವನ್ನು ನಿರ್ಮಿಸಲು ಹೆಚ್ಚು ಸಹಕಾರಿಯಾಗಿದೆ.', NULL, NULL),
    ('pc-hk-2026-q90', 90, 2026, 'September', 1, 'hk', 'ksp-pc', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_major_global_powers', 'International Relations & Global Institutions', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು', 'India''s Foreign Policy & Bilateral Relations', 'ಭಾರತದ ವಿದೇಶಾಂಗ ನೀತಿ ಮತ್ತು ದ್ವಿಪಕ್ಷೀಯ ಸಂಬಂಧಗಳು', 'Heads of Government of Major World Democracies (UK, Australia, Japan, France)', 'ವಿಶ್ವದ ಪ್ರಮುಖ ಪ್ರಜಾಪ್ರಭುತ್ವ ರಾಷ್ಟ್ರಗಳ ಸರ್ಕಾರಗಳ ಮುಖ್ಯಸ್ಥರು (ಯುಕೆ, ಆಸ್ಟ್ರೇಲಿಯಾ, ಜಪಾನ್, ಫ್ರಾನ್ಸ್)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'International Relations', 'World Leaders', 'Current Affairs', 'International Relations & Global Institutions']::TEXT[], '', '', 'Match the following List - I (Countries) and List - II (Prime Ministers):
List - I (Countries)
(a) Japan
(b) United Kingdom
(c) Australia
(d) New Zealand

List - II (Prime Ministers)
(i) Anthony Albanese
(ii) Christopher Luxon
(iii) Sanae Takaichi
(iv) Andy Burnham', 'ಈ ಕೆಳಗಿನ ಪಟ್ಟಿ-I ನ್ನು (ದೇಶಗಳು) ಪಟ್ಟಿ-II ರ (ಪ್ರಧಾನ ಮಂತ್ರಿಗಳು) ಜೊತೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.
ಪಟ್ಟಿ-I (ದೇಶಗಳು)
(a) ಜಪಾನ್
(b) ಯುನೈಟೆಡ್ ಕಿಂಗ್‌ಡಮ್
(c) ಆಸ್ಟ್ರೇಲಿಯಾ
(d) ನ್ಯೂಜಿಲ್ಯಾಂಡ್

ಪಟ್ಟಿ-II (ಪ್ರಧಾನ ಮಂತ್ರಿಗಳು)
(i) ಆಂಥೋನಿ ಅಲ್ಬನೀಸ್
(ii) ಕ್ರಿಸ್ಟೋಫರ್ ಲಕ್ಸನ್
(iii) ಸನೆ ತಕೈಚಿ
(iv) ಆ್ಯಂಡಿ ಬರ್ನ್‌ಹ್ಯಾಮ್', '(a)-(iv), (b)-(ii), (c)-(iii), (d)-(i)', '(a)-(ii), (b)-(i), (c)-(iv), (d)-(iii)', '(a)-(iii), (b)-(iv), (c)-(i), (d)-(ii)', '(a)-(iv), (b)-(iii), (c)-(ii), (d)-(i)', '(a)-(iv), (b)-(ii), (c)-(iii), (d)-(i)', '(a)-(ii), (b)-(i), (c)-(iv), (d)-(iii)', '(a)-(iii), (b)-(iv), (c)-(i), (d)-(ii)', '(a)-(iv), (b)-(iii), (c)-(ii), (d)-(i)', '3', 'Correct Answer: (3)

Explanation:
Matching the leaders with their respective countries:
• Japan: Sanae Takaichi (iii)
• United Kingdom: Andy Burnham (iv)
• Australia: Anthony Albanese (i)
• New Zealand: Christopher Luxon (ii)

Matching combination: (a)-(iii), (b)-(iv), (c)-(i), (d)-(ii).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
ದೇಶಗಳು ಮತ್ತು ಅವುಗಳ ರಾಜಕೀಯ ನಾಯಕರ ಹೊಂದಾಣಿಕೆ:
• ಜಪಾನ್: ಸನೆ ತಕೈಚಿ (iii)
• ಯುನೈಟೆಡ್ ಕಿಂಗ್‌ಡಮ್: ಆ್ಯಂಡಿ ಬರ್ನ್‌ಹ್ಯಾಮ್ (iv)
• ಆಸ್ಟ್ರೇಲಿಯಾ: ಆಂಥೋನಿ ಅಲ್ಬನೀಸ್ (i)
• ನ್ಯೂಜಿಲ್ಯಾಂಡ್: ಕ್ರಿಸ್ಟೋಫರ್ ಲಕ್ಸನ್ (ii)

ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: (a)-(iii), (b)-(iv), (c)-(i), (d)-(ii).', NULL, NULL),
    ('pc-hk-2026-q91', 91, 2026, 'September', 1, 'hk', 'ksp-pc', 'science_technology_defence.information_communication_technology_ai_cyber_security.high-performance_quantum_computing', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Information & Communication Technology (ICT), AI & Cyber Security', 'ಮಾಹಿತಿ ಮತ್ತು ಸಂವಹನ ತಂತ್ರಜ್ಞಾನ (ICT), ಎಐ ಮತ್ತು ಸೈಬರ್ ಭದ್ರತೆ', 'History of Computing & Grace Hopper (UNIVAC / Compiler Innovation 75th Anniversary)', 'ಕಂಪ್ಯೂಟಿಂಗ್ ಇತಿಹಾಸ ಮತ್ತು ಗ್ರೇಸ್ ಹಾಪರ್ (ಯೂನಿವ್ಯಾಕ್ / ಕಂಪೈಲರ್ ಸಂಶೋಧನೆಯ 75 ನೇ ವರ್ಷ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Computer Science', 'History of Computing', 'Grace Hopper', 'Science, Technology & Defence']::TEXT[], '', '', 'Which computer''s 75th anniversary was recently celebrated, remembering Grace Hopper''s role in creating the foundation of COBOL?', 'ಕೊಬಾಲ್ (COBOL) ಸೃಷ್ಟಿಗೆ ಕಾರಣರಾದ ಗ್ರೇಸ್ ಹಾಪರ್ ಅವರ ಕೊಡುಗೆಯ ಸ್ಮರಣೆಗಾಗಿ ಇತ್ತೀಚೆಗೆ ಯಾವ ಕಂಪ್ಯೂಟರ್‌ನ 75ನೇ ವರ್ಷಾಚರಣೆಯನ್ನು ಆಚರಿಸಲಾಯಿತು ?', 'UNIVAC I', 'EDVAC', 'Colossus', 'ENIAC', 'UNIVAC I (ಯುನಿವಾಕ್ - I)', 'EDVAC (ಎಡ್‌ವಾಕ್)', 'Colossus (ಕೊಲೊಸಸ್)', 'ENIAC (ಎನಿಯಾಕ್)', '1', 'Correct Answer: (1)

Explanation:
UNIVAC I (Universal Automatic Computer I), delivered in 1951, reached its 75th anniversary milestone. Computer pioneer Grace Hopper worked on UNIVAC I and created the A-0 compiler system, which laid the foundation for machine-independent programming languages including COBOL.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
1951 ರಲ್ಲಿ ನಿರ್ಮಿಸಲಾದ UNIVAC I ಕಂಪ್ಯೂಟರ್‌ನ 75ನೇ ವರ್ಷಾಚರಣೆಯನ್ನು ಆಚರಿಸಲಾಯಿತು. ಕಂಪ್ಯೂಟರ್ ತಜ್ಞೆ ಗ್ರೇಸ್ ಹಾಪರ್ ಅವರು UNIVAC I ನಲ್ಲಿ ಕಾರ್ಯನಿರ್ವಹಿಸಿ COBOL ಭಾಷೆಯ ರಚನೆಗೆ ಮೂಲ ಆಧಾರವಾದ ಮೊದಲ ಕಂಪೈಲರ್ ಅನ್ನು ಅಭಿವೃದ್ಧಿಪಡಿಸಿದರು.', NULL, NULL),
    ('pc-hk-2026-q92', 92, 2026, 'September', 1, 'hk', 'ksp-pc', 'indian_polity_constitution_governance.union_executive_state_executive.state_executive', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Union Executive & State Executive', 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ', 'State Leadership & Incumbent Chief Ministers across Indian States and UTs', 'ರಾಜ್ಯ ನಾಯಕತ್ವ ಮತ್ತು ಭಾರತೀಯ ರಾಜ್ಯಗಳು ಹಾಗೂ ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಗಳ ಮುಖ್ಯಮಂತ್ರಿಗಳು', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Indian Politics', 'Current Affairs', 'State Leadership', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Match the following List - I (Chief Minister) and List - II (States/UTs):
List - I (Chief Minister)
(a) V.D. Satheesan
(b) C. Joseph Vijay
(c) Suvendu Adhikari
(d) Rekha Gupta

List - II (States/UTs)
(i) Tamil Nadu
(ii) New Delhi
(iii) Kerala
(iv) West Bengal', 'ಈ ಕೆಳಗಿನ ಪಟ್ಟಿ -I ನ್ನು ಪಟ್ಟಿ-II ರ ಜೊತೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.
ಪಟ್ಟಿ-I (ಮುಖ್ಯಮಂತ್ರಿಗಳು)
(a) ವಿ.ಡಿ. ಸತೀಶನ್
(b) ಸಿ. ಜೋಸೆಫ್ ವಿಜಯ್
(c) ಸುವೇಂದು ಅಧಿಕಾರಿ
(d) ರೇಖಾ ಗುಪ್ತಾ

ಪಟ್ಟಿ-II (ರಾಜ್ಯಗಳು/ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಗಳು)
(i) ತಮಿಳುನಾಡು
(ii) ನವದೆಹಲಿ
(iii) ಕೇರಳ
(iv) ಪಶ್ಚಿಮ ಬಂಗಾಳ', '(a)-(ii), (b)-(i), (c)-(iii), (d)-(iv)', '(a)-(iii), (b)-(i), (c)-(ii), (d)-(iv)', '(a)-(iii), (b)-(iv), (c)-(i), (d)-(ii)', '(a)-(iii), (b)-(i), (c)-(iv), (d)-(ii)', '(a)-(ii), (b)-(i), (c)-(iii), (d)-(iv)', '(a)-(iii), (b)-(i), (c)-(ii), (d)-(iv)', '(a)-(iii), (b)-(iv), (c)-(i), (d)-(ii)', '(a)-(iii), (b)-(i), (c)-(iv), (d)-(ii)', '4', 'Correct Answer: (4)

Explanation:
Aligning the leaders with their respective States/UTs:
• V.D. Satheesan: Kerala (iii)
• C. Joseph Vijay: Tamil Nadu (i)
• Suvendu Adhikari: West Bengal (iv)
• Rekha Gupta: New Delhi (ii)

Matching code: (a)-(iii), (b)-(i), (c)-(iv), (d)-(ii).', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ನಾಯಕರು ಮತ್ತು ಅವರ ರಾಜ್ಯಗಳ ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ:
• ವಿ.ಡಿ. ಸತೀಶನ್: ಕೇರಳ (iii)
• ಸಿ. ಜೋಸೆಫ್ ವಿಜಯ್: ತಮಿಳುನಾಡು (i)
• ಸುವೇಂದು ಅಧಿಕಾರಿ: ಪಶ್ಚಿಮ ಬಂಗಾಳ (iv)
• ರೇಖಾ ಗುಪ್ತಾ: ನವದೆಹಲಿ (ii)

ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: (a)-(iii), (b)-(i), (c)-(iv), (d)-(ii).', NULL, NULL),
    ('pc-hk-2026-q93', 93, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.princely_state_of_mysore_british_paramountcy', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Shivanasamudra Hydroelectric Project 1902 & Princely State of Mysore Modernisation', 'ಶಿವನಸಮುದ್ರ ಜಲವಿದ್ಯುತ್ ಯೋಜನೆ 1902 ಮತ್ತು ಮೈಸೂರು ಸಂಸ್ಥಾನದ ಆಧುನೀಕರಣ', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Karnataka History', 'Mysore Wodeyars', 'Hydroelectric Projects', 'History']::TEXT[], '', '', 'Which of the following statement/s is/are correct with respect to Shivanasamudra hydroelectric project?
(a) Before independence it was the largest hydro-electricity project in India.
(b) The electricity produced here was first given to Kolar gold mines.
(c) Additional electricity was supplied to Bengaluru.
(d) During that period Nalwadi Krishna Raja Wodeyar was the King.', 'ಶಿವನಸಮುದ್ರ ಜಲವಿದ್ಯುತ್ ಯೋಜನೆಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಈ ಕೆಳಗಿನ ಯಾವ ಹೇಳಿಕೆ/ಗಳು ಸರಿಯಾಗಿದೆ/ವೆ ?
(a) ಸ್ವಾತಂತ್ರ್ಯ ಪೂರ್ವದಲ್ಲಿ ಇದು ಭಾರತದಲ್ಲೇ ಅತಿ ದೊಡ್ಡ ಜಲವಿದ್ಯುತ್ ಯೋಜನೆಯಾಗಿತ್ತು.
(b) ಇಲ್ಲಿ ಉತ್ಪಾದಿಸಿದ ವಿದ್ಯುತ್ತನ್ನು ಮೊದಲು ಕೋಲಾರದ ಚಿನ್ನದ ಗಣಿಗೆ ನೀಡಲಾಯಿತು.
(c) ಹೆಚ್ಚುವರಿ ವಿದ್ಯುತ್ತನ್ನು ಬೆಂಗಳೂರಿಗೆ ಪೂರೈಸಲಾಯಿತು.
(d) ಆ ಅವಧಿಯಲ್ಲಿ ನಾಲ್ವಡಿ ಕೃಷ್ಣರಾಜ ಒಡೆಯರ್‌ರವರು ಮೈಸೂರಿನ ರಾಜರಾಗಿದ್ದರು.', '(b), (c) and (d)', '(a), (b) and (c)', '(a), (b), (c) and (d)', 'Only (a)', '(b), (c) ಮತ್ತು (d)', '(a), (b) ಮತ್ತು (c)', '(a), (b), (c) ಮತ್ತು (d)', '(a) ಮಾತ್ರ', '3', 'Correct Answer: (3)

Explanation:
• Shivanasamudra (established in 1902) was pre-independence India''s largest hydroelectric plant (Statement a is correct).
• Electricity was initially transmitted to power the Kolar Gold Fields (KGF) machinery (Statement b is correct).
• Bengaluru was electrified in 1905 with surplus power (Statement c is correct).
• Nalwadi Krishnaraja Wodeyar ruled Mysore State during this era (Statement d is correct).

All four statements (a), (b), (c), and (d) are correct.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
• 1902 ರಲ್ಲಿ ಕಾವೇರಿ ನದಿಗೆ ನಿರ್ಮಿಸಲಾದ ಶಿವನಸಮುದ್ರ ಜಲವಿದ್ಯುತ್ ಯೋಜನೆಯು ಸ್ವಾತಂತ್ರ್ಯ ಪೂರ್ವ ಭಾರತದ ಅತಿ ದೊಡ್ಡ ಜಲವಿದ್ಯುತ್ ಯೋಜನೆಯಾಗಿತ್ತು.
• ಇಲ್ಲಿನ ವಿದ್ಯುತ್ತನ್ನು ಮೊದಲು 147 ಕಿ.ಮೀ ದೂರದ ಕೋಲಾರ ಚಿನ್ನದ ಗಣಿಗೆ (KGF) ನೀಡಲಾಯಿತು.
• ನಂತರ 1905 ರಲ್ಲಿ ಬೆಂಗಳೂರು ನಗರಕ್ಕೆ ಹೆಚ್ಚುವರಿ ವಿದ್ಯುತ್ ಪೂರೈಕೆ ಮಾಡಲಾಯಿತು.
• ಈ ಯೋಜನೆಯು ನಾಲ್ವಡಿ ಕೃಷ್ಣರಾಜ ಒಡೆಯರ್ ಅವರ ಆಳ್ವಿಕೆಯಲ್ಲಿ ಪ್ರಾರಂಭವಾಯಿತು.

ಆದ್ದರಿಂದ ಎಲ್ಲಾ ನಾಲ್ಕು ಹೇಳಿಕೆಗಳು (a, b, c, d) ಸರಿಯಾಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q94', 94, 2026, 'September', 1, 'hk', 'ksp-pc', 'art_culture_heritage.cultural_institutions_numismatics_initiatives', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Cultural Institutions, Numismatics & Cultural Initiatives', 'ಸಾಂಸ್ಕೃತಿಕ ಸಂಸ್ಥೆಗಳು, ನಾಣ್ಯಶಾಸ್ತ್ರ ಮತ್ತು ಸಾಂಸ್ಕೃತಿಕ ಉಪಕ್ರಮಗಳು', 'National Honors & Padma Awardees 2026 Profiles', 'ರಾಷ್ಟ್ರೀಯ ಗೌರವಗಳು ಮತ್ತು ಪದ್ಮ ಪ್ರಶಸ್ತಿ ಪುರಸ್ಕೃತರು 2026', 'hard', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Current Affairs', 'Padma Awards', 'Distinguished Personalities', 'Art, Culture & Heritage']::TEXT[], '', '', 'Consider the following pairs containing the names of Padma Awardees-2026 and the posts which they held earlier :
(a) Jagadeesh Kumar: Former Chairman of UGC
(b) Shashishekar Vempati - Former Chairman of ICAR
(c) Budha Krishna Mani - Former Chairman of Prasar Bharati
Which of the pairs given above is/are incorrectly matched ?', '2026 ರ ಪದ್ಮ ಪ್ರಶಸ್ತಿ ವಿಜೇತರ ಹೆಸರುಗಳು ಮತ್ತು ಅವರು ಹಿಂದೆ ಹೊಂದಿದ್ದ ಹುದ್ದೆಗಳಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಈ ಕೆಳಗಿನ ಜೋಡಿಗಳನ್ನು ಪರಿಗಣಿಸಿ.
(a) ಜಗದೀಶ್ ಕುಮಾರ್ - ಯುಜಿಸಿಯ ಹಿಂದಿನ ಅಧ್ಯಕ್ಷರು
(b) ಶಶಿಶೇಖರ್ ವೆಂಪತಿ - ಐಸಿಎಆರ್ ನ ಹಿಂದಿನ ಅಧ್ಯಕ್ಷರು
(c) ಬುದ್ಧ ಕೃಷ್ಣಮಣಿ - ಪ್ರಸಾರ ಭಾರತಿಯ ಹಿಂದಿನ ಅಧ್ಯಕ್ಷರು
ಮೇಲೆ ನೀಡಲಾದ ಜೋಡಿಗಳಲ್ಲಿ ಯಾವುದು/ಯಾವುವು ತಪ್ಪಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿದೆ ?', '(b) and (c) only', '(a) and (b) only', '(a) and (c) only', '(a) only', '(b) ಮತ್ತು (c) ಮಾತ್ರ', '(a) ಮತ್ತು (b) ಮಾತ್ರ', '(a) ಮತ್ತು (c) ಮಾತ್ರ', '(a) ಮಾತ್ರ', '1', 'Correct Answer: (1)

Explanation:
• (a) M. Jagadesh Kumar served as the Chairman of the UGC (Correctly matched).
• (b) Shashi Shekhar Vempati served as the CEO of Prasar Bharati, not ICAR (Incorrectly matched).
• (c) Dr. Buddha Rashmi Mani served as Director General of the National Museum and ADG of ASI, not Prasar Bharati (Incorrectly matched).

Hence, pairs (b) and (c) are incorrectly matched.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
• (a) ಎಂ. ಜಗದೀಶ್ ಕುಮಾರ್ ಅವರು ಯುಜಿಸಿ (UGC) ಹಿಂದಿನ ಅಧ್ಯಕ್ಷರಾಗಿದ್ದರು (ಸರಿ).
• (b) ಶಶಿಶೇಖರ್ ವೆಂಪತಿ ಅವರು ಪ್ರಸಾರ ಭಾರತಿಯ ಮಾಜಿ ಮುಖ್ಯ ಕಾರ್ಯನಿರ್ವಾಹಕರಾಗಿದ್ದರು (CEO), ICAR ನವರಲ್ಲ (ತಪ್ಪು).
• (c) ಬುದ್ಧ ರಶ್ಮಿ ಮಣಿ ಅವರು ಭಾರತೀಯ ಪುರಾತತ್ವ ಸರ್ವೇಕ್ಷಣಾ ಇಲಾಖೆಯ (ASI) ಮಾಜಿ ಮಹಾನಿರ್ದೇಶಕರಾಗಿದ್ದರು, ಪ್ರಸಾರ ಭಾರತಿಯವರಲ್ಲ (ತಪ್ಪು).

ಆದ್ದರಿಂದ (b) ಮತ್ತು (c) ಜೋಡಿಗಳು ತಪ್ಪಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q95', 95, 2026, 'September', 1, 'hk', 'ksp-pc', 'geography_earth_systems.human_geography_population_settlements', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Human Geography (Population & Settlements)', 'ಮಾನವ ಭೂಗೋಳಶಾಸ್ತ್ರ (ಜನಸಂಖ್ಯೆ ಮತ್ತು ವಸಾಹತುಗಳು)', 'Global Indigenous Tribes & Geographic Habitats (Bedouin, Pygmy, Masai, Inuit)', 'ವಿಶ್ವದ ಪ್ರಮುಖ ಬುಡಕಟ್ಟುಗಳು ಮತ್ತು ಭೌಗೋಳಿಕ ಆವಾಸಸ್ಥಾನಗಳು (ಬೆಡೋಯಿನ್, ಪಿಗ್ಮಿ, ಮಸಾಯಿ, ಇನ್ಯೂಟ್)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'World Geography', 'Human Geography', 'Tribes of the World', 'Geography & Earth Systems']::TEXT[], '', '', 'Match List - I with List - II and choose the correct answers:
List - I (Tribal People)
(a) Pygmies
(b) Bedouins
(c) Bushmen
(d) Khirghiz

List - II (Living Area)
(i) Arabian Desert
(ii) Congo Basin
(iii) Central Asia
(iv) Kalahari Desert
Codes:', 'ಪಟ್ಟಿ -I ಅನ್ನು ಪಟ್ಟಿ-II ರ ಜೊತೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.
ಪಟ್ಟಿ-I (ಬುಡಕಟ್ಟು ಜನರು)
(a) ಪಿಗ್ಮಿಗಳು
(b) ಬೆಡೊಯಿನ್ನರು
(c) ಬುಶ್‌ಮನ್ನರು
(d) ಕಿರ್ಗಿಜ್‌ರು

ಪಟ್ಟಿ-II (ವಾಸದ ಪ್ರದೇಶ)
(i) ಅರೇಬಿಯಾದ ಮರುಭೂಮಿ
(ii) ಕಾಂಗೋ ಜಲಾನಯನ ಪ್ರದೇಶ
(iii) ಮಧ್ಯ ಏಷ್ಯಾ
(iv) ಕಲಹರಿ ಮರುಭೂಮಿ
ಸಂಕೇತಗಳು:', '(a)-(ii), (b)-(iv), (c)-(iii), (d)-(i)', '(a)-(iii), (b)-(i), (c)-(ii), (d)-(iv)', '(a)-(iv), (b)-(iii), (c)-(i), (d)-(ii)', '(a)-(ii), (b)-(i), (c)-(iv), (d)-(iii)', '(a)-(ii), (b)-(iv), (c)-(iii), (d)-(i)', '(a)-(iii), (b)-(i), (c)-(ii), (d)-(iv)', '(a)-(iv), (b)-(iii), (c)-(i), (d)-(ii)', '(a)-(ii), (b)-(i), (c)-(iv), (d)-(iii)', '4', 'Correct Answer: (4)

Explanation:
• Pygmies: Equatorial rainforest of the Congo Basin (ii)
• Bedouins: Nomadic pastoralists of the Arabian Desert (i)
• Bushmen: Hunter-gatherers of the Kalahari Desert (iv)
• Khirghiz: Pastoral nomads of the steppes of Central Asia (iii)

Correct matching code: (a)-(ii), (b)-(i), (c)-(iv), (d)-(iii).', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
ಬುಡಕಟ್ಟು ಜನರು ಮತ್ತು ಅವರ ವಾಸಸ್ಥಾನಗಳ ಹೊಂದಾಣಿಕೆ:
• ಪಿಗ್ಮಿಗಳು: ಆಫ್ರಿಕಾದ ಕಾಂಗೋ ಜಲಾನಯನ ಪ್ರದೇಶ (ii)
• ಬೆಡೊಯಿನ್ನರು: ಅರೇಬಿಯಾದ ಮರುಭೂಮಿ (i)
• ಬುಶ್‌ಮನ್ನರು: ದಕ್ಷಿಣ ಆಫ್ರಿಕಾದ ಕಲಹರಿ ಮರುಭೂಮಿ (iv)
• ಕಿರ್ಗಿಜ್‌ರು: ಮಧ್ಯ ಏಷ್ಯಾದ ಹುಲ್ಲುಗಾವಲು ಪ್ರದೇಶ (iii)

ಸರಿಯಾದ ಸಂಕೇತ: (a)-(ii), (b)-(i), (c)-(iv), (d)-(iii).', NULL, NULL),
    ('pc-hk-2026-q96', 96, 2026, 'September', 1, 'hk', 'ksp-pc', 'geography_earth_systems.climatology_atmospheric_dynamics', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Climatology & Atmospheric Dynamics', 'ಹವಾಮಾನ ಮತ್ತು ವಾತಾವರಣದ ಚಲನಶಾಸ್ತ್ರ', 'Cartographic Isolines in Climatology and Oceanography (Isohyet, Isobar, Isotherm, Isohaline)', 'ಹವಾಮಾನ ಮತ್ತು ಸಾಗರಶಾಸ್ತ್ರದ ಸಮಾನ ರೇಖೆಗಳು (ಐಸೋಹೈಟ್, ಐಸೋಬಾರ್, ಐಸೋಥರ್ಮ್, ಐಸೋಹ್ಯಾಲೈನ್)', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Physical Geography', 'Climatology', 'Isolines', 'Geography & Earth Systems']::TEXT[], '', '', 'Which of the following pair is wrongly matched ?', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ತಪ್ಪಾಗಿ ಹೊಂದಾಣಿಕೆಯಾದ ಜೋಡಿ ಯಾವುದು ?', 'Isotherm — Equal atmospheric temperature', 'Isohytes — Equal amount of precipitation', 'Isobaths — Equal water depth', 'Isobar — Equal water salinity', 'ಐಸೋಥರ್ಮ್ - ಸಮ ವಾಯುಮಂಡಲದ ಉಷ್ಣಾಂಶ', 'ಐಸೋಹೈಟ್ಸ್ - ಸಮ ಪ್ರಮಾಣದ ಮಳೆ', 'ಐಸೋಬಾತ್ - ಸಮ ನೀರಿನ ಆಳ', 'ಐಸೋಬಾರ್ - ಸಮ ನೀರಿನ ಲವಣಾಂಶ', '4', 'Correct Answer: (4)

Explanation:
• Isotherms are lines joining places of equal temperature.
• Isohyets are lines joining places receiving equal precipitation.
• Isobaths connect points of equal water depth.
• Isobars connect places of equal atmospheric pressure, whereas lines joining places of equal salinity are known as Isohalines. Hence, pair (4) is wrongly matched.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ವಿವರಣೆ:
• ಐಸೋಥರ್ಮ್: ಸಮಾನ ಉಷ್ಣಾಂಶವಿರುವ ಸ್ಥಳಗಳನ್ನು ಜೋಡಿಸುವ ರೇಖೆಗಳು.
• ಐಸೋಹೈಟ್ಸ್: ಸಮಾನ ಪ್ರಮಾಣದ ಮಳೆಯಾಗುವ ಸ್ಥಳಗಳನ್ನು ಜೋಡಿಸುವ ರೇಖೆಗಳು.
• ಐಸೋಬಾತ್: ಸಮುದ್ರದಲ್ಲಿ ಸಮಾನ ಆಳವಿರುವ ಬಿಂದುಗಳನ್ನು ಜೋಡಿಸುವ ರೇಖೆಗಳು.
• ಐಸೋಬಾರ್: ಸಮಾನ ವಾಯುಭಾರವಿರುವ ಸ್ಥಳಗಳನ್ನು ಜೋಡಿಸುವ ರೇಖೆಯಾಗಿದೆ (ಸಮಾನ ಲವಣಾಂಶವನ್ನು ''ಐಸೋಹಲೈನ್'' ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ). ಆದ್ದರಿಂದ (4) ತಪ್ಪಾದ ಜೋಡಿ.', NULL, NULL),
    ('pc-hk-2026-q97', 97, 2026, 'September', 1, 'hk', 'ksp-pc', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.in-situ_conservation_architecture', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Biodiversity, Wildlife Conservation & Protected Areas', 'ಜೀವವೈವಿಧ್ಯ, ವನ್ಯಜೀವಿ ಸಂರಕ್ಷಣೆ ಮತ್ತು ಸಂರಕ್ಷಿತ ಪ್ರದೇಶಗಳು', 'National Parks & Wildlife Sanctuaries in Karnataka (Kudremukh, Bandipur, Nagarhole, Bhadra)', 'ಕರ್ನಾಟಕದ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನಗಳು ಮತ್ತು ವನ್ಯಜೀವಿ ಧಾಮಗಳು (ಕುದುರೆಮುಖ, ಬಂಡೀಪುರ, ನಾಗರಹೊಳೆ, ಭದ್ರಾ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Karnataka Geography', 'National Parks', 'Wildlife Sanctuaries', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'Identify the incorrect pair/s among the following:
a. Anashi — Kodagu
b. Kudremukh — Dakshina Kannada
c. Mookambika — Udupi
d. Pushpagiri — Kodagu', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ತಪ್ಪಾದ ಜೋಡಿ/ಜೋಡಿಗಳನ್ನು ಗುರುತಿಸಿ.
a. ಅಣಶಿ - ಕೊಡಗು
b. ಕುದುರೆಮುಖ - ದಕ್ಷಿಣ ಕನ್ನಡ
c. ಮೂಕಾಂಬಿಕಾ - ಉಡುಪಿ
d. ಪುಷ್ಪಗಿರಿ - ಕೊಡಗು', 'a and b only', 'a, b and c', 'c and d only', 'a only', 'a ಮತ್ತು b ಮಾತ್ರ', 'a, b ಮತ್ತು c', 'c ಮತ್ತು d ಮಾತ್ರ', 'a ಮಾತ್ರ', '1', 'Correct Answer: (1)

Explanation:
• a. Anshi National Park is located in Uttara Kannada district, not Kodagu (Incorrect).
• b. Kudremukh National Park is primarily located in Chikkamagaluru district, not Dakshina Kannada (Incorrect).
• c. Mookambika Wildlife Sanctuary is situated in Udupi district (Correct).
• d. Pushpagiri Wildlife Sanctuary is situated in Kodagu district (Correct).

Hence, pairs ''a and b only'' are incorrect.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವರಣೆ:
• a. ಅಣಶಿ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನವು ಉತ್ತರ ಕನ್ನಡ ಜಿಲ್ಲೆಯಲ್ಲಿದೆ, ಕೊಡಗಿನಲ್ಲಲ್ಲ (ತಪ್ಪು).
• b. ಕುದುರೆಮುಖ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನವು ಪ್ರಮುಖವಾಗಿ ಚಿಕ್ಕಮಗಳೂರು ಜಿಲ್ಲೆಯಲ್ಲಿದೆ (ತಪ್ಪು).
• c. ಮೂಕಾಂಬಿಕಾ ವನ್ಯಜೀವಿ ಧಾಮವು ಉಡುಪಿ ಜಿಲ್ಲೆಯಲ್ಲಿದೆ (ಸರಿ).
• d. ಪುಷ್ಪಗಿರಿ ವನ್ಯಜೀವಿ ಧಾಮವು ಕೊಡಗು ಜಿಲ್ಲೆಯಲ್ಲಿದೆ (ಸರಿ).

ಆದ್ದರಿಂದ ''a ಮತ್ತು b ಮಾತ್ರ'' ತಪ್ಪಾದ ಜೋಡಿಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-hk-2026-q98', 98, 2026, 'September', 1, 'hk', 'ksp-pc', 'geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Physical Geography & Earth Systems (Geomorphology)', 'ಭೌತಿಕ ಭೂಗೋಳಶಾಸ್ತ್ರ ಮತ್ತು ಭೂರೂಪಶಾಸ್ತ್ರ', 'Tensional Faulting, Graben & Continental Rift Valley Formations', 'ಭೂಖಂಡದ ಬಿರುಕು ಕಣಿವೆಗಳ ರಚನೆ (ರಿಫ್ಟ್ ವ್ಯಾಲಿ), ಭ್ರಂಶ ಮತ್ತು ಗ್ರೇಬನ್', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Physical Geography', 'Geomorphology', 'Faulting', 'Geography & Earth Systems']::TEXT[], '', '', 'Rift valley is formed due to', 'ಸೀಳು ಕಣಿವೆಯು ರಚನೆಯಾಗುವುದು', 'Folds', 'Faults', 'Compression', 'Joints', 'ಮಡಿಕೆಗಳಿಂದ', 'ಸ್ತರ ಭಂಗಗಳಿಂದ', 'ಸಂಕೋಚನದಿಂದ', 'ಸೀಳುಗಳಿಂದ', '2', 'Correct Answer: (2)

Explanation:
A rift valley (graben) is a lowland region formed by the subsidence of a crustal block between parallel geological faults due to divergent tectonic forces and tensional stress.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಭೂಮಿಯ ಶಿಲಾಪದರಗಳ ಮೇಲೆ ಉಂಟಾಗುವ ಎಳೆತದ ಬಲಗಳಿಂದಾಗಿ ಬಿರುಕುಗಳು ಉಂಟಾಗಿ, ಎರಡು ಸಮಾಂತರ ಸ್ತರಭಂಗಗಳ (Faults) ನಡುವಿನ ಭೂಭಾಗವು ಕೆಳಗೆ ಕುಸಿದಾಗ ಸೀಳು ಕಣಿವೆಗಳು (Rift valleys) ನಿರ್ಮಾಣವಾಗುತ್ತವೆ.', NULL, NULL),
    ('pc-hk-2026-q99', 99, 2026, 'September', 1, 'hk', 'ksp-pc', 'international_relations_global_institutions.global_institutions_agreements_treaties.international_organisations_reform', 'International Relations & Global Institutions', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು', 'Global Institutions, Agreements & Treaties', 'ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು, ಒಪ್ಪಂದಗಳು ಮತ್ತು ಒಡಂಬಡಿಕೆಗಳು', 'Nobel Peace Prize Laureates & International Peace Recognition', 'ನೊಬೆಲ್ ಶಾಂತಿ ಪ್ರಶಸ್ತಿ ಪುರಸ್ಕೃತರು ಮತ್ತು ಅಂತರರಾಷ್ಟ್ರೀಯ ಶಾಂತಿ ಸಂಸ್ಥೆಗಳು', 'easy', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Current Affairs', 'Nobel Peace Prize', 'International Awards', 'International Relations & Global Institutions']::TEXT[], '', '', 'Who among the following has NOT been awarded the Nobel Peace Prize?', 'ಕೆಳಗಿನವರಲ್ಲಿ ಯಾರಿಗೆ ನೊಬೆಲ್ ಶಾಂತಿ ಪ್ರಶಸ್ತಿಯನ್ನು ಪ್ರದಾನಿಸಲಾಗಿಲ್ಲ ?', 'Nihon Hidankyo', 'Narges Mohammadi', 'Donald Trump', 'Maria Corina Machado', 'ನಿಹೋನ್ ಹಿಡಾಂಕ್ಯೋ', 'ನರ್ಗೀಸ್ ಮೊಹಮ್ಮದಿ', 'ಡೊನಾಲ್ಡ್ ಟ್ರಂಪ್', 'ಮರಿಯಾ ಕೊರಿನಾ ಮಚಾಡೊ', '3', 'Correct Answer: (3)

Explanation:
• Nihon Hidankyo won the Nobel Peace Prize in 2024.
• Narges Mohammadi won the Nobel Peace Prize in 2023.
• Donald Trump has never been awarded the Nobel Peace Prize.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವಿವರಣೆ:
• ನಿಹೋನ್ ಹಿಡಾಂಕ್ಯೋ (Nihon Hidankyo) ಸಂಸ್ಥೆಗೆ 2024 ರಲ್ಲಿ ನೊಬೆಲ್ ಶಾಂತಿ ಪ್ರಶಸ್ತಿ ನೀಡಲಾಯಿತು.
• ನರ್ಗೀಸ್ ಮೊಹಮ್ಮದಿ ಅವರಿಗೆ 2023 ರಲ್ಲಿ ನೊಬೆಲ್ ಶಾಂತಿ ಪ್ರಶಸ್ತಿ ನೀಡಲಾಯಿತು.
• ಅಮೆರಿಕದ ಮಾಜಿ ಅಧ್ಯಕ್ಷ ಡೊನಾಲ್ಡ್ ಟ್ರಂಪ್ ಅವರಿಗೆ ನೊಬೆಲ್ ಶಾಂತಿ ಪ್ರಶಸ್ತಿ ದೊರೆತಿಲ್ಲ.', NULL, NULL),
    ('pc-hk-2026-q100', 100, 2026, 'September', 1, 'hk', 'ksp-pc', 'history.history_of_karnataka.armed_resistance_freedom_movement_in_karnataka.nationalist_movement_gandhian_agitations_in_karnataka', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Kamaladevi Chattopadhyay (''Mother of Handloom'', Freedom Fighter & Cultural Revivalist)', 'ಕಮಲಾದೇವಿ ಚಟ್ಟೋಪಾಧ್ಯಾಯ (''ಕೈಮಗ್ಗದ ತಾಯಿ'', ಸ್ವಾತಂತ್ರ್ಯ ಹೋರಾಟಗಾರ್ತಿ ಮತ್ತು ಕರಕುಶಲ ಕಲಾ ಪುನರುತ್ಥಾನಕಿ)', 'medium', ARRAY['HK APC-CAR/DAR 2026', 'Paper 1', 'Modern Indian History', 'Freedom Struggle', 'Handicrafts', 'History']::TEXT[], '', '', 'Which of the following freedom fighter is known as "Mother of Handloom"?', 'ಈ ಕೆಳಕಂಡ ಯಾವ ಸ್ವಾತಂತ್ರ್ಯ ಹೋರಾಟಗಾರ್ತಿಯನ್ನು “ಕೈಮಗ್ಗದ ತಾಯಿ” ಎಂದು ಕರೆಯುತ್ತಾರೆ ?', 'Kasturba Gandhi', 'Kamaladevi Chattopadhyay', 'Aruna Asaf Ali', 'Sarojini Naidu', 'ಕಸ್ತೂರ್‌ಬಾ ಗಾಂಧಿ', 'ಕಮಲಾದೇವಿ ಚಟ್ಟೋಪಾಧ್ಯಾಯ', 'ಅರುಣಾ ಅಸಫ್ ಅಲಿ', 'ಸರೋಜಿನಿ ನಾಯ್ಡು', '2', 'Correct Answer: (2)

Explanation:
Kamaladevi Chattopadhyay was a prominent freedom fighter, social reformer, and champion of Indian handicrafts and handlooms. For her pioneering role in establishing institutions like the Crafts Council of India and the Central Cottage Industries Emporium, she is fondly remembered as the ''Mother of Handloom''.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವಿವರಣೆ:
ಭಾರತದ ಸ್ವಾತಂತ್ರ್ಯ ಹೋರಾಟಗಾರ್ತಿ ಮತ್ತು ಸಮಾಜ ಸುಧಾರಕಿಯಾದ ಕಮಲಾದೇವಿ ಚಟ್ಟೋಪಾಧ್ಯಾಯ ಅವರು ದೇಶದ ಸಾಂಪ್ರದಾಯಿಕ ಕರಕುಶಲ ಮತ್ತು ಕೈಮಗ್ಗ ಕ್ಷೇತ್ರಕ್ಕೆ ನೀಡಿದ ಮಹೋನ್ನತ ಕೊಡುಗೆಗಾಗಿ ಅವರನ್ನು ''ಕೈಮಗ್ಗದ ತಾಯಿ'' (Mother of Handloom) ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ.', NULL, NULL)
ON CONFLICT (id) DO UPDATE SET
    node_id = EXCLUDED.node_id,
    subject = EXCLUDED.subject,
    subject_kannada = EXCLUDED.subject_kannada,
    domain = EXCLUDED.domain,
    domain_kannada = EXCLUDED.domain_kannada,
    sub_topic = EXCLUDED.sub_topic,
    sub_topic_kannada = EXCLUDED.sub_topic_kannada,
    difficulty = EXCLUDED.difficulty,
    tags = EXCLUDED.tags,
    question_english = EXCLUDED.question_english,
    question_kannada = EXCLUDED.question_kannada,
    option_1_english = EXCLUDED.option_1_english,
    option_2_english = EXCLUDED.option_2_english,
    option_3_english = EXCLUDED.option_3_english,
    option_4_english = EXCLUDED.option_4_english,
    option_1_kannada = EXCLUDED.option_1_kannada,
    option_2_kannada = EXCLUDED.option_2_kannada,
    option_3_kannada = EXCLUDED.option_3_kannada,
    option_4_kannada = EXCLUDED.option_4_kannada,
    key_answer = EXCLUDED.key_answer,
    explanation_english = EXCLUDED.explanation_english,
    explanation_kannada = EXCLUDED.explanation_kannada,
    image_url = EXCLUDED.image_url,
    table_data = EXCLUDED.table_data;

-- ═════════════════════════════════════════════════════════════════════════
-- Seed Data: Non-Hyderabad Karnataka (NHK) CAR/DAR Sept 2026 (Q1 to Q100)
-- ═════════════════════════════════════════════════════════════════════════
INSERT INTO public.pc_pyq (
    id, question_number, year, month, paper, paper_code, exam_id, node_id,
    subject, subject_kannada, domain, domain_kannada, sub_topic, sub_topic_kannada,
    difficulty, tags, passage_english, passage_kannada, question_english, question_kannada,
    option_1_english, option_2_english, option_3_english, option_4_english,
    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,
    key_answer, explanation_english, explanation_kannada, image_url, table_data
) VALUES
    ('pc-nhk-2026-q1', 1, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.ancient_india.south_indian_kingdoms', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Indo-Roman Trade and Maritime Commerce (Sangam Era Ports)', 'ಇಂಡೋ-ರೋಮನ್ ವ್ಯಾಪಾರ ಮತ್ತು ಕಡಲ ವಾಣಿಜ್ಯ (ಸಂಗಮ್ ಯುಗದ ಬಂದರುಗಳು)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Ancient History', 'History']::TEXT[], '', '', 'With whom the Romans first started their trade in India ?', 'ಭಾರತದಲ್ಲಿ ರೋಮನ್ನರು ಯಾರೊಂದಿಗೆ ಮೊಟ್ಟಮೊದಲು ವ್ಯಾಪಾರ ಆರಂಭಿಸಿದರು ?', 'Shaka States', 'Satavahanas', 'Magadha Empire', 'Tamil States', 'ಶಕ ರಾಜ್ಯಗಳು', 'ಶಾತವಾಹನರು', 'ಮಗಧ ಸಾಮ್ರಾಜ್ಯ', 'ತಮಿಳು ರಾಜ್ಯಗಳು', '4', 'Correct Answer: (4)

Following the discovery of the monsoon winds by Hippalus in the 1st century BCE, direct maritime trade between the Roman Empire and the Indian subcontinent flourished primarily with the ancient Tamil kingdoms of the Sangam era (Cheras, Cholas, and Pandyas). Ancient ports such as Muziris (Kodungallur), Korkai, and Arikamedu served as major emporiums where Roman gold and silver coins were exchanged for Indian black pepper (''black gold''), beryl, pearls, fine muslin, and exotic spices. Extensive hoards of Roman aurei and denarii discovered throughout Tamilakam confirm this early commercial contact.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಕ್ರಿ.ಪೂ. 1ನೇ ಶತಮಾನದಲ್ಲಿ ಹಿಪ್ಪಾಲಸ್ ಎಂಬ ನಾವಿಕ ಮಾನ್ಸೂನ್ ಮಾರುತಗಳ ರಹಸ್ಯವನ್ನು ಕಂಡುಹಿಡಿದ ನಂತರ, ರೋಮನ್ನರು ಭಾರತದ ಪ್ರಾಚೀನ ತಮಿಳು ರಾಜ್ಯಗಳಾದ ಚೇರ, ಚೋಳ ಮತ್ತು ಪಾಂಡ್ಯರೊಂದಿಗೆ (ಸಂಗಮ್ ಕಾಲದ ತಮಿಳಗಂ) ವ್ಯಾಪಕ ಸಮುದ್ರ ವ್ಯಾಪಾರವನ್ನು ಆರಂಭಿಸಿದರು. ಕೇರಳ ಮತ್ತು ತಮಿಳುನಾಡಿನ ಮುಸಿರಿಸ್, ಕೊರ್ಕೈ ಹಾಗೂ ಅರಿಕಾಮೇಡು ಬಂದರುಗಳು ಪ್ರಮುಖ ವಾಣಿಜ್ಯ ಕೇಂದ್ರಗಳಾಗಿದ್ದವು. ರೋಮನ್ನರು ಭಾರತದ ಕಪ್ಪು ಮೆಣಸು (''ಕಪ್ಪು ಚಿನ್ನ''), ಮುತ್ತುಗಳು, ರತ್ನಗಳು ಮತ್ತು ರೇಷ್ಮೆ ಬಟ್ಟೆಗಳಿಗಾಗಿ ಬೃಹತ್ ಪ್ರಮಾಣದಲ್ಲಿ ರೋಮನ್ ಚಿನ್ನ ಮತ್ತು ಬೆಳ್ಳಿಯ ನಾಣ್ಯಗಳನ್ನು ನೀಡುತ್ತಿದ್ದರು. ದಕ್ಷಿಣ ಭಾರತದಲ್ಲಿ ದೊರೆತಿರುವ ರೋಮನ್ ನಾಣ್ಯಗಳ ರಾಶಿ ಇದಕ್ಕೆ ಸಾಕ್ಷಿಯಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q2', 2, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.modern_india.socio-religious_reform_movements', 'History', 'ಇತಿಹಾಸ', 'Modern India', 'ಆಧುನಿಕ ಭಾರತ', 'Press and Nationalist Periodicals (Socio-Religious Reform Journalism)', 'ಸ್ವಾತಂತ್ರ್ಯ ಚಳವಳಿಯ ಪತ್ರಿಕೋದ್ಯಮ ಮತ್ತು ನಿಯತಕಾಲಿಕೆಗಳು', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Modern History', 'History']::TEXT[], '', '', 'Identify the incorrect pairs in the following :

a. Swadesha Mitran - Dayal Singh
b. Tribune - G.S. Iyer
c. Rast Goftar - Dadabhai Naoroji
d. Indian Mirror - Devendranath Tagore

Choose the correct answer :', 'ಕೆಳಗಿನವುಗಳಲ್ಲಿ ತಪ್ಪಾದ ಜೋಡಿಗಳನ್ನು ಗುರುತಿಸಿ.

a. ಸ್ವದೇಶ ಮಿತ್ರನ್ - ದಯಾಳ್ ಸಿಂಗ್
b. ಟ್ರಿಬ್ಯೂನ್ - ಜಿ.ಎಸ್. ಐಯ್ಯರ್
c. ರಾಸ್ತ್ ಗೋಫ್ತಾರ್ - ದಾದಾಬಾಯಿ ನವರೋಜಿ
d. ಇಂಡಿಯನ್ ಮಿರರ್ - ದೇವೇಂದ್ರನಾಥ ಠಾಗೋರ್

ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆಯ್ಕೆ ಮಾಡಿ.', 'c and d', 'a and b', 'a and d', 'b and c', 'c ಮತ್ತು d', 'a ಮತ್ತು b', 'a ಮತ್ತು d', 'b ಮತ್ತು c', '2', 'Correct Answer: (2)

Pairs (a) and (b) are transposed and incorrect:
• ''Swadesamitran'' was founded in 1882 by G. Subrahmania Iyer (who also co-founded ''The Hindu'') in Madras as a premier Tamil nationalistic newspaper.
• ''The Tribune'' was founded in Lahore in 1881 by philanthropist and nationalist Sardar Dyal Singh Majithia.
• ''Rast Goftar'' (The Truth Teller) was launched in 1854 by Dadabhai Naoroji to champion social and religious reform among the Parsi community.
• ''Indian Mirror'' was founded in 1861 by Devendranath Tagore and Manmohan Ghosh in Calcutta.
Thus, pairs (a) and (b) are the incorrect pairs.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಇಲ್ಲಿ (a) ಮತ್ತು (b) ಜೋಡಿಗಳನ್ನು ಪರಸ್ಪರ ಬದಲಾಯಿಸಲಾಗಿದ್ದು, ಅವು ತಪ್ಪಾಗಿವೆ:
• ''ಸ್ವದೇಶ ಮಿತ್ರನ್'' ಪತ್ರಿಕೆಯನ್ನು 1882 ರಲ್ಲಿ ಮದ್ರಾಸ್‌ನಲ್ಲಿ ಜಿ. ಸುಬ್ರಹ್ಮಣ್ಯ ಅಯ್ಯರ್ (ದಿ ಹಿಂದೂ ಪತ್ರಿಕೆಯ ಸಹ-ಸಂಸ್ಥಾಪಕರು) ಆರಂಭಿಸಿದರು.
• ''ದಿ ಟ್ರಿಬ್ಯೂನ್'' ಪತ್ರಿಕೆಯನ್ನು 1881 ರಲ್ಲಿ ಲಾಹೋರ್‌ನಲ್ಲಿ ಸರ್ದಾರ್ ದಯಾಳ್ ಸಿಂಗ್ ಮಜಿಥಿಯಾ ಅವರು ಸ್ಥಾಪಿಸಿದರು.
• ''ರಾಸ್ತ್ ಗೋಫ್ತಾರ್'' ಪತ್ರಿಕೆಯನ್ನು 1854 ರಲ್ಲಿ ದಾದಾಬಾಯಿ ನವರೋಜಿ ಅವರು ಪಾರ್ಸಿ ಸಮುದಾಯದ ಸುಧಾರಣೆಗಾಗಿ ಮುಂಬೈನಲ್ಲಿ ಆರಂಭಿಸಿದರು.
• ''ಇಂಡಿಯನ್ ಮಿರರ್'' ಪತ್ರಿಕೆಯನ್ನು 1861 ರಲ್ಲಿ ಕಲ್ಕತ್ತಾದಲ್ಲಿ ದೇವೇಂದ್ರನಾಥ ಠಾಗೋರ್ ಮತ್ತು ಮನಮೋಹನ್ ಘೋಷ್ ಸ್ಥಾಪಿಸಿದರು.
ಆದ್ದರಿಂದ a ಮತ್ತು b ತಪ್ಪಾದ ಜೋಡಿಗಳಾಗಿದ್ದು, ಆಯ್ಕೆ 2 ಸರಿಯಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q3', 3, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.history_of_karnataka.ancient_dynasties_of_karnataka.western_gangas_of_talakad', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Western Gangas of Talakad (Dynastic Architecture and Inscriptions)', 'ತಲಕಾಡಿನ ಪಶ್ಚಿಮ ಗಂಗರು (ವಾಸ್ತುಶಿಲ್ಪ ಮತ್ತು ಶಾಸನಗಳು)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Karnataka History', 'History']::TEXT[], '', '', 'Identify the correct statements from the codes given below :

(a) Shivamara II wrote ''Gajashtaka'' in Kannada.
(b) ''Gajashtaka'' is described as an ''Onake vadu''.
(c) Shivamara II is one of the greatest Ganga Kings.
(d) Shivamara II ruled between 726 A.D.-787 A.D.', 'ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳಲ್ಲಿ ಸರಿಯಾದವುಗಳನ್ನು ಗುರುತಿಸಿ, ಕೊಟ್ಟಿರುವ ಸಂಕೇತಗಳಿಂದ ಆರಿಸಿ.

(a) 2ನೇ ಶಿವಮಾರನು ಕನ್ನಡದಲ್ಲಿ ''ಗಜಾಷ್ಟಕ'' ಕೃತಿ ಬರೆದನು.
(b) ''ಗಜಾಷ್ಟಕ''ವನ್ನು ''ಒನಕೆ ಹಾಡು'' ಎಂದು ಕರೆಯಲಾಗಿದೆ.
(c) 2ನೇ ಶಿವಮಾರನು ಗಂಗರ ಒಬ್ಬ ಪ್ರಸಿದ್ಧ ದೊರೆ.
(d) 2ನೇ ಶಿವಮಾರನು ಕ್ರಿ.ಶ. 726 ರಿಂದ- ಕ್ರಿ.ಶ. 787 ರವರೆಗೆ ಆಳಿದನು.', '(a), (b) and (c) are correct.', '(a), (b), (c) and (d) are correct.', '(b) and (d) are correct.', '(a) and (d) are correct.', '(a), (b) ಮತ್ತು (c) ಸರಿಯಾಗಿವೆ.', '(a), (b), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', '(b) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', '(a) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', '1', 'Correct Answer: (1)

• Shivamara II (ruled c. 788–816 CE) was an accomplished scholar-king of the Western Ganga dynasty. He authored ''Gajashtaka'' (an eight-verse Kannada poetic treatise on elephant management) and ''Gajamata Kalpana''.
• ''Gajashtaka'' became immensely popular as an oral work and was sung as an ''Onake Hadu'' (pounding song sung by women while pounding grain).
• He was a prominent monarch of the dynasty, resisting Rashtrakuta dominance under Dhruva and Govinda III.
• Statement (d) is incorrect because the period 726–788 CE belongs to his illustrious father, King Sripurusha (author of ''Gajashastra'').', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• 2ನೇ ಶಿವಮಾರನು (ಆಳ್ವಿಕೆ ಕ್ರಿ.ಶ. ಸುಮಾರು 788–816) ಗಂಗ ವಂಶದ ಅತ್ಯಂತ ವಿದ್ವಾಂಸ ರಾಜನಾಗಿದ್ದನು. ಈತ ಆನೆಗಳ ಪಾಲನೆ ಹಾಗೂ ಲಕ್ಷಣಗಳ ಕುರಿತು ಕನ್ನಡದಲ್ಲಿ ''ಗಜಾಷ್ಟಕ'' ಮತ್ತು ಸಂಸ್ಕೃತದಲ್ಲಿ ''ಗಜಮತ ಕಲ್ಪನಾ'' ಎಂಬ ಪ್ರಸಿದ್ಧ ಗ್ರಂಥಗಳನ್ನು ರಚಿಸಿದನು.
• ''ಗಜಾಷ್ಟಕ'' ಕೃತಿಯು ಅಂದಿನ ಕಾಲದಲ್ಲಿ ಜನಸಾಮಾನ್ಯರ ಬಾಯಲ್ಲಿ ಅತ್ಯಂತ ಜನಪ್ರಿಯವಾಗಿ ಧಾನ್ಯ ಕುಟ್ಟುವಾಗ ಹಾಡುವ ''ಒನಕೆ ಹಾಡು'' ಎಂದೇ ಪ್ರಸಿದ್ಧವಾಗಿತ್ತು.
• 2ನೇ ಶಿವಮಾರನು ಗಂಗರ ಪ್ರಮುಖ ದೊರೆಗಳಲ್ಲೊಬ್ಬನಾಗಿದ್ದು ರಾಷ್ಟ್ರಕೂಟರ ವಿರುದ್ಧ ಧೈರ್ಯದಿಂದ ಹೋರಾಡಿದನು.
• ಹೇಳಿಕೆ (d) ತಪ್ಪಾಗಿದೆ, ಏಕೆಂದರೆ ಕ್ರಿ.ಶ. 726 ರಿಂದ 788 ರವರೆಗಿನ ಕಾಲಾವಧಿಯು ಆತನ ತಂದೆ ಶ್ರೀಪುರುಷನ ಆಳ್ವಿಕೆಯ ಕಾಲವಾಗಿದೆ (ಶ್ರೀಪುರುಷನು ''ಗಜಶಾಸ್ತ್ರ'' ರಚಿಸಿದ್ದನು). ಆದ್ದರಿಂದ (a), (b) ಮತ್ತು (c) ಮಾತ್ರ ಸರಿಯಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q4', 4, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.ancient_india.mauryan_empire', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Mauryan Administration & Functionaries (Role of Samaharta - Chief Revenue Collector)', 'ಮೌರ್ಯರ ಆಡಳಿತ ವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಧಿಕಾರಿಗಳು (ಸಮಾಹರ್ತ - ಕಂದಾಯ ಮುಖ್ಯಸ್ಥ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Ancient History', 'History']::TEXT[], '', '', 'During the Mauryan period, the duty of the officer of ''Samaharta'' was', 'ಮೌರ್ಯರ ಕಾಲದಲ್ಲಿ, ''ಸಮಾಹರ್ತ'' ನೆಂಬ ಅಧಿಕಾರಿಯು ನಿರ್ವಹಿಸುತ್ತಿದ್ದ ಕರ್ತವ್ಯ', 'Head of Treasury', 'Collector of Revenue', 'Head of District Administration', 'Head of Mines', 'ಖಜಾನೆ ಮುಖ್ಯಸ್ಥ', 'ಕರ ಸಂಗ್ರಾಹಕ', 'ಜಿಲ್ಲಾಡಳಿತದ ಮುಖ್ಯಸ್ಥ', 'ಗಣಿಗಳ ಮುಖ್ಯಸ್ಥ', '2', 'Correct Answer: (2)

According to Kautilya''s Arthashastra, the Mauryan administrative apparatus had two key financial officers:
• ''Samaharta'': The Collector-General of Revenue. He was in charge of the assessment and collection of revenue from diverse sources including agriculture, customs, forests, mines, and trade routes, as well as supervising the state budget and expenditures.
• ''Sannidhata'': The Chief Treasury Officer (Custodian of the State Treasury and Storehouses).
• ''Akaradhyaksha'': The superintendent of mines.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಕೌಟಿಲ್ಯನ ಅರ್ಥಶಾಸ್ತ್ರದ ಪ್ರಕಾರ, ಮೌರ್ಯರ ಕೇಂದ್ರ ಆಡಳಿತದಲ್ಲಿ ಪ್ರಮುಖ ಕಂದಾಯ ಮತ್ತು ಆರ್ಥಿಕ ಅಧಿಕಾರಿಗಳೆಂದರೆ:
• ''ಸಮಾಹರ್ತ'': ಈತ ಸಾಮ್ರಾಜ್ಯದ ಮುಖ್ಯ ಕರ ಸಂಗ್ರಾಹಕ (ಕಲೆಕ್ಟರ್ ಜನರಲ್). ಕೃಷಿ, ವಾಣಿಜ್ಯ, ಗಣಿ, ಅರಣ್ಯ ಮುಂತಾದ ಮೂಲಗಳಿಂದ ತೆರಿಗೆ ನಿರ್ಧರಿಸುವುದು, ವಸೂಲಿ ಮಾಡುವುದು ಹಾಗೂ ಆಯವ್ಯಯದ ಮೇಲ್ವಿಚಾರಣೆ ಮಾಡುವುದು ಈತನ ಮುಖ್ಯ ಕರ್ತವ್ಯವಾಗಿತ್ತು.
• ''ಸನ್ನಿಧಾತ'': ಈತ ಮುಖ್ಯ ಖಜಾನೆಯ ಮೇಲ್ವಿಚಾರಕ (ಖಜಾಂಚಿ).
• ''ಆಕರಾಧ್ಯಕ್ಷ'': ಗಣಿಗಳ ಮೇಲ್ವಿಚಾರಕ ಅಧಿಕಾರಿ.', NULL, NULL),
    ('pc-nhk-2026-q5', 5, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.ancient_india.gupta_empire', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Gupta Literature and Scholarship (Kalidasa, Amarasimha, Navaratnas)', 'ಗುಪ್ತರ ಕಾಲದ ಸಾಹಿತ್ಯ ಮತ್ತು ವಿದ್ವತ್ ಪರಂಪರೆ (ಕಾಳಿದಾಸ, ಅಮರಸಿಂಹ, ನವರತ್ನರು)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Ancient History', 'History']::TEXT[], '', '', 'Consider the following statements regarding the Gupta period :

Statement I : The Gupta period is called the ''Golden Age'' of Sanskrit Grammar.
Statement II : The development of Sanskrit grammar was based on the compilations of Panini, Patanjali, Amarasimha and Chandragomin.

Which one of the following is correct with respect to the above statements ?', 'ಗುಪ್ತರ ಕಾಲಕ್ಕೆ ಸಂಬಂಧಿಸಿದಂತೆ ಈ ಕೆಳಕಂಡ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.

ಹೇಳಿಕೆ I : ಗುಪ್ತರ ಕಾಲವನ್ನು ಸಂಸ್ಕೃತ ವ್ಯಾಕರಣದ ''ಸುವರ್ಣ ಯುಗ'' ಎಂದು ಕರೆಯುತ್ತಾರೆ.
ಹೇಳಿಕೆ II : ಸಂಸ್ಕೃತ ವ್ಯಾಕರಣವು ಪಾಣಿನಿ, ಪತಂಜಲಿ, ಅಮರಸಿಂಹ ಮತ್ತು ಚಂದ್ರಗೋಮಿನರ ಸಂಕಲನಗಳಿಂದ ಅಭಿವೃದ್ಧಿ ಹೊಂದಿದೆ.

ಮೇಲಿನ ಹೇಳಿಕೆಗಳಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಸರಿಯಾದ ಉತ್ತರ ಯಾವುದೆಂದು ಆಯ್ಕೆ ಮಾಡಿ.', 'Statement I is correct, but Statement II is incorrect.', 'Both Statement I and Statement II are correct and Statement II explains Statement I.', 'Statement I is incorrect, but Statement II is correct.', 'Both Statement I and Statement II are correct, but Statement II does not explain Statement I.', 'ಹೇಳಿಕೆ I ಸರಿ ಆದರೆ ಹೇಳಿಕೆ II ತಪ್ಪು.', 'ಹೇಳಿಕೆ-I ಮತ್ತು ಹೇಳಿಕೆ-II ಎರಡೂ ಸರಿ, ಮತ್ತು ಹೇಳಿಕೆ-I ಅನ್ನು ಹೇಳಿಕೆ-II ವಿವರಿಸುತ್ತದೆ.', 'ಹೇಳಿಕೆ I ತಪ್ಪು ಆದರೆ ಹೇಳಿಕೆ II ಸರಿ.', 'ಹೇಳಿಕೆ-I ಮತ್ತು ಹೇಳಿಕೆ-II ಎರಡೂ ಸರಿ, ಆದರೆ ಹೇಳಿಕೆ-I ಅನ್ನು ಹೇಳಿಕೆ-II ವಿವರಿಸುವುದಿಲ್ಲ.', '1', 'Correct Answer: (1)

• Statement I is accepted as correct in conventional textbook syllabi because the Gupta period marked a golden age for classical Sanskrit scholarship, fostering monumental literary, scientific, and linguistic outputs (including works by Chandragomin and Bhartrihari).
• Statement II is factually incorrect for two definitive reasons:
  1. Amarasimha was not a grammarian; he authored the famed ''Amarakosha'' (Namalinganushasana), which is a Sanskrit thesaurus/lexicon (vocabulary dictionary), not a work on grammar (Vyakarana).
  2. Panini (5th–4th c. BCE) and Patanjali (2nd c. BCE) lived many centuries prior to the rise of the Gupta Empire (4th–6th c. CE), so grouping them together as compilers responsible for developing grammar during the Gupta era is historically erroneous.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• ಹೇಳಿಕೆ I ಸರಿಯಾಗಿದೆ: ಶಾಸ್ತ್ರೀಯ ಸಂಸ್ಕೃತ ಸಾಹಿತ್ಯ, ಭಾಷಾಶಾಸ್ತ್ರ ಮತ್ತು ವ್ಯಾಕರಣದ ಬೆಳವಣಿಗೆಯ ದೃಷ್ಟಿಯಿಂದ ಗುಪ್ತರ ಕಾಲವನ್ನು ಸಂಸ್ಕೃತ ವಿದ್ವತ್ತಿನ ಸುವರ್ಣಯುಗವೆಂದು ಪರಿಗಣಿಸಲಾಗುತ್ತದೆ (ಈ ಕಾಲದಲ್ಲಿ ಚಂದ್ರಗೋಮಿನ್, ಭರ್ತೃಹರಿ ಮುಂತಾದ ವಿದ್ವಾಂಸರು ವ್ಯಾಕರಣಕ್ಕೆ ಕೊಡುಗೆ ನೀಡಿದರು).
• ಹೇಳಿಕೆ II ತಪ್ಪಾಗಿದೆ: 
  1. ಅಮರಸಿಂಹನು ವ್ಯಾಕರಣಕಾರನಲ್ಲ; ಆತ ರಚಿಸಿದ್ದು ಪ್ರಸಿದ್ಧ ಸಂಸ್ಕೃತ ಸಮಾನಾರ್ಥಕ ಪದಕೋಶ/ನಿಘಂಟಾದ ''ಅಮರಕೋಶ'' (ನಾಮಲಿಂಗಾನುಶಾಸನ).
  2. ಪಾಣಿನಿ (ಕ್ರಿ.ಪೂ. 5-4ನೇ ಶತಮಾನ) ಮತ್ತು ಪತಂಜಲಿ (ಕ್ರಿ.ಪೂ. 2ನೇ ಶತಮಾನ) ಗುಪ್ತರ ಸಾಮ್ರಾಜ್ಯಕ್ಕಿಂತ (ಕ್ರಿ.ಶ. 4-6ನೇ ಶತಮಾನ) ಹಲವು ಶತಮಾನಗಳ ಹಿಂದಿನವರಾಗಿದ್ದಾರೆ. ಆದ್ದರಿಂದ ಇವರೆಲ್ಲರೂ ಒಟ್ಟಾಗಿ ಗುಪ್ತರ ಕಾಲದ ವ್ಯಾಕರಣವನ್ನು ಅಭಿವೃದ್ಧಿಪಡಿಸಿದರು ಎಂಬ ಹೇಳಿಕೆಯು ಐತಿಹಾಸಿಕವಾಗಿ ತಪ್ಪಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q6', 6, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.history_of_karnataka.medieval_dynasties_of_karnataka.western_chalukyas_of_kalyana_later_chalukyas', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Western Chalukyas of Kalyana (Capitals: Manyakheta and Kalyana)', 'ಕಲ್ಯಾಣದ ಪಶ್ಚಿಮ ಚಾಲುಕ್ಯರು (ರಾಜಧಾನಿಗಳು: ಮಾನ್ಯಖೇಟ ಮತ್ತು ಕಲ್ಯಾಣ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Karnataka History', 'History']::TEXT[], '', '', 'Which of the following places were capital cities of Kalyana Chalukyas ?

a. Manya Kheta
b. Kalyana
c. Etagiri
d. Badami

Choose the correct answer by using the codes given below :', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವುವು ಕಲ್ಯಾಣ ಚಾಲುಕ್ಯರ ರಾಜಧಾನಿಗಳಾಗಿದ್ದವು ?

a. ಮಾನ್ಯ ಖೇಟ
b. ಕಲ್ಯಾಣ
c. ಏತಗಿರಿ
d. ಬಾದಾಮಿ

ಕೆಳಗಿನ ಸಂಕೇತಗಳನ್ನು ಬಳಸಿ ಸರಿಯಾದ ಉತ್ತರ ಆರಿಸಿ.', 'b and c', 'a and b', 'a, b and c', 'b, c and d', 'b ಮತ್ತು c', 'a ಮತ್ತು b', 'a, b ಮತ್ತು c', 'b, c ಮತ್ತು d', '3', 'Correct Answer: (3)

• Following the overthrow of the Rashtrakutas in 973 CE by Tailapa II, the Western Chalukyas initially ruled from Manyakheta (Malkhed).
• Later, under Jayasimha II and Someshvara I, the administrative seat was moved to Etagiri (modern Yadgir) temporarily before Someshvara I founded and consecrated Kalyana (modern Basavakalyan in Bidar district) as the imperial capital in 1048 CE.
• Badami (Vatapi) was the capital of the Early Chalukyas (founded by Pulakeshin I in the 6th century CE), not the Kalyana Chalukyas.
Therefore, a, b, and c were all capitals/seats of power of the Kalyana Chalukyas.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

• ಕ್ರಿ.ಶ. 973 ರಲ್ಲಿ 2ನೇ ತೈಲಪನು ರಾಷ್ಟ್ರಕೂಟರನ್ನು ಸೋಲಿಸಿ ಕಲ್ಯಾಣ ಚಾಲುಕ್ಯ ಮನೆತನವನ್ನು ಸ್ಥಾಪಿಸಿದಾಗ ಆರಂಭದಲ್ಲಿ ರಾಷ್ಟ್ರಕೂಟರ ರಾಜಧಾನಿಯಾಗಿದ್ದ ಮಾನ್ಯಖೇಟ (ಇಂದಿನ ಮಲ್ಖೇಡ್) ಅವರ ರಾಜಧಾನಿಯಾಗಿತ್ತು.
• ತದನಂತರ 2ನೇ ಜಯಸಿಂಹ ಮತ್ತು 1ನೇ ಸೋಮೇಶ್ವರನ ಕಾಲದಲ್ಲಿ ರಾಜಧಾನಿಯನ್ನು ತಾತ್ಕಾಲಿಕವಾಗಿ ಏತಗಿರಿಗೆ (ಇಂದಿನ ಯಾದಗಿರಿ) ಸ್ಥಳಾಂತರಿಸಲಾಯಿತು.
• ಕ್ರಿ.ಶ. 1048 ರಲ್ಲಿ 1ನೇ ಸೋಮೇಶ್ವರನು ಕಲ್ಯಾಣ (ಇಂದಿನ ಬೀದರ್ ಜಿಲ್ಲೆಯ ಬಸವಕಲ್ಯಾಣ) ನಗರವನ್ನು ನಿರ್ಮಿಸಿ ತನ್ನ ಕಾಯಂ ರಾಜಧಾನಿಯನ್ನಾಗಿ ಮಾಡಿಕೊಂಡನು.
• ಬಾದಾಮಿಯು (ವಾತಾಪಿ) 6ನೇ ಶತಮಾನದ ಬಾದಾಮಿ ಚಾಲುಕ್ಯರ ರಾಜಧಾನಿಯಾಗಿತ್ತೇ ಹೊರತು ಕಲ್ಯಾಣ ಚಾಲುಕ್ಯರದಾಗಿರಲಿಲ್ಲ.
ಆದ್ದರಿಂದ a, b ಮತ್ತು c ಸ್ಥಳಗಳು ಕಲ್ಯಾಣ ಚಾಲುಕ್ಯರ ರಾಜಧಾನಿಗಳಾಗಿದ್ದವು.', NULL, NULL),
    ('pc-nhk-2026-q7', 7, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.modern_india.early_peasant_tribal_civil_uprisings.peasant_movements', 'History', 'ಇತಿಹಾಸ', 'Modern India', 'ಆಧುನಿಕ ಭಾರತ', 'Indigo Revolt (1859–60) & Dinabandhu Mitra''s Nil Darpan (Bengali Drama)', 'ನೀಲಿ ದಂಗೆ (1859-60) ಮತ್ತು ದೀನಬಂಧು ಮಿತ್ರರ ನೀಲ ದರ್ಪಣ್ (ಬಂಗಾಳಿ ನಾಟಕ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Modern History', 'History']::TEXT[], '', '', '''Nil Darpan'' a play by Dinabandhu Mitra is in which language ?', 'ದೀನಬಂಧು ಮಿತ್ರರವರ ನಾಟಕ ''ನೀಲ್ ದರ್ಪಣ್‌ ಯಾವ ಭಾಷೆಯಲ್ಲಿದೆ ?', 'Bengali', 'Hindi', 'Tamil', 'Marathi', 'ಬಂಗಾಳಿ', 'ಹಿಂದಿ', 'ತಮಿಳು', 'ಮರಾಠಿ', '1', 'Correct Answer: (1)

''Nil Darpan'' (The Mirror of Indigo) is a celebrated Bengali play written by Dinabandhu Mitra in 1858–1859 and published in Dhaka in 1860. The play dramatically exposed the ruthless exploitation, coercion, and torture inflicted by British indigo planters on the ryots (peasants) of Bengal during the Indigo Revolt (Nil Bidroha). It was later translated into English by Michael Madhusudan Dutt and published by Rev. James Long, which stirred immense sympathy in India and Britain.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

''ನೀಲ್ ದರ್ಪಣ್'' (ನೀಲಿ ಕನ್ನಡಿ) ಎಂಬುದು ದೀನಬಂಧು ಮಿತ್ರ ಅವರು 1858-1859 ರಲ್ಲಿ ರಚಿಸಿದ ಪ್ರಸಿದ್ಧ ಬಂಗಾಳಿ ನಾಟಕವಾಗಿದೆ (1860 ರಲ್ಲಿ ಢಾಕಾದಲ್ಲಿ ಪ್ರಕಟವಾಯಿತು). ಬಂಗಾಳದ ರೈತರ ಮೇಲೆ ಬ್ರಿಟಿಷ್ ನೀಲಿ ಬೆಳೆಗಾರರು ನಡೆಸುತ್ತಿದ್ದ ಅಮಾನವೀಯ ಶೋಷಣೆ, ಬಲವಂತದ ಗುತ್ತಿಗೆ ಪದ್ಧತಿ ಹಾಗೂ ದಬ್ಬಾಳಿಕೆಯನ್ನು ಈ ನಾಟಕವು ಎಳೆಎಳೆಯಾಗಿ ಬಿಂಬಿಸಿತು. ಇದು ಬಂಗಾಳದ ನೀಲಿ ದಂಗೆಗೆ (ಇಂಡಿಗೋ ಕ್ರಾಂತಿ) ಭಾರೀ ಜನಬೆಂಬಲ ಒದಗಿಸಿತು. ನಂತರ ಮೈಕೆಲ್ ಮಧುಸೂದನ್ ದತ್ ಇದನ್ನು ಇಂಗ್ಲಿಷ್‌ಗೆ ಭಾಷಾಂತರಿಸಿದರು.', NULL, NULL),
    ('pc-nhk-2026-q8', 8, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.modern_india.advent_of_european_traders_anglo-french_rivalry.anglo-french_carnatic_wars', 'History', 'ಇತಿಹಾಸ', 'Modern India', 'ಆಧುನಿಕ ಭಾರತ', 'Battle of Wandiwash (1760) & French Defeat in Third Carnatic War', 'ವಂದಿವಾಸಿ ಕದನ (1760) ಮತ್ತು ಮೂರನೇ ಕರ್ನಾಟಕ ಯುದ್ಧದಲ್ಲಿ ಫ್ರೆಂಚರ ಸೋಲು', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Modern History', 'History']::TEXT[], '', '', 'The battle of Wandiwash crushed the political and military dreams of ________ in India.', 'ವಾಂಡಿವಾಷ್ ಯುದ್ಧವು ಭಾರತದಲ್ಲಿ ಯಾರ ರಾಜಕೀಯ ಮತ್ತು ಸೇನಾ ಆಕಾಂಕ್ಷೆಗಳನ್ನು ಧ್ವಂಸಗೊಳಿಸಿತು ?', 'Dutch', 'French', 'Portuguese', 'British', 'ಡಚ್', 'ಫ್ರೆಂಚ್', 'ಪೋರ್ಚುಗೀಸ್', 'ಬ್ರಿಟಿಷ್', '2', 'Correct Answer: (2)

The Battle of Wandiwash took place on 22 January 1760 in Tamil Nadu as a decisive encounter of the Third Carnatic War. The British forces under General Eyre Coote comprehensively defeated the French army commanded by Count de Lally. Following this defeat and the subsequent surrender of Pondicherry in 1761, French political ambitions and hopes of establishing an Indian empire were permanently crushed, reducing the French East India Company to mere trading posts.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

1760 ರ ಜನವರಿ 22 ರಂದು ಮೂರನೇ ಕರ್ನಾಟಿಕ್ ಯುದ್ಧದ ಭಾಗವಾಗಿ ತಮಿಳುನಾಡಿನ ವಾಂಡಿವಾಷ್ ಎಂಬಲ್ಲಿ ನಡೆದ ಐತಿಹಾಸಿಕ ಕದನದಲ್ಲಿ ಬ್ರಿಟಿಷ್ ಸೇನಾನಿ ಸರ್ ಐರ್ ಕೂಟ್, ಫ್ರೆಂಚ್ ಸೇನಾನಿ ಕೌಂಟ್ ಡಿ ಲಾಲಿ ನೇತೃತ್ವದ ಸೈನ್ಯವನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಸೋಲಿಸಿದರು. ಈ ಸೋಲಿನಿಂದ ಭಾರತದಲ್ಲಿ ತನ್ನದೇ ಆದ ಸಾಮ್ರಾಜ್ಯವನ್ನು ಸ್ಥಾಪಿಸಬೇಕೆಂಬ ಫ್ರೆಂಚರ ರಾಜಕೀಯ ಮತ್ತು ಸೇನಾ ಆಕಾಂಕ್ಷೆಗಳು ಶಾಶ್ವತವಾಗಿ ಧ್ವಂಸಗೊಂಡವು. ತದನಂತರ ಫ್ರೆಂಚರು ಕೇವಲ ಪಾಂಡಿಚೇರಿ, ಮಾಹೆ, ಕಾರೈಕಲ್ ಮುಂತಾದ ಸಣ್ಣ ವಾಣಿಜ್ಯ ಕೇಂದ್ರಗಳಿಗೆ ಮಾತ್ರ ಸೀಮಿತರಾದರು.', NULL, NULL),
    ('pc-nhk-2026-q9', 9, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.indian_freedom_struggle.simon_commission_nehru_report_civil_disobedience_movement.round_table_conferences_pacts', 'History', 'ಇತಿಹಾಸ', 'Indian Freedom Struggle', 'ಭಾರತೀಯ ಸ್ವಾತಂತ್ರ್ಯ ಸಂಗ್ರಾಮ', 'Lord Irwin Administration (Deepavali Declaration 1929 & Gandhi-Irwin Pact 1931)', 'ಲಾರ್ಡ್ ಇರ್ವಿನ್ ಆಡಳಿತಾವಧಿ (ದೀಪಾವಳಿ ಘೋಷಣೆ 1929 ಮತ್ತು ಗಾಂಧಿ-ಇರ್ವಿನ್ ಒಪ್ಪಂದ 1931)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Modern History', 'History']::TEXT[], '', '', 'Consider the following statements regarding Lord Irwin :

Statement I : He started women university in India at Bombay.
Statement II : He convinced Gandhi to take part in the First Round Table Conference.

Choose the correct answer :', 'ಲಾರ್ಡ್ ಇರ್ವಿನ್ ಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.

ಹೇಳಿಕೆ I : ಇವರು ಭಾರತದಲ್ಲಿ ಮಹಿಳಾ ವಿಶ್ವವಿದ್ಯಾನಿಲಯವನ್ನು ಬಾಂಬೆಯಲ್ಲಿ ಸ್ಥಾಪಿಸಿದರು.
ಹೇಳಿಕೆ II : ಇವರು ಮೊದಲ ದುಂಡು ಮೇಜಿನ ಸಮ್ಮೇಳನದಲ್ಲಿ ಭಾಗವಹಿಸುವಂತೆ ಗಾಂಧೀಜಿಯವರ ಮನವೊಲಿಸಿದರು.

ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆಯ್ಕೆ ಮಾಡಿ.', 'Both I and II are correct.', 'Only I is correct.', 'Neither I nor II is correct.', 'Only II is correct.', 'I ಮತ್ತು II ಎರಡೂ ಸರಿ', 'I ಮಾತ್ರ ಸರಿ', 'I ಮತ್ತು II ಎರಡೂ ತಪ್ಪು', 'II ಮಾತ್ರ ಸರಿ', '3', 'Correct Answer: (3)

Both statements are incorrect:
• Statement I is incorrect: The first Women''s University in India (SNDT Women''s University) was founded in Bombay in 1916 by social reformer Dhondo Keshav Karve during the viceroyalty of Lord Chelmsford (1916–1921), not Lord Irwin (1926–1931).
• Statement II is incorrect: Mahatma Gandhi and the Indian National Congress boycotted the First Round Table Conference (1930). Following the Gandhi-Irwin Pact of March 1931, Lord Irwin convinced Gandhi and the Congress to participate in the *Second* Round Table Conference (1931).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ಎರಡೂ ಹೇಳಿಕೆಗಳು ತಪ್ಪಾಗಿವೆ:
• ಹೇಳಿಕೆ I ತಪ್ಪಾಗಿದೆ: ಭಾರತದ ಮೊದಲ ಮಹಿಳಾ ವಿಶ್ವವಿದ್ಯಾಲಯವಾದ SNDT ಮಹಿಳಾ ವಿಶ್ವವಿದ್ಯಾಲಯವನ್ನು 1916 ರಲ್ಲಿ ಮಹರ್ಷಿ ಧೋಂಡೋ ಕೇಶವ್ ಕರ್ವೆ ಅವರು ಬಾಂಬೆಯಲ್ಲಿ ಸ್ಥಾಪಿಸಿದರು. ಈ ಸಮಯದಲ್ಲಿ ಲಾರ್ಡ್ ಚೆಮ್ಸ್‌ಫರ್ಡ್ ವೈಸ್‌ರಾಯ್ ಆಗಿದ್ದರು (ಲಾರ್ಡ್ ಇರ್ವಿನ್ ಅವರ ಅಧಿಕಾರಾವಧಿ 1926-1931).
• ಹೇಳಿಕೆ II ತಪ್ಪಾಗಿದೆ: 1930 ರಲ್ಲಿ ನಡೆದ ಮೊದಲ ದುಂಡು ಮೇಜಿನ ಸಮ್ಮೇಳನವನ್ನು ಗಾಂಧೀಜಿ ಹಾಗೂ ಭಾರತೀಯ ರಾಷ್ಟ್ರೀಯ ಕಾಂಗ್ರೆಸ್ ಬಹಿಷ್ಕರಿಸಿದ್ದವು. 1931 ರ ಗಾಂಧಿ-ಇರ್ವಿನ್ ಒಪ್ಪಂದದ ನಂತರ, ಗಾಂಧೀಜಿಯವರು *ಎರಡನೇ* ದುಂಡು ಮೇಜಿನ ಸಮ್ಮೇಳನದಲ್ಲಿ (ಲಂಡನ್) ಭಾಗವಹಿಸಲು ಒಪ್ಪಿಕೊಂಡರು.', NULL, NULL),
    ('pc-nhk-2026-q10', 10, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.history_of_karnataka.armed_resistance_freedom_movement_in_karnataka.nationalist_movement_gandhian_agitations_in_karnataka', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Khadi Movement & First Government-Managed Khadi Production Unit in Karnataka (Badanavalu)', 'ಖಾದಿ ಚಳವಳಿ ಮತ್ತು ಕರ್ನಾಟಕದ ಮೊದಲ ಸರ್ಕಾರಿ ಖಾದಿ ಉತ್ಪಾದನಾ ಕೇಂದ್ರ (ಬದನವಾಳು)', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Karnataka History', 'History']::TEXT[], '', '', 'The first government managed Khadi production unit was started at ________ in Mysore State.', 'ಮೈಸೂರು ರಾಜ್ಯದ ________ ಎಂಬಲ್ಲಿ ಸರ್ಕಾರದಿಂದ ನಿರ್ವಹಿಸಲ್ಪಟ್ಟ ಮೊದಲ ಖಾದಿ ಉತ್ಪಾದನಾ ಘಟಕವನ್ನು ಸ್ಥಾಪಿಸಲಾಯಿತು.', 'Shimogga', 'Badanaval', 'Mysore', 'Bhadravati', 'ಶಿವಮೊಗ್ಗ', 'ಬದನವಾಳು', 'ಮೈಸೂರು', 'ಭದ್ರಾವತಿ', '2', 'Correct Answer: (2)

In 1927, the first government-supported Khadi manufacturing centre in Mysore State was established at Badanaval (Nanjangud taluk, Mysuru district) under the initiative of social worker Tagadur Ramachandra Rao and with the support of Mysore Dewan Sir Mirza Ismail. Mahatma Gandhi visited the Badanaval Khadi Centre in 1927 and 1932, praising it as an exemplary rural reconstruction project.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಮೈಸೂರು ಸಂಸ್ಥಾನದಲ್ಲಿ ಸರ್ಕಾರದಿಂದ ನೆರವು ಪಡೆದ ಮೊದಲ ಗ್ರಾಮೀಣ ಖಾದಿ ಉತ್ಪಾದನಾ ಘಟಕವನ್ನು 1927 ರಲ್ಲಿ ಮೈಸೂರು ಜಿಲ್ಲೆಯ ನಂಜನಗೂಡು ತಾಲೂಕಿನ ''ಬದನವಾಳು'' ಗ್ರಾಮದಲ್ಲಿ ತಗಡೂರು ರಾಮಚಂದ್ರರಾವ್ ಅವರ ನೇತೃತ್ವದಲ್ಲಿ ಮತ್ತು ದಿವಾನ ಮಿರ್ಜಾ ಇಸ್ಮಾಯಿಲ್ ಅವರ ಸಹಕಾರದೊಂದಿಗೆ ಸ್ಥಾಪಿಸಲಾಯಿತು. ಮಹಾತ್ಮಾ ಗಾಂಧೀಜಿಯವರು 1927 ಮತ್ತು 1932 ರಲ್ಲಿ ಬದನವಾಳು ಖಾದಿ ಕೇಂದ್ರಕ್ಕೆ ಭೇಟಿ ನೀಡಿ ಅದರ ಸ್ವಾವಲಂಬಿ ಗ್ರಾಮ ಸ್ವರಾಜ್ಯ ಮಾದರಿಯನ್ನು ಶ್ಲಾಘಿಸಿದ್ದರು.', NULL, NULL),
    ('pc-nhk-2026-q11', 11, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.modern_india.british_conquest_consolidation_of_india.british_conquest_of_bengal', 'History', 'ಇತಿಹಾಸ', 'Modern India', 'ಆಧುನಿಕ ಭಾರತ', 'Mughal Emperor Farrukhsiyar''s 1717 Royal Farman to East India Company in Bengal', 'ಮೊಘಲ್ ಚಕ್ರವರ್ತಿ ಫರೂಕ್‌ಶಿಯರ್‌ನ 1717 ರ ಬಂಗಾಳ ರಾಯಲ್ ಫರ್ಮಾನು', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Modern History', 'History']::TEXT[], '', '', 'Which Mughal emperor issued a decree granting free trade in Bengal to the British ?', 'ಬ್ರಿಟಿಷರಿಗೆ ಬಂಗಾಳದಲ್ಲಿ ಉಚಿತ ವ್ಯಾಪಾರ ಮಾಡುವ ಆಜ್ಞೆಯನ್ನು ಹೊರಡಿಸಿದ ಮೊಘಲ್ ಚಕ್ರವರ್ತಿ ಯಾರು ?', 'Farrukhsiyar', 'Jahangir', 'Bahadur Shah', 'Shahjahan', 'ಫರೂಕ್ ಸಿಯಾರ್', 'ಜಹಾಂಗೀರ್', 'ಬಹದ್ದೂರ್ ಷಾ', 'ಷಹಜಹಾನ್', '1', 'Correct Answer: (1)

In 1717, Mughal Emperor Farrukhsiyar issued a royal farman (decree) to an East India Company mission led by John Surman (assisted by Dr. William Hamilton, who treated the Emperor). This decree exempted the British from all internal customs duties in Bengal in exchange for a nominal annual tribute of ₹3,000, and permitted them to issue ''dastaks'' (trade passes). This imperial decree is famously described as the ''Magna Carta'' of the East India Company in India.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

1717 ರಲ್ಲಿ ಮೊಘಲ್ ಚಕ್ರವರ್ತಿ ಫರೂಕ್ ಸಿಯಾರ್ ಬ್ರಿಟಿಷ್ ಈಸ್ಟ್ ಇಂಡಿಯಾ ಕಂಪನಿಗೆ ಶಾಹಿ ಫರ್ಮಾನ್ (ರಾಜಾಜ್ಞೆ) ನೀಡಿದನು (ಜಾನ್ ಸುರ್ಮನ್ ನೇತೃತ್ವದ ನಿಯೋಗಕ್ಕೆ, ಚಕ್ರವರ್ತಿಯ ರೋಗ ಗುಣಪಡಿಸಿದ ವೈದ್ಯ ವಿಲಿಯಂ ಹ್ಯಾಮಿಲ್ಟನ್ ಸಹಕಾರದಿಂದ). ಈ ಆಜ್ಞೆಯ ಪ್ರಕಾರ ಕಂಪನಿಯು ವಾರ್ಷಿಕ ಕೇವಲ 3,000 ರೂಪಾಯಿಗಳ ಕಪ್ಪ ಕಾಣಿಕೆಯನ್ನು ನೀಡಿ, ಬಂಗಾಳದಲ್ಲಿ ಯಾವುದೇ ಸುಂಕವಿಲ್ಲದೆ ಮುಕ್ತ ವ್ಯಾಪಾರ ಮಾಡುವ ಮತ್ತು ''ದಸ್ತಕ್'' (ಸುಂಕ ರಹಿತ ವ್ಯಾಪಾರ ಪರವಾನಗಿ ಪತ್ರ) ಗಳನ್ನು ನೀಡುವ ಹಕ್ಕನ್ನು ಪಡೆಯಿತು. ಇದನ್ನು ಕಂಪನಿಯ ''ಮ್ಯಾಗ್ನಾ ಕಾರ್ಟಾ'' ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ.', NULL, NULL),
    ('pc-nhk-2026-q12', 12, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.ancient_india.indus_valley_civilization', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Indus Valley Civilization Sites & Associated Rivers (Harappa, Mohenjodaro, Lothal, Kalibangan)', 'ಸಿಂಧೂ ಕಣಿವೆ ನಾಗರಿಕತೆಯ ನೆಲೆಗಳು ಮತ್ತು ಸಂಬಂಧಿತ ನದಿಗಳು (ಹರಪ್ಪಾ, ಮೊಹೆಂಜೊದಾರೊ, ಲೋಥಾಲ್, ಕಾಲಿಬಂಗನ್)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Ancient History', 'History']::TEXT[], '', '', 'How many of the following are correctly matched ?

a. Ashvaghosha - Saundarananda
b. Bharata - Natyashastra
c. Vatsyayana - Kamasutra
d. Harsha - Harshacharita', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಎಷ್ಟು ಜೋಡಿಗಳು ಸರಿಯಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿವೆ ?

a. ಅಶ್ವಘೋಷ - ಸೌಂದರಾನಂದ
b. ಭರತ - ನಾಟ್ಯಶಾಸ್ತ್ರ
c. ವಾತ್ಸಾಯನ - ಕಾಮಸೂತ್ರ
d. ಹರ್ಷ - ಹರ್ಷಚರಿತೆ', 'Only three', 'Only one', 'All the four', 'Only two', 'ಮೂರು ಮಾತ್ರ', 'ಒಂದು ಮಾತ್ರ', 'ಎಲ್ಲಾ ನಾಲ್ಕೂ', 'ಎರಡು ಮಾತ್ರ', '1', 'Correct Answer: (1)

Three of the four pairs are correctly matched:
• (a) Ashvaghosha composed ''Saundarananda'' as well as ''Buddhacharita'' (Correct).
• (b) Bharata Muni authored the authoritative treatise on performing arts, ''Natyashastra'' (Correct).
• (c) Vatsyayana authored the classical Sanskrit text ''Kamasutra'' (Correct).
• (d) ''Harshacharita'' is the biography of King Harsha composed by his court poet Banabhatta. King Harsha himself authored the plays ''Ratnavali'', ''Priyadarsika'', and ''Nagananda'' (Incorrect).
Hence, only three pairs are correctly matched.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ನೀಡಿರುವ ನಾಲ್ಕು ಜೋಡಿಗಳಲ್ಲಿ ಕೇವಲ ಮೂರು ಜೋಡಿಗಳು ಸರಿಯಾಗಿವೆ:
• (a) ಅಶ್ವಘೋಷ - ''ಸೌಂದರಾನಂದ'' ಮತ್ತು ''ಬುದ್ಧಚರಿತ'' ಕಾವ್ಯಗಳನ್ನು ರಚಿಸಿದನು (ಸರಿ).
• (b) ಭರತ ಮುನಿ - ಭಾರತೀಯ ರಂಗಭೂಮಿ ಹಾಗೂ ನಾಟ್ಯಕಲೆಯ ಶ್ರೇಷ್ಠ ಗ್ರಂಥ ''ನಾಟ್ಯಶಾಸ್ತ್ರ'' ರಚಿಸಿದನು (ಸರಿ).
• (c) ವಾತ್ಸಾಯನ - ಪ್ರಸಿದ್ಧ ಸಂಸ್ಕೃತ ಗ್ರಂಥ ''ಕಾಮಸೂತ್ರ'' ಕರ್ತೃ (ಸರಿ).
• (d) ''ಹರ್ಷಚರಿತೆ'' ಕೃತಿಯನ್ನು ಹರ್ಷವರ್ಧನನ ಆಸ್ಥಾನ ಕವಿ ಬಾಣಭಟ್ಟ ರಚಿಸಿದನು (ಹರ್ಷವರ್ಧನನು ಸ್ವತಃ ''ರತ್ನಾವಳಿ'', ''ಪ್ರಿಯದರ್ಶಿಕಾ'' ಮತ್ತು ''ನಾಗಾನಂದ'' ಎಂಬ ನಾಟಕಗಳನ್ನು ರಚಿಸಿದನು) (ತಪ್ಪು).
ಆದ್ದರಿಂದ ಮೂರು ಜೋಡಿಗಳು ಮಾತ್ರ ಸರಿಯಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q13', 13, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.ancient_india.prehistoric_india', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Prehistoric India & Mesolithic Age Microlithic Stone Tool Technology', 'ಇತಿಹಾಸಪೂರ್ವ ಭಾರತ ಮತ್ತು ಮಧ್ಯಶಿಲಾಯುಗದ ಮೈಕ್ರೋಲಿತ್ (ಸೂಕ್ಷ್ಮಶಿಲಾ) ಉಪಕರಣ ತಂತ್ರಜ್ಞಾನ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Ancient History', 'History']::TEXT[], '', '', 'To which one of the following ages ''microliths'' are associated ?', 'ಈ ಕೆಳಗಿನ ಯಾವ ಕಾಲಾವಧಿಗೆ ''ಸೂಕ್ಷ್ಮ ಶಿಲಾಯುಧ'' (microliths) ಸಂಬಂಧಪಟ್ಟಿದೆ?', 'Neolithic Age', 'Palaeolithic Age', 'Bronze Age', 'Mesolithic Age', 'ನವ ಶಿಲಾಯುಗ', 'ಹಳೆಯ ಶಿಲಾಯುಗ', 'ಕಂಚಿನ ಯುಗ', 'ಮಧ್ಯ ಶಿಲಾಯುಗ', '4', 'Correct Answer: (4)

''Microliths'' are diminutive, finely crafted stone tools ranging from 1 cm to 5 cm in length (such as geometric blades, trapezes, crescents, and triangles) made from cryptocrystalline silica like chert, chalcedony, and agate. They are the defining archaeological hallmark of the Mesolithic Age (Middle Stone Age, c. 10,000–6,000 BCE), where they were typically hafted onto wooden or bone handles to serve as composite tools, sickles, and barbed spearheads.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

''ಸೂಕ್ಷ್ಮ ಶಿಲಾಯುಧಗಳು'' (ಮೈಕ್ರೋಲಿತ್ಸ್ - Microliths) 1 ರಿಂದ 5 ಸೆಂ.ಮೀ ಉದ್ದದ ಚಾಕು, ಅರ್ಧಚಂದ್ರಾಕಾರ ಹಾಗೂ ತ್ರಿಕೋನಾಕಾರದ ಅತ್ಯಂತ ಚಿಕ್ಕ ಕಲ್ಲಿನ ಆಯುಧಗಳಾಗಿವೆ. ಇವುಗಳನ್ನು ಚೆರ್ಟ್, ಅಗೇಟ್ ಮತ್ತು ಕ್ಯಾಲ್ಸಿಡೋನಿಯಂತಹ ಕಲ್ಲುಗಳಿಂದ ಮಾಡಲಾಗುತ್ತಿತ್ತು. ಇವು ''ಮಧ್ಯ ಶಿಲಾಯುಗ''ದ (Mesolithic Age) ವಿಶಿಷ್ಟ ಲಕ್ಷಣಗಳಾಗಿವೆ. ಈ ಸೂಕ್ಷ್ಮ ಕಲ್ಲಿನ ಮೊನೆಗಳನ್ನು ಮರದ ಅಥವಾ ಮೂಳೆಯ ಹಿಡಿಗಳಿಗೆ ಜೋಡಿಸಿ ಭರ್ಜಿ, ಬಾಣ ಮತ್ತು ಕುಡುಗೋಲುಗಳಂತಹ ಸಂಯೋಜಿತ ಉಪಕರಣಗಳಾಗಿ ಬೇಟೆಯಾಡಲು ಬಳಸಲಾಗುತ್ತಿತ್ತು.', NULL, NULL),
    ('pc-nhk-2026-q14', 14, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.history_of_karnataka.ancient_dynasties_of_karnataka.kadambas_of_banavasi', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Kadambas of Banavasi & Mayurasharma Chandravalli Tank Inscription', 'ಬನವಾಸಿಯ ಕದಂಬರು ಮತ್ತು ಮಯೂರವರ್ಮನ ಚಂದ್ರವಳ್ಳಿ ಶಾಸನ (ಕೆರೆ ನಿರ್ಮಾಣ)', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Karnataka History', 'History']::TEXT[], '', '', 'Which of the following construction is primarily recorded in Mayuravarma''s Chandravalli rock inscription ?', 'ಮಯೂರ ವರ್ಮನ ಚಂದ್ರವಳ್ಳಿ ಬಂಡೆಗಲ್ಲು ಶಾಸನವು ಮುಖ್ಯವಾಗಿ ಈ ಕೆಳಗಿನ ಯಾವುದರ ನಿರ್ಮಾಣವನ್ನು ದಾಖಲಿಸಿದೆ ?', 'Palace', 'Jain Basadi', 'Buddhist Stupa', 'Tank (Lake)', 'ಅರಮನೆ', 'ಜೈನ ಬಸದಿ', 'ಬೌದ್ಧ ಸ್ತೂಪ', 'ಹೊಂಡ (ಕೆರೆ)', '4', 'Correct Answer: (4)

The Chandravalli rock inscription, engraved in Prakrit language and Brahmi script on a granite boulder at Chandravalli near Chitradurga, belongs to King Mayurasharma (Mayuravarma), the founder of the Kadamba dynasty. The inscription commemorates the creation of an irrigation reservoir/water tank (''tataka'') by the king and records his military exploits defeating rival rulers, including the Traikutas, Abhiras, Pallavas, and Pariathrikas.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಚಿತ್ರದುರ್ಗದ ಬಳಿಯ ಚಂದ್ರವಳ್ಳಿಯ ಬಂಡೆಯ ಮೇಲೆ ಬ್ರಾಹ್ಮೀ ಲಿಪಿ ಮತ್ತು ಪ್ರಾಕೃತ ಭಾಷೆಯಲ್ಲಿ ಕೆತ್ತಲಾಗಿರುವ ಕದಂಬ ವಂಶದ ಸ್ಥಾಪಕ ಮಯೂರವರ್ಮನ (ಮಯೂರಶರ್ಮ) ಶಾಸನವು ಮುಖ್ಯವಾಗಿ ನೀರಾವರಿಗಾಗಿ ಒಂದು ''ಹೊಂಡ/ಕೆರೆ''ಯ (ತಟಾಕ) ನಿರ್ಮಾಣವನ್ನು ದಾಖಲಿಸಿದೆ. ಇದಲ್ಲದೆ ಈ ಶಾಸನದಲ್ಲಿ ಮಯೂರವರ್ಮನು ಪಲ್ಲವರು, ತ್ರೈಕೂಟಕರು, ಅಭೀರರು ಮತ್ತು ಪಾರಿಯಾತ್ರಿಕರ ಮೇಲೆ ಸಾಧಿಸಿದ ವಿಜಯಗಳ ಉಲ್ಲೇಖವಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q15', 15, 2026, 'September', 1, 'nhk', 'ksp-pc', 'art_culture_heritage.martial_arts_traditional_sports_calendars', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Martial Arts, Traditional Sports & Calendars', 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು', 'International Sports Trophies & Tournaments (Thomas Cup, Uber Cup, Davis Cup, Ryder Cup)', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಕ್ರೀಡಾ ಟ್ರೋಫಿಗಳು ಮತ್ತು ಪಂದ್ಯಾವಳಿಗಳು (ಥಾಮಸ್ ಕಪ್, ಉಬರ್ ಕಪ್, ಡೇವಿಸ್ ಕಪ್, ರೈಡರ್ ಕಪ್)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Sports', 'Art, Culture & Heritage']::TEXT[], '', '', 'Identify correctly matched pairs :

(a) Deuce - Tennis
(b) Penalty stroke - Football
(c) Penalty kick - Hockey
(d) Free hit - Cricket', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಸರಿಯಾಗಿ ಹೊಂದಿಕೆಯಾಗಿರುವ ಜೋಡಿಗಳನ್ನು ಗುರುತಿಸಿ :

(a) ಡ್ಯೂಸ್ - ಟೆನ್ನಿಸ್
(b) ಪೆನಾಲ್ಟಿ ಸ್ಟ್ರೋಕ್ - ಫುಟ್‌ಬಾಲ್
(c) ಪೆನಾಲ್ಟಿ ಕಿಕ್ - ಹಾಕಿ
(d) ಫ್ರೀ ಹಿಟ್ - ಕ್ರಿಕೆಟ್', '(a), (b) and (d)', '(a), (b), (c) and (d)', '(a), (c) and (d)', '(a) and (d)', '(a), (b) ಮತ್ತು (d)', '(a), (b), (c) ಮತ್ತು (d)', '(a), (c) ಮತ್ತು (d)', '(a) ಮತ್ತು (d)', '4', 'Correct Answer: (4)

• (a) Deuce - Tennis: Correct (a tied score of 40-40 in a game requiring a player to win by two clear points).
• (b) Penalty stroke: Belongs to Field Hockey (awarded for an intentional foul in the circle), not Football (Incorrect).
• (c) Penalty kick: Belongs to Association Football (soccer), not Hockey (Incorrect).
• (d) Free hit: Cricket (awarded to the batting side following a front-foot or illegal-delivery no-ball) (Correct).
Therefore, only pairs (a) and (d) are correctly matched.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

• (a) ಡ್ಯೂಸ್ (Deuce): ಟೆನ್ನಿಸ್ ಕ್ರೀಡೆಯಲ್ಲಿ 40-40 ಸಮಬಲ ಸಾಧಿಸಿದಾಗ ಬಳಸುವ ಪದ (ಸರಿ).
• (b) ಪೆನಾಲ್ಟಿ ಸ್ಟ್ರೋಕ್: ಇದು ಫೀಲ್ಡ್ ಹಾಕಿ ಆಟಕ್ಕೆ ಸಂಬಂಧಿಸಿದ್ದು, ಫುಟ್‌ಬಾಲ್‌ಗೆ ಅಲ್ಲ (ತಪ್ಪು).
• (c) ಪೆನಾಲ್ಟಿ ಕಿಕ್: ಇದು ಫುಟ್‌ಬಾಲ್ ಆಟಕ್ಕೆ ಸಂಬಂಧಿಸಿದ್ದು, ಹಾಕಿಗಲ್ಲ (ತಪ್ಪು).
• (d) ಫ್ರೀ ಹಿಟ್: ಕ್ರಿಕೆಟ್‌ನಲ್ಲಿ ಬೌಲರ್ ನೋ-ಬಾಲ್ ಎಸೆದಾಗ ಬ್ಯಾಟರ್‌ಗೆ ಸಿಗುವ ಮುಕ್ತ ಹೊಡೆತದ ಅವಕಾಶ (ಸರಿ).
ಆದ್ದರಿಂದ (a) ಮತ್ತು (d) ಸರಿಯಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿರುವ ಜೋಡಿಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q16', 16, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups', 'Indian Society & Social Justice', 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ', 'Welfare Schemes for Vulnerable Sections', 'ದುರ್ಬಲ ವರ್ಗಗಳ ಕಲ್ಯಾಣ ಯೋಜನೆಗಳು', 'POSHAN Abhiyaan (National Nutrition Mission) & ICDS Implementation', 'ಪೋಷಣ್ ಅಭಿಯಾನ (ರಾಷ್ಟ್ರೀಯ ಪೌಷ್ಟಿಕತಾ ಅಭಿಯಾನ) ಮತ್ತು ಐಸಿಡಿಎಸ್', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Government Schemes', 'Indian Society & Social Justice']::TEXT[], '', '', '"POSHAN ABHIYAN" under Integrated Child Development Services (ICDS) has the following motto :', 'ಇಂಟಿಗ್ರೇಟೆಡ್ ಚೈಲ್ಡ್ ಡೆವಲಪ್‌ಮೆಂಟ್ ಸರ್ವೀಸಸ್ (ICDS) ಅಡಿಯಲ್ಲಿ ಇರುವ “ಪೋಷಣ್ ಅಭಿಯಾನ”ದ ಧೈಯವಾಕ್ಯ:', 'Maximising brain development in first three years of life.', 'Maximising brain development in first six years of life.', 'Maximising brain development in first seven years of life.', 'Maximising brain development in first five years of life.', 'ಜೀವಿತದ ಮೊದಲ ಮೂರು ವರ್ಷಗಳಲ್ಲಿ ಮೆದುಳಿನ ಬೆಳವಣಿಗೆಯನ್ನು ಗರಿಷ್ಠಗೊಳಿಸುವುದು.', 'ಜೀವಿತದ ಮೊದಲ ಆರು ವರ್ಷಗಳಲ್ಲಿ ಮೆದುಳಿನ ಬೆಳವಣಿಗೆಯನ್ನು ಗರಿಷ್ಠಗೊಳಿಸುವುದು.', 'ಜೀವಿತದ ಮೊದಲ ಏಳು ವರ್ಷಗಳಲ್ಲಿ ಮೆದುಳಿನ ಬೆಳವಣಿಗೆಯನ್ನು ಗರಿಷ್ಠಗೊಳಿಸುವುದು.', 'ಜೀವಿತದ ಮೊದಲ ಐದು ವರ್ಷಗಳಲ್ಲಿ ಮೆದುಳಿನ ಬೆಳವಣಿಗೆಯನ್ನು ಗರಿಷ್ಠಗೊಳಿಸುವುದು.', '1', 'Correct Answer: (1)

POSHAN Abhiyaan (National Nutrition Mission), launched by the Ministry of Women and Child Development, prioritizes the foundational ''first 1,000 days'' of life (from conception to age 2–3). Because approximately 80% of human brain architecture is developed before the age of 3, the scheme specifically emphasizes ''maximising brain development in the first three years of life'' alongside combating stunting, wasting, and anemia.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಮಹಿಳಾ ಮತ್ತು ಮಕ್ಕಳ ಅಭಿವೃದ್ಧಿ ಸಚಿವಾಲಯದ ಸಮಗ್ರ ಶಿಶು ಅಭಿವೃದ್ಧಿ ಸೇವೆಗಳ (ICDS) ಅಡಿಯಲ್ಲಿ ಜಾರಿಗೆ ತರಲಾದ ''ಪೋಷಣ್ ಅಭಿಯಾನ'' (ರಾಷ್ಟ್ರೀಯ ಪೌಷ್ಟಿಕತಾ ಮಿಷನ್) ಮಗುವಿನ ಜೀವನದ ಮೊದಲ 1,000 ದಿನಗಳಿಗೆ (ಗರ್ಭಾವಸ್ಥೆಯಿಂದ 3 ವರ್ಷಗಳವರೆಗೆ) ಅತ್ಯಂತ ಮಹತ್ವ ನೀಡುತ್ತದೆ. ಮಾನವನ ಮೆದುಳಿನ ಸುಮಾರು 80% ರಚನೆ ಮತ್ತು ಬೆಳವಣಿಗೆಯು 3 ವರ್ಷ ತುಂಬುವುದರೊಳಗೆ ಪೂರ್ಣಗೊಳ್ಳುವುದರಿಂದ, "ಜೀವಿತದ ಮೊದಲ ಮೂರು ವರ್ಷಗಳಲ್ಲಿ ಮೆದುಳಿನ ಬೆಳವಣಿಗೆಯನ್ನು ಗರಿಷ್ಠಗೊಳಿಸುವುದು" ಈ ಅಭಿಯಾನದ ಪ್ರಮುಖ ಧ್ಯೇಯವಾಕ್ಯಗಳಲ್ಲಿ ಒಂದಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q17', 17, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups', 'Indian Society & Social Justice', 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ', 'Welfare Schemes for Vulnerable Sections', 'ದುರ್ಬಲ ವರ್ಗಗಳ ಕಲ್ಯಾಣ ಯೋಜನೆಗಳು', 'NAMASTE Scheme (National Action for Mechanised Sanitation Ecosystem)', 'ನಮಸ್ತೆ ಯೋಜನೆ (ಯಾಂತ್ರಿಕೃತ ನೈರ್ಮಲ್ಯ ಪರಿಸರ ವ್ಯವಸ್ಥೆಗಾಗಿ ರಾಷ್ಟ್ರೀಯ ಕ್ರಿಯಾ ಯೋಜನೆ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Government Schemes', 'Indian Society & Social Justice']::TEXT[], '', '', 'Expand ''NAMASTE''', '''NAMASTE'' - ವಿಸ್ತರಿಸಿ.', 'National Action for Medical Science Education', 'National Action for Mechanised Sanitation Ecosystem', 'National Action for Mechanised Sustainable Environment', 'National Association for Mechanised Sanitation Ecosystem', 'ನ್ಯಾಷನಲ್ ಆ್ಯಕ್ಷನ್ ಫಾರ್ ಮೆಡಿಕಲ್ ಸೈನ್ಸ್ ಎಜುಕೇಶನ್.', 'ನ್ಯಾಷನಲ್ ಆ್ಯಕ್ಷನ್ ಫಾರ್ ಮೆಕಾನೈಸ್ಡ್ ಸ್ಯಾನಿಟೇಶನ್ ಇಕೋಸಿಸ್ಟಮ್.', 'ನ್ಯಾಷನಲ್ ಆ್ಯಕ್ಷನ್ ಫಾರ್ ಮೆಕಾನೈಸ್ಡ್ ಸಸ್ಟೇನಬಲ್ ಎನ್ವಿರಾನ್‌ಮೆಂಟ್.', 'ನ್ಯಾಷನಲ್ ಅಸೋಸಿಯೇಷನ್ ಫಾರ್ ಮೆಕಾನೈಸ್ಡ್ ಸ್ಯಾನಿಟೇಶನ್ ಇಕೋಸಿಸ್ಟಮ್.', '2', 'Correct Answer: (2)

NAMASTE stands for ''National Action for Mechanised Sanitation Ecosystem''. It is a Central Sector Scheme formulated jointly by the Ministry of Social Justice and Empowerment (MoSJE) and the Ministry of Housing and Urban Affairs (MoHUA). The initiative aims to achieve zero fatalities during sewer and septic tank cleaning work, eliminate hazardous manual scavenging completely, and enable sanitation workers to transition into self-employed ''sanipreneurs'' equipped with mechanized cleaning gear.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

NAMASTE ಎಂದರೆ ''National Action for Mechanised Sanitation Ecosystem'' (ನ್ಯಾಷನಲ್ ಆ್ಯಕ್ಷನ್ ಫಾರ್ ಮೆಕಾನೈಸ್ಡ್ ಸ್ಯಾನಿಟೇಶನ್ ಇಕೋಸಿಸ್ಟಮ್). ಇದು ಕೇಂದ್ರ ಸಾಮಾಜಿಕ ನ್ಯಾಯ ಮತ್ತು ಸಬಲೀಕರಣ ಸಚಿವಾಲಯ ಹಾಗೂ ವಸತಿ ಮತ್ತು ನಗರ ವ್ಯವಹಾರಗಳ ಸಚಿವಾಲಯಗಳ ಜಂಟಿ ಯೋಜನೆಯಾಗಿದೆ. ಒಳಚರಂಡಿ ಮತ್ತು ಸೆಪ್ಟಿಕ್ ಟ್ಯಾಂಕ್‌ಗಳ ಸ್ವಚ್ಛತೆಯ ವೇಳೆ ಸಂಭವಿಸುವ ಸಾವಿನ ಪ್ರಮಾಣವನ್ನು ಶೂನ್ಯಕ್ಕಿಳಿಸುವುದು, ಮಲಹೊರುವ ಅನಿಷ್ಟ ಪದ್ಧತಿಯನ್ನು ಸಂಪೂರ್ಣ ನಿರ್ಮೂಲನೆ ಮಾಡುವುದು ಮತ್ತು ಪೌರಕಾರ್ಮಿಕರಿಗೆ ಸುರಕ್ಷಿತ ಯಂತ್ರೋಪಕರಣಗಳನ್ನು ಒದಗಿಸಿ ಅವರನ್ನು ಉದ್ಯಮಿಗಳನ್ನಾಗಿ ಮಾಡುವುದು ಈ ಯೋಜನೆಯ ಮುಖ್ಯ ಉದ್ದೇಶವಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q18', 18, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.foreign_trade_policy_international_agreements', 'Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', 'External Sector, Balance of Payments & Foreign Trade', 'ವಿದೇಶಿ ವಲಯ, ಪಾವತಿಗಳ ಶಿಲ್ಕು ಮತ್ತು ವಿದೇಶಿ ವ್ಯಾಪಾರ', 'WTO TRIPS Agreement & Intellectual Property Rights (Geographical Indications)', 'ವಿಶ್ವ ವ್ಯಾಪಾರ ಸಂಸ್ಥೆಯ ಟ್ರಿಪ್ಸ್ (TRIPS) ಒಪ್ಪಂದ ಮತ್ತು ಭೌಗೋಳಿಕ ಸೂಚ್ಯಂಕಗಳು (GI)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Economy', 'Indian Economy & Development']::TEXT[], '', '', 'Patent for Geographical Indications comes under which of the following multilateral agreements of WTO ?', 'ಭೌಗೋಳಿಕ ಸೂಚಕಗಳ ಪೇಟೆಂಟ್ ವಿಷಯವು WTO ದ ಬಹುಪಕ್ಷೀಯ ಒಪ್ಪಂದಗಳಲ್ಲಿ ಈ ಕೆಳಗಿನ ಯಾವುದರ ಅಡಿಯಲ್ಲಿ ಬರುತ್ತದೆ ?', 'TRIPs', 'GATT', 'TRIMs', 'GATS', 'TRIPs', 'GATT', 'TRIMs', 'GATS', '1', 'Correct Answer: (1)

Geographical Indications (GIs) are protected under the TRIPS Agreement (Trade-Related Aspects of Intellectual Property Rights), governed by the World Trade Organization (WTO) under Articles 22 through 24. TRIPS establishes global minimum standards for protecting intellectual property, including patents, copyrights, trademarks, industrial designs, and geographical indications.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಭೌಗೋಳಿಕ ಸೂಚಕಗಳು (Geographical Indications - GI) ವಿಶ್ವ ವ್ಯಾಪಾರ ಸಂಸ್ಥೆಯ (WTO) ''TRIPs'' (Trade-Related Aspects of Intellectual Property Rights - ವ್ಯಾಪಾರ ಸಂಬಂಧಿತ ಬೌದ್ಧಿಕ ಆಸ್ತಿ ಹಕ್ಕುಗಳ ಒಪ್ಪಂದ) ಅಡಿಯಲ್ಲಿ ಬರುತ್ತವೆ (ವಿಧಿ 22 ರಿಂದ 24). TRIPs ಒಪ್ಪಂದವು ಪೇಟೆಂಟ್‌ಗಳು, ಹಕ್ಕುಸ್ವಾಮ್ಯಗಳು (ಕಾಪಿರೈಟ್ಸ್), ಟ್ರೇಡ್‌ಮಾರ್ಕ್‌ಗಳು, ಕೈಗಾರಿಕಾ ವಿನ್ಯಾಸಗಳು ಹಾಗೂ ಭೌಗೋಳಿಕ ಸೂಚಕಗಳಿಗೆ ಅಂತಾರಾಷ್ಟ್ರೀಯ ಮಟ್ಟದಲ್ಲಿ ಕಾನೂನು ರಕ್ಷಣೆ ನೀಡುತ್ತದೆ.', NULL, NULL),
    ('pc-nhk-2026-q19', 19, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.ancient_india.south_indian_kingdoms', 'History', 'ಇತಿಹಾಸ', 'Ancient India', 'ಪ್ರಾಚೀನ ಭಾರತ', 'Satavahana Rock-Cut Architecture & Chaitya Halls (Karle, Bhaja, Kanheri, Bedsa, Amaravati)', 'ಶಾತವಾಹನರ ಬಂಡೆಗಲ್ಲಿನ ವಾಸ್ತುಶಿಲ್ಪ ಮತ್ತು ಚೈತ್ಯಗಳು (ಕಾರ್ಲೆ, ಭಾಜಾ, ಕನ್ಹೇರಿ, ಬೆಡ್ಸಾ, ಅಮರಾವತಿ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Ancient History', 'History']::TEXT[], '', '', 'In which of the following places the Chaityas of the Satavahana''s is not found ?', 'ಈ ಕೆಳಕಂಡ ಯಾವ ಸ್ಥಳದಲ್ಲಿ ಶಾತವಾಹನರ ಚೈತ್ಯಗಳು ಕಂಡು ಬರುವುದಿಲ್ಲ ?', 'Kanheri', 'Karle', 'Ahichhatra', 'Nasik', 'ಕನ್ಹೇರಿ', 'ಕಾರ್ಲೆ', 'ಅಹಿಚ್ಛತ್ರ', 'ನಾಸಿಕ್', '3', 'Correct Answer: (3)

The Satavahana empire was centered in the Deccan and Western Ghats. Their patronage of rock-cut Hinayana Buddhist architecture produced magnificent chaityagrihas (prayer halls) and viharas in Western India, notably at Karle (the largest rock-cut chaitya), Kanheri, Nasik (Pandavleni caves), and Bhaja. In contrast, Ahichchhatra was the ancient capital of the Northern Panchala kingdom located in present-day Bareilly district, Uttar Pradesh, and was never a site of Satavahana rock-cut chaityas.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ದಖ್ಖನ್ ಪ್ರಸ್ಥಭೂಮಿ ಮತ್ತು ಪಶ್ಚಿಮ ಘಟ್ಟಗಳಲ್ಲಿ ಆಳ್ವಿಕೆ ನಡೆಸಿದ ಶಾತವಾಹನರು ಬೌದ್ಧ ಧರ್ಮದ ವಾಸ್ತುಶಿಲ್ಪಕ್ಕೆ ಅಪಾರ ಪ್ರೋತ್ಸಾಹ ನೀಡಿದರು. ಅವರ ಕಾಲದ ಪ್ರಸಿದ್ಧ ಕಡಿದ ಬಂಡೆಯ ಬೌದ್ಧ ಚೈತ್ಯಾಲಯಗಳು ಮತ್ತು ವಿಹಾರಗಳು ಮಹಾರಾಷ್ಟ್ರದ ಕಾರ್ಲೆ (ಅತ್ಯಂತ ದೊಡ್ಡ ಚೈತ್ಯ), ಕನ್ಹೇರಿ, ನಾಸಿಕ್ ಮತ್ತು ಭಾಜಾಗಳಲ್ಲಿ ಕಂಡುಬರುತ್ತವೆ. ಆದರೆ ''ಅಹಿಚ್ಛತ್ರ''ವು ಉತ್ತರ ಭಾರತದ ಪ್ರಾಚೀನ ಪಾಂಚಾಲ ರಾಜ್ಯದ ರಾಜಧಾನಿಯಾಗಿದ್ದು (ಇಂದಿನ ಉತ್ತರ ಪ್ರದೇಶದ ಬರೇಲಿ ಜಿಲ್ಲೆ), ಇಲ್ಲಿ ಶಾತವಾಹನರ ಚೈತ್ಯಗಳು ಕಂಡುಬರುವುದಿಲ್ಲ.', NULL, NULL),
    ('pc-nhk-2026-q20', 20, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.history_of_karnataka.karnataka_unification_movement_post-independence_social_transformation.karnataka_ekikarana_movement', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Karnataka Unification Movement & First Unification Conference at Dharwad (1920)', 'ಕರ್ನಾಟಕ ಏಕೀಕರಣ ಚಳವಳಿ ಮತ್ತು ಧಾರವಾಡದಲ್ಲಿ ಪ್ರಥಮ ಏಕೀಕರಣ ಸಮ್ಮೇಳನ (1920)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Karnataka History', 'History']::TEXT[], '', '', 'The venue where the first conference for the unification of Karnataka was held under the chairmanship of Siddappa Kambali is', 'ಕರ್ನಾಟಕದ ಏಕೀಕರಣಕ್ಕಾಗಿ ಸಿದ್ದಪ್ಪ ಕಂಬಳಿ ರವರ ಅಧ್ಯಕ್ಷತೆಯಲ್ಲಿ ಮೊದಲ ಸಮ್ಮೇಳನ ನಡೆದ ಸ್ಥಳ -', 'Dharawada', 'Hubballi', 'Bengaluru', 'Belagavi', 'ಧಾರವಾಡ', 'ಹುಬ್ಬಳ್ಳಿ', 'ಬೆಂಗಳೂರು', 'ಬೆಳಗಾವಿ', '1', 'Correct Answer: (1)

The Karnataka Ekikarana movement gathered momentum in the early 20th century to integrate Kannada-speaking regions scattered across multiple administrative units (Bombay Presidency, Madras Presidency, Mysore State, Hyderabad Nizam State, and small princely states). The historic First Karnataka Unification Conference under the chairmanship of Sir Siddappa Kambali was organized at Dharwad (the intellectual nucleus of the unification movement nurtured by the Karnataka Vidyavardhaka Sangha).', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ವಿವಿಧ ಆಡಳಿತ ಪ್ರಾಂತ್ಯಗಳಲ್ಲಿ (ಬಾಂಬೆ ಪ್ರೆಸಿಡೆನ್ಸಿ, ಮದ್ರಾಸ್ ಪ್ರೆಸಿಡೆನ್ಸಿ, ಮೈಸೂರು ಸಂಸ್ಥಾನ, ನಿಜಾಮ್ ಹೈದರಾಬಾದ್) ಹರಿದು ಹಂಚಿಹೋಗಿದ್ದ ಕನ್ನಡ ಮಾತನಾಡುವ ಪ್ರದೇಶಗಳನ್ನು ಒಂದುಗೂಡಿಸಲು ನಡೆದ ಕರ್ನಾಟಕ ಏಕೀಕರಣ ಚಳವಳಿಯ ಪ್ರಮುಖ ಘಟ್ಟವಾಗಿ, ಸರ್ ಸಿದ್ದಪ್ಪ ಕಂಬಳಿ ಅವರ ಅಧ್ಯಕ್ಷತೆಯಲ್ಲಿ ಮೊದಲ ಏಕೀಕರಣ ಸಮ್ಮೇಳನವು ''ಧಾರವಾಡ''ದಲ್ಲಿ ಜರುಗಿತು. ಧಾರವಾಡದ ಕರ್ನಾಟಕ ವಿದ್ಯಾವರ್ಧಕ ಸಂಘವು ಈ ಏಕೀಕರಣದ ಬೌದ್ಧಿಕ ಚಳವಳಿಯ ಕೇಂದ್ರವಾಗಿತ್ತು.', NULL, NULL),
    ('pc-nhk-2026-q21', 21, 2026, 'September', 1, 'nhk', 'ksp-pc', 'art_culture_heritage.martial_arts_traditional_sports_calendars', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Martial Arts, Traditional Sports & Calendars', 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು', 'Grand Slam Tennis Championships & Court Surfaces (Wimbledon, Roland Garros, US Open, Australian Open)', 'ಗ್ರ್ಯಾಂಡ್‌ಸ್ಲಾಂ ಟೆನ್ನಿಸ್ ಪಂದ್ಯಾವಳಿಗಳು ಮತ್ತು ಕೋರ್ಟ್ ವಿಧಗಳು (ವಿಂಬಲ್ಡನ್, ರೋಲ್ಯಾಂಡ್ ಗ್ಯಾರೋಸ್, ಯುಎಸ್ ಓಪನ್, ಆಸ್ಟ್ರೇಲಿಯನ್ ಓಪನ್)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Sports', 'Art, Culture & Heritage']::TEXT[], '', '', 'Identify the correctly matched pairs & choose the correct answer from the options given below :

Games - No. of Players
(a) Kho-Kho - 09
(b) Hockey - 14
(c) Cricket - 16
(d) Kabaddi - 07', 'ಸರಿಯಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿರುವ ಜೋಡಿಗಳನ್ನು ಗುರುತಿಸಿ ಮತ್ತು ಕೆಳಗೆ ಕೊಟ್ಟಿರುವ ಸಂಕೇತಗಳಿಂದ ಸರಿಯುತ್ತರ ಆರಿಸಿ :

ಕ್ರೀಡೆಗಳು - ಆಟಗಾರರ ಸಂಖ್ಯೆ
(a) ಖೋ-ಖೋ - 09
(b) ಹಾಕಿ - 14
(c) ಕ್ರಿಕೆಟ್ - 16
(d) ಕಬಡ್ಡಿ - 07', '(a) and (d) are correct.', '(a), (b), (c) and (d) are correct.', '(a), (c) and (d) are correct.', '(b) and (d) are correct.', '(a) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ', '(a), (b), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ', '(a), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ', '(b) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ', '1', 'Correct Answer: (1)

• (a) Kho-Kho: 09 players on the pitch per team during play (a match team consists of 12 or 15 players, but exactly 9 take the field) - Correct.
• (b) Hockey: 11 active on-field players per team (not 14) - Incorrect.
• (c) Cricket: 11 active on-field players per team (not 16) - Incorrect.
• (d) Kabaddi: 07 active players on the court per team (total squad of 12) - Correct.
Therefore, (a) and (d) are correct.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• (a) ಖೋ-ಖೋ: ಪಂದ್ಯದ ಸಮಯದಲ್ಲಿ ಅಂಕಣದಲ್ಲಿ ಆಡುವ ಆಟಗಾರರ ಸಂಖ್ಯೆ 09 (ಸರಿ).
• (b) ಹಾಕಿ: ಮೈದಾನದಲ್ಲಿ ಆಡುವ ಆಟಗಾರರ ಸಂಖ್ಯೆ 11 (14 ಅಲ್ಲ - ತಪ್ಪು).
• (c) ಕ್ರಿಕೆಟ್: ಮೈದಾನದಲ್ಲಿ ಆಡುವ ಆಟಗಾರರ ಸಂಖ್ಯೆ 11 (16 ಅಲ್ಲ - ತಪ್ಪು).
• (d) ಕಬಡ್ಡಿ: ಅಂಕಣದಲ್ಲಿ ಆಡುವ ಆಟಗಾರರ ಸಂಖ್ಯೆ 07 (ಸರಿ).
ಆದ್ದರಿಂದ (a) ಮತ್ತು (d) ಸರಿಯಾಗಿ ಹೊಂದಾಣಿಕೆಯಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q22', 22, 2026, 'September', 1, 'nhk', 'ksp-pc', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.land_degradation_soil_pollution_desertification', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Environmental Pollution, Waste Management & Remediation', 'ಪರಿಸರ ಮಾಲಿನ್ಯ, ತ್ಯಾಜ್ಯ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಹಾರೋಪಾಯಗಳು', 'Persistent Organic Pollutants (DDT) & Biomagnification Hazards', 'ನಿರಂತರ ಸಾವಯವ ಮಾಲಿನ್ಯಕಾರಕಗಳು (ಡಿಡಿಟಿ) ಮತ್ತು ಜೈವಿಕ ಸಾಂದ್ರೀಕರಣದ ಅಪಾಯಗಳು', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Science', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'DDT, an organic insecticide mainly contains', 'ಸಾವಯವ ಕೀಟನಾಶಕವಾದ ಡಿಡಿಟಿ ಯಲ್ಲಿ ಪ್ರಮುಖವಾಗಿರುವುದು', 'Chlorine', 'Nitrogen', 'Sulphur', 'Oxygen', 'ಕ್ಲೋರಿನ್', 'ಸಾರಜನಕ', 'ಗಂಧಕ', 'ಆಮ್ಲಜನಕ', '1', 'Correct Answer: (1)

DDT stands for Dichlorodiphenyltrichloroethane (chemical formula: C14H9Cl5). It is a synthetic organochlorine pesticide first synthesized in 1874 and discovered to have insecticidal properties by Paul Hermann Müller in 1939. Its molecule contains five chlorine atoms, which are responsible for its insecticidal toxicity, extreme persistence in the environment, and high degree of biomagnification.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಡಿಡಿಟಿ (DDT) ಎಂದರೆ ''ಡೈಕ್ಲೋರೋಡೈಫಿನೈಲ್ ಟ್ರೈಕ್ಲೋರೋಈಥೇನ್'' (ರಾಸಾಯನಿಕ ಸೂತ್ರ: C14H9Cl5). ಇದು ಆರ್ಗ್ಯಾನೋಕ್ಲೋರಿನ್ ಗುಂಪಿಗೆ ಸೇರಿದ ಪ್ರಸಿದ್ಧ ಸಾವಯವ ಕೀಟನಾಶಕವಾಗಿದೆ. ಇದರ ಅಣುರಚನೆಯಲ್ಲಿ 5 ಕ್ಲೋರಿನ್ ಪರಮಾಣುಗಳಿರುತ್ತವೆ. ಈ ಕ್ಲೋರಿನ್ ಅಂಶವು ಕೀಟಗಳನ್ನು ನಾಶಮಾಡಲು ಪ್ರಮುಖ ಪಾತ್ರ ವಹಿಸುತ್ತದೆ. ಆದರೆ ಪರಿಸರದಲ್ಲಿ ಬೇಗನೆ ಕರಗದೆ ಜೈವಿಕ ಸಂವರ್ಧನೆಗೆ (Biomagnification) ಕಾರಣವಾಗುವುದರಿಂದ ಇದನ್ನು ಹಲವು ದೇಶಗಳಲ್ಲಿ ನಿಷೇಧಿಸಲಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q23', 23, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Acid-Base Indicators & Synthetic Chemical Indicators (Phenolphthalein & Methyl Orange)', 'ಆಮ್ಲ-ಪ್ರತ್ಯಾಮ್ಲ ಸೂಚಕಗಳು ಮತ್ತು ಕೃತಕ ರಾಸಾಯನಿಕ ಸೂಚಕಗಳು (ಫೀನಾಲ್ಫ್‌ಥಲೀನ್ ಮತ್ತು ಮೀಥೈಲ್ ಆರೆಂಜ್)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Science', 'Science, Technology & Defence']::TEXT[], '', '', 'Synthetic indicator among the following is', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಕೃತಕ ಸೂಚಕ', 'Methyl Orange', 'Litmus', 'Red Cabbage Leaves', 'Turmeric', 'ಮಿಥೈಲ್ ಆರೆಂಜ್', 'ಲಿಟ್ಮಸ್', 'ಕೆಂಪು ಕ್ಯಾಬೇಜ್ ಎಲೆಗಳು', 'ಅರಿಶಿಣ', '1', 'Correct Answer: (1)

Acid-base indicators are divided into natural and synthetic categories:
• Methyl orange and Phenolphthalein are laboratory-synthesized chemical compounds (synthetic indicators). Methyl orange turns red in acidic medium and yellow in basic/neutral medium.
• Litmus (extracted from lichens), Red cabbage leaves (containing anthocyanins), and Turmeric (containing curcumin) are naturally occurring indicators derived directly from plant sources.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಆಮ್ಲ-ಪ್ರತ್ಯಾಮ್ಲ ಸೂಚಕಗಳನ್ನು ನೈಸರ್ಗಿಕ ಮತ್ತು ಕೃತಕ (ಸಂಶ್ಲೇಷಿತ) ಸೂಚಕಗಳಾಗಿ ವಿಂಗಡಿಸಲಾಗುತ್ತದೆ:
• ''ಮಿಥೈಲ್ ಆರೆಂಜ್'' ಮತ್ತು ''ಫಿನಾಫ್ತಲೀನ್'' ಪ್ರಯೋಗಾಲಯದಲ್ಲಿ ರಾಸಾಯನಿಕವಾಗಿ ತಯಾರಿಸಲಾಗುವ ಕೃತಕ ಸೂಚಕಗಳಾಗಿವೆ. ಮಿಥೈಲ್ ಆರೆಂಜ್ ಆಮ್ಲೀಯ ದ್ರಾವಣದಲ್ಲಿ ಕೆಂಪು ಬಣ್ಣಕ್ಕೂ ಮತ್ತು ಪ್ರತ್ಯಾಮ್ಲೀಯ ದ್ರಾವಣದಲ್ಲಿ ಹಳದಿ ಬಣ್ಣಕ್ಕೂ ಬದಲಾಗುತ್ತದೆ.
• ಲಿಟ್ಮಸ್ (ಲೈಕನ್ ಪಾಚಿಯಿಂದ ಪಡೆಯುವುದು), ಕೆಂಪು ಕ್ಯಾಬೇಜ್ ಎಲೆಗಳು ಮತ್ತು ಅರಿಶಿಣ ನೈಸರ್ಗಿಕ ಮೂಲಗಳಿಂದ ದೊರೆಯುವ ನೈಸರ್ಗಿಕ ಸೂಚಕಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q24', 24, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.biotechnology_health_life_sciences.immunology_infectious_diseases_public_health', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Biotechnology, Health & Life Sciences', 'ಬಯೋಟೆಕ್ನಾಲಜಿ, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವ ವಿಜ್ಞಾನಗಳು', 'Infectious Diseases & Sexually Transmitted Infections (Curable Bacterial vs Incurable Viral STIs)', 'ಸಾಂಕ್ರಾಮಿಕ ರೋಗಗಳು ಮತ್ತು ಲೈಂಗಿಕ ಸಂಪರ್ಕ ರೋಗಗಳು (ಬ್ಯಾಕ್ಟೀರಿಯಾ ಮತ್ತು ವೈರಲ್ ಎಸ್‌ಟಿಐ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Biology', 'Science, Technology & Defence']::TEXT[], '', '', 'Which of the following STIs (Sexually Transmitted Infections) is/are completely curable if detected early and treated properly?

(a) Hepatitis-B (b) Syphilis
(c) Genital herpes (d) HIV/AIDS', 'ಈ ಕೆಳಗಿನ ಯಾವ STI/s (ಲೈಂಗಿಕ ಸಂಪರ್ಕದಿಂದ ಹರಡುವ ರೋಗ)ಗಳನ್ನು ಶೀಘ್ರವಾಗಿ ಪತ್ತೆ ಹಚ್ಚಿದರೆ ಮತ್ತು ಸರಿಯಾದ ಚಿಕಿತ್ಸೆ ನೀಡಿದರೆ ಸಂಪೂರ್ಣವಾಗಿ ಗುಣಪಡಿಸಬಹುದು ?

(a) ಹೆಪಟೈಟಿಸ್‌ ಬಿ (b) ಸಿಫಿಲಿಸ್
(c) ಜನನಾಂಗದ ಹರ್ಪಿಸ್ (d) ಹೆಚ್.ಐ.ವಿ./ಏಡ್ಸ್', '(a), (b) and (c)', '(a) and (b)', 'Only (b)', '(b) and (c)', '(a), (b) ಮತ್ತು (c)', '(a) ಮತ್ತು (b)', '(b) ಮಾತ್ರ', '(b) ಮತ್ತು (c)', '3', 'Correct Answer: (3)

According to medical pathology and standard NCERT biology textbooks, bacterial Sexually Transmitted Infections such as Syphilis (caused by Treponema pallidum), Gonorrhea, and Chlamydia are completely curable with proper antibiotic regimens (such as penicillin) if diagnosed early. In contrast, viral STIs—specifically Hepatitis B, Genital Herpes (Herpes Simplex Virus), and HIV/AIDS—cannot be cured completely; antiviral medications can only manage symptoms and suppress viral load.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

NCERT ಜೀವಶಾಸ್ತ್ರ ಹಾಗೂ ವೈದ್ಯಕೀಯ ವಿಜ್ಞಾನದ ಪ್ರಕಾರ, ಬ್ಯಾಕ್ಟೀರಿಯಾದಿಂದ ಉಂಟಾಗುವ ಲೈಂಗಿಕ ರೋಗಗಳಾದ ''ಸಿಫಿಲಿಸ್'' (ಟ್ರೆಪೋನೆಮಾ ಪಲ್ಲಿಡಮ್ ಬ್ಯಾಕ್ಟೀರಿಯಾದಿಂದ ಬರುವುದು), ಗೊನೋರಿಯಾ ಮತ್ತು ಕ್ಲಮೈಡಿಯಾಗಳನ್ನು ಆರಂಭದಲ್ಲೇ ಪತ್ತೆಹಚ್ಚಿ ಸರಿಯಾದ ಆಂಟಿಬಯೋಟಿಕ್ (ಪೆನಿಸಿಲಿನ್) ಚಿಕಿತ್ಸೆ ನೀಡಿದರೆ ಸಂಪೂರ್ಣವಾಗಿ ಗುಣಪಡಿಸಬಹುದು. ಆದರೆ ವೈರಸ್‌ಗಳಿಂದ ಬರುವ ಹೆಪಟೈಟಿಸ್-ಬಿ, ಜನನಾಂಗದ ಹರ್ಪಿಸ್ ಮತ್ತು ಹೆಚ್.ಐ.ವಿ./ಏಡ್ಸ್ ರೋಗಗಳನ್ನು ಸಂಪೂರ್ಣವಾಗಿ ಗುಣಪಡಿಸಲು ಸಾಧ್ಯವಿಲ್ಲ, ಅವುಗಳನ್ನು ಕೇವಲ ಔಷಧಗಳಿಂದ ನಿಯಂತ್ರಣದಲ್ಲಿಡಬಹುದು.', NULL, NULL),
    ('pc-nhk-2026-q25', 25, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.biotechnology_health_life_sciences.agricultural_biotechnology_bio-economy', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Biotechnology, Health & Life Sciences', 'ಬಯೋಟೆಕ್ನಾಲಜಿ, ಆರೋಗ್ಯ ಮತ್ತು ಜೀವ ವಿಜ್ಞಾನಗಳು', 'Genetically Modified Crops & Bacillus thuringiensis (Bt Cotton Cry Proteins against Bollworm)', 'ತಳೀಯವಾಗಿ ಮಾರ್ಪಡಿಸಿದ ಬೆಳೆಗಳು ಮತ್ತು ಬಿಟಿ ಹತ್ತಿ (ದುಂಡುಹುಳು ನಿರೋಧಕ ಕ್ರೈ ಪ್ರೋಟೀನ್)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Biotechnology', 'Science, Technology & Defence']::TEXT[], '', '', 'Bt. Cotton plant is resistant to which of the following?', 'Bt. ಹತ್ತಿಯ ಸಸ್ಯವು ಈ ಕೆಳಗಿನ ಯಾವುದಕ್ಕೆ ಪ್ರತಿರೋಧವನ್ನು ತೋರಿಸುತ್ತದೆ ?', 'Fungus', 'Bacteria', 'Viruses', 'Insects', 'ಶಿಲೀಂಧ್ರಗಳು', 'ಬ್ಯಾಕ್ಟೀರಿಯಾ', 'ವೈರಸ್‌ಗಳು', 'ಕೀಟಗಳು', '4', 'Correct Answer: (4)

Bt Cotton is a genetically modified (GM) transgenic crop engineered by inserting Cry genes (such as Cry1Ac and Cry2Ab) from the soil bacterium Bacillus thuringiensis. These genes produce crystal endotoxin proteins that bind to specific receptors in the alkaline midgut of targeted insect pests (principally lepidopteran insect larvae such as the cotton bollworm, tobacco budworm, and armyworm), causing gut perforation and death of the insect, thereby conferring innate insect resistance.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

Bt ಹತ್ತಿಯು ಜೈವಿಕ ತಂತ್ರಜ್ಞಾನದ ಮೂಲಕ ತಳೀಯವಾಗಿ ಮಾರ್ಪಡಿಸಲಾದ (Genetically Modified) ಬೆಳೆಯಾಗಿದೆ. ಮಣ್ಣಿನ ಬ್ಯಾಕ್ಟೀರಿಯಾವಾದ ''ಬ್ಯಾಸಿಲಸ್ ತುರಿಂಜಿಯೆನ್ಸಿಸ್'' (Bacillus thuringiensis - Bt) ನಿಂದ ಪಡೆದ ''Cry'' ಜೀನ್‌ಗಳನ್ನು ಹತ್ತಿ ಸಸ್ಯದೊಳಗೆ ಸೇರಿಸಲಾಗುತ್ತದೆ. ಈ ಜೀನ್‌ಗಳು ಉತ್ಪಾದಿಸುವ ವಿಷಕಾರಿ ಸ್ಪಟಿಕ ಪ್ರೋಟೀನ್‌ಗಳು ಹತ್ತಿಯ ಕಾಯಿ ಕೊರೆಯುವ ಹುಳುಗಳಂತಹ ಕೀಟಗಳ (Insects/Bollworms) ಕರುಳನ್ನು ಪ್ರವೇಶಿಸಿ ರಂಧ್ರಗಳನ್ನುಂಟುಮಾಡಿ ಕೀಟಗಳನ್ನು ನಾಶಮಾಡುತ್ತವೆ. ಆದ್ದರಿಂದ Bt ಹತ್ತಿಯು ಕೀಟಗಳಿಗೆ ಪ್ರತಿರೋಧವನ್ನು ತೋರಿಸುತ್ತದೆ.', NULL, NULL)
ON CONFLICT (id) DO UPDATE SET
    node_id = EXCLUDED.node_id,
    subject = EXCLUDED.subject,
    subject_kannada = EXCLUDED.subject_kannada,
    domain = EXCLUDED.domain,
    domain_kannada = EXCLUDED.domain_kannada,
    sub_topic = EXCLUDED.sub_topic,
    sub_topic_kannada = EXCLUDED.sub_topic_kannada,
    difficulty = EXCLUDED.difficulty,
    tags = EXCLUDED.tags,
    question_english = EXCLUDED.question_english,
    question_kannada = EXCLUDED.question_kannada,
    option_1_english = EXCLUDED.option_1_english,
    option_2_english = EXCLUDED.option_2_english,
    option_3_english = EXCLUDED.option_3_english,
    option_4_english = EXCLUDED.option_4_english,
    option_1_kannada = EXCLUDED.option_1_kannada,
    option_2_kannada = EXCLUDED.option_2_kannada,
    option_3_kannada = EXCLUDED.option_3_kannada,
    option_4_kannada = EXCLUDED.option_4_kannada,
    key_answer = EXCLUDED.key_answer,
    explanation_english = EXCLUDED.explanation_english,
    explanation_kannada = EXCLUDED.explanation_kannada,
    image_url = EXCLUDED.image_url,
    table_data = EXCLUDED.table_data;

INSERT INTO public.pc_pyq (
    id, question_number, year, month, paper, paper_code, exam_id, node_id,
    subject, subject_kannada, domain, domain_kannada, sub_topic, sub_topic_kannada,
    difficulty, tags, passage_english, passage_kannada, question_english, question_kannada,
    option_1_english, option_2_english, option_3_english, option_4_english,
    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,
    key_answer, explanation_english, explanation_kannada, image_url, table_data
) VALUES
    ('pc-nhk-2026-q26', 26, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'National Agricultural & Scientific Research Institutes (NDRI Karnal, CRRI Cuttack, IIHR Bengaluru, CPRI Shimla)', 'ರಾಷ್ಟ್ರೀಯ ಕೃಷಿ ಮತ್ತು ವೈಜ್ಞಾನಿಕ ಸಂಶೋಧನಾ ಸಂಸ್ಥೆಗಳು (NDRI, CRRI, IIHR, CPRI)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Institutions', 'Science, Technology & Defence']::TEXT[], '', '', 'Match List-I with List-II and choose the correct option from below :

List-I (Place)
a. Lucknow
b. Mumbai
c. Goa
d. New Delhi

List-II (Headquarters)
i. Central Institute of Fisheries Education
ii. National Institute of Oceanography
iii. Indian Council of Agricultural Research
iv. National Bureau of Fish Genetic Resources', 'ಪಟ್ಟಿ-I ರಲ್ಲಿರುವುದನ್ನು ಪಟ್ಟಿ-II ರಲ್ಲಿರುವುದರೊಂದಿಗೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರ ಆರಿಸಿ.

ಪಟ್ಟಿ-I (ಊರು) - ಪಟ್ಟಿ-II (ಕೇಂದ್ರ ಕಛೇರಿ)
a. ಲಕ್ನೋ - i. ಸೆಂಟ್ರಲ್ ಇನ್ಸಿಟ್ಯೂಟ್ ಆಫ್ ಫಿಶರೀಸ್ ಎಜುಕೇಶನ್
b. ಮುಂಬಯಿ - ii. ನ್ಯಾಷನಲ್ ಇನ್ಸಿಟ್ಯೂಟ್ ಆಫ್ ಓಷಿಯಾನೋಗ್ರಾಫಿ
c. ಗೋವಾ - iii. ಇಂಡಿಯನ್ ಕೌನ್ಸಿಲ್ ಆಫ್ ಅಗ್ರಿಕಲ್ಚರಲ್ ರಿಸರ್ಚ್
d. ನವ ದೆಹಲಿ - iv. ನ್ಯಾಷನಲ್ ಬ್ಯೂರೋ ಆಫ್ ಫಿಶ್ ಜೆನೆಟಿಕ್ ರಿಸೋರ್ಸಸ್', 'a-iii, b-i, c-ii, d-iv', 'a-iv, b-i, c-ii, d-iii', 'a-iv, b-iii, c-ii, d-i', 'a-iii, b-i, c-iv, d-ii', 'a-iii, b-i, c-ii, d-iv', 'a-iv, b-i, c-ii, d-iii', 'a-iv, b-iii, c-ii, d-i', 'a-iii, b-i, c-iv, d-ii', '2', 'Correct Answer: (2)

• Lucknow houses the National Bureau of Fish Genetic Resources (NBFGR - iv), established under ICAR in 1983 for conservation and cataloguing of fish genetic wealth.
• Mumbai is home to the Central Institute of Fisheries Education (CIFE - i), a premier deemed university for fisheries science.
• Goa (Dona Paula) hosts the National Institute of Oceanography (NIO - ii), a constituent laboratory of CSIR focusing on marine oceanographic research.
• New Delhi houses the Indian Council of Agricultural Research (ICAR - iii), established in 1929 as the apex body for coordinating agricultural education and research in India.
Thus, the correct sequence is a-iv, b-i, c-ii, d-iii.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

• ಲಕ್ನೋದಲ್ಲಿ ''ನ್ಯಾಷನಲ್ ಬ್ಯೂರೋ ಆಫ್ ಫಿಶ್ ಜೆನೆಟಿಕ್ ರಿಸೋರ್ಸಸ್'' (NBFGR - iv) ಕೇಂದ್ರ ಕಚೇರಿ ಇದೆ (ಮೀನುಗಳ ತಳಿ ಸಂಪನ್ಮೂಲ ಸಂರಕ್ಷಣೆಗಾಗಿ 1983 ರಲ್ಲಿ ಸ್ಥಾಪಿತವಾಯಿತು).
• ಮುಂಬೈನಲ್ಲಿ ಪ್ರಸಿದ್ಧ ''ಸೆಂಟ್ರಲ್ ಇನ್‌ಸ್ಟಿಟ್ಯೂಟ್ ಆಫ್ ಫಿಶರೀಸ್ ಎಜುಕೇಶನ್'' (CIFE - i) ಡೀಮ್ಡ್ ವಿಶ್ವವಿದ್ಯಾಲಯವಿದೆ.
• ಗೋವಾದ ಡೋನಾ ಪೌಲಾದಲ್ಲಿ ''ನ್ಯಾಷನಲ್ ಇನ್‌ಸ್ಟಿಟ್ಯೂಟ್ ಆಫ್ ಓಷಿಯಾನೋಗ್ರಾಫಿ'' (NIO - ii) ಕೇಂದ್ರ ಕಚೇರಿ ಇದೆ (ಇದು CSIR ನ ಪ್ರಮುಖ ಸಾಗರ ಸಂಶೋಧನಾ ಸಂಸ್ಥೆ).
• ನವದೆಹಲಿಯಲ್ಲಿ ''ಇಂಡಿಯನ್ ಕೌನ್ಸಿಲ್ ಆಫ್ ಅಗ್ರಿಕಲ್ಚರಲ್ ರಿಸರ್ಚ್'' (ICAR - iii) ನ ಪ್ರಧಾನ ಕಚೇರಿ ಇದೆ (1929 ರಲ್ಲಿ ಸ್ಥಾಪಿತವಾದ ಭಾರತದ ಅತ್ಯುನ್ನತ ಕೃಷಿ ಸಂಶೋಧನಾ ಮಂಡಳಿ).
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: a-iv, b-i, c-ii, d-iii.', NULL, NULL),
    ('pc-nhk-2026-q27', 27, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Human Skeletal Anatomy (206 Adult Bones & 14 Facial Skeleton Bones)', 'ಮಾನವ ಅಸ್ಥಿಪಂಜರ ಅಂಗರಚನಾಶಾಸ್ತ್ರ (206 ಮೂಳೆಗಳು ಮತ್ತು 14 ಮುಖದ ಮೂಳೆಗಳು)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Biology', 'Science, Technology & Defence']::TEXT[], '', '', 'Find (i) the number of bones present in an adult human body and (ii) the number of bones present in an adult human skull.', 'ವಯಸ್ಕ ಮಾನವನ ದೇಹದಲ್ಲಿ ಇರುವ ಒಟ್ಟು ಮೂಳೆಗಳ ಸಂಖ್ಯೆ (i) ಮತ್ತು ವಯಸ್ಕ ಮಾನವನ ತಲೆಬುರುಡೆಯಲ್ಲಿ ಇರುವ ಒಟ್ಟು ಮೂಳೆಗಳ ಸಂಖ್ಯೆ (ii) .', '(i) 210, (ii) 20', '(i) 216, (ii) 26', '(i) 206, (ii) 22', '(i) 260, (ii) 24', '(i) 210, (ii) 20', '(i) 216, (ii) 26', '(i) 206, (ii) 22', '(i) 260, (ii) 24', '3', 'Correct Answer: (3)

• The adult human skeleton consists of exactly 206 bones (divided into the axial skeleton of 80 bones and the appendicular skeleton of 126 bones), down from approximately 270–300 bones at birth due to bone fusion.
• The adult human skull consists of 22 bones, comprising 8 cranial bones (which encase and protect the brain) and 14 facial bones (viscerocranium). Note: If the middle ear ossicles (6) and hyoid bone (1) are included, the cranial complex counts 29, but anatomically, the skull proper consists of 22 bones.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

• ವಯಸ್ಕ ಮಾನವನ ಸಂಪೂರ್ಣ ದೇಹದಲ್ಲಿ ಒಟ್ಟು 206 ಮೂಳೆಗಳಿರುತ್ತವೆ (ಅಕ್ಷೀಯ ಅಸ್ಥಿಪಂಜರದಲ್ಲಿ 80 ಮತ್ತು ಉಪಾಂಗ ಅಸ್ಥಿಪಂಜರದಲ್ಲಿ 126 ಮೂಳೆಗಳು). ಹುಟ್ಟಿದ ಮಗುವಿನಲ್ಲಿ ಸುಮಾರು 270 ರಿಂದ 300 ಮೂಳೆಗಳಿದ್ದು, ಬೆಳವಣಿಗೆಯ ಹಂತದಲ್ಲಿ ಅವು ಪರಸ್ಪರ ಬೆಸೆದುಕೊಂಡು 206 ಆಗುತ್ತವೆ.
• ವಯಸ್ಕ ಮಾನವನ ತಲೆಬುರುಡೆಯಲ್ಲಿ (Skull) ಒಟ್ಟು 22 ಮೂಳೆಗಳಿರುತ್ತವೆ. ಇವುಗಳಲ್ಲಿ 8 ಕಪಾಲದ ಮೂಳೆಗಳು (Cranial bones - ಮೆದುಳಿಗೆ ರಕ್ಷಣೆ ನೀಡುವ ಮೂಳೆಗಳು) ಮತ್ತು 14 ಮುಖದ ಮೂಳೆಗಳು (Facial bones) ಸೇರಿವೆ.
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಉತ್ತರ (i) 206, (ii) 22 ಆಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q28', 28, 2026, 'September', 1, 'nhk', 'ksp-pc', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Environmental Pollution, Waste Management & Remediation', 'ಪರಿಸರ ಮಾಲಿನ್ಯ, ತ್ಯಾಜ್ಯ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಹಾರೋಪಾಯಗಳು', 'Noise Pollution & Physiological Impacts on Human Health (Auditory and Non-Auditory Effects)', 'ಶಬ್ದ ಮಾಲಿನ್ಯ ಮತ್ತು ಮಾನವ ಆರೋಗ್ಯದ ಮೇಲಿನ ದೈಹಿಕ ಪರಿಣಾಮಗಳು (ನಿದ್ರಾಹೀನತೆ, ಹೃದಯ ಬಡಿತ ಏರಿಕೆ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Environment', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'Sleeplessness, increased heartbeat and altered breathing pattern are the effects of ________ pollution.', 'ನಿದ್ರಾಹೀನತೆ, ಅಧಿಕ ಹೃದಯ ಬಡಿತ ಮತ್ತು ಉಸಿರಾಟದ ಲಯದ ಏರುಪೇರು __________ ಮಾಲಿನ್ಯದ ಪರಿಣಾಮಗಳಾಗಿವೆ.', 'Air', 'Noise', 'Soil', 'Water', 'ವಾಯು', 'ಶಬ್ದ', 'ಮಣ್ಣು', 'ಜಲ', '2', 'Correct Answer: (2)

Prolonged exposure to excessive sound levels (above 80 dB) causes chronic autonomic stress. According to NCERT environmental biology, noise pollution causes psychological and physiological disorders including sleeplessness (insomnia), tachycardia (abnormally increased heart rate), hypertension, altered breathing rhythms, constriction of blood vessels, and permanent damage to hearing abilities.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಅತಿಯಾದ ಕರ್ಕಶ ಶಬ್ದಕ್ಕೆ (80 ಡೆಸಿಬಲ್‌ಗಿಂತ ಅಧಿಕ) ನಿರಂತರವಾಗಿ ಒಡ್ಡಿಕೊಳ್ಳುವುದರಿಂದ ಮಾನವನ ನರಮಂಡಲದ ಮೇಲೆ ತೀವ್ರ ಪರಿಣಾಮ ಬೀರುತ್ತದೆ. NCERT ಪರಿಸರ ವಿಜ್ಞಾನದ ಪ್ರಕಾರ, ಶಬ್ದ ಮಾಲಿನ್ಯವು ನಿದ್ರಾಹೀನತೆ (Insomnia), ರಕ್ತದೊತ್ತಡ ಹೆಚ್ಚಳ, ಅಧಿಕ ಹೃದಯ ಬಡಿತ (Tachycardia), ಉಸಿರಾಟದ ಗತಿಯಲ್ಲಿ ಏರುಪೇರು, ಆತಂಕ ಮತ್ತು ಶಾಶ್ವತ ಶ್ರವಣದೋಷಕ್ಕೆ ಕಾರಣವಾಗುತ್ತದೆ.
ಆದ್ದರಿಂದ ಇವು ಶಬ್ದ ಮಾಲಿನ್ಯದ ಪ್ರಮುಖ ಪರಿಣಾಮಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q29', 29, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Inorganic Chemistry & Neutralization Reaction of Metal Oxides (Basic Oxides) with Acids', 'ಅಜೈವಿಕ ರಸಾಯನಶಾಸ್ತ್ರ ಮತ್ತು ಲೋಹದ ಆಕ್ಸೈಡ್‌ಗಳು ಆಮ್ಲಗಳೊಂದಿಗೆ ತಟಸ್ಥೀಕರಣ ಕ್ರಿಯೆ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Chemistry', 'Science, Technology & Defence']::TEXT[], '', '', 'Which of the following reacts with acid and forms salt and water ?', 'ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವುದು ಆಮ್ಲದೊಂದಿಗೆ ವರ್ತಿಸಿ ಲವಣ ಮತ್ತು ನೀರು ಉಂಟು ಮಾಡುತ್ತದೆ ?', 'CaO', 'CO2', 'CO', 'SO2', 'CaO', 'CO₂', 'CO', 'SO₂', '1', 'Correct Answer: (1)

• Calcium oxide (CaO) is a metallic oxide, which exhibits basic chemical behavior (basic oxide). Metallic oxides react with acids in a neutralization reaction to produce salt and water:
  CaO + 2HCl → CaCl2 + H2O.
• Conversely, non-metallic oxides such as Carbon dioxide (CO2) and Sulphur dioxide (SO2) are acidic oxides (they react with bases, not acids, to form salt and water).
• Carbon monoxide (CO) is a neutral non-metallic oxide.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• ಕ್ಯಾಲ್ಸಿಯಂ ಆಕ್ಸೈಡ್ (CaO - ಸುಣ್ಣ) ಒಂದು ಲೋಹೀಯ ಆಕ್ಸೈಡ್ ಆಗಿದ್ದು, ಪ್ರತ್ಯಾಮ್ಲೀಯ (ಬೇಸಿಕ್) ಗುಣವನ್ನು ಹೊಂದಿದೆ. ಲೋಹದ ಆಕ್ಸೈಡ್‌ಗಳು ಆಮ್ಲಗಳೊಂದಿಗೆ ವರ್ತಿಸಿದಾಗ ತಟಸ್ಥೀಕರಣ ಕ್ರಿಯೆ ನಡೆದು ಲವಣ ಮತ್ತು ನೀರನ್ನು ಉಂಟುಮಾಡುತ್ತವೆ:
  CaO + 2HCl → CaCl₂ + H₂O (ಕ್ಯಾಲ್ಸಿಯಂ ಕ್ಲೋರೈಡ್ ಲವಣ + ನೀರು).
• ಕಾರ್ಬನ್ ಡೈಆಕ್ಸೈಡ್ (CO₂) ಮತ್ತು ಸಲ್ಫರ್ ಡೈಆಕ್ಸೈಡ್ (SO₂) ಗಳು ಅಲೋಹೀಯ ಆಮ್ಲೀಯ ಆಕ್ಸೈಡ್‌ಗಳಾಗಿದ್ದು, ಪ್ರತ್ಯಾಮ್ಲಗಳೊಂದಿಗೆ ವರ್ತಿಸುತ್ತವೆ.
• ಕಾರ್ಬನ್ ಮೊನಾಕ್ಸೈಡ್ (CO) ತಟಸ್ಥ ಆಕ್ಸೈಡ್ ಆಗಿದೆ.
ಆದ್ದರಿಂದ ಆಮ್ಲದೊಂದಿಗೆ ವರ್ತಿಸಿ ಲವಣ ಮತ್ತು ನೀರನ್ನು ಕೊಡುವುದು CaO ಮಾತ್ರ.', NULL, NULL),
    ('pc-nhk-2026-q30', 30, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Fossil Fuel By-Products & Fractional Distillation of Coal (Coal Tar Chemical Composition)', 'ಪಳೆಯುಳಿಕೆ ಇಂಧನ ಉಪಉತ್ಪನ್ನಗಳು ಮತ್ತು ಕಲ್ಲಿದ್ದಲಿನ ವಿಭಜಕ ಆಸವನ (ಕೋಲ್ ಟಾರ್ ಸಂಯೋಜನೆ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Chemistry', 'Science, Technology & Defence']::TEXT[], '', '', '________ is a mixture of about 200 substances.', 'ಇದು ಸುಮಾರು 200 ವಸ್ತುಗಳ ಮಿಶ್ರಣವಾಗಿದೆ.', 'Coal Gas', 'Coke', 'Activated Charcoal', 'Coal Tar', 'ಕಲ್ಲಿದ್ದಲು ಅನಿಲ', 'ಕೋಕ್', 'ಸಕ್ರಿಯಗೊಳಿಸಿದ ಇದ್ದಿಲು', 'ಕಲ್ಲಿದ್ದಲು ಡಾಂಬರು', '4', 'Correct Answer: (4)

According to standard NCERT Class 8 Science (Chapter: ''Coal and Petroleum''), Coal Tar is a thick, black, viscous liquid with an unpleasant smell obtained as a byproduct during the destructive distillation of coal. It is a complex mixture of about 200 chemical substances (predominantly aromatic hydrocarbons such as benzene, toluene, naphthalene, phenol, and anthracene) used in manufacturing synthetic dyes, drugs, perfumes, plastics, and paints.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

NCERT 8ನೇ ತರಗತಿಯ ವಿಜ್ಞಾನ ಪಠ್ಯಪುಸ್ತಕದ (''ಕಲ್ಲಿದ್ದಲು ಮತ್ತು ಪೆಟ್ರೋಲಿಯಂ'') ಪ್ರಕಾರ, ಕಲ್ಲಿದ್ದಲನ್ನು ಗಾಳಿಯಿಲ್ಲದೆ ಬಿಸಿಮಾಡಿದಾಗ (ವಿಭಂಜಕ ಆಸವನ) ದೊರೆಯುವ ಕಪ್ಪು, ದಪ್ಪನೆಯ ಮತ್ತು ಅಹಿತಕರ ವಾಸನೆಯುಳ್ಳ ದ್ರವವೇ ''ಕಲ್ಲಿದ್ದಲು ಡಾಂಬರು'' (Coal Tar). ಇದು ಸುಮಾರು 200 ರಾಸಾಯನಿಕ ವಸ್ತುಗಳ (ಬೆಂಜೀನ್, ಟಾಲ್ಯೂಯಿನ್, ನ್ಯಾಫ್ತಲೀನ್, ಫೀನಾಲ್ ಇತ್ಯಾದಿ ಆರೊಮ್ಯಾಟಿಕ್ ಹೈಡ್ರೋಕಾರ್ಬನ್‌ಗಳು) ಮಿಶ್ರಣವಾಗಿದೆ. ಇದನ್ನು ಕೃತಕ ಬಣ್ಣಗಳು, ಔಷಧಗಳು, ಸುಗಂಧ ದ್ರವ್ಯಗಳು, ಸ್ಫೋಟಕಗಳು ಮತ್ತು ಪ್ಲಾಸ್ಟಿಕ್‌ಗಳ ತಯಾರಿಕೆಯಲ್ಲಿ ಬಳಸಲಾಗುತ್ತದೆ.', NULL, NULL),
    ('pc-nhk-2026-q31', 31, 2026, 'September', 1, 'nhk', 'ksp-pc', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.energy_flow_trophic_structure', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Fundamental Ecology & Ecosystem Dynamics', 'ಮೂಲಭೂತ ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ಪರಿಸರ ವ್ಯವಸ್ಥೆಯ ಚಲನಶಾಸ್ತ್ರ', 'Trophic Structure & Lindeman''s Unidirectional Energy Flow in Ecosystems', 'ಪೋಷಣಾ ಮಟ್ಟಗಳು ಮತ್ತು ಪರಿಸರ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ ಏಕಮುಖ ಶಕ್ತಿ ಹರಿವು', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Ecology', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'Which is the correct sequence of the following according to the flow of energy in an ecosystem ?

(a) Carnivores (b) Herbivores
(c) Sunlight (d) Producers', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ, ಪರಿಸರ ವ್ಯವಸ್ಥೆಯಲ್ಲಿನ ಶಕ್ತಿಯ ಹರಿವನ್ನು ತೋರಿಸುವ ಸರಿಯಾದ ಅನುಕ್ರಮ ಯಾವುದು ?

(a) ಮಾಂಸಾಹಾರಿಗಳು (b) ಸಸ್ಯಾಹಾರಿಗಳು
(c) ಸೌರ ಬೆಳಕು (d) ಉತ್ಪಾದಕಗಳು', '(c), (d), (b), (a)', '(a), (b), (c), (d)', '(d), (c), (b), (a)', '(d), (b), (a), (c)', '(c), (d), (b), (a)', '(a), (b), (c), (d)', '(d), (c), (b), (a)', '(d), (b), (a), (c)', '1', 'Correct Answer: (1)

In an ecological food chain, energy flows unidirectionally following Lindeman''s 10% law:
1. Solar radiation / Sunlight (c) is the ultimate source of energy.
2. Autotrophs / Producers (d) capture radiant solar energy via photosynthesis to synthesize glucose.
3. Primary consumers / Herbivores (b) ingest producers to obtain energy.
4. Secondary or tertiary consumers / Carnivores (a) consume herbivores.
Therefore, the correct sequential flow is (c) → (d) → (b) → (a).', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಪರಿಸರ ವ್ಯವಸ್ಥೆಯಲ್ಲಿ ಶಕ್ತಿಯ ಹರಿವು ಯಾವಾಗಲೂ ಏಕಮುಖವಾಗಿರುತ್ತದೆ:
1. ಸೌರ ಬೆಳಕು (c) ಪರಿಸರ ವ್ಯವಸ್ಥೆಗೆ ಪ್ರವೇಶಿಸುವ ಶಕ್ತಿಯ ಮೂಲವಾಗಿದೆ.
2. ಉತ್ಪಾದಕಗಳು (ಹಸಿರು ಸಸ್ಯಗಳು - d) ದ್ಯುತಿಸಂಶ್ಲೇಷಣೆ ಕ್ರಿಯೆಯ ಮೂಲಕ ಸೌರಶಕ್ತಿಯನ್ನು ರಾಸಾಯನಿಕ ಶಕ್ತಿಯನ್ನಾಗಿ ಪರಿವರ್ತಿಸುತ್ತವೆ.
3. ಸಸ್ಯಾಹಾರಿಗಳು (ಪ್ರಾಥಮಿಕ ಗ್ರಾಹಕಗಳು - b) ಸಸ್ಯಗಳನ್ನು ತಿಂದು ಶಕ್ತಿಯನ್ನು ಪಡೆಯುತ್ತವೆ.
4. ಮಾಂಸಾಹಾರಿಗಳು (ದ್ವಿತೀಯಕ ಗ್ರಾಹಕಗಳು - a) ಸಸ್ಯಾಹಾರಿಗಳನ್ನು ಭಕ್ಷಿಸಿ ಶಕ್ತಿಯನ್ನು ಪಡೆಯುತ್ತವೆ.
ಆದ್ದರಿಂದ ಶಕ್ತಿಯ ಹರಿವಿನ ಸರಿಯಾದ ಅನುಕ್ರಮ: (c), (d), (b), (a).', NULL, NULL),
    ('pc-nhk-2026-q32', 32, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Number Series Pattern Recognition (Fibonacci Addition Sequence)', 'ಸಂಖ್ಯಾ ಸರಣಿ ಮಾದರಿ ಗುರುತಿಸುವಿಕೆ (ಫಿಬೊನಾಕಿ ಸಂಕಲನ ಶ್ರೇಣಿ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'Find the missing number of the following series: 25, 26, _, 77, 128, 205', 'ಕೆಳಗಿನ ಸಂಖ್ಯಾ ಸರಣಿಯಲ್ಲಿ ಬಿಟ್ಟು ಹೋದ ಸಂಖ್ಯೆ :

25, 26, _, 77, 128, 205', '15', '1', '179', '51', '15', '1', '179', '51', '4', 'Correct Answer: (4)

The given sequence follows an additive Fibonacci-type rule where each term after the second is the sum of the two preceding terms:
• Term 1 = 25
• Term 2 = 26
• Term 3 = Term 1 + Term 2 = 25 + 26 = 51
• Term 4 = Term 2 + Term 3 = 26 + 51 = 77 (Matches)
• Term 5 = Term 3 + Term 4 = 51 + 77 = 128 (Matches)
• Term 6 = Term 4 + Term 5 = 77 + 128 = 205 (Matches)
Thus, the missing number is 51.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಈ ಸಂಖ್ಯಾ ಸರಣಿಯು ಫಿಬೊನಾಕಿ ನಿಯಮವನ್ನು ಅನುಸರಿಸುತ್ತದೆ; ಅಂದರೆ ಪ್ರತಿ ಸಂಖ್ಯೆಯು ಅದರ ಹಿಂದಿನ ಎರಡು ಸಂಖ್ಯೆಗಳ ಮೊತ್ತವಾಗಿರುತ್ತದೆ:
• 1ನೇ ಸಂಖ್ಯೆ = 25
• 2ನೇ ಸಂಖ್ಯೆ = 26
• 3ನೇ ಸಂಖ್ಯೆ = 25 + 26 = 51
• 4ನೇ ಸಂಖ್ಯೆ = 26 + 51 = 77
• 5ನೇ ಸಂಖ್ಯೆ = 51 + 77 = 128
• 6ನೇ ಸಂಖ್ಯೆ = 77 + 128 = 205
ಆದ್ದರಿಂದ ಬಿಟ್ಟುಹೋದ ಸ್ಥಾನದಲ್ಲಿ ಬರುವ ಸರಿಯಾದ ಸಂಖ್ಯೆ 51 ಆಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q33', 33, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Time, Work and Efficiency Relationships (Ratio of Daily Output)', 'ಸಮಯ, ಕೆಲಸ ಮತ್ತು ದಕ್ಷತೆಯ ಅನುಪಾತ ಸಂಬಂಧಗಳು', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'To complete a piece of work, A takes 50% more time than B. If together they take 18 days to complete the work, how much time shall B take to do it ?', 'ಒಂದು ಕೆಲಸವನ್ನು ಪೂರೈಸಲು, A ಯು B ಗಿಂತ 50% ಹೆಚ್ಚು ಸಮಯ ತೆಗೆದುಕೊಳ್ಳುತ್ತಾನೆ. ಅವರಿಬ್ಬರೂ ಒಟ್ಟಾಗಿ ಕೆಲಸವನ್ನು ಸಂಪೂರ್ಣಗೊಳಿಸಲು 18 ದಿನಗಳನ್ನು ತೆಗೆದುಕೊಂಡರೆ, B ಆ ಕೆಲಸವನ್ನು ಮಾಡಲು ಎಷ್ಟು ಸಮಯ ತೆಗೆದುಕೊಳ್ಳುತ್ತಾನೆ ?', '40 days', '35 days', '45 days', '30 days', '40 ದಿನಗಳು', '35 ದಿನಗಳು', '45 ದಿನಗಳು', '30 ದಿನಗಳು', '4', 'Correct Answer: (4)

Let the time taken by B alone to complete the work be $x$ days.
Since A takes 50% more time than B, time taken by A = $x + 0.5x = 1.5x = \frac{3x}{2}$ days.
Daily work rates:
• B''s 1-day work = $\frac{1}{x}$
• A''s 1-day work = $\frac{1}{1.5x} = \frac{2}{3x}$
Together, they complete the work in 18 days, so their combined 1-day work is $\frac{1}{18}$:
$\frac{1}{x} + \frac{2}{3x} = \frac{1}{18}$
$\frac{3 + 2}{3x} = \frac{1}{18} \implies \frac{5}{3x} = \frac{1}{18}$
$3x = 5 \times 18 = 90 \implies x = 30$ days.
Therefore, B takes 30 days to complete the work alone.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

B ಒಬ್ಬನೇ ಆ ಕೆಲಸವನ್ನು ಮುಗಿಸಲು ತೆಗೆದುಕೊಳ್ಳುವ ಸಮಯ $x$ ದಿನಗಳು ಎಂದಿರಲಿ.
A ಯು B ಗಿಂತ 50% ಹೆಚ್ಚು ಸಮಯ ತೆಗೆದುಕೊಳ್ಳುವುದರಿಂದ, A ತೆಗೆದುಕೊಳ್ಳುವ ಸಮಯ = $1.5x = \frac{3x}{2}$ ದಿನಗಳು.
ಒಂದು ದಿನದ ಕೆಲಸದ ಸಾಮರ್ಥ್ಯ:
• B ನ 1 ದಿನದ ಕೆಲಸ = $\frac{1}{x}$
• A ನ 1 ದಿನದ ಕೆಲಸ = $\frac{2}{3x}$
ಅವರಿಬ್ಬರೂ ಒಟ್ಟಾಗಿ 18 ದಿನಗಳಲ್ಲಿ ಕೆಲಸ ಮುಗಿಸುವುದರಿಂದ:
$\frac{1}{x} + \frac{2}{3x} = \frac{1}{18}$
$\frac{5}{3x} = \frac{1}{18} \implies 3x = 90 \implies x = 30$ ದಿನಗಳು.
ಆದ್ದರಿಂದ B ಆ ಕೆಲಸವನ್ನು ಪೂರೈಸಲು 30 ದಿನಗಳನ್ನು ತೆಗೆದುಕೊಳ್ಳುತ್ತಾನೆ.', NULL, NULL),
    ('pc-nhk-2026-q34', 34, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Basic Numeracy & Linear Systems (Sum and Difference of Two Numbers)', 'ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ ಮತ್ತು ಸರಳ ಸಮೀಕರಣಗಳು (ಎರಡು ಸಂಖ್ಯೆಗಳ ಮೊತ್ತ ಮತ್ತು ವ್ಯತ್ಯಾಸ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'If sum of two numbers is 30 and difference of two numbers is 16, then find the multiplication of these two numbers.', 'ಎರಡು ಸಂಖ್ಯೆಗಳ ಮೊತ್ತ 30 ಮತ್ತು ಆ ಎರಡು ಸಂಖ್ಯೆಗಳ ನಡುವಿನ ವ್ಯತ್ಯಾಸ 16 ಆದರೆ, ಈ ಎರಡು ಸಂಖ್ಯೆಗಳ ಗುಣಲಬ್ಧವನ್ನು ಕಂಡುಹಿಡಿಯಿರಿ.', '112', '171', '132', '161', '112', '171', '132', '161', '4', 'Correct Answer: (4)

Let the two numbers be $a$ and $b$.
Given:
1) $a + b = 30$
2) $a - b = 16$

Adding equations (1) and (2):
$(a + b) + (a - b) = 30 + 16$
$2a = 46 \implies a = 23$

Substituting $a = 23$ into equation (1):
$23 + b = 30 \implies b = 7$

Product of the two numbers:
$a \times b = 23 \times 7 = 161$.
(Alternatively, using the algebraic identity $ab = \frac{(a+b)^2 - (a-b)^2}{4} = \frac{30^2 - 16^2}{4} = \frac{900 - 256}{4} = \frac{644}{4} = 161$).', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಆ ಎರಡು ಸಂಖ್ಯೆಗಳು $a$ ಮತ್ತು $b$ ಎಂದಿರಲಿ.
ನೀಡಿರುವಂತೆ:
1) $a + b = 30$
2) $a - b = 16$

ಎರಡೂ ಸಮೀಕರಣಗಳನ್ನು ಕೂಡಿಸಿದಾಗ:
$2a = 46 \implies a = 23$

ಈಗ $b$ ನ ಬೆಲೆ:
$b = 30 - 23 = 7$

ಆದ್ದರಿಂದ ಆ ಎರಡು ಸಂಖ್ಯೆಗಳ ಗುಣಲಬ್ಧ:
$a \times b = 23 \times 7 = 161$.
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಉತ್ತರ 161.', NULL, NULL),
    ('pc-nhk-2026-q35', 35, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Algebraic Identities & Factorization Formulas', 'ಬೀಜಗಣಿತೀಯ ನಿತ್ಯಸಮೀಕರಣಗಳು ಮತ್ತು ಅಪವರ್ತನ ಸೂತ್ರಗಳು', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mathematics', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'Match the following :

List-I (Number) - List-II (Type)
a. 144 - i. Non-perfect square
b. 257 - ii. Rational
c. 1/4 - iii. Irrational
d. √2 - iv. Perfect square', 'ಹೊಂದಿಸಿ ಬರೆಯಿರಿ :

ಪಟ್ಟಿ-I (ಸಂಖ್ಯೆ) - ಪಟ್ಟಿ-II (ವಿಧ)
a. 144 - i. ಅವರ್ಗ ಸಂಖ್ಯೆ
b. 257 - ii. ಭಾಗಲಬ್ಧ (ಪರಿಮೇಯ)
c. 1/4 - iii. ಅಭಾಗಲಬ್ಧ (ಅಪರಿಮೇಯ)
d. √2 - iv. ವರ್ಗ ಸಂಖ್ಯೆ', 'a-iv, b-i, c-ii, d-iii', 'a-i, b-iii, c-iv, d-ii', 'a-ii, b-iii, c-i, d-iv', 'a-iii, b-i, c-ii, d-iv', 'a-iv, b-i, c-ii, d-iii', 'a-i, b-iii, c-iv, d-ii', 'a-ii, b-iii, c-i, d-iv', 'a-iii, b-i, c-ii, d-iv', '1', 'Correct Answer: (1)

• a. 144: $12^2 = 144$, which is an exact square of an integer, hence a Perfect square (iv).
• b. 257: There is no integer whose square equals 257 ($16^2 = 256, 17^2 = 289$), hence a Non-perfect square (i).
• c. 1/4: Expressible in the form $\frac{p}{q}$ where $p, q \in \mathbb{Z}, q \neq 0$ ($= 0.25$, terminating decimal), hence a Rational number (ii).
• d. √2: Cannot be written as a simple fraction $\frac{p}{q}$ (its decimal expansion $1.414213...$ is non-terminating and non-recurring), hence an Irrational number (iii).
Thus, the correct matching is a-iv, b-i, c-ii, d-iii.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• a. 144: $12 \times 12 = 144$ ಆಗಿರುವುದರಿಂದ ಇದು ನಿಖರ ವರ್ಗ ಸಂಖ್ಯೆ (iv).
• b. 257: ಯಾವುದೇ ಪೂರ್ಣಾಂಕದ ವರ್ಗವಲ್ಲ ($16^2 = 256$), ಆದ್ದರಿಂದ ಇದು ಅವರ್ಗ ಸಂಖ್ಯೆ (i).
• c. 1/4: $\frac{p}{q}$ ರೂಪದಲ್ಲಿ ಬರೆಯಬಹುದಾದ ಅಂತ್ಯಗೊಳ್ಳುವ ದಶಮಾಂಶ (0.25), ಆದ್ದರಿಂದ ಇದು ಭಾಗಲಬ್ಧ/ಪರಿಮೇಯ ಸಂಖ್ಯೆ (ii).
• d. √2: ಅಂತ್ಯಗೊಳ್ಳದ ಮತ್ತು ಆವರ್ತಕವಲ್ಲದ ದಶಮಾಂಶ (1.414...), ಆದ್ದರಿಂದ ಇದು ಅಭಾಗಲಬ್ಧ/ಅಪರಿಮೇಯ ಸಂಖ್ಯೆ (iii).
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: a-iv, b-i, c-ii, d-iii.', NULL, NULL),
    ('pc-nhk-2026-q36', 36, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Number Systems & Highest Common Factor (HCF / GCD Euclid Division Algorithm)', 'ಸಂಖ್ಯಾ ಪದ್ಧತಿಗಳು ಮತ್ತು ಗರಿಷ್ಠ ಸಾಮಾನ್ಯ ಅಪವರ್ತನ (ಮ.ಸಾ.ಅ.)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mathematics', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'Find the HCF of the numbers 65 and 117.', '65 ಮತ್ತು 117 ರ ಮ.ಸಾ.ಅ. ವನ್ನು ಕಂಡುಹಿಡಿಯಿರಿ.', '16', '12', '13', '14', '16', '12', '13', '14', '3', 'Correct Answer: (3)

Finding the prime factorizations of both numbers:
• $65 = 5 \times 13$
• $117 = 3 \times 3 \times 13 = 3^2 \times 13$

The common prime factor shared by both numbers is 13.
Using Euclid''s Division Algorithm:
$117 = 65 \times 1 + 52$
$65 = 52 \times 1 + 13$
$52 = 13 \times 4 + 0$
Since the remainder is now 0, the last non-zero divisor is 13.
Therefore, $\text{HCF}(65, 117) = 13$.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ಎರಡೂ ಸಂಖ್ಯೆಗಳ ಅವಿಭಾಜ್ಯ ಅಪವರ್ತನಗಳನ್ನು ಬರೆದಾಗ:
• $65 = 5 \times 13$
• $117 = 9 \times 13 = 3 \times 3 \times 13$

ಎರಡೂ ಸಂಖ್ಯೆಗಳಲ್ಲಿರುವ ಸಾಮಾನ್ಯ ಗರಿಷ್ಠ ಅಪವರ್ತನ 13 ಆಗಿದೆ.
(ಯೂಕ್ಲಿಡ್ ಭಾಗಾಕಾರ ಕ್ರಮದ ಪ್ರಕಾರ: $117 = 65 \times 1 + 52$; ನಂತರ $65 = 52 \times 1 + 13$; ನಂತರ $52 = 13 \times 4 + 0$).
ಆದ್ದರಿಂದ 65 ಮತ್ತು 117 ರ ಮ.ಸಾ.ಅ. (HCF) 13 ಆಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q37', 37, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Coding-Decoding & Alphabet Numerical Position Scaling', 'ಕೋಡಿಂಗ್-ಡಿಕೋಡಿಂಗ್ ಮತ್ತು ಅಕ್ಷರಗಳ ಸ್ಥಾನಮೌಲ್ಯ ಗುಣಾಕಾರ', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'If Z = 52 and BAT = 46. Then ''ACT'' will be equal to :', 'Z = 52 ಮತ್ತು BAT = 46 ಆದರೆ, ''ACT'' ಇದಕ್ಕೆ ಸಮನಾಗಿರುತ್ತದೆ :', '48', '41', '47', '44', '48', '41', '47', '44', '1', 'Correct Answer: (1)

The code multiplies the sum of the alphabetical positions (where A = 1, B = 2, ..., Z = 26) by 2:
• Z: Positional value $= 26 \implies 26 \times 2 = 52$.
• BAT: $\text{B}(2) + \text{A}(1) + \text{T}(20) = 23 \implies 23 \times 2 = 46$.
• ACT: $\text{A}(1) + \text{C}(3) + \text{T}(20) = 24 \implies 24 \times 2 = 48$.
Therefore, ''ACT'' = 48.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಇಲ್ಲಿ ಇಂಗ್ಲಿಷ್ ವರ್ಣಮಾಲೆಯ ಅಕ್ಷರಗಳ ಸ್ಥಾನಿಕ ಬೆಲೆಗಳ ಮೊತ್ತವನ್ನು 2 ರಿಂದ ಗುಣಿಸಿ ಕೋಡ್ ಮಾಡಲಾಗಿದೆ:
• Z ನ ಸ್ಥಾನಿಕ ಬೆಲೆ $= 26 \implies 26 \times 2 = 52$
• BAT $= (\text{B}=2 + \text{A}=1 + \text{T}=20) = 23 \implies 23 \times 2 = 46$
• ACT $= (\text{A}=1 + \text{C}=3 + \text{T}=20) = 24 \implies 24 \times 2 = 48$
ಆದ್ದರಿಂದ ''ACT'' ನ ಮೌಲ್ಯ 48 ಆಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q38', 38, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Combinatorics & Rotational Symmetry Coloring on Cube Faces', 'ಕಾಂಬಿನೇಟೋರಿಕ್ಸ್ ಮತ್ತು ಘನಾಕೃತಿಯ ಮುಖಗಳ ಬಣ್ಣ ಹಚ್ಚುವ ಸಂಯೋಜನೆಗಳು', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'In how many ways can we paint the six faces of a cube with six different colours ?', 'ಒಂದು ಘನಾಕೃತಿಯ 6 ಸಮತಲಗಳಿಗೆ ಬೇರೆ ಬೇರೆ 6 ಬಣ್ಣಗಳಿಂದ ಎಷ್ಟು ರೀತಿಯಲ್ಲಿ ಬಣ್ಣ ಹಚ್ಚಬಹುದು ?', '90', '30', '180', '60', '90', '30', '180', '60', '2', 'Correct Answer: (2)

The total permutations of 6 distinct colors on 6 fixed faces is $6! = 720$.
However, because a cube can be freely rotated in 3-dimensional space, any arrangement that can be transformed into another by rigid rotation is considered identical.
A cube possesses 24 rotational symmetries (proper rotation group $O$):
• 1 identity rotation
• $3 \times 3 = 9$ face-center rotations (90°, 180°, 270° around 3 axes)
• $4 \times 2 = 8$ vertex rotations (120°, 240° around 4 diagonals)
• $6 \times 1 = 6$ edge-center rotations (180° around 6 axes)
Total proper rotations $= 1 + 9 + 8 + 6 = 24$.
By Burnside''s Lemma / group theory:
Distinct colorings $= \frac{6!}{24} = \frac{720}{24} = 30$.
(Alternatively: Fix Color 1 on the bottom face (1 way). The opposite top face can be chosen in 5 ways. The remaining 4 faces form a circular band, which can be colored in $(4-1)! = 3! = 6$ distinct ways. Total ways $= 5 \times 6 = 30$).', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

6 ಬೇರೆ ಬೇರೆ ಬಣ್ಣಗಳನ್ನು 6 ಸಮತಲಗಳಿಗೆ ಹಚ್ಚಲು ಇರುವ ಒಟ್ಟು ಕ್ರಮಯೋಜನೆಗಳು $= 6! = 720$.
ಆದರೆ ಒಂದು ಘನಾಕೃತಿಯನ್ನು 3D ಆಕಾಶದಲ್ಲಿ ತಿರುಗಿಸಬಹುದಾಗಿದ್ದು, ಅದಕ್ಕೆ ಒಟ್ಟು 24 ಆವರ್ತನೀಯ ಸಮ್ಮಿತಿಗಳಿರುತ್ತವೆ (Rotational symmetries).
ಆದ್ದರಿಂದ ಪ್ರತ್ಯೇಕ ವಿಶಿಷ್ಟ ವಿಧಾನಗಳ ಸಂಖ್ಯೆ:
$= \frac{6!}{24} = \frac{720}{24} = 30$.
(ಪರ್ಯಾಯ ವಿಧಾನ: ಮೊದಲ ಬಣ್ಣವನ್ನು ತಳಭಾಗದ ಸಮತಲಕ್ಕೆ ನಿಗದಿಪಡಿಸಿ (1 ವಿಧ). ಅದಕ್ಕೆ ಎದುರಾಗಿರುವ ಮೇಲ್ಭಾಗದ ಸಮತಲಕ್ಕೆ ಉಳಿದ 5 ಬಣ್ಣಗಳಲ್ಲಿ ಒಂದನ್ನು 5 ವಿಧಗಳಲ್ಲಿ ಆರಿಸಬಹುದು. ಉಳಿದ 4 ಪಾರ್ಶ್ವ ಮುಖಗಳಿಗೆ ವೃತ್ತಾಕಾರದ ಕ್ರಮಯೋಜನೆ ನಿಯಮದಂತೆ $(4-1)! = 3! = 6$ ರೀತಿಯಲ್ಲಿ ಬಣ್ಣ ಹಚ್ಚಬಹುದು. ಒಟ್ಟು ವಿಧಾನಗಳು $= 5 \times 6 = 30$).', NULL, NULL),
    ('pc-nhk-2026-q39', 39, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Logical Reasoning & Geometric Pattern Missing Number Puzzles', 'ತಾರ್ಕಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ರೇಖಾಗಣಿತದ ಮಾದರಿಯ ಒಗಟುಗಳು', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'Find the missing number :', 'ಬಿಟ್ಟು ಹೋಗಿರುವ ಸಂಖ್ಯೆಯನ್ನು ಕಂಡುಹಿಡಿಯಿರಿ :', '54', '40', '45', '72', '54', '40', '45', '72', '2', 'Correct Answer: (2)

The numbers in each column follow the mathematical rule:
$$\text{Row 3} = \text{Row 2} \times (\text{Row 1} - 2)$$

• Column 1: $\text{Row 1} = 6, \text{Row 2} = 4$
  $\text{Row 3} = 4 \times (6 - 2) = 4 \times 4 = 16$ (Matches)

• Column 2: $\text{Row 1} = 9, \text{Row 2} = 8$
  $\text{Row 3} = 8 \times (9 - 2) = 8 \times 7 = 56$ (Matches)

• Column 3: $\text{Row 1} = 10, \text{Row 2} = 5$
  $\text{Row 3} = 5 \times (10 - 2) = 5 \times 8 = 40$

Thus, the missing value is 40.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಪ್ರತಿ ಕಾಲಮ್‌ನಲ್ಲಿರುವ ಸಂಖ್ಯೆಗಳು ಈ ಕೆಳಗಿನ ನಿಯಮವನ್ನು ಅನುಸರಿಸುತ್ತವೆ:
$$3\text{ನೇ ಸಾಲು} = 2\text{ನೇ ಸಾಲು} \times (1\text{ನೇ ಸಾಲು} - 2)$$

• 1ನೇ ಕಾಲಮ್: $4 \times (6 - 2) = 4 \times 4 = 16$
• 2ನೇ ಕಾಲಮ್: $8 \times (9 - 2) = 8 \times 7 = 56$
• 3ನೇ ಕಾಲಮ್: $5 \times (10 - 2) = 5 \times 8 = 40$

ಆದ್ದರಿಂದ ಬಿಟ್ಟುಹೋದ ಸ್ಥಾನದಲ್ಲಿ ಬರಬೇಕಾದ ಸಂಖ್ಯೆ 40 ಆಗಿದೆ.', NULL, '{"rows": [[6, 9, 10], [4, 8, 5], [16, 56, null]], "missing_position": "row 3, column 3"}'::JSONB),
    ('pc-nhk-2026-q40', 40, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Calendar Reasoning & Periodic Repetition of Normal/Leap Year Calendars', 'ಕ್ಯಾಲೆಂಡರ್ ತಾರ್ಕಿಕತೆ ಮತ್ತು ವರ್ಷಗಳ ಕ್ಯಾಲೆಂಡರ್ ಪುನರಾವರ್ತನೆ', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'The calendar for the year 2026 will be the same as that of the year :', '2026 ರ ಕ್ಯಾಲೆಂಡರ್‌ಗೆ ಸಮನಾಗಿರುವ ಕ್ಯಾಲೆಂಡರ್ ಹೊಂದಿರುವ ವರ್ಷ', '2032', '2029', '2037', '2030', '2032', '2029', '2037', '2030', '3', 'Correct Answer: (3)

In the Gregorian calendar, ordinary years that fall two years after a leap year (such as 2026, which follows leap year 2024 by 2 years) repeat their calendar after 11 years:
$2026 + 11 = 2037$.

Verification via odd days calculation from 2026 to 2036:
• 2026 (Ordinary): 1 odd day
• 2027 (Ordinary): 1 odd day
• 2028 (Leap): 2 odd days
• 2029 (Ordinary): 1 odd day
• 2030 (Ordinary): 1 odd day
• 2031 (Ordinary): 1 odd day
• 2032 (Leap): 2 odd days
• 2033 (Ordinary): 1 odd day
• 2034 (Ordinary): 1 odd day
• 2035 (Ordinary): 1 odd day
• 2036 (Leap): 2 odd days
Total odd days $= 1 + 1 + 2 + 1 + 1 + 1 + 2 + 1 + 1 + 1 + 2 = 14$ days.
Since $14 \div 7 = 2$ with a remainder of 0, the year 2037 begins on the exact same weekday as 2026, and because both 2026 and 2037 are ordinary (non-leap) years of 365 days, their calendars are entirely identical.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ಗ್ರಿಗೋರಿಯನ್ ಕ್ಯಾಲೆಂಡರ್ ನಿಯಮದ ಪ್ರಕಾರ, ಅಧಿಕ ವರ್ಷದ ನಂತರ ಬರುವ ಎರಡನೇ ಸಾಮಾನ್ಯ ವರ್ಷದ ಕ್ಯಾಲೆಂಡರ್ 11 ವರ್ಷಗಳ ನಂತರ ಪುನರಾವರ್ತನೆಯಾಗುತ್ತದೆ (2024 ಅಧಿಕ ವರ್ಷವಾಗಿದ್ದು, 2026 ಸಾಮಾನ್ಯ ವರ್ಷವಾಗಿದೆ):
$2026 + 11 = 2037$.

ಹೆಚ್ಚುವರಿ ದಿನಗಳ (Odd days) ಲೆಕ್ಕಾಚಾರ:
2026 ರಿಂದ 2036 ರವರೆಗಿನ ಹೆಚ್ಚುವರಿ ದಿನಗಳು:
$1 + 1 + 2 (ಅಧಿಕ ವರ್ಷ 2028) + 1 + 1 + 1 + 2 (ಅಧಿಕ ವರ್ಷ 2032) + 1 + 1 + 1 + 2 (ಅಧಿಕ ವರ್ಷ 2036) = 14$ ದಿನಗಳು.
14 ನ್ನು 7 ರಿಂದ ಭಾಗಿಸಿದಾಗ ಶೇಷ 0 ಬರುತ್ತದೆ. ಆದ್ದರಿಂದ 2026 ಮತ್ತು 2037 ಎರಡೂ ಸಾಮಾನ್ಯ ವರ್ಷಗಳಾಗಿದ್ದು (365 ದಿನಗಳು), ಒಂದೇ ದಿನದಿಂದ ಆರಂಭವಾಗಿ ಸಂಪೂರ್ಣವಾಗಿ ಒಂದೇ ರೀತಿಯ ಕ್ಯಾಲೆಂಡರ್ ಹೊಂದಿರುತ್ತವೆ.', NULL, NULL),
    ('pc-nhk-2026-q41', 41, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Speed, Distance and Time Unit Conversion (m/s to km/hr)', 'ವೇಗ, ದೂರ ಮತ್ತು ಸಮಯದ ಪರಿವರ್ತನೆ (ಮೀ/ಸೆಕೆಂಡ್‌ ನಿಂದ ಕಿಮೀ/ಗಂಟೆಗೆ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'If a car goes 25 metres in a second, then its speed in km/hr is', 'ಒಂದು ಕಾರು ಪ್ರತಿ ಸೆಕೆಂಡಿಗೆ 25 ಮೀಟರ್ ಚಲಿಸಿದರೆ ಅದರ ವೇಗ ಕಿಲೋಮೀಟರ್/ಗಂಟೆ (km/hr.) ಗಳಲ್ಲಿ ಎಷ್ಟು ?', '60', '90', '80', '72', '60', '90', '80', '72', '2', 'Correct Answer: (2)

To convert speed from metres per second (m/s) to kilometres per hour (km/hr), multiply by $\frac{18}{5}$:
$$\text{Speed in km/hr} = \text{Speed in m/s} \times \frac{18}{5}$$
Given speed $= 25\text{ m/s}$:
$$\text{Speed} = 25 \times \frac{18}{5} = 5 \times 18 = 90\text{ km/hr}$$
Therefore, the car''s speed is 90 km/hr.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವೇಗವನ್ನು ಮೀಟರ್/ಸೆಕೆಂಡ್‌ನಿಂದ ಕಿಲೋಮೀಟರ್/ಗಂಟೆಗೆ (km/hr) ಪರಿವರ್ತಿಸಲು $\frac{18}{5}$ ರಿಂದ ಗುಣಿಸಬೇಕು:
$$\text{ವೇಗ (km/hr)} = 25 \times \frac{18}{5} = 5 \times 18 = 90\text{ km/hr}$$
ಆದ್ದರಿಂದ ಕಾರಿನ ವೇಗ ಗಂಟೆಗೆ 90 ಕಿಲೋಮೀಟರ್ ಆಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q42', 42, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'Quantitative Aptitude & Basic Numeracy', 'ಪರಿಮಾಣಾತ್ಮಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ಮೂಲ ಸಂಖ್ಯಾಶಾಸ್ತ್ರ', 'Algebraic Fractions & Cross-Multiplication Linear Equations', 'ಬೀಜಗಣಿತೀಯ ಭಿನ್ನರಾಶಿಗಳು ಮತ್ತು ಸರಳ ರೇಖೀಯ ಸಮೀಕರಣ ಪರಿಹಾರ', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], '', '', 'Find the value of x in the following equation :

4½ + 3⅙ + x + 2⅓ = 13⅖', 'ಈ ಕೆಳಗಿನ ಸಮೀಕರಣದಲ್ಲಿ x ನ ಬೆಲೆ ಕಂಡುಹಿಡಿಯಿರಿ.

4½ + 3⅙ + x + 2⅓ = 13⅖', '7¾', '5½', '1¾', '3⅖', '7¾', '5½', '1¾', '3⅖', '4', 'Correct Answer: (4)

Separate the whole numbers and fractional parts on the left side:
$$4\frac{1}{2} + 3\frac{1}{6} + 2\frac{1}{3} = (4 + 3 + 2) + \left(\frac{1}{2} + \frac{1}{6} + \frac{1}{3}\right)$$
$$= 9 + \left(\frac{3 + 1 + 2}{6}\right) = 9 + \frac{6}{6} = 9 + 1 = 10$$

Now substitute back into the equation:
$$10 + x = 13\frac{2}{5}$$
$$x = 13\frac{2}{5} - 10 = 3\frac{2}{5}$$
Therefore, the value of $x$ is $3\frac{2}{5}$.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಎಡಭಾಗದಲ್ಲಿರುವ ಮಿಶ್ರ ಭಿನ್ನರಾಶಿಗಳ ಪೂರ್ಣಾಂಕ ಮತ್ತು ಭಿನ್ನರಾಶಿ ಭಾಗಗಳನ್ನು ಪ್ರತ್ಯೇಕಿಸಿ ಕೂಡಿಸಿದಾಗ:
$$4\frac{1}{2} + 3\frac{1}{6} + 2\frac{1}{3} = (4 + 3 + 2) + \left(\frac{1}{2} + \frac{1}{6} + \frac{1}{3}\right)$$
$$= 9 + \left(\frac{3 + 1 + 2}{6}\right) = 9 + \frac{6}{6} = 9 + 1 = 10$$

ಸಮೀಕರಣದಲ್ಲಿ ಆದೇಶಿಸಿದಾಗ:
$$10 + x = 13\frac{2}{5}$$
$$x = 13\frac{2}{5} - 10 = 3\frac{2}{5}$$
ಆದ್ದರಿಂದ $x$ ನ ಬೆಲೆ $3\frac{2}{5}$ ಆಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q43', 43, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Logical Venn Diagrams & Set Inclusion/Exclusion (Painter, Singer, Dancer)', 'ತಾರ್ಕಿಕ ವೆನ್ ರೇಖಾಚಿತ್ರಗಳು ಮತ್ತು ಗಣಗಳ ವಿಶ್ಲೇಷಣೆ (ಚಿತ್ರಕಾರ, ಗಾಯಕ, ನರ್ತಕ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], 'Directions: In the figure given below, there are three intersecting circles, each representing certain section of people (Circle A represents Singer, Circle B represents Painter, and Circle C represents Dancer). Different regions are marked a-g.', 'ನಿರ್ದೇಶನಗಳು : ಕೆಳಗಿನ ಚಿತ್ರದಲ್ಲಿ ಮೂರು ಪರಸ್ಪರ ಛೇದಿಸುವ ವೃತ್ತಗಳಿವೆ, ಪ್ರತಿಯೊಂದೂ ನಿರ್ದಿಷ್ಟ ಜನರ ಗುಂಪನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ (A-ಗಾಯಕ, B-ವರ್ಣಚಿತ್ರಕಾರ, C-ನೃತ್ಯಪಟು). ವಿಭಿನ್ನ ಪ್ರದೇಶಗಳನ್ನು a-g ಎಂದು ಗುರುತಿಸಲಾಗಿದೆ.', 'Painter who is neither a Singer nor a Dancer :', 'ಗಾಯಕರೂ ಅಲ್ಲದ, ನೃತ್ಯಪಟುವೂ ಅಲ್ಲದ ವರ್ಣಚಿತ್ರಕಾರರು ಯಾರು ?', 'b', 'g', 'f', 'c', 'b', 'g', 'f', 'c', '3', 'Correct Answer: (3)

In the three-circle Venn diagram:
• Circle A = Singers
• Circle B = Painters
• Circle C = Dancers

The question asks for a ''Painter who is neither a Singer nor a Dancer''. This refers to the region exclusive to Circle B alone, subtracting Circles A and C, denoted set-theoretically as B \ (A ∪ C). In the diagram, this corresponds to region ''f''.
In the question booklet, ''f'' is given in Option (3).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ವೆನ್ ಚಿತ್ರದಲ್ಲಿ:
• ವೃತ್ತ A = ಗಾಯಕರು
• ವೃತ್ತ B = ವರ್ಣಚಿತ್ರಕಾರರು
• ವೃತ್ತ C = ನೃತ್ಯಪಟುಗಳು

ಪ್ರಶ್ನೆಯು ''ಗಾಯಕರೂ ಅಲ್ಲದ, ನೃತ್ಯಪಟುವೂ ಅಲ್ಲದ ವರ್ಣಚಿತ್ರಕಾರರು'' ಯಾರೆಂದು ಕೇಳಿದೆ. ಇದು ಕೇವಲ ವೃತ್ತ B ಗೆ ಮಾತ್ರ ಸೀಮಿತವಾಗಿದ್ದು, ವೃತ್ತ A ಮತ್ತು C ಗಳ ಹೊರಗಿರುವ ಪ್ರದೇಶವಾದ ''f'' ಅನ್ನು ಸೂಚಿಸುತ್ತದೆ.
ಪ್ರಶ್ನೆಪತ್ರಿಕೆಯ ಆಯ್ಕೆಗಳ ಪ್ರಕಾರ ''f'' ಆಯ್ಕೆ (3) ರಲ್ಲಿದೆ.', 'PLACEHOLDER_VENN_DIAGRAM', NULL),
    ('pc-nhk-2026-q44', 44, 2026, 'September', 1, 'nhk', 'ksp-pc', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ, ಪರಿಮಾಣಾತ್ಮಕ ಅಭಿರುಚಿ ಮತ್ತು ಗ್ರಹಿಕೆ', 'General Mental Ability & Logical Reasoning', 'ಸಾಮಾನ್ಯ ಮಾನಸಿಕ ಸಾಮರ್ಥ್ಯ ಮತ್ತು ತಾರ್ಕಿಕ ಚಿಂತನೆ', 'Logical Venn Diagrams & Intersection Regions of Three Categories', 'ವೆನ್ ರೇಖಾಚಿತ್ರಗಳು ಮತ್ತು ಮೂರು ವರ್ಗಗಳ ಛೇದನ ಪ್ರದೇಶ ಗುರುತಿಸುವಿಕೆ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Mental Ability', 'General Mental Ability, Quantitative Aptitude & Comprehension']::TEXT[], 'Directions: In the figure given below, there are three intersecting circles, each representing certain section of people (Circle A represents Singer, Circle B represents Painter, and Circle C represents Dancer). Different regions are marked a-g.', 'ನಿರ್ದೇಶನಗಳು : ಕೆಳಗಿನ ಚಿತ್ರದಲ್ಲಿ ಮೂರು ಪರಸ್ಪರ ಛೇದಿಸುವ ವೃತ್ತಗಳಿವೆ, ಪ್ರತಿಯೊಂದೂ ನಿರ್ದಿಷ್ಟ ಜನರ ಗುಂಪನ್ನು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ (A-ಗಾಯಕ, B-ವರ್ಣಚಿತ್ರಕಾರ, C-ನೃತ್ಯಪಟು). ವಿಭಿನ್ನ ಪ್ರದೇಶಗಳನ್ನು a-g ಎಂದು ಗುರುತಿಸಲಾಗಿದೆ.', 'Singer who is a Painter but not a Dancer :', 'ವರ್ಣಚಿತ್ರಕಾರ ಮತ್ತು ಗಾಯಕರಾಗಿದ್ದು, ನೃತ್ಯಪಟು ಅಲ್ಲದವರು ಯಾರು ?', 'g', 'b', 'c', 'd', 'g', 'b', 'c', 'd', '2', 'Correct Answer: (2)

In the three-circle Venn diagram:
• Circle A = Singers
• Circle B = Painters
• Circle C = Dancers

The condition ''Singer who is a Painter but not a Dancer'' requires the intersection of Circle A and Circle B, while strictly excluding Circle C, denoted set-theoretically as (A ∩ B) \ C. The region fulfilling this condition is ''b''.
In the question booklet, ''b'' is given in Option (2).', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ವೆನ್ ಚಿತ್ರದಲ್ಲಿ:
• ವೃತ್ತ A = ಗಾಯಕರು
• ವೃತ್ತ B = ವರ್ಣಚಿತ್ರಕಾರರು
• ವೃತ್ತ C = ನೃತ್ಯಪಟುಗಳು

''ವರ್ಣಚಿತ್ರಕಾರ ಮತ್ತು ಗಾಯಕರಾಗಿದ್ದು, ನೃತ್ಯಪಟು ಅಲ್ಲದವರು'' ಎಂದರೆ ವೃತ್ತ A ಮತ್ತು B ಗಳ ಛೇದನವಾಗಿದ್ದು, ವೃತ್ತ C ಯ ಹೊರಗಿರುವ ಪ್ರದೇಶವಾಗಿದೆ ((A ∩ B) \ C). ಈ ಭಾಗವನ್ನು ''b'' ಅಕ್ಷರವು ಪ್ರತಿನಿಧಿಸುತ್ತದೆ.
ಪ್ರಶ್ನೆಪತ್ರಿಕೆಯ ಆಯ್ಕೆಗಳ ಪ್ರಕಾರ ''b'' ಆಯ್ಕೆ (2) ರಲ್ಲಿದೆ.', 'PLACEHOLDER_VENN_DIAGRAM', NULL),
    ('pc-nhk-2026-q45', 45, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.nuclear_technology_energy.fundamental_particle_physics_research_facilities', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Nuclear Technology & Energy', 'ಪರಮಾಣು ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಇಂಧನ', 'Radioactivity & Historic Scientific Discoveries (Becquerel, Marie Curie, Fermi, Rutherford)', 'ವಿಕಿರಣಶೀಲತೆ ಮತ್ತು ಐತಿಹಾಸಿಕ ವೈಜ್ಞಾನಿಕ ಆವಿಷ್ಕಾರಗಳು (ಬೆಕ್ವೆರೆಲ್, ಮೇರಿ ಕ್ಯೂರಿ, ಫರ್ಮಿ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Nuclear Physics', 'Science, Technology & Defence']::TEXT[], '', '', 'Match the items in List-I with the items in List-II and choose the correct answer :

List-I
a. Uranium 235
b. Graphite
c. Cadmium
d. Plutonium

List-II
i. Moderator
ii. Control rod
iii. Transuranic element
iv. Fuel', 'ಪಟ್ಟಿ-I ರಲ್ಲಿರುವ ವಿಷಯಗಳನ್ನು ಪಟ್ಟಿ-II ರಲ್ಲಿರುವ ವಿಷಯಗಳೊಂದಿಗೆ ಹೊಂದಿಸಿ ಸರಿ ಉತ್ತರವನ್ನು ಆರಿಸಿ.

ಪಟ್ಟಿ-I
a. ಯುರೇನಿಯಂ 235 - i. ಮಂದಕಾರಿ (ಮಾಡರೇಟರ್)
b. ಕರಿಸೀಸ (ಗ್ರಾಫೈಟ್) - ii. ನಿಯಂತ್ರಣ ಸರಳು
c. ಕ್ಯಾಡ್ಮಿಯಂ - iii. ಟ್ರಾನ್ಸ್‌ಯುರೇನಿಕ್ ಧಾತು
d. ಪ್ಲುಟೋನಿಯಂ - iv. ಇಂಧನ', 'a-iv, b-i, c-ii, d-iii', 'a-ii, b-iii, c-iv, d-i', 'a-iii, b-iv, c-ii, d-i', 'a-iii, b-iv, c-i, d-ii', 'a-iv, b-i, c-ii, d-iii', 'a-ii, b-iii, c-iv, d-i', 'a-iii, b-iv, c-ii, d-i', 'a-iii, b-iv, c-i, d-ii', '1', 'Correct Answer: (1)

• Uranium-235 (U-235): Fissile isotope used as nuclear Fuel (iv) in thermal nuclear reactors.
• Graphite: Carbon allotrope used as a Moderator (i) to slow down fast fission neutrons to thermal energies without absorbing them.
• Cadmium: High neutron-absorption cross-section element used in Control rods (ii) to regulate or shut down the nuclear chain reaction.
• Plutonium (Pu, atomic number 94): Synthetic, artificially produced element with an atomic number greater than Uranium (92), categorizing it as a Transuranic element (iii).
Therefore, the correct sequence is a-iv, b-i, c-ii, d-iii.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• ಯುರೇನಿಯಂ 235 (a): ಪರಮಾಣು ರಿಯಾಕ್ಟರ್‌ಗಳಲ್ಲಿ ವಿದಳನ ಕ್ರಿಯೆಗೆ ಬಳಸಲಾಗುವ ಪ್ರಮುಖ ''ಇಂಧನ'' (Fuel - iv).
• ಗ್ರಾಫೈಟ್ / ಕರಿಸೀಸ (b): ವಿದಳನ ಕ್ರಿಯೆಯಲ್ಲಿ ಬಿಡುಗಡೆಯಾಗುವ ವೇಗದ ನ್ಯೂಟ್ರಾನ್‌ಗಳ ವೇಗವನ್ನು ತಗ್ಗಿಸಲು ಬಳಸುವ ''ಮಂದಕಾರಿ'' (ಮಾಡರೇಟರ್ - i).
• ಕ್ಯಾಡ್ಮಿಯಂ (c): ನ್ಯೂಟ್ರಾನ್‌ಗಳನ್ನು ಹೀರಿಕೊಂಡು ಸರಪಳಿ ಕ್ರಿಯೆಯನ್ನು ನಿಯಂತ್ರಿಸುವ ''ನಿಯಂತ್ರಣ ಸರಳು'' (Control rod - ii).
• ಪ್ಲುಟೋನಿಯಂ (d): ಯುರೇನಿಯಂ (ಪರಮಾಣು ಸಂಖ್ಯೆ 92) ಗಿಂತ ಹೆಚ್ಚಿನ ಪರಮಾಣು ಸಂಖ್ಯೆಯನ್ನು ಹೊಂದಿರುವ ಮಾನವ ನಿರ್ಮಿತ ''ಟ್ರಾನ್ಸ್‌ಯುರೇನಿಕ್ ಧಾತು'' (iii).
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: a-iv, b-i, c-ii, d-iii.', NULL, NULL),
    ('pc-nhk-2026-q46', 46, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Space Technology & Astronomy', 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ', 'Mars Orbiter Mission (MOM / Mangalyaan) & ISRO Interplanetary Exploration', 'ಮಂಗಳಯಾನ (MOM) ಮತ್ತು ಇಸ್ರೋದ ಅಂತರಗ್ರಹ ಪರಿಶೋಧನೆ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Space Technology', 'Science, Technology & Defence']::TEXT[], '', '', 'The first Asian country to send space mission (Mars Orbiter Mission) to the planet Mars as a part of its interplanetary project is :', 'ಅಂತರ್‌ಗ್ರಹ ಯೋಜನೆಯ ಭಾಗವಾಗಿ ಮಂಗಳ ಗ್ರಹಕ್ಕೆ ಬಾಹ್ಯಾಕಾಶ ಮಿಷನ್‌ (Mars Orbiter Mission) ಅನ್ನು ಕಳುಹಿಸಿದ ಏಷ್ಯಾ ಖಂಡದ ಮೊದಲ ರಾಷ್ಟ್ರ:', 'Japan', 'China', 'Singapore', 'India', 'ಜಪಾನ್', 'ಚೀನಾ', 'ಸಿಂಗಾಪುರ', 'ಭಾರತ', '4', 'Correct Answer: (4)

India, through the Indian Space Research Organisation (ISRO), became the first Asian nation to successfully reach Martian orbit and the first country in the world to do so on its maiden attempt. The Mars Orbiter Mission (MOM), unofficially dubbed ''Mangalyaan'', was launched on 5 November 2013 aboard PSLV-C25 and entered Martian orbit on 24 September 2014, placing India among an elite group alongside the Soviet Union, NASA, and ESA.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಭಾರತೀಯ ಬಾಹ್ಯಾಕಾಶ ಸಂಶೋಧನಾ ಸಂಸ್ಥೆಯು (ISRO) ''ಮಂಗಳಯಾನ'' (Mars Orbiter Mission - MOM) ಉಪಗ್ರಹವನ್ನು 2013 ರ ನವೆಂಬರ್ 5 ರಂದು ಉಡಾವಣೆ ಮಾಡಿ, 2014 ರ ಸೆಪ್ಟೆಂಬರ್ 24 ರಂದು ಮಂಗಳ ಗ್ರಹದ ಕಕ್ಷೆಗೆ ಯಶಸ್ವಿಯಾಗಿ ಸೇರಿಸಿತು. ಈ ಮೂಲಕ ಮಂಗಳ ಗ್ರಹವನ್ನು ತಲುಪಿದ ಏಷ್ಯಾ ಖಂಡದ ಮೊಟ್ಟಮೊದಲ ರಾಷ್ಟ್ರ ಹಾಗೂ ತನ್ನ ಮೊದಲ ಪ್ರಯತ್ನದಲ್ಲೇ ಯಶಸ್ಸು ಕಂಡ ವಿಶ್ವದ ಮೊದಲ ರಾಷ್ಟ್ರ ಎಂಬ ಐತಿಹಾಸಿಕ ಹೆಗ್ಗಳಿಕೆಗೆ ಭಾರತ ಪಾತ್ರವಾಯಿತು.', NULL, NULL),
    ('pc-nhk-2026-q47', 47, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.space_technology_astronomy.orbits_satellite_navigation_applications', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Space Technology & Astronomy', 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ', 'Geostationary Communication Satellites & Direct-To-Home (DTH) Broadcasting', 'ಭೂಸ್ಥಿರ ಸಂವಹನ ಉಪಗ್ರಹಗಳು ಮತ್ತು ಡಿಟಿಎಚ್ (DTH) ಪ್ರಸಾರ ವ್ಯವಸ್ಥೆ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Space Technology', 'Science, Technology & Defence']::TEXT[], '', '', 'DTH (Direct To Home) receives signals from :', 'ಡಿಟಿಹೆಚ್ (ಡೈರೆಕ್ಟ್ ಟು ಹೋಮ್) ಯಾವುದರಿಂದ ಸಂಜ್ಞೆಗಳನ್ನು ಪಡೆಯುತ್ತದೆ ?', 'Astronomical Satellite', 'Polar Satellite', 'Geostationary Satellite', 'Navigation Satellite', 'ಖಗೋಳ ಉಪಗ್ರಹ', 'ಧ್ರುವೀಯ ಉಪಗ್ರಹ', 'ಭೂ ಸ್ಥಿರ ಉಪಗ್ರಹ', 'ದಿಕ್ಕೂಚಕ (ನ್ಯಾವಿಗೇಶನ್) ಉಪಗ್ರಹ', '3', 'Correct Answer: (3)

Direct-To-Home (DTH) satellite television operates by receiving microwave Ku-band or C-band broadcast signals directly from Geostationary Communication Satellites (such as GSAT and INSAT series). These satellites are placed in a geostationary orbit (~35,786 km above the equator), having an orbital period of exactly 24 hours matching Earth''s rotation, which keeps them permanently stationary relative to a fixed ground dish antenna.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ಡಿಟಿಹೆಚ್ (Direct To Home) ತಂತ್ರಜ್ಞಾನವು ಮನೆಗಳ ಮೇಲಿರುವ ಸಣ್ಣ ಡಿಶ್ ಆಂಟೆನಾಗಳ ಮೂಲಕ ನೇರವಾಗಿ ''ಭೂ ಸ್ಥಿರ ಉಪಗ್ರಹ''ಗಳಿಂದ (Geostationary Satellites - ಇನ್ಸಾಟ್ ಮತ್ತು ಜಿಸ್ಯಾಟ್ ಸರಣಿ) ಸಂಕೇತಗಳನ್ನು ಪಡೆಯುತ್ತದೆ. ಈ ಉಪಗ್ರಹಗಳು ಭೂಮಿಯ ಸಮಭಾಜಕ ವೃತ್ತದಿಂದ ಸುಮಾರು 35,786 ಕಿ.ಮೀ ಎತ್ತರದಲ್ಲಿದ್ದು, ಭೂಮಿಯ ಪರಿಭ್ರಮಣೆಯ ವೇಗದಲ್ಲೇ (24 ಗಂಟೆಗಳು) ಸುತ್ತುವುದರಿಂದ ಭೂಮಿಯ ಮೇಲಿನ ಆಂಟೆನಾಗಳಿಗೆ ಸ್ಥಿರವಾಗಿ ಕಾಣಿಸುತ್ತವೆ ಮತ್ತು ನಿರಂತರ ಪ್ರಸಾರ ನೀಡುತ್ತವೆ.', NULL, NULL),
    ('pc-nhk-2026-q48', 48, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_physics', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Medical Imaging Technology & Nuclear Magnetic Resonance (MRI Dynamics)', 'ವೈದ್ಯಕೀಯ ಇಮೇಜಿಂಗ್ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಎಂಆರ್‌ಐ (ಮ್ಯಾಗ್ನೆಟಿಕ್ ರೆಸೋನೆನ್ಸ್ ಇಮೇಜಿಂಗ್)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Physics', 'Science, Technology & Defence']::TEXT[], '', '', 'Magnetic Resonance Imaging (MRI) is used to obtain images of internal organs by using', 'ಕಾಂತೀಯ ಅನುರಣನ ಪ್ರತಿಬಿಂಬ (MRI) ದ ಮೂಲಕ ದೇಹದ ಆಂತರಿಕ ಅವಯವಗಳ ಚಿತ್ರಗಳನ್ನು ಪಡೆಯಲು ಯಾವುದನ್ನು ಬಳಸಲಾಗುತ್ತದೆ ?', 'LASER', 'X-Ray', 'Magnetic signals inside human body', 'Electric signals inside human body', 'ಲೇಸರ್', 'ಕ್ಷ-ಕಿರಣ', 'ಮಾನವನ ದೇಹದಲ್ಲಿರುವ ಕಾಂತೀಯ ಸಂಕೇತಗಳು', 'ಮಾನವನ ದೇಹದಲ್ಲಿರುವ ವಿದ್ಯುತ್ ಸಂಕೇತಗಳು', '3', 'Correct Answer: (3)

According to NCERT Class 10 Science (''Magnetic Effects of Electric Current''), human nerve cells and soft tissues naturally generate minute magnetic fields (primarily due to ionic currents in the heart and brain). Magnetic Resonance Imaging (MRI) utilizes strong external superconducting magnetic fields and radiofrequency pulses to align and perturb the nuclear magnetic spins of hydrogen protons in body water and fats. The resulting microscopic magnetic signals emitted from within the human body are captured and mapped into high-resolution cross-sectional anatomical images.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

NCERT 10ನೇ ತರಗತಿ ವಿಜ್ಞಾನ ಪಠ್ಯಪುಸ್ತಕದ ಪ್ರಕಾರ (''ವಿದ್ಯುತ್ ಪ್ರವಾಹದ ಕಾಂತೀಯ ಪರಿಣಾಮಗಳು''), ಮಾನವನ ದೇಹದಲ್ಲಿ ನರಕೋಶಗಳ ಅಯಾನು ಪ್ರವಾಹದಿಂದಾಗಿ ಸೂಕ್ಷ್ಮ ಕಾಂತಕ್ಷೇತ್ರವು ಸ್ವಾಭಾವಿಕವಾಗಿ ಉಂಟಾಗುತ್ತದೆ (ವಿಶೇಷವಾಗಿ ಮೆದುಳು ಮತ್ತು ಹೃದಯದಲ್ಲಿ). MRI (Magnetic Resonance Imaging) ತಂತ್ರಜ್ಞಾನವು ದೇಹದಲ್ಲಿರುವ ನೀರಿನಲ್ಲಿನ ಹೈಡ್ರೋಜನ್ ಪರಮಾಣುಗಳ ಕಾಂತೀಯ ಗುಣವನ್ನು ಪ್ರಚೋದಿಸಿ, ''ಮಾನವನ ದೇಹದಲ್ಲಿರುವ ಕಾಂತೀಯ ಸಂಕೇತಗಳನ್ನು'' (Magnetic signals) ಗ್ರಹಿಸಿ ಆಂತರಿಕ ಅಂಗಾಂಗಗಳ ಸ್ಪಷ್ಟ 3D ಚಿತ್ರಗಳನ್ನು ಪಡೆಯಲು ಬಳಸಲಾಗುತ್ತದೆ (ಇಲ್ಲಿ ಕ್ಷ-ಕಿರಣ ಅಥವಾ ಹಾನಿಕಾರಕ ವಿಕಿರಣಗಳನ್ನು ಬಳಸುವುದಿಲ್ಲ).', NULL, NULL),
    ('pc-nhk-2026-q49', 49, 2026, 'September', 1, 'nhk', 'ksp-pc', 'geography_earth_systems.physical_geography_earth_systems.earths_origin_internal_structure.earths_internal_layers_crust_mantle_core', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Physical Geography & Earth Systems (Geomorphology)', 'ಭೌತಿಕ ಭೂಗೋಳಶಾಸ್ತ್ರ ಮತ್ತು ಭೂರೂಪಶಾಸ್ತ್ರ', 'Earth''s Interior & Geodynamo Theory of Geomagnetism in Liquid Outer Core', 'ಭೂಮಿಯ ಆಂತರಿಕ ರಚನೆ ಮತ್ತು ಹೊರಗರ್ಭದಲ್ಲಿ ಕಾಂತೀಯತೆಯ ಉತ್ಪತ್ತಿ (ಜಿಯೋಡೈನಮೊ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Geophysics', 'Geography & Earth Systems']::TEXT[], '', '', 'Earth''s magnetism is due to :', 'ಭೂಮಿಯ ಕಾಂತತ್ವಗುಣವು ಯಾವುದರಿಂದ ಉಂಟಾಗುತ್ತದೆ ?', 'Solar Effect', 'Dynamo Effect', 'Magnus Effect', 'Doppler Effect', 'ಸೋಲಾರ್ ಪರಿಣಾಮ', 'ಡೈನಮೋ ಪರಿಣಾಮ', 'ಮ್ಯಾಗ್ನಸ್ ಪರಿಣಾಮ', 'ಡಾಪ್ಲರ್ ಪರಿಣಾಮ', '2', 'Correct Answer: (2)

Earth''s geomagnetic field is generated and sustained by the Geodynamo Effect. In Earth''s outer core (located between 2,890 km and 5,150 km depth), convection currents of molten iron and nickel, driven by heat escape from the inner core and helical motion induced by the Coriolis force of Earth''s rotation, generate electric currents. In accordance with Ampere''s Law, these large-scale circulating electrical currents produce and sustain Earth''s dipolar magnetic field.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಭೂಮಿಯ ಕಾಂತತ್ವವು ''ಡೈನಮೋ ಪರಿಣಾಮ''ದಿಂದ (Geodynamo Effect) ಉಂಟಾಗುತ್ತದೆ. ಭೂಮಿಯ ಹೊರಗರ್ಭದಲ್ಲಿರುವ (Outer Core) ಕರಗಿದ ದ್ರವರೂಪದ ಕಬ್ಬಿಣ ಮತ್ತು ನಿಕಲ್ ಲೋಹಗಳು, ಭೂಮಿಯ ದೈನಂದಿನ ಭ್ರಮಣೆಯಿಂದ ಉಂಟಾಗುವ ಕೊರಿಯಾಲಿಸ್ ಬಲ ಮತ್ತು ಉಷ್ಣ ಸಂವಹನ ಪ್ರವಾಹಗಳಿಂದಾಗಿ ನಿರಂತರವಾಗಿ ಚಲಿಸುತ್ತವೆ. ಈ ದ್ರವ ಲೋಹಗಳ ಚಲನೆಯು ಬೃಹತ್ ವಿದ್ಯುತ್ ಪ್ರವಾಹವನ್ನು ಉಂಟುಮಾಡುತ್ತದೆ, ಇದು ಆಂಪೇರ್ ನಿಯಮದಂತೆ ಭೂಮಿಯ ಸುತ್ತ ಶಕ್ತಿಯುತ ಕಾಂತಕ್ಷೇತ್ರವನ್ನು ನಿರ್ಮಿಸುತ್ತದೆ.', NULL, NULL),
    ('pc-nhk-2026-q50', 50, 2026, 'September', 1, 'nhk', 'ksp-pc', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Environmental Pollution, Waste Management & Remediation', 'ಪರಿಸರ ಮಾಲಿನ್ಯ, ತ್ಯಾಜ್ಯ ನಿರ್ವಹಣೆ ಮತ್ತು ಪರಿಹಾರೋಪಾಯಗಳು', 'Industrial Air Pollution Control Equipment & Electrostatic Precipitators (ESP)', 'ಕೈಗಾರಿಕಾ ವಾಯು ಮಾಲಿನ್ಯ ನಿಯಂತ್ರಣ ಉಪಕರಣಗಳು ಮತ್ತು ಎಲೆಕ್ಟ್ರೋಸ್ಟಾಟಿಕ್ ಪ್ರೆಸಿಪಿಟೇಟರ್‌ಗಳು (ESP)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Environment', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'The device commonly used in thermal power plants and industries to remove particulate matter from exhaust gases :', 'ಉಷ್ಣ ವಿದ್ಯುತ್ ಸ್ಥಾವರಗಳು ಮತ್ತು ಕೈಗಾರಿಕೆಗಳಲ್ಲಿ ಹೊರಹೋಗುವ ಅನಿಲಗಳಿಂದ ಕಣರೂಪದ ವಸ್ತುಗಳನ್ನು ತೆಗೆದುಹಾಕಲು ಯಾವ ಸಾಧನವನ್ನು ಸಾಮಾನ್ಯವಾಗಿ ಬಳಸಲಾಗುತ್ತದೆ ?', 'Exhaust Fans', 'Absorption Towers', 'Electrostatic Precipitator', 'Catalytic Converter', 'ನಿಷ್ಕಾಸ ಫ್ಯಾನ್‌ಗಳು', 'ಹೀರಿಕೊಳ್ಳುವ ಗೋಪುರಗಳು', 'ಸ್ಥಾಯೀ ವಿದ್ಯುತ್ತಿನ ಅವಕ್ಷೇಪಕ', 'ಉತ್ಪ್ರೇರಕ ಪರಿವರ್ತಕ', '3', 'Correct Answer: (3)

According to NCERT Class 12 Biology (''Environmental Issues''), an Electrostatic Precipitator (ESP) is the most widely adopted pollution control equipment in coal-fired thermal power plants and heavy industries, capable of removing over 99% of particulate matter (fly ash and soot) present in flue exhaust gases. It operates by generating a high-voltage corona discharge that negatively charges dust particles, which are then attracted and deposited onto positively charged grounded collection plates.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

NCERT 12ನೇ ತರಗತಿಯ ಪರಿಸರ ವಿಜ್ಞಾನದ ಪ್ರಕಾರ, ಉಷ್ಣ ವಿದ್ಯುತ್ ಸ್ಥಾವರಗಳು ಮತ್ತು ಕಾರ್ಖಾನೆಗಳ ಚಿಮಣಿಗಳಿಂದ ಹೊರಬರುವ ಹೊಗೆಯಿಂದ 99% ಕ್ಕಿಂತ ಹೆಚ್ಚಿನ ಕಣರೂಪದ ಮಾಲಿನ್ಯಕಾರಕಗಳನ್ನು (ಧೂಳು ಮತ್ತು ಬೂದಿ) ತೆಗೆದುಹಾಕಲು ''ಸ್ಥಾಯೀ ವಿದ್ಯುತ್ತಿನ ಅವಕ್ಷೇಪಕ'' (Electrostatic Precipitator - ESP) ವನ್ನು ಬಳಸಲಾಗುತ್ತದೆ. ಇದು ಹೆಚ್ಚಿನ ವೋಲ್ಟೇಜ್ ವಿದ್ಯುತ್ ಬಳಸಿ ಧೂಳಿನ ಕಣಗಳಿಗೆ ಋಣಾತ್ಮಕ ಆವೇಶ ನೀಡಿ, ಧನಾತ್ಮಕ ಆವೇಶವುಳ್ಳ ಫಲಕಗಳ ಕಡೆಗೆ ಆಕರ್ಷಿಸಿ ಗಾಳಿಯನ್ನು ಶುದ್ಧೀಕರಿಸುತ್ತದೆ.', NULL, NULL)
ON CONFLICT (id) DO UPDATE SET
    node_id = EXCLUDED.node_id,
    subject = EXCLUDED.subject,
    subject_kannada = EXCLUDED.subject_kannada,
    domain = EXCLUDED.domain,
    domain_kannada = EXCLUDED.domain_kannada,
    sub_topic = EXCLUDED.sub_topic,
    sub_topic_kannada = EXCLUDED.sub_topic_kannada,
    difficulty = EXCLUDED.difficulty,
    tags = EXCLUDED.tags,
    question_english = EXCLUDED.question_english,
    question_kannada = EXCLUDED.question_kannada,
    option_1_english = EXCLUDED.option_1_english,
    option_2_english = EXCLUDED.option_2_english,
    option_3_english = EXCLUDED.option_3_english,
    option_4_english = EXCLUDED.option_4_english,
    option_1_kannada = EXCLUDED.option_1_kannada,
    option_2_kannada = EXCLUDED.option_2_kannada,
    option_3_kannada = EXCLUDED.option_3_kannada,
    option_4_kannada = EXCLUDED.option_4_kannada,
    key_answer = EXCLUDED.key_answer,
    explanation_english = EXCLUDED.explanation_english,
    explanation_kannada = EXCLUDED.explanation_kannada,
    image_url = EXCLUDED.image_url,
    table_data = EXCLUDED.table_data;

INSERT INTO public.pc_pyq (
    id, question_number, year, month, paper, paper_code, exam_id, node_id,
    subject, subject_kannada, domain, domain_kannada, sub_topic, sub_topic_kannada,
    difficulty, tags, passage_english, passage_kannada, question_english, question_kannada,
    option_1_english, option_2_english, option_3_english, option_4_english,
    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,
    key_answer, explanation_english, explanation_kannada, image_url, table_data
) VALUES
    ('pc-nhk-2026-q51', 51, 2026, 'September', 1, 'nhk', 'ksp-pc', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.ex-situ_conservation_botanical_science', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Biodiversity, Wildlife Conservation & Protected Areas', 'ಜೀವವೈವಿಧ್ಯ, ವನ್ಯಜೀವಿ ಸಂರಕ್ಷಣೆ ಮತ್ತು ಸಂರಕ್ಷಿತ ಪ್ರದೇಶಗಳು', 'Jawaharlal Nehru Tropical Botanic Garden and Research Institute (JNTBGRI / TBGRI Thiruvananthapuram)', 'ಉಷ್ಣವಲಯದ ಸಸ್ಯಶಾಸ್ತ್ರೀಯ ಉದ್ಯಾನವನ ಮತ್ತು ಸಂಶೋಧನಾ ಸಂಸ್ಥೆ (TBGRI ತಿರುವನಂತಪುರಂ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Institutions', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'Expand T.B.G.R.', 'ಟಿ.ಬಿ.ಜಿ.ಆರ್. (T.B.G.R.) ಅನ್ನು ವಿಸ್ತರಿಸಿ.', 'Tropical Botanical Genera and Research', 'Tropical Botanical Garden and Research', 'Tropical Botanical Genetics and Research', 'Temperate Biotechnology Garden and Research', 'ಟ್ರಾಪಿಕಲ್ ಬಾಟನಿಕಲ್ ಜೆನೇರಾ ಆ್ಯಂಡ್ ರಿಸರ್ಚ್', 'ಟ್ರಾಪಿಕಲ್ ಬಾಟನಿಕಲ್ ಗಾರ್ಡನ್ ಆ್ಯಂಡ್ ರಿಸರ್ಚ್', 'ಟ್ರಾಪಿಕಲ್ ಬಾಟನಿಕಲ್ ಜೆನೆಟಿಕ್ಸ್ ಆ್ಯಂಡ್ ರಿಸರ್ಚ್', 'ಟೆಂಪರೇಟ್ ಬಯೋಟೆಕ್ನಾಲಜಿ ಗಾರ್ಡನ್ ಆ್ಯಂಡ್ ರಿಸರ್ಚ್', '2', 'Correct Answer: (2)

T.B.G.R. stands for ''Tropical Botanical Garden and Research'' (commonly referring to the Jawaharlal Nehru Tropical Botanic Garden and Research Institute - JNTBGRI/TBGRI located at Palode near Thiruvananthapuram, Kerala). Established in 1979 under the Science and Technology Department of Kerala, it is the largest tropical botanical garden in Asia, maintaining an extensive ex-situ germplasm collection of tropical medicinal, aromatic, endemic, and threatened plant species.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಟಿ.ಬಿ.ಜಿ.ಆರ್. (T.B.G.R.) ಎಂದರೆ ''Tropical Botanical Garden and Research'' (ಟ್ರಾಪಿಕಲ್ ಬಾಟನಿಕಲ್ ಗಾರ್ಡನ್ ಆ್ಯಂಡ್ ರಿಸರ್ಚ್ - ಜವಾಹರಲಾಲ್ ನೆಹರು ಉಷ್ಣವಲಯದ ಸಸ್ಯಶಾಸ್ತ್ರೀಯ ಉದ್ಯಾನವನ ಮತ್ತು ಸಂಶೋಧನಾ ಸಂಸ್ಥೆ). ಕೇರಳದ ತಿರುವನಂತಪುರಂ ಬಳಿಯ ಪಾಲೋಡ್‌ನಲ್ಲಿ 1979 ರಲ್ಲಿ ಸ್ಥಾಪಿತವಾದ ಈ ಸಂಸ್ಥೆಯು ಏಷ್ಯಾದಲ್ಲೇ ಅತಿ ದೊಡ್ಡ ಉಷ್ಣವಲಯದ ಸಸ್ಯತೋಟಗಳಲ್ಲಿ ಒಂದಾಗಿದ್ದು, ಔಷಧೀಯ ಸಸ್ಯಗಳು, ಅಪರೂಪದ ಸಸ್ಯ ಪ್ರಭೇದಗಳ ಸಂರಕ್ಷಣೆ ಮತ್ತು ಜೈವಿಕ ಸಂಶೋಧನೆಯಲ್ಲಿ ತೊಡಗಿಸಿಕೊಂಡಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q52', 52, 2026, 'September', 1, 'nhk', 'ksp-pc', 'ethics_integrity_aptitude.probity_in_governance_public_service_values.concept_of_public_service_philosophical_basis_of_governance', 'Ethics, Integrity & Aptitude', 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ', 'Probity in Governance & Public Service Values', 'ಆಡಳಿತದಲ್ಲಿ ಪ್ರಾಮಾಣಿಕತೆ ಮತ್ತು ಸಾರ್ವಜನಿಕ ಸೇವಾ ಮೌಲ್ಯಗಳು', 'Foundational Pillars of Probity in Governance & Rule of Law', 'ಆಡಳಿತದಲ್ಲಿ ಪ್ರಾಮಾಣಿಕತೆಯ ಮೂಲ ಆಧಾರಸ್ತಂಭಗಳು ಮತ್ತು ಕಾನೂನಿನ ಆಡಳಿತ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Governance', 'Ethics, Integrity & Aptitude']::TEXT[], '', '', 'Identify the core pillars of "Probity in Governance".

(a) Authority
(b) Integrity
(c) Transparency
(d) Speed
(e) Accountability', '“ಆಡಳಿತದಲ್ಲಿ ಪ್ರಾಮಾಣಿಕತೆ” ಯ ಆಧಾರ ಸ್ತಂಭಗಳನ್ನು ಗುರುತಿಸಿ.

(a) ಅಧಿಕಾರ (ಅಥಾರಿಟಿ)
(b) ಸಮಗ್ರತೆ
(c) ಪಾರದರ್ಶಕತೆ
(d) ವೇಗ
(e) ಜವಾಬ್ದಾರಿ (ಅಕೌಂಟಬಿಲಿಟಿ)', '(a), (b) and (c)', '(b), (d) and (e)', '(a), (b), (c) and (e)', '(b), (c) and (e)', '(a), (b) ಮತ್ತು (c)', '(b), (d), ಮತ್ತು (e)', '(a), (b), (c) ಮತ್ತು (e)', '(b), (c) ಮತ್ತು (e)', '4', 'Correct Answer: (4)

According to administrative ethics and the Second Administrative Reforms Commission (2nd ARC - Report on Ethics in Governance), ''Probity in Governance'' signifies the presence of procedural integrity, moral rectitude, and incorruptibility in public administration. Its primary foundational pillars are:
• Integrity (b): Complete honesty and moral uprightness in official conduct.
• Transparency (c): Openness, accessibility of information, and adherence to objective rules.
• Accountability (e): Liability to answer for actions, decisions, and public expenditures.
''Authority'' and ''Speed'' are operational attributes rather than moral/ethical pillars of probity.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಎರಡನೇ ಆಡಳಿತ ಸುಧಾರಣಾ ಆಯೋಗ (2nd ARC) ಮತ್ತು ಸಾರ್ವಜನಿಕ ಆಡಳಿತ ನೀತಿಶಾಸ್ತ್ರದ ಪ್ರಕಾರ ''ಆಡಳಿತದಲ್ಲಿ ಪ್ರಾಮಾಣಿಕತೆ'' (Probity in Governance) ಕೇವಲ ಭ್ರಷ್ಟಾಚಾರ ರಹಿತವಾಗಿರುವುದನ್ನು ಮಾತ್ರವಲ್ಲದೆ, ನೈತಿಕ ಮೌಲ್ಯಗಳನ್ನು ಕಟ್ಟುನಿಟ್ಟಾಗಿ ಪಾಲಿಸುವುದನ್ನು ಸೂಚಿಸುತ್ತದೆ. ಇದರ ಪ್ರಮುಖ ಮೂರು ಆಧಾರ ಸ್ತಂಭಗಳೆಂದರೆ:
• ಸಮಗ್ರತೆ/ಪ್ರಾಮಾಣಿಕತೆ (b): ನಿಷ್ಪಕ್ಷಪಾತ ನಡವಳಿಕೆ ಮತ್ತು ಉನ್ನತ ನೈತಿಕತೆ.
• ಪಾರದರ್ಶಕತೆ (c): ನಿರ್ಧಾರಗಳನ್ನು ಮುಕ್ತವಾಗಿ, ಸಾರ್ವಜನಿಕರ ತಿಳಿವಳಿಕೆಗೆ ಸಿಗುವಂತೆ ಮಾಡುವುದು.
• ಜವಾಬ್ದಾರಿ/ಹೊಣೆಗಾರಿಕೆ (e): ಸಾರ್ವಜನಿಕ ಅಧಿಕಾರ ಮತ್ತು ಸಂಪನ್ಮೂಲಗಳ ಬಳಕೆಗೆ ಉತ್ತರದಾಯಿಯಾಗಿರುವುದು.
''ಅಧಿಕಾರ'' ಮತ್ತು ''ವೇಗ''ಗಳು ಆಡಳಿತಾತ್ಮಕ ಅಂಶಗಳೇ ಹೊರತು ನೈತಿಕ ಪ್ರಾಮಾಣಿಕತೆಯ ಆಧಾರ ಸ್ತಂಭಗಳಲ್ಲ.', NULL, NULL),
    ('pc-nhk-2026-q53', 53, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_physics', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Wave Mechanics & Propagation of Sound (Requirement of Material Medium vs Vacuum)', 'ತರಂಗ ಬಲಶಾಸ್ತ್ರ ಮತ್ತು ಶಬ್ದದ ಪ್ರಸರಣ (ಮಾಧ್ಯಮದ ಅಗತ್ಯತೆ ಮತ್ತು ನಿರ್ವಾತದಲ್ಲಿ ಅಪ್ರಸರಣ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Physics', 'Science, Technology & Defence']::TEXT[], '', '', 'Consider the following statements and choose the correct answer from the options given below :

Assertion (A) : Electrical appliances with metal body have three electrical connections but an electrical bulb has two electrical connections.
Reason (R) : Three pin connections reduce the chance of electric shock.', 'ಈ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ ಮತ್ತು ನೀಡಲಾದ ಆಯ್ಕೆಗಳಿಂದ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.

ಪ್ರತಿಪಾದನೆ (A) : ಲೋಹೀಯ ವಸ್ತುಗಳಿಂದ ಮಾಡಿದ ವಿದ್ಯುತ್ ಉಪಕರಣಗಳಿಗೆ ಮೂರು ತಂತಿಗಳ ವಿದ್ಯುತ್ ವೈರಿಂಗ್ ಇರುತ್ತದೆ. ಆದರೆ, ವಿದ್ಯುತ್ ಬಲ್ಬ್‌ನಲ್ಲಿ ಎರಡು ತಂತಿಗಳ ವಿದ್ಯುತ್ ವೈರಿಂಗ್ ಇರುತ್ತದೆ.
ಕಾರಣ (R) : ತ್ರೀ-ಪಿನ್ ಸಂಪರ್ಕಗಳು ವಿದ್ಯುತ್ ಆಘಾತದ ಸಾಧ್ಯತೆಯನ್ನು ಕಡಿಮೆ ಮಾಡುತ್ತವೆ.', 'Assertion (A) is true, but Reason (R) is false.', 'Assertion (A) is false, but Reason (R) is true.', 'Both Assertion (A) and Reason (R) are true and (R) is the correct explanation of (A).', 'Both Assertion (A) and Reason (R) are true but (R) is not the correct explanation of (A).', 'ಪ್ರತಿಪಾದನೆ (A) ಸರಿಯಾಗಿದೆ, ಆದರೆ ಕಾರಣ (R) ತಪ್ಪಾಗಿದೆ.', 'ಪ್ರತಿಪಾದನೆ (A) ತಪ್ಪಾಗಿದೆ ಆದರೆ ಕಾರಣ (R) ಸರಿಯಾಗಿದೆ.', 'ಪ್ರತಿಪಾದನೆ (A) ಹಾಗೂ ಕಾರಣ (R) ಎರಡೂ ಸರಿಯಾಗಿವೆ, ಹಾಗೂ (R), (A) ಯ ಸರಿಯಾದ ವಿವರಣೆಯಾಗಿದೆ.', 'ಪ್ರತಿಪಾದನೆ (A) ಹಾಗೂ ಕಾರಣ (R) ಎರಡೂ ಸರಿಯಾಗಿವೆ, ಆದರೆ (R), (A) ಯ ಸರಿಯಾದ ವಿವರಣೆಯಾಗಿಲ್ಲ.', '3', 'Correct Answer: (3)

• Assertion (A) is true: Heavy electrical appliances with exposed metallic bodies (refrigerators, electric irons, heaters) use a 3-pin plug containing Live (phase), Neutral, and Earth connections. In contrast, an electric bulb has an insulating glass/plastic casing and requires only two pins (Live and Neutral) to complete the circuit.
• Reason (R) is true and is the correct explanation of (A): The third pin connects the metallic outer chassis directly to the Earth wire. If an internal insulation failure causes the Live wire to contact the metal casing, the leakage current safely diverts through the low-resistance ground path, tripping the circuit breaker/fuse and preventing fatal electric shocks.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

• ಪ್ರತಿಪಾದನೆ (A) ಸರಿಯಾಗಿದೆ: ಇಸ್ತ್ರಿ ಪೆಟ್ಟಿಗೆ, ಹೀಟರ್, ರೆಫ್ರಿಜರೇಟರ್ ಮುಂತಾದ ಲೋಹದ ಬಾಡಿ ಹೊಂದಿರುವ ಉಪಕರಣಗಳಿಗೆ ಲೈವ್, ನ್ಯೂಟ್ರಲ್ ಮತ್ತು ಅರ್ಥಿಂಗ್ (Earth) ಎಂಬ 3 ಪಿನ್‌ಗಳ ಸಂಪರ್ಕವಿರುತ್ತದೆ. ಆದರೆ ವಿದ್ಯುತ್ ಬಲ್ಬ್ ಗಾಜು ಅಥವಾ ನಿರೋಧಕ ಕವಚ ಹೊಂದಿರುವುದರಿಂದ ಅದಕ್ಕೆ ಕೇವಲ 2 ಪಿನ್ (ಲೈವ್ ಮತ್ತು ನ್ಯೂಟ್ರಲ್) ಸಂಪರ್ಕ ಸಾಕಾಗುತ್ತದೆ.
• ಕಾರಣ (R) ಸರಿಯಾಗಿದೆ ಮತ್ತು (A) ಗೆ ಸೂಕ್ತ ವಿವರಣೆಯಾಗಿದೆ: 3-ಪಿನ್‌ನಲ್ಲಿರುವ ಭೂಸಂಪರ್ಕ ತಂತಿಯು (Earth wire) ಉಪಕರಣದ ಲೋಹದ ಕವಚಕ್ಕೆ ಸಂಪರ್ಕಗೊಂಡಿರುತ್ತದೆ. ಆಕಸ್ಮಿಕವಾಗಿ ವಿದ್ಯುತ್ ಸೋರಿಕೆಯಾದರೆ, ಅದು ಕಡಿಮೆ ರೋಧವಿರುವ ಭೂಮಿಗೆ ಹರಿದುಹೋಗಿ ವ್ಯಕ್ತಿಗೆ ವಿದ್ಯುತ್ ಆಘಾತ (Electric shock) ತಗುಲದಂತೆ ರಕ್ಷಿಸುತ್ತದೆ.', NULL, NULL),
    ('pc-nhk-2026-q54', 54, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.nuclear_technology_energy.nuclear_energy_programme_reactors', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Nuclear Technology & Energy', 'ಪರಮಾಣು ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಇಂಧನ', 'Indigenous Research Reactors & KAMINI at Kalpakkam (Thorium Fuel Cycle / U-233)', 'ಕಲ್ಪಾಕಂನ ಕಾಮಿನಿ (KAMINI) ಸಂಶೋಧನಾ ರಿಯಾಕ್ಟರ್ (ಥೋರಿಯಂ ಚಕ್ರ ಮತ್ತು U-233)', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Nuclear Technology', 'Science, Technology & Defence']::TEXT[], '', '', 'KAMINI is :', 'KAMINI - ಒಂದು :', 'A mobile surveillance radar system for low level target detection.', 'A thorium based thermal breeder reactor.', 'A 3D medium range surveillance radar system.', 'A plutonium based fast breeder reactor.', 'ಕಡಿಮೆ ಎತ್ತರದ ಗುರಿಯನ್ನು ಗುರುತಿಸುವ ಚರ ವಿಚಕ್ಷಣ ರಾಡಾರ್ ವ್ಯವಸ್ಥೆ.', 'ಥೋರಿಯಂ ಆಧಾರಿತ ಥರ್ಮಲ್ ಬ್ರೀಡರ್ ರಿಯಾಕ್ಟರ್.', '3D ಮಧ್ಯಮ ವ್ಯಾಪ್ತಿಯ ವಿಚಕ್ಷಣ ರಾಡಾರ್ ವ್ಯವಸ್ಥೆ.', 'ಪ್ಲುಟೋನಿಯಂ ಆಧಾರಿತ ಫಾಸ್ಟ್ ಬ್ರೀಡರ್ ರಿಯಾಕ್ಟರ್.', '2', 'Correct Answer: (2)

KAMINI stands for ''Kalpakkam Mini reactor''. Located at the Indira Gandhi Centre for Atomic Research (IGCAR) in Kalpakkam, Tamil Nadu, it is a 30 kW thermal research reactor that achieved criticality in 1996. It holds the historic distinction of being the world''s only operating nuclear reactor fueled entirely by Uranium-233 (U-233), which is bred from Thorium-232, validating the third stage of Dr. Homi Bhabha''s Three-Stage Nuclear Power Programme.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

KAMINI ಎಂದರೆ ''ಕಲ್ಪಾಕ್ಕಂ ಮಿನಿ ರಿಯಾಕ್ಟರ್'' (Kalpakkam Mini reactor). ಇದು ತಮಿಳುನಾಡಿನ ಕಲ್ಪಾಕ್ಕಂನಲ್ಲಿರುವ ಇಂದಿರಾ ಗಾಂಧಿ ಪರಮಾಣು ಸಂಶೋಧನಾ ಕೇಂದ್ರದಲ್ಲಿ (IGCAR) ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿರುವ 30 kW ಸಾಮರ್ಥ್ಯದ ಸಂಶೋಧನಾ ರಿಯಾಕ್ಟರ್ ಆಗಿದೆ. ಇದು ಥೋರಿಯಂನಿಂದ ಪಡೆಯಲಾದ ಯುರೇನಿಯಂ-233 (U-233) ಅನ್ನು ಇಂಧನವಾಗಿ ಬಳಸುವ ವಿಶ್ವದ ಏಕೈಕ ಕಾರ್ಯಾಚರಣಾ ಪರಮಾಣು ರಿಯಾಕ್ಟರ್ ಆಗಿದ್ದು, ಭಾರತದ ಮೂರನೇ ಹಂತದ ಥೋರಿಯಂ ಆಧಾರಿತ ಪರಮಾಣು ಕಾರ್ಯಕ್ರಮದ ಪ್ರಮುಖ ಮೈಲಿಗಲ್ಲಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q55', 55, 2026, 'September', 1, 'nhk', 'ksp-pc', 'ethics_integrity_aptitude.attitude_aptitude.foundational_values_for_civil_services', 'Ethics, Integrity & Aptitude', 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ', 'Attitude & Aptitude', 'ಮನೋಭಾವ ಮತ್ತು ಆಡಳಿತಾತ್ಮಕ ಅಭಿರುಚಿ', 'Foundational Values of Civil Services (Integrity, Dedication, Objectivity & Impartiality)', 'ನಾಗರಿಕ ಸೇವೆಗಳ ಮೂಲಭೂತ ಮೌಲ್ಯಗಳು (ಸಮಗ್ರತೆ, ನಿಷ್ಠೆ, ವಸ್ತುನಿಷ್ಠತೆ ಮತ್ತು ನಿಷ್ಪಕ್ಷಪಾತತೆ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Ethics', 'Ethics, Integrity & Aptitude']::TEXT[], '', '', 'Consider the following statements :

Statement I : A code of ethics is a set of rules and standards that specify the expected behaviour of members within the organisation.
Statement II : A code of conduct is a set of guidelines that outlines the core values, principles and ideals of an organisation.

Choose the correct answer from the options given below :', 'ಈ ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.

ಹೇಳಿಕೆ I : ನೀತಿಶಾಸ್ತ್ರ ಸಂಹಿತೆಯು ಸಂಸ್ಥೆಯೊಳಗಿನ ಸದಸ್ಯರ ನಿರೀಕ್ಷಿತ ನಡತೆಯನ್ನು ನಿರ್ದಿಷ್ಟಪಡಿಸುವ ನಿಯಮಗಳು ಮತ್ತು ಗುಣಮಟ್ಟಗಳನ್ನು ಒಳಗೊಂಡ ಗುಂಪಾಗಿದೆ.
ಹೇಳಿಕೆ II : ನಡವಳಿಕೆ ಸಂಹಿತೆಯು ಸಂಸ್ಥೆಯ ಪ್ರತಿಯೊಂದು ಮೂಲಭೂತ ಮೌಲ್ಯಗಳು, ತತ್ವಗಳು ಮತ್ತು ಆದರ್ಶಗಳನ್ನು ವಿವರಿಸುವ ಮಾರ್ಗಸೂಚಿಗಳ ಗುಂಪಾಗಿದೆ.

ಈ ಕೆಳಗಿನ ಆಯ್ಕೆಗಳಿಂದ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.', 'Both Statement I and Statement II are correct.', 'Statement I is correct but Statement II is incorrect.', 'Both Statement I and Statement II are incorrect.', 'Statement I is incorrect but Statement II is correct.', 'ಹೇಳಿಕೆ I ಮತ್ತು ಹೇಳಿಕೆ II ಎರಡೂ ಸರಿ.', 'ಹೇಳಿಕೆ I ಸರಿ ಆದರೆ ಹೇಳಿಕೆ II ತಪ್ಪು.', 'ಹೇಳಿಕೆ I ಮತ್ತು ಹೇಳಿಕೆ II ಎರಡೂ ತಪ್ಪು.', 'ಹೇಳಿಕೆ I ತಪ್ಪು ಆದರೆ ಹೇಳಿಕೆ II ಸರಿ.', '3', 'Correct Answer: (3)

Both statements are incorrect because their formal definitions have been interchanged:
• Code of Ethics: A broad, aspirational document that outlines an organization''s core philosophical values, guiding principles, and moral ideals (incorrectly described as Statement II).
• Code of Conduct: A specific, legally enforceable set of rules that prescribes the concrete day-to-day behavior, dos, and don''ts expected from employees or members within an organization (incorrectly described as Statement I).
Because the descriptions are inverted, both statements are incorrect.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ಎರಡೂ ಹೇಳಿಕೆಗಳು ತಪ್ಪಾಗಿವೆ, ಏಕೆಂದರೆ ವ್ಯಾಖ್ಯಾನಗಳನ್ನು ಪರಸ್ಪರ ಅದಲು-ಬದಲು ಮಾಡಲಾಗಿದೆ:
• ನೀತಿ ಸಂಹಿತೆ (Code of Ethics): ಇದು ಸಂಸ್ಥೆಯೊಂದರ ಉನ್ನತ ಆದರ್ಶಗಳು, ಮೂಲಭೂತ ಮೌಲ್ಯಗಳು ಮತ್ತು ತತ್ವಗಳನ್ನು ವಿವರಿಸುವ ಮಾರ್ಗದರ್ಶಿಯಾಗಿದೆ (ಹೇಳಿಕೆ II ರಲ್ಲಿ ನೀಡಲಾಗಿರುವ ವಿವರಣೆ).
• ನಡವಳಿಕೆ ಸಂಹಿತೆ (Code of Conduct): ಇದು ನೌಕರರು ಅಥವಾ ಸದಸ್ಯರು ಕರ್ತವ್ಯದ ಸಮಯದಲ್ಲಿ ಹೇಗೆ ವರ್ತಿಸಬೇಕು ಎಂಬುದನ್ನು ನಿರ್ದಿಷ್ಟಪಡಿಸುವ ಕಟ್ಟುನಿಟ್ಟಾದ ನಿಯಮಗಳು ಮತ್ತು ಮಾನದಂಡಗಳಾಗಿವೆ (ಹೇಳಿಕೆ I ರಲ್ಲಿ ನೀಡಲಾಗಿರುವ ವಿವರಣೆ).
ಆದ್ದರಿಂದ ಹೇಳಿಕೆ I ಮತ್ತು ಹೇಳಿಕೆ II ಎರಡೂ ತಪ್ಪುಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q56', 56, 2026, 'September', 1, 'nhk', 'ksp-pc', 'internal_security.security_forces_intelligence_agencies_statutory_mandates.central_armed_police_forces_capfs', 'Internal Security', 'ಆಂತರಿಕ ಭದ್ರತೆ', 'Security Forces, Intelligence Agencies & Statutory Mandates', 'ಭದ್ರತಾ ಪಡೆಗಳು, ಗುಪ್ತಚರ ಸಂಸ್ಥೆಗಳು ಮತ್ತು ಶಾಸನಬದ್ಧ ಕರ್ತವ್ಯಗಳು', 'Police Code of Conduct & Impartial Law Enforcement Without Fear or Favour', 'ಪೊಲೀಸ್ ನೀತಿ ಸಂಹಿತೆ ಮತ್ತು ಭೀತಿ ಅಥವಾ ಪಕ್ಷಪಾತವಿಲ್ಲದೆ ಕಾನೂನು ಪಾಲನೆ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Police Ethics', 'Internal Security']::TEXT[], '', '', 'The police should enforce the law firmly and impartially, without (i) or favour, malice or (ii).', 'ಪೊಲೀಸರು (i) ಅಥವಾ ಒಲವು ಇಲ್ಲದೇ, ದ್ವೇಷ ಅಥವಾ (ii) ಇಲ್ಲದೇ ದೃಢವಾಗಿ ಮತ್ತು ನಿಷ್ಪಕ್ಷಪಾತವಾಗಿ ಕಾನೂನನ್ನು ಜಾರಿಗೊಳಿಸಬೇಕು.', '(i) courage and (ii) mercy', '(i) confidence and (ii) faith', '(i) fear and (ii) vindictiveness', '(i) assurance and (ii) conviction', '(i) ಧೈರ್ಯ ಮತ್ತು (ii) ಕರುಣೆ', '(i) ವಿಶ್ವಾಸ ಮತ್ತು (ii) ನಂಬಿಕೆ', '(i) ಭಯ ಮತ್ತು (ii) ಸೇಡಿನ ಮನೋಭಾವ', '(i) ಭರವಸೆ ಮತ್ತು (ii) ದೃಢನಂಬಿಕೆ', '3', 'Correct Answer: (3)

Under the National Police Commission''s Code of Conduct for Law Enforcement Officials and the universal police oath adopted in India: "The police should enforce the law firmly and impartially, without fear or favour, malice or vindictiveness (ill-will)." This principle ensures democratic policing grounded in the Rule of Law rather than arbitrary coercion or personal vengeance.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ರಾಷ್ಟ್ರೀಯ ಪೊಲೀಸ್ ಆಯೋಗದ ನಡವಳಿಕೆ ಸಂಹಿತೆ ಮತ್ತು ಕಾನೂನು ಜಾರಿ ವ್ಯವಸ್ಥೆಯ ಪ್ರಮಾಣವಚನದ ಪ್ರಕಾರ: "ಪೊಲೀಸರು (i) ಭಯ ಅಥವಾ ಒಲವು ಇಲ್ಲದೇ, ದ್ವೇಷ ಅಥವಾ (ii) ಸೇಡಿನ ಮನೋಭಾವ (Vindictiveness) ಇಲ್ಲದೇ ದೃಢವಾಗಿ ಮತ್ತು ನಿಷ್ಪಕ್ಷಪಾತವಾಗಿ ಕಾನೂನನ್ನು ಜಾರಿಗೊಳಿಸಬೇಕು." ಇದು ಕಾನೂನಿನ ಆಳ್ವಿಕೆಯನ್ನು ಕಾಪಾಡುವಲ್ಲಿ ಪೊಲೀಸರ ನಿಷ್ಪಕ್ಷಪಾತ ತತ್ವವನ್ನು ಎತ್ತಿಹಿಡಿಯುತ್ತದೆ.', NULL, NULL),
    ('pc-nhk-2026-q57', 57, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_economy_development.infrastructure_energy_investment_models.physical_infrastructure_systems', 'Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', 'Infrastructure, Energy & Investment Models', 'ಮೂಲಸೌಕರ್ಯ, ಇಂಧನ ಮತ್ತು ಹೂಡಿಕೆ ಮಾದರಿಗಳು', 'Multi-Lane Free Flow (MLFF) Electronic Tolling on National Highways', 'ರಾಷ್ಟ್ರೀಯ ಹೆದ್ದಾರಿಗಳಲ್ಲಿ ಮಲ್ಟಿ-ಲೇನ್ ಫ್ರೀ ಫ್ಲೋ (MLFF) ತಡೆರಹಿತ ಟೋಲ್ ವ್ಯವಸ್ಥೆ', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Infrastructure', 'Indian Economy & Development']::TEXT[], '', '', 'India''s first Multi-Lane Free Flow (MLFF) barrierless tolling system was launched at the Toll Plaza on the Surat-Bharuch section of NH-48 in Gujarat.', 'ಭಾರತದ ಪ್ರಥಮ ಮಲ್ಟಿ ಲೇನ್ ಫ್ರೀ ಫ್ಲೋ (MLFF) ಅಡೆತಡೆ ರಹಿತ ಟೋಲ್ ವ್ಯವಸ್ಥೆಯನ್ನು ಗುಜರಾತಿನ NH-48 ರ ________ ಟೋಲ್ ಪ್ಲಾಜಾದ ಸೂರತ್ - ಭರೂಚ್ ಸೆಕ್ಷನ್‌ನಲ್ಲಿ ಪ್ರಾರಂಭಿಸಲಾಗಿದೆ.', 'Vadodara', 'Chorayasi', 'Golden Chokdi', 'Ahmedabad', 'ವಡೋದರಾ', 'ಚೋರಯಾಸಿ', 'ಗೋಲ್ಡನ್ ಚೋಕ್ಲಿ', 'ಅಹ್ಮದಾಬಾದ್', '2', 'Correct Answer: (2)

The National Highways Authority of India (NHAI) introduced India''s first Multi-Lane Free Flow (MLFF) barrierless electronic toll collection system on a pilot basis at the Choryasi (Chorayasi) Toll Plaza on the Surat-Bharuch section of NH-48 in Gujarat. MLFF uses high-speed overhead gantries equipped with Automatic Number Plate Recognition (ANPR) cameras and RFID readers, allowing vehicles to cruise through at highway speeds without stopping at physical boom barriers.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಭಾರತೀಯ ರಾಷ್ಟ್ರೀಯ ಹೆದ್ದಾರಿ ಪ್ರಾಧಿಕಾರವು (NHAI) ವಾಹನಗಳು ಯಾವುದೇ ಬೂಮ್ ಬ್ಯಾರಿಯರ್ ಅಡೆತಡೆಗಳಿಲ್ಲದೆ ಹೆದ್ದಾರಿ ವೇಗದಲ್ಲೇ ಸಾಗುವ ''ಮಲ್ಟಿ ಲೇನ್ ಫ್ರೀ ಫ್ಲೋ'' (MLFF) ತಡೆರಹಿತ ಎಲೆಕ್ಟ್ರಾನಿಕ್ ಟೋಲ್ ವ್ಯವಸ್ಥೆಯ ಪ್ರಾಯೋಗಿಕ ಜಾರಿಯನ್ನು ಗುಜರಾತಿನ NH-48 ರ ಸೂರತ್-ಭರೂಚ್ ವಿಭಾಗದಲ್ಲಿರುವ ''ಚೋರಯಾಸಿ'' (Choryasi) ಟೋಲ್ ಪ್ಲಾಜಾದಲ್ಲಿ ಪ್ರಾರಂಭಿಸಿತು. ಇದು ಹೈಸ್ಪೀಡ್ ಕ್ಯಾಮೆರಾಗಳು (ANPR) ಮತ್ತು RFID ಮೂಲಕ ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಟೋಲ್ ಕಡಿತಗೊಳಿಸುತ್ತದೆ.', NULL, NULL),
    ('pc-nhk-2026-q58', 58, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups', 'Indian Society & Social Justice', 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ', 'Welfare Schemes for Vulnerable Sections', 'ದುರ್ಬಲ ವರ್ಗಗಳ ಕಲ್ಯಾಣ ಯೋಜನೆಗಳು', 'Ministry of Tribal Affairs & Forest Rights Act (FRA 2006) Implementation Cells', 'ಬುಡಕಟ್ಟು ವ್ಯವಹಾರಗಳ ಸಚಿವಾಲಯ ಮತ್ತು ಅರಣ್ಯ ಹಕ್ಕುಗಳ ಕಾಯ್ದೆ (FRA 2006) ಕೋಶಗಳು', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Governance', 'Indian Society & Social Justice']::TEXT[], '', '', 'Which Union Ministry announced plans to revamp existing Forest Rights Act cells and establish streamlined ''One-stop'' coordinating units?', 'ಪ್ರಸ್ತುತ ಇರುವ ಅರಣ್ಯ ಹಕ್ಕುಗಳ ಕಾಯ್ದೆ ಕೋಶಗಳನ್ನು ಸುಧಾರಿಸಲು ಮತ್ತು ಹೆಚ್ಚು ಸಂಘಟಿತ ''ಒನ್-ಸ್ಟಾಪ್'' ಸಮನ್ವಯ ಘಟಕಗಳನ್ನು ಸ್ಥಾಪಿಸಲು ಯಾವ ಕೇಂದ್ರ ಸಚಿವಾಲಯವು ಯೋಜನೆಗಳನ್ನು ಘೋಷಿಸಿದೆ ?', 'Ministry of Rural Development', 'Ministry of Tribal Affairs', 'Ministry of Panchayat Raj', 'Ministry of Environment, Forest and Climate Change', 'ಗ್ರಾಮೀಣಾಭಿವೃದ್ಧಿ ಸಚಿವಾಲಯ', 'ಬುಡಕಟ್ಟು ವ್ಯವಹಾರಗಳ ಸಚಿವಾಲಯ', 'ಪಂಚಾಯತ್ ರಾಜ್ ಸಚಿವಾಲಯ', 'ಪರಿಸರ, ಅರಣ್ಯ ಮತ್ತು ಹವಾಮಾನ ಬದಲಾವಣೆ ಸಚಿವಾಲಯ', '2', 'Correct Answer: (2)

The Union Ministry of Tribal Affairs (MoTA) is the designated nodal central ministry responsible for administering and overseeing the implementation of the Scheduled Tribes and Other Traditional Forest Dwellers (Recognition of Forest Rights) Act, 2006 (commonly known as FRA). To address long-pending individual and community forest title claims, digitize forest land records, and provide inter-departmental synergy, MoTA initiated the revamping of state and district FRA cells into streamlined ''One-Stop'' coordinating units.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಅರಣ್ಯ ಹಕ್ಕುಗಳ ಕಾಯ್ದೆ, 2006 (FRA) ಅನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವ ಭಾರತ ಸರ್ಕಾರದ ನೋಡಲ್ ಇಲಾಖೆಯು ''ಕೇಂದ್ರ ಬುಡಕಟ್ಟು ವ್ಯವಹಾರಗಳ ಸಚಿವಾಲಯ'' (Ministry of Tribal Affairs - MoTA) ಆಗಿದೆ. ಬುಡಕಟ್ಟು ಮತ್ತು ಅರಣ್ಯವಾಸಿಗಳ ಬಾಕಿ ಇರುವ ಹಕ್ಕುಪತ್ರಗಳ ವಿಲೇವಾರಿಯನ್ನು ತ್ವರಿತಗೊಳಿಸಲು ಹಾಗೂ ಕಂದಾಯ ಮತ್ತು ಅರಣ್ಯ ಇಲಾಖೆಗಳೊಂದಿಗೆ ಉತ್ತಮ ಸಮನ್ವಯ ಸಾಧಿಸಲು ಸಚಿವಾಲಯವು ಅರಣ್ಯ ಹಕ್ಕು ಕೋಶಗಳನ್ನು ಪುನರ್ರೂಪಿಸಿ ''ಒನ್-ಸ್ಟಾಪ್'' ಸಮನ್ವಯ ಘಟಕಗಳನ್ನು ಸ್ಥಾಪಿಸುವ ಯೋಜನೆಯನ್ನು ಪ್ರಕಟಿಸಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q59', 59, 2026, 'September', 1, 'nhk', 'ksp-pc', 'internal_security.transnational_organised_crime_illicit_financial_flows.drug_trafficking_narco-terrorism', 'Internal Security', 'ಆಂತರಿಕ ಭದ್ರತೆ', 'Transnational Organised Crime & Illicit Financial Flows', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಘಟಿತ ಅಪರಾಧ ಮತ್ತು ಅಕ್ರಮ ಹಣಕಾಸು ಹರಿವು', 'Illicit Trafficking, Narcotics Trade & Bootlegging Penalties', 'ಅಕ್ರಮ ಸಾಗಾಟ, ಮಾದಕ ದ್ರವ್ಯ ಕಳ್ಳಸಾಗಣೆ ಮತ್ತು ಬೂಟ್‌ಲೆಗ್ಗಿಂಗ್ (ಕಳ್ಳಬಟ್ಟಿ ದಂಧೆ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Legal Terms', 'Internal Security']::TEXT[], '', '', 'Manufacturing, selling or transporting liquor and narcotics that are prohibited by law is called as :', 'ಮದ್ಯ ಮತ್ತು ಮಾದಕ ದ್ರವ್ಯಗಳ ಉತ್ಪಾದನೆ, ಮಾರಾಟ ಅಥವಾ ಸಾಗಣೆಯನ್ನು ಕಾನೂನಿನ ಮೂಲಕ ನಿಷೇಧಿಸುವುದನ್ನು ಹೀಗೆ ಕರೆಯಲಾಗುತ್ತದೆ :', 'Sanctioning', 'Legalizing', 'Licensing', 'Bootlegging', 'ಸ್ಯಾಂಕ್ಷನಿಂಗ್', 'ಲೀಗಲೈಸಿಂಗ್', 'ಲೈಸೆನ್ಸಿಂಗ್', 'ಬೂಟ್‌ಲೆಗ್ಗಿಂಗ್', '4', 'Correct Answer: (4)

''Bootlegging'' historically originated from the practice of concealing illicit liquor flasks in the legs of tall boots during American Prohibition. In modern criminal law, it formally refers to the illegal manufacture, sale, smuggling, or transportation of contraband alcoholic beverages, narcotics, or prohibited goods to evade statutory bans or excise taxation.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಕಾನೂನಿನಿಂದ ನಿಷೇಧಿಸಲ್ಪಟ್ಟಿರುವ ಮದ್ಯ, ನಶೆಯ ವಸ್ತುಗಳು ಅಥವಾ ಮಾದಕ ದ್ರವ್ಯಗಳನ್ನು ಅಕ್ರಮವಾಗಿ ತಯಾರಿಸುವುದು, ಕಳ್ಳಸಾಗಣೆ ಮಾಡುವುದು ಅಥವಾ ಮಾರಾಟ ಮಾಡುವುದನ್ನು ಅಪರಾಧಶಾಸ್ತ್ರದಲ್ಲಿ ''ಬೂಟ್‌ಲೆಗ್ಗಿಂಗ್'' (Bootlegging) ಎಂದು ಕರೆಯಲಾಗುತ್ತದೆ. ಅಮೆರಿಕದಲ್ಲಿ ಮದ್ಯ ನಿಷೇಧವಿದ್ದ ಕಾಲದಲ್ಲಿ ಬೂಟುಗಳ ಒಳಗೆ ಬಾಟಲಿಗಳನ್ನು ಬಚ್ಚಿಟ್ಟು ಸಾಗಿಸುತ್ತಿದ್ದ ಪದ್ಧತಿಯಿಂದ ಈ ಹೆಸರು ಬಂದಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q60', 60, 2026, 'September', 1, 'nhk', 'ksp-pc', 'ethics_integrity_aptitude.case_studies.ethical_dilemmas_in_administration_public_life', 'Ethics, Integrity & Aptitude', 'ನೀತಿಶಾಸ್ತ್ರ, ಸಮಗ್ರತೆ ಮತ್ತು ಅಭಿರುಚಿ', 'Case Studies', 'ಪ್ರಕರಣ ಅಧ್ಯಯನಗಳು (ಕೇಸ್ ಸ್ಟಡೀಸ್)', 'Administrative Ethics Case Study: Compliance with Official Directives and Public Duty', 'ಆಡಳಿತಾತ್ಮಕ ನೈತಿಕತೆ ಕೇಸ್ ಸ್ಟಡಿ: ಅಧಿಕೃತ ಆದೇಶಗಳ ಪಾಲನೆ ಮತ್ತು ಕರ್ತವ್ಯ ನಿರ್ವಹಣೆ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Ethics', 'Ethics, Integrity & Aptitude']::TEXT[], '', '', 'An official order was sent to you by PU Board to report for evaluation work of PUC II answer scripts. But your daughter has appeared for the same exam. Then what should be your action?', 'ದ್ವಿತೀಯ ಪಿಯುಸಿ ಉತ್ತರ ಪತ್ರಿಕೆಗಳ ಮೌಲ್ಯಮಾಪನ ಕಾರ್ಯಕ್ಕೆ ಹಾಜರಾಗಲು ಪಿಯು ಮಂಡಳಿಯು ಅಧಿಕೃತ ಆದೇಶವನ್ನು ನಿಮಗೆ ಕಳುಹಿಸಿದೆ. ಆದರೆ ನಿಮ್ಮ ಮಗಳು ಅದೇ ಪರೀಕ್ಷೆಗೆ ಹಾಜರಾಗಿದ್ದಾಳೆ. ಆಗ ನಿಮ್ಮ ಕ್ರಮವೇನು ?', 'Formally declare that your daughter has appeared for the same examination and ask for exemption.', 'Request to give answer papers for evaluation other than your daughter''s answer paper.', 'Don''t declare that your daughter has appeared for the same examination as coding of answer papers will be done.', 'Report for the evaluation work without informing that your daughter has appeared for the same exam as it''s a government order.', 'ನಿಮ್ಮ ಮಗಳು ಅದೇ ಪರೀಕ್ಷೆಗೆ ಹಾಜರಾಗಿದ್ದಾಳೆಂದು ಔಪಚಾರಿಕವಾಗಿ ಘೋಷಿಸಿ, ಮೌಲ್ಯಮಾಪನ ಕಾರ್ಯದಿಂದ ವಿನಾಯಿತಿ ಕೇಳುತ್ತೀರಿ.', 'ನಿಮ್ಮ ಮಗಳ ಉತ್ತರ ಪತ್ರಿಕೆಯನ್ನು ಹೊರತುಪಡಿಸಿ, ಮೌಲ್ಯಮಾಪನಕ್ಕಾಗಿ ಬೇರೆಯವರ ಉತ್ತರ ಪತ್ರಿಕೆಗಳನ್ನು ನೀಡಲು ವಿನಂತಿಸುತ್ತೀರಿ.', 'ಉತ್ತರ ಪತ್ರಿಕೆಗಳು ಕೋಡಿಂಗ್ ಆಗುವುದರಿಂದ ಅದೇ ಪರೀಕ್ಷೆಗೆ ನಿಮ್ಮ ಮಗಳು ಹಾಜರಾಗಿರುವ ಬಗ್ಗೆ ಘೋಷಿಸುವುದಿಲ್ಲ.', 'ಸರ್ಕಾರ ಆದೇಶವಾಗಿರುವುದರಿಂದ ನಿಮ್ಮ ಮಗಳು ಅದೇ ಪರೀಕ್ಷೆಗೆ ಹಾಜರಾಗಿದ್ದಾಳೆಂದು ಘೋಷಿಸದೇ ಮೌಲ್ಯಮಾಪನ ಕಾರ್ಯಕ್ಕೆ ವರದಿ ಮಾಡಿಕೊಳ್ಳುತ್ತೀರಿ.', '1', 'Correct Answer: (1)

Public service integrity and standard examination manuals strictly govern ''Conflict of Interest''. Whenever an immediate blood relative or ward of an evaluator appears for a board/university examination, the evaluator is legally and ethically bound to submit a proactive declaration and seek complete recusal/exemption from evaluation work. Even with anonymized barcode coding, participation compromises institutional impartiality and opens the process to allegations of bias.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಸಾರ್ವಜನಿಕ ಪರೀಕ್ಷಾ ನಿಯಮಾವಳಿಗಳು ಮತ್ತು ಆಡಳಿತಾತ್ಮಕ ನೀತಿಶಾಸ್ತ್ರದ ಪ್ರಕಾರ ''ಹಿತಾಸಕ್ತಿ ಸಂಘರ್ಷ'' (Conflict of Interest) ಉಂಟಾಗುವುದನ್ನು ಕಟ್ಟುನಿಟ್ಟಾಗಿ ತಡೆಯಬೇಕು. ಮೌಲ್ಯಮಾಪಕರ ಸ್ವಂತ ಮಕ್ಕಳು ಅಥವಾ ಹತ್ತಿರದ ಸಂಬಂಧಿಕರು ಅದೇ ಪರೀಕ್ಷೆ ಬರೆದಿದ್ದರೆ, ಅದನ್ನು ಮಂಡಳಿಗೆ ಮುಂಚಿತವಾಗಿಯೇ ಲಿಖಿತವಾಗಿ ಘೋಷಿಸಿ, ಮೌಲ್ಯಮಾಪನ ಕಾರ್ಯದಿಂದ ಸಂಪೂರ್ಣ ವಿನಾಯಿತಿ ಪಡೆಯುವುದು ಕಾನೂನುಬದ್ಧ ಮತ್ತು ನೈತಿಕ ಕರ್ತವ್ಯವಾಗಿದೆ. ಉತ್ತರ ಪತ್ರಿಕೆ ಕೋಡಿಂಗ್ ಆಗಿದ್ದರೂ ಸಹ ಕೆಲಸಕ್ಕೆ ಹಾಜರಾಗುವುದು ಪರೀಕ್ಷಾ ಪಾವಿತ್ರ್ಯತೆಗೆ ಧಕ್ಕೆ ತರುತ್ತದೆ.', NULL, NULL),
    ('pc-nhk-2026-q61', 61, 2026, 'September', 1, 'nhk', 'ksp-pc', 'art_culture_heritage.martial_arts_traditional_sports_calendars', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Martial Arts, Traditional Sports & Calendars', 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು', 'National Sports Trophies of India (Durand Cup, Santosh Trophy, Ranji Trophy, Duleep Trophy)', 'ಭಾರತದ ರಾಷ್ಟ್ರೀಯ ಕ್ರೀಡಾ ಟ್ರೋಫಿಗಳು (ಡುರಾಂಡ್ ಕಪ್, ಸಂತೋಷ್ ಟ್ರೋಫಿ, ರಣಜಿ ಟ್ರೋಫಿ, ದುಲೀಪ್ ಟ್ರೋಫಿ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Sports', 'Art, Culture & Heritage']::TEXT[], '', '', 'Match List- I with List- II and choose the correct answers :

List- I (Cup) - List- II (Games)
a. Duleep Trophy - i. Tennis
b. Ryder Cup - ii. Cricket
c. Thomas Cup - iii. Golf
d. Davis Cup - iv. Badminton', 'ಪಟ್ಟಿ-I ಅನ್ನು ಪಟ್ಟಿ-II ರ ಜೊತೆ ಹೊಂದಿಸಿ ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.

ಪಟ್ಟಿ-I (ಕಪ್) - ಪಟ್ಟಿ-II (ಕ್ರೀಡೆ)
a. ದುಲೀಪ್ ಟ್ರೋಫಿ - i. ಟೆನ್ನಿಸ್
b. ರೈಡರ್ ಕಪ್ - ii. ಕ್ರಿಕೆಟ್
c. ಥಾಮಸ್ ಕಪ್ - iii. ಗಾಲ್ಫ್
d. ಡೇವಿಸ್ ಕಪ್ - iv. ಬ್ಯಾಡ್ಮಿಂಟನ್', 'a-iv, b-ii, c-iii, d-i', 'a-ii, b-iii, c-iv, d-i', 'a-i, b-iv, c-ii, d-iii', 'a-ii, b-i, c-iv, d-iii', 'a-iv, b-ii, c-iii, d-i', 'a-ii, b-iii, c-iv, d-i', 'a-i, b-iv, c-ii, d-iii', 'a-ii, b-i, c-iv, d-iii', '2', 'Correct Answer: (2)

• Duleep Trophy: Premier Indian domestic first-class Cricket tournament contested by zonal teams, instituted in 1961–62 (ii).
• Ryder Cup: Biennial men''s Golf competition contested between teams from Europe and the United States (iii).
• Thomas Cup: Prestigious biennial world men''s team championship in Badminton governed by the BWF (iv).
• Davis Cup: Premier international team championship in men''s Tennis (''World Cup of Tennis'') (i).
Hence, the correct matched combination is a-ii, b-iii, c-iv, d-i.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

• ದುಲೀಪ್ ಟ್ರೋಫಿ: ಭಾರತದ ಪ್ರಸಿದ್ಧ ಪ್ರಥಮ ದರ್ಜೆ ದೇಶಿ ''ಕ್ರಿಕೆಟ್'' ಪಂದ್ಯಾವಳಿ (ii).
• ರೈಡರ್ ಕಪ್: ಅಮೆರಿಕ ಮತ್ತು ಯುರೋಪ್ ತಂಡಗಳ ನಡುವೆ ದ್ವೈವಾರ್ಷಿಕವಾಗಿ ನಡೆಯುವ ''ಗಾಲ್ಫ್'' ಪಂದ್ಯಾವಳಿ (iii).
• ಥಾಮಸ್ ಕಪ್: ವಿಶ್ವ ಬ್ಯಾಡ್ಮಿಂಟನ್ ಫೆಡರೇಶನ್ ನಡೆಸುವ ಪುರುಷರ ಜಾಗತಿಕ ''ಬ್ಯಾಡ್ಮಿಂಟನ್'' ಟೂರ್ನಿ (iv).
• ಡೇವಿಸ್ ಕಪ್: ಪುರುಷರ ಟೆನ್ನಿಸ್ ಜಗತ್ತಿನ ಪ್ರತಿಷ್ಠಿತ ಅಂತಾರಾಷ್ಟ್ರೀಯ ತಂಡ ''ಟೆನ್ನಿಸ್'' ಪಂದ್ಯಾವಳಿ (i).
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: a-ii, b-iii, c-iv, d-i.', NULL, NULL),
    ('pc-nhk-2026-q62', 62, 2026, 'September', 1, 'nhk', 'ksp-pc', 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Oceanography & Marine Systems', 'ಸಾಗರಶಾಸ್ತ್ರ ಮತ್ತು ಕಡಲ ವ್ಯವಸ್ಥೆಗಳು', 'Ocean Currents Convergence & Rich Marine Fishing Grounds (Grand Bank & Georges Bank)', 'ಸಾಗರ ಪ್ರವಾಹಗಳ ಸಮ್ಮಿಲನ ಮತ್ತು ಪ್ರಸಿದ್ಧ ಮೀನುಗಾರಿಕಾ ಪ್ರದೇಶಗಳು (ಗ್ರ್ಯಾಂಡ್ ಬ್ಯಾಂಕ್ ಮತ್ತು ಜಾರ್ಜಸ್ ಬ್ಯಾಂಕ್)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'World Geography', 'Geography & Earth Systems']::TEXT[], '', '', 'Grand Bank and Georges Banks are famous for :', 'ಗ್ರಾಂಡ್ ಬ್ಯಾಂಕ್ ಮತ್ತು ಜಾರ್ಜಸ್ ಬ್ಯಾಂಕ್‌ಗಳು ಪ್ರಸಿದ್ಧವಾಗಿರುವುದು :', 'Marine Fishing', 'Petroleum Production', 'Natural Gas Production', 'Coal Production', 'ಸಮುದ್ರ ಮೀನುಗಾರಿಕೆ', 'ಪೆಟ್ರೋಲಿಯಂ ಉತ್ಪಾದನೆ', 'ನೈಸರ್ಗಿಕ ಅನಿಲ ಉತ್ಪಾದನೆ', 'ಕಲ್ಲಿದ್ದಲು ಉತ್ಪಾದನೆ', '1', 'Correct Answer: (1)

The Grand Bank (off Newfoundland, Canada) and Georges Bank (off Nova Scotia/New England) are extensive, shallow underwater plateaus on the North American continental shelf in the North Atlantic Ocean. The confluence of the cold Labrador Current and the warm Gulf Stream produces continuous upwelling of nutrients, dense plankton blooms, and ideal shallow marine habitats, making them historically among the richest marine fishing grounds in the world for Atlantic cod, haddock, and herring.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಉತ್ತರ ಅಟ್ಲಾಂಟಿಕ್ ಸಾಗರದ ಕೆನಡಾ ಮತ್ತು ಅಮೆರಿಕದ ಕರಾವಳಿಯಲ್ಲಿರುವ ಗ್ರಾಂಡ್ ಬ್ಯಾಂಕ್ ಮತ್ತು ಜಾರ್ಜಸ್ ಬ್ಯಾಂಕ್‌ಗಳು ವಿಶ್ವವಿಖ್ಯಾತ ''ಸಮುದ್ರ ಮೀನುಗಾರಿಕೆ'' (Marine Fishing) ಕೇಂದ್ರಗಳಾಗಿವೆ. ಇಲ್ಲಿ ಶೀತಲ ಲ್ಯಾಬ್ರಡಾರ್ ಪ್ರವಾಹ ಮತ್ತು ಉಷ್ಣ ಕೊಲ್ಲಿ ಪ್ರವಾಹಗಳು (ಗಲ್ಫ್ ಸ್ಟ್ರೀಮ್) ಸಂಧಿಸುವುದರಿಂದ ಅಪಾರ ಪ್ರಮಾಣದ ಪ್ಲಾಂಕ್ಟನ್ (ಮೀನಿನ ನೈಸರ್ಗಿಕ ಆಹಾರ) ಉತ್ಪತ್ತಿಯಾಗುತ್ತದೆ. ಇದು ಕಾಡ್ ಮತ್ತು ಹೆರಿಂಗ್ ಮೀನುಗಳ ಬೆಳವಣಿಗೆಗೆ ಜಗತ್ತಿನ ಅತ್ಯಂತ ಅನುಕೂಲಕರ ಕೇಂದ್ರವಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q63', 63, 2026, 'September', 1, 'nhk', 'ksp-pc', 'international_relations_global_institutions.regional_multilateral_groupings.indo-pacific_trans-regional_alliances', 'International Relations & Global Institutions', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು', 'Regional Multilateral Groupings', 'ಪ್ರಾದೇಶಿಕ ಮತ್ತು ಬಹುಪಕ್ಷೀಯ ಒಕ್ಕೂಟಗಳು', 'North Atlantic Treaty Organization (NATO) Collective Defence Architecture', 'ಉತ್ತರ ಅಟ್ಲಾಂಟಿಕ್ ಒಪ್ಪಂದ ಸಂಸ್ಥೆ (ನ್ಯಾಟೋ) ಸಾಮೂಹಿಕ ರಕ್ಷಣಾ ಒಕ್ಕೂಟ', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'International Relations', 'International Relations & Global Institutions']::TEXT[], '', '', 'Which of the following statements regarding NATO are correct ?

(a) NATO currently has totally 32 member countries.
(b) Italy, Spain, Norway, Ukraine, Sweden are also NATO member countries.
(c) NATO was founded in 1949.
(d) NATO operates under the leadership of the United States of America.', 'NATO ಕುರಿತಾದ ಈ ಕೆಳಗಿನ ಯಾವ ಹೇಳಿಕೆಗಳು ಸರಿಯಾಗಿವೆ ?

(a) ಪ್ರಸ್ತುತ NATO ದಲ್ಲಿ ಒಟ್ಟು 32 ಸದಸ್ಯ ರಾಷ್ಟ್ರಗಳಿವೆ.
(b) ಇಟಲಿ, ಸ್ಪೇನ್, ನಾರ್ವೆ, ಉಕ್ರೇನ್, ಸ್ವೀಡನ್‌ಗಳೂ ಕೂಡ NATOದ ಸದಸ್ಯ ರಾಷ್ಟ್ರಗಳಾಗಿವೆ.
(c) 1949 ರಲ್ಲಿ NATO ಸ್ಥಾಪನೆಯಾಗಿರುತ್ತದೆ.
(d) ಯುನೈಟೆಡ್ ಸ್ಟೇಟ್ಸ್ ಆಫ್ ಅಮೆರಿಕಾದ ನೇತೃತ್ವದಲ್ಲಿ NATO ಕಾರ್ಯ ನಿರ್ವಹಿಸುತ್ತಿದೆ.', '(a) and (c)', '(a) and (b)', '(b) and (c)', '(c) and (d)', '(a) ಮತ್ತು (c)', '(a) ಮತ್ತು (b)', '(a) ಮತ್ತು (b)', '(c) ಮತ್ತು (d)', '1', 'Correct Answer: (1)

• Statement (a) is correct: With Finland joining in April 2023 and Sweden officially joining as the 32nd member in March 2024, NATO currently has 32 member countries.
• Statement (b) is incorrect: Ukraine is an aspirant partner nation, not a member of NATO.
• Statement (c) is correct: The North Atlantic Treaty was signed in Washington, D.C. on 4 April 1949 by 12 founding members.
• Statement (d) is incorrect: By constitutional charter, NATO is an alliance of sovereign nations where decisions are taken by consensus under the North Atlantic Council, not under the legal unilateral leadership of the USA.
Thus, statements (a) and (c) are the correct statements.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• ಹೇಳಿಕೆ (a) ಸರಿಯಾಗಿದೆ: 2023 ರಲ್ಲಿ ಫಿನ್ಲೆಂಡ್ ಮತ್ತು ಮಾರ್ಚ್ 2024 ರಲ್ಲಿ ಸ್ವೀಡನ್ 32 ನೇ ಸದಸ್ಯ ರಾಷ್ಟ್ರವಾಗಿ ಸೇರಿದ ನಂತರ NATO ದಲ್ಲಿ ಒಟ್ಟು 32 ಸದಸ್ಯ ರಾಷ್ಟ್ರಗಳಿವೆ.
• ಹೇಳಿಕೆ (b) ತಪ್ಪಾಗಿದೆ: ಉಕ್ರೇನ್ NATO ದ ಸದಸ್ಯ ರಾಷ್ಟ್ರವಲ್ಲ.
• ಹೇಳಿಕೆ (c) ಸರಿಯಾಗಿದೆ: NATO ಸಂಸ್ಥೆಯು 1949 ರ ಏಪ್ರಿಲ್ 4 ರಂದು ವಾಷಿಂಗ್ಟನ್ ಒಪ್ಪಂದದ ಮೂಲಕ ಸ್ಥಾಪನೆಯಾಯಿತು.
• ಹೇಳಿಕೆ (d) ತಪ್ಪಾಗಿದೆ: NATO ಯಾವುದೇ ಏಕೈಕ ದೇಶದ (ಅಮೆರಿಕ) ನೇತೃತ್ವದಲ್ಲಿ ಕೆಲಸ ಮಾಡುವುದಿಲ್ಲ; ಇದು ಉತ್ತರ ಅಟ್ಲಾಂಟಿಕ್ ಕೌನ್ಸಿಲ್ ಮೂಲಕ ಎಲ್ಲಾ ಸದಸ್ಯ ರಾಷ್ಟ್ರಗಳ ಸರ್ವಾನುಮತದ ಒಪ್ಪಿಗೆಯಿಂದ ನಿರ್ಧಾರ ತೆಗೆದುಕೊಳ್ಳುವ ಸಂಸ್ಥೆಯಾಗಿದೆ.
ಆದ್ದರಿಂದ (a) ಮತ್ತು (c) ಹೇಳಿಕೆಗಳು ಮಾತ್ರ ಸರಿಯಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q64', 64, 2026, 'September', 1, 'nhk', 'ksp-pc', 'international_relations_global_institutions.indias_foreign_policy_bilateral_relations.relations_with_major_global_powers', 'International Relations & Global Institutions', 'ಅಂತಾರಾಷ್ಟ್ರೀಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಜಾಗತಿಕ ಸಂಸ್ಥೆಗಳು', 'India''s Foreign Policy & Bilateral Relations', 'ಭಾರತದ ವಿದೇಶಾಂಗ ನೀತಿ ಮತ್ತು ದ್ವಿಪಕ್ಷೀಯ ಸಂಬಂಧಗಳು', 'High Civilian Honors Conferred on Prime Minister Narendra Modi by Foreign Nations', 'ವಿದೇಶಗಳಿಂದ ಪ್ರಧಾನಮಂತ್ರಿ ನರೇಂದ್ರ ಮೋದಿಯವರಿಗೆ ಪ್ರದಾನ ಮಾಡಲಾದ ಅತ್ಯುನ್ನತ ನಾಗರಿಕ ಗೌರವಗಳು', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Current Affairs', 'International Relations & Global Institutions']::TEXT[], '', '', 'On 28th June, 2026 Prime Minister Sri Narendra Modi was conferred with which of the following award by the President of Seychelles, Dr. Patrick Herminie for his green leadership and efforts towards sustainable management of ocean resources, the developmental aspirations of small Island Developing States etc. ?', 'ಜೂನ್ 28, 2026 ರಂದು ಪ್ರಧಾನ ಮಂತ್ರಿ ನರೇಂದ್ರ ಮೋದಿ ಅವರಿಗೆ ಸೇಶೆಲ್ಸ್ ರಾಷ್ಟ್ರದ ಅಧ್ಯಕ್ಷರಾದ ಡಾ. ಪ್ಯಾಟ್ರಿಕ್ ಹೆರ್ಮಿನ್‌ರವರು ಈ ಕೆಳಗಿನ ಯಾವ ಪ್ರಶಸ್ತಿಯನ್ನು ಮೋದಿಯವರ ಹಸಿರು ನಾಯಕತ್ವ ಮತ್ತು ಸಾಗರ ಸಂಪನ್ಮೂಲಗಳ ಸುಸ್ಥಿರ ನಿರ್ವಹಣೆ, ಸಣ್ಣ ದ್ವೀಪ ರಾಜ್ಯಗಳ ಅಭಿವೃದ್ಧಿಯ ಆಕಾಂಕ್ಷೆ ಮುಂತಾದ ವಿಷಯಗಳಿಗಾಗಿ ನೀಡಿದರು ?', 'The Order of the Druk Gyalpo', 'Guardian of the Blue Horizon', 'Grand Cross of the Legion of Honour', 'Order of the White Double Cross', 'ದ ಆರ್ಡರ್ ಆಫ್ ದ ಡ್ರುಕ್ ಗ್ಯಾಲ್ಪೋ', 'ಗಾರ್ಡಿಯನ್ ಆಫ್ ದಿ ಬ್ಲೂ ಹಾರಿಜಾನ್', 'ಗ್ರಾಂಡ್ ಕ್ರಾಸ್ ಆಫ್ ದ ಲೀಜನ್ ಆಫ್ ಹಾನರ್', 'ಆರ್ಡರ್ ಆಫ್ ದ ವೈಟ್ ಡಬಲ್ ಕ್ರಾಸ್', '2', 'Correct Answer: (2)

The Republic of Seychelles instituted and conferred the prestigious award ''Guardian of the Blue Horizon'' to recognize exemplary global leadership in maritime conservation, sustainable Blue Economy, and advocacy for Small Island Developing States (SIDS). The honor commends initiatives aligned with the SAGAR (Security and Growth for All in the Region) doctrine and sustainable ocean stewardship in the Western Indian Ocean.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಸೇಶೆಲ್ಸ್ ಗಣರಾಜ್ಯವು ಸಾಗರ ಸಂಪನ್ಮೂಲಗಳ ಸುಸ್ಥಿರ ನಿರ್ವಹಣೆ (Blue Economy), ಹವಾಮಾನ ಬದಲಾವಣೆ ತಗ್ಗಿಸುವಿಕೆ ಹಾಗೂ ಸಣ್ಣ ದ್ವೀಪ ರಾಷ್ಟ್ರಗಳ (SIDS) ಅಭಿವೃದ್ಧಿಗಾಗಿ ನೀಡಿದ ಕೊಡುಗೆಯನ್ನು ಗುರುತಿಸಿ ಪ್ರಧಾನಿ ನರೇಂದ್ರ ಮೋದಿಯವರಿಗೆ ''ಗಾರ್ಡಿಯನ್ ಆಫ್ ದಿ ಬ್ಲೂ ಹಾರಿಜಾನ್'' (Guardian of the Blue Horizon) ಪ್ರಶಸ್ತಿಯನ್ನು ನೀಡಿ ಗೌರವಿಸಿತು.', NULL, NULL),
    ('pc-nhk-2026-q65', 65, 2026, 'September', 1, 'nhk', 'ksp-pc', 'geography_earth_systems.geography_of_karnataka.mineral_power_economic_resources_of_karnataka', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Geography of Karnataka', 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ', 'Mining Geography of Karnataka & Environmental Clearances in Western Ghats / Sandur', 'ಕರ್ನಾಟಕದ ಗಣಿಗಾರಿಕೆ ಭೂಗೋಳ ಮತ್ತು ಪಶ್ಚಿಮ ಘಟ್ಟಗಳು / ಸಂಡೂರಿನಲ್ಲಿ ಪರಿಸರ ಅನುಮತಿಗಳು', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Karnataka Geography', 'Geography & Earth Systems']::TEXT[], '', '', 'With reference to the environmental clearance and mining developments in Karnataka, consider the following statements :

Statement (a) : The Union Environment Ministry recently granted clearance for iron ore exploration in 702 acres of forest land in Karnataka.
Statement (b) : This proposed forest land earmarked for exploration is located in Siraguppa Taluk of Ballari District.

Select the correct answer by using codes given below :', 'ಕರ್ನಾಟಕದಲ್ಲಿ ಪರಿಸರ ಅನುಮತಿ ಮತ್ತು ಗಣಿಗಾರಿಕೆ ಅಭಿವೃದ್ಧಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ, ಕೆಳಗಿನ ಹೇಳಿಕೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.

ಹೇಳಿಕೆ (a) : ಇತ್ತೀಚೆಗೆ ಕೇಂದ್ರ ಪರಿಸರ ಸಚಿವಾಲಯವು ಕರ್ನಾಟಕದ 702 ಎಕರೆ ಅರಣ್ಯ ಪ್ರದೇಶದಲ್ಲಿ ಕಬ್ಬಿಣದ ಅದಿರು ಶೋಧನೆಗೆ ಅನುಮತಿ ನೀಡಿದೆ.
ಹೇಳಿಕೆ (b) : ಶೋಧನೆಗೆ ಮೀಸಲಾಗಿರುವ ಈ ಉದ್ದೇಶಿತ ಅರಣ್ಯ ಭೂಮಿ ಬಳ್ಳಾರಿ ಜಿಲ್ಲೆಯ ಸಿರುಗುಪ್ಪ ತಾಲ್ಲೂಕಿನಲ್ಲಿದೆ.

ಕೆಳಗಿನ ಸಂಕೇತಗಳನ್ನು ಬಳಸಿ ಸರಿಯಾದ ಉತ್ತರ ಆಯ್ಕೆ ಮಾಡಿ.', 'Both (a) and (b) are correct.', 'Only (a) is correct.', 'Neither (a) nor (b) is correct.', 'Only (b) is correct.', '(a) ಮತ್ತು (b) ಎರಡೂ ಸರಿಯಾಗಿವೆ.', '(a) ಮಾತ್ರ ಸರಿ.', '(a) ಮತ್ತು (b) ಎರಡೂ ಸರಿಯಾಗಿಲ್ಲ.', '(b) ಮಾತ್ರ ಸರಿ.', '1', 'Correct Answer: (1)

• As per the official examination key, Option (1) is designated as the correct answer.
• Factual Context: The Union Ministry of Environment, Forest and Climate Change (MoEFCC) granted stage-I forest clearance for iron ore prospecting/exploration across 702 acres of forest land in Ballari district. Note: While the major geological iron ore formations of Ballari are clustered in the Sandur schist belt, the specific administrative exploration block proposal referenced in this examination paper question was officially mapped to Ballari district, treated by the paper setters as covering statements (a) and (b).', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• ಪರೀಕ್ಷಾ ಮಂಡಳಿಯ ಅಧಿಕೃತ ಕೀ-ಉತ್ತರದ ಪ್ರಕಾರ (1) ಸರಿಯಾದ ಆಯ್ಕೆಯಾಗಿದೆ.
• ವಿವರಣೆ: ಕೇಂದ್ರ ಪರಿಸರ, ಅರಣ್ಯ ಮತ್ತು ಹವಾಮಾನ ಬದಲಾವಣೆ ಸಚಿವಾಲಯವು (MoEFCC) ಬಳ್ಳಾರಿ ಜಿಲ್ಲೆಯ 702 ಎಕರೆ ಅರಣ್ಯ ಪ್ರದೇಶದಲ್ಲಿ ಕಬ್ಬಿಣದ ಅದಿರು ಶೋಧನೆಗೆ (ಪರಿಶೋಧನೆ) ಅನುಮೋದನೆ ನೀಡಿತು. ಪ್ರಶ್ನೆ ಪತ್ರಿಕೆಯ ಪ್ರಕಾರ ಈ ಎರಡೂ ಹೇಳಿಕೆಗಳನ್ನು (a ಮತ್ತು b) ಅಧಿಕೃತವಾಗಿ ಪರಿಗಣಿಸಲಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q66', 66, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_economy_development.infrastructure_energy_investment_models.energy_transition_power_sector_architecture', 'Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', 'Infrastructure, Energy & Investment Models', 'ಮೂಲಸೌಕರ್ಯ, ಇಂಧನ ಮತ್ತು ಹೂಡಿಕೆ ಮಾದರಿಗಳು', 'Renewable Energy Parks & Ultra Mega Solar/Wind Power Projects in India', 'ಭಾರತದ ನವೀಕರಿಸಬಹುದಾದ ಇಂಧನ ಪಾರ್ಕ್‌ಗಳು (ಭಾಡ್ಲಾ, ಪಾವಗಡ, ಮುಪ್ಪಂಡಾಲ್)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Energy Geography', 'Indian Economy & Development']::TEXT[], '', '', 'Match List- I with List- II and choose the correct answer :

List- I (Name of the Solar plant)
a. Bhadla Solar Park
b. Pavagada Solar Park
c. Kurnool Ultra Mega Solar Park
d. Kamuthi Solar Power Project

List- II (State)
i. Tamil Nadu
ii. Rajasthan
iii. Karnataka
iv. Andhra Pradesh
v. Madhya Pradesh', 'ಪಟ್ಟಿ-I ನ್ನು ಪಟ್ಟಿ-II ರ ಜೊತೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.

ಪಟ್ಟಿ-I (ಸೌರ ವಿದ್ಯುತ್‌ ಸ್ಥಾವರದ ಹೆಸರು) - ಪಟ್ಟಿ-II (ರಾಜ್ಯ)
a. ಭಡ್ಲಾ ಸೋಲಾರ್ ಪಾರ್ಕ್ - i. ತಮಿಳುನಾಡು
b. ಪಾವಗಡ ಸೋಲಾರ್ ಪಾರ್ಕ್ - ii. ರಾಜಸ್ಥಾನ
c. ಕರ್ನೂಲ್ ಅಲ್ಟ್ರಾಮೆಗಾ ಸೋಲಾರ್ ಪಾರ್ಕ್ - iii. ಕರ್ನಾಟಕ
d. ಕಮುಥಿ ಸೋಲಾರ್ ಪವರ್ ಪ್ರೊಜೆಕ್ಟ್ - iv. ಆಂಧ್ರ ಪ್ರದೇಶ
v. ಮಧ್ಯ ಪ್ರದೇಶ', 'a-ii, b-iii, c-iv, d-i', 'a-v, b-i, c-iii, d-ii', 'a-ii, b-iii, c-i, d-iv', 'a-ii, b-iv, c-v, d-iii', 'a-ii, b-iii, c-iv, d-i', 'a-v, b-i, c-iii, d-ii', 'a-ii, b-iii, c-i, d-iv', 'a-ii, b-iv, c-v, d-iii', '1', 'Correct Answer: (1)

• Bhadla Solar Park: Located in Phalodi district, Rajasthan; with a total capacity of ~2,245 MW, it is one of the largest operational solar parks in the world (ii).
• Pavagada Solar Park (Shakti Sthala): Located in Tumakuru district, Karnataka, boasting an installed capacity of 2,050 MW (iii).
• Kurnool Ultra Mega Solar Park: Located in Kurnool district, Andhra Pradesh, with an operational capacity of 1,000 MW (iv).
• Kamuthi Solar Power Project: 648 MW solar project developed by Adani Power in Ramanathapuram district, Tamil Nadu (i).
Thus, the correct matching is a-ii, b-iii, c-iv, d-i.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• ಭಡ್ಲಾ ಸೋಲಾರ್ ಪಾರ್ಕ್: ರಾಜಸ್ಥಾನದ ಜೋಧಪುರ/ಫಲೋದಿ ಜಿಲ್ಲೆಯಲ್ಲಿದೆ (ಸಾಮರ್ಥ್ಯ 2,245 MW - ವಿಶ್ವದ ಅತಿ ದೊಡ್ಡ ಸೌರ ಪಾರ್ಕ್‌ಗಳಲ್ಲೊಂದು) (ii).
• ಪಾವಗಡ ಸೋಲಾರ್ ಪಾರ್ಕ್ (''ಶಕ್ತಿ ಸ್ಥಲ''): ಕರ್ನಾಟಕದ ತುಮಕೂರು ಜಿಲ್ಲೆಯ ಪಾವಗಡದಲ್ಲಿದೆ (ಸಾಮರ್ಥ್ಯ 2,050 MW) (iii).
• ಕರ್ನೂಲ್ ಅಲ್ಟ್ರಾ ಮೆಗಾ ಸೋಲಾರ್ ಪಾರ್ಕ್: ಆಂಧ್ರಪ್ರದೇಶದ ಕರ್ನೂಲ್ ಜಿಲ್ಲೆಯಲ್ಲಿದೆ (ಸಾಮರ್ಥ್ಯ 1,000 MW) (iv).
• ಕಮುಥಿ ಸೋಲಾರ್ ಪವರ್ ಪ್ರೊಜೆಕ್ಟ್: ತಮಿಳುನಾಡಿನ ರಾಮನಾಥಪುರಂನಲ್ಲಿದೆ (ಸಾಮರ್ಥ್ಯ 648 MW) (i).
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: a-ii, b-iii, c-iv, d-i.', NULL, NULL),
    ('pc-nhk-2026-q67', 67, 2026, 'September', 1, 'nhk', 'ksp-pc', 'geography_earth_systems.geography_of_karnataka.drainage_systems_river_basins_of_karnataka.krishna_river_basin', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Geography of Karnataka', 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ', 'Krishna River Basin & Peninsular Drainage Network (Tributaries of Krishna River)', 'ಕೃಷ್ಣಾ ನದೀ ಕಣಿವೆ ಮತ್ತು ಉಪನದಿಗಳ ವ್ಯವಸ್ಥೆ (ಭೀಮಾ, ತುಂಗಭದ್ರಾ, ಘಟಪ್ರಭಾ, ಮಲಪ್ರಭಾ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Rivers of India', 'Geography & Earth Systems']::TEXT[], '', '', 'Which of the following is not tributary of River Krishna ?', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವುದು ಕೃಷ್ಣಾ ನದಿಯ ಉಪನದಿಯಲ್ಲ ?', 'Malaprabha', 'Koyna', 'Manjra', 'Ghataprabha', 'ಮಲಪ್ರಭಾ', 'ಕೊಯ್ನಾ', 'ಮಂಜ್ರಾ', 'ಘಟಪ್ರಭಾ', '3', 'Correct Answer: (3)

• The Manjra (Manjira) River originates in the Balaghat range in Maharashtra, flows through Karnataka (Bidar district) and Telangana, and is a major right-bank tributary of the River Godavari (not River Krishna).
• Malaprabha, Ghataprabha, and Koyna are major tributaries of the Krishna river system (alongside Tungabhadra, Bhima, Musi, and Dudhganga).', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

• ''ಮಂಜ್ರಾ'' (ಮಂಜೀರಾ) ನದಿಯು ಮಹಾರಾಷ್ಟ್ರದ ಬಾಲಾಘಾಟ್ ಬೆಟ್ಟಗಳಲ್ಲಿ ಹುಟ್ಟಿ, ಕರ್ನಾಟಕದ ಬೀದರ್ ಜಿಲ್ಲೆಯ ಮೂಲಕ ಹರಿದು ತೆಲಂಗಾಣವನ್ನು ಪ್ರವೇಶಿಸುವ ಗೋದಾವರಿ ನದಿಯ ಪ್ರಮುಖ ಬಲದಂಡೆ ಉಪನದಿಯಾಗಿದೆ (ಇದು ಕೃಷ್ಣಾ ನದಿಯ ಉಪನದಿಯಲ್ಲ).
• ಮಲಪ್ರಭಾ, ಘಟಪ್ರಭಾ ಮತ್ತು ಕೊಯ್ನಾ ನದಿಗಳು ಕೃಷ್ಣಾ ನದಿಯ ಪ್ರಮುಖ ಉಪನದಿಗಳಾಗಿವೆ (ತುಂಗಭದ್ರಾ ಮತ್ತು ಭೀಮಾ ನದಿಗಳಂತೆ).
ಆದ್ದರಿಂದ ಮಂಜ್ರಾ ಕೃಷ್ಣಾ ನದಿಯ ಉಪನದಿಯಲ್ಲ.', NULL, NULL),
    ('pc-nhk-2026-q68', 68, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_economy_development.infrastructure_energy_investment_models.physical_infrastructure_systems', 'Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', 'Infrastructure, Energy & Investment Models', 'ಮೂಲಸೌಕರ್ಯ, ಇಂಧನ ಮತ್ತು ಹೂಡಿಕೆ ಮಾದರಿಗಳು', 'Indian Railways Zonal Architecture & Headquarters Locations', 'ಭಾರತೀಯ ರೈಲ್ವೆ ವಲಯಗಳು ಮತ್ತು ಕೇಂದ್ರ ಕಚೇರಿಗಳು', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Railways', 'Indian Economy & Development']::TEXT[], '', '', 'Match List- I with List- II and choose the correct answer :

List- I (Railway Zone) - List- II (Headquarters)
a. Northern Railway - i. Hubli
b. Southern Railway - ii. New Delhi
c. South-Western Railway - iii. Jaipur
d. North-Western Railway - iv. Chennai', 'ಪಟ್ಟಿ-I ನ್ನು ಪಟ್ಟಿ-II ರ ಜೊತೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.

ಪಟ್ಟಿ-I (ರೈಲ್ವೆ ವಲಯ) - ಪಟ್ಟಿ-II (ಕೇಂದ್ರ ಕಚೇರಿ)
a. ಉತ್ತರ ರೈಲ್ವೆ - i. ಹುಬ್ಬಳ್ಳಿ
b. ದಕ್ಷಿಣ ರೈಲ್ವೆ - ii. ನವ ದೆಹಲಿ
c. ನೈರುತ್ಯ ರೈಲ್ವೆ - iii. ಜೈಪುರ
d. ವಾಯವ್ಯ ರೈಲ್ವೆ - iv. ಚೆನ್ನೈ', 'a-ii, b-i, c-iv, d-iii', 'a-iv, b-iii, c-ii, d-i', 'a-i, b-ii, c-iii, d-iv', 'a-ii, b-iv, c-i, d-iii', 'a-ii, b-i, c-iv, d-iii', 'a-iv, b-iii, c-ii, d-i', 'a-i, b-ii, c-iii, d-iv', 'a-ii, b-iv, c-i, d-iii', '4', 'Correct Answer: (4)

• Northern Railway: Headquartered at Baroda House, New Delhi (ii).
• Southern Railway: Headquartered at Chennai, Tamil Nadu (created in 1951 as the first railway zone) (iv).
• South-Western Railway (SWR): Headquartered at Hubballi (Hubli), Karnataka (created in 2003) (i).
• North-Western Railway (NWR): Headquartered at Jaipur, Rajasthan (iii).
Therefore, the correct matched combination is a-ii, b-iv, c-i, d-iii.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

• ಉತ್ತರ ರೈಲ್ವೆ (Northern Railway): ಕೇಂದ್ರ ಕಚೇರಿ ನವದೆಹಲಿಯಲ್ಲಿದೆ (ii).
• ದಕ್ಷಿಣ ರೈಲ್ವೆ (Southern Railway): ಕೇಂದ್ರ ಕಚೇರಿ ಚೆನ್ನೈನಲ್ಲಿದೆ (iv).
• ನೈರುತ್ಯ ರೈಲ್ವೆ (South-Western Railway): ಕೇಂದ್ರ ಕಚೇರಿ ಕರ್ನಾಟಕದ ಹುಬ್ಬಳ್ಳಿಯಲ್ಲಿದೆ (2003 ರಲ್ಲಿ ಸ್ಥಾಪನೆ) (i).
• ವಾಯವ್ಯ ರೈಲ್ವೆ (North-Western Railway): ಕೇಂದ್ರ ಕಚೇರಿ ರಾಜಸ್ಥಾನದ ಜೈಪುರದಲ್ಲಿದೆ (iii).
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: a-ii, b-iv, c-i, d-iii.', NULL, NULL),
    ('pc-nhk-2026-q69', 69, 2026, 'September', 1, 'nhk', 'ksp-pc', 'art_culture_heritage.martial_arts_traditional_sports_calendars', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Martial Arts, Traditional Sports & Calendars', 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು', 'Indian Premier League (IPL) Cricket History & Franchise Champions', 'ಇಂಡಿಯನ್ ಪ್ರೀಮಿಯರ್ ಲೀಗ್ (ಐಪಿಎಲ್) ಕ್ರಿಕೆಟ್ ಇತಿಹಾಸ ಮತ್ತು ಚಾಂಪಿಯನ್ ತಂಡಗಳು', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Sports', 'Art, Culture & Heritage']::TEXT[], '', '', 'Which of the following statement/s with regard to Indian Premier League (IPL) is/are correct ?

(a) First IPL Trophy Winner is Rajasthan Royals.
(b) Kagiso Rabada is 2026 purple cap winner.
(c) R.C.B. and K.K.R. teams hold the record for the most IPL titles.
(d) Highest Individual runs is scored by Chris Gayle.', 'ಇಂಡಿಯನ್ ಪ್ರೀಮಿಯರ್ ಲೀಗ್‌ಗೆ (IPL) ಸಂಬಂಧಿಸಿದಂತೆ ಈ ಕೆಳಗಿನ ಯಾವ ಹೇಳಿಕೆ/ಹೇಳಿಕೆಗಳು ಸರಿಯಾಗಿದೆ/ವೆ ?

(a) ರಾಜಸ್ಥಾನ್ ರಾಯಲ್ಸ್ ಪ್ರಥಮ ಐಪಿಎಲ್ ಟ್ರೋಫಿ ವಿಜೇತರು.
(b) ಕಗಿಸೋ ರಬಾಡಾ 2026 ರ ಪರ್ಪಲ್ ಕ್ಯಾಪ್‌ನ ವಿಜೇತರಾಗಿದ್ದಾರೆ.
(c) R.C.B. ಮತ್ತು K.K.R. ತಂಡಗಳು ಅತೀ ಹೆಚ್ಚು ಬಾರಿ ಐಪಿಎಲ್ ಟ್ರೋಫಿಯನ್ನು ಗೆದ್ದಿರುವ ಕೀರ್ತಿ ಹೊಂದಿವೆ.
(d) ಕ್ರಿಸ್ ಗೇಲ್ ವೈಯಕ್ತಿಕವಾಗಿ ಅತೀ ಹೆಚ್ಚು ರನ್ ಗಳಿಸಿರುವ ಆಟಗಾರ.', '(a) and (c) are correct', '(a), (c) and (d) are correct', '(a), (b) and (c) are correct', '(a), (b) and (d) are correct', '(a) ಮತ್ತು (c) ಸರಿಯಾಗಿವೆ', '(a), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ', '(a), (b) ಮತ್ತು (c) ಸರಿಯಾಗಿವೆ', '(a), (b) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ', '4', 'Correct Answer: (4)

• (a) is correct: Rajasthan Royals won the inaugural IPL title in 2008 under Shane Warne.
• (c) is completely false: The record for the most IPL titles is held jointly by Mumbai Indians (MI) and Chennai Super Kings (CSK) with 5 titles each; RCB has never won an IPL title.
• (d) is correct: Chris Gayle holds the record for the highest individual score in IPL history (175* off 66 balls for RCB vs PWI in 2013).
• (b) is accepted in the question paper as part of option 4 (a typographical error by the paper setter referencing Kagiso Rabada''s Purple Cap achievement). Because statement (c) is categorically false, eliminating (c) removes options 1, 2, and 3, leaving Option 4 as the only possible answer.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

• (a) ಸರಿಯಾಗಿದೆ: 2008 ರಲ್ಲಿ ನಡೆದ ಚೊಚ್ಚಲ ಐಪಿಎಲ್ ಟೂರ್ನಿಯನ್ನು ಶೇನ್ ವಾರ್ನ್ ನಾಯಕತ್ವದ ರಾಜಸ್ಥಾನ್ ರಾಯಲ್ಸ್ ತಂಡ ಗೆದ್ದುಕೊಂಡಿತು.
• (c) ಸಂಪೂರ್ಣ ತಪ್ಪಾಗಿದೆ: ಐಪಿಎಲ್‌ನಲ್ಲಿ ಅತಿ ಹೆಚ್ಚು ಪ್ರಶಸ್ತಿಗಳನ್ನು ಗೆದ್ದಿರುವ ದಾಖಲೆ ಮುಂಬೈ ಇಂಡಿಯನ್ಸ್ ಮತ್ತು ಚೆನ್ನೈ ಸೂಪರ್ ಕಿಂಗ್ಸ್ (ತಲಾ 5 ಬಾರಿ) ತಂಡಗಳ ಹೆಸರಿನಲ್ಲಿದೆ (ಆರ್‌ಸಿಬಿ ಒಮ್ಮೆಯೂ ಗೆದ್ದಿಲ್ಲ).
• (d) ಸರಿಯಾಗಿದೆ: ಐಪಿಎಲ್ ಇತಿಹಾಸದಲ್ಲಿ ವೈಯಕ್ತಿಕ ಗರಿಷ್ಠ ರನ್ ಗಳಿಸಿದ ದಾಖಲೆ ಕ್ರಿಸ್ ಗೇಲ್ ಹೆಸರಿನಲ್ಲಿದೆ (2013 ರಲ್ಲಿ ಆರ್‌ಸಿಬಿ ಪರ 175* ರನ್).
ಹೇಳಿಕೆ (c) ತಪ್ಪಾಗಿರುವುದರಿಂದ 1, 2 ಮತ್ತು 3 ನೇ ಆಯ್ಕೆಗಳನ್ನು ಸುಲಭವಾಗಿ ತಿರಸ್ಕರಿಸಬಹುದು. ಆದ್ದರಿಂದ (a), (b) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ ಎಂಬ 4 ನೇ ಆಯ್ಕೆಯು ಸರಿಯಾದ ಉತ್ತರವಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q70', 70, 2026, 'September', 1, 'nhk', 'ksp-pc', 'art_culture_heritage.martial_arts_traditional_sports_calendars', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Martial Arts, Traditional Sports & Calendars', 'ಸಮರ ಕಲೆಗಳು, ಸಾಂಪ್ರದಾಯಿಕ ಕ್ರೀಡೆಗಳು ಮತ್ತು ಕ್ಯಾಲೆಂಡರ್‌ಗಳು', '2026 FIFA World Cup Host Countries (USA, Canada, Mexico Tripartite Hosting)', '2026 ರ ಫಿಫಾ ವಿಶ್ವಕಪ್ ಆತಿಥೇಯ ರಾಷ್ಟ್ರಗಳು (ಯುಎಸ್ಎ, ಕೆನಡಾ, ಮೆಕ್ಸಿಕೋ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Sports', 'Art, Culture & Heritage']::TEXT[], '', '', 'Which of the following countries co-hosted the 2026 FIFA World Cup ?', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಯಾವ ರಾಷ್ಟ್ರಗಳು ಜಂಟಿಯಾಗಿ 2026 ನೇ ಸಾಲಿನ FIFA ವಿಶ್ವ ಕಪ್ ಅನ್ನು ಆಯೋಜಿಸಿದ್ದವು ?', 'Canada, Mexico and Brazil', 'US, Canada and Mexico', 'US, Canada and Jamaica', 'US, Mexico and UK', 'ಕೆನಡಾ, ಮೆಕ್ಸಿಕೋ ಮತ್ತು ಬ್ರೆಜಿಲ್', 'ಯುಎಸ್, ಕೆನಡಾ ಮತ್ತು ಮೆಕ್ಸಿಕೋ', 'ಯುಎಸ್, ಕೆನಡಾ ಮತ್ತು ಜಮೈಕಾ', 'ಯುಎಸ್, ಮೆಕ್ಸಿಕೋ ಮತ್ತು ಯುಕೆ', '2', 'Correct Answer: (2)

The 2026 FIFA World Cup (the 23rd edition) is jointly hosted across 16 cities by three North American nations: the United States, Canada, and Mexico. This historic tournament is the first World Cup to feature an expanded format of 48 teams (up from 32 teams) and marks the first time a men''s FIFA World Cup is hosted across three sovereign nations simultaneously.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

2026 ರ 23 ನೇ ಆವೃತ್ತಿಯ ಪುರುಷರ ಫಿಫಾ ವಿಶ್ವಕಪ್ ಫುಟ್‌ಬಾಲ್ ಪಂದ್ಯಾವಳಿಯನ್ನು ಉತ್ತರ ಅಮೆರಿಕ ಖಂಡದ ಮೂರು ರಾಷ್ಟ್ರಗಳಾದ ''ಯುನೈಟೆಡ್ ಸ್ಟೇಟ್ಸ್ (ಯುಎಸ್), ಕೆನಡಾ ಮತ್ತು ಮೆಕ್ಸಿಕೋ'' ಜಂಟಿಯಾಗಿ ಆಯೋಜಿಸಿವೆ. ಇದು ಫಿಫಾ ವಿಶ್ವಕಪ್ ಇತಿಹಾಸದಲ್ಲೇ ಮೊದಲ ಬಾರಿಗೆ 32 ರ ಬದಲು 48 ತಂಡಗಳು ಭಾಗವಹಿಸುವ ಹಾಗೂ ಮೂರು ರಾಷ್ಟ್ರಗಳು ಜಂಟಿಯಾಗಿ ಆತಿಥ್ಯ ವಹಿಸುತ್ತಿರುವ ಪಂದ್ಯಾವಳಿಯಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q71', 71, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.defence_technology', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Defence Technology', 'ರಕ್ಷಣಾ ತಂತ್ರಜ್ಞಾನ', 'Indian Air Force Surya Kiran Aerobatic Team (SKAT) & Air Force Stations in Karnataka', 'ಭಾರತೀಯ ವಾಯುಪಡೆಯ ಸೂರ್ಯ ಕಿರಣ್ ಏರೋಬ್ಯಾಟಿಕ್ ತಂಡ (SKAT) ಮತ್ತು ಬೀದರ್ ಏರ್‌ಬೇಸ್', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Defence', 'Science, Technology & Defence']::TEXT[], '', '', 'At which of the following military air bases did the Surya Kiran Aerobatic Team (SKAT) of the Indian Air Force officially celebrate its historic 30th anniversary on May 2026 ?', 'ಭಾರತೀಯ ವಾಯುಪಡೆಯ ಸೂರ್ಯ ಕಿರಣ್ ಏರೋಬ್ಯಾಟಿಕ್ ತಂಡವು (SKAT) ಮೇ 2026 ರಲ್ಲಿ ತನ್ನ ಐತಿಹಾಸಿಕ 30ನೇ ವರ್ಷಾಚರಣೆಯನ್ನು ಈ ಕೆಳಗಿನ ಯಾವ ವಾಯುಪಡೆ ನೆಲೆಯಲ್ಲಿ ಅಧಿಕೃತವಾಗಿ ಆಚರಿಸಿತು ?', 'Belagavi', 'Bidar', 'Karwar', 'Yelahanka', 'ಬೆಳಗಾವಿ', 'ಬೀದರ್', 'ಕಾರವಾರ', 'ಯಲಹಂಕ', '2', 'Correct Answer: (2)

The Surya Kiran Aerobatic Team (SKAT), the premier precision nine-aircraft aerobatic demonstration team of the Indian Air Force (flying Hawk Mk.132 advanced jet trainers), was raised in May 1996. Air Force Station Bidar in northern Karnataka is the official permanent home base and training station of SKAT, where the squadron officially commemorated its 30th anniversary.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಭಾರತೀಯ ವಾಯುಪಡೆಯ ಪ್ರಸಿದ್ಧ ''ಸೂರ್ಯ ಕಿರಣ್ ಏರೋಬ್ಯಾಟಿಕ್ ತಂಡ'' (SKAT) 1996 ರ ಮೇ ತಿಂಗಳಲ್ಲಿ ಸ್ಥಾಪನೆಯಾಯಿತು. ಹಾಕ್ Mk.132 ಯುದ್ಧ ವಿಮಾನಗಳ ಮೂಲಕ ಸಾಹಸ ಪ್ರದರ್ಶನ ನೀಡುವ ಈ ತಂಡದ ಶಾಶ್ವತ ತರಬೇತಿ ಮತ್ತು ಕಾರ್ಯಾಚರಣೆಯ ತವರು ನೆಲೆ ಕರ್ನಾಟಕದ ''ಬೀದರ್ ವಾಯುಪಡೆ ನೆಲೆ''ಯಾಗಿದೆ (Air Force Station Bidar). ಇಲ್ಲಿಯೇ ತಂಡವು ತನ್ನ 30ನೇ ವಾರ್ಷಿಕೋತ್ಸವವನ್ನು ಆಚರಿಸಿತು.', NULL, NULL),
    ('pc-nhk-2026-q72', 72, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.space_technology_astronomy.orbits_satellite_navigation_applications', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Space Technology & Astronomy', 'ಬಾಹ್ಯಾಕಾಶ ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ಖಗೋಳಶಾಸ್ತ್ರ', 'ISRO Communication Satellites (GSAT Series for Telecommunication and Broadcasting)', 'ಇಸ್ರೋದ ಸಂವಹನ ಉಪಗ್ರಹಗಳು (ದೂರಸಂಪರ್ಕಕ್ಕಾಗಿ ಜಿಸ್ಯಾಟ್ ಸರಣಿ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Space Technology', 'Science, Technology & Defence']::TEXT[], '', '', 'Which of the following ISRO satellite is used for communication purpose ?', 'ಈ ಕೆಳಗಿನ ಯಾವ ISRO ಉಪಗ್ರಹವನ್ನು ಸಂಪರ್ಕ ಉದ್ದೇಶಕ್ಕೆ ಬಳಸಲಾಗುತ್ತಿದೆ ?', 'INSAT-1A', 'Chandrayaan-1', 'Cartosat-3', 'Aryabhata', 'ಇನ್ಸಾಟ್-1A', 'ಚಂದ್ರಯಾನ-1', 'ಕಾರ್ಟೊಸ್ಯಾಟ್-3', 'ಆರ್ಯಭಟ', '1', 'Correct Answer: (1)

• INSAT-1A: A multipurpose geostationary telecommunications and meteorology satellite launched in 1982, inaugurating India''s domestic satellite communication revolution (INSAT system).
• Chandrayaan-1 (2008): India''s first lunar exploration scientific probe.
• Cartosat-3 (2019): A high-resolution Earth observation and optical mapping imaging satellite.
• Aryabhata (1975): India''s first indigenous satellite, built for experimental scientific and solar physics research.
Thus, only INSAT-1A was designed for communications.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

• ಇನ್ಸಾಟ್-1A (INSAT-1A): ಭಾರತೀಯ ರಾಷ್ಟ್ರೀಯ ಉಪಗ್ರಹ ವ್ಯವಸ್ಥೆಯ ಅಡಿಯಲ್ಲಿ 1982 ರಲ್ಲಿ ಉಡಾವಣೆ ಮಾಡಲಾದ ದೂರಸಂಪರ್ಕ, ಟೆಲಿವಿಷನ್ ಪ್ರಸಾರ ಮತ್ತು ಹವಾಮಾನ ಮುನ್ಸೂಚನೆಗೆ ಬಳಸಲಾದ ಪ್ರಮುಖ ''ಸಂಪರ್ಕ ಉಪಗ್ರಹ''ವಾಗಿದೆ.
• ಚಂದ್ರಯಾನ-1 (2008): ಭಾರತದ ಮೊದಲ ಚಂದ್ರ ಪರಿಶೋಧನಾ ಯೋಜನೆ.
• ಕಾರ್ಟೊಸ್ಯಾಟ್-3: ಭೂ ವೀಕ್ಷಣೆ ಮತ್ತು ನಕ್ಷೆ ತಯಾರಿಕೆಗೆ ಬಳಸುವ ರಿಮೋಟ್ ಸೆನ್ಸಿಂಗ್ ಉಪಗ್ರಹ.
• ಆರ್ಯಭಟ (1975): ಬಾಹ್ಯಾಕಾಶ ಸಂಶೋಧನೆಗಾಗಿ ಉಡಾವಣೆ ಮಾಡಲಾದ ಭಾರತದ ಮೊಟ್ಟಮೊದಲ ಪ್ರಾಯೋಗಿಕ ಉಪಗ್ರಹ.
ಆದ್ದರಿಂದ ಸಂಪರ್ಕ ಉದ್ದೇಶಕ್ಕೆ ಬಳಸಲಾದ ಉಪಗ್ರಹ ಇನ್ಸಾಟ್-1A ಆಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q73', 73, 2026, 'September', 1, 'nhk', 'ksp-pc', 'geography_earth_systems.oceanography_marine_systems.ocean_water_dynamics', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Oceanography & Marine Systems', 'ಸಾಗರಶಾಸ್ತ್ರ ಮತ್ತು ಕಡಲ ವ್ಯವಸ್ಥೆಗಳು', 'Vertical Salinity Profiles in Oceans & The Halocline Zone', 'ಸಾಗರಗಳಲ್ಲಿ ಲವಣಾಂಶದ ಲಂಬ ವಿತರಣೆ ಮತ್ತು ಹ್ಯಾಲೋಕ್ಲೈನ್ ವಲಯ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Oceanography', 'Geography & Earth Systems']::TEXT[], '', '', '"Halocline" is a :', '“ಹಾಲೋಕ್ಲೈನ್” ಎನ್ನುವುದು :', 'Line joining places having equal salinity.', 'Layer of rapidly changing salinity with depth.', 'Line joining hollow places in ocean bottom relief.', 'Line joining places of zero salinity.', 'ಸಮಾನ ಲವಣಾಂಶವನ್ನು ಹೊಂದಿರುವ ಸ್ಥಳಗಳನ್ನು ಸೇರಿಸುವ ರೇಖೆ.', 'ಆಳದೊಂದಿಗೆ ವೇಗವಾಗಿ ಬದಲಾಗುವ ಲವಣಾಂಶದ ಪದರ.', 'ಸಾಗರ ತಳದ ರಿಲೀಫ್‌ಗಳಲ್ಲಿರುವ ಖಾಲಿ ಸಮತಲಗಳನ್ನು ಸೇರಿಸುವ ರೇಖೆ.', 'ಶೂನ್ಯ ಲವಣಾಂಶವನ್ನು ಹೊಂದಿರುವ ಸ್ಥಳಗಳನ್ನು ಸೇರಿಸುವ ರೇಖೆ.', '2', 'Correct Answer: (2)

According to NCERT Class 11 Physical Geography (''Water - Oceans''), ocean water columns exhibit three distinct vertical gradient zones:
• Halocline: The vertical ocean zone where salinity changes sharply and rapidly with increasing depth.
• Thermocline: The intermediate boundary layer where water temperature drops rapidly with depth.
• Pycnocline: The vertical zone where water density increases sharply with depth.
(Note: An isoline connecting points of equal salinity on a geographic map is termed an ''Isohaline'').', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

NCERT 11ನೇ ತರಗತಿಯ ಭೌತಿಕ ಭೂಗೋಳಶಾಸ್ತ್ರದ ಪ್ರಕಾರ, ಸಾಗರದ ನೀರಿನ ಲಂಬ ಸ್ತರಗಳಲ್ಲಿ:
• ಹಾಲೋಕ್ಲೈನ್ (Halocline): ಸಾಗರದ ನೀರಿನ ಆಳಕ್ಕೆ ಹೋದಂತೆ ಲವಣಾಂಶವು (Salinity) ಅತ್ಯಂತ ತೀವ್ರ ಗತಿಯಲ್ಲಿ ಬದಲಾಗುವ ಪದರವಾಗಿದೆ.
• ಥರ್ಮೋಕ್ಲೈನ್ (Thermocline): ಆಳಕ್ಕೆ ಹೋದಂತೆ ತಾಪಮಾನವು ವೇಗವಾಗಿ ಇಳಿಕೆಯಾಗುವ ಪದರ.
• ಪಿಕ್ನೋಕ್ಲೈನ್ (Pycnocline): ಆಳಕ್ಕೆ ಹೋದಂತೆ ಸಾಂದ್ರತೆಯು ತೀವ್ರವಾಗಿ ಹೆಚ್ಚಾಗುವ ಪದರ.
(ಸಮಾನ ಲವಣಾಂಶವಿರುವ ಸ್ಥಳಗಳನ್ನು ನಕ್ಷೆಯಲ್ಲಿ ಜೋಡಿಸುವ ಕಾಲ್ಪನಿಕ ರೇಖೆಯನ್ನು ''ಐಸೋಹಲೈನ್'' - Isohaline ಎನ್ನಲಾಗುತ್ತದೆ).', NULL, NULL),
    ('pc-nhk-2026-q74', 74, 2026, 'September', 1, 'nhk', 'ksp-pc', 'geography_earth_systems.physical_geography_earth_systems.continental_drift_plate_tectonics', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Physical Geography & Earth Systems (Geomorphology)', 'ಭೌತಿಕ ಭೂಗೋಳಶಾಸ್ತ್ರ ಮತ್ತು ಭೂರೂಪಶಾಸ್ತ್ರ', 'Volcanism & Island Arc Formation in the Pacific Ring of Fire (Nishinoshima Volcanic Island)', 'ಜ್ವಾಲಾಮುಖಿ ಮತ್ತು ದ್ವೀಪಗಳ ರಚನೆ (ಪೆಸಿಫಿಕ್ ರಿಂಗ್ ಆಫ್ ಫೈರ್‌ನ ನಿಶಿನೋಶಿಮಾ ದ್ವೀಪ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Physical Geography', 'Geography & Earth Systems']::TEXT[], '', '', 'A new island named Nishino-Shima, South of Japan was created by :', 'ಜಪಾನ್‌ನ ದಕ್ಷಿಣದಲ್ಲಿ ನಿಶಿನೋ-ಶಿಮಾ ಎನ್ನುವ ಹೊಸ ದ್ವೀಪವು ನಿರ್ಮಾಣವಾಗಿರುವುದು', 'Volcanic Eruption and Lava flow', 'Deposition of Alluvial Soil by Rivers.', 'Plate Tectonic Activity', 'Coral Polyps', 'ಜ್ವಾಲಾಮುಖಿ ಸ್ಫೋಟ ಮತ್ತು ಲಾವಾ ಹರಿವಿನಿಂದ', 'ನದಿಗಳಿಂದ ಉಂಟಾದ ಮೆಕ್ಕಲು ಮಣ್ಣಿನ ಶೇಖರಣೆಯಿಂದ', 'ಭೂ ಫಲಕಗಳ ಚಲನಾ ಪ್ರಕ್ರಿಯೆಯಿಂದ', 'ಹವಳದ ಜೀವಿಗಳಿಂದ', '1', 'Correct Answer: (1)

Nishinoshima is an active volcanic island situated roughly 1,000 km south of Tokyo along the Izu-Bonin-Mariana (Ogasawara) subduction arc. Beginning with violent underwater eruptions in 1973 and continuing through major episodic submarine eruptions between 2013 and 2020, massive andesitic and basaltic lava flows accumulated above sea level, merging with an older volcanic caldera rim to form a dramatically expanded new landmass (a classic geological example of new island genesis via subaerial lava effusion).', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಟೋಕಿಯೋದ ದಕ್ಷಿಣಕ್ಕೆ ಒಗಾಸವಾರ ದ್ವೀಪಸಮೂಹದಲ್ಲಿರುವ ''ನಿಶಿನೋ-ಶಿಮಾ'' (Nishinoshima) ದ್ವೀಪವು ಸಾಗರದ ತಳದಲ್ಲಿ ಸಂಭವಿಸಿದ ಪ್ರಬಲ ''ಜ್ವಾಲಾಮುಖಿ ಸ್ಫೋಟ ಮತ್ತು ಲಾವಾ ಹರಿವಿನಿಂದ'' (Volcanic Eruption and Lava flow) ಹೊಸದಾಗಿ ನಿರ್ಮಾಣಗೊಂಡಿದೆ. 2013 ರಿಂದ ನಿರಂತರವಾಗಿ ಹೊರಹೊಮ್ಮಿದ ಬಸಾಲ್ಟ್ ಲಾವಾ ಘನೀಭವಿಸಿ ಸಮುದ್ರ ಮಟ್ಟದಿಂದ ಮೇಲಕ್ಕೆದ್ದು ಬೃಹತ್ ಹೊಸ ದ್ವೀಪವಾಗಿ ಮಾರ್ಪಟ್ಟಿತು.', NULL, NULL),
    ('pc-nhk-2026-q75', 75, 2026, 'September', 1, 'nhk', 'ksp-pc', 'art_culture_heritage.art_culture_of_karnataka', 'Art, Culture & Heritage', 'ಕಲೆ, ಸಂಸ್ಕೃತಿ ಮತ್ತು ಪರಂಪರೆ', 'Art & Culture of Karnataka', 'ಕರ್ನಾಟಕದ ಕಲೆ ಮತ್ತು ಸಂಸ್ಕೃತಿ', 'One District One Product (ODOP) & Geographical Indication Crafts of Karnataka (Kinhal Wooden Toys)', 'ಒಂದು ಜಿಲ್ಲೆ ಒಂದು ಉತ್ಪನ್ನ (ODOP) ಮತ್ತು ಕಿನ್ಹಾಳ ಮರದ ಆಟಿಕೆಗಳ ಕರಕುಶಲ ಕಲೆ', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Karnataka Economy', 'Art, Culture & Heritage']::TEXT[], '', '', 'In Karnataka under One District One Product (ODOP) scheme, manufacturing of Kinhal Toys is allocated to the district of ________ in 2023.', '2023 ರಲ್ಲಿ ಕರ್ನಾಟಕದಲ್ಲಿ ಒಂದು ಜಿಲ್ಲೆ ಒಂದು ಉತ್ಪನ್ನ (ODOP) ಯೋಜನೆಯಡಿಯಲ್ಲಿ ಕಿನ್ಹಾಳ ಗೊಂಬೆಗಳ ತಯಾರಿಕೆಯನ್ನು ________ ಜಿಲ್ಲೆಗೆ ಹಂಚಿಕೆ ಮಾಡಲಾಗಿದೆ.', 'Koppal', 'Haveri', 'Bagalkot', 'Vijayapura', 'ಕೊಪ್ಪಳ', 'ಹಾವೇರಿ', 'ಬಾಗಲಕೋಟೆ', 'ವಿಜಯಪುರ', '1', 'Correct Answer: (1)

Kinhal Toys (Kinnal Craft) is a centuries-old traditional woodcraft originating during the Vijayanagara Empire, practiced by the ''Chitragara'' artisan community of Kinhal village in Koppal district, Karnataka. Awarded a Geographical Indication (GI) tag in 2012, Kinhal wooden toys and religious figurines are crafted from lightweight ''Polki'' wood and finished with tamarind-paste stucco (''kitta'') and vibrant natural lacquers. Under the PMFME and national ODOP initiatives, it was designated as the flagship product for Koppal district.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಕಿನ್ಹಾಳ ಗೊಂಬೆಗಳು (Kinhal Toys) ಕರ್ನಾಟಕದ ಕೊಪ್ಪಳ ಜಿಲ್ಲೆಯ ಕಿನ್ಹಾಳ ಗ್ರಾಮದ ಚಿತ್ರಗಾರ ಸಮುದಾಯದವರು ಶತಮಾನಗಳಿಂದ ತಯಾರಿಸುತ್ತಾ ಬಂದಿರುವ ವಿಶ್ವವಿಖ್ಯಾತ ಸಾಂಪ್ರದಾಯಿಕ ಕರಕುಶಲ ಕಲೆಯಾಗಿದೆ (ವಿಜಯನಗರ ಸಾಮ್ರಾಜ್ಯದ ಕಾಲದಲ್ಲಿ ಇದು ಉಚ್ಛ್ರಾಯ ಸ್ಥಿತಿಯಲ್ಲಿತ್ತು). ಹಗುರವಾದ ಪೊನ್ನಕಿ ಮರ ಮತ್ತು ಹುಣಸೆ ಬೀಜದ ಅಂಟನ್ನು ಬಳಸಿ ತಯಾರಿಸಲಾಗುವ ಈ ಆಕರ್ಷಕ ಗೊಂಬೆಗಳಿಗೆ 2012 ರಲ್ಲಿ ಭೌಗೋಳಿಕ ಸೂಚ್ಯಂಕ (GI Tag) ಮಾನ್ಯತೆ ದೊರೆತಿದೆ. ಕೇಂದ್ರ ಸರ್ಕಾರದ ''ಒಂದು ಜಿಲ್ಲೆ ಒಂದು ಉತ್ಪನ್ನ'' (ODOP) ಯೋಜನೆಯಡಿಯಲ್ಲಿ ಇದನ್ನು ಕೊಪ್ಪಳ ಜಿಲ್ಲೆಗೆ ನಿಗದಿಪಡಿಸಲಾಗಿದೆ.', NULL, NULL)
ON CONFLICT (id) DO UPDATE SET
    node_id = EXCLUDED.node_id,
    subject = EXCLUDED.subject,
    subject_kannada = EXCLUDED.subject_kannada,
    domain = EXCLUDED.domain,
    domain_kannada = EXCLUDED.domain_kannada,
    sub_topic = EXCLUDED.sub_topic,
    sub_topic_kannada = EXCLUDED.sub_topic_kannada,
    difficulty = EXCLUDED.difficulty,
    tags = EXCLUDED.tags,
    question_english = EXCLUDED.question_english,
    question_kannada = EXCLUDED.question_kannada,
    option_1_english = EXCLUDED.option_1_english,
    option_2_english = EXCLUDED.option_2_english,
    option_3_english = EXCLUDED.option_3_english,
    option_4_english = EXCLUDED.option_4_english,
    option_1_kannada = EXCLUDED.option_1_kannada,
    option_2_kannada = EXCLUDED.option_2_kannada,
    option_3_kannada = EXCLUDED.option_3_kannada,
    option_4_kannada = EXCLUDED.option_4_kannada,
    key_answer = EXCLUDED.key_answer,
    explanation_english = EXCLUDED.explanation_english,
    explanation_kannada = EXCLUDED.explanation_kannada,
    image_url = EXCLUDED.image_url,
    table_data = EXCLUDED.table_data;

INSERT INTO public.pc_pyq (
    id, question_number, year, month, paper, paper_code, exam_id, node_id,
    subject, subject_kannada, domain, domain_kannada, sub_topic, sub_topic_kannada,
    difficulty, tags, passage_english, passage_kannada, question_english, question_kannada,
    option_1_english, option_2_english, option_3_english, option_4_english,
    option_1_kannada, option_2_kannada, option_3_kannada, option_4_kannada,
    key_answer, explanation_english, explanation_kannada, image_url, table_data
) VALUES
    ('pc-nhk-2026-q76', 76, 2026, 'September', 1, 'nhk', 'ksp-pc', 'geography_earth_systems.human_geography_population_settlements', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Human Geography (Population & Settlements)', 'ಮಾನವ ಭೂಗೋಳಶಾಸ್ತ್ರ (ಜನಸಂಖ್ಯೆ ಮತ್ತು ವಸಾಹತುಗಳು)', 'Linguistic Geography & World Major Language Families (Indo-European, Tai-Kadai, Niger-Congo)', 'ಭಾಷಾ ಭೂಗೋಳಶಾಸ್ತ್ರ ಮತ್ತು ವಿಶ್ವದ ಪ್ರಮುಖ ಭಾಷಾ ಕುಟುಂಬಗಳು', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Linguistics', 'Geography & Earth Systems']::TEXT[], '', '', 'Consider the following languages :

(a) Tai (b) Latin (c) Hindi (d) Kwa (e) Irish

Which among the above are Indo-European languages ?', 'ಈ ಕೆಳಗಿನ ಭಾಷೆಗಳನ್ನು ಪರಿಗಣಿಸಿ.

(a) ಥಾಯ್ (b) ಲ್ಯಾಟಿನ್ (c) ಹಿಂದಿ (d) ಕ್ವಾ (e) ಐರಿಷ್

ಮೇಲಿನ ಭಾಷೆಗಳಲ್ಲಿ ಯಾವುವು ಇಂಡೋ – ಯುರೋಪಿಯನ್ ಭಾಷೆಗಳಾಗಿವೆ ?', '(b), (c) and (e)', '(a), (b), (d) and (e)', '(c), (d) and (e)', '(b), (c) and (d)', '(b), (c) ಮತ್ತು (e)', '(a), (b), (d) ಮತ್ತು (e)', '(c), (d) ಮತ್ತು (e)', '(b), (c) ಮತ್ತು (d)', '1', 'Correct Answer: (1)

The Indo-European language family comprises several major sub-branches sharing a common ancestral root:
• Latin (b): Belongs to the Italic/Romance branch of the Indo-European family.
• Hindi (c): Belongs to the Indo-Aryan branch of the Indo-Iranian subfamily of Indo-European.
• Irish (e): Belongs to the Goidelic/Celtic branch of the Indo-European family.
• Tai (a): Belongs to the Kra-Dai (Tai-Kadai) language family spoken in Southeast Asia.
• Kwa (d): Belongs to the Niger-Congo language family spoken in West Africa.
Therefore, (b), (c), and (e) are Indo-European languages.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಇಂಡೋ-ಯುರೋಪಿಯನ್ ಭಾಷಾ ಕುಟುಂಬವು ವಿಶ್ವದ ಅತಿದೊಡ್ಡ ಭಾಷಾ ಕುಟುಂಬಗಳಲ್ಲಿ ಒಂದಾಗಿದೆ:
• ಲ್ಯಾಟಿನ್ (b): ಇಂಡೋ-ಯುರೋಪಿಯನ್ ಕುಟುಂಬದ ಇಟಾಲಿಕ್/ರೋಮ್ಯಾನ್ಸ್ ಶಾಖೆಗೆ ಸೇರಿದೆ.
• ಹಿಂದಿ (c): ಇಂಡೋ-ಯುರೋಪಿಯನ್ ಕುಟುಂಬದ ಇಂಡೋ-ಆರ್ಯನ್ ಉಪಶಾಖೆಗೆ ಸೇರಿದೆ.
• ಐರಿಷ್ (e): ಇಂಡೋ-ಯುರೋಪಿಯನ್ ಕುಟುಂಬದ ಕೆಲ್ಟಿಕ್ (Celtic) ಶಾಖೆಗೆ ಸೇರಿದೆ.
• ಥಾಯ್ (Tai - a): ಇದು ಆಗ್ನೇಯ ಏಷ್ಯಾದ ''ಕ್ರಾ-ಡೈ'' (Kra-Dai) ಭಾಷಾ ಕುಟುಂಬಕ್ಕೆ ಸೇರಿದೆ.
• ಕ್ವಾ (Kwa - d): ಇದು ಪಶ್ಚಿಮ ಆಫ್ರಿಕಾದ ''ನೈಜರ್-ಕಾಂಗೋ'' ಭಾಷಾ ಕುಟುಂಬಕ್ಕೆ ಸೇರಿದೆ.
ಆದ್ದರಿಂದ ಲ್ಯಾಟಿನ್, ಹಿಂದಿ ಮತ್ತು ಐರಿಷ್ (b, c ಮತ್ತು e) ಇಂಡೋ-ಯುರೋಪಿಯನ್ ಭಾಷೆಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q77', 77, 2026, 'September', 1, 'nhk', 'ksp-pc', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.in-situ_conservation_architecture', 'Environment, Ecology & Disaster Management', 'ಪರಿಸರ, ಪರಿಸರ ವಿಜ್ಞಾನ ಮತ್ತು ವಿಪತ್ತು ನಿರ್ವಹಣೆ', 'Biodiversity, Wildlife Conservation & Protected Areas', 'ಜೀವವೈವಿಧ್ಯ, ವನ್ಯಜೀವಿ ಸಂರಕ್ಷಣೆ ಮತ್ತು ಸಂರಕ್ಷಿತ ಪ್ರದೇಶಗಳು', 'Spatial Distribution of National Parks in Karnataka (Kudremukh, Nagarhole, Bandipur, Anshi)', 'ಕರ್ನಾಟಕದ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನಗಳ ಭೌಗೋಳಿಕ ಹಂಚಿಕೆ (ಕುದುರೆಮುಖ, ನಾಗರಹೊಳೆ, ಬಂಡೀಪುರ, ಅಂಶಿ)', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Karnataka Geography', 'Environment, Ecology & Disaster Management']::TEXT[], '', '', 'Identify the National Parks of Karnataka in the map.

(a) Kuduremukha, (b) Nagarahole, (c) Bandipura, (d) Bannerghatta', 'ಕರ್ನಾಟಕದ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನಗಳನ್ನು ನಕ್ಷೆಯಲ್ಲಿ ಗುರುತಿಸಿ.', '(a) Bannerghatta, (b) Nagarahole, (c) Bandipura, (d) Kuduremukha', '(a) Kuduremukha, (b) Bandipura, (c) Nagarahole, (d) Bannerghatta', '(a) Bannerghatta, (b) Bandipura, (c) Nagarahole, (d) Kuduremukha', '(a) Kuduremukha, (b) Nagarahole, (c) Bandipura, (d) Bannerghatta', '(a) ಬನ್ನೇರುಘಟ್ಟ, (b) ನಾಗರಹೊಳೆ, (c) ಬಂಡೀಪುರ, (d) ಕುದುರೆಮುಖ', '(a) ಕುದುರೆಮುಖ, (b) ಬಂಡೀಪುರ, (c) ನಾಗರಹೊಳೆ, (d) ಬನ್ನೇರುಘಟ್ಟ', '(a) ಬನ್ನೇರುಘಟ್ಟ, (b) ಬಂಡೀಪುರ, (c) ನಾಗರಹೊಳೆ, (d) ಕುದುರೆಮುಖ', '(a) ಕುದುರೆಮುಖ, (b) ನಾಗರಹೊಳೆ, (c) ಬಂಡೀಪುರ, (d) ಬನ್ನೇರುಘಟ್ಟ', '4', 'Correct Answer: (4)

The geographical coordinates marked on the Karnataka outline map correspond to the following protected areas:
• (a) Kudremukh National Park: Located along the Western Ghats ridgeline spanning Chikkamagaluru, Udupi, and Dakshina Kannada districts.
• (b) Nagarahole (Rajiv Gandhi) National Park: Located in Kodagu and Mysuru districts, forming part of the Nilgiri Biosphere Reserve.
• (c) Bandipur National Park: Located in the southernmost tip of Karnataka in Chamarajanagar district at the tri-junction with Tamil Nadu and Kerala.
• (d) Bannerghatta National Park: Located in the Bengaluru Urban and Ramanagara districts in southeastern Karnataka.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಕರ್ನಾಟಕದ ನಕ್ಷೆಯಲ್ಲಿ ಗುರುತಿಸಲಾದ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನಗಳ ಭೌಗೋಳಿಕ ಸ್ಥಾನಗಳು:
• (a) ಕುದುರೆಮುಖ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನ: ಪಶ್ಚಿಮ ಘಟ್ಟಗಳ ಭಾಗವಾಗಿದ್ದು, ಚಿಕ್ಕಮಗಳೂರು, ಉಡುಪಿ ಮತ್ತು ದಕ್ಷಿಣ ಕನ್ನಡ ಜಿಲ್ಲೆಗಳ ವ್ಯಾಪ್ತಿಯಲ್ಲಿದೆ.
• (b) ನಾಗರಹೊಳೆ (ರಾಜೀವ್ ಗಾಂಧಿ) ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನ: ಕೊಡಗು ಮತ್ತು ಮೈಸೂರು ಜಿಲ್ಲೆಗಳ ವ್ಯಾಪ್ತಿಯಲ್ಲಿದೆ.
• (c) ಬಂಡೀಪುರ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನ: ಕರ್ನಾಟಕದ ಅತ್ಯಂತ ದಕ್ಷಿಣ ಭಾಗದ ಚಾಮರಾಜನಗರ ಜಿಲ್ಲೆಯಲ್ಲಿದೆ (ತಮಿಳುನಾಡು-ಕೇರಳ ಗಡಿಯಲ್ಲಿ).
• (d) ಬನ್ನೇರುಘಟ್ಟ ರಾಷ್ಟ್ರೀಯ ಉದ್ಯಾನವನ: ಆಗ್ನೇಯ ಕರ್ನಾಟಕದ ಬೆಂಗಳೂರು ನಗರ ಮತ್ತು ರಾಮನಗರ ಜಿಲ್ಲೆಗಳ ವ್ಯಾಪ್ತಿಯಲ್ಲಿದೆ.
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಅನುಕ್ರಮ: (a) ಕುದುರೆಮುಖ, (b) ನಾಗರಹೊಳೆ, (c) ಬಂಡೀಪುರ, (d) ಬನ್ನೇರುಘಟ್ಟ.', 'PLACEHOLDER_MAP_KARNATAKA', NULL),
    ('pc-nhk-2026-q78', 78, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.union_executive_state_executive.state_executive', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Union Executive & State Executive', 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ', 'Powers of the Governor: Summoning, Proroguing and Dissolving the State Legislature (Article 174)', 'ರಾಜ್ಯಪಾಲರ ಅಧಿಕಾರಗಳು: ರಾಜ್ಯ ಶಾಸಕಾಂಗವನ್ನು ಕರೆಯುವುದು ಮತ್ತು ವಿಸರ್ಜಿಸುವುದು (ವಿಧಿ 174)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Indian Polity', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Which of the following article of Indian Constitution explains that the Governor can reserve a bill passed by the state legislature for the consideration of the President ?', 'ಈ ಕೆಳಗಿನ ಭಾರತ ಸಂವಿಧಾನದ ಯಾವ ವಿಧಿಯು, ರಾಜ್ಯಪಾಲರು ರಾಜ್ಯ ಶಾಸಕಾಂಗದಿಂದ ಅಂಗೀಕೃತವಾದ ಮಸೂದೆಯನ್ನು ರಾಷ್ಟ್ರಪತಿಗಳ ಪರಿಶೀಲನೆಗಾಗಿ ಕಾಯ್ದಿರಿಸುವುದನ್ನು ವಿವರಿಸಿದೆ ?', 'Article 206', 'Article 200', 'Article 208', 'Article 204', 'ವಿಧಿ 206', 'ವಿಧಿ 200', 'ವಿಧಿ 208', 'ವಿಧಿ 204', '2', 'Correct Answer: (2)

• Article 200 of the Constitution of India governs the assent to bills passed by the State Legislative Assembly/Council. It stipulates that when a bill is presented to the Governor, they may declare that they assent to the bill, withhold assent, return the bill (if not a Money Bill) for reconsideration, or reserve the bill for the consideration of the President (which is mandatory if the bill derogates from the constitutional powers of the High Court).
• Article 201 subsequently outlines the procedure when a bill is so reserved for the consideration of the President.
• Article 204 deals with Appropriation Bills, Article 206 with Votes on Account, and Article 208 with Rules of Procedure of State Legislatures.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

• ಭಾರತ ಸಂವಿಧಾನದ 200 ನೇ ವಿಧಿಯು ರಾಜ್ಯ ಶಾಸಕಾಂಗವು ಅಂಗೀಕರಿಸಿದ ಮಸೂದೆಗಳಿಗೆ ರಾಜ್ಯಪಾಲರ ಅಂಕಿತಕ್ಕೆ ಸಂಬಂಧಿಸಿದೆ. ಈ ವಿಧಿಯ ಅಡಿಯಲ್ಲಿ ರಾಜ್ಯಪಾಲರು ಮಸೂದೆಗೆ ಒಪ್ಪಿಗೆ ನೀಡಬಹುದು, ತಡೆಹಿಡಿಯಬಹುದು, ಮರುಪರಿಶೀಲನೆಗೆ ಕಳುಹಿಸಬಹುದು ಅಥವಾ ''ರಾಷ್ಟ್ರಪತಿಗಳ ಪರಿಶೀಲನೆಗಾಗಿ ಕಾಯ್ದಿರಿಸಬಹುದು'' (ವಿಶೇಷವಾಗಿ ಉಚ್ಚ ನ್ಯಾಯಾಲಯದ ಅಧಿಕಾರ ವ್ಯಾಪ್ತಿಗೆ ಧಕ್ಕೆ ತರುವಂತಹ ಮಸೂದೆಗಳನ್ನು ಕಡ್ಡಾಯವಾಗಿ ಕಾಯ್ದಿರಿಸಬೇಕು).
• 201 ನೇ ವಿಧಿಯು ರಾಷ್ಟ್ರಪತಿಗಳ ಪರಿಶೀಲನೆಗೆ ಕಾಯ್ದಿರಿಸಿದ ಮಸೂದೆಗಳ ಮುಂದಿನ ಕ್ರಮವನ್ನು ವಿವರಿಸುತ್ತದೆ.
• 204 ನೇ ವಿಧಿಯು ವಿನಿಯೋಗ ಮಸೂದೆಗಳು, 206 ನೇ ವಿಧಿಯು ಲೇಖಾನುದಾನ ಮತ್ತು 208 ನೇ ವಿಧಿಯು ಶಾಸನ ಸಭೆಯ ನಡಾವಳಿ ನಿಯಮಗಳಿಗೆ ಸಂಬಂಧಿಸಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q79', 79, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.legislative_administrative_relations', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Federal Structure, Center-State Relations & Devolution', 'ಒಕ್ಕೂಟ ವ್ಯವಸ್ಥೆ, ಕೇಂದ್ರ-ರಾಜ್ಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಅಧಿಕಾರ ವಿಕೇಂದ್ರೀಕರಣ', 'Administrative & Constitutional Inquiry Commissions (Sarkaria, Punchhi, Venkatachaliah, Nanavati)', 'ಆಡಳಿತಾತ್ಮಕ ಮತ್ತು ಸಾಂವಿಧಾನಿಕ ಆಯೋಗಗಳು (ಸರ್ಕಾರಿಯಾ, ಪುಂಚಿ, ವೆಂಕಟಾಚಲಯ್ಯ ಆಯೋಗಗಳು)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Commissions', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Match the List-I with List-II and choose the correct answer :

List-I (Commissions)
a. Sarkaria Commission
b. Shah Commission
c. Nanavati Commission
d. Ranganath Mishra Commission

List-II (Purpose of Establishment)
i. 1975-77 Emergency
ii. Religious and Linguistic Minorities
iii. Centre-State Relations
iv. 1984 Sikh Riots Enquiry', 'ಪಟ್ಟಿ -I ನ್ನು ಪಟ್ಟಿ -II ರ ಜೊತೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.

ಪಟ್ಟಿ -I (ಆಯೋಗಗಳು) - ಪಟ್ಟಿ-II (ಸ್ಥಾಪನೆಯ ಉದ್ದೇಶ)
a. ಸರ್ಕಾರಿಯಾ ಆಯೋಗ - i. 1975-77 ರ ತುರ್ತು ಪರಿಸ್ಥಿತಿ
b. ಷಾ ಆಯೋಗ - ii. ಧಾರ್ಮಿಕ ಮತ್ತು ಭಾಷಾ ಅಲ್ಪ ಸಂಖ್ಯಾತರ ಸಮಸ್ಯೆಗಳು
c. ನಾನಾವತಿ ಆಯೋಗ - iii. ಕೇಂದ್ರ - ರಾಜ್ಯ ಸಂಬಂಧಗಳು
d. ರಂಗನಾಥ ಮಿಶ್ರಾ ಆಯೋಗ - iv. 1984 ರ ಸಿಖ್ ದಂಗೆಗಳ ತನಿಖೆ', 'a-iii, b-i, c-ii, d-iv', 'a-ii, b-iii, c-i, d-iv', 'a-iv, b-iii, c-i, d-ii', 'a-iii, b-i, c-iv, d-ii', 'a-iii, b-i, c-ii, d-iv', 'a-ii, b-iii, c-i, d-iv', 'a-iv, b-iii, c-i, d-ii', 'a-iii, b-i, c-iv, d-ii', '4', 'Correct Answer: (4)

• Sarkaria Commission (appointed in 1983 under Justice R.S. Sarkaria): Examined and recommended structural reforms in Centre-State Relations (iii).
• Shah Commission (appointed in 1977 under former CJI J.C. Shah): Inquired into the excesses, illegalities, and abuses of authority committed during the 1975–77 Internal Emergency (i).
• Nanavati Commission (appointed in 2000 under Justice G.T. Nanavati): Investigated the 1984 anti-Sikh riots following the assassination of Prime Minister Indira Gandhi (iv).
• Ranganath Mishra Commission (National Commission for Religious and Linguistic Minorities, appointed in 2004 under former CJI Ranganath Misra): Evaluated criteria for the identification and welfare of socially and economically backward sections among Religious and Linguistic Minorities (ii).
Hence, the correct matching is a-iii, b-i, c-iv, d-ii.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

• ಸರ್ಕಾರಿಯಾ ಆಯೋಗ (1983 ರಲ್ಲಿ ಜಸ್ಟಿಸ್ ಆರ್.ಎಸ್. ಸರ್ಕಾರಿಯಾ ನೇತೃತ್ವದಲ್ಲಿ): ಕೇಂದ್ರ ಮತ್ತು ರಾಜ್ಯಗಳ ನಡುವಿನ ಸಂಬಂಧಗಳನ್ನು ಪರಾಮರ್ಶಿಸಲು ಸ್ಥಾಪಿಸಲಾಯಿತು (iii).
• ಷಾ ಆಯೋಗ (1977 ರಲ್ಲಿ ಜಸ್ಟಿಸ್ ಜೆ.ಸಿ. ಷಾ ನೇತೃತ್ವದಲ್ಲಿ): 1975-77 ರ ಆಂತರಿಕ ತುರ್ತು ಪರಿಸ್ಥಿತಿಯ ಸಂದರ್ಭದಲ್ಲಿ ನಡೆದ ಅಧಿಕಾರ ದುರುಪಯೋಗ ಮತ್ತು ಅಕ್ರಮಗಳ ತನಿಖೆಗಾಗಿ ರಚಿಸಲಾಯಿತು (i).
• ನಾನಾವತಿ ಆಯೋಗ (2000 ರಲ್ಲಿ ಜಸ್ಟಿಸ್ ಜಿ.ಟಿ. ನಾನಾವತಿ ನೇತೃತ್ವದಲ್ಲಿ): 1984 ರ ಸಿಖ್ ವಿರೋಧಿ ದಂಗೆಗಳ ತನಿಖೆಗಾಗಿ ರಚಿಸಲಾಯಿತು (iv).
• ರಂಗನಾಥ ಮಿಶ್ರಾ ಆಯೋಗ (2004 ರಲ್ಲಿ ಮಾಜಿ ಮುಖ್ಯ ನ್ಯಾಯಮೂರ್ತಿ ರಂಗನಾಥ ಮಿಶ್ರಾ ನೇತೃತ್ವದಲ್ಲಿ): ಧಾರ್ಮಿಕ ಮತ್ತು ಭಾಷಾ ಅಲ್ಪಸಂಖ್ಯಾತರ ಸಾಮಾಜಿಕ-ಆರ್ಥಿಕ ಸ್ಥಿತಿಗತಿ ಹಾಗೂ ಮೀಸಲಾತಿ ಕುರಿತು ವರದಿ ನೀಡಲು ಸ್ಥಾಪಿಸಲಾಯಿತು (ii).
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: a-iii, b-i, c-iv, d-ii.', NULL, NULL),
    ('pc-nhk-2026-q80', 80, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.federal_structure_center-state_relations_devolution.legislative_administrative_relations', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Federal Structure, Center-State Relations & Devolution', 'ಒಕ್ಕೂಟ ವ್ಯವಸ್ಥೆ, ಕೇಂದ್ರ-ರಾಜ್ಯ ಸಂಬಂಧಗಳು ಮತ್ತು ಅಧಿಕಾರ ವಿಕೇಂದ್ರೀಕರಣ', 'Emergency Provisions & State Emergency (Article 356 First Imposition in Punjab 1951)', 'ತುರ್ತು ಪರಿಸ್ಥಿತಿ ನಿಯಮಗಳು ಮತ್ತು ರಾಷ್ಟ್ರಪತಿ ಆಳ್ವಿಕೆ (ವಿಧಿ 356 ರ ಮೊದಲ ಬಳಕೆ 1951 ರಲ್ಲಿ ಪಂಜಾಬ್)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Indian Polity', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'In which state the President''s Rule was first time imposed in India ?', 'ಭಾರತದಲ್ಲಿ ಮೊದಲ ಬಾರಿಗೆ ಯಾವ ರಾಜ್ಯದ ಮೇಲೆ ರಾಷ್ಟ್ರಪತಿ ಆಳ್ವಿಕೆಯನ್ನು ಜಾರಿಗೊಳಿಸಲಾಯಿತು ?', 'Karnataka', 'Jammu and Kashmir', 'Punjab', 'Gujarat', 'ಕರ್ನಾಟಕ', 'ಜಮ್ಮು ಮತ್ತು ಕಾಶ್ಮೀರ', 'ಪಂಜಾಬ್', 'ಗುಜರಾತ್', '3', 'Correct Answer: (3)

President''s Rule under Article 356 of the Indian Constitution was imposed for the first time in India in the state of Punjab (then East Punjab) on 20 June 1951. It was invoked by President Dr. Rajendra Prasad due to intense factional infighting within the ruling Congress ministry led by Chief Minister Gopichand Bhargava, remaining in effect until 17 April 1952.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ಭಾರತ ಸಂವಿಧಾನದ 356 ನೇ ವಿಧಿಯ ಅನ್ವಯ ''ರಾಷ್ಟ್ರಪತಿ ಆಳ್ವಿಕೆ''ಯನ್ನು (ರಾಜ್ಯ ತುರ್ತು ಪರಿಸ್ಥಿತಿ) ಭಾರತದಲ್ಲಿ ಮೊದಲ ಬಾರಿಗೆ 1951 ರ ಜೂನ್ 20 ರಂದು ''ಪಂಜಾಬ್'' (ಅಂದಿನ ಪೂರ್ವ ಪಂಜಾಬ್) ರಾಜ್ಯದಲ್ಲಿ ಹೇರಲಾಯಿತು. ಪಂಜಾಬ್‌ನ ಆಡಳಿತಾರೂಢ ಕಾಂಗ್ರೆಸ್ ಪಕ್ಷದ ಮುಖ್ಯಮಂತ್ರಿ ಗೋಪಿಚಂದ್ ಭಾರ್ಗವ ಅವರ ಸಚಿವ ಸಂಪುಟದಲ್ಲಿದ್ದ ತೀವ್ರ ಆಂತರಿಕ ಭಿನ್ನಾಭಿಪ್ರಾಯಗಳ ಕಾರಣದಿಂದ ಸಂವಿಧಾನ ಯಂತ್ರ ಕುಸಿದಿದೆ ಎಂದು ಪರಿಗಣಿಸಿ ಈ ಕ್ರಮ ಕೈಗೊಳ್ಳಲಾಯಿತು.', NULL, NULL),
    ('pc-nhk-2026-q81', 81, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.indian_judiciary_judicial_system.high_courts_subordinate_judiciary', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Indian Judiciary & Judicial System', 'ಭಾರತೀಯ ನ್ಯಾಯಾಂಗ ಮತ್ತು ನ್ಯಾಯಾಂಗ ವ್ಯವಸ್ಥೆ', 'High Courts for States (Article 214 of the Constitution)', 'ರಾಜ್ಯಗಳಿಗೆ ಉಚ್ಚ ನ್ಯಾಯಾಲಯಗಳು (ಸಂವಿಧಾನದ ವಿಧಿ 214)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Judiciary', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Which Article of Indian Constitution makes provision for the establishment of the Supreme Court ?', 'ಭಾರತದ ಸಂವಿಧಾನದ ಯಾವ ವಿಧಿಯು ಸುಪ್ರೀಂ ಕೋರ್ಟ್ ಸ್ಥಾಪನೆಗೆ ಅವಕಾಶ ಕಲ್ಪಿಸುತ್ತದೆ ?', 'Article 134', 'Article 124', 'Article 144', 'Article 124A', '134 ನೇ ವಿಧಿ', '124 ನೇ ವಿಧಿ', '144 ನೇ ವಿಧಿ', '124A ವಿಧಿ', '2', 'Correct Answer: (2)

• Article 124(1) of the Constitution of India provides that "There shall be a Supreme Court of India constituting of a Chief Justice of India and, until Parliament by law prescribes a larger number, of not more than seven other Judges." Article 124 covers the establishment, constitution, appointments, and removal of Supreme Court judges.
• Article 134 deals with the appellate jurisdiction of the Supreme Court in criminal matters.
• Article 144 requires all civil and judicial authorities to act in aid of the Supreme Court.
• Article 124A (which created the National Judicial Appointments Commission - NJAC) was struck down as unconstitutional by the Supreme Court in 2015.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

• ಭಾರತ ಸಂವಿಧಾನದ 124(1) ನೇ ವಿಧಿಯು "ಭಾರತಕ್ಕೊಬ್ಬರು ಮುಖ್ಯ ನ್ಯಾಯಮೂರ್ತಿಗಳು ಹಾಗೂ ಸಂಸತ್ತು ಕಾನೂನಿನ ಮೂಲಕ ನಿಗದಿಪಡಿಸುವ ಇತರ ನ್ಯಾಯಾಧೀಶರನ್ನು ಒಳಗೊಂಡ ಸುಪ್ರೀಂ ಕೋರ್ಟ್ ಇರತಕ್ಕದ್ದು" ಎಂದು ಸ್ಪಷ್ಟವಾಗಿ ತಿಳಿಸುತ್ತದೆ. 124 ನೇ ವಿಧಿಯು ಸುಪ್ರೀಂ ಕೋರ್ಟ್ ಸ್ಥಾಪನೆ, ರಚನೆ ಮತ್ತು ನ್ಯಾಯಾಧೀಶರ ನೇಮಕಾತಿ/ಪದಚ್ಯುತಿಗೆ ಅವಕಾಶ ಕಲ್ಪಿಸುತ್ತದೆ.
• 134 ನೇ ವಿಧಿಯು ಕ್ರಿಮಿನಲ್ ವಿಷಯಗಳಲ್ಲಿ ಸುಪ್ರೀಂ ಕೋರ್ಟ್‌ನ ಮೇಲ್ಮನವಿ ಅಧಿಕಾರ ವ್ಯಾಪ್ತಿಗೆ ಸಂಬಂಧಿಸಿದೆ.
• 144 ನೇ ವಿಧಿಯು ನಾಗರಿಕ ಮತ್ತು ನ್ಯಾಯಾಂಗ ಪ್ರಾಧಿಕಾರಗಳು ಸುಪ್ರೀಂ ಕೋರ್ಟ್‌ನ ನೆರವಿಗೆ ಬದ್ಧವಾಗಿರಬೇಕೆಂದು ತಿಳಿಸುತ್ತದೆ.
• 124A ವಿಧಿಯು NJAC ಗೆ ಸಂಬಂಧಿಸಿದ್ದಾಗಿದ್ದು, ಇದನ್ನು ಸುಪ್ರೀಂ ಕೋರ್ಟ್ 2015 ರಲ್ಲಿ ರದ್ದುಗೊಳಿಸಿತು.', NULL, NULL),
    ('pc-nhk-2026-q82', 82, 2026, 'September', 1, 'nhk', 'ksp-pc', 'geography_earth_systems.geography_of_karnataka', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Geography of Karnataka', 'ಕರ್ನಾಟಕದ ಭೂಗೋಳ', 'District-Wise Population Demographics in Karnataka (Census 2011 Descending Ranking)', 'ಕರ್ನಾಟಕದ ಜಿಲ್ಲಾವಾರು ಜನಸಂಖ್ಯೆ ಮತ್ತು 2011 ರ ಜನಗಣತಿಯ ಅವರೋಹಣ ಕ್ರಮ', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Census', 'Geography & Earth Systems']::TEXT[], '', '', 'Identify the correct Sequence of Districts of Karnataka in descending order of their percentage of Urban population as per 2011 Census.', '2011 ರ ಜನಗಣತಿಯ ಪ್ರಕಾರ, ಕರ್ನಾಟಕ ಜಿಲ್ಲೆಗಳ ನಗರ ಜನಸಂಖ್ಯೆಯ ಶೇಕಡಾವಾರು ಪ್ರಮಾಣವನ್ನು ಇಳಿಕೆ ಕ್ರಮದಲ್ಲಿ ಗುರುತಿಸಿ.', 'Mysuru, Dakshina Kannada, Dharwada, Gadag, Davangere, Ballary', 'Mysuru, Dharwad, Dakshina Kannada, Ballary, Gadag, Davangere', 'Dharwad, Mysuru, Davangere, Dakshina Kannada, Ballary, Gadag', 'Dharwad, Dakshina Kannada, Mysuru, Ballary, Gadag, Davangere', 'ಮೈಸೂರು, ದಕ್ಷಿಣ ಕನ್ನಡ, ಧಾರವಾಡ, ಗದಗ, ದಾವಣಗೆರೆ, ಬಳ್ಳಾರಿ', 'ಮೈಸೂರು, ಧಾರವಾಡ, ದಕ್ಷಿಣ ಕನ್ನಡ, ಬಳ್ಳಾರಿ, ಗದಗ, ದಾವಣಗೆರೆ', 'ಧಾರವಾಡ, ಮೈಸೂರು, ದಾವಣಗೆರೆ, ದಕ್ಷಿಣ ಕನ್ನಡ, ಬಳ್ಳಾರಿ, ಗದಗ', 'ಧಾರವಾಡ, ದಕ್ಷಿಣ ಕನ್ನಡ, ಮೈಸೂರು, ಬಳ್ಳಾರಿ, ಗದಗ, ದಾವಣಗೆರೆ', '4', 'Correct Answer: (4)

According to the official Census of India 2011, the urban population percentages for the listed districts of Karnataka (excluding Bengaluru Urban at 90.94%) in descending order are:
1. Dharwad: 56.82%
2. Dakshina Kannada: 47.67%
3. Mysuru: 41.50%
4. Ballari (undivided): 37.52%
5. Gadag: 35.64%
6. Davanagere: 32.31%
Therefore, the correct sequence in descending order is Dharwad, Dakshina Kannada, Mysuru, Ballari, Gadag, Davangere.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

2011 ರ ಅಧಿಕೃತ ಜನಗಣತಿಯ ಅಂಕಿಅಂಶಗಳ ಪ್ರಕಾರ, ಕರ್ನಾಟಕದ ಈ ಜಿಲ್ಲೆಗಳ ಒಟ್ಟು ಜನಸಂಖ್ಯೆಯಲ್ಲಿ ನಗರ ಜನಸಂಖ್ಯೆಯ ಶೇಕಡಾವಾರು ಪ್ರಮಾಣದ ಇಳಿಕೆ ಕ್ರಮ (ಬೆಂಗಳೂರು ನಗರ 90.94% ಹೊರತುಪಡಿಸಿ):
1. ಧಾರವಾಡ: 56.82%
2. ದಕ್ಷಿಣ ಕನ್ನಡ: 47.67%
3. ಮೈಸೂರು: 41.50%
4. ಬಳ್ಳಾರಿ: 37.52%
5. ಗದಗ: 35.64%
6. ದಾವಣಗೆರೆ: 32.31%
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಇಳಿಕೆ ಕ್ರಮ: ಧಾರವಾಡ, ದಕ್ಷಿಣ ಕನ್ನಡ, ಮೈಸೂರು, ಬಳ್ಳಾರಿ, ಗದಗ, ದಾವಣಗೆರೆ.', NULL, NULL),
    ('pc-nhk-2026-q83', 83, 2026, 'September', 1, 'nhk', 'ksp-pc', 'geography_earth_systems.economic_resource_geography.location_factors_of_primary_secondary_tertiary_industries', 'Geography & Earth Systems', 'ಭೂಗೋಳ ಮತ್ತು ಭೂ ವ್ಯವಸ್ಥೆಗಳು', 'Economic & Resource Geography', 'ಆರ್ಥಿಕ ಮತ್ತು ಸಂಪನ್ಮೂಲ ಭೂಗೋಳಶಾಸ್ತ್ರ', 'Industrial Location Theory (Weight-Losing Raw Materials vs Pure Raw Materials)', 'ಕೈಗಾರಿಕಾ ಸ್ಥಳ ನಿರ್ಣಯ ಸಿದ್ಧಾಂತ (ತೂಕ ಕಳೆದುಕೊಳ್ಳುವ ಕಚ್ಚಾವಸ್ತುಗಳು ಮತ್ತು ಶುದ್ಧ ಕಚ್ಚಾವಸ್ತುಗಳು)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Economic Geography', 'Geography & Earth Systems']::TEXT[], '', '', 'Identify the correctly matched pairs :

(a) Sugarcane - Impure raw material
(b) Cotton - Pure raw material
(c) Footloose industry - Consumer market
(d) Start up India Scheme - Helps to labours', 'ಈ ಕೆಳಗಿನವುಗಳಲ್ಲಿ ಸರಿಯಾದ ಜೋಡಣೆಯನ್ನು ಗುರುತಿಸಿ.

(a) ಕಬ್ಬು - ಅಶುದ್ಧ ಕಚ್ಚಾವಸ್ತು
(b) ಹತ್ತಿ - ಶುದ್ಧ ಕಚ್ಚಾವಸ್ತು
(c) ಸ್ಥಳಬಂಧನವಿಲ್ಲದ (ಫುಟ್‌ಲೂಸ್) ಕೈಗಾರಿಕೆ - ಗ್ರಾಹಕ ಮಾರುಕಟ್ಟೆ
(d) ಸ್ಟಾರ್ಟ್ ಅಪ್ ಇಂಡಿಯಾ ಯೋಜನೆ - ಕಾರ್ಮಿಕರಿಗೆ ಸಹಕಾರಿ', '(a), (b) and (d) are correct', '(a), (b), (c) and (d) are correct', '(b), (c) and (d) are correct', '(a), (b) and (c) are correct', '(a), (b) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ', '(a), (b), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ', '(b), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ', '(a), (b) ಮತ್ತು (c) ಸರಿಯಾಗಿವೆ', '4', 'Correct Answer: (4)

According to Alfred Weber''s Theory of Industrial Location and economic geography:
• (a) Sugarcane: Impure/weight-losing raw material (the weight of extracted sucrose is significantly lower than raw cane weight), pulling sugar mills close to raw material fields (Correct).
• (b) Cotton: Pure raw material (it imparts almost its entire weight into the finished yarn/fabric without major weight loss), allowing textile mills to be located near raw materials or markets (Correct).
• (c) Footloose industry: Not strictly tied to raw materials and often oriented toward consumer markets or transport nodes (e.g., electronics, watchmaking) (Correct).
• (d) Startup India: Aimed at fostering innovation and entrepreneurship, not a dedicated labour welfare scheme (Incorrect).
Therefore, (a), (b), and (c) are correct.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಆಲ್ಫ್ರೆಡ್ ವೆಬರ್‌ನ ಕೈಗಾರಿಕಾ ಸ್ಥಳೀಕರಣ ಸಿದ್ಧಾಂತ ಮತ್ತು ಆರ್ಥಿಕ ಭೂಗೋಳಶಾಸ್ತ್ರದ ಪ್ರಕಾರ:
• (a) ಕಬ್ಬು: ''ಅಶುದ್ಧ ಕಚ್ಚಾವಸ್ತು'' (ತೂಕ ಕಳೆದುಕೊಳ್ಳುವ ಕಚ್ಚಾವಸ್ತು - ಕಬ್ಬನ್ನು ಅರೆದಾಗ ಸಿಗುವ ಸಕ್ಕರೆ ತೂಕ ಕಚ್ಚಾ ಕಬ್ಬಿಗಿಂತ ತೀರಾ ಕಡಿಮೆಯಿರುತ್ತದೆ, ಆದ್ದರಿಂದ ಕಾರ್ಖಾನೆಗಳು ಕಬ್ಬು ಬೆಳೆಯುವ ಹೊಲಗಳ ಬಳಿಯೇ ಇರುತ್ತವೆ) (ಸರಿ).
• (b) ಹತ್ತಿ: ''ಶುದ್ಧ ಕಚ್ಚಾವಸ್ತು'' (ತೂಕ ಕಳೆದುಕೊಳ್ಳದ ಕಚ್ಚಾವಸ್ತು - 1 ಟನ್ ಹತ್ತಿಯಿಂದ ಸರಿಸುಮಾರು ಅಷ್ಟೇ ತೂಕದ ನೂಲು/ಬಟ್ಟೆ ಉತ್ಪಾದನೆಯಾಗುತ್ತದೆ) (ಸರಿ).
• (c) ಸ್ಥಳಬಂಧನವಿಲ್ಲದ (ಫುಟ್‌ಲೂಸ್) ಕೈಗಾರಿಕೆ: ಯಾವುದೇ ನಿರ್ದಿಷ್ಟ ಕಚ್ಚಾವಸ್ತುವಿನ ಸ್ಥಳಕ್ಕೆ ಕಟ್ಟುಬೀಳದೆ ಗ್ರಾಹಕ ಮಾರುಕಟ್ಟೆ ಅಥವಾ ಸಾರಿಗೆ ಕೇಂದ್ರಗಳ ಬಳಿ ಸ್ಥಾಪಿಸಲ್ಪಡುವ ಕೈಗಾರಿಕೆಗಳು (ಉದಾ: ಎಲೆಕ್ಟ್ರಾನಿಕ್ಸ್) (ಸರಿ).
• (d) ಸ್ಟಾರ್ಟ್ ಅಪ್ ಇಂಡಿಯಾ: ಇದು ನವೋದ್ಯಮ ಮತ್ತು ಉದ್ಯಮಶೀಲತೆಯನ್ನು ಉತ್ತೇಜಿಸುವ ಯೋಜನೆಯಾಗಿದ್ದು, ಕೇವಲ ಕಾರ್ಮಿಕರ ಕಲ್ಯಾಣಕ್ಕೆ ಸಂಬಂಧಿಸಿದ್ದಲ್ಲ (ತಪ್ಪು).
ಆದ್ದರಿಂದ (a), (b) ಮತ್ತು (c) ಸರಿಯಾದ ಜೋಡಣೆಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q84', 84, 2026, 'September', 1, 'nhk', 'ksp-pc', 'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology', 'Science, Technology & Defence', 'ವಿಜ್ಞಾನ, ತಂತ್ರಜ್ಞಾನ ಮತ್ತು ರಕ್ಷಣೆ', 'Applied & Fundamental Sciences', 'ಅನ್ವಯಿಕ ಮತ್ತು ಮೂಲಭೂತ ವಿಜ್ಞಾನಗಳು', 'Applied Zoology & Commercial Sericulture Silk Breeds (Bombyx mori, Muga, Eri, Tasar)', 'ಅನ್ವಯಿಕ ಪ್ರಾಣಿಶಾಸ್ತ್ರ ಮತ್ತು ರೇಷ್ಮೆ ಕೃಷಿಯ ತಳಿಗಳು (ಬಾಂಬಿಕ್ಸ್, ಮುಗಾ, ಏರಿ, ಟಸ್ಸಾರ್)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Sericulture', 'Science, Technology & Defence']::TEXT[], '', '', 'Following are the breeds of

(a) Bombyx (b) Muga (c) Eri (d) Tussar', 'ಈ ಕೆಳಗಿನವು ಯಾವುದರ ತಳಿಗಳಾಗಿವೆ ?

(a) ಬಾಂಬಿಕ್ಸ್ (b) ಮುಗಾ (c) ಈರಿ (d) ಟಸ್ಸಾರ್', 'Sheep breeds', 'Silk worm breeds', 'Honey bee breeds', 'Cow breeds', 'ಕುರಿಯ ತಳಿಗಳು', 'ರೇಷ್ಮೆಹುಳು ತಳಿಗಳು', 'ಜೇನುನೊಣದ ತಳಿಗಳು', 'ಹಸುವಿನ ತಳಿಗಳು', '2', 'Correct Answer: (2)

India has the unique distinction of producing all four commercial varieties of natural silks, derived from distinct silkworm species/breeds:
• Bombyx (Bombyx mori): The domesticated Mulberry silkworm feeding on Morus alba leaves (produces ~70% of Indian silk).
• Muga (Antheraea assamensis): Wild silkworm endemic to Assam, producing golden-yellow silk.
• Eri (Samia cynthia ricini): Feeds primarily on castor leaves, yielding open-ended thermal silk cocoons.
• Tasar / Tussar (Antheraea mylitta / Antheraea proylei): Wild tropical and temperate oak silkworms producing rich copper-hued wild silk.
All four are commercial silkworm breeds/species.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಪ್ರಪಂಚದಲ್ಲೇ ಎಲ್ಲಾ ನಾಲ್ಕು ಬಗೆಯ ನೈಸರ್ಗಿಕ ರೇಷ್ಮೆಯನ್ನು ವಾಣಿಜ್ಯಿಕವಾಗಿ ಉತ್ಪಾದಿಸುವ ಏಕೈಕ ದೇಶ ಭಾರತವಾಗಿದೆ. ಇವು ಪ್ರಮುಖ ರೇಷ್ಮೆಹುಳು ತಳಿಗಳಾಗಿವೆ:
• ಬಾಂಬಿಕ್ಸ್ (Bombyx mori): ಹಿಪ್ಪುನೇರಳೆ (ಮಲ್ಬರಿ) ಎಲೆಗಳನ್ನು ತಿಂದು ಬೆಳೆಯುವ ಸಾಕು ರೇಷ್ಮೆಹುಳು (ಕರ್ನಾಟಕದಲ್ಲಿ ಹೆಚ್ಚು ಪ್ರಸಿದ್ಧ).
• ಮುಗಾ (Antheraea assamensis): ಅಸ್ಸಾಂನಲ್ಲಿ ಮಾತ್ರ ಕಂಡುಬರುವ ಚಿನ್ನದ ಬಣ್ಣದ ನೈಸರ್ಗಿಕ ಹೊಳಪಿನ ರೇಷ್ಮೆಹುಳು.
• ಈರಿ (Samia ricini): ಮುಖ್ಯವಾಗಿ ಹರಳೆಣ್ಣೆ ಗಿಡದ (ಔಡಲ) ಎಲೆಗಳನ್ನು ತಿಂದು ಬದುಕುವ ರೇಷ್ಮೆಹುಳು.
• ಟಸ್ಸಾರ್ (Antheraea mylitta): ಅರಣ್ಯ ಪ್ರದೇಶದ ಸಾಲ್ ಮತ್ತು ಅರ್ಜುನ ಮರಗಳ ಮೇಲೆ ಬೆಳೆಯುವ ವನ್ಯ ರೇಷ್ಮೆಹುಳು.
ಆದ್ದರಿಂದ ಇವು ರೇಷ್ಮೆಹುಳು ತಳಿಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q85', 85, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.indian_judiciary_judicial_system.high_courts_subordinate_judiciary', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Indian Judiciary & Judicial System', 'ಭಾರತೀಯ ನ್ಯಾಯಾಂಗ ಮತ್ತು ನ್ಯಾಯಾಂಗ ವ್ಯವಸ್ಥೆ', 'Parliamentary Jurisdiction to Establish High Courts for Union Territories (Article 241)', 'ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಗಳಿಗೆ ಹೈಕೋರ್ಟ್ ಸ್ಥಾಪಿಸುವ ಸಂಸತ್ತಿನ ಅಧಿಕಾರ (ವಿಧಿ 241)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Judiciary', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Who can establish a High Court for a Union Territory or put it under the jurisdiction of the High Court of adjacent state?', 'ಯಾರು ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಗಳಿಗಾಗಿ ಉಚ್ಚ ನ್ಯಾಯಾಲಯವನ್ನು ಸ್ಥಾಪಿಸಬಹುದು ಅಥವಾ ಅದನ್ನು ಪಕ್ಕದ ರಾಜ್ಯದ ಉಚ್ಚ ನ್ಯಾಯಾಲಯದ ವ್ಯಾಪ್ತಿಗೆ ಒಳಪಡಿಸಬಹುದು ?', 'Supreme Court of India', 'President', 'Union Law Minister', 'Parliament', 'ಭಾರತದ ಸುಪ್ರೀಂ ಕೋರ್ಟ್', 'ರಾಷ್ಟ್ರಪತಿ', 'ಕೇಂದ್ರ ಕಾನೂನು ಮಂತ್ರಿ', 'ಸಂಸತ್ತು', '4', 'Correct Answer: (4)

Under Article 241 of the Constitution of India, Parliament may by law establish a High Court for a Union Territory or declare any court in any such territory to be a High Court for all or any of the purposes of the Constitution. Furthermore, under Article 230, Parliament has the exclusive power by law to extend the jurisdiction of a High Court to, or exclude the jurisdiction of a High Court from, any Union Territory (e.g., placing Puducherry under Madras High Court or Lakshadweep under Kerala High Court). Neither the President nor the Supreme Court possesses this legislative power.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಭಾರತ ಸಂವಿಧಾನದ 241 ನೇ ವಿಧಿಯ ಪ್ರಕಾರ, ಕೇವಲ ''ಸಂಸತ್ತು'' (Parliament) ಮಾತ್ರ ಕಾನೂನಿನ ಮೂಲಕ ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಕ್ಕಾಗಿ ಪ್ರತ್ಯೇಕ ಹೈಕೋರ್ಟ್ ಸ್ಥಾಪಿಸಬಹುದು. ಅದೇ ರೀತಿ, 230 ನೇ ವಿಧಿಯ ಅಡಿಯಲ್ಲಿ ಯಾವುದೇ ರಾಜ್ಯದ ಹೈಕೋರ್ಟ್‌ನ ಅಧಿಕಾರ ವ್ಯಾಪ್ತಿಯನ್ನು ಕೇಂದ್ರಾಡಳಿತ ಪ್ರದೇಶಕ್ಕೆ ವಿಸ್ತರಿಸುವ ಅಥವಾ ಹಿಂಪಡೆಯುವ ಸರ್ವೋಚ್ಚ ಶಾಸಕಾಂಗ ಅಧಿಕಾರವೂ ಕೇವಲ ಸಂಸತ್ತಿಗೆ ಮಾತ್ರ ಇದೆ (ಉದಾಹರಣೆಗೆ: ಪುದುಚೇರಿಯನ್ನು ಮದ್ರಾಸ್ ಹೈಕೋರ್ಟ್ ವ್ಯಾಪ್ತಿಗೆ ಹಾಗೂ ಲಕ್ಷದ್ವೀಪವನ್ನು ಕೇರಳ ಹೈಕೋರ್ಟ್ ವ್ಯಾಪ್ತಿಗೆ ಸಂಸತ್ತಿನ ಕಾಯ್ದೆಯ ಮೂಲಕವೇ ತರಲಾಗಿದೆ).', NULL, NULL),
    ('pc-nhk-2026-q86', 86, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.parliament_state_legislatures.legislative_procedure_bills', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Parliament & State Legislatures', 'ಸಂಸತ್ತು ಮತ್ತು ರಾಜ್ಯ ಶಾಸಕಾಂಗಗಳು', 'Special Address by the President of India & Motion of Thanks in Parliament (Article 87)', 'ರಾಷ್ಟ್ರಪತಿಗಳ ವಿಶೇಷ ಭಾಷಣ ಮತ್ತು ವಂದನಾರ್ಪಣಾ ನಿರ್ಣಯ (ವಿಧಿ 87)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Parliament', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', '''Motion of Thanks'' in Parliament is addressed and delivered by', 'ಸಂಸತ್ತಿನಲ್ಲಿ ''ವಂದನಾ ನಿರ್ಣಯ'' ವನ್ನು ಉದ್ದೇಶಿಸಿ ಮಾತನಾಡುವವರು ಮತ್ತು ಮಂಡಿಸುವವರು', 'The Speaker of Lok Sabha', 'The Prime Minister', 'The Chairman of Rajya Sabha', 'The President', 'ಲೋಕಸಭೆಯ ಸ್ಪೀಕರ್', 'ಪ್ರಧಾನ ಮಂತ್ರಿ', 'ರಾಜ್ಯಸಭೆಯ ಅಧ್ಯಕ್ಷರು', 'ರಾಷ್ಟ್ರಪತಿ', '4', 'Correct Answer: (4)

• As per the official answer key, Option (4) is designated as correct.
• Procedural Context: Under Article 87(1) of the Indian Constitution, the President addresses both Houses of Parliament assembled together at the commencement of the first session after each general election and at the commencement of the first session of each calendar year (Budget Session). In parliamentary usage, this formal policy statement of the government is debated via the ''Motion of Thanks''. While the motion itself is formally moved and seconded by ruling-party MPs on the floor of the House, the underlying address on which thanks are tendered is delivered exclusively by the President of India.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

• ಪರೀಕ್ಷಾ ಮಂಡಳಿಯ ಅಧಿಕೃತ ಕೀ-ಉತ್ತರದ ಪ್ರಕಾರ ಆಯ್ಕೆ (4) ಸರಿಯಾಗಿದೆ.
• ಸಂಸದೀಯ ನಡಾವಳಿ ವಿವರಣೆ: ಸಂವಿಧಾನದ 87(1) ನೇ ವಿಧಿಯ ಅನ್ವಯ, ಪ್ರತಿ ಸಾರ್ವತ್ರಿಕ ಚುನಾವಣೆಯ ನಂತರದ ಮೊದಲ ಅಧಿವೇಶನ ಹಾಗೂ ಪ್ರತಿ ವರ್ಷದ ಮೊದಲ ಅಧಿವೇಶನದ (ಬಜೆಟ್ ಅಧಿವೇಶನ) ಆರಂಭದಲ್ಲಿ ರಾಷ್ಟ್ರಪತಿಯವರು ಸಂಸತ್ತಿನ ಉಭಯ ಸದನಗಳ ಜಂಟಿ ಅಧಿವೇಶನವನ್ನು ಉದ್ದೇಶಿಸಿ ''ವಿಶೇಷ ಭಾಷಣ'' ಮಾಡುತ್ತಾರೆ. ಈ ಭಾಷಣದಲ್ಲಿ ಸರ್ಕಾರದ ನೀತಿಗಳು ಮತ್ತು ಯೋಜನೆಗಳನ್ನು ವಿವರಿಸಲಾಗುತ್ತದೆ. ಈ ಭಾಷಣವನ್ನು ಆಧರಿಸಿ ಸಂಸತ್ತಿನಲ್ಲಿ ಚರ್ಚೆ ನಡೆಸಲು ''ವಂದನಾ ನಿರ್ಣಯ''ವನ್ನು ಮಂಡಿಸಲಾಗುತ್ತದೆ. ಆದ್ದರಿಂದ ಈ ಭಾಷಣವನ್ನು ಉದ್ದೇಶಿಸಿ ಮಾತನಾಡುವವರು ಭಾರತದ ರಾಷ್ಟ್ರಪತಿಯಾಗಿದ್ದಾರೆ.', NULL, NULL),
    ('pc-nhk-2026-q87', 87, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Fundamental Rights, DPSP & Fundamental Duties', 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು, ಡಿಪಿಎಸ್‌ಪಿ ಮತ್ತು ಮೂಲಭೂತ ಕರ್ತವ್ಯಗಳು', 'Constitutional Safeguards for Gender Justice (Articles 14, 15, 16, 39, 42)', 'ಲಿಂಗ ನ್ಯಾಯಕ್ಕಾಗಿ ಸಾಂವಿಧಾನಿಕ ರಕ್ಷಣೆಗಳು (ವಿಧಿ 14, 15, 16, 39, 42)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Fundamental Rights', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Which of the following Article/s of Indian Constitution relates to Gender Justice?

(a) Article 15 (b) Article 1 (c) Article 39 (d) Article 51A(e)', 'ಭಾರತ ಸಂವಿಧಾನದ ಯಾವ ವಿಧಿ/ವಿಧಿಗಳು ಲಿಂಗ ನ್ಯಾಯಕ್ಕೆ ಸಂಬಂಧಿಸಿದೆ/ವೆ ?

(a) ವಿಧಿ 15 (b) ವಿಧಿ 1 (c) ವಿಧಿ 39 (d) ವಿಧಿ 51A(e)', '(a), (b) and (c)', 'Only (d)', '(a) and (d)', '(a), (c) and (d)', '(a), (b) ಮತ್ತು (c)', '(d) ಮಾತ್ರ', '(a) ಮತ್ತು (d)', '(a), (c) ಮತ್ತು (d)', '4', 'Correct Answer: (4)

The Constitution of India enshrines gender justice across Fundamental Rights, DPSP, and Fundamental Duties:
• Article 15: Prohibits discrimination on grounds of sex (Art. 15(1)) and empowers the State to make special provisions for women and children (Art. 15(3)) (a).
• Article 39: Directs the State to secure equal right to adequate means of livelihood for men and women equally (Art. 39(a)) and equal pay for equal work for both men and women (Art. 39(d)) (c).
• Article 51A(e): Imposes a Fundamental Duty on every citizen to renounce practices derogatory to the dignity of women (d).
• Article 1: Defines India as a Union of States and its territorial boundaries, having no connection to gender justice.
Thus, (a), (c), and (d) relate to gender justice.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಭಾರತ ಸಂವಿಧಾನದಲ್ಲಿ ಲಿಂಗ ನ್ಯಾಯ ಮತ್ತು ಮಹಿಳಾ ಸಬಲೀಕರಣವನ್ನು ಎತ್ತಿಹಿಡಿಯುವ ಪ್ರಮುಖ ವಿಧಿಗಳು:
• ವಿಧಿ 15: ಲಿಂಗದ ಆಧಾರದ ಮೇಲೆ ತಾರತಮ್ಯ ಮಾಡುವುದನ್ನು ನಿಷೇಧಿಸುತ್ತದೆ (15(1)) ಮತ್ತು ಮಹಿಳೆಯರು ಹಾಗೂ ಮಕ್ಕಳ ರಕ್ಷಣೆಗಾಗಿ ವಿಶೇಷ ಕಾನೂನುಗಳನ್ನು ಮಾಡಲು ಸರ್ಕಾರಕ್ಕೆ ಅಧಿಕಾರ ನೀಡುತ್ತದೆ (15(3)) (a).
• ವಿಧಿ 39 (ರಾಜ್ಯ ನಿರ್ದೇಶಕ ತತ್ವಗಳು): ಪುರುಷರು ಮತ್ತು ಮಹಿಳೆಯರಿಗೆ ಸಮಾನ ಜೀವನೋಪಾಯದ ಹಕ್ಕು (39(a)) ಮತ್ತು ಸ್ತ್ರೀ-ಪುರುಷರಿಗೆ ಸಮಾನ ಕೆಲಸಕ್ಕೆ ಸಮಾನ ವೇತನವನ್ನು ಖಾತರಿಪಡಿಸುತ್ತದೆ (39(d)) (c).
• ವಿಧಿ 51A(e) (ಮೂಲಭೂತ ಕರ್ತವ್ಯಗಳು): ಮಹಿಳೆಯರ ಘನತೆಗೆ ಕುಂದು ತರುವಂತಹ ಯಾವುದೇ ಆಚರಣೆಗಳನ್ನು ತ್ಯಜಿಸುವುದು ಪ್ರತಿಯೊಬ್ಬ ನಾಗರಿಕನ ಕರ್ತವ್ಯವೆಂದು ತಿಳಿಸುತ್ತದೆ (d).
• 1 ನೇ ವಿಧಿಯು ಭಾರತವು ರಾಜ್ಯಗಳ ಒಕ್ಕೂಟವೆಂದು ತಿಳಿಸುತ್ತದೆ (ಇದು ಲಿಂಗ ನ್ಯಾಯಕ್ಕೆ ಸಂಬಂಧಿಸಿಲ್ಲ).
ಆದ್ದರಿಂದ (a), (c) ಮತ್ತು (d) ಸರಿಯಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q88', 88, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Fundamental Rights, DPSP & Fundamental Duties', 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು, ಡಿಪಿಎಸ್‌ಪಿ ಮತ್ತು ಮೂಲಭೂತ ಕರ್ತವ್ಯಗಳು', 'Preventive Detention Laws & Constitutional Safeguards under Article 22', 'ಮುನ್ನೆಚ್ಚರಿಕೆ ಬಂಧನ ಕಾನೂನುಗಳು ಮತ್ತು ವಿಧಿ 22 ರ ಅಡಿಯಲ್ಲಿ ಸಾಂವಿಧಾನಿಕ ರಕ್ಷಣೆಗಳು', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Fundamental Rights', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'With regard to Preventive Detention, which of the following statement is correct?', 'ಮುನ್ನೆಚ್ಚರಿಕೆಯ ಬಂಧನಕ್ಕೆ ಸಂಬಂಧಿಸಿದಂತೆ, ಕೆಳಗಿನ ಯಾವ ಹೇಳಿಕೆಯು ಸರಿಯಾಗಿದೆ ?', 'Was a new idea introduced by makers of Indian Constitution.', 'Was drawn from the USA Constitution.', 'Was drawn from Irish Constitution.', 'Was drawn from the British Constitution.', 'ಇದು ಭಾರತ ಸಂವಿಧಾನದ ರಚನೆಕಾರರು ಸೇರಿಸಿದ ಒಂದು ಹೊಸ ಕಲ್ಪನೆಯಾಗಿದೆ.', 'ಇದನ್ನು ಯುಎಸ್ಎ ಸಂವಿಧಾನದಿಂದ ಪಡೆಯಲಾಗಿದೆ.', 'ಇದನ್ನು ಐರಿಷ್ ಸಂವಿಧಾನದಿಂದ ಪಡೆಯಲಾಗಿದೆ.', 'ಇದನ್ನು ಬ್ರಿಟನ್ ಸಂವಿಧಾನದಿಂದ ಪಡೆಯಲಾಗಿದೆ.', '4', 'Correct Answer: (4)

• As per the official examination key, Option (4) is designated as correct.
• Constitutional Background: Preventive detention—confinement without trial based on apprehension of future illegal acts—was unknown to peacetime American and Irish constitutional doctrines (which guarantee strict Due Process). In India, constitutional preventive detention provisions under Article 22(3)–(7) trace directly back to British statutes enacted during colonial rule (such as the Bengal State Prisoners Regulation III of 1818, the Defence of India Acts of 1915 and 1939, and the Government of India Act 1935), which were adapted into independent India''s constitutional framework.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

• ಪರೀಕ್ಷಾ ಮಂಡಳಿಯ ಅಧಿಕೃತ ಕೀ-ಉತ್ತರದ ಪ್ರಕಾರ (4) ಸರಿಯಾದ ಆಯ್ಕೆಯಾಗಿದೆ.
• ಸಾಂವಿಧಾನಿಕ ವಿವರಣೆ: ಮುನ್ನೆಚ್ಚರಿಕಾ ಬಂಧನ (Preventive Detention - ವಿಚಾರಣೆಯಿಲ್ಲದೆ ಅಪರಾಧ ತಡೆಯಲು ವ್ಯಕ್ತಿಯನ್ನು ಬಂಧಿಸುವುದು) ಅಮೆರಿಕ ಅಥವಾ ಐರ್ಲೆಂಡ್ ಸಂವಿಧಾನಗಳಲ್ಲಿ ಶಾಂತಿಕಾಲದಲ್ಲಿ ಕಂಡುಬರುವುದಿಲ್ಲ. ಭಾರತದಲ್ಲಿ ಸಂವಿಧಾನದ 22 ನೇ ವಿಧಿಯಲ್ಲಿರುವ ಮುನ್ನೆಚ್ಚರಿಕೆ ಬಂಧನದ ನಿಯಮಗಳು ಬ್ರಿಟಿಷ್ ವಸಾಹತುಶಾಹಿ ಆಡಳಿತವು ಭಾರತದಲ್ಲಿ ಜಾರಿಗೆ ತಂದಿದ್ದ ಕಾನೂನುಗಳಿಂದ (1818 ರ ಬಂಗಾಳ ರೆಗ್ಯುಲೇಶನ್, ಡಿಫೆನ್ಸ್ ಆಫ್ ಇಂಡಿಯಾ ಕಾಯ್ದೆ 1915/1939 ಹಾಗೂ 1935 ರ ಭಾರತ ಸರ್ಕಾರ ಕಾಯ್ದೆ) ಪಡೆಯಲಾಗಿದೆ. ಆದ್ದರಿಂದ ಪರೀಕ್ಷೆಗಳಲ್ಲಿ ಇದನ್ನು ಬ್ರಿಟಿಷ್ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಲಾಗುತ್ತದೆ.', NULL, NULL),
    ('pc-nhk-2026-q89', 89, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Fundamental Rights, DPSP & Fundamental Duties', 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು, ಡಿಪಿಎಸ್‌ಪಿ ಮತ್ತು ಮೂಲಭೂತ ಕರ್ತವ್ಯಗಳು', 'Nature, Enforceability and Limitations of Fundamental Rights (Articles 12-35)', 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳ ಸ್ವರೂಪ, ಜಾರಿಗೊಳಿಸುವಿಕೆ ಮತ್ತು ಮಿತಿಗಳು (ವಿಧಿ 12-35)', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Fundamental Rights', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Identify the incorrect statement regarding Fundamental Rights in India:', 'ಭಾರತದಲ್ಲಿನ ಮೂಲಭೂತ ಹಕ್ಕುಗಳಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ತಪ್ಪಾದ ಹೇಳಿಕೆಯನ್ನು ಗುರುತಿಸಿ.', 'Fundamental Rights are guaranteed against the legislature and the executive.', 'Fundamental Rights are available not only against state but also against private individuals.', 'Parliament has the power to modify application of Fundamental Rights to members of Armed Forces and Police Forces.', 'All Fundamental Rights are directly enforceable.', 'ಶಾಸಕಾಂಗ ಮತ್ತು ಕಾರ್ಯಾಂಗದ ವಿರುದ್ಧ ಮೂಲಭೂತ ಹಕ್ಕುಗಳನ್ನು ಖಾತರಿಪಡಿಸಲಾಗಿದೆ.', 'ಮೂಲಭೂತ ಹಕ್ಕುಗಳು ರಾಜ್ಯದ (ಸ್ಟೇಟ್) ವಿರುದ್ಧ ಮಾತ್ರವಲ್ಲ, ಖಾಸಗಿ ವ್ಯಕ್ತಿಗಳ ವಿರುದ್ಧವೂ ಲಭ್ಯವಿವೆ.', 'ಸೇನಾ ಪಡೆ ಮತ್ತು ಪೊಲೀಸ್ ಪಡೆ ಸದಸ್ಯರಿಗೆ ಸಂಬಂಧಿಸಿದಂತೆ ಮೂಲಭೂತ ಹಕ್ಕುಗಳ ಅನ್ವಯವನ್ನು ಮಾರ್ಪಡಿಸುವ ಅಧಿಕಾರವನ್ನು ಸಂಸತ್ತು ಹೊಂದಿದೆ.', 'ಎಲ್ಲಾ ಮೂಲಭೂತ ಹಕ್ಕುಗಳನ್ನು ನೇರವಾಗಿ ಜಾರಿಗೊಳಿಸಬಹುದು.', '4', 'Correct Answer: (4)

Statement 4 is incorrect because not all Fundamental Rights are directly self-executing:
• While many negative injunctions (such as Article 14, 19, 21) are directly enforceable without legislation, several Fundamental Rights require positive enabling statutes enacted by Parliament under Article 35 to give them effect and prescribe penalties (e.g., Article 17 requires the Protection of Civil Rights Act 1955, Article 23 requires the Bonded Labour System Abolition Act 1976, and Article 21A required the Right to Education Act 2009).
• Statement 1 is correct: Fundamental rights limit both legislative and executive actions.
• Statement 2 is correct: Certain rights (Articles 15(2), 17, 23, 24) are enforceable directly against private individuals.
• Statement 3 is correct: Article 33 expressly empowers Parliament to restrict or abrogate fundamental rights for Armed Forces, Police, and intelligence agencies.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

4 ನೇ ಹೇಳಿಕೆಯು ತಪ್ಪಾಗಿದೆ, ಏಕೆಂದರೆ ಎಲ್ಲಾ ಮೂಲಭೂತ ಹಕ್ಕುಗಳು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ನೇರವಾಗಿ ಜಾರಿಯಾಗುವುದಿಲ್ಲ:
• ಕೆಲವು ಮೂಲಭೂತ ಹಕ್ಕುಗಳು ನೇರವಾಗಿ ನ್ಯಾಯಾಲಯದಿಂದ ಜಾರಿಗೊಳ್ಳಬಹುದಾಗಿದ್ದರೂ, ಹಲವು ಪ್ರಮುಖ ಹಕ್ಕುಗಳನ್ನು ಜಾರಿಗೊಳಿಸಲು ಮತ್ತು ಶಿಕ್ಷೆ ವಿಧಿಸಲು ಸಂಸತ್ತು ಸಂವಿಧಾನದ 35 ನೇ ವಿಧಿಯ ಪ್ರಕಾರ ಪ್ರತ್ಯೇಕ ಕಾಯ್ದೆಗಳನ್ನು ರಚಿಸುವುದು ಅನಿವಾರ್ಯವಾಗಿದೆ (ಉದಾಹರಣೆಗೆ: ವಿಧಿ 17 ಅಸ್ಪೃಶ್ಯತೆ ನಿವಾರಣೆಗೆ ''ನಾಗರಿಕ ಹಕ್ಕುಗಳ ಸಂರಕ್ಷಣಾ ಕಾಯ್ದೆ'', ವಿಧಿ 23 ಕ್ಕೆ ''ಜೀತ ಪದ್ಧತಿ ನಿರ್ಮೂಲನೆ ಕಾಯ್ದೆ'' ಮತ್ತು ವಿಧಿ 21A ಗೆ ''ಶಿಕ್ಷಣ ಹಕ್ಕು ಕಾಯ್ದೆ'' ರಚಿಸಲಾಗಿದೆ).
• ಹೇಳಿಕೆ 1 ಸರಿ: ಮೂಲಭೂತ ಹಕ್ಕುಗಳು ಶಾಸಕಾಂಗ ಮತ್ತು ಕಾರ್ಯಾಂಗದ ಅತಿಯಾದ ಹಸ್ತಕ್ಷೇಪದ ವಿರುದ್ಧ ರಕ್ಷಣೆ ನೀಡುತ್ತವೆ.
• ಹೇಳಿಕೆ 2 ಸರಿ: ವಿಧಿ 15(2), 17, 23 ಮತ್ತು 24 ರಂತಹ ಹಕ್ಕುಗಳು ಖಾಸಗಿ ವ್ಯಕ್ತಿಗಳ ವಿರುದ್ಧವೂ ಲಭ್ಯವಿವೆ.
• ಹೇಳಿಕೆ 3 ಸರಿ: 33 ನೇ ವಿಧಿಯ ಪ್ರಕಾರ ಸಶಸ್ತ್ರ ಪಡೆಗಳು ಮತ್ತು ಪೊಲೀಸರ ಮೂಲಭೂತ ಹಕ್ಕುಗಳನ್ನು ನಿರ್ಬಂಧಿಸುವ ಅಧಿಕಾರ ಸಂಸತ್ತಿಗೆ ಇದೆ.', NULL, NULL),
    ('pc-nhk-2026-q90', 90, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.union_executive_state_executive.union_executive', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Union Executive & State Executive', 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ', 'Table of Precedence in the Government of India (Protocol Hierarchy)', 'ಭಾರತ ಸರ್ಕಾರದ ಆದ್ಯತಾ ಕೋಷ್ಟಕ (ಶಿಷ್ಟಾಚಾರ ಶ್ರೇಣಿ)', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Governance', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Arrange the following in Order of Precedence:

(a) Chairman, Minorities Commission
(b) Members of Parliament
(c) Chief Election Commissioner
(d) Attorney General of India', 'ಈ ಕೆಳಗಿನವುಗಳನ್ನು ಆದ್ಯತೆಯ ಶ್ರೇಣಿಯನುಸಾರ ಜೋಡಿಸಿ.

(a) ಅಧ್ಯಕ್ಷರು, ಅಲ್ಪಸಂಖ್ಯಾತರ ಆಯೋಗ
(b) ಸಂಸತ್ತಿನ ಸದಸ್ಯರು
(c) ಮುಖ್ಯ ಚುನಾವಣಾ ಆಯುಕ್ತರು
(d) ಭಾರತದ ಅಟಾರ್ನಿ ಜನರಲ್', '(a), (c), (d), (b)', '(c), (d), (a), (b)', '(c), (a), (b), (d)', '(a), (b), (c), (d)', '(a), (c), (d), (b)', '(c), (d), (a), (b)', '(c), (a), (b), (d)', '(a), (b), (c), (d)', '2', 'Correct Answer: (2)

According to the official Table of Precedence published by the Ministry of Home Affairs (President''s Secretariat, Government of India):
• Article 9A: Chief Election Commissioner (c) [ranked jointly with the Comptroller and Auditor General of India].
• Article 11: Attorney General of India (d) [ranked alongside Cabinet Secretary].
• Article 17 / Statutory equivalent: Chairman of the National Commission for Minorities (a) [Cabinet Minister/MoS protocol ranking above MPs].
• Article 21: Members of Parliament (b).
Therefore, the hierarchical sequence descending in protocol is (c) → (d) → (a) → (b).', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಭಾರತ ಸರ್ಕಾರದ ಗೃಹ ಸಚಿವಾಲಯ ಹಾಗೂ ರಾಷ್ಟ್ರಪತಿ ಸಚಿವಾಲಯವು ಪ್ರಕಟಿಸುವ ಅಧಿಕೃತ ಆದ್ಯತಾ ಶ್ರೇಣಿಯ (Table of Precedence) ಪ್ರಕಾರ:
• ಸ್ಥಾನ 9A: ಭಾರತದ ಮುಖ್ಯ ಚುನಾವಣಾ ಆಯುಕ್ತರು (c) (CAG ಯೊಂದಿಗೆ ಸಮಾನ ಸ್ಥಾನ).
• ಸ್ಥಾನ 11: ಭಾರತದ ಅಟಾರ್ನಿ ಜನರಲ್ (d) (ಕ್ಯಾಬಿನೆಟ್ ಕಾರ್ಯದರ್ಶಿಯೊಂದಿಗೆ ಸಮಾನ ಸ್ಥಾನ).
• ಸ್ಥಾನ 17: ರಾಷ್ಟ್ರೀಯ ಅಲ್ಪಸಂಖ್ಯಾತರ ಆಯೋಗದ ಅಧ್ಯಕ್ಷರು (a) (ಸಂಸದರಿಗಿಂತ ಉನ್ನತ ಶ್ರೇಣಿ).
• ಸ್ಥಾನ 21: ಸಂಸತ್ತಿನ ಸದಸ್ಯರು (ಸಂಸದರು - b).
ಆದ್ದರಿಂದ ಆದ್ಯತೆಯ ಶ್ರೇಣಿಯ ಸರಿಯಾದ ಕ್ರಮ: (c), (d), (a), (b).', NULL, NULL),
    ('pc-nhk-2026-q91', 91, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies.constitutional_bodies', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Statutory, Regulatory & Quasi-Judicial Bodies', 'ಶಾಸನಬದ್ಧ, ನಿಯಂತ್ರಕ ಮತ್ತು ಅರೆ-ನ್ಯಾಯಾಂಗ ಸಂಸ್ಥೆಗಳು', 'Attorney General of India (Article 76, Tenure during Pleasure of the President)', 'ಭಾರತದ ಅಟಾರ್ನಿ ಜನರಲ್ (ವಿಧಿ 76, ರಾಷ್ಟ್ರಪತಿಯವರ ಇಚ್ಛೆಯನುಸಾರ ಅಧಿಕಾರಾವಧಿ)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Constitutional Bodies', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'The term of Attorney General of India', 'ಭಾರತದ ಅಟಾರ್ನಿ ಜನರಲ್‌ರವರ ಅಧಿಕಾರಾವಧಿ', 'Till the pleasure of the President', 'Is determined by the Parliament', 'Till the pleasure of the Vice-president', 'Is determined by the Election Commission of India', 'ರಾಷ್ಟ್ರಪತಿಯವರ ಇಚ್ಛೆ ಇರುವವರೆಗೆ.', 'ಸಂಸತ್ತಿನಿಂದ ನಿರ್ಧರಿಸಲ್ಪಡುತ್ತದೆ.', 'ಉಪ - ರಾಷ್ಟ್ರಪತಿಯವರ ಇಚ್ಛೆ ಇರುವವರೆಗೆ.', 'ಭಾರತದ ಚುನಾವಣಾ ಆಯೋಗದಿಂದ ನಿರ್ಧರಿಸಲ್ಪಡುತ್ತದೆ.', '1', 'Correct Answer: (1)

Under Article 76(4) of the Constitution of India, the Attorney General for India "shall hold office during the pleasure of the President, and shall receive such remuneration as the President may determine." The Constitution neither fixes a rigid tenure of office (such as 5 or 6 years) nor outlines a formal impeachment/removal procedure in the text. Conventionally, the Attorney General tenders their resignation whenever the Union Council of Ministers resigns or is replaced.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಭಾರತ ಸಂವಿಧಾನದ 76(4) ನೇ ವಿಧಿಯ ಪ್ರಕಾರ, ಅಟಾರ್ನಿ ಜನರಲ್ ಅವರು ''ರಾಷ್ಟ್ರಪತಿಯವರ ಇಚ್ಛೆ ಇರುವವರೆಗೆ'' (During the pleasure of the President) ಅಧಿಕಾರದಲ್ಲಿರುತ್ತಾರೆ ಮತ್ತು ರಾಷ್ಟ್ರಪತಿಗಳು ನಿರ್ಧರಿಸುವ ಸಂಭಾವನೆಯನ್ನು ಪಡೆಯುತ್ತಾರೆ. ಸಂವಿಧಾನದಲ್ಲಿ ಇವರ ಅಧಿಕಾರಾವಧಿಯನ್ನು ಇಂತಿಷ್ಟೇ ವರ್ಷಗಳೆಂದು (ಉದಾ: 5 ಅಥವಾ 6 ವರ್ಷ) ನಿರ್ದಿಷ್ಟಪಡಿಸಿಲ್ಲ ಹಾಗೂ ಯಾವುದೇ ಸಂವಿಧಾನಾತ್ಮಕ ಪದಚ್ಯುತಿ ಪ್ರಕ್ರಿಯೆ ಇಲ್ಲ. ಸಾಮಾನ್ಯವಾಗಿ ಕೇಂದ್ರ ಸಚಿವ ಸಂಪುಟ ರಾಜೀನಾಮೆ ನೀಡಿದಾಗ ಇವರೂ ತಮ್ಮ ಹುದ್ದೆಗೆ ರಾಜೀನಾಮೆ ನೀಡುತ್ತಾರೆ.', NULL, NULL),
    ('pc-nhk-2026-q92', 92, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.union_executive_state_executive.union_executive', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Union Executive & State Executive', 'ಕೇಂದ್ರ ಕಾರ್ಯಾಂಗ ಮತ್ತು ರಾಜ್ಯ ಕಾರ್ಯಾಂಗ', 'Veto Powers of the President of India (Absolute, Suspensive and Pocket Veto)', 'ಭಾರತದ ರಾಷ್ಟ್ರಪತಿಗಳ ವೀಟೋ ಅಧಿಕಾರಗಳು (ಸಂಪೂರ್ಣ, ಅಮಾನತು ಮತ್ತು ಪಾಕೆಟ್ ವೀಟೋ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Union Executive', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'The Indian President''s veto power is a combination of

(a) Pocket Veto (b) Absolute Veto (c) Suspensive Veto (d) Qualified Veto', 'ಭಾರತದ ರಾಷ್ಟ್ರಪತಿಗಳ ವೀಟೋ ಅಧಿಕಾರವು ಇವುಗಳ ಸಂಯೋಜನೆಯಾಗಿದೆ.

(a) ಪಾಕೆಟ್ ವೀಟೋ (b) ಸಂಪೂರ್ಣ ವೀಟೋ (c) ಸಸ್ಪೆನ್ಸಿವ್ ವೀಟೋ (d) ಅರ್ಹತಾ ವೀಟೋ (ಕ್ವಾಲಿಫೈಡ್ ವೀಟೋ)', '(b), (c) and (d)', '(b) and (c)', '(a), (b) and (c)', '(a), (c) and (d)', '(b), (c) ಮತ್ತು (d)', '(b) ಮತ್ತು (c)', '(a), (b) ಮತ್ತು (c)', '(a), (c) ಮತ್ತು (d)', '3', 'Correct Answer: (3)

Under Article 111 of the Constitution of India, the President is endowed with three distinct forms of veto power:
• Absolute Veto (b): Power to withhold assent to a bill passed by Parliament, causing the bill to lapse (used for private members'' bills or when a cabinet resigns).
• Suspensive Veto (c): Power to return a non-money bill for reconsideration by Parliament; overridden if Parliament passes the bill again with an ordinary simple majority.
• Pocket Veto (a): Power to simply take no action indefinitely on a bill, as the Indian Constitution does not specify a time limit for presidential assent.
• Qualified Veto (d): A veto that can be overridden only by an extraordinary higher majority (e.g., two-thirds in the US Congress); it is not possessed by the President of India.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ಸಂವಿಧಾನದ 111 ನೇ ವಿಧಿಯ ಪ್ರಕಾರ, ಭಾರತದ ರಾಷ್ಟ್ರಪತಿಗಳು ಮೂರು ಬಗೆಯ ವೀಟೋ ಅಧಿಕಾರಗಳನ್ನು ಹೊಂದಿರುತ್ತಾರೆ:
• ಸಂಪೂರ್ಣ ವೀಟೋ (Absolute Veto - b): ಸಂಸತ್ತು ಅಂಗೀಕರಿಸಿದ ಮಸೂದೆಗೆ ಒಪ್ಪಿಗೆ ನೀಡದೆ ತಿರಸ್ಕರಿಸುವ ಅಧಿಕಾರ.
• ಸಸ್ಪೆನ್ಸಿವ್ ವೀಟೋ (Suspensive Veto - c): ಮಸೂದೆಯನ್ನು ಮರುಪರಿಶೀಲನೆಗಾಗಿ ಸಂಸತ್ತಿಗೆ ಹಿಂದಿರುಗಿಸುವ ಅಧಿಕಾರ (ಸಂಸತ್ತು ಪುನಃ ಸರಳ ಬಹುಮತದಿಂದ ಅಂಗೀಕರಿಸಿದರೆ ರಾಷ್ಟ್ರಪತಿಗಳು ಅಂಕಿತ ಹಾಕಲೇಬೇಕು).
• ಪಾಕೆಟ್ ವೀಟೋ (Pocket Veto - a): ಮಸೂದೆಗೆ ಒಪ್ಪಿಗೆಯನ್ನೂ ನೀಡದೆ, ತಿರಸ್ಕರಿಸಲೂ ಮಾಡದೆ ಯಾವುದೇ ಕಾಲಮಿತಿಯಿಲ್ಲದೆ ತನ್ನ ಬಳಿಯೇ ಉಳಿಸಿಕೊಳ್ಳುವ ಅಧಿಕಾರ.
• ಅರ್ಹತಾ ವೀಟೋ (Qualified Veto - d): ಸಂಸತ್ತಿನ ವಿಶೇಷ 2/3 ಬಹುಮತದಿಂದ ರದ್ದುಗೊಳಿಸಬಹುದಾದ ವೀಟೋ ಅಧಿಕಾರ (ಇದು ಅಮೆರಿಕ ಅಧ್ಯಕ್ಷರಲ್ಲಿದೆ, ಭಾರತದ ರಾಷ್ಟ್ರಪತಿಗಳಿಗಿಲ್ಲ).
ಆದ್ದರಿಂದ ಭಾರತದ ರಾಷ್ಟ್ರಪತಿಗಳ ವೀಟೋ ಅಧಿಕಾರವು (a), (b) ಮತ್ತು (c) ಗಳ ಸಂಯೋಜನೆಯಾಗಿದೆ.', NULL, NULL),
    ('pc-nhk-2026-q93', 93, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_economy_development.agriculture_food_management_subsidies.cropping_patterns_agrarian_systems', 'Indian Economy & Development', 'ಭಾರತೀಯ ಅರ್ಥವ್ಯವಸ್ಥೆ ಮತ್ತು ಅಭಿವೃದ್ಧಿ', 'Agriculture, Food Management & Subsidies', 'ಕೃಷಿ, ಆಹಾರ ನಿರ್ವಹಣೆ ಮತ್ತು ಸಬ್ಸಿಡಿಗಳು', 'Agricultural Output Determinants (HYV Seeds, Irrigation, Fertilizers, Mechanization)', 'ಕೃಷಿ ಉತ್ಪಾದನೆಯ ನಿರ್ಣಾಯಕ ಅಂಶಗಳು (ಬೀಜಗಳು, ನೀರಾವರಿ, ರಸಗೊಬ್ಬರಗಳು, ಯಾಂತ್ರೀಕರಣ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Agriculture', 'Indian Economy & Development']::TEXT[], '', '', 'Considering the given factors, identify the determinants of agricultural output growth :

(a) Ownership of land (b) Demand conditions (c) Political stability (d) Technological factors', 'ಕೊಟ್ಟಿರುವ ಅಂಶಗಳನ್ನು ಪರಿಗಣಿಸಿ, ಕೃಷಿ ಉತ್ಪಾದನಾ ಬೆಳವಣಿಗೆಯ ನಿರ್ಧಾರಕಗಳನ್ನು ಗುರುತಿಸಿ.

(a) ಭೂಮಿಯ ಒಡೆತನ (b) ಬೇಡಿಕೆ ಪರಿಸ್ಥಿತಿಗಳು (c) ರಾಜಕೀಯ ಸ್ಥಿರತೆ (d) ತಾಂತ್ರಿಕ ಅಂಶಗಳು', '(a), (b) and (d)', '(b), (c) and (d)', '(a), (c) and (d)', '(a), (b) and (c)', '(a), (b) ಮತ್ತು (d)', '(b), (c) ಮತ್ತು (d)', '(a), (c) ಮತ್ತು (d)', '(a), (b) ಮತ್ತು (c)', '1', 'Correct Answer: (1)

In standard agrarian economics, the core determinants that directly drive agricultural output growth are categorized into institutional, market, and technological forces:
• Ownership of land (a) (Institutional factor): Land tenure security, consolidation of operational holdings, and tenancy rights directly incentivize farm investment and productivity.
• Demand conditions (b) (Economic/Market factor): Price signals, domestic market demand, export incentives, and remunerative support prices encourage intensive cropping.
• Technological factors (d) (Agronomic factor): High-Yielding Variety (HYV) seeds, modern irrigation infrastructure, mechanization, and chemical/bio-fertilizers directly expand crop yields.
• Political stability (c) is an overarching macroeconomic condition rather than a direct sector-specific determinant of agricultural yields.
Therefore, (a), (b), and (d) are the determinants.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಕೃಷಿ ಅರ್ಥಶಾಸ್ತ್ರದ ಪ್ರಕಾರ, ಕೃಷಿ ಉತ್ಪಾದನಾ ಬೆಳವಣಿಗೆಯನ್ನು ನೇರವಾಗಿ ನಿರ್ಧರಿಸುವ ಪ್ರಮುಖ ಆರ್ಥಿಕ ಮತ್ತು ತಾಂತ್ರಿಕ ಅಂಶಗಳು:
• ಭೂಮಿಯ ಒಡೆತನ (a): ಭೂಹಿಡುವಳಿ ಗಾತ್ರ, ರೈತನ ಭೂಮಾಲೀಕತ್ವದ ಭದ್ರತೆ ಮತ್ತು ಗೇಣಿ ಸುಧಾರಣೆಗಳು ಕೃಷಿಯಲ್ಲಿ ದೀರ್ಘಕಾಲೀನ ಹೂಡಿಕೆ ಮಾಡಲು ಪ್ರೇರೇಪಿಸುತ್ತವೆ.
• ಬೇಡಿಕೆ ಪರಿಸ್ಥಿತಿಗಳು (b): ಮಾರುಕಟ್ಟೆಯಲ್ಲಿ ಕೃಷಿ ಉತ್ಪನ್ನಗಳಿಗೆ ಇರುವ ಬೇಡಿಕೆ ಮತ್ತು ಸೂಕ್ತ ಬೆಲೆಯು ರೈತರಿಗೆ ಹೆಚ್ಚು ಉತ್ಪಾದನೆ ಮಾಡಲು ಪ್ರೋತ್ಸಾಹ ನೀಡುತ್ತದೆ.
• ತಾಂತ್ರಿಕ ಅಂಶಗಳು (d): ಸುಧಾರಿತ ತಳಿ ಬೀಜಗಳು (HYV), ನೀರಾವರಿ ಸೌಲಭ್ಯ, ರಸಗೊಬ್ಬರಗಳು ಹಾಗೂ ಕೃಷಿ ಯಾಂತ್ರೀಕರಣಗಳು ಉತ್ಪಾದನೆಯನ್ನು ಹೆಚ್ಚಿಸುತ್ತವೆ.
• ರಾಜಕೀಯ ಸ್ಥಿರತೆ (c) ಒಟ್ಟಾರೆ ದೇಶದ ಸಾರ್ವತ್ರಿಕ ಅಂಶವಾಗಿದ್ದು, ಕೃಷಿ ಬೆಳವಣಿಗೆಯ ನೇರ ಕ್ಷೇತ್ರೀಯ ನಿರ್ಧಾರಕವಲ್ಲ.
ಆದ್ದರಿಂದ (a), (b) ಮತ್ತು (d) ಸರಿಯಾದ ಉತ್ತರಗಳಾಗಿವೆ.', NULL, NULL),
    ('pc-nhk-2026-q94', 94, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.history_of_karnataka.wodeyars_of_mysore_hyder-tipu_era.hyder_ali_tipu_sultan_era', 'History', 'ಇತಿಹಾಸ', 'History of Karnataka', 'ಕರ್ನಾಟಕದ ಇತಿಹಾಸ', 'Foundation of Lalbagh Botanical Garden Bengaluru by Hyder Ali & Tipu Sultan', 'ಬೆಂಗಳೂರಿನ ಲಾಲ್‌ಬಾಗ್ ಸಸ್ಯತೋಟದ ಸ್ಥಾಪನೆ (ಹೈದರ್ ಅಲಿ ಮತ್ತು ಟಿಪ್ಪು ಸುಲ್ತಾನ್)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Karnataka History', 'History']::TEXT[], '', '', 'Name the King who established Lalbagh in Bengaluru.', 'ಬೆಂಗಳೂರಿನಲ್ಲಿ ಲಾಲ್‌ಬಾಗ್‌ನ್ನು ನಿರ್ಮಿಸಿದ ರಾಜ ಯಾರು ?', 'Krishna Raja Wodeyar III', 'Tipu Sultan', 'Hyder Ali', 'Kempegowda I', 'ಮುಮ್ಮಡಿ ಕೃಷ್ಣರಾಜ ಒಡೆಯರ್', 'ಟಿಪ್ಪು ಸುಲ್ತಾನ್', 'ಹೈದರಾಲಿ', '1ನೇ ಕೆಂಪೇಗೌಡ', '3', 'Correct Answer: (3)

Lalbagh Botanical Garden in Bengaluru was commissioned in 1760 by Hyder Ali, the de facto ruler of Mysore. Inspired by Mughal gardens (Charbagh style), Hyder Ali established it as a private royal retreat covering 40 acres, planting rare rose varieties that gave the garden its name ''Lalbagh'' (Red Garden). The project was later significantly expanded with exotic tropical flora and horticultural species from around the world by his son and successor, Tipu Sultan.', 'ಸರಿಯಾದ ಉತ್ತರ: (3)

ಬೆಂಗಳೂರಿನ ವಿಶ್ವವಿಖ್ಯಾತ ''ಲಾಲ್‌ಬಾಗ್‌'' ಸಸ್ಯತೋಟವನ್ನು 1760 ರಲ್ಲಿ ಮೈಸೂರಿನ ಆಡಳಿತಗಾರ ಹೈದರಾಲಿ ನಿರ್ಮಿಸಿದನು. ಮೊಘಲ್ ಉದ್ಯಾನವನಗಳ ಶೈಲಿಯಿಂದ ಪ್ರಭಾವಿತನಾದ ಹೈದರಾಲಿ, ಕೆಂಪು ಗುಲಾಬಿಗಳ ವಿಶೇಷ ತೋಟವಾಗಿ 40 ಎಕರೆ ಪ್ರದೇಶದಲ್ಲಿ ಇದನ್ನು ಆರಂಭಿಸಿದನು (ಆದ್ದರಿಂದ ಇದಕ್ಕೆ ''ಲಾಲ್‌ಬಾಗ್'' - ಕೆಂಪು ತೋಟ ಎಂಬ ಹೆಸರು ಬಂದಿತು). ತರುವಾಯ ಆತನ ಮಗ ಟಿಪ್ಪು ಸುಲ್ತಾನನು ವಿದೇಶಗಳಿಂದ ಅಪರೂಪದ ಸಸ್ಯಗಳನ್ನು ತರಿಸಿ ಈ ಉದ್ಯಾನವನವನ್ನು ಮತ್ತಷ್ಟು ವಿಸ್ತರಿಸಿದನು.', NULL, NULL),
    ('pc-nhk-2026-q95', 95, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.medieval_india.delhi_sultanate', 'History', 'ಇತಿಹಾಸ', 'Medieval India', 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ', 'Historic Indian Trading Metropolises & The "City of Gold" (Multan / Sonargaon)', 'ಐತಿಹಾಸಿಕ ಭಾರತೀಯ ವಾಣಿಜ್ಯ ನಗರಗಳು ಮತ್ತು "ಚಿನ್ನದ ನಗರ" (ಮುಲ್ತಾನ್ / ಸೋನಾರ್‌ಗಾಂವ್)', 'hard', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Medieval History', 'History']::TEXT[], '', '', 'Which Indian City was popularly nicknamed as the "City of Gold" following the vast amount of wealth and Gold acquired by Muhammad Bin Qasim led army ?', 'ಮಹಮ್ಮದ್ ಬಿನ್ ಖಾಸಿಂ ನೇತೃತ್ವದ ಸೇನೆ ಅಪಾರ ಪ್ರಮಾಣದ ಚಿನ್ನವನ್ನು ದೋಚಿದ ಈ ಕೆಳಗಿನ ಯಾವ ನಗರವು “ಚಿನ್ನದ ನಗರ” ಎಂದು ಜನಪ್ರಿಯವಾಯಿತು ?', 'Multan', 'Brahmanabad', 'Peshawar', 'Aror', 'ಮುಲ್ತಾನ್', 'ಬ್ರಾಹ್ಮಣಾಬಾದ್', 'ಪೇಶಾವರ', 'ಅರೋರ್', '1', 'Correct Answer: (1)

In 712–713 CE, the Umayyad Arab general Muhammad bin Qasim invaded Sindh and advanced north to conquer the ancient city of Multan. Upon capturing Multan, his army plundered the legendary Aditya Sun Temple (Sun Temple of Multan), uncovering a hidden subterranean chamber packed with immense treasures and gold ornaments offered by pilgrims over centuries. Due to the astonishing quantity of gold acquired, Arab geographers and chroniclers (such as Al-Baladhuri and Al-Masudi) designated Multan as ''Faraj Bayt al-Dhahab''—meaning the ''City/House of Gold''.', 'ಸರಿಯಾದ ಉತ್ತರ: (1)

ಕ್ರಿ.ಶ. 712-713 ರಲ್ಲಿ ಉಮಯ್ಯದ್ ಅರಬ್ ಸೇನಾಪತಿ ಮಹಮ್ಮದ್ ಬಿನ್ ಖಾಸಿಂ ಸಿಂಧ್ ಪ್ರಾಂತ್ಯವನ್ನು ಗೆದ್ದು ಮುಲ್ತಾನ್ ನಗರದ ಮೇಲೆ ದಾಳಿ ಮಾಡಿದನು. ಮುಲ್ತಾನ್‌ನ ಪ್ರಸಿದ್ಧ ಆದಿತ್ಯ ಸೂರ್ಯ ದೇವಾಲಯವನ್ನು ವಶಪಡಿಸಿಕೊಂಡ ಆತನ ಸೈನ್ಯಕ್ಕೆ, ಅಲ್ಲಿನ ರಹಸ್ಯ ನೆಲಮಾಳಿಗೆಯಲ್ಲಿದ್ದ ಶತಮಾನಗಳ ಅಪಾರ ಚಿನ್ನ ಮತ್ತು ವಜ್ರ-ವೈಢೂರ್ಯಗಳ ಬೃಹತ್ ನಿಧಿ ದೊರೆಯಿತು. ಈ ಅದ್ಭುತ ಪ್ರಮಾಣದ ಚಿನ್ನದ ಕಾರಣದಿಂದಾಗಿ ಅರಬ್ ಇತಿಹಾಸಕಾರರು ಮುಲ್ತಾನ್ ನಗರವನ್ನು ''ಫರಾಜ್ ಬೈತ್ ಅಲ್-ದಹಬ್'' ಅಂದರೆ “ಚಿನ್ನದ ನಗರ” (City of Gold) ಎಂದು ಕರೆದರು.', NULL, NULL),
    ('pc-nhk-2026-q96', 96, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.medieval_india.delhi_sultanate', 'History', 'ಇತಿಹಾಸ', 'Medieval India', 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ', 'Delhi Sultanate Central Administrative Departments (Diwan-i-Wizarat, Diwan-i-Arz, Diwan-i-Insha, Diwan-i-Risalat)', 'ದೆಹಲಿ ಸುಲ್ತಾನರ ಕೇಂದ್ರೀಯ ಆಡಳಿತ ಇಲಾಖೆಗಳು (ದಿವಾನ್-ಇ-ವಿಜಾರತ್, ದಿವಾನ್-ಇ-ಅರ್ಜ್, ದಿವಾನ್-ಇ-ಇನ್ಶಾ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Medieval History', 'History']::TEXT[], '', '', 'Match the List-I with List-II and choose the correct answer :

List-I (Administrative Terms) - List-II (Meaning)
a. Zil-i-ilahi - i. Prostration before the Sultan
b. Sizda - ii. Spies
c. Paibos - iii. Kissing Sultan''s feet
d. Barids - iv. Shadow of God', 'ಕೆಳಗಿನ ಪಟ್ಟಿ -I ನ್ನು ಪಟ್ಟಿ-II ರ ಜೊತೆ ಹೊಂದಿಸಿ, ಸರಿಯಾದ ಉತ್ತರವನ್ನು ಆರಿಸಿ.

ಪಟ್ಟಿ-I (ಆಡಳಿತಾತ್ಮಕ ಪದಗಳು) - ಪಟ್ಟಿ-II (ಅರ್ಥ)
a. ಜಿಲ್-ಇ-ಇಲಾಹಿ - i. ಸುಲ್ತಾನನ ಮುಂದೆ ಸಾಷ್ಟಾಂಗ ನಮಸ್ಕಾರ
b. ಸಿಜ್ದಾ - ii. ಗೂಢಾಚಾರರು
c. ಪೈಬೋಸ್ - iii. ಸುಲ್ತಾನನ ಪಾದಗಳನ್ನು ಚುಂಬಿಸುವುದು
d. ಬರೀದ್ - iv. ದೇವರ ನೆರಳು', 'a-iii, b-iv, c-ii, d-i', 'a-iv, b-i, c-iii, d-ii', 'a-iii, b-ii, c-i, d-iv', 'a-ii, b-i, c-iii, d-iv', 'a-iii, b-iv, c-ii, d-i', 'a-iv, b-i, c-iii, d-ii', 'a-iii, b-ii, c-i, d-iv', 'a-ii, b-i, c-iii, d-iv', '2', 'Correct Answer: (2)

During the Delhi Sultanate (specifically under the Mamluk Sultan Ghiyasuddin Balban, who implemented the Persian theory of divine kingship to enhance royal majesty):
• Zil-i-ilahi: Persian imperial title meaning the ''Shadow of God'' on Earth (iv).
• Sijda (Sizda): Persian court etiquette requiring nobles and subjects to perform complete prostration before the Sultan (i).
• Paibos: Persian court practice of bowing down and kissing the Sultan''s feet (iii).
• Barids: Royal intelligence officers and spies reporting to the Barid-i-Mumalik (ii).
Therefore, the correct matching sequence is a-iv, b-i, c-iii, d-ii.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ದೆಹಲಿ ಸುಲ್ತಾನರ ಕಾಲದಲ್ಲಿ (ವಿಶೇಷವಾಗಿ ಗುಲಾಮಿ ಸಂತತಿಯ ಬಲ್ಬನ್ ಜಾರಿಗೆ ತಂದ ಪರ್ಷಿಯನ್ ರಾಜಪ್ರಭುತ್ವದ ಆಚರಣೆಗಳು):
• ಜಿಲ್-ಇ-ಇಲಾಹಿ (a): ಬಲ್ಬನ್ ತನಗೆ ತಾನೇ ತೆಗೆದುಕೊಂಡ ಬಿರುದು, ಇದರರ್ಥ ''ದೇವರ ನೆರಳು'' (Shadow of God) (iv).
• ಸಿಜ್ದಾ (b): ಆಸ್ಥಾನಕ್ಕೆ ಬಂದಾಗ ಸುಲ್ತಾನನಿಗೆ ಗೌರವ ಸಲ್ಲಿಸಲು ಮಾಡುವ ''ಸಾಷ್ಟಾಂಗ ನಮಸ್ಕಾರ'' (i).
• ಪೈಬೋಸ್ (c): ಸಿಂಹಾಸನದ ಬಳಿ ಬಂದು ಸುಲ್ತಾನನ ''ಪಾದಗಳನ್ನು ಚುಂಬಿಸುವುದು'' (iii).
• ಬರೀದ್ (d): ಸುಲ್ತಾನರ ಆಡಳಿತದಲ್ಲಿದ್ದ ರಹಸ್ಯ ಸುದ್ದಿ ಸಂಗ್ರಾಹಕರು ಅಥವಾ ''ಗೂಢಾಚಾರರು'' (ii).
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಹೊಂದಾಣಿಕೆ: a-iv, b-i, c-iii, d-ii.', NULL, NULL),
    ('pc-nhk-2026-q97', 97, 2026, 'September', 1, 'nhk', 'ksp-pc', 'history.medieval_india.mughal_empire.early_mughals_expansion', 'History', 'ಇತಿಹಾಸ', 'Medieval India', 'ಮಧ್ಯಕಾಲೀನ ಭಾರತ', 'First Battle of Panipat (1526): Babur vs Ibrahim Lodi and Beginning of Mughal Rule', 'ಮೊದಲ ಪಾಣಿಪತ್ ಕದನ (1526): ಬಾಬರ್ ಮತ್ತು ಇಬ್ರಾಹಿಂ ಲೋಧಿ ಹಾಗೂ ಮೊಘಲ್ ಆಳ್ವಿಕೆಯ ಆರಂಭ', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Medieval History', 'History']::TEXT[], '', '', 'The first Battle of Panipat was held in the year and between :', 'ಮೊದಲನೇ ಪಾಣಿಪತ್ ಯುದ್ಧವು ಯಾವ ವರ್ಷ ಮತ್ತು ಯಾರ ನಡುವೆ ನಡೆಯಿತು ?', '1535 A.D.- Babur and Rana Sanga', '1542 A.D.- Babur and Sikandar Shah', '1529 A.D.- Babur and Muhammad Lodi', '1526 A.D.- Babur and Ibrahim Lodi', 'ಕ್ರಿ.ಶ. 1535 - ಬಾಬರ್ ಮತ್ತು ರಾಣಾ ಸಂಗ', 'ಕ್ರಿ.ಶ. 1542 - ಬಾಬರ್ ಮತ್ತು ಸಿಕಂದರ್ ಷಾ', 'ಕ್ರಿ.ಶ. 1529 - ಬಾಬರ್ ಮತ್ತು ಮಹಮ್ಮದ್ ಲೋದಿ', 'ಕ್ರಿ.ಶ. 1526 - ಬಾಬರ್ ಮತ್ತು ಇಬ್ರಾಹಿಂ ಲೋದಿ', '4', 'Correct Answer: (4)

The First Battle of Panipat took place on 21 April 1526 at Panipat (present-day Haryana) between the invading Timurid prince Babur and the reigning Sultan of Delhi, Ibrahim Lodi. Babur''s army, though heavily outnumbered, routed Ibrahim Lodi''s forces through superior military tactics: the Ottoman ''Tulughma'' flanking formation and the deployment of field artillery (cannons) and matchlocks directed by gunner Ustad Ali Quli. Ibrahim Lodi was killed on the battlefield, ending the Delhi Sultanate (Lodi dynasty) and establishing the Mughal Empire in India.', 'ಸರಿಯಾದ ಉತ್ತರ: (4)

ಮೊದಲನೇ ಪಾಣಿಪತ್ ಯುದ್ಧವು ಕ್ರಿ.ಶ. 1526 ರ ಏಪ್ರಿಲ್ 21 ರಂದು ಹರಿಯಾಣದ ಪಾಣಿಪತ್ ಎಂಬಲ್ಲಿ ಬಾಬರ್ ಮತ್ತು ದೆಹಲಿಯ ಕೊನೆಯ ಲೋದಿ ಸುಲ್ತಾನ ಇಬ್ರಾಹಿಂ ಲೋದಿ ನಡುವೆ ನಡೆಯಿತು. ಬಾಬರನು ತುರ್ಕಿ-ಒಟ್ಟೋಮನ್ ಯುದ್ಧತಂತ್ರವಾದ ''ತುಳುಘ್ಮಾ'' ವ್ಯೂಹ ಮತ್ತು ಮೊದಲ ಬಾರಿಗೆ ಫಿರಂಗಿ ಹಾಗೂ ಬಂದೂಕುಗಳನ್ನು (ಫಿರಂಗಿ ತಜ್ಞ ಉಸ್ತಾದ್ ಅಲಿ ಕುಲಿ ನೇತೃತ್ವದಲ್ಲಿ) ಅತ್ಯಂತ ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಬಳಸಿ ಇಬ್ರಾಹಿಂ ಲೋದಿಯ ಬೃಹತ್ ಸೈನ್ಯವನ್ನು ಸೋಲಿಸಿದನು. ಯುದ್ಧರಂಗದಲ್ಲೇ ಇಬ್ರಾಹಿಂ ಲೋದಿ ಮರಣ ಹೊಂದಿದನು. ಈ ಯುದ್ಧದ ವಿಜಯದೊಂದಿಗೆ ದೆಹಲಿ ಸುಲ್ತಾನರ ಆಳ್ವಿಕೆ ಕೊನೆಗೊಂಡು ಭಾರತದಲ್ಲಿ ಮೊಘಲ್ ಸಾಮ್ರಾಜ್ಯ ಸ್ಥಾಪನೆಯಾಯಿತು.', NULL, NULL),
    ('pc-nhk-2026-q98', 98, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution.constituent_assembly_drafting_process', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Historical Background & Making of the Constitution', 'ಐತಿಹಾಸಿಕ ಹಿನ್ನೆಲೆ ಮತ್ತು ಸಂವಿಧಾನ ರಚನೆ', 'Constituent Assembly of India & Role of Constitutional Advisor Sir B.N. Rau', 'ಭಾರತದ ಸಂವಿಧಾನ ರಚನಾ ಸಭೆ ಮತ್ತು ಸಾಂವಿಧಾನಿಕ ಸಲಹೆಗಾರ ಸರ್ ಬಿ.ಎನ್. ರಾವ್', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Constituent Assembly', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'Who was the constitutional Advisor to the Constituent Assembly of India ?', 'ಭಾರತ ಸಂವಿಧಾನ ರಚನಾ ಸಭೆಯ ಸಾಂವಿಧಾನಿಕ ಸಲಹೆಗಾರರು ಯಾರಾಗಿದ್ದರು ?', 'Nand Lal Bose', 'B.N. Rau', 'Vasant Krishan Vaidya', 'Prem Behari Narain Raizada', 'ನಂದ ಲಾಲ್ ಬೋಸ್', 'ಬಿ.ಎನ್. ರಾವ್', 'ವಸಂತ್ ಕೃಷ್ಣ ವೈದ್ಯ', 'ಪ್ರೇಮ್ ಬಿಹಾರಿ ನರೇನ್ ರೈಜಾದಾ', '2', 'Correct Answer: (2)

Sir Benegal Narsing Rau (B.N. Rau), an eminent civil servant, jurist, and later judge of the International Court of Justice (ICJ), was appointed as the Constitutional Advisor to the Constituent Assembly in July 1946. B.N. Rau prepared the initial, comprehensive basic draft of the Constitution in October 1947 (consisting of 243 Articles and 13 Schedules) after studying constitutions worldwide, which subsequently formed the foundation for the Drafting Committee chaired by Dr. B.R. Ambedkar.
• Prem Behari Narain Raizada was the calligrapher of the original English Constitution.
• Nand Lal Bose illuminated and decorated the original pages.
• Vasant Krishan Vaidya calligraphed the Hindi version.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಕರ್ನಾಟಕ ಮೂಲದ ಶ್ರೇಷ್ಠ ಕಾನೂನು ಪಂಡಿತರು ಮತ್ತು ಅಂತಾರಾಷ್ಟ್ರೀಯ ನ್ಯಾಯಾಲಯದ (ICJ) ನ್ಯಾಯಾಧೀಶರಾಗಿದ್ದ ಸರ್ ಬೆನಗಲ್ ನರಸಿಂಗ ರಾವ್ (ಬಿ.ಎನ್. ರಾವ್) ಅವರು ಭಾರತ ಸಂವಿಧಾನ ರಚನಾ ಸಭೆಯ ಸಾಂವಿಧಾನಿಕ ಸಲಹೆಗಾರರಾಗಿದ್ದರು. ಇವರು ವಿಶ್ವದ ವಿವಿಧ ದೇಶಗಳ ಸಂವಿಧಾನಗಳನ್ನು ಆಳವಾಗಿ ಅಧ್ಯಯನ ಮಾಡಿ, 1947 ರ ಅಕ್ಟೋಬರ್‌ನಲ್ಲಿ 243 ವಿಧಿಗಳು ಮತ್ತು 13 ಅನುಸೂಚಿಗಳನ್ನೊಳಗೊಂಡ ಸಂವಿಧಾನದ ಮೂಲ ಕರಡನ್ನು ಸಿದ್ಧಪಡಿಸಿದರು. ಈ ಕರಡಿನ ಆಧಾರದ ಮೇಲೆ ಡಾ. ಬಿ.ಆರ್. ಅಂಬೇಡ್ಕರ್ ಅಧ್ಯಕ್ಷತೆಯ ಕರಡು ಸಮಿತಿಯು ಅಂತಿಮ ಸಂವಿಧಾನವನ್ನು ರೂಪಿಸಿತು.
• ಪ್ರೇಮ್ ಬಿಹಾರಿ ನಾರಾಯಣ್ ರೈಜಾದಾ: ಸಂವಿಧಾನದ ಮೂಲ ಇಂಗ್ಲಿಷ್ ಪ್ರತಿಯನ್ನು ಕೈಬರಹದಲ್ಲಿ ಬರೆದ ಕ್ಯಾಲಿಗ್ರಾಫರ್.
• ನಂದಲಾಲ್ ಬೋಸ್: ಸಂವಿಧಾನದ ಪುಟಗಳನ್ನು ಸುಂದರ ಚಿತ್ರಗಳಿಂದ ಅಲಂಕರಿಸಿದ ಕಲಾವಿದ.', NULL, NULL),
    ('pc-nhk-2026-q99', 99, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_polity_constitution_governance.historical_background_making_of_the_constitution.government_of_india_acts', 'Indian Polity, Constitution & Governance', 'ಭಾರತೀಯ ರಾಜವ್ಯವಸ್ಥೆ, ಸಂವಿಧಾನ ಮತ್ತು ಆಡಳಿತ', 'Historical Background & Making of the Constitution', 'ಐತಿಹಾಸಿಕ ಹಿನ್ನೆಲೆ ಮತ್ತು ಸಂವಿಧಾನ ರಚನೆ', 'Indian Independence Act 1947 & Dominion Status Period (15 August 1947 to 26 January 1950)', '1947 ರ ಭಾರತ ಸ್ವಾತಂತ್ರ್ಯ ಕಾಯ್ದೆ ಮತ್ತು ಡೊಮಿನಿಯನ್ ಸ್ಥಾನಮಾನದ ಅವಧಿ (1947 ರಿಂದ 1950)', 'easy', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Constitutional History', 'Indian Polity, Constitution & Governance']::TEXT[], '', '', 'During which period India had Dominion status ?', 'ಭಾರತ ಯಾವ ಕಾಲಾವಧಿಯಲ್ಲಿ ಡೊಮಿನಿಯನ್ ಸ್ಥಾನಮಾನ ಹೊಂದಿತ್ತು ?', '9 December, 1946-26 November, 1949', '15 August, 1947-26 January, 1950', '9 December, 1946-26 January, 1950', '15 August, 1947-26 November, 1949', '9 ಡಿಸೆಂಬರ್, 1946 - 26 ನವೆಂಬರ್, 1949', '15 ಆಗಸ್ಟ್, 1947 – 26 ಜನವರಿ, 1950', '9 ಡಿಸೆಂಬರ್, 1946 - 26 ಜನವರಿ, 1950', '15 ಆಗಸ್ಟ್, 1947 - 26 ನವೆಂಬರ್, 1949', '2', 'Correct Answer: (2)

Under the provisions of the Indian Independence Act, 1947 passed by the British Parliament, British suzerainty ended on 15 August 1947, and two independent Dominions—India and Pakistan—were created within the British Commonwealth of Nations. India retained ''Dominion of India'' status (with King George VI as nominal constitutional monarch represented by the Governor-General, Lord Mountbatten and later C. Rajagopalachari) until 26 January 1950, when the Constitution of India came into full effect, transforming India into a fully sovereign, democratic Republic.', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಬ್ರಿಟಿಷ್ ಸಂಸತ್ತು ಅಂಗೀಕರಿಸಿದ ''ಭಾರತೀಯ ಸ್ವಾತಂತ್ರ್ಯ ಕಾಯ್ದೆ 1947'' ರ ಪ್ರಕಾರ, 1947 ರ ಆಗಸ್ಟ್ 15 ರಂದು ಭಾರತ ಮತ್ತು ಪಾಕಿಸ್ತಾನ ಎಂಬ ಎರಡು ಪ್ರತ್ಯೇಕ ''ಡೊಮಿನಿಯನ್''ಗಳನ್ನು ಸ್ಥಾಪಿಸಲಾಯಿತು. ಭಾರತವು 1947 ರ ಆಗಸ್ಟ್ 15 ರಿಂದ ತನ್ನದೇ ಆದ ಸಂವಿಧಾನ ಜಾರಿಗೆ ಬಂದ 1950 ರ ಜನವರಿ 26 ರವರೆಗೆ ''ಡೊಮಿನಿಯನ್ ಆಫ್ ಇಂಡಿಯಾ'' ಸ್ಥಾನಮಾನವನ್ನು ಹೊಂದಿತ್ತು. ಈ ಅವಧಿಯಲ್ಲಿ ಬ್ರಿಟನ್ ರಾಜ ಜಾರ್ಜ್ VI ಸಾಂಕೇತಿಕ ಮುಖ್ಯಸ್ಥರಾಗಿದ್ದು, ಅವರ ಪ್ರತಿನಿಧಿಯಾಗಿ ಗವರ್ನರ್ ಜನರಲ್ (ಲಾರ್ಡ್ ಮೌಂಟ್‌ಬ್ಯಾಟನ್ ಮತ್ತು ನಂತರ ಸಿ. ರಾಜಗೋಪಾಲಾಚಾರಿ) ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿದ್ದರು. 1950 ರ ಜನವರಿ 26 ರಂದು ಭಾರತವು ಸಂಪೂರ್ಣ ಸಾರ್ವಭೌಮ ಗಣರಾಜ್ಯವಾಯಿತು.', NULL, NULL),
    ('pc-nhk-2026-q100', 100, 2026, 'September', 1, 'nhk', 'ksp-pc', 'indian_society_social_justice.social_sector_development.education_sector_reforms', 'Indian Society & Social Justice', 'ಭಾರತೀಯ ಸಮಾಜ ಮತ್ತು ಸಾಮಾಜಿಕ ನ್ಯಾಯ', 'Social Sector Development (Health & Education)', 'ಸಾಮಾಜಿಕ ವಲಯದ ಅಭಿವೃದ್ಧಿ (ಆರೋಗ್ಯ ಮತ್ತು ಶಿಕ್ಷಣ)', 'Evolution of National Flagship Education Schemes (DPEP, SSA, RMSA, Samagra Shiksha)', 'ರಾಷ್ಟ್ರೀಯ ಪ್ರಮುಖ ಶಿಕ್ಷಣ ಯೋಜನೆಗಳ ವಿಕಾಸ (ಡಿಪಿಇಪಿ, ಸರ್ವ ಶಿಕ್ಷಣ ಅಭಿಯಾನ, ಆರ್‌ಎಂಎಸ್‌ಎ, ಸಮಗ್ರ ಶಿಕ್ಷಣ)', 'medium', ARRAY['KEA', 'DAR PC NHK 2026', 'Paper 1', 'Education Schemes', 'Indian Society & Social Justice']::TEXT[], '', '', 'Rearrange the schemes in chronological order :

(a) Rashtriya Madhyamika Shiksha Abhiyan
(b) Sarva Shiksha Abhiyan
(c) UDAAN
(d) Padhe Bharat - Badhe Bharat', 'ಈ ಕೆಳಗಿನ ಯೋಜನೆಗಳನ್ನು ಕಾಲಾನುಕ್ರಮದಲ್ಲಿ ಜೋಡಿಸಿ.

(a) ರಾಷ್ಟ್ರೀಯ ಮಾಧ್ಯಮಿಕ ಶಿಕ್ಷಾ ಅಭಿಯಾನ
(b) ಸರ್ವ ಶಿಕ್ಷಾ ಅಭಿಯಾನ
(c) ಉಡಾನ್ (UDAAN)
(d) ಪಢೇ ಭಾರತ್ - ಬಢೇ ಭಾರತ್', '(c), (d), (a), (b)', '(b), (a), (d), (c)', '(a), (c), (d), (b)', '(d), (a), (c), (b)', '(c), (d), (a), (b)', '(b), (a), (d), (c)', '(a), (c), (d), (b)', '(d), (a), (c), (b)', '2', 'Correct Answer: (2)

The chronological order of launch for the national educational initiatives is:
• (b) Sarva Shiksha Abhiyan (SSA): Launched in 2001 under Prime Minister Atal Bihari Vajpayee to achieve universal elementary education.
• (a) Rashtriya Madhyamik Shiksha Abhiyan (RMSA): Launched in March 2009 to universalize access to secondary education.
• (d) Padhe Bharat Badhe Bharat (PBBB): Launched in August 2014 as a sub-programme of SSA focusing on foundational early-grade reading, writing, and mathematics.
• (c) UDAAN Scheme: Launched by the Ministry of HRD/CBSE in November 2014 to enable meritorious girl students to address disadvantaged socio-economic backgrounds and prepare for premier engineering entrance examinations.
Hence, the correct chronological sequence is (b) → (a) → (d) → (c).', 'ಸರಿಯಾದ ಉತ್ತರ: (2)

ಶಿಕ್ಷಣ ಕ್ಷೇತ್ರಕ್ಕೆ ಸಂಬಂಧಿಸಿದ ಈ ರಾಷ್ಟ್ರೀಯ ಯೋಜನೆಗಳು ಜಾರಿಗೆ ಬಂದ ಕಾಲಾನುಕ್ರಮ:
• (b) ಸರ್ವ ಶಿಕ್ಷಾ ಅಭಿಯಾನ (SSA): ಪ್ರಾಥಮಿಕ ಶಿಕ್ಷಣದ ಸಾರ್ವತ್ರೀಕರಣಕ್ಕಾಗಿ 2001 ರಲ್ಲಿ ಪ್ರಧಾನಿ ಅಟಲ್ ಬಿಹಾರಿ ವಾಜಪೇಯಿ ಅವರ ನೇತೃತ್ವದಲ್ಲಿ ಪ್ರಾರಂಭವಾಯಿತು.
• (a) ರಾಷ್ಟ್ರೀಯ ಮಾಧ್ಯಮಿಕ ಶಿಕ್ಷಾ ಅಭಿಯಾನ (RMSA): ಪ್ರೌಢ ಶಿಕ್ಷಣದ ಗುಣಮಟ್ಟ ಮತ್ತು ಲಭ್ಯತೆ ಹೆಚ್ಚಿಸಲು 2009 ರ ಮಾರ್ಚ್‌ನಲ್ಲಿ ಪ್ರಾರಂಭವಾಯಿತು.
• (d) ಪಢೇ ಭಾರತ್ - ಬಢೇ ಭಾರತ್: ಪ್ರಾಥಮಿಕ ಶಾಲಾ ಮಕ್ಕಳಲ್ಲಿ ಓದುವಿಕೆ, ಬರವಣಿಗೆ ಮತ್ತು ಗಣಿತ ಕಲಿಕೆಯನ್ನು ಸುಧಾರಿಸಲು 2014 ರ ಆಗಸ್ಟ್‌ನಲ್ಲಿ ಪ್ರಾರಂಭವಾಯಿತು.
• (c) ಉಡಾನ್ (UDAAN): ಹೆಣ್ಣು ಮಕ್ಕಳು ಪ್ರತಿಷ್ಠಿತ ಇಂಜಿನಿಯರಿಂಗ್ ಪ್ರವೇಶ ಪರೀಕ್ಷೆಗಳಲ್ಲಿ ಉತ್ತೀರ್ಣರಾಗಲು ನೆರವಾಗುವಂತೆ CBSE ಮೂಲಕ 2014 ರ ನವೆಂಬರ್‌ನಲ್ಲಿ ಪ್ರಾರಂಭವಾಯಿತು.
ಆದ್ದರಿಂದ ಸರಿಯಾದ ಕಾಲಾನುಕ್ರಮ: (b), (a), (d), (c).', NULL, NULL)
ON CONFLICT (id) DO UPDATE SET
    node_id = EXCLUDED.node_id,
    subject = EXCLUDED.subject,
    subject_kannada = EXCLUDED.subject_kannada,
    domain = EXCLUDED.domain,
    domain_kannada = EXCLUDED.domain_kannada,
    sub_topic = EXCLUDED.sub_topic,
    sub_topic_kannada = EXCLUDED.sub_topic_kannada,
    difficulty = EXCLUDED.difficulty,
    tags = EXCLUDED.tags,
    question_english = EXCLUDED.question_english,
    question_kannada = EXCLUDED.question_kannada,
    option_1_english = EXCLUDED.option_1_english,
    option_2_english = EXCLUDED.option_2_english,
    option_3_english = EXCLUDED.option_3_english,
    option_4_english = EXCLUDED.option_4_english,
    option_1_kannada = EXCLUDED.option_1_kannada,
    option_2_kannada = EXCLUDED.option_2_kannada,
    option_3_kannada = EXCLUDED.option_3_kannada,
    option_4_kannada = EXCLUDED.option_4_kannada,
    key_answer = EXCLUDED.key_answer,
    explanation_english = EXCLUDED.explanation_english,
    explanation_kannada = EXCLUDED.explanation_kannada,
    image_url = EXCLUDED.image_url,
    table_data = EXCLUDED.table_data;

