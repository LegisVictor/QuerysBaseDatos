DECLARE
  CURSOR CONTENIDOS IS
    SELECT IDCONTENIDO
      FROM CONTENIDO
     WHERE FLAGCODIGOSINTERNOS = 1
       AND IDCONTENIDO = 'REFORMALABORAL'
     ORDER BY IDCONTENIDO DESC;
  REFCONTENT VARCHAR2(128);
  V_CODE     NUMBER;
  V_MESSAGE  VARCHAR2(255);
BEGIN
  DBMS_OUTPUT.PUT_LINE('Procesando.');
  OPEN CONTENIDOS;
  LOOP
    FETCH CONTENIDOS
      INTO REFCONTENT;
    EXIT WHEN CONTENIDOS%NOTFOUND;
  
    ---------------- INICIO BLOQUE DE OPERACIÓN ----------------
  
    DECLARE
      CURSOR CINTERNOS IS
        SELECT CCI.ID,
               CCI.VALOR0,
               CCI.VALOR1,
               CCI.VALOR2,
               CCI.FLAGRANGORESERVADO,
               CP.ID PARRAFO
          FROM CONTENIDOCODIGOINTERNO CCI
          LEFT JOIN CONTENIDOPARRAFO CP
            ON CCI.IDPARRAFO = CP.ID
         WHERE CCI.IDCONTENIDO = REFCONTENT
         ORDER BY CP.ORDINAL, CCI.VALOR0, CCI.VALOR1, CCI.VALOR2;
      CINTERNOACTUAL CINTERNOS%ROWTYPE;
      COUNTER        NUMBER := 0;
      COUNTERV1      NUMBER := 0;
      COUNTERV2      NUMBER := 0;
    BEGIN
      OPEN CINTERNOS;
      LOOP
        FETCH CINTERNOS
          INTO CINTERNOACTUAL;
        EXIT WHEN CINTERNOS%NOTFOUND;
      
        IF CINTERNOACTUAL.FLAGRANGORESERVADO = 1 THEN
        
          IF CINTERNOACTUAL.VALOR0 != (COUNTER + 1) THEN
            DBMS_OUTPUT.PUT_LINE('Obra: ' || REFCONTENT || ' Parrafo: ' ||
                                 CINTERNOACTUAL.PARRAFO || ' ID-CCI: ' ||
                                 CINTERNOACTUAL.ID || ' : (R)' ||
                                 CINTERNOACTUAL.VALOR0 || '-' ||
                                 CINTERNOACTUAL.VALOR1 || ' DeberiaSer: ' ||
                                 (COUNTER + 1) || '-' ||
                                 CINTERNOACTUAL.VALOR1);
            COUNTER := CINTERNOACTUAL.VALOR1;
          ELSIF CINTERNOACTUAL.VALOR1 = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Obra: ' || REFCONTENT || ' Parrafo: ' ||
                                 CINTERNOACTUAL.PARRAFO || ' ID-CCI: ' ||
                                 CINTERNOACTUAL.ID || ' : (R)' ||
                                 CINTERNOACTUAL.VALOR0 || '-' ||
                                 CINTERNOACTUAL.VALOR1 || ' DeberiaSer: ' ||
                                 CINTERNOACTUAL.VALOR0 || '-' ||
                                 CINTERNOACTUAL.VALOR0);
            COUNTER := CINTERNOACTUAL.VALOR0;
          ELSE
            COUNTER := CINTERNOACTUAL.VALOR1;
          END IF;
        
        ELSE
          IF CINTERNOACTUAL.VALOR1 = 0 THEN
            COUNTER   := COUNTER + 1;
            COUNTERV1 := 0;
            COUNTERV2 := 0;
          ELSE
            IF CINTERNOACTUAL.VALOR2 = 0 THEN
              COUNTERV1 := COUNTERV1 + 1;
              COUNTERV2 := 0;
            ELSIF COUNTERV2 = 0 THEN
              COUNTERV2 := 65;
            ELSE
              COUNTERV2 := COUNTERV2 + 1;
            END IF;
          END IF;
        
          IF CINTERNOACTUAL.VALOR0 != COUNTER OR
             CINTERNOACTUAL.VALOR1 != COUNTERV1 OR
             CINTERNOACTUAL.VALOR2 != COUNTERV2 THEN
            DBMS_OUTPUT.PUT_LINE('Obra: ' || REFCONTENT || ' Parrafo: ' ||
                                 CINTERNOACTUAL.PARRAFO || ' ID-CCI: ' ||
                                 CINTERNOACTUAL.ID || ' : ' ||
                                 NVL(FNORESOLVERCI(CINTERNOACTUAL.VALOR0,
                                                   CINTERNOACTUAL.VALOR1,
                                                   CINTERNOACTUAL.VALOR2),
                                     'VERIFICAR') || ' DeberiaSer: ' ||
                                 NVL(FNORESOLVERCI(COUNTER,
                                                   COUNTERV1,
                                                   COUNTERV2),
                                     'VERIFICAR'));
          END IF;
        END IF;
      
      END LOOP;
      CLOSE CINTERNOS;
    END;
  
    ---------------- FIN BLOQUE DE OPERACIÓN ----------------
  END LOOP;
  CLOSE CONTENIDOS;
  DBMS_OUTPUT.PUT_LINE('Proceso Finalizado.');
END;
