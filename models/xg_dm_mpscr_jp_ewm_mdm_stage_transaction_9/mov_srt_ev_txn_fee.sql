
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ev_txn_fee AS (
SELECT
            		REA_EWM_EV_TXN_FEE_CMPT_M.TXN_FEE_CMPT_EV_ID AS TXN_FEE_CMPT_EV_ID,
            	REA_EWM_EV_TXN_FEE_CMPT_M.SRC_DL AS SRC_DL,
            	REA_EWM_EV_TXN_FEE_CMPT_M.EV_ID AS EV_ID,
            	REA_EWM_EV_TXN_FEE_CMPT_M.TXN_FEE_TXN_CCY_AMT AS TXN_FEE_TXN_CCY_AMT,
            	REA_EWM_EV_TXN_FEE_CMPT_M.TXN_FEE_CCY_CL_CD AS TXN_FEE_CCY_CL_CD
        FROM
            {{ ref('rea_ewm_ev_txn_fee_cmpt_m') }} AS REA_EWM_EV_TXN_FEE_CMPT_M
        ORDER BY
            EV_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ev_txn_fee

