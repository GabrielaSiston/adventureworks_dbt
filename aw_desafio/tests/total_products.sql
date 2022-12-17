/* Adventure Works (AW), a fast-growing bicycle industry has over 500 different products, 
so we have to test if data matchs the information. */ 

with total_products as (
	select distinct count (productid) as produtos
	from {{ ref('stg_Products')}}
)

select * from total_products where produtos <> 504 