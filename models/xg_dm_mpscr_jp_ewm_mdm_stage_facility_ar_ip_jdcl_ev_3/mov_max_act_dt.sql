
{{config(
  materialized='ephemeral'
)}}

WITH mov_max_act_dt AS (
SELECT
            		MOV_IP_ID.SRC_DL AS SRC_DL,
            	MOV_IP_ID.EV_ID AS EV_ID,
            	MOV_IP_ID.EV_JDCL_EV_V_ID AS EV_JDCL_EV_V_ID,
            	MOV_IP_ID.ACT_STRT_DT AS ACT_STRT_DT,
            	MOV_IP_ID.ACT_END_DT AS ACT_END_DT,
            	MOV_IP_ID.AR_ID AS AR_ID,
            	MOV_IP_ID.IP_ID AS IP_ID
        FROM
            {{ ref('mov_ip_id') }} AS MOV_IP_ID 
)

SELECT * FROM mov_max_act_dt

