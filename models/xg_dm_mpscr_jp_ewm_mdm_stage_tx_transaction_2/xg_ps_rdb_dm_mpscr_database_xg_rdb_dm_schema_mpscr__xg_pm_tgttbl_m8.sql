
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('DM_MPSCR', var('xg_pm_tgttbl')) }}
        SELECT
             *
        FROM
            {{ ref('wri_ewm_mdm_stage_txn_transaction') }} 
 "
)}}

SELECT 1 AS dummy_column

