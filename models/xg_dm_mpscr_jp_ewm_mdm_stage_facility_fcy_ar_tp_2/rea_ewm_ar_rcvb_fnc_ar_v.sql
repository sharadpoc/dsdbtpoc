
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_ar_rcvb_fnc_ar_v AS (
SELECT
            	SRC_DL,
            	AR_ID,
            	MSTR_SRC_STM_CD,
            	FCY_AR_TP,
            	MSTR_SRC_STM_KEY,
            	VLD_FROM_TMS,
            	DATA_DT
        FROM
            {{ ref('ora_read_ewm_ar_rcvb_fnc_ar_v') }} AS ORA_READ_EWM_AR_RCVB_FNC_AR_V 
)

SELECT * FROM rea_ewm_ar_rcvb_fnc_ar_v

