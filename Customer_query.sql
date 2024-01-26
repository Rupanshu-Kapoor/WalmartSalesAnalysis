### Customer

-- 1. How many unique customer types does the data have?
SELECT 
	DISTINCT CUSTOMER_TYPE
FROM 
	SALES;


-- 2. How many unique payment methods does the data have?
SELECT 
	DISTINCT PAYMENT
FROM 
	SALES;


-- 3. What is the most common customer type?
SELECT 
	CUSTOMER_TYPE,
    COUNT(CUSTOMER_TYPE) AS `COUNT`
FROM 
	SALES
GROUP BY
	CUSTOMER_TYPE
ORDER BY 
	`COUNT` DESC;


-- 4. Which customer type buys the most?
SELECT 
	CUSTOMER_TYPE,
    AVG(QUANTITY) AS AVG_BUY
FROM 
	SALES
GROUP BY 
	CUSTOMER_TYPE
ORDER BY
	AVG_BUY DESC;


-- 5. What is the gender of most of the customers?
SELECT 
	GENDER,
    COUNT(1) AS `COUNT`
FROM 
	SALES
GROUP BY
	GENDER
ORDER BY 
	`COUNT` DESC;

-- 6. What is the gender distribution per branch?
SELECT
	GENDER,
    COUNT(1) / (SELECT COUNT(1) FROM SALES) * 100 AS `PERCENTAGE` 
FROM 
	SALES
GROUP BY
	GENDER
ORDER BY 
	`PERCENTAGE` DESC;


-- 7. Which time of the day do customers give most ratings?
SELECT 
	TIME_OF_DAY,
    ROUND(AVG(RATING),2) AS AVG_RATING
FROM 
	SALES
GROUP BY 
	TIME_OF_DAY
ORDER BY
	AVG_RATING DESC;
    
    
-- 8. Which time of the day do customers give most ratings per branch?
SELECT BRANCH, TIME_OF_DAY, MOST_RATING 
FROM(
		SELECT 
			BRANCH,
			TIME_OF_DAY,
			ROUND(AVG(RATING),2) AS MOST_RATING,
			RANK() OVER (PARTITION BY BRANCH ORDER BY AVG(RATING) DESC ) AS `RANK`
		FROM 
			SALES
		GROUP BY 
				BRANCH, TIME_OF_DAY
		ORDER BY
			BRANCH, `RANK`)AS ranked_data
WHERE `RANK` = 1;


-- 9. Which day fo the week has the best avg ratings?
SELECT 
	DAY_NAME,
    ROUND(AVG(RATING),2) AS AVG_RATING
FROM 
	SALES
GROUP BY
	DAY_NAME
ORDER BY 
	AVG_RATING DESC LIMIT 1;


-- 10. Which day of the week has the best average ratings per branch?
SELECT BRANCH, DAY_NAME, AVG_RATING
FROM(
	SELECT 
		BRANCH,
		DAY_NAME,
		ROUND(AVG(RATING),2) AS AVG_RATING,
		RANK() OVER (PARTITION BY BRANCH ORDER BY AVG(RATING)DESC) AS RNK
	FROM 
		SALES
	GROUP BY
		BRANCH,DAY_NAME
	ORDER BY 
		BRANCH, AVG_RATING DESC) AS ranked_data
WHERE RNK = 1;