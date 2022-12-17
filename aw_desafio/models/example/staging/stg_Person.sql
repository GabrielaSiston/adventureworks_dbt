select
    businessentityid,
    firstname,
    middlename,
    lastname
from {{ source('aw_desafio', 'person')}}