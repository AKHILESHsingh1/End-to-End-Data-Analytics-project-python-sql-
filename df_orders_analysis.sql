-- for using the database
use demo;

-- for creating a table in which data should import
CREATE TABLE df_orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    ship_mode VARCHAR(20),
    segment VARCHAR(20),
    country VARCHAR(20),
    city VARCHAR(20),
    state VARCHAR(20),
    postal_code VARCHAR(20),
    region VARCHAR(20),
    category VARCHAR(20),
    sub_category VARCHAR(20),
    product_id VARCHAR(50),
    quantity INT,
    discount DECIMAL(7,2),
    sale_price DECIMAL(7,2),
    profit DECIMAL(7,2)
);

-- for description of data
desc df_orders;
select * from df_orders;

-- find to 10 higtest renenue product
select product_id, sum(sale_price) as revenue from df_orders group by product_id order by sum(sale_price) desc limit 10;

-- fimd top 5 highest selling product in each region
with cte as (
select region,product_id,sum(sale_price) as revenue from df_orders group by region,product_id),cte2 as (
select *,
row_number() over(partition by region order by revenue desc) as rnk from cte)
select region, product_id, revenue from cte2 where rnk <=5;

-- find month over month growth comparion for 2022 and 2023 sales eg:- jan2022 vs jan2023
WITH cte AS (
SELECT YEAR(order_date) AS years,MONTH(order_date) AS months,SUM(sale_price) AS revenue FROM df_orders
GROUP BY YEAR(order_date), MONTH(order_date))
SELECT months,SUM(CASE WHEN years = 2022 THEN revenue ELSE 0 END) AS sales_2022,SUM(CASE WHEN years = 2023 THEN revenue ELSE 0 END) AS sales_2023 FROM cte
GROUP BY months
ORDER BY months;

-- for each category which months has highest sales
with cte as(
select category,year(order_date)as years,month(order_date) as months,sum(sale_price) as sale from df_orders
group by category,year(order_date),month(order_date)
order by category,year(order_date),month(order_date))
,cte2 as(
select *,
row_number() over(partition by category order by sale desc) as rnk from cte)
select category, years, months, sale from cte2 where rnk=1;

-- Which sub-category has a hightest growth by profit in 2023 campare to 2022
WITH cte AS (
SELECT sub_category,YEAR(order_date) AS years,SUM(sale_price) AS revenue FROM df_orders
GROUP BY sub_category,YEAR(order_date)),
cte2 as(
SELECT sub_category,
SUM(CASE WHEN years = 2022 THEN revenue ELSE 0 END) AS sales_2022,
SUM(CASE WHEN years = 2023 THEN revenue ELSE 0 END) AS sales_2023 FROM cte
GROUP BY sub_category)
select *,
(sales_2023-sales_2022) as growth
 from cte2
 order by growth desc limit 1;