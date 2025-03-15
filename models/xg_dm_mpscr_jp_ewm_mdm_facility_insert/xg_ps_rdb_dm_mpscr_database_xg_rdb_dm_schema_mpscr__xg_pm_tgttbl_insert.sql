
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('DM_MPSCR', var('xg_pm_tgttbl_insert')) }}
        SELECT
             *
        FROM
            {{ ref('wri_xfm_mdm_fcy_inrt') }} 
 "
)}}

SELECT 1 AS dummy_column

