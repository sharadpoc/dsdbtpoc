
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ar_x_ip_r AS (
SELECT
            		MOV_FLT_EWM_AR_X_IP_R.IP_ID AS IP_ID,
            	MOV_FLT_EWM_AR_X_IP_R.SRC_DL AS SRC_DL
        FROM
            {{ ref('mov_flt_ewm_ar_x_ip_r') }} AS MOV_FLT_EWM_AR_X_IP_R
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ewm_ar_x_ip_r

