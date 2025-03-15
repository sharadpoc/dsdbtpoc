
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('DM_MPSCR', '{{var('xg_pm_tgttbl_update')}}') }}
        SELECT
             *
        FROM
            {{ ref('wri_xfm_mdm_fcy_updt') }} 
 "
)}}

SELECT 1 AS dummy_column

