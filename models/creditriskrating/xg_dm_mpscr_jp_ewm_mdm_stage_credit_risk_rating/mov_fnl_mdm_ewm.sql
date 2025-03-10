
{{config(
  materialized='ephemeral'
)}}

WITH mov_fnl_mdm_ewm AS (
SELECT
            		mov_TRF_EWM_CL_JCOG_ICRRD_M_DATE_FROMmov_EWM_FCY_AR_X_CL_RTG_R_DATE_FROMmov__EWM_IP_X_CL_RTG_R_DATE_FROM AS date_from,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M_DATE_TOmov_EWM_FCY_AR_X_CL_RTG_R_DATE_TOmov__EWM_IP_X_CL_RTG_R_DATE_TO AS date_to,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M_SRC_DLmov_EWM_FCY_AR_X_CL_RTG_R_SRC_DLmov__EWM_IP_X_CL_RTG_R_SRC_DL AS src_dl,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M_SRC_IDmov_EWM_FCY_AR_X_CL_RTG_R_SRC_IDmov__EWM_IP_X_CL_RTG_R_SRC_ID AS src_id,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M_FCY_RKmov_EWM_FCY_AR_X_CL_RTG_R_FCY_RKmov__EWM_IP_X_CL_RTG_R_FCY_RK AS fcy_rk,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M_CST_RKmov_EWM_FCY_AR_X_CL_RTG_R_CST_RKmov__EWM_IP_X_CL_RTG_R_CST_RK AS cst_rk,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M_SRC_TPmov_EWM_FCY_AR_X_CL_RTG_R_SRC_TPmov__EWM_IP_X_CL_RTG_R_SRC_TP AS src_tp,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M_CL_CDmov_EWM_FCY_AR_X_CL_RTG_R_CL_CDmov__EWM_IP_X_CL_RTG_R_CL_CD AS cl_cd,
            	CR_RSK_RTG_RK AS cr_rsk_rtg_rk,
            	CR_RSK_RTG_ID AS cr_rsk_rtg_id,
            	JCO_RK AS jcog_rk,
            	EFF_DT AS eff_dt,
            	INR_RTG_MODL_CL_CD AS inr_rtg_modl_cl_cd,
            	RTG_ST_TP_CL_CD AS rtg_st_tp_cl_cd
        FROM
            {{ ref('fnl_mdm') }} AS FNL_MDM 
)

SELECT * FROM mov_fnl_mdm_ewm

