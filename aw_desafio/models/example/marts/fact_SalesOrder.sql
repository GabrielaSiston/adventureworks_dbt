with stg_orderdetail as (
    select 
        salesorderid,
        productid,
        orderqty,
        unitprice
    from {{ ref('stg_OrderDetail')}}
)

, stg_orderheader as (
    select
        salesorderid,
        customerid,
        territoryid,
        orderdate,
        creditcardid,
        status_de_venda
    from {{ ref('stg_SalesOrderHeader')}}
)

/*adding credit card here and not in a single dimension because data studio
 it has a limit of 5 joins and it is impossible to join six tables/dimension 
 if I make a dimension only for credit card with the credit card id and credit card type.*/
, creditcards as (
    select 
        creditcardid,
        cardtype
    from {{ ref('stg_CreditCard')}}
)

, final_cte as (
    select 
        stg_orderdetail.salesorderid,
        stg_orderdetail.productid,
        stg_orderdetail.orderqty,
        stg_orderdetail.unitprice,
        stg_orderheader.customerid,
        stg_orderheader.territoryid,
        stg_orderheader.orderdate,
        case 
            when creditcards.cardtype is null then 'Not indicate'
            else creditcards.cardtype
        end as cardtype,
        case 
            when stg_orderheader.status_de_venda = 1 then 'In process'
            when stg_orderheader.status_de_venda = 2 then 'Approved'
            when stg_orderheader.status_de_venda = 3 then 'Backordered'
            when stg_orderheader.status_de_venda = 4 then 'Rejected'
            when stg_orderheader.status_de_venda = 5 then 'Shipped'
            when stg_orderheader.status_de_venda = 6 then 'Cancelled'
        end as status_de_venda
    from stg_orderheader
    left join stg_orderdetail
        on stg_orderheader.salesorderid = stg_orderdetail.salesorderid
    left join creditcards
        on stg_orderheader.creditcardid = creditcards.creditcardid
)

select * from final_cte

