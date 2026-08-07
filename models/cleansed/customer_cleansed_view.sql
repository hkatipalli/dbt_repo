{{ config(materialized='view',schema='cleansed') }}

select * from  {{ ref('customer_cleansed') }}