select 
  salesreasonid,
  salesreason.name as sales_reason_description
from {{ source('aw_desafio', 'salesreason')}} 