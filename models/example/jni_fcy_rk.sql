
{{config(
  materialized='ephemeral'
)}}

WITH jni_fcy_rk AS (
SELECT
            		mov_SRT_EWM_AR_X_CL_RTG_R.RTG_ST_TP_CL_CD AS mov_srt_ewm_ar_x_cl_rtg_r_rtg_st_tp_cl_cd,
            	mov_SRT_EWM_AR_X_CL_RTG_R.SRC_DL AS mov_srt_ewm_ar_x_cl_rtg_r_src_dl,
            	mov_SRT_EWM_AR_X_CL_RTG_R.AR_ID AS mov_srt_ewm_ar_x_cl_rtg_r_ar_id,
            	mov_SRT_EWM_AR_X_CL_RTG_R.MSTR_SRC_STM_CD AS mov_srt_ewm_ar_x_cl_rtg_r_mstr_src_stm_cd,
            	mov_SRT_EWM_AR_X_CL_RTG_R.MSTR_SRC_STM_KEY AS mov_srt_ewm_ar_x_cl_rtg_r_mstr_src_stm_key,
            	mov_SRT_EWM_AR_X_CL_RTG_R.VLD_FROM_TMS AS mov_srt_ewm_ar_x_cl_rtg_r_vld_from_tms,
            	mov_SRT_EWM_AR_X_CL_RTG_R.VLD_TO_TMS AS mov_srt_ewm_ar_x_cl_rtg_r_vld_to_tms,
            	mov_SRT_EWM_AR_X_CL_RTG_R.CL_CD AS mov_srt_ewm_ar_x_cl_rtg_r_cl_cd,
            	mov_SRT_EWM_AR_X_CL_RTG_R.EFF_DT AS mov_srt_ewm_ar_x_cl_rtg_r_eff_dt,
            	mov_SRT_EWM_AR_X_CL_RTG_R.INR_RTG_MODL_CL_CD AS mov_srt_ewm_ar_x_cl_rtg_r_inr_rtg_modl_cl_cd,
            	mov_SRT_EWM_FCY_AR.FCY_RK AS mov_srt_ewm_fcy_ar_fcy_rk,
            	mov_SRT_EWM_FCY_AR.SRC_DL AS mov_srt_ewm_fcy_ar_src_dl,
            	mov_SRT_EWM_FCY_AR.AR_ID AS mov_srt_ewm_fcy_ar_ar_id
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('mov_srt_ewm_fcy_ar') }} AS mov_SRT_EWM_FCY_AR
                    UNION DISTINCT
                    DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('mov_srt_ewm_ar_x_cl_rtg_r') }} AS mov_SRT_EWM_AR_X_CL_RTG_R
                ) 
)

SELECT * FROM jni_fcy_rk

