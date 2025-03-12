
{{config(
  materialized='table'
)}}

WITH wri_xfm_mdm_credit_risk_rating_ins AS (
SELECT
            		mov_MDM_CREDIT_RISK_RATING.CR_RSK_RTG_RK AS cr_rsk_rtg_rk,
            	mov_MDM_CREDIT_RISK_RATING.CR_RSK_RTG_ID AS cr_rsk_rtg_id,
            	mov_MDM_CREDIT_RISK_RATING.DATE_FROM AS date_from,
            	mov_MDM_CREDIT_RISK_RATING.DATE_TO AS date_to,
            	mov_MDM_CREDIT_RISK_RATING.SRC_DL AS src_dl,
            	mov_MDM_CREDIT_RISK_RATING.SRC_ID AS src_id,
            	mov_MDM_CREDIT_RISK_RATING.FCY_RK AS fcy_rk,
            	mov_MDM_CREDIT_RISK_RATING.CST_RK AS cst_rk,
            	mov_MDM_CREDIT_RISK_RATING.JCO_RK AS jco_rk,
            	mov_MDM_CREDIT_RISK_RATING.INR_CR_RTG AS inr_cr_rtg,
            	mov_MDM_CREDIT_RISK_RATING.CR_RSK_RTG_DT AS cr_rsk_rtg_dt,
            	mov_MDM_CREDIT_RISK_RATING.SRC_TP AS src_tp,
            	mov_MDM_CREDIT_RISK_RATING.INR_RTG_MDL AS inr_rtg_mdl,
            	mov_MDM_CREDIT_RISK_RATING.CST_RTG_ST AS cst_rtg_st,
            	TIMESTAMP('{{ run_started_at }}') AS sys_inrt_tms,
            	 '0' AS del_in_src_stm_f
        FROM
            {{ ref('mov_mdm_credit_risk_rating_1') }} AS mov_MDM_CREDIT_RISK_RATING
        WHERE
            svACTION="I"
            OR svACTION="U" 
)

SELECT * FROM wri_xfm_mdm_credit_risk_rating_ins

