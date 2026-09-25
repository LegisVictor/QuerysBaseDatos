--**********************************************************************************
--** CASO: VERIFICAR SESION USUARIO 
--**********************************************************************************

SELECT * FROM sesion WHERE CODUSUARIO =886 AND IDENTIFICADOR  ='fredygp' AND maquina = 'FRIGG'

SELECT * FROM usuario WHERE upper(nomusuario) LIKE upper('%nata%') OR id_usuario = 9626; 
SELECT * FROM tarea WHERE CODUSUARIO  = 9627


-- UPDATE   usuario SET FLAGBORRADO  = 1, FLAGACTIVO =0 WHERE id_usuario in (764); 
-- UPDATE TAREA SET CODUSUARIO = 9585 WHERE ID_TAREA IN (4093410); -- VACACIONES , O SE FUE DE LEGIS.

--- PARA DEPURAR CON USUARIO ESPECIFICO. 
SELECT * FROM sesion 
WHERE 
--  IDENTIFICADOR  ='23d44818ed1e49d5b2995d0cf393d062' AND 
CODUSUARIO=9385 
AND maquina = 'FRIGG';

--fredygp
UPDATE sesion SET CODUSUARIO=9126  WHERE IDENTIFICADOR  ='Shelesthem' AND maquina = 'FRIGG'; 


UPDATE sesion SET maquina = 'DEA' WHERE IDENTIFICADOR  ='b4747cd6d52f42c889c92afae75e62c7'; 


SELECT *
FROM ROLUSUARIO R
WHERE codusuario = 2769 AND CODROL IN (743)

-------------- ROLES 

SELECT *
FROM ROLUSUARIO R
WHERE codusuario = 9505 --  diego
  AND R.codrol NOT IN (
        SELECT codrol 
        FROM ROLUSUARIO 
        WHERE codusuario = 8863
    )
ORDER BY R.codrol; 


SELECT MAX(CODROL) as CODROL,CODUSUARIO FROM ROLUSUARIO 
                     JOIN USUARIO U ON (U.ID_USUARIO= CODUSUARIO) 
                     WHERE CODROL IN ({0}) AND U.FLAGACTIVO=1 AND U.FLAGBORRADO=0
                     GROUP BY CODUSUARIO ORDER BY CODUSUARIO








SELECT * 
FROM USUARIO U  
INNER JOIN ROLUSUARIO  RU ON (U.ID_USUARIO= RU.CODUSUARIO) 
INNER JOIN ROL R ON R.ID_ROL = RU.CODROL 
WHERE U.FLAGACTIVO=1 AND U.FLAGBORRADO=0
ORDER BY CODUSUARIO
        
                     
                     
                     
                   
--PLANTILLAS 

--\\optimus\Plantillas











/*

INSERT INTO ROLUSUARIO (codusuario, codrol)
SELECT DISTINCT 9385 AS codusuario, R.codrol
FROM ROLUSUARIO R
WHERE R.codusuario = 871
  AND R.codrol NOT IN (
        SELECT codrol 
        FROM ROLUSUARIO 
        WHERE codusuario = 9385
    );
*/





SELECT * FROM SESION s  u  

--4  dayanah
