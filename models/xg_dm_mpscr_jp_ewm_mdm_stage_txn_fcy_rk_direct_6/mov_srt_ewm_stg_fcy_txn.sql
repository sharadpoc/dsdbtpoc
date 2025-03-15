
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_stg_fcy_txn AS (
SELECT
            		REA_EWM_STG_TXN_FCY.PRIM_AR_ID AS PRIM_AR_ID,
            	REA_EWM_STG_TXN_FCY.FCY_RK AS FCY_RK,
            	REA_EWM_STG_TXN_FCY.DATA_DT AS DATA_DT,
            	REA_EWM_STG_TXN_FCY.SRC_DL AS SRC_DL
        FROM
            {{ ref('rea_ewm_stg_txn_fcy') }} AS REA_EWM_STG_TXN_FCY
        ORDER BY
            SRC_DL ASC,
            PRIM_AR_ID ASC 
)

SELECT * FROM mov_srt_ewm_stg_fcy_txn

