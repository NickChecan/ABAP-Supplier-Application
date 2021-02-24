CLASS lhc_SupplierData DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

*    METHODS get_instance_features FOR INSTANCE FEATURES
    METHODS get_instance_features FOR FEATURES
      IMPORTING keys   REQUEST requested_features FOR SupplierData
      RESULT    result.

    METHODS accept FOR MODIFY
      IMPORTING keys   FOR ACTION SupplierData~accept
      RESULT    result.

    METHODS reject FOR MODIFY
      IMPORTING keys   FOR ACTION SupplierData~reject
      RESULT    result.

ENDCLASS.

CLASS lhc_SupplierData IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITY zi_supplier_data FROM VALUE #(
      FOR keyval IN keys (
          %key            = keyval-%key
          %control-action = if_abap_behv=>mk-on
      )
    ) RESULT DATA(lt_supplier_data).


    result = VALUE #(
        FOR lw_supplier_data IN lt_supplier_data (
            %key = lw_supplier_data-%key
            %features-%action-accept = COND #(
                WHEN lw_supplier_data-action = 'Accepted'
                THEN if_abap_behv=>fc-o-disabled
                ELSE if_abap_behv=>fc-o-enabled
            )
            %features-%action-reject = COND #(
                WHEN lw_supplier_data-action = 'Rejected'
                THEN if_abap_behv=>fc-o-disabled
                ELSE if_abap_behv=>fc-o-enabled
            )
        )
    ).

  ENDMETHOD.

  METHOD accept.

    MODIFY ENTITIES OF zi_supplier_data
    IN LOCAL MODE ENTITY SupplierData
    UPDATE FROM VALUE #(
        FOR key IN keys (
            id = key-id
            action = 'Accepted'
            %control-action = if_abap_behv=>mk-on
        )
    ) FAILED failed REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_supplier_data
    IN LOCAL MODE ENTITY SupplierData
    FROM VALUE #(
        FOR key IN keys (
            id = key-id
            %control = VALUE #(
                reason           = if_abap_behv=>mk-on
                actual_date      = if_abap_behv=>mk-on
                actual_qty       = if_abap_behv=>mk-on
                partial_date     = if_abap_behv=>mk-on
                partial_qty      = if_abap_behv=>mk-on
                supplier_comment = if_abap_behv=>mk-on
            )
        )
    ) RESULT DATA(lt_supplier_data).

    result = VALUE #(
        FOR lw_supplier_data IN lt_supplier_data (
            id  = lw_supplier_data-id
            %param = lw_supplier_data
        )
    ).

  ENDMETHOD.

  METHOD reject.

    MODIFY ENTITIES OF zi_supplier_data
    IN LOCAL MODE ENTITY SupplierData
    UPDATE FROM VALUE #(
        FOR key IN keys (
            id = key-id
            action = 'Rejected'
            %control-action = if_abap_behv=>mk-on
        )
    ) FAILED failed REPORTED reported.

    " Read changed data for action result
    READ ENTITIES OF zi_supplier_data
    IN LOCAL MODE ENTITY SupplierData
    FROM VALUE #(
        FOR key IN keys (
            id = key-id
            %control = VALUE #(
                reason           = if_abap_behv=>mk-on
                actual_date      = if_abap_behv=>mk-on
                actual_qty       = if_abap_behv=>mk-on
                partial_date     = if_abap_behv=>mk-on
                partial_qty      = if_abap_behv=>mk-on
                supplier_comment = if_abap_behv=>mk-on
            )
        )
    ) RESULT DATA(lt_supplier_data).

    result = VALUE #(
        FOR lw_supplier_data IN lt_supplier_data (
            id  = lw_supplier_data-id
            %param = lw_supplier_data
        )
    ).


  ENDMETHOD.

ENDCLASS.
