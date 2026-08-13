{% snapshot customers_check_snapshot %}
{{ config( target_schema='transform', unique_key=['customer_id', 'email'], strategy='check', check_cols=['first_name', 'last_name'] )}}

Select *, current_datetime() as insert_datetime from {{ ref ('customer_cleansed') }}

{% endsnapshot %}