with sales_reason as (
  select
    salesreasonid,
    sales_reason_description
  from {{ ref('stg_SalesReason')}}
)

, salesorderheader_sales_reason as (
    select 
      salesreasonid,
      salesorderid
    from {{ ref('stg_Saleorderheader_Salesreason')}}
)

, join_salesreasons as (
    select 
      salesorderheader_sales_reason.salesorderid, 
      sales_reason_description
    from salesorderheader_sales_reason
    left join sales_reason
      on salesorderheader_sales_reason.salesreasonid = sales_reason.salesreasonid
)

select * from join_salesreasons