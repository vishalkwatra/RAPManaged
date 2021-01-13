CLASS zvk_cl_demo_data_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS create_sample_so_header.
    METHODS create_sample_so_item.
    METHODS reset_sample_so_so_item.
ENDCLASS.



CLASS zvk_cl_demo_data_02 IMPLEMENTATION.

  METHOD create_sample_so_header.

    DATA: lt_so_header TYPE STANDARD TABLE OF zvk_vbak_02,
          lv_timestamp TYPE timestampl.

    GET TIME STAMP FIELD lv_timestamp.

    lt_so_header = VALUE #(
                   (
                     vbeln          = '1001'
                     erdat          = sy-datum
                     ernam          = 'Alex'
                     vkorg          = '1000'
                     vtweg          = '10'
                     spart          = '10'
                     netwr          = '2000.00'
                     waerk          = 'EUR'
                     faksk          = ''
                     last_changed_timestamp = lv_timestamp
                    )
                    (
                    vbeln           = '1002'
                     erdat          = sy-datum
                     ernam          = 'Alex'
                     vkorg          = '1000'
                     vtweg          = '10'
                     spart          = '10'
                     netwr          = '2000.00'
                     waerk          = 'EUR'
                     faksk          = ''
                     last_changed_timestamp = lv_timestamp
                    )
                  ).

    INSERT zvk_vbak_02 FROM TABLE @lt_so_header.




  ENDMETHOD.

  METHOD create_sample_so_item.

    DATA: lt_so_item   TYPE STANDARD TABLE OF zvk_vbap_02,
          lv_timestamp TYPE timestampl.

    GET TIME STAMP FIELD lv_timestamp.

    lt_so_item = VALUE #(
                   (

                        vbeln          = '1001'
                        posnr          = '10'
                        matnr          = 'M-10'
                        arktx          = 'Laptop'
                        netpr          = '1000'
                        netwr          = '1000'
                        waerk          = 'EUR'
                        kpein          = '1'
                        kmein          = 'PC'
                        last_changed_timestamp = lv_timestamp
                    )
                    (

                        vbeln          = '1001'
                        posnr          = '20'
                        matnr          = 'M-20'
                        arktx          = 'Office Phone'
                        netpr          = '1000'
                        netwr          = '1000'
                        waerk          = 'EUR'
                        kpein          = '1'
                        kmein          = 'PC'
                        last_changed_timestamp = lv_timestamp
                    )
                    (

                        vbeln          = '1002'
                        posnr          = '10'
                        matnr          = 'A-20'
                        arktx          = 'Big Office Desk'
                        netpr          = '1000'
                        netwr          = '2000'
                        waerk          = 'EUR'
                        kpein          = '2'
                        kmein          = 'PC'
                        last_changed_timestamp = lv_timestamp
                    )
                  ).

    INSERT zvk_vbap_02 FROM TABLE @lt_so_item.


  ENDMETHOD.

  METHOD reset_sample_so_so_item.

    DELETE FROM zvk_vbak_02.
    DELETE FROM zvk_vbap_02.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.

    reset_sample_so_so_item(  ).
    create_sample_so_header(  ).
    create_sample_so_item(  ).


    IF sy-subrc EQ 0.
      out->write(
       EXPORTING
          data = 'Done' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
