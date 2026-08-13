{{ config(
    materialized = 'table',
    schema = 'cleansed',

    pre_hook = "
        insert into {{ source('reference','audit_log') }}
        (model_name, start_time, end_time, status)
        values ('{{ this.name }}', current_timestamp(), null, 'running')
    ",

    post_hook = "
        update {{ source('reference','audit_log') }} a
        set 
            status = 'success',
            end_time = current_timestamp()
        from (
            select 
                max(start_time) as start_time,
                model_name
            from {{ source('reference','audit_log') }}
            where model_name = '{{ this.name }}'
            group by model_name
        ) b
        where a.model_name = b.model_name
          and a.start_time = b.start_time
    "
) }}

select *
from {{ ref('orders_cleansed') }}