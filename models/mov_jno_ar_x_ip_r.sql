
{{config(
  materialized='ephemeral'
)}}

WITH mov_jno_ar_x_ip_r AS (
SELECT
            		MOV_SRT_EWM_AR_X_IP_R_IP_ID AS IP_ID,
            	MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX_CST_VORTEX_ID AS CST_VORTEX_ID,
            	MOV_SRT_EWM_IP_ALT_IDENTN_GRID_GRID AS GRID,
            	MOV_SRT_EWM_AR_X_IP_R_SRC_DL AS SRC_DL
        FROM
            {{ ref('jno_ar_x_ip_r') }} AS JNO_AR_X_IP_R 
)

SELECT * FROM mov_jno_ar_x_ip_r

