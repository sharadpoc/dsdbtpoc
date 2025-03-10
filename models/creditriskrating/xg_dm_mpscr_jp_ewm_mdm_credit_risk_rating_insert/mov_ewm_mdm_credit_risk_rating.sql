
{{config(
  materialized='ephemeral'
)}}

WITH mov_ewm_mdm_credit_risk_rating AS (
SELECT
            		CR_RSK_RTG_RK,
            	CR_RSK_RTG_ID,
            	DATE_FROM,
            	DATE_TO,
            	SRC_DL,
            	SRC_ID,
            	FCY_RK,
            	CST_RK,
            	JCO_RK,
            	INR_CR_RTG,
            	CR_RSK_RTG_DT,
            	SRC_TP,
            	INR_RTG_MDL,
            	CST_RTG_ST
        FROM
            {{ ref('ora_read_ewm_mdm_stage_credit_risk_rating') }} AS ORA_read_EWM_MDM_STAGE_CREDIT_RISK_RATING 
)

SELECT * FROM mov_ewm_mdm_credit_risk_rating

