SELECT * 
FROM sales;

-- How many unique cities does the data have?
SELECT COUNT(DISTINCT city) AS number_of_cities 
FROM sales;

-- In which city is each branch?
SELECT DISTINCT city, branch 
FROM sales;

-- Product Analysis

-- 1. How many unique product lines does the data have?
SELECT DISTINCT product_line 
FROM sales;

-- 2. What is the most common payment method?
SELECT 
    payment_method,
    COUNT(payment_method) AS total_usage 
FROM sales
GROUP BY payment_method
ORDER BY total_usage DESC 
LIMIT 1;

-- 3. What is the most selling product line?
SELECT 
    product_line, 
    total 
FROM sales 
ORDER BY total DESC 
LIMIT 1;

-- 4. What is the total revenue by month?
SELECT 
    month_name, 
    SUM(total) AS monthly_sales
FROM sales
GROUP BY month_name;

-- 5. What month had the largest COGS?
SELECT 
    month_name, 
    SUM(cogs) AS monthly_cogs
FROM sales
GROUP BY month_name
ORDER BY monthly_cogs DESC 
LIMIT 1;

-- 6. What product line had the largest revenue?
SELECT 
    product_line, 
    SUM(total) AS product_revenue
FROM sales
GROUP BY product_line
ORDER BY product_revenue DESC 
LIMIT 1;

-- 7. What is the city with the largest revenue?
SELECT 
    city, 
    SUM(total) AS city_revenue
FROM sales
GROUP BY city 
ORDER BY city_revenue DESC 
LIMIT 1;

-- 8. What product line had the largest VAT?
SELECT 
    product_line,
    ROUND(SUM(vat), 2) AS total_vat
FROM sales
GROUP BY product_line
ORDER BY total_vat DESC 
LIMIT 1;

-- 9. Label each product line as 'Good' if its average quantity sold 
-- is above the overall average quantity sold, otherwise label it 'Bad'.
WITH AverageSales AS (
    SELECT AVG(quantity) AS overall_avg
    FROM sales
)
SELECT
    product_line,
    CASE
        WHEN AVG(quantity) > (SELECT overall_avg FROM AverageSales) THEN 'Good'
        ELSE 'Bad'
    END AS remark
FROM sales
GROUP BY product_line;

-- 10. Which branch sold more products than average product sold?
WITH average_product_sold AS (
    SELECT AVG(quantity) AS avg_quantity 
    FROM sales
)
SELECT 
    branch, 
    SUM(quantity) AS total_sold 
FROM sales 
GROUP BY branch
HAVING SUM(quantity) > (SELECT avg_quantity FROM average_product_sold);

-- 11. What is the most common product line by gender?
SELECT
    gender,
    product_line,
    COUNT(gender) AS total_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_cnt DESC;

-- 12. What is the average rating of each product line?
SELECT
    ROUND(AVG(rating), 2) AS avg_rating,
    product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- Sales Analysis

-- 1. Number of sales made in each time of the day per weekday
SELECT
    day_name,
    time_of_day,
    COUNT(*) AS total_sales
FROM sales
GROUP BY day_name, time_of_day
ORDER BY day_name, total_sales DESC;

-- 2. Which of the customer types brings the most revenue?
SELECT 
    customer_type, 
    ROUND(SUM(total), 2) AS total_revenue
FROM sales 
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- 3. The city with the highest average tax rate per transaction
SELECT 
    city,
    ROUND(AVG(vat), 2) AS avg_vat 
FROM sales 
GROUP BY city
ORDER BY avg_vat DESC 
LIMIT 1;

-- 4. Which customer type pays the most in VAT?
SELECT 
    customer_type, 
    ROUND(AVG(vat), 2) AS avg_vat
FROM sales 
GROUP BY customer_type
ORDER BY avg_vat DESC 
LIMIT 1;

-- Customer Analysis

-- 1. How many unique customer types does the data have?
SELECT COUNT(DISTINCT customer_type) AS customer_types 
FROM sales;

-- 2. How many unique payment methods does the data have?
SELECT COUNT(DISTINCT payment_method) AS total_payment_methods
FROM sales;

-- 3. Which customer type buys the most?
SELECT
    customer_type,
    COUNT(*) AS total_purchases
FROM sales
GROUP BY customer_type;

-- 4. What is the gender of most of the customers?
SELECT
    gender,
    COUNT(*) AS gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- 5. What is the gender distribution per branch?
SELECT 
    branch,
    gender,
    COUNT(gender) AS gender_distribution 
FROM sales
GROUP BY gender, branch;

-- 6. Which time of the day do customers give most ratings?
SELECT 
    day_name, 
    time_of_day, 
    COUNT(rating) AS total_ratings
FROM sales
GROUP BY day_name, time_of_day
ORDER BY day_name DESC, time_of_day DESC;

-- Show sales data
SELECT * 
FROM sales;

-- 7. Which day of the week has the best average ratings?
SELECT 
    DISTINCT day_name,
    ROUND(AVG(rating), 2) AS avg_rating 
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC 
LIMIT 1;
