
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_fcy_ar_hghst AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_FCY_AR_HGHST_FCY.SRC_DL AS SRC_DL,
            MOV_FCY_AR_HGHST_FCY.HIGHEST_FCY_ID AS HIGHEST_FCY_ID,
            MOV_FCY_AR_HGHST_FCY.HIGHEST_FCY_RK AS HIGHEST_FCY_RK,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ,
                HIGHEST_FCY_ID 
                ORDER BY
                    SRC_DL ASC,
                    HIGHEST_FCY_ID ASC
            ) AS RN
        FROM
            {{ ref('mov_fcy_ar_hghst_fcy') }} AS MOV_FCY_AR_HGHST_FCY
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_fcy_ar_hghst

