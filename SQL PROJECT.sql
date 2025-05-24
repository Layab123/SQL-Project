CREATE DATABASE [SQL PROJECT];       -- CREATE A DATABASE

/*
📌📌 Project Title:
Sales Analysis using SQL

📌📌 Description:
This project analyzes sales data through SQL queries — like customer-wise sales, 
top-selling products, regional sales, and shipping mode performance.

📌📌 Objectives:
Perform data analysis

Generate reports using SQL queries

Use aggregate functions, GROUP BY, and ORDER BY

📌📌 Tools & Technologies:
Database: SQL Server

Query Tool: SSMS

Language: SQL

Data Source: DA_SALES table

📌📌 Conclusion:
Learned how to analyze sales data and generate business reports using SQL queries.
*/

--=============================================================================================================--
/*
📌 "Customer-wise Total Sales Report"
📌 What is the total sales amount for each customer?
*/

SELECT CUSTOMER_NAME, SUM(TOTAL_AMOUNT) AS TOTAL_SALES
FROM DA_SALES
GROUP BY CUSTOMER_NAME
ORDER BY TOTAL_SALES DESC;

/*
 📌 Top-Selling Product by Total Sales Revenue
📌 Which products have the highest total sales revenue?
*/
SELECT TOP 1 PRODUCT_NAME , MAX(TOTAL_AMOUNT) AS [TOTAL SALES REVENUE]
 FROM DA_SALES
 GROUP BY PRODUCT_NAME
 ORDER BY [TOTAL SALES REVENUE] DESC;

 /*
 📌 Top-Selling Product Category by Revenue
📌 Which product category generates the highest revenue?
*/
SELECT TOP 1 PRODUCT_NAME ,CATEGORY, MAX(TOTAL_AMOUNT) AS [TOTAL SALES REVENUE]
 FROM DA_SALES
 GROUP BY PRODUCT_NAME,CATEGORY
 ORDER BY [TOTAL SALES REVENUE] DESC;

 /*
📌 Product-wise Total Profit Repor
📌 What is the total profit for each product?
*/
SELECT PRODUCT_NAME,SUM(UNIT_PROFIT) AS [UNIT PROFIT FOR EACH PRODUCT]
FROM DA_SALES
GROUP BY PRODUCT_NAME
ORDER BY [UNIT PROFIT FOR EACH PRODUCT] DESC;

/*
 📌 Total Units Sold per Product
📌 How many units of each product were sold in total?
*/
SELECT PRODUCT_NAME,SUM(SOLD_QUANTITY) AS [SOLD QUANTITY FOR EACH PRODUCT] 
FROM DA_SALES
GROUP BY PRODUCT_NAME
ORDER BY [SOLD QUANTITY FOR EACH PRODUCT] DESC;

/*
 📌 Top 10 Products by Units Sold
📌 What are the top 10 products by sold quantity?
*/
SELECT 
TOP 10
    Product_Name,
    SUM(Sold_Quantity) AS total_quantity_sold
FROM 
    DA_SALES
GROUP BY 
    Product_Name
ORDER BY 
    total_quantity_sold DESC;

/*
📌 Total Sales by Region
📌 What is the total sales by region?
*/
SELECT REGION, SUM(TOTAL_AMOUNT) AS TOTAL_SALES
FROM DA_SALES
GROUP BY REGION
ORDER BY TOTAL_SALES DESC;

/*
 📌 Sales Performance by Shipping Mode
 📌 How does sales performance vary by shipping mode ?
 */
SELECT   SHIP_MODE , SUM(TOTAL_AMOUNT) AS [total sales]
FROM DA_SALES
GROUP BY  SHIP_MODE
ORDER BY [total sales] DESC;


/*
 📌Top-Selling Product by Total Sales Revenue
📌 Which products have the highest total sales revenue?
*/
SELECT TOP 1 PRODUCT_NAME , MAX(TOTAL_AMOUNT) AS [TOTAL SALES REVENUE]
 FROM DA_SALES
 GROUP BY PRODUCT_NAME
 ORDER BY [TOTAL SALES REVENUE] DESC;

 /*
📌 Customers Whose Name Starts with 'J' and Ends with 'N'
📌 Find all customers whose name starts with 'J' and ends with 'n'
*/
SELECT * FROM DA_SALES
WHERE  CUSTOMER_NAME  LIKE'J%N';