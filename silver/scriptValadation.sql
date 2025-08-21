--Check Data Consistency: Between Sales, Quantity, and Price
-->> Sales = Quanity * Price
-->> Values must not be NULL, zero, or negative.

Select 
	sls_sales as old_sls_sales,
	sls_quantity,
	sls_price ols_sls_price,
	Case When sls_sales IS Null or sls_sales <=0 or sls_sales <> sls_quantity * ABS(sls_price)
		Then sls_quantity * abs(sls_price)
	   Else sls_sales
	End as sls_sales,
	Case When sls_price is null or sls_price <= 0
	     Then sls_sales / coalesce(sls_quantity,0)
	   Else sls_price
	End as sls_price
From bronze.crm_sales_details
Where sls_sales <> sls_quantity * sls_price
OR sls_sales is null or sls_quantity is null or sls_price is null
--OR sls_sales <= 0 OR sls_quantity <= 0 OR sls_price <= 0


	
