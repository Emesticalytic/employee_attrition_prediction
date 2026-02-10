# 🚀 Streamlit App - Quick Start Guide

## Prerequisites

Ensure you have Python 3.9+ installed and all dependencies from `requirements.txt`.

## Setup Instructions

### 1. Install Dependencies

```bash
pip install -r requirements.txt
```

### 2. Train and Save Model

Before running the Streamlit app, you need to train the model:

1. Open `Employees_workbook.ipynb` in Jupyter
2. Run all cells (Cell → Run All)
3. The model will be automatically saved to the `models/` directory

The last cell in the notebook saves:
- `models/best_model.pkl` - The trained model
- `models/scaler.pkl` - The feature scaler
- `models/feature_names.pkl` - List of features

### 3. Run the Streamlit App

```bash
streamlit run app.py
```

The app will open in your browser at `http://localhost:8501`

## App Features

### 📊 Dashboard
- Overview of key metrics and attrition statistics
- Visual analytics and department-wise breakdown
- Risk distribution analysis

### 🔮 Single Prediction
- Predict attrition risk for individual employees
- Input employee details through an interactive form
- Get instant risk assessment and recommendations

### 📈 Batch Analysis
- Analyze predictions for entire workforce
- Filter and export results
- View prediction statistics

### 🎯 High-Risk Employees
- View employees with high attrition risk
- Filter by risk level and department
- Download prioritized intervention list

### 💰 ROI Calculator
- Calculate financial impact of the ML system
- Customize parameters for your organization
- View 5-year projection and payback period

### 📋 Data Explorer
- Browse and filter employee data
- View statistical summaries
- Explore feature correlations
- Visualize distributions

## Deployment Options

### Local Development
```bash
streamlit run app.py
```

### Production Deployment

#### Option 1: Streamlit Cloud (Recommended for demos)
1. Push your code to GitHub
2. Go to [share.streamlit.io](https://share.streamlit.io)
3. Connect your GitHub repository
4. Deploy with one click

#### Option 2: Docker
```bash
# Build Docker image
docker build -t employee-attrition-app .

# Run container
docker run -p 8501:8501 employee-attrition-app
```

#### Option 3: AWS/Azure/GCP
Deploy using your cloud provider's app hosting service:
- **AWS**: Elastic Beanstalk or ECS
- **Azure**: App Service
- **GCP**: Cloud Run

## File Structure

```
.
├── app.py                      # Main Streamlit application
├── employee.csv                # Employee dataset
├── attritionprediction.csv     # Prediction results
├── high_risk.csv               # High-risk employees
├── models/                     # Saved ML models
│   ├── best_model.pkl
│   ├── scaler.pkl
│   └── feature_names.pkl
├── outputs/                    # Generated visualizations
│   └── images/
├── requirements.txt            # Python dependencies
└── Employees_workbook.ipynb    # Model training notebook
```

## Troubleshooting

### Model Not Found Error
**Problem**: App shows "Model not found" warning

**Solution**: 
1. Run all cells in `Employees_workbook.ipynb`
2. Verify `models/` directory contains .pkl files
3. Refresh the Streamlit app

### Data File Not Found
**Problem**: "employee.csv not found" error

**Solution**: Ensure `employee.csv` is in the project root directory

### Port Already in Use
**Problem**: Port 8501 is already in use

**Solution**: 
```bash
# Use a different port
streamlit run app.py --server.port 8502
```

### Dependencies Error
**Problem**: Missing package errors

**Solution**:
```bash
# Reinstall dependencies
pip install -r requirements.txt --upgrade
```

## Configuration

Create `.streamlit/config.toml` for custom configuration:

```toml
[theme]
primaryColor = "#1f77b4"
backgroundColor = "#ffffff"
secondaryBackgroundColor = "#f0f2f6"
textColor = "#262730"
font = "sans serif"

[server]
port = 8501
headless = true
enableCORS = false
enableXsrfProtection = true
```

## Performance Tips

1. **Data Caching**: The app uses `@st.cache_data` for data loading
2. **Model Caching**: Models are cached with `@st.cache_resource`
3. **Large Datasets**: Consider filtering data before display
4. **Visualizations**: Plots are generated on-demand

## Security Considerations

For production deployment:

1. **Environment Variables**: Store sensitive data in `.env` files
2. **Authentication**: Add user authentication if needed
3. **HTTPS**: Always use HTTPS in production
4. **Input Validation**: Validate all user inputs
5. **Rate Limiting**: Implement rate limiting for API calls

## Support

For issues or questions:
- Check the main README.md
- Review the Jupyter notebook documentation
- Open an issue on GitHub

## Next Steps

1. ✅ Train the model
2. ✅ Run the app locally
3. 🔄 Customize for your organization
4. 🚀 Deploy to production

---

**Made with ❤️ using Streamlit**
