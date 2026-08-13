{{ config(materialized='table',schema='cleansed') }}
select 
customer_id,
upper(first_name) as first_name,
upper(last_name) as last_name,
email,
phone,
city,
state,
a.country,
created_at,
number_of_people
from {{ source('dbt_raw_layer','customer_ext') }} a
left join  {{ ref('customer_ephemeral') }} b
on a.country= b.country