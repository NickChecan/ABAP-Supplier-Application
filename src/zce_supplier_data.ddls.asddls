@EndUserText.label: 'Consumption layer for supplier data'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_SUPPLIER_DATA_DAO'
@UI: {
  headerInfo: {
  typeName: 'SupplierData',
  typeNamePlural: 'SupplierDataSet'
  }
}
define root custom entity ZCE_SUPPLIER_DATA
{

      @UI.facet        : [
          {
            id         : 'SupplierData',
            purpose    : #STANDARD,
            type       : #IDENTIFICATION_REFERENCE,
            label      : 'SupplierData',
            position   : 10
          }
        ]

      @UI              : {
        lineItem       : [{position: 10, importance: #HIGH}],
        identification : [{position: 10}],
        selectionField : [{position: 10}]
      }
  key id               : abap.int4;
      
      @UI           : {
        lineItem      : [{position: 20, importance: #HIGH}],
        identification: [{position: 20}],
        selectionField: [{position: 20}]
      }
      ekorg            : abap.char(4);
      
      @UI           : {
        lineItem      : [{position: 30, importance: #HIGH}],
        identification: [{position: 30}]
      }
      werks            : abap.char(4);
      
      @UI           : {
        lineItem      : [{position: 40, importance: #HIGH}],
        identification: [{position: 40}]
      }
      plant_name       : abap.char(30);
      berid            : abap.char(10);
      bertx            : abap.char(40);
      ekgrp            : abap.char(3);
      ebeln            : abap.char(10);
      ebelp            : abap.char(5);
      etenr            : abap.char(4);
      matnr            : abap.char(18);
      maktx            : abap.char(40);
      dispo            : abap.char(3);
      lifnr            : abap.char(10);
      vendor_name      : abap.char(35);
      calc_ship_date   : abap.dats;
      pabnum           : abap.char(10);
      pabpos           : abap.char(4);
      in_transit_qty   : abap.char(13);
      bal_qty_w_asn    : abap.char(13);
      ship_status      : abap.char(50);
      action           : abap.char(1);
      reason           : abap.char(60);
      actual_date      : abap.dats;
      actual_qty       : abap.dec(13,3);
      partial_date     : abap.dats;
      partial_qty      : abap.dec(13,3);
      supplier_comment : abap.char(255);

}
