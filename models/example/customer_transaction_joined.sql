{{ config(materialized='table') }}

with customer as (

SELECT * FROM {{ ref('customer_dbt_model') }}

),

transaction as (
SELECT * FROM {{ ref('transaction_dbt_model') }}
) ,

Joined as (
SELECT 
    c.cust_id,
    c.first_name,
    c.last_name,
    t.tran_id,
    t.date

    from customer c 
    join transaction t on c.cust_id = t.cust_id

)
select *
from Joined