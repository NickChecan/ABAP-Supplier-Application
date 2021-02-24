CLASS zcl_generate_supplier_data DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS zcl_generate_supplier_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: sdata TYPE TABLE OF ztsupplier.

*    DELETE FROM ztsdata.
*    out->write('Data deleted').
*
*    EXIT.

    sdata = VALUE #(
      (
        id               =  1
        ekorg            =  'C000'
        werks            =  'CX01'
        plant_name       =  'CX01'
        berid            =  'CX01'
        bertx            =  'Coxinha Ilimited'
        ekgrp            =  'H1C'
        ebeln            =  '5500074734'
        ebelp            =  '10'
        etenr            =  '0'
        matnr            =  '1033110045'
        maktx            =  'A13C,6.0 X 1524 X 3048,CE,PO,TR'
        dispo            =  'CAZ'
        lifnr            =  '2666'
        vendor_name      =  'BODA INC'
        calc_ship_date   =  '20120209'
        pabnum           =  '1'
        pabpos           =  '10'
        in_transit_qty   =  0
        bal_qty_w_asn    =  100
        ship_status      =  'Should Have Shipped,But Has Not'
      )
      (
        id               =  2
        ekorg            =  'C000'
        werks            =  'CX01'
        plant_name       =  'CX01'
        berid            =  'CX01'
        bertx            =  'Coxinhas Houses'
        ekgrp            =  'ZNP'
        ebeln            =  '5510991845'
        ebelp            =  '10'
        etenr            =  '2'
        matnr            =  '1010'
        maktx            =  'Pasta'
        dispo            =  '400'
        lifnr            =  '2666'
        vendor_name      =  'Tião do Feijão LTDA'
        calc_ship_date   =  '20190208'
        pabnum           =  '2'
        pabpos           =  '0'
        in_transit_qty   =  17
        bal_qty_w_asn    =  0
        ship_status      =  'Should Have Shipped, And Has'
      )
      (
        id               =  3
        ekorg            =  'C000'
        werks            =  'CX01'
        plant_name       =  'CX01'
        berid            =  'CX01'
        bertx            =  'Coxinhas Houses'
        ekgrp            =  'H08'
        ebeln            =  '5500077117'
        ebelp            =  '10'
        etenr            =  '1'
        matnr            =  '11231'
        maktx            =  'KUNJBIHARI-1'
        dispo            =  ' '
        lifnr            =  '2666'
        vendor_name      =  'Tio Zé INC'
        calc_ship_date   =  '20140418'
        pabnum           =  '3'
        pabpos           =  '0'
        in_transit_qty   =  6
        bal_qty_w_asn    =  91
        ship_status      =  'Should Have Shipped,But Has Not'
      )
      (
        id               =  4
        ekorg            =  'C000'
        werks            =  'CX01'
        plant_name       =  'CX01'
        berid            =  'CX01'
        bertx            =  'Coxinhas Houses'
        ekgrp            =  '10B'
        ebeln            =  '5500077439'
        ebelp            =  '10'
        etenr            =  '5'
        matnr            =  '14M7298'
        maktx            =  'NUT, METRIC, HEX FLANGE'
        dispo            =  'CGO'
        lifnr            =  '2667'
        vendor_name      =  'Tião do Feijão LTDA'
        calc_ship_date   =  '20181231'
        pabnum           =  '4'
        pabpos           =  '0'
        in_transit_qty   =  822
        bal_qty_w_asn    =  0
        ship_status      =  'Should Have Shipped, And Has'
      )
      (
        id               =  5
        ekorg            =  'C000'
        werks            =  'CX01'
        plant_name       =  'CX01'
        berid            =  'CX01'
        bertx            =  'Coxinhas Houses'
        ekgrp            =  'H1C'
        ebeln            =  '5500074734'
        ebelp            =  '10'
        etenr            =  '0'
        matnr            =  '13'
        maktx            =  'Volta Rita'
        dispo            =  'CAZ'
        lifnr            =  '2666'
        vendor_name      =  'Tio Zé INC'
        calc_ship_date   =  '20170421'
        pabnum           =  '6'
        pabpos           =  '30'
        in_transit_qty   =  0
        bal_qty_w_asn    =  5
        ship_status      =  'Should Have Shipped,But Has Not'
      )
      (
        id               =  6
        ekorg            =  'C000'
        werks            =  'CX01'
        plant_name       =  'CX01'
        berid            =  'CX01'
        bertx            =  'Coxinhas Houses'
        ekgrp            =  '101'
        ebeln            =  '5510991815'
        ebelp            =  '10'
        etenr            =  '2'
        matnr            =  '31'
        maktx            =  'Picole'
        dispo            =  '15'
        lifnr            =  '2668'
        vendor_name      =  'SORVETERIA FIQUE FRIO'
        calc_ship_date   =  '20181026'
        pabnum           =  '7'
        pabpos           =  '0'
        in_transit_qty   =  4
        bal_qty_w_asn    =  200
        ship_status      =  'Should Have Shipped,But Has Not'
      )
      (
        id               =  7
        ekorg            =  'C000'
        werks            =  'CX01'
        plant_name       =  'CX01'
        berid            =  'CX01'
        bertx            =  'Coxinhas Houses'
        ekgrp            =  '101'
        ebeln            =  '5510991815'
        ebelp            =  '10'
        etenr            =  '1'
        matnr            =  '411'
        maktx            =  'Carne Seca'
        dispo            =  '15'
        lifnr            =  '2666'
        vendor_name      =  'Tio Zé INC'
        calc_ship_date   =  '20181018'
        pabnum           =  '8'
        pabpos           =  '0'
        in_transit_qty   =  4
        bal_qty_w_asn    =  3
        ship_status      =  'Should Have Shipped,But Has Not'
      )
    ).

    INSERT ztsupplier FROM TABLE @sdata.

    COMMIT WORK AND WAIT.

    out->write('Data added').

  ENDMETHOD.

ENDCLASS.
