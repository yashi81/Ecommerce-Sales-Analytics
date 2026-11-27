CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;

-- Query 1: Overall KPIs
SELECT 
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Pct
FROM superstore;

-- Query 2: Loss-Making Sub-Categories
SELECT 
    Category, Sub_Category, 
    ROUND(SUM(Sales), 2) AS Total_Sales, 
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Discount) * 100, 1) AS Avg_Discount_Pct
FROM superstore
GROUP BY Category, Sub_Category
HAVING Total_Profit < 0
ORDER BY Total_Profit ASC;

-- Query 3: Regional Manager Performance & Return Rate
SELECT 
    Region, Regional_Manager,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    -- ROUND(SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Return_Rate_Pct
    ROUND(COUNT(DISTINCT CASE WHEN Returned = 'Yes' THEN Order_ID END) * 100.0 / COUNT(DISTINCT Order_ID),2) AS Return_Rate_Pct
FROM superstore
GROUP BY Region, Regional_Manager
ORDER BY Total_Profit DESC;

-- Query 4: Top 5 Profitable Customers (Window Function)
SELECT * FROM (
    SELECT 
        Customer_Name, Segment, 
        ROUND(SUM(Profit), 2) AS Total_Profit,
        DENSE_RANK() OVER (ORDER BY SUM(Profit) DESC) AS Customer_Rank
    FROM superstore
    GROUP BY Customer_Name, Segment
) ranked
WHERE Customer_Rank <= 5;

-- Query 5: Year-wise Sales & Profit Analysis
SELECT 
    Order_Year,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Pct,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM superstore
GROUP BY Order_Year
ORDER BY Order_Year;

-- Query 6: Category-wise Sales & Profitability
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Pct,
    SUM(Quantity) AS Total_Quantity_Sold
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Query 7: Discount vs Profit Analysis
SELECT 
    Discount,
    ROUND(Discount * 100, 1) AS Discount_Pct,
    COUNT(*) AS Total_Records,
    SUM(Quantity) AS Total_Quantity_Sold,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Record
FROM superstore
GROUP BY Discount
ORDER BY Discount;