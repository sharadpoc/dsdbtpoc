
{{config(
  materialized='ephemeral'
)}}

WITH wri_ewm_mdm_stage_ar_transaction AS (
SELECT
            		PARSE_TIMESTAMP(
                    "%Y%m%d",
                    "{{var('xg_pm_selection_date')}}"
                ) AS DATA_DT,
            	REA_EWM_MPS_AR.AR_ID AS AR_ID,
            	REA_EWM_MPS_AR.VLD_FROM_TMS AS VLD_FROM_TMS,
            	REA_EWM_MPS_AR.SRC_DL AS SRC_DL,
            	TIMESTAMP('{{ run_started_at }}') AS SYS_INRT_TMS
        FROM
            {{ ref('rea_ewm_mps_ar') }} AS REA_EWM_MPS_AR 
)

SELECT * FROM wri_ewm_mdm_stage_ar_transaction

