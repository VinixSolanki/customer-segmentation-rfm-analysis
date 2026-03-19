-- Step 1: Append all months sales tables together

create or replace table `rfm-1111.sales.sales_2025` as

select * from `rfm-1111.sales.sales202501` union all
select * from `rfm-1111.sales.sales202502` union all
select * from `rfm-1111.sales.sales202503` union all
select * from `rfm-1111.sales.sales202504` union all
select * from `rfm-1111.sales.sales202505` union all
select * from `rfm-1111.sales.sales202506` union all
select * from `rfm-1111.sales.sales202507` union all
select * from `rfm-1111.sales.sales202508` union all
select * from `rfm-1111.sales.sales202509` union all
select * from `rfm-1111.sales.sales202510` union all
select * from `rfm-1111.sales.sales202511` union all
select * from `rfm-1111.sales.sales202512`;







-- step 2: calculate recency, frequency, monetary(Ranks)
-- combine with CTEs

create or replace view `rfm-1111.sales.rfm_metrics`
AS
with current_date as (
  select date('2026-03-18') as analysis_date

),

rfm as (
  select CustomerID, max(OrderDate) as last_order_date,
  date_diff((select analysis_date from current_date), max(OrderDate), DAY) as recency,
  count(*) as frequency,
  sum(OrderValue) as monetary
  from `rfm-1111.sales.sales_2025`
  group by CustomerID
  
)

select rfm.*, 
  row_number() over(order by recency asc) as r_rank,
  row_number() over(order by frequency desc) as f_rank,
  row_number() over(order by monetary asc) as m_rank

from rfm;



-- step 3; Assign deciles (10-best, 1-worst)
CREATE OR REPLACE VIEW `rfm-1111.sales.rfm_scores` AS

SELECT 
  *,
  NTILE(10) OVER (ORDER BY recency DESC) AS r_score,
  NTILE(10) OVER (ORDER BY frequency ASC) AS f_score,
  NTILE(10) OVER (ORDER BY monetary ASC) AS m_score

FROM `rfm-1111.sales.rfm_metrics`;


-- step 4: total score

create or replace view `rfm-1111.sales.rfm_total_scores`
as
select 
  CustomerID,
  recency,
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  (r_score + f_score + m_score) as rfm_total_score
from `rfm-1111.sales.rfm_scores`
order by rfm_total_score desc;


-- step 5: BI ready rfm segments table

create or replace table `rfm-1111.sales.rfm_segments_final`
as
select 
  CustomerID,
  recency,
  frequency,
  monetary,
  r_score,
  f_score,
  m_score,
  rfm_total_score,
  CASE 
    WHEN rfm_total_score >= 28 THEN 'Champions' -- 28-30
    WHEN rfm_total_score >= 24 THEN 'Loyal Customers'
    WHEN rfm_total_score >= 20 THEN 'Potential Loyalists'
    WHEN rfm_total_score >= 16 THEN 'Need Attention'
    WHEN rfm_total_score >= 12 THEN 'Hibernating'
    WHEN rfm_total_score >= 8  THEN 'About to Sleep'
    WHEN rfm_total_score >= 4  THEN 'At Risk'
    ELSE 'Lost'
  END AS customer_segment
from `rfm-1111.sales.rfm_total_scores`
order by rfm_total_score desc;







