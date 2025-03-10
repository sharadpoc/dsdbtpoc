
{{config(
  materialized='ephemeral'
)}}

WITH jni_cst_rk AS (
SELECT
            		mov_SRT_EWM_IP_X_CL_RTG_R.CL_CD AS mov_srt_ewm_ip_x_cl_rtg_r_cl_cd,
            	mov_SRT_EWM_IP_X_CL_RTG_R.EFF_DT AS mov_srt_ewm_ip_x_cl_rtg_r_eff_dt,
            	mov_SRT_EWM_IP_X_CL_RTG_R.INR_RTG_MODL_CL_CD AS mov_srt_ewm_ip_x_cl_rtg_r_inr_rtg_modl_cl_cd,
            	mov_SRT_EWM_IP_X_CL_RTG_R.RTG_ST_TP_CL_CD AS mov_srt_ewm_ip_x_cl_rtg_r_rtg_st_tp_cl_cd,
            	mov_SRT_EWM_IP_X_CL_RTG_R.IP_ID AS mov_srt_ewm_ip_x_cl_rtg_r_ip_id,
            	mov_SRT_EWM_IP_X_CL_RTG_R.SRC_DL AS mov_srt_ewm_ip_x_cl_rtg_r_src_dl,
            	mov_SRT_EWM_IP_X_CL_RTG_R.MSTR_SRC_STM_CD AS mov_srt_ewm_ip_x_cl_rtg_r_mstr_src_stm_cd,
            	mov_SRT_EWM_IP_X_CL_RTG_R.MSTR_SRC_STM_KEY AS mov_srt_ewm_ip_x_cl_rtg_r_mstr_src_stm_key,
            	mov_SRT_EWM_IP_X_CL_RTG_R.VLD_FROM_TMS AS mov_srt_ewm_ip_x_cl_rtg_r_vld_from_tms,
            	mov_SRT_EWM_IP_X_CL_RTG_R.VLD_TO_TMS AS mov_srt_ewm_ip_x_cl_rtg_r_vld_to_tms,
            	mov_SRT_EWM_IP.IP_ID AS mov_srt_ewm_ip_ip_id,
            	mov_SRT_EWM_IP.CST_RK AS mov_srt_ewm_ip_cst_rk,
            	mov_SRT_EWM_IP.SRC_DL AS mov_srt_ewm_ip_src_dl
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('mov_srt_ewm_ip_x_cl_rtg_r') }} AS mov_SRT_EWM_IP_X_CL_RTG_R
                    UNION DISTINCT
                    DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('mov_srt_ewm_ip') }} AS mov_SRT_EWM_IP
                ) 
)

SELECT * FROM jni_cst_rk

