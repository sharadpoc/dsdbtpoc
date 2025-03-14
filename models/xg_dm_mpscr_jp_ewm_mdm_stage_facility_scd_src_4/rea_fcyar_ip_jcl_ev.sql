
{{config(
  materialized='ephemeral'
)}}

WITH rea_fcyar_ip_jcl_ev AS (
SELECT
            	SRC_DL,
            	DATA_DT,
            	VLD_FROM_TMS,
            	VLD_TO_TMS,
            	SRC_STM_ID,
            	FCY_ID,
            	FCY_RK,
            	AR_ID,
            	FCY_AR_TP,
            	COURT_CTRLD_WRKOUT_FCY,
            	OUT_OF_COURT_WRKOUT_FCY,
            	COURT_CTRLD_WRKOUT_FILL_DT,
            	COURT_CTRLD_WRKOUT_CLS_DT,
            	CR_OBLG_DFLTD,
            	UNDRL_AR_ID
        FROM
            {{ ref('ora_read_ewm_mdm_stage_fcy_ar_ip_jdcl_ev') }} AS ORA_READ_EWM_MDM_STAGE_FCY_AR_IP_JDCL_EV
        ORDER BY
            SRC_DL ASC,
            AR_ID ASC 
)

SELECT * FROM rea_fcyar_ip_jcl_ev

