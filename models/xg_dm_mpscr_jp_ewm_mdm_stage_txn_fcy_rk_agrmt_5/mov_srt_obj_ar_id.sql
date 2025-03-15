
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_obj_ar_id AS (
SELECT
            		MOV_JNI_EV_TXN_AR_TXN.OBJ_AR_ID AS OBJ_AR_ID,
            	MOV_JNI_EV_TXN_AR_TXN.SRC_DL AS SRC_DL,
            	MOV_JNI_EV_TXN_AR_TXN.EV_ID AS EV_ID,
            	MOV_JNI_EV_TXN_AR_TXN.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_JNI_EV_TXN_AR_TXN.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_JNI_EV_TXN_AR_TXN.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_JNI_EV_TXN_AR_TXN.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_JNI_EV_TXN_AR_TXN.PRIM_AR_ID AS PRIM_AR_ID,
            	MOV_JNI_EV_TXN_AR_TXN.TXN_BOOK_DT AS TXN_BOOK_DT,
            	MOV_JNI_EV_TXN_AR_TXN.TXN_CCY_AMT AS TXN_CCY_AMT,
            	MOV_JNI_EV_TXN_AR_TXN.TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            	MOV_JNI_EV_TXN_AR_TXN.TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            	MOV_JNI_EV_TXN_AR_TXN.LDGR_CCY_AMT AS LDGR_CCY_AMT,
            	MOV_JNI_EV_TXN_AR_TXN.LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD
        FROM
            {{ ref('mov_jni_ev_txn_ar_txn') }} AS MOV_JNI_EV_TXN_AR_TXN
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM mov_srt_obj_ar_id

