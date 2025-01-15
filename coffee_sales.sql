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