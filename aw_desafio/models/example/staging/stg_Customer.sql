select
    customerid,
    personid,
    storeid,
    territoryid
from {{ source('aw_desafio', 'customer')}}