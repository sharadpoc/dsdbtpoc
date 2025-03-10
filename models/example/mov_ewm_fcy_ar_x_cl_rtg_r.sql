
{{config(
  materialized='ephemeral'
)}}

WITH mov_ewm_fcy_ar_x_cl_rtg_r AS (
SELECT
            		mov_JNI_EWM_FCY_AR_X_CL_RTG_R.MSTR_SRC_STM_CD AS cr_rsk_rtg_rk,
            	svRTGID AS cr_rsk_rtg_id,
            	svRTGID AS src_id,
            	mov_JNI_EWM_FCY_AR_X_CL_RTG_R.MSTR_SRC_STM_CD AS fcy_rk,
            	mov_JNI_EWM_FCY_AR_X_CL_RTG_R.FCY_RK AS cst_rk,
            	mov_JNI_EWM_FCY_AR_X_CL_RTG_R.RTG_ST_TP_CL_CD AS jco_rk,
            	mov_JNI_EWM_FCY_AR_X_CL_RTG_R.VLD_FROM_TMS AS date_from,
            	mov_JNI_EWM_FCY_AR_X_CL_RTG_R.VLD_TO_TMS AS date_to,
            	mov_JNI_EWM_FCY_AR_X_CL_RTG_R.SRC_DL AS src_dl,
            	mov_JNI_EWM_FCY_AR_X_CL_RTG_R.CL_CD AS cl_cd,
            	mov_JNI_EWM_FCY_AR_X_CL_RTG_R.EFF_DT AS eff_dt,
            	mov_JNI_EWM_FCY_AR_X_CL_RTG_R.INR_RTG_MODL_CL_CD AS inr_rtg_modl_cl_cd
        FROM
            {{ ref('mov_jni_ewm_fcy_ar_x_cl_rtg_r') }} AS mov_JNI_EWM_FCY_AR_X_CL_RTG_R 
)

SELECT * FROM mov_ewm_fcy_ar_x_cl_rtg_r

