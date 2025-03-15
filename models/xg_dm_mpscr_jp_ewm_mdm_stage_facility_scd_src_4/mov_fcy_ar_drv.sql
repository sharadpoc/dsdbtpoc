
{{config(
  materialized='ephemeral'
)}}

WITH mov_fcy_ar_drv AS (
SELECT
            		REA_FCY_AR_DRV.SRC_DL AS SRC_DL,
            	REA_FCY_AR_DRV.AR_ID AS SUBJ_AR_ID,
            	REA_FCY_AR_DRV.FCY_RK AS SPSDG_FCY_RK
        FROM
            {{ ref('rea_fcy_ar_drv') }} AS REA_FCY_AR_DRV 
)

SELECT * FROM mov_fcy_ar_drv

