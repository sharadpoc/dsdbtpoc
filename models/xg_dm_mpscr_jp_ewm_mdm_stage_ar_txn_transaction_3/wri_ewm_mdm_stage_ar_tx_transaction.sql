
{{config(
  materialized='ephemeral'
)}}

WITH wri_ewm_mdm_stage_ar_tx_transaction AS (
SELECT
            		MOV_SRT_STG_OUTSTANDING_ID.DATA_DT AS DATA_DT,
            	MOV_SRT_STG_OUTSTANDING_ID.AR_ID AS AR_ID,
            	MOV_SRT_STG_OUTSTANDING_ID.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_SRT_STG_OUTSTANDING_ID.SRC_DL AS SRC_DL,
            	MOV_SRT_STG_OUTSTANDING_ID.SYS_INRT_TMS AS SYS_INRT_TMS
        FROM
            {{ ref('mov_srt_stg_outstanding_id') }} AS MOV_SRT_STG_OUTSTANDING_ID 
)

SELECT * FROM wri_ewm_mdm_stage_ar_tx_transaction

