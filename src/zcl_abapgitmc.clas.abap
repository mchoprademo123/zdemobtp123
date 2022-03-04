CLASS zcl_abapgitmc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abapgitmc IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.
out->write( 'Hello World').
ENDMETHOD.
ENDCLASS.
