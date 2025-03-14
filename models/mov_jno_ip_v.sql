
{{config(
  materialized='ephemeral'
)}}

WITH mov_jno_ip_v AS (
SELECT
            		MOV_SRT_EWM_IP_IP_ID AS IP_ID,
            	MOV_SRT_EWM_IP_CST_RK AS CST_RK,
            	MOV_SRT_EWM_IP_VLD_TO_TMS AS VLD_TO_TMS,
            	MOV_SRT_AR_X_IP_R_ROU_CST_VORTEX_ID AS CST_VORTEX_ID,
            	MOV_SRT_AR_X_IP_R_ROU_GRID AS GRID,
            	MOV_SRT_EWM_IP_SRC_DL AS SRC_DL,
            	MOV_SRT_EWM_IP_MSTR_SRC_STM_CD AS MSTR_SRC_STM_CD,
            	MOV_SRT_EWM_IP_MSTR_SRC_STM_KEY AS MSTR_SRC_STM_KEY,
            	MOV_SRT_EWM_IP_VLD_FROM_TMS AS VLD_FROM_TMS
        FROM
            {{ ref('jno_ip_v') }} AS JNO_IP_V 
)

SELECT * FROM mov_jno_ip_v

