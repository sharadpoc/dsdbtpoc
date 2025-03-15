
{{config(
  materialized='ephemeral'
)}}

WITH mov_fcy_ar_hgr_fcy AS (
SELECT
            		REA_FCY_AR_DRV.SRC_DL AS SRC_DL,
            	REA_FCY_AR_DRV.AR_ID AS HIGHER_FCY_ID,
            	REA_FCY_AR_DRV.FCY_RK AS HIGHER_FCY_RK
        FROM
            {{ ref('rea_fcy_ar_drv') }} AS REA_FCY_AR_DRV 
)

SELECT * FROM mov_fcy_ar_hgr_fcy

