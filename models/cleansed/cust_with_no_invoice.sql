
{{ config(
    materialized='table',
    schema='cleansed'
) }}

SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name

FROM {{ source('dbt_raw_layer', 'customer_ext') }} c
JOIN {{ source('dbt_raw_layer', 'orders_ext') }} o
    ON c.customer_id = o.customer_id

--LEFT JOIN {{ source('dbt_raw_layer', 'invoice_ext') }} i
    --ON o.order_id = i.order_id
    --AND i.payment_status = 'Paid'

--WHERE i.invoice_id IS NULL


