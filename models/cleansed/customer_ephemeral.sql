{{ config(materialized='ephemeral') }}
select 
country,
count(*) number_of_people
from {{ source('dbt_raw_layer','customer_ext') }}
group by country