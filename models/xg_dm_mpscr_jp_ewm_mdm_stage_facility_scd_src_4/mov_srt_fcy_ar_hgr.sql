
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fcy_ar_hgr AS (
SELECT
            		MOV_FCY_AR_HGR_FCY.SRC_DL AS SRC_DL,
            	MOV_FCY_AR_HGR_FCY.HIGHER_FCY_ID AS HIGHER_FCY_ID,
            	MOV_FCY_AR_HGR_FCY.HIGHER_FCY_RK AS HIGHER_FCY_RK
        FROM
            {{ ref('mov_fcy_ar_hgr_fcy') }} AS MOV_FCY_AR_HGR_FCY
        ORDER BY
            SRC_DL ASC,
            HIGHER_FCY_ID ASC 
)

SELECT * FROM mov_srt_fcy_ar_hgr

