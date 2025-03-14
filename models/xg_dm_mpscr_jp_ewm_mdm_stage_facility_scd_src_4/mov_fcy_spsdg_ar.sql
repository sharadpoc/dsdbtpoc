
{{config(
  materialized='ephemeral'
)}}

WITH mov_fcy_spsdg_ar AS (
SELECT
            		MOV_SRT_SPSDG_AR_SPSDG_FCY_DT AS SPSDG_FCY_DT,
            	MOV_SRT_FCY_IP_JCL_EV_SRC_DL AS SRC_DL,
            	MOV_SRT_FCY_IP_JCL_EV_DATA_DT AS DATA_DT,
            	MOV_SRT_FCY_IP_JCL_EV_SYS_VLD_FROM_TMS AS SYS_VLD_FROM_TMS,
            	MOV_SRT_FCY_IP_JCL_EV_SYS_VLD_TO_TMS AS SYS_VLD_TO_TMS,
            	MOV_SRT_FCY_IP_JCL_EV_SRC_STM_ID AS SRC_STM_ID,
            	MOV_SRT_FCY_IP_JCL_EV_FCY_ID AS FCY_ID,
            	MOV_SRT_FCY_IP_JCL_EV_FCY_RK AS FCY_RK,
            	MOV_SRT_FCY_IP_JCL_EV_AR_ID AS AR_ID,
            	MOV_SRT_FCY_IP_JCL_EV_FCY_AR_TP AS FCY_AR_TP,
            	MOV_SRT_FCY_IP_JCL_EV_COURT_CTRLD_WRKOUT_FCY AS COURT_CTRLD_WRKOUT_FCY,
            	MOV_SRT_FCY_IP_JCL_EV_OUT_OF_COURT_WRKOUT_FCY AS OUT_OF_COURT_WRKOUT_FCY,
            	MOV_SRT_FCY_IP_JCL_EV_COURT_CTRLD_WRKOUT_FILL_DT AS COURT_CTRLD_WRKOUT_FILL_DT,
            	MOV_SRT_FCY_IP_JCL_EV_COURT_CTRLD_WRKOUT_CLS_DT AS COURT_CTRLD_WRKOUT_CLS_DT,
            	MOV_SRT_FCY_IP_JCL_EV_CR_OBLG_DFLTD AS CR_OBLG_DFLTD,
            	MOV_SRT_FCY_IP_JCL_EV_UNDRL_AR_ID AS UNDRL_AR_ID,
            	MOV_SRT_SPSDG_AR_SUBJ_AR_ID AS SUBJ_AR_ID
        FROM
            {{ ref('jno_fcy_spsdg_ar') }} AS JNO_FCY_SPSDG_AR 
)

SELECT * FROM mov_fcy_spsdg_ar

