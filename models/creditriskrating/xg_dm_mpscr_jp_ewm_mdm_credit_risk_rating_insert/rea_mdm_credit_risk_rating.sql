
{{config(
  materialized='ephemeral'
)}}

WITH rea_mdm_credit_risk_rating AS (
SELECT
            		CR_RSK_RTG_ID,
            	DATE_FROM,
            	DATE_TO,
            	SRC_ID,
            	INR_CR_RTG,
            	CR_RSK_RTG_DT,
            	INR_RTG_MDL,
            	CST_RTG_ST,
            	SRC_DL,
            	TGT_DATE_FROM
        FROM
            {{ ref('ora_read_mdm_credit_risk_rating') }} AS ORA_read_MDM_CREDIT_RISK_RATING 
)

SELECT * FROM rea_mdm_credit_risk_rating

