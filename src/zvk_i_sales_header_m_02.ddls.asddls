@AbapCatalog.sqlViewName: 'ZVISOHEADM02'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Root CDS View Sales Header'
define root view ZVK_I_Sales_Header_M_02
  as select from ZVK_I_Sales_Header_02
  composition [0..*] of ZVK_I_Sales_Item_M_02 as _SItemM_02
{
  key sales_doc_num,
      date_created,
      person_created,
      sales_org,
      sales_dist,
      sales_div,
      total_cost,
      cost_currency,
      block_status,
      last_changed,
      _SItemM_02

}
