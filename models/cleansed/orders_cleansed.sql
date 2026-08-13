{{ config(materialized='table',schema='cleansed') }}
select *
from {{ source('dbt_raw_layer','orders_ext') }}