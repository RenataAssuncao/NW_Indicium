with source_data as (

    select
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
        , region
        , country
        , city
        , postal_code
        , extension
        , photo_path
        , notes

        /* Stitch extration */
        , _sdc_extracted_at as last_elt_extract
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
        

    from {{ source('northwind_etl','employees') }}

)

select *
from source_data