
{{config(
  materialized='ephemeral'
)}}

WITH jno_ar_x_ip_r AS (
SELECT
            		MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX.IP_ID AS MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX_IP_ID,
            	MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX.CST_VORTEX_ID AS MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX_CST_VORTEX_ID,
            	MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX.SRC_DL AS MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX_SRC_DL,
            	MOV_SRT_EWM_AR_X_IP_R.IP_ID AS MOV_SRT_EWM_AR_X_IP_R_IP_ID,
            	MOV_SRT_EWM_AR_X_IP_R.SRC_DL AS MOV_SRT_EWM_AR_X_IP_R_SRC_DL,
            	MOV_SRT_EWM_IP_ALT_IDENTN_GRID.IP_ID AS MOV_SRT_EWM_IP_ALT_IDENTN_GRID_IP_ID,
            	MOV_SRT_EWM_IP_ALT_IDENTN_GRID.GRID AS MOV_SRT_EWM_IP_ALT_IDENTN_GRID_GRID,
            	MOV_SRT_EWM_IP_ALT_IDENTN_GRID.SRC_DL AS MOV_SRT_EWM_IP_ALT_IDENTN_GRID_SRC_DL
        FROM
            {{ ref('mov_srt_ewm_ip_alt_identn_vortex') }} AS MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX
            LEFT OUTER JOIN {{ ref('mov_srt_ewm_ip_alt_identn_grid') }} AS MOV_SRT_EWM_IP_ALT_IDENTN_GRID ON MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX.IP_ID=MOV_SRT_EWM_IP_ALT_IDENTN_GRID.IP_ID
            AND MOV_SRT_EWM_IP_ALT_IDENTN_VORTEX.SRC_DL=MOV_SRT_EWM_IP_ALT_IDENTN_GRID.SRC_DL 
)

SELECT * FROM jno_ar_x_ip_r

