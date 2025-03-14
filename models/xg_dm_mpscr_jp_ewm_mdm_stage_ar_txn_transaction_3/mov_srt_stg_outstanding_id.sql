
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_stg_outstanding_id AS (
SELECT
            		REA_EWM_MPS_TXN.SRC_DL AS SRC_DL,
            	REA_EWM_MPS_TXN.AR_ID AS AR_ID,
            	REA_EWM_MPS_TXN.VLD_FROM_TMS AS VLD_FROM_TMS,
            	REA_EWM_MPS_TXN.DATA_DT AS DATA_DT,
            	REA_EWM_MPS_TXN.SYS_INRT_TMS AS SYS_INRT_TMS
        FROM
            {{ ref('rea_ewm_mps_txn') }} AS REA_EWM_MPS_TXN
        ORDER BY
            AR_ID ASC,
            VLD_FROM_TMS ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_stg_outstanding_id

