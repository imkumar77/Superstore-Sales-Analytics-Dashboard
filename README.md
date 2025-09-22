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
