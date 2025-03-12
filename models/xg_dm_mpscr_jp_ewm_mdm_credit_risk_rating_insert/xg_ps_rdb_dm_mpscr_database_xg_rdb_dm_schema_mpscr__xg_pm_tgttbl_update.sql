
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            {{ source('xg_ps_rdb_dm_mpscr_database.xg_rdb_dm_schema_mpscr', var('xg_pm_tgttbl_update')) }}
        SELECT
             *
        FROM
            {{ ref('wri_xfm_mdm_crd_rsk_rating_updt') }} 
 "
)}}

SELECT 1 AS dummy_column

