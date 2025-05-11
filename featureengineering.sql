/* Feature Engineering: Extract time-based categories from 'time' column */
SELECT 
    time,
    CASE 
        WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN `time` BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_date
FROM 
    sales;

/* Add new column 'time_of_day' to store categorized time */
ALTER TABLE sales 
ADD COLUMN time_of_day VARCHAR(20);

/* Populate 'time_of_day' column based on the 'time' column */
UPDATE sales 
SET time_of_day = CASE 
    WHEN `time` BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
    WHEN `time` BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
    ELSE 'Evening'
END;

/* View 'date' column to prepare for extracting day and month info */
SELECT 
    date 
FROM 
    sales;

/* Extract day name from 'date' column */
SELECT 
    date, 
    DAYNAME(date) AS day_name 
FROM 
    sales;

/* Add new column 'day_name' to store day of the week */
ALTER TABLE sales 
ADD COLUMN day_name VARCHAR(20);

/* Update 'day_name' column with the day of the week */
UPDATE sales
SET day_name = DAYNAME(date);

/* Preview month names extracted from 'date' column */
SELECT 
    MONTHNAME(date) AS month_name 
FROM 
    sales;

/* Add new column 'month_name' to store the month name */
ALTER TABLE sales 
ADD COLUMN month_name VARCHAR(20);

/* Populate 'month_name' column based on the 'date' column */
UPDATE sales
SET month_name = MONTHNAME(date);
