
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_obj_ar_id_m1 AS (
SELECT
            		MOV_JNI_MSTR_CR_AR.OBJ_AR_ID AS OBJ_AR_ID,
            	MOV_JNI_MSTR_CR_AR.SRC_DL AS SRC_DL,
            	MOV_JNI_MSTR_CR_AR.SUBJ_AR_ID AS SUBJ_AR_ID,
            	MOV_JNI_MSTR_CR_AR.EV_ID AS EV_ID,
            	MOV_JNI_MSTR_CR_AR.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_JNI_MSTR_CR_AR.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_JNI_MSTR_CR_AR.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_JNI_MSTR_CR_AR.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_JNI_MSTR_CR_AR.PRIM_AR_ID AS PRIM_AR_ID,
            	MOV_JNI_MSTR_CR_AR.TXN_BOOK_DT AS TXN_BOOK_DT,
            	MOV_JNI_MSTR_CR_AR.TXN_CCY_AMT AS TXN_CCY_AMT,
            	MOV_JNI_MSTR_CR_AR.TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            	MOV_JNI_MSTR_CR_AR.TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            	MOV_JNI_MSTR_CR_AR.LDGR_CCY_AMT AS LDGR_CCY_AMT,
            	MOV_JNI_MSTR_CR_AR.LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD
        FROM
            {{ ref('mov_jni_mstr_cr_ar') }} AS MOV_JNI_MSTR_CR_AR
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM mov_srt_obj_ar_id_m1

