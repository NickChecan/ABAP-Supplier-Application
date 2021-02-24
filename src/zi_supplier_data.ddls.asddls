@AbapCatalog.sqlViewName: 'ZV_SUPPLIER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface view for supplier data'
define root view ZI_SUPPLIER_DATA
  as select from ztsupplier
{
  key id               as id,
      ekorg            as ekorg,
      werks            as werks,
      plant_name       as plant_name,
      berid            as berid,
      bertx            as bertx,
      ekgrp            as ekgrp,
      ebeln            as ebeln,
      ebelp            as ebelp,
      etenr            as etenr,
      matnr            as matnr,
      maktx            as maktx,
      dispo            as dispo,
      lifnr            as lifnr,
      vendor_name      as vendor_name,
      calc_ship_date   as calc_ship_date,
      pabnum           as pabnum,
      pabpos           as pabpos,
      in_transit_qty   as in_transit_qty,
      bal_qty_w_asn    as bal_qty_w_asn,
      ship_status      as ship_status,

      // Documentation:
      // https://blogs.sap.com/2017/08/09/fiori-elements-status-icons-and-semantic-colors/
      // https://sapui5.hana.ondemand.com/#/topic/0d501b16e43d45d0a19ae54a3be883d3
      case ship_status
        when 'Should Have Shipped,But Has Not' then 1 -- Negative
        when 'Should Have Shipped, And Has' then 3 -- Positive
        else 0
      end              as status_color,

      action           as action,
      reason           as reason,
      actual_date      as actual_date,
      actual_qty       as actual_qty,
      partial_date     as partial_date,
      partial_qty      as partial_qty,
      supplier_comment as supplier_comment
}
