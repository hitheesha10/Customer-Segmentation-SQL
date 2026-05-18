````markdown
# Customer Segmentation & E-Commerce Analytics Using SQL

## Project Overview

This project focuses on analyzing a real-world Brazilian E-Commerce dataset using SQL to generate customer insights, sales intelligence, and business analytics.

The project demonstrates how SQL can be used for:
- Customer segmentation
- Revenue analysis
- Customer behavior analysis
- Product analytics
- Retention analysis
- Business intelligence reporting

The dataset contains real transactional e-commerce data from Olist Store, including customer orders, products, payments, reviews, and seller information.

---

# Dataset Information

Dataset Source:

:contentReference[oaicite:0]{index=0}

---

# Technologies Used

- PostgreSQL
- SQL
- pgAdmin 4
- Git
- GitHub
- Visual Studio Code

---

# Project Objectives

The main objectives of this project are:

- Analyze customer purchasing behavior
- Perform customer segmentation
- Identify high-value customers
- Analyze payment and order trends
- Study customer satisfaction using review data
- Generate business KPIs using SQL
- Practice advanced relational database querying

---

# Database Tables Used

| Table Name | Purpose |
|---|---|
| customers | Customer information |
| orders | Order details |
| order_items | Purchased products |
| products | Product information |
| payments | Payment transactions |
| reviews | Customer reviews |
| sellers | Seller information |
| category_translation | Product category translations |

---

# Relational Database Structure

```text
customers
   ↓
orders
   ↓
order_items
   ↓
products
   ↓
category_translation

orders
   ↓
payments

orders
   ↓
reviews

order_items
   ↓
sellers
````

---

# SQL Concepts Used

## Basic SQL

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* Aggregate Functions

## Advanced SQL

* INNER JOIN
* LEFT JOIN
* CASE WHEN
* Subqueries
* Common Table Expressions (CTEs)
* Window Functions
* Ranking Functions
* NTILE()
* ROW_NUMBER()
* DENSE_RANK()
* LAG()

---

# Key Analyses Planned

## Customer Segmentation

Segment customers based on:

* purchase frequency
* spending behavior
* recency of purchases

---

## RFM Analysis

Analyze:

* Recency
* Frequency
* Monetary Value

to identify:

* loyal customers
* high-value customers
* at-risk customers

---

## Revenue Analysis

Analyze:

* total revenue
* revenue trends
* top-performing customers
* product category revenue

---

## Customer Satisfaction Analysis

Use review scores to:

* evaluate customer satisfaction
* identify poor-performing products
* analyze seller performance

---

## Geographic Analysis

Analyze customers and sellers by:

* state
* city
* regional sales trends

---

## Customer Retention Analysis

Identify:

* repeat customers
* inactive customers
* retention patterns

---

# Day 1 Progress

Completed:

* Dataset download
* PostgreSQL database setup
* Table creation
* CSV data import
* Relational database understanding
* Basic exploration queries
* GitHub project setup

---

# Basic Exploration Queries

## Total Customers

```sql
SELECT COUNT(*)
FROM customers;
```

---

## Total Orders

```sql
SELECT COUNT(*)
FROM orders;
```

---

## Total Revenue

```sql
SELECT
    ROUND(SUM(payment_value),2)
AS total_revenue
FROM payments;
```

---

## Top States by Customers

```sql
SELECT
    customer_state,
    COUNT(*) AS total_customers

FROM customers

GROUP BY customer_state

ORDER BY total_customers DESC
LIMIT 10;
```

---

## Order Status Distribution

```sql
SELECT
    order_status,
    COUNT(*) AS total_orders

FROM orders

GROUP BY order_status

ORDER BY total_orders DESC;
```

---

# Skills Demonstrated

* Relational Database Management
* SQL Querying
* Data Import & Validation
* Data Analytics
* Customer Analytics
* Business Intelligence
* Multi-table Querying
* Data Modeling
* E-Commerce Analytics

---

# Project Structure

```text
Customer-Segmentation-SQL/
│
├── dataset/
│
├── queries/
│   ├── 01_basic_exploration.sql
│   ├── 02_customer_analysis.sql
│   └── 03_order_analysis.sql
│
├── screenshots/
│
└── README.md
```

---

# Future Improvements

This project will be enhanced further with:

* Advanced customer segmentation
* RFM scoring
* Cohort analysis
* Retention analysis
* Query optimization
* SQL views
* Indexing
* Dashboard integration using Power BI

---

# Current Project Status

## Current Level: 7.5/10

Current progress demonstrates:

* relational SQL understanding
* multi-table analytics
* business-oriented querying
* production-style e-commerce dataset handling

The project will evolve into a full-scale customer intelligence and analytics system using advanced SQL techniques.

---

# Conclusion

This project demonstrates how SQL can be used to analyze real-world e-commerce customer data and generate actionable business insights. Through relational database analysis, customer segmentation, and advanced analytical querying, the project aims to simulate real business intelligence and data analytics workflows used in modern e-commerce platforms.

```
```
