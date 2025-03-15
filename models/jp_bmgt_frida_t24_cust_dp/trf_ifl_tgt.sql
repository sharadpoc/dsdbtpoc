
{{config(
  materialized='ephemeral'
)}}

WITH trf_ifl_tgt AS (
SELECT
            		LNK_T24_CUST.REL_END_DATE AS REL_END_DATE,
            	LNK_T24_CUST.ODS_BUSINESS_DATE AS ODS_BUSINESS_DATE,
            	LNK_T24_CUST.GRID_ID AS ORG_INR_PTY_FLAG,
            	LNK_T24_CUST.NAME_1 AS NAME_1,
            	LNK_T24_CUST.NAME_2 AS NAME_2,
            	LNK_T24_CUST.MNEMONIC AS MNEMONIC,
            	LNK_T24_CUST.SECTOR AS SECTOR,
            	LNK_T24_CUST.SECTOR_NAME AS SECTOR_NAME,
            	LNK_T24_CUST.NATIONALITY AS NATIONALITY,
            	LNK_T24_CUST.RESIDENCE AS RESIDENCE,
            	LNK_T24_CUST.GRID_ID AS GRID_ID,
            	LNK_T24_CUST.GLOB_COMP AS GLOB_COMP,
            	LNK_T24_CUST.ULTIMATE_PARENT AS ULTIMATE_PARENT,
            	LNK_T24_CUST.CONTRACT_DATE AS CONTRACT_DATE,
            	LNK_T24_CUST.CUSTOMER_STATUS AS CUSTOMER_STATUS,
            	LNK_T24_CUST.CURR_NO AS CURR_NO,
            	LNK_T24_CUST.DATE_TIME AS DATE_TIME,
            	LNK_T24_CUST.FIRST_INPUTTER AS FIRST_INPUTTER,
            	LNK_T24_CUST.LAST_INPUTTER AS LAST_INPUTTER,
            	LNK_T24_CUST.AUTHORISER AS AUTHORISER,
            	LNK_T24_CUST.REPORTING_DATE AS REPORTING_DT,
            	LNK_T24_CUST.REL_START_DATE AS REL_START_DATE
        FROM
            {{ ref('lnk_t24_cust') }} AS LNK_T24_CUST 
)

SELECT * FROM trf_ifl_tgt

