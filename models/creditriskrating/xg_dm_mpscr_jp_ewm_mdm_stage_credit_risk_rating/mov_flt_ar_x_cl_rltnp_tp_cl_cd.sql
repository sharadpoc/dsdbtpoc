
{{config(
  materialized='ephemeral'
)}}

WITH mov_flt_ar_x_cl_rltnp_tp_cl_cd AS (
SELECT
            		rea_EWM_AR_X_CL_RTG_R.RTG_ST_TP_CL_CD AS rtg_st_tp_cl_cd,
            	rea_EWM_AR_X_CL_RTG_R.SRC_DL AS src_dl,
            	rea_EWM_AR_X_CL_RTG_R.AR_ID AS ar_id,
            	rea_EWM_AR_X_CL_RTG_R.MSTR_SRC_STM_CD AS mstr_src_stm_cd,
            	rea_EWM_AR_X_CL_RTG_R.MSTR_SRC_STM_KEY AS mstr_src_stm_key,
            	rea_EWM_AR_X_CL_RTG_R.VLD_FROM_TMS AS vld_from_tms,
            	rea_EWM_AR_X_CL_RTG_R.VLD_TO_TMS AS vld_to_tms,
            	rea_EWM_AR_X_CL_RTG_R.CL_CD AS cl_cd,
            	rea_EWM_AR_X_CL_RTG_R.EFF_DT AS eff_dt,
            	rea_EWM_AR_X_CL_RTG_R.INR_RTG_MODL_CL_CD AS inr_rtg_modl_cl_cd
        FROM
            {{ ref('rea_ewm_ar_x_cl_rtg_r') }} AS rea_EWM_AR_X_CL_RTG_R 
)

SELECT * FROM mov_flt_ar_x_cl_rltnp_tp_cl_cd

