
{{config(
  materialized='ephemeral'
)}}

WITH mov_jno_ip_strt_dt AS (
SELECT
            		MOV_JNO_IP_V_IP_ID AS IP_ID,
            	MOV_JNO_IP_V_CST_RK AS CST_RK,
            	MOV_JNO_IP_V_VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_JNO_IP_V_CST_VORTEX_ID AS CST_VORTEX_ID,
            	MOV_JNO_IP_V_GRID AS GRID,
            	MOV_RDU_EWM_IP_X_CL_LC_ST_R_EFF_DT AS EFF_DT,
            	MOV_JNO_IP_V_SRC_DL AS SRC_DL,
            	MOV_JNO_IP_V_MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_JNO_IP_V_MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_JNO_IP_V_VLD_FROM_TMS AS VLD_FROM_TMS
        FROM
            {{ ref('jno_ip_start_dt') }} AS JNO_IP_START_DT 
)

SELECT * FROM mov_jno_ip_strt_dt

