select 
	productid,
	product.name as product_name,
	product.listprice,
	product.standardcost
from {{ source('aw_desafio', 'product')}}