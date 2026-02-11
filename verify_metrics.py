import pandas as pd

# Load employee data
df = pd.read_csv('employee.csv')

# Count actual attrition
attrition_count = df['attrition'].sum()
total_employees = len(df)
attrition_rate = attrition_count / total_employees

print(f"=== ACTUAL DATA ===")
print(f"Total Employees: {total_employees:,}")
print(f"Employees with Attrition: {attrition_count}")
print(f"Attrition Rate: {attrition_rate*100:.1f}%")

# Cost per attrition
avg_replacement_cost = 82000
annual_cost = attrition_count * avg_replacement_cost
print(f"\nAnnual Attrition Cost: ${annual_cost:,.0f}")

# With 30% reduction
reduction_rate = 0.30
employees_saved = int(attrition_count * reduction_rate)
annual_savings = employees_saved * avg_replacement_cost

print(f"\n=== 30% REDUCTION SCENARIO ===")
print(f"Employees Saved: {employees_saved}")
print(f"Annual Savings: ${annual_savings:,.0f}")
print(f"Annual Savings (in millions): ${annual_savings/1_000_000:.1f}M")

# Check predictions
pred = pd.read_csv('attritionprediction.csv')
high_risk_count = len(pred[pred['risk_category'] == 'High'])
print(f"\n=== PREDICTIONS ===")
print(f"High-Risk Employees Identified: {high_risk_count}")

# Feature count
features = [col for col in df.columns if col not in ['employee_id', 'attrition']]
print(f"\n=== FEATURES ===")
print(f"Total columns: {len(df.columns)}")
print(f"Features used in modeling: {len(features)}")
