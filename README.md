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

## BRD

https://github.com/imkumar77/Superstore-Sales-Analytics-Dashboard/blob/main/Superstore%20Sales%20Analytics%20Dashboard%20BRD.docx
  
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

## Why I Shifted to Power BI

While SQL is powerful for data modeling and analysis, it offers limited visual representation and lacks built-in forecasting capabilities. I shifted to Power BI to overcome these limitations—its interactive dashboards allow me to visualize current business scenarios and uncover future trends. Power BI bridges the gap between raw data and strategic insight, making it easier for stakeholders to explore patterns, compare performance, and make informed decisions.

### Database setup

### 1. Connect Power BI to SQL Database

1. Open Power BI Desktop.

2. Click Home > Get Data > SQL Server (for SQL Server) or MySQL Database (for MySQL).

3. Enter  Server name ( in SSMS or MySQL Workbench).

4. Example for MySQL: localhost or 127.0.0.1

5. Example for SQL Server: .\SQLEXPRESS or your instance name.

6. Choose Database name created earlier .

7. Click OK, then select the tables want to import.

### 2. Data Transformation

1. Before loading into reports:

2. Remove unnecessary columns.

3. Rename fields for clarity.

4. Change data types (e.g., Date, Currency, Text).

5. Create calculated columns

### New Table 
For forcesting create new table called "DATE"

```Dax
Date = 
ADDCOLUMNS(
    CALENDAR(MIN('super_store sales'[order_date]), MAX('super_store sales'[order_date])),
    "Year", YEAR([Date]),
    "Month", MONTH([Date]),
    "MonthName", FORMAT([Date],"MMM"),
    "Quarter", "Q" & FORMAT([Date],"Q")
)

```

### Model view

<img width="882" height="444" alt="{D8AA76FE-1181-46DD-A632-499B5A699071}" src="https://github.com/user-attachments/assets/37a58997-b6f0-47b7-aaab-c083d59e9690" />

## Dashboard

<img width="1147" height="703" alt="{831A2B77-C433-4DC3-B356-E9ACF8BCD123}" src="https://github.com/user-attachments/assets/3a9d741b-2815-4551-8aff-4b54d9f1aea7" />


## Insights

### KPIs 

- Total Profit ($286.4K)

Shows the net profit across all sales.

A healthy profit, but you’ll notice in other visuals that profit varies by region and category.

- Total Sales ($2.3M)

Total revenue generated.

Acts as the primary performance measure against profit.

- Average Discount (0.16 = 16%)

The average discount given on all products.

High discounts often reduce profit — we’ll confirm this in category/region trends.

- Total Orders (9,994)

Represents the total number of transactions.

High order volume doesn’t always mean high profit (e.g., discounts and category mix matter).


### Charts & Visuals
1. Profit and Sales (Map)

Sales are concentrated in the East and West regions of the US.

Larger circles = higher sales cities.


2. Sales by Region (Bar Chart)

West leads in total sales (~$0.73M), followed by East (~$0.68M).

Central ($0.50M) and South ($0.39M) underperform.

Suggests regional sales imbalance → opportunity to strengthen South & Central.


3. Sub-Category vs Region (Matrix)

Breaks down sales and profit by sub-category.


4. Sales by Category (Donut Chart)

Technology (36%) leads in sales share.

Furniture (32%) and Office Supplies (31%) are nearly equal.

Balanced category distribution → but volatility in Furniture needs attention.

5. Sales by Date (Line + Forecast)

Sales are seasonal with spikes in certain months (likely holiday/back-to-school).

Forecast suggests growth continuing into 2026, though with fluctuations.

### Overall Insights

- West & East regions are leaders in sales, but South/ Central need strategy improvements.

- Technology dominates, but Furniture is volatile → maybe due to shipping costs and returns.

- High discounting (16% avg) is cutting into profits, especially in certain sub-categories.

- Seasonality is clear → strong spikes during holidays & special events.

- Forecast predicts steady YoY growth → ~10% rise expected, so sustaining supply chain efficiency will be key.

## Recommendations

1. Regional Performance

- Central and West regions drive the majority of sales and profit.

- However, some states in the South region show negative profits — focus on reducing discounts or optimizing operations there.

2. Discount Strategy

- High discounts strongly correlate with reduced profits.

- Recommendation: Introduce a controlled discounting policy, offering promotions only on slow-moving or high-margin products.

3. Category Insights

- Office Supplies: Steady growth, consistent profit contributor → continue investment.

- Furniture: Volatile sales with frequent losses → review pricing, sourcing, and discounting strategies.

- Technology: High sales and margins → push premium product lines.

4. Shipping Mode Optimization

- Standard Class shipping is most popular but not always profitable.

- Recommendation: Encourage customers to shift to Second Class / First Class with bundled offers or loyalty points.

5. Customer Segment Focus

- Corporate and Consumer segments perform strongly.

- Recommendation: Develop B2B loyalty programs for Corporate buyers and targeted marketing for high-value Consumer customers.

6. Forecast & Seasonality

- Forecast predicts ~10% YoY growth with peaks during back-to-school (Aug-Sep) and holiday season (Nov-Dec).

- Recommendation: Plan inventory and logistics ahead of peak seasons to maximize profit and avoid stockouts.

## Conclusion

- This project demonstrates how raw retail transaction data can be transformed into actionable business intelligence using SQL for data preparation and Power BI for visualization. By integrating robust data modeling with interactive dashboards, we uncovered key insights into regional performance, category profitability, discount impact, and shipping efficiency.
  
- The analysis highlights that while East and West regions and the Technology category drive profitability, excessive discounting and volatility in Furniture sales remain challenges. Furthermore, insights into customer segments and seasonal sales patterns provide a foundation for targeted marketing, inventory planning, and pricing strategies.

- With an expected 10% year-over-year growth, businesses can leverage these findings to optimize discounts, refine logistics, strengthen underperforming regions, and capitalize on seasonal demand peaks.

- Ultimately, this solution showcases how data-driven decision-making empowers organizations to not only monitor current performance but also strategically plan for sustainable growth.

---

## License
This project is licensed under the MIT License.
