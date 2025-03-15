
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_subj_ar_id_m1 AS (
SELECT
            		MOV_JNI_TX_AR_MSTR.SUBJ_AR_ID AS SUBJ_AR_ID,
            	MOV_JNI_TX_AR_MSTR.SRC_DL AS SRC_DL,
            	MOV_JNI_TX_AR_MSTR.EV_ID AS EV_ID,
            	MOV_JNI_TX_AR_MSTR.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_JNI_TX_AR_MSTR.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_JNI_TX_AR_MSTR.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_JNI_TX_AR_MSTR.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_JNI_TX_AR_MSTR.PRIM_AR_ID AS PRIM_AR_ID,
            	MOV_JNI_TX_AR_MSTR.TXN_BOOK_DT AS TXN_BOOK_DT,
            	MOV_JNI_TX_AR_MSTR.TXN_CCY_AMT AS TXN_CCY_AMT,
            	MOV_JNI_TX_AR_MSTR.TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            	MOV_JNI_TX_AR_MSTR.TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            	MOV_JNI_TX_AR_MSTR.LDGR_CCY_AMT AS LDGR_CCY_AMT,
            	MOV_JNI_TX_AR_MSTR.LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD
        FROM
            {{ ref('mov_jni_tx_ar_mstr') }} AS MOV_JNI_TX_AR_MSTR
        ORDER BY
            SRC_DL ASC,
            SUBJ_AR_ID ASC 
)

SELECT * FROM mov_srt_subj_ar_id_m1

