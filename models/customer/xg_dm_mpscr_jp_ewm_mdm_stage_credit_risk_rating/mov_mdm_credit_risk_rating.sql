
{{config(
  materialized='ephemeral'
)}}

WITH mov_mdm_credit_risk_rating AS (
SELECT
            		mov_FNL_MDM_EWM.CR_RSK_RTG_RK AS cr_rsk_rtg_rk,
            	mov_FNL_MDM_EWM.CR_RSK_RTG_ID AS cr_rsk_rtg_id,
            	mov_FNL_MDM_EWM.DATE_FROM AS date_from,
            	mov_FNL_MDM_EWM.DATE_TO AS date_to,
            	mov_FNL_MDM_EWM.SRC_DL AS src_dl,
            	mov_FNL_MDM_EWM.SRC_ID AS src_id,
            	mov_FNL_MDM_EWM.FCY_RK AS fcy_rk,
            	mov_FNL_MDM_EWM.CST_RK AS cst_rk,
            	mov_FNL_MDM_EWM.JCOG_RK AS jco_rk,
            	mov_FNL_MDM_EWM.SRC_TP AS src_tp,
            	mov_FNL_MDM_EWM.CL_CD AS inr_cr_rtg,
            	mov_FNL_MDM_EWM.EFF_DT AS cr_rsk_rtg_dt,
            	mov_FNL_MDM_EWM.INR_RTG_MODL_CL_CD AS inr_rtg_mdl,
            	mov_FNL_MDM_EWM.RTG_ST_TP_CL_CD AS cst_rtg_st,
            	TIMESTAMP('{{run_started_at}}') AS sys_inrt_tms,
            	PARSE_TIMESTAMP(
                    "%Y%m%d%H%M%S",
                    CONCAT(
                            '{{var("xg_pm_selection_date")}}',
                            '{{var("xg_pm_business_tms")}}'
                        )
                ) AS data_dt
        FROM
            {{ ref('mov_fnl_mdm_ewm') }} AS mov_FNL_MDM_EWM 
)

SELECT * FROM mov_mdm_credit_risk_rating

