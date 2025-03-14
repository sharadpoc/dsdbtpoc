
{{config(
  materialized='ephemeral'
)}}

WITH jno_ip_start_dt AS (
SELECT
            		MOV_JNO_IP_V.IP_ID AS MOV_JNO_IP_V_IP_ID,
            	MOV_JNO_IP_V.CST_RK AS MOV_JNO_IP_V_CST_RK,
            	MOV_JNO_IP_V.VLD_TO_TMS AS MOV_JNO_IP_V_VLD_TO_TMS,
            	MOV_JNO_IP_V.CST_VORTEX_ID AS MOV_JNO_IP_V_CST_VORTEX_ID,
            	MOV_JNO_IP_V.GRID AS MOV_JNO_IP_V_GRID,
            	MOV_JNO_IP_V.SRC_DL AS MOV_JNO_IP_V_SRC_DL,
            	MOV_JNO_IP_V.MSTR_SRC_STM_CD AS MOV_JNO_IP_V_MSTR_SRC_STM_CD,
            	MOV_JNO_IP_V.MSTR_SRC_STM_KEY AS MOV_JNO_IP_V_MSTR_SRC_STM_KEY,
            	MOV_JNO_IP_V.VLD_FROM_TMS AS MOV_JNO_IP_V_VLD_FROM_TMS,
            	MOV_RDU_EWM_IP_X_CL_LC_ST_R.IP_ID AS MOV_RDU_EWM_IP_X_CL_LC_ST_R_IP_ID,
            	MOV_RDU_EWM_IP_X_CL_LC_ST_R.EFF_DT AS MOV_RDU_EWM_IP_X_CL_LC_ST_R_EFF_DT,
            	MOV_RDU_EWM_IP_X_CL_LC_ST_R.SRC_DL AS MOV_RDU_EWM_IP_X_CL_LC_ST_R_SRC_DL
        FROM
            {{ ref('mov_jno_ip_v') }} AS MOV_JNO_IP_V
            LEFT OUTER JOIN {{ ref('mov_rdu_ewm_ip_x_cl_lc_st_r') }} AS MOV_RDU_EWM_IP_X_CL_LC_ST_R ON MOV_RDU_EWM_IP_X_CL_LC_ST_R.SRC_DL=MOV_JNO_IP_V.SRC_DL 
)

SELECT * FROM jno_ip_start_dt

