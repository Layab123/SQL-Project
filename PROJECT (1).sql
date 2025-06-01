CREATE DATABASE PROJECT;                            -- TO CREATE A DATABASE 
-- ⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩ PROJECT: Advanced Sales Insights – Unlocking Data Trends ⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩⬩
-- ⯁ FILTERING SALES DATA
-- ❖ Q1: Find all orders shipped via 'Economy' mode with a total amount greater than ₹25,000.
-- ◈ 
SELECT * FROM SALES
WHERE SHIP_MODE = 'ECONOMY'
AND TOTAL_AMOUNT > 25000;
                         

-- ❖ Q2: Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.
-- ◈ 
SELECT *  
FROM sales  
WHERE category = 'TECHNOLOGY'  
AND country = 'IRELAND'  
AND order_date > '2020-01-01';
 

-- ⯁ Sorting & Filtering
-- ❖ Q3: List the top 10 most profitable sales transactions in descending order.
-- ◈  
SELECT TOP 10 * FROM SALES 
ORDER BY UNIT_PROFIT DESC;


-- ⯁ Using Wildcards
-- ❖ Q4: Find all customers whose name starts with 'J' and ends with 'n'.
-- ◈ 
SELECT * FROM SALES
WHERE CUSTOMER_NAME LIKE 'J%N';


-- ❖ Q5: Retrieve all product names that contain 'Acco' anywhere in the name.
-- ◈ 
SELECT * FROM SALES
WHERE PRODUCT_NAME LIKE '%ACCO%';


-- ⯁ Limiting & Pagination
-- ❖ Q6: Get the top 5 cities with the highest total sales amount.
-- ◈ 
SELECT TOP 5 CITY, SUM(TOTAL_AMOUNT) AS TOTAL_SALES  
FROM SALES  
GROUP BY CITY  
ORDER BY TOTAL_SALES DESC;


-- ❖ Q7: Display the second set of 10 records, including: Order_ID, City, Country, Region, Category, Total Amount.
-- ◈ 
SELECT Order_ID, City, Country, Region, Category, Total_Amount FROM SALES 
ORDER BY ORDER_ID  
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;


-- ⯁ Aggregating Data
-- ❖ Q8: Find the total revenue, average unit cost, and total number of orders.
-- ◈ 
SELECT SUM(TOTAL_AMOUNT) AS TOTAL_REVENUE, AVG(UNIT_COST) AS AVG_UNIT_COST, COUNT(ORDER_ID) AS TOTAL_ORDERS FROM SALES;


-- ❖ Q9: Get total sales per product category.
-- ◈ 
SELECT CATEGORY, SUM(TOTAL_AMOUNT) AS TOTAL_SALES FROM SALES  
GROUP BY CATEGORY
ORDER BY TOTAL_SALES ASC;


-- ❖ ❖ Q10: Find the number of orders placed by each customer.   
-- ◈
SELECT CUSTOMER_NAME, COUNT(ORDER_ID) AS TOTAL_ORDER
FROM SALES
GROUP BY CUSTOMER_NAME;


-- ⯁ Filtering Groups
-- ❖ Q11: Get customers who have placed orders worth more than ₹50,000.
-- ◈ 
SELECT ORDER_ID, CUSTOMER_NAME  FROM SALES  
WHERE TOTAL_AMOUNT > 50000;

SELECT ORDER_ID, CUSTOMER_NAME, SUM(TOTAL_AMOUNT) AS TOTAL_SPENT FROM SALES 
GROUP BY ORDER_ID, CUSTOMER_NAME  
HAVING SUM(TOTAL_AMOUNT) > 50000;


-- ⯁ Ranking Data
-- ❖ Q12: Rank products based on total sales using RANK().
-- ◈  
SELECT PRODUCT_NAME, SUM(TOTAL_AMOUNT) AS TOTAL_SALES, 
RANK() OVER (ORDER BY SUM(TOTAL_AMOUNT) DESC) AS PRODUCT_RANK FROM SALES
GROUP BY PRODUCT_NAME
ORDER BY PRODUCT_RANK;

-- ❖❖ Q13: Find the top 5 customers by sales revenue using DENSE_RANK().
--
SELECT TOP 5 CUSTOMER_NAME,TOTAL_AMOUNT, DENSE_RANK() OVER (ORDER BY TOTAL_AMOUNT DESC) AS [RANK WITH PROPER SEQ] FROM SALES;


-- ⯁ Advanced Queries (CTE)
-- ❖ ❖ Q14: Use a CTE to find the top 3 most sold product categories.
-- ◈ 
WITH PROPER_RANK AS
(SELECT PRODUCT_NAME, DENSE_RANK() OVER (ORDER BY PRODUCT_NAME DESC) AS  [PRODUCT RANK POSITION]
FROM SALES
)
SELECT * FROM PROPER_RANK
WHERE [PRODUCT RANK POSITION] < 4;

-- ❖❖ Q15: Use a CTE to find the top-selling product in each category.
-- ◈ 
WITH PRODUCT_SALE AS (  
SELECT CATEGORY, PRODUCT_NAME, SUM(TOTAL_AMOUNT) AS TOTAL_SALES,  
RANK() OVER (PARTITION BY CATEGORY ORDER BY SUM(TOTAL_AMOUNT) DESC) AS RANK  
FROM SALES
GROUP BY CATEGORY, PRODUCT_NAME
)  
SELECT CATEGORY, PRODUCT_NAME, TOTAL_SALES 
FROM PRODUCT_SALE
WHERE RANK = 1; 





SELECT * FROM SALES;