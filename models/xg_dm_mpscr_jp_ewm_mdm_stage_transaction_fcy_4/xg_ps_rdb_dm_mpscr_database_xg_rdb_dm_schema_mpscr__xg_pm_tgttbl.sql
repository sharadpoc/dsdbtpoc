
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('DM_MPSCR', '{{var('xg_pm_tgttbl')}}') }}
        SELECT
             *
        FROM
            {{ ref('wri_ar_mdm_stage_ar_fcy') }} 
 "
)}}

SELECT 1 AS dummy_column

