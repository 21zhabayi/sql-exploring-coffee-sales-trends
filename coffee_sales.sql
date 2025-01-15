-- 1. Find the most popular drink
SELECT 
	coffee_name, 
	COUNT(*) AS order_count
FROM 
	"CoffeeSales"
GROUP BY 
	coffee_name
ORDER BY 
	order_count DESC
		
-- 2. Find the drink category with the highest revenue
SELECT 
	coffee_name, 
	SUM(money) AS total_revenue
FROM 
	"CoffeeSales"
GROUP BY 
	coffee_name
ORDER BY 
	total_revenue DESC

-- 3. Determine the time of day with the highest number of orders
SELECT 
	CASE 
		WHEN EXTRACT(HOUR FROM datetime) BETWEEN 6 AND 11 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM datetime) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS time_period,
	COUNT(*) AS order_count
FROM 
	"CoffeeSales"
GROUP BY 
	time_period
ORDER BY 
	order_count DESC

-- 4. Calculate the total revenue for the entire period
SELECT 
	SUM(money) AS total_revenue
FROM 
	"CoffeeSales"

-- 5. Calculate the average price for each drink
SELECT 
	coffee_name, 
	AVG(money) AS average_price
FROM 
	"CoffeeSales"
GROUP BY 
	coffee_name

-- 6. Calculate the total sales for each week
SELECT 
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(WEEK FROM date) AS week,
    SUM(money) AS total_sales
FROM 
    "CoffeeSales"
GROUP BY 
    year, week
ORDER BY 
    year, week;

-- 7. Calculate the most popular drinks by week
SELECT 
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(WEEK FROM date) AS week,
    coffee_name,
    COUNT(*) AS order_count
FROM 
    "CoffeeSales"
GROUP BY 
    year, week, coffee_name
ORDER BY 
    year, week, order_count DESC;

-- 8. Calculate the total sales for each month
SELECT 
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    SUM(money) AS total_sales
FROM 
    "CoffeeSales"
GROUP BY 
    year, month
ORDER BY 
    year, month;

-- 9. Calculate the most popular drinks by month	
SELECT 
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    coffee_name,
    COUNT(*) AS order_count
FROM 
    "CoffeeSales"
GROUP BY 
    year, month, coffee_name
ORDER BY 
    year, month, order_count DESC;
