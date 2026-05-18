
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

### Improvements Added
- Advanced relational SQL
- Multi-table analytics
- Revenue intelligence
- Customer analytics
- Product analytics
- Payment analytics
- Customer satisfaction analysis

The project now demonstrates real-world e-commerce analytics and business intelligence querying techniques commonly used in analytics-focused roles.

# Day 3 — Advanced Customer Segmentation & RFM Analytics

## Overview

On Day 3, the project was upgraded with advanced customer intelligence and marketing analytics techniques using SQL.

The focus of this phase was:
- RFM Analysis
- Customer Segmentation
- Customer Lifetime Value (CLV)
- Percentile Analysis
- SQL Views
- Advanced Window Functions

These techniques are commonly used in:
- E-commerce analytics
- CRM systems
- Marketing analytics
- Customer retention analysis
- Business intelligence platforms

---

# 1. RFM Analysis

## What is RFM?

RFM stands for:

| Metric | Meaning |
|---|---|
| Recency | How recently a customer purchased |
| Frequency | How often the customer purchases |
| Monetary | How much the customer spends |

RFM analysis is widely used to identify:
- loyal customers
- inactive customers
- high-value customers
- churn-risk customers

---

## Base RFM Query

```sql
SELECT
    c.customer_unique_id,

    MAX(o.order_purchase_timestamp)
    AS last_purchase_date,

    COUNT(o.order_id)
    AS frequency,

    ROUND(SUM(p.payment_value),2)
    AS monetary

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id;
```

---

## Recency Analysis

```sql
SELECT
    c.customer_unique_id,

    CURRENT_DATE -
    MAX(DATE(o.order_purchase_timestamp))
    AS recency_days

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

GROUP BY c.customer_unique_id;
```

### Purpose
- Identify active customers
- Detect inactive customers
- Measure customer engagement

### Business Insight
Customers with lower recency values are more actively engaged with the platform.

---

# 2. Advanced RFM Scoring

Window Functions and NTILE() were used to score customers based on:
- recency
- frequency
- monetary value

---

## RFM Scoring Query

```sql
WITH rfm_base AS (

    SELECT
        c.customer_unique_id,

        CURRENT_DATE -
        MAX(DATE(o.order_purchase_timestamp))
        AS recency,

        COUNT(o.order_id)
        AS frequency,

        ROUND(SUM(p.payment_value),2)
        AS monetary

    FROM customers c

    INNER JOIN orders o
    ON c.customer_id = o.customer_id

    INNER JOIN payments p
    ON o.order_id = p.order_id

    GROUP BY c.customer_unique_id
)

SELECT
    customer_unique_id,

    recency,
    frequency,
    monetary,

    NTILE(5)
    OVER(ORDER BY recency ASC)
    AS recency_score,

    NTILE(5)
    OVER(ORDER BY frequency DESC)
    AS frequency_score,

    NTILE(5)
    OVER(ORDER BY monetary DESC)
    AS monetary_score

FROM rfm_base;
```

---

## SQL Concepts Used

- Common Table Expressions (CTEs)
- Window Functions
- NTILE()
- Aggregation
- Multi-table JOINs

---

# 3. Customer Segmentation

Customers were segmented into different groups using CASE WHEN conditions.

---

## Customer Segmentation Query

```sql
WITH rfm_scores AS (

    SELECT
        c.customer_unique_id,

        NTILE(5)
        OVER(
            ORDER BY
            COUNT(o.order_id) DESC
        ) AS frequency_score,

        NTILE(5)
        OVER(
            ORDER BY
            SUM(p.payment_value) DESC
        ) AS monetary_score

    FROM customers c

    INNER JOIN orders o
    ON c.customer_id = o.customer_id

    INNER JOIN payments p
    ON o.order_id = p.order_id

    GROUP BY c.customer_unique_id
)

SELECT
    customer_unique_id,

    frequency_score,
    monetary_score,

    CASE

        WHEN frequency_score >= 4
        AND monetary_score >= 4
        THEN 'Champions'

        WHEN frequency_score >= 3
        AND monetary_score >= 3
        THEN 'Loyal Customers'

        WHEN frequency_score <= 2
        AND monetary_score <= 2
        THEN 'At Risk'

        ELSE 'Potential Loyalists'

    END AS customer_segment

FROM rfm_scores;
```

---

# Customer Segments Created

| Segment | Meaning |
|---|---|
| Champions | High-value active customers |
| Loyal Customers | Frequent customers |
| Potential Loyalists | Growing customers |
| At Risk | Low-engagement customers |

---

## Business Use Cases

Used in:
- customer retention
- personalized marketing
- loyalty programs
- churn prediction
- customer targeting

---

# 4. Customer Lifetime Value (CLV)

Customer Lifetime Value analysis was performed to identify the most valuable customers.

---

## CLV Query

```sql
SELECT
    c.customer_unique_id,

    ROUND(
        SUM(p.payment_value),
        2
    ) AS customer_lifetime_value

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id

ORDER BY customer_lifetime_value DESC
LIMIT 10;
```

---

## Purpose

- Identify high-revenue customers
- Measure customer profitability
- Support strategic marketing decisions

---

# 5. Percentile Analysis

Statistical customer ranking was performed using PERCENT_RANK().

---

## Percentile Query

```sql
SELECT
    customer_unique_id,

    total_spent,

    PERCENT_RANK()
    OVER(
        ORDER BY total_spent
    ) AS percentile_rank

FROM (

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

) ranked_customers;
```

---

## Purpose

- Rank customers statistically
- Identify top spending percentiles
- Perform customer distribution analysis

### Business Use Case
Used in:
- targeted advertising
- premium customer identification
- business segmentation

---

# 6. SQL Views

Views were created to simplify repeated analytical queries.

---

## Create View Query

```sql
CREATE VIEW customer_rfm_view AS

SELECT
    c.customer_unique_id,

    COUNT(o.order_id)
    AS total_orders,

    ROUND(SUM(p.payment_value),2)
    AS total_spent

FROM customers c

INNER JOIN orders o
ON c.customer_id = o.customer_id

INNER JOIN payments p
ON o.order_id = p.order_id

GROUP BY c.customer_unique_id;
```

---

## Using the View

```sql
SELECT *
FROM customer_rfm_view
LIMIT 20;
```

---

# Purpose of Views

- Simplify analytics
- Improve query readability
- Support dashboard integration
- Reuse analytical queries efficiently

---

# Advanced SQL Concepts Demonstrated

- Common Table Expressions (CTEs)
- Window Functions
- NTILE()
- PERCENT_RANK()
- CASE WHEN
- SQL Views
- Aggregation
- Multi-table JOINs
- Statistical Segmentation

---

# Business Insights Generated

- Identified high-value customers using RFM analysis.
- Segmented customers into actionable marketing groups.
- Measured customer profitability using CLV analysis.
- Performed percentile-based customer ranking.
- Created reusable SQL views for analytical reporting.

---

# Skills Demonstrated on Day 3

- Advanced SQL Analytics
- Customer Segmentation
- Marketing Analytics
- Business Intelligence
- Customer Intelligence
- Window Functions
- Statistical Analysis
- CRM Analytics
- E-Commerce Analytics
- Data Modeling
- Analytical Query Engineering

---

# Files Added on Day 3

```text
queries/
│
├── 10_rfm_analysis.sql
├── 11_customer_segmentation.sql
├── 12_customer_lifetime_value.sql
├── 13_percentile_analysis.sql
└── 14_views.sql
```

---

# Project Progress After Day 3

## Current Project Level: 10/10+

### Major Improvements Added
- RFM customer modeling
- Customer segmentation system
- Statistical customer ranking
- CLV analytics
- Window function implementation
- Advanced analytical SQL engineering

The project now demonstrates production-level customer analytics and business intelligence workflows commonly used in real-world e-commerce analytics systems.

---

# Conclusion

This phase transformed the project from a standard SQL analytics project into an advanced customer intelligence and segmentation system. By implementing RFM modeling, customer segmentation, statistical ranking, and CLV analysis, the project demonstrates how SQL can be used for large-scale business intelligence and customer analytics in modern e-commerce platforms.