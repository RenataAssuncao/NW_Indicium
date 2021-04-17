with staging1 as (

    select distinct
        employee_id
        , last_name
        , first_name
        , title
        , title_of_courtesy
        , hire_date
        , birth_date
        , reports_to
        , home_phone
        , address
        , city
        , region
        , country
        , postal_code
        , extension
        , photo_path
        , notes
       
    from {{ ref('stg_employees') }}

)
, transformed as (
    select 
        row_number () over (order by employee_id) as employee_sk -- chave surrogate auto incremental
        , *
    from staging1
)

select *
from transformed