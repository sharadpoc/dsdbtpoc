
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_stg_fcy_txn_m2 AS (
SELECT
            		REA_EWM_STG_TXN_FCY.OBJ_AR_ID AS OBJ_AR_ID,
            	REA_EWM_STG_TXN_FCY.FCY_RK AS FCY_RK,
            	REA_EWM_STG_TXN_FCY.DATA_DT AS DATA_DT,
            	REA_EWM_STG_TXN_FCY.SRC_DL AS SRC_DL
        FROM
            {{ ref('rea_ewm_stg_txn_fcy_m2') }} AS REA_EWM_STG_TXN_FCY
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM mov_srt_ewm_stg_fcy_txn_m2

