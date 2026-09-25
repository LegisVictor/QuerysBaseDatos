ALTER SESSION SET CURRENT_SCHEMA = "SPCUSER";


SELECT XML FROM contenidoparrafo WHERE ID = 'xestatuto.f3718db475e34cc4b33f9e3ed6dfdd1c'
SELECT * FROM contenidogrupoconcordancia WHERE IDparrafo='xestatuto.f3718db475e34cc4b33f9e3ed6dfdd1c'
SELECT * FROM contenidoconcordancia WHERE idgrupoconcordancia = 431322


UPDATE CONTENIDOPARRAFO
   SET XML = REPLACE(XML,
                     '<Concordancias id="359147" class="nostyle"></Concordancias>',
                     '')
 WHERE ID = 'xestatuto.f3718db475e34cc4b33f9e3ed6dfdd1c';
DELETE FROM CONTENIDOGRUPOCONCORDANCIA WHERE ID = '359147';
DELETE FROM CONTENIDOCONCORDANCIA WHERE IDGRUPOCONCORDANCIA = '359147';

SELECT * FROM contenidoconcordancia cc 
INNER JOIN contenidogrupoconcordancia cg ON 
cc.IDGRUPOCONCORDANCIA =cg.ID 
WHERE  cc.IDCONTENIDOCODIGOINTERNO ='83e12470df1b49d991e791bee7fb1262' AND cg.IDCONTENIDO ='doctri'



-- Primero es consultar todos los IDGRUPOCONCORDANCIA relacionados a un contenido especifico de un IDCONTENIDOCODIGOINTERNO
SELECT cc.IDGRUPOCONCORDANCIA, cg.IDparrafo FROM contenidoconcordancia cc 
INNER JOIN contenidogrupoconcordancia cg ON 
cc.IDGRUPOCONCORDANCIA =cg.ID 
WHERE  cc.IDCONTENIDOCODIGOINTERNO ='83e12470df1b49d991e791bee7fb1262' AND cg.IDCONTENIDO ='doctri'

-- luego con ellos hacer un replace 
UPDATE CONTENIDOPARRAFO
   SET XML = REPLACE(XML,
                     '<Concordancias id="359147" class="nostyle"></Concordancias>',  -- aca en id el IDGRUPOCONCORDANCIA
                     '')
 WHERE ID = 'xestatuto.f3718db475e34cc4b33f9e3ed6dfdd1c'; -- aca iria IDparrafo
 
-- y luego hacer estos dos delte 

DELETE FROM CONTENIDOGRUPOCONCORDANCIA WHERE ID = '359147';
DELETE FROM CONTENIDOCONCORDANCIA WHERE IDGRUPOCONCORDANCIA = '359147';

