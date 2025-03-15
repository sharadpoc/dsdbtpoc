
{{config(
  materialized='ephemeral'
)}}

WITH grdm_val_lnk AS (
SELECT
            	CL_CD,
            	CL_SUP_KEY
        FROM
            {{ source('DM_MPSCR', 'CL_CV_V') }}
        WHERE
            DATE_TRUNC(VLD_TO_TMS, day)=PARSE_TIMESTAMP('%d-%b-%Y', '31-DEC-9999') 
)

SELECT * FROM grdm_val_lnk

