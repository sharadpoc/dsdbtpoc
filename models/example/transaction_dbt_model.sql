
{{ config(materialized='table') }}

with source_data_transaction as (

SELECT * FROM {{ source('ing_poc_demo', 'transaction') }}

)

select *
from source_data_transaction
