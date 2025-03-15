
{{config(
  materialized='ephemeral'
)}}

WITH mov_jni_txn_fcy_rk_agmnt AS (
SELECT
            		MOV_SRT_SUBJ_AR_ID_OBJ_AR_ID AS OBJ_AR_ID,
            	MOV_SRT_SUBJ_AR_ID_SRC_DL AS SRC_DL,
            	MOV_SRT_SUBJ_AR_ID_SUBJ_AR_ID AS SUBJ_AR_ID,
            	MOV_SRT_EWM_STG_FCY_TXN_FCY_RK AS FCY_RK,
            	MOV_SRT_EWM_STG_FCY_TXN_DATA_DT AS DATA_DT,
            	MOV_SRT_SUBJ_AR_ID_EV_ID AS EV_ID,
            	MOV_SRT_SUBJ_AR_ID_MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_SRT_SUBJ_AR_ID_MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_SRT_SUBJ_AR_ID_VLD_FROM_TMS AS VLD_FROM_TMS,
            	MOV_SRT_SUBJ_AR_ID_VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_SRT_SUBJ_AR_ID_PRIM_AR_ID AS PRIM_AR_ID,
            	MOV_SRT_SUBJ_AR_ID_TXN_BOOK_DT AS TXN_BOOK_DT,
            	MOV_SRT_SUBJ_AR_ID_TXN_CCY_AMT AS TXN_CCY_AMT,
            	MOV_SRT_SUBJ_AR_ID_TXN_CCY_CL_CD AS TXN_CCY_CL_CD,
            	MOV_SRT_SUBJ_AR_ID_TXN_RSN_TP_CL_CD AS TXN_RSN_TP_CL_CD,
            	MOV_SRT_SUBJ_AR_ID_LDGR_CCY_AMT AS LDGR_CCY_AMT,
            	MOV_SRT_SUBJ_AR_ID_LDGR_CCY_CL_CD AS LDGR_CCY_CL_CD
        FROM
            {{ ref('jni_txn_fcy_rk_agmnt') }} AS JNI_TXN_FCY_RK_AGMNT 
)

SELECT * FROM mov_jni_txn_fcy_rk_agmnt

