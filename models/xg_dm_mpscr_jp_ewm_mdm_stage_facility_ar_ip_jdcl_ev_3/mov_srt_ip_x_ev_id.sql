
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ip_x_ev_id AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_TP_CL_CD.SRC_DL AS SRC_DL,
            MOV_TP_CL_CD.EV_ID AS EV_ID,
            MOV_TP_CL_CD.IP_ID AS IP_ID,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ASC,
                IP_ID ASC
                ORDER BY
                    SRC_DL ASC,
                    IP_ID ASC
            ) AS RN
        FROM
            {{ ref('mov_tp_cl_cd') }} AS MOV_TP_CL_CD
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_srt_ip_x_ev_id

