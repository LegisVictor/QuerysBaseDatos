--**********************************************************************************
--** CASO: VERIFICAR CANTIDAD DE DOCUMENTOS.  
--**********************************************************************************
-- verificar taxonomy es un archivo que esta en la obra en metis. 

SELECT XML FROM (
SELECT TRIM(REGEXP_REPLACE(C.XML, '<[^<>]*>', ' ')) XML FROM contenidoparrafoarbol ca
INNER JOIN CONTENIDOPARRAFO c ON c.ID = ca.ID
WHERE ca.IDCONTENIDO = 'copnia' AND
ca.IDSIGUIENTE != 'NULL'
)
WHERE REGEXP_LIKE(XML, '^[a-z]+.*[0-9]{4}', 'i');
 
 



SELECT count(*) AS cantidad, IDCONTENIDO FROM (
SELECT TRIM(REGEXP_REPLACE(C.XML, '<[^<>]*>', ' ')) XML, ca.IDCONTENIDO FROM contenidoparrafoarbol ca
INNER JOIN CONTENIDOPARRAFO c ON c.ID = ca.ID
WHERE --ca.IDCONTENIDO = 'copnia' AND
ca.IDSIGUIENTE != 'NULL' AND ca.flagborrado = 0
) t
--WHERE REGEXP_LIKE(t.XML, '^([a-z]+.*[0-9]{4})|(DIRECTRIZ\s[0-9]+)', 'i')
WHERE REGEXP_LIKE(XML, '^[a-z]+.*[0-9]{4}', 'i')
GROUP BY idcontenido;