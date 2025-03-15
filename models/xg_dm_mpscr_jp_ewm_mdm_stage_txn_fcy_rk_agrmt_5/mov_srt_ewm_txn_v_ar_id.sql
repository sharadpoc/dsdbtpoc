
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_txn_v_ar_id AS (
SELECT
            		REA_EWM_EV_TXN_V.SRC_DL AS SRC_DL,
            	REA_EWM_EV_TXN_V.EV_ID AS EV_ID,
            	REA_EWM_EV_TXN_V.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	REA_EWM_EV_TXN_V.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	REA_EWM_EV_TXN_V.VLD_FROM_TMS AS VLD_FROM_TMS,
            	REA_EWM_EV_TXN_V.VLD_TO_TMS AS VLD_TO_TMS,
            	REA_EWM_EV_TXN_V.PRIM_AR_ID AS PRIM_AR_ID,
            	REA_EWM_EV_TXN_V.TXN_BOOK_DT AS TXN_BOOK_DT,
            	REA_EWM_EV_TXN_V.TXN_CCY_AMT AS TXN_CCY_AMT,
            	REA_EWM_EV_TXN_V.TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            	REA_EWM_EV_TXN_V.TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            	REA_EWM_EV_TXN_V.LDGR_CCY_AMT AS LDGR_CCY_AMT,
            	REA_EWM_EV_TXN_V.LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD
        FROM
            {{ ref('rea_ewm_ev_txn_v') }} AS REA_EWM_EV_TXN_V
        ORDER BY
            SRC_DL ASC,
            PRIM_AR_ID ASC 
)

SELECT * FROM mov_srt_ewm_txn_v_ar_id

