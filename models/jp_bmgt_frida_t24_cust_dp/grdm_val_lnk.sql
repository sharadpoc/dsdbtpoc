
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
            TRUNC(VLD_TO_TMS)=PARSE_TIMESTAMP('%d-MON-%Y', "31-DEC-9999") 
)

SELECT * FROM grdm_val_lnk

