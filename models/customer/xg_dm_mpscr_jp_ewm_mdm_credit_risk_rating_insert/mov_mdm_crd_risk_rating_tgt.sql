
{{config(
  materialized='ephemeral'
)}}

WITH mov_mdm_crd_risk_rating_tgt AS (
SELECT
            		rea_MDM_CREDIT_RISK_RATING.TGT_DATE_FROM AS tgt_date_from,
            	rea_MDM_CREDIT_RISK_RATING.CR_RSK_RTG_ID AS cr_rsk_rtg_id,
            	rea_MDM_CREDIT_RISK_RATING.DATE_FROM AS date_from,
            	rea_MDM_CREDIT_RISK_RATING.DATE_TO AS tgt_date_to,
            	rea_MDM_CREDIT_RISK_RATING.SRC_ID AS src_id,
            	rea_MDM_CREDIT_RISK_RATING.INR_CR_RTG AS tgt_inr_cr_rtg,
            	rea_MDM_CREDIT_RISK_RATING.CR_RSK_RTG_DT AS tgt_cr_rsk_rtg_dt,
            	rea_MDM_CREDIT_RISK_RATING.INR_RTG_MDL AS tgt_inr_rtg_mdl,
            	rea_MDM_CREDIT_RISK_RATING.CST_RTG_ST AS tgt_cst_rtg_st,
            	rea_MDM_CREDIT_RISK_RATING.SRC_DL AS src_dl
        FROM
            {{ ref('rea_mdm_credit_risk_rating') }} AS rea_MDM_CREDIT_RISK_RATING 
		ORDER BY SRC_DL ASC, SRC_ID ASC, CR_RSK_RTG_ID ASC, DATE_FROM ASC 
)

SELECT * FROM mov_mdm_crd_risk_rating_tgt

