
{{config(
  materialized='ephemeral'
)}}

WITH mov_jno_ar_x_ip_r AS (
SELECT
            		mov_SRT_EWM_AR_X_IP_R_IP_ID AS ip_id,
            	mov_SRT_EWM_IP_ALT_IDENTN_VORTEX_CST_VORTEX_ID AS cst_vortex_id,
            	mov_SRT_EWM_IP_ALT_IDENTN_GRID_GRID AS grid,
            	mov_SRT_EWM_AR_X_IP_R_SRC_DL AS src_dl
        FROM
            {{ ref('jno_ar_x_ip_r') }} AS JNO_AR_X_IP_R 
)

SELECT * FROM mov_jno_ar_x_ip_r

