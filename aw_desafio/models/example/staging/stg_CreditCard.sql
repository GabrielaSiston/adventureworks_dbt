select 
    creditcardid,
    cardtype
from {{ source('aw_desafio', 'creditcard')}}