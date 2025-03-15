
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_x_ar_r_m1 AS (
SELECT
            	OBJ_AR_ID,
            	SRC_DL,
            	SUBJ_AR_ID
        FROM
            {{ ref('ora_read_ewm_ar_x_ar_r_m1') }} AS ORA_READ_EWM_AR_X_AR_R
        ORDER BY
            SRC_DL ASC,
            SUBJ_AR_ID ASC 
)

SELECT * FROM rea_ewm_ar_x_ar_r_m1

