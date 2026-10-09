import json
import re

with open('src/data/epfo/epfo-all-papers.json', 'r', encoding='utf-8') as f:
    questions = json.load(f)

# Let's see what questions have "Parliament & State Legislatures" or "Union Budget" as their node_id
polity_default = [q for q in questions if q.get('node_id') == "indian_polity_constitution_governance.parliament_state_legislatures.structure_composition"]
econ_default = [q for q in questions if q.get('node_id') == "indian_economy_development.fiscal_policy_public_finance_taxation.union_budget_public_finance_architecture_contingency_fund_article_267_public_account_article_266_revenue_receipts_vs_capital_receipts_revenue_expenditure_vs_capital_expenditure_capex_multiplier_effect"]
hist_default = [q for q in questions if q.get('node_id') == "history.indian_freedom_struggle.revolt_of_1857.causes_of_the_revolt"]

print(f"Polity default node count: {len(polity_default)}")
print(f"Econ default node count: {len(econ_default)}")
print(f"Hist default node count: {len(hist_default)}")

print("\n--- SAMPLE 15 POLITY DEFAULT QUESTIONS ---")
for i, q in enumerate(polity_default[:15]):
    print(f"[{q.get('year')} #{q.get('question_number')}] {q.get('question_english')[:120]}...")

print("\n--- SAMPLE 15 ECON DEFAULT QUESTIONS ---")
for i, q in enumerate(econ_default[:15]):
    print(f"[{q.get('year')} #{q.get('question_number')}] {q.get('question_english')[:120]}...")
