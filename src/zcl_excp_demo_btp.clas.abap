CLASS zcl_excp_demo_btp DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_dyn_msg .
    INTERFACES if_t100_message .

    CONSTANTS:
      BEGIN OF invalid_plant,
        msgid TYPE symsgid VALUE 'ZDEMO_MSG_CLS',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'PLANT',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF invalid_plant .

    METHODS constructor
      IMPORTING
        severity TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
        textid   LIKE if_t100_message=>t100key OPTIONAL
        previous TYPE REF TO cx_root OPTIONAL
        plant    TYPE werks_d OPTIONAL
      .

    DATA plant TYPE werks_d READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EXCP_DEMO_BTP IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->if_abap_behv_message~m_severity = severity.
    me->plant = plant.

  ENDMETHOD.
ENDCLASS.
