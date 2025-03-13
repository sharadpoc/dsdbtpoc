
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_jno_ar_x_ip_r AS (
SELECT
            		mov_JNO_AR_X_IP_R.IP_ID AS ip_id,
            	mov_JNO_AR_X_IP_R.CST_VORTEX_ID AS cst_vortex_id,
            	mov_JNO_AR_X_IP_R.GRID AS grid,
            	mov_JNO_AR_X_IP_R.SRC_DL AS src_dl
        FROM
            {{ ref('mov_jno_ar_x_ip_r') }} AS mov_JNO_AR_X_IP_R
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC,
            CST_VORTEX_ID ASC,
            GRID ASC 
)

SELECT * FROM mov_srt_jno_ar_x_ip_r

