
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_x_ar_r_hgr AS (
SELECT
            	FCY_ID,
            	HIGHEST_FCY_ID,
            	LEAF,
            	HIGHER_FCY_ID,
            	SRC_DL
        FROM
            {{ ref('ora_read_ewm_ar_x_ar_r_hgr') }} AS ORA_READ_EWM_AR_X_AR_R_HGR 
)

SELECT * FROM rea_ewm_ar_x_ar_r_hgr

