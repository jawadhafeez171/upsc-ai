-- =========================================================================
-- SUPABASE SEED 2: TEACHING & PEDAGOGY SUBGRAPH (57 NODES)
-- =========================================================================

BEGIN;

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'Educational Psychology, Child Development & Teaching Pedagogy', 1,
        'Subject', 'EDUCATIONAL PSYCHOLOGY, CHILD DEVELOPMENT & TEACHING PEDAGOGY', 'educational_psychology_child_development_teaching_pedagogy', NULL,
        ARRAY['educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence', 'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs', 'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management', 'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement', 'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude']::text[], ARRAY[]::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['EDUCATIONAL', 'PSYCHOLOGY', 'CHILD', 'DEVELOPMENT', 'TEACHING', 'PEDAGOGY']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics', 'child_development_growth_dynamics', 'Child Development & Growth Dynamics', 2,
        'Domain', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy',
        ARRAY['educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics.concept_of_growth_development', 'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics.heredity_environmental_determinants', 'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics.socialization_processes_moral_growth']::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Child', 'Development', 'Growth', 'Dynamics']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence', 'theories_of_learning_cognition_intelligence', 'Theories of Learning, Cognition & Intelligence', 2,
        'Domain', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy',
        ARRAY['educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence.cognitive_development_theories', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence.moral_development_frameworks', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence.behavioral_constructivist_learning_paradigms', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence.theories_of_intelligence_creativity']::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Theories', 'Learning', 'Cognition', 'Intelligence']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs', 'Inclusive Education, Diverse Learners & Special Needs (CWSN)', 2,
        'Domain', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy',
        ARRAY['educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs.philosophy_of_inclusive_education', 'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs.addressing_specific_learning_disabilities_neurodiversity', 'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs.educating_gifted_talented_underprivileged_learners']::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Inclusive', 'Education', 'Diverse', 'Learners', 'Special', 'Needs', 'CWSN']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management', 'pedagogical_strategies_curriculum_classroom_management', 'Pedagogical Strategies, Curriculum & Classroom Management', 2,
        'Domain', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy',
        ARRAY['educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management.teaching_methods_models_of_instruction', 'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management.curriculum_planning_taxonomy_of_educational_objectives', 'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management.classroom_dynamics_motivation_theories']::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Pedagogical', 'Strategies', 'Curriculum', 'Classroom', 'Management']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement', 'educational_assessment_evaluation_measurement', 'Educational Assessment, Evaluation & Measurement', 2,
        'Domain', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy',
        ARRAY['educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement.assessment_paradigms', 'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement.tools_techniques_of_evaluation', 'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement.remedial_teaching_feedback_mechanisms']::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Educational', 'Assessment', 'Evaluation', 'Measurement']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude', 'national_educational_policies_legal_frameworks_teacher_aptitude', 'National Educational Policies, Legal Frameworks & Teacher Aptitude', 2,
        'Domain', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy',
        ARRAY['educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude.national_education_policy_2020', 'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude.constitutional_statutory_framework_for_education', 'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude.research_teaching_aptitude_for_higher_education_kset_net']::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['National', 'Educational', 'Policies', 'Legal', 'Frameworks', 'Teacher', 'Aptitude']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics.concept_of_growth_development', 'concept_of_growth_development', 'Concept of Growth & Development (Principles of Development - Cephalocaudal & Proximodistal Trends, Continuity, Individual Differences, Inter-relation; Stages of Human Development - Infancy, Early Childhood, Middle Childhood, Adolescence: Physical, Motor, Social, Emotional & Cognitive Milestones)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Concept', 'Growth', 'Development', 'Principles', 'Cephalocaudal', 'Proximodistal', 'Trends', 'Continuity', 'Individual', 'Differences', 'Inter', 'relation', 'Stages', 'Human', 'Infancy', 'Early', 'Childhood', 'Middle', 'Adolescence', 'Physical', 'Motor', 'Social', 'Emotional', 'Cognitive', 'Milestones']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics.heredity_environmental_determinants', 'heredity_environmental_determinants', 'Heredity & Environmental Determinants (Nature vs Nurture Debate, Role of Genetics & Heredity, Environmental Factors - Family, Parenting Styles, Schooling, Peer Groups, Socio-Economic Context, Bronfenbrenner''s Ecological Systems Theory)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Heredity', 'Environmental', 'Determinants', 'Nature', 'Nurture', 'Debate', 'Role', 'Genetics', 'Factors', 'Family', 'Parenting', 'Styles', 'Schooling', 'Peer', 'Groups', 'Socio', 'Economic', 'Context', 'Bronfenbrenner''s', 'Ecological', 'Systems', 'Theory']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics.socialization_processes_moral_growth', 'socialization_processes_moral_growth', 'Socialization Processes & Moral Growth (Agents of Socialization - Family, School, Peer Groups, Mass Media; Developing Self-Concept, Gender Identity & Stereotypes; Adolescent Dynamics - Identity vs Role Confusion / Erik Erikson, Emotional Turmoil, Peer Pressure & Career Orientation)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.child_development_growth_dynamics']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Socialization', 'Processes', 'Moral', 'Growth', 'Agents', 'Family', 'School', 'Peer', 'Groups', 'Mass', 'Media', 'Developing', 'Self', 'Concept', 'Gender', 'Identity', 'Stereotypes', 'Adolescent', 'Dynamics', 'Role', 'Confusion', 'Erik', 'Erikson', 'Emotional', 'Turmoil', 'Pressure', 'Career', 'Orientation']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence.cognitive_development_theories', 'cognitive_development_theories', 'Cognitive Development Theories (Jean Piaget - Stages: Sensorimotor, Pre-operational, Concrete Operational, Formal Operational; Schemas, Assimilation, Accommodation, Equilibration; Lev Vygotsky - Socio-Cultural Perspective, Zone of Proximal Development / ZPD, Scaffolding, More Knowledgeable Other / MKO, Private Speech)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Cognitive', 'Development', 'Theories', 'Jean', 'Piaget', 'Stages', 'Sensorimotor', 'Pre', 'operational', 'Concrete', 'Operational', 'Formal', 'Schemas', 'Assimilation', 'Accommodation', 'Equilibration', 'Lev', 'Vygotsky', 'Socio', 'Cultural', 'Perspective', 'Zone', 'Proximal', 'ZPD', 'Scaffolding', 'Knowledgeable', 'Other', 'MKO', 'Private', 'Speech']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence.moral_development_frameworks', 'moral_development_frameworks', 'Moral Development Frameworks (Lawrence Kohlberg - Pre-Conventional, Conventional, Post-Conventional Stages; Carol Gilligan Ethics of Care Critique)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Moral', 'Development', 'Frameworks', 'Lawrence', 'Kohlberg', 'Pre', 'Conventional', 'Post', 'Stages', 'Carol', 'Gilligan', 'Ethics', 'Care', 'Critique']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence.behavioral_constructivist_learning_paradigms', 'behavioral_constructivist_learning_paradigms', 'Behavioral & Constructivist Learning Paradigms (Ivan Pavlov Classical Conditioning - Stimulus, Response, Extinction; B.F. Skinner Operant Conditioning - Reinforcement & Punishment Schedules; Edward Thorndike Connectionism / Laws of Learning - Readiness, Exercise, Effect; Constructivist Learning - Jerome Bruner Discovery Learning, Representation Modes: Enactive, Iconic, Symbolic; Albert Bandura Social Learning Theory - Modeling, Observational Learning, Vicarious Reinforcement)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Behavioral', 'Constructivist', 'Learning', 'Paradigms', 'Ivan', 'Pavlov', 'Classical', 'Conditioning', 'Stimulus', 'Response', 'Extinction', 'B.F.', 'Skinner', 'Operant', 'Reinforcement', 'Punishment', 'Schedules', 'Edward', 'Thorndike', 'Connectionism', 'Laws', 'Readiness', 'Exercise', 'Effect', 'Jerome', 'Bruner', 'Discovery', 'Representation', 'Modes', 'Enactive', 'Iconic', 'Symbolic', 'Albert', 'Bandura', 'Social', 'Theory', 'Modeling', 'Observational', 'Vicarious']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence.theories_of_intelligence_creativity', 'theories_of_intelligence_creativity', 'Theories of Intelligence & Creativity (Charles Spearman Two-Factor Theory - General ''g'' & Specific ''s'' factors; Howard Gardner Theory of Multiple Intelligences - 8 Intelligences: Linguistic, Logical-Mathematical, Spatial, Bodily-Kinesthetic, Musical, Interpersonal, Intrapersonal, Naturalistic; Robert Sternberg Triarchic Theory - Analytical, Creative, Practical; Emotional Intelligence in Education - Daniel Goleman Model; Creativity - Convergent vs Divergent Thinking, Fostering Innovation in Classrooms)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.theories_of_learning_cognition_intelligence']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Theories', 'Intelligence', 'Creativity', 'Charles', 'Spearman', 'Two', 'Factor', 'Theory', 'General', 'g', 'Specific', 's', 'factors', 'Howard', 'Gardner', 'Multiple', 'Intelligences', 'Linguistic', 'Logical', 'Mathematical', 'Spatial', 'Bodily', 'Kinesthetic', 'Musical', 'Interpersonal', 'Intrapersonal', 'Naturalistic', 'Robert', 'Sternberg', 'Triarchic', 'Analytical', 'Creative', 'Practical', 'Emotional', 'Education', 'Daniel', 'Goleman', 'Model', 'Convergent', 'Divergent', 'Thinking', 'Fostering', 'Innovation', 'Classrooms']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs.philosophy_of_inclusive_education', 'philosophy_of_inclusive_education', 'Philosophy of Inclusive Education (Transition from Segregation & Integration to Mainstream Inclusion; Barrier-Free Environment; Universal Design for Learning / UDL; Equity vs Equality in Classrooms)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Philosophy', 'Inclusive', 'Education', 'Transition', 'Segregation', 'Integration', 'Mainstream', 'Inclusion', 'Barrier', 'Free', 'Environment', 'Universal', 'Design', 'Learning', 'UDL', 'Equity', 'Equality', 'Classrooms']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs.addressing_specific_learning_disabilities_neurodiversity', 'addressing_specific_learning_disabilities_neurodiversity', 'Addressing Specific Learning Disabilities & Neurodiversity (Dyslexia - Reading Difficulty, Dysgraphia - Writing Impairment, Dyscalculia - Mathematical Disability, Dyspraxia - Motor Skills, Attention Deficit Hyperactivity Disorder / ADHD, Autism Spectrum Disorder / ASD)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Addressing', 'Specific', 'Learning', 'Disabilities', 'Neurodiversity', 'Dyslexia', 'Reading', 'Difficulty', 'Dysgraphia', 'Writing', 'Impairment', 'Dyscalculia', 'Mathematical', 'Disability', 'Dyspraxia', 'Motor', 'Skills', 'Attention', 'Deficit', 'Hyperactivity', 'Disorder', 'ADHD', 'Autism', 'Spectrum', 'ASD']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs.educating_gifted_talented_underprivileged_learners', 'educating_gifted_talented_underprivileged_learners', 'Educating Gifted, Talented & Underprivileged Learners (Identification of Gifted & Creative Children - Enriched Curriculum, Acceleration, Talent Search; Socio-Economically Disadvantaged Groups / SEDGs, First-Generation Learners, Gender Sensitization in Schooling)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.inclusive_education_diverse_learners_special_needs']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Educating', 'Gifted', 'Talented', 'Underprivileged', 'Learners', 'Identification', 'Creative', 'Children', 'Enriched', 'Curriculum', 'Acceleration', 'Talent', 'Search', 'Socio', 'Economically', 'Disadvantaged', 'Groups', 'SEDGs', 'First', 'Generation', 'Gender', 'Sensitization', 'Schooling']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management.teaching_methods_models_of_instruction', 'teaching_methods_models_of_instruction', 'Teaching Methods & Models of Instruction (Teacher-Centered vs Learner-Centered Approaches; Problem-Based Learning / PBL, Project Method / William Kilpatrick, Inquiry-Based Learning, Collaborative & Cooperative Learning / Jigsaw Technique, Experiential Learning / David Kolb Cycle)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Teaching', 'Methods', 'Models', 'Instruction', 'Teacher', 'Centered', 'Learner', 'Approaches', 'Problem', 'Based', 'Learning', 'PBL', 'Project', 'Method', 'William', 'Kilpatrick', 'Inquiry', 'Collaborative', 'Cooperative', 'Jigsaw', 'Technique', 'Experiential', 'David', 'Kolb', 'Cycle']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management.curriculum_planning_taxonomy_of_educational_objectives', 'curriculum_planning_taxonomy_of_educational_objectives', 'Curriculum Planning & Taxonomy of Educational Objectives (Bloom''s Revised Taxonomy - Cognitive Domain: Remembering, Understanding, Applying, Analyzing, Evaluating, Creating; Affective Domain / Krathwohl; Psychomotor Domain / Dave & Simpson; Micro-Teaching & Lesson Planning - 5E Model: Engage, Explore, Explain, Elaborate, Evaluate)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Curriculum', 'Planning', 'Taxonomy', 'Educational', 'Objectives', 'Bloom''s', 'Revised', 'Cognitive', 'Domain', 'Remembering', 'Understanding', 'Applying', 'Analyzing', 'Evaluating', 'Creating', 'Affective', 'Krathwohl', 'Psychomotor', 'Dave', 'Simpson', 'Micro', 'Teaching', 'Lesson', 'Model', 'Engage', 'Explore', 'Explain', 'Elaborate', 'Evaluate']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management.classroom_dynamics_motivation_theories', 'classroom_dynamics_motivation_theories', 'Classroom Dynamics & Motivation Theories (Intrinsic vs Extrinsic Motivation; Abraham Maslow Hierarchy of Needs in Education; Self-Determination Theory; Classroom Management Strategies - Positive Behaviour Support / PBS, Restorative Practices, Conflict Resolution)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.pedagogical_strategies_curriculum_classroom_management']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Classroom', 'Dynamics', 'Motivation', 'Theories', 'Intrinsic', 'Extrinsic', 'Abraham', 'Maslow', 'Hierarchy', 'Needs', 'Education', 'Self', 'Determination', 'Theory', 'Management', 'Strategies', 'Positive', 'Behaviour', 'Support', 'PBS', 'Restorative', 'Practices', 'Conflict', 'Resolution']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement.assessment_paradigms', 'assessment_paradigms', 'Assessment Paradigms (Assessment for Learning - Formative & Diagnostic Assessment; Assessment of Learning - Summative Evaluation; Assessment as Learning - Self & Peer Assessment; Continuous and Comprehensive Evaluation / CCE - Scholastic & Co-scholastic Domains)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Assessment', 'Paradigms', 'Learning', 'Formative', 'Diagnostic', 'Summative', 'Evaluation', 'Self', 'Peer', 'Continuous', 'Comprehensive', 'CCE', 'Scholastic', 'scholastic', 'Domains']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement.tools_techniques_of_evaluation', 'tools_techniques_of_evaluation', 'Tools & Techniques of Evaluation (Rubrics, Portfolios, Anecdotal Records, Cumulative Record Cards / CRC, Rating Scales, Checklists; Standardized vs Teacher-Made Tests; Test Construction - Reliability, Validity, Objectivity, Usability, Blueprint Preparation)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Tools', 'Techniques', 'Evaluation', 'Rubrics', 'Portfolios', 'Anecdotal', 'Records', 'Cumulative', 'Record', 'Cards', 'CRC', 'Rating', 'Scales', 'Checklists', 'Standardized', 'Teacher', 'Made', 'Tests', 'Test', 'Construction', 'Reliability', 'Validity', 'Objectivity', 'Usability', 'Blueprint', 'Preparation']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement.remedial_teaching_feedback_mechanisms', 'remedial_teaching_feedback_mechanisms', 'Remedial Teaching & Feedback Mechanisms (Identifying Learning Gaps, Error Analysis, Tailored Remedial Interventions, Feedback Delivery - Specific, Timely & Actionable)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.educational_assessment_evaluation_measurement']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Remedial', 'Teaching', 'Feedback', 'Mechanisms', 'Identifying', 'Learning', 'Gaps', 'Error', 'Analysis', 'Tailored', 'Interventions', 'Delivery', 'Specific', 'Timely', 'Actionable']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude.national_education_policy_2020', 'national_education_policy_2020', 'National Education Policy 2020 (NEP 2020 Architecture - Foundational, Preparatory, Middle, Secondary 5+3+3+4 Stage Structure; Foundational Literacy & Numeracy / NIPUN Bharat Mission; Mother Tongue / Regional Language Medium; National Curriculum Framework / NCF-FS 2022 & NCF-SE 2023; PARAKH Assessment Centre; Higher Education Commission of India / HECI)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['National', 'Education', 'Policy', '2020', 'NEP', 'Architecture', 'Foundational', 'Preparatory', 'Middle', 'Secondary', '5+3+3+4', 'Stage', 'Structure', 'Literacy', 'Numeracy', 'NIPUN', 'Bharat', 'Mission', 'Mother', 'Tongue', 'Regional', 'Language', 'Medium', 'Curriculum', 'Framework', 'NCF', '2022', '2023', 'PARAKH', 'Assessment', 'Centre', 'Higher', 'Commission', 'India', 'HECI']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude.constitutional_statutory_framework_for_education', 'constitutional_statutory_framework_for_education', 'Constitutional & Statutory Framework for Education (Article 21A Right to Free & Compulsory Education; Right of Children to Free and Compulsory Education Act 2009 / RTE Act - 25% EWS Reservation, Pupil-Teacher Ratio / PTR, No-Detention Policy & Amendment, School Management Committees / SMC; Protection of Children from Sexual Offences / POCSO Act 2012; Rights of Persons with Disabilities / RPwD Act 2016)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Constitutional', 'Statutory', 'Framework', 'Education', 'Article', '21A', 'Right', 'Free', 'Compulsory', 'Children', 'Act', '2009', 'RTE', '25%', 'EWS', 'Reservation', 'Pupil', 'Teacher', 'Ratio', 'PTR', 'Detention', 'Policy', 'Amendment', 'School', 'Management', 'Committees', 'SMC', 'Protection', 'Sexual', 'Offences', 'POCSO', '2012', 'Rights', 'Persons', 'Disabilities', 'RPwD', '2016']::text[],
        'teaching', ARRAY['teaching']::text[]
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
        'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude.research_teaching_aptitude_for_higher_education_kset_net', 'research_teaching_aptitude_for_higher_education_kset_net', 'Research & Teaching Aptitude for Higher Education / KSET / NET (Characteristics of Higher Education Teaching; Research Methodology - Qualitative vs Quantitative Methods, Experimental Research, Action Research, Sampling Techniques, Hypothesis Formulation, Academic Ethics, Citation Standards & Plagiarism Avoidance)', 3,
        'Topic', 'Educational Psychology, Child Development & Teaching Pedagogy', 'educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude',
        ARRAY[]::text[], ARRAY['educational_psychology_child_development_teaching_pedagogy', 'educational_psychology_child_development_teaching_pedagogy.national_educational_policies_legal_frameworks_teacher_aptitude']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['Research', 'Teaching', 'Aptitude', 'Higher', 'Education', 'KSET', 'NET', 'Characteristics', 'Methodology', 'Qualitative', 'Quantitative', 'Methods', 'Experimental', 'Action', 'Sampling', 'Techniques', 'Hypothesis', 'Formulation', 'Academic', 'Ethics', 'Citation', 'Standards', 'Plagiarism', 'Avoidance']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.growth_development_principles.stages_of_child_development_infancy_childhood_adolescence', 'stages_of_child_development_infancy_childhood_adolescence', 'Stages of Child Development: Infancy, Early & Late Childhood, Adolescence', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.growth_development_principles',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.growth_development_principles']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['STAGES OF CHILD DEVELOPMENT: INFANCY, EARLY & LATE CHILDHOOD, ADOLESCENCE']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.growth_development_principles.principles_of_development_cephalocaudal_proximodistal', 'principles_of_development_cephalocaudal_proximodistal', 'Principles of Development: Cephalocaudal, Proximodistal & Individual Differences', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.growth_development_principles',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.growth_development_principles']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['PRINCIPLES OF DEVELOPMENT: CEPHALOCAUDAL, PROXIMODISTAL & INDIVIDUAL DIFFERENCES']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.growth_development_principles.role_of_heredity_and_environment_nature_vs_nurture', 'role_of_heredity_and_environment_nature_vs_nurture', 'Role of Heredity and Environment (Nature vs Nurture Dynamics)', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.growth_development_principles',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.growth_development_principles']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ROLE OF HEREDITY AND ENVIRONMENT (NATURE VS NURTURE DYNAMICS)']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.growth_development_principles', 'growth_development_principles', 'Growth & Development Principles and Heredity vs Environment', 2,
        'Domain', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology',
        ARRAY['child_development_educational_psychology.growth_development_principles.stages_of_child_development_infancy_childhood_adolescence', 'child_development_educational_psychology.growth_development_principles.principles_of_development_cephalocaudal_proximodistal', 'child_development_educational_psychology.growth_development_principles.role_of_heredity_and_environment_nature_vs_nurture']::text[], ARRAY['child_development_educational_psychology']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['GROWTH & DEVELOPMENT PRINCIPLES AND HEREDITY VS ENVIRONMENT']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development.piaget_cognitive_development_theory_stages_schemas', 'piaget_cognitive_development_theory_stages_schemas', 'Jean Piaget Cognitive Development Theory: Sensorimotor, Preoperational, Concrete, Formal Operational', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['JEAN PIAGET COGNITIVE DEVELOPMENT THEORY: SENSORIMOTOR, PREOPERATIONAL, CONCRETE, FORMAL OPERATIONAL']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development.vygotsky_socio-cultural_theory_zpd_scaffolding_mko', 'vygotsky_socio-cultural_theory_zpd_scaffolding_mko', 'Lev Vygotsky Socio-Cultural Theory: ZPD, Scaffolding & Private Speech', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['LEV VYGOTSKY SOCIO-CULTURAL THEORY: ZPD, SCAFFOLDING & PRIVATE SPEECH']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development.kohlberg_moral_development_stages_levels_heinz_dilemma', 'kohlberg_moral_development_stages_levels_heinz_dilemma', 'Lawrence Kohlberg Moral Development: Pre-conventional, Conventional & Post-conventional', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['LAWRENCE KOHLBERG MORAL DEVELOPMENT: PRE-CONVENTIONAL, CONVENTIONAL & POST-CONVENTIONAL']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development.erikson_psychosocial_development_eight_stages', 'erikson_psychosocial_development_eight_stages', 'Erik Erikson Psychosocial Development: Eight Life-Span Stages & Crises', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ERIK ERIKSON PSYCHOSOCIAL DEVELOPMENT: EIGHT LIFE-SPAN STAGES & CRISES']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development', 'theories_of_cognitive_moral_psychosocial_development', 'Theories of Cognitive, Moral & Psychosocial Development', 2,
        'Domain', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology',
        ARRAY['child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development.piaget_cognitive_development_theory_stages_schemas', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development.vygotsky_socio-cultural_theory_zpd_scaffolding_mko', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development.kohlberg_moral_development_stages_levels_heinz_dilemma', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development.erikson_psychosocial_development_eight_stages']::text[], ARRAY['child_development_educational_psychology']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['THEORIES OF COGNITIVE, MORAL & PSYCHOSOCIAL DEVELOPMENT']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.intelligence_theories_and_emotional_development.gardner_multiple_intelligences_theory', 'gardner_multiple_intelligences_theory', 'Howard Gardner Multiple Intelligences Theory (8/9 Intelligences)', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['HOWARD GARDNER MULTIPLE INTELLIGENCES THEORY (8/9 INTELLIGENCES)']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.intelligence_theories_and_emotional_development.spearman_two_factor_thurstone_guilford_structure_of_intellect', 'spearman_two_factor_thurstone_guilford_structure_of_intellect', 'Spearman Two-Factor Theory, Thurstone Primary Mental Abilities & Guilford SOI', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['SPEARMAN TWO-FACTOR THEORY, THURSTONE PRIMARY MENTAL ABILITIES & GUILFORD SOI']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.intelligence_theories_and_emotional_development.measurement_of_intelligence_iq_tests_binet_simon_wechsler', 'measurement_of_intelligence_iq_tests_binet_simon_wechsler', 'Measurement of Intelligence: IQ Formula, Binet-Simon, Wechsler & Raven CPM/SPM', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['MEASUREMENT OF INTELLIGENCE: IQ FORMULA, BINET-SIMON, WECHSLER & RAVEN CPM/SPM']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.intelligence_theories_and_emotional_development.emotional_intelligence_daniel_goleman_dimensions', 'emotional_intelligence_daniel_goleman_dimensions', 'Emotional Intelligence (EQ): Daniel Goleman Model & Classroom Applications', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['EMOTIONAL INTELLIGENCE (EQ): DANIEL GOLEMAN MODEL & CLASSROOM APPLICATIONS']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.intelligence_theories_and_emotional_development.creativity_convergent_divergent_thinking_torrance_tests', 'creativity_convergent_divergent_thinking_torrance_tests', 'Creativity: Convergent vs Divergent Thinking & Torrance Tests of Creative Thinking (TTCT)', 3,
        'Topic', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development',
        ARRAY[]::text[], ARRAY['child_development_educational_psychology', 'child_development_educational_psychology.intelligence_theories_and_emotional_development']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['CREATIVITY: CONVERGENT VS DIVERGENT THINKING & TORRANCE TESTS OF CREATIVE THINKING (TTCT)']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology.intelligence_theories_and_emotional_development', 'intelligence_theories_and_emotional_development', 'Theories of Intelligence, Creativity & Emotional Quotient', 2,
        'Domain', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', 'child_development_educational_psychology',
        ARRAY['child_development_educational_psychology.intelligence_theories_and_emotional_development.gardner_multiple_intelligences_theory', 'child_development_educational_psychology.intelligence_theories_and_emotional_development.spearman_two_factor_thurstone_guilford_structure_of_intellect', 'child_development_educational_psychology.intelligence_theories_and_emotional_development.measurement_of_intelligence_iq_tests_binet_simon_wechsler', 'child_development_educational_psychology.intelligence_theories_and_emotional_development.emotional_intelligence_daniel_goleman_dimensions', 'child_development_educational_psychology.intelligence_theories_and_emotional_development.creativity_convergent_divergent_thinking_torrance_tests']::text[], ARRAY['child_development_educational_psychology']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['THEORIES OF INTELLIGENCE, CREATIVITY & EMOTIONAL QUOTIENT']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'child_development_educational_psychology', 'child_development_educational_psychology', 'Child Development & Educational Psychology', 1,
        'Subject', 'CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY', 'child_development_educational_psychology', NULL,
        ARRAY['child_development_educational_psychology.growth_development_principles', 'child_development_educational_psychology.theories_of_cognitive_moral_psychosocial_development', 'child_development_educational_psychology.intelligence_theories_and_emotional_development']::text[], ARRAY[]::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['CHILD DEVELOPMENT & EDUCATIONAL PSYCHOLOGY']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories.pavlov_classical_conditioning_stimulus_response_extinction', 'pavlov_classical_conditioning_stimulus_response_extinction', 'Ivan Pavlov Classical Conditioning: UCS, CS, UCR, CR, Generalization & Extinction', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['IVAN PAVLOV CLASSICAL CONDITIONING: UCS, CS, UCR, CR, GENERALIZATION & EXTINCTION']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories.skinner_operant_conditioning_reinforcement_schedules_punishment', 'skinner_operant_conditioning_reinforcement_schedules_punishment', 'B.F. Skinner Operant Conditioning: Positive/Negative Reinforcement & Schedules', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['B.F. SKINNER OPERANT CONDITIONING: POSITIVE/NEGATIVE REINFORCEMENT & SCHEDULES']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories.thorndike_trial_and_error_laws_of_learning', 'thorndike_trial_and_error_laws_of_learning', 'E.L. Thorndike Trial and Error Theory: Laws of Readiness, Exercise & Effect', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['E.L. THORNDIKE TRIAL AND ERROR THEORY: LAWS OF READINESS, EXERCISE & EFFECT']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories', 'behaviorist_and_conditioning_theories', 'Behaviorist Theories of Learning', 2,
        'Domain', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition',
        ARRAY['theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories.pavlov_classical_conditioning_stimulus_response_extinction', 'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories.skinner_operant_conditioning_reinforcement_schedules_punishment', 'theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories.thorndike_trial_and_error_laws_of_learning']::text[], ARRAY['theories_of_learning_motivation_cognition']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['BEHAVIORIST THEORIES OF LEARNING']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories.bandura_social_learning_theory_observational_modeling_bobo_doll', 'bandura_social_learning_theory_observational_modeling_bobo_doll', 'Albert Bandura Social Cognitive Theory: Modeling, Vicarious Learning & Self-Efficacy', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ALBERT BANDURA SOCIAL COGNITIVE THEORY: MODELING, VICARIOUS LEARNING & SELF-EFFICACY']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories.brunner_discovery_learning_enactive_iconic_symbolic_spiral_curriculum', 'brunner_discovery_learning_enactive_iconic_symbolic_spiral_curriculum', 'Jerome Bruner Discovery Learning: Enactive, Iconic, Symbolic Modes & Spiral Curriculum', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['JEROME BRUNER DISCOVERY LEARNING: ENACTIVE, ICONIC, SYMBOLIC MODES & SPIRAL CURRICULUM']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories.constructivism_5e_model_engage_explore_explain_elaborate_evaluate', 'constructivism_5e_model_engage_explore_explain_elaborate_evaluate', 'Constructivist Learning Paradigm & 5E Instructional Model', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['CONSTRUCTIVIST LEARNING PARADIGM & 5E INSTRUCTIONAL MODEL']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories.information_processing_theory_sensory_short_term_long_term_memory', 'information_processing_theory_sensory_short_term_long_term_memory', 'Information Processing Theory: Sensory Register, Working Memory & Long-Term Memory', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['INFORMATION PROCESSING THEORY: SENSORY REGISTER, WORKING MEMORY & LONG-TERM MEMORY']::text[],
        'teaching', ARRAY['teaching']::text[]
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
        'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories', 'cognitive_constructivist_social_learning_theories', 'Constructivist & Social Learning Theories', 2,
        'Domain', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition',
        ARRAY['theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories.bandura_social_learning_theory_observational_modeling_bobo_doll', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories.brunner_discovery_learning_enactive_iconic_symbolic_spiral_curriculum', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories.constructivism_5e_model_engage_explore_explain_elaborate_evaluate', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories.information_processing_theory_sensory_short_term_long_term_memory']::text[], ARRAY['theories_of_learning_motivation_cognition']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['CONSTRUCTIVIST & SOCIAL LEARNING THEORIES']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning.maslow_hierarchy_of_needs_deficiency_vs_growth_needs', 'maslow_hierarchy_of_needs_deficiency_vs_growth_needs', 'Abraham Maslow Hierarchy of Needs: Deficiency vs Growth Needs', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ABRAHAM MASLOW HIERARCHY OF NEEDS: DEFICIENCY VS GROWTH NEEDS']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning.intrinsic_vs_extrinsic_motivation_self_determination_theory', 'intrinsic_vs_extrinsic_motivation_self_determination_theory', 'Intrinsic vs Extrinsic Motivation & Self-Determination Theory', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['INTRINSIC VS EXTRINSIC MOTIVATION & SELF-DETERMINATION THEORY']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning.transfer_of_learning_positive_negative_zero_bilateral', 'transfer_of_learning_positive_negative_zero_bilateral', 'Transfer of Learning: Positive, Negative, Zero, Vertical & Bilateral Transfer', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['TRANSFER OF LEARNING: POSITIVE, NEGATIVE, ZERO, VERTICAL & BILATERAL TRANSFER']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning.factors_influencing_learning_maturation_attention_interest_fatigue', 'factors_influencing_learning_maturation_attention_interest_fatigue', 'Factors Influencing Learning: Maturation, Attention, Interest, Memory & Fatigue', 3,
        'Topic', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning',
        ARRAY[]::text[], ARRAY['theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['FACTORS INFLUENCING LEARNING: MATURATION, ATTENTION, INTEREST, MEMORY & FATIGUE']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning', 'motivation_and_affective_factors_in_learning', 'Motivation, Personality & Factors Affecting Learning', 2,
        'Domain', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition',
        ARRAY['theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning.maslow_hierarchy_of_needs_deficiency_vs_growth_needs', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning.intrinsic_vs_extrinsic_motivation_self_determination_theory', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning.transfer_of_learning_positive_negative_zero_bilateral', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning.factors_influencing_learning_maturation_attention_interest_fatigue']::text[], ARRAY['theories_of_learning_motivation_cognition']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['MOTIVATION, PERSONALITY & FACTORS AFFECTING LEARNING']::text[],
        'teaching', ARRAY['teaching']::text[]
    ),
    (
        'theories_of_learning_motivation_cognition', 'theories_of_learning_motivation_cognition', 'Theories of Learning, Cognition & Motivation', 1,
        'Subject', 'THEORIES_OF_LEARNING_MOTIVATION_COGNITION', 'theories_of_learning_motivation_cognition', NULL,
        ARRAY['theories_of_learning_motivation_cognition.behaviorist_and_conditioning_theories', 'theories_of_learning_motivation_cognition.cognitive_constructivist_social_learning_theories', 'theories_of_learning_motivation_cognition.motivation_and_affective_factors_in_learning']::text[], ARRAY[]::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['THEORIES OF LEARNING, COGNITION & MOTIVATION']::text[],
        'teaching', ARRAY['teaching']::text[]
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
