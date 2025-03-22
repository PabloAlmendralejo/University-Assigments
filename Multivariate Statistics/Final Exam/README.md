markdownCopiar# Predicting Football Match Outcomes using Machine Learning

## Overview
This project applies various machine learning techniques to predict football match outcomes, specifically the number of goals scored by the home team (FTHG) and the final match result (FTR). The dataset consists of historical football match data.

## Dataset
* **train.csv**: Training dataset containing match features and outcomes.
* **test.csv**: Test dataset used for evaluating model performance.

## Methods Applied

### 1. Regression Models for Predicting FTHG

#### a) Multiple Linear Regression
* A multiple linear regression model is fitted using all available features.
* Stepwise selection (forward and backward) is applied to optimize feature selection.
* The backward selection model is chosen due to a higher adjusted R-squared value.

#### b) Lasso Regression
* Lasso regression is applied to enforce feature selection and reduce overfitting.
* The optimal lambda parameter is selected using cross-validation.
* Lasso suggests using a subset of predictors: WHH, WHD, FTAG, FTRD, and FTRH.

#### c) Neural Network Regression
* A neural network model is trained using 10-fold cross-validation.
* The best parameters (decay and size) are selected based on RMSE.
* The model achieves an estimated cross-validation RMSE of 0.8885.

### 2. Classification Models for Predicting Match Result (FTR)

#### a) k-Nearest Neighbors (k-NN)
* k-NN is trained with different values of k using cross-validation.
* The optimal number of neighbors selected is 7.
* The confusion matrix highlights misclassification patterns, primarily for away wins and draws.

#### b) Random Forest (RF)
* A random forest model is trained with cross-validation to determine the best number of predictors (mtry).
* The best mtry value is found to be 15.
* The out-of-bag (OOB) error is minimized at 271 trees.
* Feature importance analysis reveals that FTHG and FTAG are the most significant predictors.

## Model Comparison
* Lasso regression outperforms multiple linear regression based on mean squared error (MSE) for predicting FTHG.
* The neural network regression model provides competitive performance.
* For classification, k-NN produces lower misclassification rates compared to random f
