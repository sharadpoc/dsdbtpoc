
{{config(
  materialized='ephemeral'
)}}

WITH mov_xfm_fcy_ar_src AS (
SELECT
            		MOV_JNI_MSTR_CR_FCY_RK.SRC_DL AS SRC_DL,
            	MOV_JNI_MSTR_CR_FCY_RK.FCY_RK AS FCY_RK,
            	NULL AS SYS_INRT_TMS,
            	MOV_JNI_MSTR_CR_FCY_RK.DATA_DT AS DATA_DT,
            	MOV_JNI_MSTR_CR_FCY_RK.EV_ID AS EV_ID,
            	MOV_JNI_MSTR_CR_FCY_RK.MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_JNI_MSTR_CR_FCY_RK.MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_JNI_MSTR_CR_FCY_RK.VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_JNI_MSTR_CR_FCY_RK.VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_JNI_MSTR_CR_FCY_RK.PRIM_AR_ID AS PRIM_AR_ID,
            	MOV_JNI_MSTR_CR_FCY_RK.TXN_BOOK_DT AS TXN_BOOK_DT,
            	MOV_JNI_MSTR_CR_FCY_RK.TXN_CCY_AMT AS TXN_CCY_AMT,
            	MOV_JNI_MSTR_CR_FCY_RK.TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            	MOV_JNI_MSTR_CR_FCY_RK.TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            	MOV_JNI_MSTR_CR_FCY_RK.LDGR_CCY_AMT AS LDGR_CCY_AMT,
            	MOV_JNI_MSTR_CR_FCY_RK.LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD
        FROM
            {{ ref('mov_jni_mstr_cr_fcy_rk') }} AS MOV_JNI_MSTR_CR_FCY_RK 
)

SELECT * FROM mov_xfm_fcy_ar_src

