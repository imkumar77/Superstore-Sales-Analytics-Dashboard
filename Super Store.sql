create database Super_Store;
use super_store;

CREATE TABLE Sales(
  Id INT AUTO_INCREMENT PRIMARY KEY,
  Ship_Mode VARCHAR(20),
  Segment VARCHAR(20),
  Country VARCHAR(20),
  City VARCHAR(20),
  StateName VARCHAR(50),  -- changed here
  Postal_code INT,
  Region VARCHAR(20),
  Category VARCHAR(25),
  Sub_Category VARCHAR(25),
  Sales DECIMAL(10,2),
  Quantity INT,
  Discount DECIMAL(4,2),
  Profit DECIMAL(10,2)	
);

ALTER TABLE Sales 
CHANGE COLUMN City Customer_City VARCHAR(20),
change column StateName Customer_State varchar(50);

alter table sales
add column Ship_date date ;

update sales
set Ship_date = DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 1096) DAY);

alter table sales
add column order_date date;

UPDATE sales
SET Order_Date = DATE_ADD('2022-12-25', INTERVAL FLOOR(RAND() * 1096) DAY);


UPDATE sales
SET Ship_Date = DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 1096) DAY);

select * from sales;

-- Here we are facing issue and we need to solve on by one
-- Total sales and profit overall, by region, or by state.
select region,sum(sales) as total_sales,sum(profit) as Total_profit
from sales
group by region 
having total_sales;

select customer_state,sum(sales) as total_sales,sum(profit) as Total_profit
from sales
group by customer_state
having total_sales;


-- Top 10 most profitable cities.
select customer_city, sum(profit) as sum_profit
from sales
group by customer_city
having sum_profit
order by sum_profit desc
limit 10; 

-- Customer & Market Segmentation
-- Sales by Segment (Consumer, Corporate, Home Office).
select sum(sales)as sum_sales, segment
from sales
group by Segment
order by sum_sales desc;




-- Profitability by Category and Sub-Category.
select sum(profit) as total_profit, category,sub_category
from sales
group by category, sub_category
order by total_profit desc;

-- Which city/state/region is most profitable, and which is loss-making?
select sum(profit) as sum_profit,customer_city,region,Customer_state
from sales
group by customer_city,region,Customer_state
order by sum_profit desc; -- most profitable 

select sum(profit) as sum_profit,customer_city,region,Customer_state
from sales
group by customer_city,region,Customer_state
order by sum_profit asc; -- loss making

-- Discounts & Profitability
-- Find if higher discounts lead to lower profits.
select
discount,
 avg(profit) as avg_profit, 
 count(*) as num_orders
from sales
group by discount
order by discount;
-- Which products are sold at high discounts but cause losses?
select
Discount,
avg(sales) as avrg_sales,
count(*) as num_sales
from sales
group by  Discount
order by discount desc	;

-- Shipping & Operations
-- Which ship mode is most frequently used and most profitable?

SELECT 
    Ship_Mode,
    COUNT(*) AS num_orders,
    SUM(Profit) AS total_profit,
    AVG(Profit) AS avg_profit_per_order
FROM sales
GROUP BY Ship_Mode
ORDER BY total_profit DESC;

-- Advanced

-- Use window functions to rank top-selling categories within each region.
select category, 
region,
sum(sales) as total_sales,
rank() over (partition by region order by sum(sales) desc) as sales_rank
from sales
group by region,category
order by region,sales_rank;

-- Identify sales trends year-over-year.

select 
year(order_date) as sales_year,
sum(sales) as total_sales,
count(*) as num_orders,
avg(sales) as avrg_order_value
from sales
group by year(order_date)
order by year(order_date);

-- Which regions show the highest sales growth year-over-year?
select 
region,
year(order_date) as sales_year,
sum(sales) as total_sales,
count(*) as num_orders,
avg(sales) as avrg_order_value
from sales
group by region, year(order_date)
order by total_sales desc;

-- Forecast sales at category level (if you connect SQL + Power BI or Excel).

-- drop table sales;