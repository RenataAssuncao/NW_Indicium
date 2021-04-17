with source_data as (

    select
        region_id
        , region_description
                                 
        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
        
    from {{ source('northwind_etl','region') }}

)

select *
from source_data
