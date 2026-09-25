--ALTER SESSION SET CURRENT_SCHEMA = "SPCUSER";
DECLARE
  REFCONTENT VARCHAR2(128);
  CURSOR CONTENIDOS IS
    SELECT IDCONTENIDO
      FROM CONTENIDO
     WHERE IDCONTENIDO = 'JEP' AND 
     FLAGCONTROLCAMBIOS = 1;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Procesando...');
  OPEN CONTENIDOS;
  LOOP
    FETCH CONTENIDOS
      INTO REFCONTENT;
    EXIT WHEN CONTENIDOS%NOTFOUND;
  
    DELETE FROM CONTENIDOCONTROLCAMBIOS WHERE IDCONTENIDO = REFCONTENT;
  
    INSERT INTO CONTENIDOCONTROLCAMBIOS
      (ID, IDCONTENIDO, IDUSUARIO, ORDINAL, TIPO, FECHA, DESCRIPCION)
      SELECT ID, REFCONTENT, IDUSUARIO, ORDINAL, TIPO, FECHA, INFO
        FROM (SELECT T.ID,
                     T.INFO,
                     T.TIPO,
                     NVL(U.ID_USUARIO, -1) AS IDUSUARIO,
                     T.ORDINAL,
                     T.FECHA
                FROM (SELECT CP.ID,
                             TO_CHAR(SUBSTR(REGEXP_REPLACE(REGEXP_REPLACE(CP.XML,
                                                                          '<[^>]*>',
                                                                          CASE
                                                                            WHEN CP.FLAGTABLA = 1 THEN
                                                                             ' '
                                                                            ELSE
                                                                             ''
                                                                          END),
                                                           '^\s*((\S+\s+){0,7}\S*).*',
                                                           '\1'),
                                            0,
                                            1000)) || ' [ .. . ]' AS INFO,
                             'Modificación' AS TIPO,
                             LOWER(TO_CHAR(REPLACE(REPLACE(REGEXP_SUBSTR(CP.XML,
                                                                         'author="(.+?)"'),
                                                           'author="',
                                                           ''),
                                                   '"',
                                                   ''))) USERACCT,
                             CP.ORDINAL,
                             NVL(CP.FECHAACTUALIZACION, CP.FECHACREACION) AS FECHA
                        FROM CONTENIDOPARRAFO CP
                       WHERE (CP.FLAGNUEVO = 1 OR CP.FLAGMODIFICADO = 1)
                         AND CP.IDCONTENIDO = REFCONTENT
                         AND CP.FLAGBORRADO = 0
                         AND REGEXP_LIKE(CP.XML,
                                         '(<\?(xm-insertion_mark_start|xm-deletion_mark)(\s*|\s+[^>]+)\sauthor=\s*"(.*?)")',
                                         'i')) T
                LEFT OUTER JOIN USUARIO U
                  ON U.SAMACCOUNTNAME = T.USERACCT
              UNION
              SELECT CP.ID,
                     TO_CHAR(SUBSTR(REGEXP_REPLACE(REGEXP_REPLACE(CP.XML,
                                                                  '<[^>]*>',
                                                                  CASE
                                                                    WHEN CP.FLAGTABLA = 1 THEN
                                                                     ' '
                                                                    ELSE
                                                                     ''
                                                                  END),
                                                   '^\s*((\S+\s+){0,7}\S*).*',
                                                   '\1'),
                                    0,
                                    1000)) || ' [ .. . ]' AS INFO,
                     'Eliminación' AS TIPO,
                     CP.CODUSUARIOCAMBIO AS IDUSUARIO,
                     CP.ORDINAL,
                     NVL(CP.FECHAACTUALIZACION, CP.FECHACREACION) AS FECHA
                FROM CONTENIDOPARRAFO CP
               WHERE CP.FLAGBORRADO = 1
                 AND CP.IDCONTENIDO = REFCONTENT);
    COMMIT;
  END LOOP;
  CLOSE CONTENIDOS;
  DBMS_OUTPUT.PUT_LINE('Finalizado.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('No se procesaron todos los registros' || SQLCODE ||
                         ' -ERROR-' || SQLERRM ||
                         '. Último contenido en procesar:' || REFCONTENT);
END;