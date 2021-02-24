@EndUserText.label: 'Consumption layer for supplier data'
@AccessControl.authorizationCheck: #CHECK
// Documentation:
// https://sapui5.hana.ondemand.com/#/topic/645e27ae85d54c8cbc3f6722184a24a1
// https://sapui5.hana.ondemand.com/#/topic/5fe439613f9c4e259015951594c423dc.html
@UI: {
    headerInfo: {
        typeName: 'SupplierData',
        typeNamePlural: 'Open Orders',
        title: {
            type: #STANDARD,
            value: 'vendor_name'
        }
    }
}

@Search.searchable: true
define root view entity ZC_SUPPLIER_DATA
  as projection on ZI_SUPPLIER_DATA
{
      // Facets Documentation
      // https://www.samplecodeabap.com/cds-fiori-elements-object-page-facets/
      @UI: {
        lineItem: [
        {
            type: #FOR_ACTION,
            position: 0,
            dataAction: 'accept',
            label: 'Accept'            
        },
        {
            type: #FOR_ACTION,
            position: 1,
            dataAction: 'reject',
            label: 'Reject'
        }] ,
        facet: [
            {
                id: 'orderData',
                purpose: #STANDARD,
                position: 10,
                label: 'Order Information',
                type: #IDENTIFICATION_REFERENCE
            },
            {
                type: #FIELDGROUP_REFERENCE,
                label: 'Supplier Follow Up',
                targetQualifier: 'fgSupplierFollowUp',
                id: 'supplierFollowUp',
                position: 20
            }
        ]
      }
      @EndUserText.label: 'Follow Up ID'
  key id,

      @UI: {
        identification: [{ position: 20 }]
      }
      @EndUserText.label: 'Purch Org'
      ekorg,

      @UI: {
        lineItem: [{ position: 30, importance: #MEDIUM }],
        identification: [{ position: 30 }],
        selectionField: [{ position: 30 }]
      }
      @EndUserText.label: 'Plant'
      werks,

      @UI.identification: [{ position: 40 }]
      @EndUserText.label: 'Plant Name'
      plant_name,

      @EndUserText.label: 'MRP Area'
      berid,

      @EndUserText.label: 'MRP Area Description'
      bertx,

      @EndUserText.label: 'Purchasing Group'
      ekgrp,

      @UI: {
        lineItem: [{ position: 50, importance: #HIGH }],
        identification: [{ position: 50 }]
      }
      @EndUserText.label: 'Schedule Agreement'
      ebeln,

      @UI: {
        lineItem: [{ position: 60, importance: #HIGH }],
        identification: [{ position: 60 }]
      }
      @EndUserText.label: 'Item'
      ebelp,

      @EndUserText.label: 'Schedule Line Item'
      etenr,

      @UI: {
        lineItem: [{ position: 80, importance: #HIGH }],
        identification: [{ position: 80 }],
        selectionField: [{ position: 80 }]
      }
      @EndUserText.label: 'Material'
      matnr,

      @UI: {
        lineItem: [{ position: 90, importance: #LOW }],
        identification: [{ position: 90 }]
      }
      @EndUserText.label: 'Material Description'
      maktx,

      @EndUserText.label: 'MRP Planner'
      dispo,

      @UI: {
        lineItem: [{ position: 100, importance: #LOW }],
        identification: [{ position: 100 }]
      }
      @EndUserText.label: 'Vendor'
      lifnr,

      @UI.identification: [{ position: 110 }]
      @EndUserText.label: 'Vendor Name'
      vendor_name,

      @UI: {
        lineItem: [{ position: 120, importance: #MEDIUM }],
        identification: [{ position: 120 }]
      }
      @EndUserText.label: 'Ship Date'
      calc_ship_date,

      @EndUserText.label: 'Kanban ID'
      pabnum,

      @EndUserText.label: 'Kanban Item'
      pabpos,

      @UI: {
        lineItem: [{ position: 130, importance: #MEDIUM }],
        identification: [{ position: 130 }]
      }
      @EndUserText.label: 'In Transit Qty'
      in_transit_qty,

      @UI: {
        lineItem: [{ position: 140, importance: #LOW }],
        identification: [{ position: 140 }]
      }
      @EndUserText.label: 'Bal Qty w/ ASN'
      bal_qty_w_asn,

      @UI: {
        lineItem: [{ position: 150, criticality: 'status_color', importance: #LOW }],
        identification: [{ position: 150 }],
        selectionField: [{ position: 150 }]
      }
      @EndUserText.label: 'Shipping Status'
      ship_status,

      @UI.hidden: true
      status_color,

      //@UI.identification: [{ position: 160 }]
      @EndUserText.label: 'Action'
      @UI.fieldGroup: [{ qualifier: 'fgSupplierFollowUp', position: 10 }]
      action,

      //@UI.identification: [{ position: 170 }]
      @EndUserText.label: 'Reason'
      @UI.fieldGroup: [{ qualifier: 'fgSupplierFollowUp', position: 20 }]
      reason,

      //@UI.identification: [{ position: 180 }]
      @EndUserText.label: 'Actual Date'
      @UI.fieldGroup: [{ qualifier: 'fgSupplierFollowUp', position: 30 }]
      actual_date,

      //@UI.identification: [{ position: 190 }]
      @EndUserText.label: 'Actual Quantity'
      @UI.fieldGroup: [{ qualifier: 'fgSupplierFollowUp', position: 40 }]
      actual_qty,

      //@UI.identification: [{ position: 200 }]
      @EndUserText.label: 'Partial Date'
      @UI.fieldGroup: [{ qualifier: 'fgSupplierFollowUp', position: 50 }]
      partial_date,

      //@UI.identification: [{ position: 210 }]
      @EndUserText.label: 'Partial Quantity'
      @UI.fieldGroup: [{ qualifier: 'fgSupplierFollowUp', position: 60 }]
      partial_qty,

      @EndUserText.label: 'Supplier Comment'
      //@UI.identification: [{ position: 220 }]
      @UI.fieldGroup: [{ qualifier: 'fgSupplierFollowUp', position: 70 }]
      supplier_comment

}
