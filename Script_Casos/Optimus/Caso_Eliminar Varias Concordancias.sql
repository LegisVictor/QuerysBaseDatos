DECLARE
    CURSOR cur_concordancia IS 
        SELECT cc.IDGRUPOCONCORDANCIA, cg.IDparrafo 
        FROM contenidoconcordancia cc 
        INNER JOIN contenidogrupoconcordancia cg 
            ON cc.IDGRUPOCONCORDANCIA = cg.ID 
        WHERE cc.IDCONTENIDOCODIGOINTERNO = '83e12470df1b49d991e791bee7fb1262' 
          AND cg.IDCONTENIDO = 'doctri'
		  AND IDGRUPOCONCORDANCIA IN (
1107054,
1106727,
1131052,
1108574,
1131515,
1109859,
1103969,
1104820,
1131047,
1104805,
1131831,
1102938,
1106908,
1102937,
1102951,
1104812,
1102017,
1131061,
1102940,
1104807); 

    v_IDGRUPOCONCORDANCIA contenidoconcordancia.IDGRUPOCONCORDANCIA%TYPE;
    v_IDPARRAFO contenidogrupoconcordancia.IDparrafo%TYPE;
BEGIN
    OPEN cur_concordancia;
    LOOP
        FETCH cur_concordancia INTO v_IDGRUPOCONCORDANCIA, v_IDPARRAFO;
        EXIT WHEN cur_concordancia%NOTFOUND;
        
        -- Realiza el UPDATE en CONTENIDOPARRAFO
        UPDATE CONTENIDOPARRAFO
        SET XML = REPLACE(XML,
                         '<Concordancias id="' || v_IDGRUPOCONCORDANCIA || '" class="nostyle"></Concordancias>',
                         '')
        WHERE ID = v_IDPARRAFO;

        -- Elimina de CONTENIDOGRUPOCONCORDANCIA
        DELETE FROM CONTENIDOGRUPOCONCORDANCIA WHERE ID = v_IDGRUPOCONCORDANCIA;

        -- Elimina de CONTENIDOCONCORDANCIA
        DELETE FROM CONTENIDOCONCORDANCIA WHERE IDGRUPOCONCORDANCIA = v_IDGRUPOCONCORDANCIA;
        
        COMMIT; -- Confirmar cambios en cada iteración
    END LOOP;
    CLOSE cur_concordancia;
END;