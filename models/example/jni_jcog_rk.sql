
{{config(
  materialized='ephemeral'
)}}

WITH jni_jcog_rk AS (
SELECT
            		mov_SRT_EWM_CL_JCOG_V.JCO_RK AS mov_srt_ewm_cl_jcog_v_jco_rk,
            	mov_SRT_EWM_CL_JCOG_V.SRC_DL AS mov_srt_ewm_cl_jcog_v_src_dl,
            	mov_SRT_EWM_CL_JCOG_V.CL_ID AS mov_srt_ewm_cl_jcog_v_cl_id,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.OBJ_CL_CD AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_obj_cl_cd,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.SRC_DL AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_src_dl,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.CL_ID AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_cl_id,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.MSTR_SRC_STM_CD AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_mstr_src_stm_cd,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.MSTR_SRC_STM_KEY AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_mstr_src_stm_key,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.VLD_FROM_TMS AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_vld_from_tms,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.VLD_TO_TMS AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_vld_to_tms,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.EFF_DT AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_eff_dt,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.INR_RTG_MODL_CL_CD AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_inr_rtg_modl_cl_cd,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R.RTG_ST_TP_CL_CD AS mov_srt_ewm_cl_jcog_x_cl_rtg_r_rtg_st_tp_cl_cd
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('mov_srt_ewm_cl_jcog_x_cl_rtg_r') }} AS mov_SRT_EWM_CL_JCOG_X_CL_RTG_R
                    UNION DISTINCT
                    DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('mov_srt_ewm_cl_jcog_v') }} AS mov_SRT_EWM_CL_JCOG_V
                ) 
)

SELECT * FROM jni_jcog_rk

