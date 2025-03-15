
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('DM_MPSCR', '{{var('xg_pm_tgttbl')}}') }}
        SELECT
             *
        FROM
            {{ ref('wri_fcy_ar_tp') }} 
 "
)}}

SELECT 1 AS dummy_column

