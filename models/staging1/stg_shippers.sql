with source_data as (

    select
        shipper_id
        , company_name
        , phone

        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
     
    from {{ source('northwind_etl','shippers') }}

)

select *
from source_data
