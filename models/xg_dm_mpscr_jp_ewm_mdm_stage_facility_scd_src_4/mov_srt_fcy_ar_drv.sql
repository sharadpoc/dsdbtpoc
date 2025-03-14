
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fcy_ar_drv AS (
SELECT
            		MOV_FCY_AR_DRV.SRC_DL AS SRC_DL,
            	MOV_FCY_AR_DRV.SUBJ_AR_ID AS SUBJ_AR_ID,
            	MOV_FCY_AR_DRV.SPSDG_FCY_RK AS SPSDG_FCY_RK
        FROM
            {{ ref('mov_fcy_ar_drv') }} AS MOV_FCY_AR_DRV
        ORDER BY
            SRC_DL ASC,
            SUBJ_AR_ID ASC 
)

SELECT * FROM mov_srt_fcy_ar_drv

