
{{config(
  materialized='ephemeral'
)}}

WITH rea_ewm_cl_jcog_v AS (
SELECT
            	SRC_DL,
            	CL_ID,
            	JCO_RK
        FROM
            {{ ref('ora_read_ewm_cl_jcog_v') }} AS ORA_read_EWM_CL_JCOG_V 
        ORDER BY SRC_DL ASC, IP_ID ASC
)

SELECT * FROM rea_ewm_cl_jcog_v

