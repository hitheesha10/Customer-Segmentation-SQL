
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


# Conclusion

This project demonstrates how SQL can be used to analyze real-world e-commerce customer data and generate actionable business insights. Through relational database analysis, customer segmentation, and advanced analytical querying, the project aims to simulate real business intelligence and data analytics workflows used in modern e-commerce platforms.

```
```
# Day 2 — Customer Behavior & Revenue Analytics

## Overview

On Day 2, the project was enhanced with advanced relational SQL analysis focused on:
- Customer behavior analysis
- Revenue analytics
- Repeat customer analysis
- Product category analysis
- Payment analytics
- Customer satisfaction analysis

The goal of Day 2 was to use multi-table relational SQL queries to generate business intelligence insights from real-world e-commerce data.

---

# SQL Concepts Implemented

## 1. INNER JOIN Operations

Advanced INNER JOIN operations were used to combine customer, order, payment, product, and review data across multiple tables.

### Example Query

```sql
SELECT
    c.customer_unique_id,
    o.order_id,
    o.order_status,
    o.order_purchase_timestamp

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id;
```

### Purpose
- Combine related datasets
- Analyze customer purchase behavior
- Build relational analytics

### Business Use Case
Used in:
- CRM systems
- customer journey analytics
- transaction tracking
- business intelligence systems

---

# 2. Customer Order Analysis

Customer ordering behavior was analyzed using aggregation queries.

### Query

```sql id="csd2_1"
SELECT
    c.customer_unique_id,

    COUNT(o.order_id) AS total_orders

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id

ORDER BY total_orders DESC
LIMIT 10;
```

### Insight Generated
- Identified customers with highest purchase frequency
- Analyzed customer ordering patterns

---

# 3. Revenue Analysis

Revenue trends and platform earnings were analyzed using payment data.

### Total Revenue Query

```sql id="csd2_2"
SELECT
    ROUND(SUM(payment_value),2)
AS total_revenue

FROM payments;
```

---

## Monthly Revenue Trend

```sql id="csd2_3"
SELECT
    EXTRACT(YEAR FROM order_purchase_timestamp) AS year,

    EXTRACT(MONTH FROM order_purchase_timestamp) AS month,

    ROUND(SUM(p.payment_value),2) AS revenue

FROM orders o

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY year, month

ORDER BY year, month;
```

### Purpose
- Analyze sales growth
- Track seasonal trends
- Measure monthly business performance

### Business Insight
Monthly analysis revealed fluctuations in platform revenue across different periods.

---

# 4. Top Customer Analysis

High-value customers were identified based on total spending.

### Query

```sql id="csd2_4"
SELECT
    c.customer_unique_id,

    ROUND(SUM(p.payment_value),2)
    AS total_spent

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id

ORDER BY total_spent DESC
LIMIT 10;
```

### Purpose
- Identify valuable customers
- Analyze customer contribution to revenue
- Support customer segmentation

### Business Use Case
Used in:
- loyalty programs
- targeted marketing
- customer retention strategies

---

# 5. Repeat Customer Analysis

Repeat purchasing behavior was analyzed using HAVING clauses and aggregation.

### Query

```sql id="csd2_5"
SELECT
    c.customer_unique_id,

    COUNT(o.order_id) AS total_orders

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id

HAVING COUNT(o.order_id) > 1

ORDER BY total_orders DESC;
```

### Purpose
- Identify returning customers
- Analyze customer retention
- Study customer loyalty behavior

### Business Insight
Repeat customers contributed significantly to platform engagement and sales activity.

---

# 6. Product Category Analysis

Top-performing product categories were identified using relational joins.

### Query

```sql id="csd2_6"
SELECT
    ct.product_category_name_english,

    COUNT(oi.order_id) AS total_orders

FROM order_items oi

INNER JOIN products p
ON oi.product_id = p.product_id

INNER JOIN category_translation ct
ON p.product_category_name =
ct.product_category_name

GROUP BY ct.product_category_name_english

ORDER BY total_orders DESC
LIMIT 10;
```

### Purpose
- Analyze product demand
- Identify top-selling categories
- Understand customer purchase preferences

### Business Insight
Certain product categories dominated customer purchasing behavior across the platform.

---

# 7. Payment Analysis

Customer payment preferences and transaction behavior were analyzed.

### Query

```sql id="csd2_7"
SELECT
    payment_type,

    COUNT(*) AS total_transactions,

    ROUND(SUM(payment_value),2)
    AS total_payment

FROM payments

GROUP BY payment_type

ORDER BY total_payment DESC;
```

### Purpose
- Analyze payment methods
- Study customer transaction behavior
- Identify preferred payment systems

### Business Use Case
Used in:
- fintech analytics
- payment optimization
- transaction intelligence

---

# 8. Customer Satisfaction Analysis

Customer reviews were analyzed using review score analytics.

### Review Distribution Query

```sql id="csd2_8"
SELECT
    review_score,

    COUNT(*) AS total_reviews

FROM reviews

GROUP BY review_score

ORDER BY review_score DESC;
```

---

## Average Review Score

```sql id="csd2_9"
SELECT
    ROUND(AVG(review_score),2)
AS average_review_score

FROM reviews;
```

### Purpose
- Measure customer satisfaction
- Evaluate service quality
- Analyze review trends

### Business Insight
Review score analysis provided insights into overall customer satisfaction levels.

---

# Business Insights Generated

- High-value customers contributed significantly to overall platform revenue.
- Repeat customers demonstrated strong engagement patterns.
- Monthly revenue trends revealed seasonal sales fluctuations.
- Certain product categories dominated customer demand.
- Payment analysis identified commonly used transaction methods.
- Review analysis highlighted overall customer satisfaction trends.

---

# Skills Demonstrated on Day 2

- Multi-table Relational SQL
- INNER JOIN Operations
- Revenue Analytics
- Customer Behavior Analysis
- Product Analytics
- Payment Analytics
- Review Analytics
- Business Intelligence Querying
- E-Commerce Analytics
- KPI Analysis
- Aggregation Queries
- HAVING Clause Usage

---

# Files Added on Day 2

```text
queries/
│
├── 04_customer_behavior.sql
├── 05_revenue_analysis.sql
├── 06_repeat_customers.sql
├── 07_product_analysis.sql
├── 08_payment_analysis.sql
└── 09_review_analysis.sql
```

---

# Project Progress After Day 2

## Current Project Level: 8.5/10

### Improvements Added
- Advanced relational SQL
- Multi-table analytics
- Revenue intelligence
- Customer analytics
- Product analytics
- Payment analytics
- Customer satisfaction analysis

The project now demonstrates real-world e-commerce analytics and business intelligence querying techniques commonly used in analytics-focused roles.