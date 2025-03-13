
{{config(
  materialized='ephemeral'
)}}

WITH mov_rdu_ar_x_ip_r AS (
SELECT
            		mov_SRT_JNO_AR_X_IP_R.IP_ID AS ip_id,
            	mov_SRT_JNO_AR_X_IP_R.CST_VORTEX_ID AS cst_vortex_id,
            	mov_SRT_JNO_AR_X_IP_R.GRID AS grid,
            	mov_SRT_JNO_AR_X_IP_R.SRC_DL AS src_dl
        FROM
            {{ ref('mov_srt_jno_ar_x_ip_r') }} AS mov_SRT_JNO_AR_X_IP_R 
)

SELECT * FROM mov_rdu_ar_x_ip_r

