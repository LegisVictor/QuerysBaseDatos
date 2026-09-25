--ALTER SESSION SET CURRENT_SCHEMA = "SPCUSER";
DECLARE
	CURSOR CONTENIDOS IS
		SELECT IDCONTENIDO
			FROM CONTENIDO
		 WHERE IDCONTENIDO = 'eppenal2009'
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
			CURSOR IMAGES IS
				SELECT *
					FROM (SELECT X.*, P.IDPARRAFO, P.XML
									 FROM (SELECT ID IDPARRAFO, XML
														FROM CONTENIDOPARRAFO
													 WHERE IDCONTENIDO = REFCONTENT
																--AND ID = 'xlegfinan.5d7fc5876c694632a4d6d760b087ac4b'
																 AND XML LIKE '%<Imagen%') P, (XMLTABLE('/root//Imagen'
																	 PASSING
																	 XMLTYPE('<root>' ||
																					 REPLACE(P.XML, '&', '') ||
																					 '</root>')
																	 COLUMNS
																	 ID_IMG
																	 NUMBER PATH
																	 '@id', HREF
																		VARCHAR2(1000) PATH
																		'@href', ALT
																		VARCHAR2(1000) PATH
																		'@alt', WIDTH
																		NUMBER PATH
																		'@width', HEIGHT
																		NUMBER PATH
																		'@height')) X)
				 WHERE ID_IMG IS NULL;
			ACTUALIMAGE IMAGES%ROWTYPE;
			COUNTER     NUMBER;
			CP_IMAGE    NUMBER;
			NEW_IMAGE   NUMBER;
			GUID_IMG    VARCHAR2(500);
			NODE_IMG    VARCHAR2(1000);
			EXT_IMG     VARCHAR2(4);
			TMP         VARCHAR2(4000);
		BEGIN
			OPEN IMAGES;
			LOOP
				FETCH IMAGES
					INTO ACTUALIMAGE;
				EXIT WHEN IMAGES%NOTFOUND;
			
				TMP := '';
				-- Si tiene HREF ...
				IF ACTUALIMAGE.HREF IS NOT NULL THEN
				
					-- Se extrae el GUID de la imagen para verificarlo en contenido parrafo medio
					SELECT REGEXP_REPLACE(ACTUALIMAGE.HREF, '.*?Medios\/(\S+)\.\S+', '\1')
						INTO GUID_IMG
						FROM DUAL;
				
					-- Se extrae el XML del nodo donde se encuentra la imagen
					SELECT REGEXP_SUBSTR(XML, '<Imagen[^>]+href="[^"]+' || GUID_IMG ||
																 '[^>]+\/>')
						INTO NODE_IMG
						FROM CONTENIDOPARRAFO
					 WHERE ID = ACTUALIMAGE.IDPARRAFO;
				
					-- Se verifica si existe registro en base de datos del medio en el párrafo
					BEGIN
						SELECT ID_CONTENIDOMEDIO
							INTO CP_IMAGE
							FROM CONTENIDOPARRAFOMEDIO CPM
						 INNER JOIN MEDIO M
								ON CPM.ID_MEDIO = M.ID_MEDIO
						 WHERE CPM.ID_CONTENIDOPARRAFO = ACTUALIMAGE.IDPARRAFO AND
									 GUID_MEDIO = GUID_IMG;
					EXCEPTION
						WHEN NO_DATA_FOUND THEN
							CP_IMAGE := 0;
					END;
				
					-- Si registro del párrafo no existe en base de datos
					IF CP_IMAGE = 0 THEN
					
						-- Se extrae la extensión de la imagen
						SELECT REGEXP_SUBSTR(ACTUALIMAGE.HREF, '\..*?$')
							INTO EXT_IMG
							FROM DUAL;
					
						BEGIN
							SELECT ID_MEDIO
								INTO NEW_IMAGE
								FROM MEDIO
							 WHERE GUID_MEDIO = GUID_IMG AND EXT_MEDIO = EXT_IMG;
						EXCEPTION
							WHEN NO_DATA_FOUND THEN
								NEW_IMAGE := 0;
						END;
					
						-- Si registro del medio no existe en base de datos ...
						IF NEW_IMAGE = 0 THEN
						
							SELECT MEDIO_SQ.CURRVAL INTO NEW_IMAGE FROM DUAL;
						
							INSERT INTO MEDIO
								(ID_MEDIO, GUID_MEDIO, EXT_MEDIO, NOMBRE_MEDIO, DESCRIPCION_MEDIO)
							VALUES
								(NEW_IMAGE, GUID_IMG, EXT_IMG, ACTUALIMAGE.ALT, ACTUALIMAGE.ALT);
						
							SELECT CONTENIDOMEDIO_SQ.NEXTVAL INTO CP_IMAGE FROM DUAL;
						
							INSERT INTO CONTENIDOPARRAFOMEDIO
								(ID_CONTENIDOMEDIO, ID_CONTENIDOPARRAFO, ID_MEDIO)
							VALUES
								(CP_IMAGE, ACTUALIMAGE.IDPARRAFO, NEW_IMAGE);
						
							SELECT REPLACE(XML, NODE_IMG, REPLACE(NODE_IMG, 'id=""', 'id="' ||
																				CP_IMAGE || '"'))
								INTO TMP
								FROM CONTENIDOPARRAFO
							 WHERE ID = ACTUALIMAGE.IDPARRAFO;
						
							UPDATE CONTENIDOPARRAFO
								 SET XML = REPLACE(XML, NODE_IMG, REPLACE(NODE_IMG, 'id=""', 'id="' ||
																							CP_IMAGE || '"'))
							 WHERE ID = ACTUALIMAGE.IDPARRAFO;
						
							DBMS_OUTPUT.PUT_LINE('NO_EXISTS ' || ACTUALIMAGE.IDPARRAFO ||
																	 ' -guid ' || GUID_IMG || ' -xml |' || TMP);
						ELSE
						
							SELECT CONTENIDOMEDIO_SQ.NEXTVAL INTO CP_IMAGE FROM DUAL;
						
							INSERT INTO CONTENIDOPARRAFOMEDIO
								(ID_CONTENIDOMEDIO, ID_CONTENIDOPARRAFO, ID_MEDIO)
							VALUES
								(CP_IMAGE, ACTUALIMAGE.IDPARRAFO, NEW_IMAGE);
						
							SELECT REPLACE(XML, NODE_IMG, REPLACE(NODE_IMG, 'id=""', 'id="' ||
																				CP_IMAGE || '"'))
								INTO TMP
								FROM CONTENIDOPARRAFO
							 WHERE ID = ACTUALIMAGE.IDPARRAFO;
						
							UPDATE CONTENIDOPARRAFO
								 SET XML = REPLACE(XML, NODE_IMG, REPLACE(NODE_IMG, 'id=""', 'id="' ||
																							CP_IMAGE || '"'))
							 WHERE ID = ACTUALIMAGE.IDPARRAFO;
						
							DBMS_OUTPUT.PUT_LINE('MEDIA_EXISTS ' ||
																	 ACTUALIMAGE.IDPARRAFO || ' -guid ' ||
																	 GUID_IMG || ' -xml |' || TMP);
						
						END IF;
						-- Si registro del párrafo existe en base de datos ... 
					ELSE
					
						SELECT REPLACE(XML, NODE_IMG, REPLACE(NODE_IMG, 'id=""', 'id="' ||
																			CP_IMAGE || '"'))
							INTO TMP
							FROM CONTENIDOPARRAFO
						 WHERE ID = ACTUALIMAGE.IDPARRAFO;
					
						UPDATE CONTENIDOPARRAFO
							 SET XML = REPLACE(XML, NODE_IMG, REPLACE(NODE_IMG, 'id=""', 'id="' ||
																						CP_IMAGE || '"'))
						 WHERE ID = ACTUALIMAGE.IDPARRAFO;
					
						DBMS_OUTPUT.PUT_LINE('ALREADY_EXISTS ' ||
																 ACTUALIMAGE.IDPARRAFO || ' -guid ' ||
																 GUID_IMG || ' -xml |' || TMP);
					END IF;
				
					-- Si no tiene HREF la imagen no sirve...
				ELSE
					DBMS_OUTPUT.PUT_LINE('NO_HREF ' || ACTUALIMAGE.IDPARRAFO);
				END IF;
			
			END LOOP;
			CLOSE IMAGES;
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE('Error de consistencia de contenido: ' ||
														 REFCONTENT);
		END;
		--COMMIT;
	END LOOP;
	CLOSE CONTENIDOS;
	DBMS_OUTPUT.PUT_LINE('Proceso Finalizado.');
EXCEPTION
	WHEN OTHERS THEN
		V_CODE    := SQLCODE;
		V_MESSAGE := SUBSTR(SQLERRM, 1, 255);
		DBMS_OUTPUT.PUT_LINE('No se procesaron todos los registros. Ultimo contenido en procesar: ' ||
												 REFCONTENT || ' Error- ' || V_CODE || ' - ' ||
												 V_MESSAGE);
END;
