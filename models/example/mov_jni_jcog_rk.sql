
{{config(
  materialized='ephemeral'
)}}

WITH mov_jni_jcog_rk AS (
SELECT
            		mov_SRT_EWM_CL_JCOG_V_JCO_RK AS jco_rk,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R_OBJ_CL_CD AS obj_cl_cd,
            	mov_SRT_EWM_CL_JCOG_V_SRC_DL AS src_dl,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R_MSTR_SRC_STM_CD AS mstr_src_stm_cd,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R_MSTR_SRC_STM_KEY AS mstr_src_stm_key,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R_VLD_FROM_TMS AS vld_from_tms,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R_VLD_TO_TMS AS vld_to_tms,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R_EFF_DT AS eff_dt,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R_INR_RTG_MODL_CL_CD AS inr_rtg_modl_cl_cd,
            	mov_SRT_EWM_CL_JCOG_X_CL_RTG_R_RTG_ST_TP_CL_CD AS rtg_st_tp_cl_cd
        FROM
            {{ ref('jni_jcog_rk') }} AS JNI_JCOG_RK 
)

SELECT * FROM mov_jni_jcog_rk

