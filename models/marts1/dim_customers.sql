with staging1 as (

    select distinct
        customer_id
        , company_name
        , contact_name
        , contact_title	
        , address
        , city
        , region
        , country	
        , postal_code
        , phone
        , fax

    from {{ ref('stg_customers') }}
)
, transformed as (
    select 
        row_number () over (order by customer_id) as customer_sk -- chave surrogate auto incremental
        , *
    from staging1
)

select *
from transformed
