
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ev_jdcl_ev_v AS (
SELECT
            	SRC_DL,
            	EV_ID,
            	EV_JDCL_EV_V_ID,
            	ACT_STRT_DT,
            	ACT_END_DT
        FROM
            {{ ref('ora_read_ewm_ev_jdcl_ev_v') }} AS ORA_READ_EWM_EV_JDCL_EV_V
        ORDER BY
            SRC_DL ASC,
            EV_ID ASC 
)

SELECT * FROM rea_ewm_ev_jdcl_ev_v

