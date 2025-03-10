
{{config(
  materialized='ephemeral'
)}}

WITH mov_jni_ewm_cst_ip_x_cl_rtg_r AS (
SELECT
            		mov_SRT_EWM_IP_IP_ID AS ip_id,
            	mov_SRT_EWM_IP_CST_RK AS cst_rk,
            	mov_SRT_EWM_IP_X_CL_RTG_R_CL_CD AS cl_cd,
            	mov_SRT_EWM_IP_X_CL_RTG_R_EFF_DT AS eff_dt,
            	mov_SRT_EWM_IP_X_CL_RTG_R_INR_RTG_MODL_CL_CD AS inr_rtg_modl_cl_cd,
            	mov_SRT_EWM_IP_X_CL_RTG_R_RTG_ST_TP_CL_CD AS rtg_st_tp_cl_cd,
            	mov_SRT_EWM_IP_SRC_DL AS src_dl,
            	mov_SRT_EWM_IP_X_CL_RTG_R_VLD_FROM_TMS AS vld_from_tms,
            	mov_SRT_EWM_IP_X_CL_RTG_R_VLD_TO_TMS AS vld_to_tms,
            	mov_SRT_EWM_IP_X_CL_RTG_R_MSTR_SRC_STM_CD AS mstr_src_stm_cd,
            	mov_SRT_EWM_IP_X_CL_RTG_R_MSTR_SRC_STM_KEY AS mstr_src_stm_key
        FROM
            {{ ref('jni_cst_rk') }} AS JNI_CST_RK 
)

SELECT * FROM mov_jni_ewm_cst_ip_x_cl_rtg_r

