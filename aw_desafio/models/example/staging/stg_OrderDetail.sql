select 
    salesorderid,
    productid,
    orderqty,
    unitprice
from {{ source('aw_desafio', 'salesorderdetail')}}