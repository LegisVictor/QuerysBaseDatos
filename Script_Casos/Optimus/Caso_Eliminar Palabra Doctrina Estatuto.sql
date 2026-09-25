-- OPCION 1: 

DECLARE
	REFCONTENT VARCHAR2(128) := 'estatuto2025';
BEGIN
	DECLARE
		CURSOR PARRAFOS IS
			SELECT ID
				FROM CONTENIDOPARRAFO
			 WHERE IDCONTENIDO = REFCONTENT AND
						 REGEXP_LIKE(XML, '^\s*<Link[^>]+>\s*Doctrina\s*<\/Link>\s*$');
	BEGIN
		FOR ITEM IN PARRAFOS LOOP
			SPBORRARPARRAFO(REFCONTENT, ITEM.ID, 0, -1);
		END LOOP;
	END;
END;

-- OPCION 2: PREFERIBLEMENTE. 
SELECT * FROM enlaces where cod_contenido = 'estatuto2025' AND  cod_parrafo in (select ID from contenidoparrafo where REGEXP_LIKE(xml,'<link.*>doctrina</Link>','i') and idcontenido = 'estatuto2025');

delete FROM enlaces where cod_contenido = 'estatuto2025' AND  cod_parrafo in (select ID from contenidoparrafo where REGEXP_LIKE(xml,'<link.*>doctrina</Link>','i') and idcontenido = 'estatuto2025');

update contenidoparrafo set xml = '&nbsp;' where id in (select ID from contenidoparrafo where REGEXP_LIKE(xml,'<link.*>doctrina</Link>','i') and idcontenido = 'estatuto2025');
