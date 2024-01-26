### Sales

-- 1. Number of sales made in each time of the day per weekday
SELECT 
	DAY_NAME,
    COUNT(1) AS NoOfSales
FROM 
	SALES
GROUP BY DAY_NAME;


-- 2. Which of the customer types brings the most revenue?
SELECT 
	CUSTOMER_TYPE,
    SUM(TOTAL) AS `TOTAL REVENUE`
FROM 
	SALES
GROUP BY 
	CUSTOMER_TYPE
ORDER BY
	`TOTAL REVENUE` DESC;


-- 3. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
SELECT 
	CITY,
    ROUND(AVG(TAX_PCT),2) AS AVG_TAX
FROM 	
	SALES
GROUP BY
	CITY
ORDER BY 
	AVG_TAX DESC;

-- 4. Which customer type pays the most in VAT?
SELECT 
	CUSTOMER_TYPE,
    ROUND(AVG(TAX_PCT),2) AS AVG_TAX
FROM 
	SALES
GROUP BY 
	CUSTOMER_TYPE
ORDER BY 
	AVG_TAX DESC;
