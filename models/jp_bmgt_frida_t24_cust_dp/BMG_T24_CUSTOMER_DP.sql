{{ config(
    materialized='table'
) }}

SELECT *
FROM {{ ref("lnk_ifl_cust") }}
