#!/bin/bash
# Pre-deployment verification script
# Run this before pushing to GitHub

echo "🔍 RUNNING PRE-DEPLOYMENT CHECKS..."
echo ""

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counters
PASS=0
FAIL=0
WARN=0

# Check Python
echo -n "Checking Python installation... "
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version)
    echo -e "${GREEN}✓${NC} $PYTHON_VERSION"
    ((PASS++))
else
    echo -e "${RED}✗${NC} Python 3 not found"
    ((FAIL++))
fi

# Check Git
echo -n "Checking Git installation... "
if command -v git &> /dev/null; then
    GIT_VERSION=$(git --version)
    echo -e "${GREEN}✓${NC} $GIT_VERSION"
    ((PASS++))
else
    echo -e "${RED}✗${NC} Git not found"
    ((FAIL++))
fi

# Check required files
echo ""
echo "Checking required files..."

FILES=(
    "app.py"
    "Employees_workbook.ipynb"
    "employee.csv"
    "requirements.txt"
    "Readme.md"
    "STREAMLIT_README.md"
    ".gitignore"
)

for file in "${FILES[@]}"; do
    echo -n "  $file... "
    if [ -f "$file" ]; then
        echo -e "${GREEN}✓${NC}"
        ((PASS++))
    else
        echo -e "${RED}✗${NC} Missing"
        ((FAIL++))
    fi
done

# Check if models directory exists (might not exist yet)
echo -n "  models/ directory... "
if [ -d "models" ]; then
    if [ -f "models/best_model.pkl" ] && [ -f "models/scaler.pkl" ]; then
        echo -e "${GREEN}✓${NC} Found with trained models"
        ((PASS++))
    else
        echo -e "${YELLOW}⚠${NC}  Directory exists but models not trained"
        echo "     Run all cells in Jupyter notebook to train models"
        ((WARN++))
    fi
else
    echo -e "${YELLOW}⚠${NC}  Not found (will be created after training)"
    ((WARN++))
fi

# Check Python packages
echo ""
echo "Checking Python dependencies..."

PACKAGES=(
    "pandas"
    "numpy"
    "matplotlib"
    "seaborn"
    "scikit-learn"
    "xgboost"
    "streamlit"
    "shap"
)

for package in "${PACKAGES[@]}"; do
    echo -n "  $package... "
    if python3 -c "import ${package//-/_}" 2>/dev/null; then
        echo -e "${GREEN}✓${NC}"
        ((PASS++))
    else
        echo -e "${RED}✗${NC} Not installed"
        echo "     Run: pip install $package"
        ((FAIL++))
    fi
done

# Check for sensitive data
echo ""
echo "Checking for sensitive data patterns..."

SENSITIVE_PATTERNS=(
    "password"
    "api_key"
    "secret_key"
    "token"
    "credentials"
)

FOUND_SENSITIVE=false
for pattern in "${SENSITIVE_PATTERNS[@]}"; do
    if grep -r -i "$pattern" --exclude-dir={.git,venv,env,.venv} \
       --exclude="*.{pkl,pyc,log,ipynb_checkpoints}" \
       --exclude="verify_deployment.sh" . 2>/dev/null | grep -v "Binary" | grep -q "$pattern"; then
        if [ "$FOUND_SENSITIVE" = false ]; then
            echo -e "${YELLOW}⚠${NC}  Found potential sensitive data:"
            FOUND_SENSITIVE=true
        fi
        echo "     Pattern: $pattern"
        ((WARN++))
    fi
done

if [ "$FOUND_SENSITIVE" = false ]; then
    echo -e "${GREEN}✓${NC} No obvious sensitive data patterns found"
    ((PASS++))
fi

# Check file sizes
echo ""
echo "Checking for large files (>100MB)..."
LARGE_FILES=false
while IFS= read -r -d '' file; do
    SIZE=$(du -m "$file" | cut -f1)
    if [ "$SIZE" -gt 100 ]; then
        if [ "$LARGE_FILES" = false ]; then
            echo -e "${YELLOW}⚠${NC}  Large files found:"
            LARGE_FILES=true
        fi
        echo "     $file (${SIZE}MB)"
        ((WARN++))
    fi
done < <(find . -type f -not -path "./.git/*" -print0)

if [ "$LARGE_FILES" = false ]; then
    echo -e "${GREEN}✓${NC} No large files found"
    ((PASS++))
fi

# Test Streamlit app syntax
echo ""
echo -n "Testing Streamlit app syntax... "
if python3 -m py_compile app.py 2>/dev/null; then
    echo -e "${GREEN}✓${NC}"
    ((PASS++))
else
    echo -e "${RED}✗${NC} Syntax errors in app.py"
    ((FAIL++))
fi

# Summary
echo ""
echo "=================================================="
echo "VERIFICATION SUMMARY"
echo "=================================================="
echo -e "${GREEN}Passed:${NC}   $PASS"
echo -e "${YELLOW}Warnings:${NC} $WARN"
echo -e "${RED}Failed:${NC}   $FAIL"
echo ""

if [ $FAIL -eq 0 ]; then
    echo -e "${GREEN}✓ All critical checks passed!${NC}"
    echo ""
    echo "Ready to push to GitHub! 🚀"
    echo ""
    echo "Next steps:"
    echo "  1. Review warnings above (if any)"
    echo "  2. Train model if not done: Run Jupyter notebook"
    echo "  3. Test Streamlit app: streamlit run app.py"
    echo "  4. Push to GitHub: ./PUSH_TO_GITHUB.sh"
    echo ""
    exit 0
else
    echo -e "${RED}✗ Some checks failed${NC}"
    echo ""
    echo "Please fix the issues above before pushing to GitHub."
    echo ""
    exit 1
fi
