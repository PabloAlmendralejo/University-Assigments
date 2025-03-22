## Regression Analysis of Test Scores

### Overview

This project involves a regression analysis to study the relationship between four test scores (x1, x2, x3, x4) and an evaluation test score (Y). The goal is to determine if a linear regression model is appropriate and identify which test scores significantly predict the evaluation score.

### Key Steps

1. **Model Fitting**:
   - A multiple linear regression model is fitted to the data.
   - Diagnostic plots (Residuals vs Fitted, Q-Q Residuals) and statistical tests (Shapiro-Wilk, Breusch-Pagan, Durbin-Watson) are used to validate the model.

2. **Model Interpretation**:
   - The initial model is:
     \[ Y = -175.88440 + 0.49108 \cdot x_1 + 0.02018 \cdot x_2 + 1.30217 \cdot x_3 + 0.83057 \cdot x_4 \]
   - The third test score (x3) has the strongest positive impact on Y, while the second test score (x2) has the least impact.

3. **Model Refinement**:
   - Backward elimination removes non-significant predictors, resulting in:
     \[ Y = -114.9880 + 1.2657 \cdot x_3 + 0.8414 \cdot x_4 \]
   - AIC-based selection suggests including x1, x3, and x4.

### Conclusion

- The third and fourth test scores (x3, x4) are the most significant predictors of Y.
- The second test score (x2) can be removed due to its negligible impact.

### Usage

- Use the provided R code to fit and refine the model.
- Validate assumptions using diagnostic plots and statistical tests.

---

This README provides a concise guide to the regression analysis. Save it with the R script for easy reference.
