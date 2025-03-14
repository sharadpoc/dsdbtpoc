
{{config(
  materialized='ephemeral'
)}}

WITH jno_fcy_spsdg_ar AS (
SELECT
            		MOV_SRT_FCY_IP_JCL_EV.SRC_DL AS MOV_SRT_FCY_IP_JCL_EV_SRC_DL,
            	MOV_SRT_FCY_IP_JCL_EV.DATA_DT AS MOV_SRT_FCY_IP_JCL_EV_DATA_DT,
            	MOV_SRT_FCY_IP_JCL_EV.SYS_VLD_FROM_TMS AS MOV_SRT_FCY_IP_JCL_EV_SYS_VLD_FROM_TMS,
            	MOV_SRT_FCY_IP_JCL_EV.SYS_VLD_TO_TMS AS MOV_SRT_FCY_IP_JCL_EV_SYS_VLD_TO_TMS,
            	MOV_SRT_FCY_IP_JCL_EV.SRC_STM_ID AS MOV_SRT_FCY_IP_JCL_EV_SRC_STM_ID,
            	MOV_SRT_FCY_IP_JCL_EV.FCY_ID AS MOV_SRT_FCY_IP_JCL_EV_FCY_ID,
            	MOV_SRT_FCY_IP_JCL_EV.FCY_RK AS MOV_SRT_FCY_IP_JCL_EV_FCY_RK,
            	MOV_SRT_FCY_IP_JCL_EV.AR_ID AS MOV_SRT_FCY_IP_JCL_EV_AR_ID,
            	MOV_SRT_FCY_IP_JCL_EV.FCY_AR_TP AS MOV_SRT_FCY_IP_JCL_EV_FCY_AR_TP,
            	MOV_SRT_FCY_IP_JCL_EV.COURT_CTRLD_WRKOUT_FCY AS MOV_SRT_FCY_IP_JCL_EV_COURT_CTRLD_WRKOUT_FCY,
            	MOV_SRT_FCY_IP_JCL_EV.OUT_OF_COURT_WRKOUT_FCY AS MOV_SRT_FCY_IP_JCL_EV_OUT_OF_COURT_WRKOUT_FCY,
            	MOV_SRT_FCY_IP_JCL_EV.COURT_CTRLD_WRKOUT_FILL_DT AS MOV_SRT_FCY_IP_JCL_EV_COURT_CTRLD_WRKOUT_FILL_DT,
            	MOV_SRT_FCY_IP_JCL_EV.COURT_CTRLD_WRKOUT_CLS_DT AS MOV_SRT_FCY_IP_JCL_EV_COURT_CTRLD_WRKOUT_CLS_DT,
            	MOV_SRT_FCY_IP_JCL_EV.CR_OBLG_DFLTD AS MOV_SRT_FCY_IP_JCL_EV_CR_OBLG_DFLTD,
            	MOV_SRT_FCY_IP_JCL_EV.UNDRL_AR_ID AS MOV_SRT_FCY_IP_JCL_EV_UNDRL_AR_ID,
            	MOV_SRT_SPSDG_AR.SPSDG_FCY_DT AS MOV_SRT_SPSDG_AR_SPSDG_FCY_DT,
            	MOV_SRT_SPSDG_AR.SRC_DL AS MOV_SRT_SPSDG_AR_SRC_DL,
            	MOV_SRT_SPSDG_AR.AR_ID AS MOV_SRT_SPSDG_AR_AR_ID,
            	MOV_SRT_SPSDG_AR.SUBJ_AR_ID AS MOV_SRT_SPSDG_AR_SUBJ_AR_ID
        FROM
            {{ ref('mov_srt_fcy_ip_jcl_ev') }} AS MOV_SRT_FCY_IP_JCL_EV
            LEFT OUTER JOIN {{ ref('mov_srt_spsdg_ar') }} AS MOV_SRT_SPSDG_AR ON MOV_SRT_FCY_IP_JCL_EV.SRC_DL=MOV_SRT_SPSDG_AR.SRC_DL
            AND MOV_SRT_FCY_IP_JCL_EV.AR_ID=MOV_SRT_SPSDG_AR.AR_ID 
)

SELECT * FROM jno_fcy_spsdg_ar

