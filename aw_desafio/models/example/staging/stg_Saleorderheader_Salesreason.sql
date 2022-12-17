select
    salesreasonid,
    salesorderid
from {{ source('aw_desafio', 'salesorderheadersalesreason')}}