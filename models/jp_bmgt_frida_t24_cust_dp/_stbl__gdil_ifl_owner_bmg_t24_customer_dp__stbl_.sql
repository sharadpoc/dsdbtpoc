
{{config(
  materialized='ephemeral'
)}}

WITH _stbl__gdil_ifl_owner_bmg_t24_customer_dp__stbl_ AS (
_ATSQLB_
        DELETE FROM
            GDIL_IFL_OWNER_{{ ref('bmg_t24_customer_dp') }}
        WHERE
            ODS_BUSINESS_DATE >= '{{var("cb_pm_strt_busdate")}}'
            AND ODS_BUSINESS_DATE <= '{{var("cb_pm_end_busdate")}}' 
)

SELECT * FROM _stbl__gdil_ifl_owner_bmg_t24_customer_dp__stbl_

