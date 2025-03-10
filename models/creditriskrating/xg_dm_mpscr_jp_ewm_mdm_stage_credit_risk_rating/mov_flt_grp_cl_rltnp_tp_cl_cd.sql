
{{config(
  materialized='ephemeral'
)}}

WITH mov_flt_grp_cl_rltnp_tp_cl_cd AS (
SELECT
            		rea_EWM_CL_JCOG_ICRRD_M.OBJ_CL_CD AS obj_cl_cd,
            	rea_EWM_CL_JCOG_ICRRD_M.SRC_DL AS src_dl,
            	rea_EWM_CL_JCOG_ICRRD_M.SUBJ_CL_ID AS subj_cl_id,
            	rea_EWM_CL_JCOG_ICRRD_M.MSTR_SRC_STM_CD AS mstr_src_stm_cd,
            	rea_EWM_CL_JCOG_ICRRD_M.MSTR_SRC_STM_KEY AS mstr_src_stm_key,
            	rea_EWM_CL_JCOG_ICRRD_M.VLD_FROM_TMS AS vld_from_tms,
            	rea_EWM_CL_JCOG_ICRRD_M.VLD_TO_TMS AS vld_to_tms,
            	rea_EWM_CL_JCOG_ICRRD_M.EFF_DT AS eff_dt,
            	rea_EWM_CL_JCOG_ICRRD_M.INR_RTG_MODL_CL_CD AS inr_rtg_modl_cl_cd,
            	rea_EWM_CL_JCOG_ICRRD_M.RTG_ST_TP_CL_CD AS rtg_st_tp_cl_cd
        FROM
            {{ ref('rea_ewm_cl_jcog_icrrd_m') }} AS rea_EWM_CL_JCOG_ICRRD_M 
)

SELECT * FROM mov_flt_grp_cl_rltnp_tp_cl_cd

