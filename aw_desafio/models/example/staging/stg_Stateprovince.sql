select
    stateprovinceid,
    territoryid,
    stateprovince.name as state_name,
    countryregioncode
from {{ source('aw_desafio', 'stateprovince')}}