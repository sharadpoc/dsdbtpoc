
{{config(
  materialized='ephemeral'
)}}

WITH mov_rdu_ar_x_ip_r AS (
SELECT
            		MOV_SRT_JNO_AR_X_IP_R.IP_ID AS IP_ID,
            	MOV_SRT_JNO_AR_X_IP_R.CST_VORTEX_ID AS CST_VORTEX_ID,
            	MOV_SRT_JNO_AR_X_IP_R.GRID AS GRID,
            	MOV_SRT_JNO_AR_X_IP_R.SRC_DL AS SRC_DL
        FROM
            {{ ref('mov_srt_jno_ar_x_ip_r') }} AS MOV_SRT_JNO_AR_X_IP_R 
)

SELECT * FROM mov_rdu_ar_x_ip_r

