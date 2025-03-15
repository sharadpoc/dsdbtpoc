
{{config(
  materialized='ephemeral'
)}}

WITH mov_jni_mstr_txn_agr_ar AS (
SELECT
            		MOV_SRT_EWM_AR_X_AR_R_OBJ_AR_ID AS OBJ_AR_ID,
            	MOV_SRT_EWM_AR_X_AR_R_SRC_DL AS SRC_DL,
            	MOV_SRT_EWM_AR_X_AR_R_SUBJ_AR_ID AS SUBJ_AR_ID,
            	MOV_SRT_OBJ_AR_ID_EV_ID AS EV_ID,
            	MOV_SRT_OBJ_AR_ID_MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_SRT_OBJ_AR_ID_MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_SRT_OBJ_AR_ID_VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_SRT_OBJ_AR_ID_VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_SRT_OBJ_AR_ID_PRIM_AR_ID AS PRIM_AR_ID,
            	MOV_SRT_OBJ_AR_ID_TXN_BOOK_DT AS TXN_BOOK_DT,
            	MOV_SRT_OBJ_AR_ID_TXN_CCY_AMT AS TXN_CCY_AMT,
            	MOV_SRT_OBJ_AR_ID_TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            	MOV_SRT_OBJ_AR_ID_TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            	MOV_SRT_OBJ_AR_ID_LDGR_CCY_AMT AS LDGR_CCY_AMT,
            	MOV_SRT_OBJ_AR_ID_LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD
        FROM
            {{ ref('jni_mstr_txn_agr_ar') }} AS JNI_MSTR_TXN_AGR_AR 
)

SELECT * FROM mov_jni_mstr_txn_agr_ar

