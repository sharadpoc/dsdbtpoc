
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ar_x_ip_r_rou AS (
SELECT
            		mov_RDU_AR_X_IP_R.IP_ID AS ip_id,
            	mov_RDU_AR_X_IP_R.CST_VORTEX_ID AS cst_vortex_id,
            	mov_RDU_AR_X_IP_R.GRID AS grid,
            	mov_RDU_AR_X_IP_R.SRC_DL AS src_dl
        FROM
            {{ ref('mov_rdu_ar_x_ip_r') }} AS mov_RDU_AR_X_IP_R
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ar_x_ip_r_rou

