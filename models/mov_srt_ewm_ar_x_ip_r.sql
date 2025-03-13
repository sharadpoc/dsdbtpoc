
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ar_x_ip_r AS (
SELECT
            		mov_FLT_EWM_AR_X_IP_R.IP_ID AS ip_id,
            	mov_FLT_EWM_AR_X_IP_R.SRC_DL AS src_dl
        FROM
            {{ ref('mov_flt_ewm_ar_x_ip_r') }} AS mov_FLT_EWM_AR_X_IP_R
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewm_ar_x_ip_r

