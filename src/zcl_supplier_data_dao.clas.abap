CLASS zcl_supplier_data_dao DEFINITION PUBLIC FINAL CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_rap_query_provider.

  PROTECTED SECTION.

  PRIVATE SECTION.

    TYPES tt_supplier_data TYPE SORTED TABLE OF zce_supplier_data
    WITH NON-UNIQUE KEY lifnr.

    CLASS-METHODS retrieve_supplier_data
      RETURNING VALUE(re_data) TYPE tt_supplier_data.

ENDCLASS.

CLASS zcl_supplier_data_dao IMPLEMENTATION.

  METHOD if_rap_query_provider~select.

    DATA lt_supplier_data TYPE TABLE OF zce_supplier_data.
    DATA lv_supplier_code TYPE c LENGTH 10.
    DATA(lv_abap_trial) = abap_true.

    TRY.

        IF io_request->is_data_requested( ).

          DATA lv_maxrows TYPE int4.
          DATA(lv_skip) = io_request->get_paging( )->get_offset(  ).
          DATA(lv_top) = io_request->get_paging( )->get_page_size(  ).
          lv_maxrows = lv_skip + lv_top.

          IF lv_abap_trial = abap_true.

            lt_supplier_data =
              zcl_supplier_data_dao=>retrieve_supplier_data( ).

          ELSE.

* IMPORTANT: Always specify the authentication mode using the interface
* if_a4c_cp_service. Never hard-code your password in the class.
            DATA(lo_rfc_dest) =
              cl_rfc_destination_provider=>create_by_cloud_destination(
                i_name = 'WG4_RFC'
                i_service_instance_name = 'default_destination'
*              i_authn_mode = if_a4c_cp_service=>service_specific
            ).

            DATA(lv_rfc_dest_name) =
                lo_rfc_dest->get_destination_name( ).

            CALL FUNCTION 'ZFM_RETRIEVE_SUPPLIER_DATA'
              DESTINATION lv_rfc_dest_name
              EXPORTING
                im_supplier_code      = lv_supplier_code
                im_max_rows           = lv_maxrows
              IMPORTING
                ex_supplier_data      = lt_supplier_data
              EXCEPTIONS
                system_failure        = 1
                communication_failure = 2
                OTHERS                = 3.

          ENDIF.

          "IF io_request->is_total_numb_of_rec_requested( ).
          io_response->set_total_number_of_records(
              lines( lt_supplier_data )
          ).
          "ENDIF.

          io_response->set_data( lt_supplier_data ).

        ENDIF.

      CATCH cx_rfc_dest_provider_error INTO DATA(lx_dest).
    ENDTRY.

  ENDMETHOD.

  METHOD retrieve_supplier_data.

    SELECT * FROM ztsupplier
    INTO TABLE @re_data.

  ENDMETHOD.

ENDCLASS.
