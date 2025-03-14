
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ar_x_ip_r_rou AS (
SELECT
            		MOV_RDU_AR_X_IP_R.IP_ID AS IP_ID,
            	MOV_RDU_AR_X_IP_R.CST_VORTEX_ID AS CST_VORTEX_ID,
            	MOV_RDU_AR_X_IP_R.GRID AS GRID,
            	MOV_RDU_AR_X_IP_R.SRC_DL AS SRC_DL
        FROM
            {{ ref('mov_rdu_ar_x_ip_r') }} AS MOV_RDU_AR_X_IP_R
        ORDER BY
            IP_ID ASC,
            SRC_DL ASC 
)

SELECT * FROM mov_srt_ar_x_ip_r_rou

