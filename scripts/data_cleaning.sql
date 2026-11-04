-- DATA CLEANING
SELECT *
FROM   bronze.crm_cust_info;

SELECT *
FROM   bronze.crm_prd_info;

-- Find duplicates cst_id
SELECT   cst_id,
         count(*)
FROM     bronze.crm_cust_info
GROUP BY cst_id
HAVING   count(*) > 1;

---------------------------------------
---------------------------------------
-- Check for unwanted spaces 
SELECT cst_lastname
FROM   bronze.crm_cust_info
WHERE  LEN(cst_lastname) != LEN(trim(cst_lastname));

-- Data Consistency
SELECT DISTINCT cst_gndr
FROM   bronze.crm_cust_info;

SELECT   prd_id,
         count(*)
FROM     bronze.crm_prd_info
GROUP BY prd_id
HAVING   count(*) > 1
         OR prd_id IS NULL;

SELECT *
FROM   silver.crm_prd_info
WHERE  prd_end_dt < prd_start_dt;

SELECT prd_cost
FROM   silver.crm_prd_info
WHERE  prd_cost < 0
       OR prd_cost IS NULL;

SELECT NULLIF (sls_order_dt, 0) AS sls_order_dt
FROM   bronze.crm_sales_details
WHERE  sls_order_dt <= 0
       OR len(sls_order_dt) != 8
       OR sls_order_dt > 20500101
       OR sls_order_dt < 19000101;

select * from gold.fact_sales
