
{{config(
  materialized='ephemeral'
)}}

WITH mov_mdm_credit_risk_rating AS (
SELECT
            		mov_MDM_CREDIT_RISK_RATING_SRC_CR_RSK_RTG_RK AS cr_rsk_rtg_rk,
            	mov_MDM_CREDIT_RISK_RATING_SRC_CR_RSK_RTG_ID AS cr_rsk_rtg_id,
            	mov_MDM_CREDIT_RISK_RATING_SRC_DATE_FROM AS date_from,
            	mov_MDM_CREDIT_RISK_RATING_SRC_DATE_TO AS date_to,
            	mov_MDM_CREDIT_RISK_RATING_SRC_SRC_DL AS src_dl,
            	mov_MDM_CREDIT_RISK_RATING_SRC_SRC_ID AS src_id,
            	mov_MDM_CREDIT_RISK_RATING_SRC_FCY_RK AS fcy_rk,
            	mov_MDM_CREDIT_RISK_RATING_SRC_CST_RK AS cst_rk,
            	mov_MDM_CREDIT_RISK_RATING_SRC_SRC_TP AS src_tp,
            	mov_MDM_CREDIT_RISK_RATING_SRC_CST_RTG_ST AS cst_rtg_st,
            	mov_MDM_CREDIT_RISK_RATING_SRC_JCO_RK AS jco_rk,
            	mov_MDM_CREDIT_RISK_RATING_SRC_INR_CR_RTG AS inr_cr_rtg,
            	mov_MDM_CREDIT_RISK_RATING_SRC_CR_RSK_RTG_DT AS cr_rsk_rtg_dt,
            	mov_MDM_CREDIT_RISK_RATING_SRC_INR_RTG_MDL AS inr_rtg_mdl,
            	mov_MDM_CRD_RISK_Rating_TGT_CR_RSK_RTG_ID AS tgt_cr_rsk_rtg_id,
            	mov_MDM_CRD_RISK_Rating_TGT_SRC_ID AS tgt_src_id,
            	mov_MDM_CRD_RISK_Rating_TGT_SRC_DL AS tgt_src_dl,
            	mov_MDM_CRD_RISK_Rating_TGT_TGT_DATE_FROM AS tgt_date_from,
            	mov_MDM_CRD_RISK_Rating_TGT_TGT_DATE_TO AS tgt_date_to,
            	mov_MDM_CRD_RISK_Rating_TGT_TGT_INR_CR_RTG AS tgt_inr_cr_rtg,
            	mov_MDM_CRD_RISK_Rating_TGT_TGT_CR_RSK_RTG_DT AS tgt_cr_rsk_rtg_dt,
            	mov_MDM_CRD_RISK_Rating_TGT_TGT_INR_RTG_MDL AS tgt_inr_rtg_mdl,
            	mov_MDM_CRD_RISK_Rating_TGT_TGT_CST_RTG_ST AS tgt_cst_rtg_st
        FROM
            {{ ref('jno_mdm_credit_risk_rating_src_tgt') }} AS JNO_MDM_CREDIT_RISK_RATING_SRC_TGT 
)

SELECT * FROM mov_mdm_credit_risk_rating

