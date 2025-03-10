
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_ip AS (
SELECT
            		mov_EWM_IP.IP_ID AS ip_id,
            	mov_EWM_IP.CST_RK AS cst_rk,
            	mov_EWM_IP.SRC_DL AS src_dl
        FROM
            {{ ref('mov_ewm_ip') }} AS mov_EWM_IP 
)

SELECT * FROM mov_srt_ewm_ip

