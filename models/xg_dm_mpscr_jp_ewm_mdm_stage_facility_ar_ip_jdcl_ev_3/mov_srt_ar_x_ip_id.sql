
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ar_x_ip_id AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_FLT_RANK.SRC_DL AS SRC_DL,
            MOV_FLT_RANK.AR_ID AS AR_ID,
            MOV_FLT_RANK.IP_ID AS IP_ID,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ASC,
                IP_ID ASC
                ORDER BY
                    SRC_DL ASC,
                    IP_ID ASC
            ) AS RN
        FROM
            {{ ref('mov_flt_rank') }} AS MOV_FLT_RANK
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ar_x_ip_id

