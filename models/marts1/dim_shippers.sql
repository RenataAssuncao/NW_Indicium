with staging1 as (

    select distinct
        shipper_id
        , company_name
        , ship_name
        , ship_address
        , ship_city
        , ship_region
        , ship_country
        , ship_postal_code
        , phone

    from {{ ref('stg_shippers')  }} as shippers
    left join {{ ref('stg_orders') }} as orders on shippers.shipper_id = orders.ship_via

)
, transformed as (
    select 
        row_number () over (order by shipper_id) as shipper_sk -- chave surrogate auto incremental
        ,*
    from staging1
)

select *
from transformed