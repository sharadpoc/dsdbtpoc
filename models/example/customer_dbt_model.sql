{{ config(materialized='table') }}

with source_data_customer as (

SELECT * FROM {{ source('ing_poc_demo', 'customer') }}

)

select *
from source_data_customer