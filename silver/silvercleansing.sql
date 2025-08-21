--Check For Nulls or Duplicates in Primary Key
--Expectation: No Result
Select prd_id,
Count(*)
From [silver].[crm_sales_details]
Group by prd_id
Having Count(*) > 1 or prd_id IS NULL

--check for unwanted spaces
--Expectation: No Results
Select prd_nm
From silver.crm_sales_details
Where prd_nm <> TRIM(prd_nm)

--Check for NULLs or Negative Numbers
--Expectation: No Results
SELECT prd_cost
FROM silver.crm_sales_details
WHERE prd_cost < 0 OR prd_cost IS NULL

--Data Standardization & Consistency
Select Distinct prd_line
From [silver].crm_sales_details

--Check for invalid Date orders
--This code checks to see if the end date is
--less than the start date.
--ex:  the end date in this example was
--12-28-2007.  the start date was 7-1-2011
--this is incorrect. the fix for this is 
--in the main query.
Select * 
From silver.crm_sales_details
Where prd_end_dt < prd_start_dt

--Check the overall table
--to make sure the date is correct
Select * 
From silver.crm_sales_details
