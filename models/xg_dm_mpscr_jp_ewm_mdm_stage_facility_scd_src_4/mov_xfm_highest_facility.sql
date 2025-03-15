
{{config(
  materialized='ephemeral'
)}}

WITH mov_xfm_highest_facility AS (
SELECT
            		MOV_AR_X_R_HIGHEST.HIGHEST_FCY_ID AS AR_ID,
            	MOV_AR_X_R_HIGHEST.SRC_DL AS SRC_DL,
            	NULL AS HIGHEST_FCY_IN_HRY
        FROM
            {{ ref('mov_ar_x_r_highest') }} AS MOV_AR_X_R_HIGHEST 
)

SELECT * FROM mov_xfm_highest_facility

