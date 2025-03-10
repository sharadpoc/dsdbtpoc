
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_ip_org_v AS (
SELECT
        	SRC_DL,
        	IP_ID,
        	CONCAT(CONCAT(MSTR_SRC_STM_CD, '|'), MSTR_SRC_STM_KEY) AS cst_rk
    FROM
        {{ source('xg_ps_rdb_dm_mpscr_database.xg_rdb_dm_schema_mpscr', 'ewm_ip_org_v') }}
    WHERE
        VLD_FROM_TMS <= PARSE_TIMESTAMP
        AND PARSE_TIMESTAMP < VLD_TO_TMS
        AND SRC_DL='{{ var(' xg_pm_src_dl ')}}

)

SELECT * FROM ora_read_ewm_ip_org_v

