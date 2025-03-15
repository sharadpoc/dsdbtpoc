
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_mstr_cr_ar_v AS (
SELECT
            		PRIM_AR_ID,
            	SRC_DL,
            	SUBJ_AR_ID
        FROM
            {{ ref('ora_read_ewm_ar_mstr_cr_ar_v') }} AS ORA_READ_EWM_AR_MSTR_CR_AR_V
        ORDER BY
            SRC_DL ASC,
            PRIM_AR_ID ASC 
)

SELECT * FROM rea_ewm_ar_mstr_cr_ar_v

