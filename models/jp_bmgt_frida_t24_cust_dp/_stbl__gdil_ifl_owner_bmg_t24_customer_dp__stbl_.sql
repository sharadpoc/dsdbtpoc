
{{config(
  materialized='table',
  pre_hook="""
  DELETE FROM GDIL_IFL_OWNER
        WHERE ODS_BUSINESS_DATE >= '{{var('cb_pm_strt_busdate')}}'
            AND ODS_BUSINESS_DATE <= '{{var('cb_pm_end_busdate')}}' 
  """
)}}

SELECT 1 AS dummy_column

