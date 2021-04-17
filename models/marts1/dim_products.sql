with staging1 as (

    select distinct
        product_id
        , supplier_id
        , product_name
        , category_name
        , quantity_per_unit
        , units_in_stock
        , units_on_order
        , reorder_level
        , is_discontinued
        , description  

    from {{ ref('stg_products') }} as prod
    left join {{ ref('stg_categories') }} as categ on prod.category_id = categ.category_id
)
,transformed as (
    select 
        row_number () over (order by product_id) as product_sk -- chave surrogate auto incremental
        ,*
    from staging1
)

select *
from transformed

