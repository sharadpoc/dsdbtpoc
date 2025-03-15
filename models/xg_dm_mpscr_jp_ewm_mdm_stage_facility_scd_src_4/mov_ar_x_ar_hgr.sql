
{{config(
  materialized='ephemeral'
)}}

WITH mov_ar_x_ar_hgr AS (
SELECT
            		REA_EWM_AR_X_AR_R_HGR.SRC_DL AS SRC_DL,
            	REA_EWM_AR_X_AR_R_HGR.FCY_ID AS AR_ID,
            	REA_EWM_AR_X_AR_R_HGR.HIGHER_FCY_ID AS HIGHER_FCY_ID,
            	REA_EWM_AR_X_AR_R_HGR.HIGHEST_FCY_ID AS HIGHEST_FCY_ID,
            	REA_EWM_AR_X_AR_R_HGR.LEAF AS LEAF
        FROM
            {{ ref('rea_ewm_ar_x_ar_r_hgr') }} AS REA_EWM_AR_X_AR_R_HGR 
)

SELECT * FROM mov_ar_x_ar_hgr

