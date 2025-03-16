
{{config(
  materialized='ephemeral'
)}}

WITH mov_ip_id AS (
SELECT
    *
FROM
    (
        SELECT
            MOV_JNO_EV_CRT_CNTRLD.SRC_DL AS SRC_DL,
            MOV_JNO_EV_CRT_CNTRLD.EV_ID AS EV_ID,
            MOV_JNO_EV_CRT_CNTRLD.EV_JDCL_EV_V_ID AS EV_JDCL_EV_V_ID,
            MOV_JNO_EV_CRT_CNTRLD.ACT_STRT_DT AS ACT_STRT_DT,
            MOV_JNO_EV_CRT_CNTRLD.ACT_END_DT AS ACT_END_DT,
            MOV_JNO_EV_CRT_CNTRLD.AR_ID AS AR_ID,
            MOV_JNO_EV_CRT_CNTRLD.IP_ID AS IP_ID,
            ROW_NUMBER() OVER(
                PARTITION BY SRC_DL ASC,
                AR_ID ASC,
                ACT_STRT_DT DESC,
                ACT_END_DT DESC
                ORDER BY
                    SRC_DL ASC,
                    AR_ID ASC,
                    ACT_STRT_DT DESC,
                    ACT_END_DT DESC
            ) AS RN
        FROM
            {{ ref('mov_jno_ev_crt_cntrld') }} AS MOV_JNO_EV_CRT_CNTRLD
    ) t
WHERE
    RN = 1
)

SELECT * FROM mov_ip_id

