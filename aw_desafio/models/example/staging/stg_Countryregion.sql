select
    countryregioncode,
    countryregion.name as country_name
from {{ source('aw_desafio', 'countryregion')}}