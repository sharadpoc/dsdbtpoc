
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ev_txn_exn_v AS (
SELECT
            		REA_EWM_EV_TXN_EXN_V.EV_ID AS EV_ID,
            	REA_EWM_EV_TXN_EXN_V.SRC_DL AS SRC_DL,
            	REA_EWM_EV_TXN_EXN_V.TXN_EXN_EV_ID AS TXN_EXN_EV_ID,
            	REA_EWM_EV_TXN_EXN_V.SNDR_TO_RCVR_INF AS SNDR_TO_RCVR_INF,
            	REA_EWM_EV_TXN_EXN_V.INT_TXN_CCY_AMT AS INT_TXN_CCY_AMT,
            	REA_EWM_EV_TXN_EXN_V.PNP_TXN_CCY_AMT AS PNP_TXN_CCY_AMT
        FROM
            {{ ref('rea_ewm_ev_txn_exn_v') }} AS REA_EWM_EV_TXN_EXN_V
        ORDER BY
            EV_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewm_ev_txn_exn_v

