
{{ config(
 materialized='table',enabled = false,
 post_hook="
 INSERT INTO
            {{ source('DM_MPSCR', var('xg_pm_tgttbl')) }}
        SELECT
             *
        FROM
            {{ ref('mov_cust') }} 
 "
)}}

SELECT 1 AS dummy_column

