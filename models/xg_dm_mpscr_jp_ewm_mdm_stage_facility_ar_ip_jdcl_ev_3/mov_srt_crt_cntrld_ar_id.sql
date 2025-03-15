
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_crt_cntrld_ar_id AS (
SELECT
            		MOV_MAX_ACT_DT.SRC_DL AS SRC_DL,
            	MOV_MAX_ACT_DT.EV_ID AS EV_ID,
            	MOV_MAX_ACT_DT.EV_JDCL_EV_V_ID AS EV_JDCL_EV_V_ID,
            	MOV_MAX_ACT_DT.ACT_STRT_DT AS ACT_STRT_DT,
            	MOV_MAX_ACT_DT.ACT_END_DT AS ACT_END_DT,
            	MOV_MAX_ACT_DT.AR_ID AS AR_ID,
            	MOV_MAX_ACT_DT.IP_ID AS IP_ID
        FROM
            {{ ref('mov_max_act_dt') }} AS MOV_MAX_ACT_DT
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM mov_srt_crt_cntrld_ar_id

