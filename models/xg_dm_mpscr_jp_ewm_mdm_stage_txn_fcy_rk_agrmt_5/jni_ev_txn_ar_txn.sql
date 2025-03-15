
{{config(
  materialized='ephemeral'
)}}

WITH jni_ev_txn_ar_txn AS (
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
            	MOV_SRT_EWM_MDM_STAGE_AR_TXN AS MOV_SRT_EWM_MDM_STAGE_AR_TXN_,
            	MOV_SRT_EWM_MDM_STAGE_AR_TXN.SRC_DL AS MOV_SRT_EWM_MDM_STAGE_AR_TXN_SRC_DL,
            	MOV_SRT_EWM_MDM_STAGE_AR_TXN.OBJ_AR_ID AS MOV_SRT_EWM_MDM_STAGE_AR_TXN_OBJ_AR_ID,
            	MOV_SRT_EWM_MDM_STAGE_AR_TXN.PRIM_AR_ID AS MOV_SRT_EWM_MDM_STAGE_AR_TXN_PRIM_AR_ID,
            	MOV_SRT_EWM_MDM_STAGE_AR_TXN AS MOV_SRT_EWM_MDM_STAGE_AR_TXN_,
            	MOV_SRT_EWM_MDM_STAGE_AR_TXN.AR_ID AS MOV_SRT_EWM_MDM_STAGE_AR_TXN_AR_ID
        FROM
            {{ ref('mov_srt_ewm_txn_v_ar_id_m1') }} AS MOV_SRT_EWM_TXN_V_AR_ID
            INNER JOIN {{ ref('mov_srt_ewm_mdm_stage_ar_txn') }} AS MOV_SRT_EWM_MDM_STAGE_AR_TXN ON MOV_SRT_EWM_MDM_STAGE_AR_TXN.SRC_DL=MOV_SRT_EWM_TXN_V_AR_ID.SRC_DL
            AND MOV_SRT_EWM_MDM_STAGE_AR_TXN.PRIM_AR_ID=MOV_SRT_EWM_TXN_V_AR_ID.PRIM_AR_ID 
)

SELECT * FROM jni_ev_txn_ar_txn

