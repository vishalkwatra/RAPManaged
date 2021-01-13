@AbapCatalog.sqlViewName: 'ZVISOITEM_02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sales Item Basic View'

@ObjectModel.representativeKey: 'item_position'
@ObjectModel.semanticKey: ['sales_doc_num','item_position']

define view ZVK_I_Sales_Item_02
  as select from zvk_vbap_02
  association [1..1] to ZVK_I_Sales_Header_02 as _SD_Head_02 on $projection.sales_doc_num = _SD_Head_02.sales_doc_num
{

  key vbeln                  as sales_doc_num,
  key posnr                  as item_position,
      matnr                  as mat_num,

      @Semantics.text: true
      arktx                  as mat_desc,

      @Semantics.amount.currencyCode: 'cost_currency'
      netpr                  as unit_cost,

      @Semantics.amount.currencyCode: 'cost_currency'
      netwr                  as total_item_cost,
      waerk                  as cost_currency,

      @Semantics.quantity.unitOfMeasure: 'unit'
      kpein                  as quanity,
      kmein                  as unit,

      @Semantics.systemDateTime.createdAt: true
      last_changed_timestamp as last_changed,

      _SD_Head_02
}
