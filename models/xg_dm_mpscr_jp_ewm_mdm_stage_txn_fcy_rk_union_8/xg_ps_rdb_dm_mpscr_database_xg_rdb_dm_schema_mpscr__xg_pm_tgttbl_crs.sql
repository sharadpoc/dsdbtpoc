
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('DM_MPSCR', '{{var('xg_pm_tgttbl_crs')}}') }}
        SELECT
             *
        FROM
            {{ ref('wri_ar_mdm_stage_ar_fcy_creditsale') }} 
 "
)}}

SELECT 1 AS dummy_column

