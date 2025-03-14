
{{config(
  materialized='ephemeral'
)}}

WITH mov_ar_x_r_highest AS (
SELECT
            		REA_EWM_AR_X_AR_R_HGR.FCY_ID AS FCY_ID,
            	REA_EWM_AR_X_AR_R_HGR.HIGHEST_FCY_ID AS HIGHEST_FCY_ID,
            	REA_EWM_AR_X_AR_R_HGR.SRC_DL AS SRC_DL
        FROM
            {{ ref('rea_ewm_ar_x_ar_r_hgr') }} AS REA_EWM_AR_X_AR_R_HGR 
)

SELECT * FROM mov_ar_x_r_highest

