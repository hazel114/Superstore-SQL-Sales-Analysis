

-- BASIC DATA CHECKS
SELECT COUNT(*) AS total_records
FROM superstore;

SELECT DISTINCT Category AS unique_categories
FROM superstore;

SELECT DISTINCT Region AS unique_regions
FROM superstore;


-- NULL VALUE CHECK
SELECT
SUM(CASE WHEN `Ship Mode` IS NULL THEN 1 ELSE 0 END) AS ship_mode_nulls,
SUM(CASE WHEN Segment IS NULL THEN 1 ELSE 0 END) AS segment_nulls,
SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS country_nulls,
SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS city_nulls,
SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS state_nulls,
SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS sales_nulls,
SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS profit_nulls
FROM superstore;

-- BLANK VALUE CHECK
SELECT COUNT(*) AS blank_city_count
FROM superstore
WHERE TRIM(City) = '';

-- NEGATIVE VALUE CHECKS
SELECT * FROM superstore WHERE Sales < 0;
SELECT * FROM superstore WHERE Quantity < 0;
SELECT * FROM superstore WHERE Discount < 0;
SELECT * FROM superstore WHERE Profit < 0;


-- SALES BY CATEGORY
SELECT Category,
       ROUND(SUM(Sales),2) AS total_sales
FROM superstore
GROUP BY Category
ORDER BY total_sales DESC;

-- SALES BY STATE
SELECT State,
       ROUND(SUM(Sales),2) AS total_sales
FROM superstore
GROUP BY State
ORDER BY total_sales DESC;

-- TOP 10 STATES BY SALES
SELECT State,
       ROUND(SUM(Sales),2) AS total_sales
FROM superstore
GROUP BY State
ORDER BY total_sales DESC
LIMIT 10;
