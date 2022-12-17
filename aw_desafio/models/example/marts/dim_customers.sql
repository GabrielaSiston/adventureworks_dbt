with customers as (
    select 
        customerid,
        personid 
    from {{ ref('stg_Customer')}}
)

, person as (
    select
        businessentityid,
        concat (ifnull(firstname, ' '), ' ', ifnull(middlename, ' '), ' ', ifnull(lastname, ' ')) as fullname
    from {{ ref('stg_Person')}}
)

, final_costumers as (
    select
        customers.customerid,
        case 
            when person.fullname is null then 'Not indicate'
            else person.fullname
        end as fullname
    from person
    left join customers
        on person.businessentityid= customers.customerid
)

select * from final_costumers

