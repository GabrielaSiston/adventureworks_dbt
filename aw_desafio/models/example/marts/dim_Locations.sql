with provinces as (
    select *
    from {{ ref('stg_Stateprovince')}}
)

, cities as (
    select *
    from {{ ref('stg_City')}}
)

, countries as (
    select * 
    from {{ ref('stg_Countryregion')}}
)

, join_locations as (
    select 
        provinces.territoryid,
        cities.city as city_name,
        provinces.state_name,
        countries.country_name
    from cities
    left join provinces on provinces.stateprovinceid = cities.stateprovinceid
    left join countries on provinces.countryregioncode = countries.countryregioncode
)

select * from join_locations
