# Sales_EDA_sql
Retail sales analysis project using SQL for data cleaning, EDA, and business insights.


# 🛒 Retail Sales Analysis SQL Project

## 📌 Project Overview

This project focuses on analyzing retail sales data using SQL.
The objective is to perform data cleaning, exploratory data analysis (EDA), and business analysis to extract meaningful insights from transactional retail data.

The project demonstrates practical SQL skills including:

- Database creation
- Table management
- Data cleaning
- Aggregations
- Window functions
- Business reporting queries
- Customer and sales analysis

------------------------------------------------------------

## 🛠️ Technologies Used

- SQL
- MySQL

------------------------------------------------------------

## 📂 Dataset Information

The dataset contains retail transaction records with the following fields:

| Column Name      | Description                 |
|------------------|-----------------------------|
| transactions_id  | Unique transaction ID       |
| sale_date        | Date of sale                |
| sale_time        | Time of sale                |
| customer_id      | Unique customer ID          |
| gender           | Customer gender             |
| age              | Customer age                |
| category         | Product category            |
| quantiy          | Quantity purchased          |
| price_per_unit   | Price per item              |
| cogs             | Cost of goods sold          |
| total_sale       | Total transaction amount    |

------------------------------------------------------------

## ⚙️ Database & Table Creation

The project begins with:

- Creating a database
- Creating the retail_sales table
- Defining data types and constraints

Example:

CREATE DATABASE sql_project_p1;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

------------------------------------------------------------

## 🧹 Data Cleaning

Performed the following cleaning operations:

- Checked for NULL values
- Removed incomplete records
- Ensured data consistency

------------------------------------------------------------

## 📊 Exploratory Data Analysis (EDA)

Key analysis performed:

- Total sales records
- Unique customers count
- Product categories analysis
- Category-wise sales overview

------------------------------------------------------------

## 📈 Business Problems Solved

1️⃣ Sales on a Specific Date
Retrieved all transactions made on a given date.

2️⃣ Clothing Transactions Analysis
Filtered transactions where:
- Category = Clothing
- Quantity ≥ 4
- Sales occurred in November 2022

3️⃣ Category-wise Total Sales
Calculated:
- Net sales per category
- Total orders per category

4️⃣ Average Age of Beauty Product Customers
Analyzed customer demographics.

5️⃣ High-Value Transactions
Identified transactions with sales greater than 1000.

6️⃣ Gender-based Transaction Analysis
Compared transactions across categories by gender.

7️⃣ Best Selling Month Each Year
Used SQL window functions (RANK()) to determine top-performing months.

8️⃣ Top 5 Customers
Identified customers with highest total spending.

9️⃣ Unique Customers Per Category
Measured customer diversity across product categories.

🔟 Sales Shift Analysis
Segmented orders into:
- Morning
- Afternoon
- Evening

------------------------------------------------------------

## 🧠 SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- COUNT()
- SUM()
- AVG()
- DISTINCT
- CASE WHEN
- CTE
- WINDOW FUNCTIONS
- RANK()
- DATE_FORMAT()
- AGGREGATE FUNCTIONS

------------------------------------------------------------

## 🚀 Project Outcomes

This project helps in understanding:

- Customer purchasing behavior
- Sales performance trends
- Category performance
- Revenue insights
- Time-based order patterns

------------------------------------------------------------

## 📌 Future Improvements

- Create interactive dashboards using Power BI/Tableau
- Add advanced sales forecasting
- Perform customer segmentation
- Integrate Python for deeper analytics

------------------------------------------------------------

## 👨‍💻 Author

Pokala Krishna Vamshi
Data Science Student , KU ingolstadt

------------------------------------------------------------

## ⭐ If You Like This Project

Give this repository a ⭐ on GitHub!****
