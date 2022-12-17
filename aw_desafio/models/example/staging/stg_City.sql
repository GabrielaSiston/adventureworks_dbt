select
    stateprovinceid,
    addressid, 
    city
from {{ source('aw_desafio', 'address')}}