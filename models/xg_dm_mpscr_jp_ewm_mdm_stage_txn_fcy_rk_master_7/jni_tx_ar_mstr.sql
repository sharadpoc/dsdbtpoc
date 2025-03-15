
{{config(
  materialized='ephemeral'
)}}

WITH jni_tx_ar_mstr AS (
SELECT
            		MOV_SRT_EWM_TXN_V_AR_ID.SRC_DL AS MOV_SRT_EWM_TXN_V_AR_ID_SRC_DL,
            	MOV_SRT_EWM_TXN_V_AR_ID.EV_ID AS MOV_SRT_EWM_TXN_V_AR_ID_EV_ID,
            	MOV_SRT_EWM_TXN_V_AR_ID.MSTR_SRC_STM_CD AS MOV_SRT_EWM_TXN_V_AR_ID_MSTR_SRC_STM_CD,
            	MOV_SRT_EWM_TXN_V_AR_ID.MSTR_SRC_STM_KEY AS MOV_SRT_EWM_TXN_V_AR_ID_MSTR_SRC_STM_KEY,
            	MOV_SRT_EWM_TXN_V_AR_ID.VLD_FROM_TMS AS MOV_SRT_EWM_TXN_V_AR_ID_VLD_FROM_TMS,
            	MOV_SRT_EWM_TXN_V_AR_ID.VLD_TO_TMS AS MOV_SRT_EWM_TXN_V_AR_ID_VLD_TO_TMS,
            	MOV_SRT_EWM_TXN_V_AR_ID.PRIM_AR_ID AS MOV_SRT_EWM_TXN_V_AR_ID_PRIM_AR_ID,
            	MOV_SRT_EWM_TXN_V_AR_ID.TXN_BOOK_DT AS MOV_SRT_EWM_TXN_V_AR_ID_TXN_BOOK_DT,
            	MOV_SRT_EWM_TXN_V_AR_ID.TXN_CCY_AMT AS MOV_SRT_EWM_TXN_V_AR_ID_TXN_CCY_AMT,
            	MOV_SRT_EWM_TXN_V_AR_ID.TXN_CCY_CL_CD AS MOV_SRT_EWM_TXN_V_AR_ID_TXN_CCY_CL_CD,
            	MOV_SRT_EWM_TXN_V_AR_ID.TXN_RSN_TP_CL_CD AS MOV_SRT_EWM_TXN_V_AR_ID_TXN_RSN_TP_CL_CD,
            	MOV_SRT_EWM_TXN_V_AR_ID.LDGR_CCY_AMT AS MOV_SRT_EWM_TXN_V_AR_ID_LDGR_CCY_AMT,
            	MOV_SRT_EWM_TXN_V_AR_ID.LDGR_CCY_CL_CD AS MOV_SRT_EWM_TXN_V_AR_ID_LDGR_CCY_CL_CD,
            	MOV_SRT_EWM_AR_MSTR_CR_AR_V.PRIM_AR_ID AS MOV_SRT_EWM_AR_MSTR_CR_AR_V_PRIM_AR_ID,
            	MOV_SRT_EWM_AR_MSTR_CR_AR_V.SRC_DL AS MOV_SRT_EWM_AR_MSTR_CR_AR_V_SRC_DL,
            	MOV_SRT_EWM_AR_MSTR_CR_AR_V.SUBJ_AR_ID AS MOV_SRT_EWM_AR_MSTR_CR_AR_V_SUBJ_AR_ID
        FROM
            {{ ref('mov_srt_ewm_txn_v_ar_id_m2') }} AS MOV_SRT_EWM_TXN_V_AR_ID
            INNER JOIN {{ ref('mov_srt_ewm_ar_mstr_cr_ar_v') }} AS MOV_SRT_EWM_AR_MSTR_CR_AR_V ON MOV_SRT_EWM_AR_MSTR_CR_AR_V.SRC_DL=MOV_SRT_EWM_TXN_V_AR_ID.SRC_DL
            AND MOV_SRT_EWM_AR_MSTR_CR_AR_V.PRIM_AR_ID=MOV_SRT_EWM_TXN_V_AR_ID.PRIM_AR_ID 
)

SELECT * FROM jni_tx_ar_mstr

