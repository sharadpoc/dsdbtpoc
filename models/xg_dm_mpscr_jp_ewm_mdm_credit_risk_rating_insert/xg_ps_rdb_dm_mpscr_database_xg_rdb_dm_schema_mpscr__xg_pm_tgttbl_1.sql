
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('xg_ps_rdb_dm_mpscr_database.xg_rdb_dm_schema_mpscr', var('xg_pm_tgttbl')) }}
        SELECT
             *
        FROM
            {{ ref('wri_xfm_mdm_credit_risk_rating_ins') }} 
 "
)}}

SELECT 1 AS dummy_column

