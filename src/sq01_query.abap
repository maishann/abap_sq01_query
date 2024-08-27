submit "QUERY_NAME" using selection-set 'V1' EXPORTING LIST TO MEMORY
              AND RETURN.

DATA list_tab TYPE TABLE OF abaplist.

CALL FUNCTION 'LIST_FROM_MEMORY'
  TABLES
    listobject = list_tab
  EXCEPTIONS
    not_found  = 1
    OTHERS     = 2.

IF sy-subrc = 0.
  CALL FUNCTION 'WRITE_LIST'
    TABLES
      listobject = list_tab.
ENDIF.

CALL FUNCTION 'LIST_TO_TXT'.