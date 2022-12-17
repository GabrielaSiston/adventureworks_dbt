select
    salesorderid,
    customerid,
    billtoaddressid,
    shipmethodid,
    shiptoaddressid,
    territoryid,
    salespersonid,
    creditcardid,
    orderdate,
    salesorderheader.status as status_de_venda
    from {{ source('aw_desafio', 'salesorderheader')}}
