import json

# Let's construct a dedicated comprehensive Teaching & Education Knowledge Graph
# covering KARTET, CTET, GPSTR, HSTR, KSET & UGC-NET Paper-1

teaching_nodes = {}

def add_node(id, name, level, levelName, subject, subjectId, parentId=None, childrenIds=None, ancestorIds=None, examTags=None, entities=None, keywords=None):
    teaching_nodes[id] = {
        "id": id,
        "slug": id.split(".")[-1],
        "name": name,
        "level": level,
        "levelName": levelName,
        "subject": subject,
        "subjectId": subjectId,
        "parentId": parentId,
        "childrenIds": childrenIds or [],
        "ancestorIds": ancestorIds or [],
        "examTags": examTags or {"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]},
        "rawExamTagString": "[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]",
        "entities": entities or [],
        "keywords": keywords or [name.upper()]
    }

# Level 1 Root Subjects for Education & Teaching:
ROOT_SUBJECTS = [
    {
        "id": "child_development_educational_psychology",
        "name": "Child Development & Educational Psychology",
        "subject": "CHILD_DEVELOPMENT_EDUCATIONAL_PSYCHOLOGY",
        "domains": [
            {
                "id": "growth_development_principles",
                "name": "Growth & Development Principles and Heredity vs Environment",
                "topics": [
                    ("stages_of_child_development_infancy_childhood_adolescence", "Stages of Child Development: Infancy, Early & Late Childhood, Adolescence"),
                    ("principles_of_development_cephalocaudal_proximodistal", "Principles of Development: Cephalocaudal, Proximodistal & Individual Differences"),
                    ("role_of_heredity_and_environment_nature_vs_nurture", "Role of Heredity and Environment (Nature vs Nurture Dynamics)")
                ]
            },
            {
                "id": "theories_of_cognitive_moral_psychosocial_development",
                "name": "Theories of Cognitive, Moral & Psychosocial Development",
                "topics": [
                    ("piaget_cognitive_development_theory_stages_schemas", "Jean Piaget Cognitive Development Theory: Sensorimotor, Preoperational, Concrete, Formal Operational"),
                    ("vygotsky_socio-cultural_theory_zpd_scaffolding_mko", "Lev Vygotsky Socio-Cultural Theory: ZPD, Scaffolding & Private Speech"),
                    ("kohlberg_moral_development_stages_levels_heinz_dilemma", "Lawrence Kohlberg Moral Development: Pre-conventional, Conventional & Post-conventional"),
                    ("erikson_psychosocial_development_eight_stages", "Erik Erikson Psychosocial Development: Eight Life-Span Stages & Crises")
                ]
            },
            {
                "id": "intelligence_theories_and_emotional_development",
                "name": "Theories of Intelligence, Creativity & Emotional Quotient",
                "topics": [
                    ("gardner_multiple_intelligences_theory", "Howard Gardner Multiple Intelligences Theory (8/9 Intelligences)"),
                    ("spearman_two_factor_thurstone_guilford_structure_of_intellect", "Spearman Two-Factor Theory, Thurstone Primary Mental Abilities & Guilford SOI"),
                    ("measurement_of_intelligence_iq_tests_binet_simon_wechsler", "Measurement of Intelligence: IQ Formula, Binet-Simon, Wechsler & Raven CPM/SPM"),
                    ("emotional_intelligence_daniel_goleman_dimensions", "Emotional Intelligence (EQ): Daniel Goleman Model & Classroom Applications"),
                    ("creativity_convergent_divergent_thinking_torrance_tests", "Creativity: Convergent vs Divergent Thinking & Torrance Tests of Creative Thinking (TTCT)")
                ]
            }
        ]
    },
    {
        "id": "theories_of_learning_motivation_cognition",
        "name": "Theories of Learning, Cognition & Motivation",
        "subject": "THEORIES_OF_LEARNING_MOTIVATION_COGNITION",
        "domains": [
            {
                "id": "behaviorist_and_conditioning_theories",
                "name": "Behaviorist Theories of Learning",
                "topics": [
                    ("pavlov_classical_conditioning_stimulus_response_extinction", "Ivan Pavlov Classical Conditioning: UCS, CS, UCR, CR, Generalization & Extinction"),
                    ("skinner_operant_conditioning_reinforcement_schedules_punishment", "B.F. Skinner Operant Conditioning: Positive/Negative Reinforcement & Schedules"),
                    ("thorndike_trial_and_error_laws_of_learning", "E.L. Thorndike Trial and Error Theory: Laws of Readiness, Exercise & Effect")
                ]
            },
            {
                "id": "cognitive_constructivist_social_learning_theories",
                "name": "Constructivist & Social Learning Theories",
                "topics": [
                    ("bandura_social_learning_theory_observational_modeling_bobo_doll", "Albert Bandura Social Cognitive Theory: Modeling, Vicarious Learning & Self-Efficacy"),
                    ("brunner_discovery_learning_enactive_iconic_symbolic_spiral_curriculum", "Jerome Bruner Discovery Learning: Enactive, Iconic, Symbolic Modes & Spiral Curriculum"),
                    ("constructivism_5e_model_engage_explore_explain_elaborate_evaluate", "Constructivist Learning Paradigm & 5E Instructional Model"),
                    ("information_processing_theory_sensory_short_term_long_term_memory", "Information Processing Theory: Sensory Register, Working Memory & Long-Term Memory")
                ]
            },
            {
                "id": "motivation_and_affective_factors_in_learning",
                "name": "Motivation, Personality & Factors Affecting Learning",
                "topics": [
                    ("maslow_hierarchy_of_needs_deficiency_vs_growth_needs", "Abraham Maslow Hierarchy of Needs: Deficiency vs Growth Needs"),
                    ("intrinsic_vs_extrinsic_motivation_self_determination_theory", "Intrinsic vs Extrinsic Motivation & Self-Determination Theory"),
                    ("transfer_of_learning_positive_negative_zero_bilateral", "Transfer of Learning: Positive, Negative, Zero, Vertical & Bilateral Transfer"),
                    ("factors_influencing_learning_maturation_attention_interest_fatigue", "Factors Influencing Learning: Maturation, Attention, Interest, Memory & Fatigue")
                ]
            }
        ]
    },
    {
        "id": "inclusive_education_diverse_learners_special_needs",
        "name": "Inclusive Education, Diverse Learners & Special Needs (CWSN)",
        "subject": "INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS",
        "domains": [
            {
                "id": "learning_disabilities_and_neurodevelopmental_disorders",
                "name": "Specific Learning Disabilities & Neurodevelopmental Needs",
                "topics": [
                    ("dyslexia_dyscalculia_dysgraphia_dyspraxia_identification", "Specific Learning Disabilities: Dyslexia, Dyscalculia, Dysgraphia, Dyspraxia"),
                    ("adhd_attention_deficit_hyperactivity_disorder_classroom_interventions", "ADHD (Attention Deficit Hyperactivity Disorder) & Behavioral Interventions"),
                    ("autism_spectrum_disorder_asd_sensory_communication_needs", "Autism Spectrum Disorder (ASD): Communication Strategies & Sensory Needs")
                ]
            },
            {
                "id": "diverse_learners_gifted_socio-economically_disadvantaged",
                "name": "Gifted, Creative & Disadvantaged Learners",
                "topics": [
                    ("gifted_and_talented_children_enrichment_acceleration_programmes", "Gifted and Talented Learners: Identification, Enrichment & Acceleration"),
                    ("first_generation_learners_sedg_socio-economically_disadvantaged_groups", "First Generation Learners & Socio-Economically Disadvantaged Groups (SEDGs)"),
                    ("gender_sensitization_gender_bias_stereotypes_in_textbooks_classrooms", "Gender Sensitization, Stereotypes in Textbooks & Inclusive Classroom Culture")
                ]
            },
            {
                "id": "assistive_technologies_and_rights_frameworks",
                "name": "Assistive Technologies & Legal Frameworks for CWSN",
                "topics": [
                    ("rights_of_persons_with_disabilities_act_rpwd_2016_21_disabilities", "Rights of Persons with Disabilities (RPwD) Act 2016 (21 Specified Disabilities)"),
                    ("individualized_education_plan_iep_universal_design_for_learning_udl", "Individualized Education Plan (IEP) & Universal Design for Learning (UDL)"),
                    ("assistive_devices_braille_screen_readers_hearing_aids_in_inclusive_schools", "Assistive Technologies: Braille, Screen Readers, AAC & Hearing Aids")
                ]
            }
        ]
    },
    {
        "id": "pedagogical_strategies_curriculum_assessment",
        "name": "Pedagogical Strategies, Curriculum & Assessment",
        "subject": "PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT",
        "domains": [
            {
                "id": "instructional_methods_and_teaching-learning_materials",
                "name": "Instructional Methods & Teaching-Learning Materials (TLM)",
                "topics": [
                    ("child-centered_vs_teacher-centered_pedagogy_inquiry-based_learning", "Child-Centered vs Teacher-Centered Methods: Inquiry & Problem-Based Learning"),
                    ("cooperative_and_collaborative_learning_jigsaw_peer_tutoring", "Cooperative & Collaborative Learning Strategies: Jigsaw, Think-Pair-Share, Peer Tutoring"),
                    ("ict_integration_in_education_digital_tools_diksha_swayam_moocs", "ICT Integration in Education: DIKSHA, SWAYAM, PM eVidya & Digital Resources"),
                    ("bloom_taxonomy_revised_anderson_krathwohl_cognitive_affective_psychomotor", "Bloom's Revised Taxonomy (Anderson & Krathwohl): Cognitive, Affective & Psychomotor Domains")
                ]
            },
            {
                "id": "assessment_evaluation_cce_and_test_construction",
                "name": "Assessment, Evaluation & Measurement",
                "topics": [
                    ("assessment_for_learning_of_learning_as_learning_formative_summative", "Assessment For, Of & As Learning: Formative vs Summative Assessment"),
                    ("continuous_and_comprehensive_evaluation_cce_scholastic_co-scholastic", "Continuous and Comprehensive Evaluation (CCE): Scholastic & Co-Scholastic Aspects"),
                    ("tools_and_techniques_rubrics_portfolios_anecdotal_records_rating_scales", "Evaluation Tools: Rubrics, Portfolios, Anecdotal Records & Checklists"),
                    ("characteristics_of_a_good_test_validity_reliability_usability_objectivity", "Characteristics of a Standardized Test: Validity, Reliability, Usability & Objectivity"),
                    ("diagnostic_testing_and_remedial_teaching_strategies", "Diagnostic Testing, Error Analysis & Remedial Teaching Strategies")
                ]
            },
            {
                "id": "action_research_and_classroom_management",
                "name": "Action Research & Classroom Management",
                "topics": [
                    ("action_research_steps_problem_hypothesis_data_action_reflection", "Educational Action Research: Steps (Plan, Act, Observe, Reflect)"),
                    ("classroom_management_strategies_positive_discipline_behavioral_support", "Classroom Management: Positive Behavioral Interventions & Supports (PBIS)")
                ]
            }
        ]
    },
    {
        "id": "subject_specific_pedagogies",
        "name": "Subject-Specific Pedagogies (Science, Math, Social Science, Languages)",
        "subject": "SUBJECT_SPECIFIC_PEDAGOGIES",
        "domains": [
            {
                "id": "pedagogy_of_mathematics",
                "name": "Pedagogy of Mathematics",
                "topics": [
                    ("nature_scope_values_of_mathematics_inductive_deductive_methods", "Nature, Scope & Values of Mathematics: Inductive vs Deductive Reasoning"),
                    ("mathematical_concepts_formation_van_hiele_geometric_thinking_levels", "Van Hiele Levels of Geometric Thinking & Number Sense Development"),
                    ("remedial_strategies_for_dyscalculia_and_math_anxiety", "Mathematical Misconceptions, Math Anxiety & Remedial Interventions")
                ]
            },
            {
                "id": "pedagogy_of_science_and_environmental_studies",
                "name": "Pedagogy of Science & Environmental Studies (EVS)",
                "topics": [
                    ("scientific_inquiry_process_skills_observation_experimentation_inference", "Scientific Inquiry & Science Process Skills: Observation, Hypothesis, Experimentation"),
                    ("evs_themes_ncert_family_food_shelter_water_travel_things_we_make", "NCERT 6 EVS Themes: Family & Friends, Food, Shelter, Water, Travel, Things We Make"),
                    ("laboratory_activities_science_kits_exhibitions_field_trips", "Science Laboratories, Science Kits, Exhibitions & Hands-on Inquiry")
                ]
            },
            {
                "id": "pedagogy_of_social_sciences",
                "name": "Pedagogy of Social Sciences",
                "topics": [
                    ("nature_of_social_sciences_critical_thinking_source_method_role_play", "Nature of Social Sciences: Source Method, Critical Inquiry & Role Play"),
                    ("utilizing_primary_sources_maps_historical_evidence_in_classrooms", "Utilizing Primary Historical Sources, Maps, Timelines & Artifacts")
                ]
            },
            {
                "id": "pedagogy_of_languages_kannada_english",
                "name": "Pedagogy of Language Development (LSRW)",
                "topics": [
                    ("four_language_skills_lsrw_listening_speaking_reading_writing", "Four Basic Language Skills: Listening, Speaking, Reading & Writing (LSRW)"),
                    ("chomsky_language_acquisition_device_lad_universal_grammar", "Noam Chomsky Language Acquisition Device (LAD) & Universal Grammar"),
                    ("approaches_to_language_teaching_communicative_structural_bilingual", "Language Teaching Approaches: Communicative (CLT), Structural, Grammar-Translation, Direct Method")
                ]
            }
        ]
    },
    {
        "id": "national_policies_and_higher_education_research_aptitude",
        "name": "National Education Policies & Research Aptitude (TET, KSET & UGC-NET)",
        "subject": "NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE",
        "domains": [
            {
                "id": "national_educational_policies_and_acts",
                "name": "National Educational Policies & Acts",
                "topics": [
                    ("national_education_policy_nep_2020_school_higher_education_5_3_3_4", "National Education Policy (NEP 2020): 5+3+3+4 Curricular Structure, PARAKH, NCF-SE 2023"),
                    ("right_to_education_act_rte_2009_provisions_pupil_teacher_ratio_smc", "Right to Education (RTE) Act 2009: Section Provisions, PTR (1:30, 1:35), SMC Role"),
                    ("national_curriculum_frameworks_ncf_2005_ncf-se_2023_foundational_stage", "National Curriculum Frameworks: NCF 2005 Guiding Principles & NCF-FS / NCF-SE 2023")
                ]
            },
            {
                "id": "research_methodology_kset_ugc_net_paper1",
                "name": "Research Aptitude & Methodology (KSET & UGC-NET Paper 1)",
                "topics": [
                    ("research_types_fundamental_applied_action_qualitative_quantitative", "Types of Research: Fundamental, Applied, Action, Qualitative & Quantitative Research"),
                    ("research_process_problem_formulation_hypothesis_sampling_methods", "Research Process: Problem Formulation, Hypothesis Testing & Probability/Non-Probability Sampling"),
                    ("data_collection_tools_questionnaires_interviews_observations_scales", "Data Collection Tools: Questionnaires, Structured Interviews, Psychometric Scales"),
                    ("research_ethics_plagiarism_citation_styles_apa_mla_chicago", "Research Ethics, Plagiarism Prevention (UGC Regulations) & Referencing Styles (APA, MLA)"),
                    ("thesis_and_article_writing_format_style_peer_review", "Thesis & Research Article Writing: Structure, Abstract, Methodology & Peer Review")
                ]
            },
            {
                "id": "higher_education_system_and_governance",
                "name": "Higher Education System, Governance & Quality Assurance",
                "topics": [
                    ("higher_education_regulatory_bodies_ugc_aicte_ncte_naac_nirf", "Regulatory & Quality Assurance Bodies: UGC, AICTE, NCTE, NAAC, NIRF & ABC (Academic Bank of Credits)"),
                    ("evolution_of_higher_learning_in_ancient_india_takshashila_nalanda_valabhi", "Ancient Institutions of Higher Learning: Takshashila, Nalanda, Valabhi, Vikramashila"),
                    ("value_education_environmental_education_in_higher_institutions", "Value Education, Environmental Education & Skill Development in Higher Education")
                ]
            }
        ]
    }
]

# Build the complete tree for teaching_nodes
root_ids = []
for sub in ROOT_SUBJECTS:
    s_id = sub["id"]
    root_ids.append(s_id)
    domain_ids = []
    
    for dom in sub["domains"]:
        d_id = f"{s_id}.{dom['id']}"
        domain_ids.append(d_id)
        topic_ids = []
        
        for t_slug, t_name in dom["topics"]:
            t_id = f"{d_id}.{t_slug}"
            topic_ids.append(t_id)
            add_node(
                id=t_id,
                name=t_name,
                level=3,
                levelName="Topic",
                subject=sub["subject"],
                subjectId=s_id,
                parentId=d_id,
                childrenIds=[],
                ancestorIds=[s_id, d_id]
            )
            
        add_node(
            id=d_id,
            name=dom["name"],
            level=2,
            levelName="Domain",
            subject=sub["subject"],
            subjectId=s_id,
            parentId=s_id,
            childrenIds=topic_ids,
            ancestorIds=[s_id]
        )
        
    add_node(
        id=s_id,
        name=sub["name"],
        level=1,
        levelName="Subject",
        subject=sub["subject"],
        subjectId=s_id,
        parentId=None,
        childrenIds=domain_ids,
        ancestorIds=[]
    )

l1 = sum(1 for n in teaching_nodes.values() if n["level"] == 1)
l2 = sum(1 for n in teaching_nodes.values() if n["level"] == 2)
l3 = sum(1 for n in teaching_nodes.values() if n["level"] == 3)

teaching_kg = {
    "version": "2.5.0",
    "name": "Teaching & Education Examinations Knowledge Graph (KARTET, CTET, GPSTR, HSTR, KSET, UGC-NET)",
    "generatedAt": "2026-08-22",
    "rootSubjectIds": root_ids,
    "nodes": teaching_nodes,
    "stats": {
        "total_nodes": len(teaching_nodes),
        "level_1_subjects": l1,
        "level_2_domains": l2,
        "level_3_topics": l3
    }
}

with open("src/data/knowledge_graph_teaching.json", "w", encoding="utf-8") as f:
    json.dump(teaching_kg, f, indent=4, ensure_ascii=False)

print(f"Created Comprehensive Teaching Knowledge Graph: {len(teaching_nodes)} total nodes (L1: {l1}, L2: {l2}, L3: {l3})")
