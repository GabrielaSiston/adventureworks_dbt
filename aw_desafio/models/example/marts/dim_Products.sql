with _order_details as (
	select distinct 
		productid,
		unitprice
	from {{ ref('stg_OrderDetail')}}
)

, products as (
	select *
	from {{ ref('stg_Products')}}
)

, final_product as (
	select 
		_order_details.productid,
		_order_details.unitprice,
		products.product_name,
		products.listprice,
		products.standardcost
	from _order_details
	left join products
		on _order_details.productid = products.productid
)

select * from final_product