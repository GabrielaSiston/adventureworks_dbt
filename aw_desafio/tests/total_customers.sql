/* Adventure Works (AW), a fast-growing bicycle industry has over 20,000 customers, 
so we have to test if data matchs the information. */ 

with total_costumers as (
select count (customerid) as costumers
from {{ ref('stg_Customer')}}
)

select * from total_costumers where costumers <> 19820