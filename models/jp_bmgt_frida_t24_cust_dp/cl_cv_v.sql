
{{config(
  materialized='ephemeral'
)}}

WITH cl_cv_v AS (
SELECT
            	CL_CD,
            	CL_SUP_KEY
        FROM
            {{ ref('grdm_val_lnk') }} AS GRDM_VAL_LNK 
)

SELECT * FROM cl_cv_v

