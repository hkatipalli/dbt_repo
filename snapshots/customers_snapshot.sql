{% snapshot customer_snapshot %}
{{ config(target_schema='transform',unique_key =['customer_id','email'],strategy='timestamp',updated_at= 'updated_at') }}
select *,current_datetime() insert_datetime  from {{ ref ('customer_cleansed') }}

{% endsnapshot %}
