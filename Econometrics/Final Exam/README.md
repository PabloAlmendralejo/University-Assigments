# Economic Data

## Overview
This project involves the analysis of economic data using R and Python. The analysis includes descriptive statistics, data visualization, and regression modeling to understand relationships between variables such as income, education, and human development indices.

## Key Steps
1. **Data Loading and Exploration**:
  * Load datasets (`ADRH2022_INE.xlsx` and `HDI2022_ONU.xlsx`).
  * Perform descriptive statistics and exploratory data analysis (EDA) on variables like `renta_neta_media_pp`, `LEB`, `EYS`, `GNIPC`, and `HDI`.
2. **Data Visualization**:
  * Create histograms, scatter plots, and heatmaps to visualize distributions and relationships between variables.
  * Generate geographic visualizations to map income distribution across municipalities.
3. **Regression Modeling**:
  * Fit linear regression models to predict `HDI` based on `LEB`, `EYS`, and `GNIPC`.
  * Validate model assumptions using diagnostic tests (e.g., normality, homoscedasticity, multicollinearity).
  * Refine models by adding polynomial terms and interaction effects.
4. **Model Evaluation**:
  * Compare models using metrics like R-squared, AIC, and p-values.
  * Perform hypothesis testing to assess the significance of predictors.

## Results
* **Income Distribution**:
  * The average net income per capita (`renta_neta_media_pp`) ranges from €6,274 to €29,258, with a mean of €13,490.
  * The distribution is slightly right-skewed, indicating higher income variability in wealthier municipalities.
* **Human Development Index (HDI)**:
  * Strong positive correlations exist between `HDI` and predictors like `LEB` (Life Expectancy at Birth) and `EYS` (Expected Years of Schooling).
  * A logarithmic transformation of `GNIPC` (Gross National Income per Capita) improves model fit.
* **Final Model**:
  * The best-fitting model includes `LEB`, `EYS`, `log(GNIPC)`, and a quadratic term for `EYS`:
HDI=β0+β1⋅LEB+β2⋅EYS+β3⋅log⁡(GNIPC)+β4⋅EYS2
  * This model explains 98.25% of the variance in `HDI` (R-squared = 0.9825).

## Usage
1. **Data Preparation**:
  * Ensure datasets (`ADRH2022_INE.xlsx` and `HDI2022_ONU.xlsx`) are in the working directory.
  * Install required libraries: `readxl`, `reticulate`, `dplyr`, `ggplot2`, `geojsonsf`, `sf`, `gvlma`, `lmtest`, `performance`, `alr4`, `GGally`, `corrplot`.
2. **Running the Analysis**:
  * Open the Quarto document (`Examen_Econ.qmd`) in RStudio.
  * Click **Render** to generate the HTML report with code outputs and visualizations.
3. **Customization**:
  * Modify the code to analyze different datasets or variables.
  * Adjust model specifications (e.g., add/remove predictors, change transformations).

## Dependencies
* **R Libraries**:
  * `readxl`, `reticulate`, `dplyr`, `ggplot2`, `geojsonsf`, `sf`, `gvlma`, `lmtest`, `performance`, `alr4`, `GGally`, `corrplot`.
* **Python Libraries**:
  * `pandas`, `numpy`, `statsmodels`, `seaborn`, `geopandas`, `matplotlib`.
