
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('DM_MPSCR', var('xg_pm_tgttbl')) }}
        SELECT
             *
        FROM
            {{ ref('wri_xfm_mdm_credit_risk_rating_ins') }} 
 "
)}}

SELECT 1 AS dummy_column

