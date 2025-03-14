
{{config(
  materialized='ephemeral'
)}}

WITH wri_ewm_mdm_stage_txn_transaction AS (
SELECT
            		PARSE_TIMESTAMP(
                    "%Y%m%d",
                    "{{var('xg_pm_selection_date')}}"
                ) AS DATA_DT,
            	REA_EWM_MPS_TXN.AR_ID AS AR_ID,
            	REA_EWM_MPS_TXN.VLD_FROM_TMS AS VLD_FROM_TMS,
            	REA_EWM_MPS_TXN.SRC_DL AS SRC_DL,
            	TIMESTAMP('{{ run_started_at }}') AS SYS_INRT_TMS
        FROM
            {{ ref('rea_ewm_mps_txn_m1') }} AS REA_EWM_MPS_TXN 
)

SELECT * FROM wri_ewm_mdm_stage_txn_transaction

