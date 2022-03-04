CLASS lhc_Vas DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Vas RESULT result.
    METHODS validateplant FOR VALIDATE ON SAVE
      IMPORTING keys FOR vas~validateplant.

ENDCLASS.

CLASS lhc_Vas IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD validatePlant.
    READ ENTITIES OF zisd_vas_proctm IN LOCAL MODE
        ENTITY Vas
            FIELDS ( Werks ) WITH CORRESPONDING #( keys )
    RESULT DATA(t_plant).

    SELECT FROM ZISD_PlantStdVH FIELDS Plant
        FOR ALL ENTRIES IN @t_plant
        WHERE Plant = @t_plant-Werks
        INTO TABLE @DATA(t_plant_db).

    LOOP AT t_plant ASSIGNING FIELD-SYMBOL(<s_plant>).
      "Clear state messages
      APPEND VALUE #( %tky = <s_plant>-%tky %state_area = 'VALIDATE_PLANT' ) TO reported-vas.
      IF <s_plant>-Werks IS INITIAL OR NOT line_exists( t_plant_db[ Plant = <s_plant>-Werks ] ).
        APPEND VALUE #( %tky = <s_plant>-%tky ) TO failed-vas.

        APPEND VALUE #( %tky = <s_plant>-%tky
                        %state_area = 'VALIDATE_PLANT'
                        %msg = NEW zcl_excp_demo_btp(
                                  severity = if_abap_behv_message=>severity-error
                                  textid   = zcl_excp_demo_btp=>invalid_plant
                                  plant    = <s_plant>-Werks
                                )
                        %element-Werks = if_abap_behv=>mk-on ) TO reported-vas.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
