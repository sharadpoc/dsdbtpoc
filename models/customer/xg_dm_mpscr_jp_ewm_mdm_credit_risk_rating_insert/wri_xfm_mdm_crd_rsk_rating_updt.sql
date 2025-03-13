
{{config(
  materialized='table'
)}}

WITH wri_xfm_mdm_crd_rsk_rating_updt AS (
SELECT
            		mov_MDM_CREDIT_RISK_RATING.TGT_CR_RSK_RTG_ID AS cr_rsk_rtg_id,
            	mov_MDM_CREDIT_RISK_RATING.TGT_DATE_FROM AS date_from,
            	CASE 			WHEN svACTION="D" THEN PARSE_TIMESTAMP(
                    "%Y%m%d",
                    "{{var('xg_pm_selection_date')}}"
                ) 		ELSE mov_MDM_CREDIT_RISK_RATING.DATE_FROM 		END AS date_to,
            	PARSE_TIMESTAMP(
                    "%Y%m%d",
                    "{{var('xg_pm_selection_date')}}"
                ) AS sys_inrt_tms,
            	mov_MDM_CREDIT_RISK_RATING.TGT_SRC_ID AS src_id,
            	mov_MDM_CREDIT_RISK_RATING.TGT_SRC_DL AS src_dl,
            	CASE 			WHEN svACTION="D" THEN "1" 		ELSE "0" 		END AS del_in_src_stm_f,

        FROM
            {{ ref('mov_mdm_credit_risk_rating_1') }} AS mov_MDM_CREDIT_RISK_RATING
        WHERE
            svACTION="U"
            OR svACTION="D" 
)

SELECT * FROM wri_xfm_mdm_crd_rsk_rating_updt

