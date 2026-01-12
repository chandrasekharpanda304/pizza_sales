DROP TABLE IF EXISTS pizza_sales;
CREATE TABLE pizza_sales(
						pizza_id INT,
						order_id INT,
						pizza_name_id VARCHAR(50),
						quantity INT,	
						order_date DATE,
						order_time TIME,
						unit_price FLOAT,
						total_price FLOAT,
						pizza_size VARCHAR(50),
						pizza_category VARCHAR(50),	
						pizza_ingredients VARCHAR(100),	
						pizza_name VARCHAR(50)
						);

select * from pizza_sales
-- A. KPI’s
-- TOTAL REVENUE
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

-- AVERAGE ORDER VALUE
SELECT (SUM(total_price)/ COUNT (DISTINCT order_id)) as Avg_Order from pizza_sales

-- Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

-- Average Pizzas Per Order
SELECT 
    ROUND(
        SUM(quantity)::DECIMAL / COUNT(DISTINCT order_id), 
        2
    ) AS avg_pizzas_per_order
FROM pizza_sales;

-- B. Daily Trend for Total Orders

SELECT 
    TO_CHAR(order_date, 'Day') AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_day
ORDER BY total_orders DESC;

-- C. Hourly Trend for Orders
SELECT 
    EXTRACT(HOUR FROM order_time) AS order_hours,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY order_hours
ORDER BY total_orders DESC;

-- D. % of Sales by Pizza Category
SELECT 
    pizza_category,
    ROUND(SUM(total_price)::numeric, 2) AS total_revenue,
    ROUND(
        (SUM(total_price) * 100.0 
        / (SELECT SUM(total_price) FROM pizza_sales))::numeric,
        2
    ) AS pct
FROM pizza_sales
GROUP BY pizza_category;

-- E. % of Sales by Pizza Size
SELECT 
    pizza_size,
    ROUND(SUM(total_price)::numeric, 2) AS total_revenue,
    ROUND(
        (SUM(total_price) * 100.0 
        / (SELECT SUM(total_price) FROM pizza_sales))::numeric,
        2
    ) AS pct
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pct DESC;

-- F. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE order_date >= '2015-02-01'  --optional, you can use if you want to
  AND order_date <  '2015-03-01'  --optional, you can use if you want to
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

-- G. Top 5 Best Sellers by Total Pizzas Sold
SELECT pizza_name, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold DESC
LIMIT 5;

-- H. Bottom 5 Best Sellers by Total Pizzas Sold
SELECT pizza_name, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold
LIMIT 5;

