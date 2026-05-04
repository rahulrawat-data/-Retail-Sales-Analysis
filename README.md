# Retail Sales Analysis

SQL project analyzing retail transaction data to uncover 
sales trends, customer behavior, and category performance.

## Business Problem
Retail businesses need to understand which products sell best, 
when peak sales occur, and who their highest-value customers are.
This analysis answers those questions directly from transaction data.

## Tools Used
- MySQL — exploratory analysis and business queries
- Dataset: Retail Sales Transaction Data

## Key Findings
- Identified the best-selling month per year using 
  SQL window functions (RANK OVER PARTITION BY)
- Evening shift generates the highest order volume 
  compared to Morning and Afternoon
- Top 5 customers identified by total lifetime sales value
- Clothing category: high-quantity purchases concentrated 
  in November
- Beauty category customers skew toward a specific 
  average age segment

## Analysis Performed
- Total sales and unique customer count
- Category-wise revenue and order volume
- Gender-based transaction breakdown
- Best performing month per year (window function)
- Time-of-day shift analysis (Morning / Afternoon / Evening)
- Top 5 customers by total spend

## How to Run
```bash
# Step 1: Load cleaned CSV into MySQL
# Step 2: Execute Data_Exploration_in_mysql.sql
```

## File
- `Data_Exploration_in_mysql.sql` — all analysis queries
