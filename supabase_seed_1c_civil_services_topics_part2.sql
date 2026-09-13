-- =========================================================================
-- SUPABASE SEED 1C: CIVIL SERVICES (TOPICS PART 2) (216 NODES)
-- =========================================================================

BEGIN;

INSERT INTO public.knowledge_nodes (
    id, slug, name, level, level_name, subject, subject_id, parent_id,
    children_ids, ancestor_ids, exam_tags, raw_exam_tag_string, description, entities, keywords, stream, streams
) VALUES
    (
        'indian_economy_development.agriculture_food_management_subsidies.buffer_stocking_public_distribution_system', 'buffer_stocking_public_distribution_system', 'Buffer Stocking & Public Distribution System (Food Corporation of India / FCI - Procurement, Storage & Distribution, Economic Cost of Foodgrains, Open Market Sale Scheme / OMSS; National Food Security Act / NFSA 2013 - Targeted Public Distribution System / TPDS, Antyodaya Anna Yojana / AAY, Priority Households; One Nation One Ration Card / ONORC, Direct Benefit Transfer / DBT in Food Subsidy, Food Subsidy Bill Reforms)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.agriculture_food_management_subsidies']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Buffer', 'Stocking', 'Public', 'Distribution', 'System', 'Food', 'Corporation', 'India', 'FCI', 'Procurement', 'Storage', 'Economic', 'Cost', 'Foodgrains', 'Open', 'Market', 'Sale', 'Scheme', 'OMSS', 'National', 'Security', 'Act', 'NFSA', '2013', 'Targeted', 'TPDS', 'Antyodaya', 'Anna', 'Yojana', 'AAY', 'Priority', 'Households', 'One', 'Nation', 'Ration', 'Card', 'ONORC', 'Direct', 'Benefit', 'Transfer', 'DBT', 'Subsidy', 'Bill', 'Reforms']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.industrial_policy_manufacturing_services.industrial_policy_structural_evolution', 'industrial_policy_structural_evolution', 'Industrial Policy & Structural Evolution (Industrial Policy Resolutions 1948, 1956 / License Raj, 1991 Industrial Policy Liberalisation; Index of Industrial Production / IIP - Eight Core Industries / 40.27% weightage: Refinery Products, Electricity, Steel, Coal, Crude Oil, Natural Gas, Cement, Fertilizers; Annual Survey of Industries / ASI)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Industrial', 'Policy', 'Structural', 'Evolution', 'Resolutions', '1948', '1956', 'License', 'Raj', '1991', 'Liberalisation', 'Index', 'Production', 'IIP', 'Eight', 'Core', 'Industries', '40.27%', 'weightage', 'Refinery', 'Products', 'Electricity', 'Steel', 'Coal', 'Crude', 'Oil', 'Natural', 'Gas', 'Cement', 'Fertilizers', 'Annual', 'Survey', 'ASI']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.industrial_policy_manufacturing_services.manufacturing_initiatives_make_in_india', 'manufacturing_initiatives_make_in_india', 'Manufacturing Initiatives & Make in India (Make in India 2.0; Production Linked Incentive / PLI Schemes across 14 Champion Sectors; National Capital Goods Policy; Phased Manufacturing Programme / PMP; Ease of Doing Business Reforms - Single Window Clearance, National Single Window System / NSWS, Decriminalisation of Minor Offenses)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Manufacturing', 'Initiatives', 'Make', 'India', '2.0', 'Production', 'Linked', 'Incentive', 'PLI', 'Schemes', 'across', 'Champion', 'Sectors', 'National', 'Capital', 'Goods', 'Policy', 'Phased', 'Programme', 'PMP', 'Ease', 'Doing', 'Business', 'Reforms', 'Single', 'Window', 'Clearance', 'System', 'NSWS', 'Decriminalisation', 'Minor', 'Offenses']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.industrial_policy_manufacturing_services.msme_sector_architecture', 'msme_sector_architecture', 'MSME Sector Architecture (Revised MSME Definition 2020 - Composite Criteria of Investment & Annual Turnover for Micro, Small, Medium Enterprises; Udyam Registration Portal; Credit Guarantee Schemes - CGTMSE, Emergency Credit Line Guarantee Scheme / ECLGS; Schemes - RAMP, CHAMPIONS Portal, TReDS / Trade Receivables Discounting System, Public Procurement Policy for MSMEs)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['MSME', 'Sector', 'Architecture', 'Revised', 'Definition', '2020', 'Composite', 'Criteria', 'Investment', 'Annual', 'Turnover', 'Micro', 'Small', 'Medium', 'Enterprises', 'Udyam', 'Registration', 'Portal', 'Credit', 'Guarantee', 'Schemes', 'CGTMSE', 'Emergency', 'Line', 'Scheme', 'ECLGS', 'RAMP', 'CHAMPIONS', 'TReDS', 'Trade', 'Receivables', 'Discounting', 'System', 'Public', 'Procurement', 'Policy', 'MSMEs']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.industrial_policy_manufacturing_services.public_sector_enterprises_disinvestment', 'public_sector_enterprises_disinvestment', 'Public Sector Enterprises & Disinvestment (Central Public Sector Enterprises / CPSEs - Maharatna, Navratna, Miniratna Classification Criteria; New Public Sector Enterprise Policy 2021 - Strategic vs Non-Strategic Sectors; Disinvestment Modes - Minority Stake Sale, Strategic Disinvestment, Asset Monetisation / National Monetisation Pipeline / NMP, Department of Investment and Public Asset Management / DIPAM)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Public', 'Sector', 'Enterprises', 'Disinvestment', 'Central', 'CPSEs', 'Maharatna', 'Navratna', 'Miniratna', 'Classification', 'Criteria', 'New', 'Enterprise', 'Policy', '2021', 'Strategic', 'Non', 'Sectors', 'Modes', 'Minority', 'Stake', 'Sale', 'Asset', 'Monetisation', 'National', 'Pipeline', 'NMP', 'Department', 'Investment', 'Management', 'DIPAM']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.industrial_policy_manufacturing_services.services_sector_logistics_transformation', 'services_sector_logistics_transformation', 'Services Sector & Logistics Transformation (Services Growth Driver - IT-BPM, Financial Services, Global Capability Centers / GCCs, Medical Tourism, Education Services; Logistics Ecosystem - National Logistics Policy / NLP, Unified Logistics Interface Platform / ULIP, PM Gati Shakti National Master Plan - Multi-modal Connectivity, Reduction of Logistics Cost from 14% to Global Benchmarks)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.industrial_policy_manufacturing_services']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Services', 'Sector', 'Logistics', 'Transformation', 'Growth', 'Driver', 'BPM', 'Financial', 'Global', 'Capability', 'Centers', 'GCCs', 'Medical', 'Tourism', 'Education', 'Ecosystem', 'National', 'Policy', 'NLP', 'Unified', 'Interface', 'Platform', 'ULIP', 'Gati', 'Shakti', 'Master', 'Plan', 'Multi', 'modal', 'Connectivity', 'Reduction', 'Cost', '14%', 'Benchmarks']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.infrastructure_energy_investment_models.physical_infrastructure_systems', 'physical_infrastructure_systems', 'Physical Infrastructure Systems (Road Infrastructure - National Highways Authority of India / NHAI, Bharatmala Pariyojana; Railways Modernisation - Dedicated Freight Corridors / DFC: Western & Eastern DFCs, Vande Bharat Trains, National Rail Plan 2030, High-Speed Rail Projects; Port & Maritime Infrastructure - Sagarmala Programme, Major Ports Authority Act 2021, Coastal Economic Zones / CEZs; Civil Aviation - UDAN Scheme / Regional Connectivity Scheme, Airport Privatisation & PPP Models)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.infrastructure_energy_investment_models',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.infrastructure_energy_investment_models']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Physical', 'Infrastructure', 'Systems', 'Road', 'National', 'Highways', 'Authority', 'India', 'NHAI', 'Bharatmala', 'Pariyojana', 'Railways', 'Modernisation', 'Dedicated', 'Freight', 'Corridors', 'DFC', 'Western', 'Eastern', 'DFCs', 'Vande', 'Bharat', 'Trains', 'Rail', 'Plan', '2030', 'High', 'Speed', 'Projects', 'Port', 'Maritime', 'Sagarmala', 'Programme', 'Major', 'Ports', 'Act', '2021', 'Coastal', 'Economic', 'Zones', 'CEZs', 'Civil', 'Aviation', 'UDAN', 'Scheme', 'Regional', 'Connectivity', 'Airport', 'Privatisation', 'PPP', 'Models']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.infrastructure_energy_investment_models.energy_transition_power_sector_architecture', 'energy_transition_power_sector_architecture', 'Energy Transition & Power Sector Architecture (Primary Energy Mix - Coal, Oil, Natural Gas, Renewables; Power Generation, Transmission & Distribution; Power Grid Architecture - One Sun, One World, One Grid / OSOWOG, National Grid; Financial Stress in DISCOMs - Ujjwal DISCOM Assurance Yojana / UDAY, Revamped Distribution Sector Scheme / RDSS; Renewable Energy Targets - 500 GW Non-Fossil Capacity by 2030, National Solar Mission, PM-KUSUM Scheme, Offshore Wind Energy Policy, National Green Hydrogen Mission / 5 MMT Target by 2030)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.infrastructure_energy_investment_models',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.infrastructure_energy_investment_models']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Energy', 'Transition', 'Power', 'Sector', 'Architecture', 'Primary', 'Mix', 'Coal', 'Oil', 'Natural', 'Gas', 'Renewables', 'Generation', 'Transmission', 'Distribution', 'Grid', 'One', 'Sun', 'World', 'OSOWOG', 'National', 'Financial', 'Stress', 'DISCOMs', 'Ujjwal', 'DISCOM', 'Assurance', 'Yojana', 'UDAY', 'Revamped', 'Scheme', 'RDSS', 'Renewable', 'Targets', '500', 'Non', 'Fossil', 'Capacity', '2030', 'Solar', 'Mission', 'KUSUM', 'Offshore', 'Wind', 'Policy', 'Green', 'Hydrogen', 'MMT', 'Target']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.infrastructure_energy_investment_models.investment_models_project_financing', 'investment_models_project_financing', 'Investment Models & Project Financing (Public-Private Partnership / PPP Models - Build-Operate-Transfer / BOT: Toll vs Annuity, Engineering-Procurement-Construction / EPC, Hybrid Annuity Model / HAM, Swiss Challenge Method; Alternate Financing Vehicles - Infrastructure Investment Trusts / InvITs, Real Estate Investment Trusts / REITs, National Infrastructure Pipeline / NIP, National Bank for Financing Infrastructure and Development / NaBFID, National Investment and Infrastructure Fund / NIIF)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.infrastructure_energy_investment_models',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.infrastructure_energy_investment_models']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Investment', 'Models', 'Project', 'Financing', 'Public', 'Private', 'Partnership', 'PPP', 'Build', 'Operate', 'Transfer', 'BOT', 'Toll', 'Annuity', 'Engineering', 'Procurement', 'Construction', 'EPC', 'Hybrid', 'Model', 'HAM', 'Swiss', 'Challenge', 'Method', 'Alternate', 'Vehicles', 'Infrastructure', 'Trusts', 'InvITs', 'Real', 'Estate', 'REITs', 'National', 'Pipeline', 'NIP', 'Bank', 'Development', 'NaBFID', 'Fund', 'NIIF']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.external_sector_balance_of_payments_foreign_trade.balance_of_payments_architecture', 'balance_of_payments_architecture', 'Balance of Payments Architecture (BOP Structure - Current Account: Merchandise Trade Balance, Invisibles: Services, Transfers, Income; Capital Account: Foreign Direct Investment / FDI, Foreign Portfolio Investment / FPI, External Commercial Borrowings / ECBs, NRI Deposits, External Assistance; Current Account Deficit / CAD & Sustainable Thresholds)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Balance', 'Payments', 'Architecture', 'BOP', 'Structure', 'Current', 'Account', 'Merchandise', 'Trade', 'Invisibles', 'Services', 'Transfers', 'Income', 'Capital', 'Foreign', 'Direct', 'Investment', 'FDI', 'Portfolio', 'FPI', 'External', 'Commercial', 'Borrowings', 'ECBs', 'NRI', 'Deposits', 'Assistance', 'Deficit', 'CAD', 'Sustainable', 'Thresholds']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.external_sector_balance_of_payments_foreign_trade.foreign_exchange_currency_dynamics', 'foreign_exchange_currency_dynamics', 'Foreign Exchange & Currency Dynamics (Foreign Exchange Reserves - Components: Foreign Currency Assets, Gold, SDRs, Reserve Tranche Position in IMF; Exchange Rate Regimes - Clean vs Dirty Float, Nominal Effective Exchange Rate / NEER vs Real Effective Exchange Rate / REER; Currency Convertibility - Full Current Account Convertibility / Article VIII of IMF, Tarapore Committee Recommendations on Capital Account Convertibility; Internationalisation of Indian Rupee - Vostro Accounts, Rupee-denominated Trade Settlement)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Foreign', 'Exchange', 'Currency', 'Dynamics', 'Reserves', 'Components', 'Assets', 'Gold', 'SDRs', 'Reserve', 'Tranche', 'Position', 'IMF', 'Rate', 'Regimes', 'Clean', 'Dirty', 'Float', 'Nominal', 'Effective', 'NEER', 'Real', 'REER', 'Convertibility', 'Full', 'Current', 'Account', 'Article', 'VIII', 'Tarapore', 'Committee', 'Recommendations', 'Capital', 'Internationalisation', 'Indian', 'Rupee', 'Vostro', 'Accounts', 'denominated', 'Trade', 'Settlement']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.external_sector_balance_of_payments_foreign_trade.foreign_trade_policy_international_agreements', 'foreign_trade_policy_international_agreements', 'Foreign Trade Policy & International Agreements (Foreign Trade Policy 2023 - Target of $2 Trillion Exports by 2030, Four Pillars: Incentive to Remission, Export Promotion through Collaboration, Districts as Export Hubs, E-Commerce Exports; Trade Instruments - RoDTEP, RoSCTL, Duty Drawback; Free Trade Agreements / FTAs - Comprehensive Economic Partnership Agreements / CEPA with UAE, ECTA with Australia, Trade & Economic Partnership Agreement / TEPA with EFTA, European Union FTA negotiations; Trade Remedies - Anti-Dumping Duty, Countervailing Duty / CVD, Safeguard Duty; Global Supply Chain Realignment - China+1 Strategy, Supply Chain Resilience Initiative / SCRI)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.external_sector_balance_of_payments_foreign_trade']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Foreign', 'Trade', 'Policy', 'International', 'Agreements', '2023', 'Target', 'Trillion', 'Exports', '2030', 'Four', 'Pillars', 'Incentive', 'Remission', 'Export', 'Promotion', 'through', 'Collaboration', 'Districts', 'Hubs', 'Commerce', 'Instruments', 'RoDTEP', 'RoSCTL', 'Duty', 'Drawback', 'Free', 'FTAs', 'Comprehensive', 'Economic', 'Partnership', 'CEPA', 'UAE', 'ECTA', 'Australia', 'Agreement', 'TEPA', 'EFTA', 'European', 'Union', 'FTA', 'negotiations', 'Remedies', 'Anti', 'Dumping', 'Countervailing', 'CVD', 'Safeguard', 'Global', 'Supply', 'Chain', 'Realignment', 'China+1', 'Strategy', 'Resilience', 'Initiative', 'SCRI']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.macroeconomic_profile_state_finances_of_karnataka', 'macroeconomic_profile_state_finances_of_karnataka', 'Macroeconomic Profile & State Finances of Karnataka', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY['indian_economy_development.economy_development_of_karnataka.macroeconomic_profile_state_finances_of_karnataka.gsdp_trends_sectoral_composition', 'indian_economy_development.economy_development_of_karnataka.macroeconomic_profile_state_finances_of_karnataka.public_finance_fiscal_health_kfra']::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS3"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS3]', '', ARRAY[]::text[], ARRAY['Macroeconomic', 'Profile', 'State', 'Finances', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.agriculture_allied_sectors_rural_transformation_in_karnataka', 'agriculture_allied_sectors_rural_transformation_in_karnataka', 'Agriculture, Allied Sectors & Rural Transformation in Karnataka', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY['indian_economy_development.economy_development_of_karnataka.agriculture_allied_sectors_rural_transformation_in_karnataka.agrarian_profile_cropping_patterns', 'indian_economy_development.economy_development_of_karnataka.agriculture_allied_sectors_rural_transformation_in_karnataka.high-value_plantation_horticulture_crops', 'indian_economy_development.economy_development_of_karnataka.agriculture_allied_sectors_rural_transformation_in_karnataka.state_agricultural_schemes_farm_modernisation']::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS3"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS3]', '', ARRAY[]::text[], ARRAY['Agriculture', 'Allied', 'Sectors', 'Rural', 'Transformation', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.industrial_policies_manufacturing_innovation_ecosystem', 'industrial_policies_manufacturing_innovation_ecosystem', 'Industrial Policies, Manufacturing & Innovation Ecosystem', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY['indian_economy_development.economy_development_of_karnataka.industrial_policies_manufacturing_innovation_ecosystem.industrial_policy_framework_beyond_bengaluru', 'indian_economy_development.economy_development_of_karnataka.industrial_policies_manufacturing_innovation_ecosystem.innovation_startups_knowledge_economy_leadership', 'indian_economy_development.economy_development_of_karnataka.industrial_policies_manufacturing_innovation_ecosystem.major_infrastructure_corridors_industrial_logistics']::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS3"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS3]', '', ARRAY[]::text[], ARRAY['Industrial', 'Policies', 'Manufacturing', 'Innovation', 'Ecosystem']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.flagship_welfare_guarantee_schemes_of_karnataka', 'flagship_welfare_guarantee_schemes_of_karnataka', 'Flagship Welfare & Guarantee Schemes of Karnataka (Pancha Guarantees)', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY['indian_economy_development.economy_development_of_karnataka.flagship_welfare_guarantee_schemes_of_karnataka.the_five_transformative_guarantees']::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS3"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS3]', '', ARRAY[]::text[], ARRAY['Flagship', 'Welfare', 'Guarantee', 'Schemes', 'Karnataka', 'Pancha', 'Guarantees']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.regional_imbalances_nanjundappa_committee_kalyana_karnataka_development', 'regional_imbalances_nanjundappa_committee_kalyana_karnataka_development', 'Regional Imbalances, Nanjundappa Committee & Kalyana Karnataka Development', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY['indian_economy_development.economy_development_of_karnataka.regional_imbalances_nanjundappa_committee_kalyana_karnataka_development.dr_dm_nanjundappa_high_power_committee', 'indian_economy_development.economy_development_of_karnataka.regional_imbalances_nanjundappa_committee_kalyana_karnataka_development.comprehensive_deprivation_index_methodology', 'indian_economy_development.economy_development_of_karnataka.regional_imbalances_nanjundappa_committee_kalyana_karnataka_development.classification_of_175_taluks_in_karnataka_39_most_backward_taluks_40_more_backward_taluks_35_backward_taluks_61_relatively_developed_taluks_overwhelming_concentration_of_backward_taluks_in_north_karnataka_districts', 'indian_economy_development.economy_development_of_karnataka.regional_imbalances_nanjundappa_committee_kalyana_karnataka_development.recommendations_special_development_plan_sdp']::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Mains-GS3"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Mains-GS3]', '', ARRAY[]::text[], ARRAY['Regional', 'Imbalances', 'Nanjundappa', 'Committee', 'Kalyana', 'Karnataka', 'Development']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.1_gruha_lakshmi_scheme', '1_gruha_lakshmi_scheme', '1. Gruha Lakshmi Scheme (Direct Benefit Transfer of ₹2,000 per month directly to Bank Account of the Woman Head of every Eligible Family / Largest Women Empowerment DBT Scheme in India).', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Gruha', 'Lakshmi', 'Scheme', 'Direct', 'Benefit', 'Transfer', '000', 'per', 'month', 'directly', 'Bank', 'Account', 'Woman', 'Head', 'every', 'Eligible', 'Family', 'Largest', 'Women', 'Empowerment', 'DBT', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.2_gruha_jyothi_scheme', '2_gruha_jyothi_scheme', '2. Gruha Jyothi Scheme (Provision of Free Domestic Electricity up to 200 units per month for all Domestic Households in Karnataka based on Average Consumption Patterns).', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Gruha', 'Jyothi', 'Scheme', 'Provision', 'Free', 'Domestic', 'Electricity', '200', 'units', 'per', 'month', 'Households', 'Karnataka', 'based', 'Average', 'Consumption', 'Patterns']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.3_yuva_nidhi_scheme', '3_yuva_nidhi_scheme', '3. Yuva Nidhi Scheme (Unemployment Financial Assistance Scheme for Educated Youth: ₹3,000 per month for Unemployed Graduates and ₹1,500 per month for Unemployed Diploma Holders for up to 2 years).', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Yuva', 'Nidhi', 'Scheme', 'Unemployment', 'Financial', 'Assistance', 'Educated', 'Youth', '000', 'per', 'month', 'Unemployed', 'Graduates', '500', 'Diploma', 'Holders', 'years']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.4_shakti_scheme', '4_shakti_scheme', '4. Shakti Scheme (Free Bus Travel Scheme for all Domiciled Women, Transgenders & Students across Karnataka in Non-AC City, Suburban and Ordinary State Transport Buses - KSRTC, BMTC, NWKRTC, KKRTC).', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY[]::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Shakti', 'Scheme', 'Free', 'Bus', 'Travel', 'Domiciled', 'Women', 'Transgenders', 'Students', 'across', 'Karnataka', 'Non', 'City', 'Suburban', 'Ordinary', 'State', 'Transport', 'Buses', 'KSRTC', 'BMTC', 'NWKRTC', 'KKRTC']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'indian_economy_development.economy_development_of_karnataka.5_anna_bhagya_scheme', '5_anna_bhagya_scheme', '5. Anna Bhagya Scheme (Provision of 10 kg of Free Foodgrains / Rice per person per month to all BPL & Antyodaya Cardholders, with DBT Cash Component for additional grains).', 3,
        'Topic', 'Indian Economy & Development', 'indian_economy_development', 'indian_economy_development.economy_development_of_karnataka',
        ARRAY['indian_economy_development.economy_development_of_karnataka.5_anna_bhagya_scheme.comprehensive_social_security_human_development_schemes', 'indian_economy_development.economy_development_of_karnataka.5_anna_bhagya_scheme.ksheera_bhagya_scheme', 'indian_economy_development.economy_development_of_karnataka.5_anna_bhagya_scheme.mathru_poorna_scheme', 'indian_economy_development.economy_development_of_karnataka.5_anna_bhagya_scheme.ganga_kalyana_scheme', 'indian_economy_development.economy_development_of_karnataka.5_anna_bhagya_scheme.arivu_education_loan_scheme', 'indian_economy_development.economy_development_of_karnataka.5_anna_bhagya_scheme.bhagyalakshmi_scheme', 'indian_economy_development.economy_development_of_karnataka.5_anna_bhagya_scheme.vidyasiri_food_and_accommodation_scheme']::text[], ARRAY['indian_economy_development', 'indian_economy_development.economy_development_of_karnataka']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Anna', 'Bhagya', 'Scheme', 'Provision', 'Free', 'Foodgrains', 'Rice', 'per', 'person', 'month', 'BPL', 'Antyodaya', 'Cardholders', 'DBT', 'Cash', 'Component', 'additional', 'grains']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.ecosystem_hierarchy_dynamics', 'ecosystem_hierarchy_dynamics', 'Ecosystem Hierarchy & Dynamics (Levels of Ecological Organisation - Organism, Population, Community, Ecosystem, Biome, Biosphere; Ecosystem Components - Abiotic vs Biotic; Ecosystem Functions - Productivity: Primary vs Secondary, Decomposition, Energy Flow, Nutrient Cycling)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Ecosystem', 'Hierarchy', 'Dynamics', 'Levels', 'Ecological', 'Organisation', 'Organism', 'Population', 'Community', 'Biome', 'Biosphere', 'Components', 'Abiotic', 'Biotic', 'Functions', 'Productivity', 'Primary', 'Secondary', 'Decomposition', 'Energy', 'Flow', 'Nutrient', 'Cycling']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.energy_flow_trophic_structure', 'energy_flow_trophic_structure', 'Energy Flow & Trophic Structure (Lakes & Forests Energy Dynamics, Lindeman''s 10% Trophic Efficiency Law, Food Chains - Grazing Food Chain / GFC vs Detritus Food Chain / DFC, Complex Food Webs; Ecological Pyramids - Pyramid of Numbers: Upright vs Inverted / Tree Ecosystem, Pyramid of Biomass: Upright / Terrestrial vs Inverted / Aquatic, Pyramid of Energy: Always Upright)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Energy', 'Flow', 'Trophic', 'Structure', 'Lakes', 'Forests', 'Dynamics', 'Lindeman''s', '10%', 'Efficiency', 'Law', 'Food', 'Chains', 'Grazing', 'Chain', 'GFC', 'Detritus', 'DFC', 'Complex', 'Webs', 'Ecological', 'Pyramids', 'Pyramid', 'Numbers', 'Upright', 'Inverted', 'Tree', 'Ecosystem', 'Biomass', 'Terrestrial', 'Aquatic', 'Always']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.biogeochemical_cycles', 'biogeochemical_cycles', 'Biogeochemical Cycles (Gaseous Cycles - Carbon Cycle, Nitrogen Cycle / Nitrogen Fixation, Nitrification, Assimilation, Ammonification, Denitrification; Sedimentary Cycles - Phosphorus Cycle, Sulphur Cycle; Water / Hydrological Cycle)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Biogeochemical', 'Cycles', 'Gaseous', 'Carbon', 'Cycle', 'Nitrogen', 'Fixation', 'Nitrification', 'Assimilation', 'Ammonification', 'Denitrification', 'Sedimentary', 'Phosphorus', 'Sulphur', 'Water', 'Hydrological']::text[],
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
        'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.ecological_interactions_principles', 'ecological_interactions_principles', 'Ecological Interactions & Principles (Symbiotic Interactions - Mutualism, Commensalism; Antagonistic Interactions - Parasitism, Predation, Amensalism, Competition; Gause''s Competitive Exclusion Principle; Ecological Succession - Primary vs Secondary Succession, Seral Stages, Pioneer Species vs Climax Community; Ecological Concepts - Niche / Fundamental vs Realised Niche, Habitat, Ecotone & Edge Effect, Carrying Capacity, Homeostasis)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Ecological', 'Interactions', 'Principles', 'Symbiotic', 'Mutualism', 'Commensalism', 'Antagonistic', 'Parasitism', 'Predation', 'Amensalism', 'Competition', 'Gause''s', 'Competitive', 'Exclusion', 'Principle', 'Succession', 'Primary', 'Secondary', 'Seral', 'Stages', 'Pioneer', 'Species', 'Climax', 'Community', 'Concepts', 'Niche', 'Fundamental', 'Realised', 'Habitat', 'Ecotone', 'Edge', 'Effect', 'Carrying', 'Capacity', 'Homeostasis']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.biodiversity_fundamentals_patterns', 'biodiversity_fundamentals_patterns', 'Biodiversity Fundamentals & Patterns (Three Levels - Genetic Diversity, Species Diversity, Ecosystem Diversity; Gradients of Biodiversity - Latitudinal Gradient, Species-Area Relationship / Alexander von Humboldt; Global Biodiversity Hotspots - Norman Myers Criteria: Western Ghats & Sri Lanka, Eastern Himalayas, Indo-Burma, Sundaland; Mega-Biodiverse Countries)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Biodiversity', 'Fundamentals', 'Patterns', 'Three', 'Levels', 'Genetic', 'Diversity', 'Species', 'Ecosystem', 'Gradients', 'Latitudinal', 'Gradient', 'Area', 'Relationship', 'Alexander', 'von', 'Humboldt', 'Global', 'Hotspots', 'Norman', 'Myers', 'Criteria', 'Western', 'Ghats', 'Sri', 'Lanka', 'Eastern', 'Himalayas', 'Indo', 'Burma', 'Sundaland', 'Mega', 'Biodiverse', 'Countries']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.in-situ_conservation_architecture', 'in-situ_conservation_architecture', 'In-Situ Conservation Architecture (Protected Area Network under Wildlife Protection Act 1972 - National Parks: Highest Protection, No Human Rights / Grazing; Wildlife Sanctuaries: Limited Human Activities Allowed; Conservation Reserves & Community Reserves; Biosphere Reserves - UNESCO Man and the Biosphere / MAB Programme: Core, Buffer & Transition Zones / 12 of 18 in WNBR network; Tiger Reserves / Project Tiger 1973 & National Tiger Conservation Authority / NTCA, M-STrIPES Monitoring; Elephant Reserves / Project Elephant 1992, MIKE Programme, Elephant Corridors; Marine Protected Areas / MPAs)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Situ', 'Conservation', 'Architecture', 'Protected', 'Area', 'Network', 'Wildlife', 'Protection', 'Act', '1972', 'National', 'Parks', 'Highest', 'Human', 'Rights', 'Grazing', 'Sanctuaries', 'Limited', 'Activities', 'Allowed', 'Reserves', 'Community', 'Biosphere', 'UNESCO', 'Man', 'MAB', 'Programme', 'Core', 'Buffer', 'Transition', 'Zones', 'WNBR', 'network', 'Tiger', 'Project', '1973', 'Authority', 'NTCA', 'STrIPES', 'Monitoring', 'Elephant', '1992', 'MIKE', 'Corridors', 'Marine', 'Areas', 'MPAs']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.ex-situ_conservation_botanical_science', 'ex-situ_conservation_botanical_science', 'Ex-Situ Conservation & Botanical Science (Botanical Gardens, Zoological Parks, Seed Banks, Gene Banks, Cryopreservation, Captive Breeding Programmes)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Situ', 'Conservation', 'Botanical', 'Science', 'Gardens', 'Zoological', 'Parks', 'Seed', 'Banks', 'Gene', 'Cryopreservation', 'Captive', 'Breeding', 'Programmes']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.species_profiling_conservation_status', 'species_profiling_conservation_status', 'Species Profiling & Conservation Status (IUCN Red List Categories - Extinct / EX, Extinct in the Wild / EW, Critically Endangered / CR: Great Indian Bustard, Gharial, Jerdon''s Courser, Pygmy Hog, Hangul; Endangered / EN: Royal Bengal Tiger, Asian Elephant, Snow Leopard, One-horned Rhinoceros, Lion-tailed Macaque, Gangetic Dolphin; Vulnerable / VU: Olive Ridley Turtle, Dugong, Nilgiri Tahr; Conservation Classifications - Keystone Species, Umbrella Species, Flagship Species, Indicator Species, Invasive Alien Species / Lantana camara, Prosopis juliflora, Water Hyacinth)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Species', 'Profiling', 'Conservation', 'Status', 'IUCN', 'Red', 'List', 'Categories', 'Extinct', 'Wild', 'Critically', 'Endangered', 'Great', 'Indian', 'Bustard', 'Gharial', 'Jerdon''s', 'Courser', 'Pygmy', 'Hog', 'Hangul', 'Royal', 'Bengal', 'Tiger', 'Asian', 'Elephant', 'Snow', 'Leopard', 'One', 'horned', 'Rhinoceros', 'Lion', 'tailed', 'Macaque', 'Gangetic', 'Dolphin', 'Vulnerable', 'Olive', 'Ridley', 'Turtle', 'Dugong', 'Nilgiri', 'Tahr', 'Classifications', 'Keystone', 'Umbrella', 'Flagship', 'Indicator', 'Invasive', 'Alien', 'Lantana', 'camara', 'Prosopis', 'juliflora', 'Water', 'Hyacinth']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.aquatic_ecosystems_coastal_conservation', 'aquatic_ecosystems_coastal_conservation', 'Aquatic Ecosystems & Coastal Conservation (Wetland Ecology - Wetland Classification, Ecological Services, Ramsar Convention on Wetlands 1971, Montreux Record / Keoladeo & Loktak Lake, Amrit Dharohar Initiative; Mangrove Ecosystems - Halophytes, Pneumatophores / Stilt Roots, Sundarbans, Bhitarkanika, MISHTI Scheme; Coral Reef Ecosystems - Fringing, Barrier, Atoll Reefs; Coral Bleaching - Thermal Stress, Zooxanthellae Expulsion, Ocean Acidification)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Aquatic', 'Ecosystems', 'Coastal', 'Conservation', 'Wetland', 'Ecology', 'Classification', 'Ecological', 'Services', 'Ramsar', 'Convention', 'Wetlands', '1971', 'Montreux', 'Record', 'Keoladeo', 'Loktak', 'Lake', 'Amrit', 'Dharohar', 'Initiative', 'Mangrove', 'Halophytes', 'Pneumatophores', 'Stilt', 'Roots', 'Sundarbans', 'Bhitarkanika', 'MISHTI', 'Scheme', 'Coral', 'Reef', 'Fringing', 'Barrier', 'Atoll', 'Reefs', 'Bleaching', 'Thermal', 'Stress', 'Zooxanthellae', 'Expulsion', 'Ocean', 'Acidification']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.air_pollution_atmospheric_quality', 'air_pollution_atmospheric_quality', 'Air Pollution & Atmospheric Quality (Major Pollutants - PM2.5, PM10, SO2, NO2, CO, Ozone / O3, Lead, Ammonia; National Air Quality Index / AQI; National Clean Air Programme / NCAP; Commission for Air Quality Management / CAQM in NCR; Stubble Burning / Parali Issue & Bio-decomposers; Vehicular Emissions - Bharat Stage VI / BS-VI Emission Norms, EV Transition / FAME Scheme; Industrial Pollution - Flue Gas Desulfurization / FGD, Fly Ash Management Rules; Acid Rain Dynamics & Photochemical Smog)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Air', 'Pollution', 'Atmospheric', 'Quality', 'Major', 'Pollutants', 'PM2.5', 'PM10', 'SO2', 'NO2', 'Ozone', 'Lead', 'Ammonia', 'National', 'Index', 'AQI', 'Clean', 'Programme', 'NCAP', 'Commission', 'Management', 'CAQM', 'NCR', 'Stubble', 'Burning', 'Parali', 'Issue', 'Bio', 'decomposers', 'Vehicular', 'Emissions', 'Bharat', 'Stage', 'Emission', 'Norms', 'Transition', 'FAME', 'Scheme', 'Industrial', 'Flue', 'Gas', 'Desulfurization', 'FGD', 'Fly', 'Ash', 'Rules', 'Acid', 'Rain', 'Dynamics', 'Photochemical', 'Smog']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.water_pollution_aquatic_degradation', 'water_pollution_aquatic_degradation', 'Water Pollution & Aquatic Degradation (Pollution Indicators - Dissolved Oxygen / DO, Biochemical Oxygen Demand / BOD, Chemical Oxygen Demand / COD; Eutrophication & Algal Blooms, Dead Zones / Hypoxia; Industrial Effluents & Heavy Metal Poisoning - Minamata Disease / Mercury, Itai-Itai / Cadmium, Fluorosis, Arsenic Contamination in Gangetic Basin; River Rejuvenation - Namami Gange Programme, National River Conservation Plan; Groundwater Contamination & Depletion)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Water', 'Pollution', 'Aquatic', 'Degradation', 'Indicators', 'Dissolved', 'Oxygen', 'Biochemical', 'Demand', 'BOD', 'Chemical', 'COD', 'Eutrophication', 'Algal', 'Blooms', 'Dead', 'Zones', 'Hypoxia', 'Industrial', 'Effluents', 'Heavy', 'Metal', 'Poisoning', 'Minamata', 'Disease', 'Mercury', 'Itai', 'Cadmium', 'Fluorosis', 'Arsenic', 'Contamination', 'Gangetic', 'Basin', 'River', 'Rejuvenation', 'Namami', 'Gange', 'Programme', 'National', 'Conservation', 'Plan', 'Groundwater', 'Depletion']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.land_degradation_soil_pollution_desertification', 'land_degradation_soil_pollution_desertification', 'Land Degradation, Soil Pollution & Desertification (Soil Salinisation, Waterlogging, Soil Erosion, Loss of Organic Carbon; United Nations Convention to Combat Desertification / UNCCD, Bonn Challenge / Restoration of Degraded Land, Land Degradation Neutrality / LDN Targets by 2030)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Land', 'Degradation', 'Soil', 'Pollution', 'Desertification', 'Salinisation', 'Waterlogging', 'Erosion', 'Loss', 'Organic', 'Carbon', 'United', 'Nations', 'Convention', 'Combat', 'UNCCD', 'Bonn', 'Challenge', 'Restoration', 'Degraded', 'Neutrality', 'LDN', 'Targets', '2030']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.waste_management_architecture', 'waste_management_architecture', 'Waste Management Architecture (Solid Waste Management Rules 2016 - Source Segregation, Waste-to-Energy, Sanitary Landfills; Plastic Waste Management Rules 2021 & 2022 Amendments - Ban on Single-Use Plastics / SUPs, Extended Producer Responsibility / EPR Framework; E-Waste Management Rules 2022 - Solar PV Modules Inclusion; Biomedical Waste Management Rules; Hazardous and Other Wastes Rules; Construction and Demolition / C&D Waste Management)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Waste', 'Management', 'Architecture', 'Solid', 'Rules', '2016', 'Source', 'Segregation', 'Energy', 'Sanitary', 'Landfills', 'Plastic', '2021', '2022', 'Amendments', 'Ban', 'Single', 'Use', 'Plastics', 'SUPs', 'Extended', 'Producer', 'Responsibility', 'EPR', 'Framework', 'Solar', 'Modules', 'Inclusion', 'Biomedical', 'Hazardous', 'Other', 'Wastes', 'Construction', 'Demolition', 'C&D']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.environmental_remediation_technologies', 'environmental_remediation_technologies', 'Environmental Remediation Technologies (Bioremediation - In-situ: Bioventing, Biosparging; Ex-situ: Bioreactors; Phytoremediation - Phytoextraction, Phytodegradation, Rhizofiltration; Mycoremediation, Oilzapper Microbial Technology for Marine Oil Spills)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Environmental', 'Remediation', 'Technologies', 'Bioremediation', 'situ', 'Bioventing', 'Biosparging', 'Bioreactors', 'Phytoremediation', 'Phytoextraction', 'Phytodegradation', 'Rhizofiltration', 'Mycoremediation', 'Oilzapper', 'Microbial', 'Technology', 'Marine', 'Oil', 'Spills']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.climate_change_science_global_warming', 'climate_change_science_global_warming', 'Climate Change Science & Global Warming (Greenhouse Effect & Greenhouse Gases / GHGs - CO2, CH4, N2O, HFCs, PFCs, SF6, NF3; Global Warming Potential / GWP; Intergovernmental Panel on Climate Change / IPCC Assessment Reports / AR6 Synthesis Report - 1.5°C Warming Limit, Carbon Budget, Tipping Points, Sea Level Rise, Cryosphere Melting / Third Pole Thawing; Urban Heat Island / UHI Effect)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Climate', 'Change', 'Science', 'Global', 'Warming', 'Greenhouse', 'Effect', 'Gases', 'GHGs', 'CO2', 'CH4', 'N2O', 'HFCs', 'PFCs', 'SF6', 'NF3', 'Potential', 'GWP', 'Intergovernmental', 'Panel', 'IPCC', 'Assessment', 'Reports', 'AR6', 'Synthesis', 'Report', '1.5°C', 'Limit', 'Carbon', 'Budget', 'Tipping', 'Points', 'Sea', 'Level', 'Rise', 'Cryosphere', 'Melting', 'Third', 'Pole', 'Thawing', 'Urban', 'Heat', 'Island', 'UHI']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.international_climate_architecture_treaties', 'international_climate_architecture_treaties', 'International Climate Architecture & Treaties (United Nations Framework Convention on Climate Change / UNFCCC 1992 Earth Summit; Kyoto Protocol 1997 - Annex I vs Non-Annex I Parties, Clean Development Mechanism / CDM, Common But Differentiated Responsibilities and Respective Capabilities / CBDR-RC; Paris Agreement 2015 / COP21 - Nationally Determined Contributions / NDCs, Global Stocktake / GST, Long-Term Low Emission Development Strategies / LT-LEDS; Glasgow COP26 - India''s Panchamrit Targets: Net-Zero by 2070, 500 GW Non-fossil Capacity, Mission LiFE; Sharm El-Sheikh COP27 & Dubai COP28 - Loss and Damage Fund, Global Renewables and Energy Efficiency Pledge)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['International', 'Climate', 'Architecture', 'Treaties', 'United', 'Nations', 'Framework', 'Convention', 'Change', 'UNFCCC', '1992', 'Earth', 'Summit', 'Kyoto', 'Protocol', '1997', 'Annex', 'Non', 'Parties', 'Clean', 'Development', 'Mechanism', 'CDM', 'Common', 'But', 'Differentiated', 'Responsibilities', 'Respective', 'Capabilities', 'CBDR', 'Paris', 'Agreement', '2015', 'COP21', 'Nationally', 'Determined', 'Contributions', 'NDCs', 'Global', 'Stocktake', 'GST', 'Long', 'Term', 'Low', 'Emission', 'Strategies', 'LEDS', 'Glasgow', 'COP26', 'India''s', 'Panchamrit', 'Targets', 'Net', 'Zero', '2070', '500', 'fossil', 'Capacity', 'Mission', 'LiFE', 'Sharm', 'Sheikh', 'COP27', 'Dubai', 'COP28', 'Loss', 'Damage', 'Fund', 'Renewables', 'Energy', 'Efficiency', 'Pledge']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.carbon_markets_economic_instruments', 'carbon_markets_economic_instruments', 'Carbon Markets & Economic Instruments (Carbon Pricing - Carbon Tax vs Cap-and-Trade Systems; Carbon Credits & Offsets, Article 6 of Paris Agreement / Article 6.2 Bilateral vs Article 6.4 Multilateral Mechanism; Carbon Credit Trading Scheme / CCTS in India under Energy Conservation Amendment Act 2022; EU Carbon Border Adjustment Mechanism / CBAM & Impact on Exports)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Carbon', 'Markets', 'Economic', 'Instruments', 'Pricing', 'Tax', 'Cap', 'Trade', 'Systems', 'Credits', 'Offsets', 'Article', 'Paris', 'Agreement', '6.2', 'Bilateral', '6.4', 'Multilateral', 'Mechanism', 'Credit', 'Trading', 'Scheme', 'CCTS', 'India', 'Energy', 'Conservation', 'Amendment', 'Act', '2022', 'Border', 'Adjustment', 'CBAM', 'Impact', 'Exports']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.multilateral_environmental_agreements_meas', 'multilateral_environmental_agreements_meas', 'Multilateral Environmental Agreements / MEAs (Chemical & Hazardous Waste Conventions - Stockholm Convention on Persistent Organic Pollutants / POPs / Dirty Dozen, Basel Convention on Transboundary Movement of Hazardous Wastes, Rotterdam Convention on Prior Informed Consent / PIC, Minamata Convention on Mercury; Ozone Layer Protection - Vienna Convention 1985, Montreal Protocol 1987 & Kigali Amendment 2016 / HFC Phase-down; Wildlife & Habitat Conventions - CITES / Convention on International Trade in Endangered Species, CMS / Bonn Convention on Migratory Species, International Whaling Commission)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Multilateral', 'Environmental', 'Agreements', 'MEAs', 'Chemical', 'Hazardous', 'Waste', 'Conventions', 'Stockholm', 'Convention', 'Persistent', 'Organic', 'Pollutants', 'POPs', 'Dirty', 'Dozen', 'Basel', 'Transboundary', 'Movement', 'Wastes', 'Rotterdam', 'Prior', 'Informed', 'Consent', 'PIC', 'Minamata', 'Mercury', 'Ozone', 'Layer', 'Protection', 'Vienna', '1985', 'Montreal', 'Protocol', '1987', 'Kigali', 'Amendment', '2016', 'HFC', 'Phase', 'down', 'Wildlife', 'Habitat', 'CITES', 'International', 'Trade', 'Endangered', 'Species', 'CMS', 'Bonn', 'Migratory', 'Whaling', 'Commission']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.core_environmental_legislation', 'core_environmental_legislation', 'Core Environmental Legislation (Wildlife Protection Act 1972 & Wildlife Protection Amendment Act 2022 - Rationalisation of Schedules from VI to IV, CITES Appendices Integration; Water Prevention and Control of Pollution Act 1974 & 2024 Amendment; Air Prevention and Control of Pollution Act 1981; Environment Protection Act 1986 / Umbrella Legislation Post-Bhopal Gas Tragedy; Forest Conservation Act 1980 & Van Sanrakshan Evam Samvardhan Adhiniyam 2023 / Forest Amendment Act; Biological Diversity Act 2002 & 2023 Amendment - Access and Benefit Sharing / ABS Mechanism; Forest Rights Act / FRA 2006 - Individual Forest Rights / IFR & Community Forest Rights / CFR)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Core', 'Environmental', 'Legislation', 'Wildlife', 'Protection', 'Act', '1972', 'Amendment', '2022', 'Rationalisation', 'Schedules', 'CITES', 'Appendices', 'Integration', 'Water', 'Prevention', 'Control', 'Pollution', '1974', '2024', 'Air', '1981', 'Environment', '1986', 'Umbrella', 'Post', 'Bhopal', 'Gas', 'Tragedy', 'Forest', 'Conservation', '1980', 'Van', 'Sanrakshan', 'Evam', 'Samvardhan', 'Adhiniyam', '2023', 'Biological', 'Diversity', '2002', 'Access', 'Benefit', 'Sharing', 'ABS', 'Mechanism', 'Rights', 'FRA', '2006', 'Individual', 'IFR', 'Community', 'CFR']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.environmental_impact_assessment_regulatory_processes', 'environmental_impact_assessment_regulatory_processes', 'Environmental Impact Assessment & Regulatory Processes (Environmental Impact Assessment / EIA Notification 2006 & 2020 Draft Rules; Four Stages of EIA - Screening, Scoping, Public Consultation, Appraisal; Category A / Central MoEFCC vs Category B / State SEIAA Projects; Coastal Regulation Zone / CRZ Notifications - CRZ I, II, III, IV Ecosystem Zonation)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Environmental', 'Impact', 'Assessment', 'Regulatory', 'Processes', 'EIA', 'Notification', '2006', '2020', 'Draft', 'Rules', 'Four', 'Stages', 'Screening', 'Scoping', 'Public', 'Consultation', 'Appraisal', 'Category', 'Central', 'MoEFCC', 'State', 'SEIAA', 'Projects', 'Coastal', 'Regulation', 'Zone', 'CRZ', 'Notifications', 'III', 'Ecosystem', 'Zonation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.environmental_institutions_statutory_bodies', 'environmental_institutions_statutory_bodies', 'Environmental Institutions & Statutory Bodies (Ministry of Environment, Forest and Climate Change / MoEFCC; Central Pollution Control Board / CPCB & State Pollution Control Boards / SPCBs; National Biodiversity Authority / NBA, State Biodiversity Boards / SBBs & Biodiversity Management Committees / BMCs; National Green Tribunal / NGT Act 2010 - Jurisdiction, Principles of Natural Justice, Polluter Pays Principle & Precautionary Principle; National Tiger Conservation Authority / NTCA; Wildlife Crime Control Bureau / WCCB; Genetic Engineering Appraisal Committee / GEAC; Compensatory Afforestation Fund Management and Planning Authority / CAMPA Act 2016)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Environmental', 'Institutions', 'Statutory', 'Bodies', 'Ministry', 'Environment', 'Forest', 'Climate', 'Change', 'MoEFCC', 'Central', 'Pollution', 'Control', 'Board', 'CPCB', 'State', 'Boards', 'SPCBs', 'National', 'Biodiversity', 'Authority', 'NBA', 'SBBs', 'Management', 'Committees', 'BMCs', 'Green', 'Tribunal', 'NGT', 'Act', '2010', 'Jurisdiction', 'Principles', 'Natural', 'Justice', 'Polluter', 'Pays', 'Principle', 'Precautionary', 'Tiger', 'Conservation', 'NTCA', 'Wildlife', 'Crime', 'Bureau', 'WCCB', 'Genetic', 'Engineering', 'Appraisal', 'Committee', 'GEAC', 'Compensatory', 'Afforestation', 'Fund', 'Planning', 'CAMPA', '2016']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india.geophysical_hazards', 'geophysical_hazards', 'Geophysical Hazards (Earthquakes - Seismic Zonation of India: Zone II to Zone V / High Seismic Vulnerability of Himalayas, Liquefaction, Bureau of Indian Standards / BIS Codes; Tsunamis - Subduction Zone Earthquakes, Early Warning Systems / INCOIS; Landslides - Western Ghats & Himalayan Vulnerability, National Landslide Susceptibility Mapping, Slope Stabilisation Techniques)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Geophysical', 'Hazards', 'Earthquakes', 'Seismic', 'Zonation', 'India', 'Zone', 'High', 'Vulnerability', 'Himalayas', 'Liquefaction', 'Bureau', 'Indian', 'Standards', 'BIS', 'Codes', 'Tsunamis', 'Subduction', 'Early', 'Warning', 'Systems', 'INCOIS', 'Landslides', 'Western', 'Ghats', 'Himalayan', 'National', 'Landslide', 'Susceptibility', 'Mapping', 'Slope', 'Stabilisation', 'Techniques']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india.hydrometeorological_hazards', 'hydrometeorological_hazards', 'Hydrometeorological Hazards (Floods - Brahmaputra & Gangetic Basin Inundations, River Bank Erosion, Structural vs Non-Structural Mitigation; Urban Flooding - Encroachment of Wetlands, Concretisation, Stormwater Drainage Deficits / Chennai, Mumbai, Bengaluru Floods; Cyclones - Bay of Bengal vs Arabian Sea Cyclones, Storm Surges, National Cyclone Risk Mitigation Project / NCRMP; Droughts - Meteorological, Hydrological, Agricultural & Socio-Economic Droughts, Drought Prone Areas Programme / DPAP; Heatwaves & Coldwaves - IMD Criteria, Urban Heat Islands, Heat Action Plans / HAPs; Glacial Lake Outburst Floods / GLOFs & Cloudbursts - Himalayan Cryosphere Degradation, Early Warning Sensor Systems)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Hydrometeorological', 'Hazards', 'Floods', 'Brahmaputra', 'Gangetic', 'Basin', 'Inundations', 'River', 'Bank', 'Erosion', 'Structural', 'Non', 'Mitigation', 'Urban', 'Flooding', 'Encroachment', 'Wetlands', 'Concretisation', 'Stormwater', 'Drainage', 'Deficits', 'Chennai', 'Mumbai', 'Bengaluru', 'Cyclones', 'Bay', 'Bengal', 'Arabian', 'Sea', 'Storm', 'Surges', 'National', 'Cyclone', 'Risk', 'Project', 'NCRMP', 'Droughts', 'Meteorological', 'Hydrological', 'Agricultural', 'Socio', 'Economic', 'Drought', 'Prone', 'Areas', 'Programme', 'DPAP', 'Heatwaves', 'Coldwaves', 'IMD', 'Criteria', 'Heat', 'Islands', 'Action', 'Plans', 'HAPs', 'Glacial', 'Lake', 'Outburst', 'GLOFs', 'Cloudbursts', 'Himalayan', 'Cryosphere', 'Degradation', 'Early', 'Warning', 'Sensor', 'Systems']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india.anthropogenic_technological_hazards', 'anthropogenic_technological_hazards', 'Anthropogenic & Technological Hazards (Industrial & Chemical Disasters - Toxic Gas Leaks / Bhopal Gas Disaster 1984, Petroleum Depots Fires; Nuclear Hazards - Nuclear Plant Safety, Radiation Leaks; Dam Failures & Breakages - Dam Safety Act 2021; Forest Fires - Controlled Burning, Sentinel Satellite Fire Alerts / Forest Survey of India; Biological Disasters & Epidemics - Public Health Emergency Framework)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.hazard_profiles_disaster_vulnerability_in_india']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Anthropogenic', 'Technological', 'Hazards', 'Industrial', 'Chemical', 'Disasters', 'Toxic', 'Gas', 'Leaks', 'Bhopal', 'Disaster', '1984', 'Petroleum', 'Depots', 'Fires', 'Nuclear', 'Plant', 'Safety', 'Radiation', 'Dam', 'Failures', 'Breakages', 'Act', '2021', 'Forest', 'Controlled', 'Burning', 'Sentinel', 'Satellite', 'Fire', 'Alerts', 'Survey', 'India', 'Biological', 'Epidemics', 'Public', 'Health', 'Emergency', 'Framework']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.institutional_legal_operational_framework.disaster_management_act_2005', 'disaster_management_act_2005', 'Disaster Management Act 2005 (Statutory Framework, Shift from Relief-Centric Reactive Approach to Proactive Prevention & Mitigation)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.institutional_legal_operational_framework',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.institutional_legal_operational_framework']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Disaster', 'Management', 'Act', '2005', 'Statutory', 'Framework', 'Shift', 'Relief', 'Centric', 'Reactive', 'Approach', 'Proactive', 'Prevention', 'Mitigation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.institutional_legal_operational_framework.three-tier_institutional_architecture', 'three-tier_institutional_architecture', 'Three-Tier Institutional Architecture (National Level - National Disaster Management Authority / NDMA chaired by Prime Minister, National Executive Committee / NEC; State Level - State Disaster Management Authority / SDMA chaired by Chief Minister; District Level - District Disaster Management Authority / DDMA co-chaired by District Magistrate / Collector & Zilla Parishad Chairperson)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.institutional_legal_operational_framework',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.institutional_legal_operational_framework']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Three', 'Tier', 'Institutional', 'Architecture', 'National', 'Level', 'Disaster', 'Management', 'Authority', 'NDMA', 'chaired', 'Prime', 'Minister', 'Executive', 'Committee', 'NEC', 'State', 'SDMA', 'Chief', 'District', 'DDMA', 'Magistrate', 'Collector', 'Zilla', 'Parishad', 'Chairperson']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.institutional_legal_operational_framework.operational_capacity_building_agencies', 'operational_capacity_building_agencies', 'Operational & Capacity Building Agencies (National Disaster Response Force / NDRF - Specialised Multi-disciplinary Force, Standard Operating Procedures; State Disaster Response Force / SDRF; National Institute of Disaster Management / NIDM - Human Resource Development, Research, Capacity Building; Civil Defence & Home Guards; Aapda Mitra Scheme / Community Volunteer Training)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.institutional_legal_operational_framework',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.institutional_legal_operational_framework']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Operational', 'Capacity', 'Building', 'Agencies', 'National', 'Disaster', 'Response', 'Force', 'NDRF', 'Specialised', 'Multi', 'disciplinary', 'Standard', 'Operating', 'Procedures', 'State', 'SDRF', 'Institute', 'Management', 'NIDM', 'Human', 'Resource', 'Development', 'Research', 'Civil', 'Defence', 'Home', 'Guards', 'Aapda', 'Mitra', 'Scheme', 'Community', 'Volunteer', 'Training']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.institutional_legal_operational_framework.early_warning_infrastructure_forecasting', 'early_warning_infrastructure_forecasting', 'Early Warning Infrastructure & Forecasting (India Meteorological Department / IMD - Doppler Weather Radars, Colour-Coded Weather Warnings: Green, Yellow, Orange, Red; Indian National Centre for Ocean Information Services / INCOIS - Tsunami & Ocean State Warning; Central Water Commission / CWC - Flood Forecasting Stations; Indian Space Research Organisation / ISRO - Disaster Management Support Programme)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.institutional_legal_operational_framework',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.institutional_legal_operational_framework']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Early', 'Warning', 'Infrastructure', 'Forecasting', 'India', 'Meteorological', 'Department', 'IMD', 'Doppler', 'Weather', 'Radars', 'Colour', 'Coded', 'Warnings', 'Green', 'Yellow', 'Orange', 'Red', 'Indian', 'National', 'Centre', 'Ocean', 'Information', 'Services', 'INCOIS', 'Tsunami', 'State', 'Central', 'Water', 'Commission', 'CWC', 'Flood', 'Stations', 'Space', 'Research', 'Organisation', 'ISRO', 'Disaster', 'Management', 'Support', 'Programme']::text[],
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
        'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions.global_frameworks_protocols', 'global_frameworks_protocols', 'Global Frameworks & Protocols (Yokohama Strategy 1994, Hyogo Framework for Action 2005–2015; Sendai Framework for Disaster Risk Reduction 2015–2030 - Four Priorities for Action: Understanding Disaster Risk, Strengthening Disaster Risk Governance, Investing in Disaster Risk Reduction for Resilience, Enhancing Disaster Preparedness for Effective Response and to ''Build Back Better'')', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Global', 'Frameworks', 'Protocols', 'Yokohama', 'Strategy', '1994', 'Hyogo', 'Framework', 'Action', '2005–2015', 'Sendai', 'Disaster', 'Risk', 'Reduction', '2015–2030', 'Four', 'Priorities', 'Understanding', 'Strengthening', 'Governance', 'Investing', 'Resilience', 'Enhancing', 'Preparedness', 'Effective', 'Response', 'Build', 'Back', 'Better']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions.prime_ministers_10-point_agenda_on_drr', 'prime_ministers_10-point_agenda_on_drr', 'Prime Minister''s 10-Point Agenda on DRR (Integration of DRR into Development Planning, Disaster Risk Insurance, Women''s Leadership in Disaster Management, Global Mapping of Disaster Risks, Leveraging Technology, Network of Universities, Social Media Utilities)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Prime', 'Minister''s', 'Point', 'Agenda', 'DRR', 'Integration', 'Development', 'Planning', 'Disaster', 'Risk', 'Insurance', 'Women''s', 'Leadership', 'Management', 'Global', 'Mapping', 'Risks', 'Leveraging', 'Technology', 'Network', 'Universities', 'Social', 'Media', 'Utilities']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions.disaster_resilient_infrastructure_global_alliances', 'disaster_resilient_infrastructure_global_alliances', 'Disaster Resilient Infrastructure & Global Alliances (Coalition for Disaster Resilient Infrastructure / CDRI - Global Initiative Launched by India; Infrastructure for Resilient Island States / IRIS; Disaster Resilient Housing, Retrofitting Infrastructure; Climate Change Adaptation / CCA & DRR Synergy)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Disaster', 'Resilient', 'Infrastructure', 'Global', 'Alliances', 'Coalition', 'CDRI', 'Initiative', 'Launched', 'India', 'Island', 'States', 'IRIS', 'Housing', 'Retrofitting', 'Climate', 'Change', 'Adaptation', 'CCA', 'DRR', 'Synergy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions.financial_architecture_for_disaster_management', 'financial_architecture_for_disaster_management', 'Financial Architecture for Disaster Management (National Disaster Response Fund / NDRF & National Disaster Mitigation Fund / NDMF under 15th Finance Commission Recommendations; State Disaster Response Fund / SDRF & State Disaster Mitigation Fund / SDMF; Parametric Insurance & Catastrophe Bonds)', 3,
        'Topic', 'Environment, Ecology & Disaster Management', 'environment_ecology_disaster_management', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions',
        ARRAY[]::text[], ARRAY['environment_ecology_disaster_management', 'environment_ecology_disaster_management.risk_reduction_resilience_global_conventions']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Financial', 'Architecture', 'Disaster', 'Management', 'National', 'Response', 'Fund', 'NDRF', 'Mitigation', 'NDMF', '15th', 'Finance', 'Commission', 'Recommendations', 'State', 'SDRF', 'SDMF', 'Parametric', 'Insurance', 'Catastrophe', 'Bonds']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.space_technology_astronomy.indian_space_programme_isro_missions', 'indian_space_programme_isro_missions', 'Indian Space Programme & ISRO Missions (Lunar Exploration - Chandrayaan-1, 2, 3, LuPEX; Planetary & Solar Missions - Mangalyaan / MOM, Aditya-L1, Shukrayaan; Human Spaceflight Programme - Gaganyaan, Bharatiya Antariksha Station; Space Astronomy Observatories - AstroSat, XPoSat)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.space_technology_astronomy',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.space_technology_astronomy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Space', 'Programme', 'ISRO', 'Missions', 'Lunar', 'Exploration', 'Chandrayaan', 'LuPEX', 'Planetary', 'Solar', 'Mangalyaan', 'MOM', 'Aditya', 'Shukrayaan', 'Human', 'Spaceflight', 'Gaganyaan', 'Bharatiya', 'Antariksha', 'Station', 'Astronomy', 'Observatories', 'AstroSat', 'XPoSat']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.space_technology_astronomy.launch_vehicles_propulsion_systems', 'launch_vehicles_propulsion_systems', 'Launch Vehicles & Propulsion Systems (Historical Launchers - SLV-3, ASLV; Operational Workhorses - PSLV, GSLV Mk II, LVM3 / GSLV Mk III, SSLV; Next-Gen Propulsion & Reusable Tech - RLV-TD, NGLV, Scramjet Engine Technology)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.space_technology_astronomy',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.space_technology_astronomy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Launch', 'Vehicles', 'Propulsion', 'Systems', 'Historical', 'Launchers', 'SLV', 'ASLV', 'Operational', 'Workhorses', 'PSLV', 'GSLV', 'LVM3', 'III', 'SSLV', 'Next', 'Gen', 'Reusable', 'Tech', 'RLV', 'NGLV', 'Scramjet', 'Engine', 'Technology']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.space_technology_astronomy.orbits_satellite_navigation_applications', 'orbits_satellite_navigation_applications', 'Orbits, Satellite Navigation & Applications (Satellite Orbits - LEO, MEO, GEO/GSO, Sun-Synchronous Orbit, Molniya Orbit; Orbital Mechanics & Transfer Dynamics - Lagrange Points L1–L5, Gravity Assist, Hohmann Transfer; Regional & Global Navigation Systems - NavIC / IRNSS, GAGAN, GPS, GLONASS, Galileo)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.space_technology_astronomy',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.space_technology_astronomy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Orbits', 'Satellite', 'Navigation', 'Applications', 'LEO', 'MEO', 'GEO/GSO', 'Sun', 'Synchronous', 'Orbit', 'Molniya', 'Orbital', 'Mechanics', 'Transfer', 'Dynamics', 'Lagrange', 'Points', 'L1–L5', 'Gravity', 'Assist', 'Hohmann', 'Regional', 'Global', 'Systems', 'NavIC', 'IRNSS', 'GAGAN', 'GPS', 'GLONASS', 'Galileo']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.space_technology_astronomy.deep_space_observatories_cosmology_astrophysics', 'deep_space_observatories_cosmology_astrophysics', 'Deep Space Observatories, Cosmology & Astrophysics (Space & Ground Telescopes - James Webb Space Telescope, Hubble, Thirty Meter Telescope, Square Kilometre Array; Cosmic Phenomena & Astrophysics - Black Holes, Dark Matter & Dark Energy, Gravitational Waves & LIGO India, Exoplanets, Solar Flares & Coronal Mass Ejections)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.space_technology_astronomy',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.space_technology_astronomy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Deep', 'Space', 'Observatories', 'Cosmology', 'Astrophysics', 'Ground', 'Telescopes', 'James', 'Webb', 'Telescope', 'Hubble', 'Thirty', 'Meter', 'Square', 'Kilometre', 'Array', 'Cosmic', 'Phenomena', 'Black', 'Holes', 'Dark', 'Matter', 'Energy', 'Gravitational', 'Waves', 'LIGO', 'India', 'Exoplanets', 'Solar', 'Flares', 'Coronal', 'Mass', 'Ejections']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.space_technology_astronomy.space_governance_commercialization_space_environment', 'space_governance_commercialization_space_environment', 'Space Governance, Commercialization & Space Environment (Space Debris & Sustainability - Kessler Syndrome, Project NETRA, IADC Guidelines; Space Law & Regulatory Bodies - Outer Space Treaty 1967, Artemis Accords, IN-SPACe, NewSpace India Limited)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.space_technology_astronomy',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.space_technology_astronomy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Space', 'Governance', 'Commercialization', 'Environment', 'Debris', 'Sustainability', 'Kessler', 'Syndrome', 'Project', 'NETRA', 'IADC', 'Guidelines', 'Law', 'Regulatory', 'Bodies', 'Outer', 'Treaty', '1967', 'Artemis', 'Accords', 'SPACe', 'NewSpace', 'India', 'Limited']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.biotechnology_health_life_sciences.genomics_genetics_gene_editing', 'genomics_genetics_gene_editing', 'Genomics, Genetics & Gene Editing (Molecular Biology Foundations - DNA, RNA, Plasmids, Chromosomes; Gene Editing Tools & Techniques - CRISPR-Cas9, TALENs, Zinc Finger Nucleases; Genome Sequencing Initiatives - Human Genome Project, Genome India Project, Earth BioGenome; Advanced Genetic Therapies - Gene Therapy, Somatic vs Germline Editing, Three-Parent Babies / Mitochondrial Replacement Therapy)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Genomics', 'Genetics', 'Gene', 'Editing', 'Molecular', 'Biology', 'Foundations', 'DNA', 'RNA', 'Plasmids', 'Chromosomes', 'Tools', 'Techniques', 'CRISPR', 'Cas9', 'TALENs', 'Zinc', 'Finger', 'Nucleases', 'Genome', 'Sequencing', 'Initiatives', 'Human', 'Project', 'India', 'Earth', 'BioGenome', 'Advanced', 'Genetic', 'Therapies', 'Therapy', 'Somatic', 'Germline', 'Three', 'Parent', 'Babies', 'Mitochondrial', 'Replacement']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.biotechnology_health_life_sciences.cell_biology_reproductive_technology', 'cell_biology_reproductive_technology', 'Cell Biology & Reproductive Technology (Stem Cell Science - Embryonic Stem Cells, Induced Pluripotent Stem Cells / iPSCs, Cord Blood Banking; Assisted Reproductive Technologies - In Vitro Fertilization / IVF, Surrogacy Regulation, Amniocentesis, Pre-implantation Genetic Diagnosis)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Cell', 'Biology', 'Reproductive', 'Technology', 'Stem', 'Science', 'Embryonic', 'Cells', 'Induced', 'Pluripotent', 'iPSCs', 'Cord', 'Blood', 'Banking', 'Assisted', 'Technologies', 'Vitro', 'Fertilization', 'IVF', 'Surrogacy', 'Regulation', 'Amniocentesis', 'Pre', 'implantation', 'Genetic', 'Diagnosis']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.biotechnology_health_life_sciences.immunology_infectious_diseases_public_health', 'immunology_infectious_diseases_public_health', 'Immunology, Infectious Diseases & Public Health (Pathogens & Vectors - Viruses, Bacteria, Fungi, Protozoa, Prions; Zoonotic & Epidemic Diseases - COVID-19 / SARS-CoV-2, Dengue, Zika, Mpox, Ebola, Nipah, Malaria, Tuberculosis; Public Health Crises & Global Frameworks - Antimicrobial Resistance / AMR, Superbugs, One Health Approach, WHO Priority Pathogens)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Immunology', 'Infectious', 'Diseases', 'Public', 'Health', 'Pathogens', 'Vectors', 'Viruses', 'Bacteria', 'Fungi', 'Protozoa', 'Prions', 'Zoonotic', 'Epidemic', 'COVID', 'SARS', 'CoV', 'Dengue', 'Zika', 'Mpox', 'Ebola', 'Nipah', 'Malaria', 'Tuberculosis', 'Crises', 'Global', 'Frameworks', 'Antimicrobial', 'Resistance', 'AMR', 'Superbugs', 'One', 'Approach', 'WHO', 'Priority']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.biotechnology_health_life_sciences.vaccine_platforms_advanced_therapeutics', 'vaccine_platforms_advanced_therapeutics', 'Vaccine Platforms & Advanced Therapeutics (Vaccine Technologies - mRNA Vaccines, Viral Vector Vaccines, Inactivated/Attenuated, Protein Subunit, DNA Vaccines; Targeted Immunotherapies - Monoclonal Antibodies, CAR-T Cell Therapy, Cancer Vaccines)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Vaccine', 'Platforms', 'Advanced', 'Therapeutics', 'Technologies', 'mRNA', 'Vaccines', 'Viral', 'Vector', 'Inactivated/Attenuated', 'Protein', 'Subunit', 'DNA', 'Targeted', 'Immunotherapies', 'Monoclonal', 'Antibodies', 'CAR', 'Cell', 'Therapy', 'Cancer']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.biotechnology_health_life_sciences.agricultural_biotechnology_bio-economy', 'agricultural_biotechnology_bio-economy', 'Agricultural Biotechnology & Bio-Economy (Genetically Modified Organisms - Bt Cotton, GM Mustard / DMH-11, Golden Rice, Transgenic Crops; Advanced Crop Improvement - Tissue Culture, Marker-Assisted Selection, RNA Interference, Bio-fortification)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.biotechnology_health_life_sciences']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Agricultural', 'Biotechnology', 'Bio', 'Economy', 'Genetically', 'Modified', 'Organisms', 'Cotton', 'Mustard', 'DMH', 'Golden', 'Rice', 'Transgenic', 'Crops', 'Advanced', 'Crop', 'Improvement', 'Tissue', 'Culture', 'Marker', 'Assisted', 'Selection', 'RNA', 'Interference', 'fortification']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.information_communication_technology_ai_cyber_security.artificial_intelligence_robotics', 'artificial_intelligence_robotics', 'Artificial Intelligence & Robotics (Core AI Paradigms - Machine Learning, Deep Learning, Neural Networks, Computer Vision, Natural Language Processing; Generative AI & Frontier Models - Large Language Models / LLMs, Multimodal AI, Deepfakes, Synthetic Media; Robotics & Autonomous Systems - Humanoid Robotics, Swarm Robotics, Autonomous Vehicles; AI Ethics & Global Governance - AI Bias, Responsible AI, Bletchley Declaration, IndiaAI Mission)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Artificial', 'Intelligence', 'Robotics', 'Core', 'Paradigms', 'Machine', 'Learning', 'Deep', 'Neural', 'Networks', 'Computer', 'Vision', 'Natural', 'Language', 'Processing', 'Generative', 'Frontier', 'Models', 'Large', 'LLMs', 'Multimodal', 'Deepfakes', 'Synthetic', 'Media', 'Autonomous', 'Systems', 'Humanoid', 'Swarm', 'Vehicles', 'Ethics', 'Global', 'Governance', 'Bias', 'Responsible', 'Bletchley', 'Declaration', 'IndiaAI', 'Mission']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.information_communication_technology_ai_cyber_security.telecommunications_wireless_infrastructure', 'telecommunications_wireless_infrastructure', 'Telecommunications & Wireless Infrastructure (Cellular Network Evolution - 1G to 5G Architecture, 6G Research, Open RAN; Short & Long-Range Wireless Technologies - Wi-Fi 6/7, Li-Fi, Bluetooth, NFC, RFID, Optical Fiber Infrastructure)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Telecommunications', 'Wireless', 'Infrastructure', 'Cellular', 'Network', 'Evolution', 'Architecture', 'Research', 'Open', 'RAN', 'Short', 'Long', 'Range', 'Technologies', '6/7', 'Bluetooth', 'NFC', 'RFID', 'Optical', 'Fiber']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.information_communication_technology_ai_cyber_security.high-performance_quantum_computing', 'high-performance_quantum_computing', 'High-Performance & Quantum Computing (High-Performance Computing - Supercomputing Architecture, National Supercomputing Mission, PARAM Siddhi, Pratyush, Mihir; Quantum Information Science - Qubits, Quantum Entanglement, Superposition, National Quantum Mission; Semiconductor Ecosystem - Microprocessors - Shakti & Vega, Wafer Fabrication, India Semiconductor Mission / ISM)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['High', 'Performance', 'Quantum', 'Computing', 'Supercomputing', 'Architecture', 'National', 'Mission', 'PARAM', 'Siddhi', 'Pratyush', 'Mihir', 'Information', 'Science', 'Qubits', 'Entanglement', 'Superposition', 'Semiconductor', 'Ecosystem', 'Microprocessors', 'Shakti', 'Vega', 'Wafer', 'Fabrication', 'India', 'ISM']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.information_communication_technology_ai_cyber_security.emerging_web_frameworks_distributed_ledger_technology', 'emerging_web_frameworks_distributed_ledger_technology', 'Emerging Web Frameworks & Distributed Ledger Technology (Blockchain & Web 3.0 - Decentralized Architecture, Cryptocurrencies, Central Bank Digital Currency / CBDC, Smart Contracts; Advanced Digital Paradigms - Internet of Things / IoT, Edge Computing, Big Data Analytics, Spatial Computing / Metaverse)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Emerging', 'Web', 'Frameworks', 'Distributed', 'Ledger', 'Technology', 'Blockchain', '3.0', 'Decentralized', 'Architecture', 'Cryptocurrencies', 'Central', 'Bank', 'Digital', 'Currency', 'CBDC', 'Smart', 'Contracts', 'Advanced', 'Paradigms', 'Internet', 'Things', 'IoT', 'Edge', 'Computing', 'Big', 'Data', 'Analytics', 'Spatial', 'Metaverse']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.information_communication_technology_ai_cyber_security.cyber_security_threats_digital_governance', 'cyber_security_threats_digital_governance', 'Cyber Security, Threats & Digital Governance (Vector Threats & Exploits - Malware, Ransomware, Phishing, Zero-Day Exploits, Pegasus / Spyware; Critical Information Infrastructure & Defense - CERT-In, NCIIPC, Cyber Swachhta Kendra; Digital Privacy & Legislation - Digital Personal Data Protection Act 2023, IT Act 2000)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.information_communication_technology_ai_cyber_security']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Cyber', 'Security', 'Threats', 'Digital', 'Governance', 'Vector', 'Exploits', 'Malware', 'Ransomware', 'Phishing', 'Zero', 'Day', 'Pegasus', 'Spyware', 'Critical', 'Information', 'Infrastructure', 'Defense', 'CERT', 'NCIIPC', 'Swachhta', 'Kendra', 'Privacy', 'Legislation', 'Personal', 'Data', 'Protection', 'Act', '2023', '2000']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.defence_technology.missile_systems_artillery', 'missile_systems_artillery', 'Missile Systems & Artillery (Integrated Guided Missile Development Programme - IGMDP: Prithvi, Agni Series I–V, Trishul, Akash, Nag; Cruise & Hypersonic Systems - BrahMos, Nirbhay, Hypersonic Technology Demonstrator Vehicle / HSTDV; Air Defence & Artillery - S-400 Triumf, VSHORADS, Ballistic Missile Defence / BMD, Pinaka Rocket System)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.defence_technology',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.defence_technology']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Missile', 'Systems', 'Artillery', 'Integrated', 'Guided', 'Development', 'Programme', 'IGMDP', 'Prithvi', 'Agni', 'Series', 'I–V', 'Trishul', 'Akash', 'Nag', 'Cruise', 'Hypersonic', 'BrahMos', 'Nirbhay', 'Technology', 'Demonstrator', 'Vehicle', 'HSTDV', 'Air', 'Defence', '400', 'Triumf', 'VSHORADS', 'Ballistic', 'BMD', 'Pinaka', 'Rocket', 'System']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.defence_technology.naval_warfare_submarines', 'naval_warfare_submarines', 'Naval Warfare & Submarines (Submarine Fleet - Project 75 Kalvari-class diesel-electric, Project 75I, Nuclear Submarines - INS Arihant & INS Arighat; Naval Aviation & Surface Combatants - Aircraft Carriers - INS Vikrant & INS Vikramaditya, Guided Missile Destroyers)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.defence_technology',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.defence_technology']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Naval', 'Warfare', 'Submarines', 'Submarine', 'Fleet', 'Project', 'Kalvari', 'class', 'diesel', 'electric', '75I', 'Nuclear', 'INS', 'Arihant', 'Arighat', 'Aviation', 'Surface', 'Combatants', 'Aircraft', 'Carriers', 'Vikrant', 'Vikramaditya', 'Guided', 'Missile', 'Destroyers']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.defence_technology.military_aviation_unmanned_aerial_systems', 'military_aviation_unmanned_aerial_systems', 'Military Aviation & Unmanned Aerial Systems (UAVs) (Combat Aircraft & Helicopters - Tejas LCA, Advanced Medium Combat Aircraft / AMCA, Rafale, Prachand LCH; Unmanned Aerial Vehicles & Swarms - Rustom, Tapas-BH-201, Ghatak UCAV, Anti-Drone Systems, Swarm Drones)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.defence_technology',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.defence_technology']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Military', 'Aviation', 'Unmanned', 'Aerial', 'Systems', 'UAVs', 'Combat', 'Aircraft', 'Helicopters', 'Tejas', 'LCA', 'Advanced', 'Medium', 'AMCA', 'Rafale', 'Prachand', 'LCH', 'Vehicles', 'Swarms', 'Rustom', 'Tapas', '201', 'Ghatak', 'UCAV', 'Anti', 'Drone', 'Swarm', 'Drones']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.nuclear_technology_energy.nuclear_energy_programme_reactors', 'nuclear_energy_programme_reactors', 'Nuclear Energy Programme & Reactors (India''s Three-Stage Nuclear Power Programme - Stage 1: PHWR & Natural Uranium, Stage 2: Fast Breeder Reactor / PFBR & Plutonium, Stage 3: Thorium-based Reactors; Reactor Installations - Kudankulam, Kakrapar, Kalpakkam / PFBR, KAMINI)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.nuclear_technology_energy',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.nuclear_technology_energy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Nuclear', 'Energy', 'Programme', 'Reactors', 'India''s', 'Three', 'Stage', 'Power', 'PHWR', 'Natural', 'Uranium', 'Fast', 'Breeder', 'Reactor', 'PFBR', 'Plutonium', 'Thorium', 'based', 'Installations', 'Kudankulam', 'Kakrapar', 'Kalpakkam', 'KAMINI']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.nuclear_technology_energy.fundamental_particle_physics_research_facilities', 'fundamental_particle_physics_research_facilities', 'Fundamental Particle Physics & Research Facilities (Nuclear Physics Reactions - Nuclear Fission, Nuclear Fusion, ITER Project, Tokamak; Particle Accelerators & Research - CERN, Large Hadron Collider, Higgs Boson, India-based Neutrino Observatory / INO; Applied Radioisotopes - Nuclear Medicine, Radiation Oncology, Food Irradiation, Industrial Radiography)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.nuclear_technology_energy',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.nuclear_technology_energy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Fundamental', 'Particle', 'Physics', 'Research', 'Facilities', 'Nuclear', 'Reactions', 'Fission', 'Fusion', 'ITER', 'Project', 'Tokamak', 'Accelerators', 'CERN', 'Large', 'Hadron', 'Collider', 'Higgs', 'Boson', 'India', 'based', 'Neutrino', 'Observatory', 'INO', 'Applied', 'Radioisotopes', 'Medicine', 'Radiation', 'Oncology', 'Food', 'Irradiation', 'Industrial', 'Radiography']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.nuclear_technology_energy.international_nuclear_governance_treaties', 'international_nuclear_governance_treaties', 'International Nuclear Governance & Treaties (Global Regulatory Framework - IAEA, Non-Proliferation Treaty / NPT, Comprehensive Nuclear-Test-Ban Treaty / CTBT; Export Control Regimes - Nuclear Suppliers Group / NSG, Missile Technology Control Regime / MTCR, Australia Group, Wassenaar Arrangement)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.nuclear_technology_energy',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.nuclear_technology_energy']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['International', 'Nuclear', 'Governance', 'Treaties', 'Global', 'Regulatory', 'Framework', 'IAEA', 'Non', 'Proliferation', 'Treaty', 'NPT', 'Comprehensive', 'Test', 'Ban', 'CTBT', 'Export', 'Control', 'Regimes', 'Suppliers', 'Group', 'NSG', 'Missile', 'Technology', 'Regime', 'MTCR', 'Australia', 'Wassenaar', 'Arrangement']::text[],
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
        'science_technology_defence.nanoscience_advanced_materials.nanotechnology_applications', 'nanotechnology_applications', 'Nanotechnology Applications (Synthesis & Materials - Nanoparticles, Carbon Nanotubes / CNTs, Quantum Dots, Nano-emulsions; Sectoral Applications - Nano-fertilizers / Nano Urea, Targeted Drug Delivery, Nano-sensors, National Nano Mission)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.nanoscience_advanced_materials',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.nanoscience_advanced_materials']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Nanotechnology', 'Applications', 'Synthesis', 'Materials', 'Nanoparticles', 'Carbon', 'Nanotubes', 'CNTs', 'Quantum', 'Dots', 'Nano', 'emulsions', 'Sectoral', 'fertilizers', 'Urea', 'Targeted', 'Drug', 'Delivery', 'sensors', 'National', 'Mission']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.nanoscience_advanced_materials.advanced_critical_materials', 'advanced_critical_materials', 'Advanced & Critical Materials (Advanced Functional Materials - Graphene, Aerogels, Metamaterials, Superconductors, Shape Memory Alloys; Strategic Critical Minerals - Lithium, Cobalt, Nickel, Rare Earth Permanent Magnets, KABIL Initiative)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.nanoscience_advanced_materials',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.nanoscience_advanced_materials']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Advanced', 'Critical', 'Materials', 'Functional', 'Graphene', 'Aerogels', 'Metamaterials', 'Superconductors', 'Shape', 'Memory', 'Alloys', 'Strategic', 'Minerals', 'Lithium', 'Cobalt', 'Nickel', 'Rare', 'Earth', 'Permanent', 'Magnets', 'KABIL', 'Initiative']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.applied_fundamental_sciences.applied_physics', 'applied_physics', 'Applied Physics (Wave Optics & Radiation - Refraction, Total Internal Reflection, Polarization, Dispersion, Lasers, LED vs OLED vs Sodium Lamps; Electromagnetic Spectrum - Gamma Rays, X-Rays, UV, Visible, Infrared, Microwaves, Radio Waves)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.applied_fundamental_sciences',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.applied_fundamental_sciences']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Applied', 'Physics', 'Wave', 'Optics', 'Radiation', 'Refraction', 'Total', 'Internal', 'Reflection', 'Polarization', 'Dispersion', 'Lasers', 'LED', 'OLED', 'Sodium', 'Lamps', 'Electromagnetic', 'Spectrum', 'Gamma', 'Rays', 'Visible', 'Infrared', 'Microwaves', 'Radio', 'Waves']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.applied_fundamental_sciences.applied_chemistry', 'applied_chemistry', 'Applied Chemistry (Chemical Compounds & Industrial Materials - Acids & Bases, Polymers & Plastics, Surfactants, Food Preservatives; Clean Energy Chemistry - Ethanol Blending / E20, Compressed Bio-Gas / CBG, Green Hydrogen, Fuel Cells, Li-ion Batteries)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.applied_fundamental_sciences',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.applied_fundamental_sciences']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Applied', 'Chemistry', 'Chemical', 'Compounds', 'Industrial', 'Materials', 'Acids', 'Bases', 'Polymers', 'Plastics', 'Surfactants', 'Food', 'Preservatives', 'Clean', 'Energy', 'Ethanol', 'Blending', 'E20', 'Compressed', 'Bio', 'Gas', 'CBG', 'Green', 'Hydrogen', 'Fuel', 'Cells', 'ion', 'Batteries']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'science_technology_defence.applied_fundamental_sciences.applied_biology_human_physiology', 'applied_biology_human_physiology', 'Applied Biology & Human Physiology (Human Systems & Biochemistry - Hormones, Enzymes, Vitamins & Deficiency Diseases, Blood Groups & Transfusion; Plant Biology & Physiology - Photosynthesis, Nitrogen Fixation, Plant Hormones - Auxin, Cytokinin, Gibberellin)', 3,
        'Topic', 'Science, Technology & Defence', 'science_technology_defence', 'science_technology_defence.applied_fundamental_sciences',
        ARRAY[]::text[], ARRAY['science_technology_defence', 'science_technology_defence.applied_fundamental_sciences']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P2, Mains-GS3] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Applied', 'Biology', 'Human', 'Physiology', 'Systems', 'Biochemistry', 'Hormones', 'Enzymes', 'Vitamins', 'Deficiency', 'Diseases', 'Blood', 'Groups', 'Transfusion', 'Plant', 'Photosynthesis', 'Nitrogen', 'Fixation', 'Auxin', 'Cytokinin', 'Gibberellin']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.linkages_between_development_extremism.genesis_ideology_of_left-wing_extremism', 'genesis_ideology_of_left-wing_extremism', 'Genesis & Ideology of Left-Wing Extremism (Naxalbari Uprising 1967 - Charu Majumdar, Kanu Sanyal; CPI / Maoist Formation 2004; Ideology of Protracted People''s War & Overthrow of State; Red Corridor Geography - Dandakaranya Region, Bastar, Malkangiri, Jharkhand, Odisha, Andhra-Odisha Border / AOB)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.linkages_between_development_extremism',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.linkages_between_development_extremism']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Genesis', 'Ideology', 'Left', 'Wing', 'Extremism', 'Naxalbari', 'Uprising', '1967', 'Charu', 'Majumdar', 'Kanu', 'Sanyal', 'CPI', 'Maoist', 'Formation', '2004', 'Protracted', 'People''s', 'War', 'Overthrow', 'State', 'Red', 'Corridor', 'Geography', 'Dandakaranya', 'Region', 'Bastar', 'Malkangiri', 'Jharkhand', 'Odisha', 'Andhra', 'Border', 'AOB']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.linkages_between_development_extremism.root_causes_of_left-wing_extremism', 'root_causes_of_left-wing_extremism', 'Root Causes of Left-Wing Extremism (Agrarian Distress & Feudal Exploitation, Tribal Land Alienation, Displacement due to Mining & Development Projects, Non-implementation of Forest Rights Act / FRA & PESA Act 1996, Mining Royalty Deficits, Governance Deficit & Lack of Basic Infrastructure - Healthcare, Education, Roads)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.linkages_between_development_extremism',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.linkages_between_development_extremism']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Root', 'Causes', 'Left', 'Wing', 'Extremism', 'Agrarian', 'Distress', 'Feudal', 'Exploitation', 'Tribal', 'Land', 'Alienation', 'Displacement', 'due', 'Mining', 'Development', 'Projects', 'Non', 'implementation', 'Forest', 'Rights', 'Act', 'FRA', 'PESA', '1996', 'Royalty', 'Deficits', 'Governance', 'Deficit', 'Lack', 'Basic', 'Infrastructure', 'Healthcare', 'Education', 'Roads']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.linkages_between_development_extremism.multi-pronged_government_counter-lwe_strategy', 'multi-pronged_government_counter-lwe_strategy', 'Multi-Pronged Government Counter-LWE Strategy (Security Measures - Deployment of Central Armed Police Forces / CRPF CoBRA Commandos, Special Operations Group / SOG Greyhounds in Andhra/Telangana; SAMADHAN Doctrine - Smart Leadership, Aggressive Strategy, Motivation and Training, Actionable Intelligence, Dashboard-based KPIs, Harnessing Technology, Action Plan for each Theatre, No Access to Financing; Surrender and Rehabilitation Policies; Development Interventions - Road Requirement Plan / RRP, Mobile Towers Installation in LWE Areas, Eklavya Model Residential Schools / EMRSs, Aspirational Districts Programme, Post Office & Banking Access in Bastar)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.linkages_between_development_extremism',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.linkages_between_development_extremism']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Multi', 'Pronged', 'Government', 'Counter', 'LWE', 'Strategy', 'Security', 'Measures', 'Deployment', 'Central', 'Armed', 'Police', 'Forces', 'CRPF', 'CoBRA', 'Commandos', 'Special', 'Operations', 'Group', 'SOG', 'Greyhounds', 'Andhra/Telangana', 'SAMADHAN', 'Doctrine', 'Smart', 'Leadership', 'Aggressive', 'Motivation', 'Training', 'Actionable', 'Intelligence', 'Dashboard', 'based', 'KPIs', 'Harnessing', 'Technology', 'Action', 'Plan', 'each', 'Theatre', 'Access', 'Financing', 'Surrender', 'Rehabilitation', 'Policies', 'Development', 'Interventions', 'Road', 'Requirement', 'RRP', 'Mobile', 'Towers', 'Installation', 'Areas', 'Eklavya', 'Model', 'Residential', 'Schools', 'EMRSs', 'Aspirational', 'Districts', 'Programme', 'Post', 'Office', 'Banking', 'Bastar']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.terrorism_insurgencies_cross-border_security.cross-border_terrorism_proxy_warfare_in_jammu_kashmir', 'cross-border_terrorism_proxy_warfare_in_jammu_kashmir', 'Cross-Border Terrorism & Proxy Warfare in Jammu & Kashmir (Historical Evolution of Pakistan-sponsored Proxy War; Terrorist Groups - Lashkar-e-Taiba / LeT, Jaish-e-Mohammed / JeM, Hizbul Mujahideen, The Resistance Front / TRF; Shift to Hybrid Terrorism, Sticky Bombs & Targeted Killings; Post-Article 370 Security Paradigm, Counter-Infiltration Grid / Line of Control, Operation All Out; De-radicalisation Programmes & Sports/Skill Engagement Schemes)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.terrorism_insurgencies_cross-border_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.terrorism_insurgencies_cross-border_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Cross', 'Border', 'Terrorism', 'Proxy', 'Warfare', 'Jammu', 'Kashmir', 'Historical', 'Evolution', 'Pakistan', 'sponsored', 'War', 'Terrorist', 'Groups', 'Lashkar', 'Taiba', 'LeT', 'Jaish', 'Mohammed', 'JeM', 'Hizbul', 'Mujahideen', 'Resistance', 'Front', 'TRF', 'Shift', 'Hybrid', 'Sticky', 'Bombs', 'Targeted', 'Killings', 'Post', 'Article', '370', 'Security', 'Paradigm', 'Counter', 'Infiltration', 'Grid', 'Line', 'Control', 'Operation', 'Out', 'radicalisation', 'Programmes', 'Sports/Skill', 'Engagement', 'Schemes']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.terrorism_insurgencies_cross-border_security.insurgency_in_north-east_india', 'insurgency_in_north-east_india', 'Insurgency in North-East India (Historical Drivers - Ethnic Sub-nationalism, Influx of Illegal Immigrants, Porous International Borders, Geographic Isolation; Nagaland Insurgency - Naga National Council / NNC, NSCN-IM vs NSCN-K, Framework Agreement 2015 & Naga Peace Talks; Assam Insurgency - United Liberation Front of Asom / ULFA Pro-talks Accord 2023, Bodo Accords 2020; Manipur Ethnic Conflict & Insurgent Groups - Meitei UNLF, Kuki-Zo Militancy, Suspension of Operations / SoO Agreements; Peace Accords - Bru-Reang Settlement 2020, Karbi Anglong Agreement 2021)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.terrorism_insurgencies_cross-border_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.terrorism_insurgencies_cross-border_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Insurgency', 'North', 'East', 'India', 'Historical', 'Drivers', 'Ethnic', 'Sub', 'nationalism', 'Influx', 'Illegal', 'Immigrants', 'Porous', 'International', 'Borders', 'Geographic', 'Isolation', 'Nagaland', 'Naga', 'National', 'Council', 'NNC', 'NSCN', 'Framework', 'Agreement', '2015', 'Peace', 'Talks', 'Assam', 'United', 'Liberation', 'Front', 'Asom', 'ULFA', 'Pro', 'talks', 'Accord', '2023', 'Bodo', 'Accords', '2020', 'Manipur', 'Conflict', 'Insurgent', 'Groups', 'Meitei', 'UNLF', 'Kuki', 'Militancy', 'Suspension', 'Operations', 'SoO', 'Agreements', 'Bru', 'Reang', 'Settlement', 'Karbi', 'Anglong', '2021']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.terrorism_insurgencies_cross-border_security.religious_political_radicalisation', 'religious_political_radicalisation', 'Religious & Political Radicalisation (Online Radicalisation Models, Lone-Wolf Attacks, ISIS / Al-Qaeda in Indian Subcontinent / AQIS propaganda; Counter-Radicalisation Strategies - Police Community Outreach, Cyber Patrols, Islamic Scholars Collaboration)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.terrorism_insurgencies_cross-border_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.terrorism_insurgencies_cross-border_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Religious', 'Political', 'Radicalisation', 'Online', 'Models', 'Lone', 'Wolf', 'Attacks', 'ISIS', 'Qaeda', 'Indian', 'Subcontinent', 'AQIS', 'propaganda', 'Counter', 'Strategies', 'Police', 'Community', 'Outreach', 'Cyber', 'Patrols', 'Islamic', 'Scholars', 'Collaboration']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.border_management_coastal_security.land_border_security_architecture', 'land_border_security_architecture', 'Land Border Security Architecture (Total Land Borders 15,106.7 km across 7 Countries; Indo-Pak Border - Line of Control / LoC, International Border / IB, Sir Creek Dispute, Tunnels & Drone Infiltration; Indo-China Border - Line of Actual Control / LAC 3,488 km: Western / Ladakh, Middle / Uttarakhand-HP, Eastern / Arunachal Sectors, Infrastructure Build-up / Vibrant Villages Programme; Indo-Bangladesh Border - Enclaves Exchange / 100th Constitutional Amendment Act, Cattle Smuggling, Illegal Migration, Riverine Border Challenges; Indo-Myanmar Border - Free Movement Regime / FMR Review, Kaladan Multi-Modal Transit Transport Project, Insurgent Hideouts; Indo-Nepal & Indo-Bhutan Open Borders - Smuggling of Fake Currency, Narcotics, Human Trafficking)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.border_management_coastal_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.border_management_coastal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Land', 'Border', 'Security', 'Architecture', 'Total', 'Borders', '106.7', 'across', 'Countries', 'Indo', 'Pak', 'Line', 'Control', 'LoC', 'International', 'Sir', 'Creek', 'Dispute', 'Tunnels', 'Drone', 'Infiltration', 'China', 'Actual', 'LAC', '488', 'Western', 'Ladakh', 'Middle', 'Uttarakhand', 'Eastern', 'Arunachal', 'Sectors', 'Infrastructure', 'Build', 'Vibrant', 'Villages', 'Programme', 'Bangladesh', 'Enclaves', 'Exchange', '100th', 'Constitutional', 'Amendment', 'Act', 'Cattle', 'Smuggling', 'Illegal', 'Migration', 'Riverine', 'Challenges', 'Myanmar', 'Free', 'Movement', 'Regime', 'FMR', 'Review', 'Kaladan', 'Multi', 'Modal', 'Transit', 'Transport', 'Project', 'Insurgent', 'Hideouts', 'Nepal', 'Bhutan', 'Open', 'Fake', 'Currency', 'Narcotics', 'Human', 'Trafficking']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.border_management_coastal_security.smart_border_management_technologies', 'smart_border_management_technologies', 'Smart Border Management Technologies (Comprehensive Integrated Border Management System / CIBMS - Thermal Imagers, Underground Seismic Sensors, Fiber-Optic Sensors, Radar, Micro-UAVs; BOLD-QIT Project on Bangladesh Border; Anti-Drone Systems & Jamming Technologies)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.border_management_coastal_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.border_management_coastal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Smart', 'Border', 'Management', 'Technologies', 'Comprehensive', 'Integrated', 'System', 'CIBMS', 'Thermal', 'Imagers', 'Underground', 'Seismic', 'Sensors', 'Fiber', 'Optic', 'Radar', 'Micro', 'UAVs', 'BOLD', 'QIT', 'Project', 'Bangladesh', 'Anti', 'Drone', 'Systems', 'Jamming']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.border_management_coastal_security.coastal_maritime_security_architecture', 'coastal_maritime_security_architecture', 'Coastal & Maritime Security Architecture (7,516.6 km Coastline & Exclusive Economic Zone / EEZ; Post-26/11 Coastal Security Overhaul; Three-Tier Coastal Security Structure - Indian Navy / Deep Sea beyond 12 NM, Indian Coast Guard / ICG / 12 to 200 NM, State Coastal Marine Police / Territorial Waters up to 12 NM; Coastal Surveillance Network - Chain of Static Radars, Automatic Identification System / AIS, National Command Control Communication and Intelligence Network / NC3I Network; Sagar Prahari Bal; Biometric Cards for Fishermen & Vessel Tracking Systems)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.border_management_coastal_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.border_management_coastal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Coastal', 'Maritime', 'Security', 'Architecture', '516.6', 'Coastline', 'Exclusive', 'Economic', 'Zone', 'EEZ', 'Post', '26/11', 'Overhaul', 'Three', 'Tier', 'Structure', 'Indian', 'Navy', 'Deep', 'Sea', 'beyond', 'Coast', 'Guard', 'ICG', '200', 'State', 'Marine', 'Police', 'Territorial', 'Waters', 'Surveillance', 'Network', 'Chain', 'Static', 'Radars', 'Automatic', 'Identification', 'System', 'AIS', 'National', 'Command', 'Control', 'Communication', 'Intelligence', 'NC3I', 'Sagar', 'Prahari', 'Bal', 'Biometric', 'Cards', 'Fishermen', 'Vessel', 'Tracking', 'Systems']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.border_management_coastal_security.island_security_maritime_chokepoints', 'island_security_maritime_chokepoints', 'Island Security & Maritime Chokepoints (Strategic Value of Andaman & Nicobar Islands - Malacca Strait Chokepoint, Joint Services Command at Port Blair; Lakshadweep Islands - Nine Degree Channel Protection)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.border_management_coastal_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.border_management_coastal_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Island', 'Security', 'Maritime', 'Chokepoints', 'Strategic', 'Value', 'Andaman', 'Nicobar', 'Islands', 'Malacca', 'Strait', 'Chokepoint', 'Joint', 'Services', 'Command', 'Port', 'Blair', 'Lakshadweep', 'Nine', 'Degree', 'Channel', 'Protection']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.transnational_organised_crime_illicit_financial_flows.nexus_between_organised_crime_terrorism', 'nexus_between_organised_crime_terrorism', 'Nexus Between Organised Crime & Terrorism (Crime-Terror Continuum; Mutual Logistics - Weapons, False Passports, Safe Houses, Intelligence; Financing Terrorism through Narcotics & Extortion)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.transnational_organised_crime_illicit_financial_flows',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.transnational_organised_crime_illicit_financial_flows']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Nexus', 'Between', 'Organised', 'Crime', 'Terrorism', 'Terror', 'Continuum', 'Mutual', 'Logistics', 'Weapons', 'False', 'Passports', 'Safe', 'Houses', 'Intelligence', 'Financing', 'through', 'Narcotics', 'Extortion']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.transnational_organised_crime_illicit_financial_flows.drug_trafficking_narco-terrorism', 'drug_trafficking_narco-terrorism', 'Drug Trafficking & Narco-Terrorism (India''s Geopolitical Vulnerability - Sandwich between ''Golden Crescent'' / Iran-Afghanistan-Pakistan & ''Golden Triangle'' / Myanmar-Laos-Thailand; Synthetic Drugs & Darknet Trade, Maritime Drug Smuggling via Arabian Sea; Narcotics Control Bureau / NCB, Prevention of Illicit Traffic in Narcotic Drugs and Psychotropic Substances Act / PITNDPS, National Narcotics Coordination Portal / NCORD)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.transnational_organised_crime_illicit_financial_flows',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.transnational_organised_crime_illicit_financial_flows']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Drug', 'Trafficking', 'Narco', 'Terrorism', 'India''s', 'Geopolitical', 'Vulnerability', 'Sandwich', 'between', 'Golden', 'Crescent', 'Iran', 'Afghanistan', 'Pakistan', 'Triangle', 'Myanmar', 'Laos', 'Thailand', 'Synthetic', 'Drugs', 'Darknet', 'Trade', 'Maritime', 'Smuggling', 'via', 'Arabian', 'Sea', 'Narcotics', 'Control', 'Bureau', 'NCB', 'Prevention', 'Illicit', 'Traffic', 'Narcotic', 'Psychotropic', 'Substances', 'Act', 'PITNDPS', 'National', 'Coordination', 'Portal', 'NCORD']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.transnational_organised_crime_illicit_financial_flows.money_laundering_hawala_terror_financing', 'money_laundering_hawala_terror_financing', 'Money Laundering, Hawala & Terror Financing (Hawala Informal Value Transfer Systems; Money Laundering Stages - Placement, Layering, Integration; Trade-Based Money Laundering / TBML; Prevention of Money Laundering Act / PMLA 2002 & Enforcement Directorate / ED Powers; Financial Intelligence Unit - India / FIU-IND; Fake Indian Currency Notes / FICN; Crypto Assets in Terror Financing)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.transnational_organised_crime_illicit_financial_flows',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.transnational_organised_crime_illicit_financial_flows']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Money', 'Laundering', 'Hawala', 'Terror', 'Financing', 'Informal', 'Value', 'Transfer', 'Systems', 'Stages', 'Placement', 'Layering', 'Integration', 'Trade', 'Based', 'TBML', 'Prevention', 'Act', 'PMLA', '2002', 'Enforcement', 'Directorate', 'Powers', 'Financial', 'Intelligence', 'Unit', 'India', 'FIU', 'IND', 'Fake', 'Indian', 'Currency', 'Notes', 'FICN', 'Crypto', 'Assets']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.transnational_organised_crime_illicit_financial_flows.international_regimes_against_illicit_financing', 'international_regimes_against_illicit_financing', 'International Regimes Against Illicit Financing (Financial Action Task Force / FATF - 40 Recommendations on AML & 9 Special Recommendations on CFT, Mutual Evaluations, Grey List vs Black List Sanctions; UN Convention against Transnational Organized Crime / UNTOC / Palermo Convention; UN Convention Against Corruption / UNCAC)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.transnational_organised_crime_illicit_financial_flows',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.transnational_organised_crime_illicit_financial_flows']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['International', 'Regimes', 'Against', 'Illicit', 'Financing', 'Financial', 'Action', 'Task', 'Force', 'FATF', 'Recommendations', 'AML', 'Special', 'CFT', 'Mutual', 'Evaluations', 'Grey', 'List', 'Black', 'Sanctions', 'Convention', 'against', 'Transnational', 'Organized', 'Crime', 'UNTOC', 'Palermo', 'Corruption', 'UNCAC']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.cyber_warfare_critical_infrastructure_digital_security.vector_threats_digital_warfare', 'vector_threats_digital_warfare', 'Vector Threats & Digital Warfare (State-Sponsored Advanced Persistent Threats / APTs, Critical Infrastructure Attacks, Distributed Denial of Service / DDoS, Ransomware on Healthcare & Power Grids / AIIMS Ransomware Attack 2022, Supply Chain Attacks, Pegasus Spyware & Mobile Exploits)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.cyber_warfare_critical_infrastructure_digital_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.cyber_warfare_critical_infrastructure_digital_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Vector', 'Threats', 'Digital', 'Warfare', 'State', 'Sponsored', 'Advanced', 'Persistent', 'APTs', 'Critical', 'Infrastructure', 'Attacks', 'Distributed', 'Denial', 'Service', 'DDoS', 'Ransomware', 'Healthcare', 'Power', 'Grids', 'AIIMS', 'Attack', '2022', 'Supply', 'Chain', 'Pegasus', 'Spyware', 'Mobile', 'Exploits']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.cyber_warfare_critical_infrastructure_digital_security.critical_information_infrastructure_cii_protection', 'critical_information_infrastructure_cii_protection', 'Critical Information Infrastructure / CII Protection (National Critical Information Infrastructure Protection Centre / NCIIPC under Section 70A of IT Act 2000; Sectoral Computer Emergency Response Teams / CERTs - Power, Finance, Telecom; Indian Computer Emergency Response Team / CERT-In - Incident Response, 6-Hour Reporting Mandate; Cyber Swachhta Kendra / Botnet Cleaning Center; Indian Cyber Crime Coordination Centre / I4C & National Cybercrime Reporting Portal)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.cyber_warfare_critical_infrastructure_digital_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.cyber_warfare_critical_infrastructure_digital_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Critical', 'Information', 'Infrastructure', 'CII', 'Protection', 'National', 'Centre', 'NCIIPC', 'Section', '70A', 'Act', '2000', 'Sectoral', 'Computer', 'Emergency', 'Response', 'Teams', 'CERTs', 'Power', 'Finance', 'Telecom', 'Indian', 'Team', 'CERT', 'Incident', 'Hour', 'Reporting', 'Mandate', 'Cyber', 'Swachhta', 'Kendra', 'Botnet', 'Cleaning', 'Center', 'Crime', 'Coordination', 'I4C', 'Cybercrime', 'Portal']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.cyber_warfare_critical_infrastructure_digital_security.national_cyber_governance_framework', 'national_cyber_governance_framework', 'National Cyber Governance Framework (National Cyber Security Strategy; Information Technology Act 2000 & Section 66F / Cyber Terrorism; Digital Personal Data Protection Act 2023 / DPDP; International Cyber Norms - Budapest Convention on Cybercrime / India non-signatory, UN Group of Governmental Experts / UN GGE & Open-Ended Working Group / OEWG)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.cyber_warfare_critical_infrastructure_digital_security',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.cyber_warfare_critical_infrastructure_digital_security']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['National', 'Cyber', 'Governance', 'Framework', 'Security', 'Strategy', 'Information', 'Technology', 'Act', '2000', 'Section', '66F', 'Terrorism', 'Digital', 'Personal', 'Data', 'Protection', '2023', 'DPDP', 'International', 'Norms', 'Budapest', 'Convention', 'Cybercrime', 'India', 'non', 'signatory', 'Group', 'Governmental', 'Experts', 'GGE', 'Open', 'Ended', 'Working', 'OEWG']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.security_forces_intelligence_agencies_statutory_mandates.central_armed_police_forces_capfs', 'central_armed_police_forces_capfs', 'Central Armed Police Forces / CAPFs (Border Security Force / BSF - Indo-Pak & Indo-Bangladesh Borders; Central Reserve Police Force / CRPF - Internal Security & Counter-LWE Operations; Central Industrial Security Force / CISF - Critical Infrastructure, Airports, Metro Rail, Atomic Plants; Indo-Tibetan Border Police / ITBP - Indo-China Border / High Altitude Warfare; Sashastra Seema Bal / SSB - Indo-Nepal & Indo-Bhutan Borders; Assam Rifles - Indo-Myanmar Border & Counter-Insurgency in North-East / Dual Control under MHA & MoD; National Security Guard / NSG - Black Cats Counter-Terrorism Federal Contingency Force)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.security_forces_intelligence_agencies_statutory_mandates',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.security_forces_intelligence_agencies_statutory_mandates']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Central', 'Armed', 'Police', 'Forces', 'CAPFs', 'Border', 'Security', 'Force', 'BSF', 'Indo', 'Pak', 'Bangladesh', 'Borders', 'Reserve', 'CRPF', 'Internal', 'Counter', 'LWE', 'Operations', 'Industrial', 'CISF', 'Critical', 'Infrastructure', 'Airports', 'Metro', 'Rail', 'Atomic', 'Plants', 'Tibetan', 'ITBP', 'China', 'High', 'Altitude', 'Warfare', 'Sashastra', 'Seema', 'Bal', 'SSB', 'Nepal', 'Bhutan', 'Assam', 'Rifles', 'Myanmar', 'Insurgency', 'North', 'East', 'Dual', 'Control', 'MHA', 'MoD', 'National', 'Guard', 'NSG', 'Black', 'Cats', 'Terrorism', 'Federal', 'Contingency']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.security_forces_intelligence_agencies_statutory_mandates.intelligence_investigation_architecture', 'intelligence_investigation_architecture', 'Intelligence & Investigation Architecture (Intelligence Bureau / IB - Domestic Intelligence, Counter-Intelligence; Research and Analysis Wing / RAW - External Intelligence, Strategic Analysis; National Investigation Agency / NIA - Federal Counter-Terrorism Investigation Agency under NIA Act 2008 & 2019 Amendment / Extraterritorial Jurisdiction; National Intelligence Grid / NATGRID - Integrated Intelligence Master Database; Multi-Agency Centre / MAC - Real-time Intelligence Sharing Mechanism; National Technical Research Organisation / NTRO)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.security_forces_intelligence_agencies_statutory_mandates',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.security_forces_intelligence_agencies_statutory_mandates']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Intelligence', 'Investigation', 'Architecture', 'Bureau', 'Domestic', 'Counter', 'Research', 'Analysis', 'Wing', 'RAW', 'External', 'Strategic', 'National', 'Agency', 'NIA', 'Federal', 'Terrorism', 'Act', '2008', '2019', 'Amendment', 'Extraterritorial', 'Jurisdiction', 'Grid', 'NATGRID', 'Integrated', 'Master', 'Database', 'Multi', 'Centre', 'MAC', 'Real', 'time', 'Sharing', 'Mechanism', 'Technical', 'Organisation', 'NTRO']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'internal_security.security_forces_intelligence_agencies_statutory_mandates.armed_forces_special_powers_act_afspa_act_1958_-_declaration_of_disturbed_area_under_section_3_special_powers_to_armed_forces_arrest_without_warrant_fire_upon_suspects_search_premises_legal_safeguards_-_section_6_prior_central_sanction_for_prosecution_supreme_court_1997_guidelines_naga_peoples_movement_for_human_rights_case_justice_jeevan_reddy_committee_2005_recommendations_progressive_phased_revocation_of_afspa_in_assam_nagaland_manipur', 'armed_forces_special_powers_act_afspa_act_1958_-_declaration_of_disturbed_area_under_section_3_special_powers_to_armed_forces_arrest_without_warrant_fire_upon_suspects_search_premises_legal_safeguards_-_section_6_prior_central_sanction_for_prosecution_supreme_court_1997_guidelines_naga_peoples_movement_for_human_rights_case_justice_jeevan_reddy_committee_2005_recommendations_progressive_phased_revocation_of_afspa_in_assam_nagaland_manipur', 'Armed Forces Special Powers Act / AFSPA (Armed Forces (Special Powers) Act 1958 - Declaration of Disturbed Area under Section 3, Special Powers to Armed Forces: Arrest without Warrant, Fire upon Suspects, Search Premises; Legal Safeguards - Section 6 Prior Central Sanction for Prosecution; Supreme Court 1997 Guidelines / Naga People''s Movement for Human Rights Case; Justice Jeevan Reddy Committee 2005 Recommendations; Progressive Phased Revocation of AFSPA in Assam, Nagaland & Manipur)', 3,
        'Topic', 'Internal Security', 'internal_security', 'internal_security.security_forces_intelligence_agencies_statutory_mandates',
        ARRAY[]::text[], ARRAY['internal_security', 'internal_security.security_forces_intelligence_agencies_statutory_mandates']::text[], '{"upsc": ["Mains-GS3"], "kas": ["Prelims-P2", "Mains-GS3"]}'::jsonb,
        '[UPSC: Mains-GS3] [KAS: Prelims-P2, Mains-GS3]', '', ARRAY[]::text[], ARRAY['Armed', 'Forces', 'Special', 'Powers', 'Act', 'AFSPA', '1958', 'Declaration', 'Disturbed', 'Area', 'Section', 'Arrest', 'without', 'Warrant', 'Fire', 'upon', 'Suspects', 'Search', 'Premises', 'Legal', 'Safeguards', 'Prior', 'Central', 'Sanction', 'Prosecution', 'Supreme', 'Court', '1997', 'Guidelines', 'Naga', 'People''s', 'Movement', 'Human', 'Rights', 'Case', 'Justice', 'Jeevan', 'Reddy', 'Committee', '2005', 'Recommendations', 'Progressive', 'Phased', 'Revocation', 'Assam', 'Nagaland', 'Manipur']::text[],
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
        'ethics_integrity_aptitude.ethics_human_interface.essence_determinants_consequences_of_ethics', 'essence_determinants_consequences_of_ethics', 'Essence, Determinants & Consequences of Ethics (Fundamentals of Ethics - Definition of Morality, Ethics, Values, Norms; Moral Relativism vs Absolutism; Determinants of Ethical Action - Object, Intention, Circumstance, Conscience, Intuition; Consequences of Ethics - Individual Peace, Social Harmony, Institutional Efficiency, Good Governance)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.ethics_human_interface',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.ethics_human_interface']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Essence', 'Determinants', 'Consequences', 'Ethics', 'Fundamentals', 'Definition', 'Morality', 'Values', 'Norms', 'Moral', 'Relativism', 'Absolutism', 'Ethical', 'Action', 'Object', 'Intention', 'Circumstance', 'Conscience', 'Intuition', 'Individual', 'Peace', 'Social', 'Harmony', 'Institutional', 'Efficiency', 'Good', 'Governance']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.ethics_human_interface.dimensions_of_ethics', 'dimensions_of_ethics', 'Dimensions of Ethics (Domain-Specific Ethics - Personal Ethics, Professional Ethics, Public Life Ethics, Environmental Ethics, Bioethics, Media Ethics, Cyber Ethics)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.ethics_human_interface',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.ethics_human_interface']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Dimensions', 'Ethics', 'Domain', 'Specific', 'Personal', 'Professional', 'Public', 'Life', 'Environmental', 'Bioethics', 'Media', 'Cyber']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.ethics_human_interface.human_values_lessons_from_great_leaders_reformers', 'human_values_lessons_from_great_leaders_reformers', 'Human Values & Lessons from Great Leaders & Reformers (Values Exemplified by Thinkers & Reformers - Truth & Non-Violence: Mahatma Gandhi; Compassion: Buddha & Mahavira; Justice & Social Equality: B.R. Ambedkar; Rationalism: Raja Ram Mohan Roy; Service: Mother Teresa; Excellence & Integrity: A.P.J. Abdul Kalam)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.ethics_human_interface',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.ethics_human_interface']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Human', 'Values', 'Lessons', 'Great', 'Leaders', 'Reformers', 'Exemplified', 'Thinkers', 'Truth', 'Non', 'Violence', 'Mahatma', 'Gandhi', 'Compassion', 'Buddha', 'Mahavira', 'Justice', 'Social', 'Equality', 'B.R.', 'Ambedkar', 'Rationalism', 'Raja', 'Ram', 'Mohan', 'Roy', 'Service', 'Mother', 'Teresa', 'Excellence', 'Integrity', 'A.P.J.', 'Abdul', 'Kalam']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.ethics_human_interface.role_of_family_society_educational_institutions', 'role_of_family_society_educational_institutions', 'Role of Family, Society & Educational Institutions (Value Inculcation Agents - Role of Family in Early Socialisation, Role of Educational Institutions & Teachers, Role of Peer Groups & Mass Media)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.ethics_human_interface',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.ethics_human_interface']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Role', 'Family', 'Society', 'Educational', 'Institutions', 'Value', 'Inculcation', 'Agents', 'Early', 'Socialisation', 'Teachers', 'Peer', 'Groups', 'Mass', 'Media']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.attitude_aptitude.content_structure_functions_of_attitude', 'content_structure_functions_of_attitude', 'Content, Structure & Functions of Attitude (Attitude Architecture - ABC Model: Affective, Behavioural, Cognitive components; Functions of Attitude - Knowledge, Ego-Defensive, Value-Expressive, Utilitarian; Relation of Attitude to Thought & Behaviour - Cognitive Dissonance Theory / Leon Festinger, Attitude-Behaviour Gap)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.attitude_aptitude',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.attitude_aptitude']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Content', 'Structure', 'Functions', 'Attitude', 'Architecture', 'ABC', 'Model', 'Affective', 'Behavioural', 'Cognitive', 'components', 'Knowledge', 'Ego', 'Defensive', 'Value', 'Expressive', 'Utilitarian', 'Relation', 'Thought', 'Behaviour', 'Dissonance', 'Theory', 'Leon', 'Festinger', 'Gap']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.attitude_aptitude.moral_political_attitudes', 'moral_political_attitudes', 'Moral & Political Attitudes (Ideological & Political Orientation - Political Socialisation, Political Tolerance, Moral Attitudes - Honesty, Duty, Justice)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.attitude_aptitude',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.attitude_aptitude']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Moral', 'Political', 'Attitudes', 'Ideological', 'Orientation', 'Socialisation', 'Tolerance', 'Honesty', 'Duty', 'Justice']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.attitude_aptitude.social_influence_persuasion', 'social_influence_persuasion', 'Social Influence & Persuasion (Persuasive Communication - Elaboration Likelihood Model, Source Credibility, Emotional Appeals, Nudge Theory / Richard Thaler, Social Proof)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.attitude_aptitude',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.attitude_aptitude']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Social', 'Influence', 'Persuasion', 'Persuasive', 'Communication', 'Elaboration', 'Likelihood', 'Model', 'Source', 'Credibility', 'Emotional', 'Appeals', 'Nudge', 'Theory', 'Richard', 'Thaler', 'Proof']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.attitude_aptitude.foundational_values_for_civil_services', 'foundational_values_for_civil_services', 'Foundational Values for Civil Services (Core Administrative Values - Integrity, Impartiality, Non-partisanship, Objectivity, Empathy, Tolerance, Compassion towards Vulnerable Sections, Commitment to Public Service)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.attitude_aptitude',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.attitude_aptitude']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Foundational', 'Values', 'Civil', 'Services', 'Core', 'Administrative', 'Integrity', 'Impartiality', 'Non', 'partisanship', 'Objectivity', 'Empathy', 'Tolerance', 'Compassion', 'towards', 'Vulnerable', 'Sections', 'Commitment', 'Public', 'Service']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers.concepts_components_of_emotional_intelligence', 'concepts_components_of_emotional_intelligence', 'Concepts & Components of Emotional Intelligence (Emotional Intelligence Frameworks - Daniel Goleman Model: Self-awareness, Self-regulation, Internal Motivation, Empathy, Social Skills; Ability Model - Mayer-Salovey)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Concepts', 'Components', 'Emotional', 'Intelligence', 'Frameworks', 'Daniel', 'Goleman', 'Model', 'Self', 'awareness', 'regulation', 'Internal', 'Motivation', 'Empathy', 'Social', 'Skills', 'Ability', 'Mayer', 'Salovey']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers.utilities_of_emotional_intelligence_in_governance', 'utilities_of_emotional_intelligence_in_governance', 'Utilities of Emotional Intelligence in Governance (Administrative Applications of EI - Stress Management, Conflict Resolution, Public Crisis Management, Crisis Leadership, Team Building, Negotiation)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Utilities', 'Emotional', 'Intelligence', 'Governance', 'Administrative', 'Applications', 'Stress', 'Management', 'Conflict', 'Resolution', 'Public', 'Crisis', 'Leadership', 'Team', 'Building', 'Negotiation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers.contributions_of_moral_thinkers_philosophers', 'contributions_of_moral_thinkers_philosophers', 'Contributions of Moral Thinkers & Philosophers (Indian Moral Thinkers & Traditions - Kautilya Arthashastra Ethics, Thirukkural Principles, Swami Vivekananda''s Practical Vedanta, Aurobindo, Rabindranath Tagore, Buddha, Mahavira; Western Moral Philosophers - Socrates, Plato''s Cardinal Virtues, Aristotle''s Virtue Ethics & Golden Mean, Immanuel Kant''s Categorical Imperative & Deontology, J.S. Mill & Jeremy Bentham''s Utilitarianism, John Rawls'' Theory of Justice & Veil of Ignorance, Thomas Hobbes, John Locke, Jean-Jacques Rousseau)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.emotional_intelligence_moral_thinkers']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Contributions', 'Moral', 'Thinkers', 'Philosophers', 'Indian', 'Traditions', 'Kautilya', 'Arthashastra', 'Ethics', 'Thirukkural', 'Principles', 'Swami', 'Vivekananda''s', 'Practical', 'Vedanta', 'Aurobindo', 'Rabindranath', 'Tagore', 'Buddha', 'Mahavira', 'Western', 'Socrates', 'Plato''s', 'Cardinal', 'Virtues', 'Aristotle''s', 'Virtue', 'Golden', 'Mean', 'Immanuel', 'Kant''s', 'Categorical', 'Imperative', 'Deontology', 'J.S.', 'Mill', 'Jeremy', 'Bentham''s', 'Utilitarianism', 'John', 'Rawls', 'Theory', 'Justice', 'Veil', 'Ignorance', 'Thomas', 'Hobbes', 'Locke', 'Jean', 'Jacques', 'Rousseau']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.probity_in_governance_public_service_values.concept_of_public_service_philosophical_basis_of_governance', 'concept_of_public_service_philosophical_basis_of_governance', 'Concept of Public Service & Philosophical Basis of Governance (Public Trust Doctrine - Governance as Trusteeship, Public Interest, Accountability to Citizens)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Concept', 'Public', 'Service', 'Philosophical', 'Basis', 'Governance', 'Trust', 'Doctrine', 'Trusteeship', 'Interest', 'Accountability', 'Citizens']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.probity_in_governance_public_service_values.transparency_rti_information_sharing', 'transparency_rti_information_sharing', 'Transparency, RTI & Information Sharing (Open Governance - Right to Information as an Ethical Imperative, Proactive Disclosure, Freedom of Information)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Transparency', 'RTI', 'Information', 'Sharing', 'Open', 'Governance', 'Right', 'Ethical', 'Imperative', 'Proactive', 'Disclosure', 'Freedom']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.probity_in_governance_public_service_values.codes_of_ethics_codes_of_conduct', 'codes_of_ethics_codes_of_conduct', 'Codes of Ethics & Codes of Conduct (Governance Guidelines - Nolan Committee 7 Principles of Public Life: Selflessness, Integrity, Objectivity, Accountability, Openness, Honesty, Leadership; Central Civil Services Conduct Rules)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Codes', 'Ethics', 'Conduct', 'Governance', 'Guidelines', 'Nolan', 'Committee', 'Principles', 'Public', 'Life', 'Selflessness', 'Integrity', 'Objectivity', 'Accountability', 'Openness', 'Honesty', 'Leadership', 'Central', 'Civil', 'Services', 'Rules']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.probity_in_governance_public_service_values.citizens_charters_work_culture_quality_of_service_delivery', 'citizens_charters_work_culture_quality_of_service_delivery', 'Citizen''s Charters, Work Culture & Quality of Service Delivery (Administrative Work Culture - Service Delivery Excellence, Professional Ethics, Punctuality, Responsiveness, Empathy in Service Delivery)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Citizen''s', 'Charters', 'Work', 'Culture', 'Quality', 'Service', 'Delivery', 'Administrative', 'Excellence', 'Professional', 'Ethics', 'Punctuality', 'Responsiveness', 'Empathy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.probity_in_governance_public_service_values.challenges_of_corruption', 'challenges_of_corruption', 'Challenges of Corruption (Ethical Analysis of Corruption - Causes: Greed, Lack of Transparency, Monopoly, Discretion; Impact on Society; Prevention of Corruption Act, Lokpal & Lokayuktas, Whistleblower Protection)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.probity_in_governance_public_service_values']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Challenges', 'Corruption', 'Ethical', 'Analysis', 'Causes', 'Greed', 'Lack', 'Transparency', 'Monopoly', 'Discretion', 'Impact', 'Society', 'Prevention', 'Act', 'Lokpal', 'Lokayuktas', 'Whistleblower', 'Protection']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.case_studies.ethical_dilemmas_in_administration_public_life', 'ethical_dilemmas_in_administration_public_life', 'Ethical Dilemmas in Administration & Public Life (Common Dilemma Scenarios - Rule of Law vs Compassion, Political Pressure vs Duty, Professional Integrity vs Friendship, Economic Development vs Environmental Protection)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.case_studies',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.case_studies']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Ethical', 'Dilemmas', 'Administration', 'Public', 'Life', 'Common', 'Dilemma', 'Scenarios', 'Rule', 'Law', 'Compassion', 'Political', 'Pressure', 'Duty', 'Professional', 'Integrity', 'Friendship', 'Economic', 'Development', 'Environmental', 'Protection']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.case_studies.conflict_of_interest_decision_making_under_pressure', 'conflict_of_interest_decision_making_under_pressure', 'Conflict of Interest & Decision Making Under Pressure (Managing Conflicts - Personal Interest vs Public Duty, Pecuniary Interests, Recusal Mechanisms, Transparency)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.case_studies',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.case_studies']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Conflict', 'Interest', 'Decision', 'Making', 'Pressure', 'Managing', 'Conflicts', 'Personal', 'Public', 'Duty', 'Pecuniary', 'Interests', 'Recusal', 'Mechanisms', 'Transparency']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'ethics_integrity_aptitude.case_studies.crisis_management_public_resource_allocation', 'crisis_management_public_resource_allocation', 'Crisis Management & Public Resource Allocation (Ethical Resource Distribution - Disaster Response Ethics, Triage in Emergency Healthcare, Vulnerable Section Prioritisation)', 3,
        'Topic', 'Ethics, Integrity & Aptitude', 'ethics_integrity_aptitude', 'ethics_integrity_aptitude.case_studies',
        ARRAY[]::text[], ARRAY['ethics_integrity_aptitude', 'ethics_integrity_aptitude.case_studies']::text[], '{"upsc": ["Mains-GS4"], "kas": ["Mains-GS4"]}'::jsonb,
        '[UPSC: Mains-GS4] [KAS: Mains-GS4]', '', ARRAY[]::text[], ARRAY['Crisis', 'Management', 'Public', 'Resource', 'Allocation', 'Ethical', 'Distribution', 'Disaster', 'Response', 'Ethics', 'Triage', 'Emergency', 'Healthcare', 'Vulnerable', 'Section', 'Prioritisation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.reading_comprehension_inference', 'reading_comprehension_inference', 'Reading Comprehension & Inference (Passage Analysis - Central Idea Identification, Author''s Tone, Main Thesis vs Supporting Evidence; Inference & Assumption Testing - Logical Inferences, Implicit Assumptions, Direct & Indirect Conclusions; Passages Types - Economic, Philosophical, Scientific, Environmental, Social, Geopolitical Passages)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills',
        ARRAY[]::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Reading', 'Comprehension', 'Inference', 'Passage', 'Analysis', 'Central', 'Idea', 'Identification', 'Author''s', 'Tone', 'Main', 'Thesis', 'Supporting', 'Evidence', 'Assumption', 'Testing', 'Logical', 'Inferences', 'Implicit', 'Assumptions', 'Direct', 'Indirect', 'Conclusions', 'Passages', 'Types', 'Economic', 'Philosophical', 'Scientific', 'Environmental', 'Social', 'Geopolitical']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.critical_reasoning_analytical_ability', 'critical_reasoning_analytical_ability', 'Critical Reasoning & Analytical Ability (Logical Arguments - Strengthening & Weakening Arguments, Evaluating Premise & Conclusion, Paradox Resolution)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.critical_reasoning_analytical_ability.strengthening_weakening_arguments', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.critical_reasoning_analytical_ability.paradox_resolution_evaluating_premises']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Critical', 'Reasoning', 'Analytical', 'Ability', 'Logical', 'Arguments', 'Strengthening', 'Weakening', 'Evaluating', 'Premise', 'Conclusion', 'Paradox', 'Resolution']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills', 'interpersonal_communication_skills', 'Interpersonal & Communication Skills (Verbal Reasoning - Statement-Argument, Statement-Assumption, Course of Action, Cause & Effect)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills.statement_arguments_assumptions_conclusions', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills.cause_and_effect_reasoning', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills.interpersonal_communication_skills.administrative_decision_making_crisis_management']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.reading_comprehension_interpersonal_skills']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Interpersonal', 'Communication', 'Skills', 'Verbal', 'Reasoning', 'Statement', 'Argument', 'Assumption', 'Course', 'Action', 'Cause', 'Effect']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic', 'number_systems_basic_arithmetic', 'Number Systems & Basic Arithmetic (Fundamentals of Numbers - Types of Numbers: Natural, Integers, Rational, Prime; Divisibility Rules, Unit Digit Calculations; Factors, Multiples & Remainders - LCM & HCF, Remainder Theorems, Number of Factors, Trailing Zeros)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.number_types_divisibility_rules', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.remainders_unit_digit_factorials_cyclicity', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.lcm_hcf_factors_multiples', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.fractions_decimals_surds_indices', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.algebraic_identities_linear_quadratic_equations', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.number_systems_basic_arithmetic.progressions_sequences_ap_gp']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Number', 'Systems', 'Basic', 'Arithmetic', 'Fundamentals', 'Numbers', 'Types', 'Natural', 'Integers', 'Rational', 'Prime', 'Divisibility', 'Rules', 'Unit', 'Digit', 'Calculations', 'Factors', 'Multiples', 'Remainders', 'LCM', 'HCF', 'Remainder', 'Theorems', 'Trailing', 'Zeros']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion', 'percentages_averages_ratio-proportion', 'Percentages, Averages & Ratio-Proportion (Proportional Math - Percentages & Percentage Change, Averages & Weighted Averages, Mixtures & Alligations, Ratio & Proportion, Partnerships)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.percentages_successive_change', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.averages_weighted_averages_alligation', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.ratio_proportion_variations_partnerships', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.percentages_averages_ratio-proportion.problems_on_ages']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Percentages', 'Averages', 'Ratio', 'Proportion', 'Proportional', 'Math', 'Percentage', 'Change', 'Weighted', 'Mixtures', 'Alligations', 'Partnerships']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount', 'profit_loss_interest_discount', 'Profit, Loss, Interest & Discount (Commercial Mathematics - Cost Price, Selling Price, Profit & Loss Percentage, Marked Price & Discounts, Simple Interest, Compound Interest & Compounding Frequency)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.profit_loss_marked_price_discounts', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.simple_interest_installments', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.profit_loss_interest_discount.compound_interest_installments']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Profit', 'Loss', 'Interest', 'Discount', 'Commercial', 'Mathematics', 'Cost', 'Price', 'Selling', 'Percentage', 'Marked', 'Discounts', 'Simple', 'Compound', 'Compounding', 'Frequency']::text[],
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
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance', 'time_work_speed_distance', 'Time, Work, Speed & Distance (Time & Motion Kinetics - Time & Work, Pipes & Cisterns, Speed-Time-Distance, Relative Speed, Problems on Trains, Boats & Streams)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.time_and_work_pipes_and_cisterns', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.speed_time_distance_trains', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.time_work_speed_distance.boats_streams_races_circular_tracks']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Time', 'Work', 'Speed', 'Distance', 'Motion', 'Kinetics', 'Pipes', 'Cisterns', 'Relative', 'Problems', 'Trains', 'Boats', 'Streams']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability', 'permutation_combination_probability', 'Permutation, Combination & Probability (Combinatorics - Fundamental Counting Principle, Factorials, Permutations / Arrangements, Combinations / Selections; Probability Science - Sample Space, Events, Independent & Mutually Exclusive Events, Conditional Probability)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.fundamental_counting_principle_permutations', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.combinations_selections_geometry_combinations', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.probability_events_conditional_bayes', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.permutation_combination_probability.set_theory_venn_diagrams_max_min']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Permutation', 'Combination', 'Probability', 'Combinatorics', 'Fundamental', 'Counting', 'Principle', 'Factorials', 'Permutations', 'Arrangements', 'Combinations', 'Selections', 'Science', 'Sample', 'Space', 'Events', 'Independent', 'Mutually', 'Exclusive', 'Conditional']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry', 'mensuration_geometry', 'Mensuration & Geometry (Spatial Measurement - 2D Geometrical Shapes: Triangles, Circles, Quadrilaterals; Perimeter & Area; 3D Solids: Cubes, Cuboids, Cylinders, Cones, Spheres; Surface Area & Volume)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.2d_geometry_mensuration_triangles_circles_polygons', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy.mensuration_geometry.3d_mensuration_solids_surface_area_volume']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.quantitative_aptitude_basic_numeracy']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Mensuration', 'Geometry', 'Spatial', 'Measurement', 'Geometrical', 'Shapes', 'Triangles', 'Circles', 'Quadrilaterals', 'Perimeter', 'Area', 'Solids', 'Cubes', 'Cuboids', 'Cylinders', 'Cones', 'Spheres', 'Surface', 'Volume']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning', 'logical_analytical_reasoning', 'Logical & Analytical Reasoning (Deductive Logic - Syllogisms / Venn Diagram & Rules Method, Logical Deductions; Spatial & Relational Logic - Linear & Circular Seating Arrangements, Blood Relations & Family Trees, Direction Sense & Compass Problems, Clocks & Calendar Calculations)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.syllogisms_venn_logical_deductions', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.linear_circular_complex_seating_arrangements', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.blood_relations_family_trees_coded_relations', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.direction_distance_sense_shadows', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.clocks_angle_coincidence_faulty_clocks', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.logical_analytical_reasoning.calendar_odd_days_leap_years_repetition']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Logical', 'Analytical', 'Reasoning', 'Deductive', 'Logic', 'Syllogisms', 'Venn', 'Diagram', 'Rules', 'Method', 'Deductions', 'Spatial', 'Relational', 'Linear', 'Circular', 'Seating', 'Arrangements', 'Blood', 'Relations', 'Family', 'Trees', 'Direction', 'Sense', 'Compass', 'Problems', 'Clocks', 'Calendar', 'Calculations']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency', 'data_interpretation_data_sufficiency', 'Data Interpretation & Data Sufficiency (Data Formats - Bar Charts, Pie Charts, Line Graphs, Data Tables, Mixed Graphs; Data Sufficiency - Evaluating Sufficiency of Given Statements to Answer Questions)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.tabular_di_and_missing_data_tables', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.bar_charts_simple_grouped_stacked', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.line_graphs_multiseries_trends', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.pie_charts_percentage_degree_distribution', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.mixed_graphs_multiaxis_combinations', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.caselet_di_paragraph_data', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.venn_diagram_based_di_and_set_caselets', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.radar_spider_scatter_plots', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.data_interpretation_data_sufficiency.data_sufficiency_evaluating_statements']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Data', 'Interpretation', 'Sufficiency', 'Formats', 'Bar', 'Charts', 'Pie', 'Line', 'Graphs', 'Tables', 'Mixed', 'Evaluating', 'Given', 'Statements', 'Answer', 'Questions']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition', 'problem_solving_pattern_recognition', 'Problem Solving & Pattern Recognition (Coding, Series & Puzzles - Coding-Decoding, Number Series, Letter Series, Matrix & Grid Puzzles, Ranking & Ordering, Cube Folding & Dice)', 3,
        'Topic', 'General Mental Ability, Quantitative Aptitude & Comprehension', 'general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning',
        ARRAY['general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.number_letter_alphanumeric_series', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.coding_decoding_matrix_substitution', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.order_ranking_comparative_arrangements', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.cubes_dice_folding_nets_painting', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.non_verbal_reasoning_mirror_water_figure_completion', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning.problem_solving_pattern_recognition.mathematical_operators_symbolic_logic']::text[], ARRAY['general_mental_ability_quantitative_aptitude_comprehension', 'general_mental_ability_quantitative_aptitude_comprehension.general_mental_ability_logical_reasoning']::text[], '{"upsc": ["Prelims-CSAT"], "kas": ["Prelims-P2", "Mains-GS1"], "ssc": ["Quant", "Reasoning"]}'::jsonb,
        '[UPSC: Prelims-CSAT] [KAS: Prelims-P2, Mains-GS1] [SSC: Quant/Reasoning] [Banking]', '', ARRAY[]::text[], ARRAY['Problem', 'Solving', 'Pattern', 'Recognition', 'Coding', 'Series', 'Puzzles', 'Decoding', 'Number', 'Letter', 'Matrix', 'Grid', 'Ranking', 'Ordering', 'Cube', 'Folding', 'Dice']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations', 'enclosed_seas_bordering_nations', 'Enclosed Seas, Marginal Seas & Bordering Nations (Mediterranean Sea, Black Sea, Caspian Sea, Red Sea, Baltic Sea, Persian Gulf, Aral Sea, Dead Sea)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.world_mapping_geopolitical_locations',
        ARRAY['geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations.mediterranean_black_and_caspian_seas_mapping', 'geography_earth_systems.world_mapping_geopolitical_locations.enclosed_seas_bordering_nations.red_sea_persian_gulf_baltic_and_dead_sea_mapping']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.world_mapping_geopolitical_locations']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1] [SSC: GA]', '', ARRAY['Mediterranean Sea', 'Black Sea', 'Caspian Sea', 'Red Sea', 'Baltic Sea', 'Persian Gulf', 'Aral Sea']::text[], ARRAY['Enclosed', 'Seas', 'Bordering', 'Countries', 'Mediterranean', 'Black Sea', 'Caspian', 'Red Sea', 'Persian Gulf']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals', 'strategic_straits_chokepoints_canals', 'Strategic Maritime Straits, Canals & Chokepoints (Strait of Hormuz, Bab-el-Mandeb, Malacca Strait, Bosphorus & Dardanelles, Kerch Strait, Taiwan Strait, Suez Canal, Panama Canal)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.world_mapping_geopolitical_locations',
        ARRAY['geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals.global_maritime_chokepoints_hormuz_malacca_bab_el_mandeb', 'geography_earth_systems.world_mapping_geopolitical_locations.strategic_straits_chokepoints_canals.strategic_canals_suez_panama_taiwan_strait_mapping']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.world_mapping_geopolitical_locations']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1] [SSC: GA]', '', ARRAY['Strait of Hormuz', 'Bab-el-Mandeb', 'Malacca Strait', 'Bosphorus', 'Dardanelles', 'Kerch Strait', 'Taiwan Strait', 'Suez Canal']::text[], ARRAY['Straits', 'Chokepoints', 'Canals', 'Hormuz', 'Bab el Mandeb', 'Malacca', 'Bosphorus', 'Suez Canal', 'Panama']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones', 'places_in_news_conflict_zones', 'Places in News & Conflict Zones (West Asia / Levant: Gaza, West Bank, Golan Heights, Sinai; Sahel Region: Mali, Niger, Burkina Faso, Chad; Horn of Africa: Tigray, Somaliland; Eastern Europe: Donbas, Crimea, Zaporizhzhia; South China Sea)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.world_mapping_geopolitical_locations',
        ARRAY['geography_earth_systems.world_mapping_geopolitical_locations.places_in_news_conflict_zones.geopolitical_conflict_zones_and_flashpoints_in_news']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.world_mapping_geopolitical_locations']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1] [SSC: GA]', '', ARRAY['Gaza', 'Golan Heights', 'Sahel', 'Tigray', 'Donbas', 'Zaporizhzhia', 'South China Sea', 'Crimea']::text[], ARRAY['Places in News', 'Conflict Zones', 'Gaza', 'Golan', 'Sahel', 'Tigray', 'Donbas', 'Levant', 'South China Sea']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories', 'international_land_borders_disputed_territories', 'International Land Borders, Landlocked Nations & Disputed Boundary Lines (Radcliffe Line, McMahon Line, Durand Line, 38th Parallel, 49th Parallel, Kuril Islands, Senkaku/Diaoyu, Spratly/Paracel)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.world_mapping_geopolitical_locations',
        ARRAY['geography_earth_systems.world_mapping_geopolitical_locations.international_land_borders_disputed_territories.international_boundary_lines_and_landlocked_countries_mapping']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.world_mapping_geopolitical_locations']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS2"], "kas": ["Prelims-P1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS2] [KAS: Prelims-P1] [SSC: GA]', '', ARRAY['Radcliffe Line', 'McMahon Line', 'Durand Line', 'Landlocked Countries', 'Disputed Islands']::text[], ARRAY['Borders', 'Boundary Lines', 'Landlocked', 'Durand Line', 'McMahon Line', 'Radcliffe', 'Disputed Territories']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_mapping_spatial_geography.river_systems_tributaries_spatial_ordering', 'river_systems_tributaries_spatial_ordering', 'Indian River Systems & Tributaries Spatial Layout (Indus Basin, Ganga Basin, Brahmaputra Basin, Peninsular Rivers: Godavari, Krishna, Cauvery, Mahanadi, Narmada, Tapi - Left & Right Bank Tributaries, North-to-South & West-to-East Ordering)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1] [SSC: GA]', '', ARRAY['Indus River', 'Ganga River', 'Brahmaputra', 'Godavari', 'Krishna', 'Cauvery', 'Narmada', 'Tapi']::text[], ARRAY['Rivers', 'Tributaries', 'Left Bank', 'Right Bank', 'Indus', 'Ganga', 'Brahmaputra', 'Godavari', 'Krishna', 'Cauvery']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_mapping_spatial_geography.himalayan_mountain_ranges_passes_glaciers', 'himalayan_mountain_ranges_passes_glaciers', 'Himalayan Ranges, Mountain Passes & Glaciers (Karakoram, Ladakh, Zanskar, Great Himalayas, Pir Panjal, Dhauladhar, Shiwaliks; Passes: Zoji La, Khardung La, Rohtang, Shipki La, Lipulekh, Nathu La, Jelep La, Bomdi La; Glaciers: Siachen, Gangotri, Zemu)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1] [SSC: GA]', '', ARRAY['Karakoram', 'Zanskar', 'Pir Panjal', 'Zoji La', 'Nathu La', 'Shipki La', 'Siachen Glacier']::text[], ARRAY['Himalayas', 'Passes', 'Zoji La', 'Nathu La', 'Shipki La', 'Lipulekh', 'Siachen', 'Glaciers', 'Mountain Ranges']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_mapping_spatial_geography.protected_areas_wildlife_corridors_spatial_layout', 'protected_areas_wildlife_corridors_spatial_layout', 'Protected Areas & Biogeography Spatial Layout (North-to-South and West-to-East Sequential Ordering of National Parks, Tiger Reserves, Ramsar Wetlands, Biosphere Reserves & Wildlife Corridors in India)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1] [SSC: GA]', '', ARRAY['National Parks India', 'Tiger Reserves', 'Ramsar Sites India', 'Biosphere Reserves', 'Corridors']::text[], ARRAY['National Parks', 'Tiger Reserves', 'Ramsar Sites', 'Biosphere Reserves', 'Spatial Ordering', 'North to South', 'Wildlife']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_mapping_spatial_geography.peninsular_hills_plateaus_passes', 'peninsular_hills_plateaus_passes', 'Peninsular Hills, Plateaus & Mountain Passes (Aravalli, Vindhya, Satpura, Western Ghats / Sahyadri, Eastern Ghats, Nilgiri Hills, Anaimalai, Cardamom Hills; Thal Ghat, Bhor Ghat, Palghat Gap, Shencottah Gap; Anamudi & Doddabetta Peaks)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1] [SSC: GA]', '', ARRAY['Western Ghats', 'Eastern Ghats', 'Aravalli', 'Nilgiris', 'Palghat Gap', 'Anamudi', 'Thal Ghat']::text[], ARRAY['Western Ghats', 'Eastern Ghats', 'Nilgiris', 'Palghat', 'Anaimalai', 'Cardamom Hills', 'Peninsular India', 'Passes']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_mapping_spatial_geography.coastal_features_islands_maritime_channels', 'coastal_features_islands_maritime_channels', 'Coastal Features, Island Territories & Maritime Channels (10 Degree Channel: Andaman & Nicobar, 9 Degree Channel: Minicoy & Lakshadweep, 8 Degree Channel: Minicoy & Maldives, Palk Strait, Gulf of Mannar, Rann of Kutch, Sir Creek, Konkan & Coromandel Coast)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1] [SSC: GA]', '', ARRAY['10 Degree Channel', '9 Degree Channel', '8 Degree Channel', 'Palk Strait', 'Gulf of Mannar', 'Andaman Nicobar', 'Lakshadweep']::text[], ARRAY['10 Degree Channel', '9 Degree Channel', 'Palk Strait', 'Gulf of Mannar', 'Andaman', 'Lakshadweep', 'Coastline', 'Islands']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.indian_mapping_spatial_geography.infrastructure_ports_transport_corridors', 'infrastructure_ports_transport_corridors', 'Major Sea Ports, National Waterways, Dedicated Freight Corridors & Industrial Transport Corridors (Major 13 Ports, NW-1 to NW-5, Western & Eastern DFC, Golden Quadrilateral & Strategic Expressways)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.indian_mapping_spatial_geography']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS3"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS3] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY['Major Ports India', 'National Waterways', 'Dedicated Freight Corridors', 'Golden Quadrilateral']::text[], ARRAY['Ports', 'National Waterways', 'Freight Corridors', 'DFC', 'Infrastructure Mapping', 'Transport Corridors']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.karnataka_mapping_state_geography.river_basins_waterfalls_reservoirs', 'river_basins_waterfalls_reservoirs', 'Karnataka River Basins, Tributaries, Waterfalls & Major Dams Spatial Distribution (Krishna, Cauvery, Godavari, Pennar, West-Flowing Rivers: Sharavathi, Bedthi, Netravathi; Waterfalls: Jog, Shivanasamudra, Gokak, Magod, Abbey; Dams: KRS, Almatti, Tungabhadra, Linganamakki)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.karnataka_mapping_state_geography',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.karnataka_mapping_state_geography']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY['Krishna Basin', 'Cauvery Basin', 'Sharavathi', 'Jog Falls', 'Shivanasamudra', 'KRS Dam', 'Almatti']::text[], ARRAY['Karnataka Rivers', 'Krishna', 'Cauvery', 'Sharavathi', 'Jog Falls', 'Gokak', 'KRS Dam', 'Almatti', 'Waterfalls']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.karnataka_mapping_state_geography.western_ghats_peaks_elevations', 'western_ghats_peaks_elevations', 'Western Ghats Mountain Peaks & Elevations Descending Order in Karnataka (Mullayanagiri 1930m, Bababudangiri 1895m, Kudremukh 1894m, Pushpagiri / Kumara Parvatha 1712m, Tadiandamol 1748m, Biligirirangana Hills)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.karnataka_mapping_state_geography',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.karnataka_mapping_state_geography']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY['Mullayanagiri', 'Bababudangiri', 'Kudremukh', 'Pushpagiri', 'Tadiandamol', 'Western Ghats Karnataka']::text[], ARRAY['Peaks Karnataka', 'Mullayanagiri', 'Kudremukh', 'Bababudangiri', 'Pushpagiri', 'Tadiandamol', 'Elevation Order']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.karnataka_mapping_state_geography.agro_climatic_zones_mineral_belts', 'agro_climatic_zones_mineral_belts', '10 Agro-Climatic Zones, District Boundaries, National Parks & Mineral Belts of Karnataka (Coastal, Hilly/Malnad, Northern Dry, Central Dry, Southern Dry; Sandur/Bellary Iron Ore, Kolar Gold, Hassan Chromite; Bandipur, Nagarhole, Kudremukh, Anshi, Bannerghatta)', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.karnataka_mapping_state_geography',
        ARRAY[]::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.karnataka_mapping_state_geography']::text[], '{"upsc": ["Prelims-GS1"], "kas": ["Prelims-P1", "Mains-GS2"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1] [KAS: Prelims-P1, Mains-GS2] [SSC: GA]', '', ARRAY['Agro-Climatic Zones Karnataka', 'Mineral Belts', 'Sandur', 'Bandipur', 'Nagarhole', 'Kudremukh']::text[], ARRAY['10 Agro-Climatic Zones', 'Districts Karnataka', 'Mineral Belts', 'National Parks Karnataka', 'Bandipur', 'Nagarhole']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.indian_literature_languages.classical_languages_of_india_scripts', 'classical_languages_of_india_scripts', 'Classical Languages of India & Evolution of Scripts', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.indian_literature_languages',
        ARRAY['art_culture_heritage.indian_literature_languages.classical_languages_of_india_scripts.classical_languages_of_india_criteria_recognition', 'art_culture_heritage.indian_literature_languages.classical_languages_of_india_scripts.evolution_of_ancient_indian_scripts_brahmi_kharosthi']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.indian_literature_languages']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Classical', 'Languages', 'India', 'Evolution', 'Scripts']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.fairs_festivals_crafts_unesco_heritage.major_fairs_religious_cultural_festivals', 'major_fairs_religious_cultural_festivals', 'Major Fairs & Religious Cultural Festivals of India', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage',
        ARRAY['art_culture_heritage.fairs_festivals_crafts_unesco_heritage.major_fairs_religious_cultural_festivals.major_religious_cultural_fairs_festivals_india']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.fairs_festivals_crafts_unesco_heritage']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Major', 'Fairs', 'Religious', 'Cultural', 'Festivals', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.art_culture_of_karnataka.karnataka_temple_architecture_sculpture', 'karnataka_temple_architecture_sculpture', 'Karnataka Temple Architecture & Sculptural Evolution', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.art_culture_of_karnataka',
        ARRAY['art_culture_heritage.art_culture_of_karnataka.karnataka_temple_architecture_sculpture.badami_chalukya_architecture_aihole_badami_pattadakal', 'art_culture_heritage.art_culture_of_karnataka.karnataka_temple_architecture_sculpture.hoysala_architecture_sculpture_belur_halebidu_somanathapura', 'art_culture_heritage.art_culture_of_karnataka.karnataka_temple_architecture_sculpture.vijayanagara_architecture_hampi_unesco_monuments', 'art_culture_heritage.art_culture_of_karnataka.karnataka_temple_architecture_sculpture.rashtrakuta_kadamba_ganga_bahmani_architecture']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.art_culture_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Karnataka', 'Temple', 'Architecture', 'Sculptural', 'Evolution']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka', 'performing_arts_theatre_folk_traditions_of_karnataka', 'Performing Arts, Theatre & Folk Traditions of Karnataka', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.art_culture_of_karnataka',
        ARRAY['art_culture_heritage.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka.yakshagana_theatre_tradition_coastal_malnad', 'art_culture_heritage.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka.karnataka_folk_dances_dollu_kunitha_veeragase_kamsale', 'art_culture_heritage.art_culture_of_karnataka.performing_arts_theatre_folk_traditions_of_karnataka.puppetry_traditions_togalu_gombeyaata_karnataka']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.art_culture_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Performing', 'Arts', 'Theatre', 'Folk', 'Traditions', 'Karnataka']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage', 'karnataka_paintings_crafts_gi_heritage', 'Karnataka Paintings, Traditional Crafts & GI Heritage', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.art_culture_of_karnataka',
        ARRAY['art_culture_heritage.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage.mysore_traditional_paintings_gesso_work', 'art_culture_heritage.art_culture_of_karnataka.karnataka_paintings_crafts_gi_heritage.gi_tagged_handicrafts_and_textiles_of_karnataka']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.art_culture_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Karnataka', 'Paintings', 'Traditional', 'Crafts', 'GI', 'Heritage']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka', 'vachana_haridasa_bhakti_movements_of_karnataka', 'Vachana & Haridasa Bhakti Movements of Karnataka', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.art_culture_of_karnataka',
        ARRAY['art_culture_heritage.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka.vachana_movement_basaveshwara_anubhava_mantapa', 'art_culture_heritage.art_culture_of_karnataka.vachana_haridasa_bhakti_movements_of_karnataka.haridasa_movement_purandara_dasa_kanaka_dasa']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.art_culture_of_karnataka']::text[], '{"kas": ["Prelims-P1", "Mains-GS1"], "upsc": ["Prelims-GS1", "Mains-GS1"]}'::jsonb,
        '[KAS: Prelims-P1, Mains-GS1] [UPSC: Prelims-GS1, Mains-GS1]', '', ARRAY[]::text[], ARRAY['Vachana', 'Haridasa', 'Bhakti', 'Movements', 'Karnataka']::text[],
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
        'art_culture_heritage.martial_arts_traditional_sports_calendars.martial_arts_and_traditional_sports_of_india', 'martial_arts_and_traditional_sports_of_india', 'Traditional Martial Arts & Indigenous Sports of India', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.martial_arts_traditional_sports_calendars',
        ARRAY['art_culture_heritage.martial_arts_traditional_sports_calendars.martial_arts_and_traditional_sports_of_india.traditional_indian_martial_arts_forms', 'art_culture_heritage.martial_arts_traditional_sports_calendars.martial_arts_and_traditional_sports_of_india.indigenous_sports_and_animal_sports_of_india']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.martial_arts_traditional_sports_calendars']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Traditional', 'Martial', 'Arts', 'Indigenous', 'Sports', 'India']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.martial_arts_traditional_sports_calendars.indian_calendar_systems_eras_national_symbols', 'indian_calendar_systems_eras_national_symbols', 'Indian Calendar Systems, Historical Eras & National Symbols', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.martial_arts_traditional_sports_calendars',
        ARRAY['art_culture_heritage.martial_arts_traditional_sports_calendars.indian_calendar_systems_eras_national_symbols.indian_calendar_systems_and_historical_eras', 'art_culture_heritage.martial_arts_traditional_sports_calendars.indian_calendar_systems_eras_national_symbols.national_symbols_insignia_and_heritage_emblems']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.martial_arts_traditional_sports_calendars']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Indian', 'Calendar', 'Systems', 'Historical', 'Eras', 'National', 'Symbols']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.cultural_institutions_numismatics_initiatives.national_cultural_institutions_and_bodies', 'national_cultural_institutions_and_bodies', 'Premier National Cultural Institutions, Akademis & Museums', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.cultural_institutions_numismatics_initiatives',
        ARRAY['art_culture_heritage.cultural_institutions_numismatics_initiatives.national_cultural_institutions_and_bodies.premier_cultural_institutions_akademis_asi', 'art_culture_heritage.cultural_institutions_numismatics_initiatives.national_cultural_institutions_and_bodies.national_museums_galleries_and_libraries']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.cultural_institutions_numismatics_initiatives']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Premier', 'National', 'Cultural', 'Institutions', 'Akademis', 'Museums']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.cultural_institutions_numismatics_initiatives.ancient_and_medieval_indian_coinage_numismatics', 'ancient_and_medieval_indian_coinage_numismatics', 'Ancient & Medieval Indian Coinage (Numismatics)', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.cultural_institutions_numismatics_initiatives',
        ARRAY['art_culture_heritage.cultural_institutions_numismatics_initiatives.ancient_and_medieval_indian_coinage_numismatics.ancient_indian_coinage_punch_marked_to_guptas', 'art_culture_heritage.cultural_institutions_numismatics_initiatives.ancient_and_medieval_indian_coinage_numismatics.medieval_coinage_south_india_sultanate_mughal']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.cultural_institutions_numismatics_initiatives']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Ancient', 'Medieval', 'Indian', 'Coinage', 'Numismatics']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'art_culture_heritage.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards', 'government_heritage_conservation_schemes_awards', 'Government Heritage Conservation Schemes & Cultural Awards', 3,
        'Topic', 'Art, Culture & Heritage', 'art_culture_heritage', 'art_culture_heritage.cultural_institutions_numismatics_initiatives',
        ARRAY['art_culture_heritage.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards.cultural_heritage_schemes_and_initiatives', 'art_culture_heritage.cultural_institutions_numismatics_initiatives.government_heritage_conservation_schemes_awards.national_cultural_awards_and_honours']::text[], ARRAY['art_culture_heritage', 'art_culture_heritage.cultural_institutions_numismatics_initiatives']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Government', 'Heritage', 'Conservation', 'Schemes', 'Cultural', 'Awards']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.physical_geography_earth_systems.earth_and_the_solar_system', 'earth_and_the_solar_system', 'Earth and The Solar System', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems',
        ARRAY['geography_earth_systems.physical_geography_earth_systems.earth_and_the_solar_system.origin_of_earth_universe_solar_system', 'geography_earth_systems.physical_geography_earth_systems.earth_and_the_solar_system.earths_shape_dimensions_geoid']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Earth', 'Solar', 'System']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.physical_geography_earth_systems.rocks_formation_and_classification', 'rocks_formation_and_classification', 'Rocks: Formation and Classification', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems',
        ARRAY['geography_earth_systems.physical_geography_earth_systems.rocks_formation_and_classification.mineral_groups_and_physical_properties', 'geography_earth_systems.physical_geography_earth_systems.rocks_formation_and_classification.igneous_sedimentary_metamorphic_rocks_cycle']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Rocks', 'Formation', 'Classification']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.physical_geography_earth_systems.earthquakes', 'earthquakes', 'Earthquakes: Mechanics, Seismic Waves & Hazard Zones', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems',
        ARRAY['geography_earth_systems.physical_geography_earth_systems.earthquakes.earthquake_mechanics_waves_and_seismic_zones']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Earthquakes', 'Mechanics', 'Seismic', 'Waves', 'Hazard', 'Zones']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.physical_geography_earth_systems.volcanoes', 'volcanoes', 'Volcanoes: Volcanism, Intrusive & Extrusive Landforms', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems',
        ARRAY['geography_earth_systems.physical_geography_earth_systems.volcanoes.volcanic_forms_intrusive_plutonic_and_extrusive']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Volcanoes', 'Volcanism', 'Intrusive', 'Extrusive', 'Landforms']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.physical_geography_earth_systems.tsunamis', 'tsunamis', 'Tsunamis: Generation, Shoaling & Early Warning Systems', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems',
        ARRAY['geography_earth_systems.physical_geography_earth_systems.tsunamis.tsunami_generation_shoaling_and_early_warning']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.physical_geography_earth_systems']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Tsunamis', 'Generation', 'Shoaling', 'Early', 'Warning', 'Systems']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_moisture_condensation_precipitation', 'atmospheric_moisture_condensation_precipitation', 'Atmospheric Moisture, Condensation & Precipitation', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics',
        ARRAY['geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_moisture_condensation_precipitation.humidity_dew_point_condensation_forms_fog', 'geography_earth_systems.climatology_atmospheric_dynamics.atmospheric_moisture_condensation_precipitation.clouds_classification_and_rainfall_mechanisms']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Atmospheric', 'Moisture', 'Condensation', 'Precipitation']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.climatology_atmospheric_dynamics.hydrological_cycle_and_water_balance', 'hydrological_cycle_and_water_balance', 'Hydrological Cycle & Global Water Balance', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics',
        ARRAY['geography_earth_systems.climatology_atmospheric_dynamics.hydrological_cycle_and_water_balance.global_hydrological_cycle_and_water_balance']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Hydrological', 'Cycle', 'Global', 'Water', 'Balance']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.climatology_atmospheric_dynamics.groundwater_hydrology_and_aquifers', 'groundwater_hydrology_and_aquifers', 'Groundwater Hydrology, Aquifers & Springs', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics',
        ARRAY['geography_earth_systems.climatology_atmospheric_dynamics.groundwater_hydrology_and_aquifers.groundwater_hydrology_aquifers_and_springs']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.climatology_atmospheric_dynamics']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', '', ARRAY[]::text[], ARRAY['Groundwater', 'Hydrology', 'Aquifers', 'Springs']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.human_geography_population_settlements.tribal_demographics_and_cultural_anthropology', 'tribal_demographics_and_cultural_anthropology', 'Tribal Demographics, PVTGs & Cultural Anthropology', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.human_geography_population_settlements',
        ARRAY['geography_earth_systems.human_geography_population_settlements.tribal_demographics_and_cultural_anthropology.tribal_demographics_and_spatial_distribution_india', 'geography_earth_systems.human_geography_population_settlements.tribal_demographics_and_cultural_anthropology.particularly_vulnerable_tribal_groups_pvtgs_and_rights']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.human_geography_population_settlements']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Spatial distribution, demographic profiles, linguistic classifications of Scheduled Tribes in India; Particularly Vulnerable Tribal Groups (PVTGs), Forest Rights Act, PESA, and tribal development policies.', ARRAY['Scheduled Tribes', 'PVTGs (Particularly Vulnerable Tribal Groups)', 'Forest Rights Act 2006', 'PESA Act 1996', 'Central Tribal Belt', 'North-Eastern Tribes']::text[], ARRAY['Tribal', 'Demographics', 'PVTGs', 'Cultural', 'Anthropology', 'Spatial', 'distribution', 'demographic', 'profiles', 'linguistic', 'classifications', 'Scheduled', 'Tribes', 'India', 'Particularly', 'Vulnerable', 'Groups', 'Forest', 'Rights', 'Act', 'PESA', 'tribal', 'development', 'policies', '2006', '1996', 'Central', 'Belt', 'North', 'Eastern']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.economic_resource_geography.agricultural_geography_and_food_security', 'agricultural_geography_and_food_security', 'Agricultural Geography, Cropping Patterns & Food Security', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.economic_resource_geography',
        ARRAY['geography_earth_systems.economic_resource_geography.agricultural_geography_and_food_security.cropping_patterns_major_food_commercial_crops_india', 'geography_earth_systems.economic_resource_geography.agricultural_geography_and_food_security.agricultural_revolutions_land_reforms_food_security']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.economic_resource_geography']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Cropping patterns, agro-climatic zones, Green/White/Blue revolutions, irrigation infrastructure, land reforms, Public Distribution System, and National Food Security.', ARRAY['Agro-Climatic Zones', 'Cropping Patterns', 'Green Revolution', 'Food Corporation of India', 'PDS & NFSA 2013', 'Land Reforms']::text[], ARRAY['Agricultural', 'Geography', 'Cropping', 'Patterns', 'Food', 'Security', 'patterns', 'agro', 'climatic', 'zones', 'Green', 'White', 'Blue', 'revolutions', 'irrigation', 'infrastructure', 'land', 'reforms', 'Public', 'Distribution', 'System', 'National', 'Agro', 'Climatic', 'Zones', 'Revolution', 'Corporation', 'India', 'PDS', 'NFSA', '2013', 'Land', 'Reforms']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world.regional_geography_united_states', 'regional_geography_united_states', 'Regional Geography of United States: Physiography, Agricultural & Industrial Belts', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_the_world',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_united_states.us_physical_relief_drainage_and_climate', 'geography_earth_systems.geography_of_the_world.regional_geography_united_states.us_economic_agricultural_and_industrial_belts']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_the_world']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Comprehensive physical relief, drainage (Mississippi-Missouri, Colorado, Great Lakes), agricultural belts (Corn Belt, Wheat Belt, Cotton Belt), and industrial manufacturing/tech complexes (Rust Belt, Silicon Valley, Texas Sunbelt).', ARRAY['Appalachian Mountains', 'Rocky Mountains', 'Mississippi-Missouri Drainage', 'Great Lakes', 'Corn Belt & Wheat Belt', 'American Manufacturing Belt (Rust Belt)', 'Silicon Valley']::text[], ARRAY['Regional', 'Geography', 'United', 'States', 'Physiography', 'Agricultural', 'Industrial', 'Belts', 'Comprehensive', 'physical', 'relief', 'drainage', 'Mississippi', 'Missouri', 'Colorado', 'Great', 'Lakes', 'agricultural', 'belts', 'Corn', 'Belt', 'Wheat', 'Cotton', 'industrial', 'manufacturing', 'tech', 'complexes', 'Rust', 'Silicon', 'Valley', 'Texas', 'Sunbelt', 'Appalachian', 'Mountains', 'Rocky', 'Drainage', 'American', 'Manufacturing']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world.regional_geography_canada', 'regional_geography_canada', 'Regional Geography of Canada: Canadian Shield, Prairies & Energy Wealth', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_the_world',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_canada.canadian_shield_drainage_and_arctic_tundra', 'geography_earth_systems.geography_of_the_world.regional_geography_canada.canadian_prairies_resources_and_economy']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_the_world']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Laurentian Canadian Shield topography, glacial lake systems, St. Lawrence Seaway, Canadian Prairies grain belt, Athabasca oil sands, and mineral resources.', ARRAY['Canadian Shield (Laurentian Plateau)', 'St. Lawrence Seaway', 'Canadian Prairies (Alberta, Saskatchewan, Manitoba)', 'Athabasca Oil Sands', 'Sudbury Nickel Basin', 'Arctic Archipelago']::text[], ARRAY['Regional', 'Geography', 'Canada', 'Canadian', 'Shield', 'Prairies', 'Energy', 'Wealth', 'Laurentian', 'topography', 'glacial', 'lake', 'systems', 'St', 'Lawrence', 'Seaway', 'grain', 'belt', 'Athabasca', 'oil', 'sands', 'mineral', 'resources', 'Plateau', 'Alberta', 'Saskatchewan', 'Manitoba', 'Oil', 'Sands', 'Sudbury', 'Nickel', 'Basin', 'Arctic', 'Archipelago']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world.regional_geography_russia_central_asia', 'regional_geography_russia_central_asia', 'Regional Geography of Russia & Central Asia: Siberia, Steppes & Hydrocarbon Basins', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_the_world',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_russia_central_asia.russia_physical_divisions_siberia_and_drainage', 'geography_earth_systems.geography_of_the_world.regional_geography_russia_central_asia.central_asian_steppes_and_resource_geography']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_the_world']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Ural divide, West Siberian Plain, major north-flowing rivers (Ob, Yenisey, Lena), Lake Baikal, Central Asian steppes, Fergana Valley, and Caspian hydrocarbon basins.', ARRAY['Ural Mountains', 'West Siberian Plain', 'Lake Baikal', 'Volga River Basin', 'Fergana Valley', 'Central Asian Steppes', 'Caspian Energy Basin']::text[], ARRAY['Regional', 'Geography', 'Russia', 'Central', 'Asia', 'Siberia', 'Steppes', 'Hydrocarbon', 'Basins', 'Ural', 'divide', 'West', 'Siberian', 'Plain', 'major', 'north', 'flowing', 'rivers', 'Ob', 'Yenisey', 'Lena', 'Lake', 'Baikal', 'Asian', 'steppes', 'Fergana', 'Valley', 'Caspian', 'hydrocarbon', 'basins', 'Mountains', 'Volga', 'River', 'Basin', 'Energy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world.regional_geography_china_east_asia', 'regional_geography_china_east_asia', 'Regional Geography of China & East Asia: Relief, River Basins & Industrial Clusters', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_the_world',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_china_east_asia.china_physical_relief_drainage_and_basins', 'geography_earth_systems.geography_of_the_world.regional_geography_china_east_asia.china_economic_geography_and_industrial_regions']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_the_world']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Tibetan Plateau, major river systems (Yangtze, Huang He / Yellow River, Pearl River), Sichuan Red Basin, agricultural zoning, and coastal Special Economic Zones (SEZs).', ARRAY['Tibetan Plateau', 'Yangtze River (Chang Jiang)', 'Yellow River (Huang He)', 'Sichuan Red Basin', 'Pearl River Delta SEZ', 'Yangtze River Delta', 'Bayan Obo Rare Earths']::text[], ARRAY['Regional', 'Geography', 'China', 'East', 'Asia', 'Relief', 'River', 'Basins', 'Industrial', 'Clusters', 'Tibetan', 'Plateau', 'major', 'river', 'systems', 'Yangtze', 'Huang', 'He', 'Yellow', 'Pearl', 'Sichuan', 'Red', 'Basin', 'agricultural', 'zoning', 'coastal', 'Special', 'Economic', 'Zones', 'SEZs', 'Chang', 'Jiang', 'Delta', 'SEZ', 'Bayan', 'Obo', 'Rare', 'Earths']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world.regional_geography_japan', 'regional_geography_japan', 'Regional Geography of Japan: Archipelago Tectonics & Tokaido Industrial Megalopolis', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_the_world',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_japan.japan_archipelago_physiography_and_volcanism', 'geography_earth_systems.geography_of_the_world.regional_geography_japan.japan_economic_geography_and_industrial_belts']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_the_world']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Island geography (Honshu, Hokkaido, Kyushu, Shikoku), tectonic volcanism, Ring of Fire seismicity, Kanto Plain, Tokaido Megalopolis manufacturing belts, and marine fishing grounds.', ARRAY['Japanese Archipelago (4 Main Islands)', 'Mount Fuji & Japanese Alps', 'Kanto Plain', 'Tokaido Megalopolis (Keihin, Hanshin, Chukyo)', 'Kuroshio & Oyashio Fisheries', 'Ring of Fire Seismicity']::text[], ARRAY['Regional', 'Geography', 'Japan', 'Archipelago', 'Tectonics', 'Tokaido', 'Industrial', 'Megalopolis', 'Island', 'geography', 'Honshu', 'Hokkaido', 'Kyushu', 'Shikoku', 'tectonic', 'volcanism', 'Ring', 'Fire', 'seismicity', 'Kanto', 'Plain', 'manufacturing', 'belts', 'marine', 'fishing', 'grounds', 'Japanese', 'Main', 'Islands', 'Mount', 'Fuji', 'Alps', 'Keihin', 'Hanshin', 'Chukyo', 'Kuroshio', 'Oyashio', 'Fisheries', 'Seismicity']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world.regional_geography_south_asia', 'regional_geography_south_asia', 'Regional Geography of South Asia: Subcontinent Relief, Drainage & Climate Vulnerability', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_the_world',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_south_asia.south_asian_subcontinent_physiography_and_drainage', 'geography_earth_systems.geography_of_the_world.regional_geography_south_asia.south_asian_climate_agriculture_and_resources']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_the_world']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Physiography of South Asian subcontinent (Himalayas, Hindu Kush, Indo-Gangetic-Brahmaputra plain, Thar Desert), monsoon climate dynamics, transboundary river treaties, and climate vulnerability.', ARRAY['Himalayan-Hindu Kush Barrier', 'Indus & Ganga-Brahmaputra Basins', 'Thar Desert & Chagai Hills', 'South Asian Monsoon', 'Transboundary River Treaties', 'Bay of Bengal Cyclone Vulnerability']::text[], ARRAY['Regional', 'Geography', 'South', 'Asia', 'Subcontinent', 'Relief', 'Drainage', 'Climate', 'Vulnerability', 'Physiography', 'Asian', 'subcontinent', 'Himalayas', 'Hindu', 'Kush', 'Indo', 'Gangetic', 'Brahmaputra', 'plain', 'Thar', 'Desert', 'monsoon', 'climate', 'dynamics', 'transboundary', 'river', 'treaties', 'vulnerability', 'Himalayan', 'Barrier', 'Indus', 'Ganga', 'Basins', 'Chagai', 'Hills', 'Monsoon', 'Transboundary', 'River', 'Treaties', 'Bay', 'Bengal', 'Cyclone']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world.regional_geography_south_east_asia', 'regional_geography_south_east_asia', 'Regional Geography of South-East Asia: Mainland River Systems & Insular Archipelagos', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_the_world',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_south_east_asia.mainland_indochina_physiography_and_rivers', 'geography_earth_systems.geography_of_the_world.regional_geography_south_east_asia.insular_southeast_asia_archipelago_and_resources']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_the_world']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Mainland Indochina rivers (Mekong, Irrawaddy, Chao Phraya, Red River), maritime archipelagos (Indonesia, Philippines, Malaysia), volcanic arcs, Sunda Shelf, and tropical agricultural/mineral resources.', ARRAY['Mekong River Basin', 'Tonle Sap Lake', 'Indonesian Archipelago (Java, Sumatra, Borneo)', 'Sunda Shelf & Sahul Shelf', 'Pacific Ring of Fire Volcanism', 'Palm Oil & Rubber Belts']::text[], ARRAY['Regional', 'Geography', 'South', 'East', 'Asia', 'Mainland', 'River', 'Systems', 'Insular', 'Archipelagos', 'Indochina', 'rivers', 'Mekong', 'Irrawaddy', 'Chao', 'Phraya', 'Red', 'maritime', 'archipelagos', 'Indonesia', 'Philippines', 'Malaysia', 'volcanic', 'arcs', 'Sunda', 'Shelf', 'tropical', 'agricultural', 'mineral', 'resources', 'Basin', 'Tonle', 'Sap', 'Lake', 'Indonesian', 'Archipelago', 'Java', 'Sumatra', 'Borneo', 'Sahul', 'Pacific', 'Ring', 'Fire', 'Volcanism', 'Palm', 'Oil', 'Rubber', 'Belts']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world.regional_geography_new_zealand', 'regional_geography_new_zealand', 'Regional Geography of New Zealand: Southern Alps, Volcanic Zones & Pastoral Economy', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_the_world',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_new_zealand.new_zealand_north_and_south_island_physiography', 'geography_earth_systems.geography_of_the_world.regional_geography_new_zealand.new_zealand_climate_pastoral_economy_and_resources']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_the_world']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'North and South Islands separated by Cook Strait; Southern Alps and fiordlands; Taupo Volcanic Zone and geothermal features; Canterbury Plains; temperate maritime climate and dairy/pastoral economy.', ARRAY['Cook Strait', 'Southern Alps & Mount Cook (Aoraki)', 'Taupo Volcanic Zone & Rotorua', 'Canterbury Plains', 'Fiordland (Milford Sound)', 'Fonterra & Dairy Pastoral Economy']::text[], ARRAY['Regional', 'Geography', 'New', 'Zealand', 'Southern', 'Alps', 'Volcanic', 'Zones', 'Pastoral', 'Economy', 'North', 'South', 'Islands', 'separated', 'Cook', 'Strait', 'fiordlands', 'Taupo', 'Zone', 'geothermal', 'features', 'Canterbury', 'Plains', 'temperate', 'maritime', 'climate', 'dairy', 'pastoral', 'economy', 'Mount', 'Aoraki', 'Rotorua', 'Fiordland', 'Milford', 'Sound', 'Fonterra', 'Dairy']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica', 'regional_geography_europe_africa_americas_oceania_antarctica', 'Continental Geography: Europe, Africa, South America, Australia & Antarctica', 3,
        'Topic', 'Geography & Earth Systems', 'geography_earth_systems', 'geography_earth_systems.geography_of_the_world',
        ARRAY['geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica.europe_regional_physiography_and_river_basins', 'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica.africa_regional_physiography_rift_valley_and_basins', 'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica.south_america_regional_physiography_and_biomes', 'geography_earth_systems.geography_of_the_world.regional_geography_europe_africa_americas_oceania_antarctica.australia_oceania_and_antarctica_geography']::text[], ARRAY['geography_earth_systems', 'geography_earth_systems.geography_of_the_world']::text[], '{"upsc": ["Prelims-GS1", "Mains-GS1"], "kas": ["Prelims-P1", "Mains-GS1"], "ssc": ["GA"]}'::jsonb,
        '[UPSC: Prelims-GS1, Mains-GS1] [KAS: Prelims-P1, Mains-GS1] [SSC: GA]', 'Continental physical features, river basins, plateaus, and biomes: Europe (North European Plain, Rhine, Danube, Alps); Africa (Rift Valley, Nile, Congo, Sahara); South America (Andes, Amazon, Pampas, Atacama); Australia (Great Dividing Range, Murray-Darling, Great Barrier Reef); Antarctica (ice sheet, Transantarctic Mountains).', ARRAY['East African Rift Valley', 'Amazon Basin & Andes Mountains', 'Rhine & Danube River Systems', 'Great Dividing Range & Outback', 'Antarctic Ice Sheet & Vinson Massif', 'Pampas, Selvas & Llanos Biomes']::text[], ARRAY['Continental', 'Geography', 'Europe', 'Africa', 'South', 'America', 'Australia', 'Antarctica', 'physical', 'features', 'river', 'basins', 'plateaus', 'biomes', 'North', 'European', 'Plain', 'Rhine', 'Danube', 'Alps', 'Rift', 'Valley', 'Nile', 'Congo', 'Sahara', 'Andes', 'Amazon', 'Pampas', 'Atacama', 'Great', 'Dividing', 'Range', 'Murray', 'Darling', 'Barrier', 'Reef', 'ice', 'sheet', 'Transantarctic', 'Mountains', 'East', 'African', 'Basin', 'River', 'Systems', 'Outback', 'Antarctic', 'Ice', 'Sheet', 'Vinson', 'Massif', 'Selvas', 'Llanos', 'Biomes']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders.dyslexia_dyscalculia_dysgraphia_dyspraxia_identification', 'dyslexia_dyscalculia_dysgraphia_dyspraxia_identification', 'Specific Learning Disabilities: Dyslexia, Dyscalculia, Dysgraphia, Dyspraxia', 3,
        'Topic', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders',
        ARRAY[]::text[], ARRAY['inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['SPECIFIC LEARNING DISABILITIES: DYSLEXIA, DYSCALCULIA, DYSGRAPHIA, DYSPRAXIA']::text[],
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
        'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders.adhd_attention_deficit_hyperactivity_disorder_classroom_interventions', 'adhd_attention_deficit_hyperactivity_disorder_classroom_interventions', 'ADHD (Attention Deficit Hyperactivity Disorder) & Behavioral Interventions', 3,
        'Topic', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders',
        ARRAY[]::text[], ARRAY['inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ADHD (ATTENTION DEFICIT HYPERACTIVITY DISORDER) & BEHAVIORAL INTERVENTIONS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders.autism_spectrum_disorder_asd_sensory_communication_needs', 'autism_spectrum_disorder_asd_sensory_communication_needs', 'Autism Spectrum Disorder (ASD): Communication Strategies & Sensory Needs', 3,
        'Topic', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders',
        ARRAY[]::text[], ARRAY['inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.learning_disabilities_and_neurodevelopmental_disorders']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['AUTISM SPECTRUM DISORDER (ASD): COMMUNICATION STRATEGIES & SENSORY NEEDS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged.gifted_and_talented_children_enrichment_acceleration_programmes', 'gifted_and_talented_children_enrichment_acceleration_programmes', 'Gifted and Talented Learners: Identification, Enrichment & Acceleration', 3,
        'Topic', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged',
        ARRAY[]::text[], ARRAY['inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['GIFTED AND TALENTED LEARNERS: IDENTIFICATION, ENRICHMENT & ACCELERATION']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged.first_generation_learners_sedg_socio-economically_disadvantaged_groups', 'first_generation_learners_sedg_socio-economically_disadvantaged_groups', 'First Generation Learners & Socio-Economically Disadvantaged Groups (SEDGs)', 3,
        'Topic', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged',
        ARRAY[]::text[], ARRAY['inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['FIRST GENERATION LEARNERS & SOCIO-ECONOMICALLY DISADVANTAGED GROUPS (SEDGS)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged.gender_sensitization_gender_bias_stereotypes_in_textbooks_classrooms', 'gender_sensitization_gender_bias_stereotypes_in_textbooks_classrooms', 'Gender Sensitization, Stereotypes in Textbooks & Inclusive Classroom Culture', 3,
        'Topic', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged',
        ARRAY[]::text[], ARRAY['inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.diverse_learners_gifted_socio-economically_disadvantaged']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['GENDER SENSITIZATION, STEREOTYPES IN TEXTBOOKS & INCLUSIVE CLASSROOM CULTURE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks.rights_of_persons_with_disabilities_act_rpwd_2016_21_disabilities', 'rights_of_persons_with_disabilities_act_rpwd_2016_21_disabilities', 'Rights of Persons with Disabilities (RPwD) Act 2016 (21 Specified Disabilities)', 3,
        'Topic', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks',
        ARRAY[]::text[], ARRAY['inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['RIGHTS OF PERSONS WITH DISABILITIES (RPWD) ACT 2016 (21 SPECIFIED DISABILITIES)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks.individualized_education_plan_iep_universal_design_for_learning_udl', 'individualized_education_plan_iep_universal_design_for_learning_udl', 'Individualized Education Plan (IEP) & Universal Design for Learning (UDL)', 3,
        'Topic', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks',
        ARRAY[]::text[], ARRAY['inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['INDIVIDUALIZED EDUCATION PLAN (IEP) & UNIVERSAL DESIGN FOR LEARNING (UDL)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks.assistive_devices_braille_screen_readers_hearing_aids_in_inclusive_schools', 'assistive_devices_braille_screen_readers_hearing_aids_in_inclusive_schools', 'Assistive Technologies: Braille, Screen Readers, AAC & Hearing Aids', 3,
        'Topic', 'INCLUSIVE_EDUCATION_DIVERSE_LEARNERS_SPECIAL_NEEDS', 'inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks',
        ARRAY[]::text[], ARRAY['inclusive_education_diverse_learners_special_needs', 'inclusive_education_diverse_learners_special_needs.assistive_technologies_and_rights_frameworks']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ASSISTIVE TECHNOLOGIES: BRAILLE, SCREEN READERS, AAC & HEARING AIDS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials.child-centered_vs_teacher-centered_pedagogy_inquiry-based_learning', 'child-centered_vs_teacher-centered_pedagogy_inquiry-based_learning', 'Child-Centered vs Teacher-Centered Methods: Inquiry & Problem-Based Learning', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['CHILD-CENTERED VS TEACHER-CENTERED METHODS: INQUIRY & PROBLEM-BASED LEARNING']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials.cooperative_and_collaborative_learning_jigsaw_peer_tutoring', 'cooperative_and_collaborative_learning_jigsaw_peer_tutoring', 'Cooperative & Collaborative Learning Strategies: Jigsaw, Think-Pair-Share, Peer Tutoring', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['COOPERATIVE & COLLABORATIVE LEARNING STRATEGIES: JIGSAW, THINK-PAIR-SHARE, PEER TUTORING']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials.ict_integration_in_education_digital_tools_diksha_swayam_moocs', 'ict_integration_in_education_digital_tools_diksha_swayam_moocs', 'ICT Integration in Education: DIKSHA, SWAYAM, PM eVidya & Digital Resources', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ICT INTEGRATION IN EDUCATION: DIKSHA, SWAYAM, PM EVIDYA & DIGITAL RESOURCES']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials.bloom_taxonomy_revised_anderson_krathwohl_cognitive_affective_psychomotor', 'bloom_taxonomy_revised_anderson_krathwohl_cognitive_affective_psychomotor', 'Bloom''s Revised Taxonomy (Anderson & Krathwohl): Cognitive, Affective & Psychomotor Domains', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.instructional_methods_and_teaching-learning_materials']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['BLOOM''S REVISED TAXONOMY (ANDERSON & KRATHWOHL): COGNITIVE, AFFECTIVE & PSYCHOMOTOR DOMAINS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.assessment_for_learning_of_learning_as_learning_formative_summative', 'assessment_for_learning_of_learning_as_learning_formative_summative', 'Assessment For, Of & As Learning: Formative vs Summative Assessment', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ASSESSMENT FOR, OF & AS LEARNING: FORMATIVE VS SUMMATIVE ASSESSMENT']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.continuous_and_comprehensive_evaluation_cce_scholastic_co-scholastic', 'continuous_and_comprehensive_evaluation_cce_scholastic_co-scholastic', 'Continuous and Comprehensive Evaluation (CCE): Scholastic & Co-Scholastic Aspects', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['CONTINUOUS AND COMPREHENSIVE EVALUATION (CCE): SCHOLASTIC & CO-SCHOLASTIC ASPECTS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.tools_and_techniques_rubrics_portfolios_anecdotal_records_rating_scales', 'tools_and_techniques_rubrics_portfolios_anecdotal_records_rating_scales', 'Evaluation Tools: Rubrics, Portfolios, Anecdotal Records & Checklists', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['EVALUATION TOOLS: RUBRICS, PORTFOLIOS, ANECDOTAL RECORDS & CHECKLISTS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.characteristics_of_a_good_test_validity_reliability_usability_objectivity', 'characteristics_of_a_good_test_validity_reliability_usability_objectivity', 'Characteristics of a Standardized Test: Validity, Reliability, Usability & Objectivity', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['CHARACTERISTICS OF A STANDARDIZED TEST: VALIDITY, RELIABILITY, USABILITY & OBJECTIVITY']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction.diagnostic_testing_and_remedial_teaching_strategies', 'diagnostic_testing_and_remedial_teaching_strategies', 'Diagnostic Testing, Error Analysis & Remedial Teaching Strategies', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.assessment_evaluation_cce_and_test_construction']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['DIAGNOSTIC TESTING, ERROR ANALYSIS & REMEDIAL TEACHING STRATEGIES']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management.action_research_steps_problem_hypothesis_data_action_reflection', 'action_research_steps_problem_hypothesis_data_action_reflection', 'Educational Action Research: Steps (Plan, Act, Observe, Reflect)', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['EDUCATIONAL ACTION RESEARCH: STEPS (PLAN, ACT, OBSERVE, REFLECT)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management.classroom_management_strategies_positive_discipline_behavioral_support', 'classroom_management_strategies_positive_discipline_behavioral_support', 'Classroom Management: Positive Behavioral Interventions & Supports (PBIS)', 3,
        'Topic', 'PEDAGOGICAL_STRATEGIES_CURRICULUM_ASSESSMENT', 'pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management',
        ARRAY[]::text[], ARRAY['pedagogical_strategies_curriculum_assessment', 'pedagogical_strategies_curriculum_assessment.action_research_and_classroom_management']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['CLASSROOM MANAGEMENT: POSITIVE BEHAVIORAL INTERVENTIONS & SUPPORTS (PBIS)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_mathematics.nature_scope_values_of_mathematics_inductive_deductive_methods', 'nature_scope_values_of_mathematics_inductive_deductive_methods', 'Nature, Scope & Values of Mathematics: Inductive vs Deductive Reasoning', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_mathematics',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_mathematics']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['NATURE, SCOPE & VALUES OF MATHEMATICS: INDUCTIVE VS DEDUCTIVE REASONING']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_mathematics.mathematical_concepts_formation_van_hiele_geometric_thinking_levels', 'mathematical_concepts_formation_van_hiele_geometric_thinking_levels', 'Van Hiele Levels of Geometric Thinking & Number Sense Development', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_mathematics',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_mathematics']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['VAN HIELE LEVELS OF GEOMETRIC THINKING & NUMBER SENSE DEVELOPMENT']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_mathematics.remedial_strategies_for_dyscalculia_and_math_anxiety', 'remedial_strategies_for_dyscalculia_and_math_anxiety', 'Mathematical Misconceptions, Math Anxiety & Remedial Interventions', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_mathematics',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_mathematics']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['MATHEMATICAL MISCONCEPTIONS, MATH ANXIETY & REMEDIAL INTERVENTIONS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies.scientific_inquiry_process_skills_observation_experimentation_inference', 'scientific_inquiry_process_skills_observation_experimentation_inference', 'Scientific Inquiry & Science Process Skills: Observation, Hypothesis, Experimentation', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['SCIENTIFIC INQUIRY & SCIENCE PROCESS SKILLS: OBSERVATION, HYPOTHESIS, EXPERIMENTATION']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies.evs_themes_ncert_family_food_shelter_water_travel_things_we_make', 'evs_themes_ncert_family_food_shelter_water_travel_things_we_make', 'NCERT 6 EVS Themes: Family & Friends, Food, Shelter, Water, Travel, Things We Make', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['NCERT 6 EVS THEMES: FAMILY & FRIENDS, FOOD, SHELTER, WATER, TRAVEL, THINGS WE MAKE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies.laboratory_activities_science_kits_exhibitions_field_trips', 'laboratory_activities_science_kits_exhibitions_field_trips', 'Science Laboratories, Science Kits, Exhibitions & Hands-on Inquiry', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_science_and_environmental_studies']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['SCIENCE LABORATORIES, SCIENCE KITS, EXHIBITIONS & HANDS-ON INQUIRY']::text[],
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
        'subject_specific_pedagogies.pedagogy_of_social_sciences.nature_of_social_sciences_critical_thinking_source_method_role_play', 'nature_of_social_sciences_critical_thinking_source_method_role_play', 'Nature of Social Sciences: Source Method, Critical Inquiry & Role Play', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_social_sciences',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_social_sciences']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['NATURE OF SOCIAL SCIENCES: SOURCE METHOD, CRITICAL INQUIRY & ROLE PLAY']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_social_sciences.utilizing_primary_sources_maps_historical_evidence_in_classrooms', 'utilizing_primary_sources_maps_historical_evidence_in_classrooms', 'Utilizing Primary Historical Sources, Maps, Timelines & Artifacts', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_social_sciences',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_social_sciences']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['UTILIZING PRIMARY HISTORICAL SOURCES, MAPS, TIMELINES & ARTIFACTS']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_languages_kannada_english.four_language_skills_lsrw_listening_speaking_reading_writing', 'four_language_skills_lsrw_listening_speaking_reading_writing', 'Four Basic Language Skills: Listening, Speaking, Reading & Writing (LSRW)', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_languages_kannada_english',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_languages_kannada_english']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['FOUR BASIC LANGUAGE SKILLS: LISTENING, SPEAKING, READING & WRITING (LSRW)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_languages_kannada_english.chomsky_language_acquisition_device_lad_universal_grammar', 'chomsky_language_acquisition_device_lad_universal_grammar', 'Noam Chomsky Language Acquisition Device (LAD) & Universal Grammar', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_languages_kannada_english',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_languages_kannada_english']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['NOAM CHOMSKY LANGUAGE ACQUISITION DEVICE (LAD) & UNIVERSAL GRAMMAR']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'subject_specific_pedagogies.pedagogy_of_languages_kannada_english.approaches_to_language_teaching_communicative_structural_bilingual', 'approaches_to_language_teaching_communicative_structural_bilingual', 'Language Teaching Approaches: Communicative (CLT), Structural, Grammar-Translation, Direct Method', 3,
        'Topic', 'SUBJECT_SPECIFIC_PEDAGOGIES', 'subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_languages_kannada_english',
        ARRAY[]::text[], ARRAY['subject_specific_pedagogies', 'subject_specific_pedagogies.pedagogy_of_languages_kannada_english']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['LANGUAGE TEACHING APPROACHES: COMMUNICATIVE (CLT), STRUCTURAL, GRAMMAR-TRANSLATION, DIRECT METHOD']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts.national_education_policy_nep_2020_school_higher_education_5_3_3_4', 'national_education_policy_nep_2020_school_higher_education_5_3_3_4', 'National Education Policy (NEP 2020): 5+3+3+4 Curricular Structure, PARAKH, NCF-SE 2023', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['NATIONAL EDUCATION POLICY (NEP 2020): 5+3+3+4 CURRICULAR STRUCTURE, PARAKH, NCF-SE 2023']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts.right_to_education_act_rte_2009_provisions_pupil_teacher_ratio_smc', 'right_to_education_act_rte_2009_provisions_pupil_teacher_ratio_smc', 'Right to Education (RTE) Act 2009: Section Provisions, PTR (1:30, 1:35), SMC Role', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['RIGHT TO EDUCATION (RTE) ACT 2009: SECTION PROVISIONS, PTR (1:30, 1:35), SMC ROLE']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts.national_curriculum_frameworks_ncf_2005_ncf-se_2023_foundational_stage', 'national_curriculum_frameworks_ncf_2005_ncf-se_2023_foundational_stage', 'National Curriculum Frameworks: NCF 2005 Guiding Principles & NCF-FS / NCF-SE 2023', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.national_educational_policies_and_acts']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['NATIONAL CURRICULUM FRAMEWORKS: NCF 2005 GUIDING PRINCIPLES & NCF-FS / NCF-SE 2023']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.research_types_fundamental_applied_action_qualitative_quantitative', 'research_types_fundamental_applied_action_qualitative_quantitative', 'Types of Research: Fundamental, Applied, Action, Qualitative & Quantitative Research', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['TYPES OF RESEARCH: FUNDAMENTAL, APPLIED, ACTION, QUALITATIVE & QUANTITATIVE RESEARCH']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.research_process_problem_formulation_hypothesis_sampling_methods', 'research_process_problem_formulation_hypothesis_sampling_methods', 'Research Process: Problem Formulation, Hypothesis Testing & Probability/Non-Probability Sampling', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['RESEARCH PROCESS: PROBLEM FORMULATION, HYPOTHESIS TESTING & PROBABILITY/NON-PROBABILITY SAMPLING']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.data_collection_tools_questionnaires_interviews_observations_scales', 'data_collection_tools_questionnaires_interviews_observations_scales', 'Data Collection Tools: Questionnaires, Structured Interviews, Psychometric Scales', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['DATA COLLECTION TOOLS: QUESTIONNAIRES, STRUCTURED INTERVIEWS, PSYCHOMETRIC SCALES']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.research_ethics_plagiarism_citation_styles_apa_mla_chicago', 'research_ethics_plagiarism_citation_styles_apa_mla_chicago', 'Research Ethics, Plagiarism Prevention (UGC Regulations) & Referencing Styles (APA, MLA)', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['RESEARCH ETHICS, PLAGIARISM PREVENTION (UGC REGULATIONS) & REFERENCING STYLES (APA, MLA)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1.thesis_and_article_writing_format_style_peer_review', 'thesis_and_article_writing_format_style_peer_review', 'Thesis & Research Article Writing: Structure, Abstract, Methodology & Peer Review', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.research_methodology_kset_ugc_net_paper1']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['THESIS & RESEARCH ARTICLE WRITING: STRUCTURE, ABSTRACT, METHODOLOGY & PEER REVIEW']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance.higher_education_regulatory_bodies_ugc_aicte_ncte_naac_nirf', 'higher_education_regulatory_bodies_ugc_aicte_ncte_naac_nirf', 'Regulatory & Quality Assurance Bodies: UGC, AICTE, NCTE, NAAC, NIRF & ABC (Academic Bank of Credits)', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['REGULATORY & QUALITY ASSURANCE BODIES: UGC, AICTE, NCTE, NAAC, NIRF & ABC (ACADEMIC BANK OF CREDITS)']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance.evolution_of_higher_learning_in_ancient_india_takshashila_nalanda_valabhi', 'evolution_of_higher_learning_in_ancient_india_takshashila_nalanda_valabhi', 'Ancient Institutions of Higher Learning: Takshashila, Nalanda, Valabhi, Vikramashila', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['ANCIENT INSTITUTIONS OF HIGHER LEARNING: TAKSHASHILA, NALANDA, VALABHI, VIKRAMASHILA']::text[],
        'civil_services', ARRAY['civil_services']::text[]
    ),
    (
        'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance.value_education_environmental_education_in_higher_institutions', 'value_education_environmental_education_in_higher_institutions', 'Value Education, Environmental Education & Skill Development in Higher Education', 3,
        'Topic', 'NATIONAL_POLICIES_AND_HIGHER_EDUCATION_RESEARCH_APTITUDE', 'national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance',
        ARRAY[]::text[], ARRAY['national_policies_and_higher_education_research_aptitude', 'national_policies_and_higher_education_research_aptitude.higher_education_system_and_governance']::text[], '{"teaching": ["KARTET", "GPSTR", "HSTR", "CTET"], "kset": ["Paper-1"], "ugc_net": ["Paper-1"]}'::jsonb,
        '[Teaching: KARTET, GPSTR, HSTR, CTET] [KSET: Paper-1] [UGC-NET: Paper-1]', '', ARRAY[]::text[], ARRAY['VALUE EDUCATION, ENVIRONMENTAL EDUCATION & SKILL DEVELOPMENT IN HIGHER EDUCATION']::text[],
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
