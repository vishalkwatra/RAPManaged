@AbapCatalog.sqlViewName: 'ZVISOITEMM02'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Item Composite view'

define view ZVK_I_Sales_Item_M_02
  as select from ZVK_I_Sales_Item_02
  association to parent ZVK_I_Sales_Header_M_02 as _SHeadM_02 on $projection.sales_doc_num = _SHeadM_02.sales_doc_num
{
  key sales_doc_num,
  key item_position,
      mat_num,
      mat_desc,
      unit_cost,
      total_item_cost,
      cost_currency,
      quanity,
      unit,
      last_changed,
      /* Associations */
      _SHeadM_02
}
