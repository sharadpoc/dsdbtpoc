
{{config(
  materialized='ephemeral'
)}}

WITH mov_xfm_ar_cl_cd AS (
SELECT
            		MOV_SRT_EWM_AR_X_CL_FNC_ST_AR_ID.AR_CL_CD AS AR_DEFAULT_IND,
            	MOV_SRT_EWM_AR_X_CL_FNC_ST_AR_ID.SRC_DL AS SRC_DL,
            	MOV_SRT_EWM_AR_X_CL_FNC_ST_AR_ID.AR_ID AS AR_ID,
            	MOV_SRT_EWM_AR_X_CL_FNC_ST_AR_ID.AR_CL_CD AS AR_CL_CD
        FROM
            {{ ref('mov_srt_ewm_ar_x_cl_fnc_st_ar_id') }} AS MOV_SRT_EWM_AR_X_CL_FNC_ST_AR_ID 
)

SELECT * FROM mov_xfm_ar_cl_cd

