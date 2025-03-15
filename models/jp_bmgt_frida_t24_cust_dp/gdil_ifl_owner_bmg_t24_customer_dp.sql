
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('DM_MPSCR', 'BMG_T24_CUSTOMER_DP') }}
        SELECT
             *
        FROM
            {{ ref('lnk_ifl_cust') }} 
 "
)}}

SELECT 1 AS dummy_column

