
{{config(
  materialized='ephemeral'
)}}

WITH jno_ip_v AS (
SELECT
            		mov_SRT_AR_X_IP_R_ROU.IP_ID AS mov_srt_ar_x_ip_r_rou_ip_id,
            	mov_SRT_AR_X_IP_R_ROU.CST_VORTEX_ID AS mov_srt_ar_x_ip_r_rou_cst_vortex_id,
            	mov_SRT_AR_X_IP_R_ROU.GRID AS mov_srt_ar_x_ip_r_rou_grid,
            	mov_SRT_AR_X_IP_R_ROU.SRC_DL AS mov_srt_ar_x_ip_r_rou_src_dl,
            	mov_SRT_EWM_IP.IP_ID AS mov_srt_ewm_ip_ip_id,
            	mov_SRT_EWM_IP.CST_RK AS mov_srt_ewm_ip_cst_rk,
            	mov_SRT_EWM_IP.VLD_TO_TMS AS mov_srt_ewm_ip_vld_to_tms,
            	mov_SRT_EWM_IP.SRC_DL AS mov_srt_ewm_ip_src_dl,
            	mov_SRT_EWM_IP.MSTR_SRC_STM_CD AS mov_srt_ewm_ip_mstr_src_stm_cd,
            	mov_SRT_EWM_IP.MSTR_SRC_STM_KEY AS mov_srt_ewm_ip_mstr_src_stm_key,
            	mov_SRT_EWM_IP.VLD_FROM_TMS AS mov_srt_ewm_ip_vld_from_tms
        FROM
            {{ ref('mov_srt_ar_x_ip_r_rou') }} AS mov_SRT_AR_X_IP_R_ROU
            LEFT OUTER JOIN {{ ref('mov_srt_ewm_ip') }} AS mov_SRT_EWM_IP ON mov_SRT_AR_X_IP_R_ROU.IP_ID=mov_SRT_EWM_IP.IP_ID
            AND mov_SRT_AR_X_IP_R_ROU.SRC_DL=mov_SRT_EWM_IP.SRC_DL 
)

SELECT * FROM jno_ip_v

