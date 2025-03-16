
{{config(
  materialized='ephemeral'
)}}

WITH mov_rdu_highest_facility AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_XFM_HIGHEST_FACILITY.AR_ID AS AR_ID,
            MOV_XFM_HIGHEST_FACILITY.SRC_DL AS SRC_DL,
            MOV_XFM_HIGHEST_FACILITY.HIGHEST_FCY_IN_HRY AS HIGHEST_FCY_IN_HRY,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL,
                AR_ID
                ORDER BY
                    SRC_DL,
                    AR_ID
            ) AS RN
        FROM
            {{ ref('mov_xfm_highest_facility') }} AS MOV_XFM_HIGHEST_FACILITY
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_rdu_highest_facility

