{{ config(materialized='table',schema='cleansed') }}
select *
from {{ source('dbt_raw_layer','product_ext') }}