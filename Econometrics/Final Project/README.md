# Household Expenditure Analysis

## Overview
This project analyzes household expenditure data from the **Encuesta de Presupuestos Familiares (EPF)** for the year 2023. The goal is to process, clean, and merge multiple datasets to create a comprehensive dataset for further analysis. The project involves data manipulation, aggregation, and merging using R.

## Key Steps
1. **Data Loading and Exploration**:
  * Load datasets: `EPFgastos_2023.RData`, `EPFhogar_2023.RData`, and `EPFmhogar_2023.RData`.
  * Explore the structure and summary statistics of `Metadatos` and `Microdatos`.
2. **Data Cleaning and Transformation**:
  * Extract the first two digits of the `CODIGO` column to create `CODIGO2`.
  * Aggregate expenditure data (`GASTO` and `GASTOMON`) by household (`NUMERO`) and category (`CODIGO2`).
  * Pivot the data to create a wide-format dataset with separate columns for each expenditure category.
3. **Handling Missing Values**:
  * Replace `NA` values with `0` in the aggregated dataset.
4. **Calculating Total Expenditure**:
  * Compute total expenditure (`GTOTAL`) and total monetary expenditure (`GMONTOTAL`) for each household.
  * Merge these totals with the wide-format dataset.
5. **Calculating Average Expenditure**:
  * Calculate the average total expenditure per household.
  * Compute the average expenditure for each category and its percentage distribution.
6. **Merging Household Data**:
  * Load and merge household data (`EPFhogar_2023.RData`) with the main expenditure dataset.
  * Filter and merge data for households where `SUSPRIN == 1` (primary households).
7. **Final Dataset Creation**:
  * Merge all datasets to create a final dataset (`EPF_2023`).
  * Save the final dataset in `.RData`, `.csv`, and `.xlsx` formats.

## Results
* **Final Dataset**:
  * Contains 20,707 observations and 246 variables.
  * Includes household information, expenditure categories, and total expenditure metrics.
* **Key Metrics**:
  * Average total expenditure per household: Calculated and stored in `media_gasto_total`.
  * Percentage distribution of expenditure across categories: Calculated and stored in `distribucion_porcentual`.

## Usage
1. **Data Preparation**:
  * Ensure the datasets (`EPFgastos_2023.RData`, `EPFhogar_2023.RData`, `EPFmhogar_2023.RData`) are in the working directory.
  * Install required R packages: `dplyr`, `tidyr`, `openxlsx`.
2. **Running the Analysis**:
  * Open the R script (`Trabajo_SYRM_Final.R`) in RStudio.
  * Run the script to generate the final dataset (`EPF_2023`).
3. **Saving Results**:
  * The final dataset is saved in three formats:
     * `.RData`: `EPF_2023.RData`
     * `.csv`: `EPF_2023.csv`
     * `.xlsx`: `EPF_2023.xlsx`

## Dependencies
* **R Libraries**:
  * `dplyr`: For data manipulation.
  * `tidyr`: For reshaping data.
  * `openxlsx`: For exporting data to Excel.
