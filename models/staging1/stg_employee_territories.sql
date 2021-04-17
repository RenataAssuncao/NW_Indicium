with source_data as (

    select
        employee_id
        , territory_id
             
        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
        

    from {{ source('northwind_etl','employee_territories') }}

)

select *
from source_data