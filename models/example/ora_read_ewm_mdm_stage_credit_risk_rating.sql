
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_mdm_stage_credit_risk_rating AS (
SELECT
        		CR_RSK_RTG_RK,
        	CR_RSK_RTG_ID,
        	DATE_FROM,
        	DATE_TO,
        	SRC_DL,
        	SRC_ID,
        	FCY_RK,
        	CST_RK,
        	JCO_RK,
        	INR_CR_RTG,
        	CR_RSK_RTG_DT,
        	SRC_TP,
        	INR_RTG_MDL,
        	CST_RTG_ST
    FROM
        {{ source('xg_ps_rdb_dm_mpscr_database.xg_rdb_dm_schema_mpscr', 'ewm_mdm_stage_crdt_risk_rating') }}
    WHERE
        DATA_DT=PARSE_TIMESTAMP
        AND SRC_DL='{{ var(' xg_pm_src_dl ')}}

)

SELECT * FROM ora_read_ewm_mdm_stage_credit_risk_rating

