select * from contenidoparrafo where id ='xnormativanif2016.0bb9f1444dba48dabeda9917cf96bd5c'; 
SELECT * FROM enlaces WHERE (id_enlace = 6439519 OR COD_DESTINO IN (4554302, 4554270,4554235 )) and COD_PARRAFO ='xnormativanif2016.0bb9f1444dba48dabeda9917cf96bd5c'

-- Ejemplo <Link id="4618853" idlink="6451750"> tabla enlaces -> ID_ENLACE =  6451750 | cod_destino = 4618853



/*

UPDATE contenidoparrafo
SET xml = REPLACE (xml, '<Link id="4554302" idlink="NA">XXXV</Link>','XXXV') 
WHERE  id='xnormativanif2016.0bb9f1444dba48dabeda9917cf96bd5c'; 
UPDATE contenidoparrafo
SET xml = REPLACE (xml, '<Link id="4554235" idlink="NA">Circular Externa 13 del 2025</Link>','Circular Externa 13 del 2025') 
WHERE  id='xnormativanif2016.0bb9f1444dba48dabeda9917cf96bd5c'; 
UPDATE contenidoparrafo
SET xml = REPLACE (xml, '<Link id="4554270" idlink="NA">XXXIV</Link>','XXXIV') 
WHERE  id='xnormativanif2016.0bb9f1444dba48dabeda9917cf96bd5c'; 

*/


DECLARE
  CURSOR CONTENIDOS IS
    SELECT IDCONTENIDO
      FROM CONTENIDO
    WHERE IDCONTENIDO = 'normativanif2016'
     ORDER BY IDCONTENIDO DESC;
  REFCONTENT VARCHAR2(128);
  V_CODE     NUMBER;
  V_MESSAGE  VARCHAR2(255);
BEGIN
  OPEN CONTENIDOS;
  LOOP
    FETCH CONTENIDOS
      INTO REFCONTENT;
    EXIT WHEN CONTENIDOS%NOTFOUND;
  
    DECLARE
      CURSOR LINKS IS
        SELECT X.*, P.IDPARRAFO
          FROM (SELECT ID IDPARRAFO, XML
                  FROM CONTENIDOPARRAFO
                 WHERE IDCONTENIDO = REFCONTENT
                   AND XML LIKE '%</Link>%') P,
               (XMLTABLE('/root//Link' PASSING
                         XMLTYPE('<root>' || REPLACE(P.XML, '&', '') ||
                                 '</root>') COLUMNS LINKID NUMBER PATH
                         '@idlink',
                         IDDESTINO NUMBER PATH '@id')) X;
      LINKACTUAL LINKS%ROWTYPE;
      COUNTER    NUMBER;
      NEWLINK    NUMBER;
    BEGIN
      OPEN LINKS;
      LOOP
        FETCH LINKS
          INTO LINKACTUAL;
        EXIT WHEN LINKS%NOTFOUND;
      
        -- Si LINKID y IDDESTINO son iguales a = 0 es porque es un enlace a indice, por lo que permanece igual
        IF NOT (LINKACTUAL.LINKID = 0 AND LINKACTUAL.IDDESTINO = 0) THEN
        
          COUNTER := 0;
          -- Verificar si existe enlace con el destino grabado en el XML del parrafo
          SELECT COUNT(1)
            INTO COUNTER
            FROM ENLACES
           WHERE COD_CONTENIDO = REFCONTENT
             AND COD_PARRAFO = LINKACTUAL.IDPARRAFO
             AND COD_DESTINO = LINKACTUAL.IDDESTINO;
          IF COUNTER > 0 THEN
            -- Verificar si el identificador del enlace grabado en el XML corresponde al parrafo y al destino
            SELECT COUNT(1)
              INTO COUNTER
              FROM ENLACES
             WHERE COD_CONTENIDO = REFCONTENT
               AND COD_PARRAFO = LINKACTUAL.IDPARRAFO
               AND COD_DESTINO = LINKACTUAL.IDDESTINO
               AND ID_ENLACE = LINKACTUAL.LINKID;
            -- Si el resultado es 1 es consistente el XML con la tabla por lo que no se hace nada
            IF COUNTER <> 1 THEN
              -- Si el resultado es 0 es que el enlace no existe y procedemos a grabarlo
              IF COUNTER = 0 THEN
                -- Verificar si el id del enlace existe
                SELECT COUNT(1)
                  INTO COUNTER
                  FROM ENLACES
                 WHERE ID_ENLACE = LINKACTUAL.LINKID;
                -- Si no existe procedemos a grabarlo con el mismo ID...
                IF (COUNTER = 0) AND (LINKACTUAL.LINKID IS NOT NULL) THEN
                  INSERT INTO ENLACES
                    (ID_ENLACE,
                     COD_DESTINO,
                     COD_CONTENIDO,
                     COD_PARRAFO,
                     COD_USUARIO,
                     FECHA_CREACION,
                     ESTADO,
                     ESESPECIAL)
                  VALUES
                    (LINKACTUAL.LINKID,
                     LINKACTUAL.IDDESTINO,
                     REFCONTENT,
                     LINKACTUAL.IDPARRAFO,
                     -1,
                     SYSDATE,
                     1,
                     0);
                
                  NEWLINK := LINKACTUAL.LINKID;
                  -- Si no existe procedemos a grabarlo con el mismo ID...
                ELSE
                  SPENLACESINSERTAR(NEWLINK,
                                    LINKACTUAL.IDDESTINO,
                                    REFCONTENT,
                                    LINKACTUAL.IDPARRAFO,
                                    -1,
                                    1,
                                    0);
                END IF;
              
                INSERT INTO CONTENIDOHISTORICOPARRAFO
                  (IDPARRAFO,
                   IDCONTENIDO,
                   XML,
                   ESTILO,
                   CODUSUARIO,
                   FECHACREACION,
                   FLAGBORRADO,
                   IDANTERIOR,
                   IDSIGUIENTE)
                  SELECT ID,
                         IDCONTENIDO,
                         XML,
                         ESTILO,
                         -2,
                         SYSDATE,
                         FLAGBORRADO,
                         IDANTERIOR,
                         IDSIGUIENTE
                    FROM CONTENIDOPARRAFO
                   WHERE IDCONTENIDO = REFCONTENT
                     AND ID = LINKACTUAL.IDPARRAFO;
                UPDATE CONTENIDOPARRAFO
                   SET XML = REGEXP_REPLACE(XML,
                                            '<\s*Link\s*id\s*=\s*"' ||
                                            LINKACTUAL.IDDESTINO ||
                                            '"(\s*idlink\s*=\s*"' ||
                                            LINKACTUAL.LINKID ||
                                            '")?(\s*class\s*=\s*".*?")?(\s*(temporal|origin)=".*?")?\s*>',
                                            '<Link id="' ||
                                            LINKACTUAL.IDDESTINO ||
                                            '" idlink="' || NEWLINK || '"\2>',
                                            1,
                                            1)
                 WHERE IDCONTENIDO = REFCONTENT
                   AND ID = LINKACTUAL.IDPARRAFO;
              END IF;
            END IF;
            -- Sino existe enlace registrado con ese destino en la tabla...
          ELSE
            -- Verificar si existe el destino que esta grabado en el parrafo
            SELECT COUNT(1)
              INTO COUNTER
              FROM CONTENIDODESTINOS
             WHERE ID_DESTINO = LINKACTUAL.IDDESTINO;
            -- Si el destino existe...
            IF COUNTER > 0 THEN
              -- Verificar si el id del enlace existe
              SELECT COUNT(1)
                INTO COUNTER
                FROM ENLACES
               WHERE ID_ENLACE = LINKACTUAL.LINKID;
              -- Si no existe procedemos a grabarlo con el mismo ID...
              IF (COUNTER = 0) AND (LINKACTUAL.LINKID IS NOT NULL) THEN
                INSERT INTO ENLACES
                  (ID_ENLACE,
                   COD_DESTINO,
                   COD_CONTENIDO,
                   COD_PARRAFO,
                   COD_USUARIO,
                   FECHA_CREACION,
                   ESTADO,
                   ESESPECIAL)
                VALUES
                  (LINKACTUAL.LINKID,
                   LINKACTUAL.IDDESTINO,
                   REFCONTENT,
                   LINKACTUAL.IDPARRAFO,
                   -1,
                   SYSDATE,
                   1,
                   0);
              
                NEWLINK := LINKACTUAL.LINKID;
                -- Si si existe, generamos otro ID y grabamos...
              ELSE
                SPENLACESINSERTAR(NEWLINK,
                                  LINKACTUAL.IDDESTINO,
                                  REFCONTENT,
                                  LINKACTUAL.IDPARRAFO,
                                  -1,
                                  1,
                                  0);
              END IF;
            
              INSERT INTO CONTENIDOHISTORICOPARRAFO
                (IDPARRAFO,
                 IDCONTENIDO,
                 XML,
                 ESTILO,
                 CODUSUARIO,
                 FECHACREACION,
                 FLAGBORRADO,
                 IDANTERIOR,
                 IDSIGUIENTE)
                SELECT ID,
                       IDCONTENIDO,
                       XML,
                       ESTILO,
                       -2,
                       SYSDATE,
                       FLAGBORRADO,
                       IDANTERIOR,
                       IDSIGUIENTE
                  FROM CONTENIDOPARRAFO
                 WHERE IDCONTENIDO = REFCONTENT
                   AND ID = LINKACTUAL.IDPARRAFO;
              UPDATE CONTENIDOPARRAFO
                 SET XML = REGEXP_REPLACE(XML,
                                          '<\s*Link\s*id\s*=\s*"' ||
                                          LINKACTUAL.IDDESTINO ||
                                          '"(\s*idlink\s*=\s*"' ||
                                          LINKACTUAL.LINKID ||
                                          '")?(\s*class\s*=\s*".*?")?(\s*(temporal|origin)=".*?")?\s*>',
                                          '<Link id="' ||
                                          LINKACTUAL.IDDESTINO ||
                                          '" idlink="' || NEWLINK || '"\2>',
                                          1,
                                          1)
               WHERE IDCONTENIDO = REFCONTENT
                 AND ID = LINKACTUAL.IDPARRAFO;
            
              -- Si el destino no existe...
            ELSE
              -- Verificar si el id del enlace existe
              SELECT COUNT(1)
                INTO COUNTER
                FROM ENLACES
               WHERE ID_ENLACE = LINKACTUAL.LINKID;
              -- Si no existe procedemos a grabarlo con el mismo ID...
              IF (COUNTER = 0) AND (LINKACTUAL.LINKID IS NOT NULL) THEN
                INSERT INTO ENLACES
                  (ID_ENLACE,
                   COD_DESTINO,
                   COD_CONTENIDO,
                   COD_PARRAFO,
                   COD_USUARIO,
                   FECHA_CREACION,
                   ESTADO,
                   ESESPECIAL)
                VALUES
                  (LINKACTUAL.LINKID,
                   -1,
                   REFCONTENT,
                   LINKACTUAL.IDPARRAFO,
                   -1,
                   SYSDATE,
                   0,
                   0);
              
                NEWLINK := LINKACTUAL.LINKID;
                -- Si si existe, generamos otro ID y grabamos...
              ELSE
                SPENLACESINSERTAR(NEWLINK,
                                  -1,
                                  REFCONTENT,
                                  LINKACTUAL.IDPARRAFO,
                                  -1,
                                  0,
                                  0);
              END IF;
            
              INSERT INTO CONTENIDOHISTORICOPARRAFO
                (IDPARRAFO,
                 IDCONTENIDO,
                 XML,
                 ESTILO,
                 CODUSUARIO,
                 FECHACREACION,
                 FLAGBORRADO,
                 IDANTERIOR,
                 IDSIGUIENTE)
                SELECT ID,
                       IDCONTENIDO,
                       XML,
                       ESTILO,
                       -2,
                       SYSDATE,
                       FLAGBORRADO,
                       IDANTERIOR,
                       IDSIGUIENTE
                  FROM CONTENIDOPARRAFO
                 WHERE IDCONTENIDO = REFCONTENT
                   AND ID = LINKACTUAL.IDPARRAFO;
            
              UPDATE CONTENIDOPARRAFO
                 SET XML = REGEXP_REPLACE(XML,
                                          '<\s*Link\s*(id\s*=\s*"' ||
                                          LINKACTUAL.IDDESTINO ||
                                          '")?(\s*idlink\s*=\s*"' ||
                                          LINKACTUAL.LINKID ||
                                          '")?(\s*class\s*=\s*".*?")?(\s*(temporal|origin)=".*?")?\s*>',
                                          '<Link id="-1" idlink="' || NEWLINK ||
                                          '" class="broken">', --Romper Enlace
                                          1,
                                          1)
               WHERE IDCONTENIDO = REFCONTENT
                 AND ID = LINKACTUAL.IDPARRAFO;
            
            END IF;
          
          END IF;
        END IF;
      END LOOP;
      CLOSE LINKS;
    EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        /*INSERT INTO spcuser.LOG_ERROR
          (TIPO, DESCRIPCION, IDCONTENIDO)
        VALUES
          ('CONTENIDO',
           'Error de consistencia de contenido: ' || REFCONTENT || ' ',
           REFCONTENT);*/
        COMMIT;
    END;
    COMMIT;
  END LOOP;
  CLOSE CONTENIDOS;
  DBMS_OUTPUT.PUT_LINE('Proceso Finalizado.');
EXCEPTION
  WHEN OTHERS THEN
    V_CODE    := SQLCODE;
    V_MESSAGE := SUBSTR(SQLERRM, 1, 255);
    /*INSERT INTO LOG_ERROR
      (TIPO, DESCRIPCION)
    VALUES
      ('GENERAL',
       'No se procesaron todos los registros. Ultimo contenido en procesar: ' ||
       REFCONTENT || ' Error- ' || V_CODE || ' - ' || V_MESSAGE);*/
    COMMIT;
END;
