{{ config(materialized='table') }}

with schema_check as (

SELECT * FROM {{ source('DM_MPSCR', 'EWM_AR_AU_BAL_M') }}

)

select *
from schema_check