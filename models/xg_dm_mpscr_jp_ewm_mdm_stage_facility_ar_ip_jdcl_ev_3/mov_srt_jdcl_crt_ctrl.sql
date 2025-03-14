
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_jdcl_crt_ctrl AS (
SELECT
            		REA_EWM_EV_JDCL_EV_V.SRC_DL AS SRC_DL,
            	REA_EWM_EV_JDCL_EV_V.EV_ID AS EV_ID,
            	REA_EWM_EV_JDCL_EV_V.EV_JDCL_EV_V_ID AS EV_JDCL_EV_V_ID,
            	REA_EWM_EV_JDCL_EV_V.ACT_STRT_DT AS ACT_STRT_DT,
            	REA_EWM_EV_JDCL_EV_V.ACT_END_DT AS ACT_END_DT
        FROM
            {{ ref('rea_ewm_ev_jdcl_ev_v') }} AS REA_EWM_EV_JDCL_EV_V
        ORDER BY
            SRC_DL ASC,
            EV_ID ASC 
)

SELECT * FROM mov_srt_jdcl_crt_ctrl

