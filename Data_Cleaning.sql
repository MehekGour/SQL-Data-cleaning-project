-- Data Cleaning 

USE world_layoffs;
SELECT * FROM layoffs;


-- 1. Remove Duplicates 
-- 2. Standardize Data 
-- 3. Null values or Blank Values
-- 4. Remove any columns 


-- 1. Remove Duplicates 

CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT * FROM layoffs_staging ;

INSERT layoffs_staging 
SELECT * FROM layoffs_staging ;

SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 
`date`, country, funds_raised_millions ) AS row_num
FROM layoffs_staging; 

WITH duplicate_cte AS 
(
SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 
`date`, country, funds_raised_millions ) AS row_num
FROM layoffs_staging
)
SELECT * FROM duplicate_cte 
WHERE row_num > 1;

SELECT * FROM layoffs_staging 
WHERE company = 'Casper';

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT * ,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 
`date`, country, funds_raised_millions ) AS row_num
FROM layoffs_staging;

SET SQL_SAFE_UPDATES = 0;

DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

SELECT * FROM layoffs_staging2;


-- Standardizeing data

SELECT company, TRIM(company) 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company); 

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY location;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY country;

UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT *
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging2;


-- Null and blank values

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry='';

SELECT * FROM layoffs_staging2
WHERE company = 'Airbnb';

UPDATE layoffs_staging2
SET industry = NULL 
WHERE industry = '' ;

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
     ON t1.company = t2.company
     AND t1.location = t2.location
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
ON t1.company=t2.company
SET t1.industry=t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging2;


-- Remove any column

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT *
FROM layoffs_staging2;

