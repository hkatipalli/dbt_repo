{{ config(materialized='table',schema='cleansed') }}
select 
customer_id,
upper(first_name) as first_name,
upper(last_name) as last_name,
email,
phone,
city,
state,
country,
created_at
from {{ source('dbt_raw_layer','customer_ext') }}