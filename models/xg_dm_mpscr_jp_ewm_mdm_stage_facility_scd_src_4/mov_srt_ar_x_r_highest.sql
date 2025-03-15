
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ar_x_r_highest AS (
SELECT
            		MOV_RDU_HIGHEST_FACILITY.AR_ID AS AR_ID,
            	MOV_RDU_HIGHEST_FACILITY.SRC_DL AS SRC_DL,
            	MOV_RDU_HIGHEST_FACILITY.HIGHEST_FCY_IN_HRY AS HIGHEST_FCY_IN_HRY
        FROM
            {{ ref('mov_rdu_highest_facility') }} AS MOV_RDU_HIGHEST_FACILITY
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM mov_srt_ar_x_r_highest

