-- BUSCAR EL PARRAFO. 
SELECT id, IDANTERIOR , IDSIGUIENTE , IDCONTENIDO, ordinal, XML  
FROM CONTENIDOPARRAFO c 
WHERE c.IDCONTENIDO  = 'carsegso' AND ID IN ('xcarsegso.7df4abeda07140f4a4cb6e0ddb44cfcc', 'xcarsegso.8bd5b7ef4d6f4128bc6e592a46504e73')
ORDER BY ordinal desc 

-- VERIFICAR QUE EL ID DEL MEDIO EXISTA. 
-- <?xm-insertion_mark_start author="Jullyr" time="20251119T154653-0500"?><Imagen href="4e483b45caea44d2abe453fcf88bdd94.jpg" alt="Gráfica conformación sistema de seguridad social" width="918" height="635" id="191943"/><?xm-insertion_mark_end ?>



-- verificar que el medio exista. 
SELECT * FROM MEDIO m WHERE  -- ID_MEDIO =201610
GUID_MEDIO LIKE '%18fe10f7b70447db84832ae99633e506%'

-- Si el id no existe en contenidoparrafo lo colocarmos. 
UPDATE CONTENIDOPARRAFO SET xml = REPLACE(xml, 'id="201610"', 'id="189721"' )
WHERE id IN ('xcarsegso.7df4abeda07140f4a4cb6e0ddb44cfcc', 'xcarsegso.8bd5b7ef4d6f4128bc6e592a46504e73'); 

-- BUSCAMOS EL VALOR EN CONTENIDOPARRAFOMEDIO
 
 SELECT * FROM CONTENIDOPARRAFOMEDIO c WHERE ID_CONTENIDOPARRAFO  IN ('xcarsegso.fc632357f801486fb2066bf4492fa1b5', 'xcarsegso.8be7c2cdc8d74f8a8ae1c518296dba2f')

-- SINO EXISTE TOCA HACER EL INSERT. 

 
INSERT INTO CONTENIDOPARRAFOMEDIO ( ID_CONTENIDOPARRAFO , ID_MEDIO)
VALUES ('xcarsegso.3820d3376e41415d919a5afa388e0755', 191943);
 
 

