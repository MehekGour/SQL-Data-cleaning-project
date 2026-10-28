# SQL Data Cleaning Project — Layoffs Dataset

## 📌 Project Overview

This project focuses on cleaning and preparing a real-world layoffs dataset using **SQL in MySQL**. 
The main objective is to transform raw, inconsistent data into a clean and structured dataset that can be used for accurate analysis and reporting.

## 🎯 Project Objectives

- Understand and explore the raw dataset.
- Identify and remove duplicate records.
- Standardize inconsistent text values.
- Handle missing and null values.
- Correct date formats and data types.
- Remove unnecessary records where appropriate.
- Prepare a clean dataset for further analysis.

## 🛠️ Tools and Technologies

- **SQL** — Data cleaning and transformation
- **MySQL** — Database management and query execution
- **MySQL Workbench** — Writing and running SQL queries
- **CSV** — Source dataset format
- **GitHub** — Project documentation and version control

## 📂 Dataset Description

The project uses a company layoffs dataset containing information about layoffs across different companies.

The dataset may include the following columns:

| Column |                                                            | Description |

`company`                                                             Name of the company 
`location`                                                            Company location 
`industry`                                                            Industry or business sector 
`total_laid_off`                                                      Number of employees laid off 
`percentage_laid_off`                                                 Percentage of the workforce laid off 
`date`                                                                Date of the layoff event 
`stage`                                                               Company funding or growth stage 
`country`                                                             Country where the company operates 
`funds_raised_millions`                                               Funding raised in millions 

*The exact columns depend on the version of the dataset used.*

## 🧹 Data Cleaning Process

### 1. Creating a Staging Table

Created a staging table to preserve the original dataset and perform cleaning operations on a separate copy.

### 2. Identifying and Removing Duplicates

Used SQL window functions such as `ROW_NUMBER()` with `PARTITION BY` to identify duplicate records. Removed duplicate rows while retaining one valid record.

**SQL concepts:** `ROW_NUMBER()`, `OVER()`, `PARTITION BY`, Common Table Expressions (CTEs).

### 3. Standardizing the Data

Cleaned inconsistent text values to improve data quality and consistency.

Examples of cleaning tasks:
- Removed unnecessary spaces using `TRIM()`.
- Standardized company and industry names.
- Corrected inconsistent country names and spellings where applicable.
- Used `UPDATE` statements to replace inconsistent values.

### 4. Handling Null and Blank Values

Investigated missing values in important columns.

- Converted blank strings into `NULL` where appropriate.
- Used self-joins to identify opportunities to populate missing industry information from matching records.
- Evaluated records with missing critical information before deciding whether to retain or remove them.

**SQL concepts:** `IS NULL`, `NULLIF()`, `UPDATE`, `JOIN`.

### 5. Standardizing Date Formats

Converted date values into a consistent SQL date format so they could be sorted, filtered, and analyzed correctly.

**SQL concepts:** `STR_TO_DATE()`, `ALTER TABLE`, `UPDATE`.

### 6. Removing Unnecessary Records

Reviewed records where both `total_laid_off` and `percentage_laid_off` were missing. Removed records that did not provide useful information for the intended analysis, where appropriate.

### 7. Final Data Validation

Performed final checks to ensure the cleaned dataset was ready for analysis.

Validation included:
- Checking for remaining duplicates.
- Reviewing missing values.
- Verifying date formats.
- Confirming standardized text values.
- Inspecting the final table structure.

## 💻 SQL Concepts Practiced

Through this project, I practiced the following SQL concepts:

- Database and table creation
- `SELECT`, `UPDATE`, and `DELETE`
- `WHERE`, `ORDER BY`, and `GROUP BY`
- `DISTINCT`
- Aggregate functions
- `TRIM()` and `NULLIF()`
- `CASE` statements
- `JOIN` operations
- Self-joins
- Window functions
- Common Table Expressions (CTEs)
- Date conversion and formatting
- Data validation

## 📁 Project Structure

```text
SQL-Data-Cleaning-Project/
│
├── README.md
├── layoffs.csv
└── layoffs_data_cleaning.sql
```

- `README.md` — Project documentation.
- `layoffs.csv` — Original dataset, if included in the repository.
- `layoffs_data_cleaning.sql` — SQL queries used to clean the dataset.

*Update these filenames to match the actual files in your GitHub repository.*

## 🚀 How to Run This Project

1. Download or clone this repository.
2. Open MySQL Workbench.
3. Create a database for the project.
4. Import `layoffs.csv` into MySQL.
5. Open `layoffs_data_cleaning.sql`.
6. Execute the SQL queries in the correct order.
7. Inspect the cleaned table and verify the results.

## 📈 Project Outcome

The project demonstrates how SQL can be used to prepare raw data for reliable analysis.

The cleaning process improves data consistency, identifies duplicate records, handles missing values, and standardizes formats. The resulting dataset can be used for exploratory data analysis and further investigation of company layoffs.

## 📚 Learning Reference

This project was inspired by the SQL Data Cleaning project covered in the **Alex The Analyst Data Analyst Bootcamp** on YouTube.

The project helped me strengthen my understanding of practical SQL operations and the importance of data quality in the data analysis workflow.



