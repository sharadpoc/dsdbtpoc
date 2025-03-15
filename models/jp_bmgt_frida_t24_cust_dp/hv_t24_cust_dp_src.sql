
{{config(
  materialized='ephemeral'
)}}

WITH hv_t24_cust_dp_src AS (
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
            {{ source('DM_MPSCR', 'BMG_T24_CUSTOMER_DP') }}
        WHERE
            SUBSTR(ODS_BUSINESS_DATE, 1,
                             8) >= '{{var("cb_pm_strt_busdate")}}'
            AND SUBSTR(ODS_BUSINESS_DATE, 1, 8) <= '{{var("cb_pm_end_busdate")}}' 
)

SELECT * FROM hv_t24_cust_dp_src

