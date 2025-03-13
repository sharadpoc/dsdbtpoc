
{{config(
  materialized='ephemeral'
)}}

WITH mov_mdm_credit_risk_rating_src AS (
SELECT
            		mov_EWM_MDM_CREDIT_RISK_RATING.CR_RSK_RTG_RK AS cr_rsk_rtg_rk,
            	mov_EWM_MDM_CREDIT_RISK_RATING.CR_RSK_RTG_ID AS cr_rsk_rtg_id,
            	mov_EWM_MDM_CREDIT_RISK_RATING.DATE_FROM AS date_from,
            	mov_EWM_MDM_CREDIT_RISK_RATING.DATE_TO AS date_to,
            	mov_EWM_MDM_CREDIT_RISK_RATING.SRC_DL AS src_dl,
            	mov_EWM_MDM_CREDIT_RISK_RATING.SRC_ID AS src_id,
            	mov_EWM_MDM_CREDIT_RISK_RATING.FCY_RK AS fcy_rk,
            	mov_EWM_MDM_CREDIT_RISK_RATING.CST_RK AS cst_rk,
            	mov_EWM_MDM_CREDIT_RISK_RATING.SRC_TP AS src_tp,
            	mov_EWM_MDM_CREDIT_RISK_RATING.CST_RTG_ST AS cst_rtg_st,
            	mov_EWM_MDM_CREDIT_RISK_RATING.JCO_RK AS jco_rk,
            	mov_EWM_MDM_CREDIT_RISK_RATING.INR_CR_RTG AS inr_cr_rtg,
            	mov_EWM_MDM_CREDIT_RISK_RATING.CR_RSK_RTG_DT AS cr_rsk_rtg_dt,
            	mov_EWM_MDM_CREDIT_RISK_RATING.INR_RTG_MDL AS inr_rtg_mdl
        FROM
            {{ ref('mov_ewm_mdm_credit_risk_rating') }} AS mov_EWM_MDM_CREDIT_RISK_RATING
		ORDER BY SRC_DL ASC, SRC_ID ASC, CR_RSK_RTG_ID ASC, DATE_FROM ASC  
)

SELECT * FROM mov_mdm_credit_risk_rating_src

