# 📖 Data Dictionary - Employee Attrition Prediction

**Project:** Employee Attrition Prediction System  
**Author:** Emem A. - Senior Data Scientist  
**Last Updated:** February 2026

---

## 📊 Dataset Overview

- **Total Records:** 5,000 employees
- **Total Features:** 38 (after feature engineering)
- **Target Variable:** `attrition` (binary: 0 = Stayed, 1 = Left)
- **Attrition Rate:** 15% (750 employees)

---

## 🔑 Core Features (Base Data)

### Employee Identifiers
| Feature | Type | Description | Example Values |
|---------|------|-------------|----------------|
| `employee_id` | Integer | Unique employee identifier | 1001, 1002, 1003 |

### Demographics
| Feature | Type | Description | Range/Values |
|---------|------|-------------|--------------|
| `age` | Integer | Employee age in years | 22-60 years |
| `gender` | Integer | Gender (encoded) | 0 = Female, 1 = Male |
| `marital_status` | Integer | Marital status (encoded) | 0 = Single, 1 = Married, 2 = Divorced |
| `distance_from_home` | Float | Commute distance in km | 1-50 km |

### Job Information
| Feature | Type | Description | Values |
|---------|------|-------------|--------|
| `department` | Integer | Department code | 0 = Sales, 1 = IT, 2 = HR, 3 = Finance, 4 = Operations |
| `job_role` | Integer | Job role code | 0-9 (various roles) |
| `job_level` | Integer | Organizational level | 1 = Junior, 2 = Mid, 3 = Senior, 4 = Manager, 5 = Director |

### Compensation
| Feature | Type | Description | Range |
|---------|------|-------------|-------|
| `salary` | Float | Annual base salary (USD) | $40,000 - $150,000 |
| `salary_hike_pct` | Float | Last salary increase percentage | 5% - 25% |
| `stock_option_level` | Integer | Stock option tier | 0 = None, 1 = Basic, 2 = Standard, 3 = Premium |

### Work Experience
| Feature | Type | Description | Range |
|---------|------|-------------|-------|
| `tenure_years` | Float | Years with current company | 0.1 - 20.0 years |
| `years_in_role` | Float | Years in current role | 0.1 - 15.0 years |
| `years_with_manager` | Float | Years with current manager | 0.1 - 10.0 years |
| `years_since_promotion` | Float | Years since last promotion | 0.0 - 8.0 years |
| `num_companies_worked` | Integer | Number of previous employers | 0 - 6 companies |

### Performance & Engagement
| Feature | Type | Description | Range |
|---------|------|-------------|-------|
| `performance_rating` | Integer | Annual performance score | 1 = Poor, 2 = Fair, 3 = Good, 4 = Excellent |
| `satisfaction_level` | Integer | Job satisfaction score | 1 = Low, 2 = Medium, 3 = High |
| `manager_rating` | Integer | Manager effectiveness rating | 1 = Poor, 2 = Fair, 3 = Good, 4 = Excellent |
| `involvement_level` | Integer | Work involvement score | 1 = Low, 2 = Medium, 3 = High, 4 = Very High |

### Work-Life Balance
| Feature | Type | Description | Values |
|---------|------|-------------|--------|
| `overtime_hours` | Float | Average monthly overtime hours | 0 - 80 hours |
| `work_life_balance` | Integer | Work-life balance score | 1 = Poor, 2 = Fair, 3 = Good, 4 = Excellent |
| `business_travel` | Integer | Travel frequency | 0 = None, 1 = Rare, 2 = Frequent |

### Training & Development
| Feature | Type | Description | Range |
|---------|------|-------------|-------|
| `training_hours` | Float | Annual training hours | 0 - 100 hours |
| `projects_count` | Integer | Number of projects involved | 0 - 10 projects |

---

## 🔧 Engineered Features

### Satisfaction Indicators
| Feature | Type | Description | Calculation |
|---------|------|-------------|-------------|
| `low_satisfaction` | Binary | Low job satisfaction flag | 1 if satisfaction_level ≤ 1, else 0 |
| `high_involvement` | Binary | High work involvement flag | 1 if involvement_level ≥ 3, else 0 |

### Performance Metrics
| Feature | Type | Description | Calculation |
|---------|------|-------------|-------------|
| `high_performer` | Binary | Top performer flag | 1 if performance_rating ≥ 4, else 0 |
| `promotion_gap` | Binary | Promotion overdue flag | 1 if years_since_promotion > 3, else 0 |

### Compensation Analysis
| Feature | Type | Description | Calculation |
|---------|------|-------------|-------------|
| `salary_ratio` | Float | Salary relative to median | salary / department_median_salary |
| `low_salary_hike` | Binary | Below-average raise flag | 1 if salary_hike_pct < 10%, else 0 |

### Work-Life Indicators
| Feature | Type | Description | Calculation |
|---------|------|-------------|-------------|
| `high_overtime` | Binary | Excessive overtime flag | 1 if overtime_hours > 40, else 0 |
| `poor_work_life` | Binary | Poor work-life balance flag | 1 if work_life_balance ≤ 2, else 0 |
| `long_commute` | Binary | Long commute flag | 1 if distance_from_home > 30 km, else 0 |

### Career Progression
| Feature | Type | Description | Calculation |
|---------|------|-------------|-------------|
| `stagnant_career` | Binary | Career stagnation flag | 1 if years_in_role > 5, else 0 |
| `frequent_job_hopper` | Binary | Job hopping pattern | 1 if num_companies_worked > 3, else 0 |
| `promotion_rate` | Float | Promotions per year | tenure_years / (years_since_promotion + 1) |

### Engagement Metrics
| Feature | Type | Description | Calculation |
|---------|------|-------------|-------------|
| `training_intensity` | Float | Training hours per year ratio | training_hours / tenure_years |
| `project_load` | Float | Projects per tenure year | projects_count / tenure_years |

### Manager Relationship
| Feature | Type | Description | Calculation |
|---------|------|-------------|-------------|
| `manager_tenure_ratio` | Float | Manager stability ratio | years_with_manager / tenure_years |
| `poor_manager` | Binary | Low manager rating flag | 1 if manager_rating ≤ 2, else 0 |

### Age & Experience
| Feature | Type | Description | Calculation |
|---------|------|-------------|-------------|
| `age_group` | Integer | Age category | 0 = Young (18-30), 1 = Mid (31-45), 2 = Senior (46+) |
| `early_career` | Binary | Early career stage flag | 1 if tenure_years < 2, else 0 |
| `senior_employee` | Binary | Long tenure flag | 1 if tenure_years > 10, else 0 |

---

## 🎯 Target Variable

| Feature | Type | Description | Values |
|---------|------|-------------|--------|
| `attrition` | Binary | Employee departure status | 0 = Stayed, 1 = Left |

---

## 📈 Model Output Features

### Predictions
| Feature | Type | Description | Range |
|---------|------|-------------|-------|
| `attrition_risk_score` | Float | Predicted attrition probability | 0.0 - 1.0 |
| `risk_category` | String | Risk classification | Low (0-0.3), Medium (0.3-0.7), High (0.7-1.0) |
| `predicted_attrition` | Binary | Binary prediction | 0 = Will Stay, 1 = Will Leave |

---

## 📊 Feature Importance Rankings (Top 15)

Based on Random Forest model analysis:

1. **satisfaction_level** - Most important predictor
2. **overtime_hours** - Strong indicator of burnout
3. **tenure_years** - Experience level matters
4. **salary** - Compensation satisfaction
5. **years_since_promotion** - Career progression
6. **low_satisfaction** - Engineered satisfaction flag
7. **manager_rating** - Management quality impact
8. **work_life_balance** - Quality of life factor
9. **training_hours** - Development opportunities
10. **performance_rating** - High performers at risk
11. **num_companies_worked** - Job hopping history
12. **promotion_rate** - Career velocity
13. **age** - Life stage considerations
14. **distance_from_home** - Commute impact
15. **projects_count** - Workload indicator

---

## 🔍 Data Quality Notes

### Missing Values
- **None** - All features have complete data (synthetic dataset)

### Outliers Handled
- Salary capped at $150K
- Overtime hours capped at 80/month
- Distance from home capped at 50 km

### Data Types
- All categorical variables encoded as integers (0, 1, 2, ...)
- Binary flags are 0/1
- Continuous variables are float64
- Count variables are integers

---

## 💡 Usage Guidelines

### For Analysis:
1. **Primary predictors:** Focus on satisfaction_level, overtime_hours, and manager_rating
2. **Intervention targets:** Address low_satisfaction, high_overtime, poor_work_life flags
3. **Early warnings:** Monitor promotion_gap, stagnant_career indicators

### For Model Training:
1. **Scaling required:** Use StandardScaler for continuous features before modeling
2. **Feature selection:** Top 15 features provide 85%+ predictive power
3. **Class imbalance:** Use class_weight='balanced' or SMOTE (15% attrition rate)

### For HR Action:
1. **High-risk employees:** attrition_risk_score > 0.7 → Immediate intervention
2. **Medium-risk employees:** 0.3-0.7 → Quarterly check-ins
3. **Low-risk employees:** < 0.3 → Standard retention programs

---

## 📞 Questions?

For clarification on any feature or to request additional feature engineering, contact the data science team.

**Author:** Emem A. - Senior Data Scientist  
**Date:** February 2026
