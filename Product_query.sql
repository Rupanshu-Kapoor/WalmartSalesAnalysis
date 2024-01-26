
SELECT * FROM SALES;

### Generic Question

# 1. How many unique cities does the data have?
SELECT 
	DISTINCT CITY 
FROM 
	SALES;

#2. How many unique branch does the data have?
SELECT 
	DISTINCT BRANCH 
FROM 
	SALES;


### Product

-- 1. How many unique product lines does the data have?
SELECT 
	DISTINCT PRODUCT_LINE 
FROM 
    SALES;

-- 2. What is the most common payment method?
SELECT 
	PAYMENT, 
    COUNT(1) AS `COUNT`
FROM 
	SALES
GROUP BY 
	PAYMENT
ORDER BY 
	`COUNT` DESC ;

-- 3. What is the most selling product line?
SELECT 
	PRODUCT_LINE, 
    COUNT(1) AS `COUNT`
FROM 
	SALES
GROUP BY 
	PRODUCT_LINE
ORDER BY 
	`COUNT` DESC LIMIT 1;

-- 4. What is the total revenue by month?

SELECT 
	MONTH_NAME AS `MONTH`, 
    SUM(TOTAL) AS REVENUE
FROM 
	SALES
GROUP BY 
	`MONTH`
ORDER BY
	REVENUE DESC;


-- 5. What month had the largest COGS?

SELECT 
	MONTH_NAME AS `MONTH`, 
    SUM(COGS) AS COGS
FROM 
	SALES
GROUP BY 
	`MONTH`
ORDER BY 
	COGS DESC LIMIT 1;


-- 6. What product line had the largest revenue?

SELECT 
	PRODUCT_LINE, 
	SUM(TOTAL) AS REVENUE
FROM 
	SALES
GROUP BY 
	PRODUCT_LINE
ORDER BY 
	REVENUE DESC LIMIT 1;

-- 7. What is the city with the largest revenue?

SELECT 
	CITY, 
	SUM(TOTAL) AS REVENUE
FROM 
	SALES 
GROUP BY 
	CITY
ORDER BY 
	REVENUE DESC LIMIT 1;


-- 8. What product line had the largest VAT?
-- VAT = 5 % OF COGS
SELECT 
	PRODUCT_LINE, 
	AVG((0.05 * COGS)) AS VAT
FROM 
	SALES
GROUP BY 
	PRODUCT_LINE
ORDER BY 
	VAT DESC LIMIT 1;
 
-- 9. Which branch sold more products than average product sold?
SELECT * FROM SALES;
SELECT 
	BRANCH,
    SUM(QUANTITY) AS QUANTITY
FROM 
	SALES
GROUP BY 
	BRANCH
HAVING 
	QUANTITY >0;
    
SELECT AVG(QUANTITY) FROM SALES;

-- 10. What is the most common product line by gender?
SELECT 
	GENDER, `PRODUCT LINE`, `COUNT`, `RANK`
FROM (
	SELECT 
		GENDER, 
        PRODUCT_LINE AS `PRODUCT LINE`, 
        COUNT(PRODUCT_LINE) AS `COUNT`,
		RANK() OVER (PARTITION BY GENDER ORDER BY COUNT(PRODUCT_LINE) DESC) AS `RANK`
	FROM 
		SALES 
	GROUP BY 
		GENDER, PRODUCT_LINE
) AS ranked_data
WHERE `RANK` = 1;


-- 11. What is the average rating of each product line?

SELECT 
	PRODUCT_LINE AS `PRODUCT LINE`, 
    ROUND(AVG(RATING),2) AS `AVG_RATING`
FROM 
	SALES
GROUP BY 
	PRODUCT_LINE;
    
    
    
select
	product_line,
    round(avg(total),2) as avg_sales,
    (case
		when AVG(total) > (SELECT AVG(total) FROM sales) then "Good"
        else "Bad"
	end) as remarks
from sales;