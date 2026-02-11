"""Verify ROI Calculator calculations are accurate"""
import pandas as pd

# Load actual data
df = pd.read_csv('employee.csv')

# Actual values
total_employees = 5000
current_attrition_rate = 15.0  # actual from dataset
avg_salary = 70000  # default
replacement_cost_multiplier = 1.5
model_accuracy = 93.0  # actual best model
retention_success_rate = 35.0  # default
implementation_cost = 150000
annual_maintenance = 50000

print("=== INPUT PARAMETERS ===")
print(f"Total Employees: {total_employees:,}")
print(f"Current Attrition Rate: {current_attrition_rate}%")
print(f"Model Accuracy: {model_accuracy}%")
print(f"Intervention Success Rate: {retention_success_rate}%")

# Calculations
annual_attrition_count = int(total_employees * current_attrition_rate / 100)
replacement_cost = avg_salary * replacement_cost_multiplier
productivity_loss = avg_salary * 0.5
total_cost_per_employee = replacement_cost + productivity_loss
annual_attrition_cost = annual_attrition_count * total_cost_per_employee

print(f"\n=== ATTRITION COSTS ===")
print(f"Annual Attrition Count: {annual_attrition_count}")
print(f"Replacement Cost per Employee: ${replacement_cost:,.0f}")
print(f"Productivity Loss: ${productivity_loss:,.0f}")
print(f"Total Cost per Attrition: ${total_cost_per_employee:,.0f}")
print(f"Annual Attrition Cost: ${annual_attrition_cost:,.0f}")

# ML Impact
identifiable_rate = model_accuracy / 100
identified_employees = annual_attrition_count * identifiable_rate
retained_employees = identified_employees * (retention_success_rate / 100)
cost_savings = retained_employees * total_cost_per_employee

print(f"\n=== ML SYSTEM IMPACT ===")
print(f"Identified At-Risk: {int(identified_employees)}")
print(f"Successfully Retained: {int(retained_employees)}")
print(f"Annual Savings: ${cost_savings:,.0f}")

# Year 1
year1_net = cost_savings - implementation_cost - annual_maintenance
print(f"\n=== YEAR 1 ===")
print(f"Gross Savings: ${cost_savings:,.0f}")
print(f"Implementation Cost: ${implementation_cost:,.0f}")
print(f"Annual Maintenance: ${annual_maintenance:,.0f}")
print(f"Year 1 Net Benefit: ${year1_net:,.0f}")

# Year 2-5
annual_net = cost_savings - annual_maintenance
print(f"\n=== YEARS 2-5 ===")
print(f"Annual Net Benefit: ${annual_net:,.0f}")

# 5-year totals
five_year_total = year1_net + (annual_net * 4)
total_investment = implementation_cost + (annual_maintenance * 5)
five_year_roi = (five_year_total / total_investment) * 100

print(f"\n=== 5-YEAR PROJECTION ===")
print(f"Total Investment: ${total_investment:,.0f}")
print(f"Total 5-Year Benefit: ${five_year_total:,.0f}")
print(f"5-Year ROI: {five_year_roi:.1f}%")

# Payback period
if year1_net > 0:
    months_to_payback = (implementation_cost / (cost_savings / 12))
    print(f"Payback Period: {months_to_payback:.1f} months")
else:
    payback_years = implementation_cost / annual_net if annual_net > 0 else float('inf')
    print(f"Payback Period: {payback_years:.1f} years")

# Verify against About page claim
print(f"\n=== VERIFICATION ===")
print(f"About page claims $18.4M annual savings (30% reduction)")
print(f"Calculator shows ${cost_savings:,.0f} annual savings ({retention_success_rate}% success rate)")
print(f"\nNote: Different assumptions:")
print(f"  - About: 30% reduction, $82K replacement cost")
print(f"  - Calculator: {model_accuracy}% accuracy * {retention_success_rate}% success = {model_accuracy * retention_success_rate / 100:.1f}% effective, ${total_cost_per_employee:,.0f} total cost")
