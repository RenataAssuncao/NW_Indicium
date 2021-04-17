with source_data as (

    select 
        product_id
        , category_id
        , supplier_id
        , product_name
        , units_on_order
        , units_in_stock
        , quantity_per_unit
        , unit_price
        , reorder_level
        , 
            case
                when discontinued = 1 then True
                else False
            end as is_discontinued
            
        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
       

    from {{ source('northwind_etl','products') }}

)

select *
from source_data


