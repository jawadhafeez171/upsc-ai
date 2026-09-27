import json

with open('scratch/populate_2011.py', 'r', encoding='utf-8') as f:
    code = f.read()

replacements = {
    "'node_id': 'history.world_history.global_challenges_transnational_crises_since_1900.nuclear_proliferation_arms_control_treaties_disarmament'":
        "'node_id': 'science_technology_defence.nuclear_technology_energy.international_nuclear_governance_treaties'",
    "'node_id': 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.greenhouse_effect_radiative_forcing'":
        "'node_id': 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.climate_change_science_global_warming'",
    "'node_id': 'environment_ecology_disaster_management.environmental_governance_legislative_framework.environmental_protection_act_forest_acts'":
        "'node_id': 'environment_ecology_disaster_management.environmental_legislation_institutions_eia_in_india.core_environmental_legislation'",
    "'node_id': 'history.world_history.industrial_revolution_rise_of_capitalism_socialism.socialist_thought_marxism_working_class_movement'":
        "'node_id': 'history.world_history.industrial_revolution_rise_of_capitalism_and_socialism.rise_of_economic_ideologies_capitalism_to_marxism'",
    "'node_id': 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.capital_account_flows_fdi_fpi_ecbs'":
        "'node_id': 'indian_economy_development.external_sector_balance_of_payments_foreign_trade.balance_of_payments_architecture'",
    "'node_id': 'indian_society_social_justice.welfare_schemes_vulnerable_sections.social_security_schemes'":
        "'node_id': 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups'",
    "'node_id': 'indian_polity_constitution_governance.constitutional_framework.preamble_citizenship_fundamental_rights'":
        "'node_id': 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35'",
    "'node_id': 'indian_society_social_justice.welfare_schemes_vulnerable_sections.disability_empowerment'":
        "'node_id': 'indian_society_social_justice.welfare_schemes_for_vulnerable_sections.protection_of_marginalised_groups'",
    "'node_id': 'indian_polity_constitution_governance.union_legislature_parliamentary_processes.budgetary_process_financial_bills'":
        "'node_id': 'indian_polity_constitution_governance.parliament_state_legislatures.legislative_procedure_bills'",
    "'node_id': 'indian_economy_development.monetary_policy_financial_intermediation.priority_sector_lending_financial_inclusion'":
        "'node_id': 'indian_economy_development.monetary_policy_banking_architecture.banking_structure_regulatory_framework'",
    "'node_id': 'indian_society_social_justice.welfare_schemes_vulnerable_sections.rural_employment_schemes'":
        "'node_id': 'indian_society_social_justice.poverty_inequality_developmental_challenges.poverty_concepts_measurement'",
    "'node_id': 'indian_polity_constitution_governance.constitutional_bodies.finance_commission_cag_attorney_general'":
        "'node_id': 'indian_polity_constitution_governance.statutory_regulatory_quasi-judicial_bodies.constitutional_bodies'",
    "'node_id': 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.water_pollution_marine_pollution_eutrophication'":
        "'node_id': 'environment_ecology_disaster_management.environmental_pollution_waste_management_remediation.water_pollution_aquatic_degradation'",
    "'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.faunal_diversity_mammals_birds_reptiles'":
        "'node_id': 'environment_ecology_disaster_management.biodiversity_wildlife_conservation_protected_areas.in-situ_conservation_architecture'",
    "'node_id': 'history.modern_india.economic_impact_of_british_rule.land_revenue_systems_permanent_settlement_ryotwari_mahalwari'":
        "'node_id': 'history.modern_india.economic_impact_of_british_rule.colonial_land_revenue_systems'",
    "'node_id': 'history.indian_freedom_struggle.wwii_cripps_mission_quit_india_ina.quit_india_movement_1942'":
        "'node_id': 'history.indian_freedom_struggle.wwii_cripps_mission_quit_india_movement_ina.quit_india_movement_august_kranti_1942'",
    "'node_id': 'history.modern_india.early_peasant_tribal_civil_uprisings.tribal_revolts_santhal_munda_kol_bhil_khasi'":
        "'node_id': 'history.modern_india.early_peasant_tribal_civil_uprisings.tribal_movements_insurrections'",
    "'node_id': 'science_technology_defence.information_communication_technology_ict_ai_cyber_security.telecommunications_wireless_infrastructure'":
        "'node_id': 'science_technology_defence.information_communication_technology_ai_cyber_security.telecommunications_wireless_infrastructure'",
    "'node_id': 'history.modern_india.economic_impact_of_british_rule.drain_of_wealth_theory_dadabhai_naoroji_rc_dutt'":
        "'node_id': 'history.modern_india.economic_impact_of_british_rule.drain_of_wealth_famine_dynamics'",
    "'node_id': 'history.indian_freedom_struggle.foundation_of_inc_moderate_phase.moderate_politics_ideology_methods'":
        "'node_id': 'history.indian_freedom_struggle.foundation_of_inc_moderate_phase.foundation_of_indian_national_congress'",
    "'node_id': 'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.gandhian_ideology_philosophical_foundations'":
        "'node_id': 'history.indian_freedom_struggle.gandhian_era_early_satyagrahas_non-cooperation_movement.emergence_of_mahatma_gandhi'",
    "'node_id': 'history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i.swadeshi_boycott_movement_1905_1908'":
        "'node_id': 'history.indian_freedom_struggle.swadeshi_movement_extremism_revolutionary_nationalism_phase_i.partition_of_bengal_swadeshi_movement'",
    "'node_id': 'indian_economy_development.monetary_policy_financial_intermediation.banking_sector_architecture_commercial_banks'":
        "'node_id': 'indian_economy_development.monetary_policy_banking_architecture.banking_structure_regulatory_framework'",
    "'node_id': 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.gdp_gnp_national_income_methodology'":
        "'node_id': 'indian_economy_development.macroeconomic_fundamentals_national_income_accounting.national_income_aggregates'",
    "'node_id': 'indian_economy_development.planning_resource_mobilization_growth.inclusive_growth_unemployment_livelihoods'":
        "'node_id': 'indian_economy_development.planning_mobilisation_of_resources_inclusive_growth.inclusive_growth_inequality_dynamics'",
    "'node_id': 'indian_economy_development.fiscal_policy_public_finance_taxation.disinvestment_policy_strategic_sale_national_investment_fund_nif'":
        "'node_id': 'indian_economy_development.industrial_policy_manufacturing_services.public_sector_enterprises_disinvestment'",
    "'node_id': 'indian_economy_development.monetary_policy_financial_intermediation.monetary_policy_framework_rbi_instruments'":
        "'node_id': 'indian_economy_development.monetary_policy_banking_architecture.monetary_policy_framework_rbi_operations'",
    "'node_id': 'science_technology_defence.information_communication_technology_ict_ai_cyber_security.cyber_security_threats_digital_governance'":
        "'node_id': 'science_technology_defence.information_communication_technology_ai_cyber_security.cyber_security_threats_digital_governance'"
}

for k, v in replacements.items():
    code = code.replace(k, v)

# Correct Q44 fundamental duty
code = code.replace(
    """        44: {
            'node_id': 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_rights_-_part_iii_articles_12-35',""",
    """        44: {
            'node_id': 'indian_polity_constitution_governance.fundamental_rights_dpsp_fundamental_duties.fundamental_duties_-_part_iv-a_article_51a',"""
)

# Correct Q48 biogeochemical cycles
code = code.replace(
    """        48: {
            'node_id': 'environment_ecology_disaster_management.climate_change_science_carbon_markets_global_conventions.climate_change_science_global_warming',""",
    """        48: {
            'node_id': 'environment_ecology_disaster_management.fundamental_ecology_ecosystem_dynamics.biogeochemical_cycles',"""
)

with open('scratch/populate_2011.py', 'w', encoding='utf-8') as f:
    f.write(code)
print('Updated scratch/populate_2011.py successfully')
