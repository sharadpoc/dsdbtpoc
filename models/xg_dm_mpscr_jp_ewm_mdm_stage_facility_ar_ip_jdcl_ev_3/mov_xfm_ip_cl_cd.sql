
{{config(
  materialized='ephemeral'
)}}

WITH mov_xfm_ip_cl_cd AS (
SELECT
            		MOV_SRT_IP_FNC_ST.IP_CL_CD AS IP_DEFAULT_IND,
            	MOV_SRT_IP_FNC_ST.SRC_DL AS SRC_DL,
            	MOV_SRT_IP_FNC_ST.IP_ID AS IP_ID,
            	MOV_SRT_IP_FNC_ST.IP_CL_CD AS IP_CL_CD
        FROM
            {{ ref('mov_srt_ip_fnc_st') }} AS MOV_SRT_IP_FNC_ST 
)

SELECT * FROM mov_xfm_ip_cl_cd

