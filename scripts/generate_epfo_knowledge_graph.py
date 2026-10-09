# -*- coding: utf-8 -*-
"""
Generates src/data/knowledge_graph_epfo.json:
Dedicated Knowledge Graph for UPSC EPFO (EO/AO & APFC) specialized pillars:
1. Industrial Relations & Labour Laws (6 L2 domains, 14 L3 topics)
2. General Accounting Principles (4 L2 domains, 15 L3 topics)
3. Auditing (2 L2 domains, 7 L3 topics)
4. Insurance (3 L2 domains, 7 L3 topics)
5. Social Security in India (3 L2 domains, 10 L3 topics)
6. Applied Statistics (2 L2 domains, 6 L3 topics)

Follows the KnowledgeGraphData / KnowledgeNode schema exactly.
"""

import json
import os

def build_epfo_knowledge_graph():
    subjects_def = [
        {
            "id": "industrial_relations_and_labour_laws",
            "name": "Industrial Relations & Labour Laws",
            "subject": "INDUSTRIAL_RELATIONS_AND_LABOUR_LAWS",
            "domains": [
                {
                    "id": "industrial_relations",
                    "name": "Industrial Relations & Trade Unionism",
                    "topics": [
                        {
                            "id": "theories_and_approaches_of_industrial_relations",
                            "name": "Theories and Approaches of Industrial Relations",
                            "keywords": ["Unitary", "Pluralist", "Marxist", "Dunlop Systems Approach", "Human Relations", "Psychological Approach"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "trade_unions_and_collective_bargaining",
                            "name": "Trade Unions & Collective Bargaining",
                            "keywords": ["Trade Union Movement in India", "Registration", "Recognition", "Collective Bargaining Process", "Levels of Bargaining", "AITUC", "INTUC", "BMS"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "industrial_disputes_and_adjudication",
                            "name": "Industrial Disputes, Settlement & Adjudication Machinery",
                            "keywords": ["Strikes", "Lockouts", "Lay-off", "Retrenchment", "Closure", "Works Committee", "Conciliation", "Board of Conciliation", "Labour Court", "Industrial Tribunal", "National Tribunal", "Arbitration"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "workers_participation_in_management",
                            "name": "Workers' Participation in Management (WPM)",
                            "keywords": ["Article 43A", "Joint Management Councils", "Shop Councils", "Plant Councils", "Board-level Participation", "Quality Circles"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "tripartism_and_ilo",
                            "name": "Tripartism, Indian Labour Conference & ILO Conventions",
                            "keywords": ["Tripartite Bodies", "Indian Labour Conference", "Standing Labour Committee", "ILO Conventions", "Declaration on Fundamental Principles and Rights at Work"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                },
                {
                    "id": "labour_legislation_and_historic_acts",
                    "name": "Labour Legislation & Historic Labour Acts",
                    "topics": [
                        {
                            "id": "trade_unions_act_1926",
                            "name": "The Trade Unions Act, 1926",
                            "keywords": ["Registration of Trade Unions", "Minimum Membership", "Rights and Liabilities", "Civil Immunity", "Criminal Conspiracy Protection", "General Fund", "Political Fund"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "industrial_disputes_act_1947",
                            "name": "The Industrial Disputes Act, 1947",
                            "keywords": ["Definition of Workman", "Public Utility Services", "Notice of Strike", "Illegal Strikes and Lockouts", "Lay-off Compensation", "Retrenchment Conditions", "Chapter V-B", "Unfair Labour Practices"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "factories_act_1948",
                            "name": "The Factories Act, 1948",
                            "keywords": ["Definition of Factory", "Manufacturing Process", "Health Provisions", "Safety Provisions", "Welfare Provisions", "Working Hours for Adults", "Overtime Wages", "Annual Leave with Wages", "Adolescent Worker", "Employment of Women and Young Persons"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "wages_legislation_acts",
                            "name": "Wages Legislation (Minimum Wages Act 1948 & Payment of Wages Act 1936)",
                            "keywords": ["Minimum Rates of Wages", "Scheduled Employment", "Advisory Board", "Deductions from Wages", "Wage Period", "Mode of Payment", "Time of Payment", "Payment of Bonus Act 1965"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "contract_and_migrant_labour_acts",
                            "name": "Contract Labour Act 1970 & Inter-State Migrant Workmen Act 1979",
                            "keywords": ["Contract Labour Regulation and Abolition Act 1970", "Principal Employer Liability", "Licensing of Contractors", "Inter-State Migrant Workmen Act 1979", "Displacement Allowance", "Journey Allowance"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "special_category_labour_acts",
                            "name": "Child Labour, Mines Act & Specific Sector Labour Acts",
                            "keywords": ["Child and Adolescent Labour Prohibition Act 1986", "Hazardous Occupations", "Mines Act 1952", "Plantations Labour Act 1951", "BOCW Act 1996"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                },
                {
                    "id": "new_labour_codes",
                    "name": "The Four New Labour Codes",
                    "topics": [
                        {
                            "id": "code_on_wages_2019",
                            "name": "The Code on Wages, 2019",
                            "keywords": ["Universal Minimum Wage", "National Floor Level Minimum Wage", "Uniform Definition of Wages", "Gender Equality in Remuneration", "Amalgamation of 4 Wage Acts"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "industrial_relations_code_2020",
                            "name": "The Industrial Relations Code, 2020",
                            "keywords": ["Standing Orders Threshold", "Mandatory 14 Days Strike Notice", "Sole Negotiating Union", "Negotiating Council", "Fixed Term Employment", "Worker Reskilling Fund"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "occupational_safety_health_working_conditions_code_2020",
                            "name": "OSH & Working Conditions Code, 2020",
                            "keywords": ["National OSH Board", "Duties of Employer", "Annual Health Check-up", "Women Working at Night", "Inter-State Migrant Worker Welfare"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                }
            ]
        },
        {
            "id": "general_accounting_principles",
            "name": "General Accounting Principles",
            "subject": "GENERAL_ACCOUNTING_PRINCIPLES",
            "domains": [
                {
                    "id": "accounting_framework_and_concepts",
                    "name": "Accounting Framework, Concepts & Standards",
                    "topics": [
                        {
                            "id": "nature_scope_and_objectives_of_accounting",
                            "name": "Nature, Scope and Objectives of Accounting",
                            "keywords": ["Book-keeping vs Accounting", "Financial Accounting", "Cost Accounting", "Management Accounting", "Users of Accounting Information", "Qualitative Characteristics"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "accounting_concepts_principles_and_conventions",
                            "name": "Accounting Concepts, Principles & Conventions (GAAP)",
                            "keywords": ["Business Entity Concept", "Going Concern", "Money Measurement", "Accounting Period", "Dual Aspect", "Accrual Basis", "Matching Principle", "Realisation / Revenue Recognition", "Prudence / Conservatism", "Materiality", "Consistency", "Historical Cost"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "accounting_standards_and_ind_as",
                            "name": "Accounting Standards & Ind AS Framework",
                            "keywords": ["Accounting Standards Board", "ICAI", "Convergence with IFRS", "Ind AS", "AS 1 Disclosure of Accounting Policies", "AS 2 Valuation of Inventories", "AS 3 Cash Flow Statements", "AS 9 Revenue Recognition", "AS 10 Property Plant Equipment"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                },
                {
                    "id": "accounting_process_and_books",
                    "name": "Accounting Process, Books of Accounts & Trial Balance",
                    "topics": [
                        {
                            "id": "double_entry_system_and_journal",
                            "name": "Double Entry System & Recording Transactions (Journal)",
                            "keywords": ["Rules of Debit and Credit", "Personal Accounts", "Real Accounts", "Nominal Accounts", "Compound Journal Entries", "Source Documents", "Vouchers"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "ledger_posting_and_subdivision_of_journal",
                            "name": "Ledger Accounts, Subsidiary Books & Cash Book",
                            "keywords": ["Posting to Ledger", "Balancing of Accounts", "Purchase Day Book", "Sales Day Book", "Returns Inward and Outward", "Single Column Cash Book", "Two Column Cash Book", "Three Column Cash Book", "Petty Cash Book", "Imprest System"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "bank_reconciliation_statement",
                            "name": "Bank Reconciliation Statement (BRS)",
                            "keywords": ["Causes of Difference", "Cheques Issued but Not Presented", "Cheques Deposited but Not Cleared", "Direct Debits and Credits by Bank", "Amended Cash Book", "Bank Overdraft BRS"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "trial_balance_and_rectification_of_errors",
                            "name": "Trial Balance & Rectification of Errors",
                            "keywords": ["Objectives of Trial Balance", "Errors Disclosed by Trial Balance", "Errors Not Disclosed", "Errors of Omission", "Errors of Commission", "Errors of Principle", "Compensating Errors", "Suspense Account", "Rectification Entries"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                },
                {
                    "id": "financial_statements_and_adjustments",
                    "name": "Financial Statements, Depreciation & Adjustments",
                    "topics": [
                        {
                            "id": "capital_and_revenue_expenditure_and_receipts",
                            "name": "Capital vs Revenue Expenditure & Receipts",
                            "keywords": ["Capital Expenditure", "Revenue Expenditure", "Deferred Revenue Expenditure", "Capital Receipts", "Revenue Receipts", "Capital Loss vs Revenue Loss"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "depreciation_provisions_and_reserves",
                            "name": "Depreciation Accounting, Provisions & Reserves",
                            "keywords": ["Straight Line Method (SLM)", "Written Down Value (WDV)", "Annuity Method", "Sinking Fund", "Provision vs Reserve", "General Reserve", "Capital Reserve", "Secret Reserve", "Provision for Doubtful Debts", "Provision for Discount on Debtors"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "inventory_valuation",
                            "name": "Valuation of Inventories",
                            "keywords": ["Cost or Net Realisable Value (NRV)", "FIFO Method", "LIFO Method", "Weighted Average Price", "Simple Average", "Perpetual vs Periodic Inventory System"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "preparation_of_final_accounts",
                            "name": "Trading, Profit & Loss Account and Balance Sheet",
                            "keywords": ["Gross Profit", "Net Profit", "Operating Profit", "Balance Sheet Classification", "Current Assets", "Non-Current Assets", "Current Liabilities", "Working Capital", "Adjustments: Closing Stock, Outstanding Expenses, Prepaid Expenses, Accrued Income"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                },
                {
                    "id": "special_and_advanced_accounts",
                    "name": "Special & Advanced Accounting Topics",
                    "topics": [
                        {
                            "id": "bills_of_exchange",
                            "name": "Bills of Exchange & Promissory Notes",
                            "keywords": ["Drawer", "Drawee", "Payee", "Maturity Date", "Days of Grace", "Discounting of Bill", "Endorsement", "Dishonour of Bill", "Noting Charges", "Renewal of Bill", "Accommodation Bill"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "consignment_and_joint_ventures",
                            "name": "Consignment Accounts & Joint Ventures",
                            "keywords": ["Consignor", "Consignee", "Proforma Invoice", "Account Sales", "Del Credere Commission", "Normal Loss", "Abnormal Loss", "Joint Venture Accounts"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "partnership_accounts",
                            "name": "Partnership Accounts",
                            "keywords": ["Partnership Deed", "Profit Sharing Ratio", "Valuation of Goodwill", "Admission of Partner", "Retirement and Death of Partner", "Dissolution of Firm"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "company_accounts_and_share_capital",
                            "name": "Company Accounts & Share Capital",
                            "keywords": ["Issue of Shares at Par, Premium, Discount", "Calls in Arrears", "Calls in Advance", "Forfeiture of Shares", "Reissue of Forfeited Shares", "Capital Redemption Reserve", "Issue of Debentures"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                }
            ]
        },
        {
            "id": "auditing",
            "name": "Auditing",
            "subject": "AUDITING",
            "domains": [
                {
                    "id": "fundamentals_and_audit_planning",
                    "name": "Audit Fundamentals, Internal Control & Planning",
                    "topics": [
                        {
                            "id": "nature_objective_and_types_of_audit",
                            "name": "Nature, Scope and Types of Audit",
                            "keywords": ["True and Fair View", "Detection of Frauds and Errors", "Continuous Audit", "Interim Audit", "Final Audit", "Balance Sheet Audit", "Management Audit", "Cost Audit", "Tax Audit"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "audit_program_evidence_and_working_papers",
                            "name": "Audit Program, Evidence & Working Papers",
                            "keywords": ["Audit Notebook", "Audit Working Papers", "Ownership of Working Papers", "Sufficient Appropriate Audit Evidence", "Physical Verification", "Inquiry and Confirmation"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "internal_control_internal_check_and_internal_audit",
                            "name": "Internal Control, Internal Check & Internal Audit",
                            "keywords": ["Internal Check System", "Division of Duties", "Internal Audit vs External Audit", "Statutory Internal Audit Section 138", "Test Checking", "Audit Sampling"],
                            "exam_tags": {"epfo": ["APFC"]}
                        }
                    ]
                },
                {
                    "id": "vouching_verification_and_company_audit",
                    "name": "Vouching, Verification & Company Audit",
                    "topics": [
                        {
                            "id": "vouching_of_cash_and_trading_transactions",
                            "name": "Vouching of Transactions",
                            "keywords": ["Vouching as Backbone of Auditing", "Cash Receipts", "Cash Payments", "Credit Purchases", "Credit Sales", "Teeming and Lading", "Window Dressing"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "verification_and_valuation_of_assets_and_liabilities",
                            "name": "Verification & Valuation of Assets & Liabilities",
                            "keywords": ["Verification vs Valuation", "Fixed Assets", "Current Assets", "Cash in Hand", "Stock in Trade", "Contingent Liabilities", "Auditor's Duty Regarding Valuation"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "company_audit_under_companies_act_2013",
                            "name": "Company Audit under Companies Act, 2013",
                            "keywords": ["Appointment of Auditor Section 139", "Rotation of Auditors", "Disqualifications of Auditor Section 141", "Rights and Duties Section 143", "Reporting on Frauds", "Removal and Resignation", "CARO (Companies Auditor's Report Order)"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "audit_report_and_government_audit",
                            "name": "Audit Report & Government / EPFO Audit",
                            "keywords": ["Unqualified / Clean Opinion", "Qualified Opinion", "Adverse Opinion", "Disclaimer of Opinion", "CAG Audit of Government Undertakings", "Social Audit", "EPFO Statutory Audit"],
                            "exam_tags": {"epfo": ["APFC"]}
                        }
                    ]
                }
            ]
        },
        {
            "id": "insurance",
            "name": "Insurance",
            "subject": "INSURANCE",
            "domains": [
                {
                    "id": "principles_and_fundamentals_of_insurance",
                    "name": "Principles & Fundamentals of Insurance",
                    "topics": [
                        {
                            "id": "concept_history_and_functions_of_insurance",
                            "name": "Concept, History & Economic Role of Insurance",
                            "keywords": ["Risk Pooling", "Transfer of Risk", "Insurable Risk", "Moral Hazard", "Morale Hazard", "Peril", "History of Life & General Insurance in India", "Nationalisation of LIC and GIC"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "fundamental_legal_principles_of_insurance",
                            "name": "Fundamental Legal Principles of Insurance",
                            "keywords": ["Principle of Utmost Good Faith (Uberrimae Fidei)", "Insurable Interest", "Principle of Indemnity", "Subrogation", "Contribution", "Proximate Cause (Causa Proxima)", "Mitigation of Loss", "Warranties and Conditions"],
                            "exam_tags": {"epfo": ["APFC"]}
                        }
                    ]
                },
                {
                    "id": "life_general_and_health_insurance",
                    "name": "Life, General & Health Insurance Products",
                    "topics": [
                        {
                            "id": "life_insurance_products_and_underwriting",
                            "name": "Life Insurance Products & Actuarial Basics",
                            "keywords": ["Term Life Insurance", "Whole Life Policy", "Endowment Assurance", "Money Back Policy", "Unit Linked Insurance Plans (ULIP)", "Annuity and Pension Plans", "Surrender Value", "Paid-up Value", "Mortality Tables", "Medical & Non-Medical Underwriting"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "general_and_health_insurance",
                            "name": "General, Property & Health Insurance",
                            "keywords": ["Fire Insurance", "Marine Insurance", "Perils of the Sea", "General Average vs Particular Average", "Motor Vehicles Insurance", "Third Party Liability", "Comprehensive Policy", "Health Insurance", "Mediclaim", "Cashless Hospitalisation", "Co-payment and Deductibles"],
                            "exam_tags": {"epfo": ["APFC"]}
                        }
                    ]
                },
                {
                    "id": "regulatory_framework_and_government_schemes",
                    "name": "Insurance Regulatory Framework & Government Schemes",
                    "topics": [
                        {
                            "id": "irdai_powers_and_regulations",
                            "name": "IRDAI Structure, Powers & Functions",
                            "keywords": ["IRDAI Act 1999", "Malhotra Committee Recommendations", "Protection of Policyholders' Interests", "Solvency Margin", "Ombudsman Scheme", "Foreign Direct Investment in Insurance"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "government_social_insurance_schemes",
                            "name": "National Social & Micro-Insurance Schemes",
                            "keywords": ["Pradhan Mantri Jeevan Jyoti Bima Yojana (PMJJBY)", "Pradhan Mantri Suraksha Bima Yojana (PMSBY)", "Pradhan Mantri Fasal Bima Yojana (PMFBY)", "Ayushman Bharat PM-JAY", "Aam Aadmi Bima Yojana"],
                            "exam_tags": {"epfo": ["APFC", "EO/AO"]}
                        }
                    ]
                }
            ]
        },
        {
            "id": "social_security_in_india",
            "name": "Social Security in India",
            "subject": "SOCIAL_SECURITY_IN_INDIA",
            "domains": [
                {
                    "id": "concept_and_constitutional_framework",
                    "name": "Concept, Philosophy & Constitutional Framework",
                    "topics": [
                        {
                            "id": "concept_dimensions_and_evolution_of_social_security",
                            "name": "Concept, Evolution & Dimensions of Social Security",
                            "keywords": ["Social Assistance vs Social Insurance", "Beveridge Report", "ILO Social Security (Minimum Standards) Convention 102", "Nine Classical Contingencies", "History of Social Security in India"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "constitutional_and_institutional_provisions",
                            "name": "Constitutional Mandate & Institutional Framework",
                            "keywords": ["Article 39", "Article 41 Right to Work and Education and Public Assistance", "Article 42 Just and Humane Conditions of Work and Maternity Relief", "Article 43 Living Wage for Workers", "Ministry of Labour and Employment", "National Commission on Labour Recommendations"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                },
                {
                    "id": "statutory_social_security_framework",
                    "name": "Statutory Social Security Schemes & Acts",
                    "topics": [
                        {
                            "id": "employees_provident_funds_act_1952",
                            "name": "The EPF & Miscellaneous Provisions Act, 1952",
                            "keywords": ["Applicability Threshold 20 Employees", "Central Board of Trustees (CBT)", "Employees' Provident Funds Scheme 1952", "Employees' Pension Scheme (EPS) 1995", "Employees' Deposit-Linked Insurance (EDLI) Scheme 1976", "Wage Ceiling", "Contribution Rates 12%", "Universal Account Number (UAN)", "Recovery of Arrears Section 7A"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "employees_state_insurance_act_1948",
                            "name": "The Employees' State Insurance Act, 1948",
                            "keywords": ["ESIC Governance", "Wage Limit for Coverage", "Contribution Rates (3.25% Employer, 0.75% Employee)", "Sickness Benefit", "Maternity Benefit", "Disablement Benefit", "Dependants' Benefit", "Medical Benefit", "Funeral Expenses"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "payment_of_gratuity_act_1972",
                            "name": "The Payment of Gratuity Act, 1972",
                            "keywords": ["Applicability Threshold 10 Employees", "Continuous Service 5 Years Requirement", "Calculation Formula (15 days wages per year of service)", "Ceiling Limit on Gratuity (Rs 20 Lakhs)", "Forfeiture Conditions"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "maternity_benefit_act_1961",
                            "name": "The Maternity Benefit Act, 1961 & 2017 Amendment",
                            "keywords": ["Paid Leave 26 Weeks", "Applicability", "Creche Facility Threshold 50 Employees", "Work from Home Provisions", "Nursing Breaks", "Medical Bonus"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "employees_compensation_act_1923",
                            "name": "The Employees' Compensation Act, 1923",
                            "keywords": ["Employer Liability", "Accident Arising Out of and in the Course of Employment", "Doctrine of Notional Extension", "Occupational Diseases Schedule III", "Calculation of Compensation for Death and Permanent Total Disablement"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "unorganized_workers_social_security_act_2008",
                            "name": "Unorganised Workers' Social Security Framework",
                            "keywords": ["Unorganised Workers' Social Security Act 2008", "National Social Security Board", "State Social Security Boards", "e-Shram Portal", "Universal Social Security for Informal Sector"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                },
                {
                    "id": "code_on_social_security_2020",
                    "name": "Code on Social Security 2020 & Social Welfare Schemes",
                    "topics": [
                        {
                            "id": "code_on_social_security_2020_provisions",
                            "name": "The Code on Social Security, 2020",
                            "keywords": ["Amalgamation of 9 Social Security Acts", "Definition of Gig Worker", "Platform Worker", "Aggregator Obligations", "National Social Security Board for Gig and Platform Workers", "Social Security Fund", "Fixed Term Employees Gratuity on Pro-rata Basis"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        },
                        {
                            "id": "national_pension_and_social_welfare_schemes",
                            "name": "National Pension, Welfare Schemes & International SSAs",
                            "keywords": ["Pradhan Mantri Shram Yogi Maan-dhan (PM-SYM)", "Atal Pension Yojana (APY)", "National Pension System (NPS)", "PFRDA", "PM Kisan Maan-Dhan Yojana", "Social Security Agreements (SSA) with Foreign Countries", "Certificate of Coverage (CoC)", "Exportability of Pensions"],
                            "exam_tags": {"epfo": ["EO/AO", "APFC"]}
                        }
                    ]
                }
            ]
        },
        {
            "id": "applied_statistics",
            "name": "Applied Statistics",
            "subject": "APPLIED_STATISTICS",
            "domains": [
                {
                    "id": "data_collection_and_central_tendency",
                    "name": "Data Collection, Presentation & Measures of Central Tendency",
                    "topics": [
                        {
                            "id": "collection_and_presentation_of_data",
                            "name": "Collection, Classification & Tabulation of Data",
                            "keywords": ["Primary vs Secondary Data", "Sampling Methods", "Random Sampling", "Stratified Sampling", "Frequency Distribution", "Histogram", "Frequency Polygon", "Ogive", "Pie Chart"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "measures_of_central_tendency",
                            "name": "Measures of Central Tendency",
                            "keywords": ["Arithmetic Mean", "Weighted Mean", "Properties of Arithmetic Mean", "Median", "Mode", "Empirical Relationship (Mode = 3 Median - 2 Mean)", "Geometric Mean", "Harmonic Mean", "Choice of Average"],
                            "exam_tags": {"epfo": ["APFC"]}
                        }
                    ]
                },
                {
                    "id": "dispersion_correlation_and_probability",
                    "name": "Dispersion, Correlation, Index Numbers & Probability",
                    "topics": [
                        {
                            "id": "measures_of_dispersion_and_skewness",
                            "name": "Measures of Dispersion & Skewness",
                            "keywords": ["Range", "Quartile Deviation", "Mean Deviation", "Standard Deviation", "Variance", "Coefficient of Variation", "Karl Pearson's Coefficient of Skewness", "Kurtosis"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "correlation_and_regression",
                            "name": "Correlation & Regression Analysis",
                            "keywords": ["Scatter Diagram", "Karl Pearson's Coefficient of Correlation", "Properties of Correlation Coefficient", "Spearman's Rank Correlation", "Regression Lines", "Regression Coefficients"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "index_numbers",
                            "name": "Index Numbers & Time Series Basics",
                            "keywords": ["Base Year", "Laspeyres Index", "Paasche Index", "Fisher's Ideal Index", "Time Reversal Test", "Factor Reversal Test", "Consumer Price Index (CPI)", "Wholesale Price Index (WPI)"],
                            "exam_tags": {"epfo": ["APFC"]}
                        },
                        {
                            "id": "elementary_probability",
                            "name": "Elementary Probability",
                            "keywords": ["Random Experiment", "Sample Space", "Mutually Exclusive Events", "Addition Theorem of Probability", "Multiplication Theorem", "Conditional Probability", "Independent Events"],
                            "exam_tags": {"epfo": ["APFC"]}
                        }
                    ]
                }
            ]
        }
    ]

    nodes = {}
    root_subject_ids = []

    for subj in subjects_def:
        s_id = subj["id"]
        root_subject_ids.append(s_id)
        
        domain_ids = []
        for dom in subj["domains"]:
            d_id = f"{s_id}.{dom['id']}"
            domain_ids.append(d_id)
            
            topic_ids = []
            for top in dom["topics"]:
                t_id = f"{d_id}.{top['id']}"
                topic_ids.append(t_id)
                
                # Level 3: Topic node
                nodes[t_id] = {
                    "id": t_id,
                    "slug": top["id"],
                    "name": top["name"],
                    "level": 3,
                    "levelName": "Topic",
                    "subject": subj["subject"],
                    "subjectId": s_id,
                    "parentId": d_id,
                    "childrenIds": [],
                    "ancestorIds": [s_id, d_id],
                    "examTags": top["exam_tags"],
                    "rawExamTagString": f"[EPFO: {', '.join(top['exam_tags'].get('epfo', []))}]",
                    "entities": [],
                    "keywords": top["keywords"]
                }
            
            # Level 2: Domain node
            nodes[d_id] = {
                "id": d_id,
                "slug": dom["id"],
                "name": dom["name"],
                "level": 2,
                "levelName": "Domain",
                "subject": subj["subject"],
                "subjectId": s_id,
                "parentId": s_id,
                "childrenIds": topic_ids,
                "ancestorIds": [s_id],
                "examTags": {"epfo": ["EO/AO", "APFC"]},
                "rawExamTagString": "[EPFO: EO/AO, APFC]",
                "entities": [],
                "keywords": [dom["name"].upper()]
            }
            
        # Level 1: Subject node
        nodes[s_id] = {
            "id": s_id,
            "slug": s_id,
            "name": subj["name"],
            "level": 1,
            "levelName": "Subject",
            "subject": subj["subject"],
            "subjectId": s_id,
            "parentId": None,
            "childrenIds": domain_ids,
            "ancestorIds": [],
            "examTags": {"epfo": ["EO/AO", "APFC"]},
            "rawExamTagString": "[EPFO: EO/AO, APFC]",
            "entities": [],
            "keywords": [subj["name"].upper()]
        }

    l1_count = len([n for n in nodes.values() if n["level"] == 1])
    l2_count = len([n for n in nodes.values() if n["level"] == 2])
    l3_count = len([n for n in nodes.values() if n["level"] == 3])

    graph_data = {
        "version": "1.0.0",
        "name": "UPSC EPFO Specialized Knowledge Graph (Industrial Relations, Labour Laws, Accounting, Auditing, Insurance, Social Security, Statistics)",
        "generatedAt": "2026-10-09",
        "rootSubjectIds": root_subject_ids,
        "nodes": nodes,
        "stats": {
            "total_nodes": len(nodes),
            "level_1_subjects": l1_count,
            "level_2_domains": l2_count,
            "level_3_topics": l3_count
        }
    }

    out_path = os.path.join("src", "data", "knowledge_graph_epfo.json")
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(graph_data, f, indent=4, ensure_ascii=False)

    print(f"Successfully generated {out_path} with {len(nodes)} nodes ({l1_count} Subjects, {l2_count} Domains, {l3_count} Topics).")

if __name__ == "__main__":
    build_epfo_knowledge_graph()
