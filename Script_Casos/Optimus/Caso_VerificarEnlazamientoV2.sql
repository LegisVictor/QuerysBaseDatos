--*********************************************************************************************
--*** Verifica los enlazamientos de una obra, encontrando los enlaces mal formados o repetidos. 
--*********************************************************************************************
DECLARE
  REFCONTENT VARCHAR2(250) := 'ventas';
  COUNTER    NUMBER;
  TEMP       VARCHAR2(130);
  COUNTERROR NUMBER := 0;
 
  ORDINAL    NUMBER;
  ORDINAL_SIGUIENTE   NUMBER;
  ID_PARRAFO VARCHAR2(500);
  ID_PARRAFO_ACTUAL VARCHAR2(500);
  LAST_DIGIT NUMBER;
BEGIN
	
------------------------------------------------------------------------------------	
---  Identificar el nombre de la obra
------------------------------------------------------------------------------------	
	
  SELECT NOMCONTENIDO
    INTO TEMP
    FROM CONTENIDO
   WHERE IDCONTENIDO = REFCONTENT;

  DBMS_OUTPUT.PUT_LINE('Se verificara la integridad de: ' || TEMP || ' (' ||
                       REFCONTENT || ')');
  DBMS_OUTPUT.PUT_LINE('');
 
------------------------------------------------------------------------------------	
-- Verificar existencia de parrafos enlazados. Parrafos Siguientes. 
------------------------------------------------------------------------------------	

  SELECT COUNT(1)
    INTO COUNTER
    FROM CONTENIDOPARRAFO CP
   WHERE CP.IDCONTENIDO = REFCONTENT
     AND CP.ESTILO <> 'doc-boundary'
     AND IDSIGUIENTE NOT IN
         (SELECT ID
            FROM CONTENIDOPARRAFO CP
           WHERE CP.IDCONTENIDO = REFCONTENT);
  IF COUNTER > 0 THEN
    DBMS_OUTPUT.PUT_LINE('  Error de enlazamiento "IDSIGUIENTE" a parrafos inexistentes...');
    FOR ITEM IN (SELECT CP.ID, CP.IDSIGUIENTE
                   FROM CONTENIDOPARRAFO CP
                  WHERE CP.IDCONTENIDO = REFCONTENT
                    AND CP.ESTILO <> 'doc-boundary'
                    AND IDSIGUIENTE NOT IN
                        (SELECT ID
                           FROM CONTENIDOPARRAFO CP
                          WHERE CP.IDCONTENIDO = REFCONTENT)) LOOP
      DBMS_OUTPUT.PUT_LINE('      ID parrafo enlazado: ' || ITEM.ID ||
                           '  /  Parrafo inexistente: ' ||
                           ITEM.IDSIGUIENTE);
      COUNTERROR := COUNTERROR + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
  END IF;

------------------------------------------------------------------------------------	
-- Verificar existencia de parrafos enlazados. Parrafos Anteriores. 
------------------------------------------------------------------------------------
 
  SELECT COUNT(1)
    INTO COUNTER
    FROM CONTENIDOPARRAFO CP
   WHERE CP.IDCONTENIDO = REFCONTENT
     AND CP.ESTILO <> 'doc-boundary'
     AND IDANTERIOR NOT IN
         (SELECT ID
            FROM CONTENIDOPARRAFO CP
           WHERE CP.IDCONTENIDO = REFCONTENT);
  IF COUNTER > 0 THEN
    DBMS_OUTPUT.PUT_LINE('  Error de enlazamiento "IDANTERIOR" a parrafos inexistentes...');
    FOR ITEM IN (SELECT CP.ID, CP.IDANTERIOR
                   FROM CONTENIDOPARRAFO CP
                  WHERE CP.IDCONTENIDO = REFCONTENT
                    AND CP.ESTILO <> 'doc-boundary'
                    AND IDANTERIOR NOT IN
                        (SELECT ID
                           FROM CONTENIDOPARRAFO CP
                          WHERE CP.IDCONTENIDO = REFCONTENT)) LOOP
      DBMS_OUTPUT.PUT_LINE('      ID parrafo enlazado: ' || ITEM.ID ||
                           '  /  Parrafo inexistente: ' || ITEM.IDANTERIOR);
      COUNTERROR := COUNTERROR + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
  END IF;

------------------------------------------------------------------------------------	
-- Verificar existencia de parrafos siguiente duplicados
------------------------------------------------------------------------------------
 
  SELECT COUNT(1)
    INTO COUNTER
    FROM (SELECT IDSIGUIENTE
            FROM CONTENIDOPARRAFO
           WHERE IDCONTENIDO = REFCONTENT
           GROUP BY IDSIGUIENTE
          HAVING COUNT(1) > 1);

  IF COUNTER > 0 THEN
    DBMS_OUTPUT.PUT_LINE('  Error de enlazamiento "IDSIGUIENTE" duplicado...');
    FOR ITEM IN (SELECT IDSIGUIENTE
                   FROM CONTENIDOPARRAFO
                  WHERE IDCONTENIDO = REFCONTENT
                  GROUP BY IDSIGUIENTE
                 HAVING COUNT(1) > 1) LOOP
      FOR SUBITEM IN (SELECT ID
                        FROM CONTENIDOPARRAFO
                       WHERE IDCONTENIDO = REFCONTENT
                         AND IDSIGUIENTE = ITEM.IDSIGUIENTE) LOOP
        DBMS_OUTPUT.PUT_LINE('      ID parrafo erroneo: ' || SUBITEM.ID ||
                             '  /  IdSiguiente: ' || ITEM.IDSIGUIENTE);
      END LOOP;
      COUNTERROR := COUNTERROR + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
  END IF;

------------------------------------------------------------------------------------	
-- Verificar existencia de parrafos anterior duplicados
------------------------------------------------------------------------------------
 
  SELECT COUNT(1)
    INTO COUNTER
    FROM (SELECT IDANTERIOR
            FROM CONTENIDOPARRAFO
           WHERE IDCONTENIDO = REFCONTENT
           GROUP BY IDANTERIOR
          HAVING COUNT(1) > 1);

  IF COUNTER > 0 THEN
    DBMS_OUTPUT.PUT_LINE('  Error de enlazamiento "IDANTERIOR" duplicado...');
    FOR ITEM IN (SELECT IDANTERIOR
                   FROM CONTENIDOPARRAFO
                  WHERE IDCONTENIDO = REFCONTENT
                  GROUP BY IDANTERIOR
                 HAVING COUNT(1) > 1) LOOP
      FOR SUBITEM IN (SELECT ID
                        FROM CONTENIDOPARRAFO
                       WHERE IDCONTENIDO = REFCONTENT
                         AND IDANTERIOR = ITEM.IDANTERIOR) LOOP
        DBMS_OUTPUT.PUT_LINE('      ID parrafo erroneo: ' || SUBITEM.ID ||
                             '  /  IdAnterior: ' || ITEM.IDANTERIOR);
      END LOOP;
      COUNTERROR := COUNTERROR + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
  END IF;

------------------------------------------------------------------------------------	
-- Verificar existencia de ordinales duplicados
------------------------------------------------------------------------------------

 SELECT COUNT(1)
    INTO COUNTER
    FROM (SELECT ORDINAL
            FROM CONTENIDOPARRAFO
           WHERE IDCONTENIDO = REFCONTENT
           GROUP BY ORDINAL
          HAVING COUNT(1) > 1);

  IF COUNTER > 0 THEN
    DBMS_OUTPUT.PUT_LINE('  Error por ordinales duplicados...');
    FOR ITEM IN (SELECT ORDINAL
                   FROM CONTENIDOPARRAFO
                  WHERE IDCONTENIDO = REFCONTENT
                  GROUP BY ORDINAL
                 HAVING COUNT(1) > 1) LOOP
      FOR SUBITEM IN (SELECT ID
                        FROM CONTENIDOPARRAFO
                       WHERE IDCONTENIDO = REFCONTENT
                         AND ORDINAL = ITEM.ORDINAL) LOOP
        DBMS_OUTPUT.PUT_LINE('      ID parrafo erroneo: ' || SUBITEM.ID ||
                             '  /  Ordinal: ' || ITEM.ORDINAL);
      END LOOP;
      COUNTERROR := COUNTERROR + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('');
  END IF;
 
------------------------------------------------------------------------------------	
-- Verificar orden de ordinales
------------------------------------------------------------------------------------
SELECT COUNT(1) 
  INTO COUNTER 
  FROM CONTENIDOPARRAFO 
  WHERE IDCONTENIDO = REFCONTENT AND IDANTERIOR='NULL';
 

IF COUNTER > 0 THEN
     SELECT "ID" INTO ID_PARRAFO FROM CONTENIDOPARRAFO WHERE IDCONTENIDO = REFCONTENT AND IDANTERIOR='NULL';
	      BEGIN
		      LOOP
		      
			    EXIT WHEN ID_PARRAFO = 'NULL';
		        SELECT "ORDINAL" INTO ORDINAL FROM CONTENIDOPARRAFO WHERE IDCONTENIDO = REFCONTENT AND "ID" = ID_PARRAFO;
		        ID_PARRAFO_ACTUAL:= ID_PARRAFO; 
		        ID_PARRAFO := fnObtenerParrafoSiguiente(REFCONTENT, ID_PARRAFO);
		        EXIT WHEN ID_PARRAFO = 'NULL';
				SELECT "ORDINAL" INTO ORDINAL_SIGUIENTE FROM CONTENIDOPARRAFO WHERE IDCONTENIDO = REFCONTENT AND "ID" = ID_PARRAFO;
		     	
			    IF ORDINAL > ORDINAL_SIGUIENTE THEN
			        COUNTERROR := COUNTERROR + 1;
		        	DBMS_OUTPUT.PUT_LINE('      Error Orden Ordinal -> ID parrafo erroneo: ' || ID_PARRAFO_ACTUAL || ' /  Ordinal: ' || ORDINAL ); 
		            DBMS_OUTPUT.PUT_LINE('                             ID parrafo siguiente: ' || ID_PARRAFO || ' / Ordinal Siguiente: ' || ORDINAL_SIGUIENTE );
				END IF; 
 		
		/*
			   LAST_DIGIT := TO_NUMBER(SUBSTR(TO_CHAR(ORDINAL), -1, 1));
			      	DBMS_OUTPUT.PUT_LINE('      Error Orden Ordinal -> ID parrafo erroneo: ' || SUBSTR(TO_CHAR(ORDINAL), -1, 1) || ' /  Ordinal: ' || ORDINAL ); 
		    
			  
			  
		       IF LAST_DIGIT > 0 THEN
			        COUNTERROR := COUNTERROR + 1;
		        	DBMS_OUTPUT.PUT_LINE('      Error Orden Ordinal -> ID parrafo erroneo: ' || ID_PARRAFO_ACTUAL || ' /  Ordinal: ' || ORDINAL ); 
		       END IF; 
		    
			
			----  DBMS_OUTPUT.PUT_LINE('Diferencia anormal de ordinales (menor a 100):' ||    TO_CHAR(ABS(ORDINAL_SIGUIENTE - ORDINAL))  || ORDINAL_SIGUIENTE || ORDINAL);
			 
			/*	-- Comparar diferencia entre ordinales
				IF ABS(ORDINAL_SIGUIENTE - ORDINAL) > 100 THEN
				  COUNTERROR := COUNTERROR + 1;
				  DBMS_OUTPUT.PUT_LINE('Diferencia anormal de ordinales (mayor a 100):');
				  DBMS_OUTPUT.PUT_LINE('   ID actual:     ' || ID_PARRAFO_ACTUAL || ' | Ordinal: ' || ORDINAL);
				  DBMS_OUTPUT.PUT_LINE('   ID siguiente:  ' || ID_PARRAFO || ' | Ordinal: ' || ORDINAL_SIGUIENTE);
				END IF;	
			
				-- Comparar diferencia entre ordinales
				IF ABS(ORDINAL_SIGUIENTE - ORDINAL) < 100 THEN
				  COUNTERROR := COUNTERROR + 1;
				  DBMS_OUTPUT.PUT_LINE('Diferencia anormal de ordinales (menor a 100):');
				  DBMS_OUTPUT.PUT_LINE('   ID actual:     ' || ID_PARRAFO_ACTUAL || ' | Ordinal: ' || ORDINAL);
				  DBMS_OUTPUT.PUT_LINE('   ID siguiente:  ' || ID_PARRAFO || ' | Ordinal: ' || ORDINAL_SIGUIENTE);
				END IF;	
				*/
		      	END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error en la iteración: ' || SQLERRM);
           COUNTERROR := COUNTERROR + 1;
    END;
   DBMS_OUTPUT.PUT_LINE('');
END IF;

------------------------------------------------------------------------------------	
-- Verificar otras posibles inconsistencias
------------------------------------------------------------------------------------

  SELECT COUNT(1)
    INTO COUNTER
    FROM CONTENIDOPARRAFO
   WHERE IDCONTENIDO = REFCONTENT
     AND ESTILO <> 'doc-boundary'
     AND (ORDINAL = (SELECT MIN(ORDINAL)
                       FROM CONTENIDOPARRAFO
                      WHERE IDCONTENIDO = REFCONTENT) OR
         IDANTERIOR = 'NULL');

  IF COUNTER > 0 THEN
    DBMS_OUTPUT.PUT_LINE('  Inconsistencia en el parrafo INICIO');
    COUNTERROR := COUNTERROR + 1;
    DBMS_OUTPUT.PUT_LINE('');
  END IF;

  SELECT COUNT(1)
    INTO COUNTER
    FROM CONTENIDOPARRAFO
   WHERE IDCONTENIDO = REFCONTENT
     AND ESTILO <> 'doc-boundary'
     AND (ORDINAL = (SELECT MAX(ORDINAL)
                       FROM CONTENIDOPARRAFO
                      WHERE IDCONTENIDO = REFCONTENT) OR
         IDSIGUIENTE = 'NULL');

  IF COUNTER > 0 THEN
    DBMS_OUTPUT.PUT_LINE('  Inconsistencia en el parrafo FIN');
    COUNTERROR := COUNTERROR + 1;
    DBMS_OUTPUT.PUT_LINE('');
  END IF;

  DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------');

  IF COUNTERROR > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Proceso finalizado. Se encontraron ' ||
                         COUNTERROR || ' errores en el documento.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Proceso finalizado. No se encontraron errores en el documento.');
  END IF;
END;
