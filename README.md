# 🍕 Pizza Sales Analysis (SQL + Excel)

## Project Overview
This project analyzes pizza sales data to understand revenue performance, customer ordering behavior, and product-level trends. The objective is to identify key business drivers such as peak ordering times, top-performing categories, and best- and worst-selling products, and present the findings through structured SQL analysis and an interactive Excel dashboard.

The project follows a clear, reproducible workflow from raw data to final reporting.

---

## Dataset Description
- **Source**: CSV file (`pizza_sales.csv`)
- **Records**: ~48,000 transaction-level rows
- **Time Period**: One year of sales data
- **Granularity**: One row per pizza item within an order

### Key Columns
- Order details: `order_id`, `order_date`, `order_time`
- Product details: `pizza_name`, `pizza_category`, `pizza_size`
- Sales metrics: `quantity`, `unit_price`, `total_price`

> Note: The Excel version of the dataset includes some pre-derived fields (such as weekday) used for convenience in analysis. Core metrics remain consistent with SQL outputs.

---

## Tools & Technologies
- **PostgreSQL**
  - Data storage and SQL-based analysis
  - Aggregations, date/time functions, percentage calculations
- **Microsoft Excel**
  - Pivot tables for summarization
  - Interactive dashboard with KPIs, charts, and slicers
- **CSV**
  - Raw data source for reproducibility

---


## Data Lineage (End-to-End Flow)

```text
Raw CSV File
(pizza_sales.csv)
        |
        v
Data Review & Import
(PostgreSQL)
        |
        v
SQL Analysis Layer
- KPIs (Revenue, Orders, AOV)
- Time-based trends (weekday, hour)
- Category & size contribution
- Product-level performance
        |
        v
Aggregated Results
(Validated against raw data)
        |
        v
Excel Analysis Layer
- Pivot tables
- Calculated fields
- Filters / slicers
        |
        v
Final Excel Dashboard
- KPIs
- Trends
- Sales breakdowns
- Top & bottom products
```
![Pizza Sales Dashboard]()


All dashboard insights are traceable back to the original CSV data through SQL logic.

---

## SQL Analysis Summary
SQL was used to perform foundational sales analysis with a focus on clarity and correctness.

The analysis included:
- Calculation of key performance indicators:
  - Total revenue
  - Total orders
  - Average order value
  - Average pizzas per order
- Time-based analysis:
  - Orders by day of week
  - Orders by hour of day
- Revenue contribution analysis:
  - By pizza category
  - By pizza size
- Product-level analysis:
  - Top 5 best-selling pizzas
  - Bottom 5 lowest-selling pizzas (by quantity)

All SQL outputs were validated before being used in Excel.

---

## Excel Dashboard Overview

### KPIs
- Total Revenue  
- Total Orders  
- Average Order Value  
- Average Pizzas per Order  

### Visual Analysis
- Orders by **day of week**
- Orders by **hour of day**
- Revenue share by pizza category
- Revenue share by pizza size
- Top and bottom selling pizzas by quantity

Slicers allow interactive exploration while maintaining consistency with SQL results.

---

## Key Insights
- Revenue growth is primarily driven by **order volume**, as average order value remains moderate.
- Orders peak on **Thursdays and Fridays**, with strong demand during **lunch (12–1 PM)** and **early evening (5–6 PM)**.
- The **Classic** pizza category is the primary revenue driver and has the highest impact on total sales.
- **Large-sized pizzas** dominate sales, while XL and XXL sizes contribute minimally, indicating a preference for value-oriented options.
- The **Classic Deluxe Pizza** consistently outperforms other products, while several low-selling pizzas may require repositioning or removal.

---

It demonstrates foundational data analysis skills using SQL and Excel.
