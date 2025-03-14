
{{ config(
 materialized='table',
 post_hook="
 INSERT INTO
            xg_ps_rdb_dm_mpscr_database_xg_rdb_dm_schema_mpscr_{{var('xg_pm_tgttbl_update__ttbl_')}}
        SELECT
             *
        FROM
            {{ ref('wri_xfm_mdm_fcy_updt') }} 
 "
)}}

SELECT 1 AS dummy_column

