{{ config(materialized='incremental',schema='transform', incremental_strategy= 'merge',unique_key = 'customer_id') }}

select *,current_datetime() insert_datetime  from {{ ref ('customer_cleansed') }}
{% if is_incremental() %}
where updated_at > 
(select max(updated_at) from {{ this }})
{% endif %}

 