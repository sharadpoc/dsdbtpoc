
{{config(
  materialized='ephemeral'
)}}

WITH lnk_t24_cust AS (
SELECT
            		CUSTOMER_ID,
            	NAME_1,
            	NAME_2,
            	MNEMONIC,
            	SECTOR,
            	SECTOR_NAME,
            	NATIONALITY,
            	RESIDENCE,
            	GRID_ID,
            	GLOB_COMP,
            	ULTIMATE_PARENT,
            	CONTRACT_DATE,
            	CUSTOMER_STATUS,
            	CURR_NO,
            	DATE_TIME,
            	FIRST_INPUTTER,
            	LAST_INPUTTER,
            	AUTHORISER,
            	REPORTING_DATE,
            	REL_START_DATE,
            	REL_END_DATE,
            	ODS_BUSINESS_DATE
        FROM
            {{ ref('hv_t24_cust_dp_src') }} AS HV_T24_CUST_DP_SRC 
)

SELECT * FROM lnk_t24_cust

