# 🚀 End-to-End Customer Segmentation Data Pipeline (RFM Analysis)

## 📌 Overview

This project demonstrates an end-to-end data pipeline for customer segmentation using RFM (Recency, Frequency, Monetary) analysis. The pipeline processes raw transactional data, transforms it using SQL in Google BigQuery, and delivers business insights through an interactive Power BI dashboard.

---

## 🧱 Architecture

```
Raw CSV Data 
→ Google BigQuery (Data Warehouse) 
→ SQL Transformations (ETL + RFM Logic) 
→ Power BI Dashboard
```

---

## ⚙️ ETL Process

### 🔹 Extract

* Imported raw transactional CSV data into Google BigQuery

### 🔹 Transform

* Cleaned and validated data (handled nulls, filtered invalid records)
* Created derived metrics:

  * Recency (days since last purchase)
  * Frequency (number of transactions)
  * Monetary (total spend)
* Applied SQL aggregations, joins, and CTEs to structure data

### 🔹 Load

* Stored transformed data in structured tables for reporting and analysis
* Connected processed data to Power BI

---

## 🧠 Data Modeling

* Designed structured datasets to support efficient querying
* Created customer-level aggregated tables for segmentation
* Optimized queries for performance using filtering and grouping techniques

---

## 📊 Dashboard Features (Power BI)

* Customer Segmentation (High / Medium / Low Value)
* RFM Distribution Analysis
* Revenue Contribution by Segment
* Customer Behavior Insights
* Interactive filters (Date, Segment, Customer)
* Link: https://app.powerbi.com/view?r=eyJrIjoiZmYzZTIwYzItZTRkZC00Njg0LTkxYTEtYjEyNjk1YzBiNjBkIiwidCI6Ijk0OTAwMzkzLWI5ZmYtNDIzNS1iMDgzLTcwZmJjZTIzNzdkYSJ9
---

## 💻 Tech Stack

* **Google BigQuery** → Data warehouse
* **SQL** → Data transformation & analysis (ETL logic)
* **Power BI** → Data visualization & dashboard
* **GitHub** → Version control & project documentation

---

## 🔍 Key Insights

* Identified high-value customers contributing the majority of revenue
* Detected low-frequency customers with churn risk
* Enabled targeted marketing strategies based on segmentation

---

## 🎯 Business Impact

* Improved understanding of customer behavior
* Enabled data-driven decision-making
* Provided actionable insights for retention and revenue growth

---

## 📂 Project Structure

```
├── SQL/
│   ├── etl_rfm.sql
│   ├── rfm_queries.sql
│
├── PowerBI/
│   ├── dashboard.pbix
│
├── README.md
```

---

## 💬 Project Summary

Built an end-to-end data pipeline using Google BigQuery where raw data was transformed using SQL into structured RFM metrics. The processed data was then visualized in Power BI to generate actionable business insights on customer segmentation and revenue optimization.

---
