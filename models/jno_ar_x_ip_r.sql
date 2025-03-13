
{{config(
  materialized='ephemeral'
)}}

WITH jno_ar_x_ip_r AS (
SELECT
            		mov_SRT_EWM_IP_ALT_IDENTN_VORTEX.IP_ID AS mov_srt_ewm_ip_alt_identn_vortex_ip_id,
            	mov_SRT_EWM_IP_ALT_IDENTN_VORTEX.CST_VORTEX_ID AS mov_srt_ewm_ip_alt_identn_vortex_cst_vortex_id,
            	mov_SRT_EWM_IP_ALT_IDENTN_VORTEX.SRC_DL AS mov_srt_ewm_ip_alt_identn_vortex_src_dl,
            	mov_SRT_EWM_AR_X_IP_R.IP_ID AS mov_srt_ewm_ar_x_ip_r_ip_id,
            	mov_SRT_EWM_AR_X_IP_R.SRC_DL AS mov_srt_ewm_ar_x_ip_r_src_dl,
            	mov_SRT_EWM_IP_ALT_IDENTN_GRID.IP_ID AS mov_srt_ewm_ip_alt_identn_grid_ip_id,
            	mov_SRT_EWM_IP_ALT_IDENTN_GRID.GRID AS mov_srt_ewm_ip_alt_identn_grid_grid,
            	mov_SRT_EWM_IP_ALT_IDENTN_GRID.SRC_DL AS mov_srt_ewm_ip_alt_identn_grid_src_dl
        FROM
            {{ ref('mov_srt_ewm_ip_alt_identn_vortex') }} AS mov_SRT_EWM_IP_ALT_IDENTN_VORTEX
            LEFT OUTER JOIN {{ ref('mov_srt_ewm_ip_alt_identn_grid') }} AS mov_SRT_EWM_IP_ALT_IDENTN_GRID ON mov_SRT_EWM_IP_ALT_IDENTN_VORTEX.IP_ID=mov_SRT_EWM_IP_ALT_IDENTN_GRID.IP_ID
            AND mov_SRT_EWM_IP_ALT_IDENTN_VORTEX.SRC_DL=mov_SRT_EWM_IP_ALT_IDENTN_GRID.SRC_DL 
)

SELECT * FROM jno_ar_x_ip_r

