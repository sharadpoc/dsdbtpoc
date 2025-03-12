
{{config(
  materialized='ephemeral'
)}}

WITH jno_mdm_credit_risk_rating_src_tgt AS (
SELECT
            		mov_MDM_CREDIT_RISK_RATING_SRC.CR_RSK_RTG_RK AS mov_mdm_credit_risk_rating_src_cr_rsk_rtg_rk,
            	mov_MDM_CREDIT_RISK_RATING_SRC.CR_RSK_RTG_ID AS mov_mdm_credit_risk_rating_src_cr_rsk_rtg_id,
            	mov_MDM_CREDIT_RISK_RATING_SRC.DATE_FROM AS mov_mdm_credit_risk_rating_src_date_from,
            	mov_MDM_CREDIT_RISK_RATING_SRC.DATE_TO AS mov_mdm_credit_risk_rating_src_date_to,
            	mov_MDM_CREDIT_RISK_RATING_SRC.SRC_DL AS mov_mdm_credit_risk_rating_src_src_dl,
            	mov_MDM_CREDIT_RISK_RATING_SRC.SRC_ID AS mov_mdm_credit_risk_rating_src_src_id,
            	mov_MDM_CREDIT_RISK_RATING_SRC.FCY_RK AS mov_mdm_credit_risk_rating_src_fcy_rk,
            	mov_MDM_CREDIT_RISK_RATING_SRC.CST_RK AS mov_mdm_credit_risk_rating_src_cst_rk,
            	mov_MDM_CREDIT_RISK_RATING_SRC.SRC_TP AS mov_mdm_credit_risk_rating_src_src_tp,
            	mov_MDM_CREDIT_RISK_RATING_SRC.CST_RTG_ST AS mov_mdm_credit_risk_rating_src_cst_rtg_st,
            	mov_MDM_CREDIT_RISK_RATING_SRC.JCO_RK AS mov_mdm_credit_risk_rating_src_jco_rk,
            	mov_MDM_CREDIT_RISK_RATING_SRC.INR_CR_RTG AS mov_mdm_credit_risk_rating_src_inr_cr_rtg,
            	mov_MDM_CREDIT_RISK_RATING_SRC.CR_RSK_RTG_DT AS mov_mdm_credit_risk_rating_src_cr_rsk_rtg_dt,
            	mov_MDM_CREDIT_RISK_RATING_SRC.INR_RTG_MDL AS mov_mdm_credit_risk_rating_src_inr_rtg_mdl,
            	mov_MDM_CRD_RISK_Rating_TGT.TGT_DATE_FROM AS mov_mdm_crd_risk_rating_tgt_tgt_date_from,
            	mov_MDM_CRD_RISK_Rating_TGT.CR_RSK_RTG_ID AS mov_mdm_crd_risk_rating_tgt_cr_rsk_rtg_id,
            	mov_MDM_CRD_RISK_Rating_TGT.DATE_FROM AS mov_mdm_crd_risk_rating_tgt_date_from,
            	mov_MDM_CRD_RISK_Rating_TGT.TGT_DATE_TO AS mov_mdm_crd_risk_rating_tgt_tgt_date_to,
            	mov_MDM_CRD_RISK_Rating_TGT.SRC_ID AS mov_mdm_crd_risk_rating_tgt_src_id,
            	mov_MDM_CRD_RISK_Rating_TGT.TGT_INR_CR_RTG AS mov_mdm_crd_risk_rating_tgt_tgt_inr_cr_rtg,
            	mov_MDM_CRD_RISK_Rating_TGT.TGT_CR_RSK_RTG_DT AS mov_mdm_crd_risk_rating_tgt_tgt_cr_rsk_rtg_dt,
            	mov_MDM_CRD_RISK_Rating_TGT.TGT_INR_RTG_MDL AS mov_mdm_crd_risk_rating_tgt_tgt_inr_rtg_mdl,
            	mov_MDM_CRD_RISK_Rating_TGT.TGT_CST_RTG_ST AS mov_mdm_crd_risk_rating_tgt_tgt_cst_rtg_st,
            	mov_MDM_CRD_RISK_Rating_TGT.SRC_DL AS mov_mdm_crd_risk_rating_tgt_src_dl
        FROM
			{{ ref('mov_mdm_credit_risk_rating_src') }} AS mov_MDM_CREDIT_RISK_RATING_SRC
            FULL OUTER JOIN
			{{ ref('mov_mdm_crd_risk_rating_tgt') }} AS mov_MDM_CRD_RISK_Rating_TGT
            ON  mov_MDM_CREDIT_RISK_RATING_SRC.SRC_DL = mov_MDM_CRD_RISK_Rating_TGT.SRC_DL
 				mov_MDM_CREDIT_RISK_RATING_SRC.SRC_ID = mov_MDM_CRD_RISK_Rating_TGT.SRC_ID
 				mov_MDM_CREDIT_RISK_RATING_SRC.CR_RSK_RTG_ID = mov_MDM_CRD_RISK_Rating_TGT.CR_RSK_RTG_ID
 				mov_MDM_CREDIT_RISK_RATING_SRC.DATE_FROM = mov_MDM_CRD_RISK_Rating_TGT.DATE_FROM
)

SELECT * FROM jno_mdm_credit_risk_rating_src_tgt

