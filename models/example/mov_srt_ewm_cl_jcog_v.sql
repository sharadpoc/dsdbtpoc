
{{config(
  materialized='ephemeral'
)}}

WITH mov_srt_ewm_cl_jcog_v AS (
SELECT
            		rea_EWM_CL_JCOG_V.JCO_RK AS jco_rk,
            	rea_EWM_CL_JCOG_V.SRC_DL AS src_dl,
            	rea_EWM_CL_JCOG_V.CL_ID AS cl_id
        FROM
            {{ ref('rea_ewm_cl_jcog_v') }} AS rea_EWM_CL_JCOG_V 
)

SELECT * FROM mov_srt_ewm_cl_jcog_v

