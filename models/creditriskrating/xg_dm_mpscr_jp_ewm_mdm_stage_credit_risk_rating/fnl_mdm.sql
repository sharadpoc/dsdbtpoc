
{{config(
  materialized='ephemeral'
)}}

WITH fnl_mdm AS (
SELECT
            		mov__EWM_IP_X_CL_RTG_R.CR_RSK_RTG_RK AS mov__ewm_ip_x_cl_rtg_r_cr_rsk_rtg_rk,
            	mov__EWM_IP_X_CL_RTG_R.CR_RSK_RTG_ID AS mov__ewm_ip_x_cl_rtg_r_cr_rsk_rtg_id,
            	mov__EWM_IP_X_CL_RTG_R.FCY_RK AS mov__ewm_ip_x_cl_rtg_r_fcy_rk,
            	mov__EWM_IP_X_CL_RTG_R.CST_RK AS mov__ewm_ip_x_cl_rtg_r_cst_rk,
            	mov__EWM_IP_X_CL_RTG_R.JCO_RK AS mov__ewm_ip_x_cl_rtg_r_jco_rk,
            	mov__EWM_IP_X_CL_RTG_R.SRC_TP AS mov__ewm_ip_x_cl_rtg_r_src_tp,
            	mov__EWM_IP_X_CL_RTG_R.CL_CD AS mov__ewm_ip_x_cl_rtg_r_cl_cd,
            	mov__EWM_IP_X_CL_RTG_R.EFF_DT AS mov__ewm_ip_x_cl_rtg_r_eff_dt,
            	mov__EWM_IP_X_CL_RTG_R.INR_RTG_MODL_CL_CD AS mov__ewm_ip_x_cl_rtg_r_inr_rtg_modl_cl_cd,
            	mov__EWM_IP_X_CL_RTG_R.RTG_ST_TP_CL_CD AS mov__ewm_ip_x_cl_rtg_r_rtg_st_tp_cl_cd,
            	mov__EWM_IP_X_CL_RTG_R.DATE_FROM AS mov__ewm_ip_x_cl_rtg_r_date_from,
            	mov__EWM_IP_X_CL_RTG_R.DATE_TO AS mov__ewm_ip_x_cl_rtg_r_date_to,
            	mov__EWM_IP_X_CL_RTG_R.SRC_DL AS mov__ewm_ip_x_cl_rtg_r_src_dl,
            	mov__EWM_IP_X_CL_RTG_R.SRC_ID AS mov__ewm_ip_x_cl_rtg_r_src_id,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.SRC_ID AS mov_trf_ewm_cl_jcog_icrrd_m_src_id,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.FCY_RK AS mov_trf_ewm_cl_jcog_icrrd_m_fcy_rk,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.CST_RK AS mov_trf_ewm_cl_jcog_icrrd_m_cst_rk,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.JCO_RK AS mov_trf_ewm_cl_jcog_icrrd_m_jco_rk,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.SRC_TP AS mov_trf_ewm_cl_jcog_icrrd_m_src_tp,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.CL_CD AS mov_trf_ewm_cl_jcog_icrrd_m_cl_cd,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.CR_RSK_RTG_RK AS mov_trf_ewm_cl_jcog_icrrd_m_cr_rsk_rtg_rk,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.CR_RSK_RTG_ID AS mov_trf_ewm_cl_jcog_icrrd_m_cr_rsk_rtg_id,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.DATE_FROM AS mov_trf_ewm_cl_jcog_icrrd_m_date_from,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.DATE_TO AS mov_trf_ewm_cl_jcog_icrrd_m_date_to,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.SRC_DL AS mov_trf_ewm_cl_jcog_icrrd_m_src_dl,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.EFF_DT AS mov_trf_ewm_cl_jcog_icrrd_m_eff_dt,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.INR_RTG_MODL_CL_CD AS mov_trf_ewm_cl_jcog_icrrd_m_inr_rtg_modl_cl_cd,
            	mov_TRF_EWM_CL_JCOG_ICRRD_M.RTG_ST_TP_CL_CD AS mov_trf_ewm_cl_jcog_icrrd_m_rtg_st_tp_cl_cd,
            	mov_EWM_FCY_AR_X_CL_RTG_R.CR_RSK_RTG_RK AS mov_ewm_fcy_ar_x_cl_rtg_r_cr_rsk_rtg_rk,
            	mov_EWM_FCY_AR_X_CL_RTG_R.CR_RSK_RTG_ID AS mov_ewm_fcy_ar_x_cl_rtg_r_cr_rsk_rtg_id,
            	mov_EWM_FCY_AR_X_CL_RTG_R.SRC_ID AS mov_ewm_fcy_ar_x_cl_rtg_r_src_id,
            	mov_EWM_FCY_AR_X_CL_RTG_R.FCY_RK AS mov_ewm_fcy_ar_x_cl_rtg_r_fcy_rk,
            	mov_EWM_FCY_AR_X_CL_RTG_R.CST_RK AS mov_ewm_fcy_ar_x_cl_rtg_r_cst_rk,
            	mov_EWM_FCY_AR_X_CL_RTG_R.JCO_RK AS mov_ewm_fcy_ar_x_cl_rtg_r_jco_rk,
            	mov_EWM_FCY_AR_X_CL_RTG_R.SRC_TP AS mov_ewm_fcy_ar_x_cl_rtg_r_src_tp,
            	mov_EWM_FCY_AR_X_CL_RTG_R.RTG_ST_TP_CL_CD AS mov_ewm_fcy_ar_x_cl_rtg_r_rtg_st_tp_cl_cd,
            	mov_EWM_FCY_AR_X_CL_RTG_R.DATE_FROM AS mov_ewm_fcy_ar_x_cl_rtg_r_date_from,
            	mov_EWM_FCY_AR_X_CL_RTG_R.DATE_TO AS mov_ewm_fcy_ar_x_cl_rtg_r_date_to,
            	mov_EWM_FCY_AR_X_CL_RTG_R.SRC_DL AS mov_ewm_fcy_ar_x_cl_rtg_r_src_dl,
            	mov_EWM_FCY_AR_X_CL_RTG_R.CL_CD AS mov_ewm_fcy_ar_x_cl_rtg_r_cl_cd,
            	mov_EWM_FCY_AR_X_CL_RTG_R.EFF_DT AS mov_ewm_fcy_ar_x_cl_rtg_r_eff_dt,
            	mov_EWM_FCY_AR_X_CL_RTG_R.INR_RTG_MODL_CL_CD AS mov_ewm_fcy_ar_x_cl_rtg_r_inr_rtg_modl_cl_cd
        FROM
            (
                    SELECT
                         *
                    FROM
                        {{ ref('mov_trf_ewm_cl_jcog_icrrd_m') }} AS mov_TRF_EWM_CL_JCOG_ICRRD_M
                    UNION DISTINCT
                    DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('mov__ewm_ip_x_cl_rtg_r') }} AS mov__EWM_IP_X_CL_RTG_R
                    UNION DISTINCT
                    DISTINCT
                    SELECT
                         *
                    FROM
                        {{ ref('mov_ewm_fcy_ar_x_cl_rtg_r') }} AS mov_EWM_FCY_AR_X_CL_RTG_R
                ) 
)

SELECT * FROM fnl_mdm

