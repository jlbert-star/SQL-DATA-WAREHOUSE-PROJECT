INSERT INTO silver.crm_sales_details (
	sls_ord_num,  
    sls_prd_key,
    sls_cust_id,
    sls_order_dt,
    sls_ship_dt,
	sls_due_dt,
    sls_sales,
    sls_quantity,
    sls_price  
)

Select 
	sls_ord_num,
	sls_prd_key,
	sls_cust_id,
	case when sls_order_dt = 0 OR len(sls_order_dt) <> 8 Then NULL
		 Else cast(cast(sls_order_dt as VARCHAR) AS Date)
	end as sls_order_dt,

	case when sls_ship_dt = 0 OR len(sls_ship_dt) <> 8 Then NULL
		 Else cast(cast(sls_ship_dt as VARCHAR) AS Date)
	end as sls_ship_dt,

	case when sls_due_dt = 0 OR len(sls_due_dt) <> 8 Then NULL
		 Else cast(cast(sls_due_dt as VARCHAR) AS Date)
	end as sls_due_dt,

	Case When sls_sales IS Null or sls_sales <=0 or sls_sales <> sls_quantity * ABS(sls_price)
		Then sls_quantity * abs(sls_price)
	   Else sls_sales
	End as sls_sales,

	Case When sls_price is null or sls_price <= 0
	     Then sls_sales / coalesce(sls_quantity,0)
	   Else sls_price
	End as sls_price,
	sls_quantity
From [bronze].[crm_sales_details]







