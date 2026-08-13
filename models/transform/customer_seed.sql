{{ config(materialized='table', schema='transform') }}

select customer_id,
    UPPER(first_name) first_name,
    UPPER(last_name) last_name,
    email,
    phone,
    city,
    state,
    created_at,
    country,
    b.country_code,
    b.country_region
   from {{ source( 'dbt_raw_layer', 'customer_ext') }} as a

LEFT JOIN {{ ref('country_code') }} as b
ON a.country = b.country_name