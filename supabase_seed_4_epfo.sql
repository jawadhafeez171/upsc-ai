-- =========================================================================
-- SUPABASE SEED 4: UPSC EPFO SUBGRAPH (81 NODES)
-- =========================================================================

BEGIN;

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws', 'Industrial Relations & Labour Laws', 1,
        'Subject', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', NULL,
        ARRAY['industrial_relations_and_labour_laws.industrial_relations', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts', 'industrial_relations_and_labour_laws.new_labour_codes']::text[], ARRAY[]::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['INDUSTRIAL RELATIONS & LABOUR LAWS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles', 'general_accounting_principles', 'General Accounting Principles', 1,
        'Subject', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', NULL,
        ARRAY['general_accounting_principles.accounting_framework_and_concepts', 'general_accounting_principles.accounting_process_and_books', 'general_accounting_principles.financial_statements_and_adjustments', 'general_accounting_principles.special_and_advanced_accounts']::text[], ARRAY[]::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['GENERAL ACCOUNTING PRINCIPLES']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing', 'auditing', 'Auditing', 1,
        'Subject', 'AUDITING', 'auditing', NULL,
        ARRAY['auditing.fundamentals_and_audit_planning', 'auditing.vouching_verification_and_company_audit']::text[], ARRAY[]::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['AUDITING']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance', 'insurance', 'Insurance', 1,
        'Subject', 'INSURANCE', 'insurance', NULL,
        ARRAY['insurance.principles_and_fundamentals_of_insurance', 'insurance.life_general_and_health_insurance', 'insurance.regulatory_framework_and_government_schemes']::text[], ARRAY[]::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['INSURANCE']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india', 'social_security_in_india', 'Social Security in India', 1,
        'Subject', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', NULL,
        ARRAY['social_security_in_india.concept_and_constitutional_framework', 'social_security_in_india.statutory_social_security_framework', 'social_security_in_india.code_on_social_security_2020']::text[], ARRAY[]::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['SOCIAL SECURITY IN INDIA']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'applied_statistics', 'applied_statistics', 'Applied Statistics', 1,
        'Subject', 'APPLIED_STATISTICS', 'applied_statistics', NULL,
        ARRAY['applied_statistics.data_collection_and_central_tendency', 'applied_statistics.dispersion_correlation_and_probability']::text[], ARRAY[]::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['APPLIED STATISTICS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.industrial_relations', 'industrial_relations', 'Industrial Relations & Trade Unionism', 2,
        'Domain', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws',
        ARRAY['industrial_relations_and_labour_laws.industrial_relations.theories_and_approaches_of_industrial_relations', 'industrial_relations_and_labour_laws.industrial_relations.trade_unions_and_collective_bargaining', 'industrial_relations_and_labour_laws.industrial_relations.industrial_disputes_and_adjudication', 'industrial_relations_and_labour_laws.industrial_relations.workers_participation_in_management', 'industrial_relations_and_labour_laws.industrial_relations.tripartism_and_ilo']::text[], ARRAY['industrial_relations_and_labour_laws']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['INDUSTRIAL RELATIONS & TRADE UNIONISM']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts', 'labour_legislation_and_historic_acts', 'Labour Legislation & Historic Labour Acts', 2,
        'Domain', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws',
        ARRAY['industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.trade_unions_act_1926', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.industrial_disputes_act_1947', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.factories_act_1948', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.wages_legislation_acts', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.contract_and_migrant_labour_acts', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.special_category_labour_acts']::text[], ARRAY['industrial_relations_and_labour_laws']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['LABOUR LEGISLATION & HISTORIC LABOUR ACTS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.new_labour_codes', 'new_labour_codes', 'The Four New Labour Codes', 2,
        'Domain', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws',
        ARRAY['industrial_relations_and_labour_laws.new_labour_codes.code_on_wages_2019', 'industrial_relations_and_labour_laws.new_labour_codes.industrial_relations_code_2020', 'industrial_relations_and_labour_laws.new_labour_codes.occupational_safety_health_working_conditions_code_2020']::text[], ARRAY['industrial_relations_and_labour_laws']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['THE FOUR NEW LABOUR CODES']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.accounting_framework_and_concepts', 'accounting_framework_and_concepts', 'Accounting Framework, Concepts & Standards', 2,
        'Domain', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles',
        ARRAY['general_accounting_principles.accounting_framework_and_concepts.nature_scope_and_objectives_of_accounting', 'general_accounting_principles.accounting_framework_and_concepts.accounting_concepts_principles_and_conventions', 'general_accounting_principles.accounting_framework_and_concepts.accounting_standards_and_ind_as']::text[], ARRAY['general_accounting_principles']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['ACCOUNTING FRAMEWORK, CONCEPTS & STANDARDS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.accounting_process_and_books', 'accounting_process_and_books', 'Accounting Process, Books of Accounts & Trial Balance', 2,
        'Domain', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles',
        ARRAY['general_accounting_principles.accounting_process_and_books.double_entry_system_and_journal', 'general_accounting_principles.accounting_process_and_books.ledger_posting_and_subdivision_of_journal', 'general_accounting_principles.accounting_process_and_books.bank_reconciliation_statement', 'general_accounting_principles.accounting_process_and_books.trial_balance_and_rectification_of_errors']::text[], ARRAY['general_accounting_principles']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['ACCOUNTING PROCESS, BOOKS OF ACCOUNTS & TRIAL BALANCE']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.financial_statements_and_adjustments', 'financial_statements_and_adjustments', 'Financial Statements, Depreciation & Adjustments', 2,
        'Domain', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles',
        ARRAY['general_accounting_principles.financial_statements_and_adjustments.capital_and_revenue_expenditure_and_receipts', 'general_accounting_principles.financial_statements_and_adjustments.depreciation_provisions_and_reserves', 'general_accounting_principles.financial_statements_and_adjustments.inventory_valuation', 'general_accounting_principles.financial_statements_and_adjustments.preparation_of_final_accounts']::text[], ARRAY['general_accounting_principles']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['FINANCIAL STATEMENTS, DEPRECIATION & ADJUSTMENTS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.special_and_advanced_accounts', 'special_and_advanced_accounts', 'Special & Advanced Accounting Topics', 2,
        'Domain', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles',
        ARRAY['general_accounting_principles.special_and_advanced_accounts.bills_of_exchange', 'general_accounting_principles.special_and_advanced_accounts.consignment_and_joint_ventures', 'general_accounting_principles.special_and_advanced_accounts.partnership_accounts', 'general_accounting_principles.special_and_advanced_accounts.company_accounts_and_share_capital']::text[], ARRAY['general_accounting_principles']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['SPECIAL & ADVANCED ACCOUNTING TOPICS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing.fundamentals_and_audit_planning', 'fundamentals_and_audit_planning', 'Audit Fundamentals, Internal Control & Planning', 2,
        'Domain', 'AUDITING', 'auditing', 'auditing',
        ARRAY['auditing.fundamentals_and_audit_planning.nature_objective_and_types_of_audit', 'auditing.fundamentals_and_audit_planning.audit_program_evidence_and_working_papers', 'auditing.fundamentals_and_audit_planning.internal_control_internal_check_and_internal_audit']::text[], ARRAY['auditing']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['AUDIT FUNDAMENTALS, INTERNAL CONTROL & PLANNING']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing.vouching_verification_and_company_audit', 'vouching_verification_and_company_audit', 'Vouching, Verification & Company Audit', 2,
        'Domain', 'AUDITING', 'auditing', 'auditing',
        ARRAY['auditing.vouching_verification_and_company_audit.vouching_of_cash_and_trading_transactions', 'auditing.vouching_verification_and_company_audit.verification_and_valuation_of_assets_and_liabilities', 'auditing.vouching_verification_and_company_audit.company_audit_under_companies_act_2013', 'auditing.vouching_verification_and_company_audit.audit_report_and_government_audit']::text[], ARRAY['auditing']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['VOUCHING, VERIFICATION & COMPANY AUDIT']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance.principles_and_fundamentals_of_insurance', 'principles_and_fundamentals_of_insurance', 'Principles & Fundamentals of Insurance', 2,
        'Domain', 'INSURANCE', 'insurance', 'insurance',
        ARRAY['insurance.principles_and_fundamentals_of_insurance.concept_history_and_functions_of_insurance', 'insurance.principles_and_fundamentals_of_insurance.fundamental_legal_principles_of_insurance']::text[], ARRAY['insurance']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['PRINCIPLES & FUNDAMENTALS OF INSURANCE']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance.life_general_and_health_insurance', 'life_general_and_health_insurance', 'Life, General & Health Insurance Products', 2,
        'Domain', 'INSURANCE', 'insurance', 'insurance',
        ARRAY['insurance.life_general_and_health_insurance.life_insurance_products_and_underwriting', 'insurance.life_general_and_health_insurance.general_and_health_insurance']::text[], ARRAY['insurance']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['LIFE, GENERAL & HEALTH INSURANCE PRODUCTS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance.regulatory_framework_and_government_schemes', 'regulatory_framework_and_government_schemes', 'Insurance Regulatory Framework & Government Schemes', 2,
        'Domain', 'INSURANCE', 'insurance', 'insurance',
        ARRAY['insurance.regulatory_framework_and_government_schemes.irdai_powers_and_regulations', 'insurance.regulatory_framework_and_government_schemes.government_social_insurance_schemes']::text[], ARRAY['insurance']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['INSURANCE REGULATORY FRAMEWORK & GOVERNMENT SCHEMES']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.concept_and_constitutional_framework', 'concept_and_constitutional_framework', 'Concept, Philosophy & Constitutional Framework', 2,
        'Domain', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india',
        ARRAY['social_security_in_india.concept_and_constitutional_framework.concept_dimensions_and_evolution_of_social_security', 'social_security_in_india.concept_and_constitutional_framework.constitutional_and_institutional_provisions']::text[], ARRAY['social_security_in_india']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['CONCEPT, PHILOSOPHY & CONSTITUTIONAL FRAMEWORK']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.statutory_social_security_framework', 'statutory_social_security_framework', 'Statutory Social Security Schemes & Acts', 2,
        'Domain', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india',
        ARRAY['social_security_in_india.statutory_social_security_framework.employees_provident_funds_act_1952', 'social_security_in_india.statutory_social_security_framework.employees_state_insurance_act_1948', 'social_security_in_india.statutory_social_security_framework.payment_of_gratuity_act_1972', 'social_security_in_india.statutory_social_security_framework.maternity_benefit_act_1961', 'social_security_in_india.statutory_social_security_framework.employees_compensation_act_1923', 'social_security_in_india.statutory_social_security_framework.unorganized_workers_social_security_act_2008']::text[], ARRAY['social_security_in_india']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['STATUTORY SOCIAL SECURITY SCHEMES & ACTS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.code_on_social_security_2020', 'code_on_social_security_2020', 'Code on Social Security 2020 & Social Welfare Schemes', 2,
        'Domain', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india',
        ARRAY['social_security_in_india.code_on_social_security_2020.code_on_social_security_2020_provisions', 'social_security_in_india.code_on_social_security_2020.national_pension_and_social_welfare_schemes']::text[], ARRAY['social_security_in_india']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['CODE ON SOCIAL SECURITY 2020 & SOCIAL WELFARE SCHEMES']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'applied_statistics.data_collection_and_central_tendency', 'data_collection_and_central_tendency', 'Data Collection, Presentation & Measures of Central Tendency', 2,
        'Domain', 'APPLIED_STATISTICS', 'applied_statistics', 'applied_statistics',
        ARRAY['applied_statistics.data_collection_and_central_tendency.collection_and_presentation_of_data', 'applied_statistics.data_collection_and_central_tendency.measures_of_central_tendency']::text[], ARRAY['applied_statistics']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['DATA COLLECTION, PRESENTATION & MEASURES OF CENTRAL TENDENCY']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'applied_statistics.dispersion_correlation_and_probability', 'dispersion_correlation_and_probability', 'Dispersion, Correlation, Index Numbers & Probability', 2,
        'Domain', 'APPLIED_STATISTICS', 'applied_statistics', 'applied_statistics',
        ARRAY['applied_statistics.dispersion_correlation_and_probability.measures_of_dispersion_and_skewness', 'applied_statistics.dispersion_correlation_and_probability.correlation_and_regression', 'applied_statistics.dispersion_correlation_and_probability.index_numbers', 'applied_statistics.dispersion_correlation_and_probability.elementary_probability']::text[], ARRAY['applied_statistics']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['DISPERSION, CORRELATION, INDEX NUMBERS & PROBABILITY']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.industrial_relations.theories_and_approaches_of_industrial_relations', 'theories_and_approaches_of_industrial_relations', 'Theories and Approaches of Industrial Relations', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Unitary', 'Pluralist', 'Marxist', 'Dunlop Systems Approach', 'Human Relations', 'Psychological Approach']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.industrial_relations.trade_unions_and_collective_bargaining', 'trade_unions_and_collective_bargaining', 'Trade Unions & Collective Bargaining', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Trade Union Movement in India', 'Registration', 'Recognition', 'Collective Bargaining Process', 'Levels of Bargaining', 'AITUC', 'INTUC', 'BMS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.industrial_relations.industrial_disputes_and_adjudication', 'industrial_disputes_and_adjudication', 'Industrial Disputes, Settlement & Adjudication Machinery', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Strikes', 'Lockouts', 'Lay-off', 'Retrenchment', 'Closure', 'Works Committee', 'Conciliation', 'Board of Conciliation', 'Labour Court', 'Industrial Tribunal', 'National Tribunal', 'Arbitration']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.industrial_relations.workers_participation_in_management', 'workers_participation_in_management', 'Workers'' Participation in Management (WPM)', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Article 43A', 'Joint Management Councils', 'Shop Councils', 'Plant Councils', 'Board-level Participation', 'Quality Circles']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.industrial_relations.tripartism_and_ilo', 'tripartism_and_ilo', 'Tripartism, Indian Labour Conference & ILO Conventions', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.industrial_relations']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Tripartite Bodies', 'Indian Labour Conference', 'Standing Labour Committee', 'ILO Conventions', 'Declaration on Fundamental Principles and Rights at Work']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.trade_unions_act_1926', 'trade_unions_act_1926', 'The Trade Unions Act, 1926', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Registration of Trade Unions', 'Minimum Membership', 'Rights and Liabilities', 'Civil Immunity', 'Criminal Conspiracy Protection', 'General Fund', 'Political Fund']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.industrial_disputes_act_1947', 'industrial_disputes_act_1947', 'The Industrial Disputes Act, 1947', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Definition of Workman', 'Public Utility Services', 'Notice of Strike', 'Illegal Strikes and Lockouts', 'Lay-off Compensation', 'Retrenchment Conditions', 'Chapter V-B', 'Unfair Labour Practices']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.factories_act_1948', 'factories_act_1948', 'The Factories Act, 1948', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Definition of Factory', 'Manufacturing Process', 'Health Provisions', 'Safety Provisions', 'Welfare Provisions', 'Working Hours for Adults', 'Overtime Wages', 'Annual Leave with Wages', 'Adolescent Worker', 'Employment of Women and Young Persons']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.wages_legislation_acts', 'wages_legislation_acts', 'Wages Legislation (Minimum Wages Act 1948 & Payment of Wages Act 1936)', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Minimum Rates of Wages', 'Scheduled Employment', 'Advisory Board', 'Deductions from Wages', 'Wage Period', 'Mode of Payment', 'Time of Payment', 'Payment of Bonus Act 1965']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.contract_and_migrant_labour_acts', 'contract_and_migrant_labour_acts', 'Contract Labour Act 1970 & Inter-State Migrant Workmen Act 1979', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Contract Labour Regulation and Abolition Act 1970', 'Principal Employer Liability', 'Licensing of Contractors', 'Inter-State Migrant Workmen Act 1979', 'Displacement Allowance', 'Journey Allowance']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts.special_category_labour_acts', 'special_category_labour_acts', 'Child Labour, Mines Act & Specific Sector Labour Acts', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.labour_legislation_and_historic_acts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Child and Adolescent Labour Prohibition Act 1986', 'Hazardous Occupations', 'Mines Act 1952', 'Plantations Labour Act 1951', 'BOCW Act 1996']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.new_labour_codes.code_on_wages_2019', 'code_on_wages_2019', 'The Code on Wages, 2019', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.new_labour_codes',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.new_labour_codes']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Universal Minimum Wage', 'National Floor Level Minimum Wage', 'Uniform Definition of Wages', 'Gender Equality in Remuneration', 'Amalgamation of 4 Wage Acts']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.new_labour_codes.industrial_relations_code_2020', 'industrial_relations_code_2020', 'The Industrial Relations Code, 2020', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.new_labour_codes',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.new_labour_codes']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Standing Orders Threshold', 'Mandatory 14 Days Strike Notice', 'Sole Negotiating Union', 'Negotiating Council', 'Fixed Term Employment', 'Worker Reskilling Fund']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'industrial_relations_and_labour_laws.new_labour_codes.occupational_safety_health_working_conditions_code_2020', 'occupational_safety_health_working_conditions_code_2020', 'OSH & Working Conditions Code, 2020', 3,
        'Topic', 'INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS', 'industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.new_labour_codes',
        ARRAY[]::text[], ARRAY['industrial_relations_and_labour_laws', 'industrial_relations_and_labour_laws.new_labour_codes']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['National OSH Board', 'Duties of Employer', 'Annual Health Check-up', 'Women Working at Night', 'Inter-State Migrant Worker Welfare']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.accounting_framework_and_concepts.nature_scope_and_objectives_of_accounting', 'nature_scope_and_objectives_of_accounting', 'Nature, Scope and Objectives of Accounting', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.accounting_framework_and_concepts',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.accounting_framework_and_concepts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Book-keeping vs Accounting', 'Financial Accounting', 'Cost Accounting', 'Management Accounting', 'Users of Accounting Information', 'Qualitative Characteristics']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.accounting_framework_and_concepts.accounting_concepts_principles_and_conventions', 'accounting_concepts_principles_and_conventions', 'Accounting Concepts, Principles & Conventions (GAAP)', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.accounting_framework_and_concepts',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.accounting_framework_and_concepts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Business Entity Concept', 'Going Concern', 'Money Measurement', 'Accounting Period', 'Dual Aspect', 'Accrual Basis', 'Matching Principle', 'Realisation / Revenue Recognition', 'Prudence / Conservatism', 'Materiality', 'Consistency', 'Historical Cost']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.accounting_framework_and_concepts.accounting_standards_and_ind_as', 'accounting_standards_and_ind_as', 'Accounting Standards & Ind AS Framework', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.accounting_framework_and_concepts',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.accounting_framework_and_concepts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Accounting Standards Board', 'ICAI', 'Convergence with IFRS', 'Ind AS', 'AS 1 Disclosure of Accounting Policies', 'AS 2 Valuation of Inventories', 'AS 3 Cash Flow Statements', 'AS 9 Revenue Recognition', 'AS 10 Property Plant Equipment']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.accounting_process_and_books.double_entry_system_and_journal', 'double_entry_system_and_journal', 'Double Entry System & Recording Transactions (Journal)', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.accounting_process_and_books',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.accounting_process_and_books']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Rules of Debit and Credit', 'Personal Accounts', 'Real Accounts', 'Nominal Accounts', 'Compound Journal Entries', 'Source Documents', 'Vouchers']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.accounting_process_and_books.ledger_posting_and_subdivision_of_journal', 'ledger_posting_and_subdivision_of_journal', 'Ledger Accounts, Subsidiary Books & Cash Book', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.accounting_process_and_books',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.accounting_process_and_books']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Posting to Ledger', 'Balancing of Accounts', 'Purchase Day Book', 'Sales Day Book', 'Returns Inward and Outward', 'Single Column Cash Book', 'Two Column Cash Book', 'Three Column Cash Book', 'Petty Cash Book', 'Imprest System']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.accounting_process_and_books.bank_reconciliation_statement', 'bank_reconciliation_statement', 'Bank Reconciliation Statement (BRS)', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.accounting_process_and_books',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.accounting_process_and_books']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Causes of Difference', 'Cheques Issued but Not Presented', 'Cheques Deposited but Not Cleared', 'Direct Debits and Credits by Bank', 'Amended Cash Book', 'Bank Overdraft BRS']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.accounting_process_and_books.trial_balance_and_rectification_of_errors', 'trial_balance_and_rectification_of_errors', 'Trial Balance & Rectification of Errors', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.accounting_process_and_books',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.accounting_process_and_books']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Objectives of Trial Balance', 'Errors Disclosed by Trial Balance', 'Errors Not Disclosed', 'Errors of Omission', 'Errors of Commission', 'Errors of Principle', 'Compensating Errors', 'Suspense Account', 'Rectification Entries']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.financial_statements_and_adjustments.capital_and_revenue_expenditure_and_receipts', 'capital_and_revenue_expenditure_and_receipts', 'Capital vs Revenue Expenditure & Receipts', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.financial_statements_and_adjustments',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.financial_statements_and_adjustments']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Capital Expenditure', 'Revenue Expenditure', 'Deferred Revenue Expenditure', 'Capital Receipts', 'Revenue Receipts', 'Capital Loss vs Revenue Loss']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.financial_statements_and_adjustments.depreciation_provisions_and_reserves', 'depreciation_provisions_and_reserves', 'Depreciation Accounting, Provisions & Reserves', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.financial_statements_and_adjustments',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.financial_statements_and_adjustments']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Straight Line Method (SLM)', 'Written Down Value (WDV)', 'Annuity Method', 'Sinking Fund', 'Provision vs Reserve', 'General Reserve', 'Capital Reserve', 'Secret Reserve', 'Provision for Doubtful Debts', 'Provision for Discount on Debtors']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.financial_statements_and_adjustments.inventory_valuation', 'inventory_valuation', 'Valuation of Inventories', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.financial_statements_and_adjustments',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.financial_statements_and_adjustments']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Cost or Net Realisable Value (NRV)', 'FIFO Method', 'LIFO Method', 'Weighted Average Price', 'Simple Average', 'Perpetual vs Periodic Inventory System']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.financial_statements_and_adjustments.preparation_of_final_accounts', 'preparation_of_final_accounts', 'Trading, Profit & Loss Account and Balance Sheet', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.financial_statements_and_adjustments',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.financial_statements_and_adjustments']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Gross Profit', 'Net Profit', 'Operating Profit', 'Balance Sheet Classification', 'Current Assets', 'Non-Current Assets', 'Current Liabilities', 'Working Capital', 'Adjustments: Closing Stock, Outstanding Expenses, Prepaid Expenses, Accrued Income']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.special_and_advanced_accounts.bills_of_exchange', 'bills_of_exchange', 'Bills of Exchange & Promissory Notes', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.special_and_advanced_accounts',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.special_and_advanced_accounts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Drawer', 'Drawee', 'Payee', 'Maturity Date', 'Days of Grace', 'Discounting of Bill', 'Endorsement', 'Dishonour of Bill', 'Noting Charges', 'Renewal of Bill', 'Accommodation Bill']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.special_and_advanced_accounts.consignment_and_joint_ventures', 'consignment_and_joint_ventures', 'Consignment Accounts & Joint Ventures', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.special_and_advanced_accounts',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.special_and_advanced_accounts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Consignor', 'Consignee', 'Proforma Invoice', 'Account Sales', 'Del Credere Commission', 'Normal Loss', 'Abnormal Loss', 'Joint Venture Accounts']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.special_and_advanced_accounts.partnership_accounts', 'partnership_accounts', 'Partnership Accounts', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.special_and_advanced_accounts',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.special_and_advanced_accounts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Partnership Deed', 'Profit Sharing Ratio', 'Valuation of Goodwill', 'Admission of Partner', 'Retirement and Death of Partner', 'Dissolution of Firm']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'general_accounting_principles.special_and_advanced_accounts.company_accounts_and_share_capital', 'company_accounts_and_share_capital', 'Company Accounts & Share Capital', 3,
        'Topic', 'GENERAL_ACCOUNTING_PRINCIPLES', 'general_accounting_principles', 'general_accounting_principles.special_and_advanced_accounts',
        ARRAY[]::text[], ARRAY['general_accounting_principles', 'general_accounting_principles.special_and_advanced_accounts']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Issue of Shares at Par, Premium, Discount', 'Calls in Arrears', 'Calls in Advance', 'Forfeiture of Shares', 'Reissue of Forfeited Shares', 'Capital Redemption Reserve', 'Issue of Debentures']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing.fundamentals_and_audit_planning.nature_objective_and_types_of_audit', 'nature_objective_and_types_of_audit', 'Nature, Scope and Types of Audit', 3,
        'Topic', 'AUDITING', 'auditing', 'auditing.fundamentals_and_audit_planning',
        ARRAY[]::text[], ARRAY['auditing', 'auditing.fundamentals_and_audit_planning']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['True and Fair View', 'Detection of Frauds and Errors', 'Continuous Audit', 'Interim Audit', 'Final Audit', 'Balance Sheet Audit', 'Management Audit', 'Cost Audit', 'Tax Audit']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing.fundamentals_and_audit_planning.audit_program_evidence_and_working_papers', 'audit_program_evidence_and_working_papers', 'Audit Program, Evidence & Working Papers', 3,
        'Topic', 'AUDITING', 'auditing', 'auditing.fundamentals_and_audit_planning',
        ARRAY[]::text[], ARRAY['auditing', 'auditing.fundamentals_and_audit_planning']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Audit Notebook', 'Audit Working Papers', 'Ownership of Working Papers', 'Sufficient Appropriate Audit Evidence', 'Physical Verification', 'Inquiry and Confirmation']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing.fundamentals_and_audit_planning.internal_control_internal_check_and_internal_audit', 'internal_control_internal_check_and_internal_audit', 'Internal Control, Internal Check & Internal Audit', 3,
        'Topic', 'AUDITING', 'auditing', 'auditing.fundamentals_and_audit_planning',
        ARRAY[]::text[], ARRAY['auditing', 'auditing.fundamentals_and_audit_planning']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Internal Check System', 'Division of Duties', 'Internal Audit vs External Audit', 'Statutory Internal Audit Section 138', 'Test Checking', 'Audit Sampling']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing.vouching_verification_and_company_audit.vouching_of_cash_and_trading_transactions', 'vouching_of_cash_and_trading_transactions', 'Vouching of Transactions', 3,
        'Topic', 'AUDITING', 'auditing', 'auditing.vouching_verification_and_company_audit',
        ARRAY[]::text[], ARRAY['auditing', 'auditing.vouching_verification_and_company_audit']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Vouching as Backbone of Auditing', 'Cash Receipts', 'Cash Payments', 'Credit Purchases', 'Credit Sales', 'Teeming and Lading', 'Window Dressing']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing.vouching_verification_and_company_audit.verification_and_valuation_of_assets_and_liabilities', 'verification_and_valuation_of_assets_and_liabilities', 'Verification & Valuation of Assets & Liabilities', 3,
        'Topic', 'AUDITING', 'auditing', 'auditing.vouching_verification_and_company_audit',
        ARRAY[]::text[], ARRAY['auditing', 'auditing.vouching_verification_and_company_audit']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Verification vs Valuation', 'Fixed Assets', 'Current Assets', 'Cash in Hand', 'Stock in Trade', 'Contingent Liabilities', 'Auditor''s Duty Regarding Valuation']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing.vouching_verification_and_company_audit.company_audit_under_companies_act_2013', 'company_audit_under_companies_act_2013', 'Company Audit under Companies Act, 2013', 3,
        'Topic', 'AUDITING', 'auditing', 'auditing.vouching_verification_and_company_audit',
        ARRAY[]::text[], ARRAY['auditing', 'auditing.vouching_verification_and_company_audit']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Appointment of Auditor Section 139', 'Rotation of Auditors', 'Disqualifications of Auditor Section 141', 'Rights and Duties Section 143', 'Reporting on Frauds', 'Removal and Resignation', 'CARO (Companies Auditor''s Report Order)']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'auditing.vouching_verification_and_company_audit.audit_report_and_government_audit', 'audit_report_and_government_audit', 'Audit Report & Government / EPFO Audit', 3,
        'Topic', 'AUDITING', 'auditing', 'auditing.vouching_verification_and_company_audit',
        ARRAY[]::text[], ARRAY['auditing', 'auditing.vouching_verification_and_company_audit']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Unqualified / Clean Opinion', 'Qualified Opinion', 'Adverse Opinion', 'Disclaimer of Opinion', 'CAG Audit of Government Undertakings', 'Social Audit', 'EPFO Statutory Audit']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance.principles_and_fundamentals_of_insurance.concept_history_and_functions_of_insurance', 'concept_history_and_functions_of_insurance', 'Concept, History & Economic Role of Insurance', 3,
        'Topic', 'INSURANCE', 'insurance', 'insurance.principles_and_fundamentals_of_insurance',
        ARRAY[]::text[], ARRAY['insurance', 'insurance.principles_and_fundamentals_of_insurance']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Risk Pooling', 'Transfer of Risk', 'Insurable Risk', 'Moral Hazard', 'Morale Hazard', 'Peril', 'History of Life & General Insurance in India', 'Nationalisation of LIC and GIC']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance.principles_and_fundamentals_of_insurance.fundamental_legal_principles_of_insurance', 'fundamental_legal_principles_of_insurance', 'Fundamental Legal Principles of Insurance', 3,
        'Topic', 'INSURANCE', 'insurance', 'insurance.principles_and_fundamentals_of_insurance',
        ARRAY[]::text[], ARRAY['insurance', 'insurance.principles_and_fundamentals_of_insurance']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Principle of Utmost Good Faith (Uberrimae Fidei)', 'Insurable Interest', 'Principle of Indemnity', 'Subrogation', 'Contribution', 'Proximate Cause (Causa Proxima)', 'Mitigation of Loss', 'Warranties and Conditions']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance.life_general_and_health_insurance.life_insurance_products_and_underwriting', 'life_insurance_products_and_underwriting', 'Life Insurance Products & Actuarial Basics', 3,
        'Topic', 'INSURANCE', 'insurance', 'insurance.life_general_and_health_insurance',
        ARRAY[]::text[], ARRAY['insurance', 'insurance.life_general_and_health_insurance']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Term Life Insurance', 'Whole Life Policy', 'Endowment Assurance', 'Money Back Policy', 'Unit Linked Insurance Plans (ULIP)', 'Annuity and Pension Plans', 'Surrender Value', 'Paid-up Value', 'Mortality Tables', 'Medical & Non-Medical Underwriting']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance.life_general_and_health_insurance.general_and_health_insurance', 'general_and_health_insurance', 'General, Property & Health Insurance', 3,
        'Topic', 'INSURANCE', 'insurance', 'insurance.life_general_and_health_insurance',
        ARRAY[]::text[], ARRAY['insurance', 'insurance.life_general_and_health_insurance']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Fire Insurance', 'Marine Insurance', 'Perils of the Sea', 'General Average vs Particular Average', 'Motor Vehicles Insurance', 'Third Party Liability', 'Comprehensive Policy', 'Health Insurance', 'Mediclaim', 'Cashless Hospitalisation', 'Co-payment and Deductibles']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance.regulatory_framework_and_government_schemes.irdai_powers_and_regulations', 'irdai_powers_and_regulations', 'IRDAI Structure, Powers & Functions', 3,
        'Topic', 'INSURANCE', 'insurance', 'insurance.regulatory_framework_and_government_schemes',
        ARRAY[]::text[], ARRAY['insurance', 'insurance.regulatory_framework_and_government_schemes']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['IRDAI Act 1999', 'Malhotra Committee Recommendations', 'Protection of Policyholders'' Interests', 'Solvency Margin', 'Ombudsman Scheme', 'Foreign Direct Investment in Insurance']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'insurance.regulatory_framework_and_government_schemes.government_social_insurance_schemes', 'government_social_insurance_schemes', 'National Social & Micro-Insurance Schemes', 3,
        'Topic', 'INSURANCE', 'insurance', 'insurance.regulatory_framework_and_government_schemes',
        ARRAY[]::text[], ARRAY['insurance', 'insurance.regulatory_framework_and_government_schemes']::text[], '{"epfo": ["APFC", "EO/AO"]}'::jsonb,
        '[EPFO: APFC, EO/AO]', '', ARRAY[]::text[], ARRAY['Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY)', 'Pradhan Mantri Suraksha Bima Yojana (PMSBY)', 'Pradhan Mantri Fasal Bima Yojana (PMFBY)', 'Ayushman Bharat PM-JAY', 'Aam Aadmi Bima Yojana']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.concept_and_constitutional_framework.concept_dimensions_and_evolution_of_social_security', 'concept_dimensions_and_evolution_of_social_security', 'Concept, Evolution & Dimensions of Social Security', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.concept_and_constitutional_framework',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.concept_and_constitutional_framework']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Social Assistance vs Social Insurance', 'Beveridge Report', 'ILO Social Security (Minimum Standards) Convention 102', 'Nine Classical Contingencies', 'History of Social Security in India']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.concept_and_constitutional_framework.constitutional_and_institutional_provisions', 'constitutional_and_institutional_provisions', 'Constitutional Mandate & Institutional Framework', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.concept_and_constitutional_framework',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.concept_and_constitutional_framework']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Article 39', 'Article 41 Right to Work and Education and Public Assistance', 'Article 42 Just and Humane Conditions of Work and Maternity Relief', 'Article 43 Living Wage for Workers', 'Ministry of Labour and Employment', 'National Commission on Labour Recommendations']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.statutory_social_security_framework.employees_provident_funds_act_1952', 'employees_provident_funds_act_1952', 'The EPF & Miscellaneous Provisions Act, 1952', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.statutory_social_security_framework',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.statutory_social_security_framework']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Applicability Threshold 20 Employees', 'Central Board of Trustees (CBT)', 'Employees'' Provident Funds Scheme 1952', 'Employees'' Pension Scheme (EPS) 1995', 'Employees'' Deposit-Linked Insurance (EDLI) Scheme 1976', 'Wage Ceiling', 'Contribution Rates 12%', 'Universal Account Number (UAN)', 'Recovery of Arrears Section 7A']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.statutory_social_security_framework.employees_state_insurance_act_1948', 'employees_state_insurance_act_1948', 'The Employees'' State Insurance Act, 1948', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.statutory_social_security_framework',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.statutory_social_security_framework']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['ESIC Governance', 'Wage Limit for Coverage', 'Contribution Rates (3.25% Employer, 0.75% Employee)', 'Sickness Benefit', 'Maternity Benefit', 'Disablement Benefit', 'Dependants'' Benefit', 'Medical Benefit', 'Funeral Expenses']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.statutory_social_security_framework.payment_of_gratuity_act_1972', 'payment_of_gratuity_act_1972', 'The Payment of Gratuity Act, 1972', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.statutory_social_security_framework',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.statutory_social_security_framework']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Applicability Threshold 10 Employees', 'Continuous Service 5 Years Requirement', 'Calculation Formula (15 days wages per year of service)', 'Ceiling Limit on Gratuity (Rs 20 Lakhs)', 'Forfeiture Conditions']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.statutory_social_security_framework.maternity_benefit_act_1961', 'maternity_benefit_act_1961', 'The Maternity Benefit Act, 1961 & 2017 Amendment', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.statutory_social_security_framework',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.statutory_social_security_framework']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Paid Leave 26 Weeks', 'Applicability', 'Creche Facility Threshold 50 Employees', 'Work from Home Provisions', 'Nursing Breaks', 'Medical Bonus']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.statutory_social_security_framework.employees_compensation_act_1923', 'employees_compensation_act_1923', 'The Employees'' Compensation Act, 1923', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.statutory_social_security_framework',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.statutory_social_security_framework']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Employer Liability', 'Accident Arising Out of and in the Course of Employment', 'Doctrine of Notional Extension', 'Occupational Diseases Schedule III', 'Calculation of Compensation for Death and Permanent Total Disablement']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.statutory_social_security_framework.unorganized_workers_social_security_act_2008', 'unorganized_workers_social_security_act_2008', 'Unorganised Workers'' Social Security Framework', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.statutory_social_security_framework',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.statutory_social_security_framework']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Unorganised Workers'' Social Security Act 2008', 'National Social Security Board', 'State Social Security Boards', 'e-Shram Portal', 'Universal Social Security for Informal Sector']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.code_on_social_security_2020.code_on_social_security_2020_provisions', 'code_on_social_security_2020_provisions', 'The Code on Social Security, 2020', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.code_on_social_security_2020',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.code_on_social_security_2020']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Amalgamation of 9 Social Security Acts', 'Definition of Gig Worker', 'Platform Worker', 'Aggregator Obligations', 'National Social Security Board for Gig and Platform Workers', 'Social Security Fund', 'Fixed Term Employees Gratuity on Pro-rata Basis']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'social_security_in_india.code_on_social_security_2020.national_pension_and_social_welfare_schemes', 'national_pension_and_social_welfare_schemes', 'National Pension, Welfare Schemes & International SSAs', 3,
        'Topic', 'SOCIAL_SECURITY_IN_INDIA', 'social_security_in_india', 'social_security_in_india.code_on_social_security_2020',
        ARRAY[]::text[], ARRAY['social_security_in_india', 'social_security_in_india.code_on_social_security_2020']::text[], '{"epfo": ["EO/AO", "APFC"]}'::jsonb,
        '[EPFO: EO/AO, APFC]', '', ARRAY[]::text[], ARRAY['Pradhan Mantri Shram Yogi Maan-dhan (PM-SYM)', 'Atal Pension Yojana (APY)', 'National Pension System (NPS)', 'PFRDA', 'PM Kisan Maan-Dhan Yojana', 'Social Security Agreements (SSA) with Foreign Countries', 'Certificate of Coverage (CoC)', 'Exportability of Pensions']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'applied_statistics.data_collection_and_central_tendency.collection_and_presentation_of_data', 'collection_and_presentation_of_data', 'Collection, Classification & Tabulation of Data', 3,
        'Topic', 'APPLIED_STATISTICS', 'applied_statistics', 'applied_statistics.data_collection_and_central_tendency',
        ARRAY[]::text[], ARRAY['applied_statistics', 'applied_statistics.data_collection_and_central_tendency']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Primary vs Secondary Data', 'Sampling Methods', 'Random Sampling', 'Stratified Sampling', 'Frequency Distribution', 'Histogram', 'Frequency Polygon', 'Ogive', 'Pie Chart']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'applied_statistics.data_collection_and_central_tendency.measures_of_central_tendency', 'measures_of_central_tendency', 'Measures of Central Tendency', 3,
        'Topic', 'APPLIED_STATISTICS', 'applied_statistics', 'applied_statistics.data_collection_and_central_tendency',
        ARRAY[]::text[], ARRAY['applied_statistics', 'applied_statistics.data_collection_and_central_tendency']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Arithmetic Mean', 'Weighted Mean', 'Properties of Arithmetic Mean', 'Median', 'Mode', 'Empirical Relationship (Mode = 3 Median - 2 Mean)', 'Geometric Mean', 'Harmonic Mean', 'Choice of Average']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'applied_statistics.dispersion_correlation_and_probability.measures_of_dispersion_and_skewness', 'measures_of_dispersion_and_skewness', 'Measures of Dispersion & Skewness', 3,
        'Topic', 'APPLIED_STATISTICS', 'applied_statistics', 'applied_statistics.dispersion_correlation_and_probability',
        ARRAY[]::text[], ARRAY['applied_statistics', 'applied_statistics.dispersion_correlation_and_probability']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Range', 'Quartile Deviation', 'Mean Deviation', 'Standard Deviation', 'Variance', 'Coefficient of Variation', 'Karl Pearson''s Coefficient of Skewness', 'Kurtosis']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'applied_statistics.dispersion_correlation_and_probability.correlation_and_regression', 'correlation_and_regression', 'Correlation & Regression Analysis', 3,
        'Topic', 'APPLIED_STATISTICS', 'applied_statistics', 'applied_statistics.dispersion_correlation_and_probability',
        ARRAY[]::text[], ARRAY['applied_statistics', 'applied_statistics.dispersion_correlation_and_probability']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Scatter Diagram', 'Karl Pearson''s Coefficient of Correlation', 'Properties of Correlation Coefficient', 'Spearman''s Rank Correlation', 'Regression Lines', 'Regression Coefficients']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'applied_statistics.dispersion_correlation_and_probability.index_numbers', 'index_numbers', 'Index Numbers & Time Series Basics', 3,
        'Topic', 'APPLIED_STATISTICS', 'applied_statistics', 'applied_statistics.dispersion_correlation_and_probability',
        ARRAY[]::text[], ARRAY['applied_statistics', 'applied_statistics.dispersion_correlation_and_probability']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Base Year', 'Laspeyres Index', 'Paasche Index', 'Fisher''s Ideal Index', 'Time Reversal Test', 'Factor Reversal Test', 'Consumer Price Index (CPI)', 'Wholesale Price Index (WPI)']::text[],
        'epfo', ARRAY['epfo']::text[]
    ),
    (
        'applied_statistics.dispersion_correlation_and_probability.elementary_probability', 'elementary_probability', 'Elementary Probability', 3,
        'Topic', 'APPLIED_STATISTICS', 'applied_statistics', 'applied_statistics.dispersion_correlation_and_probability',
        ARRAY[]::text[], ARRAY['applied_statistics', 'applied_statistics.dispersion_correlation_and_probability']::text[], '{"epfo": ["APFC"]}'::jsonb,
        '[EPFO: APFC]', '', ARRAY[]::text[], ARRAY['Random Experiment', 'Sample Space', 'Mutually Exclusive Events', 'Addition Theorem of Probability', 'Multiplication Theorem', 'Conditional Probability', 'Independent Events']::text[],
        'epfo', ARRAY['epfo']::text[]
    )
ON CONFLICT (id) DO UPDATE SET
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
    keywords = EXCLUDED.keywords,
    stream = EXCLUDED.stream,
    streams = EXCLUDED.streams;

COMMIT;
