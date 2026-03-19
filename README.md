# 📊 Customer Segmentation using RFM Analysis (BigQuery + Power BI)

## 📌 Project Overview  
This project analyzes customer purchase behavior using **RFM (Recency, Frequency, Monetary) analysis** to segment customers and support business decision-making.

---

## 🎯 Objective  
- Identify high-value customers (Champions & Loyal Customers)  
- Detect at-risk and inactive customers  
- Enable targeted marketing and retention strategies  

---

## 🛠️ Tools & Technologies  
- Google BigQuery (SQL)  
- Power BI  
- SQL (CTEs, Window Functions, NTILE)  

---

## 📂 Dataset  
- Monthly sales data (Jan–Dec 2025)  
- Key fields:
  - CustomerID  
  - OrderDate  
  - OrderValue  
  - ProductType  

---

## 🔄 Project Workflow  

### 1. Data Preparation  
Combined 12 monthly sales tables into a single dataset using UNION ALL.

### 2. RFM Metrics Calculation  
- Recency → Days since last purchase  
- Frequency → Number of orders  
- Monetary → Total customer spending  

### 3. RFM Scoring  
Used NTILE(10) to assign scores (1–10). Higher score indicates better engagement.

### 4. Total RFM Score  
rfm_total_score = r_score + f_score + m_score

### 5. Customer Segmentation  

| Score Range | Segment |
|------------|--------|
| ≥ 28 | Champions |
| ≥ 24 | Loyal Customers |
| ≥ 20 | Potential Loyalists |
| ≥ 16 | Need Attention |
| ≥ 12 | Hibernating |
| ≥ 8  | About to Sleep |
| ≥ 4  | At Risk |
| < 4  | Lost |

---

## 📊 Dashboard  
The Power BI dashboard includes:
- Total customers  
- Customer segmentation distribution  
- Detailed RFM metrics  

*https://app.powerbi.com/view?r=eyJrIjoiZmYzZTIwYzItZTRkZC00Njg0LTkxYTEtYjEyNjk1YzBiNjBkIiwidCI6Ijk0OTAwMzkzLWI5ZmYtNDIzNS1iMDgzLTcwZmJjZTIzNzdkYSJ9*

---

## 🔍 Key Insights  
- Majority of customers fall into **Hibernating** and **At Risk** segments  
- **Champions segment is relatively small**, indicating growth opportunity  
- **About to Sleep customers** show early signs of churn  

---

## 💡 Business Recommendations  
- At Risk → Re-engagement campaigns and discounts  
- Potential Loyalists → Upselling and personalized offers  
- Champions → Loyalty programs and retention strategies  
- Hibernating → Reactivation campaigns  

---

## 🚀 Outcome  
- Built an end-to-end RFM pipeline using SQL  
- Created a BI-ready dataset for reporting  
- Developed a dashboard for business insights  

---

## 📌 Future Improvements  
- Add Customer Lifetime Value (CLV)  
- Perform cohort analysis  
- Automate pipeline with scheduled queries  

---

## 👤 Author  
Vinit Solanki  
Aspiring Data Analyst  


