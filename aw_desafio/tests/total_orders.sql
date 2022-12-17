/* Adventure Works (AW), a fast-growing bicycle industry has over 31.000 orders, 
so we have to test if data matchs the information. */ 
with total_orders as (
select distinct count (salesorderid) as orders
from {{ ref('stg_SalesOrderHeader')}}
)

select * from total_orders where orders <> 31465