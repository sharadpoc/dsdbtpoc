
{{config(
  materialized='ephemeral'
)}}

WITH ora_read_ewm_mdm_stage_fcy_ar_ip_jdcl_ev AS (
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
            {{ source('DM_MPSCR', 'EWM_MDM_STAGE_FCY_AR_IP_JDCL') }}
        WHERE
            DATA_DT=PARSE_TIMESTAMP(
                    '%Y%m%d',
                    "{{var('xg_pm_selection_date')}}"
                )
            AND SRC_DL='{{var("xg_pm_src_dl")}}' 
)

SELECT * FROM ora_read_ewm_mdm_stage_fcy_ar_ip_jdcl_ev

