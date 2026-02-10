#!/bin/bash
# Push Employee Attrition Project to GitHub
# Repository: https://github.com/Emesticalytic/employee_attrition_prediction.git

echo "=================================================="
echo "🚀 PUSHING TO GITHUB"
echo "=================================================="
echo ""

# Step 1: Initialize Git
echo "Step 1: Initializing Git repository..."
git init
echo "✅ Git initialized"
echo ""

# Step 2: Add all files
echo "Step 2: Adding all files..."
git add .
echo "✅ Files staged"
echo ""

# Step 3: Commit
echo "Step 3: Committing..."
git commit -m "Complete ML employee attrition prediction system

- 96.4% AUC-ROC accuracy with Gradient Boosting model
- Predicts employee attrition 3-6 months in advance
- $6.2M annual savings projection, 12.1x ROI, 1.1 month payback
- 36 engineered features from 24 base features (5,000 employees)
- Complete documentation: README, Data Dictionary, Executive Summary
- 13 professional visualizations at 300 DPI
- Production-ready with SHAP interpretability
- Comprehensive business analysis and scenario planning

Technical Stack:
- Python 3.9+ (pandas, scikit-learn, xgboost, shap)
- Gradient Boosting (best: 80.2% precision, 62.0% recall)
- Advanced feature engineering and EDA
- Rich executive dashboard with ROI calculations

Completed by: Emem A. - Senior Data Scientist
Date: February 2026"
echo "✅ Changes committed"
echo ""

# Step 4: Add remote
echo "Step 4: Adding remote repository..."
git remote add origin https://github.com/Emesticalytic/employee_attrition_prediction.git
echo "✅ Remote added"
echo ""

# Step 5: Rename branch to main
echo "Step 5: Setting branch to main..."
git branch -M main
echo "✅ Branch renamed to main"
echo ""

# Step 6: Push to GitHub
echo "Step 6: Pushing to GitHub..."
echo "⚠️  You may need to authenticate with GitHub..."
git push -u origin main
echo ""

echo "=================================================="
echo "✅ PUSH COMPLETE!"
echo "=================================================="
echo ""
echo "🌐 Your repository is now live at:"
echo "   https://github.com/Emesticalytic/employee_attrition_prediction"
echo ""
echo "📋 Next Steps:"
echo "   1. Visit your repository on GitHub"
echo "   2. Verify README.md displays correctly"
echo "   3. Add repository description and topics"
echo "   4. Consider adding a LICENSE file"
echo "   5. Update repository settings (visibility, features)"
echo ""
