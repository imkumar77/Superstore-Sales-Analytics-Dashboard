# Superstore-Sales-Analytics-Dashboard
A complete data analytics solution built using SQL and Power BI to explore and visualize retail sales performance. This project demonstrates how to transform raw sales data into actionable insights for business decision-making. 

---
## Description
A complete end-to-end retail analytics project that transforms raw sales data into actionable business insights. Built with SQL for data modeling and Power BI for interactive dashboarding, this project explores profitability, customer segmentation, discount impact, and operational efficiency across regions, categories, and time
- SQL-based data modeling and enrichment
- Power BI dashboard with interactive visuals
- Regional and state-level sales & profit analysis
- Customer segmentation and product profitability
- Discount impact and shipping mode efficiency
- Year-over-year trend tracking and forecasting
  
## Tools & Technologies
- SQL (MySQL) – Data modeling, transformation, and analysis
- Power BI – Dashboard creation and visualization
- Excel/CSV – Source data format

## Database Setup

```sql
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

```

### 1. Database Setup
- Created a MySQL database named Super_Store.
  ```sql
  create database Super_Store;
  ```
  
- Defined the Sales table to store transactional data including customer location, product category, shipping details, and financial metrics like sales, discount, and profit.
- Added Order_Date and Ship_Date columns using randomized date logic for time-series analysis.

### 2. Data Cleaning & Preparation
- Renamed columns for clarity (City → Customer_City, StateName → Customer_State).
- Ensured proper data types for numeric fields (Sales, Profit, Discount, Quantity) and date fields.
- Populated date columns using SQL functions like DATE_ADD() and RAND() to simulate realistic order and shipping timelines.

### 3. Exploratory Data Analysis (EDA)
- Aggregated sales and profit by region, state, and city to identify high-performing areas.
- Analyzed customer segments (Consumer, Corporate, Home Office) and their contribution to revenue.
- Evaluated product category profitability and ranked sub-categories using SQL window functions.
- Investigated discount patterns and their correlation with profit margins.
- Assessed shipping modes for frequency and profitability.
- Tracked year-over-year sales trends and regional growth using SQL date functions.

### Data Used
- Data link: https://www.kaggle.com/datasets/khairullahhamsafar/sample-supper-store-data
- Data : [Super_store_Rwa.csv](https://github.com/user-attachments/files/22476889/Super_store_Rwa.csv)
- Data after adding Date Column :
  
```sql
  
update sales
set Ship_date = DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 1096) DAY);
UPDATE sales
SET Order_Date = DATE_ADD('2022-12-25', INTERVAL FLOOR(RAND() * 1096) DAY);

```
[Super store modify.csv](https://github.com/user-attachments/files/22476907/Super.store.modify.csv)

### SQL queries
I used MYSql Workbench
[Super Store.sql](https://github.com/user-attachments/files/22476996/Super.Store.sql)

### Outcomes from Sql

SQL queries revealed that the West and East regions are the most profitable, with California and New York leading at the state level. The Consumer segment drives the highest sales, while Technology products, especially Phones and Accessories, yield the most profit. Cities like Los Angeles and New York City dominate profitability, whereas some states like Florida show weaker margins. Higher discounts tend to reduce profit, and Standard Class is the most used shipping mode but not the most profitable. Year-over-year trends show consistent growth, especially in the West and East, making them ideal for future expansion.

---






