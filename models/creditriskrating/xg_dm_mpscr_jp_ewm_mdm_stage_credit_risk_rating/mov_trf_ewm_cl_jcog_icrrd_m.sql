
{{config(
  materialized='ephemeral'
)}}

WITH mov_trf_ewm_cl_jcog_icrrd_m AS (
SELECT
            		mov_JNI_JCOG_RK.MSTR_SRC_STM_CD AS src_id,
            	mov_JNI_JCOG_RK.JCO_RK AS fcy_rk,
            	mov_JNI_JCOG_RK.OBJ_CL_CD AS cst_rk,
            	CONCAT(CONCAT(mov_JNI_JCOG_RK.MSTR_SRC_STM_CD, '|'), svRTGID) AS cr_rsk_rtg_rk,
            	svRTGID AS cr_rsk_rtg_id,
            	mov_JNI_JCOG_RK.VLD_FROM_TMS AS date_from,
            	mov_JNI_JCOG_RK.VLD_TO_TMS AS date_to,
            	mov_JNI_JCOG_RK.SRC_DL AS src_dl,
            	mov_JNI_JCOG_RK.EFF_DT AS eff_dt,
            	mov_JNI_JCOG_RK.INR_RTG_MODL_CL_CD AS inr_rtg_modl_cl_cd,
            	mov_JNI_JCOG_RK.RTG_ST_TP_CL_CD AS rtg_st_tp_cl_cd
        FROM
            {{ ref('mov_jni_jcog_rk') }} AS mov_JNI_JCOG_RK 
)

SELECT * FROM mov_trf_ewm_cl_jcog_icrrd_m

