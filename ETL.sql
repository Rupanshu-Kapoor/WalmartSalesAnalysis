-- Create Database
CREATE DATABASE IF NOT EXISTS 	WalmartSales;
USE WalmartSales;


-- Create table
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2)
);


-- -------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------ADDING COLUMNS---------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------

-- ADD time_of_day COLUMN

ALTER TABLE SALES
ADD COLUMN time_of_day VARCHAR(20);

UPDATE SALES
SET time_of_day = (CASE
		WHEN `TIME` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `TIME` BETWEEN "12:00:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
	END
);



-- -------------------------------------------------------------------------------------------------------------------------------------------
-- ADD day_name COLUMN
-- -------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE SALES
ADD COLUMN day_name varchar(20);

UPDATE SALES 
SET day_name = DAYNAME(DATE);




-- -------------------------------------------------------------------------------------------------------------------------------------------
-- Add month_name columns
-- -------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE SALES
ADD COLUMN month_name varchar(20);

UPDATE SALES
SET month_name = MONTHNAME(date)