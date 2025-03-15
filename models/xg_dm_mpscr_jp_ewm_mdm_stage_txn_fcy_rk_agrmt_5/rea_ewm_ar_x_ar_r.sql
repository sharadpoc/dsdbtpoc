
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_x_ar_r AS (
SELECT
            	OBJ_AR_ID,
            	SRC_DL,
            	SUBJ_AR_ID
        FROM
            {{ ref('ora_read_ewm_ar_x_ar_r') }} AS ORA_READ_EWM_AR_X_AR_R
        ORDER BY
            SRC_DL ASC,
            OBJ_AR_ID ASC 
)

SELECT * FROM rea_ewm_ar_x_ar_r

