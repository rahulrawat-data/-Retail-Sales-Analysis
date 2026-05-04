-- SQL Retail Sales Analysis 
-- Create TABLE
create database sql_project_p2;


use sql_project_p2;

CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );

-- Data Exploration

-- How many sales we have?
select count(*) as Total_sales from retail_sales;

-- How many uniuque customers we have ?
select count(distinct(customer_id)) from retail_sales;

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales where sale_date = '2022-11-05';
-- count how many sales happned 
select count(*) from retail_sales where sale_date = '2022-11-05';



-- Q.2 Write a SQL query to retrieve all transactions where the category 
-- is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT 
   *
FROM retail_sales
WHERE 
    category = 'Clothing'
    AND
    DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
    AND
    quantity >= 4
LIMIT 0, 50000;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category, SUM(total_sale) Total_sales,count(*) total_orders
FROM
    retail_sales
GROUP BY category;


-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
    category,avg(age) Average_age
FROM
    retail_sales
where category='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater and equal than 1000.
select * from retail_sales where total_sale >= 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
    gender,
    COUNT(DISTINCT (transaction_id)) transaction_madeby_male
FROM
    retail_sales
WHERE
    gender = 'Male';


-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT year, month, total_sale 
FROM (
    SELECT 
        YEAR(sale_date) AS year, 
        MONTH(sale_date) AS month, 
        SUM(total_sale) AS total_sale,
        RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY SUM(total_sale) DESC) AS rank1
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS best 
where rank1 = 1;


-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT DISTINCT
    (customer_id) customer_id, SUM(total_sale) total_sale
FROM
    retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT 
    COUNT(DISTINCT (customer_id)), category
FROM
    retail_sales
GROUP BY category;


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon
-- Between 12 & 17, Evening >17)

SELECT 
    shift, COUNT(transaction_id) no_of_orders
FROM
    (SELECT 
        *,
            CASE
                WHEN HOUR(sale_time) < 12 THEN 'Morning'
                WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
                ELSE 'Evening'
            END AS shift
    FROM
        retail_sales) AS retail_sales
GROUP BY shift;
