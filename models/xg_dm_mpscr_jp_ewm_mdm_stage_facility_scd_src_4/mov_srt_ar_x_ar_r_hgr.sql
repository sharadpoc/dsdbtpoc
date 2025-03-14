
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ar_x_ar_r_hgr AS (
SELECT
            		MOV_AR_X_AR_HGR.SRC_DL AS SRC_DL,
            	MOV_AR_X_AR_HGR.AR_ID AS AR_ID,
            	MOV_AR_X_AR_HGR.HIGHER_FCY_ID AS HIGHER_FCY_ID,
            	MOV_AR_X_AR_HGR.HIGHEST_FCY_ID AS HIGHEST_FCY_ID,
            	MOV_AR_X_AR_HGR.LEAF AS LEAF
        FROM
            {{ ref('mov_ar_x_ar_hgr') }} AS MOV_AR_X_AR_HGR
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM mov_srt_ar_x_ar_r_hgr

