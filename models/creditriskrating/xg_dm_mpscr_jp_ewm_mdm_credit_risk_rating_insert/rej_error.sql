
{{config(
  materialized='ephemeral'
)}}

WITH rej_error AS (
SELECT
            		wri_XFM_MDM_CRD_RSK_RATING_UPDT.CR_RSK_RTG_ID AS cr_rsk_rtg_id,
            	wri_XFM_MDM_CRD_RSK_RATING_UPDT.DATE_FROM AS date_from,
            	wri_XFM_MDM_CRD_RSK_RATING_UPDT.DATE_TO AS date_to,
            	wri_XFM_MDM_CRD_RSK_RATING_UPDT.SYS_INRT_TMS AS sys_inrt_tms,
            	wri_XFM_MDM_CRD_RSK_RATING_UPDT.SRC_ID AS src_id,
            	wri_XFM_MDM_CRD_RSK_RATING_UPDT.SRC_DL AS src_dl,
            	wri_XFM_MDM_CRD_RSK_RATING_UPDT.DEL_IN_SRC_STM_F AS del_in_src_stm_f
        FROM
            {{ ref('ora_write_mdm_crd_rsk_rating_upd') }} AS ORA_write_MDM_CRD_RSK_RATING_UPD 
)

SELECT * FROM rej_error

