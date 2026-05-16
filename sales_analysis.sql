-- =========================================================
-- RETAIL SALES ANALYSIS PROJECT
-- =========================================================

-- =========================================================
-- DATABASE CREATION
-- =========================================================

CREATE DATABASE sql_project_p1;

-- =========================================================
-- TABLE CREATION
-- =========================================================

DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE DEFAULT NULL,
    sale_time TIME DEFAULT NULL,
    customer_id INT DEFAULT NULL,
    gender VARCHAR(15) DEFAULT NULL,
    age INT DEFAULT NULL,
    category VARCHAR(15) DEFAULT NULL,
    quantiy INT DEFAULT NULL,
    price_per_unit FLOAT DEFAULT NULL,
    cogs FLOAT DEFAULT NULL,
    total_sale FLOAT DEFAULT NULL
);

-- =========================================================
-- DATA PREVIEW
-- =========================================================

SELECT *
FROM retail_sales
LIMIT 10;

-- =========================================================
-- TOTAL RECORD COUNT
-- =========================================================

SELECT COUNT(*)
FROM retail_sales;

-- =========================================================
-- CHECK NULL VALUES
-- =========================================================

SELECT *
FROM retail_sales
WHERE CONCAT(
    transactions_id,
    sale_date,
    sale_time,
    customer_id,
    gender,
    age,
    category,
    quantiy,
    price_per_unit,
    cogs,
    total_sale
) IS NULL;

-- =========================================================
-- DELETE NULL RECORDS
-- =========================================================

SET SQL_SAFE_UPDATES = 0;

DELETE FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

-- =========================================================
-- EXPLORATORY DATA ANALYSIS (EDA)
-- =========================================================

-- Total Sales Records
SELECT COUNT(*) AS total_sales
FROM retail_sales;

-- Unique Customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales;

-- Unique Categories
SELECT COUNT(DISTINCT category) AS unique_categories
FROM retail_sales;

-- Category List
SELECT DISTINCT category
FROM retail_sales;

-- =========================================================
-- DATA ANALYSIS & BUSINESS PROBLEMS
-- =========================================================

-- =========================================================
-- Q1. Retrieve all columns for sales made on '2022-11-05'
-- =========================================================

SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- =========================================================
-- Q2. Transactions where:
--     Category = 'Clothing'
--     Quantity >= 4
--     Month = November 2022
-- =========================================================

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
    AND quantiy >= 4
    AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';

-- =========================================================
-- Q3. Total Sales for Each Category
-- =========================================================

SELECT
    category,
    SUM(total_sale) AS net_sales,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- =========================================================
-- Q4. Average Age of Customers Who Purchased Beauty Products
-- =========================================================

SELECT ROUND(AVG(age), 1) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- =========================================================
-- Q5. Transactions with Total Sales Greater Than 1000
-- =========================================================

SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- =========================================================
-- Q6. Total Transactions by Gender in Each Category
-- =========================================================

SELECT
    category,
    gender,
    COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- =========================================================
-- Q7. Best Selling Month in Each Year
--     Based on Average Sales
-- =========================================================

SELECT
    year,
    month,
    avg_sale
FROM (
    SELECT
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY YEAR(sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS ranking
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS ranked_data
WHERE ranking = 1;

-- =========================================================
-- Q8. Top 5 Customers Based on Highest Total Sales
-- =========================================================

SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- =========================================================
-- Q9. Number of Unique Customers in Each Category
-- =========================================================

SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- =========================================================
-- Q10. Orders by Shift
--      Morning   : < 12
--      Afternoon : 12 - 17
--      Evening   : > 17
-- =========================================================

WITH hourly_sales AS (
    SELECT *,
        CASE
            WHEN HOUR(sale_time) < 12 THEN 'Morning'
            WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift
    FROM retail_sales
)
SELECT
    shift,
    COUNT(*) AS total_orders
FROM hourly_sales
GROUP BY shift;

-- END OF PROJECT
