with source_data as (

    select
        order_id
        , product_id
        , quantity
        , unit_price
        , discount
                         
        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
        
    from {{ source('northwind_etl','order_details') }}

)

select *
from source_data
