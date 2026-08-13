{{ config(materialized='incremental',schema='transform') }}

select *,current_datetime() insert_datetime  from {{ ref ('customer_cleansed') }}
{% if is_incremental() %}
where created_at > 
(select max(created_at) from {{ this }})
{% endif %}

 