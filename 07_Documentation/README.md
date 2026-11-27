# E-Commerce Sales, Customer & Profitability Analytics

## Project Overview

This project focuses on analysing retail sales data to understand sales performance, profitability, customer behaviour, product performance, regional performance and the impact of discounts.

The project uses Python for data cleaning and preparation, MySQL for business analysis and Power BI for interactive data visualisation.

## Objectives

- Analyse overall sales and profit performance.
- Identify profitable and loss-making product sub-categories.
- Analyse regional sales and profitability.
- Evaluate customer profitability.
- Explore the relationship between discount levels and profit.
- Build an interactive dashboard to support business decision-making.

## Tools & Technologies

- **Python:** Pandas, data cleaning and data preparation
- **MySQL:** SQL queries, aggregations, ranking and business analysis
- **Power BI:** Interactive dashboard and data visualisation
- **Microsoft Excel:** Source data

## Dataset

The project uses the Superstore sample dataset, containing three sheets:

- Orders
- Returns
- People

The sheets were combined during data preparation to create a unified dataset for analysis.

The cleaned dataset contains **10,194 rows**.

## Project Workflow

### 1. Data Preparation using Python

Python and Pandas were used to:

- Load the Orders, Returns and People sheets.
- Merge the datasets using relevant columns.
- Handle missing return information by assigning a return status.
- Clean column names for easier SQL usage.
- Calculate shipping duration in days.
- Calculate profit margin percentage.
- Extract order year and order month.
- Export the cleaned dataset to CSV.

### 2. SQL Analysis using MySQL

The cleaned dataset was imported into MySQL for business analysis.

SQL queries were used to analyse:

- Overall sales, profit, orders and profit margin.
- Loss-making product sub-categories.
- Regional manager performance and return rates.
- Top profitable customers using DENSE_RANK().
- Year-wise sales and profit performance.
- Category-wise sales and profitability.
- Discount levels and their relationship with profit.

### 3. Power BI Dashboard

An interactive dashboard was developed to visualise the key performance indicators and business performance.

The dashboard includes:

- Total Sales
- Total Profit
- Total Orders
- Profit by Sub-Category
- Sales by Segment
- Sales Trend by Year
- Sales by Region and Category

### Dashboard Filters

- Region
- Order Year
- Category

## Key Performance Indicators

| KPI | Value |
|---|---:|
| Total Sales | 2,326,534.35 |
| Total Profit | 292,296.81 |
| Total Orders | 5,111 |
| Total Customers | 804 |
| Total Products | 1,862 |
| Average Order Value | 455.20 |
| Profit Margin | 12.56% |

## Business Questions

This project explores the following business questions:

1. What are the overall sales, profit and order performance?
2. Which product sub-categories generate losses?
3. How do sales and profits vary across regions?
4. How do regional managers perform in terms of sales, profitability and returns?
5. Which customers generate the highest profits?
6. How does sales and profitability performance change over time?
7. Which product categories contribute most to overall profitability?
8. How are discount levels associated with profit?

## Key Insights

*Insights will be documented based on the verified SQL query results and dashboard analysis.*

## Project Structure

Ecommerce_Sales_Analytics/

- 01_Raw_Data/
- 02_Cleaned_Data/
- 03_Python/
- 04_SQL/
- 05_PowerBI/
- 06_Screenshots/
- 07_Documentation/

## Conclusion

This project demonstrates a complete data analytics workflow, from raw data preparation and transformation to SQL-based business analysis and interactive dashboard development.

The objective is to turn raw retail data into meaningful information that can help businesses understand performance, identify profitability challenges and make data-driven decisions.

## Author

Data Analytics Portfolio Project
